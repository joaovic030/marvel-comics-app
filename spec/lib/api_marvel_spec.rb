require 'rails_helper'
require 'api_marvel'
require 'marvel/client'

RSpec.describe ApiMarvel do
  subject(:api_marvel) { described_class.new }
  let(:client) { api_marvel.client }

  describe '.client' do
    context 'when make connection' do
      it { expect(client).to be_a_kind_of(Marvel::Client) }
    end
  end
end
