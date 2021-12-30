using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges
cd(dirname(@__FILE__))
file = matopen("Q2_data.mat")
vars = matread("Q2_data.mat")
####All
spike_list=[[] for i in 1:100]
for i in 1:100
    for j in 1:500
        if vars["trials"][i,j]==1
            push!(spike_list[i], j/2000 - 0.05)
        end
    end
end
plot([0,0], [0, 100], color=:red, label="Spike Time")
for i in 1: 100
    scatter!(spike_list[i],[i for j in 1: length(spike_list[i])], markershape=:vline, label=nothing)
end
plot!(title=L"Raster\ Plot\ For\ All\ Trials", xlabel=L"Time\ (sec)",ylabel=L"The\ Test\ Number", label=nothing, dpi=400)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/All_RasterPlot_plot.pdf")
####First Test
plot(plot([0,0], [0, 2], color=:red, label="Spike Time"))
scatter!(spike_list[1],[1 for j in 1: length(spike_list[1])], markershape=:vline, markercolor=:black,
        xlabel=L"Time(sec)", ylabel=L"The\ Test\ Number", title=L"Raster\ Plot\ For\ the\ First\ Trial",dpi=400, label=nothing)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/First_RasterPlot_plot.pdf")
####First 20 tests
plot([0,0], [0, 20], color=:red, label="Spike Time")
for i in 1: 20
    scatter!(spike_list[i],[i for j in 1: length(spike_list[i])], markershape=:vline, label=nothing)
end
plot!(title=L"Raster\ Plot\ (First\ 20\ Tests)", xlabel=L"Time\ (sec)",ylabel=L"The\ Test\ Number", dpi=400)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/f20_RasterPlot_plot.pdf")
close(file)