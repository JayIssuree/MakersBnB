describe "logging out", type: :feature do
    
    it "does not show the button if no one is signed in" do
        visit('/')
        expect(page).to have_no_button("Log Out")
    end

    it "displays the button when someone is logged in" do
        visit('/users/new')
        fill_in("email", with: "mail@test.com")
        fill_in("username", with: "username123")
        fill_in("password", with: "password123")
        fill_in("password_confirmation", with: "password123")
        click_button("Create Account")
        expect(page.current_path).to eq('/homepage')
        expect(page).to have_button('Log Out')
    end

    it "logs out the user" do
        visit('/users/new')
        fill_in("email", with: "mail@test.com")
        fill_in("username", with: "username123")
        fill_in("password", with: "password123")
        fill_in("password_confirmation", with: "password123")
        click_button("Create Account")
        click_button("Log Out")
        expect(page.current_path).to eq('/homepage')
        expect(page).to have_no_content("Welcome, username123")
    end

end