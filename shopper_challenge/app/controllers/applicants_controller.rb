class ApplicantsController < ApplicationController
  def create
    applicant = Applicant.new(applicant_params)

    if applicant.save
      session[:email] = applicant.email

      render json: applicant
    else
      render json: applicant.errors
    end
  end

  def update
    current_applicant.update_attributes applicant_params

    render json: current_applicant
  end

  private

  def applicant_params
    params.require(:applicant).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :zip_code
    )
  end
end

