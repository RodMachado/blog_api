require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/vnd.blog_api.v1' }

  let!(:user) { FactoryGirl.create(:user) }

  describe 'PUT/PATCH #update' do
    context 'when is successfully updated' do
      before(:each) do
        patch(
          :update,
          { id: user.id, user: { email: 'newmail@example.com' } },
          format: :json
        )
      end

      it 'renders the json representation for the updated user' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql('newmail@example.com')
      end

      it { should respond_with 200 }
    end

    context 'when is not updated' do
      before(:each) do
        patch(
          :update,
          { id: user.id, user: { email: 'bademail.com' } },
          format: :json
        )
      end

      it 'renders an errors json' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it 'renders the json errors on why the user could not be updated' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include 'is invalid'
      end

      it { should respond_with 422 }
    end
  end
end
