class SessionsController < ApplicationController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.find_by_email(owner_params[:email])
    # If the owner exists AND the password entered is correct.
    if @owner && @owner.authenticate(owner_params[:password])
      # Save the owner id inside the browser cookie. This is how we keep the owner
      # logged in when they navigate around our website.
      session[:owner_id] = owner.id
      redirect_to '/owners'
    else
    # If owner's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:owner_id] = nil
    redirect_to '/login'
  end

  private
  def owner_params
    params.require(:owner).permit(:email, :password)

  end

end
