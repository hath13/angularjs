class EmailsService
	def self.getAllEmails()
		DetailEmail.all
	end
	def self.getEmail(id)
		DetailEmail.find(id)
	end
	def self.saveEmail(email)
		email = current_user.detail_emails.new(email_params)
    	email.is_read = false
    	if(email.save)
      		UserMailer.delay.send_email(@email)
      		email
    	end
	end
	def self.updateEmail(id)
		email = getEmail(id)
		if(email.update_attributes(email))
        	email
    	end
	end
end