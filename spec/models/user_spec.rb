require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { User.create!(email: "joel_tennant@yahoo.com", password: "helloworld") }

	describe "attributes" do
		it "should have attributes email & password" do
			expect(user).to have_attributes(email: "joel_tennant@yahoo.com", password: "helloworld")
		end
	end
end
