require 'bundler/capistrano'

set :application, "test_cp"
# set :repository,  "git@github.com:digitalad/controlpanel.git"
set :repository,  "git@github.com:Ludavicus/rad-template.git"
set :deploy_to, "/var/www/test_cp"
set :scm, :git
set :branch, "master"
set :user, "deployman"
set :scm_passphrase, "ah64b32b2"
set :group, "deployers"
set :use_sudo, true
set :rails_env, "production"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }
set :keep_releases, 5
default_run_options[:pty] = true
server "95.170.82.78", :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Symlink shared config files"
  task :symlink_config_files do
    run "#{ sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  end

  # NOTE: I don't use this anymore, but this is how I used to do it.
  desc "Precompile assets after deploy"
  task :precompile_assets do
    run <<-CMD
      cd #{ current_path } &&
      #{ sudo } bundle exec rake assets:precompile RAILS_ENV=#{ rails_env }
    CMD
  end

  desc "Restart applicaiton"
  task :restart do
    run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
  end

  desc "Precompile assets"
  task :custom_precompile do
    run_locally <<-CMD
      rake assets:clean &&
      rake assets:precompile &&
      git add . &&
      git commit -m 'Capistrano autodeploy' &&
      git push origin master
    CMD
  end

end
before "deploy", "deploy:custom_precompile"
after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
