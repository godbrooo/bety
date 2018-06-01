class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite.subject
  #
  def invite(user, game)
    @user = user
    @game = game


    if @user.user_name != nil
      @name = @user.user_name
    else
      @name = @user.email
    end

    if @game.bets.first.user.user_name == nil || @game.bets.first.user.user_name == ""
    @challenger = @game.bets.first.user.email
    else
    @challenger = @game.bets.first.user.user_name
    end


    mail(to: @user.email, subject: "Quelqu'un t'a défié - #{@game.title}")
  end
end
