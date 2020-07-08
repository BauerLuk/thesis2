%% Get data for specifically selected hexahedron in 3D
hexa3D = load('grid_symflux_tetrahedra.dat');
N_hexa3D = numel(hexa3D(:,1));

ppl = 201;

%Enter nan to stop plotting
hexa3D_nan = nan(N_hexa3D/ppl*(ppl+1),3);
L_h3D = mod([1:N_hexa3D/ppl*(ppl+1)],(ppl+1))==0;
hexa3D_nan(~L_h3D,:) = hexa3D;


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
Fact_vec = linspace(0,2.5,100);
for j = 100:-1:1
Fact = Fact_vec(j);
Vec1 = (Mid1 - Mid_tot)*Fact;
Vec2 = (Mid2 - Mid_tot)*Fact;
Vec3 = (Mid3 - Mid_tot)*Fact;
Vec4 = (Mid4 - Mid_tot)*Fact;
Vec5 = (Mid5 - Mid_tot)*Fact;
Vec6 = (Mid6 - Mid_tot)*Fact;

C_b = 'k';%'r';  %Color     border
LS_b = '--';%'-'; %LineStyle border
LW_b = 1.2;%1.6; %LineWidth border

C_i = 'k';  %Color     inside
LS_i = '--';%LineStyle inside
LW_i = 1.2; %LineWidth inside
%PLOT Tetrahedra
figure(2)
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

        quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec1(1)/Fact*(Fact+1),Vec1(2)/Fact*(Fact+1),Vec1(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
        quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec2(1)/Fact*(Fact+1),Vec2(2)/Fact*(Fact+1),Vec2(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
        quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec3(1)/Fact*(Fact+1),Vec3(2)/Fact*(Fact+1),Vec3(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
        quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec4(1)/Fact*(Fact+1),Vec4(2)/Fact*(Fact+1),Vec4(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
        quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec5(1)/Fact*(Fact+1),Vec5(2)/Fact*(Fact+1),Vec5(3)/Fact*(Fact+1),'Color','k','LineWidth',2)
        quiver3(Mid_tot(1),Mid_tot(2),Mid_tot(3),Vec6(1)/Fact*(Fact+1),Vec6(2)/Fact*(Fact+1),Vec6(3)/Fact*(Fact+1),'Color','k','LineWidth',2)

view(-25,20)
xlim([150 210])
ylim([-60 140])
zlim([-30 30])
axis off
pause(0.005)
hold off
end