class EmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_mailer.confirmationregisterusers.subject
  #
  def confirmationregisterusers(user)
    # puts user.to_yaml
  	@user = user.name
    @greeting = "Hi #{user.email}"
    mail(to: user.email, subject: "Crear Usuario")
  end
end
