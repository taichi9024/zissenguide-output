class StaffMember < ApplicationRecord

    def password=(raw_password)
        if raw_password.kind_of?(String)
          self.hash_password = BCrypt::Password.create(raw_password)
        elsif raw_password.nil?
          self.hash_password = nil
        end
    end

end
