x = 1
# Loops
# syntax for while loop
# while *condition*:
#     *loop body*
#     end of loop
n =0
while n < 10
    n += 1
    println(n)
end

myfriends = ["Jerry", "George", "Elaine", "Kramer"]

i = 1
while i <= length(myfriends)
    friend= myfriends[i]
    println("My friend $friend, is Mad!")
    i += 1
end


# syntax for for loop
# for *variable* in *loop iterable*
#     *loop body*
#     end of loop
for n in 1:10
    println(n)
end

for friend in myfriends
    println("My friend $friend, is Mad!")
end

m, n = 5,5
A = zeros(m,n)

for i in 1:m # i is 1 to 5
    for j in 1:n # j in 1 to 5
        A[i,j] = i + j # A[1,1] = 1+1 = 2, A[1,2] = 1+2 = 3, ...
     end
end
A

# syntax for for loop with multiple variables
B = zeros(m,n)
for i in 1:m, j in 1:n
    B[i,j] = i + j
end
B

# syntax for list comprehension for creating arrays
C = [i + j for i in 1:m, j in 1:n] # We didnlt need to initialize C


for n in 1:10
    A = [i + j for i in 1:n, j in 1:n]
    display(A)
end


# sytax for conditional statements
# if *condition*:
#     *if body*
#     end of if
# elif *condition*:
#     *elif body*
#     end of elif
# else:
#     *else body*
#     end of else
#     end of conditional statement

x = 5
y = 10

if x < y
    println(" $x is less than $y ")
elseif x > y
    println(" $x is greater than $y ")
else
    println(" $x is equal to $y ")
end

# another syntax for conditional statements
if x < y
    x
else
    y
end

# syntax for ternary operator
# x < y ? x : y
x < y ? x : y

# syntax for short circuiting
(x > y) && println(" $x is greater than $y ")
( x < y) && println(" $x is less than $y ")


# How to declare a function in Julia
function sayhi(name)
    println("Hi $name, it's great to see you!")
end
function f(x)
    x^2
end

sayhi("John")
f(234)

sayhi2(name) = println("Hi $name, it's great to see you!")
sayhi2("John")

sayhi3 = name -> println("Hi $name, it's great to see you!")
sayhi3("John")

f3 = x -> x^3
f3(9)

# function will take any reasonable input
f3("ABC")
sayhi2("1234")
# it can take matrices too
A = rand(3,3)
f3(A) # it is taking matrix cause matrix cube is well defined
# However, in case of not well defined function, it will throw an error
vector1 = [7,1,4]
f3(vector1)# it is throwing an error because vector cube is not defined

# Mutating functions vs Non-mutating functions
# Mutating functions modify the input data and normally written with !
# Non-mutating functions do not modify the input data
vector1 = [7,1,4]
sort(vector1)
vector1
sort!(vector1)
vector1

# function vs broadcasting function
# broadcasting function is a function that can be applied to each element of an array
# function is a function that can be applied to an array as a whole
vector1 = [7,1,4]
f3(vector1) # it is throwing an error because vector cube is not defined 
f3.(vector1) # it is working because we are applying f3 to each element of vector1


# Using packages in Julia for plotting
using Plots

x = -3:0.1:3
f(x) = x^2
y = f.(x)

gr()
plot(x,y, label= "line")
scatter!(x,y, label = "scatter")

# Using different backends for plotting
Plots.PlotlyJSBackend()
plot(x,y, label= "line")
scatter!(x,y, label = "scatter")