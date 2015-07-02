# This is a generated file.  Do not modify...or else!  :)

set :application, 'pvcglue_dev_box'
set :repo_url, 'git@github.com:talyric/pvcglue-dev-box.git'

set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}

set :bundle_flags, '--deployment' # Remove the `--quiet` flag

# Thanks to marinosbern!
# From http://stackoverflow.com/a/22234123/444774
desc 'Invoke a rake command on the remote server--Example usage: cap staging invoke[db:migrate]'
task :invoke, [:command] => 'deploy:set_rails_env' do |task, args|
  on primary(:app) do
    within current_path do
      with :rails_env => fetch(:rails_env) do
        rake args[:command]
      end
    end
  end
end

namespace :deploy do
  def args
    fetch(:delayed_job_args, "")
  end

  def delayed_job_roles
    fetch(:delayed_job_server_role, :app)
  end

  desc 'Stop the delayed_job process'
  task :delayed_job_stop do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :'script/delayed_job', :stop
        end
      end
    end
  end

  desc 'Start the delayed_job process'
  task :delayed_job_start do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :'script/delayed_job', args, :start
        end
      end
    end
  end

  desc 'Restart the delayed_job process'
  task :delayed_job_restart do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :'script/delayed_job', args, :restart
        end
      end
    end
  end

  #desc 'Restart Delayed Job'
  #task :restart_delayed_job do
  #  on roles(:app), in: :sequence, wait: 5 do
  #    invoke 'delayed_job_restart'
  #  end
  #end

  #task :restart_delayed_job do
  #  invoke 'delayed_job:restart'
  #end


  after :publishing, :delayed_job_restart # calling this directly is a work-around due to "NoMethodError: undefined method `verbosity'" error when calling task from a task in capistrano 3.1.0 and SSHKit 1.3.0

  desc 'Restart passenger app'
  task :restart_passenger do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
      #invoke 'delayed_job_restart'
    end
  end

  after :publishing, :restart_passenger

  after :finishing, 'deploy:cleanup'
end
