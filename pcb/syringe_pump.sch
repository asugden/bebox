<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.3.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="we-board">
<description>Boards: Arduino/Genuino, Raspberry Pi...</description>
<packages>
<package name="STEPSTICK_TP">
<description>21 tPlace</description>
<wire x1="-7.62" y1="-10.16" x2="-7.62" y2="10.16" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="10.16" x2="7.62" y2="10.16" width="0.1524" layer="21"/>
<wire x1="7.62" y1="10.16" x2="7.62" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-10.16" x2="-7.62" y2="-10.16" width="0.1524" layer="21"/>
<pad name="DIR" x="-6.35" y="-8.89" drill="0.9" diameter="1.5" shape="square" rot="R90"/>
<pad name="STEP" x="-6.35" y="-6.35" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="NC" x="-6.35" y="-3.81" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="NC/CFG0" x="-6.35" y="-1.27" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="CFG3" x="-6.35" y="1.27" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="CFG2" x="-6.35" y="3.81" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="CFG1" x="-6.35" y="6.35" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="EN" x="-6.35" y="8.89" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="GND@2" x="6.35" y="-8.89" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="VIO" x="6.35" y="-6.35" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="M1B" x="6.35" y="-3.81" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="M1A" x="6.35" y="-1.27" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="M2A" x="6.35" y="1.27" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="M2B" x="6.35" y="3.81" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="GND@1" x="6.35" y="6.35" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="VM" x="6.35" y="8.89" drill="0.9" diameter="1.5" shape="square" rot="R90"/>
<pad name="VREF" x="-3.81" y="8.89" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="DIAG1" x="-1.27" y="8.89" drill="0.9" diameter="1.5" rot="R90"/>
<pad name="DIAG0" x="-2.54" y="7.239" drill="0.9" diameter="1.5" rot="R90"/>
<text x="0" y="1.27" size="0.8128" layer="25" font="vector" ratio="10" rot="R180" align="center">&gt;NAME</text>
<text x="0" y="-1.27" size="0.8128" layer="27" font="vector" ratio="10" rot="R180" align="center">&gt;VALUE</text>
</package>
<package name="STEPSTICK-TEST">
<description>Test Pins</description>
<wire x1="-7.62" y1="-10.16" x2="-7.62" y2="10.16" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="10.16" x2="7.62" y2="10.16" width="0.1524" layer="21"/>
<wire x1="7.62" y1="10.16" x2="7.62" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-10.16" x2="-7.62" y2="-10.16" width="0.1524" layer="21"/>
<pad name="DIR" x="-6.35" y="-8.89" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="STEP" x="-6.35" y="-6.35" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="NC" x="-6.35" y="-3.81" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="NC/CFG0" x="-6.35" y="-1.27" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="CFG3" x="-6.35" y="1.27" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="CFG2" x="-6.35" y="3.81" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="CFG1" x="-6.35" y="6.35" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="EN" x="-6.35" y="8.89" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="GND@2" x="6.35" y="-8.89" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="VIO" x="6.35" y="-6.35" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="M1B" x="6.35" y="-3.81" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="M1A" x="6.35" y="-1.27" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="M2A" x="6.35" y="1.27" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="M2B" x="6.35" y="3.81" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="GND@1" x="6.35" y="6.35" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="VM" x="6.35" y="8.89" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="VREF" x="-3.81" y="8.89" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="DIAG1" x="-1.27" y="8.89" drill="1.3" diameter="1.9" rot="R90"/>
<pad name="DIAG0" x="-2.54" y="7.112" drill="1.3" diameter="1.9" rot="R90"/>
<text x="0" y="1.27" size="0.8128" layer="25" font="vector" ratio="10" rot="R180" align="center">&gt;NAME</text>
<text x="0" y="-1.27" size="0.8128" layer="27" font="vector" ratio="10" rot="R180" align="center">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="STEPSTICK">
<wire x1="-10.16" y1="17.78" x2="-10.16" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-17.78" x2="10.16" y2="-17.78" width="0.254" layer="94"/>
<wire x1="10.16" y1="-17.78" x2="10.16" y2="17.78" width="0.254" layer="94"/>
<wire x1="10.16" y1="17.78" x2="-10.16" y2="17.78" width="0.254" layer="94"/>
<text x="-10.16" y="20.32" size="1.778" layer="95" align="top-left">&gt;NAME</text>
<text x="-10.16" y="-20.32" size="1.778" layer="95">&gt;Value</text>
<pin name="DIR" x="-12.7" y="12.7" visible="pin" length="short"/>
<pin name="STEP" x="-12.7" y="10.16" visible="pin" length="short"/>
<pin name="CFG1/SDI" x="-12.7" y="2.54" visible="pin" length="short"/>
<pin name="CFG2/SCK" x="-12.7" y="0" visible="pin" length="short"/>
<pin name="CFG3/CS" x="-12.7" y="-2.54" visible="pin" length="short"/>
<pin name="DIAG0" x="-12.7" y="-7.62" visible="pin" length="short"/>
<pin name="EN(CFG6)" x="-12.7" y="15.24" visible="pin" length="short"/>
<pin name="VM" x="12.7" y="-5.08" visible="pin" length="short" direction="pwr" rot="R180"/>
<pin name="VIO" x="12.7" y="-10.16" visible="pin" length="short" direction="pwr" rot="R180"/>
<pin name="GND" x="12.7" y="-15.24" visible="pin" length="short" direction="pwr" rot="R180"/>
<pin name="M1A" x="12.7" y="10.16" visible="pin" length="short" direction="out" rot="R180"/>
<pin name="DIAG1" x="-12.7" y="-10.16" visible="pin" length="short"/>
<pin name="M2A" x="12.7" y="5.08" visible="pin" length="short" direction="out" rot="R180"/>
<pin name="M1B" x="12.7" y="15.24" visible="pin" length="short" direction="out" rot="R180"/>
<pin name="M2B" x="12.7" y="0" visible="pin" length="short" direction="out" rot="R180"/>
<pin name="VREF" x="-12.7" y="-15.24" visible="pin" length="short" direction="pas"/>
<pin name="CFG0/SD0" x="-12.7" y="5.08" visible="pin" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="STEPSTICK" prefix="B">
<description>SilentStepStick - Trinamic TMC2100/TMC2130 Stepper Motor Driver&lt;br&gt;
&lt;br&gt;
TMC2100 - CFG pins for configuration&lt;br&gt;
TMC2130 - SPI for configuration&lt;br&gt;
&lt;br&gt;
&lt;i&gt;Pin CFG0/SDO only available on TMC2130 SilentStepStick.&lt;/i&gt;</description>
<gates>
<gate name="BOARD" symbol="STEPSTICK" x="0" y="0"/>
</gates>
<devices>
<device name="-TP" package="STEPSTICK_TP">
<connects>
<connect gate="BOARD" pin="CFG0/SD0" pad="NC/CFG0"/>
<connect gate="BOARD" pin="CFG1/SDI" pad="CFG1"/>
<connect gate="BOARD" pin="CFG2/SCK" pad="CFG2"/>
<connect gate="BOARD" pin="CFG3/CS" pad="CFG3"/>
<connect gate="BOARD" pin="DIAG0" pad="DIAG0"/>
<connect gate="BOARD" pin="DIAG1" pad="DIAG1"/>
<connect gate="BOARD" pin="DIR" pad="DIR"/>
<connect gate="BOARD" pin="EN(CFG6)" pad="EN"/>
<connect gate="BOARD" pin="GND" pad="GND@1 GND@2"/>
<connect gate="BOARD" pin="M1A" pad="M1A"/>
<connect gate="BOARD" pin="M1B" pad="M1B"/>
<connect gate="BOARD" pin="M2A" pad="M2A"/>
<connect gate="BOARD" pin="M2B" pad="M2B"/>
<connect gate="BOARD" pin="STEP" pad="STEP"/>
<connect gate="BOARD" pin="VIO" pad="VIO"/>
<connect gate="BOARD" pin="VM" pad="VM"/>
<connect gate="BOARD" pin="VREF" pad="VREF"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TEST" package="STEPSTICK-TEST">
<connects>
<connect gate="BOARD" pin="CFG0/SD0" pad="NC/CFG0"/>
<connect gate="BOARD" pin="CFG1/SDI" pad="CFG1"/>
<connect gate="BOARD" pin="CFG2/SCK" pad="CFG2"/>
<connect gate="BOARD" pin="CFG3/CS" pad="CFG3"/>
<connect gate="BOARD" pin="DIAG0" pad="DIAG0"/>
<connect gate="BOARD" pin="DIAG1" pad="DIAG1"/>
<connect gate="BOARD" pin="DIR" pad="DIR"/>
<connect gate="BOARD" pin="EN(CFG6)" pad="EN"/>
<connect gate="BOARD" pin="GND" pad="GND@1 GND@2"/>
<connect gate="BOARD" pin="M1A" pad="M1A"/>
<connect gate="BOARD" pin="M1B" pad="M1B"/>
<connect gate="BOARD" pin="M2A" pad="M2A"/>
<connect gate="BOARD" pin="M2B" pad="M2B"/>
<connect gate="BOARD" pin="STEP" pad="STEP"/>
<connect gate="BOARD" pin="VIO" pad="VIO"/>
<connect gate="BOARD" pin="VM" pad="VM"/>
<connect gate="BOARD" pin="VREF" pad="VREF"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="R-785.0-0.5">
<packages>
<package name="RECOM_R-785.0-0.5">
<wire x1="5.75" y1="-3.775" x2="5.75" y2="3.775" width="0.127" layer="21"/>
<wire x1="5.75" y1="3.775" x2="-5.75" y2="3.775" width="0.127" layer="21"/>
<wire x1="-5.75" y1="3.775" x2="-5.75" y2="-3.775" width="0.127" layer="21"/>
<wire x1="-5.75" y1="-3.775" x2="5.75" y2="-3.775" width="0.127" layer="21"/>
<wire x1="6" y1="-4.025" x2="6" y2="4.025" width="0.05" layer="39"/>
<wire x1="6" y1="4.025" x2="-6" y2="4.025" width="0.05" layer="39"/>
<wire x1="-6" y1="4.025" x2="-6" y2="-4.025" width="0.05" layer="39"/>
<wire x1="-6" y1="-4.025" x2="6" y2="-4.025" width="0.05" layer="39"/>
<text x="-6.049490625" y="3.981240625" size="1.272" layer="25">&gt;NAME</text>
<text x="-6.050659375" y="-6.03563125" size="1.27225" layer="27">&gt;VALUE</text>
<circle x="-2.64" y="-4.375" radius="0.3" width="0" layer="21"/>
<pad name="1" x="-2.54" y="-1.775" drill="1" shape="square" rot="R180"/>
<pad name="2" x="0" y="-1.775" drill="1" rot="R180"/>
<pad name="3" x="2.54" y="-1.775" drill="1" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="R-785.0-0.5">
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<text x="-10.1772" y="5.597440625" size="1.27215" layer="95">&gt;NAME</text>
<text x="-10.1827" y="-7.637090625" size="1.27285" layer="96">&gt;VALUE</text>
<pin name="+VIN" x="-12.7" y="0" length="short" direction="in"/>
<pin name="GND" x="10.16" y="-2.54" length="short" direction="pwr" rot="R180"/>
<pin name="+VOUT" x="10.16" y="2.54" length="short" direction="out" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="R-785.0-0.5" prefix="U">
<description>Switching Regulator, 0.5 Amp, Sip 3, 5vsingle Output, High Efficiency</description>
<gates>
<gate name="G$1" symbol="R-785.0-0.5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RECOM_R-785.0-0.5">
<connects>
<connect gate="G$1" pin="+VIN" pad="1"/>
<connect gate="G$1" pin="+VOUT" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" Switching Regulator, 0.5 Amp, Sip 3, 5vsingle Output, High Efficiency "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="945-1037-ND"/>
<attribute name="DIGI-KEY_PURCHASE_URL" value="https://www.digikey.com/product-detail/en/recom-power/R-785.0-0.5/945-1037-ND/2256217?utm_source=snapeda&amp;utm_medium=aggregator&amp;utm_campaign=symbol"/>
<attribute name="MF" value="Recom Power"/>
<attribute name="MP" value="R-785.0-0.5"/>
<attribute name="PACKAGE" value="SIP-3 Recom Power"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="B1" library="we-board" deviceset="STEPSTICK" device="-TP"/>
<part name="U1" library="R-785.0-0.5" deviceset="R-785.0-0.5" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="B1" gate="BOARD" x="33.02" y="71.12" smashed="yes">
<attribute name="NAME" x="22.86" y="91.44" size="1.778" layer="95" align="top-left"/>
<attribute name="VALUE" x="22.86" y="50.8" size="1.778" layer="95"/>
</instance>
<instance part="U1" gate="G$1" x="78.74" y="83.82" smashed="yes">
<attribute name="NAME" x="68.5628" y="89.417440625" size="1.27215" layer="95"/>
<attribute name="VALUE" x="68.5573" y="76.182909375" size="1.27285" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
