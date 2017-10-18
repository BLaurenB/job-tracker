class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = Contact.new(contact_params)
    @contact.company_id = @company.id
    @contact.save!
    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :position)
  end
end
