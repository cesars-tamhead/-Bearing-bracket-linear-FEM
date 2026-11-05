BEARING BRACKET — INTERACTIVE 3D RESULTS

BROWSER
Open Bracket_3D.html in a current Chrome, Edge, Firefox, or Safari browser.
The model and Three.js renderer are embedded; no MATLAB installation needed.
Drag to rotate; scroll to zoom. Switch stress/displacement, show mesh edges,
or change displayed deformation from 0x (original shape) to 10x.
Browser geometry/values are rounded for display; MATLAB data retain precision.

MATLAB
Keep open_bracket.m and bracket_surface.mat together. Open this folder in
MATLAB and run: open_bracket
No PDE Toolbox or third-party MATLAB add-ons are required. Use the figure
rotation/zoom tools and the controls below the model.
MATLAB code was reviewed but could not be executed here (MATLAB unavailable).

RESULTS
Finest saved linear mesh: 155,162 tetrahedra, 38,706 total nodes.
Surface viewer: 48,842 triangles and 24,413 surface vertices.
Load: 11,120 N in the negative global Y direction.
Maximum displacement: 2.065952 mm. Peak element von Mises: 969.197457 MPa.
Stress is an unsmoothed element result; displacement is nodal.
The deformation slider changes display magnification, not the solved load.
These viewers show the LINEAR study, not the coarse nonlinear result.
This is a preliminary analysis; local stress and nonlinear mesh convergence
remain outstanding. The displayed data do not establish design safety.

THIRD-PARTY COMPONENT
Browser rendering uses Three.js r128, MIT License, copyright Three.js authors.
Source: https://github.com/mrdoob/three.js/tree/r128
