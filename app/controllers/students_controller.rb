# frozen_string_literal :true
class StudentsController < ApplicationController
  before_action :id_action, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    s = Student.create(student_params)
    if s.valid?
      redirect_to students_path
    else
      flash[:errors] = s.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
  end

  def update
    @student.update(student_params)
    if @student.valid?
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show
  end

  def destroy
    @student.destroy

    redirect_to students_path
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birth_date, :department, :terms_of_usage)
  end

  def id_action
    @student = Student.find(params[:id])
  end
end


