namespace :db do 
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [User].each(&:delete_all)

    User.populate 5 do |user|
      user.fname = Faker::Name.name
      user.lname = Faker::Name.name
      user.email = ["wine@tasteswing.com", "taste@tasteswing.com", "swing@tasteswing.com", "wine@ts.com", "taste@ts.com"]
      user.password_digest = ["hello"]
      user.age =  19..80
      user.avatar_url = Faker::Avatar.image
      user.description = Populator.sentences(4)
      user.region = ["Okanagan", "Naramata Bench", "Prince Edward County"]
    end
  end
end