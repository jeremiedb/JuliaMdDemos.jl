using Weave
using Literate

weave("experiments/weave-demo-1.jmd", 
    out_path = "$(@__DIR__)/output/weave", 
    fig_path = "$(@__DIR__)/output/weave/figs", 
    doctype = "md2html")

weave("experiments/weave-demo-iris.jmd", 
    out_path = "$(@__DIR__)/output/weave", 
    fig_path = "$(@__DIR__)/output/weave/figs", 
    doctype = "md2html")


weave("experiments/weave-demo-iris-bs.jmd", 
    out_path = "$(@__DIR__)/output/weave", 
    fig_path = "$(@__DIR__)/output/weave/figs", 
    doctype = "md2html")

Literate.markdown("experiments/literate-demo-1.jl")
