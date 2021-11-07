%+C, +D, List
theta_subsumes( C, D ):-
    \+((\+((
	    copy_term(D, Dcopy), 
	    numbervars(Dcopy,0,_),
	    is_subset(C, Dcopy))))).

is_subset([],_D).
is_subset([H|T],D):- member(H,D), is_subset(T,D).

				
%%%%%%%%% No function symbol allowed.
%cl([a(a,b,c), -b(d,e,f)]).
%cl([a(x,y,z), -b(x,y,a)]).
%cl([x(A,B,C), -y(A,B,C)]).
%cl([b(A,B,C)]).

cl([-american(X),
    -weapon(Y),
    -sells(X,Y,Z),
    -hostile(Z),
    criminal(X)]).
cl([owns(nono, m1)]).
cl([missile(m1)]).
cl([-missile(X),
    -owns(nono,X),
    sells(west,X, nono)]).
cl([-missile(X), weapon(X)]).
cl([-enemy(X, america), hostile(X)]).
cl([american(west)]).
cl([enemy(nono, america)]).

%
%Herbrand universe
%
get_HU( Universe ):-
    setof(C, (CL,Lit)^( cl(CL), member(Lit,CL), constant_in_term(Lit,C) ), Universe).

constant_in_term(-Lit, C):-!, constant_in_term(Lit,C).
constant_in_term(Lit,C):-
    Lit =.. [_F|Terms],
    constant_member(Terms, C).
constant_member([H|_],H):- atomic(H).
constant_member([_|T],C):- constant_member(T,C).

%
%Herbrand base
%
get_HB( Base ):-
    setof(F/A, (CL,Lit)^( cl(CL), member(Lit,CL), get_FA(Lit,F/A) ), FAs),
    get_HU(Universe),
    setof(GAtom, (FA)^( member(FA,FAs), get_gliteral(FA, Universe, GAtom) ), Base).

get_FA(-Lit, F/A):- !, get_FA(Lit,F/A).
get_FA(Lit, F/A):- functor(Lit,F,A).

get_gliteral(F/A, Universe, GAtom):-
    functor(GAtom,F,A),
    set_gterm(GAtom,Universe).

set_gterm(-Lit,Universe):-!, set_gterm(Lit,Universe).
set_gterm(Lit,Universe):-
    Lit=..[_F|Terms],
    set_terms(Terms,Universe).
set_terms([], _).
set_terms([H|T],U):- member(H,U), set_terms(T,U).

%
%ground clauses
%
get_gc( GroundClauses ):-
    get_HU(Universe),
    setof(CL, ( cl(CL), ground(CL, Universe) ), GroundClauses).

ground([],_U).
ground([H|T],Universe):- set_gterm(H,Universe), ground(T,Universe).

%
%Input Resolution
%
input_resolution([], []).
input_resolution( H, [(COPY, R)|T] ):-
    cl(CL), copy_term(CL,COPY), numbervars(COPY,0,_),
    resolve(H, CL, R),
    input_resolution(R, T).

resolve([H|T], CL, Resolvent):-
    resolve_(H, CL, R),
    append(T, R, Resolvent).
resolve_(-H, [ H|CL], CL).
resolve_( H, [-H|CL], CL).
resolve_( H, [H1|CL], [H1|T]):- resolve_(H, CL, T).

%
%Selective Linear Resolution
%
sl_resolution(H, R):-
    findall(CL, cl(CL), Clauses),
    sl_resolution(H, Clauses, R).

sl_resolution([], _Clauses, []).
sl_resolution( H,  Clauses, [(COPY,R)|T]):-
    member(CL, Clauses), copy_term(CL,COPY), numbervars(COPY,0,_),
    copy_term(CL, CopyClause),
    resolve(H, CopyClause, R),
    copy_term(R, RCopy),
    sl_resolution(R, [RCopy|Clauses], T).
%
%Forward
%
forward(Q):-
    get_facts(Fs), %facts
    tp(Fs,Model),!,
    member(Q,Model).

tp(Cur, M):-
    (next(Cur,FNew)->
	 (append(FNew,Cur,NextM),tp(NextM,M))
    ;Cur=M).

get_facts(Fs):- setof(F, cl([F]),Fs).
next(F, FNew):-
    setof(Head,
	  (CL,Head,Body)^(
	      cl(CL),
	      head_body(CL,Head,Body),
	      is_subset(Body,F),
	      \+member(Head,F)
	  ),FNew).
head_body([], _H, []).
head_body([-L|LT], H, [L|T]):-!, head_body(LT, H, T).
head_body([ H|LT], H, LT).



%
%input resolution (prolog in prolog)
%
trace( Goal ):-
    trace( Goal, 0).

trace( true, _Depth):-!.
trace( (Goal1, Goal2), Depth ):-
    !,
    trace(Goal1, Depth),
    trace(Goal2, Depth).
trace( Goal, Depth):-
    display('Call:', Goal, Depth ),
    clause( Goal, Body ),
    Depth1 is Depth+1,
    trace(Body, Depth1),
    display('Exit:', Goal, Depth ),
    display_redo( Goal, Depth ).

trace( Goal, Depth ):-
    display('Fail:', Goal, Depth),
    fail.

display(Message, Goal, Depth):-
    tab(Depth), write(Message),
    write(Goal), nl.

display_redo( Goal, Depth ):-
    true
    ;
    display('Redo:', Goal, Depth),
    fail.
