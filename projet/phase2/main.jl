# this script calls the others while eases the access to the
# filename and saving the object via build_graph function

# path where the project is allocated
#path = "/Users/luisrojo/Library/CloudStorage/OneDrive-usach.cl/PhD/Courses_Polymtl/OR Algorithms/Laboratory/MTH6412B-Project/"

# include the other scripts
#include("$(path)/project/phase2/read_stsp.jl")
#include("$(path)/project/phase2/kruskal.jl")
include("read_stsp.jl")
include("kruskal.jl")

####################################
### create the graph for testing ###
####################################

test_1 = build_graph("Test_1.tsp")

# modify the graph to drop inexisting arcs
keep_edges = test_1["Weights"] .!= 1000
test_1["Weights"] = test_1["Weights"][keep_edges]
test_1["Edges_v"] = test_1["Edges_v"][keep_edges]

# construct the spanning tree
test_1_mst = kruskal(test_1)

######################
#### Test section ####
######################
using Test

@testset "Properties and known solution of the MST" begin
    @test length(test_1_mst["MST"]) == length(test_1["Nodes"]) - 1
    @test test_1_mst["Distance"] == 37 
end