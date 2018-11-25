class ApplicationMailer < ActionMailer::Base

  append_view_path Rails.root.join('app', 'views', 'mailers')
  default from: "#{ENV['APP_NAME']} <#{ENV['DEFAULT_EMAIL']}>"

  private

  def send_email(email, subject)
    begin
      mail(
        to: email,
        subject: subject
      )
    rescue => e
      raise "Email error: #{e}"
    end
  end 

end