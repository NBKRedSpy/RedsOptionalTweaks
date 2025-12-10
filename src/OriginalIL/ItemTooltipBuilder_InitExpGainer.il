.method private hidebysig 
	instance void InitExpGainer (
		class MGSC.ExpGainerRecord 'record',
		class MGSC.Mercenary mercenary
	) cil managed 
{
	// Method begins at RVA 0xf0afc
	// Header size: 12
	// Code size: 315 (0x13b)
	.maxstack 3
	.locals init (
		[0] string,
		[1] string,
		[2] int32,
		[3] string,
		[4] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>,
		[5] string,
		[6] string
	)

	// 	string text = record.ExpAmount.ToString().WrapInColor(Colors.White);
	IL_0000: ldarg.1
	IL_0001: callvirt instance int32 MGSC.ExpGainerRecord::get_ExpAmount()
	IL_0006: stloc.2
	// 	string text2 = $"/{record.ExpPerkCount}".WrapInColor(Colors.DarkYellow);
	IL_0007: ldloca.s 2
	IL_0009: call instance string [mscorlib]System.Int32::ToString()
	IL_000e: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_White()
	IL_0013: call string MGSC.FormatHelper::WrapInColor(string, valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	IL_0018: stloc.0
	IL_0019: ldstr "/{0}"
	IL_001e: ldarg.1
	IL_001f: callvirt instance int32 MGSC.ExpGainerRecord::get_ExpPerkCount()
	IL_0024: box [mscorlib]System.Int32
	IL_0029: call string [mscorlib]System.String::Format(string, object)
	IL_002e: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_DarkYellow()
	IL_0033: call string MGSC.FormatHelper::WrapInColor(string, valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	IL_0038: stloc.1
	// 	_factory.AddPanelToTooltip().SetIcon("common_gain_exp").LocalizeName("tooltip.GainExpToPerks")
	// 		.SetValue(text + text2);
	IL_0039: ldarg.0
	IL_003a: ldfld class MGSC.TooltipFactory MGSC.ItemTooltipBuilder::_factory
	IL_003f: callvirt instance class MGSC.TooltipProperty MGSC.TooltipFactory::AddPanelToTooltip()
	IL_0044: ldstr "common_gain_exp"
	IL_0049: callvirt instance class MGSC.TooltipProperty MGSC.TooltipProperty::SetIcon(string)
	IL_004e: ldstr "tooltip.GainExpToPerks"
	IL_0053: callvirt instance class MGSC.TooltipProperty MGSC.TooltipProperty::LocalizeName(string)
	IL_0058: ldloc.0
	IL_0059: ldloc.1
	IL_005a: call string [mscorlib]System.String::Concat(string, string)
	IL_005f: ldc.i4.1
	IL_0060: callvirt instance class MGSC.TooltipProperty MGSC.TooltipProperty::SetValue(string, bool)
	IL_0065: pop
	// 	if (record.AllowedPerkIds.Contains("all"))
	IL_0066: ldarg.1
	IL_0067: callvirt instance class [mscorlib]System.Collections.Generic.List`1<string> MGSC.ExpGainerRecord::get_AllowedPerkIds()
	IL_006c: ldstr "all"
	IL_0071: callvirt instance bool class [mscorlib]System.Collections.Generic.List`1<string>::Contains(!0)
	IL_0076: brfalse.s IL_0099

	// 		_factory.AddPanelToTooltip().LocalizeName("ui.label.all_perk_types").SetNameColor(Colors.AltGreen);
	IL_0078: ldarg.0
	IL_0079: ldfld class MGSC.TooltipFactory MGSC.ItemTooltipBuilder::_factory
	IL_007e: callvirt instance class MGSC.TooltipProperty MGSC.TooltipFactory::AddPanelToTooltip()
	IL_0083: ldstr "ui.label.all_perk_types"
	IL_0088: callvirt instance class MGSC.TooltipProperty MGSC.TooltipProperty::LocalizeName(string)
	IL_008d: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_AltGreen()
	IL_0092: callvirt instance class MGSC.TooltipProperty MGSC.TooltipProperty::SetNameColor(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	IL_0097: pop
	// }
	IL_0098: ret

	// 	string text3 = string.Empty;
	IL_0099: ldsfld string [mscorlib]System.String::Empty
	IL_009e: stloc.3
	// 	foreach (string allowedPerkId in record.AllowedPerkIds)
	IL_009f: ldarg.1
	IL_00a0: callvirt instance class [mscorlib]System.Collections.Generic.List`1<string> MGSC.ExpGainerRecord::get_AllowedPerkIds()
	IL_00a5: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<string>::GetEnumerator()
	IL_00aa: stloc.s 4
	.try
	{
		// 	foreach (string allowedPerkId in record.AllowedPerkIds)
		IL_00ac: br.s IL_0105
		// loop start (head: IL_0105)
			IL_00ae: ldloca.s 4
			IL_00b0: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>::get_Current()
			IL_00b5: stloc.s 5
			// 		string text4 = Localization.Get("perk." + allowedPerkId + ".name");
			IL_00b7: ldstr "perk."
			IL_00bc: ldloc.s 5
			IL_00be: ldstr ".name"
			IL_00c3: call string [mscorlib]System.String::Concat(string, string, string)
			IL_00c8: call string MGSC.Localization::Get(string)
			IL_00cd: stloc.s 6
			// 		if (mercenary != null && PerkSystem.ContainsPerk(mercenary, allowedPerkId))
			IL_00cf: ldarg.2
			IL_00d0: brfalse.s IL_00ea

			IL_00d2: ldarg.2
			IL_00d3: ldloc.s 5
			IL_00d5: call bool MGSC.PerkSystem::ContainsPerk(class MGSC.Mercenary, string)
			IL_00da: brfalse.s IL_00ea

			// 			text4 = text4.WrapInColor(Colors.White);
			IL_00dc: ldloc.s 6
			IL_00de: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_White()
			IL_00e3: call string MGSC.FormatHelper::WrapInColor(string, valuetype [UnityEngine.CoreModule]UnityEngine.Color)
			IL_00e8: stloc.s 6

			// 		text3 = ((!string.IsNullOrEmpty(text3)) ? (text3 + ", " + text4) : text4);
			IL_00ea: ldloc.3
			IL_00eb: call bool [mscorlib]System.String::IsNullOrEmpty(string)
			IL_00f0: brfalse.s IL_00f7

			IL_00f2: ldloc.s 6
			IL_00f4: stloc.3
			// (no C# code)
			IL_00f5: br.s IL_0105

			// 	foreach (string allowedPerkId in record.AllowedPerkIds)
			IL_00f7: ldloc.3
			IL_00f8: ldstr ", "
			IL_00fd: ldloc.s 6
			IL_00ff: call string [mscorlib]System.String::Concat(string, string, string)
			IL_0104: stloc.3

			IL_0105: ldloca.s 4
			IL_0107: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>::MoveNext()
			IL_010c: brtrue.s IL_00ae
		// end loop

		// (no C# code)
		IL_010e: leave.s IL_011e
	} // end .try
	finally
	{
		IL_0110: ldloca.s 4
		IL_0112: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>
		IL_0118: callvirt instance void [mscorlib]System.IDisposable::Dispose()
		// 	_factory.AddPanelToTooltip().SetMultilineName(text3).SetNameColor(Colors.AltGreen);
		IL_011d: endfinally
	} // end handler

	IL_011e: ldarg.0
	IL_011f: ldfld class MGSC.TooltipFactory MGSC.ItemTooltipBuilder::_factory
	IL_0124: callvirt instance class MGSC.TooltipProperty MGSC.TooltipFactory::AddPanelToTooltip()
	IL_0129: ldloc.3
	IL_012a: callvirt instance class MGSC.TooltipProperty MGSC.TooltipProperty::SetMultilineName(string)
	IL_012f: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_AltGreen()
	IL_0134: callvirt instance class MGSC.TooltipProperty MGSC.TooltipProperty::SetNameColor(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	IL_0139: pop
	// (no C# code)
	IL_013a: ret
} // end of method ItemTooltipBuilder::InitExpGainer
