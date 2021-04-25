# $ bundle exec rspec spec/system/contents_spec.rb

# require 'rails_helper'

# (記入例)
# describe 'コンテンツ管理機能', type: :system do
#   describe '一覧表示機能' do
#     context '1件だけデータがある場合' do
#       before do
#         # コンテンツを1件作成
#         FactoryBot.create(:content, title:"テストコンテンツ1", detail:"コンテンツ1の明細")
#         visit contents_path
#       end
#       it '1件のコンテンツが表示される' do
#         # 表示内容を確認
#         expect(page).to have_content 'テストコンテンツ1'
#       end
#     end
#   end
# end