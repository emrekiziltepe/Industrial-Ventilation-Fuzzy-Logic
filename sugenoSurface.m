global mu_giris
altsinir_x=0; ustsinir_x=100; altsinir_y=0; ustsinir_y=100;
altsinir_z=0; ustsinir_z=100;
X=altsinir_x:ustsinir_x; Y=altsinir_y:ustsinir_y;
a=0; b=0;

for i=1:size(X,2)
    for j=1:size(Y,2)
       toplam_agirlik=0;
        
       x=X(i); y=Y(j);
        
       %x=10; y=80;
        
%Giris - Duman durumu ucgenleri
UcgenFISGiris(altsinir_x,0,0,20,ustsinir_x,x); mu_x_XY=mu_giris;
UcgenFISGiris(altsinir_x,0,30,60,ustsinir_x,x); mu_x_XA=mu_giris;
UcgenFISGiris(altsinir_x,20,60,100,ustsinir_x,x); mu_x_XN=mu_giris;
UcgenFISGiris(altsinir_x,60,100,100,ustsinir_x,x); mu_x_XC=mu_giris;

%Giris - Gaz durumu ucgenleri
UcgenFISGiris(altsinir_y,0,0,20,ustsinir_y,y); mu_y_YY=mu_giris;
UcgenFISGiris(altsinir_y,0,30,60,ustsinir_y,y); mu_y_YA=mu_giris;
UcgenFISGiris(altsinir_y,20,60,100,ustsinir_y,y); mu_y_YN=mu_giris;
UcgenFISGiris(altsinir_y,60,100,100,ustsinir_y,y); mu_y_YC=mu_giris;

z1=a*x+b*y+0;
z2=a*x+b*y+0.25;
z3=a*x+b*y+0.5;
z4=a*x+b*y+0.5;

z5=a*x+b*y+0.25;
z6=a*x+b*y+0.5;
z7=a*x+b*y+0.5;
z8=a*x+b*y+0.75;

z9=a*x+b*y+0.5;
z10=a*x+b*y+0.5;
z11=a*x+b*y+0.75;
z12=a*x+b*y+1;

z13=a*x+b*y+0.5;
z14=a*x+b*y+0.75;
z15=a*x+b*y+1;
z16=a*x+b*y+1;

w1=min(mu_x_XY,mu_y_YY);%Duman Yok Gaz Yok
w2=min(mu_x_XY,mu_y_YA);%Duman Yok Gaz Az
w3=min(mu_x_XY,mu_y_YN);%Duman Yok Gaz Normal
w4=min(mu_x_XY,mu_y_YC);%Duman Yok Gaz Cok

w5=min(mu_x_XA,mu_y_YY);%Duman Az Gaz Yok
w6=min(mu_x_XA,mu_y_YA);%Duman Az Gaz Az
w7=min(mu_x_XA,mu_y_YN);%Duman Az Gaz Normal
w8=min(mu_x_XA,mu_y_YC);%Duman Az Gaz Cok

w9=min(mu_x_XN,mu_y_YY);%Duman Normal Gaz Yok
w10=min(mu_x_XN,mu_y_YA);%Duman Normal Gaz Az
w11=min(mu_x_XN,mu_y_YN);%Duman Normal Gaz Normal
w12=min(mu_x_XN,mu_y_YC);%Duman Normal Gaz Cok

w13=min(mu_x_XC,mu_y_YY);%Duman Cok Gaz Yok
w14=min(mu_x_XC,mu_y_YA);%Duman Cok Gaz Az
w15=min(mu_x_XC,mu_y_YN);%Duman Cok Gaz Normal
w16=min(mu_x_XC,mu_y_YC);%Duman Cok Gaz Cok

SAT=w1*z1+w2*z2+w3*z3+w4*z4+w5*z5+w6*z6+w7*z7+w8*z8+w9*z9+w10*z10+w11*z11+w12*z12+w13*z13+w14*z14+w15*z15+w16*z16;

toplam_agirlik=w1+w2+w3+w4+w5+w6+w7+w8+w9+w10+w11+w12+w13+w14+w15+w16;

if toplam_agirlik == 0
    'Agirlik Merkezi Yonteminde Toplam Alan Sifir!';
end

    z(j,i)=SAT/toplam_agirlik;
    end %j
end %i

surf(X,Y,z)

%z=SAT/toplam_agirlik;
xlabel('Duman');
ylabel('Gaz');
zlabel('Havalandirma');
