feature "creating a booking", type: :feature do

    let(:today) { Time.now.to_s[0, 10] }
    let(:next_week) { (Time.now + (60 * 60 * 24 * 7)).to_s[0, 10] }
    let(:yesterday) { (Time.now - (60 * 60 * 24)).to_s[0,10] }

    one_day = (60*60*24)
    count = 0
    bookable_dates = []
    7.times do
        bookable_dates << (Time.now + (one_day * count)).to_s[0, 10]
        count += 1
    end
    
    it "lists all the dates that are availiable for booking for that lisitng" do
        create_account_and_listings
        listing = Listing.find_by(name: "example name 1")
        log_in
        first(:button, "Book Now").click
        expect(page.current_path).to eq("/booking/#{listing.id}")
        expect(page).to have_content("#{bookable_dates[0]}")
        expect(page).to have_content("#{bookable_dates[1]}")
        expect(page).to have_content("#{bookable_dates[2]}")
        expect(page).to have_content("#{bookable_dates[3]}")
        expect(page).to have_content("#{bookable_dates[4]}")
        expect(page).to have_content("#{bookable_dates[5]}")
        expect(page).to have_content("#{bookable_dates[6]}")
        expect(page).to have_button("Send Request", count: 7)
    end

end