require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:password) { |n| "Password123#{n}" }
  end

	factory :location do
    sequence(:name) {|n| "Name #{n}" }
		sequence(:city) { |n| "City #{n}" }
		sequence(:state) { |n| "State #{n}" }
		country "USA"
	end

	factory :student do
		sequence(:f_name) { |n| "First Name #{n}" }
		sequence(:l_name) { |n| "Last Name #{n}" }
		sequence(:tag) { |n| "1234567#{n}" }
	end
end
