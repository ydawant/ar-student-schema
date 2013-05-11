require_relative 'teacher'
require_relative 'student'
require_relative 'student_teacher'
require 'faker'


  9.times do
    Teacher.create(:name => Faker::Name.name, :email => Faker::Internet.email, :phone => Faker::PhoneNumber.phone_number)
  end

30.times do
  StudentTeacher.create(:teacher_id => rand(18) + 1, :student_id => rand(54) + 1)
end








