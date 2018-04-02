class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_applicant
    @_current_applicant ||= Applicant.find_by email: session[:email]
  end
end
