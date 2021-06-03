# roles = ['teacher', 'ta', 'student']

# 5.times do
#     course = Course.create {
#         name: Faker::Coffee.blend_name
#     }
#     end

#     3.times do 
#         user = User.create(
#             first_name:  Faker::GreekPhilosophers.name,
#             last_name:  Faker::FunnyName.name
#         )
#         Enrollment.create(
#             role: roles.sample,
#             course_id: course.id,
#             user_id: user.id
#         )
#     end
# end

# puts 'Data Seeded'

roles = ['teacher', 'ta', 'student']
5.times do 
  course = Course.create(
    name: Faker::Coffee.blend_name
  )
  3.times do
    user = User.create(
      first_name: Faker::GreekPhilosophers.name, 
      last_name: Faker::FunnyName.name
    )
    Enrollment.create(
      role: roles.sample,
      course_id: course.id,
      user_id: user.id
    )
  end
end
puts 'Data Seeded'