Warden::GitHub::Rails.setup do |config|
  config.add_scope :user,  client_id:     ENV['GITHUB_CLIENT_ID']     || '44e7bcbbe486236c8108',
                           client_secret: ENV['GITHUB_CLIENT_SECRET'] || '947db7d6c9b6b24ef4de7e6b2c298b7846ea63b7',
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
