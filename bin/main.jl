using Weave
using JSON3

println("pwd():", pwd())
println("@__DIR__:", @__DIR__)

cd(@__DIR__)

path = tempdir()
weave("weave-demo-iris.jmd", 
    out_path = "$path", 
    fig_path = "$(path)/figs", 
    doctype = "md2html")

ENV["RESULTS"] = JSON3.write(Dict("tag" => "iris report"))
ENV["RESULTS_FILE"] = "$(path)/weave-demos-iris.html"