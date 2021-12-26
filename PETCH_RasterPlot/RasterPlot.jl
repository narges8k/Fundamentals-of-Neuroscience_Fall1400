using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges
cd(dirname(@__FILE__))
file = matopen("Q2_data.mat")
vars = matread("Q2_data.mat")
vars
vars["trials"]
####All
spike_list=[[] for i in 1:100]
for i in 1:100
    for j in 1:500
        if vars["trials"][i,j]==1
            push!(spike_list[i], j)
        end
    end
end
scatter()
for i in 1: 100
    scatter!(spike_list[i],[i for j in 1: length(spike_list[i])], markershape=:vline)
end
plot!(title=L"Raster Plot", xlabel=L"Time\ (sec)",ylabel=L"The\ Test\ Number", legend=false, dpi=400)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/All_RasterPlot_plot.pdf")
####First Test
scatter()
scatter!(spike_list[1],[1 for j in 1: length(spike_list[1])], markershape=:vline, markercolor=:black,
        xlabel=L"Time(sec)", ylabel=L"The\ Test\ Number", title=L"Raster\ Plot", label=L"The\ First\ Test",dpi=400)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/First_RasterPlot_plot.pdf")
####First 20 tests
scatter()
for i in 1: 20
    scatter!(spike_list[i],[i for j in 1: length(spike_list[i])], markershape=:vline)
end
plot!(title=L"Raster\ Plot\ (First\ 20\ Tests)", xlabel=L"Time\ (sec)",ylabel=L"The\ Test\ Number", legend=false, dpi=400)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/f20_RasterPlot_plot.pdf")
close(file)