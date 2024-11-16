module HandlePatientDetail
  class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index
      @patients = Patient.all
    end

    def new
      @patient = Patient.new
      @doctors = HospitalStaff.where(role: 'doctor').pluck(:full_name)
    end

    def create
      @patient = Patient.create(patient_params)
      @patient.booked_by = current_user.id
      if @patient.save
        flash[:success] = "You have successfully created new patient"
        redirect_to root_path
      else
          render 'new'
      end
    end

    def edit
      @doctors = HospitalStaff.where(role: 'doctor').pluck(:full_name)
    end

    def show
      @hospital_staff = HospitalStaff.find_by(id: @patient.booked_by)
    end

    def update
      @patient.booked_by = current_user.id
      if @patient.update(patient_params)
        flash[:success] = "You have successfully updated patient details"
        redirect_to handle_patient_detail_patient_path
      else
          render 'new'
      end
    end

    def destroy
      @patient.destroy
      flash[:success] = "Patient record deleted successfully"
      redirect_to handle_patient_detail_patients_path
    end

    def handle_patient_detail
      @doctors = HospitalStaff.where(role: 'doctor').pluck(:full_name)
    end
    
    private

    def patient_params
      params.require(:patient).permit(:patient_name, :address, :age, :facing_issue, :gender, :booked_by, :consulted_doctor,
                                  :phone_number, :current_medications, :status, :booking_day)
    end

    def set_patient
      @patient = Patient.find(params[:id])
    end

  end
end