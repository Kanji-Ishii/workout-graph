# capistranoのバージョン固定
lock '3.16.0'

# capistranoでsudoを実行するにはttyがなければいけない
set :pty, true

# デプロイするアプリケーション名
set :application, 'workout-graph'

# cloneするgitのレポジトリ
set :repo_url, 'git@github.com:Kanji-Ishii/workout-graph.git'

# deployするブランチ
set :branch, ENV['BRANCH'] || 'main'

# deploy先のディレクトリ
set :deploy_to, '/var/www/workout-graph'

# シンボリックリンクをはるファイル
set :linked_files, fetch(:linked_files, []).push('config/settings.yml')

# シンボリックリンクをはるフォルダ
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# 保持するバージョンの個数
set :keep_releases, 5

# rubyのバージョン
set :rbenv_ruby, '2.6.3'

#出力するログのレベル
set :log_level, :debug

# Nginxの設定ファイル名と置き場所
set :nginx_config_name, "#{fetch(:application)}.conf"
set :nginx_sites_enabled_path, "/etc/nginx/conf.d"

append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "node_modules"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
