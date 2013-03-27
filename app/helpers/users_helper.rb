module UsersHelper
  def location_display(user)
    return "---" if user.city.blank? && user.state.blank?
    return user.city.camelcase + ", " + user.state.upcase if user.state && user.city
    return user.state.upcase if user.state && user.city.blank?
    return user.city.camelcase if user.city && user.state.blank?
  end
  def phone_display(user)
    return "---" if user.phone.blank?
    return user.phone if user.phone
  end
end
