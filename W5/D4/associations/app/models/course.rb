class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  has_one :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  has_one :instructor,
    primary_key: :instructor_id,
    foreign_key: :id,
    class_name: :User
end
