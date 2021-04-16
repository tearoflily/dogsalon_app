# Customerテーブル用データ生成
birthday
7.times do |n|
  gemei = Gimei.name
  address = Gimei.address
  Customer.create(
    last_name: gimei.last.kanji
    first_name: gimei.first.kanji
    furigana_last_name: gimei.last.hiragana
    furigana_first_name: gimei.first.hiragana
    postcode: 4600000
    address: address.kanji
    homephone: 05012341234
    mobilephone: 09012341234
    image: File.open('./app/assets/images/test.jpg')
  )
end

# Petテーブル用データ生成
breed = [1, 2, 3, 4]
brithday = ["2018-07-16T12:00:00+09:00", "2016-04-30T12:00:00+09:00", "2019-10-16T12:00:00+09:00", "2015-02-20T12:00:00+09:00",]
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gender = [1,2]
pet_comment = ["シャンプー嫌がります", "爪切り怖がります", "尻尾の毛は長め希望です", "左頬に怪我があります"]
vaccine_day = ["2021-03-15T12:00:00+09:00", "2021-04-1T12:00:00+09:00", "2020-12-5T12:00:00+09:00", "2020-11-20T12:00:00+09:00"]
hospital_name = ["やながわペットクリニック", "ひいらぎ病院", "大塚ペットクリニック"]
boolean = [TRUE, FALSE]
comment1 = ["一ヶ月前からです", "以前ありましたが、治りました", "病院から薬をもらっています", "少しあります", "薬を摂取してよくなりました"]
comment2 = ["以前ありましたが、治りました", "病院から薬をもらっています", "一ヶ月前からです", "少しあります", "薬を摂取してよくなりました"]
comment3 = ["少しあります", "薬を摂取してよくなりました", "以前ありましたが、治りました", "病院から薬をもらっています", "一ヶ月前からです"]
customer_request = ["今風でお願いします", "洗いやすいようにカットして欲しいです", "足の毛は刈ってください", "ふわふわで丸い感じでお願いします"]
Customer.all.each do |customer|
  gemei = Gimei.name
  customer.pets.create(
    pet_name: gemei.first.katakana
    breed: breed[customer % 4]
    birthday: brithday[customer % 4]
    gender: gender[customer % 2]
    pet_comment: pet_comment[customer % 4]
    vaccine_day: vaccine_day[customer % 4]
    hospital_name: hospital_name[customer % 3]
    dermatitis: boolean[customer % 2]
    dermatitis_comment: comment1[customer % 5]
    disease: boolean[customer % 2]
    disease_comment: comment2[customer % 5]
    flea: boolean[customer % 2]
    flea_comment: comment3[customer % 5]
    customer_request: customer_request[customer % 4]
  )
end

# Enqueteテーブル用データ生成
know_shop = [1,2,3,4]
Customer.all.each do |customer|
  gemei = Gimei.name
  Enquete.pets.create(
    know_shop: know_shop[customer % 4]
    know_shop_comment: "アンケート用備考欄のコメントをここに入力"
  )
end

#Menuテーブル用データ生成
[
  ["シャンプーセット", 2, 3500, "1:00"],
  ["シャンプーカット", 3, 5500, "2:00"],
  ["シャンプーセット", 5, 5000, "1:30"],
  ["シャンプーカット", 6, 6500, "2:30"],
].each do |menu_name, breed, price, working_hours|
  Menu.create!(
    { menu_name: menu_name, breed: breed, price: price, working_hours: working_hours}
  )




#Bookingテーブル用データ生成
[
  ["2021-04-10T0:00:00+09:00", "2021-04-10T2:00:00+09:00", "水温に気を付ける", 1, 2, 1],
  ["2021-04-10T2:00:00+09:00", "2021-04-10T4:00:00+09:00", "お客様の迎えのときに予約して頂いた商品を渡す", 2, 4, 3],
  ["2021-04-10T6:30:00+09:00", "2021-04-10T7:30:00+09:00", "ブロー早めに終わらせる", 3, 1, 2],
  ["2021-04-11T2:00:00+09:00", "2021-04-11T4:00:00+09:00", "爪切り嫌がるから気を付けること", 4, 2, 1],
  ["2021-04-13T2:30:00+09:00", "2021-04-10T3:30:00+09:00", "頬に怪我があるので気を付ける", 4, 5, 3],
  ["2021-04-13T5:00:00+09:00", "2021-04-10T7:00:00+09:00", "ふわふわ丸く仕上げること", 5, 4, 2],

].each do |start_date_time, end_date_time, booking_shop_comment, customer_id, pet_id, menu_id|
  Booking.create!(
    { start_date_time: start_date_time, end_date_time: end_date_time, booking_shop_comment: booking_shop_comment, customer_id: customer_id, pet_id: pet_id, menu_id: menu_id}
  )


#BookingMenu中間テーブル生成
[
  [1, 2],
  [2, 2],
  [3, 4],
  [4, 1],
  [5, 3],
  [6, 1],
].each do |booking_id, menu_id|
  BookingMenu.create!(
    { booking_id: booking_id, menu_id: menu_id}
  )
