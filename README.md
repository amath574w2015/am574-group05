# am574-group05

Introduction to WENO Methods

Tommaso Buvoli & Krithika Manohar

Abstract: 

Essentially non-oscillatory or ENO methods have historically proven successful at capturing shock discontinuities by choosing the smoothest interpolating polynomial at several neighboring stencils. Weighted ENO or WENO methods use a convex combination of the interpolating polynomial at all stencils and hence preserve both the high-resolution for shocks and high-order accuracy for smooth data.

We implement and test these schemes on one-dimensional hyperbolic equations such as the advection and burgers equations with shocks. We will also include comparisons with \verb+clawpack+'s results for non-WENO schemes. We also plan to investigate the benefits of using Total Variation Diminishing (TVD) Runge-Kutta schemes versus traditional non-TVD integrators. 
