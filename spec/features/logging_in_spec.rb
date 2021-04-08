describe "logging in", type: :feature do
    
    it "displays the log in button when no one is logged in" do
        visit('/homepage')
        expect(page).to have_button("Log In")
    end

    it "does not display the button if someone is already logged in" do
        User.create(email: 'mail@mail.com', username: 'username123', password: 'password123')
        visit('/session/new')
        fill_in("email", with: 'mail@mail.com')
        fill_in("password", with: "password123")
        click_button("Log In")
        expect(page.current_path).to eq('/homepage')
        expect(page).to have_no_button("Log In")
    end

    it "has a button that leads to a log in form" do
        visit('/homepage')
        click_button("Log In")
        expect(page).to have_field("email")
        expect(page).to have_field("password")
        expect(page).to have_button("Log In")
    end

    it "logs in a user when the correct details are given" do
        User.create(email: 'mail@mail.com', username: 'username123', password: 'password123')
        visit('/session/new')
        fill_in("email", with: 'mail@mail.com')
        fill_in("password", with: "password123")
        click_button("Log In")
        expect(page.current_path).to eq('/homepage')
        expect(page).to have_content("Signed in as: username123")
    end

    it "displays an error message if incorrect email" do
        User.create(email: 'mail@mail.com', username: 'username123', password: 'password123')
        visit('/session/new')
        fill_in("email", with: 'mail@wrong.com')
        fill_in("password", with: "password123")
        click_button("Log In")
        expect(page).to have_content("Incorrect Email or Password")
    end

    it "displays an error message if incorrect password" do
        User.create(email: 'mail@mail.com', username: 'username123', password: 'password123')
        visit('/session/new')
        fill_in("email", with: 'mail@mail.com')
        fill_in("password", with: "wrong123")
        click_button("Log In")
        expect(page).to have_content("Incorrect Email or Password")
    end

end