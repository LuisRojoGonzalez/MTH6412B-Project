### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ ee624fba-3346-49c3-814d-c1c97a05709b
begin
	import Pkg
	Pkg.add("Plots")
	
	include("read_stsp.jl")
	include("kruskal.jl")
end;

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

The function returns the edges within the minimum spanning tree and the distance product of the summation over its edges. This procedure is shown for the instance **Test_1.tsp** which corresponds to the graph seen in class.
"""

# ╔═╡ 274deba2-e6d4-4bf0-bf64-7c797ae847eb
md"""
Thus, to get the results we create the graph via **test\_1 = build\_graph("Test\_1.tsp)** and then the minimum spanning tree through **test\_1\_mst = kruskal(test\_1)**. Here, the attributes are retrieved via **test\_1["MST"]** for the componentes of the tree and **test\_1["Distance"]** for the total distance in the tree.
"""

# ╔═╡ 195ab371-5839-40a3-a914-3f989297b5ac
begin
	test_1 = build_graph("Test_1.tsp")
	test_1_mst = kruskal(test_1)
end;

# ╔═╡ a50b5b53-1ff9-4a91-bc45-e542e1bfb65d
md"""
Furthermore, a test set is included since the response is known for this instance. In this regard, we know that the resulting minimum spanning tree must have eight edges and has a cost (or distance) equals to 37.
"""

# ╔═╡ dc74781d-b91f-4d62-a9f1-1141dbd8f386
length(test_1_mst["MST"]) == length(test_1["Nodes"]) - 1

# ╔═╡ 5cd37da3-a64c-4d37-b7ae-8392b1ccc81f
test_1_mst["Distance"] == 37 

# ╔═╡ bef58f07-e53a-4bbd-b97c-0df03f129f97
md"""
As we can see, both conditions are satisfied. Therefore, we may claim that the algorithm implemented actually generate a minimum spanning tree.

Then, we can construct the minimum spanning tree for another instance whose solution is not know. In this case, we test this with a full matrix instance. In particular, we show the results for the **bays29.tsp** instance.
"""

# ╔═╡ a3b8e74b-d906-4a5f-8691-1121ad55643b
begin
	bays29 = build_graph("bays29.tsp")
	bays29_mst = kruskal(bays29)
end;

# ╔═╡ 1dfc2c47-79a8-4b0e-bf6a-de4544bcf243
md"""
We can see here the edges that are part of the minimum spanning tree,
"""

# ╔═╡ 954f4038-8523-4111-b0ae-03501da9e2e4
bays29_mst["MST"]

# ╔═╡ 5faced11-f9a6-4004-9b08-783bddc5e0d4
md"""
and its distance or cost is
"""

# ╔═╡ 1964bf11-5e9a-4cdb-b504-059419bfc8d0
bays29_mst["Distance"]

# ╔═╡ Cell order:
# ╟─5989fc54-3c7d-11ed-1b72-8565d1e6757f
# ╟─88819597-b2f8-44e2-8518-5341b7754fe6
# ╟─5842b08b-60a9-4980-94f0-684de1d73b94
# ╟─274deba2-e6d4-4bf0-bf64-7c797ae847eb
# ╟─ee624fba-3346-49c3-814d-c1c97a05709b
# ╠═195ab371-5839-40a3-a914-3f989297b5ac
# ╟─a50b5b53-1ff9-4a91-bc45-e542e1bfb65d
# ╠═dc74781d-b91f-4d62-a9f1-1141dbd8f386
# ╠═5cd37da3-a64c-4d37-b7ae-8392b1ccc81f
# ╟─bef58f07-e53a-4bbd-b97c-0df03f129f97
# ╠═a3b8e74b-d906-4a5f-8691-1121ad55643b
# ╟─1dfc2c47-79a8-4b0e-bf6a-de4544bcf243
# ╟─954f4038-8523-4111-b0ae-03501da9e2e4
# ╟─5faced11-f9a6-4004-9b08-783bddc5e0d4
# ╟─1964bf11-5e9a-4cdb-b504-059419bfc8d0
