# initializers initialize things that only need to be set up once.

ActionMailer::Base.smtp_settings = {
  address:              "smtp.sendgrid.net",
  port:                 "587",
  authentication:       :plain,
  user_name:            ENV["email_user_name"],
  password:             ENV["email_password"],
  :domain         => 'heroku.com',
  enable_starttls_auto: true,
}
