format long g;
csvID = fopen('imgpos.csv'); %changer le nom du fichier ici. 
% A priori le format du fichier d'entrée est *.csv avec le format: 
% nom_du_scan,X,Y,Z,angleX,angleY,angleZ
C = textscan(csvID,'%s %f %f %f %f %f %f',...
'Delimiter',',','EmptyValue',-Inf);
fclose(csvID);

s=size(C{1},1);

for i=1:s
   name = char(C{1}(i)); 
   X = num2str(C{2}(i));
   Y = num2str(C{3}(i));
   Z = num2str(C{4}(i));
   aX = num2str(C{6}(i)-180);
   aY = num2str(C{5}(i));
   aZ = num2str(360-C{7}(i));
   
   fid = fopen(strcat(name,'.excam'),'w');
   fprintf(fid,sprintf('[Camera origin]\r\n'));
   fprintf(fid,sprintf(strcat('X=',X,'\r\n')));
   fprintf(fid,sprintf(strcat('Y=',Y,'\r\n')));
   fprintf(fid,sprintf(strcat('Z=',Z,'\r\n')));
   fprintf(fid,sprintf('[Angle Parameters]\r\n'));
   fprintf(fid,sprintf('Convention=1\r\n'));
   fprintf(fid,sprintf('Unit=1\r\n'));
   fprintf(fid,sprintf(strcat('Omega=',aX,'\r\n')));
   fprintf(fid,sprintf(strcat('Phi=',aY,'\r\n')));
   fprintf(fid,sprintf(strcat('Kappa=',aZ)));
   fclose(fid);
end
