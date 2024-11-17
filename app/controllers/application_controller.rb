# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_student

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end
end
