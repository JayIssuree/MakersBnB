class DateChecker

    def self.convert(date)
        date.gsub("-", "").to_i
    end

    def self.check(start_date:, end_date:)
        self.convert(start_date) < self.convert(end_date)
    end

end