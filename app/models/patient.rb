class Patient < ApplicationRecord
  enum gender: { male: 'Male', female: 'Female', other: 'Other' }
  enum status: {
    appointment_booked: 'Appointment Booked',
    checking_up: 'Checking',
    sent_for_report: 'Sent For Report',
    meet_with_report_to_doctor: 'Meet With Report To Doctor',
    treatment_done: 'Treatment Done',
    recheck_up: 'Recheck Up'
  }

  validates :patient_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A(\+?\d{1,3}[- ]?)?\(?\d{1,4}?\)?[- ]?\d{1,4}[- ]?\d{1,4}\z/, message: "invalid phone number" }
  validates :address, presence: true
  validates :facing_issue, presence: true
end
