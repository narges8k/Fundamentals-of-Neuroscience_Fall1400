
using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges
cd(dirname(@__FILE__))
file = matopen("i140703-001_lfp-spikes.mat")
vars = matread("i140703-001_lfp-spikes.mat")

#   block->segments-> anaglogsignals (LFB signals_Q8) cells:(1:96)
#                  -> spiketrains 
#Part A
neurons = vars["block"]["segments"][1,1]["spiketrains"]
events = vars["block"]["segments"][1,1]["events"][1,1]
all_neurons_spiketimes=[[] for i in 1:length(neurons)]
for index in 1:length(neurons)
    all_neurons_spiketimes[index]= neurons[1, index]["times"][1, :] ./ 30000
end

scatter()
for i in 1:length(neurons)
    scatter!(all_neurons_spiketimes[i], [i for j in 1:length(all_neurons_spiketimes[i])], 
    markershape=:vline, size = (4000,2500), color=:black, tickfontsize=30)
end
plot!(legend=false, dpi =400, ylabel=L"trial id", xlabel="time(ms)")
TS_ON = events["times"][findall(x -> x == "65296", events["labels"])] ./ 3000
WS_ON = events["times"][findall(x -> x == "65360", events["labels"])] ./ 3000
CUE_ON_PG = events["times"][findall(x -> x == "65365", events["labels"])]  ./ 3000
#CUE_OFF = events["times"][findall(x -> x == "65360", events["labels"])]  ./ 3000
GO_ON_LF = events["times"][findall(x -> x == "65369", events["labels"])]  ./ 3000
RW_ON_CONF_PG = events["times"][findall(x -> x == "65509", events["labels"])]  ./ 3000
plot!(TS_ON)




savefig("../../Fundamentals-of-Neuroscience_Fall1400/Term_Project/Figs/rasterplot.pdf")

