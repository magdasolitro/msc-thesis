; ModuleID = './testing_AES_CTR.bc'
source_filename = "testing_AES_Ctr.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon.5 = type { i64 }
%struct.aes_key_st = type { [60 x i32], i32 }

@main.in = private unnamed_addr constant [16 x i8] c"Hello, world!\00\00\00", align 16
@main.key = private unnamed_addr constant [16 x i8] c"\00\11\223DUfw\88\99\AA\BB\CC\DD\EE\FF", align 16
@.str = private unnamed_addr constant [5 x i8] c"ivec\00", align 1
@Te2 = internal unnamed_addr constant [256 x i32] [i32 1671808611, i32 2089089148, i32 2006576759, i32 2072901243, i32 -233963534, i32 1807603307, i32 1873927791, i32 -984313403, i32 810573872, i32 16974337, i32 1739181671, i32 729634347, i32 -31856642, i32 -681396777, i32 -1410970197, i32 1989864566, i32 -901410870, i32 -2103631998, i32 -918517303, i32 2106063485, i32 -99225606, i32 1508618841, i32 1204391495, i32 -267650064, i32 -1377025619, i32 -731401260, i32 -1560453214, i32 -1343601233, i32 -1665195108, i32 -1527295068, i32 1922491506, i32 -1067738176, i32 -1211992649, i32 -48438787, i32 -1817297517, i32 644500518, i32 911895606, i32 1061256767, i32 -150800905, i32 -867204148, i32 878471220, i32 -1510714971, i32 -449523227, i32 -251069967, i32 1905517169, i32 -663508008, i32 827548209, i32 356461077, i32 67897348, i32 -950889017, i32 593839651, i32 -1017209405, i32 405286936, i32 -1767819370, i32 84871685, i32 -1699401830, i32 118033927, i32 305538066, i32 -2137318528, i32 -499261470, i32 -349778453, i32 661212711, i32 -1295155278, i32 1973414517, i32 152769033, i32 -2086789757, i32 745822252, i32 439235610, i32 455947803, i32 1857215598, i32 1525593178, i32 -1594139744, i32 1391895634, i32 994932283, i32 -698239018, i32 -1278313037, i32 695947817, i32 -482419229, i32 795958831, i32 -2070473852, i32 1408607827, i32 -781665839, i32 0, i32 -315833875, i32 543178784, i32 -65018884, i32 -1312261711, i32 1542305371, i32 1790891114, i32 -884568629, i32 -1093048386, i32 961245753, i32 1256100938, i32 1289001036, i32 1491644504, i32 -817199665, i32 -798245936, i32 -282409489, i32 -1427812438, i32 -82383365, i32 1137018435, i32 1305975373, i32 861234739, i32 -2053893755, i32 1171229253, i32 -116332039, i32 33948674, i32 2139225727, i32 1357946960, i32 1011120188, i32 -1615190625, i32 -1461498968, i32 1374921297, i32 -1543610973, i32 1086357568, i32 -1886780017, i32 -1834139758, i32 -1648615011, i32 944271416, i32 -184225291, i32 -1126210628, i32 -1228834890, i32 -629821478, i32 560153121, i32 271589392, i32 -15014401, i32 -217121293, i32 -764559406, i32 -850624051, i32 202643468, i32 322250259, i32 -332413972, i32 1608629855, i32 -1750977129, i32 1154254916, i32 389623319, i32 -1000893500, i32 -1477290585, i32 2122513534, i32 1028094525, i32 1689045092, i32 1575467613, i32 422261273, i32 1939203699, i32 1621147744, i32 -2120738431, i32 1339137615, i32 -595614756, i32 577127458, i32 712922154, i32 -1867826288, i32 -2004677752, i32 1187679302, i32 -299251730, i32 -1194103880, i32 339486740, i32 -562452514, i32 1591917662, i32 186455563, i32 -612979237, i32 -532948000, i32 844522546, i32 978220090, i32 169743370, i32 1239126601, i32 101321734, i32 611076132, i32 1558493276, i32 -1034051646, i32 -747717165, i32 -1393605716, i32 1655096418, i32 -1851246191, i32 -1784401515, i32 -466103324, i32 2039214713, i32 -416098841, i32 -935097400, i32 928607799, i32 1840765549, i32 -1920204403, i32 -714821163, i32 1322425422, i32 -1444918871, i32 1823791212, i32 1459268694, i32 -200805388, i32 -366620694, i32 1706019429, i32 2056189050, i32 -1360443474, i32 135794696, i32 -1160417350, i32 2022240376, i32 628050469, i32 779246638, i32 472135708, i32 -1494132826, i32 -1261997132, i32 -967731258, i32 -400307224, i32 -579034659, i32 1956440180, i32 522272287, i32 1272813131, i32 -1109630531, i32 -1954148981, i32 -1970991222, i32 1888542832, i32 1044544574, i32 -1245417035, i32 1722469478, i32 1222152264, i32 50660867, i32 -167643146, i32 236067854, i32 1638122081, i32 895445557, i32 1475980887, i32 -1177523783, i32 -2037311610, i32 -1051158079, i32 489110045, i32 -1632032866, i32 -516367903, i32 -132912136, i32 -1733088360, i32 288563729, i32 1773916777, i32 -646927911, i32 -1903622258, i32 -1800981612, i32 -1682559589, i32 505560094, i32 -2020469369, i32 -383727127, i32 -834041906, i32 1442818645, i32 678973480, i32 -545610273, i32 -1936784500, i32 -1577559647, i32 -1988097655, i32 219617805, i32 -1076206145, i32 -432941082, i32 1120306242, i32 1756942440, i32 1103331905, i32 -1716508263, i32 762796589, i32 252780047, i32 -1328841808, i32 1425844308, i32 -1143575109, i32 372911126], align 16, !dbg !0
@Te3 = internal unnamed_addr constant [256 x i32] [i32 1667474886, i32 2088535288, i32 2004326894, i32 2071694838, i32 -219017729, i32 1802223062, i32 1869591006, i32 -976923503, i32 808472672, i32 16843522, i32 1734846926, i32 724270422, i32 -16901657, i32 -673750347, i32 -1414797747, i32 1987484396, i32 -892713585, i32 -2105369313, i32 -909557623, i32 2105378810, i32 -84273681, i32 1499065266, i32 1195886990, i32 -252703749, i32 -1381110719, i32 -724277325, i32 -1566376609, i32 -1347425723, i32 -1667449053, i32 -1532692653, i32 1920112356, i32 -1061135461, i32 -1212693899, i32 -33743647, i32 -1819038147, i32 640051788, i32 909531756, i32 1061110142, i32 -134806795, i32 -859025533, i32 875846760, i32 -1515850671, i32 -437963567, i32 -235861767, i32 1903268834, i32 -656903253, i32 825316194, i32 353713962, i32 67374088, i32 -943238507, i32 589522246, i32 -1010606435, i32 404236336, i32 -1768513225, i32 84217610, i32 -1701137105, i32 117901582, i32 303183396, i32 -2139055333, i32 -488489505, i32 -336910643, i32 656894286, i32 -1296904833, i32 1970642922, i32 151591698, i32 -2088526307, i32 741110872, i32 437923380, i32 454765878, i32 1852748508, i32 1515908788, i32 -1600062629, i32 1381168804, i32 993742198, i32 -690593353, i32 -1280061827, i32 690584402, i32 -471646499, i32 791638366, i32 -2071685357, i32 1398011302, i32 -774805319, i32 0, i32 -303223615, i32 538992704, i32 -50585629, i32 -1313748871, i32 1532751286, i32 1785380564, i32 -875870579, i32 -1094788761, i32 960056178, i32 1246420628, i32 1280103576, i32 1482221744, i32 -808498555, i32 -791647301, i32 -269538619, i32 -1431640753, i32 -67430675, i32 1128514950, i32 1296947098, i32 859002214, i32 -2054843375, i32 1162203018, i32 -101117719, i32 33687044, i32 2139062782, i32 1347481760, i32 1010582648, i32 -1616922075, i32 -1465326773, i32 1364325282, i32 -1549533603, i32 1077985408, i32 -1886418427, i32 -1835881153, i32 -1650607071, i32 943212656, i32 -168491791, i32 -1128472733, i32 -1229536905, i32 -623217233, i32 555836226, i32 269496352, i32 -58651, i32 -202174723, i32 -757961281, i32 -842183551, i32 202118168, i32 320025894, i32 -320065597, i32 1600119230, i32 -1751670219, i32 1145359496, i32 387397934, i32 -993765485, i32 -1482165675, i32 2122220284, i32 1027426170, i32 1684319432, i32 1566435258, i32 421079858, i32 1936954854, i32 1616945344, i32 -2122213351, i32 1330631070, i32 -589529181, i32 572679748, i32 707427924, i32 -1869567173, i32 -2004319477, i32 1179044492, i32 -286381625, i32 -1195846805, i32 336870440, i32 -555845209, i32 1583276732, i32 185277718, i32 -606374227, i32 -522175525, i32 842159716, i32 976899700, i32 168435220, i32 1229577106, i32 101059084, i32 606366792, i32 1549591736, i32 -1027449441, i32 -741118275, i32 -1397952701, i32 1650632388, i32 -1852725191, i32 -1785355215, i32 -454805549, i32 2038008818, i32 -404278571, i32 -926399605, i32 926374254, i32 1835907034, i32 -1920103423, i32 -707435343, i32 1313788572, i32 -1448484791, i32 1819063512, i32 1448540844, i32 -185333773, i32 -353753649, i32 1701162954, i32 2054852340, i32 -1364268729, i32 134748176, i32 -1162160785, i32 2021165296, i32 623210314, i32 774795868, i32 471606328, i32 -1499008681, i32 -1263220877, i32 -960081513, i32 -387439669, i32 -572687199, i32 1953799400, i32 522133822, i32 1263263126, i32 -1111630751, i32 -1953790451, i32 -1970633457, i32 1886425312, i32 1044267644, i32 -1246378895, i32 1718004428, i32 1212733584, i32 50529542, i32 -151649801, i32 235803164, i32 1633788866, i32 892690282, i32 1465383342, i32 -1179004823, i32 -2038001385, i32 -1044293479, i32 488449850, i32 -1633765081, i32 -505333543, i32 -117959701, i32 -1734823125, i32 286339874, i32 1768537042, i32 -640061271, i32 -1903261433, i32 -1802197197, i32 -1684294099, i32 505291324, i32 -2021158379, i32 -370597687, i32 -825341561, i32 1431699370, i32 673740880, i32 -539002203, i32 -1936945405, i32 -1583220647, i32 -1987477495, i32 218961690, i32 -1077945755, i32 -421121577, i32 1111672452, i32 1751693520, i32 1094828930, i32 -1717981143, i32 757954394, i32 252645662, i32 -1330590853, i32 1414855848, i32 -1145317779, i32 370555436], align 16, !dbg !12
@Te0 = internal unnamed_addr constant [256 x i32] [i32 -966564955, i32 -126059388, i32 -294160487, i32 -159679603, i32 -855539, i32 -697603139, i32 -563122255, i32 -1849309868, i32 1613770832, i32 33620227, i32 -832084055, i32 1445669757, i32 -402719207, i32 -1244145822, i32 1303096294, i32 -327780710, i32 -1882535355, i32 528646813, i32 -1983264448, i32 -92439161, i32 -268764651, i32 -1302767125, i32 -1907931191, i32 -68095989, i32 1101901292, i32 -1277897625, i32 1604494077, i32 1169141738, i32 597466303, i32 1403299063, i32 -462261610, i32 -1681866661, i32 1974974402, i32 -503448292, i32 1033081774, i32 1277568618, i32 1815492186, i32 2118074177, i32 -168298750, i32 -2083730353, i32 1748251740, i32 1369810420, i32 -773462732, i32 -101584632, i32 -495881837, i32 -1411852173, i32 1647391059, i32 706024767, i32 134480908, i32 -1782069422, i32 1176707941, i32 -1648114850, i32 806885416, i32 932615841, i32 168101135, i32 798661301, i32 235341577, i32 605164086, i32 461406363, i32 -538779075, i32 -840176858, i32 1311188841, i32 2142417613, i32 -361400929, i32 302582043, i32 495158174, i32 1479289972, i32 874125870, i32 907746093, i32 -596742478, i32 -1269146898, i32 1537253627, i32 -1538108682, i32 1983593293, i32 -1210657183, i32 2108928974, i32 1378429307, i32 -572267714, i32 1580150641, i32 327451799, i32 -1504488459, i32 -1177431704, i32 0, i32 -1041371860, i32 1075847264, i32 -469959649, i32 2041688520, i32 -1235526675, i32 -731223362, i32 -1916023994, i32 1740553945, i32 1916352843, i32 -1807070498, i32 -1739830060, i32 -1336387352, i32 -2049978550, i32 -1143943061, i32 -974131414, i32 1336584933, i32 -302253290, i32 -2042412091, i32 -1706209833, i32 1714631509, i32 293963156, i32 -1975171633, i32 -369493744, i32 67240454, i32 -25198719, i32 -1605349136, i32 2017213508, i32 631218106, i32 1269344483, i32 -1571728909, i32 1571005438, i32 -2143272768, i32 93294474, i32 1066570413, i32 563977660, i32 1882732616, i32 -235539196, i32 1673313503, i32 2008463041, i32 -1344611723, i32 1109467491, i32 537923632, i32 -436207846, i32 -34344178, i32 -1076702611, i32 -2117218996, i32 403442708, i32 638784309, i32 -1007883217, i32 -1101045791, i32 899127202, i32 -2008791860, i32 773265209, i32 -1815821225, i32 1437050866, i32 -58818942, i32 2050833735, i32 -932944724, i32 -1168286233, i32 840505643, i32 -428641387, i32 -1067425632, i32 427917720, i32 -1638969391, i32 -1545806721, i32 1143087718, i32 1412049534, i32 999329963, i32 193497219, i32 -1941551414, i32 -940642775, i32 1807268051, i32 672404540, i32 -1478566279, i32 -1134666014, i32 369822493, i32 -1378100362, i32 -606019525, i32 1681011286, i32 1949973070, i32 336202270, i32 -1840690725, i32 201721354, i32 1210328172, i32 -1201906460, i32 -1614626211, i32 -1110191250, i32 1135389935, i32 -1000185178, i32 965841320, i32 831886756, i32 -739974089, i32 -226920053, i32 -706222286, i32 -1949775805, i32 1849112409, i32 -630362697, i32 26054028, i32 -1311386268, i32 -1672589614, i32 1235855840, i32 -663982924, i32 -1403627782, i32 -202050553, i32 -806688219, i32 -899324497, i32 -193299826, i32 1202630377, i32 268961816, i32 1874508501, i32 -260540280, i32 1243948399, i32 1546530418, i32 941366308, i32 1470539505, i32 1941222599, i32 -1748580783, i32 -873928669, i32 -1579295364, i32 -395021156, i32 1042226977, i32 -1773450275, i32 1639824860, i32 227249030, i32 260737669, i32 -529502064, i32 2084453954, i32 1907733956, i32 -865704278, i32 -1874310952, i32 100860677, i32 -134810111, i32 470683154, i32 -1033805405, i32 1781871967, i32 -1370007559, i32 1773779408, i32 394692241, i32 -1715355304, i32 974986535, i32 664706745, i32 -639508168, i32 -336005101, i32 731420851, i32 571543859, i32 -764843589, i32 -1445340816, i32 126783113, i32 865375399, i32 765172662, i32 1008606754, i32 361203602, i32 -907417312, i32 -2016489911, i32 -1437248001, i32 1344809080, i32 -1512054918, i32 59542671, i32 1503764984, i32 160008576, i32 437062935, i32 1707065306, i32 -672733647, i32 -2076032314, i32 -798463816, i32 -2109652541, i32 697932208, i32 1512910199, i32 504303377, i32 2075177163, i32 -1470868228, i32 1841019862, i32 739644986], align 16, !dbg !19
@Te1 = internal unnamed_addr constant [256 x i32] [i32 -1513725085, i32 -2064089988, i32 -1712425097, i32 -1913226373, i32 234877682, i32 -1110021269, i32 -1310822545, i32 1418839493, i32 1348481072, i32 50462977, i32 -1446090905, i32 2102799147, i32 434634494, i32 1656084439, i32 -431117397, i32 -1695779210, i32 1167051466, i32 -1658879358, i32 1082771913, i32 -2013627011, i32 368048890, i32 -340633255, i32 -913422521, i32 201060592, i32 -331240019, i32 1739838676, i32 -44064094, i32 -364531793, i32 -1088185188, i32 -145513308, i32 -1763413390, i32 1536934080, i32 -1032472649, i32 484572669, i32 -1371696237, i32 1783375398, i32 1517041206, i32 1098792767, i32 49674231, i32 1334037708, i32 1550332980, i32 -195975771, i32 886171109, i32 150598129, i32 -1813876367, i32 1940642008, i32 1398944049, i32 1059722517, i32 201851908, i32 1385547719, i32 1699095331, i32 1587397571, i32 674240536, i32 -1590192490, i32 252314885, i32 -1255171430, i32 151914247, i32 908333586, i32 -1692696448, i32 1038082786, i32 651029483, i32 1766729511, i32 -847269198, i32 -1612024459, i32 454166793, i32 -1642232957, i32 1951935532, i32 775166490, i32 758520603, i32 -1294176658, i32 -290170278, i32 -77881184, i32 -157003182, i32 1299594043, i32 1639438038, i32 -830622797, i32 2068982057, i32 1054729187, i32 1901997871, i32 -1760328572, i32 -173649069, i32 1757008337, i32 0, i32 750906861, i32 1614815264, i32 535035132, i32 -931548751, i32 -306816165, i32 -1093375382, i32 1183697867, i32 -647512386, i32 1265776953, i32 -560706998, i32 -728216500, i32 -391096232, i32 1250283471, i32 1807470800, i32 717615087, i32 -447763798, i32 384695291, i32 -981056701, i32 -677753523, i32 1432761139, i32 -1810791035, i32 -813021883, i32 283769337, i32 100925954, i32 -2114027649, i32 -257929136, i32 1148730428, i32 -1171939425, i32 -481580888, i32 -207466159, i32 -27417693, i32 -1065336768, i32 -1979347057, i32 -1388342638, i32 -1138647651, i32 1215313976, i32 82966005, i32 -547111748, i32 -1049119050, i32 1974459098, i32 1665278241, i32 807407632, i32 451280895, i32 251524083, i32 1841287890, i32 1283575245, i32 337120268, i32 891687699, i32 801369324, i32 -507617441, i32 -1573546089, i32 -863484860, i32 959321879, i32 1469301956, i32 -229267545, i32 -2097381762, i32 1199193405, i32 -1396153244, i32 -407216803, i32 724703513, i32 -1780059277, i32 -1598005152, i32 -1743158911, i32 -778154161, i32 2141445340, i32 1715741218, i32 2119445034, i32 -1422159728, i32 -2096396152, i32 -896776634, i32 700968686, i32 -747915080, i32 1009259540, i32 2041044702, i32 -490971554, i32 487983883, i32 1991105499, i32 1004265696, i32 1449407026, i32 1316239930, i32 504629770, i32 -611169975, i32 168560134, i32 1816667172, i32 -457679780, i32 1570751170, i32 1857934291, i32 -280777556, i32 -1497079198, i32 -1472622191, i32 -1540254315, i32 936633572, i32 -1947043463, i32 852879335, i32 1133234376, i32 1500395319, i32 -1210421907, i32 -1946055283, i32 1689376213, i32 -761508274, i32 -532043351, i32 -1260884884, i32 -89369002, i32 133428468, i32 634383082, i32 -1345690267, i32 -1896580486, i32 -381178194, i32 403703816, i32 -714097990, i32 -1997506440, i32 1867130149, i32 1918643758, i32 607656988, i32 -245913946, i32 -948718412, i32 1368901318, i32 600565992, i32 2090982877, i32 -1662487436, i32 557719327, i32 -577352885, i32 -597574211, i32 -2045932661, i32 -2062579062, i32 -1864339344, i32 1115438654, i32 -999180875, i32 -1429445018, i32 -661632952, i32 84280067, i32 33027830, i32 303828494, i32 -1547542175, i32 1600795957, i32 -106014889, i32 -798377543, i32 -1860729210, i32 1486471617, i32 658119965, i32 -1188585826, i32 953803233, i32 334231800, i32 -1288988520, i32 857870609, i32 -1143838359, i32 1890179545, i32 -1995993458, i32 -1489791852, i32 -1238525029, i32 574365214, i32 -1844082809, i32 550103529, i32 1233637070, i32 -5614251, i32 2018519080, i32 2057691103, i32 -1895592820, i32 -128343647, i32 -2146858615, i32 387583245, i32 -630865985, i32 836232934, i32 -964410814, i32 -1194301336, i32 -1014873791, i32 -1339450983, i32 2002398509, i32 287182607, i32 -881086288, i32 -56077228, i32 -697451589, i32 975967766], align 16, !dbg !21
@rcon = internal unnamed_addr constant [10 x i32] [i32 16777216, i32 33554432, i32 67108864, i32 134217728, i32 268435456, i32 536870912, i32 1073741824, i32 -2147483648, i32 452984832, i32 905969664], align 16, !dbg !23
@ctr128_inc_aligned.is_endian = private unnamed_addr constant %union.anon.5 { i64 1 }, align 8

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() local_unnamed_addr #0 !dbg !74 {
entry:
  %in = alloca [16 x i8], align 16
  %out = alloca [16 x i8], align 16
  %len = alloca i64, align 8
  %key = alloca [16 x i8], align 16
  %aes_key = alloca %struct.aes_key_st, align 4
  %ivec = alloca [16 x i8], align 16
  %ecount_buf = alloca [16 x i8], align 16
  %num = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata [16 x i8]* %in, metadata !78, metadata !DIExpression()), !dbg !82
  %0 = bitcast [16 x i8]* %in to i8*, !dbg !82
  %1 = call i8* @memcpy(i8* %0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @main.in, i32 0, i32 0), i64 16), !dbg !82
  call void @llvm.dbg.declare(metadata [16 x i8]* %out, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %len, metadata !86, metadata !DIExpression()), !dbg !87
  store i64 16, i64* %len, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [16 x i8]* %key, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = bitcast [16 x i8]* %key to i8*, !dbg !89
  %3 = call i8* @memcpy(i8* %2, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @main.key, i32 0, i32 0), i64 16), !dbg !89
  call void @llvm.dbg.declare(metadata %struct.aes_key_st* %aes_key, metadata !90, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [16 x i8]* %ivec, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [16 x i8]* %ecount_buf, metadata !103, metadata !DIExpression()), !dbg !104
  %4 = bitcast [16 x i8]* %ecount_buf to i8*, !dbg !104
  %5 = call i8* @memset(i8* %4, i32 0, i64 16), !dbg !104
  call void @llvm.dbg.declare(metadata i32** %num, metadata !105, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %num, align 8, !dbg !107
  %6 = bitcast [16 x i8]* %ivec to i8*, !dbg !108
  call void @klee_make_symbolic(i8* %6, i64 16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)), !dbg !109
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %key, i32 0, i32 0, !dbg !110
  call fastcc void @AES_set_encrypt_key(i8* %arraydecay, %struct.aes_key_st* %aes_key), !dbg !111
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %in, i32 0, i32 0, !dbg !112
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %out, i32 0, i32 0, !dbg !113
  %7 = load i64, i64* %len, align 8, !dbg !114
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %ivec, i32 0, i32 0, !dbg !115
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %ecount_buf, i32 0, i32 0, !dbg !116
  %8 = load i32*, i32** %num, align 8, !dbg !117
  call fastcc void @AES_ctr128_encrypt(i8* %arraydecay1, i8* %arraydecay2, i64 %7, %struct.aes_key_st* %aes_key, i8* %arraydecay3, i8* %arraydecay4, i32* %8), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @AES_set_encrypt_key(i8* %userKey, %struct.aes_key_st* %key) unnamed_addr #0 !dbg !120 {
entry:
  %retval = alloca i32, align 4
  %userKey.addr = alloca i8*, align 8
  %bits.addr = alloca i32, align 4
  %key.addr = alloca %struct.aes_key_st*, align 8
  %rk = alloca i32*, align 8
  %i = alloca i32, align 4
  %temp = alloca i32, align 4
  store i8* %userKey, i8** %userKey.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %userKey.addr, metadata !130, metadata !DIExpression()), !dbg !131
  store i32 128, i32* %bits.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %bits.addr, metadata !132, metadata !DIExpression()), !dbg !133
  store %struct.aes_key_st* %key, %struct.aes_key_st** %key.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.aes_key_st** %key.addr, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i32** %rk, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32* %i, metadata !139, metadata !DIExpression()), !dbg !140
  store i32 0, i32* %i, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = load i8*, i8** %userKey.addr, align 8, !dbg !143
  %tobool = icmp ne i8* %0, null, !dbg !143
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !145

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !146
  %tobool1 = icmp ne %struct.aes_key_st* %1, null, !dbg !146
  br i1 %tobool1, label %if.end, label %if.then, !dbg !147

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4, !dbg !148
  br label %return, !dbg !148

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32, i32* %bits.addr, align 4, !dbg !149
  %cmp = icmp ne i32 %2, 128, !dbg !151
  br i1 %cmp, label %land.lhs.true, label %if.end6, !dbg !152

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %bits.addr, align 4, !dbg !153
  %cmp2 = icmp ne i32 %3, 192, !dbg !154
  br i1 %cmp2, label %land.lhs.true3, label %if.end6, !dbg !155

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i32, i32* %bits.addr, align 4, !dbg !156
  %cmp4 = icmp ne i32 %4, 256, !dbg !157
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !158

if.then5:                                         ; preds = %land.lhs.true3
  store i32 -2, i32* %retval, align 4, !dbg !159
  br label %return, !dbg !159

if.end6:                                          ; preds = %land.lhs.true3, %land.lhs.true, %if.end
  %5 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !160
  %rd_key = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %5, i32 0, i32 0, !dbg !161
  %arraydecay = getelementptr inbounds [60 x i32], [60 x i32]* %rd_key, i32 0, i32 0, !dbg !160
  store i32* %arraydecay, i32** %rk, align 8, !dbg !162
  %6 = load i32, i32* %bits.addr, align 4, !dbg !163
  %cmp7 = icmp eq i32 %6, 128, !dbg !165
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !166

if.then8:                                         ; preds = %if.end6
  %7 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !167
  %rounds = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %7, i32 0, i32 1, !dbg !168
  store i32 10, i32* %rounds, align 4, !dbg !169
  br label %if.end15, !dbg !167

if.else:                                          ; preds = %if.end6
  %8 = load i32, i32* %bits.addr, align 4, !dbg !170
  %cmp9 = icmp eq i32 %8, 192, !dbg !172
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !173

if.then10:                                        ; preds = %if.else
  %9 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !174
  %rounds11 = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %9, i32 0, i32 1, !dbg !175
  store i32 12, i32* %rounds11, align 4, !dbg !176
  br label %if.end14, !dbg !174

if.else12:                                        ; preds = %if.else
  %10 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !177
  %rounds13 = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %10, i32 0, i32 1, !dbg !178
  store i32 14, i32* %rounds13, align 4, !dbg !179
  br label %if.end14

if.end14:                                         ; preds = %if.else12, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then8
  %11 = load i8*, i8** %userKey.addr, align 8, !dbg !180
  %arrayidx = getelementptr inbounds i8, i8* %11, i64 0, !dbg !180
  %12 = load i8, i8* %arrayidx, align 1, !dbg !180
  %conv = zext i8 %12 to i32, !dbg !180
  %shl = shl i32 %conv, 24, !dbg !180
  %13 = load i8*, i8** %userKey.addr, align 8, !dbg !180
  %arrayidx16 = getelementptr inbounds i8, i8* %13, i64 1, !dbg !180
  %14 = load i8, i8* %arrayidx16, align 1, !dbg !180
  %conv17 = zext i8 %14 to i32, !dbg !180
  %shl18 = shl i32 %conv17, 16, !dbg !180
  %xor = xor i32 %shl, %shl18, !dbg !180
  %15 = load i8*, i8** %userKey.addr, align 8, !dbg !180
  %arrayidx19 = getelementptr inbounds i8, i8* %15, i64 2, !dbg !180
  %16 = load i8, i8* %arrayidx19, align 1, !dbg !180
  %conv20 = zext i8 %16 to i32, !dbg !180
  %shl21 = shl i32 %conv20, 8, !dbg !180
  %xor22 = xor i32 %xor, %shl21, !dbg !180
  %17 = load i8*, i8** %userKey.addr, align 8, !dbg !180
  %arrayidx23 = getelementptr inbounds i8, i8* %17, i64 3, !dbg !180
  %18 = load i8, i8* %arrayidx23, align 1, !dbg !180
  %conv24 = zext i8 %18 to i32, !dbg !180
  %xor25 = xor i32 %xor22, %conv24, !dbg !180
  %19 = load i32*, i32** %rk, align 8, !dbg !181
  %arrayidx26 = getelementptr inbounds i32, i32* %19, i64 0, !dbg !181
  store i32 %xor25, i32* %arrayidx26, align 4, !dbg !182
  %20 = load i8*, i8** %userKey.addr, align 8, !dbg !183
  %add.ptr = getelementptr inbounds i8, i8* %20, i64 4, !dbg !183
  %arrayidx27 = getelementptr inbounds i8, i8* %add.ptr, i64 0, !dbg !183
  %21 = load i8, i8* %arrayidx27, align 1, !dbg !183
  %conv28 = zext i8 %21 to i32, !dbg !183
  %shl29 = shl i32 %conv28, 24, !dbg !183
  %22 = load i8*, i8** %userKey.addr, align 8, !dbg !183
  %add.ptr30 = getelementptr inbounds i8, i8* %22, i64 4, !dbg !183
  %arrayidx31 = getelementptr inbounds i8, i8* %add.ptr30, i64 1, !dbg !183
  %23 = load i8, i8* %arrayidx31, align 1, !dbg !183
  %conv32 = zext i8 %23 to i32, !dbg !183
  %shl33 = shl i32 %conv32, 16, !dbg !183
  %xor34 = xor i32 %shl29, %shl33, !dbg !183
  %24 = load i8*, i8** %userKey.addr, align 8, !dbg !183
  %add.ptr35 = getelementptr inbounds i8, i8* %24, i64 4, !dbg !183
  %arrayidx36 = getelementptr inbounds i8, i8* %add.ptr35, i64 2, !dbg !183
  %25 = load i8, i8* %arrayidx36, align 1, !dbg !183
  %conv37 = zext i8 %25 to i32, !dbg !183
  %shl38 = shl i32 %conv37, 8, !dbg !183
  %xor39 = xor i32 %xor34, %shl38, !dbg !183
  %26 = load i8*, i8** %userKey.addr, align 8, !dbg !183
  %add.ptr40 = getelementptr inbounds i8, i8* %26, i64 4, !dbg !183
  %arrayidx41 = getelementptr inbounds i8, i8* %add.ptr40, i64 3, !dbg !183
  %27 = load i8, i8* %arrayidx41, align 1, !dbg !183
  %conv42 = zext i8 %27 to i32, !dbg !183
  %xor43 = xor i32 %xor39, %conv42, !dbg !183
  %28 = load i32*, i32** %rk, align 8, !dbg !184
  %arrayidx44 = getelementptr inbounds i32, i32* %28, i64 1, !dbg !184
  store i32 %xor43, i32* %arrayidx44, align 4, !dbg !185
  %29 = load i8*, i8** %userKey.addr, align 8, !dbg !186
  %add.ptr45 = getelementptr inbounds i8, i8* %29, i64 8, !dbg !186
  %arrayidx46 = getelementptr inbounds i8, i8* %add.ptr45, i64 0, !dbg !186
  %30 = load i8, i8* %arrayidx46, align 1, !dbg !186
  %conv47 = zext i8 %30 to i32, !dbg !186
  %shl48 = shl i32 %conv47, 24, !dbg !186
  %31 = load i8*, i8** %userKey.addr, align 8, !dbg !186
  %add.ptr49 = getelementptr inbounds i8, i8* %31, i64 8, !dbg !186
  %arrayidx50 = getelementptr inbounds i8, i8* %add.ptr49, i64 1, !dbg !186
  %32 = load i8, i8* %arrayidx50, align 1, !dbg !186
  %conv51 = zext i8 %32 to i32, !dbg !186
  %shl52 = shl i32 %conv51, 16, !dbg !186
  %xor53 = xor i32 %shl48, %shl52, !dbg !186
  %33 = load i8*, i8** %userKey.addr, align 8, !dbg !186
  %add.ptr54 = getelementptr inbounds i8, i8* %33, i64 8, !dbg !186
  %arrayidx55 = getelementptr inbounds i8, i8* %add.ptr54, i64 2, !dbg !186
  %34 = load i8, i8* %arrayidx55, align 1, !dbg !186
  %conv56 = zext i8 %34 to i32, !dbg !186
  %shl57 = shl i32 %conv56, 8, !dbg !186
  %xor58 = xor i32 %xor53, %shl57, !dbg !186
  %35 = load i8*, i8** %userKey.addr, align 8, !dbg !186
  %add.ptr59 = getelementptr inbounds i8, i8* %35, i64 8, !dbg !186
  %arrayidx60 = getelementptr inbounds i8, i8* %add.ptr59, i64 3, !dbg !186
  %36 = load i8, i8* %arrayidx60, align 1, !dbg !186
  %conv61 = zext i8 %36 to i32, !dbg !186
  %xor62 = xor i32 %xor58, %conv61, !dbg !186
  %37 = load i32*, i32** %rk, align 8, !dbg !187
  %arrayidx63 = getelementptr inbounds i32, i32* %37, i64 2, !dbg !187
  store i32 %xor62, i32* %arrayidx63, align 4, !dbg !188
  %38 = load i8*, i8** %userKey.addr, align 8, !dbg !189
  %add.ptr64 = getelementptr inbounds i8, i8* %38, i64 12, !dbg !189
  %arrayidx65 = getelementptr inbounds i8, i8* %add.ptr64, i64 0, !dbg !189
  %39 = load i8, i8* %arrayidx65, align 1, !dbg !189
  %conv66 = zext i8 %39 to i32, !dbg !189
  %shl67 = shl i32 %conv66, 24, !dbg !189
  %40 = load i8*, i8** %userKey.addr, align 8, !dbg !189
  %add.ptr68 = getelementptr inbounds i8, i8* %40, i64 12, !dbg !189
  %arrayidx69 = getelementptr inbounds i8, i8* %add.ptr68, i64 1, !dbg !189
  %41 = load i8, i8* %arrayidx69, align 1, !dbg !189
  %conv70 = zext i8 %41 to i32, !dbg !189
  %shl71 = shl i32 %conv70, 16, !dbg !189
  %xor72 = xor i32 %shl67, %shl71, !dbg !189
  %42 = load i8*, i8** %userKey.addr, align 8, !dbg !189
  %add.ptr73 = getelementptr inbounds i8, i8* %42, i64 12, !dbg !189
  %arrayidx74 = getelementptr inbounds i8, i8* %add.ptr73, i64 2, !dbg !189
  %43 = load i8, i8* %arrayidx74, align 1, !dbg !189
  %conv75 = zext i8 %43 to i32, !dbg !189
  %shl76 = shl i32 %conv75, 8, !dbg !189
  %xor77 = xor i32 %xor72, %shl76, !dbg !189
  %44 = load i8*, i8** %userKey.addr, align 8, !dbg !189
  %add.ptr78 = getelementptr inbounds i8, i8* %44, i64 12, !dbg !189
  %arrayidx79 = getelementptr inbounds i8, i8* %add.ptr78, i64 3, !dbg !189
  %45 = load i8, i8* %arrayidx79, align 1, !dbg !189
  %conv80 = zext i8 %45 to i32, !dbg !189
  %xor81 = xor i32 %xor77, %conv80, !dbg !189
  %46 = load i32*, i32** %rk, align 8, !dbg !190
  %arrayidx82 = getelementptr inbounds i32, i32* %46, i64 3, !dbg !190
  store i32 %xor81, i32* %arrayidx82, align 4, !dbg !191
  %47 = load i32, i32* %bits.addr, align 4, !dbg !192
  %cmp83 = icmp eq i32 %47, 128, !dbg !194
  br i1 %cmp83, label %if.then85, label %if.end128, !dbg !195

if.then85:                                        ; preds = %if.end15
  br label %while.body, !dbg !196

while.body:                                       ; preds = %if.then85, %if.end126
  %48 = load i32*, i32** %rk, align 8, !dbg !198
  %arrayidx86 = getelementptr inbounds i32, i32* %48, i64 3, !dbg !198
  %49 = load i32, i32* %arrayidx86, align 4, !dbg !198
  store i32 %49, i32* %temp, align 4, !dbg !200
  %50 = load i32*, i32** %rk, align 8, !dbg !201
  %arrayidx87 = getelementptr inbounds i32, i32* %50, i64 0, !dbg !201
  %51 = load i32, i32* %arrayidx87, align 4, !dbg !201
  %52 = load i32, i32* %temp, align 4, !dbg !202
  %shr = lshr i32 %52, 16, !dbg !203
  %and = and i32 %shr, 255, !dbg !204
  %idxprom = zext i32 %and to i64, !dbg !205
  %arrayidx88 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom, !dbg !205
  %53 = load i32, i32* %arrayidx88, align 4, !dbg !205
  %and89 = and i32 %53, -16777216, !dbg !206
  %xor90 = xor i32 %51, %and89, !dbg !207
  %54 = load i32, i32* %temp, align 4, !dbg !208
  %shr91 = lshr i32 %54, 8, !dbg !209
  %and92 = and i32 %shr91, 255, !dbg !210
  %idxprom93 = zext i32 %and92 to i64, !dbg !211
  %arrayidx94 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom93, !dbg !211
  %55 = load i32, i32* %arrayidx94, align 4, !dbg !211
  %and95 = and i32 %55, 16711680, !dbg !212
  %xor96 = xor i32 %xor90, %and95, !dbg !213
  %56 = load i32, i32* %temp, align 4, !dbg !214
  %and97 = and i32 %56, 255, !dbg !215
  %idxprom98 = zext i32 %and97 to i64, !dbg !216
  %arrayidx99 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom98, !dbg !216
  %57 = load i32, i32* %arrayidx99, align 4, !dbg !216
  %and100 = and i32 %57, 65280, !dbg !217
  %xor101 = xor i32 %xor96, %and100, !dbg !218
  %58 = load i32, i32* %temp, align 4, !dbg !219
  %shr102 = lshr i32 %58, 24, !dbg !220
  %idxprom103 = zext i32 %shr102 to i64, !dbg !221
  %arrayidx104 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom103, !dbg !221
  %59 = load i32, i32* %arrayidx104, align 4, !dbg !221
  %and105 = and i32 %59, 255, !dbg !222
  %xor106 = xor i32 %xor101, %and105, !dbg !223
  %60 = load i32, i32* %i, align 4, !dbg !224
  %idxprom107 = sext i32 %60 to i64, !dbg !225
  %arrayidx108 = getelementptr inbounds [10 x i32], [10 x i32]* @rcon, i64 0, i64 %idxprom107, !dbg !225
  %61 = load i32, i32* %arrayidx108, align 4, !dbg !225
  %xor109 = xor i32 %xor106, %61, !dbg !226
  %62 = load i32*, i32** %rk, align 8, !dbg !227
  %arrayidx110 = getelementptr inbounds i32, i32* %62, i64 4, !dbg !227
  store i32 %xor109, i32* %arrayidx110, align 4, !dbg !228
  %63 = load i32*, i32** %rk, align 8, !dbg !229
  %arrayidx111 = getelementptr inbounds i32, i32* %63, i64 1, !dbg !229
  %64 = load i32, i32* %arrayidx111, align 4, !dbg !229
  %65 = load i32*, i32** %rk, align 8, !dbg !230
  %arrayidx112 = getelementptr inbounds i32, i32* %65, i64 4, !dbg !230
  %66 = load i32, i32* %arrayidx112, align 4, !dbg !230
  %xor113 = xor i32 %64, %66, !dbg !231
  %67 = load i32*, i32** %rk, align 8, !dbg !232
  %arrayidx114 = getelementptr inbounds i32, i32* %67, i64 5, !dbg !232
  store i32 %xor113, i32* %arrayidx114, align 4, !dbg !233
  %68 = load i32*, i32** %rk, align 8, !dbg !234
  %arrayidx115 = getelementptr inbounds i32, i32* %68, i64 2, !dbg !234
  %69 = load i32, i32* %arrayidx115, align 4, !dbg !234
  %70 = load i32*, i32** %rk, align 8, !dbg !235
  %arrayidx116 = getelementptr inbounds i32, i32* %70, i64 5, !dbg !235
  %71 = load i32, i32* %arrayidx116, align 4, !dbg !235
  %xor117 = xor i32 %69, %71, !dbg !236
  %72 = load i32*, i32** %rk, align 8, !dbg !237
  %arrayidx118 = getelementptr inbounds i32, i32* %72, i64 6, !dbg !237
  store i32 %xor117, i32* %arrayidx118, align 4, !dbg !238
  %73 = load i32*, i32** %rk, align 8, !dbg !239
  %arrayidx119 = getelementptr inbounds i32, i32* %73, i64 3, !dbg !239
  %74 = load i32, i32* %arrayidx119, align 4, !dbg !239
  %75 = load i32*, i32** %rk, align 8, !dbg !240
  %arrayidx120 = getelementptr inbounds i32, i32* %75, i64 6, !dbg !240
  %76 = load i32, i32* %arrayidx120, align 4, !dbg !240
  %xor121 = xor i32 %74, %76, !dbg !241
  %77 = load i32*, i32** %rk, align 8, !dbg !242
  %arrayidx122 = getelementptr inbounds i32, i32* %77, i64 7, !dbg !242
  store i32 %xor121, i32* %arrayidx122, align 4, !dbg !243
  %78 = load i32, i32* %i, align 4, !dbg !244
  %inc = add nsw i32 %78, 1, !dbg !244
  store i32 %inc, i32* %i, align 4, !dbg !244
  %cmp123 = icmp eq i32 %inc, 10, !dbg !246
  br i1 %cmp123, label %if.then125, label %if.end126, !dbg !247

if.then125:                                       ; preds = %while.body
  store i32 0, i32* %retval, align 4, !dbg !248
  br label %return, !dbg !248

if.end126:                                        ; preds = %while.body
  %79 = load i32*, i32** %rk, align 8, !dbg !250
  %add.ptr127 = getelementptr inbounds i32, i32* %79, i64 4, !dbg !250
  store i32* %add.ptr127, i32** %rk, align 8, !dbg !250
  br label %while.body, !dbg !196, !llvm.loop !251

if.end128:                                        ; preds = %if.end15
  %80 = load i8*, i8** %userKey.addr, align 8, !dbg !253
  %add.ptr129 = getelementptr inbounds i8, i8* %80, i64 16, !dbg !253
  %arrayidx130 = getelementptr inbounds i8, i8* %add.ptr129, i64 0, !dbg !253
  %81 = load i8, i8* %arrayidx130, align 1, !dbg !253
  %conv131 = zext i8 %81 to i32, !dbg !253
  %shl132 = shl i32 %conv131, 24, !dbg !253
  %82 = load i8*, i8** %userKey.addr, align 8, !dbg !253
  %add.ptr133 = getelementptr inbounds i8, i8* %82, i64 16, !dbg !253
  %arrayidx134 = getelementptr inbounds i8, i8* %add.ptr133, i64 1, !dbg !253
  %83 = load i8, i8* %arrayidx134, align 1, !dbg !253
  %conv135 = zext i8 %83 to i32, !dbg !253
  %shl136 = shl i32 %conv135, 16, !dbg !253
  %xor137 = xor i32 %shl132, %shl136, !dbg !253
  %84 = load i8*, i8** %userKey.addr, align 8, !dbg !253
  %add.ptr138 = getelementptr inbounds i8, i8* %84, i64 16, !dbg !253
  %arrayidx139 = getelementptr inbounds i8, i8* %add.ptr138, i64 2, !dbg !253
  %85 = load i8, i8* %arrayidx139, align 1, !dbg !253
  %conv140 = zext i8 %85 to i32, !dbg !253
  %shl141 = shl i32 %conv140, 8, !dbg !253
  %xor142 = xor i32 %xor137, %shl141, !dbg !253
  %86 = load i8*, i8** %userKey.addr, align 8, !dbg !253
  %add.ptr143 = getelementptr inbounds i8, i8* %86, i64 16, !dbg !253
  %arrayidx144 = getelementptr inbounds i8, i8* %add.ptr143, i64 3, !dbg !253
  %87 = load i8, i8* %arrayidx144, align 1, !dbg !253
  %conv145 = zext i8 %87 to i32, !dbg !253
  %xor146 = xor i32 %xor142, %conv145, !dbg !253
  %88 = load i32*, i32** %rk, align 8, !dbg !254
  %arrayidx147 = getelementptr inbounds i32, i32* %88, i64 4, !dbg !254
  store i32 %xor146, i32* %arrayidx147, align 4, !dbg !255
  %89 = load i8*, i8** %userKey.addr, align 8, !dbg !256
  %add.ptr148 = getelementptr inbounds i8, i8* %89, i64 20, !dbg !256
  %arrayidx149 = getelementptr inbounds i8, i8* %add.ptr148, i64 0, !dbg !256
  %90 = load i8, i8* %arrayidx149, align 1, !dbg !256
  %conv150 = zext i8 %90 to i32, !dbg !256
  %shl151 = shl i32 %conv150, 24, !dbg !256
  %91 = load i8*, i8** %userKey.addr, align 8, !dbg !256
  %add.ptr152 = getelementptr inbounds i8, i8* %91, i64 20, !dbg !256
  %arrayidx153 = getelementptr inbounds i8, i8* %add.ptr152, i64 1, !dbg !256
  %92 = load i8, i8* %arrayidx153, align 1, !dbg !256
  %conv154 = zext i8 %92 to i32, !dbg !256
  %shl155 = shl i32 %conv154, 16, !dbg !256
  %xor156 = xor i32 %shl151, %shl155, !dbg !256
  %93 = load i8*, i8** %userKey.addr, align 8, !dbg !256
  %add.ptr157 = getelementptr inbounds i8, i8* %93, i64 20, !dbg !256
  %arrayidx158 = getelementptr inbounds i8, i8* %add.ptr157, i64 2, !dbg !256
  %94 = load i8, i8* %arrayidx158, align 1, !dbg !256
  %conv159 = zext i8 %94 to i32, !dbg !256
  %shl160 = shl i32 %conv159, 8, !dbg !256
  %xor161 = xor i32 %xor156, %shl160, !dbg !256
  %95 = load i8*, i8** %userKey.addr, align 8, !dbg !256
  %add.ptr162 = getelementptr inbounds i8, i8* %95, i64 20, !dbg !256
  %arrayidx163 = getelementptr inbounds i8, i8* %add.ptr162, i64 3, !dbg !256
  %96 = load i8, i8* %arrayidx163, align 1, !dbg !256
  %conv164 = zext i8 %96 to i32, !dbg !256
  %xor165 = xor i32 %xor161, %conv164, !dbg !256
  %97 = load i32*, i32** %rk, align 8, !dbg !257
  %arrayidx166 = getelementptr inbounds i32, i32* %97, i64 5, !dbg !257
  store i32 %xor165, i32* %arrayidx166, align 4, !dbg !258
  %98 = load i32, i32* %bits.addr, align 4, !dbg !259
  %cmp167 = icmp eq i32 %98, 192, !dbg !261
  br i1 %cmp167, label %if.then169, label %if.end225, !dbg !262

if.then169:                                       ; preds = %if.end128
  br label %while.body170, !dbg !263

while.body170:                                    ; preds = %if.then169, %if.end215
  %99 = load i32*, i32** %rk, align 8, !dbg !265
  %arrayidx171 = getelementptr inbounds i32, i32* %99, i64 5, !dbg !265
  %100 = load i32, i32* %arrayidx171, align 4, !dbg !265
  store i32 %100, i32* %temp, align 4, !dbg !267
  %101 = load i32*, i32** %rk, align 8, !dbg !268
  %arrayidx172 = getelementptr inbounds i32, i32* %101, i64 0, !dbg !268
  %102 = load i32, i32* %arrayidx172, align 4, !dbg !268
  %103 = load i32, i32* %temp, align 4, !dbg !269
  %shr173 = lshr i32 %103, 16, !dbg !270
  %and174 = and i32 %shr173, 255, !dbg !271
  %idxprom175 = zext i32 %and174 to i64, !dbg !272
  %arrayidx176 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom175, !dbg !272
  %104 = load i32, i32* %arrayidx176, align 4, !dbg !272
  %and177 = and i32 %104, -16777216, !dbg !273
  %xor178 = xor i32 %102, %and177, !dbg !274
  %105 = load i32, i32* %temp, align 4, !dbg !275
  %shr179 = lshr i32 %105, 8, !dbg !276
  %and180 = and i32 %shr179, 255, !dbg !277
  %idxprom181 = zext i32 %and180 to i64, !dbg !278
  %arrayidx182 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom181, !dbg !278
  %106 = load i32, i32* %arrayidx182, align 4, !dbg !278
  %and183 = and i32 %106, 16711680, !dbg !279
  %xor184 = xor i32 %xor178, %and183, !dbg !280
  %107 = load i32, i32* %temp, align 4, !dbg !281
  %and185 = and i32 %107, 255, !dbg !282
  %idxprom186 = zext i32 %and185 to i64, !dbg !283
  %arrayidx187 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom186, !dbg !283
  %108 = load i32, i32* %arrayidx187, align 4, !dbg !283
  %and188 = and i32 %108, 65280, !dbg !284
  %xor189 = xor i32 %xor184, %and188, !dbg !285
  %109 = load i32, i32* %temp, align 4, !dbg !286
  %shr190 = lshr i32 %109, 24, !dbg !287
  %idxprom191 = zext i32 %shr190 to i64, !dbg !288
  %arrayidx192 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom191, !dbg !288
  %110 = load i32, i32* %arrayidx192, align 4, !dbg !288
  %and193 = and i32 %110, 255, !dbg !289
  %xor194 = xor i32 %xor189, %and193, !dbg !290
  %111 = load i32, i32* %i, align 4, !dbg !291
  %idxprom195 = sext i32 %111 to i64, !dbg !292
  %arrayidx196 = getelementptr inbounds [10 x i32], [10 x i32]* @rcon, i64 0, i64 %idxprom195, !dbg !292
  %112 = load i32, i32* %arrayidx196, align 4, !dbg !292
  %xor197 = xor i32 %xor194, %112, !dbg !293
  %113 = load i32*, i32** %rk, align 8, !dbg !294
  %arrayidx198 = getelementptr inbounds i32, i32* %113, i64 6, !dbg !294
  store i32 %xor197, i32* %arrayidx198, align 4, !dbg !295
  %114 = load i32*, i32** %rk, align 8, !dbg !296
  %arrayidx199 = getelementptr inbounds i32, i32* %114, i64 1, !dbg !296
  %115 = load i32, i32* %arrayidx199, align 4, !dbg !296
  %116 = load i32*, i32** %rk, align 8, !dbg !297
  %arrayidx200 = getelementptr inbounds i32, i32* %116, i64 6, !dbg !297
  %117 = load i32, i32* %arrayidx200, align 4, !dbg !297
  %xor201 = xor i32 %115, %117, !dbg !298
  %118 = load i32*, i32** %rk, align 8, !dbg !299
  %arrayidx202 = getelementptr inbounds i32, i32* %118, i64 7, !dbg !299
  store i32 %xor201, i32* %arrayidx202, align 4, !dbg !300
  %119 = load i32*, i32** %rk, align 8, !dbg !301
  %arrayidx203 = getelementptr inbounds i32, i32* %119, i64 2, !dbg !301
  %120 = load i32, i32* %arrayidx203, align 4, !dbg !301
  %121 = load i32*, i32** %rk, align 8, !dbg !302
  %arrayidx204 = getelementptr inbounds i32, i32* %121, i64 7, !dbg !302
  %122 = load i32, i32* %arrayidx204, align 4, !dbg !302
  %xor205 = xor i32 %120, %122, !dbg !303
  %123 = load i32*, i32** %rk, align 8, !dbg !304
  %arrayidx206 = getelementptr inbounds i32, i32* %123, i64 8, !dbg !304
  store i32 %xor205, i32* %arrayidx206, align 4, !dbg !305
  %124 = load i32*, i32** %rk, align 8, !dbg !306
  %arrayidx207 = getelementptr inbounds i32, i32* %124, i64 3, !dbg !306
  %125 = load i32, i32* %arrayidx207, align 4, !dbg !306
  %126 = load i32*, i32** %rk, align 8, !dbg !307
  %arrayidx208 = getelementptr inbounds i32, i32* %126, i64 8, !dbg !307
  %127 = load i32, i32* %arrayidx208, align 4, !dbg !307
  %xor209 = xor i32 %125, %127, !dbg !308
  %128 = load i32*, i32** %rk, align 8, !dbg !309
  %arrayidx210 = getelementptr inbounds i32, i32* %128, i64 9, !dbg !309
  store i32 %xor209, i32* %arrayidx210, align 4, !dbg !310
  %129 = load i32, i32* %i, align 4, !dbg !311
  %inc211 = add nsw i32 %129, 1, !dbg !311
  store i32 %inc211, i32* %i, align 4, !dbg !311
  %cmp212 = icmp eq i32 %inc211, 8, !dbg !313
  br i1 %cmp212, label %if.then214, label %if.end215, !dbg !314

if.then214:                                       ; preds = %while.body170
  store i32 0, i32* %retval, align 4, !dbg !315
  br label %return, !dbg !315

if.end215:                                        ; preds = %while.body170
  %130 = load i32*, i32** %rk, align 8, !dbg !317
  %arrayidx216 = getelementptr inbounds i32, i32* %130, i64 4, !dbg !317
  %131 = load i32, i32* %arrayidx216, align 4, !dbg !317
  %132 = load i32*, i32** %rk, align 8, !dbg !318
  %arrayidx217 = getelementptr inbounds i32, i32* %132, i64 9, !dbg !318
  %133 = load i32, i32* %arrayidx217, align 4, !dbg !318
  %xor218 = xor i32 %131, %133, !dbg !319
  %134 = load i32*, i32** %rk, align 8, !dbg !320
  %arrayidx219 = getelementptr inbounds i32, i32* %134, i64 10, !dbg !320
  store i32 %xor218, i32* %arrayidx219, align 4, !dbg !321
  %135 = load i32*, i32** %rk, align 8, !dbg !322
  %arrayidx220 = getelementptr inbounds i32, i32* %135, i64 5, !dbg !322
  %136 = load i32, i32* %arrayidx220, align 4, !dbg !322
  %137 = load i32*, i32** %rk, align 8, !dbg !323
  %arrayidx221 = getelementptr inbounds i32, i32* %137, i64 10, !dbg !323
  %138 = load i32, i32* %arrayidx221, align 4, !dbg !323
  %xor222 = xor i32 %136, %138, !dbg !324
  %139 = load i32*, i32** %rk, align 8, !dbg !325
  %arrayidx223 = getelementptr inbounds i32, i32* %139, i64 11, !dbg !325
  store i32 %xor222, i32* %arrayidx223, align 4, !dbg !326
  %140 = load i32*, i32** %rk, align 8, !dbg !327
  %add.ptr224 = getelementptr inbounds i32, i32* %140, i64 6, !dbg !327
  store i32* %add.ptr224, i32** %rk, align 8, !dbg !327
  br label %while.body170, !dbg !263, !llvm.loop !328

if.end225:                                        ; preds = %if.end128
  %141 = load i8*, i8** %userKey.addr, align 8, !dbg !330
  %add.ptr226 = getelementptr inbounds i8, i8* %141, i64 24, !dbg !330
  %arrayidx227 = getelementptr inbounds i8, i8* %add.ptr226, i64 0, !dbg !330
  %142 = load i8, i8* %arrayidx227, align 1, !dbg !330
  %conv228 = zext i8 %142 to i32, !dbg !330
  %shl229 = shl i32 %conv228, 24, !dbg !330
  %143 = load i8*, i8** %userKey.addr, align 8, !dbg !330
  %add.ptr230 = getelementptr inbounds i8, i8* %143, i64 24, !dbg !330
  %arrayidx231 = getelementptr inbounds i8, i8* %add.ptr230, i64 1, !dbg !330
  %144 = load i8, i8* %arrayidx231, align 1, !dbg !330
  %conv232 = zext i8 %144 to i32, !dbg !330
  %shl233 = shl i32 %conv232, 16, !dbg !330
  %xor234 = xor i32 %shl229, %shl233, !dbg !330
  %145 = load i8*, i8** %userKey.addr, align 8, !dbg !330
  %add.ptr235 = getelementptr inbounds i8, i8* %145, i64 24, !dbg !330
  %arrayidx236 = getelementptr inbounds i8, i8* %add.ptr235, i64 2, !dbg !330
  %146 = load i8, i8* %arrayidx236, align 1, !dbg !330
  %conv237 = zext i8 %146 to i32, !dbg !330
  %shl238 = shl i32 %conv237, 8, !dbg !330
  %xor239 = xor i32 %xor234, %shl238, !dbg !330
  %147 = load i8*, i8** %userKey.addr, align 8, !dbg !330
  %add.ptr240 = getelementptr inbounds i8, i8* %147, i64 24, !dbg !330
  %arrayidx241 = getelementptr inbounds i8, i8* %add.ptr240, i64 3, !dbg !330
  %148 = load i8, i8* %arrayidx241, align 1, !dbg !330
  %conv242 = zext i8 %148 to i32, !dbg !330
  %xor243 = xor i32 %xor239, %conv242, !dbg !330
  %149 = load i32*, i32** %rk, align 8, !dbg !331
  %arrayidx244 = getelementptr inbounds i32, i32* %149, i64 6, !dbg !331
  store i32 %xor243, i32* %arrayidx244, align 4, !dbg !332
  %150 = load i8*, i8** %userKey.addr, align 8, !dbg !333
  %add.ptr245 = getelementptr inbounds i8, i8* %150, i64 28, !dbg !333
  %arrayidx246 = getelementptr inbounds i8, i8* %add.ptr245, i64 0, !dbg !333
  %151 = load i8, i8* %arrayidx246, align 1, !dbg !333
  %conv247 = zext i8 %151 to i32, !dbg !333
  %shl248 = shl i32 %conv247, 24, !dbg !333
  %152 = load i8*, i8** %userKey.addr, align 8, !dbg !333
  %add.ptr249 = getelementptr inbounds i8, i8* %152, i64 28, !dbg !333
  %arrayidx250 = getelementptr inbounds i8, i8* %add.ptr249, i64 1, !dbg !333
  %153 = load i8, i8* %arrayidx250, align 1, !dbg !333
  %conv251 = zext i8 %153 to i32, !dbg !333
  %shl252 = shl i32 %conv251, 16, !dbg !333
  %xor253 = xor i32 %shl248, %shl252, !dbg !333
  %154 = load i8*, i8** %userKey.addr, align 8, !dbg !333
  %add.ptr254 = getelementptr inbounds i8, i8* %154, i64 28, !dbg !333
  %arrayidx255 = getelementptr inbounds i8, i8* %add.ptr254, i64 2, !dbg !333
  %155 = load i8, i8* %arrayidx255, align 1, !dbg !333
  %conv256 = zext i8 %155 to i32, !dbg !333
  %shl257 = shl i32 %conv256, 8, !dbg !333
  %xor258 = xor i32 %xor253, %shl257, !dbg !333
  %156 = load i8*, i8** %userKey.addr, align 8, !dbg !333
  %add.ptr259 = getelementptr inbounds i8, i8* %156, i64 28, !dbg !333
  %arrayidx260 = getelementptr inbounds i8, i8* %add.ptr259, i64 3, !dbg !333
  %157 = load i8, i8* %arrayidx260, align 1, !dbg !333
  %conv261 = zext i8 %157 to i32, !dbg !333
  %xor262 = xor i32 %xor258, %conv261, !dbg !333
  %158 = load i32*, i32** %rk, align 8, !dbg !334
  %arrayidx263 = getelementptr inbounds i32, i32* %158, i64 7, !dbg !334
  store i32 %xor262, i32* %arrayidx263, align 4, !dbg !335
  %159 = load i32, i32* %bits.addr, align 4, !dbg !336
  %cmp264 = icmp eq i32 %159, 256, !dbg !338
  br i1 %cmp264, label %if.then266, label %if.end351, !dbg !339

if.then266:                                       ; preds = %if.end225
  br label %while.body267, !dbg !340

while.body267:                                    ; preds = %if.then266, %if.end312
  %160 = load i32*, i32** %rk, align 8, !dbg !342
  %arrayidx268 = getelementptr inbounds i32, i32* %160, i64 7, !dbg !342
  %161 = load i32, i32* %arrayidx268, align 4, !dbg !342
  store i32 %161, i32* %temp, align 4, !dbg !344
  %162 = load i32*, i32** %rk, align 8, !dbg !345
  %arrayidx269 = getelementptr inbounds i32, i32* %162, i64 0, !dbg !345
  %163 = load i32, i32* %arrayidx269, align 4, !dbg !345
  %164 = load i32, i32* %temp, align 4, !dbg !346
  %shr270 = lshr i32 %164, 16, !dbg !347
  %and271 = and i32 %shr270, 255, !dbg !348
  %idxprom272 = zext i32 %and271 to i64, !dbg !349
  %arrayidx273 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom272, !dbg !349
  %165 = load i32, i32* %arrayidx273, align 4, !dbg !349
  %and274 = and i32 %165, -16777216, !dbg !350
  %xor275 = xor i32 %163, %and274, !dbg !351
  %166 = load i32, i32* %temp, align 4, !dbg !352
  %shr276 = lshr i32 %166, 8, !dbg !353
  %and277 = and i32 %shr276, 255, !dbg !354
  %idxprom278 = zext i32 %and277 to i64, !dbg !355
  %arrayidx279 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom278, !dbg !355
  %167 = load i32, i32* %arrayidx279, align 4, !dbg !355
  %and280 = and i32 %167, 16711680, !dbg !356
  %xor281 = xor i32 %xor275, %and280, !dbg !357
  %168 = load i32, i32* %temp, align 4, !dbg !358
  %and282 = and i32 %168, 255, !dbg !359
  %idxprom283 = zext i32 %and282 to i64, !dbg !360
  %arrayidx284 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom283, !dbg !360
  %169 = load i32, i32* %arrayidx284, align 4, !dbg !360
  %and285 = and i32 %169, 65280, !dbg !361
  %xor286 = xor i32 %xor281, %and285, !dbg !362
  %170 = load i32, i32* %temp, align 4, !dbg !363
  %shr287 = lshr i32 %170, 24, !dbg !364
  %idxprom288 = zext i32 %shr287 to i64, !dbg !365
  %arrayidx289 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom288, !dbg !365
  %171 = load i32, i32* %arrayidx289, align 4, !dbg !365
  %and290 = and i32 %171, 255, !dbg !366
  %xor291 = xor i32 %xor286, %and290, !dbg !367
  %172 = load i32, i32* %i, align 4, !dbg !368
  %idxprom292 = sext i32 %172 to i64, !dbg !369
  %arrayidx293 = getelementptr inbounds [10 x i32], [10 x i32]* @rcon, i64 0, i64 %idxprom292, !dbg !369
  %173 = load i32, i32* %arrayidx293, align 4, !dbg !369
  %xor294 = xor i32 %xor291, %173, !dbg !370
  %174 = load i32*, i32** %rk, align 8, !dbg !371
  %arrayidx295 = getelementptr inbounds i32, i32* %174, i64 8, !dbg !371
  store i32 %xor294, i32* %arrayidx295, align 4, !dbg !372
  %175 = load i32*, i32** %rk, align 8, !dbg !373
  %arrayidx296 = getelementptr inbounds i32, i32* %175, i64 1, !dbg !373
  %176 = load i32, i32* %arrayidx296, align 4, !dbg !373
  %177 = load i32*, i32** %rk, align 8, !dbg !374
  %arrayidx297 = getelementptr inbounds i32, i32* %177, i64 8, !dbg !374
  %178 = load i32, i32* %arrayidx297, align 4, !dbg !374
  %xor298 = xor i32 %176, %178, !dbg !375
  %179 = load i32*, i32** %rk, align 8, !dbg !376
  %arrayidx299 = getelementptr inbounds i32, i32* %179, i64 9, !dbg !376
  store i32 %xor298, i32* %arrayidx299, align 4, !dbg !377
  %180 = load i32*, i32** %rk, align 8, !dbg !378
  %arrayidx300 = getelementptr inbounds i32, i32* %180, i64 2, !dbg !378
  %181 = load i32, i32* %arrayidx300, align 4, !dbg !378
  %182 = load i32*, i32** %rk, align 8, !dbg !379
  %arrayidx301 = getelementptr inbounds i32, i32* %182, i64 9, !dbg !379
  %183 = load i32, i32* %arrayidx301, align 4, !dbg !379
  %xor302 = xor i32 %181, %183, !dbg !380
  %184 = load i32*, i32** %rk, align 8, !dbg !381
  %arrayidx303 = getelementptr inbounds i32, i32* %184, i64 10, !dbg !381
  store i32 %xor302, i32* %arrayidx303, align 4, !dbg !382
  %185 = load i32*, i32** %rk, align 8, !dbg !383
  %arrayidx304 = getelementptr inbounds i32, i32* %185, i64 3, !dbg !383
  %186 = load i32, i32* %arrayidx304, align 4, !dbg !383
  %187 = load i32*, i32** %rk, align 8, !dbg !384
  %arrayidx305 = getelementptr inbounds i32, i32* %187, i64 10, !dbg !384
  %188 = load i32, i32* %arrayidx305, align 4, !dbg !384
  %xor306 = xor i32 %186, %188, !dbg !385
  %189 = load i32*, i32** %rk, align 8, !dbg !386
  %arrayidx307 = getelementptr inbounds i32, i32* %189, i64 11, !dbg !386
  store i32 %xor306, i32* %arrayidx307, align 4, !dbg !387
  %190 = load i32, i32* %i, align 4, !dbg !388
  %inc308 = add nsw i32 %190, 1, !dbg !388
  store i32 %inc308, i32* %i, align 4, !dbg !388
  %cmp309 = icmp eq i32 %inc308, 7, !dbg !390
  br i1 %cmp309, label %if.then311, label %if.end312, !dbg !391

if.then311:                                       ; preds = %while.body267
  store i32 0, i32* %retval, align 4, !dbg !392
  br label %return, !dbg !392

if.end312:                                        ; preds = %while.body267
  %191 = load i32*, i32** %rk, align 8, !dbg !394
  %arrayidx313 = getelementptr inbounds i32, i32* %191, i64 11, !dbg !394
  %192 = load i32, i32* %arrayidx313, align 4, !dbg !394
  store i32 %192, i32* %temp, align 4, !dbg !395
  %193 = load i32*, i32** %rk, align 8, !dbg !396
  %arrayidx314 = getelementptr inbounds i32, i32* %193, i64 4, !dbg !396
  %194 = load i32, i32* %arrayidx314, align 4, !dbg !396
  %195 = load i32, i32* %temp, align 4, !dbg !397
  %shr315 = lshr i32 %195, 24, !dbg !398
  %idxprom316 = zext i32 %shr315 to i64, !dbg !399
  %arrayidx317 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom316, !dbg !399
  %196 = load i32, i32* %arrayidx317, align 4, !dbg !399
  %and318 = and i32 %196, -16777216, !dbg !400
  %xor319 = xor i32 %194, %and318, !dbg !401
  %197 = load i32, i32* %temp, align 4, !dbg !402
  %shr320 = lshr i32 %197, 16, !dbg !403
  %and321 = and i32 %shr320, 255, !dbg !404
  %idxprom322 = zext i32 %and321 to i64, !dbg !405
  %arrayidx323 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom322, !dbg !405
  %198 = load i32, i32* %arrayidx323, align 4, !dbg !405
  %and324 = and i32 %198, 16711680, !dbg !406
  %xor325 = xor i32 %xor319, %and324, !dbg !407
  %199 = load i32, i32* %temp, align 4, !dbg !408
  %shr326 = lshr i32 %199, 8, !dbg !409
  %and327 = and i32 %shr326, 255, !dbg !410
  %idxprom328 = zext i32 %and327 to i64, !dbg !411
  %arrayidx329 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom328, !dbg !411
  %200 = load i32, i32* %arrayidx329, align 4, !dbg !411
  %and330 = and i32 %200, 65280, !dbg !412
  %xor331 = xor i32 %xor325, %and330, !dbg !413
  %201 = load i32, i32* %temp, align 4, !dbg !414
  %and332 = and i32 %201, 255, !dbg !415
  %idxprom333 = zext i32 %and332 to i64, !dbg !416
  %arrayidx334 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom333, !dbg !416
  %202 = load i32, i32* %arrayidx334, align 4, !dbg !416
  %and335 = and i32 %202, 255, !dbg !417
  %xor336 = xor i32 %xor331, %and335, !dbg !418
  %203 = load i32*, i32** %rk, align 8, !dbg !419
  %arrayidx337 = getelementptr inbounds i32, i32* %203, i64 12, !dbg !419
  store i32 %xor336, i32* %arrayidx337, align 4, !dbg !420
  %204 = load i32*, i32** %rk, align 8, !dbg !421
  %arrayidx338 = getelementptr inbounds i32, i32* %204, i64 5, !dbg !421
  %205 = load i32, i32* %arrayidx338, align 4, !dbg !421
  %206 = load i32*, i32** %rk, align 8, !dbg !422
  %arrayidx339 = getelementptr inbounds i32, i32* %206, i64 12, !dbg !422
  %207 = load i32, i32* %arrayidx339, align 4, !dbg !422
  %xor340 = xor i32 %205, %207, !dbg !423
  %208 = load i32*, i32** %rk, align 8, !dbg !424
  %arrayidx341 = getelementptr inbounds i32, i32* %208, i64 13, !dbg !424
  store i32 %xor340, i32* %arrayidx341, align 4, !dbg !425
  %209 = load i32*, i32** %rk, align 8, !dbg !426
  %arrayidx342 = getelementptr inbounds i32, i32* %209, i64 6, !dbg !426
  %210 = load i32, i32* %arrayidx342, align 4, !dbg !426
  %211 = load i32*, i32** %rk, align 8, !dbg !427
  %arrayidx343 = getelementptr inbounds i32, i32* %211, i64 13, !dbg !427
  %212 = load i32, i32* %arrayidx343, align 4, !dbg !427
  %xor344 = xor i32 %210, %212, !dbg !428
  %213 = load i32*, i32** %rk, align 8, !dbg !429
  %arrayidx345 = getelementptr inbounds i32, i32* %213, i64 14, !dbg !429
  store i32 %xor344, i32* %arrayidx345, align 4, !dbg !430
  %214 = load i32*, i32** %rk, align 8, !dbg !431
  %arrayidx346 = getelementptr inbounds i32, i32* %214, i64 7, !dbg !431
  %215 = load i32, i32* %arrayidx346, align 4, !dbg !431
  %216 = load i32*, i32** %rk, align 8, !dbg !432
  %arrayidx347 = getelementptr inbounds i32, i32* %216, i64 14, !dbg !432
  %217 = load i32, i32* %arrayidx347, align 4, !dbg !432
  %xor348 = xor i32 %215, %217, !dbg !433
  %218 = load i32*, i32** %rk, align 8, !dbg !434
  %arrayidx349 = getelementptr inbounds i32, i32* %218, i64 15, !dbg !434
  store i32 %xor348, i32* %arrayidx349, align 4, !dbg !435
  %219 = load i32*, i32** %rk, align 8, !dbg !436
  %add.ptr350 = getelementptr inbounds i32, i32* %219, i64 8, !dbg !436
  store i32* %add.ptr350, i32** %rk, align 8, !dbg !436
  br label %while.body267, !dbg !340, !llvm.loop !437

if.end351:                                        ; preds = %if.end225
  store i32 0, i32* %retval, align 4, !dbg !439
  br label %return, !dbg !439

return:                                           ; preds = %if.end351, %if.then311, %if.then214, %if.then125, %if.then5, %if.then
  %220 = load i32, i32* %retval, align 4, !dbg !440
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @AES_encrypt(i8* %in, i8* %out, %struct.aes_key_st* %key) #0 !dbg !441 {
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
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !446, metadata !DIExpression()), !dbg !447
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !448, metadata !DIExpression()), !dbg !449
  store %struct.aes_key_st* %key, %struct.aes_key_st** %key.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.aes_key_st** %key.addr, metadata !450, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.declare(metadata i32** %rk, metadata !452, metadata !DIExpression()), !dbg !454
  call void @llvm.dbg.declare(metadata i32* %s0, metadata !455, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.declare(metadata i32* %s1, metadata !457, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.declare(metadata i32* %s2, metadata !459, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.declare(metadata i32* %s3, metadata !461, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.declare(metadata i32* %t0, metadata !463, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.declare(metadata i32* %t1, metadata !465, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.declare(metadata i32* %t2, metadata !467, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata i32* %t3, metadata !469, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.declare(metadata i32* %r, metadata !471, metadata !DIExpression()), !dbg !472
  %0 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !473
  %rd_key = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %0, i32 0, i32 0, !dbg !474
  %arraydecay = getelementptr inbounds [60 x i32], [60 x i32]* %rd_key, i32 0, i32 0, !dbg !473
  store i32* %arraydecay, i32** %rk, align 8, !dbg !475
  %1 = load i8*, i8** %in.addr, align 8, !dbg !476
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !476
  %2 = load i8, i8* %arrayidx, align 1, !dbg !476
  %conv = zext i8 %2 to i32, !dbg !476
  %shl = shl i32 %conv, 24, !dbg !476
  %3 = load i8*, i8** %in.addr, align 8, !dbg !476
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 1, !dbg !476
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !476
  %conv2 = zext i8 %4 to i32, !dbg !476
  %shl3 = shl i32 %conv2, 16, !dbg !476
  %xor = xor i32 %shl, %shl3, !dbg !476
  %5 = load i8*, i8** %in.addr, align 8, !dbg !476
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 2, !dbg !476
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !476
  %conv5 = zext i8 %6 to i32, !dbg !476
  %shl6 = shl i32 %conv5, 8, !dbg !476
  %xor7 = xor i32 %xor, %shl6, !dbg !476
  %7 = load i8*, i8** %in.addr, align 8, !dbg !476
  %arrayidx8 = getelementptr inbounds i8, i8* %7, i64 3, !dbg !476
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !476
  %conv9 = zext i8 %8 to i32, !dbg !476
  %xor10 = xor i32 %xor7, %conv9, !dbg !476
  %9 = load i32*, i32** %rk, align 8, !dbg !477
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !477
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !477
  %xor12 = xor i32 %xor10, %10, !dbg !478
  store i32 %xor12, i32* %s0, align 4, !dbg !479
  %11 = load i8*, i8** %in.addr, align 8, !dbg !480
  %add.ptr = getelementptr inbounds i8, i8* %11, i64 4, !dbg !480
  %arrayidx13 = getelementptr inbounds i8, i8* %add.ptr, i64 0, !dbg !480
  %12 = load i8, i8* %arrayidx13, align 1, !dbg !480
  %conv14 = zext i8 %12 to i32, !dbg !480
  %shl15 = shl i32 %conv14, 24, !dbg !480
  %13 = load i8*, i8** %in.addr, align 8, !dbg !480
  %add.ptr16 = getelementptr inbounds i8, i8* %13, i64 4, !dbg !480
  %arrayidx17 = getelementptr inbounds i8, i8* %add.ptr16, i64 1, !dbg !480
  %14 = load i8, i8* %arrayidx17, align 1, !dbg !480
  %conv18 = zext i8 %14 to i32, !dbg !480
  %shl19 = shl i32 %conv18, 16, !dbg !480
  %xor20 = xor i32 %shl15, %shl19, !dbg !480
  %15 = load i8*, i8** %in.addr, align 8, !dbg !480
  %add.ptr21 = getelementptr inbounds i8, i8* %15, i64 4, !dbg !480
  %arrayidx22 = getelementptr inbounds i8, i8* %add.ptr21, i64 2, !dbg !480
  %16 = load i8, i8* %arrayidx22, align 1, !dbg !480
  %conv23 = zext i8 %16 to i32, !dbg !480
  %shl24 = shl i32 %conv23, 8, !dbg !480
  %xor25 = xor i32 %xor20, %shl24, !dbg !480
  %17 = load i8*, i8** %in.addr, align 8, !dbg !480
  %add.ptr26 = getelementptr inbounds i8, i8* %17, i64 4, !dbg !480
  %arrayidx27 = getelementptr inbounds i8, i8* %add.ptr26, i64 3, !dbg !480
  %18 = load i8, i8* %arrayidx27, align 1, !dbg !480
  %conv28 = zext i8 %18 to i32, !dbg !480
  %xor29 = xor i32 %xor25, %conv28, !dbg !480
  %19 = load i32*, i32** %rk, align 8, !dbg !481
  %arrayidx30 = getelementptr inbounds i32, i32* %19, i64 1, !dbg !481
  %20 = load i32, i32* %arrayidx30, align 4, !dbg !481
  %xor31 = xor i32 %xor29, %20, !dbg !482
  store i32 %xor31, i32* %s1, align 4, !dbg !483
  %21 = load i8*, i8** %in.addr, align 8, !dbg !484
  %add.ptr32 = getelementptr inbounds i8, i8* %21, i64 8, !dbg !484
  %arrayidx33 = getelementptr inbounds i8, i8* %add.ptr32, i64 0, !dbg !484
  %22 = load i8, i8* %arrayidx33, align 1, !dbg !484
  %conv34 = zext i8 %22 to i32, !dbg !484
  %shl35 = shl i32 %conv34, 24, !dbg !484
  %23 = load i8*, i8** %in.addr, align 8, !dbg !484
  %add.ptr36 = getelementptr inbounds i8, i8* %23, i64 8, !dbg !484
  %arrayidx37 = getelementptr inbounds i8, i8* %add.ptr36, i64 1, !dbg !484
  %24 = load i8, i8* %arrayidx37, align 1, !dbg !484
  %conv38 = zext i8 %24 to i32, !dbg !484
  %shl39 = shl i32 %conv38, 16, !dbg !484
  %xor40 = xor i32 %shl35, %shl39, !dbg !484
  %25 = load i8*, i8** %in.addr, align 8, !dbg !484
  %add.ptr41 = getelementptr inbounds i8, i8* %25, i64 8, !dbg !484
  %arrayidx42 = getelementptr inbounds i8, i8* %add.ptr41, i64 2, !dbg !484
  %26 = load i8, i8* %arrayidx42, align 1, !dbg !484
  %conv43 = zext i8 %26 to i32, !dbg !484
  %shl44 = shl i32 %conv43, 8, !dbg !484
  %xor45 = xor i32 %xor40, %shl44, !dbg !484
  %27 = load i8*, i8** %in.addr, align 8, !dbg !484
  %add.ptr46 = getelementptr inbounds i8, i8* %27, i64 8, !dbg !484
  %arrayidx47 = getelementptr inbounds i8, i8* %add.ptr46, i64 3, !dbg !484
  %28 = load i8, i8* %arrayidx47, align 1, !dbg !484
  %conv48 = zext i8 %28 to i32, !dbg !484
  %xor49 = xor i32 %xor45, %conv48, !dbg !484
  %29 = load i32*, i32** %rk, align 8, !dbg !485
  %arrayidx50 = getelementptr inbounds i32, i32* %29, i64 2, !dbg !485
  %30 = load i32, i32* %arrayidx50, align 4, !dbg !485
  %xor51 = xor i32 %xor49, %30, !dbg !486
  store i32 %xor51, i32* %s2, align 4, !dbg !487
  %31 = load i8*, i8** %in.addr, align 8, !dbg !488
  %add.ptr52 = getelementptr inbounds i8, i8* %31, i64 12, !dbg !488
  %arrayidx53 = getelementptr inbounds i8, i8* %add.ptr52, i64 0, !dbg !488
  %32 = load i8, i8* %arrayidx53, align 1, !dbg !488
  %conv54 = zext i8 %32 to i32, !dbg !488
  %shl55 = shl i32 %conv54, 24, !dbg !488
  %33 = load i8*, i8** %in.addr, align 8, !dbg !488
  %add.ptr56 = getelementptr inbounds i8, i8* %33, i64 12, !dbg !488
  %arrayidx57 = getelementptr inbounds i8, i8* %add.ptr56, i64 1, !dbg !488
  %34 = load i8, i8* %arrayidx57, align 1, !dbg !488
  %conv58 = zext i8 %34 to i32, !dbg !488
  %shl59 = shl i32 %conv58, 16, !dbg !488
  %xor60 = xor i32 %shl55, %shl59, !dbg !488
  %35 = load i8*, i8** %in.addr, align 8, !dbg !488
  %add.ptr61 = getelementptr inbounds i8, i8* %35, i64 12, !dbg !488
  %arrayidx62 = getelementptr inbounds i8, i8* %add.ptr61, i64 2, !dbg !488
  %36 = load i8, i8* %arrayidx62, align 1, !dbg !488
  %conv63 = zext i8 %36 to i32, !dbg !488
  %shl64 = shl i32 %conv63, 8, !dbg !488
  %xor65 = xor i32 %xor60, %shl64, !dbg !488
  %37 = load i8*, i8** %in.addr, align 8, !dbg !488
  %add.ptr66 = getelementptr inbounds i8, i8* %37, i64 12, !dbg !488
  %arrayidx67 = getelementptr inbounds i8, i8* %add.ptr66, i64 3, !dbg !488
  %38 = load i8, i8* %arrayidx67, align 1, !dbg !488
  %conv68 = zext i8 %38 to i32, !dbg !488
  %xor69 = xor i32 %xor65, %conv68, !dbg !488
  %39 = load i32*, i32** %rk, align 8, !dbg !489
  %arrayidx70 = getelementptr inbounds i32, i32* %39, i64 3, !dbg !489
  %40 = load i32, i32* %arrayidx70, align 4, !dbg !489
  %xor71 = xor i32 %xor69, %40, !dbg !490
  store i32 %xor71, i32* %s3, align 4, !dbg !491
  %41 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !492
  %rounds = getelementptr inbounds %struct.aes_key_st, %struct.aes_key_st* %41, i32 0, i32 1, !dbg !493
  %42 = load i32, i32* %rounds, align 4, !dbg !493
  %shr = ashr i32 %42, 1, !dbg !494
  store i32 %shr, i32* %r, align 4, !dbg !495
  br label %for.cond, !dbg !496

for.cond:                                         ; preds = %if.end, %entry
  %43 = load i32, i32* %s0, align 4, !dbg !497
  %shr72 = lshr i32 %43, 24, !dbg !501
  %idxprom = zext i32 %shr72 to i64, !dbg !502
  %arrayidx73 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom, !dbg !502
  %44 = load i32, i32* %arrayidx73, align 4, !dbg !502
  %45 = load i32, i32* %s1, align 4, !dbg !503
  %shr74 = lshr i32 %45, 16, !dbg !504
  %and = and i32 %shr74, 255, !dbg !505
  %idxprom75 = zext i32 %and to i64, !dbg !506
  %arrayidx76 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom75, !dbg !506
  %46 = load i32, i32* %arrayidx76, align 4, !dbg !506
  %xor77 = xor i32 %44, %46, !dbg !507
  %47 = load i32, i32* %s2, align 4, !dbg !508
  %shr78 = lshr i32 %47, 8, !dbg !509
  %and79 = and i32 %shr78, 255, !dbg !510
  %idxprom80 = zext i32 %and79 to i64, !dbg !511
  %arrayidx81 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom80, !dbg !511
  %48 = load i32, i32* %arrayidx81, align 4, !dbg !511
  %xor82 = xor i32 %xor77, %48, !dbg !512
  %49 = load i32, i32* %s3, align 4, !dbg !513
  %and83 = and i32 %49, 255, !dbg !514
  %idxprom84 = zext i32 %and83 to i64, !dbg !515
  %arrayidx85 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom84, !dbg !515
  %50 = load i32, i32* %arrayidx85, align 4, !dbg !515
  %xor86 = xor i32 %xor82, %50, !dbg !516
  %51 = load i32*, i32** %rk, align 8, !dbg !517
  %arrayidx87 = getelementptr inbounds i32, i32* %51, i64 4, !dbg !517
  %52 = load i32, i32* %arrayidx87, align 4, !dbg !517
  %xor88 = xor i32 %xor86, %52, !dbg !518
  store i32 %xor88, i32* %t0, align 4, !dbg !519
  %53 = load i32, i32* %s1, align 4, !dbg !520
  %shr89 = lshr i32 %53, 24, !dbg !521
  %idxprom90 = zext i32 %shr89 to i64, !dbg !522
  %arrayidx91 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom90, !dbg !522
  %54 = load i32, i32* %arrayidx91, align 4, !dbg !522
  %55 = load i32, i32* %s2, align 4, !dbg !523
  %shr92 = lshr i32 %55, 16, !dbg !524
  %and93 = and i32 %shr92, 255, !dbg !525
  %idxprom94 = zext i32 %and93 to i64, !dbg !526
  %arrayidx95 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom94, !dbg !526
  %56 = load i32, i32* %arrayidx95, align 4, !dbg !526
  %xor96 = xor i32 %54, %56, !dbg !527
  %57 = load i32, i32* %s3, align 4, !dbg !528
  %shr97 = lshr i32 %57, 8, !dbg !529
  %and98 = and i32 %shr97, 255, !dbg !530
  %idxprom99 = zext i32 %and98 to i64, !dbg !531
  %arrayidx100 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom99, !dbg !531
  %58 = load i32, i32* %arrayidx100, align 4, !dbg !531
  %xor101 = xor i32 %xor96, %58, !dbg !532
  %59 = load i32, i32* %s0, align 4, !dbg !533
  %and102 = and i32 %59, 255, !dbg !534
  %idxprom103 = zext i32 %and102 to i64, !dbg !535
  %arrayidx104 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom103, !dbg !535
  %60 = load i32, i32* %arrayidx104, align 4, !dbg !535
  %xor105 = xor i32 %xor101, %60, !dbg !536
  %61 = load i32*, i32** %rk, align 8, !dbg !537
  %arrayidx106 = getelementptr inbounds i32, i32* %61, i64 5, !dbg !537
  %62 = load i32, i32* %arrayidx106, align 4, !dbg !537
  %xor107 = xor i32 %xor105, %62, !dbg !538
  store i32 %xor107, i32* %t1, align 4, !dbg !539
  %63 = load i32, i32* %s2, align 4, !dbg !540
  %shr108 = lshr i32 %63, 24, !dbg !541
  %idxprom109 = zext i32 %shr108 to i64, !dbg !542
  %arrayidx110 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom109, !dbg !542
  %64 = load i32, i32* %arrayidx110, align 4, !dbg !542
  %65 = load i32, i32* %s3, align 4, !dbg !543
  %shr111 = lshr i32 %65, 16, !dbg !544
  %and112 = and i32 %shr111, 255, !dbg !545
  %idxprom113 = zext i32 %and112 to i64, !dbg !546
  %arrayidx114 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom113, !dbg !546
  %66 = load i32, i32* %arrayidx114, align 4, !dbg !546
  %xor115 = xor i32 %64, %66, !dbg !547
  %67 = load i32, i32* %s0, align 4, !dbg !548
  %shr116 = lshr i32 %67, 8, !dbg !549
  %and117 = and i32 %shr116, 255, !dbg !550
  %idxprom118 = zext i32 %and117 to i64, !dbg !551
  %arrayidx119 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom118, !dbg !551
  %68 = load i32, i32* %arrayidx119, align 4, !dbg !551
  %xor120 = xor i32 %xor115, %68, !dbg !552
  %69 = load i32, i32* %s1, align 4, !dbg !553
  %and121 = and i32 %69, 255, !dbg !554
  %idxprom122 = zext i32 %and121 to i64, !dbg !555
  %arrayidx123 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom122, !dbg !555
  %70 = load i32, i32* %arrayidx123, align 4, !dbg !555
  %xor124 = xor i32 %xor120, %70, !dbg !556
  %71 = load i32*, i32** %rk, align 8, !dbg !557
  %arrayidx125 = getelementptr inbounds i32, i32* %71, i64 6, !dbg !557
  %72 = load i32, i32* %arrayidx125, align 4, !dbg !557
  %xor126 = xor i32 %xor124, %72, !dbg !558
  store i32 %xor126, i32* %t2, align 4, !dbg !559
  %73 = load i32, i32* %s3, align 4, !dbg !560
  %shr127 = lshr i32 %73, 24, !dbg !561
  %idxprom128 = zext i32 %shr127 to i64, !dbg !562
  %arrayidx129 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom128, !dbg !562
  %74 = load i32, i32* %arrayidx129, align 4, !dbg !562
  %75 = load i32, i32* %s0, align 4, !dbg !563
  %shr130 = lshr i32 %75, 16, !dbg !564
  %and131 = and i32 %shr130, 255, !dbg !565
  %idxprom132 = zext i32 %and131 to i64, !dbg !566
  %arrayidx133 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom132, !dbg !566
  %76 = load i32, i32* %arrayidx133, align 4, !dbg !566
  %xor134 = xor i32 %74, %76, !dbg !567
  %77 = load i32, i32* %s1, align 4, !dbg !568
  %shr135 = lshr i32 %77, 8, !dbg !569
  %and136 = and i32 %shr135, 255, !dbg !570
  %idxprom137 = zext i32 %and136 to i64, !dbg !571
  %arrayidx138 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom137, !dbg !571
  %78 = load i32, i32* %arrayidx138, align 4, !dbg !571
  %xor139 = xor i32 %xor134, %78, !dbg !572
  %79 = load i32, i32* %s2, align 4, !dbg !573
  %and140 = and i32 %79, 255, !dbg !574
  %idxprom141 = zext i32 %and140 to i64, !dbg !575
  %arrayidx142 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom141, !dbg !575
  %80 = load i32, i32* %arrayidx142, align 4, !dbg !575
  %xor143 = xor i32 %xor139, %80, !dbg !576
  %81 = load i32*, i32** %rk, align 8, !dbg !577
  %arrayidx144 = getelementptr inbounds i32, i32* %81, i64 7, !dbg !577
  %82 = load i32, i32* %arrayidx144, align 4, !dbg !577
  %xor145 = xor i32 %xor143, %82, !dbg !578
  store i32 %xor145, i32* %t3, align 4, !dbg !579
  %83 = load i32*, i32** %rk, align 8, !dbg !580
  %add.ptr146 = getelementptr inbounds i32, i32* %83, i64 8, !dbg !580
  store i32* %add.ptr146, i32** %rk, align 8, !dbg !580
  %84 = load i32, i32* %r, align 4, !dbg !581
  %dec = add nsw i32 %84, -1, !dbg !581
  store i32 %dec, i32* %r, align 4, !dbg !581
  %cmp = icmp eq i32 %dec, 0, !dbg !583
  br i1 %cmp, label %if.then, label %if.end, !dbg !584

if.then:                                          ; preds = %for.cond
  br label %for.end, !dbg !585

if.end:                                           ; preds = %for.cond
  %85 = load i32, i32* %t0, align 4, !dbg !587
  %shr148 = lshr i32 %85, 24, !dbg !588
  %idxprom149 = zext i32 %shr148 to i64, !dbg !589
  %arrayidx150 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom149, !dbg !589
  %86 = load i32, i32* %arrayidx150, align 4, !dbg !589
  %87 = load i32, i32* %t1, align 4, !dbg !590
  %shr151 = lshr i32 %87, 16, !dbg !591
  %and152 = and i32 %shr151, 255, !dbg !592
  %idxprom153 = zext i32 %and152 to i64, !dbg !593
  %arrayidx154 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom153, !dbg !593
  %88 = load i32, i32* %arrayidx154, align 4, !dbg !593
  %xor155 = xor i32 %86, %88, !dbg !594
  %89 = load i32, i32* %t2, align 4, !dbg !595
  %shr156 = lshr i32 %89, 8, !dbg !596
  %and157 = and i32 %shr156, 255, !dbg !597
  %idxprom158 = zext i32 %and157 to i64, !dbg !598
  %arrayidx159 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom158, !dbg !598
  %90 = load i32, i32* %arrayidx159, align 4, !dbg !598
  %xor160 = xor i32 %xor155, %90, !dbg !599
  %91 = load i32, i32* %t3, align 4, !dbg !600
  %and161 = and i32 %91, 255, !dbg !601
  %idxprom162 = zext i32 %and161 to i64, !dbg !602
  %arrayidx163 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom162, !dbg !602
  %92 = load i32, i32* %arrayidx163, align 4, !dbg !602
  %xor164 = xor i32 %xor160, %92, !dbg !603
  %93 = load i32*, i32** %rk, align 8, !dbg !604
  %arrayidx165 = getelementptr inbounds i32, i32* %93, i64 0, !dbg !604
  %94 = load i32, i32* %arrayidx165, align 4, !dbg !604
  %xor166 = xor i32 %xor164, %94, !dbg !605
  store i32 %xor166, i32* %s0, align 4, !dbg !606
  %95 = load i32, i32* %t1, align 4, !dbg !607
  %shr167 = lshr i32 %95, 24, !dbg !608
  %idxprom168 = zext i32 %shr167 to i64, !dbg !609
  %arrayidx169 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom168, !dbg !609
  %96 = load i32, i32* %arrayidx169, align 4, !dbg !609
  %97 = load i32, i32* %t2, align 4, !dbg !610
  %shr170 = lshr i32 %97, 16, !dbg !611
  %and171 = and i32 %shr170, 255, !dbg !612
  %idxprom172 = zext i32 %and171 to i64, !dbg !613
  %arrayidx173 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom172, !dbg !613
  %98 = load i32, i32* %arrayidx173, align 4, !dbg !613
  %xor174 = xor i32 %96, %98, !dbg !614
  %99 = load i32, i32* %t3, align 4, !dbg !615
  %shr175 = lshr i32 %99, 8, !dbg !616
  %and176 = and i32 %shr175, 255, !dbg !617
  %idxprom177 = zext i32 %and176 to i64, !dbg !618
  %arrayidx178 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom177, !dbg !618
  %100 = load i32, i32* %arrayidx178, align 4, !dbg !618
  %xor179 = xor i32 %xor174, %100, !dbg !619
  %101 = load i32, i32* %t0, align 4, !dbg !620
  %and180 = and i32 %101, 255, !dbg !621
  %idxprom181 = zext i32 %and180 to i64, !dbg !622
  %arrayidx182 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom181, !dbg !622
  %102 = load i32, i32* %arrayidx182, align 4, !dbg !622
  %xor183 = xor i32 %xor179, %102, !dbg !623
  %103 = load i32*, i32** %rk, align 8, !dbg !624
  %arrayidx184 = getelementptr inbounds i32, i32* %103, i64 1, !dbg !624
  %104 = load i32, i32* %arrayidx184, align 4, !dbg !624
  %xor185 = xor i32 %xor183, %104, !dbg !625
  store i32 %xor185, i32* %s1, align 4, !dbg !626
  %105 = load i32, i32* %t2, align 4, !dbg !627
  %shr186 = lshr i32 %105, 24, !dbg !628
  %idxprom187 = zext i32 %shr186 to i64, !dbg !629
  %arrayidx188 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom187, !dbg !629
  %106 = load i32, i32* %arrayidx188, align 4, !dbg !629
  %107 = load i32, i32* %t3, align 4, !dbg !630
  %shr189 = lshr i32 %107, 16, !dbg !631
  %and190 = and i32 %shr189, 255, !dbg !632
  %idxprom191 = zext i32 %and190 to i64, !dbg !633
  %arrayidx192 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom191, !dbg !633
  %108 = load i32, i32* %arrayidx192, align 4, !dbg !633
  %xor193 = xor i32 %106, %108, !dbg !634
  %109 = load i32, i32* %t0, align 4, !dbg !635
  %shr194 = lshr i32 %109, 8, !dbg !636
  %and195 = and i32 %shr194, 255, !dbg !637
  %idxprom196 = zext i32 %and195 to i64, !dbg !638
  %arrayidx197 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom196, !dbg !638
  %110 = load i32, i32* %arrayidx197, align 4, !dbg !638
  %xor198 = xor i32 %xor193, %110, !dbg !639
  %111 = load i32, i32* %t1, align 4, !dbg !640
  %and199 = and i32 %111, 255, !dbg !641
  %idxprom200 = zext i32 %and199 to i64, !dbg !642
  %arrayidx201 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom200, !dbg !642
  %112 = load i32, i32* %arrayidx201, align 4, !dbg !642
  %xor202 = xor i32 %xor198, %112, !dbg !643
  %113 = load i32*, i32** %rk, align 8, !dbg !644
  %arrayidx203 = getelementptr inbounds i32, i32* %113, i64 2, !dbg !644
  %114 = load i32, i32* %arrayidx203, align 4, !dbg !644
  %xor204 = xor i32 %xor202, %114, !dbg !645
  store i32 %xor204, i32* %s2, align 4, !dbg !646
  %115 = load i32, i32* %t3, align 4, !dbg !647
  %shr205 = lshr i32 %115, 24, !dbg !648
  %idxprom206 = zext i32 %shr205 to i64, !dbg !649
  %arrayidx207 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom206, !dbg !649
  %116 = load i32, i32* %arrayidx207, align 4, !dbg !649
  %117 = load i32, i32* %t0, align 4, !dbg !650
  %shr208 = lshr i32 %117, 16, !dbg !651
  %and209 = and i32 %shr208, 255, !dbg !652
  %idxprom210 = zext i32 %and209 to i64, !dbg !653
  %arrayidx211 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom210, !dbg !653
  %118 = load i32, i32* %arrayidx211, align 4, !dbg !653
  %xor212 = xor i32 %116, %118, !dbg !654
  %119 = load i32, i32* %t1, align 4, !dbg !655
  %shr213 = lshr i32 %119, 8, !dbg !656
  %and214 = and i32 %shr213, 255, !dbg !657
  %idxprom215 = zext i32 %and214 to i64, !dbg !658
  %arrayidx216 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom215, !dbg !658
  %120 = load i32, i32* %arrayidx216, align 4, !dbg !658
  %xor217 = xor i32 %xor212, %120, !dbg !659
  %121 = load i32, i32* %t2, align 4, !dbg !660
  %and218 = and i32 %121, 255, !dbg !661
  %idxprom219 = zext i32 %and218 to i64, !dbg !662
  %arrayidx220 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom219, !dbg !662
  %122 = load i32, i32* %arrayidx220, align 4, !dbg !662
  %xor221 = xor i32 %xor217, %122, !dbg !663
  %123 = load i32*, i32** %rk, align 8, !dbg !664
  %arrayidx222 = getelementptr inbounds i32, i32* %123, i64 3, !dbg !664
  %124 = load i32, i32* %arrayidx222, align 4, !dbg !664
  %xor223 = xor i32 %xor221, %124, !dbg !665
  store i32 %xor223, i32* %s3, align 4, !dbg !666
  br label %for.cond, !dbg !667, !llvm.loop !668

for.end:                                          ; preds = %if.then
  %125 = load i32, i32* %t0, align 4, !dbg !671
  %shr224 = lshr i32 %125, 24, !dbg !672
  %idxprom225 = zext i32 %shr224 to i64, !dbg !673
  %arrayidx226 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom225, !dbg !673
  %126 = load i32, i32* %arrayidx226, align 4, !dbg !673
  %and227 = and i32 %126, -16777216, !dbg !674
  %127 = load i32, i32* %t1, align 4, !dbg !675
  %shr228 = lshr i32 %127, 16, !dbg !676
  %and229 = and i32 %shr228, 255, !dbg !677
  %idxprom230 = zext i32 %and229 to i64, !dbg !678
  %arrayidx231 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom230, !dbg !678
  %128 = load i32, i32* %arrayidx231, align 4, !dbg !678
  %and232 = and i32 %128, 16711680, !dbg !679
  %xor233 = xor i32 %and227, %and232, !dbg !680
  %129 = load i32, i32* %t2, align 4, !dbg !681
  %shr234 = lshr i32 %129, 8, !dbg !682
  %and235 = and i32 %shr234, 255, !dbg !683
  %idxprom236 = zext i32 %and235 to i64, !dbg !684
  %arrayidx237 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom236, !dbg !684
  %130 = load i32, i32* %arrayidx237, align 4, !dbg !684
  %and238 = and i32 %130, 65280, !dbg !685
  %xor239 = xor i32 %xor233, %and238, !dbg !686
  %131 = load i32, i32* %t3, align 4, !dbg !687
  %and240 = and i32 %131, 255, !dbg !688
  %idxprom241 = zext i32 %and240 to i64, !dbg !689
  %arrayidx242 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom241, !dbg !689
  %132 = load i32, i32* %arrayidx242, align 4, !dbg !689
  %and243 = and i32 %132, 255, !dbg !690
  %xor244 = xor i32 %xor239, %and243, !dbg !691
  %133 = load i32*, i32** %rk, align 8, !dbg !692
  %arrayidx245 = getelementptr inbounds i32, i32* %133, i64 0, !dbg !692
  %134 = load i32, i32* %arrayidx245, align 4, !dbg !692
  %xor246 = xor i32 %xor244, %134, !dbg !693
  store i32 %xor246, i32* %s0, align 4, !dbg !694
  %135 = load i32, i32* %s0, align 4, !dbg !695
  %shr247 = lshr i32 %135, 24, !dbg !695
  %conv248 = trunc i32 %shr247 to i8, !dbg !695
  %136 = load i8*, i8** %out.addr, align 8, !dbg !695
  %arrayidx249 = getelementptr inbounds i8, i8* %136, i64 0, !dbg !695
  store i8 %conv248, i8* %arrayidx249, align 1, !dbg !695
  %137 = load i32, i32* %s0, align 4, !dbg !695
  %shr250 = lshr i32 %137, 16, !dbg !695
  %conv251 = trunc i32 %shr250 to i8, !dbg !695
  %138 = load i8*, i8** %out.addr, align 8, !dbg !695
  %arrayidx252 = getelementptr inbounds i8, i8* %138, i64 1, !dbg !695
  store i8 %conv251, i8* %arrayidx252, align 1, !dbg !695
  %139 = load i32, i32* %s0, align 4, !dbg !695
  %shr253 = lshr i32 %139, 8, !dbg !695
  %conv254 = trunc i32 %shr253 to i8, !dbg !695
  %140 = load i8*, i8** %out.addr, align 8, !dbg !695
  %arrayidx255 = getelementptr inbounds i8, i8* %140, i64 2, !dbg !695
  store i8 %conv254, i8* %arrayidx255, align 1, !dbg !695
  %141 = load i32, i32* %s0, align 4, !dbg !695
  %conv256 = trunc i32 %141 to i8, !dbg !695
  %142 = load i8*, i8** %out.addr, align 8, !dbg !695
  %arrayidx257 = getelementptr inbounds i8, i8* %142, i64 3, !dbg !695
  store i8 %conv256, i8* %arrayidx257, align 1, !dbg !695
  %143 = load i32, i32* %t1, align 4, !dbg !697
  %shr258 = lshr i32 %143, 24, !dbg !698
  %idxprom259 = zext i32 %shr258 to i64, !dbg !699
  %arrayidx260 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom259, !dbg !699
  %144 = load i32, i32* %arrayidx260, align 4, !dbg !699
  %and261 = and i32 %144, -16777216, !dbg !700
  %145 = load i32, i32* %t2, align 4, !dbg !701
  %shr262 = lshr i32 %145, 16, !dbg !702
  %and263 = and i32 %shr262, 255, !dbg !703
  %idxprom264 = zext i32 %and263 to i64, !dbg !704
  %arrayidx265 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom264, !dbg !704
  %146 = load i32, i32* %arrayidx265, align 4, !dbg !704
  %and266 = and i32 %146, 16711680, !dbg !705
  %xor267 = xor i32 %and261, %and266, !dbg !706
  %147 = load i32, i32* %t3, align 4, !dbg !707
  %shr268 = lshr i32 %147, 8, !dbg !708
  %and269 = and i32 %shr268, 255, !dbg !709
  %idxprom270 = zext i32 %and269 to i64, !dbg !710
  %arrayidx271 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom270, !dbg !710
  %148 = load i32, i32* %arrayidx271, align 4, !dbg !710
  %and272 = and i32 %148, 65280, !dbg !711
  %xor273 = xor i32 %xor267, %and272, !dbg !712
  %149 = load i32, i32* %t0, align 4, !dbg !713
  %and274 = and i32 %149, 255, !dbg !714
  %idxprom275 = zext i32 %and274 to i64, !dbg !715
  %arrayidx276 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom275, !dbg !715
  %150 = load i32, i32* %arrayidx276, align 4, !dbg !715
  %and277 = and i32 %150, 255, !dbg !716
  %xor278 = xor i32 %xor273, %and277, !dbg !717
  %151 = load i32*, i32** %rk, align 8, !dbg !718
  %arrayidx279 = getelementptr inbounds i32, i32* %151, i64 1, !dbg !718
  %152 = load i32, i32* %arrayidx279, align 4, !dbg !718
  %xor280 = xor i32 %xor278, %152, !dbg !719
  store i32 %xor280, i32* %s1, align 4, !dbg !720
  %153 = load i32, i32* %s1, align 4, !dbg !721
  %shr281 = lshr i32 %153, 24, !dbg !721
  %conv282 = trunc i32 %shr281 to i8, !dbg !721
  %154 = load i8*, i8** %out.addr, align 8, !dbg !721
  %add.ptr283 = getelementptr inbounds i8, i8* %154, i64 4, !dbg !721
  %arrayidx284 = getelementptr inbounds i8, i8* %add.ptr283, i64 0, !dbg !721
  store i8 %conv282, i8* %arrayidx284, align 1, !dbg !721
  %155 = load i32, i32* %s1, align 4, !dbg !721
  %shr285 = lshr i32 %155, 16, !dbg !721
  %conv286 = trunc i32 %shr285 to i8, !dbg !721
  %156 = load i8*, i8** %out.addr, align 8, !dbg !721
  %add.ptr287 = getelementptr inbounds i8, i8* %156, i64 4, !dbg !721
  %arrayidx288 = getelementptr inbounds i8, i8* %add.ptr287, i64 1, !dbg !721
  store i8 %conv286, i8* %arrayidx288, align 1, !dbg !721
  %157 = load i32, i32* %s1, align 4, !dbg !721
  %shr289 = lshr i32 %157, 8, !dbg !721
  %conv290 = trunc i32 %shr289 to i8, !dbg !721
  %158 = load i8*, i8** %out.addr, align 8, !dbg !721
  %add.ptr291 = getelementptr inbounds i8, i8* %158, i64 4, !dbg !721
  %arrayidx292 = getelementptr inbounds i8, i8* %add.ptr291, i64 2, !dbg !721
  store i8 %conv290, i8* %arrayidx292, align 1, !dbg !721
  %159 = load i32, i32* %s1, align 4, !dbg !721
  %conv293 = trunc i32 %159 to i8, !dbg !721
  %160 = load i8*, i8** %out.addr, align 8, !dbg !721
  %add.ptr294 = getelementptr inbounds i8, i8* %160, i64 4, !dbg !721
  %arrayidx295 = getelementptr inbounds i8, i8* %add.ptr294, i64 3, !dbg !721
  store i8 %conv293, i8* %arrayidx295, align 1, !dbg !721
  %161 = load i32, i32* %t2, align 4, !dbg !723
  %shr296 = lshr i32 %161, 24, !dbg !724
  %idxprom297 = zext i32 %shr296 to i64, !dbg !725
  %arrayidx298 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom297, !dbg !725
  %162 = load i32, i32* %arrayidx298, align 4, !dbg !725
  %and299 = and i32 %162, -16777216, !dbg !726
  %163 = load i32, i32* %t3, align 4, !dbg !727
  %shr300 = lshr i32 %163, 16, !dbg !728
  %and301 = and i32 %shr300, 255, !dbg !729
  %idxprom302 = zext i32 %and301 to i64, !dbg !730
  %arrayidx303 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom302, !dbg !730
  %164 = load i32, i32* %arrayidx303, align 4, !dbg !730
  %and304 = and i32 %164, 16711680, !dbg !731
  %xor305 = xor i32 %and299, %and304, !dbg !732
  %165 = load i32, i32* %t0, align 4, !dbg !733
  %shr306 = lshr i32 %165, 8, !dbg !734
  %and307 = and i32 %shr306, 255, !dbg !735
  %idxprom308 = zext i32 %and307 to i64, !dbg !736
  %arrayidx309 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom308, !dbg !736
  %166 = load i32, i32* %arrayidx309, align 4, !dbg !736
  %and310 = and i32 %166, 65280, !dbg !737
  %xor311 = xor i32 %xor305, %and310, !dbg !738
  %167 = load i32, i32* %t1, align 4, !dbg !739
  %and312 = and i32 %167, 255, !dbg !740
  %idxprom313 = zext i32 %and312 to i64, !dbg !741
  %arrayidx314 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom313, !dbg !741
  %168 = load i32, i32* %arrayidx314, align 4, !dbg !741
  %and315 = and i32 %168, 255, !dbg !742
  %xor316 = xor i32 %xor311, %and315, !dbg !743
  %169 = load i32*, i32** %rk, align 8, !dbg !744
  %arrayidx317 = getelementptr inbounds i32, i32* %169, i64 2, !dbg !744
  %170 = load i32, i32* %arrayidx317, align 4, !dbg !744
  %xor318 = xor i32 %xor316, %170, !dbg !745
  store i32 %xor318, i32* %s2, align 4, !dbg !746
  %171 = load i32, i32* %s2, align 4, !dbg !747
  %shr319 = lshr i32 %171, 24, !dbg !747
  %conv320 = trunc i32 %shr319 to i8, !dbg !747
  %172 = load i8*, i8** %out.addr, align 8, !dbg !747
  %add.ptr321 = getelementptr inbounds i8, i8* %172, i64 8, !dbg !747
  %arrayidx322 = getelementptr inbounds i8, i8* %add.ptr321, i64 0, !dbg !747
  store i8 %conv320, i8* %arrayidx322, align 1, !dbg !747
  %173 = load i32, i32* %s2, align 4, !dbg !747
  %shr323 = lshr i32 %173, 16, !dbg !747
  %conv324 = trunc i32 %shr323 to i8, !dbg !747
  %174 = load i8*, i8** %out.addr, align 8, !dbg !747
  %add.ptr325 = getelementptr inbounds i8, i8* %174, i64 8, !dbg !747
  %arrayidx326 = getelementptr inbounds i8, i8* %add.ptr325, i64 1, !dbg !747
  store i8 %conv324, i8* %arrayidx326, align 1, !dbg !747
  %175 = load i32, i32* %s2, align 4, !dbg !747
  %shr327 = lshr i32 %175, 8, !dbg !747
  %conv328 = trunc i32 %shr327 to i8, !dbg !747
  %176 = load i8*, i8** %out.addr, align 8, !dbg !747
  %add.ptr329 = getelementptr inbounds i8, i8* %176, i64 8, !dbg !747
  %arrayidx330 = getelementptr inbounds i8, i8* %add.ptr329, i64 2, !dbg !747
  store i8 %conv328, i8* %arrayidx330, align 1, !dbg !747
  %177 = load i32, i32* %s2, align 4, !dbg !747
  %conv331 = trunc i32 %177 to i8, !dbg !747
  %178 = load i8*, i8** %out.addr, align 8, !dbg !747
  %add.ptr332 = getelementptr inbounds i8, i8* %178, i64 8, !dbg !747
  %arrayidx333 = getelementptr inbounds i8, i8* %add.ptr332, i64 3, !dbg !747
  store i8 %conv331, i8* %arrayidx333, align 1, !dbg !747
  %179 = load i32, i32* %t3, align 4, !dbg !749
  %shr334 = lshr i32 %179, 24, !dbg !750
  %idxprom335 = zext i32 %shr334 to i64, !dbg !751
  %arrayidx336 = getelementptr inbounds [256 x i32], [256 x i32]* @Te2, i64 0, i64 %idxprom335, !dbg !751
  %180 = load i32, i32* %arrayidx336, align 4, !dbg !751
  %and337 = and i32 %180, -16777216, !dbg !752
  %181 = load i32, i32* %t0, align 4, !dbg !753
  %shr338 = lshr i32 %181, 16, !dbg !754
  %and339 = and i32 %shr338, 255, !dbg !755
  %idxprom340 = zext i32 %and339 to i64, !dbg !756
  %arrayidx341 = getelementptr inbounds [256 x i32], [256 x i32]* @Te3, i64 0, i64 %idxprom340, !dbg !756
  %182 = load i32, i32* %arrayidx341, align 4, !dbg !756
  %and342 = and i32 %182, 16711680, !dbg !757
  %xor343 = xor i32 %and337, %and342, !dbg !758
  %183 = load i32, i32* %t1, align 4, !dbg !759
  %shr344 = lshr i32 %183, 8, !dbg !760
  %and345 = and i32 %shr344, 255, !dbg !761
  %idxprom346 = zext i32 %and345 to i64, !dbg !762
  %arrayidx347 = getelementptr inbounds [256 x i32], [256 x i32]* @Te0, i64 0, i64 %idxprom346, !dbg !762
  %184 = load i32, i32* %arrayidx347, align 4, !dbg !762
  %and348 = and i32 %184, 65280, !dbg !763
  %xor349 = xor i32 %xor343, %and348, !dbg !764
  %185 = load i32, i32* %t2, align 4, !dbg !765
  %and350 = and i32 %185, 255, !dbg !766
  %idxprom351 = zext i32 %and350 to i64, !dbg !767
  %arrayidx352 = getelementptr inbounds [256 x i32], [256 x i32]* @Te1, i64 0, i64 %idxprom351, !dbg !767
  %186 = load i32, i32* %arrayidx352, align 4, !dbg !767
  %and353 = and i32 %186, 255, !dbg !768
  %xor354 = xor i32 %xor349, %and353, !dbg !769
  %187 = load i32*, i32** %rk, align 8, !dbg !770
  %arrayidx355 = getelementptr inbounds i32, i32* %187, i64 3, !dbg !770
  %188 = load i32, i32* %arrayidx355, align 4, !dbg !770
  %xor356 = xor i32 %xor354, %188, !dbg !771
  store i32 %xor356, i32* %s3, align 4, !dbg !772
  %189 = load i32, i32* %s3, align 4, !dbg !773
  %shr357 = lshr i32 %189, 24, !dbg !773
  %conv358 = trunc i32 %shr357 to i8, !dbg !773
  %190 = load i8*, i8** %out.addr, align 8, !dbg !773
  %add.ptr359 = getelementptr inbounds i8, i8* %190, i64 12, !dbg !773
  %arrayidx360 = getelementptr inbounds i8, i8* %add.ptr359, i64 0, !dbg !773
  store i8 %conv358, i8* %arrayidx360, align 1, !dbg !773
  %191 = load i32, i32* %s3, align 4, !dbg !773
  %shr361 = lshr i32 %191, 16, !dbg !773
  %conv362 = trunc i32 %shr361 to i8, !dbg !773
  %192 = load i8*, i8** %out.addr, align 8, !dbg !773
  %add.ptr363 = getelementptr inbounds i8, i8* %192, i64 12, !dbg !773
  %arrayidx364 = getelementptr inbounds i8, i8* %add.ptr363, i64 1, !dbg !773
  store i8 %conv362, i8* %arrayidx364, align 1, !dbg !773
  %193 = load i32, i32* %s3, align 4, !dbg !773
  %shr365 = lshr i32 %193, 8, !dbg !773
  %conv366 = trunc i32 %shr365 to i8, !dbg !773
  %194 = load i8*, i8** %out.addr, align 8, !dbg !773
  %add.ptr367 = getelementptr inbounds i8, i8* %194, i64 12, !dbg !773
  %arrayidx368 = getelementptr inbounds i8, i8* %add.ptr367, i64 2, !dbg !773
  store i8 %conv366, i8* %arrayidx368, align 1, !dbg !773
  %195 = load i32, i32* %s3, align 4, !dbg !773
  %conv369 = trunc i32 %195 to i8, !dbg !773
  %196 = load i8*, i8** %out.addr, align 8, !dbg !773
  %add.ptr370 = getelementptr inbounds i8, i8* %196, i64 12, !dbg !773
  %arrayidx371 = getelementptr inbounds i8, i8* %add.ptr370, i64 3, !dbg !773
  store i8 %conv369, i8* %arrayidx371, align 1, !dbg !773
  ret void, !dbg !775
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @AES_ctr128_encrypt(i8* %in, i8* %out, i64 %length, %struct.aes_key_st* %key, i8* %ivec, i8* %ecount_buf, i32* %num) unnamed_addr #0 !dbg !776 {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %key.addr = alloca %struct.aes_key_st*, align 8
  %ivec.addr = alloca i8*, align 8
  %ecount_buf.addr = alloca i8*, align 8
  %num.addr = alloca i32*, align 8
  store i8* %in, i8** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !787, metadata !DIExpression()), !dbg !788
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !789, metadata !DIExpression()), !dbg !790
  store i64 %length, i64* %length.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %length.addr, metadata !791, metadata !DIExpression()), !dbg !792
  store %struct.aes_key_st* %key, %struct.aes_key_st** %key.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.aes_key_st** %key.addr, metadata !793, metadata !DIExpression()), !dbg !794
  store i8* %ivec, i8** %ivec.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ivec.addr, metadata !795, metadata !DIExpression()), !dbg !796
  store i8* %ecount_buf, i8** %ecount_buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ecount_buf.addr, metadata !797, metadata !DIExpression()), !dbg !798
  store i32* %num, i32** %num.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %num.addr, metadata !799, metadata !DIExpression()), !dbg !800
  %0 = load i8*, i8** %in.addr, align 8, !dbg !801
  %1 = load i8*, i8** %out.addr, align 8, !dbg !802
  %2 = load i64, i64* %length.addr, align 8, !dbg !803
  %3 = load %struct.aes_key_st*, %struct.aes_key_st** %key.addr, align 8, !dbg !804
  %4 = bitcast %struct.aes_key_st* %3 to i8*, !dbg !804
  %5 = load i8*, i8** %ivec.addr, align 8, !dbg !805
  %6 = load i8*, i8** %ecount_buf.addr, align 8, !dbg !806
  %7 = load i32*, i32** %num.addr, align 8, !dbg !807
  call fastcc void @CRYPTO_ctr128_encrypt(i8* %0, i8* %1, i64 %2, i8* %4, i8* %5, i8* %6, i32* %7), !dbg !808
  ret void, !dbg !809
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @CRYPTO_ctr128_encrypt(i8* %in, i8* %out, i64 %len, i8* %key, i8* %ivec, i8* %ecount_buf, i32* %num) unnamed_addr #0 !dbg !810 {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 8
  %ivec.addr = alloca i8*, align 8
  %ecount_buf.addr = alloca i8*, align 8
  %num.addr = alloca i32*, align 8
  %block.addr = alloca void (i8*, i8*, i8*)*, align 8
  %n = alloca i32, align 4
  %l = alloca i64, align 8
  store i8* %in, i8** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !815, metadata !DIExpression()), !dbg !816
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !817, metadata !DIExpression()), !dbg !818
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !819, metadata !DIExpression()), !dbg !820
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !821, metadata !DIExpression()), !dbg !822
  store i8* %ivec, i8** %ivec.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ivec.addr, metadata !823, metadata !DIExpression()), !dbg !824
  store i8* %ecount_buf, i8** %ecount_buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ecount_buf.addr, metadata !825, metadata !DIExpression()), !dbg !826
  store i32* %num, i32** %num.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %num.addr, metadata !827, metadata !DIExpression()), !dbg !828
  store void (i8*, i8*, i8*)* bitcast (void (i8*, i8*, %struct.aes_key_st*)* @AES_encrypt to void (i8*, i8*, i8*)*), void (i8*, i8*, i8*)** %block.addr, align 8
  call void @llvm.dbg.declare(metadata void (i8*, i8*, i8*)** %block.addr, metadata !829, metadata !DIExpression()), !dbg !830
  call void @llvm.dbg.declare(metadata i32* %n, metadata !831, metadata !DIExpression()), !dbg !832
  call void @llvm.dbg.declare(metadata i64* %l, metadata !833, metadata !DIExpression()), !dbg !834
  store i64 0, i64* %l, align 8, !dbg !834
  %0 = load i32*, i32** %num.addr, align 8, !dbg !835
  %1 = load i32, i32* %0, align 4, !dbg !836
  store i32 %1, i32* %n, align 4, !dbg !837
  br label %do.body, !dbg !838, !llvm.loop !840

do.body:                                          ; preds = %entry
  br label %while.cond, !dbg !842

while.cond:                                       ; preds = %while.body, %do.body
  %2 = load i32, i32* %n, align 4, !dbg !844
  %tobool = icmp ne i32 %2, 0, !dbg !844
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !845

land.rhs:                                         ; preds = %while.cond
  %3 = load i64, i64* %len.addr, align 8, !dbg !846
  %tobool1 = icmp ne i64 %3, 0, !dbg !845
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end, !dbg !842

while.body:                                       ; preds = %land.end
  %5 = load i8*, i8** %in.addr, align 8, !dbg !847
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1, !dbg !847
  store i8* %incdec.ptr, i8** %in.addr, align 8, !dbg !847
  %6 = load i8, i8* %5, align 1, !dbg !849
  %conv = zext i8 %6 to i32, !dbg !849
  %7 = load i8*, i8** %ecount_buf.addr, align 8, !dbg !850
  %8 = load i32, i32* %n, align 4, !dbg !851
  %idxprom = zext i32 %8 to i64, !dbg !850
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom, !dbg !850
  %9 = load i8, i8* %arrayidx, align 1, !dbg !850
  %conv2 = zext i8 %9 to i32, !dbg !850
  %xor = xor i32 %conv, %conv2, !dbg !852
  %conv3 = trunc i32 %xor to i8, !dbg !849
  %10 = load i8*, i8** %out.addr, align 8, !dbg !853
  %incdec.ptr4 = getelementptr inbounds i8, i8* %10, i32 1, !dbg !853
  store i8* %incdec.ptr4, i8** %out.addr, align 8, !dbg !853
  store i8 %conv3, i8* %10, align 1, !dbg !854
  %11 = load i64, i64* %len.addr, align 8, !dbg !855
  %dec = add i64 %11, -1, !dbg !855
  store i64 %dec, i64* %len.addr, align 8, !dbg !855
  %12 = load i32, i32* %n, align 4, !dbg !856
  %add = add i32 %12, 1, !dbg !857
  %rem = urem i32 %add, 16, !dbg !858
  store i32 %rem, i32* %n, align 4, !dbg !859
  br label %while.cond, !dbg !842, !llvm.loop !860

while.end:                                        ; preds = %land.end
  br label %while.cond5, !dbg !862

while.cond5:                                      ; preds = %for.end, %while.end
  %13 = load i64, i64* %len.addr, align 8, !dbg !863
  %cmp = icmp uge i64 %13, 16, !dbg !864
  br i1 %cmp, label %while.body7, label %while.end20, !dbg !862

while.body7:                                      ; preds = %while.cond5
  %14 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %block.addr, align 8, !dbg !865
  %15 = load i8*, i8** %ivec.addr, align 8, !dbg !867
  %16 = load i8*, i8** %ecount_buf.addr, align 8, !dbg !868
  %17 = load i8*, i8** %key.addr, align 8, !dbg !869
  call void %14(i8* %15, i8* %16, i8* %17), !dbg !870
  %18 = load i8*, i8** %ivec.addr, align 8, !dbg !871
  call fastcc void @ctr128_inc_aligned(i8* %18), !dbg !872
  store i32 0, i32* %n, align 4, !dbg !873
  br label %for.cond, !dbg !875

for.cond:                                         ; preds = %for.inc, %while.body7
  %19 = load i32, i32* %n, align 4, !dbg !876
  %cmp8 = icmp ult i32 %19, 16, !dbg !878
  br i1 %cmp8, label %for.body, label %for.end, !dbg !879

for.body:                                         ; preds = %for.cond
  %20 = load i8*, i8** %in.addr, align 8, !dbg !880
  %21 = load i32, i32* %n, align 4, !dbg !881
  %idx.ext = zext i32 %21 to i64, !dbg !882
  %add.ptr = getelementptr inbounds i8, i8* %20, i64 %idx.ext, !dbg !882
  %22 = bitcast i8* %add.ptr to i64*, !dbg !883
  %23 = load i64, i64* %22, align 8, !dbg !883
  %24 = load i8*, i8** %ecount_buf.addr, align 8, !dbg !884
  %25 = load i32, i32* %n, align 4, !dbg !885
  %idx.ext10 = zext i32 %25 to i64, !dbg !886
  %add.ptr11 = getelementptr inbounds i8, i8* %24, i64 %idx.ext10, !dbg !886
  %26 = bitcast i8* %add.ptr11 to i64*, !dbg !887
  %27 = load i64, i64* %26, align 8, !dbg !887
  %xor12 = xor i64 %23, %27, !dbg !888
  %28 = load i8*, i8** %out.addr, align 8, !dbg !889
  %29 = load i32, i32* %n, align 4, !dbg !890
  %idx.ext13 = zext i32 %29 to i64, !dbg !891
  %add.ptr14 = getelementptr inbounds i8, i8* %28, i64 %idx.ext13, !dbg !891
  %30 = bitcast i8* %add.ptr14 to i64*, !dbg !892
  store i64 %xor12, i64* %30, align 8, !dbg !893
  br label %for.inc, !dbg !892

for.inc:                                          ; preds = %for.body
  %31 = load i32, i32* %n, align 4, !dbg !894
  %conv15 = zext i32 %31 to i64, !dbg !894
  %add16 = add i64 %conv15, 8, !dbg !894
  %conv17 = trunc i64 %add16 to i32, !dbg !894
  store i32 %conv17, i32* %n, align 4, !dbg !894
  br label %for.cond, !dbg !895, !llvm.loop !896

for.end:                                          ; preds = %for.cond
  %32 = load i64, i64* %len.addr, align 8, !dbg !898
  %sub = sub i64 %32, 16, !dbg !898
  store i64 %sub, i64* %len.addr, align 8, !dbg !898
  %33 = load i8*, i8** %out.addr, align 8, !dbg !899
  %add.ptr18 = getelementptr inbounds i8, i8* %33, i64 16, !dbg !899
  store i8* %add.ptr18, i8** %out.addr, align 8, !dbg !899
  %34 = load i8*, i8** %in.addr, align 8, !dbg !900
  %add.ptr19 = getelementptr inbounds i8, i8* %34, i64 16, !dbg !900
  store i8* %add.ptr19, i8** %in.addr, align 8, !dbg !900
  br label %while.cond5, !dbg !862, !llvm.loop !901

while.end20:                                      ; preds = %while.cond5
  store i32 0, i32* %n, align 4, !dbg !903
  %35 = load i64, i64* %len.addr, align 8, !dbg !904
  %tobool21 = icmp ne i64 %35, 0, !dbg !904
  br i1 %tobool21, label %if.then, label %if.end, !dbg !906

if.then:                                          ; preds = %while.end20
  %36 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %block.addr, align 8, !dbg !907
  %37 = load i8*, i8** %ivec.addr, align 8, !dbg !909
  %38 = load i8*, i8** %ecount_buf.addr, align 8, !dbg !910
  %39 = load i8*, i8** %key.addr, align 8, !dbg !911
  call void %36(i8* %37, i8* %38, i8* %39), !dbg !912
  %40 = load i8*, i8** %ivec.addr, align 8, !dbg !913
  call fastcc void @ctr128_inc_aligned(i8* %40), !dbg !914
  br label %while.cond22, !dbg !915

while.cond22:                                     ; preds = %while.body25, %if.then
  %41 = load i64, i64* %len.addr, align 8, !dbg !916
  %dec23 = add i64 %41, -1, !dbg !916
  store i64 %dec23, i64* %len.addr, align 8, !dbg !916
  %tobool24 = icmp ne i64 %41, 0, !dbg !915
  br i1 %tobool24, label %while.body25, label %while.end36, !dbg !915

while.body25:                                     ; preds = %while.cond22
  %42 = load i8*, i8** %in.addr, align 8, !dbg !917
  %43 = load i32, i32* %n, align 4, !dbg !919
  %idxprom26 = zext i32 %43 to i64, !dbg !917
  %arrayidx27 = getelementptr inbounds i8, i8* %42, i64 %idxprom26, !dbg !917
  %44 = load i8, i8* %arrayidx27, align 1, !dbg !917
  %conv28 = zext i8 %44 to i32, !dbg !917
  %45 = load i8*, i8** %ecount_buf.addr, align 8, !dbg !920
  %46 = load i32, i32* %n, align 4, !dbg !921
  %idxprom29 = zext i32 %46 to i64, !dbg !920
  %arrayidx30 = getelementptr inbounds i8, i8* %45, i64 %idxprom29, !dbg !920
  %47 = load i8, i8* %arrayidx30, align 1, !dbg !920
  %conv31 = zext i8 %47 to i32, !dbg !920
  %xor32 = xor i32 %conv28, %conv31, !dbg !922
  %conv33 = trunc i32 %xor32 to i8, !dbg !917
  %48 = load i8*, i8** %out.addr, align 8, !dbg !923
  %49 = load i32, i32* %n, align 4, !dbg !924
  %idxprom34 = zext i32 %49 to i64, !dbg !923
  %arrayidx35 = getelementptr inbounds i8, i8* %48, i64 %idxprom34, !dbg !923
  store i8 %conv33, i8* %arrayidx35, align 1, !dbg !925
  %50 = load i32, i32* %n, align 4, !dbg !926
  %inc = add i32 %50, 1, !dbg !926
  store i32 %inc, i32* %n, align 4, !dbg !926
  br label %while.cond22, !dbg !915, !llvm.loop !927

while.end36:                                      ; preds = %while.cond22
  br label %if.end, !dbg !929

if.end:                                           ; preds = %while.end36, %while.end20
  %51 = load i32, i32* %n, align 4, !dbg !930
  %52 = load i32*, i32** %num.addr, align 8, !dbg !931
  store i32 %51, i32* %52, align 4, !dbg !932
  br label %return, !dbg !933

return:                                           ; preds = %if.end
  ret void, !dbg !934
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @ctr128_inc_aligned(i8* %counter) unnamed_addr #0 !dbg !935 {
entry:
  %counter.addr = alloca i8*, align 8
  %data = alloca i64*, align 8
  %c = alloca i64, align 8
  %n = alloca i64, align 8
  %is_endian = alloca %union.anon.5, align 8
  store i8* %counter, i8** %counter.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %counter.addr, metadata !938, metadata !DIExpression()), !dbg !939
  call void @llvm.dbg.declare(metadata i64** %data, metadata !940, metadata !DIExpression()), !dbg !941
  call void @llvm.dbg.declare(metadata i64* %c, metadata !942, metadata !DIExpression()), !dbg !943
  call void @llvm.dbg.declare(metadata i64* %n, metadata !944, metadata !DIExpression()), !dbg !945
  call void @llvm.dbg.declare(metadata %union.anon.5* %is_endian, metadata !946, metadata !DIExpression()), !dbg !954
  %0 = bitcast %union.anon.5* %is_endian to i8*, !dbg !954
  %1 = call i8* @memcpy(i8* %0, i8* bitcast (%union.anon.5* @ctr128_inc_aligned.is_endian to i8*), i64 8), !dbg !954
  %little = bitcast %union.anon.5* %is_endian to i8*, !dbg !955
  %2 = load i8, i8* %little, align 8, !dbg !955
  %tobool = icmp ne i8 %2, 0, !dbg !957
  br i1 %tobool, label %if.then, label %if.end, !dbg !958

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %counter.addr, align 8, !dbg !959
  call fastcc void @ctr128_inc(i8* %3), !dbg !961
  br label %do.end, !dbg !962

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %counter.addr, align 8, !dbg !963
  %5 = bitcast i8* %4 to i64*, !dbg !964
  store i64* %5, i64** %data, align 8, !dbg !965
  store i64 2, i64* %n, align 8, !dbg !966
  br label %do.body, !dbg !967, !llvm.loop !968

do.body:                                          ; preds = %do.cond, %if.end
  %6 = load i64, i64* %n, align 8, !dbg !970
  %dec = add i64 %6, -1, !dbg !970
  store i64 %dec, i64* %n, align 8, !dbg !970
  %7 = load i64*, i64** %data, align 8, !dbg !972
  %8 = load i64, i64* %n, align 8, !dbg !973
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !972
  %9 = load i64, i64* %arrayidx, align 8, !dbg !972
  store i64 %9, i64* %c, align 8, !dbg !974
  %10 = load i64, i64* %c, align 8, !dbg !975
  %inc = add i64 %10, 1, !dbg !975
  store i64 %inc, i64* %c, align 8, !dbg !975
  %11 = load i64, i64* %c, align 8, !dbg !976
  %12 = load i64*, i64** %data, align 8, !dbg !977
  %13 = load i64, i64* %n, align 8, !dbg !978
  %arrayidx1 = getelementptr inbounds i64, i64* %12, i64 %13, !dbg !977
  store i64 %11, i64* %arrayidx1, align 8, !dbg !979
  %14 = load i64, i64* %c, align 8, !dbg !980
  %tobool2 = icmp ne i64 %14, 0, !dbg !980
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !982

if.then3:                                         ; preds = %do.body
  br label %do.end, !dbg !983

if.end4:                                          ; preds = %do.body
  br label %do.cond, !dbg !984

do.cond:                                          ; preds = %if.end4
  %15 = load i64, i64* %n, align 8, !dbg !985
  %tobool5 = icmp ne i64 %15, 0, !dbg !984
  br i1 %tobool5, label %do.body, label %do.end.loopexit, !dbg !984, !llvm.loop !968

do.end.loopexit:                                  ; preds = %do.cond
  br label %do.end, !dbg !986

do.end:                                           ; preds = %do.end.loopexit, %if.then, %if.then3
  ret void, !dbg !986
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @ctr128_inc(i8* %counter) unnamed_addr #0 !dbg !987 {
entry:
  %counter.addr = alloca i8*, align 8
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  store i8* %counter, i8** %counter.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %counter.addr, metadata !988, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.declare(metadata i32* %c, metadata !990, metadata !DIExpression()), !dbg !991
  call void @llvm.dbg.declare(metadata i32* %n, metadata !992, metadata !DIExpression()), !dbg !993
  store i32 16, i32* %n, align 4, !dbg !993
  br label %do.body, !dbg !994, !llvm.loop !995

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, i32* %n, align 4, !dbg !997
  %sub = sub i32 %0, 4, !dbg !997
  store i32 %sub, i32* %n, align 4, !dbg !997
  %1 = load i8*, i8** %counter.addr, align 8, !dbg !999
  %2 = load i32, i32* %n, align 4, !dbg !999
  %idx.ext = zext i32 %2 to i64, !dbg !999
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 %idx.ext, !dbg !999
  %arrayidx = getelementptr inbounds i8, i8* %add.ptr, i64 0, !dbg !999
  %3 = load i8, i8* %arrayidx, align 1, !dbg !999
  %conv = zext i8 %3 to i32, !dbg !999
  %shl = shl i32 %conv, 24, !dbg !999
  %4 = load i8*, i8** %counter.addr, align 8, !dbg !999
  %5 = load i32, i32* %n, align 4, !dbg !999
  %idx.ext1 = zext i32 %5 to i64, !dbg !999
  %add.ptr2 = getelementptr inbounds i8, i8* %4, i64 %idx.ext1, !dbg !999
  %arrayidx3 = getelementptr inbounds i8, i8* %add.ptr2, i64 1, !dbg !999
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !999
  %conv4 = zext i8 %6 to i32, !dbg !999
  %shl5 = shl i32 %conv4, 16, !dbg !999
  %xor = xor i32 %shl, %shl5, !dbg !999
  %7 = load i8*, i8** %counter.addr, align 8, !dbg !999
  %8 = load i32, i32* %n, align 4, !dbg !999
  %idx.ext6 = zext i32 %8 to i64, !dbg !999
  %add.ptr7 = getelementptr inbounds i8, i8* %7, i64 %idx.ext6, !dbg !999
  %arrayidx8 = getelementptr inbounds i8, i8* %add.ptr7, i64 2, !dbg !999
  %9 = load i8, i8* %arrayidx8, align 1, !dbg !999
  %conv9 = zext i8 %9 to i32, !dbg !999
  %shl10 = shl i32 %conv9, 8, !dbg !999
  %xor11 = xor i32 %xor, %shl10, !dbg !999
  %10 = load i8*, i8** %counter.addr, align 8, !dbg !999
  %11 = load i32, i32* %n, align 4, !dbg !999
  %idx.ext12 = zext i32 %11 to i64, !dbg !999
  %add.ptr13 = getelementptr inbounds i8, i8* %10, i64 %idx.ext12, !dbg !999
  %arrayidx14 = getelementptr inbounds i8, i8* %add.ptr13, i64 3, !dbg !999
  %12 = load i8, i8* %arrayidx14, align 1, !dbg !999
  %conv15 = zext i8 %12 to i32, !dbg !999
  %xor16 = xor i32 %xor11, %conv15, !dbg !999
  store i32 %xor16, i32* %c, align 4, !dbg !1000
  %13 = load i32, i32* %c, align 4, !dbg !1001
  %inc = add i32 %13, 1, !dbg !1001
  store i32 %inc, i32* %c, align 4, !dbg !1001
  %14 = load i32, i32* %c, align 4, !dbg !1002
  store i32 %14, i32* %c, align 4, !dbg !1002
  %15 = load i32, i32* %c, align 4, !dbg !1003
  %shr = lshr i32 %15, 24, !dbg !1003
  %conv17 = trunc i32 %shr to i8, !dbg !1003
  %16 = load i8*, i8** %counter.addr, align 8, !dbg !1003
  %17 = load i32, i32* %n, align 4, !dbg !1003
  %idx.ext18 = zext i32 %17 to i64, !dbg !1003
  %add.ptr19 = getelementptr inbounds i8, i8* %16, i64 %idx.ext18, !dbg !1003
  %arrayidx20 = getelementptr inbounds i8, i8* %add.ptr19, i64 0, !dbg !1003
  store i8 %conv17, i8* %arrayidx20, align 1, !dbg !1003
  %18 = load i32, i32* %c, align 4, !dbg !1003
  %shr21 = lshr i32 %18, 16, !dbg !1003
  %conv22 = trunc i32 %shr21 to i8, !dbg !1003
  %19 = load i8*, i8** %counter.addr, align 8, !dbg !1003
  %20 = load i32, i32* %n, align 4, !dbg !1003
  %idx.ext23 = zext i32 %20 to i64, !dbg !1003
  %add.ptr24 = getelementptr inbounds i8, i8* %19, i64 %idx.ext23, !dbg !1003
  %arrayidx25 = getelementptr inbounds i8, i8* %add.ptr24, i64 1, !dbg !1003
  store i8 %conv22, i8* %arrayidx25, align 1, !dbg !1003
  %21 = load i32, i32* %c, align 4, !dbg !1003
  %shr26 = lshr i32 %21, 8, !dbg !1003
  %conv27 = trunc i32 %shr26 to i8, !dbg !1003
  %22 = load i8*, i8** %counter.addr, align 8, !dbg !1003
  %23 = load i32, i32* %n, align 4, !dbg !1003
  %idx.ext28 = zext i32 %23 to i64, !dbg !1003
  %add.ptr29 = getelementptr inbounds i8, i8* %22, i64 %idx.ext28, !dbg !1003
  %arrayidx30 = getelementptr inbounds i8, i8* %add.ptr29, i64 2, !dbg !1003
  store i8 %conv27, i8* %arrayidx30, align 1, !dbg !1003
  %24 = load i32, i32* %c, align 4, !dbg !1003
  %conv31 = trunc i32 %24 to i8, !dbg !1003
  %25 = load i8*, i8** %counter.addr, align 8, !dbg !1003
  %26 = load i32, i32* %n, align 4, !dbg !1003
  %idx.ext32 = zext i32 %26 to i64, !dbg !1003
  %add.ptr33 = getelementptr inbounds i8, i8* %25, i64 %idx.ext32, !dbg !1003
  %arrayidx34 = getelementptr inbounds i8, i8* %add.ptr33, i64 3, !dbg !1003
  store i8 %conv31, i8* %arrayidx34, align 1, !dbg !1003
  %27 = load i32, i32* %c, align 4, !dbg !1005
  %tobool = icmp ne i32 %27, 0, !dbg !1005
  br i1 %tobool, label %if.then, label %if.end, !dbg !1007

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !1008

if.end:                                           ; preds = %do.body
  br label %do.cond, !dbg !1009

do.cond:                                          ; preds = %if.end
  %28 = load i32, i32* %n, align 4, !dbg !1010
  %tobool35 = icmp ne i32 %28, 0, !dbg !1009
  br i1 %tobool35, label %do.body, label %do.end.loopexit, !dbg !1009, !llvm.loop !995

do.end.loopexit:                                  ; preds = %do.cond
  br label %do.end, !dbg !1011

do.end:                                           ; preds = %do.end.loopexit, %if.then
  ret void, !dbg !1011
}

; Function Attrs: noinline nounwind uwtable
define i8* @memcpy(i8* returned, i8* nocapture readonly, i64) local_unnamed_addr #3 !dbg !1012 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !1018, metadata !DIExpression()), !dbg !1019
  call void @llvm.dbg.value(metadata i8* %1, metadata !1020, metadata !DIExpression()), !dbg !1021
  call void @llvm.dbg.value(metadata i64 %2, metadata !1022, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.value(metadata i8* %0, metadata !1024, metadata !DIExpression()), !dbg !1026
  call void @llvm.dbg.value(metadata i8* %1, metadata !1027, metadata !DIExpression()), !dbg !1030
  %4 = icmp eq i64 %2, 0, !dbg !1031
  br i1 %4, label %._crit_edge, label %.lr.ph, !dbg !1032

.lr.ph:                                           ; preds = %3
  br label %5, !dbg !1032

; <label>:5:                                      ; preds = %.lr.ph, %5
  %.05 = phi i8* [ %1, %.lr.ph ], [ %7, %5 ]
  %.014 = phi i8* [ %0, %.lr.ph ], [ %9, %5 ]
  %.023 = phi i64 [ %2, %.lr.ph ], [ %6, %5 ]
  call void @llvm.dbg.value(metadata i64 %.023, metadata !1022, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.value(metadata i8* %.014, metadata !1024, metadata !DIExpression()), !dbg !1026
  call void @llvm.dbg.value(metadata i8* %.05, metadata !1027, metadata !DIExpression()), !dbg !1030
  %6 = add i64 %.023, -1, !dbg !1033
  %7 = getelementptr inbounds i8, i8* %.05, i64 1, !dbg !1034
  %8 = load i8, i8* %.05, align 1, !dbg !1035
  %9 = getelementptr inbounds i8, i8* %.014, i64 1, !dbg !1036
  store i8 %8, i8* %.014, align 1, !dbg !1037
  call void @llvm.dbg.value(metadata i8* %7, metadata !1027, metadata !DIExpression()), !dbg !1030
  call void @llvm.dbg.value(metadata i8* %9, metadata !1024, metadata !DIExpression()), !dbg !1026
  call void @llvm.dbg.value(metadata i64 %6, metadata !1022, metadata !DIExpression()), !dbg !1023
  %10 = icmp eq i64 %6, 0, !dbg !1031
  br i1 %10, label %._crit_edge, label %5, !dbg !1032, !llvm.loop !1038

._crit_edge:                                      ; preds = %5, %3
  ret i8* %0, !dbg !1039
}

; Function Attrs: noinline nounwind uwtable
define i8* @memset(i8* returned, i32, i64) local_unnamed_addr #3 !dbg !1040 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !1043, metadata !DIExpression()), !dbg !1044
  call void @llvm.dbg.value(metadata i32 %1, metadata !1045, metadata !DIExpression()), !dbg !1046
  call void @llvm.dbg.value(metadata i64 %2, metadata !1047, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i8* %0, metadata !1049, metadata !DIExpression()), !dbg !1050
  %4 = icmp eq i64 %2, 0, !dbg !1051
  br i1 %4, label %._crit_edge, label %.lr.ph, !dbg !1052

.lr.ph:                                           ; preds = %3
  %5 = trunc i32 %1 to i8
  br label %6, !dbg !1052

; <label>:6:                                      ; preds = %.lr.ph, %6
  %.03 = phi i8* [ %0, %.lr.ph ], [ %8, %6 ]
  %.012 = phi i64 [ %2, %.lr.ph ], [ %7, %6 ]
  call void @llvm.dbg.value(metadata i64 %.012, metadata !1047, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i8* %.03, metadata !1049, metadata !DIExpression()), !dbg !1050
  %7 = add i64 %.012, -1, !dbg !1053
  %8 = getelementptr inbounds i8, i8* %.03, i64 1, !dbg !1054
  store i8 %5, i8* %.03, align 1, !dbg !1055
  call void @llvm.dbg.value(metadata i8* %8, metadata !1049, metadata !DIExpression()), !dbg !1050
  call void @llvm.dbg.value(metadata i64 %7, metadata !1047, metadata !DIExpression()), !dbg !1048
  %9 = icmp eq i64 %7, 0, !dbg !1051
  br i1 %9, label %._crit_edge, label %6, !dbg !1052, !llvm.loop !1056

._crit_edge:                                      ; preds = %6, %3
  ret i8* %0, !dbg !1058
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!40, !2, !45, !56, !65, !67}
!llvm.module.flags = !{!69, !70, !71}
!llvm.ident = !{!72, !72, !72, !72, !73, !73}

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
!41 = !DIFile(filename: "testing_AES_Ctr.c", directory: "/home/klee/shareddir")
!42 = !{!43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!45 = distinct !DICompileUnit(language: DW_LANG_C99, file: !46, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47)
!46 = !DIFile(filename: "/home/klee/shareddir/openssl/crypto/aes/aes_ctr.c", directory: "/home/klee/shareddir")
!47 = !{!48}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "block128_f", file: !49, line: 10, baseType: !50)
!49 = !DIFile(filename: "/home/klee/shareddir/openssl/include/openssl/modes.h", directory: "/home/klee/shareddir")
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !43, !53, !54}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!56 = distinct !DICompileUnit(language: DW_LANG_C99, file: !57, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !58)
!57 = !DIFile(filename: "./openssl/crypto/modes/ctr128.c", directory: "/home/klee/shareddir")
!58 = !{!59, !63, !64}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 62, baseType: !62)
!61 = !DIFile(filename: "/tmp/llvm-60-install_O_D_A/lib/clang/6.0.1/include/stddef.h", directory: "/home/klee/shareddir")
!62 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !57, line: 61, baseType: !8)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !57, line: 62, baseType: !10)
!65 = distinct !DICompileUnit(language: DW_LANG_C89, file: !66, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!66 = !DIFile(filename: "/home/klee/kleespectre/klee/runtime/FreeStanding/memcpy.c", directory: "/home/klee/kleespectre/klee/build/runtime/FreeStanding")
!67 = distinct !DICompileUnit(language: DW_LANG_C89, file: !68, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!68 = !DIFile(filename: "/home/klee/kleespectre/klee/runtime/FreeStanding/memset.c", directory: "/home/klee/kleespectre/klee/build/runtime/FreeStanding")
!69 = !{i32 2, !"Dwarf Version", i32 4}
!70 = !{i32 2, !"Debug Info Version", i32 3}
!71 = !{i32 1, !"wchar_size", i32 4}
!72 = !{!"clang version 6.0.1 "}
!73 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!74 = distinct !DISubprogram(name: "main", scope: !41, file: !41, line: 12, type: !75, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, unit: !40, variables: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!77}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DILocalVariable(name: "in", scope: !74, file: !41, line: 13, type: !79)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 128, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 16)
!82 = !DILocation(line: 13, column: 25, scope: !74)
!83 = !DILocalVariable(name: "out", scope: !74, file: !41, line: 14, type: !84)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 128, elements: !80)
!85 = !DILocation(line: 14, column: 19, scope: !74)
!86 = !DILocalVariable(name: "len", scope: !74, file: !41, line: 15, type: !60)
!87 = !DILocation(line: 15, column: 12, scope: !74)
!88 = !DILocalVariable(name: "key", scope: !74, file: !41, line: 16, type: !79)
!89 = !DILocation(line: 16, column: 25, scope: !74)
!90 = !DILocalVariable(name: "aes_key", scope: !74, file: !41, line: 18, type: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES_KEY", file: !92, line: 84, baseType: !93)
!92 = !DIFile(filename: "/home/klee/shareddir/openssl/include/openssl/aes.h", directory: "/home/klee/shareddir")
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aes_key_st", file: !92, line: 76, size: 1952, elements: !94)
!94 = !{!95, !99}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "rd_key", scope: !93, file: !92, line: 80, baseType: !96, size: 1920)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 1920, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 60)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "rounds", scope: !93, file: !92, line: 82, baseType: !77, size: 32, offset: 1920)
!100 = !DILocation(line: 18, column: 13, scope: !74)
!101 = !DILocalVariable(name: "ivec", scope: !74, file: !41, line: 19, type: !84)
!102 = !DILocation(line: 19, column: 19, scope: !74)
!103 = !DILocalVariable(name: "ecount_buf", scope: !74, file: !41, line: 22, type: !84)
!104 = !DILocation(line: 22, column: 19, scope: !74)
!105 = !DILocalVariable(name: "num", scope: !74, file: !41, line: 25, type: !106)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!107 = !DILocation(line: 25, column: 19, scope: !74)
!108 = !DILocation(line: 27, column: 24, scope: !74)
!109 = !DILocation(line: 27, column: 5, scope: !74)
!110 = !DILocation(line: 29, column: 25, scope: !74)
!111 = !DILocation(line: 29, column: 5, scope: !74)
!112 = !DILocation(line: 31, column: 48, scope: !74)
!113 = !DILocation(line: 31, column: 52, scope: !74)
!114 = !DILocation(line: 31, column: 57, scope: !74)
!115 = !DILocation(line: 32, column: 19, scope: !74)
!116 = !DILocation(line: 32, column: 25, scope: !74)
!117 = !DILocation(line: 32, column: 37, scope: !74)
!118 = !DILocation(line: 31, column: 5, scope: !74)
!119 = !DILocation(line: 33, column: 1, scope: !74)
!120 = distinct !DISubprogram(name: "AES_set_encrypt_key", scope: !14, file: !14, line: 628, type: !121, isLocal: false, isDefinition: true, scopeLine: 629, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!121 = !DISubroutineType(types: !122)
!122 = !{!77, !43, !123, !124}
!123 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !77)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!125 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES_KEY", file: !92, line: 84, baseType: !126)
!126 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aes_key_st", file: !92, line: 76, size: 1952, elements: !127)
!127 = !{!128, !129}
!128 = !DIDerivedType(tag: DW_TAG_member, name: "rd_key", scope: !126, file: !92, line: 80, baseType: !96, size: 1920)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "rounds", scope: !126, file: !92, line: 82, baseType: !77, size: 32, offset: 1920)
!130 = !DILocalVariable(name: "userKey", arg: 1, scope: !120, file: !14, line: 628, type: !43)
!131 = !DILocation(line: 628, column: 46, scope: !120)
!132 = !DILocalVariable(name: "bits", arg: 2, scope: !120, file: !14, line: 628, type: !123)
!133 = !DILocation(line: 628, column: 65, scope: !120)
!134 = !DILocalVariable(name: "key", arg: 3, scope: !120, file: !14, line: 629, type: !124)
!135 = !DILocation(line: 629, column: 13, scope: !120)
!136 = !DILocalVariable(name: "rk", scope: !120, file: !14, line: 631, type: !137)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!138 = !DILocation(line: 631, column: 7, scope: !120)
!139 = !DILocalVariable(name: "i", scope: !120, file: !14, line: 632, type: !77)
!140 = !DILocation(line: 632, column: 9, scope: !120)
!141 = !DILocalVariable(name: "temp", scope: !120, file: !14, line: 633, type: !6)
!142 = !DILocation(line: 633, column: 6, scope: !120)
!143 = !DILocation(line: 635, column: 7, scope: !144)
!144 = distinct !DILexicalBlock(scope: !120, file: !14, line: 635, column: 6)
!145 = !DILocation(line: 635, column: 15, scope: !144)
!146 = !DILocation(line: 635, column: 19, scope: !144)
!147 = !DILocation(line: 635, column: 6, scope: !120)
!148 = !DILocation(line: 636, column: 3, scope: !144)
!149 = !DILocation(line: 637, column: 6, scope: !150)
!150 = distinct !DILexicalBlock(scope: !120, file: !14, line: 637, column: 6)
!151 = !DILocation(line: 637, column: 11, scope: !150)
!152 = !DILocation(line: 637, column: 18, scope: !150)
!153 = !DILocation(line: 637, column: 21, scope: !150)
!154 = !DILocation(line: 637, column: 26, scope: !150)
!155 = !DILocation(line: 637, column: 33, scope: !150)
!156 = !DILocation(line: 637, column: 36, scope: !150)
!157 = !DILocation(line: 637, column: 41, scope: !150)
!158 = !DILocation(line: 637, column: 6, scope: !120)
!159 = !DILocation(line: 638, column: 3, scope: !150)
!160 = !DILocation(line: 640, column: 7, scope: !120)
!161 = !DILocation(line: 640, column: 12, scope: !120)
!162 = !DILocation(line: 640, column: 5, scope: !120)
!163 = !DILocation(line: 642, column: 6, scope: !164)
!164 = distinct !DILexicalBlock(scope: !120, file: !14, line: 642, column: 6)
!165 = !DILocation(line: 642, column: 10, scope: !164)
!166 = !DILocation(line: 642, column: 6, scope: !120)
!167 = !DILocation(line: 643, column: 3, scope: !164)
!168 = !DILocation(line: 643, column: 8, scope: !164)
!169 = !DILocation(line: 643, column: 15, scope: !164)
!170 = !DILocation(line: 644, column: 11, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !14, line: 644, column: 11)
!172 = !DILocation(line: 644, column: 15, scope: !171)
!173 = !DILocation(line: 644, column: 11, scope: !164)
!174 = !DILocation(line: 645, column: 3, scope: !171)
!175 = !DILocation(line: 645, column: 8, scope: !171)
!176 = !DILocation(line: 645, column: 15, scope: !171)
!177 = !DILocation(line: 647, column: 3, scope: !171)
!178 = !DILocation(line: 647, column: 8, scope: !171)
!179 = !DILocation(line: 647, column: 15, scope: !171)
!180 = !DILocation(line: 649, column: 10, scope: !120)
!181 = !DILocation(line: 649, column: 2, scope: !120)
!182 = !DILocation(line: 649, column: 8, scope: !120)
!183 = !DILocation(line: 650, column: 10, scope: !120)
!184 = !DILocation(line: 650, column: 2, scope: !120)
!185 = !DILocation(line: 650, column: 8, scope: !120)
!186 = !DILocation(line: 651, column: 10, scope: !120)
!187 = !DILocation(line: 651, column: 2, scope: !120)
!188 = !DILocation(line: 651, column: 8, scope: !120)
!189 = !DILocation(line: 652, column: 10, scope: !120)
!190 = !DILocation(line: 652, column: 2, scope: !120)
!191 = !DILocation(line: 652, column: 8, scope: !120)
!192 = !DILocation(line: 653, column: 6, scope: !193)
!193 = distinct !DILexicalBlock(scope: !120, file: !14, line: 653, column: 6)
!194 = !DILocation(line: 653, column: 11, scope: !193)
!195 = !DILocation(line: 653, column: 6, scope: !120)
!196 = !DILocation(line: 654, column: 3, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !14, line: 653, column: 19)
!198 = !DILocation(line: 655, column: 12, scope: !199)
!199 = distinct !DILexicalBlock(scope: !197, file: !14, line: 654, column: 13)
!200 = !DILocation(line: 655, column: 10, scope: !199)
!201 = !DILocation(line: 656, column: 12, scope: !199)
!202 = !DILocation(line: 657, column: 11, scope: !199)
!203 = !DILocation(line: 657, column: 16, scope: !199)
!204 = !DILocation(line: 657, column: 23, scope: !199)
!205 = !DILocation(line: 657, column: 6, scope: !199)
!206 = !DILocation(line: 657, column: 31, scope: !199)
!207 = !DILocation(line: 656, column: 18, scope: !199)
!208 = !DILocation(line: 658, column: 11, scope: !199)
!209 = !DILocation(line: 658, column: 16, scope: !199)
!210 = !DILocation(line: 658, column: 23, scope: !199)
!211 = !DILocation(line: 658, column: 6, scope: !199)
!212 = !DILocation(line: 658, column: 31, scope: !199)
!213 = !DILocation(line: 657, column: 45, scope: !199)
!214 = !DILocation(line: 659, column: 11, scope: !199)
!215 = !DILocation(line: 659, column: 23, scope: !199)
!216 = !DILocation(line: 659, column: 6, scope: !199)
!217 = !DILocation(line: 659, column: 31, scope: !199)
!218 = !DILocation(line: 658, column: 45, scope: !199)
!219 = !DILocation(line: 660, column: 11, scope: !199)
!220 = !DILocation(line: 660, column: 16, scope: !199)
!221 = !DILocation(line: 660, column: 6, scope: !199)
!222 = !DILocation(line: 660, column: 31, scope: !199)
!223 = !DILocation(line: 659, column: 45, scope: !199)
!224 = !DILocation(line: 661, column: 10, scope: !199)
!225 = !DILocation(line: 661, column: 5, scope: !199)
!226 = !DILocation(line: 660, column: 45, scope: !199)
!227 = !DILocation(line: 656, column: 4, scope: !199)
!228 = !DILocation(line: 656, column: 10, scope: !199)
!229 = !DILocation(line: 662, column: 12, scope: !199)
!230 = !DILocation(line: 662, column: 20, scope: !199)
!231 = !DILocation(line: 662, column: 18, scope: !199)
!232 = !DILocation(line: 662, column: 4, scope: !199)
!233 = !DILocation(line: 662, column: 10, scope: !199)
!234 = !DILocation(line: 663, column: 12, scope: !199)
!235 = !DILocation(line: 663, column: 20, scope: !199)
!236 = !DILocation(line: 663, column: 18, scope: !199)
!237 = !DILocation(line: 663, column: 4, scope: !199)
!238 = !DILocation(line: 663, column: 10, scope: !199)
!239 = !DILocation(line: 664, column: 12, scope: !199)
!240 = !DILocation(line: 664, column: 20, scope: !199)
!241 = !DILocation(line: 664, column: 18, scope: !199)
!242 = !DILocation(line: 664, column: 4, scope: !199)
!243 = !DILocation(line: 664, column: 10, scope: !199)
!244 = !DILocation(line: 665, column: 8, scope: !245)
!245 = distinct !DILexicalBlock(scope: !199, file: !14, line: 665, column: 8)
!246 = !DILocation(line: 665, column: 12, scope: !245)
!247 = !DILocation(line: 665, column: 8, scope: !199)
!248 = !DILocation(line: 666, column: 5, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !14, line: 665, column: 19)
!250 = !DILocation(line: 668, column: 7, scope: !199)
!251 = distinct !{!251, !196, !252}
!252 = !DILocation(line: 669, column: 3, scope: !197)
!253 = !DILocation(line: 671, column: 10, scope: !120)
!254 = !DILocation(line: 671, column: 2, scope: !120)
!255 = !DILocation(line: 671, column: 8, scope: !120)
!256 = !DILocation(line: 672, column: 10, scope: !120)
!257 = !DILocation(line: 672, column: 2, scope: !120)
!258 = !DILocation(line: 672, column: 8, scope: !120)
!259 = !DILocation(line: 673, column: 6, scope: !260)
!260 = distinct !DILexicalBlock(scope: !120, file: !14, line: 673, column: 6)
!261 = !DILocation(line: 673, column: 11, scope: !260)
!262 = !DILocation(line: 673, column: 6, scope: !120)
!263 = !DILocation(line: 674, column: 3, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !14, line: 673, column: 19)
!265 = !DILocation(line: 675, column: 11, scope: !266)
!266 = distinct !DILexicalBlock(scope: !264, file: !14, line: 674, column: 13)
!267 = !DILocation(line: 675, column: 9, scope: !266)
!268 = !DILocation(line: 676, column: 13, scope: !266)
!269 = !DILocation(line: 677, column: 11, scope: !266)
!270 = !DILocation(line: 677, column: 16, scope: !266)
!271 = !DILocation(line: 677, column: 23, scope: !266)
!272 = !DILocation(line: 677, column: 6, scope: !266)
!273 = !DILocation(line: 677, column: 31, scope: !266)
!274 = !DILocation(line: 676, column: 20, scope: !266)
!275 = !DILocation(line: 678, column: 11, scope: !266)
!276 = !DILocation(line: 678, column: 16, scope: !266)
!277 = !DILocation(line: 678, column: 23, scope: !266)
!278 = !DILocation(line: 678, column: 6, scope: !266)
!279 = !DILocation(line: 678, column: 31, scope: !266)
!280 = !DILocation(line: 677, column: 45, scope: !266)
!281 = !DILocation(line: 679, column: 11, scope: !266)
!282 = !DILocation(line: 679, column: 23, scope: !266)
!283 = !DILocation(line: 679, column: 6, scope: !266)
!284 = !DILocation(line: 679, column: 31, scope: !266)
!285 = !DILocation(line: 678, column: 45, scope: !266)
!286 = !DILocation(line: 680, column: 11, scope: !266)
!287 = !DILocation(line: 680, column: 16, scope: !266)
!288 = !DILocation(line: 680, column: 6, scope: !266)
!289 = !DILocation(line: 680, column: 31, scope: !266)
!290 = !DILocation(line: 679, column: 45, scope: !266)
!291 = !DILocation(line: 681, column: 10, scope: !266)
!292 = !DILocation(line: 681, column: 5, scope: !266)
!293 = !DILocation(line: 680, column: 45, scope: !266)
!294 = !DILocation(line: 676, column: 4, scope: !266)
!295 = !DILocation(line: 676, column: 11, scope: !266)
!296 = !DILocation(line: 682, column: 13, scope: !266)
!297 = !DILocation(line: 682, column: 22, scope: !266)
!298 = !DILocation(line: 682, column: 20, scope: !266)
!299 = !DILocation(line: 682, column: 4, scope: !266)
!300 = !DILocation(line: 682, column: 11, scope: !266)
!301 = !DILocation(line: 683, column: 13, scope: !266)
!302 = !DILocation(line: 683, column: 22, scope: !266)
!303 = !DILocation(line: 683, column: 20, scope: !266)
!304 = !DILocation(line: 683, column: 4, scope: !266)
!305 = !DILocation(line: 683, column: 11, scope: !266)
!306 = !DILocation(line: 684, column: 13, scope: !266)
!307 = !DILocation(line: 684, column: 22, scope: !266)
!308 = !DILocation(line: 684, column: 20, scope: !266)
!309 = !DILocation(line: 684, column: 4, scope: !266)
!310 = !DILocation(line: 684, column: 11, scope: !266)
!311 = !DILocation(line: 685, column: 8, scope: !312)
!312 = distinct !DILexicalBlock(scope: !266, file: !14, line: 685, column: 8)
!313 = !DILocation(line: 685, column: 12, scope: !312)
!314 = !DILocation(line: 685, column: 8, scope: !266)
!315 = !DILocation(line: 686, column: 5, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !14, line: 685, column: 18)
!317 = !DILocation(line: 688, column: 13, scope: !266)
!318 = !DILocation(line: 688, column: 22, scope: !266)
!319 = !DILocation(line: 688, column: 20, scope: !266)
!320 = !DILocation(line: 688, column: 4, scope: !266)
!321 = !DILocation(line: 688, column: 11, scope: !266)
!322 = !DILocation(line: 689, column: 13, scope: !266)
!323 = !DILocation(line: 689, column: 22, scope: !266)
!324 = !DILocation(line: 689, column: 20, scope: !266)
!325 = !DILocation(line: 689, column: 4, scope: !266)
!326 = !DILocation(line: 689, column: 11, scope: !266)
!327 = !DILocation(line: 690, column: 7, scope: !266)
!328 = distinct !{!328, !263, !329}
!329 = !DILocation(line: 691, column: 3, scope: !264)
!330 = !DILocation(line: 693, column: 10, scope: !120)
!331 = !DILocation(line: 693, column: 2, scope: !120)
!332 = !DILocation(line: 693, column: 8, scope: !120)
!333 = !DILocation(line: 694, column: 10, scope: !120)
!334 = !DILocation(line: 694, column: 2, scope: !120)
!335 = !DILocation(line: 694, column: 8, scope: !120)
!336 = !DILocation(line: 695, column: 6, scope: !337)
!337 = distinct !DILexicalBlock(scope: !120, file: !14, line: 695, column: 6)
!338 = !DILocation(line: 695, column: 11, scope: !337)
!339 = !DILocation(line: 695, column: 6, scope: !120)
!340 = !DILocation(line: 696, column: 3, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !14, line: 695, column: 19)
!342 = !DILocation(line: 697, column: 11, scope: !343)
!343 = distinct !DILexicalBlock(scope: !341, file: !14, line: 696, column: 13)
!344 = !DILocation(line: 697, column: 9, scope: !343)
!345 = !DILocation(line: 698, column: 13, scope: !343)
!346 = !DILocation(line: 699, column: 11, scope: !343)
!347 = !DILocation(line: 699, column: 16, scope: !343)
!348 = !DILocation(line: 699, column: 23, scope: !343)
!349 = !DILocation(line: 699, column: 6, scope: !343)
!350 = !DILocation(line: 699, column: 31, scope: !343)
!351 = !DILocation(line: 698, column: 20, scope: !343)
!352 = !DILocation(line: 700, column: 11, scope: !343)
!353 = !DILocation(line: 700, column: 16, scope: !343)
!354 = !DILocation(line: 700, column: 23, scope: !343)
!355 = !DILocation(line: 700, column: 6, scope: !343)
!356 = !DILocation(line: 700, column: 31, scope: !343)
!357 = !DILocation(line: 699, column: 45, scope: !343)
!358 = !DILocation(line: 701, column: 11, scope: !343)
!359 = !DILocation(line: 701, column: 23, scope: !343)
!360 = !DILocation(line: 701, column: 6, scope: !343)
!361 = !DILocation(line: 701, column: 31, scope: !343)
!362 = !DILocation(line: 700, column: 45, scope: !343)
!363 = !DILocation(line: 702, column: 11, scope: !343)
!364 = !DILocation(line: 702, column: 16, scope: !343)
!365 = !DILocation(line: 702, column: 6, scope: !343)
!366 = !DILocation(line: 702, column: 31, scope: !343)
!367 = !DILocation(line: 701, column: 45, scope: !343)
!368 = !DILocation(line: 703, column: 10, scope: !343)
!369 = !DILocation(line: 703, column: 5, scope: !343)
!370 = !DILocation(line: 702, column: 45, scope: !343)
!371 = !DILocation(line: 698, column: 4, scope: !343)
!372 = !DILocation(line: 698, column: 11, scope: !343)
!373 = !DILocation(line: 704, column: 13, scope: !343)
!374 = !DILocation(line: 704, column: 22, scope: !343)
!375 = !DILocation(line: 704, column: 20, scope: !343)
!376 = !DILocation(line: 704, column: 4, scope: !343)
!377 = !DILocation(line: 704, column: 11, scope: !343)
!378 = !DILocation(line: 705, column: 13, scope: !343)
!379 = !DILocation(line: 705, column: 22, scope: !343)
!380 = !DILocation(line: 705, column: 20, scope: !343)
!381 = !DILocation(line: 705, column: 4, scope: !343)
!382 = !DILocation(line: 705, column: 11, scope: !343)
!383 = !DILocation(line: 706, column: 13, scope: !343)
!384 = !DILocation(line: 706, column: 22, scope: !343)
!385 = !DILocation(line: 706, column: 20, scope: !343)
!386 = !DILocation(line: 706, column: 4, scope: !343)
!387 = !DILocation(line: 706, column: 11, scope: !343)
!388 = !DILocation(line: 707, column: 8, scope: !389)
!389 = distinct !DILexicalBlock(scope: !343, file: !14, line: 707, column: 8)
!390 = !DILocation(line: 707, column: 12, scope: !389)
!391 = !DILocation(line: 707, column: 8, scope: !343)
!392 = !DILocation(line: 708, column: 5, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !14, line: 707, column: 18)
!394 = !DILocation(line: 710, column: 11, scope: !343)
!395 = !DILocation(line: 710, column: 9, scope: !343)
!396 = !DILocation(line: 711, column: 13, scope: !343)
!397 = !DILocation(line: 712, column: 11, scope: !343)
!398 = !DILocation(line: 712, column: 16, scope: !343)
!399 = !DILocation(line: 712, column: 6, scope: !343)
!400 = !DILocation(line: 712, column: 31, scope: !343)
!401 = !DILocation(line: 711, column: 20, scope: !343)
!402 = !DILocation(line: 713, column: 11, scope: !343)
!403 = !DILocation(line: 713, column: 16, scope: !343)
!404 = !DILocation(line: 713, column: 23, scope: !343)
!405 = !DILocation(line: 713, column: 6, scope: !343)
!406 = !DILocation(line: 713, column: 31, scope: !343)
!407 = !DILocation(line: 712, column: 45, scope: !343)
!408 = !DILocation(line: 714, column: 11, scope: !343)
!409 = !DILocation(line: 714, column: 16, scope: !343)
!410 = !DILocation(line: 714, column: 23, scope: !343)
!411 = !DILocation(line: 714, column: 6, scope: !343)
!412 = !DILocation(line: 714, column: 31, scope: !343)
!413 = !DILocation(line: 713, column: 45, scope: !343)
!414 = !DILocation(line: 715, column: 11, scope: !343)
!415 = !DILocation(line: 715, column: 23, scope: !343)
!416 = !DILocation(line: 715, column: 6, scope: !343)
!417 = !DILocation(line: 715, column: 31, scope: !343)
!418 = !DILocation(line: 714, column: 45, scope: !343)
!419 = !DILocation(line: 711, column: 4, scope: !343)
!420 = !DILocation(line: 711, column: 11, scope: !343)
!421 = !DILocation(line: 716, column: 13, scope: !343)
!422 = !DILocation(line: 716, column: 22, scope: !343)
!423 = !DILocation(line: 716, column: 20, scope: !343)
!424 = !DILocation(line: 716, column: 4, scope: !343)
!425 = !DILocation(line: 716, column: 11, scope: !343)
!426 = !DILocation(line: 717, column: 13, scope: !343)
!427 = !DILocation(line: 717, column: 22, scope: !343)
!428 = !DILocation(line: 717, column: 20, scope: !343)
!429 = !DILocation(line: 717, column: 4, scope: !343)
!430 = !DILocation(line: 717, column: 11, scope: !343)
!431 = !DILocation(line: 718, column: 13, scope: !343)
!432 = !DILocation(line: 718, column: 22, scope: !343)
!433 = !DILocation(line: 718, column: 20, scope: !343)
!434 = !DILocation(line: 718, column: 4, scope: !343)
!435 = !DILocation(line: 718, column: 11, scope: !343)
!436 = !DILocation(line: 720, column: 7, scope: !343)
!437 = distinct !{!437, !340, !438}
!438 = !DILocation(line: 721, column: 10, scope: !341)
!439 = !DILocation(line: 723, column: 2, scope: !120)
!440 = !DILocation(line: 724, column: 1, scope: !120)
!441 = distinct !DISubprogram(name: "AES_encrypt", scope: !14, file: !14, line: 781, type: !442, isLocal: false, isDefinition: true, scopeLine: 782, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!442 = !DISubroutineType(types: !443)
!443 = !{null, !43, !53, !444}
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64)
!445 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !125)
!446 = !DILocalVariable(name: "in", arg: 1, scope: !441, file: !14, line: 781, type: !43)
!447 = !DILocation(line: 781, column: 39, scope: !441)
!448 = !DILocalVariable(name: "out", arg: 2, scope: !441, file: !14, line: 781, type: !53)
!449 = !DILocation(line: 781, column: 58, scope: !441)
!450 = !DILocalVariable(name: "key", arg: 3, scope: !441, file: !14, line: 782, type: !444)
!451 = !DILocation(line: 782, column: 19, scope: !441)
!452 = !DILocalVariable(name: "rk", scope: !441, file: !14, line: 784, type: !453)
!453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!454 = !DILocation(line: 784, column: 13, scope: !441)
!455 = !DILocalVariable(name: "s0", scope: !441, file: !14, line: 785, type: !6)
!456 = !DILocation(line: 785, column: 6, scope: !441)
!457 = !DILocalVariable(name: "s1", scope: !441, file: !14, line: 785, type: !6)
!458 = !DILocation(line: 785, column: 10, scope: !441)
!459 = !DILocalVariable(name: "s2", scope: !441, file: !14, line: 785, type: !6)
!460 = !DILocation(line: 785, column: 14, scope: !441)
!461 = !DILocalVariable(name: "s3", scope: !441, file: !14, line: 785, type: !6)
!462 = !DILocation(line: 785, column: 18, scope: !441)
!463 = !DILocalVariable(name: "t0", scope: !441, file: !14, line: 785, type: !6)
!464 = !DILocation(line: 785, column: 22, scope: !441)
!465 = !DILocalVariable(name: "t1", scope: !441, file: !14, line: 785, type: !6)
!466 = !DILocation(line: 785, column: 26, scope: !441)
!467 = !DILocalVariable(name: "t2", scope: !441, file: !14, line: 785, type: !6)
!468 = !DILocation(line: 785, column: 30, scope: !441)
!469 = !DILocalVariable(name: "t3", scope: !441, file: !14, line: 785, type: !6)
!470 = !DILocation(line: 785, column: 34, scope: !441)
!471 = !DILocalVariable(name: "r", scope: !441, file: !14, line: 787, type: !77)
!472 = !DILocation(line: 787, column: 6, scope: !441)
!473 = !DILocation(line: 791, column: 7, scope: !441)
!474 = !DILocation(line: 791, column: 12, scope: !441)
!475 = !DILocation(line: 791, column: 5, scope: !441)
!476 = !DILocation(line: 797, column: 7, scope: !441)
!477 = !DILocation(line: 797, column: 25, scope: !441)
!478 = !DILocation(line: 797, column: 23, scope: !441)
!479 = !DILocation(line: 797, column: 5, scope: !441)
!480 = !DILocation(line: 798, column: 7, scope: !441)
!481 = !DILocation(line: 798, column: 25, scope: !441)
!482 = !DILocation(line: 798, column: 23, scope: !441)
!483 = !DILocation(line: 798, column: 5, scope: !441)
!484 = !DILocation(line: 799, column: 7, scope: !441)
!485 = !DILocation(line: 799, column: 25, scope: !441)
!486 = !DILocation(line: 799, column: 23, scope: !441)
!487 = !DILocation(line: 799, column: 5, scope: !441)
!488 = !DILocation(line: 800, column: 7, scope: !441)
!489 = !DILocation(line: 800, column: 25, scope: !441)
!490 = !DILocation(line: 800, column: 23, scope: !441)
!491 = !DILocation(line: 800, column: 5, scope: !441)
!492 = !DILocation(line: 876, column: 9, scope: !441)
!493 = !DILocation(line: 876, column: 14, scope: !441)
!494 = !DILocation(line: 876, column: 21, scope: !441)
!495 = !DILocation(line: 876, column: 7, scope: !441)
!496 = !DILocation(line: 877, column: 5, scope: !441)
!497 = !DILocation(line: 879, column: 18, scope: !498)
!498 = distinct !DILexicalBlock(scope: !499, file: !14, line: 877, column: 14)
!499 = distinct !DILexicalBlock(scope: !500, file: !14, line: 877, column: 5)
!500 = distinct !DILexicalBlock(scope: !441, file: !14, line: 877, column: 5)
!501 = !DILocation(line: 879, column: 21, scope: !498)
!502 = !DILocation(line: 879, column: 13, scope: !498)
!503 = !DILocation(line: 880, column: 18, scope: !498)
!504 = !DILocation(line: 880, column: 21, scope: !498)
!505 = !DILocation(line: 880, column: 28, scope: !498)
!506 = !DILocation(line: 880, column: 13, scope: !498)
!507 = !DILocation(line: 879, column: 36, scope: !498)
!508 = !DILocation(line: 881, column: 18, scope: !498)
!509 = !DILocation(line: 881, column: 21, scope: !498)
!510 = !DILocation(line: 881, column: 28, scope: !498)
!511 = !DILocation(line: 881, column: 13, scope: !498)
!512 = !DILocation(line: 880, column: 36, scope: !498)
!513 = !DILocation(line: 882, column: 18, scope: !498)
!514 = !DILocation(line: 882, column: 28, scope: !498)
!515 = !DILocation(line: 882, column: 13, scope: !498)
!516 = !DILocation(line: 881, column: 36, scope: !498)
!517 = !DILocation(line: 883, column: 13, scope: !498)
!518 = !DILocation(line: 882, column: 36, scope: !498)
!519 = !DILocation(line: 878, column: 12, scope: !498)
!520 = !DILocation(line: 885, column: 18, scope: !498)
!521 = !DILocation(line: 885, column: 21, scope: !498)
!522 = !DILocation(line: 885, column: 13, scope: !498)
!523 = !DILocation(line: 886, column: 18, scope: !498)
!524 = !DILocation(line: 886, column: 21, scope: !498)
!525 = !DILocation(line: 886, column: 28, scope: !498)
!526 = !DILocation(line: 886, column: 13, scope: !498)
!527 = !DILocation(line: 885, column: 36, scope: !498)
!528 = !DILocation(line: 887, column: 18, scope: !498)
!529 = !DILocation(line: 887, column: 21, scope: !498)
!530 = !DILocation(line: 887, column: 28, scope: !498)
!531 = !DILocation(line: 887, column: 13, scope: !498)
!532 = !DILocation(line: 886, column: 36, scope: !498)
!533 = !DILocation(line: 888, column: 18, scope: !498)
!534 = !DILocation(line: 888, column: 28, scope: !498)
!535 = !DILocation(line: 888, column: 13, scope: !498)
!536 = !DILocation(line: 887, column: 36, scope: !498)
!537 = !DILocation(line: 889, column: 13, scope: !498)
!538 = !DILocation(line: 888, column: 36, scope: !498)
!539 = !DILocation(line: 884, column: 12, scope: !498)
!540 = !DILocation(line: 891, column: 18, scope: !498)
!541 = !DILocation(line: 891, column: 21, scope: !498)
!542 = !DILocation(line: 891, column: 13, scope: !498)
!543 = !DILocation(line: 892, column: 18, scope: !498)
!544 = !DILocation(line: 892, column: 21, scope: !498)
!545 = !DILocation(line: 892, column: 28, scope: !498)
!546 = !DILocation(line: 892, column: 13, scope: !498)
!547 = !DILocation(line: 891, column: 36, scope: !498)
!548 = !DILocation(line: 893, column: 18, scope: !498)
!549 = !DILocation(line: 893, column: 21, scope: !498)
!550 = !DILocation(line: 893, column: 28, scope: !498)
!551 = !DILocation(line: 893, column: 13, scope: !498)
!552 = !DILocation(line: 892, column: 36, scope: !498)
!553 = !DILocation(line: 894, column: 18, scope: !498)
!554 = !DILocation(line: 894, column: 28, scope: !498)
!555 = !DILocation(line: 894, column: 13, scope: !498)
!556 = !DILocation(line: 893, column: 36, scope: !498)
!557 = !DILocation(line: 895, column: 13, scope: !498)
!558 = !DILocation(line: 894, column: 36, scope: !498)
!559 = !DILocation(line: 890, column: 12, scope: !498)
!560 = !DILocation(line: 897, column: 18, scope: !498)
!561 = !DILocation(line: 897, column: 21, scope: !498)
!562 = !DILocation(line: 897, column: 13, scope: !498)
!563 = !DILocation(line: 898, column: 18, scope: !498)
!564 = !DILocation(line: 898, column: 21, scope: !498)
!565 = !DILocation(line: 898, column: 28, scope: !498)
!566 = !DILocation(line: 898, column: 13, scope: !498)
!567 = !DILocation(line: 897, column: 36, scope: !498)
!568 = !DILocation(line: 899, column: 18, scope: !498)
!569 = !DILocation(line: 899, column: 21, scope: !498)
!570 = !DILocation(line: 899, column: 28, scope: !498)
!571 = !DILocation(line: 899, column: 13, scope: !498)
!572 = !DILocation(line: 898, column: 36, scope: !498)
!573 = !DILocation(line: 900, column: 18, scope: !498)
!574 = !DILocation(line: 900, column: 28, scope: !498)
!575 = !DILocation(line: 900, column: 13, scope: !498)
!576 = !DILocation(line: 899, column: 36, scope: !498)
!577 = !DILocation(line: 901, column: 13, scope: !498)
!578 = !DILocation(line: 900, column: 36, scope: !498)
!579 = !DILocation(line: 896, column: 12, scope: !498)
!580 = !DILocation(line: 903, column: 12, scope: !498)
!581 = !DILocation(line: 904, column: 13, scope: !582)
!582 = distinct !DILexicalBlock(scope: !498, file: !14, line: 904, column: 13)
!583 = !DILocation(line: 904, column: 17, scope: !582)
!584 = !DILocation(line: 904, column: 13, scope: !498)
!585 = !DILocation(line: 905, column: 13, scope: !586)
!586 = distinct !DILexicalBlock(scope: !582, file: !14, line: 904, column: 23)
!587 = !DILocation(line: 909, column: 18, scope: !498)
!588 = !DILocation(line: 909, column: 21, scope: !498)
!589 = !DILocation(line: 909, column: 13, scope: !498)
!590 = !DILocation(line: 910, column: 18, scope: !498)
!591 = !DILocation(line: 910, column: 21, scope: !498)
!592 = !DILocation(line: 910, column: 28, scope: !498)
!593 = !DILocation(line: 910, column: 13, scope: !498)
!594 = !DILocation(line: 909, column: 36, scope: !498)
!595 = !DILocation(line: 911, column: 18, scope: !498)
!596 = !DILocation(line: 911, column: 21, scope: !498)
!597 = !DILocation(line: 911, column: 28, scope: !498)
!598 = !DILocation(line: 911, column: 13, scope: !498)
!599 = !DILocation(line: 910, column: 36, scope: !498)
!600 = !DILocation(line: 912, column: 18, scope: !498)
!601 = !DILocation(line: 912, column: 28, scope: !498)
!602 = !DILocation(line: 912, column: 13, scope: !498)
!603 = !DILocation(line: 911, column: 36, scope: !498)
!604 = !DILocation(line: 913, column: 13, scope: !498)
!605 = !DILocation(line: 912, column: 36, scope: !498)
!606 = !DILocation(line: 908, column: 12, scope: !498)
!607 = !DILocation(line: 915, column: 18, scope: !498)
!608 = !DILocation(line: 915, column: 21, scope: !498)
!609 = !DILocation(line: 915, column: 13, scope: !498)
!610 = !DILocation(line: 916, column: 18, scope: !498)
!611 = !DILocation(line: 916, column: 21, scope: !498)
!612 = !DILocation(line: 916, column: 28, scope: !498)
!613 = !DILocation(line: 916, column: 13, scope: !498)
!614 = !DILocation(line: 915, column: 36, scope: !498)
!615 = !DILocation(line: 917, column: 18, scope: !498)
!616 = !DILocation(line: 917, column: 21, scope: !498)
!617 = !DILocation(line: 917, column: 28, scope: !498)
!618 = !DILocation(line: 917, column: 13, scope: !498)
!619 = !DILocation(line: 916, column: 36, scope: !498)
!620 = !DILocation(line: 918, column: 18, scope: !498)
!621 = !DILocation(line: 918, column: 28, scope: !498)
!622 = !DILocation(line: 918, column: 13, scope: !498)
!623 = !DILocation(line: 917, column: 36, scope: !498)
!624 = !DILocation(line: 919, column: 13, scope: !498)
!625 = !DILocation(line: 918, column: 36, scope: !498)
!626 = !DILocation(line: 914, column: 12, scope: !498)
!627 = !DILocation(line: 921, column: 18, scope: !498)
!628 = !DILocation(line: 921, column: 21, scope: !498)
!629 = !DILocation(line: 921, column: 13, scope: !498)
!630 = !DILocation(line: 922, column: 18, scope: !498)
!631 = !DILocation(line: 922, column: 21, scope: !498)
!632 = !DILocation(line: 922, column: 28, scope: !498)
!633 = !DILocation(line: 922, column: 13, scope: !498)
!634 = !DILocation(line: 921, column: 36, scope: !498)
!635 = !DILocation(line: 923, column: 18, scope: !498)
!636 = !DILocation(line: 923, column: 21, scope: !498)
!637 = !DILocation(line: 923, column: 28, scope: !498)
!638 = !DILocation(line: 923, column: 13, scope: !498)
!639 = !DILocation(line: 922, column: 36, scope: !498)
!640 = !DILocation(line: 924, column: 18, scope: !498)
!641 = !DILocation(line: 924, column: 28, scope: !498)
!642 = !DILocation(line: 924, column: 13, scope: !498)
!643 = !DILocation(line: 923, column: 36, scope: !498)
!644 = !DILocation(line: 925, column: 13, scope: !498)
!645 = !DILocation(line: 924, column: 36, scope: !498)
!646 = !DILocation(line: 920, column: 12, scope: !498)
!647 = !DILocation(line: 927, column: 18, scope: !498)
!648 = !DILocation(line: 927, column: 21, scope: !498)
!649 = !DILocation(line: 927, column: 13, scope: !498)
!650 = !DILocation(line: 928, column: 18, scope: !498)
!651 = !DILocation(line: 928, column: 21, scope: !498)
!652 = !DILocation(line: 928, column: 28, scope: !498)
!653 = !DILocation(line: 928, column: 13, scope: !498)
!654 = !DILocation(line: 927, column: 36, scope: !498)
!655 = !DILocation(line: 929, column: 18, scope: !498)
!656 = !DILocation(line: 929, column: 21, scope: !498)
!657 = !DILocation(line: 929, column: 28, scope: !498)
!658 = !DILocation(line: 929, column: 13, scope: !498)
!659 = !DILocation(line: 928, column: 36, scope: !498)
!660 = !DILocation(line: 930, column: 18, scope: !498)
!661 = !DILocation(line: 930, column: 28, scope: !498)
!662 = !DILocation(line: 930, column: 13, scope: !498)
!663 = !DILocation(line: 929, column: 36, scope: !498)
!664 = !DILocation(line: 931, column: 13, scope: !498)
!665 = !DILocation(line: 930, column: 36, scope: !498)
!666 = !DILocation(line: 926, column: 12, scope: !498)
!667 = !DILocation(line: 877, column: 5, scope: !499)
!668 = distinct !{!668, !669, !670}
!669 = !DILocation(line: 877, column: 5, scope: !500)
!670 = !DILocation(line: 932, column: 5, scope: !500)
!671 = !DILocation(line: 939, column: 9, scope: !441)
!672 = !DILocation(line: 939, column: 12, scope: !441)
!673 = !DILocation(line: 939, column: 4, scope: !441)
!674 = !DILocation(line: 939, column: 27, scope: !441)
!675 = !DILocation(line: 940, column: 9, scope: !441)
!676 = !DILocation(line: 940, column: 12, scope: !441)
!677 = !DILocation(line: 940, column: 19, scope: !441)
!678 = !DILocation(line: 940, column: 4, scope: !441)
!679 = !DILocation(line: 940, column: 27, scope: !441)
!680 = !DILocation(line: 939, column: 41, scope: !441)
!681 = !DILocation(line: 941, column: 9, scope: !441)
!682 = !DILocation(line: 941, column: 12, scope: !441)
!683 = !DILocation(line: 941, column: 19, scope: !441)
!684 = !DILocation(line: 941, column: 4, scope: !441)
!685 = !DILocation(line: 941, column: 27, scope: !441)
!686 = !DILocation(line: 940, column: 41, scope: !441)
!687 = !DILocation(line: 942, column: 9, scope: !441)
!688 = !DILocation(line: 942, column: 19, scope: !441)
!689 = !DILocation(line: 942, column: 4, scope: !441)
!690 = !DILocation(line: 942, column: 27, scope: !441)
!691 = !DILocation(line: 941, column: 41, scope: !441)
!692 = !DILocation(line: 943, column: 3, scope: !441)
!693 = !DILocation(line: 942, column: 41, scope: !441)
!694 = !DILocation(line: 938, column: 5, scope: !441)
!695 = !DILocation(line: 944, column: 2, scope: !696)
!696 = distinct !DILexicalBlock(scope: !441, file: !14, line: 944, column: 2)
!697 = !DILocation(line: 946, column: 9, scope: !441)
!698 = !DILocation(line: 946, column: 12, scope: !441)
!699 = !DILocation(line: 946, column: 4, scope: !441)
!700 = !DILocation(line: 946, column: 27, scope: !441)
!701 = !DILocation(line: 947, column: 9, scope: !441)
!702 = !DILocation(line: 947, column: 12, scope: !441)
!703 = !DILocation(line: 947, column: 19, scope: !441)
!704 = !DILocation(line: 947, column: 4, scope: !441)
!705 = !DILocation(line: 947, column: 27, scope: !441)
!706 = !DILocation(line: 946, column: 41, scope: !441)
!707 = !DILocation(line: 948, column: 9, scope: !441)
!708 = !DILocation(line: 948, column: 12, scope: !441)
!709 = !DILocation(line: 948, column: 19, scope: !441)
!710 = !DILocation(line: 948, column: 4, scope: !441)
!711 = !DILocation(line: 948, column: 27, scope: !441)
!712 = !DILocation(line: 947, column: 41, scope: !441)
!713 = !DILocation(line: 949, column: 9, scope: !441)
!714 = !DILocation(line: 949, column: 19, scope: !441)
!715 = !DILocation(line: 949, column: 4, scope: !441)
!716 = !DILocation(line: 949, column: 27, scope: !441)
!717 = !DILocation(line: 948, column: 41, scope: !441)
!718 = !DILocation(line: 950, column: 3, scope: !441)
!719 = !DILocation(line: 949, column: 41, scope: !441)
!720 = !DILocation(line: 945, column: 5, scope: !441)
!721 = !DILocation(line: 951, column: 2, scope: !722)
!722 = distinct !DILexicalBlock(scope: !441, file: !14, line: 951, column: 2)
!723 = !DILocation(line: 953, column: 9, scope: !441)
!724 = !DILocation(line: 953, column: 12, scope: !441)
!725 = !DILocation(line: 953, column: 4, scope: !441)
!726 = !DILocation(line: 953, column: 27, scope: !441)
!727 = !DILocation(line: 954, column: 9, scope: !441)
!728 = !DILocation(line: 954, column: 12, scope: !441)
!729 = !DILocation(line: 954, column: 19, scope: !441)
!730 = !DILocation(line: 954, column: 4, scope: !441)
!731 = !DILocation(line: 954, column: 27, scope: !441)
!732 = !DILocation(line: 953, column: 41, scope: !441)
!733 = !DILocation(line: 955, column: 9, scope: !441)
!734 = !DILocation(line: 955, column: 12, scope: !441)
!735 = !DILocation(line: 955, column: 19, scope: !441)
!736 = !DILocation(line: 955, column: 4, scope: !441)
!737 = !DILocation(line: 955, column: 27, scope: !441)
!738 = !DILocation(line: 954, column: 41, scope: !441)
!739 = !DILocation(line: 956, column: 9, scope: !441)
!740 = !DILocation(line: 956, column: 19, scope: !441)
!741 = !DILocation(line: 956, column: 4, scope: !441)
!742 = !DILocation(line: 956, column: 27, scope: !441)
!743 = !DILocation(line: 955, column: 41, scope: !441)
!744 = !DILocation(line: 957, column: 3, scope: !441)
!745 = !DILocation(line: 956, column: 41, scope: !441)
!746 = !DILocation(line: 952, column: 5, scope: !441)
!747 = !DILocation(line: 958, column: 2, scope: !748)
!748 = distinct !DILexicalBlock(scope: !441, file: !14, line: 958, column: 2)
!749 = !DILocation(line: 960, column: 9, scope: !441)
!750 = !DILocation(line: 960, column: 12, scope: !441)
!751 = !DILocation(line: 960, column: 4, scope: !441)
!752 = !DILocation(line: 960, column: 27, scope: !441)
!753 = !DILocation(line: 961, column: 9, scope: !441)
!754 = !DILocation(line: 961, column: 12, scope: !441)
!755 = !DILocation(line: 961, column: 19, scope: !441)
!756 = !DILocation(line: 961, column: 4, scope: !441)
!757 = !DILocation(line: 961, column: 27, scope: !441)
!758 = !DILocation(line: 960, column: 41, scope: !441)
!759 = !DILocation(line: 962, column: 9, scope: !441)
!760 = !DILocation(line: 962, column: 12, scope: !441)
!761 = !DILocation(line: 962, column: 19, scope: !441)
!762 = !DILocation(line: 962, column: 4, scope: !441)
!763 = !DILocation(line: 962, column: 27, scope: !441)
!764 = !DILocation(line: 961, column: 41, scope: !441)
!765 = !DILocation(line: 963, column: 9, scope: !441)
!766 = !DILocation(line: 963, column: 19, scope: !441)
!767 = !DILocation(line: 963, column: 4, scope: !441)
!768 = !DILocation(line: 963, column: 27, scope: !441)
!769 = !DILocation(line: 962, column: 41, scope: !441)
!770 = !DILocation(line: 964, column: 3, scope: !441)
!771 = !DILocation(line: 963, column: 41, scope: !441)
!772 = !DILocation(line: 959, column: 5, scope: !441)
!773 = !DILocation(line: 965, column: 2, scope: !774)
!774 = distinct !DILexicalBlock(scope: !441, file: !14, line: 965, column: 2)
!775 = !DILocation(line: 966, column: 1, scope: !441)
!776 = distinct !DISubprogram(name: "AES_ctr128_encrypt", scope: !777, file: !777, line: 55, type: !778, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: false, unit: !45, variables: !4)
!777 = !DIFile(filename: "./openssl/crypto/aes/aes_ctr.c", directory: "/home/klee/shareddir")
!778 = !DISubroutineType(types: !779)
!779 = !{null, !43, !53, !60, !780, !53, !53, !106}
!780 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !781, size: 64)
!781 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !782)
!782 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES_KEY", file: !92, line: 84, baseType: !783)
!783 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aes_key_st", file: !92, line: 76, size: 1952, elements: !784)
!784 = !{!785, !786}
!785 = !DIDerivedType(tag: DW_TAG_member, name: "rd_key", scope: !783, file: !92, line: 80, baseType: !96, size: 1920)
!786 = !DIDerivedType(tag: DW_TAG_member, name: "rounds", scope: !783, file: !92, line: 82, baseType: !77, size: 32, offset: 1920)
!787 = !DILocalVariable(name: "in", arg: 1, scope: !776, file: !777, line: 55, type: !43)
!788 = !DILocation(line: 55, column: 46, scope: !776)
!789 = !DILocalVariable(name: "out", arg: 2, scope: !776, file: !777, line: 55, type: !53)
!790 = !DILocation(line: 55, column: 65, scope: !776)
!791 = !DILocalVariable(name: "length", arg: 3, scope: !776, file: !777, line: 56, type: !60)
!792 = !DILocation(line: 56, column: 11, scope: !776)
!793 = !DILocalVariable(name: "key", arg: 4, scope: !776, file: !777, line: 56, type: !780)
!794 = !DILocation(line: 56, column: 34, scope: !776)
!795 = !DILocalVariable(name: "ivec", arg: 5, scope: !776, file: !777, line: 57, type: !53)
!796 = !DILocation(line: 57, column: 18, scope: !776)
!797 = !DILocalVariable(name: "ecount_buf", arg: 6, scope: !776, file: !777, line: 58, type: !53)
!798 = !DILocation(line: 58, column: 18, scope: !776)
!799 = !DILocalVariable(name: "num", arg: 7, scope: !776, file: !777, line: 59, type: !106)
!800 = !DILocation(line: 59, column: 18, scope: !776)
!801 = !DILocation(line: 60, column: 24, scope: !776)
!802 = !DILocation(line: 60, column: 27, scope: !776)
!803 = !DILocation(line: 60, column: 31, scope: !776)
!804 = !DILocation(line: 60, column: 38, scope: !776)
!805 = !DILocation(line: 60, column: 42, scope: !776)
!806 = !DILocation(line: 60, column: 47, scope: !776)
!807 = !DILocation(line: 60, column: 58, scope: !776)
!808 = !DILocation(line: 60, column: 2, scope: !776)
!809 = !DILocation(line: 61, column: 1, scope: !776)
!810 = distinct !DISubprogram(name: "CRYPTO_ctr128_encrypt", scope: !57, file: !57, line: 126, type: !811, isLocal: false, isDefinition: true, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: false, unit: !56, variables: !4)
!811 = !DISubroutineType(types: !812)
!812 = !{null, !43, !53, !60, !54, !53, !53, !106, !813}
!813 = !DIDerivedType(tag: DW_TAG_typedef, name: "block128_f", file: !814, line: 10, baseType: !50)
!814 = !DIFile(filename: "./openssl/crypto/modes/modes.h", directory: "/home/klee/shareddir")
!815 = !DILocalVariable(name: "in", arg: 1, scope: !810, file: !57, line: 126, type: !43)
!816 = !DILocation(line: 126, column: 49, scope: !810)
!817 = !DILocalVariable(name: "out", arg: 2, scope: !810, file: !57, line: 126, type: !53)
!818 = !DILocation(line: 126, column: 68, scope: !810)
!819 = !DILocalVariable(name: "len", arg: 3, scope: !810, file: !57, line: 127, type: !60)
!820 = !DILocation(line: 127, column: 11, scope: !810)
!821 = !DILocalVariable(name: "key", arg: 4, scope: !810, file: !57, line: 127, type: !54)
!822 = !DILocation(line: 127, column: 28, scope: !810)
!823 = !DILocalVariable(name: "ivec", arg: 5, scope: !810, file: !57, line: 128, type: !53)
!824 = !DILocation(line: 128, column: 18, scope: !810)
!825 = !DILocalVariable(name: "ecount_buf", arg: 6, scope: !810, file: !57, line: 128, type: !53)
!826 = !DILocation(line: 128, column: 42, scope: !810)
!827 = !DILocalVariable(name: "num", arg: 7, scope: !810, file: !57, line: 129, type: !106)
!828 = !DILocation(line: 129, column: 18, scope: !810)
!829 = !DILocalVariable(name: "block", arg: 8, scope: !810, file: !57, line: 129, type: !813)
!830 = !DILocation(line: 129, column: 34, scope: !810)
!831 = !DILocalVariable(name: "n", scope: !810, file: !57, line: 131, type: !8)
!832 = !DILocation(line: 131, column: 15, scope: !810)
!833 = !DILocalVariable(name: "l", scope: !810, file: !57, line: 132, type: !60)
!834 = !DILocation(line: 132, column: 9, scope: !810)
!835 = !DILocation(line: 137, column: 7, scope: !810)
!836 = !DILocation(line: 137, column: 6, scope: !810)
!837 = !DILocation(line: 137, column: 4, scope: !810)
!838 = !DILocation(line: 140, column: 30, scope: !839)
!839 = distinct !DILexicalBlock(scope: !810, file: !57, line: 140, column: 6)
!840 = distinct !{!840, !838, !841}
!841 = !DILocation(line: 172, column: 11, scope: !839)
!842 = !DILocation(line: 141, column: 3, scope: !843)
!843 = distinct !DILexicalBlock(scope: !839, file: !57, line: 140, column: 33)
!844 = !DILocation(line: 141, column: 10, scope: !843)
!845 = !DILocation(line: 141, column: 12, scope: !843)
!846 = !DILocation(line: 141, column: 15, scope: !843)
!847 = !DILocation(line: 142, column: 19, scope: !848)
!848 = distinct !DILexicalBlock(scope: !843, file: !57, line: 141, column: 20)
!849 = !DILocation(line: 142, column: 15, scope: !848)
!850 = !DILocation(line: 142, column: 25, scope: !848)
!851 = !DILocation(line: 142, column: 36, scope: !848)
!852 = !DILocation(line: 142, column: 23, scope: !848)
!853 = !DILocation(line: 142, column: 9, scope: !848)
!854 = !DILocation(line: 142, column: 13, scope: !848)
!855 = !DILocation(line: 143, column: 4, scope: !848)
!856 = !DILocation(line: 144, column: 9, scope: !848)
!857 = !DILocation(line: 144, column: 10, scope: !848)
!858 = !DILocation(line: 144, column: 14, scope: !848)
!859 = !DILocation(line: 144, column: 6, scope: !848)
!860 = distinct !{!860, !842, !861}
!861 = !DILocation(line: 145, column: 3, scope: !843)
!862 = !DILocation(line: 151, column: 3, scope: !843)
!863 = !DILocation(line: 151, column: 10, scope: !843)
!864 = !DILocation(line: 151, column: 13, scope: !843)
!865 = !DILocation(line: 152, column: 6, scope: !866)
!866 = distinct !DILexicalBlock(scope: !843, file: !57, line: 151, column: 19)
!867 = !DILocation(line: 152, column: 13, scope: !866)
!868 = !DILocation(line: 152, column: 19, scope: !866)
!869 = !DILocation(line: 152, column: 31, scope: !866)
!870 = !DILocation(line: 152, column: 4, scope: !866)
!871 = !DILocation(line: 153, column: 23, scope: !866)
!872 = !DILocation(line: 153, column: 4, scope: !866)
!873 = !DILocation(line: 154, column: 10, scope: !874)
!874 = distinct !DILexicalBlock(scope: !866, file: !57, line: 154, column: 4)
!875 = !DILocation(line: 154, column: 9, scope: !874)
!876 = !DILocation(line: 154, column: 14, scope: !877)
!877 = distinct !DILexicalBlock(scope: !874, file: !57, line: 154, column: 4)
!878 = !DILocation(line: 154, column: 15, scope: !877)
!879 = !DILocation(line: 154, column: 4, scope: !874)
!880 = !DILocation(line: 156, column: 17, scope: !877)
!881 = !DILocation(line: 156, column: 20, scope: !877)
!882 = !DILocation(line: 156, column: 19, scope: !877)
!883 = !DILocation(line: 156, column: 5, scope: !877)
!884 = !DILocation(line: 156, column: 37, scope: !877)
!885 = !DILocation(line: 156, column: 48, scope: !877)
!886 = !DILocation(line: 156, column: 47, scope: !877)
!887 = !DILocation(line: 156, column: 25, scope: !877)
!888 = !DILocation(line: 156, column: 23, scope: !877)
!889 = !DILocation(line: 155, column: 17, scope: !877)
!890 = !DILocation(line: 155, column: 21, scope: !877)
!891 = !DILocation(line: 155, column: 20, scope: !877)
!892 = !DILocation(line: 155, column: 5, scope: !877)
!893 = !DILocation(line: 155, column: 24, scope: !877)
!894 = !DILocation(line: 154, column: 21, scope: !877)
!895 = !DILocation(line: 154, column: 4, scope: !877)
!896 = distinct !{!896, !879, !897}
!897 = !DILocation(line: 156, column: 49, scope: !874)
!898 = !DILocation(line: 157, column: 8, scope: !866)
!899 = !DILocation(line: 158, column: 8, scope: !866)
!900 = !DILocation(line: 159, column: 8, scope: !866)
!901 = distinct !{!901, !862, !902}
!902 = !DILocation(line: 160, column: 3, scope: !843)
!903 = !DILocation(line: 161, column: 5, scope: !843)
!904 = !DILocation(line: 162, column: 7, scope: !905)
!905 = distinct !DILexicalBlock(scope: !843, file: !57, line: 162, column: 7)
!906 = !DILocation(line: 162, column: 7, scope: !843)
!907 = !DILocation(line: 163, column: 6, scope: !908)
!908 = distinct !DILexicalBlock(scope: !905, file: !57, line: 162, column: 12)
!909 = !DILocation(line: 163, column: 13, scope: !908)
!910 = !DILocation(line: 163, column: 19, scope: !908)
!911 = !DILocation(line: 163, column: 31, scope: !908)
!912 = !DILocation(line: 163, column: 4, scope: !908)
!913 = !DILocation(line: 164, column: 24, scope: !908)
!914 = !DILocation(line: 164, column: 5, scope: !908)
!915 = !DILocation(line: 165, column: 4, scope: !908)
!916 = !DILocation(line: 165, column: 14, scope: !908)
!917 = !DILocation(line: 166, column: 14, scope: !918)
!918 = distinct !DILexicalBlock(scope: !908, file: !57, line: 165, column: 18)
!919 = !DILocation(line: 166, column: 17, scope: !918)
!920 = !DILocation(line: 166, column: 22, scope: !918)
!921 = !DILocation(line: 166, column: 33, scope: !918)
!922 = !DILocation(line: 166, column: 20, scope: !918)
!923 = !DILocation(line: 166, column: 5, scope: !918)
!924 = !DILocation(line: 166, column: 9, scope: !918)
!925 = !DILocation(line: 166, column: 12, scope: !918)
!926 = !DILocation(line: 167, column: 5, scope: !918)
!927 = distinct !{!927, !915, !928}
!928 = !DILocation(line: 168, column: 4, scope: !908)
!929 = !DILocation(line: 169, column: 3, scope: !908)
!930 = !DILocation(line: 170, column: 10, scope: !843)
!931 = !DILocation(line: 170, column: 4, scope: !843)
!932 = !DILocation(line: 170, column: 8, scope: !843)
!933 = !DILocation(line: 171, column: 3, scope: !843)
!934 = !DILocation(line: 186, column: 1, scope: !810)
!935 = distinct !DISubprogram(name: "ctr128_inc_aligned", scope: !57, file: !57, line: 92, type: !936, isLocal: true, isDefinition: true, scopeLine: 92, flags: DIFlagPrototyped, isOptimized: false, unit: !56, variables: !4)
!936 = !DISubroutineType(types: !937)
!937 = !{null, !53}
!938 = !DILocalVariable(name: "counter", arg: 1, scope: !935, file: !57, line: 92, type: !53)
!939 = !DILocation(line: 92, column: 47, scope: !935)
!940 = !DILocalVariable(name: "data", scope: !935, file: !57, line: 93, type: !59)
!941 = !DILocation(line: 93, column: 10, scope: !935)
!942 = !DILocalVariable(name: "c", scope: !935, file: !57, line: 93, type: !60)
!943 = !DILocation(line: 93, column: 15, scope: !935)
!944 = !DILocalVariable(name: "n", scope: !935, file: !57, line: 93, type: !60)
!945 = !DILocation(line: 93, column: 17, scope: !935)
!946 = !DILocalVariable(name: "is_endian", scope: !935, file: !57, line: 94, type: !947)
!947 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !948)
!948 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !935, file: !57, line: 94, size: 64, elements: !949)
!949 = !{!950, !952}
!950 = !DIDerivedType(tag: DW_TAG_member, name: "one", scope: !948, file: !57, line: 94, baseType: !951, size: 64)
!951 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "little", scope: !948, file: !57, line: 94, baseType: !953, size: 8)
!953 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!954 = !DILocation(line: 94, column: 41, scope: !935)
!955 = !DILocation(line: 96, column: 16, scope: !956)
!956 = distinct !DILexicalBlock(scope: !935, file: !57, line: 96, column: 6)
!957 = !DILocation(line: 96, column: 6, scope: !956)
!958 = !DILocation(line: 96, column: 6, scope: !935)
!959 = !DILocation(line: 97, column: 14, scope: !960)
!960 = distinct !DILexicalBlock(scope: !956, file: !57, line: 96, column: 24)
!961 = !DILocation(line: 97, column: 3, scope: !960)
!962 = !DILocation(line: 98, column: 3, scope: !960)
!963 = !DILocation(line: 101, column: 19, scope: !935)
!964 = !DILocation(line: 101, column: 9, scope: !935)
!965 = !DILocation(line: 101, column: 7, scope: !935)
!966 = !DILocation(line: 102, column: 4, scope: !935)
!967 = !DILocation(line: 103, column: 2, scope: !935)
!968 = distinct !{!968, !967, !969}
!969 = !DILocation(line: 109, column: 12, scope: !935)
!970 = !DILocation(line: 104, column: 3, scope: !971)
!971 = distinct !DILexicalBlock(scope: !935, file: !57, line: 103, column: 5)
!972 = !DILocation(line: 105, column: 7, scope: !971)
!973 = !DILocation(line: 105, column: 12, scope: !971)
!974 = !DILocation(line: 105, column: 5, scope: !971)
!975 = !DILocation(line: 106, column: 3, scope: !971)
!976 = !DILocation(line: 107, column: 13, scope: !971)
!977 = !DILocation(line: 107, column: 3, scope: !971)
!978 = !DILocation(line: 107, column: 8, scope: !971)
!979 = !DILocation(line: 107, column: 11, scope: !971)
!980 = !DILocation(line: 108, column: 7, scope: !981)
!981 = distinct !DILexicalBlock(scope: !971, file: !57, line: 108, column: 7)
!982 = !DILocation(line: 108, column: 7, scope: !971)
!983 = !DILocation(line: 108, column: 10, scope: !981)
!984 = !DILocation(line: 109, column: 2, scope: !971)
!985 = !DILocation(line: 109, column: 11, scope: !935)
!986 = !DILocation(line: 110, column: 1, scope: !935)
!987 = distinct !DISubprogram(name: "ctr128_inc", scope: !57, file: !57, line: 79, type: !936, isLocal: true, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, unit: !56, variables: !4)
!988 = !DILocalVariable(name: "counter", arg: 1, scope: !987, file: !57, line: 79, type: !53)
!989 = !DILocation(line: 79, column: 39, scope: !987)
!990 = !DILocalVariable(name: "c", scope: !987, file: !57, line: 80, type: !63)
!991 = !DILocation(line: 80, column: 6, scope: !987)
!992 = !DILocalVariable(name: "n", scope: !987, file: !57, line: 80, type: !63)
!993 = !DILocation(line: 80, column: 8, scope: !987)
!994 = !DILocation(line: 82, column: 2, scope: !987)
!995 = distinct !{!995, !994, !996}
!996 = !DILocation(line: 88, column: 12, scope: !987)
!997 = !DILocation(line: 83, column: 5, scope: !998)
!998 = distinct !DILexicalBlock(scope: !987, file: !57, line: 82, column: 5)
!999 = !DILocation(line: 84, column: 7, scope: !998)
!1000 = !DILocation(line: 84, column: 5, scope: !998)
!1001 = !DILocation(line: 85, column: 3, scope: !998)
!1002 = !DILocation(line: 85, column: 10, scope: !998)
!1003 = !DILocation(line: 86, column: 3, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !998, file: !57, line: 86, column: 3)
!1005 = !DILocation(line: 87, column: 7, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !998, file: !57, line: 87, column: 7)
!1007 = !DILocation(line: 87, column: 7, scope: !998)
!1008 = !DILocation(line: 87, column: 10, scope: !1006)
!1009 = !DILocation(line: 88, column: 2, scope: !998)
!1010 = !DILocation(line: 88, column: 11, scope: !987)
!1011 = !DILocation(line: 89, column: 1, scope: !987)
!1012 = distinct !DISubprogram(name: "memcpy", scope: !66, file: !66, line: 12, type: !1013, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, unit: !65, variables: !4)
!1013 = !DISubroutineType(types: !1014)
!1014 = !{!1015, !1015, !54, !1016}
!1015 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1016 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1017, line: 62, baseType: !62)
!1017 = !DIFile(filename: "/usr/lib/llvm-6.0/lib/clang/6.0.0/include/stddef.h", directory: "/home/klee/kleespectre/klee/build/runtime/FreeStanding")
!1018 = !DILocalVariable(name: "destaddr", arg: 1, scope: !1012, file: !66, line: 12, type: !1015)
!1019 = !DILocation(line: 12, column: 20, scope: !1012)
!1020 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !1012, file: !66, line: 12, type: !54)
!1021 = !DILocation(line: 12, column: 42, scope: !1012)
!1022 = !DILocalVariable(name: "len", arg: 3, scope: !1012, file: !66, line: 12, type: !1016)
!1023 = !DILocation(line: 12, column: 58, scope: !1012)
!1024 = !DILocalVariable(name: "dest", scope: !1012, file: !66, line: 13, type: !1025)
!1025 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !953, size: 64)
!1026 = !DILocation(line: 13, column: 9, scope: !1012)
!1027 = !DILocalVariable(name: "src", scope: !1012, file: !66, line: 14, type: !1028)
!1028 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1029, size: 64)
!1029 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !953)
!1030 = !DILocation(line: 14, column: 15, scope: !1012)
!1031 = !DILocation(line: 16, column: 16, scope: !1012)
!1032 = !DILocation(line: 16, column: 3, scope: !1012)
!1033 = !DILocation(line: 16, column: 13, scope: !1012)
!1034 = !DILocation(line: 17, column: 19, scope: !1012)
!1035 = !DILocation(line: 17, column: 15, scope: !1012)
!1036 = !DILocation(line: 17, column: 10, scope: !1012)
!1037 = !DILocation(line: 17, column: 13, scope: !1012)
!1038 = distinct !{!1038, !1032, !1034}
!1039 = !DILocation(line: 18, column: 3, scope: !1012)
!1040 = distinct !DISubprogram(name: "memset", scope: !68, file: !68, line: 12, type: !1041, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, unit: !67, variables: !4)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!1015, !1015, !77, !1016}
!1043 = !DILocalVariable(name: "dst", arg: 1, scope: !1040, file: !68, line: 12, type: !1015)
!1044 = !DILocation(line: 12, column: 20, scope: !1040)
!1045 = !DILocalVariable(name: "s", arg: 2, scope: !1040, file: !68, line: 12, type: !77)
!1046 = !DILocation(line: 12, column: 29, scope: !1040)
!1047 = !DILocalVariable(name: "count", arg: 3, scope: !1040, file: !68, line: 12, type: !1016)
!1048 = !DILocation(line: 12, column: 39, scope: !1040)
!1049 = !DILocalVariable(name: "a", scope: !1040, file: !68, line: 13, type: !1025)
!1050 = !DILocation(line: 13, column: 9, scope: !1040)
!1051 = !DILocation(line: 14, column: 18, scope: !1040)
!1052 = !DILocation(line: 14, column: 3, scope: !1040)
!1053 = !DILocation(line: 14, column: 15, scope: !1040)
!1054 = !DILocation(line: 15, column: 7, scope: !1040)
!1055 = !DILocation(line: 15, column: 10, scope: !1040)
!1056 = distinct !{!1056, !1052, !1057}
!1057 = !DILocation(line: 15, column: 12, scope: !1040)
!1058 = !DILocation(line: 16, column: 3, scope: !1040)
