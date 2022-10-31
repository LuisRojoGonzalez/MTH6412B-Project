include("../phase1/read_stsp.jl")

"""
This script contains prim's algorithm to get a minimum spanning tree considering the adjacency matrix and offer the possibility
of selecting the first node to be included in the tree. Otherwise, if the first node is not especified, then a random selection
is made.
"""
function prim(graph, n_start = nothing)

    # create the adjacency matrix
    A = graph["Adj_matrix"]
    
    # check whether a starting node is especified, if not then select a random node to start
    n_input = isnothing(n_start) ? rand((range(1, length = size(A, 1)))) : n_start
    
    # create a array to track selected vertex selected will become true otherwise false
    selected = [false for i in range(1, length = size(A, 1))]
    
    # the starting number of edges in the tree is 0
    n_edge = 0
    
    """
    If the starting node is not especified, then select a random start and set its value to true in the 'selected' array.
    """
    # choose 0th vertex and make it true
    selected[n_input] = true
    
    # array to save the edges in the mst
    mstEdges = []
    # array to save the weights in the mst
    mstWeights = []

    # the number of egde in minimum spanning tree will be always less than (|V| - 1), where V is number of vertices in graph
    while n_edge < size(A, 1) - 1
        # For every vertex in the set 'selected', find the all adjacent vertices, calculate the distance from the vertex selected.
        # If the vertex is already in the set 'selected', discard it otherwise. Repeat the process by picking up the closest
        # vertex to previously selected vertex.

        # set the starting distance
        minimum = Inf
        x = 1
        y = 1
        for i in 1:size(A, 1)
            if selected[i]
                for j in 1:size(A, 1)
                    if !selected[j]
                        # not in selected and there is an edge
                        if minimum > A[i,j]
                            minimum = A[i,j]
                            x = i
                            y = j
                        end
                    end
                end
            end
        end
        
        # add the edge
        push!(mstEdges, [x,y])
        # add the weight
        push!(mstWeights, A[x,y])
        
        #println("$(x) - $(y): $(A[x,y])")
        selected[y] = true
        n_edge += 1
    end

    return Dict("MST" => mstEdges, "Distance" => mstWeights)
end

