# this script calls the others while eases the access to the
# filename and saving the object via build_graph function

include("read_stsp.jl")
include("kruskal.jl")

g = build_graph("bayg29.tsp")

mst = kruskal(g)