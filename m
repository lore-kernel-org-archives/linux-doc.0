Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604F63A3803;
	Tue, 28 Apr 2026 23:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777418859; cv=fail; b=a7cWUlQ98z6mIZYW1CWaOay99El9biE78ZO+wTblGIWSrgRCD1LKL0k76ETXzf1QVYx3XhWtjOHhTVDyQUTtogHm/CF0YtRkBj4l7tmDiAnkBZvfxKOOworWh1zAiuSkW6L42ddVdTy6CTqnpBd9rXfECXvlT5Eksf/UU6iPUiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777418859; c=relaxed/simple;
	bh=N7jz+jNEHTLIs84ktl275Ecz55owl5ydjfEE4IdUKY4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=afIrF1X7Pi5iGZX+vzgNfTozZMN/x/USi9MFfuRYIZl9au0hOMgMPL7ZGPRl9JDIC/jcbzqfsM1X1FXuovQQooURXYhLWao29z9NdD9ynw/QEYgqIisOvZAiC/pBVrzv8oVAvu1FTwadWBMm8rq4bFIaKBPwTwTJ6tTfiO68GQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RsvjGY5v; arc=fail smtp.client-ip=40.107.200.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RsvjGY5v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck/nxthPGnptVD/tEkAmNI2tPi6S5rMdqNc1L/E/+BLg5oC9DNdzAPu8TFgYRd7jmKAsnh19s9zF5KdAjAUn1XuxN7Mv2otYc6nVFoG/qpupWkgC5cRryr9LS1F0Rf6cv2TxLkOsyr8cC7beoFxTHhAccU1bY7V1KZXS5r0ZeN9E15zYLcQBDDTA0TU815oqSKXEGB8WooP9nlOFSBPikkYj8GjTuGCTuxMqanFdWdCkK7Dj79o/gVsFn5nBBG2lDFSP2mGfRLVlnNxMTu8A7GZp9Mbp6vLMFa1gWbdVxtGHcOG/7fUjSxg7E/LZAJjc6li6A0n9ZLI5tJyH9mUS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sWrpQtFnvCEIasjwpKHt3ceGJkMpnTcuSV04ob7ZHg=;
 b=xPXdklxh6FRbemo+mi/fQyS/apv+HDbwWl9FmF9UuavKxcnQ51lYGanP+2M3R7df+3KbcxeInpQHHTL892LpBrvYTOiX7U89P0M0qYyB8nWb4eCD1XE+gCp4aX88CxlwEFHGKTOAHO2ArdvHmbRIz4s0OEFWovMPz62Stj9TBQGEslWPtNac434DuOlUEg5W/PZDssLQHgEYdYWgp/RVn+s76wmIZnvORfmqGBtCXi5bHEUjgqK7OOoszo8FnEhYM2OdhpGHLXCrDuyKqawKD7l6q12bqFRjw5AGdA831nWQndk3gx8/JVu6cSsWaLKUyhnJiuRWMDxM40/mxqaMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sWrpQtFnvCEIasjwpKHt3ceGJkMpnTcuSV04ob7ZHg=;
 b=RsvjGY5vAM8SuabjaYz+UlhiHxnRBhZlakQLcmsZzcPcFoSOBDWTZsmRgsvA8qsLmUKme19PJ2Wxh/iFTPRRdAcNLoj+iircJ1N7uM2QIGSHdVHZ+DiETYFxGID3w1uwisHznDgHL71+QnLSlWvv5XGfM1KrKUBg9wYKe062x9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdc) by MN0PR12MB6200.namprd12.prod.outlook.com
 (2603:10b6:208:3c3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 23:27:30 +0000
Received: from IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 ([fe80::ca9:67f1:6872:decc]) by IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 ([fe80::ca9:67f1:6872:decc%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 23:27:30 +0000
Message-ID: <6905de19-cfc1-4dfa-b455-ba3e29d94d63@amd.com>
Date: Tue, 28 Apr 2026 18:27:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD
 NPS-aligned domains
To: Peter Newman <peternewman@google.com>, Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, skhan@linuxfoundation.org, x86@kernel.org,
 Dave.Martin@arm.com, james.morse@arm.com, hpa@zytor.com,
 akpm@linux-foundation.org, rdunlap@infradead.org,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org,
 seanjc@google.com, pawan.kumar.gupta@linux.intel.com, nikunj@amd.com,
 yazen.ghannam@amd.com, peterz@infradead.org, chang.seok.bae@intel.com,
 kim.phillips@amd.com, thomas.lendacky@amd.com, naveen@kernel.org,
 elena.reshetova@intel.com, xin@zytor.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com
References: <cover.1776980182.git.babu.moger@amd.com>
 <8f77f498b1c77fa8fd8f5d5687f03ae598068544.1776980182.git.babu.moger@amd.com>
 <CALPaoCgAq4gm-aqAriFCiHGBqY3Ryqrgj9QOMyj+wFA3FVkozg@mail.gmail.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <CALPaoCgAq4gm-aqAriFCiHGBqY3Ryqrgj9QOMyj+wFA3FVkozg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::9) To IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdc)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PPF9A76BB3A6:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: fa12ae8d-a38c-459f-820a-08dea57db7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XxN5XQQAG4RwHxhAItS5G3VzM+bjh7Q5Mkm6IPWcLieYe8B1jNmslzvDJ8RRZR5NCjqGfhQaBBvGruyq1SujRop4m9dPg+qlQMu57wK4MEOTpDn3d/duvYQmnKhDRdZgg5l/2c4HrIe1ffIfFWI2SdUp5qtoD4FMLVhbZnPi28NgXtlr7LhUNOAjzH+vbGujOlxCWwq7a5LLqIkFy5WSxXVSqLJbv8/ChYBY0DxQqorNKBnm8pQVS7lvhfBZDj6XDNAef7icK6emTQZGyz1GZlfltr9ci+Nl7YPJdOB4qsgr2cDOggP2KjTzCL/4T4lmOIPSGSsFoJaBDX1u/tGAaueWmUtJkFOrB38Z2l5rPrYDg6kzqIuIxfICcjgIQkuR45mTjGHtvB8Sk3jdKZLzsOT+AgeDLvl43NxYTp2cHVi4iY7ZR+X/wnOF5nWB92pfcVFEU0gTuAzozWFqp+/wNCHg3x0WS5WWk3U9+7OBi5DA37k3Jc/VDNN/cXOGJffGwytbSCsz5a9LGDGqUrsi/aCOJdKQDjxnswXYqhoQ0pdvPml06+G8zYrc3NYuF3oosvqWirnX0WFFPSjduWMURoDcStd9TZClhZ8k0teQPpQqqbL+YSqgQJ4TitkjHkUBAxJrP7RErJ/yiOKGKl8OUlwbyzzdqB3ELqBRp4n0hks49hM/tbWKtJhQi7xlxh6Qe/7YAQFHH8DA+ANhZ79NZ8m6tsJRZ0nMjtOm9aA5luc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF9A76BB3A6.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFRtbUo0c2dBdTBuenpwQlJQc2F4TVArMzdiN3Rydjk5RE5KZFdwd29GMnky?=
 =?utf-8?B?R3EzeFZERmdIdzZTcnp5WDEwdkY2emlzeTllQ3dhaDdWeTJCWm9aT0Q0RzNr?=
 =?utf-8?B?eUJjOUs0Q1VFczBORTlFUWs2YTVFODJGc0tUbEJLRnJuclB3S2I2QTJsSWNO?=
 =?utf-8?B?SHNkMmZGWDVJZzZxSVZZTlNvTkFCSFd1L0hZamcweFE2KzZMUEEvUEp0RVBD?=
 =?utf-8?B?S2dsSFlkUU0zTXJNKzUwb2VkYnZORFh4S2x4ZVJ3YStvcWhQWThrMFd3M3dw?=
 =?utf-8?B?UkRUTXZDMDlBUisvV1lsMFRtbTZnWFhLUFVjTGozMTBZZkhzU0p1cmRYbjhl?=
 =?utf-8?B?Q2Y0RVpGQmcrcnhvbHNpZnpvV1N0UWZPQ0ZDYlh1OXgva3U5eGRBWnpaT1dZ?=
 =?utf-8?B?b3dsMm0xaUs4eGYwL3MxSHluN2I2S2d6T0FGM2RuNEZkaGJRNXdzWmdPWWtW?=
 =?utf-8?B?YW9WejhPdzZHK0hieHgwQ2JJV2F1Tnc1MkF2S2JaTSs5WVBEZGFtbHYxbHFs?=
 =?utf-8?B?QkVidEM4c0ZYUHUvTk12ZkRJWnRhTHRwK00xc2RJRFRsSm1XSVRwT0VGOTY5?=
 =?utf-8?B?SkdNbzNUSnpSK04vRWlVY1BvVWpWRzJ3dmtwQTdpRmFHRGhnd2RJQ0hSZjhh?=
 =?utf-8?B?SGc0L1ZhSVl4Sk1tNUFRTStrdExQemZGSlRvRHNkUVlYYkNOa1BpZ0VFcGFh?=
 =?utf-8?B?eEtmVmI5ZEEwR3V1V1gxbjdIZnpwZTdKWHRNSGhVMFFHbTRWcXlXR2QwZGpC?=
 =?utf-8?B?SGcra2JkTmIvV1JTb1RCZlFCYXRuUWFXZjZ3TkZrMExFT1JNbllnRmVoNzQv?=
 =?utf-8?B?bm80bzg4b1pqeXVSLzQ3SEdSVktlSUNjZ29XeGZwRmtDalNIUk92MGxXcEVM?=
 =?utf-8?B?UW9rbWhMbXI0ZWRtY0pVVFllYitwNkZMNHNLUnBSbzFuSnRXWlk4Q0JJSHFt?=
 =?utf-8?B?Mm5nRjNQbEY3aldvSjMvektnN2tEYlJrcndFMFJjYTdEeXRyU01RNmdvNksy?=
 =?utf-8?B?Vy90NkwvaXJ2dzRXRFIwcCtZd2duUzhjbUdKbUxtUm5ZMmMwcWp0UXhVQ2FD?=
 =?utf-8?B?cTVyR296TWdram9ZUmZkK1J3azlHSjJNMi9mQlphSHJqTGQ4OWx2VzhoWmNR?=
 =?utf-8?B?RGpOTGZtQXRBNys1a250SDhKaGdsT3pTSDVJUW1ZaThFcUZvQWhMdzE3SVZX?=
 =?utf-8?B?VlRvNmh6Qk13N3lTOFd1cnJ3QlJMVzh1NCtwaFZXSTc4bExLL0kxaEphUVZi?=
 =?utf-8?B?YnB0S2Jybm80VlZPb25JdDdVS0QwYzhzMFUyNU1yQTlnREp4am10TFgyWmFD?=
 =?utf-8?B?RzBLSWdtbHJLbDFTZnV3VC84QVRVTmt4U0dTbFg2NDFERFhkY2Zzb0NKWngv?=
 =?utf-8?B?RHpTc25PVzM4ZUlFOEFQNjVTTlFaQlcwV2wvZERKNGMvdUNHU1B3RTdEQ24x?=
 =?utf-8?B?bU1qYXpCc0J1VkI4TWgva1l0MWwvZWJZS2ppQnNjaURMNXZnVHQzWFc4ZWN2?=
 =?utf-8?B?b1Y0SmNrb3FBQ0w5eHRTNjZtY25HY0laL0tjRVpZbkNzZE5PaFA2ZFRCRTBF?=
 =?utf-8?B?TnpHc0tNVnhnZ09hT1dWSmNIc0p4anNUTGdvL0hRM3BTL0plTXRHeWZqQ2FS?=
 =?utf-8?B?bFZhZWQrbml3R2laczVrcE9WbGVBY3NWNmZxUTJid3hnK04rQnNNLzBVeWkx?=
 =?utf-8?B?T2hRWFZBazhUa3FwUVpJc0dTUVVzSDcwVCtMVFBaSkM5T2F1N0M3UDdDbHJC?=
 =?utf-8?B?UEQxaXN0M0k0ZEFTUFp4M2JNTSs4M0x0TllxTXFOdDg5TjgrSWVtblloUk9s?=
 =?utf-8?B?dG9ZMGNva0YwU1VadkR4bHZHUWZONFRhVys0b0IvMEhsWHpCOThhY3NtT0pp?=
 =?utf-8?B?dDRzcDVwUWhWSTFiaE1raFdoamhFRytCb1BtVU41WXViU1VGa3pwTGt3VTZh?=
 =?utf-8?B?VmZTeXk4dzV6MEdDMFJNaGxHS2JHVndBTjdlT3NtdHlLb3IxQS9RY1lmTlRa?=
 =?utf-8?B?eXVCeEpEYkM2bjNsdW0vOXlzekc4N3JJUmRjalhVZzJmdWFKQlBQdGh5dTZJ?=
 =?utf-8?B?V2pjM2VpYVQ0OHkvTWxVMXdhR1cxZ1IwNktHMkFCYk1zY05OWktFQWJRUmpt?=
 =?utf-8?B?bTNGZnJHaXRnbjQrc1E5ei9tbWZmdkVHSzhBRmhWb3FSSThURmE5Z1R3aDJi?=
 =?utf-8?B?TGNzemViWjdHNFA2UkhneGZJN2UydCtnV1NWY1ZSVWRWV1pYK0lSQk1rdy9s?=
 =?utf-8?B?czhzeHM4QXkyalhtRlFPdjgxNXdneDF5RzVxLzk2alBMUW93RjJCUXF1MmJJ?=
 =?utf-8?Q?Cj1ub7bZVnM6b+5IaZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa12ae8d-a38c-459f-820a-08dea57db7ab
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF9A76BB3A6.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 23:27:30.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcDyLG4b9iiIpBoxMAKO2mShS0WvFRwGHh8YHfW7NfLrWM+CVmsaWXrj3221qXQg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200

Hi Peter,

On 4/28/2026 5:16 AM, Peter Newman wrote:
> Hi Babu,
> 
> On Fri, Apr 24, 2026 at 3:42 AM Babu Moger <babu.moger@amd.com> wrote:
>>
>> Global Memory Bandwidth Allocation (GMBA) control domains on AMD follow the
>> Nodes Per Socket (NPS) configuration. With NPS 4 there is a single domain
>> per package; otherwise the domain aligns with the NUMA node.

My mistake. It should be system wide. Confirmed with team also. Line 
from spec. Will fix it.

When configured, each NUMA node functions as an individual GLBE domain, 
except when the system is configured in NPS=4 mode in which case only a 
single GLBE domain exists which contains all QOS Domains in the system.


>>
>> By default, all QOS Domains in the system are included in a single GLBE
>> Control Domain. However, BIOS options may establish several GLBE Control
>> Domains within the system using NPS configuration. When configured, each
>> NUMA node functions as an individual GLBE domain, except when the system is
>> configured in NPS=4 mode in which case only a single GLBE domain exists
>> which contains all QOS Domains in the system.
> 
> The previous paragraph said NPS 4 is a single domain per package, not
> system-wide.
> 
>>
>> Add RESCTRL_NPS_NODE to enum resctrl_scope and implement
>> get_domain_id_nps().
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v2: Add RESCTRL_NPS_NODE scope to add support for NPS-aligned resource.
>> ---
>>   arch/x86/kernel/cpu/resctrl/core.c | 20 ++++++++++++++++++++
>>   include/linux/resctrl.h            |  1 +
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 269265d98ad7..0f58f5e3b853 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -451,6 +451,24 @@ static int l3_mon_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_l3_mon_domain *hw
>>          return -ENOMEM;
>>   }
>>
>> +/**
>> + * get_domain_id_nps() - Domain id for %RESCTRL_NPS_NODE (AMD NPS / GMBA)
>> + * @cpu:       CPU to query.
>> + *
>> + * Global memory bandwidth allocation (GMBA) control domains on AMD follow
>> + * the socket NPS layout. With NPS 4 there is a single control domain per
>> + * package, so every CPU maps to domain id 0. For other NPS settings the
>> + * domain matches the CPU's NUMA node.

Need to fix this text also.

>> + *
>> + * Return: 0 when NPS is 4, otherwise the NUMA node id for @cpu.
>> + */
>> +static int get_domain_id_nps(int cpu)
>> +{
>> +       if (topology_num_nodes_per_package() == 4)
>> +               return 0;
> 
> ID is 0 regardless of the number of packages, unlike the
> RESCTRL_PACKAGE case below?

Code is correct. Will fix the comments and commit message.

Thanks
Babu

