
struct Pfad
    #= Here is type "Pfad" defined. Pfad is a path from "source" to "target".
    "source" is a real number value.
    "target" can be either a number value or an already defined and existing path.
    =#
    source::Real
    target::Union{Real, Pfad}
end

#=Below are three methods of defining a path.
    1. A path with both "source" and "target" being real number value
    2. A path with "source" as real number and "target" being an already existing path
    3. A path consisting of one node only
=#
pfad(source::Real, target::Real) = pfad(source, target)
pfad(source::Real, target::Pfad) = pfad(source, target)
pfad(source::Real) = pfad(source, target)

⇒(source::Real, target::Real) = pfad(source, target)
⇒(source::Real, target::Pfad) = pfad(source, target)

import Base.show

function show(io::IO, p::Pfad)
    if typeof(p.target) == Real
        print(io, "$(p.source) ⇒ $(p.target)")
    else
        print(io, "$(p.source) ⇒ ")
        show(io, p.target)
    end
end

function *(f::Pfad, g::Pfad)
    @assert f.target == g.source "$(f.target) == $(g.source)"
    pfad(f.source, g.target)
end