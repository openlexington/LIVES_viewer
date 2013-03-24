Fabricator(:business) do
  name Forgery(:name).company_name
  address Forgery(:address).street_address
  city Forgery(:address).city
  state Forgery(:address).state
  postal_code Forgery(:address).zip
  latitude 1
  longitude 1
  phone_number Forgery(:address).phone
end
