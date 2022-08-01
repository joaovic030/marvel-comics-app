require "rails_helper"

RSpec.describe "Comics Index", :type => :system do
  before do
    driven_by(:rack_test)
  end

  it "enables me to search comics by characters" do
    visit "/comics"

    fill_in "query", :with => "deadpool"
    using_wait_time 5 do
      # comic__list-item
      expect(page).to have_text("deadpool")
    end

    # try to check for deadpool on the page or any card
  end

  it 'check icon heart-regular (without favorite)' do
    pending
  end

  it 'check icon heart-solid (after favorite)' do
    pending
  end
end
