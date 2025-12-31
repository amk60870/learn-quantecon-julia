using LinearAlgebra, Statistics
a = [1, 2, 3]
typeof(a)

ndims(a)
size(a)

b = [1 2 3]

a == b

z = zeros(3)

Z = zeros(2, 3)

fill(5, 2, 3)

a

c = copy(a)
c[1]

x = [1, 2, 3]
y = similar(x, 4)  # similar type as x, but length 4

b = [1.0 2.0; 3.0 4.0]
b - I  # good style, and note the lack of dimensions of I

typeof(I)

ones(2)
ones(2) * ones(2)  # does not conform, expect error
ones(2)' * ones(2)
ones(2,2) * ones(2,2)

@show dot(ones(2), ones(2))
@show ones(2) ⋅ ones(2);


b = ones(2, 2)
b * ones(2)

ones(2)' * b


x = [1, 2]
x .+ 1     # not x + 1
x .- 1     # not x - 1


a = [10, 20, 30]
b = [-100, 0, 100]

b .> a

a .== b

b .> 1

a = randn(4)

a .< 0
a[a .< 0]


a = [10, 20, 30, 40]
b = reshape(a, 2, 2)
b[1, 1] = 100  # continuing the previous example
b
a

# Linear Algebra

A = [1 2; 3 4]

det(A)
tr(A)
eigvals(A)
eigvecs(A)
rank(A)

a = 10:12        # a range, equivalent to 10:1:12
@show Vector(a)  # can convert, but shouldn't

b = Diagonal([1.0, 2.0, 3.0])
a .- [1.0; 2.0; 3.0]
b * a
b * a .- [1.0; 2.0; 3.0]

# Tuples
t = (1.0, "test")
t[1]            # access by index
a, b = t        # unpack
 t[1] = 3.0    # would fail as tuples are immutable
println("a = $a and b = $b")


t = (; val1 = 1.0, val2 = "test") # ; is optional but good form
t.val1      # access by index
println("val1 = $(t.val1) and val2 = $(t.val2)") # access by name
(; val1, val2) = t  # unpacking notation (note the ;)
println("val1 = $val1 and val2 = $val2")

t2 = (; val3 = 4, val4 = "test!!")
t3 = merge(t, t2)  # new tuple


function f(parameters)
    alpha, beta = parameters.alpha, parameters.beta # poor style, error prone
    return alpha + beta
end

parameters = (; alpha = 0.1, beta = 0.2)
f(parameters)


function f(parameters)
    (; alpha, beta) = parameters  # good style, less sensitive to errors
    return alpha + beta
end

parameters = (; alpha = 0.1, beta = 0.2)
f(parameters)
