module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(nested, song)
    if nested
      #if @nested is true, then we know it is through a nested route
      #display the existing artist name
      song.artist.name
    else
      #if @nested is false, then we know this is a direct edit
      #display the dropdown of artists
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    end
  end
end
