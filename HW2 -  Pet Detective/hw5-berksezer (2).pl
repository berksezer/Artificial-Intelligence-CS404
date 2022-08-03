men(gencer).
men(can).
men(rasim).
women(beyza).
women(canan).
women(meryem).
bags(blueBag).
bags(orangeBag).
bags(redBag).
bags(purpleBag).
bags(greenBag).
bags(yellowBag).
food(avocado).
food(onion).
food(nuts).
food(chocolate).
food(garlic).
food(cookies).

person(X) :- men(X) ; women(X).
owns(X, Y) :- person(X), bags(Y).
carry(X, Y) :- bags(X), food(Y).

uniqueOwner(A, B, C, D, E, F) :- person(A), person(B), person(C), person(D), person(E), person(F),  \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.
uniqueFood(A, B, C, D, E, F) :- food(A), food(B), food(C), food(D), food(E), food(F),  \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.

clue1(RedOwner, RedFood) :- owns(RedOwner, redBag), men(RedOwner), carry(redBag, RedFood), \+RedFood = cookies, \+RedFood = chocolate, \+RedFood = avocado.
clue2(RedFood) :- carry(redBag, RedFood), \+RedFood=onion.
clue3(YellowOwner, BlueOwner) :- owns(YellowOwner, yellowBag), owns(BlueOwner, blueBag), YellowOwner = beyza, BlueOwner = meryem.
clue3(YellowOwner, BlueOwner) :- owns(BlueOwner, blueBag), owns(YellowOwner, yellowBag), YellowOwner = meryem, BlueOwner = beyza.
clue4(BlueFood, OrangeFood) :- carry(blueBag, BlueFood), carry(orangeBag, OrangeFood), \+OrangeFood = avocado, \+BlueFood = avocado.
clue5(YellowOwner, YellowFood) :- carry(yellowBag, YellowFood), women(YellowOwner), owns(YellowOwner, yellowBag), YellowFood = cookies.
clue6(PurpleOwner) :- owns(PurpleOwner, purpleBag), PurpleOwner = can.
clue6(PurpleOwner) :- owns(PurpleOwner, purpleBag), PurpleOwner = gencer.
clue7(OrangeFood) :- carry(orangeBag, OrangeFood), \+OrangeFood = chocolate.
clue8(YellowOwner, GreenOwner) :- owns(YellowOwner, yellowBag), owns(GreenOwner, greenBag), \+YellowOwner = meryem, \+GreenOwner = meryem.
clue9(BlueFood, BlueOwner, GreenFood, GreenOwner, OrangeFood, OrangeOwner, PurpleFood, PurpleOwner, RedFood, RedOwner, YellowFood, YellowOwner) :- (carry(blueBag, onion), owns(gencer, blueBag), BlueFood = onion, BlueOwner = gencer) ; (carry(greenBag, onion), owns(gencer, greenBag), GreenFood = onion, GreenOwner = gencer) ; (carry(orangeBag, onion), owns(gencer, orangeBag), OrangeFood = onion, OrangeOwner = gencer) ; (carry(purpleBag, onion), owns(gencer, purpleBag), PurpleFood = onion, PurpleOwner = gencer) ; (carry(redBag, onion), owns(gencer, redBag), RedFood = onion, RedOwner = gencer) ; (carry(yellowBag, onion), owns(gencer, yellowBag), YellowFood = onion, YellowOwner = gencer).
clue10(GreenOwner, GreenFood) :-carry(greenBag, GreenFood), owns(GreenOwner, greenBag), GreenFood = nuts.

guilty(GreenOwner) :- clue1(RedOwner, RedFood), clue2(RedFood), clue3(YellowOwner, BlueOwner), clue4(BlueFood, OrangeFood), clue5(YellowOwner, YellowFood), clue6(PurpleOwner), clue7(OrangeFood), clue8(YellowOwner, GreenOwner), clue9(BlueFood, BlueOwner, GreenFood, GreenOwner, OrangeFood, OrangeOwner, PurpleFood, PurpleOwner, RedFood, RedOwner, YellowFood, YellowOwner), clue10(GreenOwner, GreenFood), uniqueOwner(BlueOwner, GreenOwner, OrangeOwner, PurpleOwner, RedOwner, YellowOwner), uniqueFood(BlueFood, GreenFood, OrangeFood, PurpleFood, RedFood, YellowFood),
    write("Kidnapper is: " ), write(GreenOwner), nl,nl,
    
    write(BlueOwner), write(" BlueBag "), write(BlueFood), nl,
    write(OrangeOwner), write(" OrangeBag "), write(OrangeFood), nl,
    write(RedOwner), write(" RedBag "), write(RedFood), nl,
    write(PurpleOwner), write(" PurpleBag "), write(PurpleFood), nl,
    write(GreenOwner), write(" GreenBag "), write(GreenFood), nl,
    write(YellowOwner), write(" YellowBag "), write(YellowFood), nl, nl

    . 
