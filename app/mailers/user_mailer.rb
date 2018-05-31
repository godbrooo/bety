class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite.subject
  #
  def invite(user, game)
    @user = user


    if @user.user_name != nil
      @name = @user.user_name
    else
      @name = @user.email
    end
    @game = game
    mail(to: @user.email, subject: "Quelqu'un t'a défié - #{@game.title}")
  end
end
