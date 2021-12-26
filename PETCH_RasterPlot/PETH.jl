using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges, PlotlyJS
file = matopen("Q2_data.mat")
vars = matread("Q2_data.mat")
####Δt=10ms / L=20
Δt_10ms_list=[[] for i in 1:100]
for row in 1:100
    for slice in 1:20:500
        push!(Δt_10ms_list[row], sum(vars["trials"][row,slice:slice+19])/10)
    end
end

avg_firing_rate=[]
num=1
for rate in 1:25
    for i in 1:10
        push!(avg_firing_rate, mean(Δt_10ms_list[1:100][num]))
    end
    num+=1
end
avg_firing_rate
plot([0,0], [0.15, 0.5], color=:red, label=L"t=0")
plot!([1:250],avg_firing_rate, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=10ms", label=nothing, dpi=400, color=:turquoise3)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_10ms.pdf")
####Δt=5 / L=10
Δt_5ms_list=[[] for i in 1:100]
for row in 1:100
    for slice in 1:10:500
        push!(Δt_5ms_list[row], sum(vars["trials"][row,slice:slice+9])/5)
    end
end
Δt_5ms_list
avg_firing_rate2=[]
num=1
for rate in 1:50
    for i in 1:5
        push!(avg_firing_rate2, mean(Δt_5ms_list[1:100][num]))
    end
    num+=1
end
avg_firing_rate2
plot([0,0], [0.15, 0.5], color=:red, label=L"t=0")
plot!([1:250],avg_firing_rate2, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=5ms", label=nothing, dpi=400, color=:mediumorchid4)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_5ms.pdf")
####Δt=20 / L=40
Δt_20ms_list=[[] for i in 1:100]
for row in 1:100
    for slice in 1:40:500
        push!(Δt_10ms_list[row], sum(vars["trials"][row,slice:slice+39])/20)
    end
end

avg_firing_rate=[]
num=1
for rate in 1:12
    for i in 1:10
        push!(avg_firing_rate, mean(Δt_10ms_list[1:100][num]))
    end
    num+=1
end
avg_firing_rate
plot([0,0], [0.15, 0.5], color=:red, label=L"t=0")
plot!([1:250],avg_firing_rate, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=10ms", label=nothing, dpi=400, color=:turquoise3)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_10ms.pdf")
close(file)