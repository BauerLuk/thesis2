ppl = 201; %Number of points per line (depends on setting in Fortran when writing out points)

%% Get data for full 2D grid projection
grid_dat = load('grid_symflux_total.dat'); %Data for 2D curvilinear grid plot
N_grid_dat = numel(grid_dat(:,1));

%Enter nan to stop plotting
grid_nan = nan(N_grid_dat/ppl*(ppl+1),3);
L_g = mod([1:N_grid_dat/ppl*(ppl+1)],(ppl+1))==0;
grid_nan(~L_g,:) = grid_dat;

%% Get data for specifically selected hexahedron in 2D
hexa2D = load('grid_symflux_hexahedron_triangles.dat'); %Data for specifically selected hexahedron (projected in 2D) which is highlighted
N_hexa2D = numel(hexa2D(:,1));

%Enter nan to stop plotting
hexa2D_nan = nan(N_hexa2D/ppl*(ppl+1),3);
L_h2D = mod([1:N_hexa2D/ppl*(ppl+1)],(ppl+1))==0;
hexa2D_nan(~L_h2D,:) = hexa2D;

%% Get data for specifically selected hexahedron in 3D
hexa3D = load('grid_symflux_tetrahedra.dat');
N_hexa3D = numel(hexa3D(:,1));

%Enter nan to stop plotting
hexa3D_nan = nan(N_hexa3D/ppl*(ppl+1),3);
L_h3D = mod([1:N_hexa3D/ppl*(ppl+1)],(ppl+1))==0;
hexa3D_nan(~L_h3D,:) = hexa3D;

%% Plot
 close all
figure(2)
%Left Plot -> full grid with 1 highlighted hexahedron
subplot(1,3,1)
plot(grid_nan(:,1),grid_nan(:,3),'-k','Linewidth',1.2) %plot full 2D projection
hold on

Triangles = [1,1,0,1,1,0];

for k = 0: size(hexa2D,1)/ppl-1
    if Triangles(k+1)
        plot(hexa2D_nan([k*ppl+1:(k+1)*ppl],1),hexa2D_nan([k*ppl+1:(k+1)*ppl],3),'-r','Linewidth',1.8) %plot 2d projection of selected hexahedron
    end
end
axis off

%Right Plot -> selected hexahedron in 3D
subplot(1,3,3)
            %ORIGINAL PLOT CALL:% plot3(hexa3D_nan(:,1).*cos(hexa3D_nan(:,2)),hexa3D_nan(:,1).*sin(hexa3D_nan(:,2)),hexa3D_nan(:,3),'-.k','LineWidth',1.5) %plot selected hexahedron in 3D
N_lines_hexa3D = N_hexa3D/ppl; % Number of plotted lines in 3D hexahedron
L_l     = [1,0,0,1,0,1,1,0,0,1,0,1,1,0,0,1,0,1,1,0,0,1,0,1,1,0,0,1,0,1,1,0,0,1,0,1];% HARD CODED -> BORDER LINES
L_ld    = [0,1,1,0,1,0,0,1,1,0,1,0,0,1,1,0,1,0,0,1,1,0,1,0,0,1,1,0,1,0,0,1,1,0,1,0];% HARD CODED -> INTERMEDIATE LINES (DOTTED)
L_v     = [1,1,0,1,0,1,1,1,0,1,0,0,1,1,0,1,0,0,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1];% HARD CODED -> VISIBILITY OF LINES

Tetr1   = [1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Tetr2   = [0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Tetr3   = [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Tetr4   = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
Tetr5   = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0];
Tetr6   = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1];

Mid_tot = sum(    [hexa3D(:,1).*cos(hexa3D(:,2)),   hexa3D(:,1).*sin(hexa3D(:,2)),  hexa3D(:,3)]  ,1) /size(hexa3D,1);
Mid1    = 0;
Mid2    = 0;
Mid3    = 0;
Mid4    = 0;
Mid5    = 0;
Mid6    = 0;

P = nan(8,3);
P(1,:) = [182.5-1,0,-7.7];
P(2,:) = [187.5-1,0,-12.6];
P(3,:) = [194.7-1.5,0,10.3+0.5];
P(4,:) = [188.1-2,0,6.6];
P(5,:) = [166.7-4,74.2+6,-7.7];
P(6,:) = [171.4-4,76.3+6,-12.7];
P(7,:) = [177.9-3,79.2+8,10.3-0.10];
P(8,:) = [171.7-4,76.4+4,6.5];


for k   = 0:N_lines_hexa3D-1
    if Tetr1(k+1)
     Mid1 = Mid1 + 1/(6*ppl)*sum([hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],3)],1);
    end
    if Tetr2(k+1)
     Mid2 = Mid2 + 1/(6*ppl)*sum([hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],3)],1);
    end
    if Tetr3(k+1)
    Mid3 = Mid3 + 1/(6*ppl)*sum([hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],3)],1);
    end
    if Tetr4(k+1)
    Mid4 = Mid4 + 1/(6*ppl)*sum([hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],3)],1);
    end
    if Tetr5(k+1)
    Mid5 = Mid5 + 1/(6*ppl)*sum([hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],3)],1);
    end
    if Tetr6(k+1)
    Mid6 = Mid6 + 1/(6*ppl)*sum([hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],3)],1);
    end
end
Fact = 2.5;
Vec1 = (Mid1 - Mid_tot)*Fact*2.1 - [5,25,3];
Vec2 = (Mid2 - Mid_tot)*Fact*1.9 + [18,0,0];
Vec3 = (Mid3 - Mid_tot)*Fact*2.1 - [0,0,3];
Vec4 = (Mid4 - Mid_tot)*Fact*1.9 + [0,0,0];
Vec5 = (Mid5 - Mid_tot)*Fact*1.9 + [-20,50,3];
Vec6 = (Mid6 - Mid_tot)*Fact*1.9+ [-5,20,0];

C_b = 'k';%'r';  %Color     border
LS_b = '-';%'-'; %LineStyle border
LW_b = 2;%1.6; %LineWidth border

C_i = 'k';  %Color     inside
LS_i = '-';%LineStyle inside
LW_i = 2; %LineWidth inside
%PLOT Tetrahedra
for k   = 0:N_lines_hexa3D-1
    if Tetr1(k+1)
        if L_l(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec1(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec1(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec1(3));
            set(p1,'color',C_b,'linestyle',LS_b,'LineWidth',LW_b);
        elseif L_ld(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec1(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec1(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec1(3));
            set(p1,'color',C_i,'linestyle',LS_i,'LineWidth',LW_i);
        end
        hold on
    end
    if Tetr2(k+1)
        if L_l(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec2(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec2(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec2(3));
            set(p1,'color',C_b,'linestyle',LS_b,'LineWidth',LW_b);
        elseif L_ld(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec2(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec2(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec2(3));
            set(p1,'color',C_i,'linestyle',LS_i,'LineWidth',LW_i);
        end
        hold on
    end
    if Tetr3(k+1)
        if L_l(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec3(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec3(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec3(3));
            set(p1,'color',C_b,'linestyle',LS_b,'LineWidth',LW_b);
        elseif L_ld(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec3(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec3(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec3(3));
            set(p1,'color',C_i,'linestyle',LS_i,'LineWidth',LW_i);
        end
        hold on
    end
    if Tetr4(k+1)
        if L_l(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec4(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec4(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec4(3));
            set(p1,'color',C_b,'linestyle',LS_b,'LineWidth',LW_b);
        elseif L_ld(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec4(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec4(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec4(3));
            set(p1,'color',C_i,'linestyle',LS_i,'LineWidth',LW_i);
        end
        hold on
    end
    if Tetr5(k+1)
        if L_l(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec5(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec5(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec5(3));
            set(p1,'color',C_b,'linestyle',LS_b,'LineWidth',LW_b);
        elseif L_ld(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec5(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec5(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec5(3));
            set(p1,'color',C_i,'linestyle',LS_i,'LineWidth',LW_i);
        end
        hold on
    end
    if Tetr6(k+1)
        if L_l(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec6(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec6(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec6(3));
            set(p1,'color',C_b,'linestyle',LS_b,'LineWidth',LW_b);
        elseif L_ld(k+1)
            p1 = plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec6(1),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2))+Vec6(2),hexa3D([k*ppl+1:(k+1)*ppl],3)+Vec6(3));
            set(p1,'color',C_i,'linestyle',LS_i,'LineWidth',LW_i);
        end
        hold on
    end
end
%
%Text for labeling points
NUMBER_SIZE= 25;
%Tetrahedron1
text(P(1,1)+Vec1(1)-5,P(1,2)+Vec1(2)+10,P(1,3)+Vec1(3),['1'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(2,1)+Vec1(1)+3,P(2,2)+Vec1(2),P(2,3)+Vec1(3),['2'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(3,1)+Vec1(1)+3,P(3,2)+Vec1(2)+5,P(3,3)+Vec1(3),['3'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(7,1)+Vec1(1),P(7,2)+Vec1(2)+8,P(7,3)+Vec1(3),['7'],'FontSize',NUMBER_SIZE,'Color','k')
%Tetrahedron2
text(P(1,1)+Vec2(1)-2,P(1,2)+Vec2(2)+ 30,P(1,3)+Vec2(3),['1'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(2,1)+Vec2(1)+1,P(2,2)+Vec2(2)-10,P(2,3)+Vec2(3),['2'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(6,1)+Vec2(1)-2,P(6,2)+Vec2(2),P(6,3)+Vec2(3),['6'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(7,1)+Vec2(1),P(7,2)+Vec2(2)+10,P(7,3)+Vec2(3),['7'],'FontSize',NUMBER_SIZE,'Color','k')
%Tetrahedron3
text(P(1,1)+Vec3(1)+1,P(1,2)+Vec3(2)-5,P(1,3)+Vec3(3),['1'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(5,1)+Vec3(1)-2,P(5,2)+Vec3(2),P(5,3)+Vec3(3),['5'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(6,1)+Vec3(1)-3,P(6,2)+Vec3(2),P(6,3)+Vec3(3),['6'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(7,1)+Vec3(1),P(7,2)+Vec3(2)+8,P(7,3)+Vec3(3),['7'],'FontSize',NUMBER_SIZE,'Color','k')
%Tetrahedron4
text(P(1,1)+Vec4(1)-4.5,P(1,2)+Vec4(2)+7,P(1,3)+Vec4(3),['1'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(3,1)+Vec4(1)+2,P(3,2)+Vec4(2),P(3,3)+Vec4(3),['3'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(4,1)+Vec4(1)-4,P(4,2)+Vec4(2)+15,P(4,3)+Vec4(3),['4'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(7,1)+Vec4(1),P(7,2)+Vec4(2)+5,P(7,3)+Vec4(3),['7'],'FontSize',NUMBER_SIZE,'Color','k')
%Tetrahedron5
text(P(1,1)+Vec5(1)-0.5,P(1,2)+Vec5(2)-14,P(1,3)+Vec5(3),['1'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(4,1)+Vec5(1)+3,P(4,2)+Vec5(2),P(4,3)+Vec5(3),['4'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(7,1)+Vec5(1),P(7,2)+Vec5(2)+10,P(7,3)+Vec5(3),['7'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(8,1)+Vec5(1)-1,P(8,2)+Vec5(2)+10,P(8,3)+Vec5(3),['8'],'FontSize',NUMBER_SIZE,'Color','k')
%Tetrahedron6
text(P(1,1)+Vec6(1),P(1,2)+Vec6(2)-10,P(1,3)+Vec6(3),['1'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(5,1)+Vec6(1)-2,P(5,2)+Vec6(2),P(5,3)+Vec6(3),['5'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(7,1)+Vec6(1)+1,P(7,2)+Vec6(2)+12,P(7,3)+Vec6(3),['7'],'FontSize',NUMBER_SIZE,'Color','k')
text(P(8,1)+Vec6(1),P(8,2)+Vec6(2)+16,P(8,3)+Vec6(3),['8'],'FontSize',NUMBER_SIZE,'Color','k')
%View
view(-25,20)

%Plot Arrows
%         quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec1(1)/Fact*(Fact+1),Vec1(2)/Fact*(Fact+1),Vec1(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
%         quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec2(1)/Fact*(Fact+1),Vec2(2)/Fact*(Fact+1),Vec2(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
%         quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec3(1)/Fact*(Fact+1),Vec3(2)/Fact*(Fact+1),Vec3(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
%         quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec4(1)/Fact*(Fact+1),Vec4(2)/Fact*(Fact+1),Vec4(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
%         quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec5(1)/Fact*(Fact+1),Vec5(2)/Fact*(Fact+1),Vec5(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
%         quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec6(1)/Fact*(Fact+1),Vec6(2)/Fact*(Fact+1),Vec6(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
% % ORIGINAL PLOT
axis off
%% Center Plot
subplot(1,3,2)
for k   = 0:N_hexa3D/ppl-1
    
    p1 =  plot3(hexa3D([k*ppl+1:(k+1)*ppl],1).*cos(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],1).*sin(hexa3D([k*ppl+1:(k+1)*ppl],2)),hexa3D([k*ppl+1:(k+1)*ppl],3));
    hold on
    if L_l(k+1)
        set(p1,'Color','r','Linewidth',1.6)
    else
        set(p1,'Color','k','Linewidth',1.6)
    end
    if L_v(k+1)
        set(p1,'Linestyle','-')
    else
        set(p1,'Linestyle','--')
    end
end

for i=1:8
    text(P(i,1)+0.01,P(i,2),P(i,3)-0.015,['  ',num2str(i)],'FontSize',32,'Color','k')
end
view(-25,20)
% grid on
        % % % xlim([min(X)-5,max(X)]+5)
        % % % ylim([min(Y)-5,max(Y)]+5)
        % % % zlim([min(Z)-5,max(Z)]+5)
axis off

