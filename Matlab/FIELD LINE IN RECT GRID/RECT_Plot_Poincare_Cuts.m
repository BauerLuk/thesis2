close all, clear all

%  data = load('poincare_plot_rphiz.dat');
 data2 = load('poincare_plot.dat');

Savepath='/afs/itp.tugraz.at/user/bauer_l/Dokumente/Diplomarbeit/Unterlagen/Markus Bakk/Markus Bachelorarbeit Latex/figures/field_lines_fine_rect_grid.eps';



%% Plot Mesh %% %% %% %% %% %% %% %% %% %%

%% R-phi-Z-Mesh
%% Data Mesh 1
MeshObj1 = readObj('mesh_RphiZ.obj');

R1 = MeshObj1.v(1:end/2,1);
Z1 = MeshObj1.v(1:end/2,3);
faces = MeshObj1.f.v(1:end,:);


%% 2D - Mesh


figure(1)

linecolor1 = 0.2* [1, 1, 1];
% plot(R1,Z1,'k.','MarkerSize',10)

for k = 1:size(faces,1)
    if all(faces(k,:) <= numel(R1))
        plot(R1(faces(k,[1,2,3,1])),Z1(faces(k,[1,2,3,1])),'-','Color',linecolor1,'LineWidth',1)
        hold on
%         disp(faces(k))
    end
end


  p2 = plot(data2(:,1),data2(:,3),'k.');

%   legend([p2],'FL in cylindrical coordinates','FontSize',15)
 
 xlabel('R / cm','FontSize',25)
ylabel('Z / cm','FontSize',25)



for k = 1:size(faces,1)
    if all(faces(k,:) <= numel(R1))
        plot(R1(faces(k,[1,2,3,1])),Z1(faces(k,[1,2,3,1])),'-','Color',linecolor1,'LineWidth',1)

    end
end

xlim([110 220])
ylim([-110 110])

print(Savepath,'-depsc');
%% Object Reading Function:
