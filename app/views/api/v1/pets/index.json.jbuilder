

  json.array! @pets do |pet|
    json.extract! pet, :id, :pet_name, :gender
    json.last_name pet.customer.last_name
    json.first_name pet.customer.first_name
    json.bookings do 
      json.start_last_booking pet.bookings.pluck(:start_last_booking)
    end
  end