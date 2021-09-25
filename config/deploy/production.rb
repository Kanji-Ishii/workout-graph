# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '35.74.50.190', user: 'kanji', roles: %w{app db web} 

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/gw-rsa' 
