require "rails_helper"

describe "Authenticator" do
    describe "authenticate" do
        example "suspend?" do
            t = build(:staff_member)
            expect(Staff::Authenticator.new(t).authenticate("pw")).to be_truthy
        end

        example "suspend now" do
            t = build(:staff_member, suspend: true)
            expect(Staff::Authenticator.new(t).authenticate("pw")).to be_truthy
        end

        example "expired" do
            t = build(:staff_member, end_date: Date.yesterday)
            expect(Staff::Authenticator.new(t).authenticate("pw")).to be_falsey
        end

        example "expired" do
            t = build(:staff_member, start_date: Date.tomorrow)
            expect(Staff::Authenticator.new(t).authenticate("pw")).to be_falsey
        end      
    end
end
