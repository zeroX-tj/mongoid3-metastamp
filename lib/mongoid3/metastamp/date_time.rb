# (c) 2012 Wep'IT bvba
module Mongoid3::MetaStamp
  class DateTime < DateTime
    def mongoize
        { 
          time:         self,
          year:         self.year,
          month:        self.month,
          day:          self.day,
          wday:         self.wday,
          hour:         self.hour,
          min:          self.min,
          sec:          self.sec,
          zone:         self.zone,
          offset:       self.utc_offset
        }.stringify_keys
    end
    
    class << self
      def mongoize(object)
        case object
        when Mongoid3::MetaStamp::DateTime then object.mongoize
        when DateTime then Mongoid3::MetaStamp::DateTime.parse(object.to_s).mongoize
        else object
        end
      end
      
      def demongoize(object)
        Mongoid3::MetaStamp::DateTime.parse(object.to_s)
      end
      
      def evolve(object)
        case object
        when Mongoid3::MetaStamp::DateTime then object.mongoize
        else object
        end
      end
    end
  end
end
