FactoryBot.define do
  factory :staff_member do
    email {"test@example.com"}
    family_name {"手酢と"}
    given_name {"太郎"}
    family_name_kana {"テスト"}
    given_name_kana {"タロウ"}
    password {"pw"}
    start_date {Date.yesterday}
    end_date {nil}
    suspend {false}
  end
end
