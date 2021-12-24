using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots
cd(dirname(@__FILE__))
file = matopen("Q1_data.mat")
vars = matread("Q1_data.mat")
vars
vars["Stim"]
vars["Spike_times"]
rand_spike=rand(vars["Spike_times"],20)

plots=[]
for i in rand_spike
    plt=begin
        scatter(vars["Stim"][floor(Int, (i-0.75)*2000):floor(Int, i*2000)],
            title=L"Spike\ time\ :%$i",markersize=3,markerstrokewidth = 0.1)
    end
    push!(plots, plt)
end
plot(plots...,size = (1000,1000), legend=false)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/20random_75msecBefore.pdf")
scatter(vars["Stim"][1:2000], label= L"Stimulation\ Signal",
    color=:red, ylabel=L"Signal's\ Value", xlabel=L"0<Time<1 (sec) \times 2000", dpi=600)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/First_sec_signal.pdf")
close(file)