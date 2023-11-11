class AddressesController < ApplicationController
  before_action :set_address, only: %i[show edit update destroy]

  def new
    @address = Address.new
  end

  def edit; end

  def create
    @address = Address.new(address_params)
    return redirect_to contact_path(@address.contact), notice: 'Address was successfully created.' if @address.save

    render :new, status: :unprocessable_entity
  end

  def update
    return redirect_to contact_path(@address.contact), notice: 'Address was successfully updated.' if @address.update(address_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @address.destroy
    redirect_to contact_path(@address.contact), notice: 'Address was successfully destroyed.'
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip_code, :country, :neighborhood, :contact_id)
  end
end
