1 ~  :- edge(V0, V0).
1 ~  :- edge(V0, V1).
1 ~  :- in(1,V0).
1 ~  :- in(V0,V1).
1 ~  :- reach(V0).
2 ~  :- edge(V0, V0), in(1,V1).
2 ~  :- edge(V0, V0), in(V1,V2).
2 ~  :- edge(V0, V0), reach(V1).
2 ~  :- edge(V0, V1), in(1,V2).
2 ~  :- edge(V0, V1), reach(V2).
2 ~  :- in(1,V0), reach(V0).
2 ~  :- in(1,V0), reach(V1).
2 ~  :- in(V0,V1), V0 != V1.
2 ~  :- in(V0,V1), in(1,V0).
2 ~  :- in(V0,V1), in(1,V1).
2 ~  :- in(V0,V1), in(1,V2).
2 ~  :- in(V0,V1), in(V0,V2).
2 ~  :- in(V0,V1), in(V1,V2).
2 ~  :- in(V0,V1), reach(V0).
2 ~  :- in(V0,V1), reach(V1).
2 ~  :- in(V0,V1), reach(V2).
2 ~  :- node(V0), not reach(V0).
2 ~ reach(V0) :- in(1,V0).
2 ~ reach(V0) :- in(V0,V1).
2 ~ reach(V1) :- in(V0,V1).
3 ~  :- edge(V0, V0), in(1,V1), reach(V1).
3 ~  :- edge(V0, V0), in(1,V1), reach(V2).
3 ~  :- edge(V0, V0), in(V1,V2), V1 != V2.
3 ~  :- edge(V0, V0), in(V1,V2), in(1,V1).
3 ~  :- edge(V0, V0), in(V1,V2), in(1,V2).
3 ~  :- edge(V0, V0), in(V1,V2), reach(V1).
3 ~  :- edge(V0, V0), in(V1,V2), reach(V2).
3 ~  :- edge(V0, V0), node(V1), not reach(V1).
3 ~  :- edge(V0, V1), in(1,V2), reach(V2).
3 ~  :- edge(V0, V1), node(V2), not reach(V2).
3 ~  :- in(1,V0), node(V0), not reach(V0).
3 ~  :- in(1,V0), node(V1), not reach(V1).
3 ~  :- in(V0,V1), V0 != V1, in(1,V0).
3 ~  :- in(V0,V1), V0 != V1, in(1,V1).
3 ~  :- in(V0,V1), V0 != V1, in(1,V2).
3 ~  :- in(V0,V1), V0 != V1, reach(V0).
3 ~  :- in(V0,V1), V0 != V1, reach(V1).
3 ~  :- in(V0,V1), V0 != V1, reach(V2).
3 ~  :- in(V0,V1), in(1,V0), reach(V0).
3 ~  :- in(V0,V1), in(1,V0), reach(V1).
3 ~  :- in(V0,V1), in(1,V0), reach(V2).
3 ~  :- in(V0,V1), in(1,V1), reach(V0).
3 ~  :- in(V0,V1), in(1,V1), reach(V1).
3 ~  :- in(V0,V1), in(1,V1), reach(V2).
3 ~  :- in(V0,V1), in(1,V2), reach(V0).
3 ~  :- in(V0,V1), in(1,V2), reach(V1).
3 ~  :- in(V0,V1), in(1,V2), reach(V2).
3 ~  :- in(V0,V1), in(V0,V2), V0 != V1.
3 ~  :- in(V0,V1), in(V0,V2), V0 != V2.
3 ~  :- in(V0,V1), in(V0,V2), V1 != V2.
3 ~  :- in(V0,V1), in(V0,V2), in(1,V0).
3 ~  :- in(V0,V1), in(V0,V2), in(1,V1).
3 ~  :- in(V0,V1), in(V0,V2), in(1,V2).
3 ~  :- in(V0,V1), in(V0,V2), reach(V0).
3 ~  :- in(V0,V1), in(V0,V2), reach(V1).
3 ~  :- in(V0,V1), in(V0,V2), reach(V2).
3 ~  :- in(V0,V1), in(V1,V2), V0 != V1.
3 ~  :- in(V0,V1), in(V1,V2), V0 != V2.
3 ~  :- in(V0,V1), in(V1,V2), V1 != V2.
3 ~  :- in(V0,V1), in(V1,V2), in(1,V0).
3 ~  :- in(V0,V1), in(V1,V2), in(1,V1).
3 ~  :- in(V0,V1), in(V1,V2), in(1,V2).
3 ~  :- in(V0,V1), in(V1,V2), reach(V0).
3 ~  :- in(V0,V1), in(V1,V2), reach(V1).
3 ~  :- in(V0,V1), in(V1,V2), reach(V2).
3 ~  :- in(V0,V1), node(V0), not reach(V0).
3 ~  :- in(V0,V1), node(V1), not reach(V1).
3 ~  :- in(V0,V1), node(V2), not reach(V2).
3 ~  :- reach(V0), node(V0), not reach(V0).
3 ~  :- reach(V0), node(V1), not reach(V1).
3 ~ 0 {in(V0,V0) } 1 :- edge(V0, V0).
3 ~ 0 {in(V0,V0) } 1 :- edge(V0, V1).
3 ~ 0 {in(V0,V1) } 1 :- edge(V0, V1).
3 ~ 0 {in(V1,V0) } 1 :- edge(V0, V1).
3 ~ 0 {in(V1,V1) } 1 :- edge(V0, V1).
3 ~ reach(V0) :- in(1,V0), reach(V1).
3 ~ reach(V0) :- in(V0,V1), V0 != V1.
3 ~ reach(V0) :- in(V0,V1), in(1,V0).
3 ~ reach(V0) :- in(V0,V1), in(1,V1).
3 ~ reach(V0) :- in(V0,V1), in(1,V2).
3 ~ reach(V0) :- in(V0,V1), in(V0,V2).
3 ~ reach(V0) :- in(V0,V1), in(V1,V2).
3 ~ reach(V0) :- in(V0,V1), reach(V1).
3 ~ reach(V0) :- in(V0,V1), reach(V2).
3 ~ reach(V1) :- edge(V0, V0), in(1,V1).
3 ~ reach(V1) :- edge(V0, V0), in(V1,V2).
3 ~ reach(V1) :- in(V0,V1), V0 != V1.
3 ~ reach(V1) :- in(V0,V1), in(1,V0).
3 ~ reach(V1) :- in(V0,V1), in(1,V1).
3 ~ reach(V1) :- in(V0,V1), in(1,V2).
3 ~ reach(V1) :- in(V0,V1), in(V0,V2).
3 ~ reach(V1) :- in(V0,V1), in(V1,V2).
3 ~ reach(V1) :- in(V0,V1), reach(V0).
3 ~ reach(V1) :- in(V0,V1), reach(V2).
3 ~ reach(V2) :- edge(V0, V0), in(V1,V2).
3 ~ reach(V2) :- edge(V0, V1), in(1,V2).
3 ~ reach(V2) :- in(V0,V1), in(1,V2).
3 ~ reach(V2) :- in(V0,V1), in(V0,V2).
3 ~ reach(V2) :- in(V0,V1), in(V1,V2).
