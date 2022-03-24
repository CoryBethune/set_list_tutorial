require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @rain = @prince.songs.create!(title: 'Purple Rain2', length: 10, play_count: 123123)
        @kiss = @prince.songs.create!(title: 'Kiss2', length: 15, play_count: 55555555)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round).to eq(13)
      end



    end


  end

end
