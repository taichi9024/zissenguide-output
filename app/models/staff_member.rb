class StaffMember < ApplicationRecord

  has_many :events, class_name: "StaffEvent", dependent: :destroy

    def password=(raw_password)
        if raw_password.kind_of?(String)
          self.hash_password = BCrypt::Password.create(raw_password)
        elsif raw_password.nil?
          self.hash_password = nil
        end
    end

    def active?
      !suspend? && 
      start_date <= Date.today &&
      (end_date.nil? || end_date > Date.today)
    end 
end
