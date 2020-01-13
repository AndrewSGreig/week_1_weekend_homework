def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_of_new_pets_sold)
  return pet_shop[:admin][:pets_sold] += num_of_new_pets_sold
end

def stock_count(pet_shop)
  pet_shop[:pets].count
end

def pets_by_breed(pet_shop, type)
  count_array = []
  for pet in pet_shop[:pets]
    if pet[:breed] == type
      count_array.push(pet[:breed])
    end
  end
  return count_array
end

def find_pet_by_name(pet_shop, pet_name)
    for pet in pet_shop[:pets]
      if pet[:name] == pet_name
        return pet
      end
    end
    return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pets in pet_shop[:pets]
    if pets[:name]==pet_name
      pets[:name] = nil
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets]<< new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)
    return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, new_pet)
    can_afford=false
    if customer[:cash]>=new_pet[:price]
      can_afford = true
    end
    return can_afford
end

def check_pet_is_in_stock(pet_shop, pet)
  return pet_shop[:pets].include?(pet)
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if check_pet_is_in_stock(pet_shop, pet)
    if customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      increase_pets_sold(pet_shop, 1)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(pet_shop, pet[:price])
    else
      # customer cannot afford pet
    end
  else
    #pet shop does not have pet with that name
  end
end
