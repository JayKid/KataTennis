class TennisGame

  DEUCE = 'Deuce'
  SCORES = [
      'Love',
      'Fifteen',
      'Thirty',
      'Fourty'
  ]
  WIN_THRESHOLD = 3

  def initialize(players)

    @players = players
    @playersCounters = Array[0,0]

  end

  def play(game)

    result = ''

    playRounds(game)

    result = buildAdvantage() if (isThereAdvantage())

    result = DEUCE if (isThereDeuce())

    if (resultIsNotSet(result))
      result = getWinner() if (isThereAWinner())
    end

    result = buildNonFinishedScore() if (resultIsNotSet(result))

    result

  end

  def getWinner()
    if (@playersCounters[0] > WIN_THRESHOLD)
      result = @players[0]
    else result = @players[1]
    end
    result
  end

  def isThereAWinner()
    @playersCounters[0] > WIN_THRESHOLD or @playersCounters[1] > WIN_THRESHOLD
  end

  def resultIsNotSet(result)
    result.eql?('')
  end

  def isThereDeuce()
    @playersCounters[0]>=WIN_THRESHOLD and 
    @playersCounters[1]>=WIN_THRESHOLD and 
    @playersCounters[0].eql?(@playersCounters[1])
  end

  def buildAdvantage()
    advantage = 'Advantage '
    if @playersCounters[0] > @playersCounters[1]
      advantage += @players[0]
    else
      advantage += @players[1]
    end
    advantage
  end

  def isThereAdvantage()
    @playersCounters[0] >= WIN_THRESHOLD and 
    @playersCounters[1] >= WIN_THRESHOLD and 
    ( (@playersCounters[0] - @playersCounters[1]).abs.eql?(1) )
  end

  def getScore(count)
    SCORES[count]
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

