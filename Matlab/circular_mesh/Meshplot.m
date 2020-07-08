clear all, close all
gSize = [5,12];
nvert = prod(gSize);
verts = cell(gSize);
rmin = 0.009;
rmax = 1;
coord_system = 1; %1 = cartesian, 2 = sfc

for i = 1:gSize(1)
    for j = 1:gSize(2)
        verts{i,j}= [i,j];
    end
end

%%
figure(1)
coord_system = 1; %1 = cartesian, 2 = sfc
%subplot(1,2,1)

 plot(nan,nan)
hold on
for i = 1:gSize(1)
    for j = 1:gSize(2)
        neighs = ind2fun(verts{i,j},gSize);
        cellfun(@(c) plot([conversion_fun(verts{i,j},1,rmin,rmax,gSize,coord_system);conversion_fun(c,1,rmin,rmax,gSize,coord_system)],[conversion_fun(verts{i,j},2,rmin,rmax,gSize,coord_system);conversion_fun(c,2,rmin,rmax,gSize,coord_system)],'-','Color',[0.6,0.6,0.6],'LineWidth',0.6),neighs);
    end
end
cellfun(@(c) plot(conversion_fun(c,1,rmin,rmax,gSize,coord_system),conversion_fun(c,2,rmin,rmax,gSize,coord_system),'.k','MarkerSize',15),verts);

axis equal
axis off
%  axis tight
if coord_system == 1
    xlim([-rmax,rmax])
    ylim([-rmax,rmax])
elseif coord_system == 2
   xlim([0,1+1/gSize(1)])
   ylim([-2*pi/gSize(2),2*pi])
end

figure(2)
%subplot(1,2,2)
rmin = 0.1;
rmax = 1;
 plot(nan,nan)
hold on
for i = 1:gSize(1)
    for j = 1:gSize(2)
        neighs = ind2fun(verts{i,j},gSize);
        cellfun(@(c) plot([conversion_fun(verts{i,j},1,rmin,rmax,gSize,coord_system);conversion_fun(c,1,rmin,rmax,gSize,coord_system)],[conversion_fun(verts{i,j},2,rmin,rmax,gSize,coord_system);conversion_fun(c,2,rmin,rmax,gSize,coord_system)],'-','Color',[0.6,0.6,0.6],'LineWidth',0.6),neighs);
    end
end
cellfun(@(c) plot(conversion_fun(c,1,rmin,rmax,gSize,coord_system),conversion_fun(c,2,rmin,rmax,gSize,coord_system),'.k','MarkerSize',15),verts);

axis equal
axis off
%  axis tight
if coord_system == 1
    xlim([-rmax,rmax])
    ylim([-rmax,rmax])
elseif coord_system == 2
   xlim([0,1+1/gSize(1)])
   ylim([-2*pi/gSize(2),2*pi])
end

figure(3)
coord_system = 1; %1 = cartesian, 2 = sfc
subplot(1,2,1)

 plot(nan,nan)
hold on
cellfun(@(c) plot(conversion_fun(c,1,rmin,rmax,gSize,coord_system),conversion_fun(c,2,rmin,rmax,gSize,coord_system),'.k','MarkerSize',15),verts);
for i = 1:gSize(1)
    for j = 1:gSize(2)
        neighs = ind2fun(verts{i,j},gSize);
        cellfun(@(c) plot([conversion_fun(verts{i,j},1,rmin,rmax,gSize,coord_system);conversion_fun(c,1,rmin,rmax,gSize,coord_system)],[conversion_fun(verts{i,j},2,rmin,rmax,gSize,coord_system);conversion_fun(c,2,rmin,rmax,gSize,coord_system)],'-k','LineWidth',1),neighs);
    end
end
axis equal
axis off
%  axis tight
if coord_system == 1
    xlim([-rmax,rmax])
    ylim([-rmax,rmax])
elseif coord_system == 2
   xlim([0,1+1/gSize(1)])
   ylim([-2*pi/gSize(2),2*pi])
end
coord_system = 2; %1 = cartesian, 2 = sfc
subplot(1,2,2)


plot(nan,nan)
hold on
cellfun(@(c) plot(conversion_fun(c,1,rmin,rmax,gSize,coord_system),conversion_fun(c,2,rmin,rmax,gSize,coord_system),'.k','MarkerSize',15),verts);
for i = 1:gSize(1)
    for j = 1:gSize(2)
        neighs = ind2fun(verts{i,j},gSize);
        cellfun(@(c) plot([conversion_fun(verts{i,j},1,rmin,rmax,gSize,coord_system);conversion_fun(c,1,rmin,rmax,gSize,coord_system)],[conversion_fun(verts{i,j},2,rmin,rmax,gSize,coord_system);conversion_fun(c,2,rmin,rmax,gSize,coord_system)],'-k','LineWidth',1),neighs);
    end
end
% axis off
 axis off
if coord_system == 1
    xlim([-rmax,rmax])
    ylim([-rmax,rmax])
elseif coord_system == 2
   xlim([0,1+1/gSize(1)])
   ylim([-2*pi/gSize(2),2*pi])
end

h=get(gca);
%set(h,'xcolor','none')
h.XAxis.Label.Color=[0 0 0];
h.XAxis.Label.Visible='on';

