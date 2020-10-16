# config valid for current version and patch releases of Capistrano
lock "~> 3.14.0"

# define multiple deployments
set :stages, %w(production staging)
set :default_stage, 'staging'

set :application, "projector"
set :repo_url, "https://github.com/Synkevych/projector.git"

set :user, 'ubuntu'
set :app_name, 'projector'
set :pty,  false

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", ".bundle", "public/system", "public/uploads"

# Default deploy_to directory is /var/www/my_app_name
set :keep_releases, 2

# Default value for :linked_files is [] and  linked_dirs is []
append :linked_files, "config/database.yml", "config/master.key"
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Skip migration if files in db/migrate were not modified
# This command requires loading capistrano/rails in Capfile
set :conditionally_migrate, true

# Set default ruby version
set :rvm_ruby_version, '2.5.5'

# Remove gems no longer used to reduce disk space used
# This command requires loading capistrano/bundler in Capfile
after 'deploy:published', 'bundler:clean'

# leave only 2 releases
# after "deploy", "deploy:cleanup" 

task :finishing do
  invoke 'deploy:cleanup'
end
# Configuration for whenever
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :whenever_roles, "#{fetch(:rails_env)}_cron"

namespace :db do
  task :reset do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:drop'
          execute :rake, 'db:create'
          execute :rake, 'db:migrate'
        end
      end
    end
  end
end

desc 'Clean up old releases'
  task :cleanup do
    on release_roles :all do |host|
      releases = capture(:ls, '-xtr', releases_path).split
      if releases.count >= fetch(:keep_releases)
        info t(:keeping_releases, host: host.to_s, keep_releases: fetch(:keep_releases), releases: releases.count)
        directories = (releases - releases.last(fetch(:keep_releases)))
        if directories.any?
          directories_str = directories.map do |release|
            releases_path.join(release)
          end.join(" ")
          execute :rm, '-rf', directories_str
        else
          info t(:no_old_releases, host: host.to_s, keep_releases: fetch(:keep_releases))
        end
      end
    end
  end
