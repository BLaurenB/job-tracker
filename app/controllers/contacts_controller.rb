class ContactsController < ApplicationController
  # def index
  #   @company = Company.find(params[:company_id])
  #   @contacts = @company.contacts
  # end

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = Contact.new(contact_params)
    @contact.company_id = @company.id
    @contact.save
    redirect_to company_path(@company)
  end

  # def show
  #   @company = Company.find(params[:company_id])
  #   @contact = Contact.where(company_id: params[:id])
  # end
  # 
  # def edit
  #   @company = Company.find(params[:company_id])
  #   @contact = @company.contacts.find(params[:id])
  # end
  #
  # def update
  #   @company = Company.find(params[:company_id])
  #   @contact = @company.contacts.find(params[:id])
  #
  #   @contact.update(contact_params)
  #
  #   if @contact.save
  #     flash.notice = "Contact '#{@contact.title}' was updated!"
  #     redirect_to company_contact_path(@company, @contact)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @company = Company.find(params[:company_id])
  #   @contact = @company.contacts.find(params[:id])
  #
  #   @contact.destroy
  #
  #   flash[:success] = "#{@contact.title} was successfully deleted!"
  #   redirect_to company_contacts_path
  # end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :position)
  end
end
