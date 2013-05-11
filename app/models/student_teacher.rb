class StudentTeacher < ActiveRecord::Base
  belongs_to :teachers
  belongs_to :students
end
