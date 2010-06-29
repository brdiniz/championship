class EventsController < InheritedResources::Base
  belongs_to :championship
  belongs_to :group
  belongs_to :round
  belongs_to :game
end