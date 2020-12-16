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
        backers = []
        projectbackers = ProjectBacker.all.select do |projectbacker|
            projectbacker.project == self
        end
        projectbackers.each do |projectbacker|
            Backer.all.each do |backer|
                if backer == projectbacker.backer
                    backers << backer
                end
            end
        end    
        backers
    end

end