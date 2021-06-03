# class Course < ApplicationRecord
#     has_many :enrollments
#     has_many :users, through :enrollments

#     validates :name, presence: true
# end

class Course < ApplicationRecord
    has_many :enrollments 
    has_many :users, through: :enrollments
    validates :name, presence: true
  end