# Workshop Page Objects with Site Prism
# http://www.rubydoc.info/gems/site_prism/2.9

class GoogleSearch < SitePrism::Page
  set_url 'http://www.google.com'

  element :search_field, 'input#lst-ib.gsfi'
end
