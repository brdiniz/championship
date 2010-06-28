class GamesController < InheritedResources::Base
  belongs_to :championship
  belongs_to :group
  belongs_to :round
end
