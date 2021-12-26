using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges
cd(dirname(@__FILE__))
file = matopen("Q1_data.mat")
vars = matread("Q1_data.mat")
vars
vars["Stim"]
vars["Spike_times"]
#######A
scatter(vars["Stim"][1:2000], label= L"Stimulation\ Signal",
    color=:red, ylabel=L"Signal's\ Value", xlabel=L"0<Time<1 (sec) \times 2000", dpi=600)
plot(vars["Stim"][1:2000], title=L"Stimulus\ (First\ Sec)", ylabel=L"Magnitude", xlabel=L"Time,pts", legend=false)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/First_sec_signal_plot.pdf")
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/First_sec_signal.pdf")

#######B
rand_spike=rand(vars["Spike_times"],20)
plots=[]
for i in rand_spike
    plt=begin
        plot(vars["Stim"][floor(Int, (i-0.75)*2000):floor(Int, i*2000)],
            title=L"Spike\ time\ :%$i",markersize=3,markerstrokewidth = 0.1)
    end
    push!(plots, plt)
end
plot(plots...,size = (1000,1000), legend=false)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/20random_75msecBefore_plot.pdf")
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/20random_75msecBefore.pdf")
#######c
spi_tri_list=[]
for i in vars["Spike_times"][1:4]
    push!(spi_tri_list, vars["Stim"][1:floor(Int, i*2000)])
end
for i in vars["Spike_times"][5:end]
    push!(spi_tri_list, vars["Stim"][floor(Int, (i-0.75)*2000):floor(Int, i*2000)])
end
spi_tri_avg=[]
for i in spi_tri_list
    push!(spi_tri_avg, mean(i))
end
spi_tri_avg
plot(range(;length = 598, start = 1, stop = 90),spi_tri_avg)