using Weave

println("pwd():", pwd())

path = tempdir()
weave("../experiments/weave-demo-1.jmd", 
    out_path = "$path", 
    fig_path = "$(path)/figs", 
    doctype = "md2html")

ENV["RESULTS"] = "results string"
ENV["RESULTS_FILE"] = "$(path)/weave-demos-iris.html"