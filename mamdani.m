global X mu_X mu_xi;
altsinir_x=0; ustsinir_x=100; altsinir_y=0; ustsinir_y=100;
altsinir_z=0; ustsinir_z=100;
xi=10; yi=80; zi=0;

%Giris - Duman durumu ucgenleri
Ucgen(altsinir_x,0,0,20,ustsinir_x,xi); x_Y=X; mu_XY=mu_X; mu_xi_XY=mu_xi;
Ucgen(altsinir_x,0,30,60,ustsinir_x,xi); x_A=X; mu_XA=mu_X; mu_xi_XA=mu_xi;
Ucgen(altsinir_x,20,60,100,ustsinir_x,xi); x_N=X; mu_XN=mu_X; mu_xi_XN=mu_xi;
Ucgen(altsinir_x,60,100,100,ustsinir_x,xi); x_C=X; mu_XC=mu_X; mu_xi_XC=mu_xi;

%Giris - Gaz durumu ucgenleri
Ucgen(altsinir_y,0,0,20,ustsinir_y,yi); y_Y=X; mu_YY=mu_X; mu_yi_YY=mu_xi;
Ucgen(altsinir_y,0,30,60,ustsinir_y,yi); y_A=X; mu_YA=mu_X; mu_yi_YA=mu_xi;
Ucgen(altsinir_y,20,60,100,ustsinir_y,yi); y_N=X; mu_YN=mu_X; mu_yi_YN=mu_xi;
Ucgen(altsinir_y,60,100,100,ustsinir_y,yi); y_C=X; mu_YC=mu_X; mu_yi_YC=mu_xi;

%Cikis - Havalandirma sonuc ucgenleri
Ucgen(altsinir_z,0,0,25,ustsinir_z,zi); z_D=X; mu_ZD=mu_X;
Ucgen(altsinir_z,0,25,50,ustsinir_z,zi); z_A=X; mu_ZA=mu_X;
Ucgen(altsinir_z,25,50,75,ustsinir_z,zi); z_O=X; mu_ZO=mu_X;
Ucgen(altsinir_z,50,75,100,ustsinir_z,zi); z_Y=X; mu_ZY=mu_X;
Ucgen(altsinir_z,75,100,100,ustsinir_z,zi); z_CY=X; mu_ZCY=mu_X;

%Kurallar
mu_kural1=min(mu_xi_XY,mu_yi_YY);%Duman Yok Gaz Yok
mu_kural2=min(mu_xi_XY,mu_yi_YA);%Duman Yok Gaz Az
mu_kural3=min(mu_xi_XY,mu_yi_YN);%Duman Yok Gaz Normal
mu_kural4=min(mu_xi_XY,mu_yi_YC);%Duman Yok Gaz Cok

mu_kural5=min(mu_xi_XA,mu_yi_YY);%Duman Az Gaz Yok
mu_kural6=min(mu_xi_XA,mu_yi_YA);%Duman Az Gaz Az
mu_kural7=min(mu_xi_XA,mu_yi_YN);%Duman Az Gaz Normal
mu_kural8=min(mu_xi_XA,mu_yi_YC);%Duman Az Gaz Cok

mu_kural9=min(mu_xi_XN,mu_yi_YY);%Duman Normal Gaz Yok
mu_kural10=min(mu_xi_XN,mu_yi_YA);%Duman Normal Gaz Az
mu_kural11=min(mu_xi_XN,mu_yi_YN);%Duman Normal Gaz Normal
mu_kural12=min(mu_xi_XN,mu_yi_YC);%Duman Normal Gaz Cok

mu_kural13=min(mu_xi_XC,mu_yi_YY);%Duman Cok Gaz Yok
mu_kural14=min(mu_xi_XC,mu_yi_YA);%Duman Cok Gaz Az
mu_kural15=min(mu_xi_XC,mu_yi_YN);%Duman Cok Gaz Normal
mu_kural16=min(mu_xi_XC,mu_yi_YC);%Duman Cok Gaz Cok

%Sonuclar
mu_sonuc1=mu_kural1*mu_ZD;
mu_sonuc2=mu_kural2*mu_ZA;
mu_sonuc3=mu_kural3*mu_ZO;
mu_sonuc4=mu_kural4*mu_ZO;

mu_sonuc5=mu_kural5*mu_ZA;
mu_sonuc6=mu_kural6*mu_ZO;
mu_sonuc7=mu_kural7*mu_ZO;
mu_sonuc8=mu_kural8*mu_ZY;

mu_sonuc9=mu_kural9*mu_ZO;
mu_sonuc10=mu_kural10*mu_ZO;
mu_sonuc11=mu_kural11*mu_ZY;
mu_sonuc12=mu_kural12*mu_ZCY;

mu_sonuc13=mu_kural13*mu_ZO;
mu_sonuc14=mu_kural14*mu_ZY;
mu_sonuc15=mu_kural15*mu_ZCY;
mu_sonuc16=mu_kural16*mu_ZCY;

%plot(X,mu_sonuc1,X,mu_sonuc2,X,mu_sonuc3,X,mu_sonuc4,X,mu_sonuc5,X,mu_sonuc6,X,mu_sonuc7,X,mu_sonuc8,X,mu_sonuc9,X,mu_sonuc10,X,mu_sonuc11,X,mu_sonuc12,X,mu_sonuc13,X,mu_sonuc14,X,mu_sonuc15,X,mu_sonuc16)

mu_birlestirme1=max(max(mu_sonuc1,mu_sonuc2),max(mu_sonuc3,mu_sonuc4));
mu_birlestirme2=max(max(mu_sonuc5,mu_sonuc6),max(mu_sonuc7,mu_sonuc8));
mu_birlestirme3=max(max(mu_sonuc9,mu_sonuc10),max(mu_sonuc11,mu_sonuc12));
mu_birlestirme4=max(max(mu_sonuc13,mu_sonuc14),max(mu_sonuc15,mu_sonuc16));

mu_birlestirme=max(max(mu_birlestirme1,mu_birlestirme2),max(mu_birlestirme3,mu_birlestirme4));

plot(X,mu_birlestirme);
toplam_alan = sum(mu_birlestirme);
z=sum(mu_birlestirme.*X)/toplam_alan;
line([z,z],[0,1]);

