# config/puma.rb

# プロダクション環境用設定
directory '/var/www/kaulis'
environment 'production'
daemonize true

pidfile '/var/www/kaulis/tmp/pids/puma.pid'
state_path '/var/www/kaulis/tmp/pids/puma.state'
stdout_redirect '/var/www/kaulis/log/puma.stdout.log', '/var/www/kaulis/log/puma.stderr.log', true

bind 'unix:///var/www/kaulis/tmp/sockets/puma.sock'

workers 2
threads 1, 6

preload_app!

