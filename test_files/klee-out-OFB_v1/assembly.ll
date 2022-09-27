; ModuleID = './testing_AES_OFB.bc'
source_filename = "testing_AES_OFB.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.aes_key_st = type { [60 x i32], i32 }

@main.in = private unnamed_addr constant [16 x i8] c"Hello, world!\00\00\00", align 16
@main.key = private unnamed_addr constant [16 x i8] c"\00\11\223DUfw\88\99\AA\BB\CC\DD\EE\FF", align 16
@.str = private unnamed_addr constant [5 x i8] c"ivec\00", align 1
@Te2 = internal unnamed_addr constant [256 x i32] [i32 1671808611, i32 2089089148, i32 2006576759, i32 2072901243, i32 -233963534, i32 1807603307, i32 1873927791, i32 -984313403, i32 810573872, i32 16974337, i32 1739181671, i32 729634347, i32 -31856642, i32 -681396777, i32 -1410970197, i32 1989864566, i32 -901410870, i32 -2103631998, i32 -918517303, i32 2106063485, i32 -99225606, i32 1508618841, i32 1204391495, i32 -267650064, i32 -1377025619, i32 -731401260, i32 -1560453214, i32 -1343601233, i32 -1665195108, i32 -1527295068, i32 1922491506, i32 -1067738176, i32 -1211992649, i32 -48438787, i32 -1817297517, i32 644500518, i32 911895606, i32 1061256767, i32 -150800905, i32 -867204148, i32 878471220, i32 -1510714971, i32 -449523227, i32 -251069967, i32 1905517169, i32 -663508008, i32 827548209, i32 356461077, i32 67897348, i32 -950889017, i32 593839651, i32 -1017209405, i32 405286936, i32 -1767819370, i32 84871685, i32 -1699401830, i32 118033927, i32 305538066, i32 -2137318528, i32 -499261470, i32 -349778453, i32 661212711, i32 -1295155278, i32 1973414517, i32 152769033, i32 -2086789757, i32 745822252, i32 439235610, i32 455947803, i32 1857215598, i32 1525593178, i32 -1594139744, i32 1391895634, i32 994932283, i32 -698239018, i32 -1278313037, i32 695947817, i32 -482419229, i32 795958831, i32 -2070473852, i32 1408607827, i32 -781665839, i32 0, i32 -315833875, i32 543178784, i32 -65018884, i32 -1312261711, i32 1542305371, i32 1790891114, i32 -884568629, i32 -1093048386, i32 961245753, i32 1256100938, i32 1289001036, i32 1491644504, i32 -817199665, i32 -798245936, i32 -282409489, i32 -1427812438, i32 -82383365, i32 1137018435, i32 1305975373, i32 861234739, i32 -2053893755, i32 1171229253, i32 -116332039, i32 33948674, i32 2139225727, i32 1357946960, i32 1011120188, i32 -1615190625, i32 -1461498968, i32 1374921297, i32 -1543610973, i32 1086357568, i32 -1886780017, i32 -1834139758, i32 -1648615011, i32 944271416, i32 -184225291, i32 -1126210628, i32 -1228834890, i32 -629821478, i32 560153121, i32 271589392, i32 -15014401, i32 -217121293, i32 -764559406, i32 -850624051, i32 202643468, i32 322250259, i32 -332413972, i32 1608629855, i32 -1750977129, i32 1154254916, i32 389623319, i32 -1000893500, i32 -1477290585, i32 2122513534, i32 1028094525, i32 1689045092, i32 1575467613, i32 422261273, i32 1939203699, i32 1621147744, i32 -2120738431, i32 1339137615, i32 -595614756, i32 577127458, i32 712922154, i32 -1867826288, i32 -2004677752, i32 1187679302, i32 -299251730, i32 -1194103880, i32 339486740, i32 -562452514, i32 1591917662, i32 186455563, i32 -612979237, i32 -532948000, i32 844522546, i32 978220090, i32 169743370, i32 1239126601, i32 101321734, i32 611076132, i32 1558493276, i32 -1034051646, i32 -747717165, i32 -1393605716, i32 1655096418, i32 -1851246191, i32 -1784401515, i32 -466103324, i32 2039214713, i32 -416098841, i32 -935097400, i32 928607799, i32 1840765549, i32 -1920204403, i32 -714821163, i32 1322425422, i32 -1444918871, i32 1823791212, i32 1459268694, i32 -200805388, i32 -366620694, i32 1706019429, i32 2056189050, i32 -1360443474, i32 135794696, i32 -1160417350, i32 2022240376, i32 628050469, i32 779246638, i32 472135708, i32 -1494132826, i32 -1261997132, i32 -967731258, i32 -400307224, i32 -579034659, i32 1956440180, i32 522272287, i32 1272813131, i32 -1109630531, i32 -1954148981, i32 -1970991222, i32 1888542832, i32 1044544574, i32 -1245417035, i32 1722469478, i32 1222152264, i32 50660867, i32 -167643146, i32 236067854, i32 1638122081, i32 895445557, i32 1475980887, i32 -1177523783, i32 -2037311610, i32 -1051158079, i32 489110045, i32 -1632032866, i32 -516367903, i32 -132912136, i32 -1733088360, i32 288563729, i32 1773916777, i32 -646927911, i32 -1903622258, i32 -1800981612, i32 -1682559589, i32 505560094, i32 -2020469369, i32 -383727127, i32 -834041906, i32 1442818645, i32 678973480, i32 -545610273, i32 -1936784500, i32 -1577559647, i32 -1988097655, i32 219617805, i32 -1076206145, i32 -432941082, i32 1120306242, i32 1756942440, i32 1103331905, i32 -1716508263, i32 762796589, i32 252780047, i32 -1328841808, i32 1425844308, i32 -1143575109, i32 372911126], align 16, !dbg !0
@Te3 = internal unnamed_addr constant [256 x i32] [i32 1667474886, i32 2088535288, i32 2004326894, i32 2071694838, i32 -219017729, i32 1802223062, i32 1869591006, i32 -976923503, i32 808472672, i32 16843522, i32 1734846926, i32 724270422, i32 -16901657, i32 -673750347, i32 -1414797747, i32 1987484396, i32 -892713585, i32 -2105369313, i32 -909557623, i32 2105378810, i32 -84273681, i32 1499065266, i32 1195886990, i32 -252703749, i32 -1381110719, i32 -724277325, i32 -1566376609, i32 -1347425723, i32 -1667449053, i32 -1532692653, i32 1920112356, i32 -1061135461, i32 -1212693899, i32 -33743647, i32 -1819038147, i32 640051788, i32 909531756, i32 1061110142, i32 -134806795, i32 -859025533, i32 875846760, i32 -1515850671, i32 -437963567, i32 -235861767, i32 1903268834, i32 -656903253, i32 825316194, i32 353713962, i32 67374088, i32 -943238507, i32 589522246, i32 -1010606435, i32 404236336, i32 -1768513225, i32 84217610, i32 -1701137105, i32 117901582, i32 303183396, i32 -2139055333, i32 -488489505, i32 -336910643, i32 656894286, i32 -1296904833, i32 1970642922, i32 151591698, i32 -2088526307, i32 741110872, i32 437923380, i32 454765878, i32 1852748508, i32 1515908788, i32 -1600062629, i32 1381168804, i32 993742198, i32 -690593353, i32 -1280061827, i32 690584402, i32 -471646499, i32 791638366, i32 -2071685357, i32 1398011302, i32 -774805319, i32 0, i32 -303223615, i32 538992704, i32 -50585629, i32 -1313748871, i32 1532751286, i32 1785380564, i32 -875870579, i32 -1094788761, i32 960056178, i32 1246420628, i32 1280103576, i32 1482221744, i32 -808498555, i32 -791647301, i32 -269538619, i32 -1431640753, i32 -67430675, i32 1128514950, i32 1296947098, i32 859002214, i32 -2054843375, i32 1162203018, i32 -101117719, i32 33687044, i32 2139062782, i32 1347481760, i32 1010582648, i32 -1616922075, i32 -1465326773, i32 1364325282, i32 -1549533603, i32 1077985408, i32 -1886418427, i32 -1835881153, i32 -1650607071, i32 943212656, i32 -168491791, i32 -1128472733, i32 -1229536905, i32 -623217233, i32 555836226, i32 269496352, i32 -58651, i32 -202174723, i32 -757961281, i32 -842183551, i32 202118168, i32 320025894, i32 -320065597, i32 1600119230, i32 -1751670219, i32 1145359496, i32 387397934, i32 -993765485, i32 -1482165675, i32 2122220284, i32 1027426170, i32 1684319432, i32 1566435258, i32 421079858, i32 1936954854, i32 1616945344, i32 -2122213351, i32 1330631070, i32 -589529181, i32 572679748, i32 707427924, i32 -1869567173, i32 -2004319477, i32 1179044492, i32 -286381625, i32 -1195846805, i32 336870440, i32 -555845209, i32 1583276732, i32 185277718, i32 -606374227, i32 -522175525, i32 842159716, i32 976899700, i32 168435220, i32 1229577106, i32 101059084, i32 606366792, i32 1549591736, i32 -1027449441, i32 -741118275, i32 -1397952701, i32 1650632388, i32 -1852725191, i32 -1785355215, i32 -454805549, i32 2038008818, i32 -404278571, i32 -926399605, i32 926374254, i32 1835907034, i32 -1920103423, i32 -707435343, i32 1313788572, i32 -1448484791, i32 1819063512, i32 1448540844, i32 -185333773, i32 -353753649, i32 1701162954, i32 2054852340, i32 -1364268729, i32 134748176, i32 -1162160785, i32 2021165296, i32 623210314, i32 774795868, i32 471606328, i32 -1499008681, i32 -1263220877, i32 -960081513, i32 -387439669, i32 -572687199, i32 1953799400, i32 522133822, i32 1263263126, i32 -1111630751, i32 -1953790451, i32 -1970633457, i32 1886425312, i32 1044267644, i32 -1246378895, i32 1718004428, i32 1212733584, i32 50529542, i32 -151649801, i32 235803164, i32 1633788866, i32 892690282, i32 1465383342, i32 -1179004823, i32 -2038001385, i32 -1044293479, i32 488449850, i32 -1633765081, i32 -505333543, i32 -117959701, i32 -1734823125, i32 286339874, i32 1768537042, i32 -640061271, i32 -1903261433, i32 -1802197197, i32 -1684294099, i32 505291324, i32 -2021158379, i32 -370597687, i32 -825341561, i32 1431699370, i32 673740880, i32 -539002203, i32 -1936945405, i32 -1583220647, i32 -1987477495, i32 218961690, i32 -1077945755, i32 -421121577, i32 1111672452, i32 1751693520, i32 1094828930, i32 -1717981143, i32 757954394, i32 252645662, i32 -1330590853, i32 1414855848, i32 -1145317779, i32 370555436], align 16, !dbg !12
@Te0 = internal unnamed_addr constant [256 x i32] [i32 -966564955, i32 -126059388, i32 -294160487, i32 -159679603, i32 -855539, i32 -697603139, i32 -563122255, i32 -1849309868, i32 1613770832, i32 33620227, i32 -832084055, i32 1445669757, i32 -402719207, i32 -1244145822, i32 1303096294, i32 -327780710, i32 -1882535355, i32 528646813, i32 -1983264448, i32 -92439161, i32 -268764651, i32 -1302767125, i32 -1907931191, i32 -68095989, i32 1101901292, i32 -1277897625, i32 1604494077, i32 1169141738, i32 597466303, i32 1403299063, i32 -462261610, i32 -1681866661, i32 1974974402, i32 -503448292, i32 1033081774, i32 1277568618, i32 1815492186, i32 2118074177, i32 -168298750, i32 -2083730353, i32 1748251740, i32 1369810420, i32 -773462732, i32 -101584632, i32 -495881837, i32 -1411852173, i32 1647391059, i32 706024767, i32 134480908, i32 -1782069422, i32 1176707941, i32 -1648114850, i32 806885416, i32 932615841, i32 168101135, i32 798661301, i32 235341577, i32 605164086, i32 461406363, i32 -538779075, i32 -840176858, i32 1311188841, i32 2142417613, i32 -361400929, i32 302582043, i32 495158174, i32 1479289972, i32 874125870, i32 907746093, i32 -596742478, i32 -1269146898, i32 1537253627, i32 -1538108682, i32 1983593293, i32 -1210657183, i32 2108928974, i32 1378429307, i32 -572267714, i32 1580150641, i32 327451799, i32 -1504488459, i32 -1177431704, i32 0, i32 -1041371860, i32 1075847264, i32 -469959649, i32 2041688520, i32 -1235526675, i32 -731223362, i32 -1916023994, i32 1740553945, i32 1916352843, i32 -1807070498, i32 -1739830060, i32 -1336387352, i32 -2049978550, i32 -1143943061, i32 -974131414, i32 1336584933, i32 -302253290, i32 -2042412091, i32 -1706209833, i32 1714631509, i32 293963156, i32 -1975171633, i32 -369493744, i32 67240454, i32 -25198719, i32 -1605349136, i32 2017213508, i32 631218106, i32 1269344483, i32 -1571728909, i32 1571005438, i32 -2143272768, i32 93294474, i32 1066570413, i32 563977660, i32 1882732616, i32 -235539196, i32 1673313503, i32 2008463041, i32 -1344611723, i32 1109467491, i32 537923632, i32 -436207846, i32 -34344178, i32 -1076702611, i32 -2117218996, i32 403442708, i32 638784309, i32 -1007883217, i32 -1101045791, i32 899127202, i32 -2008791860, i32 773265209, i32 -1815821225, i32 1437050866, i32 -58818942, i32 2050833735, i32 -932944724, i32 -1168286233, i32 840505643, i32 -428641387, i32 -1067425632, i32 427917720, i32 -1638969391, i32 -1545806721, i32 1143087718, i32 1412049534, i32 999329963, i32 193497219, i32 -1941551414, i32 -940642775, i32 1807268051, i32 672404540, i32 -1478566279, i32 -1134666014, i32 369822493, i32 -1378100362, i32 -606019525, i32 1681011286, i32 1949973070, i32 336202270, i32 -1840690725, i32 201721354, i32 1210328172, i32 -1201906460, i32 -1614626211, i32 -1110191250, i32 1135389935, i32 -1000185178, i32 965841320, i32 831886756, i32 -739974089, i32 -226920053, i32 -706222286, i32 -1949775805, i32 1849112409, i32 -630362697, i32 26054028, i32 -1311386268, i32 -1672589614, i32 1235855840, i32 -663982924, i32 -1403627782, i32 -202050553, i32 -806688219, i32 -899324497, i32 -193299826, i32 1202630377, i32 268961816, i32 1874508501, i32 -260540280, i32 1243948399, i32 1546530418, i32 941366308, i32 1470539505, i32 1941222599, i32 -1748580783, i32 -873928669, i32 -1579295364, i32 -395021156, i32 1042226977, i32 -1773450275, i32 1639824860, i32 227249030, i32 260737669, i32 -529502064, i32 2084453954, i32 1907733956, i32 -865704278, i32 -1874310952, i32 100860677, i32 -134810111, i32 470683154, i32 -1033805405, i32 1781871967, i32 -1370007559, i32 1773779408, i32 394692241, i32 -1715355304, i32 974986535, i32 664706745, i32 -639508168, i32 -336005101, i32 731420851, i32 571543859, i32 -764843589, i32 -1445340816, i32 126783113, i32 865375399, i32 765172662, i32 1008606754, i32 361203602, i32 -907417312, i32 -2016489911, i32 -1437248001, i32 1344809080, i32 -1512054918, i32 59542671, i32 1503764984, i32 160008576, i32 437062935, i32 1707065306, i32 -672733647, i32 -2076032314, i32 -798463816, i32 -2109652541, i32 697932208, i32 1512910199, i32 504303377, i32 2075177163, i32 -1470868228, i32 1841019862, i32 739644986], align 16, !dbg !19
@Te1 = internal unnamed_addr constant [256 x i32] [i32 -1513725085, i32 -2064089988, i32 -1712425097, i32 -1913226373, i32 234877682, i32 -1110021269, i32 -1310822545, i32 1418839493, i32 1348481072, i32 50462977, i32 -1446090905, i32 2102799147, i32 434634494, i32 1656084439, i32 -431117397, i32 -1695779210, i32 1167051466, i32 -1658879358, i32 1082771913, i32 -2013627011, i32 368048890, i32 -340633255, i32 -913422521, i32 201060592, i32 -331240019, i32 1739838676, i32 -44064094, i32 -364531793, i32 -1088185188, i32 -145513308, i32 -1763413390, i32 1536934080, i32 -1032472649, i32 484572669, i32 -1371696237, i32 1783375398, i32 1517041206, i32 1098792767, i32 49674231, i32 1334037708, i32 1550332980, i32 -195975771, i32 886171109, i32 150598129, i32 -1813876367, i32 1940642008, i32 1398944049, i32 1059722517, i32 201851908, i32 1385547719, i32 1699095331, i32 1587397571, i32 674240536, i32 -1590192490, i32 252314885, i32 -1255171430, i32 151914247, i32 908333586, i32 -1692696448, i32 1038082786, i32 651029483, i32 1766729511, i32 -847269198, i32 -1612024459, i32 454166793, i32 -1642232957, i32 1951935532, i32 775166490, i32 758520603, i32 -1294176658, i32 -290170278, i32 -77881184, i32 -157003182, i32 1299594043, i32 1639438038, i32 -830622797, i32 2068982057, i32 1054729187, i32 1901997871, i32 -1760328572, i32 -173649069, i32 1757008337, i32 0, i32 750906861, i32 1614815264, i32 535035132, i32 -931548751, i32 -306816165, i32 -1093375382, i32 1183697867, i32 -647512386, i32 1265776953, i32 -560706998, i32 -728216500, i32 -391096232, i32 1250283471, i32 1807470800, i32 717615087, i32 -447763798, i32 384695291, i32 -981056701, i32 -677753523, i32 1432761139, i32 -1810791035, i32 -813021883, i32 283769337, i32 100925954, i32 -2114027649, i32 -257929136, i32 1148730428, i32 -1171939425, i32 -481580888, i32 -207466159, i32 -27417693, i32 -1065336768, i32 -1979347057, i32 -1388342638, i32 -1138647651, i32 1215313976, i32 82966005, i32 -547111748, i32 -1049119050, i32 1974459098, i32 1665278241, i32 807407632, i32 451280895, i32 251524083, i32 1841287890, i32 1283575245, i32 337120268, i32 891687699, i32 801369324, i32 -507617441, i32 -1573546089, i32 -863484860, i32 959321879, i32 1469301956, i32 -229267545, i32 -2097381762, i32 1199193405, i32 -1396153244, i32 -407216803, i32 724703513, i32 -1780059277, i32 -1598005152, i32 -1743158911, i32 -778154161, i32 2141445340, i32 1715741218, i32 2119445034, i32 -1422159728, i32 -2096396152, i32 -896776634, i32 700968686, i32 -747915080, i32 1009259540, i32 2041044702, i32 -490971554, i32 487983883, i32 1991105499, i32 1004265696, i32 1449407026, i32 1316239930, i32 504629770, i32 -611169975, i32 168560134, i32 1816667172, i32 -457679780, i32 1570751170, i32 1857934291, i32 -280777556, i32 -1497079198, i32 -1472622191, i32 -1540254315, i32 936633572, i32 -1947043463, i32 852879335, i32 1133234376, i32 1500395319, i32 -1210421907, i32 -1946055283, i32 1689376213, i32 -761508274, i32 -532043351, i32 -1260884884, i32 -89369002, i32 133428468, i32 634383082, i32 -1345690267, i32 -1896580486, i32 -381178194, i32 403703816, i32 -714097990, i32 -1997506440, i32 1867130149, i32 1918643758, i32 607656988, i32 -245913946, i32 -948718412, i32 1368901318, i32 600565992, i32 2090982877, i32 -1662487436, i32 557719327, i32 -577352885, i32 -597574211, i32 -2045932661, i32 -2062579062, i32 -1864339344, i32 1115438654, i32 -999180875, i32 -1429445018, i32 -661632952, i32 84280067, i32 33027830, i32 303828494, i32 -1547542175, i32 1600795957, i32 -106014889, i32 -798377543, i32 -1860729210, i32 1486471617, i32 658119965, i32 -1188585826, i32 953803233, i32 334231800, i32 -1288988520, i32 857870609, i32 -1143838359, i32 1890179545, i32 -1995993458, i32 -1489791852, i32 -1238525029, i32 574365214, i32 -1844082809, i32 550103529, i32 1233637070, i32 -5614251, i32 2018519080, i32 2057691103, i32 -1895592820, i32 -128343647, i32 -2146858615, i32 387583245, i32 -630865985, i32 836232934, i32 -964410814, i32 -1194301336, i32 -1014873791, i32 -1339450983, i32 2002398509, i32 287182607, i32 -881086288, i32 -56077228, i32 -697451589, i32 975967766], align 16, !dbg !21
@rcon = internal unnamed_addr constant [10 x i32] [i32 16777216, i32 33554432, i32 67108864, i32 134217728, i32 268435456, i32 536870912, i32 1073741824, i32 -2147483648, i32 452984832, i32 905969664], align 16, !dbg !23

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() local_unnamed_addr #0 !dbg !82 {
entry:
  %in = alloca [16 x i8], align 16
  %out = alloca [16 x i8], align 16
  %len = alloca i64, align 8
  %key = alloca [16 x i8], align 16
  %aes_key = alloca %struct.aes_key_st, align 4
  %ivec = alloca [16 x i8], align 16
  %num = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata [16 x i8]* %in, metadata !85, metadata !DIExpression()), !dbg !89
  %0 = bitcast [16 x i8]* %in to i8*, !dbg !89
  %1 = call i8* @memcpy(i8* %0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @main.in, i32 0, i32 0), i64 16), !dbg !89
  call void @llvm.dbg.declare(metadata [16 x i8]* %out, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %len, metadata !93, metadata !DIExpression()), !dbg !94
  store i64 16, i64* %len, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [16 x i8]* %key, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = bitcast [16 x i8]* %key to i8*, !dbg !96
  %3 = call i8* @memcpy(i8* %2, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @main.key, i32 0, i32 0), i64 16), !dbg !96
  call void @llvm.dbg.declare(metadata %struct.aes_key_st* %aes_key, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [16 x i8]* %ivec, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %num, metadata !101, metadata !DIExpression()), !dbg !103
  store i32* null, i32** %num, align 8, !dbg !103
  %4 = bitcast [16 x i8]* %ivec to i8*, !dbg !104
  call void @klee_make_symbolic(i8* %4, i64 16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)), !dbg !105
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %key, i32 0, i32 0, !dbg !106
  call fastcc void @AES_set_encrypt_key(i8* %arraydecay, %struct.aes_key_st* %aes_key), !dbg !107
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %in, i32 0, i32 0, !dbg !108
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %out, i32 0, i32 0, !dbg !109
  %5 = load i64, i64* %len, align 8, !dbg !110
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %ivec, i32 0, i32 0, !dbg !111
  %6 = load i32*, i32** %num, align 8, !dbg !112
  call fastcc void @AES_ofb128_encrypt(i8* %arraydecay1, i8* %arraydecay2, i64 %5, %struct.aes_key_st* %aes_key, i8* %arraydecay3, i32* %6), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @AES_set_encrypt_key(i8* %userKey, %struct.aes_key_st* %key) unnamed_addr #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  %userKey.addr = alloca i8*, align 8
  %bits.addr = alloca i32, align 4
  %key.addr = alloca %struct.aes_key_st*, align 8
  %rk = alloca i32*, align 8
  %i = alloca i32, align 4
  %temp = alloca i32, align 4
  store i8* %userKey, i8** %userKey.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %userKey.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 128, i32* %bits.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %bits.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store %struct.aes_key_st* %key, %struct.aes_key_st** %key.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.aes_key_st** %key.addr, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32** %rk, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 0, i32* %i, align 4, !dbg !135
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = load i8*, i8** %userKey.addr, align 8, !dbg !138
  %tobool = icmp ne i8* %0, null, !dbg !138
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !140

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !141
  %tobool1 = icmp ne %struct.aes_key_st* %1, null, !dbg !141
  br i1 %tobool1, label %if.end, label %if.then, !dbg !142

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4, !dbg !143
  br label %return, !dbg !143

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32, i32* %bits.addr, align 4, !dbg !144
  %cmp = icmp ne i32 %2, 128, !dbg !146
  br i1 %cmp, label %land.lhs.true, label %if.end6, !dbg !147

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %bits.addr, align 4, !dbg !148
  %cmp2 = icmp ne i32 %3, 192, !dbg !149
  br i1 %cmp2, label %land.lhs.true3, label %if.end6, !dbg !150

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i32, i32* %bits.addr, align 4, !dbg !151
  %cmp4 = icmp ne i32 %4, 256, !dbg !152
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !153

if.then5:                                         ; preds = %land.lhs.true3
  store i32 -2, i32* %retval, align 4, !dbg !154
  br label %return, !dbg !154

if.end6:                                          ; preds = %land.lhs.true3, %land.lhs.true, %if.end
  %5 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !155
  %rd_key = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %5, i32 0, i32 0, !dbg !156
  %arraydecay = getelementptr inbounds [60 x i32], [60 x i32]* %rd_key, i32 0, i32 0, !dbg !155
  store i32* %arraydecay, i32** %rk, align 8, !dbg !157
  %6 = load i32, i32* %bits.addr, align 4, !dbg !158
  %cmp7 = icmp eq i32 %6, 128, !dbg !160
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !161

if.then8:                                         ; preds = %if.end6
  %7 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !162
  %rounds = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %7, i32 0, i32 1, !dbg !163
  store i32 10, i32* %rounds, align 4, !dbg !164
  br label %if.end15, !dbg !162

if.else:                                          ; preds = %if.end6
  %8 = load i32, i32* %bits.addr, align 4, !dbg !165
  %cmp9 = icmp eq i32 %8, 192, !dbg !167
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !168

if.then10:                                        ; preds = %if.else
  %9 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !169
  %rounds11 = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %9, i32 0, i32 1, !dbg !170
  store i32 12, i32* %rounds11, align 4, !dbg !171
  br label %if.end14, !dbg !169

if.else12:                                        ; preds = %if.else
  %10 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !172
  %rounds13 = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %10, i32 0, i32 1, !dbg !173
  store i32 14, i32* %rounds13, align 4, !dbg !174
  br label %if.end14

if.end14:                                         ; preds = %if.else12, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then8
  %11 = load i8*, i8** %userKey.addr, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i8, i8* %11, i64 0, !dbg !175
  %12 = load i8, i8* %arrayidx, align 1, !dbg !175
  %conv = zext i8 %12 to i32, !dbg !175
  %shl = shl i32 %conv, 24, !dbg !175
  %13 = load i8*, i8** %userKey.addr, align 8, !dbg !175
  %arrayidx16 = getelementptr inbounds i8, i8* %13, i64 1, !dbg !175
  %14 = load i8, i8* %arrayidx16, align 1, !dbg !175
  %conv17 = zext i8 %14 to i32, !dbg !175
  %shl18 = shl i32 %conv17, 16, !dbg !175
  %xor = xor i32 %shl, %shl18, !dbg !175
  %15 = load i8*, i8** %userKey.addr, align 8, !dbg !175
  %arrayidx19 = getelementptr inbounds i8, i8* %15, i64 2, !dbg !175
  %16 = load i8, i8* %arrayidx19, align 1, !dbg !175
  %conv20 = zext i8 %16 to i32, !dbg !175
  %shl21 = shl i32 %conv20, 8, !dbg !175
  %xor22 = xor i32 %xor, %shl21, !dbg !175
  %17 = load i8*, i8** %userKey.addr, align 8, !dbg !175
  %arrayidx23 = getelementptr inbounds i8, i8* %17, i64 3, !dbg !175
  %18 = load i8, i8* %arrayidx23, align 1, !dbg !175
  %conv24 = zext i8 %18 to i32, !dbg !175
  %xor25 = xor i32 %xor22, %conv24, !dbg !175
  %19 = load i32*, i32** %rk, align 8, !dbg !176
  %arrayidx26 = getelementptr inbounds i32, i32* %19, i64 0, !dbg !176
  store i32 %xor25, i32* %arrayidx26, align 4, !dbg !177
  %20 = load i8*, i8** %userKey.addr, align 8, !dbg !178
  %add.ptr = getelementptr inbounds i8, i8* %20, i64 4, !dbg !178
  %arrayidx27 = getelementptr inbounds i8, i8* %add.ptr, i64 0, !dbg !178
  %21 = load i8, i8* %arrayidx27, align 1, !dbg !178
  %conv28 = zext i8 %21 to i32, !dbg !178
  %shl29 = shl i32 %conv28, 24, !dbg !178
  %22 = load i8*, i8** %userKey.addr, align 8, !dbg !178
  %add.ptr30 = getelementptr inbounds i8, i8* %22, i64 4, !dbg !178
  %arrayidx31 = getelementptr inbounds i8, i8* %add.ptr30, i64 1, !dbg !178
  %23 = load i8, i8* %arrayidx31, align 1, !dbg !178
  %conv32 = zext i8 %23 to i32, !dbg !178
  %shl33 = shl i32 %conv32, 16, !dbg !178
  %xor34 = xor i32 %shl29, %shl33, !dbg !178
  %24 = load i8*, i8** %userKey.addr, align 8, !dbg !178
  %add.ptr35 = getelementptr inbounds i8, i8* %24, i64 4, !dbg !178
  %arrayidx36 = getelementptr inbounds i8, i8* %add.ptr35, i64 2, !dbg !178
  %25 = load i8, i8* %arrayidx36, align 1, !dbg !178
  %conv37 = zext i8 %25 to i32, !dbg !178
  %shl38 = shl i32 %conv37, 8, !dbg !178
  %xor39 = xor i32 %xor34, %shl38, !dbg !178
  %26 = load i8*, i8** %userKey.addr, align 8, !dbg !178
  %add.ptr40 = getelementptr inbounds i8, i8* %26, i64 4, !dbg !178
  %arrayidx41 = getelementptr inbounds i8, i8* %add.ptr40, i64 3, !dbg !178
  %27 = load i8, i8* %arrayidx41, align 1, !dbg !178
  %conv42 = zext i8 %27 to i32, !dbg !178
  %xor43 = xor i32 %xor39, %conv42, !dbg !178
  %28 = load i32*, i32** %rk, align 8, !dbg !179
  %arrayidx44 = getelementptr inbounds i32, i32* %28, i64 1, !dbg !179
  store i32 %xor43, i32* %arrayidx44, align 4, !dbg !180
  %29 = load i8*, i8** %userKey.addr, align 8, !dbg !181
  %add.ptr45 = getelementptr inbounds i8, i8* %29, i64 8, !dbg !181
  %arrayidx46 = getelementptr inbounds i8, i8* %add.ptr45, i64 0, !dbg !181
  %30 = load i8, i8* %arrayidx46, align 1, !dbg !181
  %conv47 = zext i8 %30 to i32, !dbg !181
  %shl48 = shl i32 %conv47, 24, !dbg !181
  %31 = load i8*, i8** %userKey.addr, align 8, !dbg !181
  %add.ptr49 = getelementptr inbounds i8, i8* %31, i64 8, !dbg !181
  %arrayidx50 = getelementptr inbounds i8, i8* %add.ptr49, i64 1, !dbg !181
  %32 = load i8, i8* %arrayidx50, align 1, !dbg !181
  %conv51 = zext i8 %32 to i32, !dbg !181
  %shl52 = shl i32 %conv51, 16, !dbg !181
  %xor53 = xor i32 %shl48, %shl52, !dbg !181
  %33 = load i8*, i8** %userKey.addr, align 8, !dbg !181
  %add.ptr54 = getelementptr inbounds i8, i8* %33, i64 8, !dbg !181
  %arrayidx55 = getelementptr inbounds i8, i8* %add.ptr54, i64 2, !dbg !181
  %34 = load i8, i8* %arrayidx55, align 1, !dbg !181
  %conv56 = zext i8 %34 to i32, !dbg !181
  %shl57 = shl i32 %conv56, 8, !dbg !181
  %xor58 = xor i32 %xor53, %shl57, !dbg !181
  %35 = load i8*, i8** %userKey.addr, align 8, !dbg !181
  %add.ptr59 = getelementptr inbounds i8, i8* %35, i64 8, !dbg !181
  %arrayidx60 = getelementptr inbounds i8, i8* %add.ptr59, i64 3, !dbg !181
  %36 = load i8, i8* %arrayidx60, align 1, !dbg !181
  %conv61 = zext i8 %36 to i32, !dbg !181
  %xor62 = xor i32 %xor58, %conv61, !dbg !181
  %37 = load i32*, i32** %rk, align 8, !dbg !182
  %arrayidx63 = getelementptr inbounds i32, i32* %37, i64 2, !dbg !182
  store i32 %xor62, i32* %arrayidx63, align 4, !dbg !183
  %38 = load i8*, i8** %userKey.addr, align 8, !dbg !184
  %add.ptr64 = getelementptr inbounds i8, i8* %38, i64 12, !dbg !184
  %arrayidx65 = getelementptr inbounds i8, i8* %add.ptr64, i64 0, !dbg !184
  %39 = load i8, i8* %arrayidx65, align 1, !dbg !184
  %conv66 = zext i8 %39 to i32, !dbg !184
  %shl67 = shl i32 %conv66, 24, !dbg !184
  %40 = load i8*, i8** %userKey.addr, align 8, !dbg !184
  %add.ptr68 = getelementptr inbounds i8, i8* %40, i64 12, !dbg !184
  %arrayidx69 = getelementptr inbounds i8, i8* %add.ptr68, i64 1, !dbg !184
  %41 = load i8, i8* %arrayidx69, align 1, !dbg !184
  %conv70 = zext i8 %41 to i32, !dbg !184
  %shl71 = shl i32 %conv70, 16, !dbg !184
  %xor72 = xor i32 %shl67, %shl71, !dbg !184
  %42 = load i8*, i8** %userKey.addr, align 8, !dbg !184
  %add.ptr73 = getelementptr inbounds i8, i8* %42, i64 12, !dbg !184
  %arrayidx74 = getelementptr inbounds i8, i8* %add.ptr73, i64 2, !dbg !184
  %43 = load i8, i8* %arrayidx74, align 1, !dbg !184
  %conv75 = zext i8 %43 to i32, !dbg !184
  %shl76 = shl i32 %conv75, 8, !dbg !184
  %xor77 = xor i32 %xor72, %shl76, !dbg !184
  %44 = load i8*, i8** %userKey.addr, align 8, !dbg !184
  %add.ptr78 = getelementptr inbounds i8, i8* %44, i64 12, !dbg !184
  %arrayidx79 = getelementptr inbounds i8, i8* %add.ptr78, i64 3, !dbg !184
  %45 = load i8, i8* %arrayidx79, align 1, !dbg !184
  %conv80 = zext i8 %45 to i32, !dbg !184
  %xor81 = xor i32 %xor77, %conv80, !dbg !184
  %46 = load i32*, i32** %rk, align 8, !dbg !185
  %arrayidx82 = getelementptr inbounds i32, i32* %46, i64 3, !dbg !185
  store i32 %xor81, i32* %arrayidx82, align 4, !dbg !186
  %47 = load i32, i32* %bits.addr, align 4, !dbg !187
  %cmp83 = icmp eq i32 %47, 128, !dbg !189
  br i1 %cmp83, label %if.then85, label %if.end128, !dbg !190

if.then85:                                        ; preds = %if.end15
  br label %while.body, !dbg !191

while.body:                                       ; preds = %if.then85, %if.end126
  %48 = load i32*, i32** %rk, align 8, !dbg !193
  %arrayidx86 = getelementptr inbounds i32, i32* %48, i64 3, !dbg !193
  %49 = load i32, i32* %arrayidx86, align 4, !dbg !193
  store i32 %49, i32* %temp, align 4, !dbg !195
  %50 = load i32*, i32** %rk, align 8, !dbg !196
  %arrayidx87 = getelementptr inbounds i32, i32* %50, i64 0, !dbg !196
  %51 = load i32, i32* %arrayidx87, align 4, !dbg !196
  %52 = load i32, i32* %temp, align 4, !dbg !197
  %shr = lshr i32 %52, 16, !dbg !198
  %and = and i32 %shr, 255, !dbg !199
  %idxprom = zext i32 %and to i64, !dbg !200
  %arrayidx88 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom, !dbg !200
  %53 = load i32, i32* %arrayidx88, align 4, !dbg !200
  %and89 = and i32 %53, -16777216, !dbg !201
  %xor90 = xor i32 %51, %and89, !dbg !202
  %54 = load i32, i32* %temp, align 4, !dbg !203
  %shr91 = lshr i32 %54, 8, !dbg !204
  %and92 = and i32 %shr91, 255, !dbg !205
  %idxprom93 = zext i32 %and92 to i64, !dbg !206
  %arrayidx94 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom93, !dbg !206
  %55 = load i32, i32* %arrayidx94, align 4, !dbg !206
  %and95 = and i32 %55, 16711680, !dbg !207
  %xor96 = xor i32 %xor90, %and95, !dbg !208
  %56 = load i32, i32* %temp, align 4, !dbg !209
  %and97 = and i32 %56, 255, !dbg !210
  %idxprom98 = zext i32 %and97 to i64, !dbg !211
  %arrayidx99 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom98, !dbg !211
  %57 = load i32, i32* %arrayidx99, align 4, !dbg !211
  %and100 = and i32 %57, 65280, !dbg !212
  %xor101 = xor i32 %xor96, %and100, !dbg !213
  %58 = load i32, i32* %temp, align 4, !dbg !214
  %shr102 = lshr i32 %58, 24, !dbg !215
  %idxprom103 = zext i32 %shr102 to i64, !dbg !216
  %arrayidx104 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom103, !dbg !216
  %59 = load i32, i32* %arrayidx104, align 4, !dbg !216
  %and105 = and i32 %59, 255, !dbg !217
  %xor106 = xor i32 %xor101, %and105, !dbg !218
  %60 = load i32, i32* %i, align 4, !dbg !219
  %idxprom107 = sext i32 %60 to i64, !dbg !220
  %arrayidx108 = getelementptr inbounds [10 x i32], [10 x i32]* @rcon, i64 0, i64 %idxprom107, !dbg !220
  %61 = load i32, i32* %arrayidx108, align 4, !dbg !220
  %xor109 = xor i32 %xor106, %61, !dbg !221
  %62 = load i32*, i32** %rk, align 8, !dbg !222
  %arrayidx110 = getelementptr inbounds i32, i32* %62, i64 4, !dbg !222
  store i32 %xor109, i32* %arrayidx110, align 4, !dbg !223
  %63 = load i32*, i32** %rk, align 8, !dbg !224
  %arrayidx111 = getelementptr inbounds i32, i32* %63, i64 1, !dbg !224
  %64 = load i32, i32* %arrayidx111, align 4, !dbg !224
  %65 = load i32*, i32** %rk, align 8, !dbg !225
  %arrayidx112 = getelementptr inbounds i32, i32* %65, i64 4, !dbg !225
  %66 = load i32, i32* %arrayidx112, align 4, !dbg !225
  %xor113 = xor i32 %64, %66, !dbg !226
  %67 = load i32*, i32** %rk, align 8, !dbg !227
  %arrayidx114 = getelementptr inbounds i32, i32* %67, i64 5, !dbg !227
  store i32 %xor113, i32* %arrayidx114, align 4, !dbg !228
  %68 = load i32*, i32** %rk, align 8, !dbg !229
  %arrayidx115 = getelementptr inbounds i32, i32* %68, i64 2, !dbg !229
  %69 = load i32, i32* %arrayidx115, align 4, !dbg !229
  %70 = load i32*, i32** %rk, align 8, !dbg !230
  %arrayidx116 = getelementptr inbounds i32, i32* %70, i64 5, !dbg !230
  %71 = load i32, i32* %arrayidx116, align 4, !dbg !230
  %xor117 = xor i32 %69, %71, !dbg !231
  %72 = load i32*, i32** %rk, align 8, !dbg !232
  %arrayidx118 = getelementptr inbounds i32, i32* %72, i64 6, !dbg !232
  store i32 %xor117, i32* %arrayidx118, align 4, !dbg !233
  %73 = load i32*, i32** %rk, align 8, !dbg !234
  %arrayidx119 = getelementptr inbounds i32, i32* %73, i64 3, !dbg !234
  %74 = load i32, i32* %arrayidx119, align 4, !dbg !234
  %75 = load i32*, i32** %rk, align 8, !dbg !235
  %arrayidx120 = getelementptr inbounds i32, i32* %75, i64 6, !dbg !235
  %76 = load i32, i32* %arrayidx120, align 4, !dbg !235
  %xor121 = xor i32 %74, %76, !dbg !236
  %77 = load i32*, i32** %rk, align 8, !dbg !237
  %arrayidx122 = getelementptr inbounds i32, i32* %77, i64 7, !dbg !237
  store i32 %xor121, i32* %arrayidx122, align 4, !dbg !238
  %78 = load i32, i32* %i, align 4, !dbg !239
  %inc = add nsw i32 %78, 1, !dbg !239
  store i32 %inc, i32* %i, align 4, !dbg !239
  %cmp123 = icmp eq i32 %inc, 10, !dbg !241
  br i1 %cmp123, label %if.then125, label %if.end126, !dbg !242

if.then125:                                       ; preds = %while.body
  store i32 0, i32* %retval, align 4, !dbg !243
  br label %return, !dbg !243

if.end126:                                        ; preds = %while.body
  %79 = load i32*, i32** %rk, align 8, !dbg !245
  %add.ptr127 = getelementptr inbounds i32, i32* %79, i64 4, !dbg !245
  store i32* %add.ptr127, i32** %rk, align 8, !dbg !245
  br label %while.body, !dbg !191, !llvm.loop !246

if.end128:                                        ; preds = %if.end15
  %80 = load i8*, i8** %userKey.addr, align 8, !dbg !248
  %add.ptr129 = getelementptr inbounds i8, i8* %80, i64 16, !dbg !248
  %arrayidx130 = getelementptr inbounds i8, i8* %add.ptr129, i64 0, !dbg !248
  %81 = load i8, i8* %arrayidx130, align 1, !dbg !248
  %conv131 = zext i8 %81 to i32, !dbg !248
  %shl132 = shl i32 %conv131, 24, !dbg !248
  %82 = load i8*, i8** %userKey.addr, align 8, !dbg !248
  %add.ptr133 = getelementptr inbounds i8, i8* %82, i64 16, !dbg !248
  %arrayidx134 = getelementptr inbounds i8, i8* %add.ptr133, i64 1, !dbg !248
  %83 = load i8, i8* %arrayidx134, align 1, !dbg !248
  %conv135 = zext i8 %83 to i32, !dbg !248
  %shl136 = shl i32 %conv135, 16, !dbg !248
  %xor137 = xor i32 %shl132, %shl136, !dbg !248
  %84 = load i8*, i8** %userKey.addr, align 8, !dbg !248
  %add.ptr138 = getelementptr inbounds i8, i8* %84, i64 16, !dbg !248
  %arrayidx139 = getelementptr inbounds i8, i8* %add.ptr138, i64 2, !dbg !248
  %85 = load i8, i8* %arrayidx139, align 1, !dbg !248
  %conv140 = zext i8 %85 to i32, !dbg !248
  %shl141 = shl i32 %conv140, 8, !dbg !248
  %xor142 = xor i32 %xor137, %shl141, !dbg !248
  %86 = load i8*, i8** %userKey.addr, align 8, !dbg !248
  %add.ptr143 = getelementptr inbounds i8, i8* %86, i64 16, !dbg !248
  %arrayidx144 = getelementptr inbounds i8, i8* %add.ptr143, i64 3, !dbg !248
  %87 = load i8, i8* %arrayidx144, align 1, !dbg !248
  %conv145 = zext i8 %87 to i32, !dbg !248
  %xor146 = xor i32 %xor142, %conv145, !dbg !248
  %88 = load i32*, i32** %rk, align 8, !dbg !249
  %arrayidx147 = getelementptr inbounds i32, i32* %88, i64 4, !dbg !249
  store i32 %xor146, i32* %arrayidx147, align 4, !dbg !250
  %89 = load i8*, i8** %userKey.addr, align 8, !dbg !251
  %add.ptr148 = getelementptr inbounds i8, i8* %89, i64 20, !dbg !251
  %arrayidx149 = getelementptr inbounds i8, i8* %add.ptr148, i64 0, !dbg !251
  %90 = load i8, i8* %arrayidx149, align 1, !dbg !251
  %conv150 = zext i8 %90 to i32, !dbg !251
  %shl151 = shl i32 %conv150, 24, !dbg !251
  %91 = load i8*, i8** %userKey.addr, align 8, !dbg !251
  %add.ptr152 = getelementptr inbounds i8, i8* %91, i64 20, !dbg !251
  %arrayidx153 = getelementptr inbounds i8, i8* %add.ptr152, i64 1, !dbg !251
  %92 = load i8, i8* %arrayidx153, align 1, !dbg !251
  %conv154 = zext i8 %92 to i32, !dbg !251
  %shl155 = shl i32 %conv154, 16, !dbg !251
  %xor156 = xor i32 %shl151, %shl155, !dbg !251
  %93 = load i8*, i8** %userKey.addr, align 8, !dbg !251
  %add.ptr157 = getelementptr inbounds i8, i8* %93, i64 20, !dbg !251
  %arrayidx158 = getelementptr inbounds i8, i8* %add.ptr157, i64 2, !dbg !251
  %94 = load i8, i8* %arrayidx158, align 1, !dbg !251
  %conv159 = zext i8 %94 to i32, !dbg !251
  %shl160 = shl i32 %conv159, 8, !dbg !251
  %xor161 = xor i32 %xor156, %shl160, !dbg !251
  %95 = load i8*, i8** %userKey.addr, align 8, !dbg !251
  %add.ptr162 = getelementptr inbounds i8, i8* %95, i64 20, !dbg !251
  %arrayidx163 = getelementptr inbounds i8, i8* %add.ptr162, i64 3, !dbg !251
  %96 = load i8, i8* %arrayidx163, align 1, !dbg !251
  %conv164 = zext i8 %96 to i32, !dbg !251
  %xor165 = xor i32 %xor161, %conv164, !dbg !251
  %97 = load i32*, i32** %rk, align 8, !dbg !252
  %arrayidx166 = getelementptr inbounds i32, i32* %97, i64 5, !dbg !252
  store i32 %xor165, i32* %arrayidx166, align 4, !dbg !253
  %98 = load i32, i32* %bits.addr, align 4, !dbg !254
  %cmp167 = icmp eq i32 %98, 192, !dbg !256
  br i1 %cmp167, label %if.then169, label %if.end225, !dbg !257

if.then169:                                       ; preds = %if.end128
  br label %while.body170, !dbg !258

while.body170:                                    ; preds = %if.then169, %if.end215
  %99 = load i32*, i32** %rk, align 8, !dbg !260
  %arrayidx171 = getelementptr inbounds i32, i32* %99, i64 5, !dbg !260
  %100 = load i32, i32* %arrayidx171, align 4, !dbg !260
  store i32 %100, i32* %temp, align 4, !dbg !262
  %101 = load i32*, i32** %rk, align 8, !dbg !263
  %arrayidx172 = getelementptr inbounds i32, i32* %101, i64 0, !dbg !263
  %102 = load i32, i32* %arrayidx172, align 4, !dbg !263
  %103 = load i32, i32* %temp, align 4, !dbg !264
  %shr173 = lshr i32 %103, 16, !dbg !265
  %and174 = and i32 %shr173, 255, !dbg !266
  %idxprom175 = zext i32 %and174 to i64, !dbg !267
  %arrayidx176 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom175, !dbg !267
  %104 = load i32, i32* %arrayidx176, align 4, !dbg !267
  %and177 = and i32 %104, -16777216, !dbg !268
  %xor178 = xor i32 %102, %and177, !dbg !269
  %105 = load i32, i32* %temp, align 4, !dbg !270
  %shr179 = lshr i32 %105, 8, !dbg !271
  %and180 = and i32 %shr179, 255, !dbg !272
  %idxprom181 = zext i32 %and180 to i64, !dbg !273
  %arrayidx182 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom181, !dbg !273
  %106 = load i32, i32* %arrayidx182, align 4, !dbg !273
  %and183 = and i32 %106, 16711680, !dbg !274
  %xor184 = xor i32 %xor178, %and183, !dbg !275
  %107 = load i32, i32* %temp, align 4, !dbg !276
  %and185 = and i32 %107, 255, !dbg !277
  %idxprom186 = zext i32 %and185 to i64, !dbg !278
  %arrayidx187 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom186, !dbg !278
  %108 = load i32, i32* %arrayidx187, align 4, !dbg !278
  %and188 = and i32 %108, 65280, !dbg !279
  %xor189 = xor i32 %xor184, %and188, !dbg !280
  %109 = load i32, i32* %temp, align 4, !dbg !281
  %shr190 = lshr i32 %109, 24, !dbg !282
  %idxprom191 = zext i32 %shr190 to i64, !dbg !283
  %arrayidx192 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom191, !dbg !283
  %110 = load i32, i32* %arrayidx192, align 4, !dbg !283
  %and193 = and i32 %110, 255, !dbg !284
  %xor194 = xor i32 %xor189, %and193, !dbg !285
  %111 = load i32, i32* %i, align 4, !dbg !286
  %idxprom195 = sext i32 %111 to i64, !dbg !287
  %arrayidx196 = getelementptr inbounds [10 x i32], [10 x i32]* @rcon, i64 0, i64 %idxprom195, !dbg !287
  %112 = load i32, i32* %arrayidx196, align 4, !dbg !287
  %xor197 = xor i32 %xor194, %112, !dbg !288
  %113 = load i32*, i32** %rk, align 8, !dbg !289
  %arrayidx198 = getelementptr inbounds i32, i32* %113, i64 6, !dbg !289
  store i32 %xor197, i32* %arrayidx198, align 4, !dbg !290
  %114 = load i32*, i32** %rk, align 8, !dbg !291
  %arrayidx199 = getelementptr inbounds i32, i32* %114, i64 1, !dbg !291
  %115 = load i32, i32* %arrayidx199, align 4, !dbg !291
  %116 = load i32*, i32** %rk, align 8, !dbg !292
  %arrayidx200 = getelementptr inbounds i32, i32* %116, i64 6, !dbg !292
  %117 = load i32, i32* %arrayidx200, align 4, !dbg !292
  %xor201 = xor i32 %115, %117, !dbg !293
  %118 = load i32*, i32** %rk, align 8, !dbg !294
  %arrayidx202 = getelementptr inbounds i32, i32* %118, i64 7, !dbg !294
  store i32 %xor201, i32* %arrayidx202, align 4, !dbg !295
  %119 = load i32*, i32** %rk, align 8, !dbg !296
  %arrayidx203 = getelementptr inbounds i32, i32* %119, i64 2, !dbg !296
  %120 = load i32, i32* %arrayidx203, align 4, !dbg !296
  %121 = load i32*, i32** %rk, align 8, !dbg !297
  %arrayidx204 = getelementptr inbounds i32, i32* %121, i64 7, !dbg !297
  %122 = load i32, i32* %arrayidx204, align 4, !dbg !297
  %xor205 = xor i32 %120, %122, !dbg !298
  %123 = load i32*, i32** %rk, align 8, !dbg !299
  %arrayidx206 = getelementptr inbounds i32, i32* %123, i64 8, !dbg !299
  store i32 %xor205, i32* %arrayidx206, align 4, !dbg !300
  %124 = load i32*, i32** %rk, align 8, !dbg !301
  %arrayidx207 = getelementptr inbounds i32, i32* %124, i64 3, !dbg !301
  %125 = load i32, i32* %arrayidx207, align 4, !dbg !301
  %126 = load i32*, i32** %rk, align 8, !dbg !302
  %arrayidx208 = getelementptr inbounds i32, i32* %126, i64 8, !dbg !302
  %127 = load i32, i32* %arrayidx208, align 4, !dbg !302
  %xor209 = xor i32 %125, %127, !dbg !303
  %128 = load i32*, i32** %rk, align 8, !dbg !304
  %arrayidx210 = getelementptr inbounds i32, i32* %128, i64 9, !dbg !304
  store i32 %xor209, i32* %arrayidx210, align 4, !dbg !305
  %129 = load i32, i32* %i, align 4, !dbg !306
  %inc211 = add nsw i32 %129, 1, !dbg !306
  store i32 %inc211, i32* %i, align 4, !dbg !306
  %cmp212 = icmp eq i32 %inc211, 8, !dbg !308
  br i1 %cmp212, label %if.then214, label %if.end215, !dbg !309

if.then214:                                       ; preds = %while.body170
  store i32 0, i32* %retval, align 4, !dbg !310
  br label %return, !dbg !310

if.end215:                                        ; preds = %while.body170
  %130 = load i32*, i32** %rk, align 8, !dbg !312
  %arrayidx216 = getelementptr inbounds i32, i32* %130, i64 4, !dbg !312
  %131 = load i32, i32* %arrayidx216, align 4, !dbg !312
  %132 = load i32*, i32** %rk, align 8, !dbg !313
  %arrayidx217 = getelementptr inbounds i32, i32* %132, i64 9, !dbg !313
  %133 = load i32, i32* %arrayidx217, align 4, !dbg !313
  %xor218 = xor i32 %131, %133, !dbg !314
  %134 = load i32*, i32** %rk, align 8, !dbg !315
  %arrayidx219 = getelementptr inbounds i32, i32* %134, i64 10, !dbg !315
  store i32 %xor218, i32* %arrayidx219, align 4, !dbg !316
  %135 = load i32*, i32** %rk, align 8, !dbg !317
  %arrayidx220 = getelementptr inbounds i32, i32* %135, i64 5, !dbg !317
  %136 = load i32, i32* %arrayidx220, align 4, !dbg !317
  %137 = load i32*, i32** %rk, align 8, !dbg !318
  %arrayidx221 = getelementptr inbounds i32, i32* %137, i64 10, !dbg !318
  %138 = load i32, i32* %arrayidx221, align 4, !dbg !318
  %xor222 = xor i32 %136, %138, !dbg !319
  %139 = load i32*, i32** %rk, align 8, !dbg !320
  %arrayidx223 = getelementptr inbounds i32, i32* %139, i64 11, !dbg !320
  store i32 %xor222, i32* %arrayidx223, align 4, !dbg !321
  %140 = load i32*, i32** %rk, align 8, !dbg !322
  %add.ptr224 = getelementptr inbounds i32, i32* %140, i64 6, !dbg !322
  store i32* %add.ptr224, i32** %rk, align 8, !dbg !322
  br label %while.body170, !dbg !258, !llvm.loop !323

if.end225:                                        ; preds = %if.end128
  %141 = load i8*, i8** %userKey.addr, align 8, !dbg !325
  %add.ptr226 = getelementptr inbounds i8, i8* %141, i64 24, !dbg !325
  %arrayidx227 = getelementptr inbounds i8, i8* %add.ptr226, i64 0, !dbg !325
  %142 = load i8, i8* %arrayidx227, align 1, !dbg !325
  %conv228 = zext i8 %142 to i32, !dbg !325
  %shl229 = shl i32 %conv228, 24, !dbg !325
  %143 = load i8*, i8** %userKey.addr, align 8, !dbg !325
  %add.ptr230 = getelementptr inbounds i8, i8* %143, i64 24, !dbg !325
  %arrayidx231 = getelementptr inbounds i8, i8* %add.ptr230, i64 1, !dbg !325
  %144 = load i8, i8* %arrayidx231, align 1, !dbg !325
  %conv232 = zext i8 %144 to i32, !dbg !325
  %shl233 = shl i32 %conv232, 16, !dbg !325
  %xor234 = xor i32 %shl229, %shl233, !dbg !325
  %145 = load i8*, i8** %userKey.addr, align 8, !dbg !325
  %add.ptr235 = getelementptr inbounds i8, i8* %145, i64 24, !dbg !325
  %arrayidx236 = getelementptr inbounds i8, i8* %add.ptr235, i64 2, !dbg !325
  %146 = load i8, i8* %arrayidx236, align 1, !dbg !325
  %conv237 = zext i8 %146 to i32, !dbg !325
  %shl238 = shl i32 %conv237, 8, !dbg !325
  %xor239 = xor i32 %xor234, %shl238, !dbg !325
  %147 = load i8*, i8** %userKey.addr, align 8, !dbg !325
  %add.ptr240 = getelementptr inbounds i8, i8* %147, i64 24, !dbg !325
  %arrayidx241 = getelementptr inbounds i8, i8* %add.ptr240, i64 3, !dbg !325
  %148 = load i8, i8* %arrayidx241, align 1, !dbg !325
  %conv242 = zext i8 %148 to i32, !dbg !325
  %xor243 = xor i32 %xor239, %conv242, !dbg !325
  %149 = load i32*, i32** %rk, align 8, !dbg !326
  %arrayidx244 = getelementptr inbounds i32, i32* %149, i64 6, !dbg !326
  store i32 %xor243, i32* %arrayidx244, align 4, !dbg !327
  %150 = load i8*, i8** %userKey.addr, align 8, !dbg !328
  %add.ptr245 = getelementptr inbounds i8, i8* %150, i64 28, !dbg !328
  %arrayidx246 = getelementptr inbounds i8, i8* %add.ptr245, i64 0, !dbg !328
  %151 = load i8, i8* %arrayidx246, align 1, !dbg !328
  %conv247 = zext i8 %151 to i32, !dbg !328
  %shl248 = shl i32 %conv247, 24, !dbg !328
  %152 = load i8*, i8** %userKey.addr, align 8, !dbg !328
  %add.ptr249 = getelementptr inbounds i8, i8* %152, i64 28, !dbg !328
  %arrayidx250 = getelementptr inbounds i8, i8* %add.ptr249, i64 1, !dbg !328
  %153 = load i8, i8* %arrayidx250, align 1, !dbg !328
  %conv251 = zext i8 %153 to i32, !dbg !328
  %shl252 = shl i32 %conv251, 16, !dbg !328
  %xor253 = xor i32 %shl248, %shl252, !dbg !328
  %154 = load i8*, i8** %userKey.addr, align 8, !dbg !328
  %add.ptr254 = getelementptr inbounds i8, i8* %154, i64 28, !dbg !328
  %arrayidx255 = getelementptr inbounds i8, i8* %add.ptr254, i64 2, !dbg !328
  %155 = load i8, i8* %arrayidx255, align 1, !dbg !328
  %conv256 = zext i8 %155 to i32, !dbg !328
  %shl257 = shl i32 %conv256, 8, !dbg !328
  %xor258 = xor i32 %xor253, %shl257, !dbg !328
  %156 = load i8*, i8** %userKey.addr, align 8, !dbg !328
  %add.ptr259 = getelementptr inbounds i8, i8* %156, i64 28, !dbg !328
  %arrayidx260 = getelementptr inbounds i8, i8* %add.ptr259, i64 3, !dbg !328
  %157 = load i8, i8* %arrayidx260, align 1, !dbg !328
  %conv261 = zext i8 %157 to i32, !dbg !328
  %xor262 = xor i32 %xor258, %conv261, !dbg !328
  %158 = load i32*, i32** %rk, align 8, !dbg !329
  %arrayidx263 = getelementptr inbounds i32, i32* %158, i64 7, !dbg !329
  store i32 %xor262, i32* %arrayidx263, align 4, !dbg !330
  %159 = load i32, i32* %bits.addr, align 4, !dbg !331
  %cmp264 = icmp eq i32 %159, 256, !dbg !333
  br i1 %cmp264, label %if.then266, label %if.end351, !dbg !334

if.then266:                                       ; preds = %if.end225
  br label %while.body267, !dbg !335

while.body267:                                    ; preds = %if.then266, %if.end312
  %160 = load i32*, i32** %rk, align 8, !dbg !337
  %arrayidx268 = getelementptr inbounds i32, i32* %160, i64 7, !dbg !337
  %161 = load i32, i32* %arrayidx268, align 4, !dbg !337
  store i32 %161, i32* %temp, align 4, !dbg !339
  %162 = load i32*, i32** %rk, align 8, !dbg !340
  %arrayidx269 = getelementptr inbounds i32, i32* %162, i64 0, !dbg !340
  %163 = load i32, i32* %arrayidx269, align 4, !dbg !340
  %164 = load i32, i32* %temp, align 4, !dbg !341
  %shr270 = lshr i32 %164, 16, !dbg !342
  %and271 = and i32 %shr270, 255, !dbg !343
  %idxprom272 = zext i32 %and271 to i64, !dbg !344
  %arrayidx273 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom272, !dbg !344
  %165 = load i32, i32* %arrayidx273, align 4, !dbg !344
  %and274 = and i32 %165, -16777216, !dbg !345
  %xor275 = xor i32 %163, %and274, !dbg !346
  %166 = load i32, i32* %temp, align 4, !dbg !347
  %shr276 = lshr i32 %166, 8, !dbg !348
  %and277 = and i32 %shr276, 255, !dbg !349
  %idxprom278 = zext i32 %and277 to i64, !dbg !350
  %arrayidx279 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom278, !dbg !350
  %167 = load i32, i32* %arrayidx279, align 4, !dbg !350
  %and280 = and i32 %167, 16711680, !dbg !351
  %xor281 = xor i32 %xor275, %and280, !dbg !352
  %168 = load i32, i32* %temp, align 4, !dbg !353
  %and282 = and i32 %168, 255, !dbg !354
  %idxprom283 = zext i32 %and282 to i64, !dbg !355
  %arrayidx284 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom283, !dbg !355
  %169 = load i32, i32* %arrayidx284, align 4, !dbg !355
  %and285 = and i32 %169, 65280, !dbg !356
  %xor286 = xor i32 %xor281, %and285, !dbg !357
  %170 = load i32, i32* %temp, align 4, !dbg !358
  %shr287 = lshr i32 %170, 24, !dbg !359
  %idxprom288 = zext i32 %shr287 to i64, !dbg !360
  %arrayidx289 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom288, !dbg !360
  %171 = load i32, i32* %arrayidx289, align 4, !dbg !360
  %and290 = and i32 %171, 255, !dbg !361
  %xor291 = xor i32 %xor286, %and290, !dbg !362
  %172 = load i32, i32* %i, align 4, !dbg !363
  %idxprom292 = sext i32 %172 to i64, !dbg !364
  %arrayidx293 = getelementptr inbounds [10 x i32], [10 x i32]* @rcon, i64 0, i64 %idxprom292, !dbg !364
  %173 = load i32, i32* %arrayidx293, align 4, !dbg !364
  %xor294 = xor i32 %xor291, %173, !dbg !365
  %174 = load i32*, i32** %rk, align 8, !dbg !366
  %arrayidx295 = getelementptr inbounds i32, i32* %174, i64 8, !dbg !366
  store i32 %xor294, i32* %arrayidx295, align 4, !dbg !367
  %175 = load i32*, i32** %rk, align 8, !dbg !368
  %arrayidx296 = getelementptr inbounds i32, i32* %175, i64 1, !dbg !368
  %176 = load i32, i32* %arrayidx296, align 4, !dbg !368
  %177 = load i32*, i32** %rk, align 8, !dbg !369
  %arrayidx297 = getelementptr inbounds i32, i32* %177, i64 8, !dbg !369
  %178 = load i32, i32* %arrayidx297, align 4, !dbg !369
  %xor298 = xor i32 %176, %178, !dbg !370
  %179 = load i32*, i32** %rk, align 8, !dbg !371
  %arrayidx299 = getelementptr inbounds i32, i32* %179, i64 9, !dbg !371
  store i32 %xor298, i32* %arrayidx299, align 4, !dbg !372
  %180 = load i32*, i32** %rk, align 8, !dbg !373
  %arrayidx300 = getelementptr inbounds i32, i32* %180, i64 2, !dbg !373
  %181 = load i32, i32* %arrayidx300, align 4, !dbg !373
  %182 = load i32*, i32** %rk, align 8, !dbg !374
  %arrayidx301 = getelementptr inbounds i32, i32* %182, i64 9, !dbg !374
  %183 = load i32, i32* %arrayidx301, align 4, !dbg !374
  %xor302 = xor i32 %181, %183, !dbg !375
  %184 = load i32*, i32** %rk, align 8, !dbg !376
  %arrayidx303 = getelementptr inbounds i32, i32* %184, i64 10, !dbg !376
  store i32 %xor302, i32* %arrayidx303, align 4, !dbg !377
  %185 = load i32*, i32** %rk, align 8, !dbg !378
  %arrayidx304 = getelementptr inbounds i32, i32* %185, i64 3, !dbg !378
  %186 = load i32, i32* %arrayidx304, align 4, !dbg !378
  %187 = load i32*, i32** %rk, align 8, !dbg !379
  %arrayidx305 = getelementptr inbounds i32, i32* %187, i64 10, !dbg !379
  %188 = load i32, i32* %arrayidx305, align 4, !dbg !379
  %xor306 = xor i32 %186, %188, !dbg !380
  %189 = load i32*, i32** %rk, align 8, !dbg !381
  %arrayidx307 = getelementptr inbounds i32, i32* %189, i64 11, !dbg !381
  store i32 %xor306, i32* %arrayidx307, align 4, !dbg !382
  %190 = load i32, i32* %i, align 4, !dbg !383
  %inc308 = add nsw i32 %190, 1, !dbg !383
  store i32 %inc308, i32* %i, align 4, !dbg !383
  %cmp309 = icmp eq i32 %inc308, 7, !dbg !385
  br i1 %cmp309, label %if.then311, label %if.end312, !dbg !386

if.then311:                                       ; preds = %while.body267
  store i32 0, i32* %retval, align 4, !dbg !387
  br label %return, !dbg !387

if.end312:                                        ; preds = %while.body267
  %191 = load i32*, i32** %rk, align 8, !dbg !389
  %arrayidx313 = getelementptr inbounds i32, i32* %191, i64 11, !dbg !389
  %192 = load i32, i32* %arrayidx313, align 4, !dbg !389
  store i32 %192, i32* %temp, align 4, !dbg !390
  %193 = load i32*, i32** %rk, align 8, !dbg !391
  %arrayidx314 = getelementptr inbounds i32, i32* %193, i64 4, !dbg !391
  %194 = load i32, i32* %arrayidx314, align 4, !dbg !391
  %195 = load i32, i32* %temp, align 4, !dbg !392
  %shr315 = lshr i32 %195, 24, !dbg !393
  %idxprom316 = zext i32 %shr315 to i64, !dbg !394
  %arrayidx317 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom316, !dbg !394
  %196 = load i32, i32* %arrayidx317, align 4, !dbg !394
  %and318 = and i32 %196, -16777216, !dbg !395
  %xor319 = xor i32 %194, %and318, !dbg !396
  %197 = load i32, i32* %temp, align 4, !dbg !397
  %shr320 = lshr i32 %197, 16, !dbg !398
  %and321 = and i32 %shr320, 255, !dbg !399
  %idxprom322 = zext i32 %and321 to i64, !dbg !400
  %arrayidx323 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom322, !dbg !400
  %198 = load i32, i32* %arrayidx323, align 4, !dbg !400
  %and324 = and i32 %198, 16711680, !dbg !401
  %xor325 = xor i32 %xor319, %and324, !dbg !402
  %199 = load i32, i32* %temp, align 4, !dbg !403
  %shr326 = lshr i32 %199, 8, !dbg !404
  %and327 = and i32 %shr326, 255, !dbg !405
  %idxprom328 = zext i32 %and327 to i64, !dbg !406
  %arrayidx329 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom328, !dbg !406
  %200 = load i32, i32* %arrayidx329, align 4, !dbg !406
  %and330 = and i32 %200, 65280, !dbg !407
  %xor331 = xor i32 %xor325, %and330, !dbg !408
  %201 = load i32, i32* %temp, align 4, !dbg !409
  %and332 = and i32 %201, 255, !dbg !410
  %idxprom333 = zext i32 %and332 to i64, !dbg !411
  %arrayidx334 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom333, !dbg !411
  %202 = load i32, i32* %arrayidx334, align 4, !dbg !411
  %and335 = and i32 %202, 255, !dbg !412
  %xor336 = xor i32 %xor331, %and335, !dbg !413
  %203 = load i32*, i32** %rk, align 8, !dbg !414
  %arrayidx337 = getelementptr inbounds i32, i32* %203, i64 12, !dbg !414
  store i32 %xor336, i32* %arrayidx337, align 4, !dbg !415
  %204 = load i32*, i32** %rk, align 8, !dbg !416
  %arrayidx338 = getelementptr inbounds i32, i32* %204, i64 5, !dbg !416
  %205 = load i32, i32* %arrayidx338, align 4, !dbg !416
  %206 = load i32*, i32** %rk, align 8, !dbg !417
  %arrayidx339 = getelementptr inbounds i32, i32* %206, i64 12, !dbg !417
  %207 = load i32, i32* %arrayidx339, align 4, !dbg !417
  %xor340 = xor i32 %205, %207, !dbg !418
  %208 = load i32*, i32** %rk, align 8, !dbg !419
  %arrayidx341 = getelementptr inbounds i32, i32* %208, i64 13, !dbg !419
  store i32 %xor340, i32* %arrayidx341, align 4, !dbg !420
  %209 = load i32*, i32** %rk, align 8, !dbg !421
  %arrayidx342 = getelementptr inbounds i32, i32* %209, i64 6, !dbg !421
  %210 = load i32, i32* %arrayidx342, align 4, !dbg !421
  %211 = load i32*, i32** %rk, align 8, !dbg !422
  %arrayidx343 = getelementptr inbounds i32, i32* %211, i64 13, !dbg !422
  %212 = load i32, i32* %arrayidx343, align 4, !dbg !422
  %xor344 = xor i32 %210, %212, !dbg !423
  %213 = load i32*, i32** %rk, align 8, !dbg !424
  %arrayidx345 = getelementptr inbounds i32, i32* %213, i64 14, !dbg !424
  store i32 %xor344, i32* %arrayidx345, align 4, !dbg !425
  %214 = load i32*, i32** %rk, align 8, !dbg !426
  %arrayidx346 = getelementptr inbounds i32, i32* %214, i64 7, !dbg !426
  %215 = load i32, i32* %arrayidx346, align 4, !dbg !426
  %216 = load i32*, i32** %rk, align 8, !dbg !427
  %arrayidx347 = getelementptr inbounds i32, i32* %216, i64 14, !dbg !427
  %217 = load i32, i32* %arrayidx347, align 4, !dbg !427
  %xor348 = xor i32 %215, %217, !dbg !428
  %218 = load i32*, i32** %rk, align 8, !dbg !429
  %arrayidx349 = getelementptr inbounds i32, i32* %218, i64 15, !dbg !429
  store i32 %xor348, i32* %arrayidx349, align 4, !dbg !430
  %219 = load i32*, i32** %rk, align 8, !dbg !431
  %add.ptr350 = getelementptr inbounds i32, i32* %219, i64 8, !dbg !431
  store i32* %add.ptr350, i32** %rk, align 8, !dbg !431
  br label %while.body267, !dbg !335, !llvm.loop !432

if.end351:                                        ; preds = %if.end225
  store i32 0, i32* %retval, align 4, !dbg !434
  br label %return, !dbg !434

return:                                           ; preds = %if.end351, %if.then311, %if.then214, %if.then125, %if.then5, %if.then
  %220 = load i32, i32* %retval, align 4, !dbg !435
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @AES_encrypt(i8* %in, i8* %out, %struct.aes_key_st* %key) #0 !dbg !436 {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %key.addr = alloca %struct.aes_key_st*, align 8
  %rk = alloca i32*, align 8
  %s0 = alloca i32, align 4
  %s1 = alloca i32, align 4
  %s2 = alloca i32, align 4
  %s3 = alloca i32, align 4
  %t0 = alloca i32, align 4
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %r = alloca i32, align 4
  store i8* %in, i8** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !441, metadata !DIExpression()), !dbg !442
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !443, metadata !DIExpression()), !dbg !444
  store %struct.aes_key_st* %key, %struct.aes_key_st** %key.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.aes_key_st** %key.addr, metadata !445, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata i32** %rk, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.declare(metadata i32* %s0, metadata !450, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.declare(metadata i32* %s1, metadata !452, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.declare(metadata i32* %s2, metadata !454, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.declare(metadata i32* %s3, metadata !456, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.declare(metadata i32* %t0, metadata !458, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.declare(metadata i32* %t1, metadata !460, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.declare(metadata i32* %t2, metadata !462, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.declare(metadata i32* %t3, metadata !464, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata i32* %r, metadata !466, metadata !DIExpression()), !dbg !467
  %0 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !468
  %rd_key = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %0, i32 0, i32 0, !dbg !469
  %arraydecay = getelementptr inbounds [60 x i32], [60 x i32]* %rd_key, i32 0, i32 0, !dbg !468
  store i32* %arraydecay, i32** %rk, align 8, !dbg !470
  %1 = load i8*, i8** %in.addr, align 8, !dbg !471
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !471
  %2 = load i8, i8* %arrayidx, align 1, !dbg !471
  %conv = zext i8 %2 to i32, !dbg !471
  %shl = shl i32 %conv, 24, !dbg !471
  %3 = load i8*, i8** %in.addr, align 8, !dbg !471
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 1, !dbg !471
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !471
  %conv2 = zext i8 %4 to i32, !dbg !471
  %shl3 = shl i32 %conv2, 16, !dbg !471
  %xor = xor i32 %shl, %shl3, !dbg !471
  %5 = load i8*, i8** %in.addr, align 8, !dbg !471
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 2, !dbg !471
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !471
  %conv5 = zext i8 %6 to i32, !dbg !471
  %shl6 = shl i32 %conv5, 8, !dbg !471
  %xor7 = xor i32 %xor, %shl6, !dbg !471
  %7 = load i8*, i8** %in.addr, align 8, !dbg !471
  %arrayidx8 = getelementptr inbounds i8, i8* %7, i64 3, !dbg !471
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !471
  %conv9 = zext i8 %8 to i32, !dbg !471
  %xor10 = xor i32 %xor7, %conv9, !dbg !471
  %9 = load i32*, i32** %rk, align 8, !dbg !472
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !472
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !472
  %xor12 = xor i32 %xor10, %10, !dbg !473
  store i32 %xor12, i32* %s0, align 4, !dbg !474
  %11 = load i8*, i8** %in.addr, align 8, !dbg !475
  %add.ptr = getelementptr inbounds i8, i8* %11, i64 4, !dbg !475
  %arrayidx13 = getelementptr inbounds i8, i8* %add.ptr, i64 0, !dbg !475
  %12 = load i8, i8* %arrayidx13, align 1, !dbg !475
  %conv14 = zext i8 %12 to i32, !dbg !475
  %shl15 = shl i32 %conv14, 24, !dbg !475
  %13 = load i8*, i8** %in.addr, align 8, !dbg !475
  %add.ptr16 = getelementptr inbounds i8, i8* %13, i64 4, !dbg !475
  %arrayidx17 = getelementptr inbounds i8, i8* %add.ptr16, i64 1, !dbg !475
  %14 = load i8, i8* %arrayidx17, align 1, !dbg !475
  %conv18 = zext i8 %14 to i32, !dbg !475
  %shl19 = shl i32 %conv18, 16, !dbg !475
  %xor20 = xor i32 %shl15, %shl19, !dbg !475
  %15 = load i8*, i8** %in.addr, align 8, !dbg !475
  %add.ptr21 = getelementptr inbounds i8, i8* %15, i64 4, !dbg !475
  %arrayidx22 = getelementptr inbounds i8, i8* %add.ptr21, i64 2, !dbg !475
  %16 = load i8, i8* %arrayidx22, align 1, !dbg !475
  %conv23 = zext i8 %16 to i32, !dbg !475
  %shl24 = shl i32 %conv23, 8, !dbg !475
  %xor25 = xor i32 %xor20, %shl24, !dbg !475
  %17 = load i8*, i8** %in.addr, align 8, !dbg !475
  %add.ptr26 = getelementptr inbounds i8, i8* %17, i64 4, !dbg !475
  %arrayidx27 = getelementptr inbounds i8, i8* %add.ptr26, i64 3, !dbg !475
  %18 = load i8, i8* %arrayidx27, align 1, !dbg !475
  %conv28 = zext i8 %18 to i32, !dbg !475
  %xor29 = xor i32 %xor25, %conv28, !dbg !475
  %19 = load i32*, i32** %rk, align 8, !dbg !476
  %arrayidx30 = getelementptr inbounds i32, i32* %19, i64 1, !dbg !476
  %20 = load i32, i32* %arrayidx30, align 4, !dbg !476
  %xor31 = xor i32 %xor29, %20, !dbg !477
  store i32 %xor31, i32* %s1, align 4, !dbg !478
  %21 = load i8*, i8** %in.addr, align 8, !dbg !479
  %add.ptr32 = getelementptr inbounds i8, i8* %21, i64 8, !dbg !479
  %arrayidx33 = getelementptr inbounds i8, i8* %add.ptr32, i64 0, !dbg !479
  %22 = load i8, i8* %arrayidx33, align 1, !dbg !479
  %conv34 = zext i8 %22 to i32, !dbg !479
  %shl35 = shl i32 %conv34, 24, !dbg !479
  %23 = load i8*, i8** %in.addr, align 8, !dbg !479
  %add.ptr36 = getelementptr inbounds i8, i8* %23, i64 8, !dbg !479
  %arrayidx37 = getelementptr inbounds i8, i8* %add.ptr36, i64 1, !dbg !479
  %24 = load i8, i8* %arrayidx37, align 1, !dbg !479
  %conv38 = zext i8 %24 to i32, !dbg !479
  %shl39 = shl i32 %conv38, 16, !dbg !479
  %xor40 = xor i32 %shl35, %shl39, !dbg !479
  %25 = load i8*, i8** %in.addr, align 8, !dbg !479
  %add.ptr41 = getelementptr inbounds i8, i8* %25, i64 8, !dbg !479
  %arrayidx42 = getelementptr inbounds i8, i8* %add.ptr41, i64 2, !dbg !479
  %26 = load i8, i8* %arrayidx42, align 1, !dbg !479
  %conv43 = zext i8 %26 to i32, !dbg !479
  %shl44 = shl i32 %conv43, 8, !dbg !479
  %xor45 = xor i32 %xor40, %shl44, !dbg !479
  %27 = load i8*, i8** %in.addr, align 8, !dbg !479
  %add.ptr46 = getelementptr inbounds i8, i8* %27, i64 8, !dbg !479
  %arrayidx47 = getelementptr inbounds i8, i8* %add.ptr46, i64 3, !dbg !479
  %28 = load i8, i8* %arrayidx47, align 1, !dbg !479
  %conv48 = zext i8 %28 to i32, !dbg !479
  %xor49 = xor i32 %xor45, %conv48, !dbg !479
  %29 = load i32*, i32** %rk, align 8, !dbg !480
  %arrayidx50 = getelementptr inbounds i32, i32* %29, i64 2, !dbg !480
  %30 = load i32, i32* %arrayidx50, align 4, !dbg !480
  %xor51 = xor i32 %xor49, %30, !dbg !481
  store i32 %xor51, i32* %s2, align 4, !dbg !482
  %31 = load i8*, i8** %in.addr, align 8, !dbg !483
  %add.ptr52 = getelementptr inbounds i8, i8* %31, i64 12, !dbg !483
  %arrayidx53 = getelementptr inbounds i8, i8* %add.ptr52, i64 0, !dbg !483
  %32 = load i8, i8* %arrayidx53, align 1, !dbg !483
  %conv54 = zext i8 %32 to i32, !dbg !483
  %shl55 = shl i32 %conv54, 24, !dbg !483
  %33 = load i8*, i8** %in.addr, align 8, !dbg !483
  %add.ptr56 = getelementptr inbounds i8, i8* %33, i64 12, !dbg !483
  %arrayidx57 = getelementptr inbounds i8, i8* %add.ptr56, i64 1, !dbg !483
  %34 = load i8, i8* %arrayidx57, align 1, !dbg !483
  %conv58 = zext i8 %34 to i32, !dbg !483
  %shl59 = shl i32 %conv58, 16, !dbg !483
  %xor60 = xor i32 %shl55, %shl59, !dbg !483
  %35 = load i8*, i8** %in.addr, align 8, !dbg !483
  %add.ptr61 = getelementptr inbounds i8, i8* %35, i64 12, !dbg !483
  %arrayidx62 = getelementptr inbounds i8, i8* %add.ptr61, i64 2, !dbg !483
  %36 = load i8, i8* %arrayidx62, align 1, !dbg !483
  %conv63 = zext i8 %36 to i32, !dbg !483
  %shl64 = shl i32 %conv63, 8, !dbg !483
  %xor65 = xor i32 %xor60, %shl64, !dbg !483
  %37 = load i8*, i8** %in.addr, align 8, !dbg !483
  %add.ptr66 = getelementptr inbounds i8, i8* %37, i64 12, !dbg !483
  %arrayidx67 = getelementptr inbounds i8, i8* %add.ptr66, i64 3, !dbg !483
  %38 = load i8, i8* %arrayidx67, align 1, !dbg !483
  %conv68 = zext i8 %38 to i32, !dbg !483
  %xor69 = xor i32 %xor65, %conv68, !dbg !483
  %39 = load i32*, i32** %rk, align 8, !dbg !484
  %arrayidx70 = getelementptr inbounds i32, i32* %39, i64 3, !dbg !484
  %40 = load i32, i32* %arrayidx70, align 4, !dbg !484
  %xor71 = xor i32 %xor69, %40, !dbg !485
  store i32 %xor71, i32* %s3, align 4, !dbg !486
  %41 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !487
  %rounds = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %41, i32 0, i32 1, !dbg !488
  %42 = load i32, i32* %rounds, align 4, !dbg !488
  %shr = ashr i32 %42, 1, !dbg !489
  store i32 %shr, i32* %r, align 4, !dbg !490
  br label %for.cond, !dbg !491

for.cond:                                         ; preds = %if.end, %entry
  %43 = load i32, i32* %s0, align 4, !dbg !492
  %shr72 = lshr i32 %43, 24, !dbg !496
  %idxprom = zext i32 %shr72 to i64, !dbg !497
  %arrayidx73 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom, !dbg !497
  %44 = load i32, i32* %arrayidx73, align 4, !dbg !497
  %45 = load i32, i32* %s1, align 4, !dbg !498
  %shr74 = lshr i32 %45, 16, !dbg !499
  %and = and i32 %shr74, 255, !dbg !500
  %idxprom75 = zext i32 %and to i64, !dbg !501
  %arrayidx76 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom75, !dbg !501
  %46 = load i32, i32* %arrayidx76, align 4, !dbg !501
  %xor77 = xor i32 %44, %46, !dbg !502
  %47 = load i32, i32* %s2, align 4, !dbg !503
  %shr78 = lshr i32 %47, 8, !dbg !504
  %and79 = and i32 %shr78, 255, !dbg !505
  %idxprom80 = zext i32 %and79 to i64, !dbg !506
  %arrayidx81 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom80, !dbg !506
  %48 = load i32, i32* %arrayidx81, align 4, !dbg !506
  %xor82 = xor i32 %xor77, %48, !dbg !507
  %49 = load i32, i32* %s3, align 4, !dbg !508
  %and83 = and i32 %49, 255, !dbg !509
  %idxprom84 = zext i32 %and83 to i64, !dbg !510
  %arrayidx85 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom84, !dbg !510
  %50 = load i32, i32* %arrayidx85, align 4, !dbg !510
  %xor86 = xor i32 %xor82, %50, !dbg !511
  %51 = load i32*, i32** %rk, align 8, !dbg !512
  %arrayidx87 = getelementptr inbounds i32, i32* %51, i64 4, !dbg !512
  %52 = load i32, i32* %arrayidx87, align 4, !dbg !512
  %xor88 = xor i32 %xor86, %52, !dbg !513
  store i32 %xor88, i32* %t0, align 4, !dbg !514
  %53 = load i32, i32* %s1, align 4, !dbg !515
  %shr89 = lshr i32 %53, 24, !dbg !516
  %idxprom90 = zext i32 %shr89 to i64, !dbg !517
  %arrayidx91 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom90, !dbg !517
  %54 = load i32, i32* %arrayidx91, align 4, !dbg !517
  %55 = load i32, i32* %s2, align 4, !dbg !518
  %shr92 = lshr i32 %55, 16, !dbg !519
  %and93 = and i32 %shr92, 255, !dbg !520
  %idxprom94 = zext i32 %and93 to i64, !dbg !521
  %arrayidx95 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom94, !dbg !521
  %56 = load i32, i32* %arrayidx95, align 4, !dbg !521
  %xor96 = xor i32 %54, %56, !dbg !522
  %57 = load i32, i32* %s3, align 4, !dbg !523
  %shr97 = lshr i32 %57, 8, !dbg !524
  %and98 = and i32 %shr97, 255, !dbg !525
  %idxprom99 = zext i32 %and98 to i64, !dbg !526
  %arrayidx100 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom99, !dbg !526
  %58 = load i32, i32* %arrayidx100, align 4, !dbg !526
  %xor101 = xor i32 %xor96, %58, !dbg !527
  %59 = load i32, i32* %s0, align 4, !dbg !528
  %and102 = and i32 %59, 255, !dbg !529
  %idxprom103 = zext i32 %and102 to i64, !dbg !530
  %arrayidx104 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom103, !dbg !530
  %60 = load i32, i32* %arrayidx104, align 4, !dbg !530
  %xor105 = xor i32 %xor101, %60, !dbg !531
  %61 = load i32*, i32** %rk, align 8, !dbg !532
  %arrayidx106 = getelementptr inbounds i32, i32* %61, i64 5, !dbg !532
  %62 = load i32, i32* %arrayidx106, align 4, !dbg !532
  %xor107 = xor i32 %xor105, %62, !dbg !533
  store i32 %xor107, i32* %t1, align 4, !dbg !534
  %63 = load i32, i32* %s2, align 4, !dbg !535
  %shr108 = lshr i32 %63, 24, !dbg !536
  %idxprom109 = zext i32 %shr108 to i64, !dbg !537
  %arrayidx110 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom109, !dbg !537
  %64 = load i32, i32* %arrayidx110, align 4, !dbg !537
  %65 = load i32, i32* %s3, align 4, !dbg !538
  %shr111 = lshr i32 %65, 16, !dbg !539
  %and112 = and i32 %shr111, 255, !dbg !540
  %idxprom113 = zext i32 %and112 to i64, !dbg !541
  %arrayidx114 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom113, !dbg !541
  %66 = load i32, i32* %arrayidx114, align 4, !dbg !541
  %xor115 = xor i32 %64, %66, !dbg !542
  %67 = load i32, i32* %s0, align 4, !dbg !543
  %shr116 = lshr i32 %67, 8, !dbg !544
  %and117 = and i32 %shr116, 255, !dbg !545
  %idxprom118 = zext i32 %and117 to i64, !dbg !546
  %arrayidx119 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom118, !dbg !546
  %68 = load i32, i32* %arrayidx119, align 4, !dbg !546
  %xor120 = xor i32 %xor115, %68, !dbg !547
  %69 = load i32, i32* %s1, align 4, !dbg !548
  %and121 = and i32 %69, 255, !dbg !549
  %idxprom122 = zext i32 %and121 to i64, !dbg !550
  %arrayidx123 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom122, !dbg !550
  %70 = load i32, i32* %arrayidx123, align 4, !dbg !550
  %xor124 = xor i32 %xor120, %70, !dbg !551
  %71 = load i32*, i32** %rk, align 8, !dbg !552
  %arrayidx125 = getelementptr inbounds i32, i32* %71, i64 6, !dbg !552
  %72 = load i32, i32* %arrayidx125, align 4, !dbg !552
  %xor126 = xor i32 %xor124, %72, !dbg !553
  store i32 %xor126, i32* %t2, align 4, !dbg !554
  %73 = load i32, i32* %s3, align 4, !dbg !555
  %shr127 = lshr i32 %73, 24, !dbg !556
  %idxprom128 = zext i32 %shr127 to i64, !dbg !557
  %arrayidx129 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom128, !dbg !557
  %74 = load i32, i32* %arrayidx129, align 4, !dbg !557
  %75 = load i32, i32* %s0, align 4, !dbg !558
  %shr130 = lshr i32 %75, 16, !dbg !559
  %and131 = and i32 %shr130, 255, !dbg !560
  %idxprom132 = zext i32 %and131 to i64, !dbg !561
  %arrayidx133 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom132, !dbg !561
  %76 = load i32, i32* %arrayidx133, align 4, !dbg !561
  %xor134 = xor i32 %74, %76, !dbg !562
  %77 = load i32, i32* %s1, align 4, !dbg !563
  %shr135 = lshr i32 %77, 8, !dbg !564
  %and136 = and i32 %shr135, 255, !dbg !565
  %idxprom137 = zext i32 %and136 to i64, !dbg !566
  %arrayidx138 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom137, !dbg !566
  %78 = load i32, i32* %arrayidx138, align 4, !dbg !566
  %xor139 = xor i32 %xor134, %78, !dbg !567
  %79 = load i32, i32* %s2, align 4, !dbg !568
  %and140 = and i32 %79, 255, !dbg !569
  %idxprom141 = zext i32 %and140 to i64, !dbg !570
  %arrayidx142 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom141, !dbg !570
  %80 = load i32, i32* %arrayidx142, align 4, !dbg !570
  %xor143 = xor i32 %xor139, %80, !dbg !571
  %81 = load i32*, i32** %rk, align 8, !dbg !572
  %arrayidx144 = getelementptr inbounds i32, i32* %81, i64 7, !dbg !572
  %82 = load i32, i32* %arrayidx144, align 4, !dbg !572
  %xor145 = xor i32 %xor143, %82, !dbg !573
  store i32 %xor145, i32* %t3, align 4, !dbg !574
  %83 = load i32*, i32** %rk, align 8, !dbg !575
  %add.ptr146 = getelementptr inbounds i32, i32* %83, i64 8, !dbg !575
  store i32* %add.ptr146, i32** %rk, align 8, !dbg !575
  %84 = load i32, i32* %r, align 4, !dbg !576
  %dec = add nsw i32 %84, -1, !dbg !576
  store i32 %dec, i32* %r, align 4, !dbg !576
  %cmp = icmp eq i32 %dec, 0, !dbg !578
  br i1 %cmp, label %if.then, label %if.end, !dbg !579

if.then:                                          ; preds = %for.cond
  br label %for.end, !dbg !580

if.end:                                           ; preds = %for.cond
  %85 = load i32, i32* %t0, align 4, !dbg !582
  %shr148 = lshr i32 %85, 24, !dbg !583
  %idxprom149 = zext i32 %shr148 to i64, !dbg !584
  %arrayidx150 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom149, !dbg !584
  %86 = load i32, i32* %arrayidx150, align 4, !dbg !584
  %87 = load i32, i32* %t1, align 4, !dbg !585
  %shr151 = lshr i32 %87, 16, !dbg !586
  %and152 = and i32 %shr151, 255, !dbg !587
  %idxprom153 = zext i32 %and152 to i64, !dbg !588
  %arrayidx154 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom153, !dbg !588
  %88 = load i32, i32* %arrayidx154, align 4, !dbg !588
  %xor155 = xor i32 %86, %88, !dbg !589
  %89 = load i32, i32* %t2, align 4, !dbg !590
  %shr156 = lshr i32 %89, 8, !dbg !591
  %and157 = and i32 %shr156, 255, !dbg !592
  %idxprom158 = zext i32 %and157 to i64, !dbg !593
  %arrayidx159 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom158, !dbg !593
  %90 = load i32, i32* %arrayidx159, align 4, !dbg !593
  %xor160 = xor i32 %xor155, %90, !dbg !594
  %91 = load i32, i32* %t3, align 4, !dbg !595
  %and161 = and i32 %91, 255, !dbg !596
  %idxprom162 = zext i32 %and161 to i64, !dbg !597
  %arrayidx163 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom162, !dbg !597
  %92 = load i32, i32* %arrayidx163, align 4, !dbg !597
  %xor164 = xor i32 %xor160, %92, !dbg !598
  %93 = load i32*, i32** %rk, align 8, !dbg !599
  %arrayidx165 = getelementptr inbounds i32, i32* %93, i64 0, !dbg !599
  %94 = load i32, i32* %arrayidx165, align 4, !dbg !599
  %xor166 = xor i32 %xor164, %94, !dbg !600
  store i32 %xor166, i32* %s0, align 4, !dbg !601
  %95 = load i32, i32* %t1, align 4, !dbg !602
  %shr167 = lshr i32 %95, 24, !dbg !603
  %idxprom168 = zext i32 %shr167 to i64, !dbg !604
  %arrayidx169 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom168, !dbg !604
  %96 = load i32, i32* %arrayidx169, align 4, !dbg !604
  %97 = load i32, i32* %t2, align 4, !dbg !605
  %shr170 = lshr i32 %97, 16, !dbg !606
  %and171 = and i32 %shr170, 255, !dbg !607
  %idxprom172 = zext i32 %and171 to i64, !dbg !608
  %arrayidx173 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom172, !dbg !608
  %98 = load i32, i32* %arrayidx173, align 4, !dbg !608
  %xor174 = xor i32 %96, %98, !dbg !609
  %99 = load i32, i32* %t3, align 4, !dbg !610
  %shr175 = lshr i32 %99, 8, !dbg !611
  %and176 = and i32 %shr175, 255, !dbg !612
  %idxprom177 = zext i32 %and176 to i64, !dbg !613
  %arrayidx178 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom177, !dbg !613
  %100 = load i32, i32* %arrayidx178, align 4, !dbg !613
  %xor179 = xor i32 %xor174, %100, !dbg !614
  %101 = load i32, i32* %t0, align 4, !dbg !615
  %and180 = and i32 %101, 255, !dbg !616
  %idxprom181 = zext i32 %and180 to i64, !dbg !617
  %arrayidx182 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom181, !dbg !617
  %102 = load i32, i32* %arrayidx182, align 4, !dbg !617
  %xor183 = xor i32 %xor179, %102, !dbg !618
  %103 = load i32*, i32** %rk, align 8, !dbg !619
  %arrayidx184 = getelementptr inbounds i32, i32* %103, i64 1, !dbg !619
  %104 = load i32, i32* %arrayidx184, align 4, !dbg !619
  %xor185 = xor i32 %xor183, %104, !dbg !620
  store i32 %xor185, i32* %s1, align 4, !dbg !621
  %105 = load i32, i32* %t2, align 4, !dbg !622
  %shr186 = lshr i32 %105, 24, !dbg !623
  %idxprom187 = zext i32 %shr186 to i64, !dbg !624
  %arrayidx188 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom187, !dbg !624
  %106 = load i32, i32* %arrayidx188, align 4, !dbg !624
  %107 = load i32, i32* %t3, align 4, !dbg !625
  %shr189 = lshr i32 %107, 16, !dbg !626
  %and190 = and i32 %shr189, 255, !dbg !627
  %idxprom191 = zext i32 %and190 to i64, !dbg !628
  %arrayidx192 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom191, !dbg !628
  %108 = load i32, i32* %arrayidx192, align 4, !dbg !628
  %xor193 = xor i32 %106, %108, !dbg !629
  %109 = load i32, i32* %t0, align 4, !dbg !630
  %shr194 = lshr i32 %109, 8, !dbg !631
  %and195 = and i32 %shr194, 255, !dbg !632
  %idxprom196 = zext i32 %and195 to i64, !dbg !633
  %arrayidx197 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom196, !dbg !633
  %110 = load i32, i32* %arrayidx197, align 4, !dbg !633
  %xor198 = xor i32 %xor193, %110, !dbg !634
  %111 = load i32, i32* %t1, align 4, !dbg !635
  %and199 = and i32 %111, 255, !dbg !636
  %idxprom200 = zext i32 %and199 to i64, !dbg !637
  %arrayidx201 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom200, !dbg !637
  %112 = load i32, i32* %arrayidx201, align 4, !dbg !637
  %xor202 = xor i32 %xor198, %112, !dbg !638
  %113 = load i32*, i32** %rk, align 8, !dbg !639
  %arrayidx203 = getelementptr inbounds i32, i32* %113, i64 2, !dbg !639
  %114 = load i32, i32* %arrayidx203, align 4, !dbg !639
  %xor204 = xor i32 %xor202, %114, !dbg !640
  store i32 %xor204, i32* %s2, align 4, !dbg !641
  %115 = load i32, i32* %t3, align 4, !dbg !642
  %shr205 = lshr i32 %115, 24, !dbg !643
  %idxprom206 = zext i32 %shr205 to i64, !dbg !644
  %arrayidx207 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom206, !dbg !644
  %116 = load i32, i32* %arrayidx207, align 4, !dbg !644
  %117 = load i32, i32* %t0, align 4, !dbg !645
  %shr208 = lshr i32 %117, 16, !dbg !646
  %and209 = and i32 %shr208, 255, !dbg !647
  %idxprom210 = zext i32 %and209 to i64, !dbg !648
  %arrayidx211 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom210, !dbg !648
  %118 = load i32, i32* %arrayidx211, align 4, !dbg !648
  %xor212 = xor i32 %116, %118, !dbg !649
  %119 = load i32, i32* %t1, align 4, !dbg !650
  %shr213 = lshr i32 %119, 8, !dbg !651
  %and214 = and i32 %shr213, 255, !dbg !652
  %idxprom215 = zext i32 %and214 to i64, !dbg !653
  %arrayidx216 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom215, !dbg !653
  %120 = load i32, i32* %arrayidx216, align 4, !dbg !653
  %xor217 = xor i32 %xor212, %120, !dbg !654
  %121 = load i32, i32* %t2, align 4, !dbg !655
  %and218 = and i32 %121, 255, !dbg !656
  %idxprom219 = zext i32 %and218 to i64, !dbg !657
  %arrayidx220 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom219, !dbg !657
  %122 = load i32, i32* %arrayidx220, align 4, !dbg !657
  %xor221 = xor i32 %xor217, %122, !dbg !658
  %123 = load i32*, i32** %rk, align 8, !dbg !659
  %arrayidx222 = getelementptr inbounds i32, i32* %123, i64 3, !dbg !659
  %124 = load i32, i32* %arrayidx222, align 4, !dbg !659
  %xor223 = xor i32 %xor221, %124, !dbg !660
  store i32 %xor223, i32* %s3, align 4, !dbg !661
  br label %for.cond, !dbg !662, !llvm.loop !663

for.end:                                          ; preds = %if.then
  %125 = load i32, i32* %t0, align 4, !dbg !666
  %shr224 = lshr i32 %125, 24, !dbg !667
  %idxprom225 = zext i32 %shr224 to i64, !dbg !668
  %arrayidx226 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom225, !dbg !668
  %126 = load i32, i32* %arrayidx226, align 4, !dbg !668
  %and227 = and i32 %126, -16777216, !dbg !669
  %127 = load i32, i32* %t1, align 4, !dbg !670
  %shr228 = lshr i32 %127, 16, !dbg !671
  %and229 = and i32 %shr228, 255, !dbg !672
  %idxprom230 = zext i32 %and229 to i64, !dbg !673
  %arrayidx231 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom230, !dbg !673
  %128 = load i32, i32* %arrayidx231, align 4, !dbg !673
  %and232 = and i32 %128, 16711680, !dbg !674
  %xor233 = xor i32 %and227, %and232, !dbg !675
  %129 = load i32, i32* %t2, align 4, !dbg !676
  %shr234 = lshr i32 %129, 8, !dbg !677
  %and235 = and i32 %shr234, 255, !dbg !678
  %idxprom236 = zext i32 %and235 to i64, !dbg !679
  %arrayidx237 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom236, !dbg !679
  %130 = load i32, i32* %arrayidx237, align 4, !dbg !679
  %and238 = and i32 %130, 65280, !dbg !680
  %xor239 = xor i32 %xor233, %and238, !dbg !681
  %131 = load i32, i32* %t3, align 4, !dbg !682
  %and240 = and i32 %131, 255, !dbg !683
  %idxprom241 = zext i32 %and240 to i64, !dbg !684
  %arrayidx242 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom241, !dbg !684
  %132 = load i32, i32* %arrayidx242, align 4, !dbg !684
  %and243 = and i32 %132, 255, !dbg !685
  %xor244 = xor i32 %xor239, %and243, !dbg !686
  %133 = load i32*, i32** %rk, align 8, !dbg !687
  %arrayidx245 = getelementptr inbounds i32, i32* %133, i64 0, !dbg !687
  %134 = load i32, i32* %arrayidx245, align 4, !dbg !687
  %xor246 = xor i32 %xor244, %134, !dbg !688
  store i32 %xor246, i32* %s0, align 4, !dbg !689
  %135 = load i32, i32* %s0, align 4, !dbg !690
  %shr247 = lshr i32 %135, 24, !dbg !690
  %conv248 = trunc i32 %shr247 to i8, !dbg !690
  %136 = load i8*, i8** %out.addr, align 8, !dbg !690
  %arrayidx249 = getelementptr inbounds i8, i8* %136, i64 0, !dbg !690
  store i8 %conv248, i8* %arrayidx249, align 1, !dbg !690
  %137 = load i32, i32* %s0, align 4, !dbg !690
  %shr250 = lshr i32 %137, 16, !dbg !690
  %conv251 = trunc i32 %shr250 to i8, !dbg !690
  %138 = load i8*, i8** %out.addr, align 8, !dbg !690
  %arrayidx252 = getelementptr inbounds i8, i8* %138, i64 1, !dbg !690
  store i8 %conv251, i8* %arrayidx252, align 1, !dbg !690
  %139 = load i32, i32* %s0, align 4, !dbg !690
  %shr253 = lshr i32 %139, 8, !dbg !690
  %conv254 = trunc i32 %shr253 to i8, !dbg !690
  %140 = load i8*, i8** %out.addr, align 8, !dbg !690
  %arrayidx255 = getelementptr inbounds i8, i8* %140, i64 2, !dbg !690
  store i8 %conv254, i8* %arrayidx255, align 1, !dbg !690
  %141 = load i32, i32* %s0, align 4, !dbg !690
  %conv256 = trunc i32 %141 to i8, !dbg !690
  %142 = load i8*, i8** %out.addr, align 8, !dbg !690
  %arrayidx257 = getelementptr inbounds i8, i8* %142, i64 3, !dbg !690
  store i8 %conv256, i8* %arrayidx257, align 1, !dbg !690
  %143 = load i32, i32* %t1, align 4, !dbg !692
  %shr258 = lshr i32 %143, 24, !dbg !693
  %idxprom259 = zext i32 %shr258 to i64, !dbg !694
  %arrayidx260 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom259, !dbg !694
  %144 = load i32, i32* %arrayidx260, align 4, !dbg !694
  %and261 = and i32 %144, -16777216, !dbg !695
  %145 = load i32, i32* %t2, align 4, !dbg !696
  %shr262 = lshr i32 %145, 16, !dbg !697
  %and263 = and i32 %shr262, 255, !dbg !698
  %idxprom264 = zext i32 %and263 to i64, !dbg !699
  %arrayidx265 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom264, !dbg !699
  %146 = load i32, i32* %arrayidx265, align 4, !dbg !699
  %and266 = and i32 %146, 16711680, !dbg !700
  %xor267 = xor i32 %and261, %and266, !dbg !701
  %147 = load i32, i32* %t3, align 4, !dbg !702
  %shr268 = lshr i32 %147, 8, !dbg !703
  %and269 = and i32 %shr268, 255, !dbg !704
  %idxprom270 = zext i32 %and269 to i64, !dbg !705
  %arrayidx271 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom270, !dbg !705
  %148 = load i32, i32* %arrayidx271, align 4, !dbg !705
  %and272 = and i32 %148, 65280, !dbg !706
  %xor273 = xor i32 %xor267, %and272, !dbg !707
  %149 = load i32, i32* %t0, align 4, !dbg !708
  %and274 = and i32 %149, 255, !dbg !709
  %idxprom275 = zext i32 %and274 to i64, !dbg !710
  %arrayidx276 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom275, !dbg !710
  %150 = load i32, i32* %arrayidx276, align 4, !dbg !710
  %and277 = and i32 %150, 255, !dbg !711
  %xor278 = xor i32 %xor273, %and277, !dbg !712
  %151 = load i32*, i32** %rk, align 8, !dbg !713
  %arrayidx279 = getelementptr inbounds i32, i32* %151, i64 1, !dbg !713
  %152 = load i32, i32* %arrayidx279, align 4, !dbg !713
  %xor280 = xor i32 %xor278, %152, !dbg !714
  store i32 %xor280, i32* %s1, align 4, !dbg !715
  %153 = load i32, i32* %s1, align 4, !dbg !716
  %shr281 = lshr i32 %153, 24, !dbg !716
  %conv282 = trunc i32 %shr281 to i8, !dbg !716
  %154 = load i8*, i8** %out.addr, align 8, !dbg !716
  %add.ptr283 = getelementptr inbounds i8, i8* %154, i64 4, !dbg !716
  %arrayidx284 = getelementptr inbounds i8, i8* %add.ptr283, i64 0, !dbg !716
  store i8 %conv282, i8* %arrayidx284, align 1, !dbg !716
  %155 = load i32, i32* %s1, align 4, !dbg !716
  %shr285 = lshr i32 %155, 16, !dbg !716
  %conv286 = trunc i32 %shr285 to i8, !dbg !716
  %156 = load i8*, i8** %out.addr, align 8, !dbg !716
  %add.ptr287 = getelementptr inbounds i8, i8* %156, i64 4, !dbg !716
  %arrayidx288 = getelementptr inbounds i8, i8* %add.ptr287, i64 1, !dbg !716
  store i8 %conv286, i8* %arrayidx288, align 1, !dbg !716
  %157 = load i32, i32* %s1, align 4, !dbg !716
  %shr289 = lshr i32 %157, 8, !dbg !716
  %conv290 = trunc i32 %shr289 to i8, !dbg !716
  %158 = load i8*, i8** %out.addr, align 8, !dbg !716
  %add.ptr291 = getelementptr inbounds i8, i8* %158, i64 4, !dbg !716
  %arrayidx292 = getelementptr inbounds i8, i8* %add.ptr291, i64 2, !dbg !716
  store i8 %conv290, i8* %arrayidx292, align 1, !dbg !716
  %159 = load i32, i32* %s1, align 4, !dbg !716
  %conv293 = trunc i32 %159 to i8, !dbg !716
  %160 = load i8*, i8** %out.addr, align 8, !dbg !716
  %add.ptr294 = getelementptr inbounds i8, i8* %160, i64 4, !dbg !716
  %arrayidx295 = getelementptr inbounds i8, i8* %add.ptr294, i64 3, !dbg !716
  store i8 %conv293, i8* %arrayidx295, align 1, !dbg !716
  %161 = load i32, i32* %t2, align 4, !dbg !718
  %shr296 = lshr i32 %161, 24, !dbg !719
  %idxprom297 = zext i32 %shr296 to i64, !dbg !720
  %arrayidx298 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom297, !dbg !720
  %162 = load i32, i32* %arrayidx298, align 4, !dbg !720
  %and299 = and i32 %162, -16777216, !dbg !721
  %163 = load i32, i32* %t3, align 4, !dbg !722
  %shr300 = lshr i32 %163, 16, !dbg !723
  %and301 = and i32 %shr300, 255, !dbg !724
  %idxprom302 = zext i32 %and301 to i64, !dbg !725
  %arrayidx303 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom302, !dbg !725
  %164 = load i32, i32* %arrayidx303, align 4, !dbg !725
  %and304 = and i32 %164, 16711680, !dbg !726
  %xor305 = xor i32 %and299, %and304, !dbg !727
  %165 = load i32, i32* %t0, align 4, !dbg !728
  %shr306 = lshr i32 %165, 8, !dbg !729
  %and307 = and i32 %shr306, 255, !dbg !730
  %idxprom308 = zext i32 %and307 to i64, !dbg !731
  %arrayidx309 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom308, !dbg !731
  %166 = load i32, i32* %arrayidx309, align 4, !dbg !731
  %and310 = and i32 %166, 65280, !dbg !732
  %xor311 = xor i32 %xor305, %and310, !dbg !733
  %167 = load i32, i32* %t1, align 4, !dbg !734
  %and312 = and i32 %167, 255, !dbg !735
  %idxprom313 = zext i32 %and312 to i64, !dbg !736
  %arrayidx314 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom313, !dbg !736
  %168 = load i32, i32* %arrayidx314, align 4, !dbg !736
  %and315 = and i32 %168, 255, !dbg !737
  %xor316 = xor i32 %xor311, %and315, !dbg !738
  %169 = load i32*, i32** %rk, align 8, !dbg !739
  %arrayidx317 = getelementptr inbounds i32, i32* %169, i64 2, !dbg !739
  %170 = load i32, i32* %arrayidx317, align 4, !dbg !739
  %xor318 = xor i32 %xor316, %170, !dbg !740
  store i32 %xor318, i32* %s2, align 4, !dbg !741
  %171 = load i32, i32* %s2, align 4, !dbg !742
  %shr319 = lshr i32 %171, 24, !dbg !742
  %conv320 = trunc i32 %shr319 to i8, !dbg !742
  %172 = load i8*, i8** %out.addr, align 8, !dbg !742
  %add.ptr321 = getelementptr inbounds i8, i8* %172, i64 8, !dbg !742
  %arrayidx322 = getelementptr inbounds i8, i8* %add.ptr321, i64 0, !dbg !742
  store i8 %conv320, i8* %arrayidx322, align 1, !dbg !742
  %173 = load i32, i32* %s2, align 4, !dbg !742
  %shr323 = lshr i32 %173, 16, !dbg !742
  %conv324 = trunc i32 %shr323 to i8, !dbg !742
  %174 = load i8*, i8** %out.addr, align 8, !dbg !742
  %add.ptr325 = getelementptr inbounds i8, i8* %174, i64 8, !dbg !742
  %arrayidx326 = getelementptr inbounds i8, i8* %add.ptr325, i64 1, !dbg !742
  store i8 %conv324, i8* %arrayidx326, align 1, !dbg !742
  %175 = load i32, i32* %s2, align 4, !dbg !742
  %shr327 = lshr i32 %175, 8, !dbg !742
  %conv328 = trunc i32 %shr327 to i8, !dbg !742
  %176 = load i8*, i8** %out.addr, align 8, !dbg !742
  %add.ptr329 = getelementptr inbounds i8, i8* %176, i64 8, !dbg !742
  %arrayidx330 = getelementptr inbounds i8, i8* %add.ptr329, i64 2, !dbg !742
  store i8 %conv328, i8* %arrayidx330, align 1, !dbg !742
  %177 = load i32, i32* %s2, align 4, !dbg !742
  %conv331 = trunc i32 %177 to i8, !dbg !742
  %178 = load i8*, i8** %out.addr, align 8, !dbg !742
  %add.ptr332 = getelementptr inbounds i8, i8* %178, i64 8, !dbg !742
  %arrayidx333 = getelementptr inbounds i8, i8* %add.ptr332, i64 3, !dbg !742
  store i8 %conv331, i8* %arrayidx333, align 1, !dbg !742
  %179 = load i32, i32* %t3, align 4, !dbg !744
  %shr334 = lshr i32 %179, 24, !dbg !745
  %idxprom335 = zext i32 %shr334 to i64, !dbg !746
  %arrayidx336 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom335, !dbg !746
  %180 = load i32, i32* %arrayidx336, align 4, !dbg !746
  %and337 = and i32 %180, -16777216, !dbg !747
  %181 = load i32, i32* %t0, align 4, !dbg !748
  %shr338 = lshr i32 %181, 16, !dbg !749
  %and339 = and i32 %shr338, 255, !dbg !750
  %idxprom340 = zext i32 %and339 to i64, !dbg !751
  %arrayidx341 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom340, !dbg !751
  %182 = load i32, i32* %arrayidx341, align 4, !dbg !751
  %and342 = and i32 %182, 16711680, !dbg !752
  %xor343 = xor i32 %and337, %and342, !dbg !753
  %183 = load i32, i32* %t1, align 4, !dbg !754
  %shr344 = lshr i32 %183, 8, !dbg !755
  %and345 = and i32 %shr344, 255, !dbg !756
  %idxprom346 = zext i32 %and345 to i64, !dbg !757
  %arrayidx347 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom346, !dbg !757
  %184 = load i32, i32* %arrayidx347, align 4, !dbg !757
  %and348 = and i32 %184, 65280, !dbg !758
  %xor349 = xor i32 %xor343, %and348, !dbg !759
  %185 = load i32, i32* %t2, align 4, !dbg !760
  %and350 = and i32 %185, 255, !dbg !761
  %idxprom351 = zext i32 %and350 to i64, !dbg !762
  %arrayidx352 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom351, !dbg !762
  %186 = load i32, i32* %arrayidx352, align 4, !dbg !762
  %and353 = and i32 %186, 255, !dbg !763
  %xor354 = xor i32 %xor349, %and353, !dbg !764
  %187 = load i32*, i32** %rk, align 8, !dbg !765
  %arrayidx355 = getelementptr inbounds i32, i32* %187, i64 3, !dbg !765
  %188 = load i32, i32* %arrayidx355, align 4, !dbg !765
  %xor356 = xor i32 %xor354, %188, !dbg !766
  store i32 %xor356, i32* %s3, align 4, !dbg !767
  %189 = load i32, i32* %s3, align 4, !dbg !768
  %shr357 = lshr i32 %189, 24, !dbg !768
  %conv358 = trunc i32 %shr357 to i8, !dbg !768
  %190 = load i8*, i8** %out.addr, align 8, !dbg !768
  %add.ptr359 = getelementptr inbounds i8, i8* %190, i64 12, !dbg !768
  %arrayidx360 = getelementptr inbounds i8, i8* %add.ptr359, i64 0, !dbg !768
  store i8 %conv358, i8* %arrayidx360, align 1, !dbg !768
  %191 = load i32, i32* %s3, align 4, !dbg !768
  %shr361 = lshr i32 %191, 16, !dbg !768
  %conv362 = trunc i32 %shr361 to i8, !dbg !768
  %192 = load i8*, i8** %out.addr, align 8, !dbg !768
  %add.ptr363 = getelementptr inbounds i8, i8* %192, i64 12, !dbg !768
  %arrayidx364 = getelementptr inbounds i8, i8* %add.ptr363, i64 1, !dbg !768
  store i8 %conv362, i8* %arrayidx364, align 1, !dbg !768
  %193 = load i32, i32* %s3, align 4, !dbg !768
  %shr365 = lshr i32 %193, 8, !dbg !768
  %conv366 = trunc i32 %shr365 to i8, !dbg !768
  %194 = load i8*, i8** %out.addr, align 8, !dbg !768
  %add.ptr367 = getelementptr inbounds i8, i8* %194, i64 12, !dbg !768
  %arrayidx368 = getelementptr inbounds i8, i8* %add.ptr367, i64 2, !dbg !768
  store i8 %conv366, i8* %arrayidx368, align 1, !dbg !768
  %195 = load i32, i32* %s3, align 4, !dbg !768
  %conv369 = trunc i32 %195 to i8, !dbg !768
  %196 = load i8*, i8** %out.addr, align 8, !dbg !768
  %add.ptr370 = getelementptr inbounds i8, i8* %196, i64 12, !dbg !768
  %arrayidx371 = getelementptr inbounds i8, i8* %add.ptr370, i64 3, !dbg !768
  store i8 %conv369, i8* %arrayidx371, align 1, !dbg !768
  ret void, !dbg !770
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @AES_ofb128_encrypt(i8* %in, i8* %out, i64 %length, %struct.aes_key_st* %key, i8* %ivec, i32* %num) unnamed_addr #0 !dbg !771 {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %key.addr = alloca %struct.aes_key_st*, align 8
  %ivec.addr = alloca i8*, align 8
  %num.addr = alloca i32*, align 8
  store i8* %in, i8** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !782, metadata !DIExpression()), !dbg !783
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !784, metadata !DIExpression()), !dbg !785
  store i64 %length, i64* %length.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %length.addr, metadata !786, metadata !DIExpression()), !dbg !787
  store %struct.aes_key_st* %key, %struct.aes_key_st** %key.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.aes_key_st** %key.addr, metadata !788, metadata !DIExpression()), !dbg !789
  store i8* %ivec, i8** %ivec.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ivec.addr, metadata !790, metadata !DIExpression()), !dbg !791
  store i32* %num, i32** %num.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %num.addr, metadata !792, metadata !DIExpression()), !dbg !793
  %0 = load i8*, i8** %in.addr, align 8, !dbg !794
  %1 = load i8*, i8** %out.addr, align 8, !dbg !795
  %2 = load i64, i64* %length.addr, align 8, !dbg !796
  %3 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !797
  %4 = bitcast %struct.aes_key_st* %3 to i8*, !dbg !797
  %5 = load i8*, i8** %ivec.addr, align 8, !dbg !798
  %6 = load i32*, i32** %num.addr, align 8, !dbg !799
  call fastcc void @CRYPTO_ofb128_encrypt(i8* %0, i8* %1, i64 %2, i8* %4, i8* %5, i32* %6), !dbg !800
  ret void, !dbg !801
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @CRYPTO_ofb128_encrypt(i8* %in, i8* %out, i64 %len, i8* %key, i8* %ivec, i32* %num) unnamed_addr #0 !dbg !802 {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 8
  %ivec.addr = alloca i8*, align 8
  %num.addr = alloca i32*, align 8
  %block.addr = alloca void (i8*, i8*, i8*)*, align 8
  %n = alloca i32, align 4
  %l = alloca i64, align 8
  store i8* %in, i8** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !807, metadata !DIExpression()), !dbg !808
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !809, metadata !DIExpression()), !dbg !810
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !811, metadata !DIExpression()), !dbg !812
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !813, metadata !DIExpression()), !dbg !814
  store i8* %ivec, i8** %ivec.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ivec.addr, metadata !815, metadata !DIExpression()), !dbg !816
  store i32* %num, i32** %num.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %num.addr, metadata !817, metadata !DIExpression()), !dbg !818
  store void (i8*, i8*, i8*)* bitcast (void (i8*, i8*, %struct.aes_key_st*)* @AES_encrypt to void (i8*, i8*, i8*)*), void (i8*, i8*, i8*)** %block.addr, align 8
  call void @llvm.dbg.declare(metadata void (i8*, i8*, i8*)** %block.addr, metadata !819, metadata !DIExpression()), !dbg !820
  call void @llvm.dbg.declare(metadata i32* %n, metadata !821, metadata !DIExpression()), !dbg !822
  call void @llvm.dbg.declare(metadata i64* %l, metadata !823, metadata !DIExpression()), !dbg !824
  store i64 0, i64* %l, align 8, !dbg !824
  %0 = load i32*, i32** %num.addr, align 8, !dbg !825
  %1 = load i32, i32* %0, align 4, !dbg !826
  store i32 %1, i32* %n, align 4, !dbg !827
  br label %do.body, !dbg !828, !llvm.loop !830

do.body:                                          ; preds = %entry
  br label %while.cond, !dbg !832

while.cond:                                       ; preds = %while.body, %do.body
  %2 = load i32, i32* %n, align 4, !dbg !834
  %tobool = icmp ne i32 %2, 0, !dbg !834
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !835

land.rhs:                                         ; preds = %while.cond
  %3 = load i64, i64* %len.addr, align 8, !dbg !836
  %tobool1 = icmp ne i64 %3, 0, !dbg !835
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end, !dbg !832

while.body:                                       ; preds = %land.end
  %5 = load i8*, i8** %in.addr, align 8, !dbg !837
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1, !dbg !837
  store i8* %incdec.ptr, i8** %in.addr, align 8, !dbg !837
  %6 = load i8, i8* %5, align 1, !dbg !839
  %conv = zext i8 %6 to i32, !dbg !839
  %7 = load i8*, i8** %ivec.addr, align 8, !dbg !840
  %8 = load i32, i32* %n, align 4, !dbg !841
  %idxprom = zext i32 %8 to i64, !dbg !840
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom, !dbg !840
  %9 = load i8, i8* %arrayidx, align 1, !dbg !840
  %conv2 = zext i8 %9 to i32, !dbg !840
  %xor = xor i32 %conv, %conv2, !dbg !842
  %conv3 = trunc i32 %xor to i8, !dbg !839
  %10 = load i8*, i8** %out.addr, align 8, !dbg !843
  %incdec.ptr4 = getelementptr inbounds i8, i8* %10, i32 1, !dbg !843
  store i8* %incdec.ptr4, i8** %out.addr, align 8, !dbg !843
  store i8 %conv3, i8* %10, align 1, !dbg !844
  %11 = load i64, i64* %len.addr, align 8, !dbg !845
  %dec = add i64 %11, -1, !dbg !845
  store i64 %dec, i64* %len.addr, align 8, !dbg !845
  %12 = load i32, i32* %n, align 4, !dbg !846
  %add = add i32 %12, 1, !dbg !847
  %rem = urem i32 %add, 16, !dbg !848
  store i32 %rem, i32* %n, align 4, !dbg !849
  br label %while.cond, !dbg !832, !llvm.loop !850

while.end:                                        ; preds = %land.end
  br label %while.cond5, !dbg !852

while.cond5:                                      ; preds = %for.end, %while.end
  %13 = load i64, i64* %len.addr, align 8, !dbg !853
  %cmp = icmp uge i64 %13, 16, !dbg !854
  br i1 %cmp, label %while.body7, label %while.end20, !dbg !852

while.body7:                                      ; preds = %while.cond5
  %14 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %block.addr, align 8, !dbg !855
  %15 = load i8*, i8** %ivec.addr, align 8, !dbg !857
  %16 = load i8*, i8** %ivec.addr, align 8, !dbg !858
  %17 = load i8*, i8** %key.addr, align 8, !dbg !859
  call void %14(i8* %15, i8* %16, i8* %17), !dbg !860
  store i32 0, i32* %n, align 4, !dbg !861
  br label %for.cond, !dbg !863

for.cond:                                         ; preds = %for.inc, %while.body7
  %18 = load i32, i32* %n, align 4, !dbg !864
  %cmp8 = icmp ult i32 %18, 16, !dbg !866
  br i1 %cmp8, label %for.body, label %for.end, !dbg !867

for.body:                                         ; preds = %for.cond
  %19 = load i8*, i8** %in.addr, align 8, !dbg !868
  %20 = load i32, i32* %n, align 4, !dbg !869
  %idx.ext = zext i32 %20 to i64, !dbg !870
  %add.ptr = getelementptr inbounds i8, i8* %19, i64 %idx.ext, !dbg !870
  %21 = bitcast i8* %add.ptr to i64*, !dbg !871
  %22 = load i64, i64* %21, align 8, !dbg !871
  %23 = load i8*, i8** %ivec.addr, align 8, !dbg !872
  %24 = load i32, i32* %n, align 4, !dbg !873
  %idx.ext10 = zext i32 %24 to i64, !dbg !874
  %add.ptr11 = getelementptr inbounds i8, i8* %23, i64 %idx.ext10, !dbg !874
  %25 = bitcast i8* %add.ptr11 to i64*, !dbg !875
  %26 = load i64, i64* %25, align 8, !dbg !875
  %xor12 = xor i64 %22, %26, !dbg !876
  %27 = load i8*, i8** %out.addr, align 8, !dbg !877
  %28 = load i32, i32* %n, align 4, !dbg !878
  %idx.ext13 = zext i32 %28 to i64, !dbg !879
  %add.ptr14 = getelementptr inbounds i8, i8* %27, i64 %idx.ext13, !dbg !879
  %29 = bitcast i8* %add.ptr14 to i64*, !dbg !880
  store i64 %xor12, i64* %29, align 8, !dbg !881
  br label %for.inc, !dbg !880

for.inc:                                          ; preds = %for.body
  %30 = load i32, i32* %n, align 4, !dbg !882
  %conv15 = zext i32 %30 to i64, !dbg !882
  %add16 = add i64 %conv15, 8, !dbg !882
  %conv17 = trunc i64 %add16 to i32, !dbg !882
  store i32 %conv17, i32* %n, align 4, !dbg !882
  br label %for.cond, !dbg !883, !llvm.loop !884

for.end:                                          ; preds = %for.cond
  %31 = load i64, i64* %len.addr, align 8, !dbg !886
  %sub = sub i64 %31, 16, !dbg !886
  store i64 %sub, i64* %len.addr, align 8, !dbg !886
  %32 = load i8*, i8** %out.addr, align 8, !dbg !887
  %add.ptr18 = getelementptr inbounds i8, i8* %32, i64 16, !dbg !887
  store i8* %add.ptr18, i8** %out.addr, align 8, !dbg !887
  %33 = load i8*, i8** %in.addr, align 8, !dbg !888
  %add.ptr19 = getelementptr inbounds i8, i8* %33, i64 16, !dbg !888
  store i8* %add.ptr19, i8** %in.addr, align 8, !dbg !888
  br label %while.cond5, !dbg !852, !llvm.loop !889

while.end20:                                      ; preds = %while.cond5
  store i32 0, i32* %n, align 4, !dbg !891
  %34 = load i64, i64* %len.addr, align 8, !dbg !892
  %tobool21 = icmp ne i64 %34, 0, !dbg !892
  br i1 %tobool21, label %if.then, label %if.end, !dbg !894

if.then:                                          ; preds = %while.end20
  %35 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %block.addr, align 8, !dbg !895
  %36 = load i8*, i8** %ivec.addr, align 8, !dbg !897
  %37 = load i8*, i8** %ivec.addr, align 8, !dbg !898
  %38 = load i8*, i8** %key.addr, align 8, !dbg !899
  call void %35(i8* %36, i8* %37, i8* %38), !dbg !900
  br label %while.cond22, !dbg !901

while.cond22:                                     ; preds = %while.body25, %if.then
  %39 = load i64, i64* %len.addr, align 8, !dbg !902
  %dec23 = add i64 %39, -1, !dbg !902
  store i64 %dec23, i64* %len.addr, align 8, !dbg !902
  %tobool24 = icmp ne i64 %39, 0, !dbg !901
  br i1 %tobool24, label %while.body25, label %while.end36, !dbg !901

while.body25:                                     ; preds = %while.cond22
  %40 = load i8*, i8** %in.addr, align 8, !dbg !903
  %41 = load i32, i32* %n, align 4, !dbg !905
  %idxprom26 = zext i32 %41 to i64, !dbg !903
  %arrayidx27 = getelementptr inbounds i8, i8* %40, i64 %idxprom26, !dbg !903
  %42 = load i8, i8* %arrayidx27, align 1, !dbg !903
  %conv28 = zext i8 %42 to i32, !dbg !903
  %43 = load i8*, i8** %ivec.addr, align 8, !dbg !906
  %44 = load i32, i32* %n, align 4, !dbg !907
  %idxprom29 = zext i32 %44 to i64, !dbg !906
  %arrayidx30 = getelementptr inbounds i8, i8* %43, i64 %idxprom29, !dbg !906
  %45 = load i8, i8* %arrayidx30, align 1, !dbg !906
  %conv31 = zext i8 %45 to i32, !dbg !906
  %xor32 = xor i32 %conv28, %conv31, !dbg !908
  %conv33 = trunc i32 %xor32 to i8, !dbg !903
  %46 = load i8*, i8** %out.addr, align 8, !dbg !909
  %47 = load i32, i32* %n, align 4, !dbg !910
  %idxprom34 = zext i32 %47 to i64, !dbg !909
  %arrayidx35 = getelementptr inbounds i8, i8* %46, i64 %idxprom34, !dbg !909
  store i8 %conv33, i8* %arrayidx35, align 1, !dbg !911
  %48 = load i32, i32* %n, align 4, !dbg !912
  %inc = add i32 %48, 1, !dbg !912
  store i32 %inc, i32* %n, align 4, !dbg !912
  br label %while.cond22, !dbg !901, !llvm.loop !913

while.end36:                                      ; preds = %while.cond22
  br label %if.end, !dbg !915

if.end:                                           ; preds = %while.end36, %while.end20
  %49 = load i32, i32* %n, align 4, !dbg !916
  %50 = load i32*, i32** %num.addr, align 8, !dbg !917
  store i32 %49, i32* %50, align 4, !dbg !918
  br label %return, !dbg !919

return:                                           ; preds = %if.end
  ret void, !dbg !920
}

; Function Attrs: noinline nounwind uwtable
define i8* @memcpy(i8* returned, i8* nocapture readonly, i64) local_unnamed_addr #3 !dbg !921 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !927, metadata !DIExpression()), !dbg !928
  call void @llvm.dbg.value(metadata i8* %1, metadata !929, metadata !DIExpression()), !dbg !930
  call void @llvm.dbg.value(metadata i64 %2, metadata !931, metadata !DIExpression()), !dbg !932
  call void @llvm.dbg.value(metadata i8* %0, metadata !933, metadata !DIExpression()), !dbg !936
  call void @llvm.dbg.value(metadata i8* %1, metadata !937, metadata !DIExpression()), !dbg !940
  %4 = icmp eq i64 %2, 0, !dbg !941
  br i1 %4, label %._crit_edge, label %.lr.ph, !dbg !942

.lr.ph:                                           ; preds = %3
  br label %5, !dbg !942

; <label>:5:                                      ; preds = %.lr.ph, %5
  %.05 = phi i8* [ %1, %.lr.ph ], [ %7, %5 ]
  %.014 = phi i8* [ %0, %.lr.ph ], [ %9, %5 ]
  %.023 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i64 %.023, metadata !931, metadata !DIExpression()), !dbg !932
  call void @llvm.dbg.value(metadata i8* %.014, metadata !933, metadata !DIExpression()), !dbg !936
  call void @llvm.dbg.value(metadata i8* %.05, metadata !937, metadata !DIExpression()), !dbg !940
  %6 = add i64 %.023, -1, !dbg !943
  %7 = getelementptr inbounds i8, i8* %.05, i64 1, !dbg !944
  %8 = load i8, i8* %.05, align 1, !dbg !945
  %9 = getelementptr inbounds i8, i8* %.014, i64 1, !dbg !946
  store i8 %8, i8* %.014, align 1, !dbg !947
  call void @llvm.dbg.value(metadata i8* %7, metadata !937, metadata !DIExpression()), !dbg !940
  call void @llvm.dbg.value(metadata i8* %9, metadata !933, metadata !DIExpression()), !dbg !936
  call void @llvm.dbg.value(metadata i64 %6, metadata !931, metadata !DIExpression()), !dbg !932
  %10 = icmp eq i64 %6, 0, !dbg !941
  br i1 %10, label %._crit_edge, label %5, !dbg !942, !llvm.loop !948

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !949
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!40, !2, !57, !68, !75}
!llvm.module.flags = !{!77, !78, !79}
!llvm.ident = !{!80, !80, !80, !80, !81}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Te2", scope: !2, file: !14, line: 188, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11)
!3 = !DIFile(filename: "/home/klee/shareddir/openssl/crypto/aes/aes_core.c", directory: "/home/klee/shareddir")
!4 = !{}
!5 = !{!6, !9}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 77, baseType: !8)
!7 = !DIFile(filename: "/home/klee/shareddir/openssl/crypto/aes/aes_locl.h", directory: "/home/klee/shareddir")
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 80, baseType: !10)
!10 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!11 = !{!0, !12, !19, !21, !23, !28, !30, !32, !34, !36}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "Te3", scope: !2, file: !14, line: 254, type: !15, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./openssl/crypto/aes/aes_core.c", directory: "/home/klee/shareddir")
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 8192, elements: !17)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!17 = !{!18}
!18 = !DISubrange(count: 256)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "Te0", scope: !2, file: !14, line: 56, type: !15, isLocal: true, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "Te1", scope: !2, file: !14, line: 122, type: !15, isLocal: true, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "rcon", scope: !2, file: !14, line: 619, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "Td0", scope: !2, file: !14, line: 321, type: !15, isLocal: true, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "Td1", scope: !2, file: !14, line: 387, type: !15, isLocal: true, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "Td2", scope: !2, file: !14, line: 453, type: !15, isLocal: true, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "Td3", scope: !2, file: !14, line: 519, type: !15, isLocal: true, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "Td4", scope: !2, file: !14, line: 585, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 2048, elements: !17)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!40 = distinct !DICompileUnit(language: DW_LANG_C99, file: !41, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !42)
!41 = !DIFile(filename: "testing_AES_OFB.c", directory: "/home/klee/shareddir")
!42 = !{!43, !45}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES_KEY", file: !48, line: 84, baseType: !49)
!48 = !DIFile(filename: "/home/klee/shareddir/openssl/include/openssl/aes.h", directory: "/home/klee/shareddir")
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aes_key_st", file: !48, line: 76, size: 1952, elements: !50)
!50 = !{!51, !55}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "rd_key", scope: !49, file: !48, line: 80, baseType: !52, size: 1920)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 1920, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 60)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "rounds", scope: !49, file: !48, line: 82, baseType: !56, size: 32, offset: 1920)
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = distinct !DICompileUnit(language: DW_LANG_C99, file: !58, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !59)
!58 = !DIFile(filename: "/home/klee/shareddir/openssl/crypto/aes/aes_ofb.c", directory: "/home/klee/shareddir")
!59 = !{!60}
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "block128_f", file: !61, line: 10, baseType: !62)
!61 = !DIFile(filename: "/home/klee/shareddir/openssl/include/openssl/modes.h", directory: "/home/klee/shareddir")
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !43, !65, !66}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!68 = distinct !DICompileUnit(language: DW_LANG_C99, file: !69, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !70)
!69 = !DIFile(filename: "./openssl/crypto/modes/ofb128.c", directory: "/home/klee/shareddir")
!70 = !{!71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !73, line: 62, baseType: !74)
!73 = !DIFile(filename: "/tmp/llvm-60-install_O_D_A/lib/clang/6.0.1/include/stddef.h", directory: "/home/klee/shareddir")
!74 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!75 = distinct !DICompileUnit(language: DW_LANG_C89, file: !76, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!76 = !DIFile(filename: "/home/klee/kleespectre/klee/runtime/FreeStanding/memcpy.c", directory: "/home/klee/kleespectre/klee/build/runtime/FreeStanding")
!77 = !{i32 2, !"Dwarf Version", i32 4}
!78 = !{i32 2, !"Debug Info Version", i32 3}
!79 = !{i32 1, !"wchar_size", i32 4}
!80 = !{!"clang version 6.0.1 "}
!81 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!82 = distinct !DISubprogram(name: "main", scope: !41, file: !41, line: 12, type: !83, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, unit: !40, variables: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!56}
!85 = !DILocalVariable(name: "in", scope: !82, file: !41, line: 13, type: !86)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 128, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 16)
!89 = !DILocation(line: 13, column: 25, scope: !82)
!90 = !DILocalVariable(name: "out", scope: !82, file: !41, line: 14, type: !91)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 128, elements: !87)
!92 = !DILocation(line: 14, column: 19, scope: !82)
!93 = !DILocalVariable(name: "len", scope: !82, file: !41, line: 15, type: !72)
!94 = !DILocation(line: 15, column: 12, scope: !82)
!95 = !DILocalVariable(name: "key", scope: !82, file: !41, line: 16, type: !86)
!96 = !DILocation(line: 16, column: 25, scope: !82)
!97 = !DILocalVariable(name: "aes_key", scope: !82, file: !41, line: 18, type: !47)
!98 = !DILocation(line: 18, column: 13, scope: !82)
!99 = !DILocalVariable(name: "ivec", scope: !82, file: !41, line: 19, type: !91)
!100 = !DILocation(line: 19, column: 19, scope: !82)
!101 = !DILocalVariable(name: "num", scope: !82, file: !41, line: 22, type: !102)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!103 = !DILocation(line: 22, column: 10, scope: !82)
!104 = !DILocation(line: 24, column: 24, scope: !82)
!105 = !DILocation(line: 24, column: 5, scope: !82)
!106 = !DILocation(line: 26, column: 25, scope: !82)
!107 = !DILocation(line: 26, column: 5, scope: !82)
!108 = !DILocation(line: 28, column: 48, scope: !82)
!109 = !DILocation(line: 28, column: 52, scope: !82)
!110 = !DILocation(line: 28, column: 57, scope: !82)
!111 = !DILocation(line: 29, column: 37, scope: !82)
!112 = !DILocation(line: 29, column: 43, scope: !82)
!113 = !DILocation(line: 28, column: 5, scope: !82)
!114 = !DILocation(line: 30, column: 1, scope: !82)
!115 = distinct !DISubprogram(name: "AES_set_encrypt_key", scope: !14, file: !14, line: 628, type: !116, isLocal: false, isDefinition: true, scopeLine: 629, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!116 = !DISubroutineType(types: !117)
!117 = !{!56, !43, !118, !119}
!118 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !56)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES_KEY", file: !48, line: 84, baseType: !121)
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aes_key_st", file: !48, line: 76, size: 1952, elements: !122)
!122 = !{!123, !124}
!123 = !DIDerivedType(tag: DW_TAG_member, name: "rd_key", scope: !121, file: !48, line: 80, baseType: !52, size: 1920)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "rounds", scope: !121, file: !48, line: 82, baseType: !56, size: 32, offset: 1920)
!125 = !DILocalVariable(name: "userKey", arg: 1, scope: !115, file: !14, line: 628, type: !43)
!126 = !DILocation(line: 628, column: 46, scope: !115)
!127 = !DILocalVariable(name: "bits", arg: 2, scope: !115, file: !14, line: 628, type: !118)
!128 = !DILocation(line: 628, column: 65, scope: !115)
!129 = !DILocalVariable(name: "key", arg: 3, scope: !115, file: !14, line: 629, type: !119)
!130 = !DILocation(line: 629, column: 13, scope: !115)
!131 = !DILocalVariable(name: "rk", scope: !115, file: !14, line: 631, type: !132)
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!133 = !DILocation(line: 631, column: 7, scope: !115)
!134 = !DILocalVariable(name: "i", scope: !115, file: !14, line: 632, type: !56)
!135 = !DILocation(line: 632, column: 9, scope: !115)
!136 = !DILocalVariable(name: "temp", scope: !115, file: !14, line: 633, type: !6)
!137 = !DILocation(line: 633, column: 6, scope: !115)
!138 = !DILocation(line: 635, column: 7, scope: !139)
!139 = distinct !DILexicalBlock(scope: !115, file: !14, line: 635, column: 6)
!140 = !DILocation(line: 635, column: 15, scope: !139)
!141 = !DILocation(line: 635, column: 19, scope: !139)
!142 = !DILocation(line: 635, column: 6, scope: !115)
!143 = !DILocation(line: 636, column: 3, scope: !139)
!144 = !DILocation(line: 637, column: 6, scope: !145)
!145 = distinct !DILexicalBlock(scope: !115, file: !14, line: 637, column: 6)
!146 = !DILocation(line: 637, column: 11, scope: !145)
!147 = !DILocation(line: 637, column: 18, scope: !145)
!148 = !DILocation(line: 637, column: 21, scope: !145)
!149 = !DILocation(line: 637, column: 26, scope: !145)
!150 = !DILocation(line: 637, column: 33, scope: !145)
!151 = !DILocation(line: 637, column: 36, scope: !145)
!152 = !DILocation(line: 637, column: 41, scope: !145)
!153 = !DILocation(line: 637, column: 6, scope: !115)
!154 = !DILocation(line: 638, column: 3, scope: !145)
!155 = !DILocation(line: 640, column: 7, scope: !115)
!156 = !DILocation(line: 640, column: 12, scope: !115)
!157 = !DILocation(line: 640, column: 5, scope: !115)
!158 = !DILocation(line: 642, column: 6, scope: !159)
!159 = distinct !DILexicalBlock(scope: !115, file: !14, line: 642, column: 6)
!160 = !DILocation(line: 642, column: 10, scope: !159)
!161 = !DILocation(line: 642, column: 6, scope: !115)
!162 = !DILocation(line: 643, column: 3, scope: !159)
!163 = !DILocation(line: 643, column: 8, scope: !159)
!164 = !DILocation(line: 643, column: 15, scope: !159)
!165 = !DILocation(line: 644, column: 11, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !14, line: 644, column: 11)
!167 = !DILocation(line: 644, column: 15, scope: !166)
!168 = !DILocation(line: 644, column: 11, scope: !159)
!169 = !DILocation(line: 645, column: 3, scope: !166)
!170 = !DILocation(line: 645, column: 8, scope: !166)
!171 = !DILocation(line: 645, column: 15, scope: !166)
!172 = !DILocation(line: 647, column: 3, scope: !166)
!173 = !DILocation(line: 647, column: 8, scope: !166)
!174 = !DILocation(line: 647, column: 15, scope: !166)
!175 = !DILocation(line: 649, column: 10, scope: !115)
!176 = !DILocation(line: 649, column: 2, scope: !115)
!177 = !DILocation(line: 649, column: 8, scope: !115)
!178 = !DILocation(line: 650, column: 10, scope: !115)
!179 = !DILocation(line: 650, column: 2, scope: !115)
!180 = !DILocation(line: 650, column: 8, scope: !115)
!181 = !DILocation(line: 651, column: 10, scope: !115)
!182 = !DILocation(line: 651, column: 2, scope: !115)
!183 = !DILocation(line: 651, column: 8, scope: !115)
!184 = !DILocation(line: 652, column: 10, scope: !115)
!185 = !DILocation(line: 652, column: 2, scope: !115)
!186 = !DILocation(line: 652, column: 8, scope: !115)
!187 = !DILocation(line: 653, column: 6, scope: !188)
!188 = distinct !DILexicalBlock(scope: !115, file: !14, line: 653, column: 6)
!189 = !DILocation(line: 653, column: 11, scope: !188)
!190 = !DILocation(line: 653, column: 6, scope: !115)
!191 = !DILocation(line: 654, column: 3, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !14, line: 653, column: 19)
!193 = !DILocation(line: 655, column: 12, scope: !194)
!194 = distinct !DILexicalBlock(scope: !192, file: !14, line: 654, column: 13)
!195 = !DILocation(line: 655, column: 10, scope: !194)
!196 = !DILocation(line: 656, column: 12, scope: !194)
!197 = !DILocation(line: 657, column: 11, scope: !194)
!198 = !DILocation(line: 657, column: 16, scope: !194)
!199 = !DILocation(line: 657, column: 23, scope: !194)
!200 = !DILocation(line: 657, column: 6, scope: !194)
!201 = !DILocation(line: 657, column: 31, scope: !194)
!202 = !DILocation(line: 656, column: 18, scope: !194)
!203 = !DILocation(line: 658, column: 11, scope: !194)
!204 = !DILocation(line: 658, column: 16, scope: !194)
!205 = !DILocation(line: 658, column: 23, scope: !194)
!206 = !DILocation(line: 658, column: 6, scope: !194)
!207 = !DILocation(line: 658, column: 31, scope: !194)
!208 = !DILocation(line: 657, column: 45, scope: !194)
!209 = !DILocation(line: 659, column: 11, scope: !194)
!210 = !DILocation(line: 659, column: 23, scope: !194)
!211 = !DILocation(line: 659, column: 6, scope: !194)
!212 = !DILocation(line: 659, column: 31, scope: !194)
!213 = !DILocation(line: 658, column: 45, scope: !194)
!214 = !DILocation(line: 660, column: 11, scope: !194)
!215 = !DILocation(line: 660, column: 16, scope: !194)
!216 = !DILocation(line: 660, column: 6, scope: !194)
!217 = !DILocation(line: 660, column: 31, scope: !194)
!218 = !DILocation(line: 659, column: 45, scope: !194)
!219 = !DILocation(line: 661, column: 10, scope: !194)
!220 = !DILocation(line: 661, column: 5, scope: !194)
!221 = !DILocation(line: 660, column: 45, scope: !194)
!222 = !DILocation(line: 656, column: 4, scope: !194)
!223 = !DILocation(line: 656, column: 10, scope: !194)
!224 = !DILocation(line: 662, column: 12, scope: !194)
!225 = !DILocation(line: 662, column: 20, scope: !194)
!226 = !DILocation(line: 662, column: 18, scope: !194)
!227 = !DILocation(line: 662, column: 4, scope: !194)
!228 = !DILocation(line: 662, column: 10, scope: !194)
!229 = !DILocation(line: 663, column: 12, scope: !194)
!230 = !DILocation(line: 663, column: 20, scope: !194)
!231 = !DILocation(line: 663, column: 18, scope: !194)
!232 = !DILocation(line: 663, column: 4, scope: !194)
!233 = !DILocation(line: 663, column: 10, scope: !194)
!234 = !DILocation(line: 664, column: 12, scope: !194)
!235 = !DILocation(line: 664, column: 20, scope: !194)
!236 = !DILocation(line: 664, column: 18, scope: !194)
!237 = !DILocation(line: 664, column: 4, scope: !194)
!238 = !DILocation(line: 664, column: 10, scope: !194)
!239 = !DILocation(line: 665, column: 8, scope: !240)
!240 = distinct !DILexicalBlock(scope: !194, file: !14, line: 665, column: 8)
!241 = !DILocation(line: 665, column: 12, scope: !240)
!242 = !DILocation(line: 665, column: 8, scope: !194)
!243 = !DILocation(line: 666, column: 5, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !14, line: 665, column: 19)
!245 = !DILocation(line: 668, column: 7, scope: !194)
!246 = distinct !{!246, !191, !247}
!247 = !DILocation(line: 669, column: 3, scope: !192)
!248 = !DILocation(line: 671, column: 10, scope: !115)
!249 = !DILocation(line: 671, column: 2, scope: !115)
!250 = !DILocation(line: 671, column: 8, scope: !115)
!251 = !DILocation(line: 672, column: 10, scope: !115)
!252 = !DILocation(line: 672, column: 2, scope: !115)
!253 = !DILocation(line: 672, column: 8, scope: !115)
!254 = !DILocation(line: 673, column: 6, scope: !255)
!255 = distinct !DILexicalBlock(scope: !115, file: !14, line: 673, column: 6)
!256 = !DILocation(line: 673, column: 11, scope: !255)
!257 = !DILocation(line: 673, column: 6, scope: !115)
!258 = !DILocation(line: 674, column: 3, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !14, line: 673, column: 19)
!260 = !DILocation(line: 675, column: 11, scope: !261)
!261 = distinct !DILexicalBlock(scope: !259, file: !14, line: 674, column: 13)
!262 = !DILocation(line: 675, column: 9, scope: !261)
!263 = !DILocation(line: 676, column: 13, scope: !261)
!264 = !DILocation(line: 677, column: 11, scope: !261)
!265 = !DILocation(line: 677, column: 16, scope: !261)
!266 = !DILocation(line: 677, column: 23, scope: !261)
!267 = !DILocation(line: 677, column: 6, scope: !261)
!268 = !DILocation(line: 677, column: 31, scope: !261)
!269 = !DILocation(line: 676, column: 20, scope: !261)
!270 = !DILocation(line: 678, column: 11, scope: !261)
!271 = !DILocation(line: 678, column: 16, scope: !261)
!272 = !DILocation(line: 678, column: 23, scope: !261)
!273 = !DILocation(line: 678, column: 6, scope: !261)
!274 = !DILocation(line: 678, column: 31, scope: !261)
!275 = !DILocation(line: 677, column: 45, scope: !261)
!276 = !DILocation(line: 679, column: 11, scope: !261)
!277 = !DILocation(line: 679, column: 23, scope: !261)
!278 = !DILocation(line: 679, column: 6, scope: !261)
!279 = !DILocation(line: 679, column: 31, scope: !261)
!280 = !DILocation(line: 678, column: 45, scope: !261)
!281 = !DILocation(line: 680, column: 11, scope: !261)
!282 = !DILocation(line: 680, column: 16, scope: !261)
!283 = !DILocation(line: 680, column: 6, scope: !261)
!284 = !DILocation(line: 680, column: 31, scope: !261)
!285 = !DILocation(line: 679, column: 45, scope: !261)
!286 = !DILocation(line: 681, column: 10, scope: !261)
!287 = !DILocation(line: 681, column: 5, scope: !261)
!288 = !DILocation(line: 680, column: 45, scope: !261)
!289 = !DILocation(line: 676, column: 4, scope: !261)
!290 = !DILocation(line: 676, column: 11, scope: !261)
!291 = !DILocation(line: 682, column: 13, scope: !261)
!292 = !DILocation(line: 682, column: 22, scope: !261)
!293 = !DILocation(line: 682, column: 20, scope: !261)
!294 = !DILocation(line: 682, column: 4, scope: !261)
!295 = !DILocation(line: 682, column: 11, scope: !261)
!296 = !DILocation(line: 683, column: 13, scope: !261)
!297 = !DILocation(line: 683, column: 22, scope: !261)
!298 = !DILocation(line: 683, column: 20, scope: !261)
!299 = !DILocation(line: 683, column: 4, scope: !261)
!300 = !DILocation(line: 683, column: 11, scope: !261)
!301 = !DILocation(line: 684, column: 13, scope: !261)
!302 = !DILocation(line: 684, column: 22, scope: !261)
!303 = !DILocation(line: 684, column: 20, scope: !261)
!304 = !DILocation(line: 684, column: 4, scope: !261)
!305 = !DILocation(line: 684, column: 11, scope: !261)
!306 = !DILocation(line: 685, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !261, file: !14, line: 685, column: 8)
!308 = !DILocation(line: 685, column: 12, scope: !307)
!309 = !DILocation(line: 685, column: 8, scope: !261)
!310 = !DILocation(line: 686, column: 5, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !14, line: 685, column: 18)
!312 = !DILocation(line: 688, column: 13, scope: !261)
!313 = !DILocation(line: 688, column: 22, scope: !261)
!314 = !DILocation(line: 688, column: 20, scope: !261)
!315 = !DILocation(line: 688, column: 4, scope: !261)
!316 = !DILocation(line: 688, column: 11, scope: !261)
!317 = !DILocation(line: 689, column: 13, scope: !261)
!318 = !DILocation(line: 689, column: 22, scope: !261)
!319 = !DILocation(line: 689, column: 20, scope: !261)
!320 = !DILocation(line: 689, column: 4, scope: !261)
!321 = !DILocation(line: 689, column: 11, scope: !261)
!322 = !DILocation(line: 690, column: 7, scope: !261)
!323 = distinct !{!323, !258, !324}
!324 = !DILocation(line: 691, column: 3, scope: !259)
!325 = !DILocation(line: 693, column: 10, scope: !115)
!326 = !DILocation(line: 693, column: 2, scope: !115)
!327 = !DILocation(line: 693, column: 8, scope: !115)
!328 = !DILocation(line: 694, column: 10, scope: !115)
!329 = !DILocation(line: 694, column: 2, scope: !115)
!330 = !DILocation(line: 694, column: 8, scope: !115)
!331 = !DILocation(line: 695, column: 6, scope: !332)
!332 = distinct !DILexicalBlock(scope: !115, file: !14, line: 695, column: 6)
!333 = !DILocation(line: 695, column: 11, scope: !332)
!334 = !DILocation(line: 695, column: 6, scope: !115)
!335 = !DILocation(line: 696, column: 3, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !14, line: 695, column: 19)
!337 = !DILocation(line: 697, column: 11, scope: !338)
!338 = distinct !DILexicalBlock(scope: !336, file: !14, line: 696, column: 13)
!339 = !DILocation(line: 697, column: 9, scope: !338)
!340 = !DILocation(line: 698, column: 13, scope: !338)
!341 = !DILocation(line: 699, column: 11, scope: !338)
!342 = !DILocation(line: 699, column: 16, scope: !338)
!343 = !DILocation(line: 699, column: 23, scope: !338)
!344 = !DILocation(line: 699, column: 6, scope: !338)
!345 = !DILocation(line: 699, column: 31, scope: !338)
!346 = !DILocation(line: 698, column: 20, scope: !338)
!347 = !DILocation(line: 700, column: 11, scope: !338)
!348 = !DILocation(line: 700, column: 16, scope: !338)
!349 = !DILocation(line: 700, column: 23, scope: !338)
!350 = !DILocation(line: 700, column: 6, scope: !338)
!351 = !DILocation(line: 700, column: 31, scope: !338)
!352 = !DILocation(line: 699, column: 45, scope: !338)
!353 = !DILocation(line: 701, column: 11, scope: !338)
!354 = !DILocation(line: 701, column: 23, scope: !338)
!355 = !DILocation(line: 701, column: 6, scope: !338)
!356 = !DILocation(line: 701, column: 31, scope: !338)
!357 = !DILocation(line: 700, column: 45, scope: !338)
!358 = !DILocation(line: 702, column: 11, scope: !338)
!359 = !DILocation(line: 702, column: 16, scope: !338)
!360 = !DILocation(line: 702, column: 6, scope: !338)
!361 = !DILocation(line: 702, column: 31, scope: !338)
!362 = !DILocation(line: 701, column: 45, scope: !338)
!363 = !DILocation(line: 703, column: 10, scope: !338)
!364 = !DILocation(line: 703, column: 5, scope: !338)
!365 = !DILocation(line: 702, column: 45, scope: !338)
!366 = !DILocation(line: 698, column: 4, scope: !338)
!367 = !DILocation(line: 698, column: 11, scope: !338)
!368 = !DILocation(line: 704, column: 13, scope: !338)
!369 = !DILocation(line: 704, column: 22, scope: !338)
!370 = !DILocation(line: 704, column: 20, scope: !338)
!371 = !DILocation(line: 704, column: 4, scope: !338)
!372 = !DILocation(line: 704, column: 11, scope: !338)
!373 = !DILocation(line: 705, column: 13, scope: !338)
!374 = !DILocation(line: 705, column: 22, scope: !338)
!375 = !DILocation(line: 705, column: 20, scope: !338)
!376 = !DILocation(line: 705, column: 4, scope: !338)
!377 = !DILocation(line: 705, column: 11, scope: !338)
!378 = !DILocation(line: 706, column: 13, scope: !338)
!379 = !DILocation(line: 706, column: 22, scope: !338)
!380 = !DILocation(line: 706, column: 20, scope: !338)
!381 = !DILocation(line: 706, column: 4, scope: !338)
!382 = !DILocation(line: 706, column: 11, scope: !338)
!383 = !DILocation(line: 707, column: 8, scope: !384)
!384 = distinct !DILexicalBlock(scope: !338, file: !14, line: 707, column: 8)
!385 = !DILocation(line: 707, column: 12, scope: !384)
!386 = !DILocation(line: 707, column: 8, scope: !338)
!387 = !DILocation(line: 708, column: 5, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !14, line: 707, column: 18)
!389 = !DILocation(line: 710, column: 11, scope: !338)
!390 = !DILocation(line: 710, column: 9, scope: !338)
!391 = !DILocation(line: 711, column: 13, scope: !338)
!392 = !DILocation(line: 712, column: 11, scope: !338)
!393 = !DILocation(line: 712, column: 16, scope: !338)
!394 = !DILocation(line: 712, column: 6, scope: !338)
!395 = !DILocation(line: 712, column: 31, scope: !338)
!396 = !DILocation(line: 711, column: 20, scope: !338)
!397 = !DILocation(line: 713, column: 11, scope: !338)
!398 = !DILocation(line: 713, column: 16, scope: !338)
!399 = !DILocation(line: 713, column: 23, scope: !338)
!400 = !DILocation(line: 713, column: 6, scope: !338)
!401 = !DILocation(line: 713, column: 31, scope: !338)
!402 = !DILocation(line: 712, column: 45, scope: !338)
!403 = !DILocation(line: 714, column: 11, scope: !338)
!404 = !DILocation(line: 714, column: 16, scope: !338)
!405 = !DILocation(line: 714, column: 23, scope: !338)
!406 = !DILocation(line: 714, column: 6, scope: !338)
!407 = !DILocation(line: 714, column: 31, scope: !338)
!408 = !DILocation(line: 713, column: 45, scope: !338)
!409 = !DILocation(line: 715, column: 11, scope: !338)
!410 = !DILocation(line: 715, column: 23, scope: !338)
!411 = !DILocation(line: 715, column: 6, scope: !338)
!412 = !DILocation(line: 715, column: 31, scope: !338)
!413 = !DILocation(line: 714, column: 45, scope: !338)
!414 = !DILocation(line: 711, column: 4, scope: !338)
!415 = !DILocation(line: 711, column: 11, scope: !338)
!416 = !DILocation(line: 716, column: 13, scope: !338)
!417 = !DILocation(line: 716, column: 22, scope: !338)
!418 = !DILocation(line: 716, column: 20, scope: !338)
!419 = !DILocation(line: 716, column: 4, scope: !338)
!420 = !DILocation(line: 716, column: 11, scope: !338)
!421 = !DILocation(line: 717, column: 13, scope: !338)
!422 = !DILocation(line: 717, column: 22, scope: !338)
!423 = !DILocation(line: 717, column: 20, scope: !338)
!424 = !DILocation(line: 717, column: 4, scope: !338)
!425 = !DILocation(line: 717, column: 11, scope: !338)
!426 = !DILocation(line: 718, column: 13, scope: !338)
!427 = !DILocation(line: 718, column: 22, scope: !338)
!428 = !DILocation(line: 718, column: 20, scope: !338)
!429 = !DILocation(line: 718, column: 4, scope: !338)
!430 = !DILocation(line: 718, column: 11, scope: !338)
!431 = !DILocation(line: 720, column: 7, scope: !338)
!432 = distinct !{!432, !335, !433}
!433 = !DILocation(line: 721, column: 10, scope: !336)
!434 = !DILocation(line: 723, column: 2, scope: !115)
!435 = !DILocation(line: 724, column: 1, scope: !115)
!436 = distinct !DISubprogram(name: "AES_encrypt", scope: !14, file: !14, line: 781, type: !437, isLocal: false, isDefinition: true, scopeLine: 782, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!437 = !DISubroutineType(types: !438)
!438 = !{null, !43, !65, !439}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64)
!440 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !120)
!441 = !DILocalVariable(name: "in", arg: 1, scope: !436, file: !14, line: 781, type: !43)
!442 = !DILocation(line: 781, column: 39, scope: !436)
!443 = !DILocalVariable(name: "out", arg: 2, scope: !436, file: !14, line: 781, type: !65)
!444 = !DILocation(line: 781, column: 58, scope: !436)
!445 = !DILocalVariable(name: "key", arg: 3, scope: !436, file: !14, line: 782, type: !439)
!446 = !DILocation(line: 782, column: 19, scope: !436)
!447 = !DILocalVariable(name: "rk", scope: !436, file: !14, line: 784, type: !448)
!448 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!449 = !DILocation(line: 784, column: 13, scope: !436)
!450 = !DILocalVariable(name: "s0", scope: !436, file: !14, line: 785, type: !6)
!451 = !DILocation(line: 785, column: 6, scope: !436)
!452 = !DILocalVariable(name: "s1", scope: !436, file: !14, line: 785, type: !6)
!453 = !DILocation(line: 785, column: 10, scope: !436)
!454 = !DILocalVariable(name: "s2", scope: !436, file: !14, line: 785, type: !6)
!455 = !DILocation(line: 785, column: 14, scope: !436)
!456 = !DILocalVariable(name: "s3", scope: !436, file: !14, line: 785, type: !6)
!457 = !DILocation(line: 785, column: 18, scope: !436)
!458 = !DILocalVariable(name: "t0", scope: !436, file: !14, line: 785, type: !6)
!459 = !DILocation(line: 785, column: 22, scope: !436)
!460 = !DILocalVariable(name: "t1", scope: !436, file: !14, line: 785, type: !6)
!461 = !DILocation(line: 785, column: 26, scope: !436)
!462 = !DILocalVariable(name: "t2", scope: !436, file: !14, line: 785, type: !6)
!463 = !DILocation(line: 785, column: 30, scope: !436)
!464 = !DILocalVariable(name: "t3", scope: !436, file: !14, line: 785, type: !6)
!465 = !DILocation(line: 785, column: 34, scope: !436)
!466 = !DILocalVariable(name: "r", scope: !436, file: !14, line: 787, type: !56)
!467 = !DILocation(line: 787, column: 6, scope: !436)
!468 = !DILocation(line: 791, column: 7, scope: !436)
!469 = !DILocation(line: 791, column: 12, scope: !436)
!470 = !DILocation(line: 791, column: 5, scope: !436)
!471 = !DILocation(line: 797, column: 7, scope: !436)
!472 = !DILocation(line: 797, column: 25, scope: !436)
!473 = !DILocation(line: 797, column: 23, scope: !436)
!474 = !DILocation(line: 797, column: 5, scope: !436)
!475 = !DILocation(line: 798, column: 7, scope: !436)
!476 = !DILocation(line: 798, column: 25, scope: !436)
!477 = !DILocation(line: 798, column: 23, scope: !436)
!478 = !DILocation(line: 798, column: 5, scope: !436)
!479 = !DILocation(line: 799, column: 7, scope: !436)
!480 = !DILocation(line: 799, column: 25, scope: !436)
!481 = !DILocation(line: 799, column: 23, scope: !436)
!482 = !DILocation(line: 799, column: 5, scope: !436)
!483 = !DILocation(line: 800, column: 7, scope: !436)
!484 = !DILocation(line: 800, column: 25, scope: !436)
!485 = !DILocation(line: 800, column: 23, scope: !436)
!486 = !DILocation(line: 800, column: 5, scope: !436)
!487 = !DILocation(line: 876, column: 9, scope: !436)
!488 = !DILocation(line: 876, column: 14, scope: !436)
!489 = !DILocation(line: 876, column: 21, scope: !436)
!490 = !DILocation(line: 876, column: 7, scope: !436)
!491 = !DILocation(line: 877, column: 5, scope: !436)
!492 = !DILocation(line: 879, column: 18, scope: !493)
!493 = distinct !DILexicalBlock(scope: !494, file: !14, line: 877, column: 14)
!494 = distinct !DILexicalBlock(scope: !495, file: !14, line: 877, column: 5)
!495 = distinct !DILexicalBlock(scope: !436, file: !14, line: 877, column: 5)
!496 = !DILocation(line: 879, column: 21, scope: !493)
!497 = !DILocation(line: 879, column: 13, scope: !493)
!498 = !DILocation(line: 880, column: 18, scope: !493)
!499 = !DILocation(line: 880, column: 21, scope: !493)
!500 = !DILocation(line: 880, column: 28, scope: !493)
!501 = !DILocation(line: 880, column: 13, scope: !493)
!502 = !DILocation(line: 879, column: 36, scope: !493)
!503 = !DILocation(line: 881, column: 18, scope: !493)
!504 = !DILocation(line: 881, column: 21, scope: !493)
!505 = !DILocation(line: 881, column: 28, scope: !493)
!506 = !DILocation(line: 881, column: 13, scope: !493)
!507 = !DILocation(line: 880, column: 36, scope: !493)
!508 = !DILocation(line: 882, column: 18, scope: !493)
!509 = !DILocation(line: 882, column: 28, scope: !493)
!510 = !DILocation(line: 882, column: 13, scope: !493)
!511 = !DILocation(line: 881, column: 36, scope: !493)
!512 = !DILocation(line: 883, column: 13, scope: !493)
!513 = !DILocation(line: 882, column: 36, scope: !493)
!514 = !DILocation(line: 878, column: 12, scope: !493)
!515 = !DILocation(line: 885, column: 18, scope: !493)
!516 = !DILocation(line: 885, column: 21, scope: !493)
!517 = !DILocation(line: 885, column: 13, scope: !493)
!518 = !DILocation(line: 886, column: 18, scope: !493)
!519 = !DILocation(line: 886, column: 21, scope: !493)
!520 = !DILocation(line: 886, column: 28, scope: !493)
!521 = !DILocation(line: 886, column: 13, scope: !493)
!522 = !DILocation(line: 885, column: 36, scope: !493)
!523 = !DILocation(line: 887, column: 18, scope: !493)
!524 = !DILocation(line: 887, column: 21, scope: !493)
!525 = !DILocation(line: 887, column: 28, scope: !493)
!526 = !DILocation(line: 887, column: 13, scope: !493)
!527 = !DILocation(line: 886, column: 36, scope: !493)
!528 = !DILocation(line: 888, column: 18, scope: !493)
!529 = !DILocation(line: 888, column: 28, scope: !493)
!530 = !DILocation(line: 888, column: 13, scope: !493)
!531 = !DILocation(line: 887, column: 36, scope: !493)
!532 = !DILocation(line: 889, column: 13, scope: !493)
!533 = !DILocation(line: 888, column: 36, scope: !493)
!534 = !DILocation(line: 884, column: 12, scope: !493)
!535 = !DILocation(line: 891, column: 18, scope: !493)
!536 = !DILocation(line: 891, column: 21, scope: !493)
!537 = !DILocation(line: 891, column: 13, scope: !493)
!538 = !DILocation(line: 892, column: 18, scope: !493)
!539 = !DILocation(line: 892, column: 21, scope: !493)
!540 = !DILocation(line: 892, column: 28, scope: !493)
!541 = !DILocation(line: 892, column: 13, scope: !493)
!542 = !DILocation(line: 891, column: 36, scope: !493)
!543 = !DILocation(line: 893, column: 18, scope: !493)
!544 = !DILocation(line: 893, column: 21, scope: !493)
!545 = !DILocation(line: 893, column: 28, scope: !493)
!546 = !DILocation(line: 893, column: 13, scope: !493)
!547 = !DILocation(line: 892, column: 36, scope: !493)
!548 = !DILocation(line: 894, column: 18, scope: !493)
!549 = !DILocation(line: 894, column: 28, scope: !493)
!550 = !DILocation(line: 894, column: 13, scope: !493)
!551 = !DILocation(line: 893, column: 36, scope: !493)
!552 = !DILocation(line: 895, column: 13, scope: !493)
!553 = !DILocation(line: 894, column: 36, scope: !493)
!554 = !DILocation(line: 890, column: 12, scope: !493)
!555 = !DILocation(line: 897, column: 18, scope: !493)
!556 = !DILocation(line: 897, column: 21, scope: !493)
!557 = !DILocation(line: 897, column: 13, scope: !493)
!558 = !DILocation(line: 898, column: 18, scope: !493)
!559 = !DILocation(line: 898, column: 21, scope: !493)
!560 = !DILocation(line: 898, column: 28, scope: !493)
!561 = !DILocation(line: 898, column: 13, scope: !493)
!562 = !DILocation(line: 897, column: 36, scope: !493)
!563 = !DILocation(line: 899, column: 18, scope: !493)
!564 = !DILocation(line: 899, column: 21, scope: !493)
!565 = !DILocation(line: 899, column: 28, scope: !493)
!566 = !DILocation(line: 899, column: 13, scope: !493)
!567 = !DILocation(line: 898, column: 36, scope: !493)
!568 = !DILocation(line: 900, column: 18, scope: !493)
!569 = !DILocation(line: 900, column: 28, scope: !493)
!570 = !DILocation(line: 900, column: 13, scope: !493)
!571 = !DILocation(line: 899, column: 36, scope: !493)
!572 = !DILocation(line: 901, column: 13, scope: !493)
!573 = !DILocation(line: 900, column: 36, scope: !493)
!574 = !DILocation(line: 896, column: 12, scope: !493)
!575 = !DILocation(line: 903, column: 12, scope: !493)
!576 = !DILocation(line: 904, column: 13, scope: !577)
!577 = distinct !DILexicalBlock(scope: !493, file: !14, line: 904, column: 13)
!578 = !DILocation(line: 904, column: 17, scope: !577)
!579 = !DILocation(line: 904, column: 13, scope: !493)
!580 = !DILocation(line: 905, column: 13, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !14, line: 904, column: 23)
!582 = !DILocation(line: 909, column: 18, scope: !493)
!583 = !DILocation(line: 909, column: 21, scope: !493)
!584 = !DILocation(line: 909, column: 13, scope: !493)
!585 = !DILocation(line: 910, column: 18, scope: !493)
!586 = !DILocation(line: 910, column: 21, scope: !493)
!587 = !DILocation(line: 910, column: 28, scope: !493)
!588 = !DILocation(line: 910, column: 13, scope: !493)
!589 = !DILocation(line: 909, column: 36, scope: !493)
!590 = !DILocation(line: 911, column: 18, scope: !493)
!591 = !DILocation(line: 911, column: 21, scope: !493)
!592 = !DILocation(line: 911, column: 28, scope: !493)
!593 = !DILocation(line: 911, column: 13, scope: !493)
!594 = !DILocation(line: 910, column: 36, scope: !493)
!595 = !DILocation(line: 912, column: 18, scope: !493)
!596 = !DILocation(line: 912, column: 28, scope: !493)
!597 = !DILocation(line: 912, column: 13, scope: !493)
!598 = !DILocation(line: 911, column: 36, scope: !493)
!599 = !DILocation(line: 913, column: 13, scope: !493)
!600 = !DILocation(line: 912, column: 36, scope: !493)
!601 = !DILocation(line: 908, column: 12, scope: !493)
!602 = !DILocation(line: 915, column: 18, scope: !493)
!603 = !DILocation(line: 915, column: 21, scope: !493)
!604 = !DILocation(line: 915, column: 13, scope: !493)
!605 = !DILocation(line: 916, column: 18, scope: !493)
!606 = !DILocation(line: 916, column: 21, scope: !493)
!607 = !DILocation(line: 916, column: 28, scope: !493)
!608 = !DILocation(line: 916, column: 13, scope: !493)
!609 = !DILocation(line: 915, column: 36, scope: !493)
!610 = !DILocation(line: 917, column: 18, scope: !493)
!611 = !DILocation(line: 917, column: 21, scope: !493)
!612 = !DILocation(line: 917, column: 28, scope: !493)
!613 = !DILocation(line: 917, column: 13, scope: !493)
!614 = !DILocation(line: 916, column: 36, scope: !493)
!615 = !DILocation(line: 918, column: 18, scope: !493)
!616 = !DILocation(line: 918, column: 28, scope: !493)
!617 = !DILocation(line: 918, column: 13, scope: !493)
!618 = !DILocation(line: 917, column: 36, scope: !493)
!619 = !DILocation(line: 919, column: 13, scope: !493)
!620 = !DILocation(line: 918, column: 36, scope: !493)
!621 = !DILocation(line: 914, column: 12, scope: !493)
!622 = !DILocation(line: 921, column: 18, scope: !493)
!623 = !DILocation(line: 921, column: 21, scope: !493)
!624 = !DILocation(line: 921, column: 13, scope: !493)
!625 = !DILocation(line: 922, column: 18, scope: !493)
!626 = !DILocation(line: 922, column: 21, scope: !493)
!627 = !DILocation(line: 922, column: 28, scope: !493)
!628 = !DILocation(line: 922, column: 13, scope: !493)
!629 = !DILocation(line: 921, column: 36, scope: !493)
!630 = !DILocation(line: 923, column: 18, scope: !493)
!631 = !DILocation(line: 923, column: 21, scope: !493)
!632 = !DILocation(line: 923, column: 28, scope: !493)
!633 = !DILocation(line: 923, column: 13, scope: !493)
!634 = !DILocation(line: 922, column: 36, scope: !493)
!635 = !DILocation(line: 924, column: 18, scope: !493)
!636 = !DILocation(line: 924, column: 28, scope: !493)
!637 = !DILocation(line: 924, column: 13, scope: !493)
!638 = !DILocation(line: 923, column: 36, scope: !493)
!639 = !DILocation(line: 925, column: 13, scope: !493)
!640 = !DILocation(line: 924, column: 36, scope: !493)
!641 = !DILocation(line: 920, column: 12, scope: !493)
!642 = !DILocation(line: 927, column: 18, scope: !493)
!643 = !DILocation(line: 927, column: 21, scope: !493)
!644 = !DILocation(line: 927, column: 13, scope: !493)
!645 = !DILocation(line: 928, column: 18, scope: !493)
!646 = !DILocation(line: 928, column: 21, scope: !493)
!647 = !DILocation(line: 928, column: 28, scope: !493)
!648 = !DILocation(line: 928, column: 13, scope: !493)
!649 = !DILocation(line: 927, column: 36, scope: !493)
!650 = !DILocation(line: 929, column: 18, scope: !493)
!651 = !DILocation(line: 929, column: 21, scope: !493)
!652 = !DILocation(line: 929, column: 28, scope: !493)
!653 = !DILocation(line: 929, column: 13, scope: !493)
!654 = !DILocation(line: 928, column: 36, scope: !493)
!655 = !DILocation(line: 930, column: 18, scope: !493)
!656 = !DILocation(line: 930, column: 28, scope: !493)
!657 = !DILocation(line: 930, column: 13, scope: !493)
!658 = !DILocation(line: 929, column: 36, scope: !493)
!659 = !DILocation(line: 931, column: 13, scope: !493)
!660 = !DILocation(line: 930, column: 36, scope: !493)
!661 = !DILocation(line: 926, column: 12, scope: !493)
!662 = !DILocation(line: 877, column: 5, scope: !494)
!663 = distinct !{!663, !664, !665}
!664 = !DILocation(line: 877, column: 5, scope: !495)
!665 = !DILocation(line: 932, column: 5, scope: !495)
!666 = !DILocation(line: 939, column: 9, scope: !436)
!667 = !DILocation(line: 939, column: 12, scope: !436)
!668 = !DILocation(line: 939, column: 4, scope: !436)
!669 = !DILocation(line: 939, column: 27, scope: !436)
!670 = !DILocation(line: 940, column: 9, scope: !436)
!671 = !DILocation(line: 940, column: 12, scope: !436)
!672 = !DILocation(line: 940, column: 19, scope: !436)
!673 = !DILocation(line: 940, column: 4, scope: !436)
!674 = !DILocation(line: 940, column: 27, scope: !436)
!675 = !DILocation(line: 939, column: 41, scope: !436)
!676 = !DILocation(line: 941, column: 9, scope: !436)
!677 = !DILocation(line: 941, column: 12, scope: !436)
!678 = !DILocation(line: 941, column: 19, scope: !436)
!679 = !DILocation(line: 941, column: 4, scope: !436)
!680 = !DILocation(line: 941, column: 27, scope: !436)
!681 = !DILocation(line: 940, column: 41, scope: !436)
!682 = !DILocation(line: 942, column: 9, scope: !436)
!683 = !DILocation(line: 942, column: 19, scope: !436)
!684 = !DILocation(line: 942, column: 4, scope: !436)
!685 = !DILocation(line: 942, column: 27, scope: !436)
!686 = !DILocation(line: 941, column: 41, scope: !436)
!687 = !DILocation(line: 943, column: 3, scope: !436)
!688 = !DILocation(line: 942, column: 41, scope: !436)
!689 = !DILocation(line: 938, column: 5, scope: !436)
!690 = !DILocation(line: 944, column: 2, scope: !691)
!691 = distinct !DILexicalBlock(scope: !436, file: !14, line: 944, column: 2)
!692 = !DILocation(line: 946, column: 9, scope: !436)
!693 = !DILocation(line: 946, column: 12, scope: !436)
!694 = !DILocation(line: 946, column: 4, scope: !436)
!695 = !DILocation(line: 946, column: 27, scope: !436)
!696 = !DILocation(line: 947, column: 9, scope: !436)
!697 = !DILocation(line: 947, column: 12, scope: !436)
!698 = !DILocation(line: 947, column: 19, scope: !436)
!699 = !DILocation(line: 947, column: 4, scope: !436)
!700 = !DILocation(line: 947, column: 27, scope: !436)
!701 = !DILocation(line: 946, column: 41, scope: !436)
!702 = !DILocation(line: 948, column: 9, scope: !436)
!703 = !DILocation(line: 948, column: 12, scope: !436)
!704 = !DILocation(line: 948, column: 19, scope: !436)
!705 = !DILocation(line: 948, column: 4, scope: !436)
!706 = !DILocation(line: 948, column: 27, scope: !436)
!707 = !DILocation(line: 947, column: 41, scope: !436)
!708 = !DILocation(line: 949, column: 9, scope: !436)
!709 = !DILocation(line: 949, column: 19, scope: !436)
!710 = !DILocation(line: 949, column: 4, scope: !436)
!711 = !DILocation(line: 949, column: 27, scope: !436)
!712 = !DILocation(line: 948, column: 41, scope: !436)
!713 = !DILocation(line: 950, column: 3, scope: !436)
!714 = !DILocation(line: 949, column: 41, scope: !436)
!715 = !DILocation(line: 945, column: 5, scope: !436)
!716 = !DILocation(line: 951, column: 2, scope: !717)
!717 = distinct !DILexicalBlock(scope: !436, file: !14, line: 951, column: 2)
!718 = !DILocation(line: 953, column: 9, scope: !436)
!719 = !DILocation(line: 953, column: 12, scope: !436)
!720 = !DILocation(line: 953, column: 4, scope: !436)
!721 = !DILocation(line: 953, column: 27, scope: !436)
!722 = !DILocation(line: 954, column: 9, scope: !436)
!723 = !DILocation(line: 954, column: 12, scope: !436)
!724 = !DILocation(line: 954, column: 19, scope: !436)
!725 = !DILocation(line: 954, column: 4, scope: !436)
!726 = !DILocation(line: 954, column: 27, scope: !436)
!727 = !DILocation(line: 953, column: 41, scope: !436)
!728 = !DILocation(line: 955, column: 9, scope: !436)
!729 = !DILocation(line: 955, column: 12, scope: !436)
!730 = !DILocation(line: 955, column: 19, scope: !436)
!731 = !DILocation(line: 955, column: 4, scope: !436)
!732 = !DILocation(line: 955, column: 27, scope: !436)
!733 = !DILocation(line: 954, column: 41, scope: !436)
!734 = !DILocation(line: 956, column: 9, scope: !436)
!735 = !DILocation(line: 956, column: 19, scope: !436)
!736 = !DILocation(line: 956, column: 4, scope: !436)
!737 = !DILocation(line: 956, column: 27, scope: !436)
!738 = !DILocation(line: 955, column: 41, scope: !436)
!739 = !DILocation(line: 957, column: 3, scope: !436)
!740 = !DILocation(line: 956, column: 41, scope: !436)
!741 = !DILocation(line: 952, column: 5, scope: !436)
!742 = !DILocation(line: 958, column: 2, scope: !743)
!743 = distinct !DILexicalBlock(scope: !436, file: !14, line: 958, column: 2)
!744 = !DILocation(line: 960, column: 9, scope: !436)
!745 = !DILocation(line: 960, column: 12, scope: !436)
!746 = !DILocation(line: 960, column: 4, scope: !436)
!747 = !DILocation(line: 960, column: 27, scope: !436)
!748 = !DILocation(line: 961, column: 9, scope: !436)
!749 = !DILocation(line: 961, column: 12, scope: !436)
!750 = !DILocation(line: 961, column: 19, scope: !436)
!751 = !DILocation(line: 961, column: 4, scope: !436)
!752 = !DILocation(line: 961, column: 27, scope: !436)
!753 = !DILocation(line: 960, column: 41, scope: !436)
!754 = !DILocation(line: 962, column: 9, scope: !436)
!755 = !DILocation(line: 962, column: 12, scope: !436)
!756 = !DILocation(line: 962, column: 19, scope: !436)
!757 = !DILocation(line: 962, column: 4, scope: !436)
!758 = !DILocation(line: 962, column: 27, scope: !436)
!759 = !DILocation(line: 961, column: 41, scope: !436)
!760 = !DILocation(line: 963, column: 9, scope: !436)
!761 = !DILocation(line: 963, column: 19, scope: !436)
!762 = !DILocation(line: 963, column: 4, scope: !436)
!763 = !DILocation(line: 963, column: 27, scope: !436)
!764 = !DILocation(line: 962, column: 41, scope: !436)
!765 = !DILocation(line: 964, column: 3, scope: !436)
!766 = !DILocation(line: 963, column: 41, scope: !436)
!767 = !DILocation(line: 959, column: 5, scope: !436)
!768 = !DILocation(line: 965, column: 2, scope: !769)
!769 = distinct !DILexicalBlock(scope: !436, file: !14, line: 965, column: 2)
!770 = !DILocation(line: 966, column: 1, scope: !436)
!771 = distinct !DISubprogram(name: "AES_ofb128_encrypt", scope: !772, file: !772, line: 55, type: !773, isLocal: false, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !57, variables: !4)
!772 = !DIFile(filename: "./openssl/crypto/aes/aes_ofb.c", directory: "/home/klee/shareddir")
!773 = !DISubroutineType(types: !774)
!774 = !{null, !43, !65, !72, !775, !65, !102}
!775 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !776, size: 64)
!776 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !777)
!777 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES_KEY", file: !48, line: 84, baseType: !778)
!778 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aes_key_st", file: !48, line: 76, size: 1952, elements: !779)
!779 = !{!780, !781}
!780 = !DIDerivedType(tag: DW_TAG_member, name: "rd_key", scope: !778, file: !48, line: 80, baseType: !52, size: 1920)
!781 = !DIDerivedType(tag: DW_TAG_member, name: "rounds", scope: !778, file: !48, line: 82, baseType: !56, size: 32, offset: 1920)
!782 = !DILocalVariable(name: "in", arg: 1, scope: !771, file: !772, line: 55, type: !43)
!783 = !DILocation(line: 55, column: 46, scope: !771)
!784 = !DILocalVariable(name: "out", arg: 2, scope: !771, file: !772, line: 55, type: !65)
!785 = !DILocation(line: 55, column: 65, scope: !771)
!786 = !DILocalVariable(name: "length", arg: 3, scope: !771, file: !772, line: 56, type: !72)
!787 = !DILocation(line: 56, column: 9, scope: !771)
!788 = !DILocalVariable(name: "key", arg: 4, scope: !771, file: !772, line: 56, type: !775)
!789 = !DILocation(line: 56, column: 32, scope: !771)
!790 = !DILocalVariable(name: "ivec", arg: 5, scope: !771, file: !772, line: 57, type: !65)
!791 = !DILocation(line: 57, column: 17, scope: !771)
!792 = !DILocalVariable(name: "num", arg: 6, scope: !771, file: !772, line: 57, type: !102)
!793 = !DILocation(line: 57, column: 28, scope: !771)
!794 = !DILocation(line: 59, column: 24, scope: !771)
!795 = !DILocation(line: 59, column: 27, scope: !771)
!796 = !DILocation(line: 59, column: 31, scope: !771)
!797 = !DILocation(line: 59, column: 38, scope: !771)
!798 = !DILocation(line: 59, column: 42, scope: !771)
!799 = !DILocation(line: 59, column: 47, scope: !771)
!800 = !DILocation(line: 59, column: 2, scope: !771)
!801 = !DILocation(line: 60, column: 1, scope: !771)
!802 = distinct !DISubprogram(name: "CRYPTO_ofb128_encrypt", scope: !69, file: !69, line: 73, type: !803, isLocal: false, isDefinition: true, scopeLine: 77, flags: DIFlagPrototyped, isOptimized: false, unit: !68, variables: !4)
!803 = !DISubroutineType(types: !804)
!804 = !{null, !43, !65, !72, !66, !65, !102, !805}
!805 = !DIDerivedType(tag: DW_TAG_typedef, name: "block128_f", file: !806, line: 10, baseType: !62)
!806 = !DIFile(filename: "./openssl/crypto/modes/modes.h", directory: "/home/klee/shareddir")
!807 = !DILocalVariable(name: "in", arg: 1, scope: !802, file: !69, line: 73, type: !43)
!808 = !DILocation(line: 73, column: 49, scope: !802)
!809 = !DILocalVariable(name: "out", arg: 2, scope: !802, file: !69, line: 73, type: !65)
!810 = !DILocation(line: 73, column: 68, scope: !802)
!811 = !DILocalVariable(name: "len", arg: 3, scope: !802, file: !69, line: 74, type: !72)
!812 = !DILocation(line: 74, column: 11, scope: !802)
!813 = !DILocalVariable(name: "key", arg: 4, scope: !802, file: !69, line: 74, type: !66)
!814 = !DILocation(line: 74, column: 28, scope: !802)
!815 = !DILocalVariable(name: "ivec", arg: 5, scope: !802, file: !69, line: 75, type: !65)
!816 = !DILocation(line: 75, column: 18, scope: !802)
!817 = !DILocalVariable(name: "num", arg: 6, scope: !802, file: !69, line: 75, type: !102)
!818 = !DILocation(line: 75, column: 33, scope: !802)
!819 = !DILocalVariable(name: "block", arg: 7, scope: !802, file: !69, line: 76, type: !805)
!820 = !DILocation(line: 76, column: 15, scope: !802)
!821 = !DILocalVariable(name: "n", scope: !802, file: !69, line: 78, type: !8)
!822 = !DILocation(line: 78, column: 15, scope: !802)
!823 = !DILocalVariable(name: "l", scope: !802, file: !69, line: 79, type: !72)
!824 = !DILocation(line: 79, column: 9, scope: !802)
!825 = !DILocation(line: 83, column: 7, scope: !802)
!826 = !DILocation(line: 83, column: 6, scope: !802)
!827 = !DILocation(line: 83, column: 4, scope: !802)
!828 = !DILocation(line: 86, column: 30, scope: !829)
!829 = distinct !DILexicalBlock(scope: !802, file: !69, line: 86, column: 6)
!830 = distinct !{!830, !828, !831}
!831 = !DILocation(line: 115, column: 11, scope: !829)
!832 = !DILocation(line: 87, column: 3, scope: !833)
!833 = distinct !DILexicalBlock(scope: !829, file: !69, line: 86, column: 33)
!834 = !DILocation(line: 87, column: 10, scope: !833)
!835 = !DILocation(line: 87, column: 12, scope: !833)
!836 = !DILocation(line: 87, column: 15, scope: !833)
!837 = !DILocation(line: 88, column: 19, scope: !838)
!838 = distinct !DILexicalBlock(scope: !833, file: !69, line: 87, column: 20)
!839 = !DILocation(line: 88, column: 15, scope: !838)
!840 = !DILocation(line: 88, column: 25, scope: !838)
!841 = !DILocation(line: 88, column: 30, scope: !838)
!842 = !DILocation(line: 88, column: 23, scope: !838)
!843 = !DILocation(line: 88, column: 9, scope: !838)
!844 = !DILocation(line: 88, column: 13, scope: !838)
!845 = !DILocation(line: 89, column: 4, scope: !838)
!846 = !DILocation(line: 90, column: 9, scope: !838)
!847 = !DILocation(line: 90, column: 10, scope: !838)
!848 = !DILocation(line: 90, column: 14, scope: !838)
!849 = !DILocation(line: 90, column: 6, scope: !838)
!850 = distinct !{!850, !832, !851}
!851 = !DILocation(line: 91, column: 3, scope: !833)
!852 = !DILocation(line: 96, column: 3, scope: !833)
!853 = !DILocation(line: 96, column: 10, scope: !833)
!854 = !DILocation(line: 96, column: 13, scope: !833)
!855 = !DILocation(line: 97, column: 6, scope: !856)
!856 = distinct !DILexicalBlock(scope: !833, file: !69, line: 96, column: 19)
!857 = !DILocation(line: 97, column: 13, scope: !856)
!858 = !DILocation(line: 97, column: 19, scope: !856)
!859 = !DILocation(line: 97, column: 25, scope: !856)
!860 = !DILocation(line: 97, column: 4, scope: !856)
!861 = !DILocation(line: 98, column: 10, scope: !862)
!862 = distinct !DILexicalBlock(scope: !856, file: !69, line: 98, column: 4)
!863 = !DILocation(line: 98, column: 9, scope: !862)
!864 = !DILocation(line: 98, column: 14, scope: !865)
!865 = distinct !DILexicalBlock(scope: !862, file: !69, line: 98, column: 4)
!866 = !DILocation(line: 98, column: 15, scope: !865)
!867 = !DILocation(line: 98, column: 4, scope: !862)
!868 = !DILocation(line: 100, column: 16, scope: !865)
!869 = !DILocation(line: 100, column: 19, scope: !865)
!870 = !DILocation(line: 100, column: 18, scope: !865)
!871 = !DILocation(line: 100, column: 5, scope: !865)
!872 = !DILocation(line: 100, column: 35, scope: !865)
!873 = !DILocation(line: 100, column: 40, scope: !865)
!874 = !DILocation(line: 100, column: 39, scope: !865)
!875 = !DILocation(line: 100, column: 24, scope: !865)
!876 = !DILocation(line: 100, column: 22, scope: !865)
!877 = !DILocation(line: 99, column: 16, scope: !865)
!878 = !DILocation(line: 99, column: 20, scope: !865)
!879 = !DILocation(line: 99, column: 19, scope: !865)
!880 = !DILocation(line: 99, column: 5, scope: !865)
!881 = !DILocation(line: 99, column: 23, scope: !865)
!882 = !DILocation(line: 98, column: 21, scope: !865)
!883 = !DILocation(line: 98, column: 4, scope: !865)
!884 = distinct !{!884, !867, !885}
!885 = !DILocation(line: 100, column: 41, scope: !862)
!886 = !DILocation(line: 101, column: 8, scope: !856)
!887 = !DILocation(line: 102, column: 8, scope: !856)
!888 = !DILocation(line: 103, column: 8, scope: !856)
!889 = distinct !{!889, !852, !890}
!890 = !DILocation(line: 104, column: 3, scope: !833)
!891 = !DILocation(line: 105, column: 5, scope: !833)
!892 = !DILocation(line: 106, column: 7, scope: !893)
!893 = distinct !DILexicalBlock(scope: !833, file: !69, line: 106, column: 7)
!894 = !DILocation(line: 106, column: 7, scope: !833)
!895 = !DILocation(line: 107, column: 6, scope: !896)
!896 = distinct !DILexicalBlock(scope: !893, file: !69, line: 106, column: 12)
!897 = !DILocation(line: 107, column: 13, scope: !896)
!898 = !DILocation(line: 107, column: 19, scope: !896)
!899 = !DILocation(line: 107, column: 25, scope: !896)
!900 = !DILocation(line: 107, column: 4, scope: !896)
!901 = !DILocation(line: 108, column: 4, scope: !896)
!902 = !DILocation(line: 108, column: 14, scope: !896)
!903 = !DILocation(line: 109, column: 14, scope: !904)
!904 = distinct !DILexicalBlock(scope: !896, file: !69, line: 108, column: 18)
!905 = !DILocation(line: 109, column: 17, scope: !904)
!906 = !DILocation(line: 109, column: 22, scope: !904)
!907 = !DILocation(line: 109, column: 27, scope: !904)
!908 = !DILocation(line: 109, column: 20, scope: !904)
!909 = !DILocation(line: 109, column: 5, scope: !904)
!910 = !DILocation(line: 109, column: 9, scope: !904)
!911 = !DILocation(line: 109, column: 12, scope: !904)
!912 = !DILocation(line: 110, column: 5, scope: !904)
!913 = distinct !{!913, !901, !914}
!914 = !DILocation(line: 111, column: 4, scope: !896)
!915 = !DILocation(line: 112, column: 3, scope: !896)
!916 = !DILocation(line: 113, column: 10, scope: !833)
!917 = !DILocation(line: 113, column: 4, scope: !833)
!918 = !DILocation(line: 113, column: 8, scope: !833)
!919 = !DILocation(line: 114, column: 3, scope: !833)
!920 = !DILocation(line: 128, column: 1, scope: !802)
!921 = distinct !DISubprogram(name: "memcpy", scope: !76, file: !76, line: 12, type: !922, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, unit: !75, variables: !4)
!922 = !DISubroutineType(types: !923)
!923 = !{!924, !924, !66, !925}
!924 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!925 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !926, line: 62, baseType: !74)
!926 = !DIFile(filename: "/usr/lib/llvm-6.0/lib/clang/6.0.0/include/stddef.h", directory: "/home/klee/kleespectre/klee/build/runtime/FreeStanding")
!927 = !DILocalVariable(name: "destaddr", arg: 1, scope: !921, file: !76, line: 12, type: !924)
!928 = !DILocation(line: 12, column: 20, scope: !921)
!929 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !921, file: !76, line: 12, type: !66)
!930 = !DILocation(line: 12, column: 42, scope: !921)
!931 = !DILocalVariable(name: "len", arg: 3, scope: !921, file: !76, line: 12, type: !925)
!932 = !DILocation(line: 12, column: 58, scope: !921)
!933 = !DILocalVariable(name: "dest", scope: !921, file: !76, line: 13, type: !934)
!934 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !935, size: 64)
!935 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!936 = !DILocation(line: 13, column: 9, scope: !921)
!937 = !DILocalVariable(name: "src", scope: !921, file: !76, line: 14, type: !938)
!938 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !939, size: 64)
!939 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !935)
!940 = !DILocation(line: 14, column: 15, scope: !921)
!941 = !DILocation(line: 16, column: 16, scope: !921)
!942 = !DILocation(line: 16, column: 3, scope: !921)
!943 = !DILocation(line: 16, column: 13, scope: !921)
!944 = !DILocation(line: 17, column: 19, scope: !921)
!945 = !DILocation(line: 17, column: 15, scope: !921)
!946 = !DILocation(line: 17, column: 10, scope: !921)
!947 = !DILocation(line: 17, column: 13, scope: !921)
!948 = distinct !{!948, !942, !944}
!949 = !DILocation(line: 18, column: 3, scope: !921)
