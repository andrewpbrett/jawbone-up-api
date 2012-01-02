Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

describe Sleep do

  let(:sleep) { Sleep.new({ :full_data => [[1325314448, 1], [1325315468, 3], [1325317748, 2], [1325318948, 3], [1325321948, 2], [1325323148, 3], [1325324048, 2], [1325325848, 3], [1325326748, 2], [1325328848, 3], [1325329448, 2], [1325332148, 3], [1325333348, 2], [1325334848, 3], [1325337848, 2], [1325339348, 3], [1325339948, 2], [1325342048, 3], [1325342888, 1]]}) }

  describe "#deep_sleep" do
    
    it "returns the right amount of deep sleep" do
      sleep.deep_sleep.should == 13320
    end
    
  end
  
  describe "#light_sleep" do
    
    it "returns the right amount of light sleep" do
      sleep.light_sleep.should == 14100
    end
    
  end
  
  describe "#awake_sleep" do
  
    it "returns the right amount of awake sleep" do
      sleep.awake_sleep.should == 1020
    end
    
  end
    
  describe "#time_to_sleep" do
    
    it "returns the right amount of time it took to fall asleep" do  
      sleep.time_to_sleep.should == 1020
    end
    
  end
  
end