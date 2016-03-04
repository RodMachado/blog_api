require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/vnd.blog_api.v1' }

  let!(:user) { FactoryGirl.create :user }

  describe 'DELETE #destroy' do
    before(:each) do
      delete :destroy, { id: user.id }, format: :json
    end

    it { should respond_with 204 }
  end
end
