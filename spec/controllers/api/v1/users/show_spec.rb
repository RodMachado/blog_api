require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #show' do
    before(:each) do
      get :show, id: user.id, format: :json
    end

    it 'returns the information about a user on a hash' do
      user_response = json_response
      expect(user_response[:email]).to eql user.email
    end

    it { should respond_with 200 }
  end
end
