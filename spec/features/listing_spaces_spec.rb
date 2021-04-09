describe "listing spaces", type: :feature do
    
    it 'has a button when logged in where users can manage their listings' do
        expect(page).to have_no_button("Manage Listings")
        log_in
        expect(page).to have_button("Manage Listings")
    end

    it "has a button to add a new listing" do
        log_in
        user = User.find_by(username: "username")
        click_button("Manage Listings")
        expect(page.current_path).to eq("/listings")
        expect(page).to have_button("Add Listing")
    end

    it "has a button that leads to a form to add a new listing" do
        log_in
        user = User.find_by(username: "username")
        click_button("Manage Listings")
        click_button("Add Listing")
        expect(page.current_path).to eq("/listings/new")
        expect(page).to have_field("name")
        expect(page).to have_field("description")
        expect(page).to have_field("ppn")
        expect(page).to have_field("start_date")
        expect(page).to have_field("end_date")
        expect(page).to have_button("Create Listing")
    end

    it "creates a new listing" do
        log_in
        user = User.find_by(username: "username")
        click_button("Manage Listings")
        click_button("Add Listing")
        fill_in("name", with: "example listing name")
        fill_in("description", with: "example listing description")
        fill_in("ppn", with: 40)
        fill_in("start_date", with: "2021-04-09")
        fill_in("end_date", with: "2021-04-20")
        click_button("Create Listing")
        expect(page.current_path).to eq("/listings")
        expect(page).to have_content("example listing name")
        expect(page).to have_content("example listing description")
        expect(page).to have_content("40")
        expect(page).to have_content("Start Date: 2021-04-09")
        expect(page).to have_content("End Date: 2021-04-20")
    end

    it "does not list a space if the end date is before the start date" do
        log_in
        user = User.find_by(username: "username")
        click_button("Manage Listings")
        click_button("Add Listing")
        fill_in("name", with: "example listing name")
        fill_in("description", with: "example listing description")
        fill_in("ppn", with: 40)
        fill_in("start_date", with: "2021-04-09")
        fill_in("end_date", with: "2021-04-01")
        click_button("Create Listing")
        expect(page.current_path).to eq("/listings/new")
        expect(page).to have_content("Please make sure the available dates are correct")
    end

end