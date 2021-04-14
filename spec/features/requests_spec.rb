describe "requests", type: :feature do
    
    let(:today) { Time.now.to_s[0, 10] }
    let(:next_week) { (Time.now + (60 * 60 * 24 * 7)).to_s[0, 10] }
    let(:yesterday) { (Time.now - (60 * 60 * 24)).to_s[0,10] }
    
    it "displays requests when managing listings" do
        create_account_and_listings
        log_in_2
        first(:button, 'Book Now').click
        first(:button, 'Send Request').click
        log_in
        click_button("Manage Listings")
        expect(page).to have_content("example name 1")
        expect(page).to have_content(today)
        expect(page).to have_content("username2")
        expect(page).to have_button("Approve")
    end

    it "sends a request through to be confirmed" do
        create_account_and_listings
        log_in_2
        first(:button, 'Book Now').click
        first(:button, 'Send Request').click
        log_in
        click_button("Manage Listings")
        click_button("Approve")
        log_in_2
        expect(page).to have_content("example name 1")
        expect(page).to have_content(today)
        expect(page).to have_button("Confirm")
    end

end