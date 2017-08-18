require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
	let(:user) {
		User.create!(
			name:     'Test',
			email:    'test@email.com',
			password: 'testing',
			role:     'standard'
		)
	}

	describe "GET #new" do
		it "returns http success" do
			get :new, { current_user: user }
			expect(response).to have_http_status(:success)
		end
	end
end
