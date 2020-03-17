class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment
    
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type.to_s
        @investment = investment.to_f

        self.class.all << self
    end

    def self.all
        @@all
    end

    def type=(type)
        @type = type.to_s
    end

    def investment=(num)
        @investment = num.to_f
    end
end
