/*Task1*/
/*Depth-First Search*/
/*Use find_path_with_errors(O, D, Path, Cost). to check task 1*/

connected(outside, porch1, 1).
connected(porch1, outside, 1).
connected(porch1, kitchen, 1).
connected(kitchen, porch1, 1).
connected(corridor, bedroom, 2).
connected(bedroom, corridor, 2).
connected(corridor, wc, 2).
connected(wc, corridor, 2).
connected(corridor, master_bedroom, 2).
connected(master_bedroom, corridor, 2).
connected(corridor, living_room, 1).
connected(living_room, corridor, 1).
connected(kitchen, living_room, 3).
connected(living_room, kitchen, 3).
connected(living_room, porch2, 5).
connected(porch2, living_room, 5).
connected(porch2, outside, 1).
connected(outside, porch2, 1).

location_exists(Location) :-
    (connected(Location, _, _) ; connected(_, Location, _)), !.

ensure_location_exists(O, D) :-
    location_exists(O),
    location_exists(D),
    !. 

ensure_location_exists(O, _) :-
    \+ location_exists(O),
    format('Error: Origin location ~w does not exist.~n', [O]),
    fail.

ensure_location_exists(_, D) :-
    \+ location_exists(D),
    format('Error: Destination location ~w does not exist.~n', [D]),
    fail.

find_path_with_errors(O, D, Path, Cost) :-
    ensure_location_exists(O, D),
    search(O, D, [], 0, RevPath, Cost),
    reverse(RevPath, Path).


search(D, D, V, AccCost, [(D, AccCost)|V], AccCost).
search(O, D, V, AccCost, Path, TotalCost) :-
    connected(O, Next, StepCost),
    \+ member((Next, _), V),  % Prevent cycles
    NewAccCost is AccCost + StepCost, 
    search(Next, D, [(O, AccCost)|V], NewAccCost, Path, TotalCost).



/*Task2*/
/*Use produce_all_combinations(O1, O2, D, AllCombinedPaths). to check task2*/

find_all_paths(O, D, Paths) :-
    findall(Path-Cost, (search(O, D, [], 0, RevPath, Cost), reverse(RevPath, Path)), Paths).


combine_paths(Paths1, Paths2, CombinedPaths) :-
    findall((P1, P2), (member(P1, Paths1), member(P2, Paths2)), CombinedPaths).

produce_all_combinations(O1, O2, D, AllCombinedPaths) :-
    find_all_paths(O1, D, Paths1),  
    find_all_paths(O2, D, Paths2),  
    combine_paths(Paths1, Paths2, AllCombinedPaths).  


/*Task3*/
/*Use produce_combinations_same_cost(O1, O2, D, AllCombinedPathsSorted). to test task 3*/

find_all_paths_with_costs(O, D, Paths) :-
    findall(Path-Cost, (search(O, D, [], 0, RevPath, Cost), reverse(RevPath, Path)), Paths).


produce_combinations_same_cost(O1, O2, D, AllCombinedPathsSorted) :-
    find_all_paths_with_costs(O1, D, Paths1),  
    find_all_paths_with_costs(O2, D, Paths2),  
    findall((Cost, Path1, Path2), (
        member(Path1-Cost1, Paths1),
        member(Path2-Cost2, Paths2),
        Cost1 == Cost2,
        Cost = Cost1
    ), CombinedPaths),
    sort(CombinedPaths, SortedCombinedPaths),
    findall((Path1-Cost, Path2-Cost), member((Cost, Path1, Path2), SortedCombinedPaths), AllCombinedPathsSorted).