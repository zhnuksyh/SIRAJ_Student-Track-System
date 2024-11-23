# app/controllers/students_controller.rb
class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def search
    if params[:query].present?
      begin
        # Disable prepared statements for this query
        @student = Student.connection.unprepared_statement do
          Student.where('"StudentName" ILIKE ?', "%#{params[:query]}%").first
        end

        if @student
          redirect_to student_path(@student)
        else
          flash[:alert] = "No student found with the name '#{params[:query]}'"
          render :search
        end
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "No student found with the name '#{params[:query]}'"
        render :search
      rescue StandardError => e
        flash[:alert] = "An error occurred: #{e.message}"
        render :search
      end
    else
      flash[:alert] = "Please enter a search query"
      render :search
    end
  end

  def dashboard
    @student = Student.find(params[:id])
    # Add any additional logic needed for the student's dashboard
  end

  def canteen
    @student = Student.find(params[:id])
    # Add any logic needed for the student's canteen page
    @payments = Payment.where(StudentID: @student.id) # for specific student
  end

  def profile
    @student = Student.find(params[:id])
    # Add any logic needed for the student's profile page
  end

  def merit
    @student = Student.find(params[:id])
    @merits = Merit.where(StudentID: @student.id) # Fetch merits for specific student
    # Add any logic needed for the student's merit page
  end

  def add_merit
    @student = Student.find(params[:id])
    @merit = Merit.new(merit_params.merge(StudentID: @student.id))
    if @merit.save
      redirect_to merit_student_path(@student), notice: "Merit added successfully."
    else
      redirect_to merit_student_path(@student), alert: "Failed to add merit."
    end
  end


  def exam
    @student = Student.find(params[:id])
    # Add any logic needed for the student's exam page
  end

  private

  def merit_params
    params.require(:merit).permit(:meritPoint, :feedback)
  end
end
