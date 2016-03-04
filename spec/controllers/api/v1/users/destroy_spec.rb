require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:user) { FactoryGirl.create :user }

  describe 'DELETE #destroy' do
    before(:each) do
      delete :destroy, { id: user.id }, format: :json
    end

    it { should respond_with 204 }
  end
end
