class HospitalStaff < ApplicationRecord
  # Devise modules for authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  # Enum for roles
  enum role: { receptionist: 'receptionist', doctor: 'doctor' }

  # Enum for specialists (this will map the strings to symbolic values)
  enum specialists: { 
    general_physician: 'General_physician', 
    cancer: 'Cancer', 
    brain: 'Brain', 
    bone: 'Bone' 
  }

  # Validations
  validates :full_name, presence: true
  validates :role, presence: true
  validates :specialists, presence: true, if: :doctor_role?
  validates :total_experience, numericality: { greater_than_or_equal_to: 0 }, if: :doctor_role?

  def doctor_role?
    role == 'doctor'
  end
end
