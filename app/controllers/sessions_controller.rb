class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == 1 ? remember(user) : forget(user)
      if user.role == "admin"
        redirect_to rails_admin.dashboard_path
      else
        redirect_to root_url
      end
    else
      flash.now[:danger] = t "messages.log_in.danger"
      render :new
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end
end
