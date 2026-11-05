function open_bracket
% Interactive viewer of saved FEM results; no PDE Toolbox required.
% Run open_bracket from this folder in MATLAB.
folder = fileparts(mfilename('fullpath'));
d = load(fullfile(folder,'bracket_surface.mat'));
f = figure('Name','Bearing bracket FEM','NumberTitle','off','Color',[1 1 1]);
ax = axes('Parent',f,'Position',[.08 .24 .79 .68]);
p = patch(ax,'Faces',d.faces,'Vertices',d.xyz,'FaceVertexCData',d.stress_MPa, ...
    'FaceColor','flat','EdgeColor','none');
axis(ax,'equal'); axis(ax,'vis3d'); grid(ax,'on'); view(ax,35,25);
xlabel(ax,'x (mm)'); ylabel(ax,'y (mm)'); zlabel(ax,'z (mm)');
colormap(ax,parula(256)); cb = colorbar(ax);
title(ax,{'Bearing bracket: 11,120 N vertical load','Preliminary linear FEM; stress convergence pending'});
mode = uicontrol(f,'Style','popupmenu','String',{'Von Mises stress (MPa)','Displacement magnitude (mm)'}, ...
    'Units','normalized','Position',[.07 .12 .39 .05],'Callback',@update);
scaleLabel = uicontrol(f,'Style','text','String','Deformation: 0x (undeformed)', ...
    'Units','normalized','Position',[.49 .15 .43 .04],'BackgroundColor',[1 1 1]);
scale = uicontrol(f,'Style','slider','Min',0,'Max',10,'Value',0, ...
    'Units','normalized','Position',[.49 .11 .43 .04],'Callback',@update);
wire = uicontrol(f,'Style','checkbox','String','Mesh edges','Value',0, ...
    'Units','normalized','Position',[.07 .05 .23 .05],'BackgroundColor',[1 1 1],'Callback',@update);
uicontrol(f,'Style','text','String','Drag to rotate. Use figure toolbar to zoom or pan.', ...
    'Units','normalized','Position',[.32 .04 .62 .05],'BackgroundColor',[1 1 1]);
rotate3d(f,'on'); update();
    function update(varargin)
        factor = get(scale,'Value');
        set(p,'Vertices',d.xyz + factor*d.displacement_mm);
        if get(mode,'Value') == 1
            set(p,'FaceColor','flat','FaceVertexCData',d.stress_MPa);
            caxis(ax,[0 d.max_stress_MPa]); cb.Label.String = 'Von Mises stress (MPa), unsmoothed element values';
        else
            set(p,'FaceColor','interp','FaceVertexCData',sqrt(sum(d.displacement_mm.^2,2)));
            caxis(ax,[0 d.max_displacement_mm]); cb.Label.String = 'Displacement magnitude (mm)';
        end
        if get(wire,'Value'), set(p,'EdgeColor',[.25 .25 .25]); else, set(p,'EdgeColor','none'); end
        set(scaleLabel,'String',sprintf('Displayed deformation: %.1fx',factor));
        drawnow;
    end
end
