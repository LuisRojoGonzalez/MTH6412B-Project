import Base.show

include("./edge.jl")
"""Type abstrait dont d'autres types de graphes dériveront."""
abstract type AbstractGraph{T} end

"""Type representant un graphe comme un ensemble de noeuds.

Exemple :

    node1 = Node("Joe", 3.14)
    node2 = Node("Steve", exp(1))
    node3 = Node("Jill", 4.12)
    G = Graph("Ick", [node1, node2, node3])

Attention, tous les noeuds doivent avoir des données de même type.
"""

mutable struct Graph{T} <: AbstractGraph{T}
  name::String
  nodes::Vector{Node{T}}
  # this has been added to consider an edge
  edges::Vector{Edge{T}}
end

"""This adds a node to the graph,"""
function add_node!(graph::Graph{T}, node::Node{T}) where T
  push!(graph.nodes, node)
  graph
end

"""while this adds the edges to it."""
function add_edge!(graph::Graph{T}, edge::Edge{T}) where T
  push!(graph.edges,edge)
  graph
end

# again, a graph has three elements, a given name, nodes and edges

"""Renvoie le nom du graphe."""
name(graph::AbstractGraph) = graph.name

"""Renvoie la liste des noeuds du graphe."""
nodes(graph::AbstractGraph) = graph.nodes

# # this is useless in our new structure
# # added to get the list of edges
# """Renvoie la liste des aretes du graphe."""
# nodes(graph::AbstractGraph) = graph.edges

"""Renvoie le nombre de noeuds du graphe."""
nb_nodes(graph::AbstractGraph) = length(graph.nodes)

"""Renvoie le nombre de edges du graphe."""
edges(graph::AbstractGraph) = graph.edges

# added to get the number of edges in the graph
# this might be useful when non-complete graphs are considered
"""Renvoie le nombre de aretes du graphe."""
nb_edges(graph::AbstractGraph) = length(graph.edges)

"""Affiche un graphe"""
function show(graph::Graph)
  println("Graph ", name(graph), " has ", nb_nodes(graph), " nodes and", nb_edges(graph), " edges.")
  for node in nodes(graph)
    show(node)
  end
  # added to print the edges
  for edge in edges(graph)
    show(edge)
  end
end
