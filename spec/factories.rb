FactoryGirl.define do 

  factory :user do |user|
    user.name                               "Example User"
    user.email                                "user@example.com"
    user.password                         "foorbar"
    user.password_confirmation    "foorbar"
  end

end
