# this script calls the others while eases the access to the
# filename and saving the object via build_graph function

include("read_stsp.jl")
include("kruskal.jl")

# g = build_graph("bays29.tsp")

# mst = kruskal(g)

# @show mst["MST"]
# @show mst["Distance"]

####################################
# create the graph for testing
####################################

test_1 = build_graph("Test_1.tsp")

# modify the graph to drop inexisting arcs
keep_edges = test_1["Weights"] .!= 1000
test_1["Weights"] = test_1["Weights"][keep_edges]
test_1["Edges_v"] = test_1["Edges_v"][keep_edges]

test_1_mst = kruskal(test_1)
@show test_1_mst["MST"]
@show test_1_mst["Distance"]