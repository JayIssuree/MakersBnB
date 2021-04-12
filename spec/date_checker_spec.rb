require 'date_checker'

describe DateChecker do

    let(:today) { Time.now.to_s[0, 10] }
    let(:next_week) { (Time.now + (60 * 60 * 24 * 7)).to_s[0, 10] }
    let(:yesterday) { (Time.now - (60 * 60 * 24)).to_s[0,10] }

    describe ".convert" do
        
        it "converts a string to an integer" do
            expect(DateChecker.convert("2021-09-04")).to eq(20210904)
        end

    end

    describe ".check" do
    
        it "returns true if the start and end dates make sense" do
            expect(DateChecker.check(start_date: today, end_date: next_week)).to be_truthy
        end
    
        it "returns false if the end date is before the start date" do
            expect(DateChecker.check(start_date: today, end_date: yesterday)).to be_falsey
        end

        it "returns false if the start date is before the current date" do
            expect(DateChecker.check(start_date: yesterday, end_date: next_week)).to be_falsey
        end

    end
        
end