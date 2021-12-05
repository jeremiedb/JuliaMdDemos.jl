using Weave
using JSON3
using Tar

println("pwd(): ", pwd())
println("@__DIR__: ", @__DIR__)

cd(@__DIR__)

println("pwd() 2: ", pwd())
println("@__DIR__ 2: ", @__DIR__)

path = "home/jrun/results"
# mkdir(path)

weave("weave-demo-iris.jmd", 
    out_path = path, 
    fig_path = "$(path)/figs", 
    doctype = "md2html")

open("/home/jrun/results.json", "w") do io
    JSON3.pretty(io, JSON3.write(Dict("tag" => "iris report json")))
end

# cd("/home/jrun")
# @info readdir()
@info readdir("/home/jrun/results")

# ENV["RESULTS"] = JSON3.write(Dict("tag" => "iris report"))
# ENV["RESULTS_FILE"] = "/home/jrun/weave-demos-iris.html"
# ENV["RESULTS_FILE"] = "results.json"
# ENV["RESULTS_FILE"] = "weave-demo-iris.jmd"

tarball = Tar.create(path)
ENV["RESULTS_FILE"] = tarball