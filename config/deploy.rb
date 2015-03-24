# This is a generated file.  Do not modify...or else!  :)

set :application, 'pvcglue_dev_box'
set :repo_url, 'git@github.com:talyric/pvcglue-dev-box.git'

set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}

set :bundle_flags, '--deployment' # Remove the `--quiet` flag

namespace :deploy do

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
