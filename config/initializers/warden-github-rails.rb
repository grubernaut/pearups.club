Warden::GitHub::Rails.setup do |config|
  config.add_scope :user,  client_id:     ENV['GITHUB_CLIENT_ID']     || 'b8315b3b72c5fd4d0279',
                           client_secret: ENV['GITHUB_CLIENT_SECRET'] || '33d3b0abb3addee78853360ed56d50e2be55b1a5',
                           scope:         'user:email'

  config.default_scope = :user
end
