class ContactsController < ApplicationController
  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  def create
    Contact.create(contact_params)
    redirect_to new_contact_path
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
