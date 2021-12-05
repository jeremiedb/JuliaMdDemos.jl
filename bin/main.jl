using Weave
using JSON3
using Tar

println("pwd(): ", pwd())
println("@__DIR__: ", @__DIR__)

cd(@__DIR__)

path_results = "/home/jrun/results"
path_fig = "/home/jrun/results/fig"

weave("weave-demo-iris.jmd", 
    out_path = path_results, 
    fig_path = path_fig, 
    doctype = "md2html")

open("/home/jrun/results.json", "w") do io
    JSON3.pretty(io, JSON3.write(Dict("tag" => "iris report json")))
end

@info readdir(path_results)
ENV["RESULTS_FILE"] = "$(path_results)/weave-demos-iris.html"