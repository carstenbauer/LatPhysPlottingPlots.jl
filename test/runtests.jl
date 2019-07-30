using Test

using Plots, LatPhysPlottingPlots
using LatPhysUnitcellLibrary, LatPhysLatticeConstruction

# 2D
uc = getUnitcellHoneycomb()
lt = getLatticePeriodic(uc, 5)
plot(lt)

# 3D
uc = getUnitcell_10_3_b()
lt = getLatticePeriodic(uc, 5)
plot(lt)
