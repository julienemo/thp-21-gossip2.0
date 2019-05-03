module SessionsHelper

  def log_in(user)
   session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    # if there is currently someone
    # perfect, we do nothing
    if @current_user
      @current_user
    # otherwise we look in the session (if anyone just logged in manually)
    # if find something with session[:user_id]
    # assign it to var user_id
    # and do User.find_by(id: user_id)
    # and assign the result to @current_user
    elsif session[:user_id]
      user_id = session[:user_id]
      @current_user = User.find_by(id: user_id)
    # otherwise if find something with cookies
    # (if someone doesn't manually log in but is remembered)
    # if find something with cookies.signed[:user_id]
    # and assign the result to a user
    elsif cookies.signed[:user_id]
      user_id = cookies.signed[:user_id]
      user = User.find_by(id: user_id)

      # if there is still a user at this user_id
      # (ex: someone logged in 10 years ago who deleted the profile)
      # and that this user prove to be authentiqu
      # we log him in (without him logging in manually)
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end

  # when a user is "forgotten"
  # not only should we remove the remember token
  # but also clear the cookies
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
  end
end
