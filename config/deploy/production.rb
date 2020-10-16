# frozen_string_literal: true

set :stage, :production
set :rails_env, :production

set :branch, 'master'

server '3.129.9.9', user: 'ubuntu', roles: %w[app db web]

set :bundle_without, %w[development test].join(' ')

set :deploy_to, "/home/deploy/#{fetch :application}/production"

# role :production_cron, %w[app db web]
