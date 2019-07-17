% you need to replace, e.g., "D='fix this'" with a valid query.

%Did Leonardo DiCaprio act in Babel?
q1 :- acted_in('Leonardo DiCaprio','Babel').

%Who directed District 9?
q2(D) :- directed(D,'District 9').

%Did anyone act in Both Click and The Aviator
q3(A) :- acted_in(A,'Click'),acted_in(A,'The Aviator').

%Was there a move released in 2010 that did not star Jennifer Aniston?
q4(M):- released(M,2010), \+acted_in('Jennifer Aniston',M).

%Who directed movies released in 2009? (don't worry about ; part)
q5(D):-  directed(D,M),released(M,2009).

%Has anyone directed more than one movie?
q6(D) :- directed(D,M1), directed(D,M2), \+M1=M2.

%Does any movie have more than one director?
q7(M) :- directed(D1,M), directed(D2,M), \+D1=D2.

%Has anyone acted in more than one movie released in 2008?
q8(A) :- acted_in(A,M),acted_in(A,M1),released(M,2008),released(M1,2008), \+ M=M1.

%Has anyone acted in more than two movies in the same year?
q9(A) :- acted_in(A,M1),acted_in(A,M2),acted_in(A,M3),released(M1,Y1),released(M2,Y2),
released(M3,Y3),\+M1=M2,\+M1=M3,\+M2=M3,Y1=Y2,Y2=Y3,Y1=Y3.

%Who has worked with the same director in different years?
q10(A) :- acted_in(A,M1),acted_in(A,M2),directed(D,M1),directed(D,M2),released(M1,Y1),
released(M2,Y2),\+Y1=Y2.


