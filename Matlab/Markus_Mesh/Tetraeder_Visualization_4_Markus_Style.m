clear all, close all
Savepath='Tetra_split.eps';

P = [0,0,0;...
    0,0,1;...
    0,1,0;...
    0,1,1;...
    1,0,0;...
    1,0,1;...
    1,1,0;...
    1,1,1];
P = [P(:,1),P(:,3),P(:,2)];

T1X = P([0,2,3,7]+1,:);
T2X = P([0,2,6,7]+1,:);
T3X = P([0,4,6,7]+1,:);

T1Y = P([0,1,2,6]+1,:);
T2Y = P([0,1,5,6]+1,:);
T3Y = P([0,4,5,6]+1,:);


%   Tetraeder1 = alphaShape(T1X);
%   Tetraeder2 = alphaShape(T2X);
%   Tetraeder3 = alphaShape(T3X);
% % %
%   Tetraeder4 = alphaShape(T1Y);
%   Tetraeder5 = alphaShape(T2Y);
%   Tetraeder6 = alphaShape(T3Y);

%figure('units','normalized','outerposition',[0 0 0.60 1])
figure
subplot(121)
%grid off
hold on
plot_tetrahedron(T1X)
plot_tetrahedron(T2X)
plot_tetrahedron(T3X)
axis tight
for i=1:8
    if (i == 6 || i ==2)
        continue
    end
    text(P(i,1)+0.01,P(i,2),P(i,3)-0.015,['  ',num2str(i-1)],'FontSize',32,'Color','k')
end
 xlabel('\phi','FontSize',20)
 ylabel('\vartheta','FontSize',20)
 zlabel('s','FontSize',20)


% set(gca,'XTick',[])
% set(gca,'YTick',[])
% set(gca,'ZTick',[])
% 
% set(gca,'XTickLabel',[])
% set(gca,'YTickLabel',[])
% set(gca,'ZTickLabel',[])

subplot(122)
% Prism 2
hold on
plot_tetrahedron(T1Y)

 plot_tetrahedron(T2Y)
 plot_tetrahedron(T3Y)

for i=1:8
        if (i == 4 || i ==8)
        continue
    end
    text(P(i,1)+0.01,P(i,2),P(i,3)-0.015,['  ',num2str(i-1)],'FontSize',32,'Color','k')
end
 xlabel('\phi','FontSize',20)
 ylabel('\vartheta','FontSize',20)
 zlabel('s','FontSize',20)
axis tight
%xlim([0,1])
%ylim([0,1])
%zlim([-1,0])
%view(-1650,-35)
% 

print(Savepath,'-depsc');

