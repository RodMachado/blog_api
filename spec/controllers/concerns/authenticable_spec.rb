require 'rails_helper'

class Authentication

  include Authenticable

  def request
  end

end

describe Authenticable, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  let(:request) do
    double(:request, headers: { 'Authorization' => user.auth_token })
  end

  subject { Authentication.new }

  describe '#current_user' do
    before do
      request.headers['Authorization'] = user.auth_token
      allow(subject).to receive(:request).and_return(request)
    end

    it 'returns the user from the authorization header' do
      expect(subject.current_user.auth_token).to eql(user.auth_token)
    end
  end
end
