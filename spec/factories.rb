Factory.define :equipe do |p|
  p.name { |n| "equipe_#{n}" }
end

Factory.define :player do |p|
  p.name { |n| "name_#{n}" }
  p.number { |n| "#{n}" }
	p.association :equipe, :factory => :equipe
end

Factory.define :championship do |p|
  p.name { |n| "campeonato_#{n}" }
end

Factory.define :group do |p|
  p.name { |n| "group_#{n}" }
	p.association :championship, :factory => :championship
end

Factory.define :round do |p|
  p.name { |n| "round_#{n}" }
	p.association :group, :factory => :group
end