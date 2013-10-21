class KeychainsController < ApplicationController
  layout 'personal'

  def index
    flash.now[:warning] = "You are being monitored for all clicks on this app."
    @keychains = Keychain.all
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
    flash.now[:warning] = "The admin was notified that you viewed keychain #{@keychain.name}"
  end

  def edit
    @keychain = Keychain.find(params[:id])
  end

  def update
    @keychain = Keychain.find(params[:id])
    if @keychain.update_attributes(keychain_params)
      redirect_to keychain_path(@keychain)
    else
      render :edit
    end
  end

  private

  def keychain_params
    params.required(:keychain).permit(:name, :username, :password, :description)
  end
end
