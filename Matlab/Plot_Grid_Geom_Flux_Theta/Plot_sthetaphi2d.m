clear all, close all

% Flux theta distributed, theta= 0 through X-point
verts = load('sthetaphi2d_verts.obj');
lines = load('sthetaphi2d_lines.obj');

%Plot Options
plot_vertex_numbers = 1;
plot_vertex_number_next_slice = 0; %
if plot_vertex_numbers ==0 % Do not allow incorrect combination of booleans
    plot_vertex_number_next_slice = 0
end
plot_circumcircles = 0; %logical 1= plot, 0 = noplot
plot_lines = 1;
plot_voronoi = 0;

%Plot
figure
for i = 1: size(lines,1)
    theta = verts(lines(i,:),2);
    if any(theta>=pi)
        theta(theta==0)= 2*pi;
    end
    
    if plot_lines==1
        plot(theta/2/pi,verts(lines(i,:),1),'-','Color',[0.6,0.6,0.6],'LineWidth',0.15)
    end
    hold on
    set(gca,'xdir','reverse')
    if (plot_circumcircles==1)&& ((i==8))%|| (i==7) )
        cor = [verts(lines(i,1:3),2).'/2/pi;verts(lines(i,1:3),1).'];
        if any(cor(1,:)>= 0.5)
            cor(1,cor(1,:)==0)= 1;
        end
        [r,cn] = circumcircle(cor,0);
        
        th=linspace(0,2*pi);
        x=cn(1)+r*cos(th);
        y=cn(2)+r*sin(th);
        pn=[cor,cor(:,1)];
        
        plot(x,y,'k','LineWidth',2);
        plot(cn(1),cn(2),'xr','MarkerSize',7)
    end
end
plot(verts(:,2)/2/pi,verts(:,1),'.k','MarkerSize',15)
plot(ones(size(verts(:,1))),verts(:,1),'.k','MarkerSize',15)

if plot_vertex_numbers == 1
    
    for i = 1:size(verts,1)
        vert = verts(i,:);
        vert(2) = vert(2)/(2*pi);
        if plot_vertex_number_next_slice ==1
            text(vert(2),vert(1),['  ',num2str(i),' (',num2str(i+size(verts,1)),')'],'FontSize',12,'Color','k')
            if vert(2)==0
                text(1,vert(1),['  ',num2str(i),' (',num2str(i+size(verts,1)),')'],'FontSize',12,'Color','k')
            end            
        else
            text(vert(2),vert(1),['  ',num2str(i)],'FontSize',12,'Color','k')
            if vert(2)==0
                text(1,vert(1),['  ',num2str(i)],'FontSize',12,'Color','k')
            end
        end
    end
end
if plot_voronoi == 1
    voronoi([verts(:,2)/2/pi;ones(sum(verts(:,2)==0),1)],[verts(:,1);verts(verts(:,2)==0,1)])
end
axis equal
%axis off
xlabel('\vartheta / 2\pi','FontSize',15)
ylabel('s','FontSize',15)
xlim([-0.1,1.1])
ylim([-0.1,1.1])
