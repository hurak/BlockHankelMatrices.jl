using BlockHankelMatrices
using Documenter

DocMeta.setdocmeta!(BlockHankelMatrices, :DocTestSetup, :(using BlockHankelMatrices); recursive=true)

makedocs(;
    modules=[BlockHankelMatrices],
    authors="Zdeněk Hurák <hurak@fel.cvut.cz>",
    repo="https://github.com/hurak/BlockHankelMatrices.jl/blob/{commit}{path}#{line}",
    sitename="BlockHankelMatrices.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://hurak.github.io/BlockHankelMatrices.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/hurak/BlockHankelMatrices.jl",
    devbranch="main",
)
