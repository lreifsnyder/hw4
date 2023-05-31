class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user != nil
      if @user["password"] == params["password"]
    redirect_to "/places/index"
      else
      flash["notice"] = "Nope."
      redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  