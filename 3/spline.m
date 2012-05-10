%% schleife
t = -3:.001:3;
y = zeros(size(t));
z = zeros(size(t));
for i=1:length(t)
    if((0 <= abs(t(i))) && (abs(t(i)) < 1))
       y(i) = abs(t(i)^3) - 2*t(i)^2 + 1;
       z(i) = 11/4*abs(t(i)^3) - 15/4*t(i)^2 + 1;
    else
        if((1 <= abs(t(i))) && (abs(t(i)) < 2))
            y(i) = -abs(t(i)^3) + 5*t(i)^2 - 8*abs(t(i)) + 4;
            z(i) = 3/4*abs(t(i)^3) - 15/4*t(i)^2 + 12*abs(t(i)) - 3;
        else
            y(i) = 0;
            z(i) = 0;
        end
    end
end
figure; hold on;
plot(t, sinc(t), 'g-');
plot(t, z, 'r-');
plot(t,y);