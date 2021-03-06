class RideController < ApplicationController
	before_action :authenticate_user!,:except => [:index, :about_us]

	def index
		# if user_signed_in?
		# 	redirect_to :action=>'index'
		# else
		# 	redirect_to new_user_session.path
		# end
	end

	def about_us
		
	end

	def registration
		
	end

	def view_profile
		@user=current_user
	end

	def offer_ride
		@offerride=Offerride.new
	end

	def save_ride
		@user=current_user
		@offerride = Offerride.new(params.require(:offerride).permit(:from_point,:to_point,:Stop_over_point,:d_date,:r_date,:price,:description,:luggage_size,:i_will_leave,:detour,:ride_type))
		
		@offerride.save
		@user.offerrides << @offerride
		redirect_to :action=>'get_car_details',:id=>@offerride.id

	end

	def get_car_details
		@offer_id = params[:id]
		@car_deatils = Cardetail.new
	end
	def save_car_details
		test= Offerride.find(params[:id])
		@car_details = Cardetail.new(params.require(:car_deatils).permit(:title,:seats,:comfort,:image,:model,:color))
		if @car_details.save
		   test.cardetail = @car_details
		   flash[:notice]= 'successfully post your add'
		   redirect_to :action=>'index'
		end
	end

	def car_listing_grid
		@ride_details = Offerride.all.page(params[:page]).per(1)
	end

	def listing_detail
		@offer_details = Offerride.find(params[:id])

	end

	def search_ride
		@ride_details = Offerride.search(params[:to],params[:from],params[:date])
	end

	def book_ride
		@booking_details = Offerride.find(params[:id])
		@bill = Bill.new
	end

	def save_bill
		test= Offerride.find(params[:id])
		user= current_user
		@bills = Bill.new(params.require(:bills).permit(:first_name,:last_name,:Address,:seats,:zip_code,:contry,:state,:email))
		if @bills.save
		   test.bills << @bills
		   user.bills << @bills
		   UserMailer.bill_generate(user).deliver_later
		   flash[:notice]= 'Please check out the bill info in your inbox'
		   redirect_to :action=>'index'
		end
	end
end
