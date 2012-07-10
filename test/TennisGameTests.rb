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
  	assert_equal('Love - Love', @tennisGame.play(game))
  end

  def test_givenOneItShouldReturnLoveFifteen
  	game = [1]
  	assert_equal('Love - Fifteen' ,@tennisGame.play(game))
  end

  def test_givenFourOnesItShouldReturnPlayerTwo
  	game = [1,1,1,1]
  	assert_equal('Player Two' ,@tennisGame.play(game))
  end

  def test_givenFourZerosItShouldReturnPlayerOne
    game = [0,0,0,0]
    assert_equal('Player One' ,@tennisGame.play(game))
  end

  def test_givenThreeZerosAndThreeOnesItShouldReturnDeuce
    game = [0,0,0,1,1,1]
    assert_equal('Deuce' ,@tennisGame.play(game))
  end

  def test_givenThreeZerosAndFourOnesItShouldReturnAdvantagePlayerTwo
    game = [0,0,0,1,1,1,1]
    assert_equal('Advantage Player Two' ,@tennisGame.play(game))
  end

  def test_givenFourZerosAndFourOnesItShouldReturnDeuce
    game = [0,0,0,0,1,1,1,1]
    assert_equal('Deuce' ,@tennisGame.play(game))
  end
 
end