describe "signing up", type: :feature do
    
    it "has a button that leads to the sign up page" do
        visit('/')
        expect(page).to have_button("Sign Up")
        click_button("Sign Up")
        expect(page.current_path).to eq("/users/new")
        expect(page).to have_field("email")
        expect(page).to have_field("username")
        expect(page).to have_field("password")
        expect(page).to have_field("password_confirmation")
        expect(page).to have_button("Create Account")
    end

    it "displays the username on successful sign up" do
        visit('/')
        expect(page).to have_button("Sign Up")
        click_button("Sign Up")
        fill_in("email", with: "mail@test.com")
        fill_in("username", with: "username123")
        fill_in("password", with: "password123")
        fill_in("password_confirmation", with: "password123")
        click_button("Create Account")
        expect(page.current_path).to eq('/homepage')
        expect(page).to have_content("Signed in as: username123")
    end

end