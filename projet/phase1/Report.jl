### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 1d5f4a76-de11-4c10-a876-1fba854bb6e6
begin
	import Pkg
	Pkg.add("Plots")

	# this is to load the scripts in other files
	include("read_stsp.jl")

	# this is to print out the results on the pluto notebook
	Pkg.add("PlutoUI")
	using PlutoUI
end;

# ╔═╡ 5989fc54-3c7d-11ed-1b72-8565d1e6757f
md"""
# MTH6412B Project - Report of Phase 1

### Authors:
- [Paul A. Patience](mailto:paul-a.patience@polymtl.ca)
- [Luis Rojo-González](mailto:luis-antonio.rojo-gonzalez@polymtl.ca)

### Description:
You may find the scripts used in this notebook in the following [GitHub repository](https://github.com/LuisRojoGonzalez/MTH6412B-Project/tree/phase1/projet/phase1).

"""

# ╔═╡ 88819597-b2f8-44e2-8518-5341b7754fe6
md"""
### Procedure
"""

# ╔═╡ 5842b08b-60a9-4980-94f0-684de1d73b94
md"""
We have created the file *edge.jl* to declare the structure for an edge that has been proposed as an object described by the following sintax *Edge(From, [To, weight])*. In this regard, we see that and edge in the graph, even when symmetric, will have an origin and a destination with its respective weight/longitude.

Thereby, we modify the script *graph.jl* adding *edges::Array{Edge{T}}* to the *Graph* structure in order to include the edges to the object of class *Graph*. Furthermore, in the *read_stsp.jl* script, an edge is defined as a triplete to read the three components that define an edge within the function *read_edges()*. This is achieved by considering the third component as *parse(Float64, data[j+1])*.

After that, the object *edge_list* within the function *read_stsp.jl* is changed to be an *Array[]* instead of an *Int[]* accordingly to the edge structure previously defined. Thus, we change the second component of the former *graph_edges* to be the array *[edge[y], edge[3]]*, where *y* takes the value of 1 or 2 according to the weight format to be read.

On the other hand, to plot the graph, we update accordingly the function *plot_graph* as follows:
"""

# ╔═╡ 741fe08c-fde7-432e-aff5-489ef5f2a6d6
#=
# edge positions
for k = 1 : length(edges)
	# go to all edges going out from each node
	for j in 1 : length(edges[k])
	  # # ------------------------------------------------
	  # # this is the former version
      # # it plots the line segments in the scatter plot
      # plot!([nodes[k][1], nodes[j][1]], [nodes[k][2], nodes[j][2]],
      #       linewidth=1.5, alpha=0.75, color=:lightgray)
	  # # ------------------------------------------------
      plot!([nodes[k][1], nodes[edges[k][j][1]][1]],
		    [nodes[k][2], nodes[edges[k][j][1]][2]],
		    linewidth=1.5, alpha=0.75, color=:lightgray)
    end
end
=#

# ╔═╡ 200b3ec6-6f42-49fa-aa3c-e1e3a8a72018
md"""
Thus, we can construct graph. The illustration shows the output using an instance under the setting of **Explicit** *edge\_weight\_format*. Whereby, we proceed with the file *bayg29.tsp* and *gr21.tsp*.
"""

# ╔═╡ 033a78ea-4ca7-4d83-ab73-ca2aaa3017cc
md"""
### Illustration of *bayg29.tsp*
"""

# ╔═╡ a219fab3-846e-486a-b2b2-2c1caf7f9871
md"""
We execute the script and return both nodes and edges into two different objects named *graph\_nodes\_bayg29* and *graph\_edges\_pa561*.
"""

# ╔═╡ 644a4dc5-057e-4bf2-bd36-d27fa8f70bf9
graph_nodes_bayg29, graph_edges_bayg29 = read_stsp("/Users/luisrojo/Desktop/OneDrive - usach.cl/PhD/Courses_Polymtl/OR Algorithms/Laboratory/MTH6412B-Project/instances/stsp/bayg29.tsp");

# ╔═╡ 62a8dfa7-af62-45ba-87d6-315c88d845b0
md"""
After procedure is done, we could inspect the results. For instance, the following output shows the edge connecting node 1 with node 2 and its weight.
"""

# ╔═╡ d885d7ff-0026-4180-8089-983ee4aa15bc
with_terminal() do
	for i in 1 : length(graph_edges_bayg29)
		for j in 1 : length(graph_edges_bayg29[i])
			from = i
			to = graph_edges_bayg29[i][j][1]
			weight = graph_edges_bayg29[i][j][2]
			if i <= 10 && j <= 10 && i != j
				println("The edge that connects node $from with node $to has a weight of $weight")
			else
				break
			end
		end
	end
end

# ╔═╡ 5e9338d1-6e7f-449e-803e-40c0f19ebffe
plot_graph(graph_nodes_bayg29, graph_edges_bayg29)

# ╔═╡ b88358a4-e926-401a-86d3-b73491d42fea
md"""
### Illustration of *pa561.tsp*
"""

# ╔═╡ 91f90d97-bb99-4a03-82c3-4f1bc07c51c5
graph_nodes_pa561, graph_edges_pa561 = read_stsp("/Users/luisrojo/Desktop/OneDrive - usach.cl/PhD/Courses_Polymtl/OR Algorithms/Laboratory/MTH6412B-Project/instances/stsp/pa561.tsp");

# ╔═╡ 226b174f-9383-463e-96f8-722c5d3910a4
with_terminal() do
	for i in 1 : length(graph_edges_pa561)
		for j in 1 : length(graph_edges_pa561[i])
			from = i
			to = graph_edges_pa561[i][j][1]
			weight = graph_edges_pa561[i][j][2]
			if i <= 10 && j <= 10 && i != j
				println("The edge that connects node $from with node $to has a weight of $weight")
			else
				break
			end
		end
	end
end

# ╔═╡ 3bf3e2ea-4c39-4bb5-838c-5c95cc89e5e1
plot_graph(graph_nodes_pa561, graph_edges_pa561)

# ╔═╡ Cell order:
# ╟─5989fc54-3c7d-11ed-1b72-8565d1e6757f
# ╠═88819597-b2f8-44e2-8518-5341b7754fe6
# ╟─5842b08b-60a9-4980-94f0-684de1d73b94
# ╠═741fe08c-fde7-432e-aff5-489ef5f2a6d6
# ╠═1d5f4a76-de11-4c10-a876-1fba854bb6e6
# ╟─200b3ec6-6f42-49fa-aa3c-e1e3a8a72018
# ╟─033a78ea-4ca7-4d83-ab73-ca2aaa3017cc
# ╟─a219fab3-846e-486a-b2b2-2c1caf7f9871
# ╠═644a4dc5-057e-4bf2-bd36-d27fa8f70bf9
# ╟─62a8dfa7-af62-45ba-87d6-315c88d845b0
# ╠═d885d7ff-0026-4180-8089-983ee4aa15bc
# ╠═5e9338d1-6e7f-449e-803e-40c0f19ebffe
# ╟─b88358a4-e926-401a-86d3-b73491d42fea
# ╠═91f90d97-bb99-4a03-82c3-4f1bc07c51c5
# ╠═226b174f-9383-463e-96f8-722c5d3910a4
# ╠═3bf3e2ea-4c39-4bb5-838c-5c95cc89e5e1
