using Weave
using JSON3
using Tar

println("pwd(): ", pwd())
println("@__DIR__: ", @__DIR__)

report = get(ENV, "type", "iris")
output = get(ENV, "output", "html")

@assert report ∈ ["iris", "zoo"]

path_results = "$(@__DIR__)/../results"
path_fig = "$(path_results)/fig"

weave("$(@__DIR__)/weave-demo-$(report).jmd", 
    out_path = path_results,
    fig_path = path_fig,
    doctype = "md2html")

ENV["RESULTS"] = JSON3.write(Dict("results directory" => readdir(path_results)))

if output == "html"
    ENV["RESULTS_FILE"] = "$(path_results)/weave-demo-$(report).html"
else
    tarball = Tar.create(path_results)
    ENV["RESULTS_FILE"] = tarball
end