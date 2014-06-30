class UserMailer < ActionMailer::Base
  default from: "issue.tracker@ahtoxa.pp.ua"

  def new_ticket_email(user,id)
    @user = user
    @url  = tickets_path(id)
    mail(to: @user.email, subject: 'Your ticket added. Waiting on stuff response.')
  end
end
