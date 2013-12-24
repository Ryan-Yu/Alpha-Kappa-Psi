FactoryGirl.define do

  factory :active do
    name     "Ryan Yu"
    email    "ryan.cao.you@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :rushee do
  	name     "John Doe"
  	email    "johndoe@gmail.com"
  	major    "Business Administration"
  	grade    "Sophomore"
  end

end