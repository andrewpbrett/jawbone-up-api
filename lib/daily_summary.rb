module Jawbone
  
  class DailySummary
  
    attr_accessor :data
  
    def initialize(data)
      @data = data
    end
    
    def steps
      @data["move_steps"]
    end
    
    def kilometers
      @data["move_kilometers"]
    end
    
    def workout?
      !@data["move_summary"]["workouts"].empty?
    end
    
    def sleep_total
      @data["sleep_summary"]["total"]
    end
    
    def sleep_quality
      return nil if @data["sleep_summary"]["sleeps"].empty?
      sleeps = @data["sleep_summary"]["sleeps"].map { |s| [s["details"]["duration"], s["details"]["quality"]]}
      sleeps.sort_by { |s| s[0] }.first[1]
    end
  end
  
end