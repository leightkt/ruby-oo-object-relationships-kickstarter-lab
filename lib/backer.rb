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
        projectbackers = ProjectBacker.all.select do |projectbacker|
            projectbacker.backer == self
        end
        projectbackers.each do |projectbacker|
            Project.all.each do |project|
                if project == projectbacker.project
                    backed_projects << project
                end
            end
        end    
        backed_projects   
    end


end