require 'net/http'
require 'json'

module Music::Spotify
  def get_artists
    uri = URI("#{SPOTIFY_SEARCH_URL}?type=artist&q=%7Bquery%7D")
    result = HTTParty.get(uri).parsed_response

    return unless result.present?
    artists = result['artists']
    save_data(artists)
  end

  def save_data(artists)
    artists['items'].each do |item|
      Artist.create!(
      	artist_id: item['id'],
      	external_url: item['external_url'],
      	genres: item['genres'],
      	href: item['href'],
      	name: item['name'],
      	favourite: is_favourite?(item['popularity'])
      	)
    end
  end

  private

  def is_favourite?(popularity)
    return true if popularity == 1
  end
end
