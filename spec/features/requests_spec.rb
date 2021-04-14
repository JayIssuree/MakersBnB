describe "requests", type: :feature do
    
    let(:today) { Time.now.to_s[0, 10] }
    let(:next_week) { (Time.now + (60 * 60 * 24 * 7)).to_s[0, 10] }
    let(:yesterday) { (Time.now - (60 * 60 * 24)).to_s[0,10] }
    
    it "displays requests when managing listings" do
        create_account_and_listings
        log_in_2
        first(:button, 'Book Now').click
        first(:button, 'Send Request').click
        visit('/session/new')
        fill_in("email", with: "mail@mail.com")
        fill_in("password", with: "password123")
        click_button("Log In")
        click_button("Manage Listings")
        expect(page).to have_content("example name 1")
        expect(page).to have_content(today)
        expect(page).to have_content("username2")
        expect(page).to have_button("Approve")
    end

end