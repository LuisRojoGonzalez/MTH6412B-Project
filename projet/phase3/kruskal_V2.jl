# This finds the parent of the node we are looking into
# following the idea of "path compression technique"
function path_compression!(parent, i)
	if parent[i] != i
	    # changes the parent relationship accordingly to
	    # path compression
        parent[i] = path_compression!(parent, parent[i])
    end
	return parent[i]
end

# This makes the union of two trees according to their rank
# following the idea of "union by rank"
function union_rank!(parent, rank, x, y)
	# Attach smaller rank tree under root of
	# high rank tree (Union by Rank)
	if rank[x] < rank[y]
		parent[x] = y
    elseif rank[x] > rank[y]
		parent[y] = x
        # If ranks are same, then make one as root
        # and increment its rank by one
	else
	    parent[y] = x
		rank[x] += 1
    end
    return parent, rank
end
	
# The main function to construct MST using Kruskal's
# algorithm
function kruskal_v2(graph)
    
    mstEdges = [] # This will store the resultant MST
    mstWeights = [] # This will store the resultant MST

	##### Step 1: Sort all the edges
    
    # it gets the index in which ordering the edges
    sortindex = sortperm(graph["Weights"])

    # Create V subsets with single elements
	parent = [i for i in 1:length(graph["Nodes"])]
	rank = [0 for i in 1:length(graph["Nodes"])]

    # initializes the indexes
    i, e = 1, 0

	# Number of edges to be taken is equal to V-1
	while e < length(graph["Nodes"]) - 1

		# Step 2: Pick the smallest edge
		u = graph["Edges_v"][sortindex[i]][1]
        v = graph["Edges_v"][sortindex[i]][2]
        w = graph["Weights"][sortindex[i]]
        
        # increases the counter
		i = i + 1
		x = path_compression!(parent, u)
		y = path_compression!(parent, v)

		# If including this edge doesn't
		# cause cycle, then include it in result
		# and increment the index of result
		# for next edge
		if x != y
			e = e + 1
			push!(mstEdges, [u, v])
            push!(mstWeights, w)
			union_rank!(parent, rank, x, y)
		    # Else discard the edge
        end
    end

    return Dict("MST" => mstEdges, "Distance" => mstWeights)
end