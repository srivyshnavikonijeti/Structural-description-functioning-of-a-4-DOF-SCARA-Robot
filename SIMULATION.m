L1 = Link([ 0   0    1    0    ]); 
L2 = Link([ 0   0    0.75  pi  ]); 
L3 = Link([ 0   1.5  0    0    ]);
L3.jointtype='P';                  
L3.qlim=[0 2];   %workspace                  
                                   
SCARA = SerialLink([L1 L2 L3]); 

figure(1);
view(3);
SCARA.plot([pi/3 pi/2 1.4]); %The input parameters are L1,L2,L3 Three joint variables

q1 = [0 0 1.4];        %Start joint variable
q2 = [pi/3 pi/2 0];    %End joint variables
q = jtraj(q1, q2, 50); %Toolbox with function planning route

figure(2);
view(3);
SCARA.plot(q);


q11 = [0 0 1.4];
q12 = [pi/3/2 pi/2/2 0.5];
[q_1, v_1, a_1] = jtraj(q11, q12, 25);


q21 = [pi/3/2 pi/2/2 0.5];
q22 = [pi/3 pi/2 1.4];
[q_2, v_2, a_2] = jtraj(q21, q22, 25);

Q = [q_1; q_2];
figure(3);
view(3);
SCARA.plot(Q);
