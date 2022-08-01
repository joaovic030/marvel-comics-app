require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  context 'with invalid attributes' do
    let(:user) { build(:user, email: nil) }

    it { expect(user).not_to be_valid }
  end

  context 'when user has favourite_comics' do
    let(:user) { create(:user, :with_favourite_comics) }

    it { expect(user.favourite_comics.size).to eq(1) }
  end

  describe '#favourite_comic(comic_id)' do
    context 'when there are favourite_comics' do
      let(:user) { create(:user, :with_favourite_comics) }
      let(:comic_id) { user.favourite_comics.first.comic_id }

      it 'finds the given favourite comic by comid_id' do
        expect(user.favourite_comic(comic_id).id).to eq(user.favourite_comics.ids.first)
      end
    end
  end
end
