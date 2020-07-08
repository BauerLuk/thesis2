close all, clear all

plot_circumcircle = 0;
plot_upper_triangle = 0;

u = [0,0];
v = [0,1/3];
p = [1/3,1/3];
q = [1/3,0];

figure
plot(u(1),u(2),'.k','MarkerSize',25)
text(u(1),u(2),'  1, u','FontSize',15,'Color','k')
hold on
plot(v(1),v(2),'.k','MarkerSize',25)
text(v(1),v(2),'  4, v','FontSize',15,'Color','k')
plot(p(1),p(2),'.k','MarkerSize',25)
text(p(1)+0.1,p(2),'  5, p','FontSize',15,'Color','k')
plot(q(1),q(2),'.k','MarkerSize',25)
text(q(1)+0.1,q(2),'  2, q','FontSize',15,'Color','k')
    set(gca,'xdir','reverse')



if (plot_upper_triangle)
   plot([u(1);v(1);p(1);u(1)],[u(2);v(2);p(2);u(2)],'-k','LineWidth', 2) 
end
if (plot_circumcircle)
cor = [[u(1),v(1),p(1)];[u(2),v(2),p(2)]];
        [r,cn] = circumcircle(cor,0);
        
        th=linspace(0,2*pi);
        x=cn(1)+r*cos(th);
        y=cn(2)+r*sin(th);
        pn=[cor,cor(:,1)];
        
        plot(x,y,'--k','LineWidth',1.7);
        plot(cn(1),cn(2),'or','MarkerSize',7,'MarkerFaceColor','r')
        
end     
xlim([-0.1,1/3+0.1])    
ylim([-0.1,1/3+0.1])
axis equal
xlabel('\vartheta / 2\pi','FontSize',15)
ylabel('s','FontSize',15)