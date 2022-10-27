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