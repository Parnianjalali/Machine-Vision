function [c] =select_class(d,mode)
A=['A' 'B' 'C' 'D'];
K=[1 2 3 4];
if strcmp(mode, 'range')
for i=1:4
    for j=1:4
        if i~=j && j>i
            
          B=[i j];
          C = setdiff(K,B);
          s1=d(B(1),C(1))- d(B(2),C(1));
          s2=d(B(1),C(2))- d(B(2),C(2));
          s1=abs(s1);
          s2=abs(s2);
          if s1<15 && s2<15
             A(j)=A(i);
          end
        end
    end
end
c=A;
end

if strcmp(mode, 'entropy')
    for i=1:4
    for j=1:4
        if i~=j && j>i
            
          B=[i j];
          C = setdiff(K,B);
          s1=d(B(1),C(1))- d(B(2),C(1));
          s2=d(B(1),C(2))- d(B(2),C(2));
          s1=abs(s1);
          s2=abs(s2);
          if s1<73 && s2<73
             A(j)=A(i);
          end
        end
    end
end
c=A;
end

if strcmp(mode, 'std')
    for i=1:4
    for j=1:4
        if i~=j && j>i
            
          B=[i j];
          C = setdiff(K,B);
          s1=d(B(1),C(1))- d(B(2),C(1));
          s2=d(B(1),C(2))- d(B(2),C(2));
          s1=abs(s1);
          s2=abs(s2);
          if s1<5 && s2<5
             A(j)=A(i);
          end
        end
    end
end
c=A;
end
            
end

