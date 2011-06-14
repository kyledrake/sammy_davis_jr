require File.join File.expand_path(File.dirname(__FILE__)), 'environment.rb'

=begin
# Example:
describe Game do
  describe 'the score' do
    it 'should increase from zero to ten points on first strike' do
      @game = Game.create :player_name => 'Dean Martin'
      @game.points.must_equal 0
      @game.strike!
      @game.points.must_equal 10
    end
  end
end
=end