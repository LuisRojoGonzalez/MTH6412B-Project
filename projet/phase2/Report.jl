### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 067980d9-302d-404f-b657-1c5ddcf57a9f
begin
	import Pkg
	Pkg.add("Plots")
	
	include("read_stsp.jl")
	include("kruskal.jl")
end

# ╔═╡ 5989fc54-3c7d-11ed-1b72-8565d1e6757f
md"""
# MTH6412B Project - Report of Phase 2

### Authors:
- [Paul A. Patience](mailto:paul-a.patience@polymtl.ca)
- [Luis Rojo-González](mailto:luis-antonio.rojo-gonzalez@polymtl.ca)

### Description:
You may find the scripts used in this notebook in the following [GitHub repository](https://github.com/LuisRojoGonzalez/MTH6412B-Project/tree/phase2/projet/phase2).

"""

# ╔═╡ 88819597-b2f8-44e2-8518-5341b7754fe6
md"""
### Procedure
"""

# ╔═╡ 5842b08b-60a9-4980-94f0-684de1d73b94
md"""
We have created the file *kruskal.jl* which implement the algorithm described in the book **Introduction to algorithms (3eds.)** in pp. 631. Furthermore, the file **main.jl** is made such that the graph is constructed and then applies the function **kruskal** to it and assign the results into an object.

The function returns the edges within the minimum spanning tree and the distance product of the summation over its edges. This procedure is shown for the **bays29.tsp** instance as follows:
"""

# ╔═╡ 274deba2-e6d4-4bf0-bf64-7c797ae847eb
md"""
Thus, to get the results we create the graph via **g = build_graph("bays29.tsp)** and then the minimum spanning tree through **mst = kruskal(g)**. Here, the attributes are retrieved via **mst["MST"]** for the componentes of the tree and **mst["Distance"]** for the total distance in the tree.
"""

# ╔═╡ 195ab371-5839-40a3-a914-3f989297b5ac
begin
	g = build_graph("bays29.tsp")
	mst = kruskal(g)
end;

# ╔═╡ a3b8e74b-d906-4a5f-8691-1121ad55643b
mst["MST"]

# ╔═╡ 954f4038-8523-4111-b0ae-03501da9e2e4
mst["Distance"]

# ╔═╡ Cell order:
# ╠═5989fc54-3c7d-11ed-1b72-8565d1e6757f
# ╠═88819597-b2f8-44e2-8518-5341b7754fe6
# ╠═5842b08b-60a9-4980-94f0-684de1d73b94
# ╠═067980d9-302d-404f-b657-1c5ddcf57a9f
# ╠═274deba2-e6d4-4bf0-bf64-7c797ae847eb
# ╠═195ab371-5839-40a3-a914-3f989297b5ac
# ╠═a3b8e74b-d906-4a5f-8691-1121ad55643b
# ╠═954f4038-8523-4111-b0ae-03501da9e2e4
