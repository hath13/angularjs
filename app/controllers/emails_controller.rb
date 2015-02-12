class EmailsController < ApplicationController
  def index
    # @emails = DetailEmail.all.page((params[:page] || 1).to_i).per_page((params[:per_page] || 5).to_i)
    @emails = paginate(EmailsService.getAllEmails)
  end
  def create
    @email = EmailsService.saveEmail(email_params)
  end
  def update
    @email = EmailsService.updateEmail(params[:id])
  end

  private
  def email_params
    params.require(:email).permit(:from,:to,:title,:body,:is_read)
  end
  def paginate(emails)
    emails.page((params[:page] || 1).to_i).per_page((params[:per_page] || 5).to_i)
  end
end

