module Jawbone
  
  class Sleep
    attr_accessor :data
  
    # expects a hash 
    def initialize(data)
      @data = data
    end
  
    [:awake, :deep, :light].each do |type|
      define_method "#{type}_sleep" do
        totals[type]
      end
    end
  
    def time_to_sleep
      p @data[:full_data][1][0]
      p @data[:full_data][0][0]
      @data[:full_data][1][0] - @data[:full_data][0][0]
    end  
  
    private
  
    def totals
      # State codes: 1 = awake, 2 = light, 3 = deep
      light, deep, awake = 0, 0, 0
      state = 1
      @data[:full_data].each_with_index do |set, i|
        next if i == @data[:full_data].size - 1 # skip the last element

        bucket_size = @data[:full_data][i + 1][0] - set[0]
      
        case set[1]
          when 1 then awake += bucket_size
          when 2 then light += bucket_size
          when 3 then deep  += bucket_size
        end
      end
    
      { light: light, deep: deep, awake: awake }
    end
  
  end
end