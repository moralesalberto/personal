class KeychainsController < ApplicationController
  layout 'personal'

  def index
    flash.now[:warning] = "You are being monitored for all clicks on this app."
    @q = Keychain.search(params[:q])
    @keychains = @q.result(:distinct => true).paginate(:page => params[:page])
  end

  def new
    @keychain = Keychain.new
  end

  def create
    @keychain = Keychain.new(keychain_params)
    if @keychain.save
      redirect_to keychains_path
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
      redirect_to keychains_path
    else
      render :edit
    end
  end

  def destroy
    @keychain = Keychain.find(params[:id])
    if @keychain.destroy
      redirect_to keychains_path
    else
      flash[:error] = @keychain.errors.full_messages.join(", ")
      redirect_to keychain_path(@keychain)
    end
  end

  private

  def keychain_params
    params.required(:keychain).permit(:name, :username, :password, :description)
  end
end
