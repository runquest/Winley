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

    Bottle.populate 5 do |bottle|
      bottle.name = Faker::Name.name
      bottle.type = ["red", "white"]
      bottle.vintage = ["2011", "1999", "2008"]
      bottle.region = ["Okanagan", "Naramata Bench", "Prince Edward County"]
    end

    Event.populate 3 do |event|
      event.event_title = Faker::Name.name
    end
  end
end