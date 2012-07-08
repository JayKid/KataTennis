class TennisGame

  def initialize(players)
    @players = players
    @playersCounters = Array[0,0]
  end

  def play(game)

    result = ''

    playRounds(game)

    result = @players[0] if (@playersCounters[0] > 3)
    result = @players[1] if (@playersCounters[1] > 3)

    result = buildNonFinishedScore() if ( result.eql?('') )

    result

  end

  def getScore(count)
    scores = [
      'Love',
      'Fifteen',
      'Thirty',
      'Fourty'
    ]
    scores[count]
  end

  def buildNonFinishedScore()
    getScore(@playersCounters[0])+ ' - ' + getScore(@playersCounters[1])
  end

  def playRounds(game)
    game.each { |player| 
      @playersCounters[player] += 1
    }
  end


end

