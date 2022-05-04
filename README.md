# Med-Hake-Spatial
Repository for the development of a spatial model for Mediterranean Hake using the SPASAM framework as part of the COCOCHA project.

Scenarios and input parameter values are provided in the "SPASAM Hake Model Inputs and Scenarios" spreadsheet.

The spatial heterogeneity scenarios assume a single population (single SRR and set of recruit devs) with multiple regions, where recruitment is apportioned to each region based on yearly apportionment values.

The metapopulation scenarios assume two sub-populations (two SRR with unique recruit devs), where recruitment is directly calculated/estimated for each sub-population independently.

Multiple simulation (operating model, OM) scenarios are implemented within each population structure type, including: no movement, movement with random deviations (based on the provided general movement pattern of 80% residency in each population unit), ontogenetic movement with increasing movement from population unit 1 to population unit 2 with age (i.e., to mimic the strong dome-shaped patterns observed in population unit 1 that might be associated with movement of older fish out of the unit; e.g., O'Boyle et al., 2016), density dependent movement (where population unit 1 is assumed to have a higher carrying capacity), and age-1 movement only (i.e., only juvenile fish move between population units).

Multiple estimation model (EM) parametrizations are implemented for each OM movement scenario, which differ in how movement is parametrized (e.g., no movement, constant movement, age-based movement, time-varying movement, time and age-varying movement).

Note that these EMs are not fully optimized and are meant as a preliminary examination of the impact of movement on population dynamics and the potential influence and ability to directly estimate movement rates. Given the short time series of data (12 years) and high number of parameters being estimated (and lack of tagging information), there are a number of instability and parameter bounding issues that should be carefully examined before these results are utilized further. In particular, the movement parametrizations could be more thoroughly optimized to provide improved performance over non-spatial models. 
