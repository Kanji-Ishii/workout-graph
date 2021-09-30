server "54.95.160.35", user: "kanji", roles: %w{app db web}

set :ssh_options, {
  keys: %w(~/.ssh/wg-rsa),
  forward_agent: true,
  auth_methods: %w(publickey),
}
