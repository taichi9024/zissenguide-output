require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  describe "#password=" do
  example "文字列を与えるとハッシュになる" do
    member = StaffMember.new
    member.password = "taichi"
    expect(member.hash_password).to be_kind_of(String)
    expect(member.hash_password.size).to eq(60)
  end

  example "nilを代入" do
    member = StaffMember.new
    member.password= nil
    expect(member.hash_password).to be_nil
  end
end
end
