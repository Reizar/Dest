namespace :dest do
  
  desc "Uses a rake task to load Rails Env"
  task :rails => :environment do
    path = "#{Rails.root}/app"
    Dest.test_directory(path)
  end
end