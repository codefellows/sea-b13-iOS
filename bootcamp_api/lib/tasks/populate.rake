namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    Repo.populate 200 do |repo|
      repo.name = Populator.words(1..3).titleize
      repo.html_url = Faker::Internet.url('github.com')
      repo.description = Faker::Lorem.sentence
    end
  end
end
