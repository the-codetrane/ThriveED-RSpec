class ContactValidator
  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def valid_name?
    if contact.first_name.presence && contact.last_name.presence
      true
    else
      false
    end
  end
end
