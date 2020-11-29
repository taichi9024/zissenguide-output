require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "Administrators" do
    example "#password" do
      a = Administrator.new
      a.password = "foobar"
      expect(a.hash_password.size).to eq(60)
  end
end

end
