class UserMailer < ActionMailer::Base
  default from: "issue.tracker@ahtoxa.pp.ua"

  def new_ticket_email(user,id)
    @user = user
    # @url  = link_to tickets_path(id)
    mail(to: @user.email, subject: 'Your ticket added. Waiting on stuff response.')
  end

  def change_ticket(ticket)
    @ticket = ticket
    # @url  = link_to tickets_path(ticket.id)
    @user = Customer.find_by(@ticket.customer_id)
    mail(to: @user.email, subject: 'Your ticket are changed.')
  end

  def answer(ticket)
    @ticket = ticket
    @url  = link_to tickets_path(ticket.id)
    @user = Customer.find_by(@ticket.customer_id)
    mail(to: @user.email, subject: 'Your ticket have answered!')
  end
end
