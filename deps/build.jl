using BinDeps
@BinDeps.setup

deps = [
    fontconfig = library_dependency("fontconfig", aliases = ["libfontconfig-1", "libfontconfig", "libfontconfig.so.1"], depends = [freetype], runtime = false, group = group)
]

@osx_only begin
    if Pkg.installed("Homebrew") === nothing
        error("Homebrew package not installed, please run Pkg.add(\"Homebrew\")")
    end
    using Homebrew
    provides( Homebrew.HB, "fontconfig", fontconfig, os = :Darwin )
end
