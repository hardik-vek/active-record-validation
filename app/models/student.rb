class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  require "date"
  validates :birth_date, comparison: { less_than: Date.today, message: "can't be in future" }
  validates :department, inclusion: { in: %w(CE IT), meesage: "department can't be %{value}" }
  validates :terms_of_usage, acceptance: { message: "You cannot proceed without accepting Terms of Service" }
end
