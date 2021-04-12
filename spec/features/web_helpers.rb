today = Time.now.to_s[0, 10]
next_week = (Time.now + (60 * 60 * 24 * 7)).to_s[0, 10]
yesterday = (Time.now - (60 * 60 * 24)).to_s[0,10]

def log_in
    User.create(username: "username", email: "mail@mail.com", password: "password123")
    visit('/session/new')
    fill_in("email", with: "mail@mail.com")
    fill_in("password", with: "password123")
    click_button("Log In")
end

def create_account_and_listings
    user = User.create(username: "username", email: "mail@mail.com", password: "password123")
    user.listings.create(
        name: "example name 1",
        description: "description 1",
        ppn: 40,
        start_date: today,
        end_date: next_week
    )
    user.listings.create(
        name: "example name 2",
        description: "description 2",
        ppn: 25,
        start_date: today,
        end_date: next_week
    )
end