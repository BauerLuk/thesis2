close all
Color_1 = 0.75*ones(1,3);
%Cyl
deltas1 = load('alphas_555_pp0c2_3keV_cyl_4min5_over_meas.dat');
deltas2 = load('alphas_555_pp0c2_3keV_cyl_5th_over_meas.dat');
deltas3 = load('alphas_121212_pp0c2_3keV_cyl_5th_over_meas.dat');
deltas4 = load('alphas_121212_pp0c2_3keV_cyl_4min5_over_meas.dat');

%
%deltas1 = load('fort.95');
%deltas1 = [deltas(:,1),deltas(:,2)]
%deltas2 = [deltas(:,1),deltas(:,3)]
%


% figure 1 - RK4_alpha555_cyl.pdf
figure('Position', [0, 0, 1500, 800]);
p3 = loglog([1E-20,1E-9],[1E-20,1E-9])
set(p3,'LineWidth',1.5,'Color',[0.5,0.5,0.5],'LineStyle','-')
set(gca,'FontSize',20)
hold on
p5 = loglog(deltas2(:,1),deltas2(:,2),'.');
set(p5,'MarkerSize',7,'Marker','o','Color',Color_1)
p4 = loglog(deltas1(:,1),deltas1(:,2),'.');
set(p4,'MarkerSize',7,'Marker','x','Color','k')

xlabel('measured error / cm','FontSize',25)
ylabel('analytic error / cm','FontSize',25)
axis square
 
xlim([1E-20,1E-9])
ylim([1E-20,1E-9])
grid on

l2 = legend('analytic error = measured error','analytic error (\DeltaR5) over measured error','analytic error (R4-R5) over measured error','Location','NW');
set(l2,'FontSize',15);
hold off
set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
saveas(gcf,'/home/luki/Documents/thesis/figures/RK4_alpha555_cyl.pdf')
%%
%figure 2 - RK4_alpha121212_cyl.pdf
figure('Position', [0, 0, 1500, 800]);
p3 = loglog([1E-20,1E-9],[1E-20,1E-9])
set(p3,'LineWidth',1.5,'Color',[0.5,0.5,0.5],'LineStyle','-')
set(gca,'FontSize',20)
hold on
p5 = loglog(deltas3(:,1),deltas3(:,2),'.');
set(p5,'MarkerSize',7,'Marker','o','Color',Color_1)
p4 = loglog(deltas4(:,1),deltas4(:,2),'.');
set(p4,'MarkerSize',7,'Marker','x','Color','k')

xlabel('measured error / cm','FontSize',25)
ylabel('analytic error / cm','FontSize',25)
axis square

xlim([1E-20,1E-9])
ylim([1E-20,1E-9])
grid on

l2 = legend('analytic error = measured error','analytic error (\DeltaR5) over measured error','analytic error (R4-R5) over measured error','Location','NW');
set(l2,'FontSize',15);
hold off
set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
saveas(gcf,'/home/luki/Documents/thesis/figures/RK4_alpha121212_cyl.pdf')
%SFC
deltas1 = load('alphas_555_pp0c2_3keV_SFC_4min5_over_meas.dat');
deltas2 = load('alphas_555_pp0c2_3keV_SFC_5th_over_meas.dat');
deltas3 = load('alphas_121212_pp0c2_3keV_SFC_5th_over_meas.dat');
deltas4 = load('alphas_121212_pp0c2_3keV_SFC_4min5_over_meas.dat');


% figure 3 - RK4_alpha555_SFC.pdf
figure('Position', [0, 0, 1500, 800]);
p3 = loglog([1E-20,1E-9],[1E-20,1E-9])
set(p3,'LineWidth',1.5,'Color',[0.5,0.5,0.5],'LineStyle','-')
set(gca,'FontSize',20)
hold on
p5 = loglog(deltas2(:,1),deltas2(:,2),'.');
set(p5,'MarkerSize',7,'Marker','o','Color',Color_1)
p4 = loglog(deltas1(:,1),deltas1(:,2),'.');
set(p4,'MarkerSize',7,'Marker','x','Color','k')

xlabel('measured error / 1','FontSize',25)
ylabel('analytic error / 1','FontSize',25)
axis square

xlim([1E-20,1E-9])
ylim([1E-20,1E-9])
grid on

l2 = legend('analytic error = measured error','analytic error (\Deltas5) over measured error','analytic error (s4-s5) over measured error','Location','NW');
set(l2,'FontSize',15);
hold off
set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
saveas(gcf,'/home/luki/Documents/thesis/figures/RK4_alpha555_SFC.pdf')

%figure 4 - RK4_alpha121212_SFC.pdf
figure('Position', [0, 0, 1500, 800]);
p3 = loglog([1E-20,1E-9],[1E-20,1E-9])
set(p3,'LineWidth',1.5,'Color',[0.5,0.5,0.5],'LineStyle','-')
set(gca,'FontSize',20)
hold on
p5 = loglog(deltas3(:,1),deltas3(:,2),'.');
set(p5,'MarkerSize',7,'Marker','o','Color',Color_1)
p4 = loglog(deltas4(:,1),deltas4(:,2),'.');
set(p4,'MarkerSize',7,'Marker','x','Color','k')

xlabel('measured error / 1','FontSize',25)
ylabel('analytic error / 1','FontSize',25)
axis square

xlim([1E-20,1E-9])
ylim([1E-20,1E-9])
grid on

l2 = legend('analytic error = measured error','analytic error (\Deltas5) over measured error','analytic error (s4-s5) over measured error','Location','NW');
set(l2,'FontSize',15);
hold off
set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
saveas(gcf,'/home/luki/Documents/thesis/figures/RK4_alpha121212_SFC.pdf')