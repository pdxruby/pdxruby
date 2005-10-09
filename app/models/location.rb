class Location < ActiveRecord::Base
  has_many :events

  validates_presence_of :name
  validates_presence_of :address

  validates_uniqueness_of :name
  validates_uniqueness_of :address

  validates_length_of :name, :maximum => 64
  validates_length_of :homepage, :maximum => 256

  validates_each :homepage do |rec, attr|
    re = Regexp.new(RE::URL)
    unless (rec.send(attr).length == 0) or (re =~ rec.send(attr))
      rec.errors.add attr, "looks awry. A URL should look something like http://som/ewh/ere."
    end
  end
			
  
end
