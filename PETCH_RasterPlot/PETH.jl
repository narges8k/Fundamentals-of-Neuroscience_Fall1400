using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges
cd(dirname(@__FILE__))
file = matopen("Q2_data.mat")
vars = matread("Q2_data.mat")
####Δt=10ms / L=20
histo_list=[]
for i in 1:100
    for j in 1:500
        if vars["trials"][i,j]==1
            push!(histo_list, j/2000 - 0.05)
        end
    end
end

histogram(histo_list,bins=25,linecolor = :transparent,xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=10ms", label=nothing, dpi=400, color=:turquoise3)
plot!([0,0], [0,700], color=:red, label="Spike Time")
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_10ms.pdf")
####Δt=2.5 / L=5
histogram(histo_list, bins=100,linecolor = :transparent, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=10ms", label=nothing, dpi=400, color=:turquoise3)
plot!([0,0], [0,400], color=:red, label="Spike Time")
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_5L.pdf")
####Δt=17.5 / L=35
histogram(histo_list, bins=14,linecolor = :transparent, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=10ms", label=nothing, dpi=400, color=:turquoise3)
plot!([0,0], [0,1000], color=:red, label="Spike Time")
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_17.5ms.pdf")
close(file)
