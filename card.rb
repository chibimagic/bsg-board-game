class Card
  TITLE = ''
  QUOTE = ''
  BODY = ''
  
  def to_s
    title
  end
  
  def title
    self.class::TITLE
  end
  
  self quote
    self.class::QUOTE
  end
  
  def body
    self.class::BODY
  end
  
  def has_action?
    self.class.const_defined? "ACTION_TEXT"
  end
end

class AdmiralCard < Card
  TITLE = 'Admiral'
  BODY = <<eot
When the fleet jumps, you draw 2 Destination Cards and choose 1.
You control the nuke tokens.
Action: Launch 1 nuke at a basestar (the nuke is removed from the game).
Nukes damage a basestar twice on a roll of 1-2, and automatically destroy a basestar on a roll of 3-8.
eot

  ACTION_TEXT = "Launch 1 nuke at a basestar (the nuke is removed from the game)."
end

class PresidentCard < Card
  TITLE = 'President'
  BODY = <<eot
At the start of the game, draw 1 Quorum Card. You control the hand of Quorum Cards.
Action: Draw a Quorum Card into your hand.
Quorum cards can be played as an action and specialize in increasing resources and dealing with unrevealed Cylons.
eot
  ACTION_TEXT = "Draw a Quorum Card into your hand."
end

class KobolObjectiveCard < Card
  TITLE = 'Kobol'
  BODY = <<eot
Resolve when the following distance is traveled:
4: Sleeper Agent phase.
8: The next time the fleet jumps, the humans win the game (do not draw a destination card).
eot
end
