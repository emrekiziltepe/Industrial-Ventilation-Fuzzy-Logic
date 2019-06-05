global mu_giris CIKIS mu_CIKIS;
altsinir_x=0; ustsinir_x=100; altsinir_y=0; ustsinir_y=100;
altsinir_z=0; ustsinir_z=100;

X=altsinir_x:ustsinir_x; Y=altsinir_y:ustsinir_y;

for i=1:size(X,2)
    for j=1:size(Y,2)
        xi=X(i); yi=Y(j);
%Giris - Duman durumu ucgenleri
UcgenFISGiris(altsinir_x,0,0,20,ustsinir_x,xi); mu_x_XY=mu_giris;
UcgenFISGiris(altsinir_x,0,30,60,ustsinir_x,xi); mu_x_XA=mu_giris;
UcgenFISGiris(altsinir_x,20,60,100,ustsinir_x,xi); mu_x_XN=mu_giris;
UcgenFISGiris(altsinir_x,60,100,100,ustsinir_x,xi); mu_x_XC=mu_giris;

%Giris - Gaz durumu ucgenleri
UcgenFISGiris(altsinir_y,0,0,20,ustsinir_y,yi); mu_y_YY=mu_giris;
UcgenFISGiris(altsinir_y,0,30,60,ustsinir_y,yi); mu_y_YA=mu_giris;
UcgenFISGiris(altsinir_y,20,60,100,ustsinir_y,yi); mu_y_YN=mu_giris;
UcgenFISGiris(altsinir_y,60,100,100,ustsinir_y,yi); mu_y_YC=mu_giris;

%Cikis - Havalandirma sonuc ucgenleri
UcgenFISCikis(altsinir_z,0,0,25,ustsinir_z); Z=CIKIS; mu_ZD=mu_CIKIS;
UcgenFISCikis(altsinir_z,0,25,50,ustsinir_z);         mu_ZA=mu_CIKIS;
UcgenFISCikis(altsinir_z,25,50,75,ustsinir_z);       mu_ZO=mu_CIKIS;
UcgenFISCikis(altsinir_z,50,75,100,ustsinir_z);      mu_ZY=mu_CIKIS;
UcgenFISCikis(altsinir_z,75,100,100,ustsinir_z);      mu_ZCY=mu_CIKIS;

%Kurallar
mu_kural1=min(mu_x_XY,mu_y_YY);%Duman Yok Gaz Yok
mu_kural2=min(mu_x_XY,mu_y_YA);%Duman Yok Gaz Az
mu_kural3=min(mu_x_XY,mu_y_YN);%Duman Yok Gaz Normal
mu_kural4=min(mu_x_XY,mu_y_YC);%Duman Yok Gaz Cok

mu_kural5=min(mu_x_XA,mu_y_YY);%Duman Az Gaz Yok
mu_kural6=min(mu_x_XA,mu_y_YA);%Duman Az Gaz Az
mu_kural7=min(mu_x_XA,mu_y_YN);%Duman Az Gaz Normal
mu_kural8=min(mu_x_XA,mu_y_YC);%Duman Az Gaz Cok

mu_kural9=min(mu_x_XN,mu_y_YY);%Duman Normal Gaz Yok
mu_kural10=min(mu_x_XN,mu_y_YA);%Duman Normal Gaz Az
mu_kural11=min(mu_x_XN,mu_y_YN);%Duman Normal Gaz Normal
mu_kural12=min(mu_x_XN,mu_y_YC);%Duman Normal Gaz Cok

mu_kural13=min(mu_x_XC,mu_y_YY);%Duman Cok Gaz Yok
mu_kural14=min(mu_x_XC,mu_y_YA);%Duman Cok Gaz Az
mu_kural15=min(mu_x_XC,mu_y_YN);%Duman Cok Gaz Normal
mu_kural16=min(mu_x_XC,mu_y_YC);%Duman Cok Gaz Cok

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


        toplam_alan = sum(mu_birlestirme);
        if toplam_alan == 0
        'Agirlik Merkezi Yonteminde Toplam Alan Sifir!';
        end
        z(j,i) = sum(mu_birlestirme.*Z)/toplam_alan;
    end %j
end %i

[x,y]=meshgrid(X,Y);
surf(x,y,z)
xlabel('Duman');
ylabel('Gaz');
zlabel('Havalandirma');
    
    
 
