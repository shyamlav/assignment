class PatientsController < ApplicationController
before_action :authenticate_user!, except: [:index, :home]
def new

@doctor = Doctor.all
@appointment = Appointment.all
end
def create_patient
@patient=Patient.new
@patient.name=params[:pat][:name]
@patient.number=params[:pat][:number]
@patient.save
 redirect_to :action => :new
end

def create_doctor
@doctor=Doctor.new
@doctor.doctor_name=params[:doc][:name_doc]
@doctor.doctor_number=params[:doc][:number_doc]
@doctor.doctor_specialization=params[:doc][:spec_doc]
@doctor.save
 redirect_to :action => :new
end

def create_appointment
@appointment=Appointment.new
@appointment.patient_id = params[:doc][:pat_id]
@appointment.doctor_id = params[:doc][:doc_id]
@appointment.diseases=params[:doc][:app_dis]
@appointment.save

redirect_to :action => :new
end


end
