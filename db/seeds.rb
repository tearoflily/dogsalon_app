# Customerテーブル用データ生成
7.times do |n|
  gimei = Gimei.name
  address = Gimei.address
  Customer.create!(
    last_name: gimei.last.kanji,
    first_name: gimei.first.kanji,
    furigana_last_name: gimei.last.hiragana,
    furigana_first_name: gimei.first.hiragana,
    postcode: "4600000",
    address: address.kanji,
    homephone: "0501234123#{n+1}",
    mobilephone: "0901234123#{n+1}",
  )
end

# Petテーブル用データ生成
[
  ["コロ", 1, "2018-07-16T12:00:00+09:00", 2, "シャンプー嫌がります", "2021-03-15T12:00:00+09:00", "やながわペットクリニック", true, "一ヶ月前からです", true, "以前ありましたが、治りました", false, "問題ありません", "今風でお願いします", 1],
  ["ノエ", 2, "2016-04-30T12:00:00+09:00", 1, "爪切り怖がります", "2021-04-1T12:00:00+09:00", "ひいらぎ病院", false, "問題ありません", true, "一ヶ月前からです", false, "問題ありません", "足の毛は刈ってください", 2],
  ["ビスケ", 3, "2019-10-16T12:00:00+09:00", 1, "尻尾の毛は長め希望です", "2020-12-5T12:00:00+09:00", "大塚ペットクリニック", true, "病院から薬をもらっています", false, "問題ありません", false, "問題ありません", "ふわふわで丸い感じでお願いします", 2],
  ["モナ", 3, "2015-02-20T12:00:00+09:00", 2, "左頬に怪我があります", "2020-11-20T12:00:00+09:00", "武蔵動物病院", true, "薬を摂取してよくなりました", false, "問題ありません", true, "病院から薬をもらっています", "洗いやすいようにカットして欲しいです", 3], 
].each do |pet_name, breed, birthday, gender, pet_comment, vaccine_day, hospital_name, dermatitis, dermatitis_comment, disease, disease_comment, flea, flea_comment, customer_request, customer_id, image|
  Pet.create!(
    pet_name: pet_name,
    breed: breed,
    birthday: birthday,
    gender: gender,
    pet_comment: pet_comment,
    vaccine_day: vaccine_day,
    hospital_name: hospital_name,
    dermatitis: dermatitis,
    dermatitis_comment: dermatitis_comment,
    disease: disease,
    disease_comment: disease_comment,
    flea: flea,
    flea_comment: flea_comment,
    customer_request: customer_request,
    customer_id: customer_id
  )
end

# Enqueteテーブル用データ生成
Enquete.create!(
    know_shop: rand(0..4),
    know_shop_comment: "アンケート用備考欄のコメントをここに入力",
    customer_id: rand(0..6)
)

#Menuテーブル用データ生成
[
  ["シャンプーセット", 2, 3500, "1:00"],
  ["シャンプーカット", 3, 5500, "2:00"],
  ["シャンプーセット", 5, 5000, "1:30"],
  ["シャンプーカット", 6, 6500, "2:30"],
  ["爪切り", 2, 1000, "1:00"],
  ["爪切り", 3, 1000, "1:00"],
  ["爪切り", 5, 1000, "1:00"],
  ["爪切り", 6, 1000, "1:00"],
].each do |menu_name, breed, price, working_hours|
  Menu.create!(
    { menu_name: menu_name, breed: breed, price: price, working_hours: working_hours}
  )
end




#Bookingテーブル用データ生成
[
  ["2021-04-10T0:00:00+09:00", "2021-04-10T2:00:00+09:00", "", "", "水温に気を付ける", 1, 2, 1],
  ["2021-04-10T2:00:00+09:00", "2021-04-10T4:00:00+09:00", "", "", "お客様の迎えのときに予約して頂いた商品を渡す", 2, 4, 3],
  ["2021-04-10T6:30:00+09:00", "2021-04-10T7:30:00+09:00", "", "", "ブロー早めに終わらせる", 5, 1, 2],
  ["2021-04-11T2:00:00+09:00", "2021-04-11T4:00:00+09:00", "", "", "爪切り嫌がるから気を付けること", 1, 2, 1],
  ["2021-04-13T2:30:00+09:00", "2021-04-13T3:30:00+09:00", "", "", "頬に怪我があるので気を付ける", 4, 3, 3],
  ["2021-04-15T5:00:00+09:00", "2021-04-15T7:00:00+09:00", "", "", "ふわふわ丸く仕上げること", 2, 4, 2],
  ["2021-04-15T5:00:00+09:00", "2021-04-15T7:00:00+09:00", "2021-04-10T0:00:00+09:00", "2021-04-10T2:00:00+09:00", "お客様の迎えのときに予約して頂いた商品を渡す", 2, 4, 3],
  ["2021-04-15T3:00:00+09:00", "2021-04-15T4:00:00+09:00", "2021-04-10T2:00:00+09:00", "2021-04-10T4:00:00+09:00", "水温に気を付ける", 3, 2, 1],

].each do |start_date_time, end_date_time, start_last_booking, end_last_booking, booking_shop_comment, customer_id, pet_id, menu_id|
  Booking.create!(
    { start_date_time: start_date_time, end_date_time: end_date_time, start_last_booking: start_last_booking, end_last_booking: end_last_booking, booking_shop_comment: booking_shop_comment, customer_id: customer_id, pet_id: pet_id, menu_id: menu_id}
  )
end


#BookingMenu中間テーブル生成
[
  [1, 2],
  [2, 2],
  [3, 4],
  
  [1, 5],
  [2, 6],
  [3, 7],

  [4, 1],
  [5, 3],
  [6, 1],
  [7, 2],
  [8, 2],
].each do |booking_id, menu_id|
  BookingMenu.create!(
    { booking_id: booking_id, menu_id: menu_id}
  )
end
