require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end

FactoryGirl.define do
	factory :location do
		sequence(:city) {|n| "City #{n}"}
		sequence(:state) {|n| "State #{n}"}
		country "USA"
	end
end

# FactoryGirl.define do
# 	factory :student do
# 		sequence(:f_name) {|n| "First Name #{n}"}
# 		sequence(:l_name) {|n| "Last Name #{n}"}
# 		sequence(:tag) {|n| "1234567#{n}"}
# 	end
# end

FactoryGirl.define do
	factory :student do
		f_name { Faker::Name.first_name }
		l_name { Faker::Name.first_name }
		tag { Faker::Number.number(8) }
	end
end
