# frozen_string_literal: true

module UserDecorator
  def full_name
    return "#{first_name} #{last_name}"
  end
end
