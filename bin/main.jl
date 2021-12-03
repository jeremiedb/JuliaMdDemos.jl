using Weave

println("pwd():", pwd())
println("@__DIR__:", @__DIR__)

path = tempdir()
weave("../experiments/weave-demo-iris.jmd", 
    out_path = "$path", 
    fig_path = "$(path)/figs", 
    doctype = "md2html")

ENV["RESULTS_FILE"] = "$(path)/weave-demos-iris.html"