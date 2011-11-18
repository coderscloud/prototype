# encoding: utf-8
class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
      if authentication
        flash[:success] = "Bienvenue, vous êtes maintenant connecté à votre profil."
        sign_in authentication.user
        redirect_to authentication.user
      elsif current_user
        current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
        flash[:notice] = "Authentication réussie."
        redirect_to authentications_url
      else
        flash[:error] = "Pas de login lié à ce compte. Vous pouvez créer ce lien une fois vous  êtes connectés à votre profil"
        redirect_to signin_path
      end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Authentification supprimée avec succès."
    redirect_to authentications_url
  end
end