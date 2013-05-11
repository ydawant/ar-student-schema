require 'date'
require 'faker'

require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  has_many :classes
  has_many :students, :through => :classes
  validates :email, :uniqueness => true

end


