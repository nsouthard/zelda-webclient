class Zelda
  attr_accessor :id, :game, :character
  def initialize(hash_options)
    @id = hash_options["id"]
    @game = hash_options["game"]
    @character = hash_options["character"]
  end

  def character_id
    "#{character}" " " "#{id}"
  end

  def self.find(id)
    Zelda.new(Unirest.get("#{ENV["API_HOST"]}/api/v2/zeldas/#{ id }.json").body)
  end

end