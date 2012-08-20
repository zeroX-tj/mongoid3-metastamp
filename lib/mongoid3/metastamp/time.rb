# (c) 2012 Wep'IT bvba
module Mongoid3::MetaStamp
  class Time < ::Time
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
    
    def [](param)
      self.mongoize[param]
    end
    
    def self.mongoize(object)
      return nil if object.blank?
      if object.is_a?(Mongoid3::MetaStamp::Time)
        object.mongoize
      elsif object.is_a?(::Time) || object.is_a?(::DateTime)
        Mongoid3::MetaStamp::Time.parse(object.to_s).mongoize
      else 
        object
      end
    end
      
    def self.demongoize(object)
      return nil if object.blank?
      Mongoid3::MetaStamp::Time.parse(object.to_s)
    end
      
    def self.evolve(object)
      return nil if object.blank?
      case object
      when Mongoid3::MetaStamp::Time then object
      when ::Time then object
      else object
      end
    end
  end
end
