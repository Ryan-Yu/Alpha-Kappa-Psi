namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Active.create!(name: "Example User",
                 email: "example@akpsi.org",
                 password: "foobar",
                 password_confirmation: "foobar")

    Rushee.create!(name: "John Doe",
                 email: "johndoe@rushee.org",
                 major: "Business Administration",
                 grade: "Sophomore")


    45.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@akpsi.org"
      password  = "password"
      Active.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)

      rusheeName  = Faker::Name.name
      rusheeEmail = "rushee-#{n+1}@akpsi.org"
      rusheeMajor  = "Business Administration"
      rusheeGrade  = "Sophomore"
      Rushee.create!(name: name,
                   email: email,
                   major: rusheeMajor,
                   grade: rusheeGrade)

    end

    active = Active.first
    rushees = Rushee.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      rushees.each { |rushee| rushee.rusheeposts.create!(content: content, active: active) }
    end

  end
end