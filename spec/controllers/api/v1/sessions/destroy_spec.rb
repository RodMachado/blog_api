require 'rails_helper'

RSpec.describe Api::V1::SessionsController do
  describe 'DELETE #destroy' do
    let!(:user) { FactoryGirl.create :user }

    before(:each) do
      sign_in(user)
      delete :destroy, id: user.auth_token
    end

    it { should respond_with 204 }
  end
end
