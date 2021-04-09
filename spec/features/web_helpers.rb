def log_in
    User.create(username: "username", email: "mail@mail.com", password: "password123")
    visit('/session/new')
    fill_in("email", with: "mail@mail.com")
    fill_in("password", with: "password123")
    click_button("Log In")
end