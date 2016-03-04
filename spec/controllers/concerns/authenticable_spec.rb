require 'rails_helper'

class Authentication

  include Authenticable

  def request
  end

  def response
  end

end

describe Authenticable, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  let(:request) do
    double(:request, headers: { 'Authorization' => user.auth_token })
  end

  let(:response) do
    double(
      :response,
      response_code: 401,
      body: { 'errors' => 'Not authenticated' }.to_json
    )
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

  describe '#authenticate_with_token' do
    before do
      allow(subject).to receive(:current_user).and_return(nil)
      allow(subject).to receive(:response).and_return(response)
    end

    it 'render a json error message' do
      expect(json_response[:errors]).to eql('Not authenticated')
    end

    it { should respond_with 401 }
  end
end
