require 'net/http'
require 'json'

module Music::Spotify
  def get_artists
    url = "#{SPOTIFY_SEARCH_URL}?type=artist&q="
    uri = URI(url)
    
    response = Net::HTTP.get(uri)
    puts "response : #{response.inspect}"
    result = JSON.parse(response)
    puts "result : #{result.inspect}"
    # Need to implement the saving of data here.
  end
end
