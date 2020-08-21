require 'rails_helper'

describe '/contacts', type: :request do
  describe 'GET /index' do
    it 'renders a successful response'
    it 'returns a collection of contacts'
  end

  describe 'GET /show' do
    it 'renders a successful response'
    it 'returns a contact'
  end

  describe 'GET /new' do
    it 'renders a successful response'
  end

  describe 'GET /edit' do
    it 'render a successful response'
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Contact'
      it 'redirects to the created contact'
    end

    context 'with invalid parameters' do
      it 'does not create a new Contact'
      it 're-renders the contact template'
      it 'renders proper message with invalid name'
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested contact'
      it 'redirects to the contact'
    end

    context 'with invalid parameters' do
      it 're-renders the contact template'
      it 'renders proper message with invalid name'
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested contact'
    it 'redirects to the contacts list'
  end
end
