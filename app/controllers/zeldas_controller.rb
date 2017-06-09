class ZeldasController < ApplicationController

  def index
    # @zeldas = Unirest.get("localhost:3000/api/v2/zeldas.json").body

   @zeldas = []
   zelda_hash = Unirest.get("#{ENV["API_HOST"]}/api/v2/zeldas.json").body

   zelda_hash.each do |zelda_hash|
     @zeldas << Zelda.new(zelda_hash)
   end
  end

  def show
    # @zelda = Zelda.new(Unirest.get("localhost:3000/api/v2/zeldas/#{params[:id]}.json").body)
    @zelda = Zelda.find(params[:id])
  end

  def new

  end

  def create
    zelda = Unirest.post(
                                "#{ENV["API_HOST"]}/api/v1/zeldas.json",
                                headers: {
                                          "Accept" => "application/json"
                                          },
                                parameters: {
                                         first_name: params[:first_name],
                                         last_name: params[:last_name],
                                         email: params[:email]
                                        }
                                ).body
                                                     
    redirect_to "/zeldas/#{zelda["id"]}"
  end

  def show
    @zelda = Zelda.new(Unirest.get("#{ENV["API_HOST"]}/api/v2/zeldas/#{params[:id]}.json").body)
  end

  def edit
    # @zelda = Unirest.get("#{ENV["API_HOST"]}/api/v1/zeldas/#{params[:id]}.json").body
    @zelda = Zelda.find(params[:id])
  end

    def update
      zelda = Unirest.patch(
                              "#{ENV["API_HOST"]}/api/v1/zeldas/#{params["id"]}.json",
                              headers: {
                                        "Accept" => "application/json"
                                        },
                              parameters: {
                                       first_name: params[:first_name],
                                       last_name: params[:last_name],
                                       email: params[:email]
                                      }
                              ).body
      redirect_to "/zeldas/#{zelda["id"]}"
    end

    def destroy
      Unirest.delete(
                     "#{ENV["API_HOST"]}/api/v1/zeldas/#{params["id"]}.json",
                     headers: {
                               "Accept" => "application/json"
                               }
                     ).body
      redirect_to "/zeldas"
    end

end
