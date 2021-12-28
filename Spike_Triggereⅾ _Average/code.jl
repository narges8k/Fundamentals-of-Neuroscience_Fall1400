using MAT, LaTeXStrings, Plots, ProgressBars, Statistics, StatsBase, StatsPlots, Ranges
cd(dirname(@__FILE__))
file = matopen("Q1_data.mat")
vars = matread("Q1_data.mat")
vars
vars["Stim"]
vars["Spike_times"]
#######A
plot(collect(range(0.0, 1.0, length=2000)),vars["Stim"][1:2000], title=L"Stimulus\ (First\ Sec)", ylabel=L"Voltage(mV)", xlabel=L"Time(s)", legend=false)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/First_sec_signal_plot.pdf")

#######B
rand_spike=rand(vars["Spike_times"],20)
plots=[]
for i in rand_spike
    y=vars["Stim"][floor(Int, (i-0.075)*2000):floor(Int, i*2000)]
    plt=begin
        plot(collect(range(i-0.075, i, length=length(y))),y, title=L"Spike\ time\ :%$i",markersize=3,markerstrokewidth = 0.1)
    end
    push!(plots, plt)
end
plot(plots...,size = (1000,1000),xlabel=L"Time(s)", ylabel=L"Voltage(mV)", legend=false)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/20random_75msecBefore_plot.pdf")
#######c
spi_tri_list=[]
for i in vars["Spike_times"]
    push!(spi_tri_list, vars["Stim"][floor(Int, (i-0.075)*2000):floor(Int, i*2000)])
end
spi_tri_avg=[]
for i in spi_tri_list
    push!(spi_tri_avg, mean(i))
end
spi_tri_avg
plot(spi_tri_avg)
#######D

close(file)