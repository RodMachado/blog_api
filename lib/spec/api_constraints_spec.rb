require 'rails_helper'

describe ApiConstraints do
  let(:api_constraints_v1) { described_class.new(version: 1) }
  let(:api_constraints_v2) { described_class.new(version: 2, default: true) }

  let(:request_w_accept_header) do
    double(
      host: 'blog_api.local.dockito.org',
      headers: { 'Accept' => 'application/vnd.blog_api.v1' }
    )
  end

  let(:request_default) do
    double(host: 'blog_api.local.dockito.org')
  end

  describe '#matches?' do
    it 'returns true when the version matches the Accept header' do
      expect(api_constraints_v1.matches?(request_w_accept_header)).to eq(true)
    end

    it "returns the default version when 'default' option is specified" do
      expect(api_constraints_v2.matches?(request_default)).to eq(true)
    end
  end
end
