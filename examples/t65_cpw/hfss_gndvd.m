function serial  = hfss_gndvd(fid,X , Y, Z, L, W, H, F, Thickness, serial, material)
    [mat colr] = hfssgetmaterial(material);       
    hfssUDP(fid, 'gndvd', strcat('L', num2str(serial)), 8, {'xp', 'yp',  'zp', 'Length','Width','Hole', 'Fill','thickness'},...
            {X, Y, Z,   L, W, H ,F, Thickness}, mat, colr,1);     
    serial = serial + 1;