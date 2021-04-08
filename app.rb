require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models/user'

class MakersBnB < Sinatra::Base

    enable :sessions
    register Sinatra::Flash

    get '/' do
        redirect '/homepage'
    end

    get '/homepage' do
        @user = User.find(session[:user_id]) if session[:user_id]
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
        else
            flash[:notice] = params[:password] != params[:password_confirmation] ? "Passwords do not match" : "Email or Username already taken"
            redirect '/users/new'
        end
    end
    
    run! if app_file == $0

end