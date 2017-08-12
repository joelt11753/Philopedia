require 'rails_helper'

RSpec.describe Wiki, type: :model do
	let (:user) { User.create!(email: 'joel_tennant@yahoo.com', password: 'helloworld') }
	let (:my_wiki) { Wiki.create!(title: "Test", body: "Testing the body", private: false) }

	describe "attributes" do
		it "should have title. body and private attributes" do
			expect(my_wiki).to have_attributes(title: "Test", body: "Testing the body", private: false)
		end
	end
end
