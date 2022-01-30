class StudentsController < ApplicationController
  def index
    @students=Student.all
  end

  def new
    @student = Student.new
  end

  def create
    s= Student.create(student_params)
    if s.valid?
      redirect_to students_path
    else
      flash[:errors] = s.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.valid?
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birth_date, :department,:terms_of_usage)
  end
end
