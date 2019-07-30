module LatPhysPlottingPlots

using LatPhysBase
using RecipesBase


@recipe function plot(l::AbstractLattice; bondcolor=:grey)
    markershape --> :circle        # if markershape is unset, make it :auto
    markercolor --> :black
    markersize --> 5
    grid --> false
    axis --> false
    legend --> false
    if ndims(l) == 3
        showaxis --> false
    end

    # plot sites
    allsites = sites(l)
    @series begin
        seriestype := :scatter
        x = [point(s)[1] for s in allsites]
        y = [point(s)[2] for s in allsites]

        if ndims(l) == 3
            z = [point(s)[3] for s in allsites]
            x,y,z
        else
            x,y
        end
    end

    # plot bonds
    for b in bonds(l)
        all(iszero.(b.wrap)) || continue
        @series begin
            seriestype := :line
            linestyle := :solid
            color := bondcolor

            # get the coordinates to where the bond is pointing
            from_point = point(allsites[from(b)])
            x1 = from_point[1]
            y1 = from_point[2]
            # get the coordinates to where the bond is pointing
            to_point = point(allsites[to(b)])
            x2 = to_point[1]
            y2 = to_point[2]

            if ndims(l) == 3
                z1 = from_point[3]
                z2 = to_point[3]
                [x1,x2], [y1,y2], [z1,z2]
            else
                [x1,x2], [y1,y2]
            end

        end
    end
end

end # module
