class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = Contact.where('firstname LIKE ? or lastname LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    respond_to do |format|
      format.html
      format.csv do
        send_data @contacts.to_csv, filename: "contacts-#{Time.now.to_i}.csv"
      end
    end
  end

  def show; end

  def new
    @contact = Contact.new
  end

  def edit; end

  def create
    @contact = Contact.new(contact_params)
    return redirect_to contact_url(@contact), notice: 'Contact was successfully created.' if @contact.save

    render :new, status: :unprocessable_entity
  end

  def update
    return redirect_to contact_url(@contact), notice: 'Contact was successfully updated.' if @contact.update(contact_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :email, :phone, :cellphone)
  end
end
