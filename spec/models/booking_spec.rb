require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Bookings", type: :system do
    it 'RSpec使用できるかテスト' do
      visit root_path
      expect(page).to have_content '予約機能'
    end
end
