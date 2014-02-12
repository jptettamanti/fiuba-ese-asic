
module alu ( operation, a_i, b_i, psr, result, apsr );
  input [3:0] operation;
  input [7:0] a_i;
  input [7:0] b_i;
  input [2:0] psr;
  output [7:0] result;
  output [2:0] apsr;
  wire   N68, N69, N70, N71, N72, N73, N74, N75, N76, N87, N88, N89, N90, N91,
         N92, N93, N94, N95, N97, N98, N99, N100, N101, N102, N103, N104, N114,
         N115, N116, N117, N118, N119, N120, N121, DP_OP_36J1_125_9744_n52,
         DP_OP_36J1_125_9744_n51, DP_OP_36J1_125_9744_n49,
         DP_OP_36J1_125_9744_n16, DP_OP_36J1_125_9744_n15,
         DP_OP_36J1_125_9744_n14, DP_OP_36J1_125_9744_n13,
         DP_OP_36J1_125_9744_n12, DP_OP_36J1_125_9744_n11,
         DP_OP_36J1_125_9744_n10, DP_OP_35J1_124_9704_n36,
         DP_OP_35J1_124_9704_n34, DP_OP_35J1_124_9704_n33,
         DP_OP_35J1_124_9704_n27, DP_OP_35J1_124_9704_n25,
         DP_OP_35J1_124_9704_n24, DP_OP_35J1_124_9704_n23,
         DP_OP_35J1_124_9704_n8, DP_OP_35J1_124_9704_n7,
         DP_OP_35J1_124_9704_n6, DP_OP_35J1_124_9704_n5,
         DP_OP_35J1_124_9704_n4, DP_OP_35J1_124_9704_n3,
         DP_OP_35J1_124_9704_n2, add_x_1_n8, add_x_1_n7, add_x_1_n6,
         add_x_1_n5, add_x_1_n4, add_x_1_n3, add_x_1_n2, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207;

  XNOR3X1 DP_OP_36J1_125_9744__cell_865 ( .IN1(DP_OP_36J1_125_9744_n10), .IN2(
        a_i[7]), .IN3(n31), .Q(N104) );
  OR2X1 DP_OP_36J1_125_9744__cell_874 ( .IN1(N99), .IN2(n46), .Q(n47) );
  XNOR2X1 DP_OP_36J1_125_9744__cell_875 ( .IN1(N99), .IN2(n46), .Q(N116) );
  OR2X1 DP_OP_36J1_125_9744__cell_876 ( .IN1(N98), .IN2(n45), .Q(n46) );
  FADDX1 DP_OP_36J1_125_9744_U23 ( .A(n53), .B(n41), .CI(
        DP_OP_36J1_125_9744_n15), .CO(DP_OP_36J1_125_9744_n14), .S(N99) );
  FADDX1 DP_OP_36J1_125_9744_U20 ( .A(a_i[5]), .B(n79), .CI(
        DP_OP_36J1_125_9744_n12), .CO(DP_OP_36J1_125_9744_n11), .S(N102) );
  FADDX1 DP_OP_36J1_125_9744_U19 ( .A(n26), .B(n55), .CI(
        DP_OP_36J1_125_9744_n11), .CO(DP_OP_36J1_125_9744_n10), .S(N103) );
  FADDX1 DP_OP_35J1_124_9704_U9 ( .A(DP_OP_35J1_124_9704_n23), .B(n58), .CI(
        psr[1]), .CO(DP_OP_35J1_124_9704_n8), .S(N87) );
  FADDX1 DP_OP_35J1_124_9704_U8 ( .A(n33), .B(n38), .CI(DP_OP_35J1_124_9704_n8), .CO(DP_OP_35J1_124_9704_n7), .S(N88) );
  FADDX1 DP_OP_35J1_124_9704_U6 ( .A(DP_OP_36J1_125_9744_n49), .B(n34), .CI(
        DP_OP_35J1_124_9704_n6), .CO(DP_OP_35J1_124_9704_n5), .S(N90) );
  FADDX1 DP_OP_35J1_124_9704_U5 ( .A(DP_OP_35J1_124_9704_n27), .B(n27), .CI(
        DP_OP_35J1_124_9704_n5), .CO(DP_OP_35J1_124_9704_n4), .S(N91) );
  FADDX1 DP_OP_35J1_124_9704_U4 ( .A(DP_OP_36J1_125_9744_n51), .B(
        DP_OP_35J1_124_9704_n36), .CI(DP_OP_35J1_124_9704_n4), .CO(
        DP_OP_35J1_124_9704_n3), .S(N92) );
  FADDX1 DP_OP_35J1_124_9704_U3 ( .A(b_i[6]), .B(a_i[6]), .CI(
        DP_OP_35J1_124_9704_n3), .CO(DP_OP_35J1_124_9704_n2), .S(N93) );
  FADDX1 DP_OP_35J1_124_9704_U2 ( .A(n31), .B(n35), .CI(DP_OP_35J1_124_9704_n2), .CO(N95), .S(N94) );
  FADDX1 add_x_1_U8 ( .A(n38), .B(DP_OP_35J1_124_9704_n24), .CI(add_x_1_n8), 
        .CO(add_x_1_n7), .S(N69) );
  FADDX1 add_x_1_U5 ( .A(n27), .B(b_i[4]), .CI(add_x_1_n5), .CO(add_x_1_n4), 
        .S(N72) );
  FADDX1 add_x_1_U4 ( .A(add_x_1_n4), .B(b_i[5]), .CI(a_i[5]), .CO(add_x_1_n3), 
        .S(N73) );
  FADDX1 add_x_1_U7 ( .A(DP_OP_35J1_124_9704_n33), .B(DP_OP_35J1_124_9704_n25), 
        .CI(add_x_1_n7), .CO(add_x_1_n6), .S(N70) );
  FADDX1 add_x_1_U6 ( .A(b_i[3]), .B(DP_OP_35J1_124_9704_n34), .CI(add_x_1_n6), 
        .CO(add_x_1_n5), .S(N71) );
  FADDX1 add_x_1_U3 ( .A(a_i[6]), .B(DP_OP_36J1_125_9744_n52), .CI(add_x_1_n3), 
        .CO(add_x_1_n2), .S(N74) );
  FADDX1 add_x_1_U2 ( .A(n35), .B(n31), .CI(add_x_1_n2), .CO(N76), .S(N75) );
  NBUFFX2 U2 ( .INP(b_i[2]), .Z(DP_OP_35J1_124_9704_n25) );
  INVX0 U3 ( .INP(N97), .ZN(n57) );
  NBUFFX2 U4 ( .INP(operation[0]), .Z(n36) );
  NBUFFX2 U5 ( .INP(a_i[1]), .Z(n38) );
  NBUFFX2 U6 ( .INP(a_i[2]), .Z(n41) );
  NBUFFX2 U7 ( .INP(n202), .Z(n91) );
  INVX0 U8 ( .INP(b_i[6]), .ZN(n55) );
  AND3X1 U9 ( .IN1(n110), .IN2(n122), .IN3(n29), .Q(n142) );
  NOR2X0 U10 ( .IN1(DP_OP_35J1_124_9704_n33), .IN2(n25), .QN(n155) );
  FADDX1 U11 ( .A(n52), .B(DP_OP_36J1_125_9744_n16), .CI(a_i[1]), .CO(
        DP_OP_36J1_125_9744_n15), .S(N98) );
  NBUFFX2 U12 ( .INP(a_i[1]), .Z(n88) );
  NBUFFX2 U13 ( .INP(a_i[2]), .Z(DP_OP_35J1_124_9704_n33) );
  NBUFFX2 U14 ( .INP(n197), .Z(n43) );
  INVX0 U15 ( .INP(n199), .ZN(n200) );
  INVX0 U16 ( .INP(b_i[6]), .ZN(n78) );
  NBUFFX2 U17 ( .INP(n207), .Z(n90) );
  NBUFFX2 U18 ( .INP(n197), .Z(n92) );
  NBUFFX2 U19 ( .INP(n196), .Z(n94) );
  NBUFFX2 U20 ( .INP(operation[3]), .Z(n83) );
  OR2X1 U21 ( .IN1(n47), .IN2(N100), .Q(n48) );
  INVX0 U22 ( .INP(n28), .ZN(n1) );
  INVX0 U23 ( .INP(n143), .ZN(n2) );
  AO222X1 U24 ( .IN1(n1), .IN2(n2), .IN3(n144), .IN4(n89), .IN5(n83), .IN6(n44), .Q(result[0]) );
  INVX0 U25 ( .INP(n206), .ZN(n3) );
  INVX0 U26 ( .INP(n21), .ZN(n4) );
  AO222X1 U27 ( .IN1(n3), .IN2(n4), .IN3(n95), .IN4(n26), .IN5(n63), .IN6(n90), 
        .Q(result[6]) );
  NAND3X0 U28 ( .IN1(n32), .IN2(n101), .IN3(n102), .QN(n5) );
  NAND4X0 U29 ( .IN1(n105), .IN2(n106), .IN3(n107), .IN4(n5), .QN(n6) );
  OA21X1 U30 ( .IN1(n112), .IN2(n113), .IN3(n121), .Q(n7) );
  OA22X1 U31 ( .IN1(n78), .IN2(n121), .IN3(n7), .IN4(n37), .Q(n8) );
  NAND3X0 U32 ( .IN1(n124), .IN2(n187), .IN3(n200), .QN(n9) );
  NAND3X0 U33 ( .IN1(n186), .IN2(n199), .IN3(n120), .QN(n10) );
  NAND3X0 U34 ( .IN1(n8), .IN2(n9), .IN3(n10), .QN(n11) );
  AO222X1 U35 ( .IN1(n6), .IN2(n90), .IN3(n11), .IN4(n89), .IN5(n83), .IN6(
        psr[0]), .Q(apsr[0]) );
  AND3X1 U36 ( .IN1(n78), .IN2(n37), .IN3(n86), .Q(n12) );
  AO21X1 U37 ( .IN1(n42), .IN2(n200), .IN3(n12), .Q(n72) );
  NOR4X0 U38 ( .IN1(N117), .IN2(N116), .IN3(N115), .IN4(N114), .QN(n13) );
  NOR4X0 U39 ( .IN1(N121), .IN2(N120), .IN3(N119), .IN4(N118), .QN(n14) );
  NAND3X0 U40 ( .IN1(n20), .IN2(n13), .IN3(n14), .QN(n107) );
  NAND2X0 U41 ( .IN1(n83), .IN2(psr[2]), .QN(n15) );
  NAND2X0 U42 ( .IN1(n15), .IN2(n70), .QN(apsr[2]) );
  INVX0 U43 ( .INP(a_i[6]), .ZN(n204) );
  NBUFFX4 U44 ( .INP(operation[3]), .Z(n95) );
  INVX0 U45 ( .INP(n62), .ZN(n77) );
  NAND2X0 U46 ( .IN1(n59), .IN2(n60), .QN(n50) );
  INVX0 U47 ( .INP(a_i[0]), .ZN(n56) );
  NAND3X0 U48 ( .IN1(n82), .IN2(n29), .IN3(n122), .QN(n62) );
  INVX0 U49 ( .INP(n17), .ZN(n16) );
  OR2X1 U50 ( .IN1(n81), .IN2(n16), .Q(n97) );
  INVX0 U51 ( .INP(operation[0]), .ZN(n17) );
  INVX0 U52 ( .INP(n17), .ZN(n18) );
  NBUFFX2 U53 ( .INP(n207), .Z(n89) );
  NAND2X0 U54 ( .IN1(n20), .IN2(N121), .QN(n130) );
  NAND2X1 U55 ( .IN1(n68), .IN2(n207), .QN(n70) );
  INVX0 U56 ( .INP(n202), .ZN(n19) );
  INVX0 U57 ( .INP(n19), .ZN(n20) );
  AOI22X2 U58 ( .IN1(n176), .IN2(n77), .IN3(n196), .IN4(N72), .QN(n180) );
  NAND2X0 U59 ( .IN1(n91), .IN2(N118), .QN(n178) );
  NAND2X0 U60 ( .IN1(n82), .IN2(n36), .QN(n96) );
  INVX0 U61 ( .INP(b_i[1]), .ZN(n52) );
  NAND2X1 U62 ( .IN1(DP_OP_35J1_124_9704_n33), .IN2(b_i[2]), .QN(n117) );
  INVX0 U63 ( .INP(b_i[2]), .ZN(n53) );
  NOR2X0 U64 ( .IN1(n87), .IN2(DP_OP_35J1_124_9704_n27), .QN(n175) );
  NAND2X1 U65 ( .IN1(a_i[7]), .IN2(b_i[7]), .QN(n133) );
  NOR2X0 U66 ( .IN1(DP_OP_35J1_124_9704_n36), .IN2(DP_OP_36J1_125_9744_n51), 
        .QN(n185) );
  NAND2X1 U67 ( .IN1(DP_OP_35J1_124_9704_n34), .IN2(DP_OP_36J1_125_9744_n49), 
        .QN(n116) );
  NOR2X0 U68 ( .IN1(a_i[7]), .IN2(b_i[7]), .QN(n126) );
  INVX0 U69 ( .INP(n205), .ZN(n21) );
  AO22X1 U70 ( .IN1(n92), .IN2(N95), .IN3(n94), .IN4(N76), .Q(n125) );
  INVX0 U71 ( .INP(n52), .ZN(DP_OP_35J1_124_9704_n24) );
  NOR2X0 U72 ( .IN1(DP_OP_35J1_124_9704_n34), .IN2(DP_OP_36J1_125_9744_n49), 
        .QN(n165) );
  AND2X1 U73 ( .IN1(n87), .IN2(DP_OP_35J1_124_9704_n27), .Q(n182) );
  INVX0 U74 ( .INP(b_i[4]), .ZN(n54) );
  INVX0 U75 ( .INP(b_i[5]), .ZN(n79) );
  INVX0 U76 ( .INP(b_i[3]), .ZN(n80) );
  AND2X1 U77 ( .IN1(n142), .IN2(n90), .Q(n205) );
  NAND2X0 U78 ( .IN1(n18), .IN2(n110), .QN(n100) );
  NAND3X0 U79 ( .IN1(n29), .IN2(operation[1]), .IN3(n36), .QN(n128) );
  INVX0 U80 ( .INP(n186), .ZN(n187) );
  XNOR2X1 U81 ( .IN1(N103), .IN2(n50), .Q(N120) );
  NOR4X0 U82 ( .IN1(N104), .IN2(N103), .IN3(N102), .IN4(N101), .QN(n102) );
  AOI22X1 U83 ( .IN1(N102), .IN2(n93), .IN3(n201), .IN4(n187), .QN(n189) );
  AOI22X1 U84 ( .IN1(n156), .IN2(n77), .IN3(n40), .IN4(N70), .QN(n160) );
  INVX0 U85 ( .INP(n52), .ZN(n33) );
  NOR4X0 U86 ( .IN1(n127), .IN2(n136), .IN3(n62), .IN4(n123), .QN(n124) );
  AOI22X1 U87 ( .IN1(n166), .IN2(n77), .IN3(n40), .IN4(N71), .QN(n170) );
  AOI22X1 U88 ( .IN1(n165), .IN2(n85), .IN3(n43), .IN4(N90), .QN(n171) );
  NOR2X0 U89 ( .IN1(n165), .IN2(n172), .QN(n166) );
  AND2X1 U90 ( .IN1(DP_OP_35J1_124_9704_n36), .IN2(DP_OP_36J1_125_9744_n51), 
        .Q(n192) );
  INVX0 U91 ( .INP(n204), .ZN(n26) );
  NBUFFX2 U92 ( .INP(a_i[5]), .Z(DP_OP_35J1_124_9704_n36) );
  NBUFFX2 U93 ( .INP(b_i[0]), .Z(n30) );
  INVX0 U94 ( .INP(n62), .ZN(n76) );
  NAND3X0 U95 ( .IN1(n84), .IN2(n36), .IN3(n110), .QN(n195) );
  XOR2X1 U96 ( .IN1(N104), .IN2(n51), .Q(N121) );
  NAND2X0 U97 ( .IN1(n91), .IN2(N119), .QN(n188) );
  NAND3X0 U98 ( .IN1(n94), .IN2(n104), .IN3(n103), .QN(n105) );
  AND2X1 U99 ( .IN1(N75), .IN2(n196), .Q(n66) );
  AO22X1 U100 ( .IN1(n199), .IN2(n76), .IN3(n32), .IN4(N103), .Q(n203) );
  AOI22X1 U101 ( .IN1(n126), .IN2(n85), .IN3(n43), .IN4(N94), .QN(n132) );
  AOI22X1 U102 ( .IN1(n43), .IN2(N93), .IN3(n94), .IN4(N74), .QN(n61) );
  AOI22X1 U103 ( .IN1(n186), .IN2(n77), .IN3(n40), .IN4(N73), .QN(n190) );
  AOI22X1 U104 ( .IN1(N101), .IN2(n93), .IN3(n201), .IN4(n177), .QN(n179) );
  AOI22X1 U105 ( .IN1(N69), .IN2(n40), .IN3(n42), .IN4(n146), .QN(n150) );
  AOI22X1 U106 ( .IN1(N100), .IN2(n93), .IN3(n201), .IN4(n167), .QN(n169) );
  AOI22X1 U107 ( .IN1(N99), .IN2(n93), .IN3(n42), .IN4(n157), .QN(n159) );
  AOI22X1 U108 ( .IN1(n136), .IN2(n77), .IN3(n32), .IN4(N97), .QN(n138) );
  AOI22X1 U109 ( .IN1(n42), .IN2(n135), .IN3(n94), .IN4(N68), .QN(n139) );
  AOI22X1 U110 ( .IN1(n155), .IN2(n85), .IN3(n92), .IN4(N89), .QN(n161) );
  AOI22X1 U111 ( .IN1(n145), .IN2(n86), .IN3(n43), .IN4(N88), .QN(n151) );
  FADDX1 U112 ( .A(n25), .B(n41), .CI(DP_OP_35J1_124_9704_n7), .CO(
        DP_OP_35J1_124_9704_n6), .S(N89) );
  MUX21X1 U113 ( .IN1(a_i[6]), .IN2(n204), .S(DP_OP_36J1_125_9744_n52), .Q(
        n199) );
  NAND2X1 U114 ( .IN1(n44), .IN2(DP_OP_35J1_124_9704_n23), .QN(n141) );
  NBUFFX2 U115 ( .INP(a_i[3]), .Z(n34) );
  NBUFFX2 U116 ( .INP(n198), .Z(n93) );
  NBUFFX2 U117 ( .INP(n198), .Z(n32) );
  NBUFFX2 U118 ( .INP(operation[2]), .Z(n29) );
  NBUFFX2 U119 ( .INP(operation[2]), .Z(n84) );
  INVX0 U120 ( .INP(n79), .ZN(DP_OP_36J1_125_9744_n51) );
  NBUFFX2 U121 ( .INP(DP_OP_35J1_124_9704_n25), .Z(n25) );
  INVX0 U122 ( .INP(operation[3]), .ZN(n207) );
  NBUFFX2 U123 ( .INP(b_i[0]), .Z(DP_OP_35J1_124_9704_n23) );
  NBUFFX2 U124 ( .INP(b_i[4]), .Z(DP_OP_35J1_124_9704_n27) );
  HADDX1 U125 ( .A0(DP_OP_35J1_124_9704_n23), .B0(a_i[0]), .C1(add_x_1_n8), 
        .SO(N68) );
  NBUFFX2 U126 ( .INP(a_i[4]), .Z(n27) );
  INVX0 U127 ( .INP(n80), .ZN(DP_OP_36J1_125_9744_n49) );
  INVX0 U128 ( .INP(n205), .ZN(n28) );
  NBUFFX2 U129 ( .INP(a_i[3]), .Z(DP_OP_35J1_124_9704_n34) );
  NBUFFX2 U130 ( .INP(b_i[7]), .Z(n31) );
  NAND2X0 U131 ( .IN1(n127), .IN2(n76), .QN(n65) );
  INVX0 U132 ( .INP(n78), .ZN(DP_OP_36J1_125_9744_n52) );
  AOI22X1 U133 ( .IN1(N104), .IN2(n93), .IN3(n201), .IN4(n129), .QN(n131) );
  NBUFFX2 U134 ( .INP(a_i[7]), .Z(n35) );
  NAND2X0 U135 ( .IN1(n133), .IN2(n142), .QN(n74) );
  INVX0 U136 ( .INP(n26), .ZN(n37) );
  INVX0 U137 ( .INP(n196), .ZN(n39) );
  INVX0 U138 ( .INP(n39), .ZN(n40) );
  INVX0 U139 ( .INP(n128), .ZN(n42) );
  NOR2X0 U140 ( .IN1(n84), .IN2(n97), .QN(n197) );
  INVX0 U141 ( .INP(n56), .ZN(n44) );
  MUX21X1 U142 ( .IN1(N97), .IN2(n57), .S(psr[1]), .Q(N114) );
  XNOR2X1 U143 ( .IN1(N98), .IN2(n45), .Q(N115) );
  XNOR2X1 U144 ( .IN1(N100), .IN2(n47), .Q(N117) );
  XNOR2X1 U145 ( .IN1(N101), .IN2(n48), .Q(N118) );
  XNOR2X1 U146 ( .IN1(N102), .IN2(n49), .Q(N119) );
  XOR2X1 U147 ( .IN1(n44), .IN2(n30), .Q(N97) );
  INVX0 U148 ( .INP(n56), .ZN(n58) );
  FADDX1 U149 ( .A(n80), .B(n34), .CI(DP_OP_36J1_125_9744_n14), .CO(
        DP_OP_36J1_125_9744_n13), .S(N100) );
  INVX0 U150 ( .INP(N102), .ZN(n59) );
  FADDX1 U151 ( .A(n54), .B(a_i[4]), .CI(DP_OP_36J1_125_9744_n13), .CO(
        DP_OP_36J1_125_9744_n12), .S(N101) );
  INVX0 U152 ( .INP(n60), .ZN(n49) );
  NAND2X1 U153 ( .IN1(psr[1]), .IN2(n57), .QN(n45) );
  NOR2X0 U154 ( .IN1(n48), .IN2(N101), .QN(n60) );
  NOR2X0 U155 ( .IN1(N103), .IN2(n50), .QN(n51) );
  NAND2X1 U156 ( .IN1(n56), .IN2(n30), .QN(DP_OP_36J1_125_9744_n16) );
  NAND2X0 U157 ( .IN1(n69), .IN2(n70), .QN(result[7]) );
  NOR2X0 U158 ( .IN1(n182), .IN2(n75), .QN(n183) );
  INVX0 U159 ( .INP(n205), .ZN(n75) );
  INVX0 U160 ( .INP(n147), .ZN(n146) );
  INVX0 U161 ( .INP(n156), .ZN(n157) );
  INVX0 U162 ( .INP(n166), .ZN(n167) );
  NOR4X0 U163 ( .IN1(n129), .IN2(n128), .IN3(n135), .IN4(n119), .QN(n120) );
  NOR2X0 U164 ( .IN1(n145), .IN2(n152), .QN(n147) );
  INVX0 U165 ( .INP(n118), .ZN(n152) );
  NOR2X0 U166 ( .IN1(n155), .IN2(n162), .QN(n156) );
  INVX0 U167 ( .INP(n117), .ZN(n162) );
  INVX0 U168 ( .INP(n116), .ZN(n172) );
  NOR2X0 U169 ( .IN1(n175), .IN2(n182), .QN(n176) );
  NOR2X0 U170 ( .IN1(n185), .IN2(n192), .QN(n186) );
  NOR2X0 U171 ( .IN1(DP_OP_35J1_124_9704_n24), .IN2(n88), .QN(n145) );
  NOR2X0 U172 ( .IN1(n203), .IN2(n72), .QN(n71) );
  INVX0 U173 ( .INP(n195), .ZN(n86) );
  INVX0 U174 ( .INP(n127), .ZN(n129) );
  INVX0 U175 ( .INP(n128), .ZN(n201) );
  NOR2X0 U176 ( .IN1(n84), .IN2(n100), .QN(n198) );
  NOR2X0 U177 ( .IN1(n66), .IN2(n64), .QN(n67) );
  NOR2X0 U178 ( .IN1(n126), .IN2(n114), .QN(n127) );
  INVX0 U179 ( .INP(n133), .ZN(n114) );
  NOR2X0 U180 ( .IN1(n84), .IN2(n96), .QN(n202) );
  INVX0 U181 ( .INP(n18), .ZN(n122) );
  INVX0 U182 ( .INP(n81), .ZN(n82) );
  INVX0 U183 ( .INP(operation[1]), .ZN(n81) );
  INVX0 U184 ( .INP(n195), .ZN(n85) );
  INVX0 U185 ( .INP(operation[1]), .ZN(n110) );
  NOR2X0 U186 ( .IN1(n152), .IN2(n21), .QN(n153) );
  NOR2X0 U187 ( .IN1(n172), .IN2(n28), .QN(n173) );
  NOR2X0 U188 ( .IN1(n162), .IN2(n75), .QN(n163) );
  NOR2X0 U189 ( .IN1(n192), .IN2(n75), .QN(n193) );
  NAND2X1 U190 ( .IN1(n91), .IN2(N115), .QN(n148) );
  NAND2X1 U191 ( .IN1(n91), .IN2(N117), .QN(n168) );
  NAND2X1 U192 ( .IN1(n20), .IN2(N114), .QN(n137) );
  NAND2X1 U193 ( .IN1(n91), .IN2(N116), .QN(n158) );
  NAND2X1 U194 ( .IN1(n115), .IN2(n141), .QN(n135) );
  NAND2X1 U195 ( .IN1(n33), .IN2(n88), .QN(n118) );
  NBUFFX2 U196 ( .INP(a_i[4]), .Z(n87) );
  NAND2X1 U197 ( .IN1(N120), .IN2(n20), .QN(n73) );
  NAND2X1 U198 ( .IN1(n83), .IN2(n35), .QN(n69) );
  NAND2X1 U199 ( .IN1(n65), .IN2(n74), .QN(n64) );
  AOI22X1 U200 ( .IN1(n147), .IN2(n76), .IN3(n93), .IN4(N98), .QN(n149) );
  AOI22X1 U201 ( .IN1(n175), .IN2(n86), .IN3(n92), .IN4(N91), .QN(n181) );
  AOI22X1 U202 ( .IN1(n185), .IN2(n86), .IN3(n92), .IN4(N92), .QN(n191) );
  NAND4X0 U203 ( .IN1(n114), .IN2(n142), .IN3(DP_OP_36J1_125_9744_n52), .IN4(
        n111), .QN(n112) );
  NOR3X0 U204 ( .IN1(n29), .IN2(n82), .IN3(n36), .QN(n196) );
  NAND3X0 U205 ( .IN1(n71), .IN2(n73), .IN3(n61), .QN(n63) );
  NAND4X0 U206 ( .IN1(n132), .IN2(n67), .IN3(n130), .IN4(n131), .QN(n68) );
  NOR4X0 U207 ( .IN1(N94), .IN2(N93), .IN3(N92), .IN4(N91), .QN(n99) );
  NOR4X0 U208 ( .IN1(N90), .IN2(N89), .IN3(N88), .IN4(N87), .QN(n98) );
  NAND3X0 U209 ( .IN1(n92), .IN2(n99), .IN3(n98), .QN(n106) );
  NOR4X0 U210 ( .IN1(N100), .IN2(N99), .IN3(N98), .IN4(N97), .QN(n101) );
  NOR4X0 U211 ( .IN1(N75), .IN2(N74), .IN3(N73), .IN4(N72), .QN(n104) );
  NOR4X0 U212 ( .IN1(N71), .IN2(N70), .IN3(N69), .IN4(N68), .QN(n103) );
  NOR2X0 U213 ( .IN1(n126), .IN2(n185), .QN(n109) );
  NOR4X0 U214 ( .IN1(n175), .IN2(n165), .IN3(n155), .IN4(n145), .QN(n108) );
  NOR2X0 U215 ( .IN1(n58), .IN2(n30), .QN(n134) );
  INVX0 U216 ( .INP(n134), .ZN(n115) );
  NAND4X0 U217 ( .IN1(n85), .IN2(n109), .IN3(n108), .IN4(n115), .QN(n121) );
  NAND4X0 U218 ( .IN1(DP_OP_35J1_124_9704_n36), .IN2(DP_OP_36J1_125_9744_n51), 
        .IN3(n87), .IN4(DP_OP_35J1_124_9704_n27), .QN(n113) );
  NOR4X0 U219 ( .IN1(n116), .IN2(n117), .IN3(n118), .IN4(n141), .QN(n111) );
  NAND4X0 U220 ( .IN1(n176), .IN2(n166), .IN3(n156), .IN4(n147), .QN(n119) );
  INVX0 U221 ( .INP(n135), .ZN(n136) );
  INVX0 U222 ( .INP(n176), .ZN(n177) );
  NAND4X0 U223 ( .IN1(n177), .IN2(n167), .IN3(n157), .IN4(n146), .QN(n123) );
  MUX21X1 U224 ( .IN1(n125), .IN2(psr[1]), .S(n83), .Q(apsr[1]) );
  AOI22X1 U225 ( .IN1(n86), .IN2(n134), .IN3(n92), .IN4(N87), .QN(n140) );
  NAND4X0 U226 ( .IN1(n140), .IN2(n139), .IN3(n138), .IN4(n137), .QN(n144) );
  INVX0 U227 ( .INP(n141), .ZN(n143) );
  NAND4X0 U228 ( .IN1(n151), .IN2(n150), .IN3(n149), .IN4(n148), .QN(n154) );
  AO221X1 U229 ( .IN1(n95), .IN2(n88), .IN3(n154), .IN4(n89), .IN5(n153), .Q(
        result[1]) );
  NAND4X0 U230 ( .IN1(n161), .IN2(n160), .IN3(n159), .IN4(n158), .QN(n164) );
  AO221X1 U231 ( .IN1(n95), .IN2(DP_OP_35J1_124_9704_n33), .IN3(n164), .IN4(
        n89), .IN5(n163), .Q(result[2]) );
  NAND4X0 U232 ( .IN1(n171), .IN2(n170), .IN3(n169), .IN4(n168), .QN(n174) );
  AO221X1 U233 ( .IN1(n95), .IN2(DP_OP_35J1_124_9704_n34), .IN3(n174), .IN4(
        n89), .IN5(n173), .Q(result[3]) );
  NAND4X0 U234 ( .IN1(n178), .IN2(n180), .IN3(n179), .IN4(n181), .QN(n184) );
  AO221X1 U235 ( .IN1(n95), .IN2(n87), .IN3(n90), .IN4(n184), .IN5(n183), .Q(
        result[4]) );
  NAND4X0 U236 ( .IN1(n188), .IN2(n190), .IN3(n189), .IN4(n191), .QN(n194) );
  AO221X1 U237 ( .IN1(n83), .IN2(DP_OP_35J1_124_9704_n36), .IN3(n90), .IN4(
        n194), .IN5(n193), .Q(result[5]) );
  NOR2X0 U238 ( .IN1(n37), .IN2(n55), .QN(n206) );
endmodule


module ram_port ( drive_enable, port_write, drive_value, current_value, 
        port_value, current_addr, port_addr );
  input [7:0] drive_value;
  output [7:0] current_value;
  inout [7:0] port_value;
  input [7:0] current_addr;
  output [7:0] port_addr;
  input drive_enable;
  output port_write;
  wire   n3;
  assign current_value[7] = port_value[7];
  assign current_value[6] = port_value[6];
  assign current_value[5] = port_value[5];
  assign current_value[4] = port_value[4];
  assign current_value[3] = port_value[3];
  assign current_value[2] = port_value[2];
  assign current_value[1] = port_value[1];
  assign current_value[0] = port_value[0];
  assign port_addr[7] = current_addr[7];
  assign port_addr[6] = current_addr[6];
  assign port_addr[5] = current_addr[5];
  assign port_addr[4] = current_addr[4];
  assign port_addr[3] = current_addr[3];
  assign port_addr[2] = current_addr[2];
  assign port_addr[1] = current_addr[1];
  assign port_addr[0] = current_addr[0];

  AO21X1 U4 ( .IN1(port_write), .IN2(drive_value[7]), .IN3(1'b0), .Q(
        port_value[7]) );
  AO21X1 U5 ( .IN1(drive_enable), .IN2(drive_value[6]), .IN3(1'b0), .Q(
        port_value[6]) );
  AO21X1 U6 ( .IN1(port_write), .IN2(drive_value[5]), .IN3(1'b0), .Q(
        port_value[5]) );
  AO21X1 U7 ( .IN1(port_write), .IN2(drive_value[4]), .IN3(1'b0), .Q(
        port_value[4]) );
  AO21X1 U8 ( .IN1(port_write), .IN2(drive_value[3]), .IN3(1'b0), .Q(
        port_value[3]) );
  AO21X1 U9 ( .IN1(drive_enable), .IN2(drive_value[2]), .IN3(1'b0), .Q(
        port_value[2]) );
  INVX0 U2 ( .INP(drive_enable), .ZN(n3) );
  TNBUFFX1 port_value_tri_0_ ( .INP(drive_value[0]), .ENB(port_write), .Z(
        port_value[0]) );
  AO22X1 U10 ( .IN1(n3), .IN2(1'b0), .IN3(drive_enable), .IN4(drive_value[1]), 
        .Q(port_value[1]) );
  NBUFFX2 U11 ( .INP(drive_enable), .Z(port_write) );
endmodule


module mcu ( rst, clk, dmem_update, dmem_write, imem_update, opcode_update, 
        opcode, psr_update, psr, res_update, res_sel, alu_operation, 
        alu_opa_sel, alu_opb_sel, pc_load, pc_count_BAR );
  input [7:0] opcode;
  input [2:0] psr;
  output [1:0] res_sel;
  output [3:0] alu_operation;
  output [1:0] alu_opa_sel;
  output [1:0] alu_opb_sel;
  input rst, clk;
  output dmem_update, dmem_write, imem_update, opcode_update, psr_update,
         res_update, pc_load, pc_count_BAR;
  wire   state_0_, imem_update, N30, N104, N105, N106, N107, N123, n1, n42,
         n43, n2, n3, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;
  assign pc_count_BAR = imem_update;

  DFFASX1 state_reg_0_ ( .D(imem_update), .CLK(clk), .SETB(n1), .Q(state_0_), 
        .QN(n6) );
  DFFASX1 state_reg_1_ ( .D(n42), .CLK(clk), .SETB(n1), .Q(opcode_update) );
  LATCHX1 alu_opa_sel_reg_1_ ( .CLK(N123), .D(N105), .Q(alu_opa_sel[1]) );
  LATCHX1 alu_opa_sel_reg_0_ ( .CLK(N123), .D(N104), .Q(alu_opa_sel[0]) );
  LATCHX1 alu_opb_sel_reg_1_ ( .CLK(N123), .D(N107), .Q(alu_opb_sel[1]) );
  LATCHX1 alu_opb_sel_reg_0_ ( .CLK(N123), .D(N106), .Q(alu_opb_sel[0]) );
  LATCHX1 res_sel_reg_1_ ( .CLK(res_update), .D(n43), .Q(res_sel[1]) );
  LATCHX1 res_sel_reg_0_ ( .CLK(res_update), .D(N30), .Q(res_sel[0]) );
  AND2X1 U3 ( .IN1(n42), .IN2(n29), .Q(n25) );
  AO21X1 U4 ( .IN1(n21), .IN2(n14), .IN3(N105), .Q(n2) );
  AO21X1 U5 ( .IN1(opcode[2]), .IN2(n8), .IN3(n2), .Q(N106) );
  AO21X1 U6 ( .IN1(n31), .IN2(opcode[1]), .IN3(alu_operation[3]), .Q(
        alu_operation[1]) );
  NAND2X0 U7 ( .IN1(n18), .IN2(n25), .QN(n9) );
  AO21X2 U8 ( .IN1(n31), .IN2(opcode[0]), .IN3(alu_operation[3]), .Q(
        alu_operation[0]) );
  NBUFFX4 U9 ( .INP(n31), .Z(n8) );
  INVX0 U10 ( .INP(opcode[2]), .ZN(n3) );
  NAND3X1 U11 ( .IN1(n14), .IN2(opcode[1]), .IN3(n28), .QN(n20) );
  NAND2X0 U12 ( .IN1(n29), .IN2(n28), .QN(n30) );
  NAND2X1 U13 ( .IN1(opcode[1]), .IN2(n3), .QN(n11) );
  NOR2X0 U14 ( .IN1(opcode[0]), .IN2(n20), .QN(n10) );
  INVX0 U15 ( .INP(opcode[0]), .ZN(n24) );
  NOR2X0 U16 ( .IN1(opcode[6]), .IN2(opcode[7]), .QN(n14) );
  NOR2X0 U17 ( .IN1(n20), .IN2(n7), .QN(dmem_write) );
  NOR2X0 U18 ( .IN1(opcode[2]), .IN2(n16), .QN(N105) );
  INVX0 U19 ( .INP(opcode[2]), .ZN(n28) );
  NOR2X0 U20 ( .IN1(opcode_update), .IN2(n6), .QN(n42) );
  NOR2X0 U21 ( .IN1(opcode_update), .IN2(state_0_), .QN(imem_update) );
  INVX0 U22 ( .INP(rst), .ZN(n1) );
  INVX0 U23 ( .INP(n25), .ZN(n7) );
  INVX0 U24 ( .INP(n14), .ZN(n18) );
  NOR2X0 U25 ( .IN1(n22), .IN2(n14), .QN(n31) );
  INVX0 U26 ( .INP(n16), .ZN(n22) );
  NAND2X1 U27 ( .IN1(opcode[6]), .IN2(n19), .QN(alu_operation[2]) );
  NOR2X0 U28 ( .IN1(n17), .IN2(n7), .QN(n19) );
  NOR2X0 U29 ( .IN1(n16), .IN2(n28), .QN(n17) );
  NAND2X1 U30 ( .IN1(opcode[6]), .IN2(opcode[7]), .QN(n16) );
  AND2X1 U31 ( .IN1(n3), .IN2(n8), .Q(N107) );
  AND2X1 U32 ( .IN1(n15), .IN2(n24), .Q(N30) );
  OA221X1 U33 ( .IN1(n27), .IN2(N105), .IN3(n27), .IN4(n26), .IN5(n25), .Q(
        pc_load) );
  AND3X1 U34 ( .IN1(n22), .IN2(n21), .IN3(psr[2]), .Q(n27) );
  AND2X1 U35 ( .IN1(opcode[0]), .IN2(n15), .Q(n43) );
  NOR2X0 U36 ( .IN1(n13), .IN2(n7), .QN(N123) );
  AND3X1 U37 ( .IN1(n14), .IN2(n28), .IN3(n23), .Q(n15) );
  OR2X1 U38 ( .IN1(n17), .IN2(n9), .Q(alu_operation[3]) );
  OR2X1 U39 ( .IN1(N105), .IN2(n10), .Q(N104) );
  AND3X1 U40 ( .IN1(opcode[1]), .IN2(opcode[0]), .IN3(n28), .Q(n21) );
  NOR2X0 U41 ( .IN1(n18), .IN2(n11), .QN(n12) );
  NOR3X0 U42 ( .IN1(n12), .IN2(N105), .IN3(n8), .QN(n13) );
  NOR3X0 U43 ( .IN1(opcode[3]), .IN2(opcode[4]), .IN3(opcode[5]), .QN(n29) );
  INVX0 U44 ( .INP(opcode[1]), .ZN(n23) );
  OA21X1 U45 ( .IN1(n31), .IN2(n15), .IN3(n25), .Q(res_update) );
  AO222X1 U46 ( .IN1(n24), .IN2(n23), .IN3(n24), .IN4(psr[1]), .IN5(n23), 
        .IN6(psr[0]), .Q(n26) );
  OA21X1 U47 ( .IN1(n8), .IN2(n30), .IN3(n42), .Q(psr_update) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regs_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net359, n1;

  AND2X1 main_gate ( .IN1(net359), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(net359) );
  INVX0 U2 ( .INP(CLK), .ZN(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regs_4 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net359, n2;

  AND2X1 main_gate ( .IN1(net359), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n2), .D(EN), .Q(net359) );
  INVX0 U2 ( .INP(CLK), .ZN(n2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regs_3 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net359, n2;

  AND2X1 main_gate ( .IN1(net359), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n2), .D(EN), .Q(net359) );
  INVX0 U2 ( .INP(CLK), .ZN(n2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regs_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net359, n2;

  AND2X1 main_gate ( .IN1(net359), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n2), .D(EN), .Q(net359) );
  INVX0 U2 ( .INP(CLK), .ZN(n2) );
endmodule


module regs ( rst, clk, dmem_update, dmem_data, imem_update, imem_data, 
        opcode_update, opcode, psr_update, apsr, psr, res_update, res_sel, alu, 
        opa_sel, opb_sel, opa, opb, pc );
  input [7:0] dmem_data;
  input [7:0] imem_data;
  output [7:0] opcode;
  input [2:0] apsr;
  output [2:0] psr;
  input [1:0] res_sel;
  input [7:0] alu;
  input [1:0] opa_sel;
  input [1:0] opb_sel;
  output [7:0] opa;
  output [7:0] opb;
  input [7:0] pc;
  input rst, clk, dmem_update, imem_update, opcode_update, psr_update,
         res_update;
  wire   N19, N20, N21, N22, N23, N24, N25, N26, net365, net370, net375,
         net385, n1, n2, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;
  wire   [7:0] imem;
  wire   [7:0] acc;

  SNPS_CLOCK_GATE_HIGH_regs_0 clk_gate_opcode_reg ( .CLK(clk), .EN(
        opcode_update), .ENCLK(net365) );
  SNPS_CLOCK_GATE_HIGH_regs_4 clk_gate_psr_reg ( .CLK(clk), .EN(psr_update), 
        .ENCLK(net370) );
  SNPS_CLOCK_GATE_HIGH_regs_3 clk_gate_imem_reg ( .CLK(clk), .EN(imem_update), 
        .ENCLK(net375) );
  SNPS_CLOCK_GATE_HIGH_regs_1 clk_gate_acc_reg ( .CLK(clk), .EN(res_update), 
        .ENCLK(net385) );
  DFFARX1 opcode_reg_7_ ( .D(imem_data[7]), .CLK(net365), .RSTB(n1), .Q(
        opcode[7]) );
  DFFARX1 opcode_reg_6_ ( .D(imem_data[6]), .CLK(net365), .RSTB(n19), .QN(n15)
         );
  DFFARX1 opcode_reg_5_ ( .D(imem_data[5]), .CLK(net365), .RSTB(n1), .Q(
        opcode[5]) );
  DFFARX1 opcode_reg_4_ ( .D(imem_data[4]), .CLK(net365), .RSTB(n1), .Q(
        opcode[4]) );
  DFFARX1 opcode_reg_3_ ( .D(imem_data[3]), .CLK(net365), .RSTB(n1), .Q(
        opcode[3]) );
  DFFARX1 opcode_reg_2_ ( .D(imem_data[2]), .CLK(net365), .RSTB(n1), .QN(n17)
         );
  DFFARX1 opcode_reg_1_ ( .D(imem_data[1]), .CLK(net365), .RSTB(n19), .Q(
        opcode[1]) );
  DFFARX1 opcode_reg_0_ ( .D(imem_data[0]), .CLK(net365), .RSTB(n19), .Q(
        opcode[0]) );
  DFFARX1 psr_reg_2_ ( .D(apsr[2]), .CLK(net370), .RSTB(n1), .Q(psr[2]) );
  DFFARX1 psr_reg_1_ ( .D(apsr[1]), .CLK(net370), .RSTB(n19), .Q(psr[1]) );
  DFFARX1 psr_reg_0_ ( .D(apsr[0]), .CLK(net370), .RSTB(n1), .Q(psr[0]) );
  DFFARX1 imem_reg_7_ ( .D(imem_data[7]), .CLK(net375), .RSTB(n19), .Q(imem[7]) );
  DFFARX1 imem_reg_6_ ( .D(imem_data[6]), .CLK(net375), .RSTB(n19), .Q(imem[6]) );
  DFFARX1 imem_reg_5_ ( .D(imem_data[5]), .CLK(net375), .RSTB(n1), .Q(imem[5])
         );
  DFFARX1 imem_reg_4_ ( .D(imem_data[4]), .CLK(net375), .RSTB(n19), .Q(imem[4]) );
  DFFARX1 imem_reg_3_ ( .D(imem_data[3]), .CLK(net375), .RSTB(n1), .Q(imem[3])
         );
  DFFARX1 imem_reg_2_ ( .D(imem_data[2]), .CLK(net375), .RSTB(n19), .Q(imem[2]) );
  DFFARX1 imem_reg_1_ ( .D(imem_data[1]), .CLK(net375), .RSTB(n1), .Q(imem[1])
         );
  DFFARX1 imem_reg_0_ ( .D(imem_data[0]), .CLK(net375), .RSTB(n19), .Q(imem[0]) );
  DFFARX1 acc_reg_7_ ( .D(N26), .CLK(net385), .RSTB(n19), .Q(acc[7]) );
  DFFARX1 acc_reg_6_ ( .D(N25), .CLK(net385), .RSTB(n19), .Q(acc[6]) );
  DFFARX1 acc_reg_5_ ( .D(N24), .CLK(net385), .RSTB(n1), .Q(acc[5]) );
  DFFARX1 acc_reg_4_ ( .D(N23), .CLK(net385), .RSTB(n19), .Q(acc[4]) );
  DFFARX1 acc_reg_3_ ( .D(N22), .CLK(net385), .RSTB(n1), .Q(acc[3]) );
  DFFARX1 acc_reg_2_ ( .D(N21), .CLK(net385), .RSTB(n19), .Q(acc[2]) );
  DFFARX1 acc_reg_1_ ( .D(N20), .CLK(net385), .RSTB(n19), .Q(acc[1]) );
  DFFARX1 acc_reg_0_ ( .D(N19), .CLK(net385), .RSTB(n1), .Q(acc[0]) );
  OR2X1 U2 ( .IN1(n6), .IN2(n5), .Q(n46) );
  AO222X1 U3 ( .IN1(imem[7]), .IN2(n37), .IN3(pc[7]), .IN4(n38), .IN5(acc[7]), 
        .IN6(n36), .Q(opa[7]) );
  AO222X1 U4 ( .IN1(n56), .IN2(imem[5]), .IN3(n57), .IN4(pc[5]), .IN5(n55), 
        .IN6(acc[5]), .Q(opb[5]) );
  AO222X1 U5 ( .IN1(imem[1]), .IN2(n37), .IN3(pc[1]), .IN4(n38), .IN5(acc[1]), 
        .IN6(n36), .Q(opa[1]) );
  AO222X1 U6 ( .IN1(n56), .IN2(imem[6]), .IN3(n57), .IN4(pc[6]), .IN5(n55), 
        .IN6(acc[6]), .Q(opb[6]) );
  AO222X1 U7 ( .IN1(imem[5]), .IN2(n37), .IN3(pc[5]), .IN4(n38), .IN5(acc[5]), 
        .IN6(n36), .Q(opa[5]) );
  AO222X1 U8 ( .IN1(n56), .IN2(imem[7]), .IN3(n57), .IN4(pc[7]), .IN5(n55), 
        .IN6(acc[7]), .Q(opb[7]) );
  INVX0 U9 ( .INP(opa_sel[0]), .ZN(n2) );
  NOR2X0 U10 ( .IN1(opa_sel[1]), .IN2(n2), .QN(n37) );
  NAND2X1 U11 ( .IN1(n38), .IN2(pc[2]), .QN(n24) );
  NAND2X1 U12 ( .IN1(pc[1]), .IN2(n57), .QN(n43) );
  NAND2X0 U13 ( .IN1(n38), .IN2(pc[4]), .QN(n30) );
  NAND2X0 U14 ( .IN1(pc[0]), .IN2(n38), .QN(n14) );
  NAND2X1 U15 ( .IN1(imem[2]), .IN2(n56), .QN(n47) );
  NAND2X0 U16 ( .IN1(n37), .IN2(imem[4]), .QN(n31) );
  NAND2X0 U17 ( .IN1(imem[0]), .IN2(n37), .QN(n12) );
  NAND2X0 U18 ( .IN1(acc[0]), .IN2(n36), .QN(n13) );
  NAND2X0 U19 ( .IN1(n36), .IN2(acc[4]), .QN(n32) );
  NAND2X1 U20 ( .IN1(acc[2]), .IN2(n55), .QN(n48) );
  NAND2X1 U21 ( .IN1(imem_data[7]), .IN2(n23), .QN(n9) );
  NOR2X1 U22 ( .IN1(n23), .IN2(n21), .QN(n22) );
  NAND2X1 U23 ( .IN1(pc[4]), .IN2(n57), .QN(n52) );
  NAND2X1 U24 ( .IN1(dmem_data[7]), .IN2(n21), .QN(n10) );
  NAND2X1 U25 ( .IN1(acc[0]), .IN2(n55), .QN(n42) );
  INVX0 U26 ( .INP(rst), .ZN(n1) );
  NAND2X1 U27 ( .IN1(n38), .IN2(pc[6]), .QN(n33) );
  NAND2X1 U28 ( .IN1(pc[0]), .IN2(n57), .QN(n40) );
  NAND2X1 U29 ( .IN1(imem[0]), .IN2(n56), .QN(n41) );
  NAND2X1 U30 ( .IN1(n36), .IN2(acc[6]), .QN(n35) );
  NAND3X0 U31 ( .IN1(n34), .IN2(n33), .IN3(n35), .QN(opa[6]) );
  NOR2X0 U32 ( .IN1(opb_sel[1]), .IN2(n39), .QN(n56) );
  NOR2X0 U33 ( .IN1(opb_sel[0]), .IN2(opb_sel[1]), .QN(n55) );
  NOR2X0 U34 ( .IN1(res_sel[1]), .IN2(n20), .QN(n21) );
  INVX0 U35 ( .INP(n15), .ZN(opcode[6]) );
  NAND3X0 U36 ( .IN1(n13), .IN2(n12), .IN3(n14), .QN(opa[0]) );
  INVX0 U37 ( .INP(n57), .ZN(n5) );
  NAND3X0 U38 ( .IN1(n31), .IN2(n30), .IN3(n32), .QN(opa[4]) );
  INVX0 U39 ( .INP(n17), .ZN(opcode[2]) );
  NAND2X0 U40 ( .IN1(n11), .IN2(n8), .QN(N26) );
  INVX0 U41 ( .INP(pc[2]), .ZN(n6) );
  NAND2X0 U42 ( .IN1(n22), .IN2(alu[7]), .QN(n11) );
  NAND2X1 U43 ( .IN1(n38), .IN2(pc[3]), .QN(n27) );
  NAND2X1 U44 ( .IN1(pc[3]), .IN2(n57), .QN(n49) );
  NAND2X1 U45 ( .IN1(n37), .IN2(imem[6]), .QN(n34) );
  NAND2X1 U46 ( .IN1(acc[1]), .IN2(n55), .QN(n45) );
  NAND2X1 U47 ( .IN1(imem[1]), .IN2(n56), .QN(n44) );
  NAND2X1 U48 ( .IN1(n36), .IN2(acc[2]), .QN(n26) );
  NAND2X1 U49 ( .IN1(n37), .IN2(imem[2]), .QN(n25) );
  NAND2X1 U50 ( .IN1(n7), .IN2(n46), .QN(opb[2]) );
  NAND2X1 U51 ( .IN1(n36), .IN2(acc[3]), .QN(n29) );
  NAND2X1 U52 ( .IN1(n37), .IN2(imem[3]), .QN(n28) );
  NAND2X1 U53 ( .IN1(acc[3]), .IN2(n55), .QN(n51) );
  NAND2X1 U54 ( .IN1(imem[3]), .IN2(n56), .QN(n50) );
  NAND2X1 U55 ( .IN1(acc[4]), .IN2(n55), .QN(n54) );
  NAND2X1 U56 ( .IN1(imem[4]), .IN2(n56), .QN(n53) );
  AND2X1 U57 ( .IN1(opb_sel[0]), .IN2(opb_sel[1]), .Q(n57) );
  NAND3X0 U58 ( .IN1(n41), .IN2(n42), .IN3(n40), .QN(opb[0]) );
  NAND3X0 U59 ( .IN1(n44), .IN2(n45), .IN3(n43), .QN(opb[1]) );
  NAND3X0 U60 ( .IN1(n50), .IN2(n49), .IN3(n51), .QN(opb[3]) );
  NAND3X0 U61 ( .IN1(n53), .IN2(n52), .IN3(n54), .QN(opb[4]) );
  AND2X1 U62 ( .IN1(n47), .IN2(n48), .Q(n7) );
  AND2X1 U63 ( .IN1(n10), .IN2(n9), .Q(n8) );
  NBUFFX2 U64 ( .INP(n1), .Z(n19) );
  NAND3X0 U65 ( .IN1(n28), .IN2(n27), .IN3(n29), .QN(opa[3]) );
  NAND3X0 U66 ( .IN1(n24), .IN2(n25), .IN3(n26), .QN(opa[2]) );
  INVX0 U67 ( .INP(res_sel[0]), .ZN(n20) );
  AND2X1 U68 ( .IN1(n20), .IN2(res_sel[1]), .Q(n23) );
  AO222X1 U69 ( .IN1(n23), .IN2(imem_data[0]), .IN3(n22), .IN4(alu[0]), .IN5(
        dmem_data[0]), .IN6(n21), .Q(N19) );
  AO222X1 U70 ( .IN1(n23), .IN2(imem_data[1]), .IN3(n22), .IN4(alu[1]), .IN5(
        dmem_data[1]), .IN6(n21), .Q(N20) );
  AO222X1 U71 ( .IN1(n23), .IN2(imem_data[2]), .IN3(alu[2]), .IN4(n22), .IN5(
        dmem_data[2]), .IN6(n21), .Q(N21) );
  AO222X1 U72 ( .IN1(n23), .IN2(imem_data[3]), .IN3(n22), .IN4(alu[3]), .IN5(
        dmem_data[3]), .IN6(n21), .Q(N22) );
  AO222X1 U73 ( .IN1(n23), .IN2(imem_data[4]), .IN3(alu[4]), .IN4(n22), .IN5(
        dmem_data[4]), .IN6(n21), .Q(N23) );
  AO222X1 U74 ( .IN1(n23), .IN2(imem_data[5]), .IN3(alu[5]), .IN4(n22), .IN5(
        dmem_data[5]), .IN6(n21), .Q(N24) );
  AO222X1 U75 ( .IN1(n23), .IN2(imem_data[6]), .IN3(alu[6]), .IN4(n22), .IN5(
        dmem_data[6]), .IN6(n21), .Q(N25) );
  NOR2X0 U76 ( .IN1(opa_sel[1]), .IN2(opa_sel[0]), .QN(n36) );
  AND2X1 U77 ( .IN1(opa_sel[1]), .IN2(opa_sel[0]), .Q(n38) );
  INVX0 U78 ( .INP(opb_sel[0]), .ZN(n39) );
endmodule


module SNPS_CLOCK_GATE_HIGH_pc ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net344, n1;

  AND2X1 main_gate ( .IN1(net344), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(net344) );
  INVX0 U2 ( .INP(CLK), .ZN(n1) );
endmodule


module pc ( rst, clk, load, addr_in, addr_out, count_BAR );
  input [7:0] addr_in;
  output [7:0] addr_out;
  input rst, clk, load, count_BAR;
  wire   n38, n39, n40, n41, n42, n43, N3, N13, N14, N15, N16, N17, N18, N19,
         N20, net350, n1, n2, n3, n5, n7, n8, n9, n10, n11, n13, n15, n17, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37;

  SNPS_CLOCK_GATE_HIGH_pc clk_gate_addr_out_reg ( .CLK(clk), .EN(N3), .ENCLK(
        net350) );
  DFFARX1 addr_out_reg_7_ ( .D(N20), .CLK(net350), .RSTB(n1), .Q(addr_out[7]), 
        .QN(n35) );
  DFFARX1 addr_out_reg_6_ ( .D(N19), .CLK(net350), .RSTB(n1), .Q(n38), .QN(n11) );
  DFFARX1 addr_out_reg_5_ ( .D(N18), .CLK(net350), .RSTB(n1), .Q(n39), .QN(n13) );
  DFFARX1 addr_out_reg_4_ ( .D(N17), .CLK(net350), .RSTB(n1), .Q(n40), .QN(n15) );
  DFFARX1 addr_out_reg_3_ ( .D(N16), .CLK(net350), .RSTB(n1), .Q(addr_out[3]), 
        .QN(n7) );
  DFFARX1 addr_out_reg_2_ ( .D(N15), .CLK(net350), .RSTB(n1), .Q(n41), .QN(n5)
         );
  DFFARX1 addr_out_reg_1_ ( .D(N14), .CLK(net350), .RSTB(n1), .Q(n42), .QN(n3)
         );
  DFFARX1 addr_out_reg_0_ ( .D(N13), .CLK(net350), .RSTB(n1), .Q(n43), .QN(n17) );
  NAND3X0 U3 ( .IN1(n42), .IN2(n43), .IN3(n41), .QN(n26) );
  INVX0 U4 ( .INP(n8), .ZN(n10) );
  INVX0 U5 ( .INP(n10), .ZN(n2) );
  NAND2X0 U6 ( .IN1(count_BAR), .IN2(n2), .QN(N3) );
  INVX0 U7 ( .INP(n3), .ZN(addr_out[1]) );
  INVX0 U8 ( .INP(n5), .ZN(addr_out[2]) );
  NAND2X0 U9 ( .IN1(n42), .IN2(n43), .QN(n22) );
  INVX0 U10 ( .INP(rst), .ZN(n1) );
  NBUFFX2 U11 ( .INP(n37), .Z(n19) );
  INVX0 U12 ( .INP(n8), .ZN(n9) );
  INVX0 U13 ( .INP(load), .ZN(n8) );
  NOR2X0 U14 ( .IN1(count_BAR), .IN2(n9), .QN(n37) );
  INVX0 U15 ( .INP(n17), .ZN(addr_out[0]) );
  INVX0 U16 ( .INP(n13), .ZN(addr_out[5]) );
  INVX0 U17 ( .INP(n11), .ZN(addr_out[6]) );
  AO22X1 U18 ( .IN1(n9), .IN2(addr_in[1]), .IN3(n37), .IN4(n21), .Q(N14) );
  AO22X1 U19 ( .IN1(n10), .IN2(addr_in[3]), .IN3(n19), .IN4(n25), .Q(N16) );
  AO22X1 U20 ( .IN1(n10), .IN2(addr_in[0]), .IN3(n19), .IN4(n20), .Q(N13) );
  AO22X1 U21 ( .IN1(n10), .IN2(addr_in[2]), .IN3(n37), .IN4(n24), .Q(N15) );
  AO22X1 U22 ( .IN1(n10), .IN2(addr_in[4]), .IN3(n37), .IN4(n28), .Q(N17) );
  AO22X1 U23 ( .IN1(n10), .IN2(addr_in[5]), .IN3(n19), .IN4(n29), .Q(N18) );
  NAND2X1 U24 ( .IN1(n32), .IN2(n38), .QN(n34) );
  NAND2X1 U25 ( .IN1(n27), .IN2(n40), .QN(n31) );
  AO22X1 U26 ( .IN1(n9), .IN2(addr_in[6]), .IN3(n19), .IN4(n33), .Q(N19) );
  AO22X1 U27 ( .IN1(n9), .IN2(addr_in[7]), .IN3(n19), .IN4(n36), .Q(N20) );
  MUX21X1 U28 ( .IN1(n7), .IN2(addr_out[3]), .S(n26), .Q(n25) );
  MUX21X1 U29 ( .IN1(n30), .IN2(n39), .S(n31), .Q(n29) );
  INVX0 U30 ( .INP(n15), .ZN(addr_out[4]) );
  INVX0 U31 ( .INP(n43), .ZN(n20) );
  OA21X1 U32 ( .IN1(n42), .IN2(n43), .IN3(n22), .Q(n21) );
  INVX0 U33 ( .INP(n22), .ZN(n23) );
  OA21X1 U34 ( .IN1(n23), .IN2(n41), .IN3(n26), .Q(n24) );
  NOR2X0 U35 ( .IN1(n26), .IN2(n7), .QN(n27) );
  OA21X1 U36 ( .IN1(n27), .IN2(n40), .IN3(n31), .Q(n28) );
  INVX0 U37 ( .INP(n39), .ZN(n30) );
  NOR2X0 U38 ( .IN1(n31), .IN2(n30), .QN(n32) );
  OA21X1 U39 ( .IN1(n32), .IN2(n38), .IN3(n34), .Q(n33) );
  MUX21X1 U40 ( .IN1(n35), .IN2(addr_out[7]), .S(n34), .Q(n36) );
endmodule


module cpu ( rst, clk, imem_data, imem_addr, dmem_port_write, dmem_port_value, 
        dmem_port_addr );
  input [7:0] imem_data;
  output [7:0] imem_addr;
  inout [7:0] dmem_port_value;
  output [7:0] dmem_port_addr;
  input rst, clk;
  output dmem_port_write;
  wire   dmem_write, imem_update, opcode_update, psr_update, res_update,
         pc_count, pc_load, n1, n2, n3, n4, n5, net1966;
  wire   [7:0] opcode;
  wire   [2:0] psr;
  wire   [1:0] res_sel;
  wire   [3:0] alu_operation;
  wire   [1:0] opa_sel;
  wire   [1:0] opb_sel;
  wire   [7:0] dmem_data;
  wire   [2:0] apsr;
  wire   [7:0] alu_result;
  wire   [7:0] opa;
  wire   [7:1] opb;

  mcu mcu ( .rst(rst), .clk(clk), .dmem_write(dmem_write), .imem_update(
        imem_update), .opcode_update(opcode_update), .opcode({opcode[7], n2, 
        opcode[5:3], n4, opcode[1:0]}), .psr_update(psr_update), .psr(psr), 
        .res_update(res_update), .res_sel(res_sel), .alu_operation(
        alu_operation), .alu_opa_sel(opa_sel), .alu_opb_sel(opb_sel), 
        .pc_load(pc_load), .pc_count_BAR(pc_count) );
  regs regs ( .rst(rst), .clk(clk), .dmem_update(net1966), .dmem_data(
        dmem_data), .imem_update(imem_update), .imem_data(imem_data), 
        .opcode_update(opcode_update), .opcode({opcode[7], n2, opcode[5:3], n4, 
        opcode[1:0]}), .psr_update(psr_update), .apsr(apsr), .psr(psr), 
        .res_update(res_update), .res_sel(res_sel), .alu(alu_result), 
        .opa_sel(opa_sel), .opb_sel(opb_sel), .opa({opa[7:2], n1, opa[0]}), 
        .opb({opb, n3}), .pc(imem_addr) );
  pc pc ( .rst(rst), .clk(clk), .load(pc_load), .addr_in(alu_result), 
        .addr_out(imem_addr), .count_BAR(pc_count) );
  alu alu ( .operation({n5, alu_operation[2:0]}), .a_i({opa[7:2], n1, opa[0]}), 
        .b_i({opb, n3}), .psr(psr), .result(alu_result), .apsr(apsr) );
  ram_port ram_port ( .drive_enable(dmem_write), .port_write(dmem_port_write), 
        .drive_value({opb, n3}), .current_value(dmem_data), .port_value(
        dmem_port_value), .current_addr(alu_result), .port_addr(dmem_port_addr) );
  NBUFFX4 U1 ( .INP(alu_operation[3]), .Z(n5) );
endmodule

