class JsonWebToken
  class << self
    SECRET_KEY_BASE = Settings.application.secret_base
    def encode payload
      JWT.encode payload, SECRET_KEY_BASE
    end

    def decode token
      body = JWT.decode(token, SECRET_KEY_BASE)[0]
      HashWithIndifferentAccess.new body
    end
  end
end
