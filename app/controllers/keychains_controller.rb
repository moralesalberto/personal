class KeychainsController < ApplicationController
  layout 'personal'

  def index

  end

  def new
    @keychain = Keychain.new
  end
end
