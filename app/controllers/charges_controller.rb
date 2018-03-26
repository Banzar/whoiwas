class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = 8999

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  current_user.increment!(:legacy_count)
	  current_user.save
	  flash[:notice] = "You have purchased a legacy page."
	  redirect_to current_user

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
