class ChargesController < ApplicationController
	def new
		@stripe_btn_data = {
			key:         "#{ Rails.configuration.stripe[:publishable_key] }",
			description: "Philipedia Membership - #{current_user.name}",
			amount:      1500
		}
	end

	def create
		@amount = 1500 # $15 in pennies

		customer = Stripe::Customer.create(
			email: current_user.email,
			card:  params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			customer:    customer.id,
			amount:      @amount,
			description: "Philipedia Membership - #{current_user.email}",
			currency:    'usd'
		)

		current_user.premium!

		flash[:notice] = "Thanks for upgrading to premium, #{current_user.email}!"
		redirect_to root_path

	rescue Stripe::CardError => e
		flash[:alert] = e.message
		redirect_to new_charge_path
	end

	def destroy
		current_user.standard!

		flash[:notice] = "You have been downgraded to a standard user."
		redirect_to root_path
	end
end
