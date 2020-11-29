require "spec_helper"

describe "admin_login" do
    describe "login" do
        example "pw ok" do
            admin = build(:administrator)
            expect(Admin::Authenticator.new(admin).authenticate("password")).to be_truthy
        end
    end
end
