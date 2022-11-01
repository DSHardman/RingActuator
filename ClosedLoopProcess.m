clear
ser = serialport("COM7",9600);

%visadevlist
obj1 = visadev("USB0::0x2A8D::0x2F01::MY54412848::0::INSTR");

write(obj1, ':FUNCtion:IMPedance:TYPE RD');%%RD|CPQ|CPG|CPRP|CSD|CSQ|CSRS|LPD|LPQ|LPG|LPRP|LPRD|LSD|LSQ|LSRS|LS
%%RD|RX|ZTD|ZTR|GB|YTD|YTR|VDID
write(obj1, ':FREQuency:CW 10000');
write(obj1, ':VOLTage:LEVel 20');
write(obj1, ':APERture SHORt');%SHORt MEDium
write(obj1, ':DISPlay:ENABle 1');%disable display

y = [];
tic
while toc < 4
    readout = writeread(obj1, "FETCh:IMPedance:CORRected?");
    readout = split(readout,",");
    y1 = eval(readout(1));
    y = [y;y1];
end

y = smooth(y)./100000;
% [~, locs] = findpeaks(y);
% y(locs(end))
% max(y)
value = max(smooth(y))
if value < 1.9
    fprintf("Grip Case Detected\n");
    ser.writeline('g');
elseif value < 1.92
    fprintf("Leave Case Detected\n");
    ser.writeline('l');
elseif value < 1.95
    fprintf("Slow Case Detected\n");
    ser.writeline('s');
elseif value < 2.05
    fprintf("Fast Case Detected\n");
    ser.writeline('f');
% elseif y(locs(end-1)) < 2.06
%     if y(locs(end-1))-y(locs(end-1)+30) > 0.005
%         fprintf("Slow Case Detected\n");
%         ser.writeline("s");
%     else
%         fprintf("Fast Case Detected\n");
%         ser.writeline("f");
%     end
else
    fprintf("Empty\n");
    ser.writeline('e');
end

