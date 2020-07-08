clear all, close all

s = 5;%cauchy distribution parameter;
 %fun = @(z) s./((z).^2+s^2)/pi;
%fun = @(z) exp(-z);%1./(abs(z)+1)%sin(z);
%fun = @(z) 1./(abs(z)+1).*cos(z);
fun = @(z) exp(z) + z.^8;
figure(1)
n = [3,4,5];

for i = 1:numel(n)
print_lagrange(fun,n(i), [num2str(1),num2str(numel(n)),num2str(i)])
end

print('./lagrange_interp_plot1','-depsc');

function print_lagrange(fun,n,subplotind)
z_k = linspace(0,4,n);
f_k = fun(z_k);
z = linspace(min(z_k),max(z_k),10000);
f = arrayfun(@(z) P_fun(z,z_k,f_k),z);

subplot(subplotind)
Fontsize = 40;
MarkerSize = 30;

plot(z_k,f_k,'k.','MarkerSize',MarkerSize)
title(['(n+1) = ',num2str(n)],'FontSize',Fontsize-5)
hold on
plot(z,fun(z),'Linestyle','--','LineWidth',1.5)
plot(z,f,'k-','LineWidth',1.5)
hold off
xlabel('z','FontSize',Fontsize)
ylabel('f(z)','FontSize',Fontsize)
%legend('f(z_k)','f(z)','P_n(z)','FontSize',15)
set(gcf,'Position',[1 55 2560 1302])
% xlim([-12 12])
% ylim([0 0.5])
% axis tight
end



function lk_out = lk_fun(z,k,z_vec)
lk_out = 1;
for j = 1:numel(z_vec)
    if (j == k)
        continue
    else
        lk_out = lk_out * (z-z_vec(j))/(z_vec(k)-z_vec(j));
    end
end
end
function P_out = P_fun(z,z_k,f_k)
P_out = 0;
for i = 1:numel(z_k)
    P_out = P_out + lk_fun(z,i,z_k)*f_k(i);
end
end
