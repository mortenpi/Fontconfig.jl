using BinDeps
@BinDeps.setup

deps = [
    freetype = library_dependency("freetype", aliases = ["libfreetype"], runtime = false, group = group)
    fontconfig = library_dependency("fontconfig", aliases = ["libfontconfig-1", "libfontconfig", "libfontconfig.so.1"], depends = [freetype], runtime = false, group = group)
]

@osx_only begin
    if Pkg.installed("Homebrew") === nothing
        error("Homebrew package not installed, please run Pkg.add(\"Homebrew\")")
    end
    using Homebrew
    provides( Homebrew.HB, "freetype", freetype, os = :Darwin )
    provides( Homebrew.HB, "fontconfig", fontconfig, os = :Darwin )
end

@BinDeps.install Dict([(:fontconfig, :_jl_libfontconfig)])
