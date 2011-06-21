require File.join File.expand_path(File.dirname(__FILE__)), 'environment.rb'

=begin
# Example:
describe Game do
  describe 'the score' do
    it 'should increase from zero to ten points on first strike' do
      @game = Game.create :player_name => 'Dean Martin'
      expect_that { @game.points == 0 }
      @game.strike!
      expect_that { @game.points == 10 }
    end
  end
end
=end