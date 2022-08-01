require 'rails_helper'

RSpec.describe 'Comics Index', type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it 'enables me to search comics by characters' do
    visit '/comics'
    fill_in 'query', with: 'deadpool'

    using_wait_time 5 do
      # try to check for deadpool on the page or any card comic__list-item
      expect(page).to have_content(/deadpool/i)
    end
  end

  context 'when it is not logged in' do
    before do
      visit '/comics'
    end

    it 'check icon heart-regular (without favorite)' do
      expect(page).to have_selector(:css, "a[href='#{new_user_session_path}']")
    end

    it 'click in favorite opens login page' do
      first('.icon').click

      expect(page).to have_selector 'p.title', text: 'Log in'
    end
  end

  context 'when it is logged in' do
    before { sign_in(user) }

    let(:user) { create(:user) }

    it 'favorite the comic' do
      visit '/comics'

      first('.icon').click

      expect(page).to have_selector(:css, "a[data-action='click->favourites#removeFavouriteComic']")
    end

    xit 'check icon heart-solid (after favorite)' do
      expect(page).to have_selector(:css, 'svg[data-prefix="far"]')
    end
  end
end
