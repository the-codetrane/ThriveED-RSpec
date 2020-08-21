# frozen_string_literal: true

require 'contact_validator'
class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = Contact.all
  end

  def show; end

  def new
    @contact = Contact.new
  end

  def edit; end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save && (validate_contact != nil)
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params) && validate_contact
        flash[:success] = 'Contact was successfully updated.'
        format.html { redirect_to @contact }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html do
          @contact.errors[:base] << 'Invalid name. Please validate both first and last name.'
          render :edit
        end
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end

  def validate_contact
    ::ContactValidator.new(@contact).valid_name?
  end
end
