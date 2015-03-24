Warden::GitHub::Rails.setup do |config|
  config.add_scope :user,  client_id:     ENV['GITHUB_CLIENT_ID']     || 'b8315b3b72c5fd4d0279',
                           client_secret: ENV['GITHUB_CLIENT_SECRET'] || '33d3b0abb3addee78853360ed56d50e2be55b1a5',
                           scope:         'user:email'

  config.default_scope = :user
end

module Warden
  class SessionSerializer
    def user_serialize(key)
      key.to_json
    end

    def user_deserialize(key)
      data = JSON.parse(key)
      Warden::GitHub::User.new(data["attribs"], data["token"], data["browser_session_id"])
    end
  end
end
