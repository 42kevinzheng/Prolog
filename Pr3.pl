%yours
%Q1
mother(M,C):- child(C,M), female(M).

grand_parent(GP,GC):- parent(P,GC), parent(GP,P).

great_grand_mother(GGM,GGC):- mother(GGM,GM), grand_parent(GM,GGC).

%Q2
sibling(A,B):- child(A,P1), child(B, P2), P1=P2, \+A=B.
brother(B,Sib):- sibling(B,Sib), male(B).
sister(S,Sib):- sibling(S,Sib), female(S).

%Q3 --
%You have to know both parents for both siblings for half_sibling
half_sibling(S1,S2):- parent(P1, S1), parent(P1,S2), parent(P2,S1), parent(P3,S2),\+P1=P2, \+P1=P3, \+P2=P3.

full_sibling(S1,S2):- mother(P1, S1), father(P2, S1), mother(P3,S2), father(P4,S2), sibling(S1,S2), P1=P3, P2=P4.

%Q4
first_cousin(C1,C2):- parent(P1,C1), parent(P2,C2), sibling(P1,P2).

second_cousin(C1,C2):- parent(P1,C1), parent(P2,C2), first_cousin(P1,P2).

%Q5
half_first_cousin(C1,C2):- parent(P1,C1), parent(P2,C2), half_sibling(P1,P2).

double_first_cousin(C1,C2):- parent(P1,C1), parent(P2,C2), full_sibling(P1,P2).

%Q6
first_cousin_twice_removed(C1,C2):- grand_parent(P1,C1), first_cousin(P1,C2).
first_cousin_twice_removed(C1,C2):- grand_parent(P2,C2), first_cousin(P2,C1).

%Q7
descendant(D,A):- child(D,A).
descendant(D,A):- child(D,Z), descendant(Z,A), \+A=Z.

ancestor(A,D):- parent(A,D).
ancestor(A,D):- parent(A,Z), ancestor(Z,D).


%Q8
%this version of "cousin" does not handle "____ removed",
%read description carefully
cousin(X,Y) :- parent(Z,X), parent(A,Y), sibling(Z,A), \+A=Z.
cousin(X,Y) :- parent(Z,X), parent(A,Y), cousin(Z,A), \+A=Z.


%Q9
%do not return anything for closest_common_ancestor(X,X,A).

closest_common_ancestor(R1,R2,A):-ancestor(R1,R2), parent(A,R1).   %A is nth_parent of R2 
closest_common_ancestor(R1,R2,A):-ancestor(R2,R1), parent(A,R2).	  %A is nth_parent of R1
closest_common_ancestor(R1,R2,A):-parent(A,R1), parent(A,R2), \+R1=R2. %R1 and R2 has same A as parent
closest_common_ancestor(R1,R2,A):-parent(A,R1), parent(A,Y), \+R1=Y, ancestor(Y,R2). %R1,R2 are nth_parent of R2. A is 2nth_parent of R2. 
closest_common_ancestor(R1,R2,A):-parent(A,X), ancestor(X,R1), parent(A,R2),\+X=R2. %A is 2nth_parent of R1. R1 is nth_parent of R1. 
closest_common_ancestor(R1,R2,A):-parent(A,X), ancestor(X,R1), parent(A,Y), \+X=Y, ancestor(Y,R2). %A is 2nth_parent of R1. Y is nth_parent of R1. A is 2nth_parent of R2.


% Q10 -- not scored, but will do
%   write_descendant_chain(jim,anna) and
%   write_descendant_chain(louise,gina) and
%   write_descendant_chain(emma,lily) <-this one shold print nothing
%   (make sure this DOES NOT FAIL (read the instructions carefully)).

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):- child(X,Y), write_child(X,Y).
write_descendant_chain(X,Y) :- child(X,Z), \+Y=Z, write_child(X,Z), write_descendant_chain(Z,Y).

