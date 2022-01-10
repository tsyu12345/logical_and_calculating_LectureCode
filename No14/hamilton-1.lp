node(dresden).
node(petersburg).
node(novosibirsk).
node(stavropol).
node(moscow).
edge(stavropol, novosibirsk).
edge(dresden, moscow).
edge(moscow, petersburg).
edge(dresden, petersburg).
edge(moscow, stavropol).
edge(dresden, stavropol).
edge(moscow, novosibirsk).
edge(petersburg, novosibirsk).
edge(Y,X) :- edge(X, Y ).

1 { cycle(X,Y) : edge(X, Y) } 1 :- node(X).
1 { cycle(X,Y) : edge(X, Y) } 1 :- node(Y).
reachable(Y):- cycle(s, Y).
reachable(Y):- reachable(X), cycle(X,Y).
:- node(X), not reachable(X).
