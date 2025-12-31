using LinearAlgebra, Statistics, Plots, LaTeXStrings

# random function with mean 0 and varaince of 1
randn(5)

n = 100
ep = randn(n)
plot(1:n, ep)

typeof(ep)

ep[1:5]

# Loop
n = 100
ep = zeros(n)
for i in eachindex(ep)
    ep[i] = randn()
end

# Loop directly in the array

ep_sum = 0.0
m = 10
for ep_value in ep[1:m]
    ep_sum = ep_sum + ep_value
end
ep_mean = ep_sum / m

ep_mean ≈  mean(ep[1:m])
isapprox(ep_mean, mean(ep[1:m])) # equivalent
ep_mean ≈   sum(ep[1:m]) / m




# Brodadcasting
f(x) = x^2
generatedata(n) = f.(randn(n))
data = generatedata(10)


# direct solution with broadcasting
n = 100
f(x) = x^2
x = randn(n)
plot(f.(x), label = L"x^2")
plot!(x, label = L"x")



# 
using Distributions

function plothistogram(distribution, n)
    ep = rand(distribution, n)  # n draws from distribution
    histogram(ep)
end
lp = Laplace()
plothistogram(lp, 1000)


# Excercise
# creating a function for factorial
function factorial2(n) = for n == 0
    