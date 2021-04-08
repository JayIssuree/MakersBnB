describe "the homepage", type: :feature do
    
    it "displays the title of the webpage" do
        visit('/')
        expect(page).to have_content("Makers BnB")
    end

end