% This program is designed to determine the flow regime and fluid height in
% a reservoir.

% Main Parameters

Q=input(' define the flow rate in lt/sec: ');
Gamma=input(' define the unit weight in units of kN/m^3: ');
kinvisco=input(' define the kinematic viscosity in units of cm^2/sec: ');
L=input('define the length of pipe in units of m: ');
D=input(' define the diameter of pipe in units of cm: ');

g=9.81; % Gravitational acceleration

%-------------------------------------------------------------------------%


Pi=3.14; % Pi number 
A=Pi*(D^2)/4 ; % Cross-sectional area

Q'==Q/1000;

% Determination of flow regime

V2=Q'/A;
Re=((V2*1000)*D)/kinvisco;

if Re<2100
    disp('Laminar regime')
elseif 2100<Re<4000
    disp('Transient regime')
elseif Re>4000
    disp('Turbulent regime')
end
%-------------------------------------------------------------------------%
    
% Determination of fluid height in the reservoir

V1=0;
P1=1; % Pressure is atmospheric pressure 
P2=1; % Pressure is atmospheric pressure 

z1=1;
H=1;

z1=H;
z2=0;

fr=64/Re; % Friction factor

% Head loss

hk=fr*((L)/(D/100))*(V2^2)/(2*g);

z1=((P2-P1)/Gamma)+((V2^2-V1^2)/(2*g))+z2+hk;