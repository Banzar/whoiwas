module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end


	# Remembers a user in a persistent session.
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	# Returns the user corresponding to the remember token cookie.
	  def current_user
	    if (user_id = session[:user_id])
	      @current_user ||= User.find_by(id: user_id)
	    elsif (user_id = cookies.signed[:user_id])
	      user = User.find_by(id: user_id)
	      if user && user.authenticated?(cookies[:remember_token])
	        log_in user
	        @current_user = user
	      end
	    end
	  end

	def logged_in?
		!current_user.nil?
	end

	def authenticate_user!
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_path
		end
	end

	# def log_out
	# 	session.delete(:user_id)
	# 	@current_user = nil
	# end

	# Forgets a persistent session.
	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	  # Logs out the current user.
	  def log_out
	    forget(current_user)
	    session.delete(:user_id)
	    @current_user = nil
	  end
  
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	def store_location
		session[:forwarding_url] = request.original_url if request.get?
	end
	def check_admin
		if !current_user.try(:admin?) 
			redirect_to legacies_path
			flash[:notice] = "You must be an admin to do this."
		end
	end

	def user_logged_in?
		unless logged_in?
		  store_location
		  flash[:danger] = "Please log in."
		  redirect_to login_path
		end
	end
end
