class ContactController < ApplicationController

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Your message has been sent successfully!"
      redirect_to contact_index_path
    else
      flash.now[:alert] = "There was an error sending your message. Please check the form and try again."
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :subject, :project, :message)
  end
end
