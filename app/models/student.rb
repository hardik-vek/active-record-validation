# frozen_string_literal :true
class Student < ApplicationRecord
  require "date"
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, comparison: { less_than: Date.today, message: "can't be in future" }
  validates :department, inclusion: { in: %w(CE IT), meesage: "department can't be %{value}" }
  validates :terms_of_usage, acceptance: { message: "You cannot proceed without accepting Terms of Service" }

  before_validation :normalize_name, on: [:create, :update]

  after_initialize do
    puts "Student successfully initialized....."
  end

  after_find do
    puts "Student successfully founded....."
  end

  after_create do
    puts "Student suceessfully created....."
  end

  after_update do
    puts "Student successfully updated..... "
  end

  # after_destroy do
  #   puts "Student successfully destroyed....."
  # end

  before_validation :check_birthday

  after_destroy :destroy_student, if: :student_first_name_hardik_shubham?

  def destroy_student
    puts "student destroyed successfully"
  end

  def student_first_name_hardik_shubham?
    first_name == "Hardik" or "Shubham"
  end

  private

  def check_birthday
    if birth_date > Date.today
      puts "Please enter a valid birth date"
    end
  end

  def normalize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end
end

