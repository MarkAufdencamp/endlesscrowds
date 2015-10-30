begin
  if Rails.env.production?
    ActionMailer::Base.smtp_settings = {
      address: "smtp.sendgrid.net",
      port: 25,
      domain: ENV['DOMAIN'],
      authentication: "plain",
      user_name: ENV["SENDGRID_USERNAME"],
      password: ENV["SENDGRID_PASSWORD"]
    }
    ActionMailer::Base.delivery_method = :smtp
  end
rescue
  nil
end
