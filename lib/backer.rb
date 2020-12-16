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
        ProjectBacker.all.select do |projectbacker|
            projectbacker.backer == self
        end.map do |projectbacker|
            projectbacker.project
        end
    end


end