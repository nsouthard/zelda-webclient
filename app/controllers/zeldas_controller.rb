class ZeldasController < ApplicationController

  def index
    @zeldas = Unirest.get("localhost:3000/api/v2/zeldas.json").body
  end

  def show
    @zelda = Unirest.get("localhost:3000/api/v2/zeldas/#{params[:id]}.json").body
  end

end
