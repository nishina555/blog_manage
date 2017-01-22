class SampleNotifierMailer < ApplicationMailer
  default from: 'noreply@sample-project.org'

  def notify
    mail(to: 'toshiharu.nishina@gmail.com', subject: 'test mail') do |format|
      format.text
    end
  end
end
