require 'rails_helper'

RSpec.describe WikisController, type: :controller do
	let(:my_wiki) { Wiki.create!(title: "Test", body: "Testing the body", private: false) }

	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end

		it "assigns my_wiki to @wikis" do
			get :index
			expect(assigns(:wikis)).to eq([my_wiki])
		end
	end

	describe "GET #show" do
		it "returns http success" do
			get :show, { id: my_wiki.id }
			expect(response).to have_http_status(:success)
		end

		it "renders the #show view" do
			get :show, { id: my_wiki.id }
			expect(assigns(:wiki)).to eq(my_wiki)
		end
	end
end
