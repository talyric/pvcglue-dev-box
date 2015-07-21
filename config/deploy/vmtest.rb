# This is a generated file.  Do not modify...or else!  :)

set :stage, :vmtest
set :rails_env, :vmtest # workaround for RAILS_ENV= being blank in delayed job tasks
set :deploy_to, '/sites/pvcglue_dev_box/vmtest'
set :linked_files, ['.env.vmtest']
set :rvm_ruby_version, '2.1.5'
set :ssh_options, {port: 22222}

server '10.10.10.178', roles: %w{web app db}, user: 'deploy' # server: web_1
