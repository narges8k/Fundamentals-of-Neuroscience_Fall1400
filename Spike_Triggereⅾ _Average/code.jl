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
spike_time_list=[]
spike_num_list=[]
for i in 1:20
    spike_num=rand(1:598)
    push!(spike_num_list, spike_num)
    push!(spike_time_list, vars["Spike_times"][spike_num])
end
spike_time_list
spike_num_list
num=1  
plots=[]

for i in spike_time_list
    y=vars["Stim"][floor(Int, (i-0.075)*2000):floor(Int, i*2000)]
    plt=begin
        plot(collect(range(i-0.075, i, length=length(y))),y,markersize=3, title=L"Spike\ Number: %$(spike_num_list[num])",markerstrokewidth = 0.1)      
    end
    num+=1
    push!(plots, plt)
end
plot(plots...,size = (1000,1000),xlabel=L"Time(s)", ylabel=L"Voltage(mV)", legend=false)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/20random_75msecBefore_plot.pdf")

#######C
all_in1=[]
for i in vars["Spike_times"]
    push!(all_in1,vars["Stim"][ceil(Int, (i-0.075)*2000):floor(Int, i*2000)])
end
avglist1=[]
for i in 1:150
    each=[]
    for j in 1:598
        push!(each, all_in1[j][i])
    end
    push!(avglist1, mean(each))
end
avglist2=[]
for i in 1:100
    each=[]
    for j in 1:598
        push!(each, all_in2[j][i])
    end
    push!(avglist2, mean(each))
end
avglist2
SpikeTime=length(avglist1)
plot(collect(range(-0.075,0.0, length=150)),avglist1, label="STA Plot", title=L"Spike\ Triggered\ Average\ For\ All\ Data", color=:blue, dpi=400)
plot!(collect(range(0.0, 0.05, length=100)),avglist2, label=nothing, ylabel=L"Voltage(mV)", xlabel=L"Time(s)", color=:blue)
plot!([0.0, 0.0], [minimum(avglist), maximum(avglist)], label="Spike Time", color=:red)
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/STA_All.pdf")

#######D

stim20=[]
for i in spike_time_list
    push!(stim20,vars["Stim"][floor(Int, (i-0.075)*2000):floor(Int, i*2000)])
end
avglist20=[]
for i in 1:150
    each=[]
    for j in 1:20
        push!(each, stim20[j][i])
    end
    push!(avglist20, mean(each))
end
plot()
for i in spike_time_list
    plot!(collect(range(-0.075, 0.0, length=150)),vars["Stim"][floor(Int, (i-0.075)*2000):floor(Int, i*2000)][1:150], label=nothing, color=:cornflowerblue)
end
plot!(collect(range(-0.075, 0.0, length=150)),avglist20, color=:red, linewidth=5, label="STA", title=L"", xlabel=L"Voltage(mV)", ylabel=L"Time\ Before\ Spike(s)")
savefig("../../Fundamentals-of-Neuroscience_Fall1400/Spike_Triggereⅾ _Average/Figs/stim20_75ms.pdf")
close(file)