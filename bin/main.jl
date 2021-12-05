using Weave
using JSON3

println("pwd():", pwd())
println("@__DIR__:", @__DIR__)

cd(@__DIR__)

println("pwd() 2:", pwd())
println("@__DIR__ 2:", @__DIR__)

path = tempdir()
weave("weave-demo-iris.jmd", 
    out_path = "/mnt/data", 
    fig_path = "/mnt/data/figs", 
    doctype = "md2html")

open("/home/jrun/results.json", "w") do io
    JSON3.pretty(io, JSON3.write(Dict("tag" => "iris report json")))
end

@info readdir()
@info readdir(path)
@info readdir("mnt/data")

ENV["RESULTS"] = JSON3.write(Dict("tag" => "iris report"))
# ENV["RESULTS_FILE"] = "/home/jrun/weave-demos-iris.html"
ENV["RESULTS_FILE"] = "/home/jrun/results.json"
# ENV["RESULTS_FILE"] = "weave-demo-iris.jmd"