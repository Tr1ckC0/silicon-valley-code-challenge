class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_round
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolio
        funding_round.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        funding_round.sort_by {|fr| fr.investment}.last
    end

    def invested(domain)
        total = 0
        funding_round.select {|fr| fr.startup.domain == domain}.each {|fr| total += fr.investment}
        total
    end
end
