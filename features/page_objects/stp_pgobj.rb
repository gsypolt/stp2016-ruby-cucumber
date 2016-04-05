# Workshop Page Objects with Site Prism
# http://www.rubydoc.info/gems/site_prism/2.9

class DeliveryLocation < SitePrism::Page
  set_url 'https://www.dominos.com/en/pages/order/#/locations/search/'

  element :button_delivery, '.js-delivery'
  element :address_type,  '#Address_Type_Select'
  element :location_name, '#Location_Name'
  element :street_address, '#Street'
  element :address_line2, '#Address_Line_2'
  element :city, '#City'
  element :state, '#Region'
  element :zip_code, '#Postal_Code'
  element :button_continue_delivery, '.js-search-cta'

  def delivery_address_static
    button_delivery.click
    address_type.send_keys 'House'
    street_address.send_keys '1 Old Bayshore Highway'
    city.send_keys 'Millbrae'
    state.send_keys 'CA'
    zip_code.send_keys '94030'
    button_continue_delivery.click
  end
  
  def delivery_address(set_address_type, set_location_name, set_street_address, set_address2, set_city, set_state, set_zip_code)
    button_delivery.click
    address_type.send_keys set_address_type
    location_name.send_keys set_location_name
    street_address.send_keys set_street_address
    address_line2.send_keys set_address2
    city.send_keys set_city
    state.send_keys set_state
    zip_code.send_keys set_zip_code
    button_continue_delivery.click
  end

end
