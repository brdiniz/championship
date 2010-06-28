class RoundsController < InheritedResources::Base
  belongs_to :championship
  belongs_to :group
end
