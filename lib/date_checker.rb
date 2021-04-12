class DateChecker

    def self.convert(date)
        date.gsub("-", "").to_i
    end

    def self.check(start_date:, end_date:)
        self.convert(start_date) < self.convert(end_date) && self.convert(start_date) >= self.today
    end

    private

    def self.today
        self.convert(Time.now.to_s[0,10])
    end

end