# (c) 2012 Wep'IT bvba
module Mongoid3
  class MetaDateTime < DateTime
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
          zone:         ::Time.zone.name,
          offset:       self.utc_offset
        }.stringify_keys
    end
    
    class << self
      def mongoize(object)
        case object
        when MetaDateTime then object.mongoize
        when DateTime then MetaDateTime.parse(object.to_s).mongoize
        else object
        end
      end
      
      def demongoize(object)
        MetaDateTime.parse(object.to_s)
      end
      
      def evolve(object)
        case object
        when MetaDateTime then object.mongoize
        else object
        end
      end
    end
  end
end
