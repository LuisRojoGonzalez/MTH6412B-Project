import Base

"""
This script contains the kruskal algorithm to create a minimum spanning tree of a undirected graph. The following
implementation is based on pseudo-code in Introcution to algorithms (3 eds.) section 23.2 pp. 631.
"""

function kruskal(g)#(g::Graph{T})
    # we create the MST object
    A = []
    
    # initializes the sum of the weights
    total = 0
    
    # initialize the set of trees
    #tree_set = [[i] for i in 1:length(g["Edges_m"])]
    tree_set = [[i] for i in 1:length(g["Nodes"])]
    
    # it gets the index in which ordering the edges
    sortindex = sortperm(g["Weights"])
    
    # initializes the counter
    index = 0
    
    # we know that there are going to be |V|-1 edges
    while length(A) < length(g["Nodes"]) - 1
        index += 1
        # gets the edge
        edge = g["Edges_v"][sortindex[index]] # replace sortindex[1] with the counter in the loop
        u, v = edge[1], edge[2]
        
        # checks whether the trees are the same
        if !isequal(tree_set[u], tree_set[v])
            # adds the edge to the MST and its corresponding weight w
            w = g["Weights"][sortindex[index]]
            push!(A, [u,v,w])
            
            # makes the union of the sets
            push!(tree_set[u], v)
            push!(tree_set[v], u)
            
            # updates the sum of the weights
            total = total + w
        end
    end
    # it returns the MST construction and the total distance in it
    return Dict("MST" => A, "Distance" => total)
end