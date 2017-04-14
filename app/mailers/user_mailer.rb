class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(order)
    puts order
    @order = order
    mail(to: @order.email,
      subject: "Your order #{@order.id} is generated.") do |send|
      send.html {render "welcome_email"}
    end
  end
end
