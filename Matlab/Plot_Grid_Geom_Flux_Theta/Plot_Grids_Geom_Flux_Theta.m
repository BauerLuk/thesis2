clear all, close all
% %% Flux theta distributed
% verts = load('Grid_flux_theta_verts.obj');
% lines = load('Grid_flux_theta_lines.obj');
% 
% figure(1)
% for i = 1: size(lines,1)
%         plot(verts(lines(i,:),1),verts(lines(i,:),2),'-','Color',[0.6,0.6,0.6],'LineWidth',0.15)
%         hold on
% end
% plot(verts(:,1),verts(:,2),'.k','MarkerSize',15)
% axis equal
% axis off

%% Flux theta distributed, theta= 0 through X-point
verts = load('Grid_flux_theta_verts_Xtheta0.obj');
lines = load('Grid_flux_theta_lines_Xtheta0.obj');

figure(2)
for i = 1: size(lines,1)
        plot(verts(lines(i,:),1),verts(lines(i,:),2),'-','Color',[0.6,0.6,0.6],'LineWidth',0.15)
        hold on
end
plot(verts(:,1),verts(:,2),'.k','MarkerSize',15)
axis equal
axis off



%% Geom theta distributed
verts = load('Grid_geom_theta_verts.obj');
lines = load('Grid_geom_theta_lines.obj');

figure(3)
for i = 1: size(lines,1)
        plot(verts(lines(i,:),1),verts(lines(i,:),2),'-','Color',[0.6,0.6,0.6],'LineWidth',0.35)
        hold on
end
plot(verts(:,1),verts(:,2),'.k','MarkerSize',15)
axis equal
axis off