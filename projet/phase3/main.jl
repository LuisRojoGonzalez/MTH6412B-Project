include("../phase2/kruskal.jl") # calls prim's algorithm
include("prim.jl") # calls prim's algorithm
include("kruskal_V2.jl") # calls kruskal's algorithm

"""
This files contains the example on how to construct a minimum spanning tree using either the Kruskal's or Prim's algorithm.
If Kruskal's algorithm is used, then the user may decide to use an acceleration heuristic. Otherwise, the classic Kruskal's
algorithm is used. On the other hand, if Prim's algorithm is used, then the user may indicate the node to start constructing the
minimum spanning tree; otherwise, a random selection is performed.
"""

##################################
#### Graph input instructions ####
##################################

# read the data accordingly
test_1 = build_graph("Test_1.tsp")
# modify the graph to drop inexisting arcs
keep_edges = test_1["Weights"] .!= 1000
test_1["Weights"] = test_1["Weights"][keep_edges]
test_1["Edges_v"] = test_1["Edges_v"][keep_edges]

mstKruskal = kruskal(test_1)
mstKruskal_V2 = kruskal_v2(test_1)
mstPrim = prim(test_1)

######################
#### Test section ####
######################
using Test

@testset "Properties and known solution of the MST" begin
    @testset "Kruskal algorithm with no acceleration heuristics" begin
        @test length(mstKruskal["MST"]) == length(test_1["Nodes"]) - 1
        @test sum(mstKruskal["Distance"]) == 37
    end
    @testset "Kruskal algorithm with acceleration heuristics" begin
        @test length(mstKruskal_V2["MST"]) == length(test_1["Nodes"]) - 1
        @test sum(mstKruskal_V2["Distance"]) == 37
    end
    @testset "Prim algorithm" begin
        @test length(mstPrim["MST"]) == length(test_1["Nodes"]) - 1
        @test sum(mstPrim["Distance"]) == 37
    end
end

# this section will test the instances wo chekc the running times with other instances
instances = [item for item in walkdir("../../instances/stsp")][1][3]

# install dataframes library
using Pkg
Pkg.add("DataFrames")

# create the object to save the results
using DataFrames
results = DataFrame(Nodes = Int[], Kruskal = [], Kruskal_2 = [], Prim = [])

for instance in instances
    if instance in ["brazil58.tsp", "brg180.tsp", "fri26.tsp", "gr17.tsp", "gr21.tsp", "gr24.tsp", "gr48.tsp", "hk48.tsp", "swiss42.tsp"]
        continue
    end

    println("Solving instance $(instance)")
    graph = build_graph(instance)

    # measures the elapsed time
    time_kruskal = (@timed kruskal(graph))[2]
    time_kruskal_2 = (@timed kruskal_v2(graph))[2]
    time_prim = (@timed prim(graph))[2]

    # create mst with different techniques and add the times to the results object
    push!(results, [length(graph["Nodes"]), time_kruskal, time_kruskal_2, time_prim])

end

Pkg.add("StatsPlots")
using StatsPlots

@df results plot(:Nodes, [:Kruskal :Kruskal_2 :Prim], color = [:red :blue :green],
                 title = "Running times vs number of nodes")