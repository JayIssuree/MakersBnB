require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models/user'
require './models/listing'
require './lib/date_checker'

class MakersBnB < Sinatra::Base

    enable :sessions
    use Rack::MethodOverride
    register Sinatra::Flash

    get '/' do
        redirect '/homepage'
    end

    get '/homepage' do
        @user = User.find(session[:user_id]) if session[:user_id]
        @listings = Listing.all
        erb(:homepage)
    end

    get '/users/new' do
        erb(:'users/new')
    end

    post '/users' do
        user = User.new(
            email: params[:email], 
            username: params[:username], 
            password: params[:password],
            password_confirmation: params[:password_confirmation]
        )
        if user.save
            session[:user_id] = user.id
            redirect '/homepage'
        elsif (params[:email].empty? || params[:username].empty? || params[:password].empty? || params[:password_confirmation].empty?)
            flash[:notice] = "Please fill in all fields"
            redirect '/users/new'
        else
            flash[:notice] = params[:password] != params[:password_confirmation] ? "Passwords do not match" : "Username or Email already taken"
            redirect '/users/new'
        end
    end

    delete '/session' do
        session.clear
        redirect '/homepage'
    end

    get '/session/new' do
        erb(:'session/new')
    end

    post '/session' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/homepage'
        else
            flash[:notice] = "Incorrect Email or Password"
            redirect '/session/new'
        end
    end

    get '/listings' do
        @user_listings = User.find(session[:user_id]).listings
        erb(:'listings/user')
    end

    get '/listings/new' do
        erb(:'listings/new')
    end
    
    post '/listings' do
        if DateChecker.check(start_date: params[:start_date], end_date: params[:end_date])
            Listing.create(
                user_id: session[:user_id],
                name: params[:name],
                description: params[:description],
                ppn: params[:ppn],
                start_date: DateChecker.convert(params[:start_date]),
                end_date: DateChecker.convert(params[:end_date])
            )
            redirect '/listings'
        else
            flash[:notice] = "Please make sure the available dates are correct"
            redirect '/listings/new'
        end
    end

    run! if app_file == $0

end