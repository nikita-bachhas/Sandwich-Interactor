 /*CZ3005 Assignment 3 - Qn 3*/
/*Subway Sandwich Interactor*/

/*user first needs to train the interpreter by using the dynamic[_/1]. command so that the predicates are able to change during execution*/
/*User needs to start off the programme by entering the following command: "ask(0),"*/
%Step 1: Meal Choice:
ask(0):-
    % The program will display a list of meal options for user to choose from.
    % User is to key in the corresponding number representing the meal option.
    write("Hi! Welcome to Subway! Please select your meal option: (Select the number corresponding to the meal)"), nl,
    write("The meal options available are -  "), nl,
    write("1 - Vegan "), nl,
    write("2 - Healthy "), nl,
    write("3 - Veggie "), nl,
    write("4 - Value "), nl,
    write("5 - Standard "), nl,
    read(Chose), % take in user's choice of meal
    assertz(meal_selected(Chose)), % assert user's meal choice and store in DB
    /* Chose is a number representing the meal option */
    meal_options(0). % Call the predicate meal_options(0) and depending on the meal choice assertion made earlier, different ingredient options will be available


%Step 2: Allowing users to select as many veggies as they want
%users select y for more, the predicate is called upon again and user will go through the same decision making processes until n is selected
%n for no more veggies, user exits the loop and returns to the main program
select_veg(FV):-
        print_options(FV), nl, % prints the list of veggie
        read(SelectedVeg), % takes in user's selection of veggie
        assert(selected_veg(SelectedVeg)), % assert user's selection of veggie into the DB
        write("To select more veggies enter y or else enter n: "), nl,
        read(SelectMore), % Determine whether user wants to select more veggie
        (SelectMore == y -> select_veg(FV);
        SelectMore == n -> write("Ok, next ingredient then!"), nl;
        select_veg(FV)).
        % if user enters 'y', the same predicate will be called again and user will go through the same decision process
        % if user enters 'n', user will exit the loop and return to the main program


%Step 3: Creating the sandwich
meal_options(0) :- (

    /* Vegan Meal */
    meal_selected(1) ->
        bread(BreadList), veg(VegList), main(MainList), topping(ToppingList), condiment(CondimentList), side(SideList), drink(DrinkList), vegan(VeganList),
        % Binding the elements of the various ingredients list into their respective variable e.g(BreadList, VegList, CondimentList, etc)

        findall(A, ( member(A, BreadList), member(A, VeganList) ), FilteredBread ),
        findall(B, ( member(B, MainList), member(B, VeganList) ), FilteredMain),
        findall(C, ( member(C, VegList), member(C, VeganList) ), FilteredVeg ),
        findall(D, ( member(D, ToppingList), member(D, VeganList) ), FilteredTopping ),
        findall(E, ( member(E, CondimentList), member(E, VeganList) ), FilteredCondiment ),
        findall(F, ( member(F, SideList), member(F, VeganList) ), FilteredSide ),
        findall(G, ( member(G, DrinkList), member(G, VeganList) ), FilteredDrink ),
        % findall predicate will compare the elements of ingredient list and the meal list e.g BreadList and VeganList and places the elements which exist in both list into a separate filtered list e.g FilteredBread, FilteredVeg

        /* 1. Program will now display the filtered list of ingredients for each meal option
        2. It then takes in user's choice
        3. And will assert the selection into database*/

        write("Please select a bread: "), nl,
        print_options(FilteredBread), nl,
        read(SelectedBread),
        assert(selected_bread(SelectedBread)),

        write("Please select a main: "), nl,
        print_options(FilteredMain), nl,
        read(SelectedMain),
        assertz(selected_main(SelectedMain)),

        write("Please select veggie"), nl,
        select_veg(FilteredVeg),
        % run the predicate select_veg(FV) to select the veg ingredient

        write("Please select a topping: "), nl,
        print_options(FilteredTopping), nl,
        read(SelectedTopping),
        assertz(selected_topping(SelectedTopping)),

        write("Please select a condiment: "), nl,
        print_options(FilteredCondiment), nl,
        read(SelectedCondiment),
        assertz(selected_condiment(SelectedCondiment)),

        write("Please select a side: "), nl,
        print_options(FilteredSide), nl,
        read(SelectedSide),
        assertz(selected_side(SelectedSide)),

        write("Please select a drink: "), nl,
        print_options(FilteredDrink), nl,
        read(SelectedDrink),
        assertz(selected_drink(SelectedDrink)),
    done(1) % displays the list of ingredients selected
    ;

    /* Healthy Meal */
    meal_selected(2) ->
        bread(BreadList), veg(VegList), main(MainList), topping(ToppingList), condiment(CondimentList), side(SideList), drink(DrinkList), healthy(HealthyList),

        findall(A, ( member(A, BreadList), member(A, HealthyList) ), FilteredBread ),
        findall(B, ( member(B, MainList), member(B, HealthyList) ), FilteredMain),
        findall(C, ( member(C, VegList), member(C, HealthyList) ), FilteredVeg ),
        findall(D, ( member(D, ToppingList), member(D, HealthyList) ), FilteredTopping ),
        findall(E, ( member(E, CondimentList), member(E, HealthyList) ), FilteredCondiment ),
        findall(F, ( member(F, SideList), member(F, HealthyList) ), FilteredSide ),
        findall(G, ( member(G, DrinkList), member(G, HealthyList) ), FilteredDrink ),

        /* 1. Program will now display the filtered list of ingredients for each meal option
        2. It then takes in user's choice
        3. And will assert the selection into database*/

        write("Please select a bread: "), nl,
        print_options(FilteredBread), nl,
        read(SelectedBread),
        assertz(selected_bread(SelectedBread)),

        write("Please select a main: "), nl,
        print_options(FilteredMain), nl,
        read(SelectedMain),
        assertz(selected_main(SelectedMain)),

        write("Please select veggie"), nl,
        select_veg(FilteredVeg),
        % run the predicate mentioned earlier to select veggie

        write("Please select a topping: "), nl,
        print_options(FilteredTopping), nl,
        read(SelectedTopping),
        assertz(selected_topping(SelectedTopping)),

        write("Please select a condiment: "), nl,
        print_options(FilteredCondiment), nl,
        read(SelectedCondiment),
        assertz(selected_condiment(SelectedCondiment)),

        write("Please select a side: "), nl,
        print_options(FilteredSide), nl,
        read(SelectedSide),
        assertz(selected_side(SelectedSide)),

        write("Please select a drink: "), nl,
        print_options(FilteredDrink), nl,
        read(SelectedDrink),
        assertz(selected_drink(SelectedDrink)),

    done(1) % displays the list of ingredients selected
    ;

    /* Veggie Meal */
    meal_selected(3) ->
        bread(BreadList), veg(VegList), main(MainList), topping(ToppingList), condiment(CondimentList), side(SideList), drink(DrinkList), veggie(VeggieList),

        findall(A, ( member(A, BreadList), member(A, VeggieList) ), FilteredBread ),
        findall(B, ( member(B, MainList), member(B, VeggieList) ), FilteredMain),
        findall(C, ( member(C, VegList), member(C, VeggieList) ), FilteredVeg ),
        findall(D, ( member(D, ToppingList), member(D, VeggieList) ), FilteredTopping ),
        findall(E, ( member(E, CondimentList), member(E, VeggieList) ), FilteredCondiment ),
        findall(F, ( member(F, SideList), member(F, VeggieList) ), FilteredSide ),
        findall(G, ( member(G, DrinkList), member(G, VeggieList) ), FilteredDrink ),

        /* 1. Program will now display the filtered list of ingredients for each meal option
        2. It then takes in user's choice
        3. And will assert the selection into database*/

        write("Please select a bread: "), nl,
        print_options(FilteredBread), nl,
        read(SelectedBread),
        assertz(selected_bread(SelectedBread)),

        write("Please select a main: "), nl,
        print_options(FilteredMain), nl,
        read(SelectedMain),
        assertz(selected_main(SelectedMain)),

        write("Please select veggie"), nl,
        select_veg(FilteredVeg),
        % run the predicate mentioned earlier to select veggie

        write("Please select a topping: "), nl,
        print_options(FilteredTopping), nl,
        read(SelectedTopping),
        assertz(selected_topping(SelectedTopping)),

        write("Please select a condiment: "), nl,
        print_options(FilteredCondiment), nl,
        read(SelectedCondiment),
        assertz(selected_condiment(SelectedCondiment)),

        write("Please select a side: "), nl,
        print_options(FilteredSide), nl,
        read(SelectedSide),
        assertz(selected_side(SelectedSide)),

        write("Please select a drink: "), nl,
        print_options(FilteredDrink),
        read(SelectedDrink),
        assertz(selected_drink(SelectedDrink)),

    done(1) % displays the list of ingredients selected
    ;

    /* Value Meal */
    meal_selected(4) ->
        bread(BreadList), veg(VegList), main(MainList), condiment(CondimentList), drink(DrinkList), value(ValueList),

        findall(A, ( member(A, BreadList), member(A, ValueList) ), FilteredBread ),
        findall(B, ( member(B, MainList), member(B, ValueList) ), FilteredMain),
        findall(C, ( member(C, VegList), member(C, ValueList) ), FilteredVeg ),
        findall(E, ( member(E, CondimentList), member(E, ValueList) ), FilteredCondiment ),
        findall(G, ( member(G, DrinkList), member(G, ValueList) ), FilteredDrink ),

        /* 1. Program will now display the filtered list of ingredients for each meal option
        2. It then takes in user's choice
        3. And will assert the selection into database*/
        
        write("Please select a bread: "), nl,
        print_options(FilteredBread), nl,
        read(SelectedBread),
        assertz(selected_bread(SelectedBread)),

        write("Please select a main: "), nl,
        print_options(FilteredMain), nl,
        read(SelectedMain),
        assertz(selected_main(SelectedMain)),

        write("Please select veggie"), nl,
        select_veg(FilteredVeg),
        % run the predicate mentioned earlier to select veggie

        write("Please select a condiment: "), nl,
        print_options(FilteredCondiment), nl,
        read(SelectedCondiment),
        assertz(selected_condiment(SelectedCondiment)),

        write("Please select a drink: "), nl,
        print_options(FilteredDrink),
        read(SelectedDrink),
        assertz(selected_drink(SelectedDrink)),

    done(1) % displays the list of ingredients selected by the user.
    ;
                        
    /* Standard Meal */
    meal_selected(5) ->
        bread(BreadList), veg(VegList), main(MainList), topping(ToppingList), condiment(CondimentList), side(SideList), drink(DrinkList), standard(StandardList),

        findall(A, ( member(A, BreadList), member(A, StandardList) ), FilteredBread ),
        findall(B, ( member(B, MainList), member(B, StandardList) ), FilteredMain),
        findall(C, ( member(C, VegList), member(C, StandardList) ), FilteredVeg ),
        findall(D, ( member(D, ToppingList), member(D, StandardList) ), FilteredTopping ),
        findall(E, ( member(E, CondimentList), member(E, StandardList) ), FilteredCondiment ),
        findall(F, ( member(F, SideList), member(F, StandardList) ), FilteredSide ),
        findall(G, ( member(G, DrinkList), member(G, StandardList) ), FilteredDrink ),

        /* 1. Program will now display the filtered list of ingredients for each meal option
        2. It then takes in user's choice
        3. And will assert the selection into database*/
                                                                
        write("Please select a bread: "), nl,
        print_options(FilteredBread), nl,
        read(SelectedBread),
        assertz(selected_bread(SelectedBread)),

        write("Please select a main: "), nl,
        print_options(FilteredMain), nl,
        read(SelectedMain),
        assertz(selected_main(SelectedMain)),

        write("Please select veggie"), nl,
        select_veg(FilteredVeg),
        % run the predicate mentioned earlier to select veggie

        write("Please select a topping: "), nl,
        print_options(FilteredTopping), nl,
        read(SelectedTopping),
        assertz(selected_topping(SelectedTopping)),

        write("Please select a condiment: "), nl,
        print_options(FilteredCondiment), nl,
        read(SelectedCondiment),
        assertz(selected_condiment(SelectedCondiment)),

        write("Please select a side: "), nl,
        print_options(FilteredSide), nl,
        read(SelectedSide),
        assertz(selected_side(SelectedSide)),

        write("Please select a drink: "), nl,
        print_options(FilteredDrink), nl,
        read(SelectedDrink),
        assertz(selected_drink(SelectedDrink)),

    done(1) % displays the list of ingredients selected
                                        
; ask(0) /* else branch, if user did not select any of the 4 options, the user will be redirected to select a meal option. */
).


%Step 4:creating the done(1) predicate to print out all the ingredients selected by the user
done(1):-
    write("Enjoy your meal!"), nl, nl,
    (\+ ( selected_bread(X), bread(Bread), member(X, Bread) ) -> write("No bread selected."), nl;
    ( write("Selected bread: "), selected_bread(X), bread(Bread), member(X, Bread), write(X), nl )),

    (\+ ( selected_main(Y), main(Main), member(Y, Main) ) -> write("No main selected."), nl;
    ( write("Selected main: "), selected_main(Y), main(Main), member(Y, Main), write(Y), nl )),

    (\+ selected_veg(_) -> write("No veggie selected."), nl;
    ( veg(VegList), findall(Z,(selected_veg(Z), member(Z, VegList)), List), write("Selected veggie: "), nl ,print_options(List) )),

    (\+ ( selected_topping(A), topping(Topping), member(A, Topping)) -> write("No topping selected."), nl;
    ( write("Selected topping: "), selected_topping(A), topping(Topping), member(A, Topping), write(A), nl )),

    (\+ ( selected_condiment(B), condiment(Condiment), member(B, Condiment) ) -> write("No condiment selected."), nl;
    ( write("Selected condiment: "), selected_condiment(B), condiment(Condiment), member(B, Condiment), write(B), nl )),

    (\+ ( selected_side(C), side(Side), member(C, Side) ) -> write("No side selected."), nl;
    ( write("Selected side: "), selected_side(C), side(Side), member(C, Side), write(C), nl )),

    (\+ ( selected_drink(D), drink(Drink), member(D, Drink) ) -> write("No drink selected."), nl;
    ( write("Selected drink: "), selected_drink(D), drink(Drink), member(D, Drink), write(D), nl )),

    retractall(selected_veg(_)),
    retractall(meal_selected(_)),
    retractall(selected_bread(_)),
    retractall(selected_main(_)),
    retractall(selected_topping(_)),
    retractall(selected_condiment(_)),
    retractall(selected_side(_)),
    retractall(selected_drink(_)),
    abort.
    % terminate the program

print_options([A|B]):- write(A), nl, print_options(B).
print_options([]).

%Step 5: Create Knowledge Base
/*A subway sandwich consists of breads, mains, veggies, condiments, addons, sides, drinks*/

bread([parmesanoregano, italianwheat, heartyitalian, multigrain, flatbread, wrap, honeyoat]).
main([chickenteriyaki, eggmayo, bologna, salami, pepperoni, chickenham, meatballs, roastbeef, steak, roastchickenbreast, turkeybreast, bacon, tuna, veggiepatty]).
veg([cucumbers, greenbellpeppers, lettuce, redonions, tomatoes, blackolives, jalapenos, pickles]).
topping([processedcheddarcheese, montereycheddarcheese, avocado, doublethemain, smokybacon, none]).
condiment([chipotlesouthwest, ranch, bbq, chilisauce, ketchup, mayonnaise, honeymustard, sweetonion]).
side([naturalchips, bbqchips, saltandvinegarchips, sourcreamandonionchips, saltchips, chocespressocookie, chocolatechipcookie, chocolatechiprainbowcookie, doublechocolatechipcookie, raspberrycheesecakecookie, whitechipmacadamianutcookie, oatmealraisincookie, peanutbuttercookie, hashbrowns, creamofmushroomsoup, brocoliandcheesesoup, creamofbrocolisoup, creamychickenanddumplingsoup, frenchonionsoup, tomatobasilsoup, chickennoodlesoup, energybar, applefruitcrisps, meijiyogurtstrawberry, meijiyogurtmango, meijiyogurtnatural]).
drink([dasanimineralwater, minutemaidpulpyorangejuice, ayatakajapanesegreentea, hottea, hotcoffee, coke, cokenosugar, sprite, mountaindew, fantaorange, rootbeer, icelemontea]).

%Knowledge base for 1 - Vegan meal
vegan([italianwheat, heartyitalian, multigrain, flatbread, wrap, veggiepatty, cucumbers, greenbellpeppers, lettuce, redonions, tomatoes, blackolives, jalapenos, pickles, avocado, doublethemain, none, ranch, bbq, chilisauce, ketchup, sweetonion, hashbrowns, frenchonionsoup, tomatobasilsoup, chickennoodlesoup, energybar, applefruitcrisps, dasanimineralwater, minutemaidpulpyorangejuice, ayatakajapanesegreentea, hottea, hotcoffee, coke, cokenosugar, sprite, mountaindew, fantaorange, rootbeer, icelemontea]).

%Knowledge base for 2 - Healthy meal
healthy([italianwheat, heartyitalian, multigrain, wrap, honeyoat, chickenteriyaki, eggmayo, pepperoni, chickenham, roastbeef, roastchickenbreast, turkeybreast, tuna, veggiepatty, cucumbers, greenbellpeppers, lettuce, redonions, tomatoes, blackolives, jalapenos, pickles, avocado, doublethemain, none, bbq, chilisauce, ketchup, honeymustard, sweetonion, creamofmushroomsoup, brocoliandcheesesoup, creamofbrocolisoup, creamychickenanddumplingsoup, frenchonionsoup, tomatobasilsoup, chickennoodlesoup, energybar, applefruitcrisps, meijiyogurtstrawberry, meijiyogurtmango, meijiyogurtnatural, dasanimineralwater, minutemaidpulpyorangejuice, ayatakajapanesegreentea, hottea, hotcoffee]).

%Knowledge base for 3 - veggie meal
veggie([parmesanoregano, italianwheat, heartyitalian, multigrain, flatbread, wrap, honeyoat, veggiepatty, cucumbers, greenbellpeppers, lettuce, redonions, tomatoes, blackolives, jalapenos, pickles, processedcheddarcheese, montereycheddarcheese, avocado, doublethemain, none, chipotlesouthwest, ranch, bbq, chilisauce, ketchup, mayonnaise, honeymustard, sweetonion, naturalchips, bbqchips, saltandvinegarchips, sourcreamandonionchips, saltchips, chocespressocookie, chocolatechipcookie, chocolatechiprainbowcookie, doublechocolatechipcookie, raspberrycheesecakecookie, whitechipmacadamianutcookie, oatmealraisincookie, peanutbuttercookie, hashbrowns, creamofmushroomsoup, brocoliandcheesesoup, creamofbrocolisoup, creamychickenanddumplingsoup, frenchonionsoup, tomatobasilsoup, chickennoodlesoup, energybar, applefruitcrisps, meijiyogurtstrawberry, meijiyogurtmango, meijiyogurtnatural, dasanimineralwater, minutemaidpulpyorangejuice, ayatakajapanesegreentea, hottea, hotcoffee, coke, cokenosugar, sprite, mountaindew, fantaorange, rootbeer, icelemontea]).

%Knowledge base for 4 - value meal
value([parmesanoregano, italianwheat, heartyitalian, multigrain, flatbread, wrap, honeyoat, chickenteriyaki, eggmayo, bologna, pepperoni, chickenham, meatballs, roastchickenbreast, bacon, tuna, veggiepatty, cucumbers, greenbellpeppers, lettuce, redonions, tomatoes, blackolives, jalapenos, pickles, chipotlesouthwest, ranch, bbq, chilisauce, ketchup, mayonnaise, honeymustard, sweetonion, dasanimineralwater, coke, sprite, icelemontea]).

%Knowledge base for 5 - standard meal
standard([parmesanoregano, italianwheat, heartyitalian, multigrain, flatbread, wrap, honeyoat, chickenteriyaki, eggmayo, bologna, salami, pepperoni, chickenham, meatballs, roastbeef, steak, roastchickenbreast, turkeybreast, bacon, tuna, veggiepatty, cucumbers, greenbellpeppers, lettuce, redonions, tomatoes, blackolives, jalapenos, pickles, processedcheddarcheese, montereycheddarcheese, avocado, doublethemain, smokybacon, none, chipotlesouthwest, ranch, bbq, chilisauce, ketchup, mayonnaise, honeymustard, sweetonion, naturalchips, bbqchips, saltandvinegarchips, sourcreamandonionchips, saltchips, chocespressocookie, chocolatechipcookie, chocolatechiprainbowcookie, doublechocolatechipcookie, raspberrycheesecakecookie, whitechipmacadamianutcookie, oatmealraisincookie, peanutbuttercookie, hashbrowns, creamofmushroomsoup, brocoliandcheesesoup, creamofbrocolisoup, creamychickenanddumplingsoup, frenchonionsoup, tomatobasilsoup, chickennoodlesoup, energybar, applefruitcrisps, meijiyogurtstrawberry, meijiyogurtmango, meijiyogurtnatural, dasanimineralwater, minutemaidpulpyorangejuice, ayatakajapanesegreentea, hottea, hotcoffee, coke, cokenosugar, sprite, mountaindew, fantaorange, rootbeer, icelemontea]).


%Step 6: Initialise ingredients with an empy assertion
% Each ingredient is "initialized" with an empty assertion
selected_main(nothing).
selected_veg(nothing).
selected_topping(nothing).
selected_condiment(nothing).
selected_side(nothing).
selected_drink(nothing).
