# frozen_string_literal :true
class Faculty < ApplicationRecord
  require "date"
  validates :first_name, :last_name, presence: true
  validates :phone_number, length: { is: 10 }, numericality: true
  validates :email, presence: true, uniqueness: true
  validate :desgination_of_faculty
  validates :birth_date, comparison: { less_than: Date.today, message: "can't be in future" }

  def desgination_of_faculty
    if (designation == "Ass. Prof" || designation == "Prof")
    elsif (designation == "HOD" || designation == "Sr. Prof.")
      errors.add(:designation, " must not be any from HOD and Sr. Prof.")
    else
      errors.add(:designation, "must  be any from Ass.Prof and Prof. ")
    end
  end

  before_validation :normalize_name, on: [:create, :update]

  after_initialize do
    puts "Faculty successfully initialized....."
  end

  after_find do
    puts "Faculty successfully founded....."
  end

  after_create do
    puts "Faculty suceessfully created....."
  end

  after_update do
    puts "Faculty successfully updated..... "
  end

  after_destroy do
    puts "Faculty successfully destroyed....."
  end

  after_validation :check_birthday, :check_email

  before_create :username
  def username
    self.username = first_name + last_name + phone_number.to_s
  end

  before_update :username
  def username
    self.username = first_name + last_name + phone_number.to_s
  end

  private

  def normalize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end

  def check_birthday
    if birth_date = errors.empty?
      puts "Birthday is successfully registered"
    end
  end

  def check_email
    if email = errors.empty?
      puts "Email is successfully validated"
    end
  end
end
