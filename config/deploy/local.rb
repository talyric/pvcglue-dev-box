# This is a generated file.  Do not modify...or else!  :)

set :stage, :local
set :rails_env, :local # workaround for RAILS_ENV= being blank in delayed job tasks
set :deploy_to, '/sites/pvcglue_dev_box/local'
set :linked_files, ['.env.local']
set :rvm_ruby_version, '2.1.5'
set :ssh_options, {port: 22222}

server '10.0.10.45', roles: %w{web app db}, user: 'deploy' # server: web_1

namespace :deploy do

  desc 'Runs rake db:migrate if migrations are set'
  task :migrate => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:reload"
        end
      end
    end
  end

  after 'deploy:updated', 'deploy:migrate'
end
