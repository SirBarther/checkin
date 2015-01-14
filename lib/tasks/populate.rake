namespace :db do
  desc "Generates fake users"
  task populate: :environment do
	require 'populator'
	require 'faker'
	  Student.populate 30 do |student|
		student.f_name = Faker::Name.first_name
		student.l_name = Faker::Name.last_name
		student.tag = Faker::Number.number(8)
	  end
	  puts 'All done'
  end
end