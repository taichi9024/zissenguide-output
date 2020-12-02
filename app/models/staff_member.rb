class StaffMember < ApplicationRecord

  include StringNormalizer

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  before_validation do
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name)
    self.given_name_kana = normalize_as_furigana(given_name)
  end

  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
  format: {with:KATAKANA_REGEXP, allow_nil: true}
  

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
