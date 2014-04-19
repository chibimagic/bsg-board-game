class QuorumCard < Card
end

class AcceptProphecy < QuorumCard
  TITLE = 'Accept Prophecy'
  QUOTE = <<eot
Madam President, have you read the Scrolls of Pythia? - Porter
Many times, and I humbly believe I am fulfilling the role of the Leader. - Laura Roslin
eot
  ACTION_TEXT = 'Draw 1 Skill Card of any type (it may be from outside your skill set).'
  KEEP_IN_PLAY_TEXT = 'When a player activates "Administration" or choose the President with the "Admiral\'s Quarters" location, increase the difficulty by 2, then discard this card.'
end

class ArrestOrder < QuorumCard
  TITLE = 'Arrest Order'
  QUOTE = <<eot
He has confessed to lying under oath and dereliction of duty in a time of war. He has been stripped of rank and confined to the Galactica brig. - Laura Roslin
eot
  ACTION_TEXT = 'Choose a character and send him to the "Brig" location. Then discard this card.'
end

class AssignArbitrator < QuorumCard
  TITLE = 'Assign Arbitrator'
  QUOTE = <<eot
I need a free hand. The authority to follow evidence wherever it might land, without command review. - Hadrian
eot
  ACTION_TEXT = 'Draw 2 politics cards and give this card to any other player.'
  KEEP_IN_PLAY_TEXT = 'When a player activates the "Admiral\'s Quarters" location, this player may discard this card to reduce or increase the difficulty by 3.'
end

class AssignMissionSpecialist < QuorumCard
  TITLE = 'Assign Mission Specialist'
  QUOTE = <<eot
Reality is there's a good chance it can Jump all the way back to Caprica, retrieve the Arrow, and help us find Earth. The real Earth. - Laura Roslin
eot
  ACTION_TEXT = 'Draw 2 politics cards and give this card to any other player.'
  KEEP_IN_PLAY_TEXT = 'The next time the fleet jumps, this player chooses the destination instead of the Admiral. He draws 3 Destination Cards (instead of 2) and chooses 1. Then discard this card.'
end

class AssignVicePresident < QuorumCard
  TITLE = 'Assign Vice President'
  QUOTE = <<eot
If anything should happen to you, Madame President, we have no designated successor. The civilian branch of our government would be paralyzed... - Tom Zarek
eot
  ACTION_TEXT = 'Draw 2 politics cards and give this card to any other player.'
  KEEP_IN_PLAY_TEXT = 'While this player is not President, other players may not be chosen with the "Administration" location.'
end

class AuthorizationOfBrutalForce < QuorumCard
  TITLE = 'Authorization of Brutal Force'
  QUOTE = <<eot
They have... over 1,300 innocent people on board... - Laura Roslin
No choice now. Them or us. - William Adama
eot
  ACTION_TEXT = 'Destroy 3 raiders, 1 heavy raider, or 1 centurion. Then roll a die, and if 2 or less, lose 1 populatoin. Then discard this card.'
end

class EncourageMutiny < QuorumCard
  TITLE = 'Encourage Mutiny'
  QUOTE = <<eot
We both took an oath to protect and defend the Articles of Colonization. Those Articles are under attack, as is our entire democratic way of life. - Laura Roslin
eot
  ACTION_TEXT = 'Choose any other player (excluding the Admiral). That player rolls a die. If 3 or higher, he receives the Admiral title; otherwise, lose 1 morale. Then discard this card.'
end

class FoodRationing < QuorumCard
  TITLE = 'Food Rationing'
  QUOTE = <<eot
I estimate that the current civilian population of 45,265 will require at minimum, 82 tons of grain, 85 tons of meat, 119 tons of fruit, 304 tons of vegetables... per week. - Gaius Baltar
eot
  ACTION_TEXT = 'Roll a die. If 6 or higher, gain 1 food and remove this card from the game. Otherwise, no effect and discard this card.'
end

class InspirationalSpeech < QuorumCard
  TITLE = 'Inspirational Speech'
  QUOTE = <<eot
I'm sure I speak on behalf of everyone in the fleet when I say, thank you. Without your dedication, tireless efforts, and sacrifice, none of us would be here today. - Laura Roslin
eot
  ACTION_TEXT = 'Roll a die. If 6 or higher, gain 1 morale and remove this card from the game. Otherwise, no effect and discard this card.'
end

class PresidentialPardon < QuorumCard
  TITLE = 'Presidential Pardon'
  QUOTE = <<eot
I can do more. I can guarantee your safety. I can even order you released. - Laura Roslin
eot
  ACTION_TEXT = 'Move any other character from the "Brig" to any other location on Galactica.'
end

class ReleaseCylonMugshots < QuorumCard
  TITLE = 'Release Cylon Mugshots'
  QUOTE = <<eot
The Cylons have the ability to mimic human form; they look like us now. This man has been identified as a Cylon agent. We believe him to be responsible for the bombing. - Laura Roslin
eot
  ACTION_TEXT = 'Look at 1 random Loyalty Card belonging to any other player, then roll a die. If 3 or less, lose 1 morale. Then discard this card.'
end
