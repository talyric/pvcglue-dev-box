# This is a generated file.  Do not modify...or else!  :)

set :stage, :test
set :rails_env, :test # workaround for RAILS_ENV= being blank in delayed job tasks
set :deploy_to, '/sites/pvcglue_dev_box/test'
set :linked_files, ['.env.test']
set :rvm_ruby_version, '2.1.5'
set :ssh_options, {port: 22222}

server '10.10.10.158', roles: %w{web app db}, user: 'deploy' # server: web_1

