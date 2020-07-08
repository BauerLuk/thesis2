close all, clear all
% Rmin = 150;
% Rmax = 250;
% Zmin = -50;
% Zmax = 50; 

MeshObj1 = readObj('mesh_aligned_RphiZ.obj');

R1 = MeshObj1.v(1:end,1);
Y1 = MeshObj1.v(1:end,2);
Z1 = MeshObj1.v(1:end,3);

faces = MeshObj1.f.v(1:end,:);
% plotstuff = [];
% for k = 1: size(faces,1)
% plotstuff = [plotstuff;[R1(faces(k,[1,2,3,1])),Y1(faces(k,[1,2,3,1])),Z1(faces(k,[1,2,3,1]))];nan(1,3)];
% end

%%
figure(1)
plot3(R1,Y1,Z1,'k.')
hold on
 for k = 1:size(faces,1)
%     plot3(plotstuff(:,1),plotstuff(:,2),plotstuff(:,1),'k-')
% % %     if all(faces(k,:) <= numel(R1))
        plot3(R1(faces(k,[1,2,3,1])),Y1(faces(k,[1,2,3,1])),Z1(faces(k,[1,2,3,1])),'k-','LineWidth',2)%,'Color',linecolor1,'LineWidth',1)
        hmat = [R1(faces(k,[1,2,3])),Y1(faces(k,[1,2,3])),Z1(faces(k,[1,2,3]))];
        patch(hmat(:,1),hmat(:,2),hmat(:,3),[0.6,0.6,0.6])
 end
xlabel('X / cm')
ylabel('Y / cm')
zlabel('Z / cm')














