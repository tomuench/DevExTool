class ApplicationController < ActionController::Base

  # Is the current User an admin?
  # Must be implemented for RapidFire Survey
  # @return [Boolean]
  def can_administer?
    current_user.try(:admin?)
  end
end
