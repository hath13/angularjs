class EmailsController < ApplicationController
  def index
    @emails = DetailEmail.all.page((params[:page] || 1).to_i).per_page((params[:per_page] || 5).to_i)
  end
  def create
    @email = current_user.detail_emails.new(email_params)
    # @email.to = User.where(email: email['to']).pluck(:id)
    @email.from = current_user.email
    @email.is_read = false
    if(@email.save)
      UserMailer.delay.send_email(@email)
      @email
    end
  end
  def update
    @email = DetailEmail.find(params[:id])
    if(@email.update_attributes(params.require(:email).permit!))
        @email
    end
  end

  private
  def email_params
    params.require(:email).permit(:from,:to,:title,:body,:is_read)
  end
end

