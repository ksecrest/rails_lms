# class Enrollment < ApplicationRecord
#   belongs_to :user
#   belongs_to :course

#   validates: role, inclusion: { in: %w(teacher ta student),
#    message: "%{value} is not a valid role", allow_blank: false
# }
# end

class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :role, inclusion: { in: %w(teacher ta student),
    message: "%{value} is not a valid role", allow_blank: false
  }
end
