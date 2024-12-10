# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # Render the login form
  end

  def create
    student = Student.find_by(email: params[:email])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      redirect_to student_dashboard_path(student), notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end
end
