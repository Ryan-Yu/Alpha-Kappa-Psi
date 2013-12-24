namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Active.create!(name: "Example User",
                 email: "example@akpsi.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@akpsi.org"
      password  = "password"
      Active.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end