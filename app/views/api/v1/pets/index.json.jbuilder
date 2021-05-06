
  json.array! @pets do |pet|
    json.extract! pet, :id, :pet_name, :gender
    json.last_name pet.customer.last_name
    json.first_name pet.customer.first_name
      json.bookings do 
        booking = pet.bookings.first
        json.start_last_booking booking.start_last_booking
        json.menu_name booking.menu.pluck(:menu_name)
      end 
  end

 