class Instance < ApplicationRecord
	belongs_to :project
	has_many :instance_times

    def sum_time
    	count_date = "0:0:0".to_time
     self.instance_times.each do |time|
      
      hour = time.hour.nil? ? 0 : time.hour*60*60
      minutes = time.minutes.nil? ? 0 : time.minutes*60
      seconds =  time. seconds.nil? ? 0 : time. seconds
      count_date += hour + minutes+ seconds
      
     end
      count_date.to_s.split()[1] 
    end	

end
