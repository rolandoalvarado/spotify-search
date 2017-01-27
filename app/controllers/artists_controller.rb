class ArtistsController < ApplicationController
  include Music::Spotify
  
  def index
  	get_artists
  end

  def default
  	# Mark default artist.
  end


end
