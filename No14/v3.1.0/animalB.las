%animal classification
% ilasp --version=4 -nc animal.las

% Background Knowledge
:- class(C1), class(C2), C1 != C2.

#pos( { class(mammal) },{ }, { has_milk. has_covering(hair). has_legs(4). homeothermic. habitat(land). }). %dog
#pos( { class(mammal) },{ }, { has_milk. homeothermic. habitat(water). }). %dolphin
#pos( { class(mammal) },{ }, { has_milk. has_covering(hair). has_legs(2). homeothermic. has_eggs. habitat(water). }). %platypus
#pos( { class(mammal) },{ }, { has_milk. has_covering(hair). has_legs(2). homeothermic. habitat(air). }). %bat

#pos( { class(fish) },{ }, { has_gills. has_covering(scale). has_eggs. habitat(water). }). %trout
#pos( { class(fish) },{ }, { has_gills. has_covering(scale). has_eggs. habitat(water). }). %herring
#pos( { class(fish) },{ }, { has_gills. has_eggs. habitat(water). }). %shark
#pos( { class(fish) },{ }, { has_gills. has_eggs. habitat(water). }). %eel

#pos( { class(reptile) },{  }, { has_covering(scale). has_legs(4). has_eggs. habitat(land). }). %lizard
#pos( { class(reptile) },{  }, { has_covering(scale). has_legs(4). has_eggs. habitat(water). }). %crocodile
#pos( { class(reptile) },{  }, { has_covering(scale). has_legs(4). has_eggs. habitat(land). }). %t_rex
#pos( { class(reptile) },{  }, { has_covering(scale). has_legs(4). has_eggs. habitat(water). }). %turtle
#pos( { class(reptile) },{  }, { has_covering(scale). has_eggs. habitat(land). }). %snake

#pos( { class(bird) },{  }, { has_covering(feathers). has_legs(2). homeothermic. has_eggs. habitat(air). }). %eagle
#pos( { class(bird) },{  }, { has_covering(feathers). has_legs(2). homeothermic. has_eggs. habitat(land). }). %ostrich
#pos( { class(bird) },{  }, { has_covering(feathers). has_legs(2). homeothermic. has_eggs. habitat(water). }). %penguin


%Mode Declarations
#modeh( class(const(animal)) ).

#modeb( has_milk ,(positive) ).
#modeb( has_covering(const(covering)) ,(positive) ).
#modeb( has_legs(const(leg)) ,(positive) ).
#modeb( homeothermic ,(positive) ).
#modeb( habitat(const(habit)) ,(positive) ).
#modeb( has_eggs ,(positive) ).
#modeb( has_gills ,(positive) ).

#modeb( class(const(animal)) ). %allow recursive rules

%type definitions

#constant(animal, mammal).
#constant(animal, fish).
#constant(animal, reptile).
#constant(animal, bird).

#constant(covering, hair).
#constant(covering, scale).
#constant(covering, feathers).

#constant(leg, 2).
#constant(leg, 4).

#constant(habit, land).
#constant(habit, water).
#constant(habit, air).

