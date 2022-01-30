class Faculty < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, length: { is: 10 }, numericality: true
  validates :email, presence: true, uniqueness: true
  validate :desgination_of_faculty
  require "date"
  validates :birth_date, comparison: { less_than: Date.today, message: "can't be in future" }
  #   validates :designation, inclusion: { in: %w(Ass.Prof Prof), message: "%{value} is not valid designation" }, exclusion: { in: %w(HOD Sr.Prof), message: "%{value} is reserved." }
  def desgination_of_faculty
    if (designation == "Ass. Prof" || designation == "Prof")
    elsif (designation == "HOD" || designation == "Sr. Prof.")
      errors.add(:designation, " must not be any from HOD and Sr. Prof.")
    else
      errors.add(:designation, "must  be any from Ass.Prof and Prof. ")
    end
  end
end
