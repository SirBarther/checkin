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
