"""
This script contains the kruskal algorithm to create a minimum spanning tree of a undirected graph. The following
implementation is based on pseudo-code in Introcution to algorithms (3 eds.) section 23.2 pp. 631.
"""
function kruskal(graph)#(g::Graph{T}) where T
    
    # initialize the MST object
    mstEdges = []

    # initialize the distance or cost of the minimum spanning tree (MST)
    mstWeights = []

    # it gets the index in which ordering the edges
    sortindex = sortperm(graph["Weights"])

    # creates the list of parents
    parent = [i for i in 1:length(graph["Nodes"])]

    # recursive function to find where the node comes from
    function trace_parent(i)
        counter = 0
        if i != parent[i]
            parent[i] = trace_parent(parent[i])
        end
        return parent[i]
    end
    
    for index in sortindex

        # gets the parent of the origin node
        parent_a = trace_parent(graph["Edges_v"][index][1][1])

        # gets the parent of the destination node
        parent_b = trace_parent(graph["Edges_v"][index][2][1])

        # if they belong to different trees then
        if parent_a != parent_b

            # update the tree by adding the edge
            push!(mstEdges, graph["Edges_v"][index])

            # add the cost to the current MST
            push!(mstWeights, graph["Weights"][index])

            # update the list of parents
            parent[parent_a] = parent_b

        end
    
    end

    return Dict("MST" => mstEdges, "Distance" => mstWeights)

end