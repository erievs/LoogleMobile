; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [111 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [222 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 42
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 110
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 46
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 87
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 52
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 69
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 750875890346172408, ; 7: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 103
	i64 799765834175365804, ; 8: System.ComponentModel.dll => 0xb1956c9f18442ac => 82
	i64 849051935479314978, ; 9: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 10: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 57
	i64 1055774368762298424, ; 11: ar/Microsoft.Maui.Controls.resources => 0xea6dd31d50a0038 => 0
	i64 1120440138749646132, ; 12: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 73
	i64 1121665720830085036, ; 13: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1369545283391376210, ; 14: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 65
	i64 1476839205573959279, ; 15: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 91
	i64 1486715745332614827, ; 16: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 43
	i64 1513467482682125403, ; 17: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 109
	i64 1537168428375924959, ; 18: System.Threading.Thread.dll => 0x15551e8a954ae0df => 103
	i64 1556147632182429976, ; 19: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 20: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 50
	i64 1628611045998245443, ; 21: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 62
	i64 1643226597988041431, ; 22: pl/Microsoft.Maui.Controls.resources => 0x16cde9e27a8d02d7 => 20
	i64 1743969030606105336, ; 23: System.Memory.dll => 0x1833d297e88f2af8 => 89
	i64 1767386781656293639, ; 24: System.Private.Uri.dll => 0x188704e9f5582107 => 95
	i64 1795316252682057001, ; 25: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 49
	i64 1836611346387731153, ; 26: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 69
	i64 1920760634179481754, ; 27: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 44
	i64 1959996714666907089, ; 28: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 29: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 61
	i64 1983698669889758782, ; 30: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 31: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2145898162032646099, ; 32: ko/Microsoft.Maui.Controls.resources => 0x1dc7c302481e97d3 => 16
	i64 2262844636196693701, ; 33: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 57
	i64 2287834202362508563, ; 34: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 77
	i64 2302323944321350744, ; 35: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 36: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 60
	i64 2405413894731521496, ; 37: da/Microsoft.Maui.Controls.resources => 0x2161bf315d42ddd8 => 3
	i64 2470498323731680442, ; 38: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 53
	i64 2492380397191429704, ; 39: cs/Microsoft.Maui.Controls.resources => 0x2296b6c41bbdfe48 => 2
	i64 2497223385847772520, ; 40: System.Runtime => 0x22a7eb7046413568 => 99
	i64 2547086958574651984, ; 41: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 48
	i64 2656907746661064104, ; 42: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 37
	i64 3017704767998173186, ; 43: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 73
	i64 3107556380337382748, ; 44: pt/Microsoft.Maui.Controls.resources => 0x2b2042103982255c => 22
	i64 3202009568827554833, ; 45: th/Microsoft.Maui.Controls.resources => 0x2c6fd2bce55e3c11 => 27
	i64 3289520064315143713, ; 46: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 59
	i64 3311221304742556517, ; 47: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 93
	i64 3344514922410554693, ; 48: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 75
	i64 3429672777697402584, ; 49: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 46
	i64 3494946837667399002, ; 50: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 35
	i64 3522470458906976663, ; 51: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 70
	i64 3551103847008531295, ; 52: System.Private.CoreLib.dll => 0x31480e226177735f => 107
	i64 3571415421602489686, ; 53: System.Runtime.dll => 0x319037675df7e556 => 99
	i64 3638003163729360188, ; 54: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 36
	i64 3647754201059316852, ; 55: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 105
	i64 3655542548057982301, ; 56: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 35
	i64 3727469159507183293, ; 57: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 68
	i64 3869221888984012293, ; 58: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 39
	i64 3890352374528606784, ; 59: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 44
	i64 3933965368022646939, ; 60: System.Net.Requests => 0x369840a8bfadc09b => 92
	i64 3966267475168208030, ; 61: System.Memory => 0x370b03412596249e => 89
	i64 4073500526318903918, ; 62: System.Private.Xml.dll => 0x3887fb25779ae26e => 96
	i64 4154383907710350974, ; 63: System.ComponentModel => 0x39a7562737acb67e => 82
	i64 4187479170553454871, ; 64: System.Linq.Expressions => 0x3a1cea1e912fa117 => 87
	i64 4205801962323029395, ; 65: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 81
	i64 4356591372459378815, ; 66: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4679594760078841447, ; 67: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4794310189461587505, ; 68: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 48
	i64 4795410492532947900, ; 69: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 70
	i64 4835744211636393215, ; 70: fi/Microsoft.Maui.Controls.resources => 0x431c03bd573d14ff => 7
	i64 4853321196694829351, ; 71: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 98
	i64 5290786973231294105, ; 72: System.Runtime.Loader => 0x496ca6b869b72699 => 98
	i64 5570799893513421663, ; 73: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 85
	i64 5573260873512690141, ; 74: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 100
	i64 5692067934154308417, ; 75: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 72
	i64 5939174725034091446, ; 76: pt-BR/Microsoft.Maui.Controls.resources => 0x526c2ff200a2a3b6 => 21
	i64 6068057819846744445, ; 77: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6222399776351216807, ; 78: System.Text.Json.dll => 0x565a67a0ffe264a7 => 101
	i64 6357457916754632952, ; 79: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 80: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 60
	i64 6548213210057960872, ; 81: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 56
	i64 6560151584539558821, ; 82: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 41
	i64 6734140735192831707, ; 83: uk/Microsoft.Maui.Controls.resources => 0x5d747951d4a816db => 29
	i64 6777482997383978746, ; 84: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6894844156784520562, ; 85: System.Numerics.Vectors => 0x5faf683aead1ad72 => 93
	i64 7220009545223068405, ; 86: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 87: System.Linq => 0x64e71ccf51a90a5a => 88
	i64 7377312882064240630, ; 88: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 81
	i64 7439799228237803094, ; 89: it/Microsoft.Maui.Controls.resources => 0x673f79faf756ee56 => 14
	i64 7489048572193775167, ; 90: System.ObjectModel => 0x67ee71ff6b419e3f => 94
	i64 7642002156153824904, ; 91: ro/Microsoft.Maui.Controls.resources => 0x6a0dd878d2516688 => 23
	i64 7654504624184590948, ; 92: System.Net.Http => 0x6a3a4366801b8264 => 90
	i64 7708790323521193081, ; 93: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 94: System.Private.CoreLib => 0x6b0ff375198b9c17 => 107
	i64 7735352534559001595, ; 95: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 74
	i64 7836164640616011524, ; 96: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 50
	i64 8064050204834738623, ; 97: System.Collections.dll => 0x6fe942efa61731bf => 79
	i64 8083354569033831015, ; 98: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 59
	i64 8087206902342787202, ; 99: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 84
	i64 8167236081217502503, ; 100: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 108
	i64 8185542183669246576, ; 101: System.Collections => 0x7198e33f4794aa70 => 79
	i64 8246048515196606205, ; 102: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 47
	i64 8368701292315763008, ; 103: System.Security.Cryptography => 0x7423997c6fd56140 => 100
	i64 8400357532724379117, ; 104: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 67
	i64 8515752553183989521, ; 105: el/Microsoft.Maui.Controls.resources => 0x762e07d427a84f11 => 5
	i64 8557640666902467377, ; 106: tr/Microsoft.Maui.Controls.resources => 0x76c2d8d8a2289331 => 28
	i64 8563666267364444763, ; 107: System.Private.Uri => 0x76d841191140ca5b => 95
	i64 8573305974629105867, ; 108: sk/Microsoft.Maui.Controls.resources => 0x76fa805c508080cb => 25
	i64 8614108721271900878, ; 109: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 110: Java.Interop => 0x77b654e585b55834 => 108
	i64 8639588376636138208, ; 111: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 66
	i64 8725526185868997716, ; 112: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 84
	i64 8906941675023136603, ; 113: he/Microsoft.Maui.Controls.resources => 0x7b9bd0432ee0775b => 9
	i64 9312692141327339315, ; 114: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 72
	i64 9324707631942237306, ; 115: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 49
	i64 9659729154652888475, ; 116: System.Text.RegularExpressions => 0x860e407c9991dd9b => 102
	i64 9678050649315576968, ; 117: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 53
	i64 9702891218465930390, ; 118: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 78
	i64 9808709177481450983, ; 119: Mono.Android.dll => 0x881f890734e555e7 => 110
	i64 9884103019517044980, ; 120: hi/Microsoft.Maui.Controls.resources => 0x892b6353f9ade8f4 => 10
	i64 9956195530459977388, ; 121: Microsoft.Maui => 0x8a2b8315b36616ac => 45
	i64 9991543690424095600, ; 122: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 123: System.Net.Http.dll => 0x8b50e941206af13b => 90
	i64 10051358222726253779, ; 124: System.Private.Xml => 0x8b7d990c97ccccd3 => 96
	i64 10092835686693276772, ; 125: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 43
	i64 10226489408795347955, ; 126: sv/Microsoft.Maui.Controls.resources => 0x8debc9ef5e8a8bf3 => 26
	i64 10229024438826829339, ; 127: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 56
	i64 10293472216351041384, ; 128: LooglePlusMobile.dll => 0x8ed9c27190f4e768 => 76
	i64 10406448008575299332, ; 129: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 75
	i64 10430153318873392755, ; 130: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 54
	i64 10785150219063592792, ; 131: System.Net.Primitives => 0x95ac8cfb68830758 => 91
	i64 10984274332520666918, ; 132: zh-Hant/Microsoft.Maui.Controls.resources => 0x986ffb4ee955d726 => 33
	i64 11002576679268595294, ; 133: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 40
	i64 11009005086950030778, ; 134: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 45
	i64 11128133081269842136, ; 135: vi/Microsoft.Maui.Controls.resources => 0x9a6f1213fa5cb0d8 => 30
	i64 11150130305267896488, ; 136: zh-Hans/Microsoft.Maui.Controls.resources => 0x9abd386fcccf90a8 => 32
	i64 11162124722117608902, ; 137: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 71
	i64 11226290749488709958, ; 138: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 41
	i64 11340910727871153756, ; 139: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 55
	i64 11485890710487134646, ; 140: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 97
	i64 11529969570048099689, ; 141: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 71
	i64 11530571088791430846, ; 142: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 39
	i64 11705530742807338875, ; 143: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11888774080858266727, ; 144: hu/Microsoft.Maui.Controls.resources => 0xa4fd6909806d9c67 => 12
	i64 12124060477258521817, ; 145: id/Microsoft.Maui.Controls.resources => 0xa84150c49e58dcd9 => 13
	i64 12145679461940342714, ; 146: System.Text.Json => 0xa88e1f1ebcb62fba => 101
	i64 12451044538927396471, ; 147: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 58
	i64 12466513435562512481, ; 148: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 63
	i64 12475113361194491050, ; 149: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12533156002265635263, ; 150: ru/Microsoft.Maui.Controls.resources => 0xadeeb6fb059919bf => 24
	i64 12538491095302438457, ; 151: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 51
	i64 12550732019250633519, ; 152: System.IO.Compression => 0xae2d28465e8e1b2f => 86
	i64 12681088699309157496, ; 153: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 154: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 52
	i64 12716114458842347884, ; 155: LooglePlusMobile => 0xb078b6ba3a81b96c => 76
	i64 12823819093633476069, ; 156: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 157: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 42
	i64 13221551921002590604, ; 158: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 159: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13239674268801700939, ; 160: ca/Microsoft.Maui.Controls.resources => 0xb7bcc599c5ce144b => 1
	i64 13343850469010654401, ; 161: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 109
	i64 13465488254036897740, ; 162: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 74
	i64 13467053111158216594, ; 163: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13545416393490209236, ; 164: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 165: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 68
	i64 13717397318615465333, ; 166: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 80
	i64 13755568601956062840, ; 167: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 168: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 169: System.Console.dll => 0xc0a5f3cade5c6774 => 83
	i64 13959074834287824816, ; 170: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 58
	i64 14100563506285742564, ; 171: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 172: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 51
	i64 14125464355221830302, ; 173: System.Threading.dll => 0xc407bafdbc707a9e => 104
	i64 14461014870687870182, ; 174: System.Net.Requests.dll => 0xc8afd8683afdece6 => 92
	i64 14522721392235705434, ; 175: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14669215534098758659, ; 176: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 37
	i64 14852515768018889994, ; 177: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 55
	i64 14892012299694389861, ; 178: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14954917835170835695, ; 179: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 38
	i64 14987728460634540364, ; 180: System.IO.Compression.dll => 0xcfff1ba06622494c => 86
	i64 15076659072870671916, ; 181: System.ObjectModel.dll => 0xd13b0d8c1620662c => 94
	i64 15115185479366240210, ; 182: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 85
	i64 15133485256822086103, ; 183: System.Linq.dll => 0xd204f0a9127dd9d7 => 88
	i64 15227001540531775957, ; 184: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 36
	i64 15273147323526128252, ; 185: de/Microsoft.Maui.Controls.resources => 0xd3f51e91f4fba27c => 4
	i64 15370334346939861994, ; 186: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 54
	i64 15391712275433856905, ; 187: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 38
	i64 15443314347085689186, ; 188: nl/Microsoft.Maui.Controls.resources => 0xd651ac9394bc7162 => 19
	i64 15474781042002767710, ; 189: hr/Microsoft.Maui.Controls.resources => 0xd6c1775e69862f5e => 11
	i64 15478373401424648762, ; 190: es/Microsoft.Maui.Controls.resources => 0xd6ce3a99c4c55a3a => 6
	i64 15527772828719725935, ; 191: System.Console => 0xd77dbb1e38cd3d6f => 83
	i64 15582737692548360875, ; 192: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 62
	i64 15609085926864131306, ; 193: System.dll => 0xd89e9cf3334914ea => 106
	i64 15661133872274321916, ; 194: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 105
	i64 15664356999916475676, ; 195: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 196: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15995174293784908801, ; 197: nb/Microsoft.Maui.Controls.resources => 0xddfa46462d825401 => 18
	i64 16154507427712707110, ; 198: System => 0xe03056ea4e39aa26 => 106
	i64 16198848395322856833, ; 199: ms/Microsoft.Maui.Controls.resources => 0xe0cddeca55a01581 => 17
	i64 16321164108206115771, ; 200: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 40
	i64 16491294355724214223, ; 201: zh-HK/Microsoft.Maui.Controls.resources => 0xe4dcd8d787589fcf => 31
	i64 16649148416072044166, ; 202: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 47
	i64 16677317093839702854, ; 203: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 67
	i64 16737304880976948124, ; 204: ja/Microsoft.Maui.Controls.resources => 0xe846da1c780aeb9c => 15
	i64 16890310621557459193, ; 205: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 102
	i64 16998075588627545693, ; 206: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 65
	i64 17008137082415910100, ; 207: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 78
	i64 17031351772568316411, ; 208: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 64
	i64 17062143951396181894, ; 209: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 80
	i64 17089008752050867324, ; 210: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17438153253682247751, ; 211: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17482873938501421891, ; 212: fr/Microsoft.Maui.Controls.resources => 0xf29fa538054fcb43 => 8
	i64 17702523067201099846, ; 213: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 214: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 63
	i64 17710060891934109755, ; 215: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 61
	i64 17712670374920797664, ; 216: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 97
	i64 18025913125965088385, ; 217: System.Threading => 0xfa28e87b91334681 => 104
	i64 18099568558057551825, ; 218: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 219: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 64
	i64 18245806341561545090, ; 220: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 77
	i64 18305135509493619199 ; 221: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 66
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [222 x i32] [
	i32 42, ; 0
	i32 110, ; 1
	i32 46, ; 2
	i32 87, ; 3
	i32 52, ; 4
	i32 69, ; 5
	i32 7, ; 6
	i32 103, ; 7
	i32 82, ; 8
	i32 10, ; 9
	i32 57, ; 10
	i32 0, ; 11
	i32 73, ; 12
	i32 18, ; 13
	i32 65, ; 14
	i32 91, ; 15
	i32 43, ; 16
	i32 109, ; 17
	i32 103, ; 18
	i32 16, ; 19
	i32 50, ; 20
	i32 62, ; 21
	i32 20, ; 22
	i32 89, ; 23
	i32 95, ; 24
	i32 49, ; 25
	i32 69, ; 26
	i32 44, ; 27
	i32 28, ; 28
	i32 61, ; 29
	i32 2, ; 30
	i32 20, ; 31
	i32 16, ; 32
	i32 57, ; 33
	i32 77, ; 34
	i32 24, ; 35
	i32 60, ; 36
	i32 3, ; 37
	i32 53, ; 38
	i32 2, ; 39
	i32 99, ; 40
	i32 48, ; 41
	i32 37, ; 42
	i32 73, ; 43
	i32 22, ; 44
	i32 27, ; 45
	i32 59, ; 46
	i32 93, ; 47
	i32 75, ; 48
	i32 46, ; 49
	i32 35, ; 50
	i32 70, ; 51
	i32 107, ; 52
	i32 99, ; 53
	i32 36, ; 54
	i32 105, ; 55
	i32 35, ; 56
	i32 68, ; 57
	i32 39, ; 58
	i32 44, ; 59
	i32 92, ; 60
	i32 89, ; 61
	i32 96, ; 62
	i32 82, ; 63
	i32 87, ; 64
	i32 81, ; 65
	i32 30, ; 66
	i32 0, ; 67
	i32 48, ; 68
	i32 70, ; 69
	i32 7, ; 70
	i32 98, ; 71
	i32 98, ; 72
	i32 85, ; 73
	i32 100, ; 74
	i32 72, ; 75
	i32 21, ; 76
	i32 23, ; 77
	i32 101, ; 78
	i32 34, ; 79
	i32 60, ; 80
	i32 56, ; 81
	i32 41, ; 82
	i32 29, ; 83
	i32 22, ; 84
	i32 93, ; 85
	i32 26, ; 86
	i32 88, ; 87
	i32 81, ; 88
	i32 14, ; 89
	i32 94, ; 90
	i32 23, ; 91
	i32 90, ; 92
	i32 17, ; 93
	i32 107, ; 94
	i32 74, ; 95
	i32 50, ; 96
	i32 79, ; 97
	i32 59, ; 98
	i32 84, ; 99
	i32 108, ; 100
	i32 79, ; 101
	i32 47, ; 102
	i32 100, ; 103
	i32 67, ; 104
	i32 5, ; 105
	i32 28, ; 106
	i32 95, ; 107
	i32 25, ; 108
	i32 21, ; 109
	i32 108, ; 110
	i32 66, ; 111
	i32 84, ; 112
	i32 9, ; 113
	i32 72, ; 114
	i32 49, ; 115
	i32 102, ; 116
	i32 53, ; 117
	i32 78, ; 118
	i32 110, ; 119
	i32 10, ; 120
	i32 45, ; 121
	i32 6, ; 122
	i32 90, ; 123
	i32 96, ; 124
	i32 43, ; 125
	i32 26, ; 126
	i32 56, ; 127
	i32 76, ; 128
	i32 75, ; 129
	i32 54, ; 130
	i32 91, ; 131
	i32 33, ; 132
	i32 40, ; 133
	i32 45, ; 134
	i32 30, ; 135
	i32 32, ; 136
	i32 71, ; 137
	i32 41, ; 138
	i32 55, ; 139
	i32 97, ; 140
	i32 71, ; 141
	i32 39, ; 142
	i32 9, ; 143
	i32 12, ; 144
	i32 13, ; 145
	i32 101, ; 146
	i32 58, ; 147
	i32 63, ; 148
	i32 34, ; 149
	i32 24, ; 150
	i32 51, ; 151
	i32 86, ; 152
	i32 14, ; 153
	i32 52, ; 154
	i32 76, ; 155
	i32 27, ; 156
	i32 42, ; 157
	i32 1, ; 158
	i32 15, ; 159
	i32 1, ; 160
	i32 109, ; 161
	i32 74, ; 162
	i32 29, ; 163
	i32 13, ; 164
	i32 68, ; 165
	i32 80, ; 166
	i32 8, ; 167
	i32 11, ; 168
	i32 83, ; 169
	i32 58, ; 170
	i32 3, ; 171
	i32 51, ; 172
	i32 104, ; 173
	i32 92, ; 174
	i32 5, ; 175
	i32 37, ; 176
	i32 55, ; 177
	i32 33, ; 178
	i32 38, ; 179
	i32 86, ; 180
	i32 94, ; 181
	i32 85, ; 182
	i32 88, ; 183
	i32 36, ; 184
	i32 4, ; 185
	i32 54, ; 186
	i32 38, ; 187
	i32 19, ; 188
	i32 11, ; 189
	i32 6, ; 190
	i32 83, ; 191
	i32 62, ; 192
	i32 106, ; 193
	i32 105, ; 194
	i32 4, ; 195
	i32 12, ; 196
	i32 18, ; 197
	i32 106, ; 198
	i32 17, ; 199
	i32 40, ; 200
	i32 31, ; 201
	i32 47, ; 202
	i32 67, ; 203
	i32 15, ; 204
	i32 102, ; 205
	i32 65, ; 206
	i32 78, ; 207
	i32 64, ; 208
	i32 80, ; 209
	i32 32, ; 210
	i32 25, ; 211
	i32 8, ; 212
	i32 31, ; 213
	i32 63, ; 214
	i32 61, ; 215
	i32 97, ; 216
	i32 104, ; 217
	i32 19, ; 218
	i32 64, ; 219
	i32 77, ; 220
	i32 66 ; 221
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 45bb7f365f1587a7786d5bbbf0daec075d5aabea"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
