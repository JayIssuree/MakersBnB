describe "viewing listings", type: :feature do

    let(:today) { Time.now.to_s[0, 10] }
    let(:next_week) { (Time.now + (60 * 60 * 24 * 7)).to_s[0, 10] }
    let(:yesterday) { (Time.now - (60 * 60 * 24)).to_s[0,10] }
    
    it "displays all listings that are bookable" do
        create_account_and_listings
        visit('/')
        click_button("Log Out")
        expect(page.current_path).to eq("/homepage")
        expect(page).to have_content("example name 1")
        expect(page).to have_content("description 1")
        expect(page).to have_content("40")
        expect(page).to have_content("#{today}")
        expect(page).to have_content("#{next_week}")
        expect(page).to have_content("example name 2")
        expect(page).to have_content("description 2")
        expect(page).to have_content("25")
        expect(page).to have_content("#{today}")
        expect(page).to have_content("#{next_week}")
        expect(page).to have_button("Log In to Book")
    end

end