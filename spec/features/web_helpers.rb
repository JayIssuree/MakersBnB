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

def log_in_2
    User.create(username: "username2", email: "mail2@mail2.com", password: "password123")
    visit('/session/new')
    fill_in("email", with: "mail2@mail2.com")
    fill_in("password", with: "password123")
    click_button("Log In")
end

def create_account_and_listings
    log_in
    click_button("Manage Listings")
    click_button("Add Listing")
    fill_in("name", with: "example name 1")
    fill_in("description", with: "description 1")
    fill_in("ppn", with: 40)
    fill_in("start_date", with: today)
    fill_in("end_date", with: next_week)
    click_button("Create Listing")
    click_button("Add Listing")
    fill_in("name", with: "example name 2")
    fill_in("description", with: "description 2")
    fill_in("ppn", with: 25)
    fill_in("start_date", with: today)
    fill_in("end_date", with: next_week)
    click_button("Create Listing")
end