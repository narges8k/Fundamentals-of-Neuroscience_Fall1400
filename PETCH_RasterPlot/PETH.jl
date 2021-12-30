using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges
cd(dirname(@__FILE__))
file = matopen("Q2_data.mat")
vars = matread("Q2_data.mat")
####Δt=10ms / L=20
Δt_10ms_list=[[] for i in 1:100]
for row in 1:100
    for slice in 1:20:500
        push!(Δt_10ms_list[row], sum(vars["trials"][row,slice:slice+19])/10)
    end
end
Δt_10ms_list
avg_firing_rate=[]
num=1
for rate in 1:25
    for i in 1:10
        push!(avg_firing_rate, mean(Δt_10ms_list[1:100][num]))
    end
    num+=1
end
avg_firing_rate
plot([0,0], [0.15, 0.5], color=:red, label="Spike Time")
plot!(collect(range(-0.050, 0.200, length=250)),avg_firing_rate, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=10ms", label=nothing, dpi=400, color=:turquoise3)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_10ms.pdf")
####Δt=2.5 / L=5
Δt_5L_list=[[] for i in 1:100]
for row in 1:100
    for slice in 1:5:500
        push!(Δt_5L_list[row], sum(vars["trials"][row,slice:slice+4])/2.5)
    end
end
Δt_5L_list[1]
avg_firing_rate2=[]
num=1
for rate in 1:100
    for i in 1:5
        push!(avg_firing_rate2, mean(Δt_5L_list[1:100][num]))
    end
    num+=1
end
avg_firing_rate2
plot([0,0], [0.15, 0.5], color=:red, label="Spike Time")
plot!(collect(range(-0.050, 0.200, length=500)),avg_firing_rate2, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=2.5ms", label=nothing, dpi=400, color=:mediumorchid4)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_5L.pdf")
####Δt=17.5 / L=35
Δt_35L_list=[[] for i in 1:100]
for row in 1:100
    for slice in 1:35:490
        push!(Δt_35L_list[row], sum(vars["trials"][row,slice:slice+34])/17.5)
    end
end
Δt_35L_list[1]
avg_firing_rate=[]
num=1
for rate in 1:14
    for i in 1:35
        push!(avg_firing_rate, mean(Δt_10ms_list[1:100][num]))
    end
    num+=1
end
avg_firing_rate
plot([0,0], [0.15, 0.5], color=:red, label=L"Spike Time")
plot!(collect(range(-0.050, 0.200, length=490)) ,avg_firing_rate, xlabel=L"Time(ms)", ylabel=L"rate(Hz)", title=L"PETH\ for\ \Delta t=17.5ms", label=nothing, dpi=400, color=:turquoise3)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/PETCH_RasterPlot/Figs/PETH_17.5ms.pdf")
close(file)
