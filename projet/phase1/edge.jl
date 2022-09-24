import Base.show

""" Abstract type for the edges of the graph."""
abstract type AbstractEdge{T} end

"""Type representing the edges of the graph.

Exemple:

        edge = Edge(From, [To, weight])
        edge = Edge("Montreal", ["Vancouver", 2635])
        edge = Edge("Montreal", ["Boston", 1768])

"""
mutable struct Edge{T} <: AbstractEdge{T}
  from::String
  to::String
  data::T
end

# accordingly, each edge has an associated origin (from),
# destination (to) and a weight (data)
# the latter is regardless the symmetry of the problem

"""Get the origin of the edge."""
from(edge::AbstractEdge) = edge.from

"""Get the destination of the edge."""
to(edge::AbstractEdge) = edge.to

"""Get the weight of the node."""
data(edge::AbstractEdge) = edge.data

"""It characterizes the edges."""
function show(edge::AbstractEdge)
  println("Edge from ", from(edge), " to ", to(edge), ", weight: ", data(edge))
end
