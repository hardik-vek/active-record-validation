# frozen_string_literal :true
class FacultiesController < ApplicationController
  before_action :id_action, only: [:show, :edit, :update, :destroy]

  def index
    @faculties = Faculty.all
  end

  def new
    @faculty = Faculty.new
  end

  def show
  end

  def create
    faculty = Faculty.create(faculty_params)
    if faculty.valid?
      redirect_to faculties_path
    else
      flash[:errors] = faculty.errors.full_messages
      redirect_to new_faculty_path
    end
  end

  def edit
  end

  def update
    @faculty.update(faculty_params)
    if @faculty.valid?
      redirect_to faculties_path
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to new_faculty_path
    end
  end

  def destroy
    @faculty.destroy

    redirect_to faculties_path
  end

  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :birth_date, :designation, :email, :phone_number, :username)
  end

  def id_action
    @faculty = Faculty.find(params[:id])
  end
end


