# app/controllers/students_controller.rb
class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def search
    if params[:query].present?
      @student = Student.where('"StudentName" ILIKE ?', "%#{params[:query]}%").first
      if @student
        redirect_to student_path(@student)
      else
        flash[:alert] = "No student found"
        redirect_to search_students_path
      end
    else
      flash[:alert] = "Please enter a search query"
      redirect_to search_students_path
    end
  end
end
