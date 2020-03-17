class Startup
    attr_reader :name, :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def pivot(domain, name)
        def domain=(arg)
            @domain = arg
        end
        def name=(arg)
            @name = arg
        end

        self.name = name
        self.domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        total = 0
        funding_rounds.each {|fr| total += fr.investment}
        total
    end

    def investors
        funding_rounds.map {|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        investors & VentureCapitalist.tres_commas_club
    end

    ###HELPERS####
    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end
end
