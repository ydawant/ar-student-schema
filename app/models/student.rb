require 'date'

require_relative '../../db/config'

class Student < ActiveRecord::Base
  has_many :classes
  has_many :teachers, :through => :classes
  validates :email, :format => { :with => /\S+@\S+\.\S{2,}/, :message => "invalid email"}
  validates :phone, :format => { :with => /\(?\d{3}\)?.?\d{3}.?\d{4}.{2}?\d*/, :message => "bad phone"}
  validate :phone_count
  validate :validate_age
  validates :email, :uniqueness => true

  def name
    self.first_name + ' ' + self.last_name    
  end

  def age
    now = Date.today
    now.year - self.birthday.year - ((now.month >self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  def validate_age
    if age < 5
      errors.add(:birthday, "You are too young")
    end 
  end

  def phone_count
    phone_count = self.phone.gsub!(/\d/)
    if phone_count.count < 10
      errors.add(:phone, "missing didgets")
    end
  end
end

