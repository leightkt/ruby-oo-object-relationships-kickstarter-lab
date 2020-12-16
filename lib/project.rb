class Project
    attr_reader :title

    @@all = []

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        ProjectBacker.all.select do |projectbacker|
            projectbacker.project == self
        end.map do |projectbacker|
            projectbacker.backer
        end  
    end

end