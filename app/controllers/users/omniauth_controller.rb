class Users::OmniauthController < ApplicationController
  #skip_before_action :authenticate_user!
  # Facebook callback
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      flash[:error] = @user.errors.full_messages.join("\n")
      #redirect_to new_user_registration_url
    end
  end

  # Linkedin callback
  def linkedin
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Linkedin'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.linkedin_data'] = request.env['omniauth.auth'] #.except(:extra) # Removing extra as it can overflow some session stores
      flash[:error] = @user.errors.full_messages.join("\n")
      #redirect_to new_user_registration_url
    end
  end
  
  # Twitter callback
  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Twitter'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.twitter_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      flash[:error] = @user.errors.full_messages.join("\n")
      #redirect_to new_user_registration_url
    end
  end

  # google callback
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']#.except(:extra) # Removing extra as it can overflow some session stores
      #flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      flash[:error] = @user.errors.full_messages.join("\n")
      #redirect_to new_user_registration_url
    end
  end

  # github callback
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]#.except(:extra) # Removing extra as it can overflow some session stores
      #flash[:error] = 'There was a problem signing you in through GitHub. Please register or try signing in later.'
      flash[:error] = @user.errors.full_messages.join("\n")
      #redirect_to new_user_registration_url
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
        user = User.create(name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
      end
    user
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
end
