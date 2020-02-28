class ContactUsController < ApplicationController
	def new
		@contact = ContactUs.new
	end

	def create
		@contact = ContactUs.new(contact_us_params)
		if verify_recaptcha(model: @contact) && @contact.save
		  redirect_to @contact
		else
			flash[:error] = "Please fill captcha"
		  render 'new'
		end
	end

	def show
		@contact = ContactUs.find(params[:id])
	end

	def invisible_recaptcha
		@contact_new = ContactUs.new
	end

	def invisible_recaptcha_create
		@contact_new = ContactUs.new(contact_us_params)
		if verify_recaptcha(model: @contact) && @contact.save
		  redirect_to @contact
		else
			flash[:error] = "Please fill captcha"
		  render 'invisible_recaptcha'
		end
	end
 
	private
  def contact_us_params
    params.require(:contact_us).permit(:name, :email, :company_name, :phone_number)
  end
end
