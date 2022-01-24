using Plots, LaTeXStrings, Statistics, LinearAlgebra

u = rand((0,1), 100)
rand(u)
w₀ = rand()
w = []
while true
    uᵐ = rand(u)
    if uᵐ == 1 and dot()