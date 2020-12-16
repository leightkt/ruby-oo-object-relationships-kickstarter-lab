class Backer
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        backed_projects = []
        ProjectBacker.all.each do |projectbacker|
            if projectbacker.backer == self
                backed_projects << projectbacker.project
            end
        end
        backed_projects   
    end


end