

if @booking_count > 1
    json.array! @bookings do |booking|
      json.name booking.customer.last_name + '様(' + booking.pet.pet_name + (booking.pet.gender == 'オス' ? 'くん' : 'ちゃん') + ')'
      json.start booking.start_date_time.strftime("%Y-%m-%d %H:%M")
      json.end booking.end_date_time.strftime("%Y-%m-%d %H:%M")
      json.color 'blue'
      json.timed true

    end

end



if @booking_count == 1
  json.bookings do
      json.name booking.customer.last_name
      json.start booking.start_date_time.strftime("%Y-%m-%d %H:%M")
      json.end booking.end_date_time.strftime("%Y-%m-%d %H:%M")
      json.color 'blue'
      json.timed true
  end

  if @booking_count.nil?
    json.array! @bookings do |booking|
      json.name booking.customer.last_name
      json.start booking.start_date_time.strftime("%Y-%m-%d %H:%M")
      json.end booking.end_date_time.strftime("%Y-%m-%d %H:%M")
      json.color 'blue'
      json.timed true
    end
  end

end
 