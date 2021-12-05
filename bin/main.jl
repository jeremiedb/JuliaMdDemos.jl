using Weave
using JSON3

println("pwd():", pwd())
println("@__DIR__:", @__DIR__)

cd(@__DIR__)

println("pwd() 2:", pwd())
println("@__DIR__ 2:", @__DIR__)

path = tempdir()
weave("weave-demo-iris.jmd", 
    out_path = "/home/jrun", 
    fig_path = "/home/jrun/figs", 
    doctype = "md2html")

@info readdir()
@info readdir(path)
@info readdir("home/jrun")

ENV["RESULTS"] = JSON3.write(Dict("tag" => "iris report"))
ENV["RESULTS_FILE"] = "/home/jrun/weave-demos-iris.html"
# ENV["RESULTS_FILE"] = "weave-demo-iris.jmd"