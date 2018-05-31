class InvitationsController < Devise::InvitationsController

  def after_accept_path_for(resource)
    bets_path
  end

end
