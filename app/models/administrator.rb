class Administrator < ApplicationRecord

    def password=(raw_pass)
        if raw_pass.kind_of?(String)
            self.hash_password = BCrypt::Password.create(raw_pass)
        else
            self.hash_password = nil
        end
    end
end
