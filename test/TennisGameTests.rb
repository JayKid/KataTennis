require "../src/TennisGame"
require "test/unit"
 
class TennisGameTests < Test::Unit::TestCase
 
  def setup
    players = ['Player One', 'Player Two']
    @tennisGame = TennisGame.new(players)
  end

  def test_tennisGameExists
  	assert_not_nil( @tennisGame, '' )
  end

  def test_givenNothingItShouldReturnLoveLove
  	game = []
  	assert_equal( @tennisGame.play(game), 'Love - Love' )
  end

  def test_givenOneItShouldReturnLoveFifteen
  	game = [1]
  	assert_equal( @tennisGame.play(game), 'Love - Fifteen' )
  end

  def test_givenFourOnesItShouldReturnPlayerTwo
  	game = [1,1,1,1]
  	assert_equal( @tennisGame.play(game), 'Player Two' )
  end

  def test_givenFourZerosItShouldReturnPlayerOne
    game = [0,0,0,0]
    assert_equal( @tennisGame.play(game), 'Player One' )
  end
 
end