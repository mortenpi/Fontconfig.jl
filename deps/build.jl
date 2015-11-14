using BinDeps
@BinDeps.setup

@osx_only begin
    if Pkg.installed("Homebrew") === nothing
        error("Homebrew package not installed, please run Pkg.add(\"Homebrew\")")
    end
    using Homebrew
    provides( Homebrew.HB, "fontconfig", fontconfig, os = :Darwin )
end
