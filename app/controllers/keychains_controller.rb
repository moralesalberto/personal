class KeychainsController < ApplicationController
  layout 'personal'

  def index

  end

  def new
    @keychain = Keychain.new
  end

  def create
    @keychain = Keychain.new(keychain_params)
    if @keychain.save
      redirect_to keychain_path(@keychain)
    else
      render :new
    end
  end

  def show
    @keychain = Keychain.find(params[:id])
    Notifications.notify_key(@keychain).deliver
    flash[:notice] = "The admin was notified that you viewed keychain #{@keychain.name}"
  end

  private

  def keychain_params
    params.required(:keychain).permit(:name, :username, :password, :description)
  end
end
