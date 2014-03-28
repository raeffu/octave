
%Punkte A,B,C,D
a=[0,-10,-6]; b=[2,-11,8];
c=[-4,1,7];   d=[5,0,-1];

%Ebene1 n=(b-a)x(c-a),k=-n.a  
n=cross(b-a,c-a);
k=-dot(n,a);

%Ebene2 m=(b-a)x(d-a),l=-m.a
m=cross(b-a,d-a);
l=-dot(m,a);

%Schnittgerade
w=cross(n,m)/norm(cross(n,m));
E=dot(n,n);F=dot(m,m);G=dot(n,m);
q=(-k*F+l*G)/(E*F-G^2)*n+(-l*E+k*G)/(E*F-G^2)*m;

%Graphik
figure(1); clf; hold on; colormap("default");
x=linspace(-5,5,2);y=linspace(-12,1,2);
[X,Y]=meshgrid(x,y);

Z=-1/n(3)*(n(1)*X+n(2)*Y+k);
surf(X,Y,Z)

Z=-1/m(3)*(m(1)*X+m(2)*Y+l);
surf(X,Y,Z)

g=[q+40*w;q-25*w]';
plot3(g(1,:),g(2,:),g(3,:),'r','LineWidth',2);

hold off
print('figIntersectPlane.png','-dpng')