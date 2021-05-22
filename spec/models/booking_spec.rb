require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Bookings", type: :system do
    it 'RSpec使用できるかテスト' do
      visit root_path
      expect(page).to have_content '予約管理'
    end
end

RSpec.describe "Bookings", type: :system do

    # FactoryBotの作成順番に気を付ける
    # Customer→Pet→Enquete→Menu→Booking→BookingMenu
    # 基本：　let(:bookings) { FactoryBot.create(:booking) }
    # 置き換え：　let(:bookings) { FactoryBot.create(:booking, booking_shop_comment: 'あかさたな') }
    let!(:customer1){ FactoryBot.create(:customer, last_name: '長沢', mobilephone: '08010012002')}
    let!(:pet1){ FactoryBot.create(:pet, pet_name: 'らら', breed: 2, customer_id: customer1.id)}
    let!(:enquete1){ FactoryBot.create(:enquete, customer_id: customer1.id)}
    let!(:menu1){ FactoryBot.create(:menu, breed: 2)}
    let!(:booking1){ FactoryBot.create(:booking, booking_shop_comment: 'あかさたな', customer_id: customer1.id, pet_id: pet1.id)}

    let!(:customer2){ FactoryBot.create(:customer, last_name: '藤原', mobilephone: '09030034004')}
    let!(:pet2){ FactoryBot.create(:pet, pet_name: 'ノエ', breed: 3, customer_id: customer2.id)}
    let!(:enquete2){ FactoryBot.create(:enquete, customer_id: customer2.id)}
    let!(:menu2){ FactoryBot.create(:menu, breed: 3)}
    let!(:booking2){ FactoryBot.create(:booking, booking_shop_comment: 'わをん', customer_id: customer2.id, pet_id: pet2.id)}


  describe '一覧表示の確認' do
    before do
      visit root_path
    end
    it '生成したデータを一覧に表示' do
      expect(page).to have_content "らら" 
      expect(page).to have_content "長沢"
    end
  end

  describe '予約検索機能' do
    before do
      visit '/employees/bookings/'
    end
    it '名前で検索して正しいレコードのみを表示' do
      fill_in('input-21', with: '藤原')
      click_on "search"

      expect(page).to have_content "藤原" 
      expect(page).to have_content "ノエ"

      expect(page).not_to have_content "らら" 
      expect(page).not_to have_content "長沢"
    end
    it '携帯電話で検索して正しいレコードのみを表示' do
      fill_in('input-24', with: '08010012002')
      click_on "search"

      expect(page).not_to have_content "藤原" 
      expect(page).not_to have_content "ノエ"

      expect(page).to have_content "らら" 
      expect(page).to have_content "長沢"
    end
    it 'リセットボタン押下で全表示' do
      fill_in('input-24', with: '08010012002')
      click_on "search"
      click_on "reset"

      expect(page).to have_content "藤原" 
      expect(page).to have_content "ノエ"

      expect(page).to have_content "らら" 
      expect(page).to have_content "長沢"
    end
  end


  describe '新規予約作成機能' do
    before do
      visit '/employees/bookings/'
    end
    it '予約作成' do
      click_on "予約新規作成"
      # 当月7日
      click_on "7"
      click_on "9:30〜"
      click_on "2時間30分"
      fill_in('new-booking-name', with: '藤原')
      click_on "検索"
      click_on "選択"
      find('.new-booking-menu-select', visible: false).set(true)
      fill_in('new-booking-comment', with: '新しい予約のコメント欄です')
      click_on "確認画面"
      click_on "送信"
      page.accept_confirm
      expect(page).to have_content "新しい予約のコメント欄です"
    end


  end



  
end
