class Admin::Authenticator

    def initialize(administrator)
        @administrator = administrator
    end

    def authenticate(raw_password)
        @administrator &&
        @administrator.hash_password &&
        BCrypt::Password.new(@administrator.hash_password) == raw_password
    end
end