namespace :db do

  desc "Create admin"
  task create_admin: :environment do
    puts "creating admin..."
    User.create name: "Admin", email: "admin@sms.com",
      password: "12345678", password_confirmation: "12345678", role: 1
    puts "created."
  end

  desc "Create users"
  task create_users: :environment do
    puts "creating users..."
    100.times do |n|
      name = Faker::Name.name
      User.create name: name, email: "#{name.split.join}@sms.com",
        password: "12345678", password_confirmation: "12345678"
    end
    puts "created."
  end

  desc "Create lecturers"
  task create_lecturers: :environment do
    puts "creating lecturer..."
    User.last(20).each do |user|
      Lecturer.create user: user, salary: rand(10000000)
    end
    puts "created."
  end

  desc "create students"
  task create_students: :environment do
    puts "creating student..."
    User.first(80).each do |user|
      Student.create user: user, grade_point_average: rand(0.0..4.0).round(2), date_of_joining: Date.today
    end
    puts "created."
  end

  desc "Create courses"
  task create_courses: :environment do
    puts "creating courses..."
    5.times do |n|
      Course.create name: "Course #{n+1}", description: Faker::Lorem.sentence(5)
    end
    puts "created."
  end

  desc "Create subjects"
  task create_subjects: :environment do
    puts "creating subjects..."
    Course.all.each do |course|
      5.times do |n|
        course.subjects.create! name: "Subject-#{n+1} in #{course.name}", description: Faker::Lorem.sentence(5),
          credits: 3
      end
    end
    puts "created."
  end

  desc "Create Classroom"
  task create_classrooms: :environment do
    puts "creating classroom..."
    5.times do |n|
      Classroom.create name: "Class #{n+1}", location: "D #{n+1}"
    end
    puts "created."
  end

end
