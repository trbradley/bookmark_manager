require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc 'Non destructive upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete! (No data loss)'
  end

  desc 'Destuctive upgrade'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete! (Data was lost)'
  end
end
