using Plots
using HypothesisTests
using Statistics
using Distributions
using StatsPlots
Data=[11.5 , 11.8 , 15.7 , 16.1 , 14.1 , 10.5 , 9.3 , 15.0 , 11.1 , 15.2 ,
    19.0 , 12.8 , 12.4, 19.2 , 13.5 , 12.2 , 13.3 , 16.5 , 13.5 , 14.4 , 16.7 ,
     10.9 , 13.0 , 10.3 , 15.8 , 15.1, 17.1 , 13.3 , 12.4 , 8.5 , 14.3 , 12.9 , 13.5]
mu=15.7
N=length(Data)
S=sqrt(sum((Data .- mean(Data)) .^ 2) / (N-1))
T_value=(mean(Data)- mu)/ (S/sqrt(N))
t_test=OneSampleTTest(Data, mu)
P_value=pvalue(t_test, tail= :left)
TDIST=TDist(length(Data)-1)
t_data=[]
for x in Data
    push!(t_data, (x - mu) / S)
end
histogram(t_data, bins = LinRange(extrema(t_data)..., 8), normalize = true, alpha=0.7,
    label="probability distribution of t-scors", dpi=400)
plot!(TDIST, label=" Student t-distribution", color= :black, dpi=400)
savefig("C:\\Users\\Narges\\Documents\\GitHub\\Fundamentals_of_Neuroscience_Fall1400\\HW1\\Figs\\Q2.png")
