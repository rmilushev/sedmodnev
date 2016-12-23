namespace :mysql do
  desc "Import and map records from legacy mysql to postgres"
  task import: :environment do
    puts "This is MySQL import task :), ENV: #{Rails.env}"
  end

end
