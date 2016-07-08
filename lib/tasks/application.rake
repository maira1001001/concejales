namespace :application do
  desc 'Initializes the application'
  task initialize: :environment do

    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke

  end
end
