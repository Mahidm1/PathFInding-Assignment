# CS2910 Pathfinding Assignment

This repository contains the coursework for the CS2910 module, focusing on implementing uninformed search strategies in Prolog. The project demonstrates the use of Depth-First Search (DFS) for pathfinding, combining paths from multiple origins to a common destination, and incorporating costs into the search algorithm.


## Project Overview
This project implements various pathfinding algorithms in Prolog. The main objectives are:
- To find paths between locations using Depth-First Search (DFS).
- To combine paths from two different origins to a common destination.
- To incorporate costs into the pathfinding algorithm and find cost-effective paths.

## Tasks

### Task 1: Depth-First Search (DFS)
- **Function:** `find_path_with_errors(O, D, Path, Cost)`
- **Description:** Finds a path between two locations, ensuring both locations exist and handling errors for invalid inputs. Uses DFS to search for paths, avoiding cycles and accumulating costs.
- **Example Query:** `find_path_with_errors(outside, kitchen, Path, Cost).`

### Task 2: Combining Paths
- **Function:** `produce_all_combinations(O1, O2, D, AllCombinedPaths)`
- **Description:** Combines paths from two origins to a common destination. Produces all possible combinations of paths and ensures the functionality by using `findall/3` and `member/2`.
- **Example Query:** `produce_all_combinations(outside, porch1, kitchen, AllCombinedPaths).`

### Task 3: Paths with Costs
- **Modification:** Includes costs for each connection and returns the total cost of a path.
- **Description:** Integrates costs into the pathfinding process, sorting paths by cost and ensuring the cheapest paths are considered first. Extends to combine paths with equal total costs from different origins.
- **Example Query:** `find_path_with_errors(outside, kitchen, Path, Cost).`

## Usage
1. Clone the repository:
   ```
   git clone https://github.com/Mahidm1/CS2910-Pathfinding-Assignment.git
   ```

2. Navigate to the project directory:
   ```
   cd CS2910-Pathfinding-Assignment
   ```

3. Load the Prolog file in SWI-Prolog:
   ```
   ?- [cs2910CW2].
   ```
