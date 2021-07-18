class Authentication::GenerateAuthenticationToken
  class << self
    def generate_token
      token = random_code
      token = random_code while check_exist? token
      token
    end

    def random_code
      Digest::SHA256.hexdigest DateTime.now.in_time_zone.to_i.to_s + SecureRandom.hex(10)
    end

    def check_exist? token
      Customer.exists? authentication_token: token
    end
  end
end
