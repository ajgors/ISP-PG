
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�

�Clock Placer Checks: Poor placement for routing between an IO pin and BUFG. 
Resolution: Poor placement of an IO pin and a BUFG has resulted in the router using a non-dedicated path between the two.  There are several things that could trigger this DRC, each of which can cause unpredictable clock insertion delays that result in poor timing.  This DRC could be caused by any of the following: (a) a clock port was placed on a pin that is not a CCIO-pin (b)the BUFG has not been placed in the same half of the device or SLR as the CCIO-pin (c) a single ended clock has been placed on the N-Side of a differential pair CCIO-pin.
 This is normally an ERROR but the CLOCK_DEDICATED_ROUTE constraint is set to FALSE allowing your design to continue. The use of this override is highly discouraged as it may lead to very poor timing results. It is recommended that this error condition be corrected in the design.

	%s (IBUF.O) is locked to %s
	%s (BUFG.I) is provisionally placed by clockplacer on %s
%s*DRC2L
 "6
clk_i_IBUF_inst	clk_i_IBUF_inst2default:default2default:default2@
 "*
	IOB_X0Y82
	IOB_X0Y822default:default2default:default2V
 "@
clk_i_IBUF_BUFG_inst	clk_i_IBUF_BUFG_inst2default:default2default:default2H
 "2
BUFGCTRL_X0Y0
BUFGCTRL_X0Y02default:default2default:default2;
 #DRC|Implementation|Placement|Clocks2default:default8ZPLCK-12h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
C
.Phase 1 Build RT Design | Checksum: 1894d1f85
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1577.027 ; gain = 121.5042default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
{
\No timing constraints were detected. The router will operate in resource-optimization mode.
64*routeZ35-64h px� 
{

Phase %s%s
101*constraints2
2.1 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
N
9Phase 2.1 Fix Topology Constraints | Checksum: 1894d1f85
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1583.074 ; gain = 127.5512default:defaulth px� 
t

Phase %s%s
101*constraints2
2.2 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
G
2Phase 2.2 Pre Route Cleanup | Checksum: 1894d1f85
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1583.074 ; gain = 127.5512default:defaulth px� 
I
4Phase 2 Router Initialization | Checksum: 14f23790a
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1589.875 ; gain = 134.3522default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
B
-Phase 3 Initial Routing | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1593.516 ; gain = 137.9922default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
G
2Phase 4.1 Global Iteration 0 | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1593.516 ; gain = 137.9922default:defaulth px� 
E
0Phase 4 Rip-up And Reroute | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1593.516 ; gain = 137.9922default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
N
9Phase 5 Delay and Skew Optimization | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1593.516 ; gain = 137.9922default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
B
-Phase 6.1 Hold Fix Iter | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1593.516 ; gain = 137.9922default:defaulth px� 
@
+Phase 6 Post Hold Fix | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1593.516 ; gain = 137.9922default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
A
,Phase 7 Route finalize | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1593.516 ; gain = 137.9922default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
H
3Phase 8 Verifying routed nets | Checksum: feac0c10
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1595.547 ; gain = 140.0232default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 10e700a8d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1595.547 ; gain = 140.0232default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1595.547 ; gain = 140.0232default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
532default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:082default:default2
00:00:142default:default2
1595.5472default:default2
147.7732default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1595.5472default:default2
0.0002default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0182default:default2
1605.3792default:default2
9.8322default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2F
2C:/Users/lab1/LAB2/LAB2.runs/impl_1/top_routed.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2r
^Executing : report_drc -file top_drc_routed.rpt -pb top_drc_routed.pb -rpx top_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2e
Qreport_drc -file top_drc_routed.rpt -pb top_drc_routed.pb -rpx top_drc_routed.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
6C:/Users/lab1/LAB2/LAB2.runs/impl_1/top_drc_routed.rpt6C:/Users/lab1/LAB2/LAB2.runs/impl_1/top_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file top_methodology_drc_routed.rpt -pb top_methodology_drc_routed.pb -rpx top_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
}report_methodology -file top_methodology_drc_routed.rpt -pb top_methodology_drc_routed.pb -rpx top_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
BC:/Users/lab1/LAB2/LAB2.runs/impl_1/top_methodology_drc_routed.rptBC:/Users/lab1/LAB2/LAB2.runs/impl_1/top_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
%s4*runtcl2�
nExecuting : report_power -file top_power_routed.rpt -pb top_power_summary_routed.pb -rpx top_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2u
areport_power -file top_power_routed.rpt -pb top_power_summary_routed.pb -rpx top_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
P
/No user defined clocks was found in the design!216*powerZ33-232h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
652default:default2
42default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
%s4*runtcl2g
SExecuting : report_route_status -file top_route_status.rpt -pb top_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -file top_timing_summary_routed.rpt -pb top_timing_summary_routed.pb -rpx top_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
�
iThere are no user specified timing constraints. Timing constraints are needed for proper timing analysis.200*timingZ38-313h px� 
|
%s4*runtcl2`
LExecuting : report_incremental_reuse -file top_incremental_reuse_routed.rpt
2default:defaulth px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
|
%s4*runtcl2`
LExecuting : report_clock_utilization -file top_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file top_bus_skew_routed.rpt -pb top_bus_skew_routed.pb -rpx top_bus_skew_routed.rpx
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 


End Record