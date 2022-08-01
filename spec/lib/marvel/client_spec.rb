require 'rails_helper'
require 'marvel/client'

RSpec.describe Marvel::Client do
  subject(:client) { described_class.new }
  let(:response) { client.response }

  shared_examples 'response_type' do
    it 'valid response', :aggregate_failures do
      expect(response.first).to be_a_kind_of(OpenStruct)
    end
  end

  shared_examples 'default quantity response items' do
    it { expect(response.size).to eq(20) }
  end

  describe '.comics' do
    context 'with no params' do
      let(:response) { client.comics }

      it_behaves_like 'default quantity response items'
      it_behaves_like 'response_type'
    end

    context 'with limit 50 param' do
      let(:response) { client.comics({ limit: 50 }) }

      it { expect(response.size).to eq(50) }
      it_behaves_like 'response_type'
    end
  end

  describe '.comic' do
    context 'with no params' do
      let(:comic) { client.comics.first }
      let(:response) { client.comic(comic.id) }

      it { expect(response.first.id).to eq(comic.id) }
      it_behaves_like 'response_type'
    end
  end

  describe '.characters' do
    context 'with no params' do
      let(:response) { client.characters }

      it_behaves_like 'default quantity response items'
      it_behaves_like 'response_type'
    end
  end
end
