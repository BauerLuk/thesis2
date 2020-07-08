function plot_tetrahedron(Tetrahedronpoints)
for i = 1:size(Tetrahedronpoints,1)
    for j = i+1:size(Tetrahedronpoints,1)
        [Tetrahedronpoints([i,j],1),Tetrahedronpoints([i,j],2),Tetrahedronpoints([i,j],3)]
            plot3(Tetrahedronpoints([i,j],1),Tetrahedronpoints([i,j],2),Tetrahedronpoints([i,j],3),'k','LineWidth',2)
    end
end
end