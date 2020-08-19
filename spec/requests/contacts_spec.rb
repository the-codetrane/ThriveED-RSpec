require 'rails_helper'

RSpec.describe "/contacts", type: :request do
  # Contact. As you add validations to Contact, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for :contact }
  let(:invalid_attributes) { { fake_attr: 'does not work homes' } }

  describe "GET /index" do
    it "renders a successful response" do
      Contact.create! valid_attributes
      get contacts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      contact = Contact.create! valid_attributes
      get contact_url(contact)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_contact_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      contact = Contact.create! valid_attributes
      get edit_contact_url(contact)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contact" do
        expect {
          post contacts_url, params: { contact: valid_attributes }
        }.to change(Contact, :count).by(1)
      end

      it "redirects to the created contact" do
        post contacts_url, params: { contact: valid_attributes }
        expect(response).to redirect_to(contact_url(Contact.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contact" do
        expect {
          post contacts_url, params: { contact: invalid_attributes }
        }.to change(Contact, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post contacts_url, params: { contact: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested contact" do
        contact = Contact.create! valid_attributes
        patch contact_url(contact), params: { contact: new_attributes }
        contact.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the contact" do
        contact = Contact.create! valid_attributes
        patch contact_url(contact), params: { contact: new_attributes }
        contact.reload
        expect(response).to redirect_to(contact_url(contact))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        contact = Contact.create! valid_attributes
        patch contact_url(contact), params: { contact: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested contact" do
      contact = Contact.create! valid_attributes
      expect {
        delete contact_url(contact)
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      contact = Contact.create! valid_attributes
      delete contact_url(contact)
      expect(response).to redirect_to(contacts_url)
    end
  end
end
