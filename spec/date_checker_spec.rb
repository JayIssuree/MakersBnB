require 'date_checker'

describe DateChecker do

    describe ".convert" do
        
        it "converts a string to an integer" do
            expect(DateChecker.convert("2021-09-04")).to eq(20210904)
        end

    end

    describe ".check" do
    
        it "returns true if the start and end dates make sense" do
            expect(DateChecker.check(start_date: "2021-09-04", end_date: "2021-15-04")).to be_truthy
        end
    
        it "returns false if the available dates make sense" do
            expect(DateChecker.check(start_date: "2021-09-04", end_date: "2021-01-04")).to be_falsey
        end

    end
        
end