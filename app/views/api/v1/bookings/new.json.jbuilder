

if @pet_count > 1
  json.array! @pets do |pet|
    json.name pet.customer.last_name + '様(' + pet.pet_name + (pet.gender == 'オス' ? 'くん' : 'ちゃん') + ')'
    json.pet_breed pet.breed
    json.pet_comment pet.pet_comment
    json.pet_id  pet.id
  end

end



if @pet_count == 1
  
  json.array! @pets do |pet|
   
      json.name pet.customer.last_name + '様(' + pet.pet_name + (pet.gender == 'オス' ? 'くん' : 'ちゃん') + ')'
      json.pet_breed pet.breed
      json.pet_comment pet.pet_comment
      json.pet_id  pet.id

  end
end

if @pet_count.nil?
  json.array! @pets do |pet|
    json.name pet.customer.last_name + '様(' + pet.pet_name + (pet.gender == 'オス' ? 'くん' : 'ちゃん') + ')'
    json.pet_breed pet.breed
    json.pet_comment pet.pet_comment
    json.pet_id  pet.id
  end
end
