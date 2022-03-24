require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @rain = @prince.songs.create!(title: 'Purple Rain2', length: 10, play_count: 123123)
    @kiss = @prince.songs.create!(title: 'Kiss2', length: 15, play_count: 55555555)
  end

  it 'shows all of the titles of the songs for the artist' do

    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@rain.title)
    expect(page).to have_content(@kiss.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @rain.title

    expect(current_path).to eq("/songs/#{@rain.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 12.5")
  end


end
