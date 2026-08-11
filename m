Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137404B0486;
	Tue, 11 Aug 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482648; cv=fail; b=aWl1NFIja/gX96aMJH9uyH50P+Mu1wEPrnLbjAFAdFXwZEBXdUqXhiYjIGpsovHbKQwV0t/AsRn0fnvWDOpvGoRCOlqJ1uyfv1llAn+duV0JpoznEQ8TiY3FuQmvv7Jk/hVNcCD/tfCNfqYjjhWAC8/qPazFl6AD88kqZYumipc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482648; c=relaxed/simple;
	bh=a/DuroqVwO0jRXdofh+WmwTb5ruSCy9Qv1VZCyLXqb0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XeOhHqfqHpYxe9sldKKhCSqEAElnyYl4wnErr9016CcUa8gUvjIKiecEePMeAOmy5VUqYAzQ0thZnPq8Y3r3T/SxuO4+a7XcD2CLmyVO8MAIewrvKNOdhOWlLMtuabBRS0bdhJpRfJSiAfcxP0GEkRWQ4yWRuIxkmwVrYAuT3ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rTBasjPN; arc=fail smtp.client-ip=40.107.200.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rTBasjPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIl1m1U2qidS1u6j57AWp/KqKr/wXANTPE5ggDRcOXg3exYoNt8QqUuThRPD2HYA2nznZFsYNbgaChqbhON+u8RW6N3ozpz8Htz0eQm2xO/3xxQK/EnLLOLFqe8lXTfLD1PdxOHTUcyt3EFjMpvoZlMzbpmAfgoSZX2Tjz9uqtibLStaNKiJRKm17cznuBrMVmIXkzLnVfGWlNgPUwf6Oy3LnSYvwz/ocK42DUUPuUupyH1sT90KW/SvWQAzMJYmf/VMkur0tAUO71n4RHWtVsQLvHWivvB6ZUOVjCfmzZWZyZTpVlCAFU3qTUM/nDgKHq1v87AlLBOi2CpBazndcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cELHEx9wVYuAqQCCYejCw6y0FvBObrPYnz7iPuxC00U=;
 b=lN/VfgAXdNeAGJrQAJ80N5jNDk/NdpQpq529ISsx6+b0e/CzB30xlpjv1l8deOvQ2AeCMpA+wKAww8kovLl1Z/1fsv2ne7Qg9wrgJWir4rdRj/oKArUZpdY1CJH5VrNRHqJ6P7i/TCEKm1N9qgVig1eOtQ4ck0wh7Oc2ulEXUGc4KqPfUVJABY6FP2C5ScZKSwmeE3iEX/R2IkIT1i0dqM8uvMBCWuLt8vC4JFgMXXrODGTihNSrM0Xj/3XuZHHFROEZ8dFohK0+KpEdJqo1ONoe7NexUI/35AJ/0zkcDXmeJt9dzSz8mU+37HDbjT5HPOX87o0GKWcxDTyH5PQfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cELHEx9wVYuAqQCCYejCw6y0FvBObrPYnz7iPuxC00U=;
 b=rTBasjPNOR4mxBKgQOxVtwR9hvK13bVkMAbmp+tSXyfMNI7viFU8FXtDZg8AZ87PUNPm6+UbSXDLQYEyBXTuQewjZTgNxeh8Z2hG8CwdCGQIt0KEo7qwL3nEwOR2to/zPaxKUsUl8mrL0gddjAdWCiox6ABDjEIC6aPMDBKbgRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 21:10:37 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 21:10:37 +0000
Message-ID: <ba27f90f-6cca-418d-82fb-fd63fb015b9e@amd.com>
Date: Tue, 11 Aug 2026 16:10:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 03/15] x86/resctrl: Add data structures and
 definitions for PLZA configuration
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com, fenghuay@nvidia.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, peterz@infradead.org, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 kuba@kernel.org, ebiggers@kernel.org, lirongqing@baidu.com,
 seanjc@google.com, nikunj@amd.com, xin@zytor.com,
 pawan.kumar.gupta@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
 kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
 elena.reshetova@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, eranian@google.com,
 peternewman@google.com, qinyuntan@linux.alibaba.com
References: <cover.1783461016.git.babu.moger@amd.com>
 <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
 <a3bcdddf-70bd-43b2-8483-7f018bd3c4b0@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <a3bcdddf-70bd-43b2-8483-7f018bd3c4b0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:610:e5::34) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: c71657a6-c3f9-4d6d-4597-08def7ecfd92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|4143699003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	u8y0wTAKmaPgsCsBJ1J29nCwzIN2tvTrDjGc1+lHZhPVab44CI5OC4hTgtsfp+oaSG1io4bqV3a7SiqTAMzFdQM7ox6xlJxT8aT5KEyLvdNaePqgeFLFqfDDup4EIL8eiSzyHKNyaOjDidc10kDWQsdoyjOn8f2jbvWBXTfvkRierGe4vbX+x+vOPNENQh99c1XkZ581E64la3QTlz8nr4SuxKMmmgVxiQe7pref7KUTKwzc2XPvHtUvMqDtcMtcL3/Be1W/RrzoeJwso+OmfumiYn0kanSfM4H2zE04wY4WsyC1MP8/2JGVczgwdDs0NgpywBsrCZB6nRw2RgKe83VtK18cqM2r+OKH9COxLcq2DDNX2P/BKkjtEcrWBmQ70jeHcSRfypuHj5i5ZHW2U8d5kyU0kiFoUJHPrYW9Yrjxuv7z4FM/bE2BawWw8E+ZcmiX2f2m48MGFHZw/83fVxu74KOosYQvvtdooOgKo7GZqtIchGd+Tiz8r3oz3AGv8nL0l5AwOBeQVoz2K5IQNcT8HtHaj60Pt0552aDjnnWUvgUtnFHcWhOznpp0Gjtf/wwca0FGgZSCrxgpV2BmaPlux7KlizOUHCXHOZhnphO5dWotY2oYvgEIYfHAJoMGyrxd80STUhqUpkorv00bpMQSI5pDpBh6QHDLsrDwP3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2NncXowd3lPMTJMc2RDaDZrWmxjaThWaFRqUEpMUitjY1pxSzNtcGVmdUtm?=
 =?utf-8?B?dlJoaW5jeWtrc3pCM29aMjBrNEUxY0syNVE2TkF6QUd6ZzRBaUdCaFpZTDFz?=
 =?utf-8?B?UFcxUnJhU21RN0YyYkIwWnN4Q2xzVFJFTnY1bE51Z3o4WG9vdmtTSU5pQ0t4?=
 =?utf-8?B?Y3NETTZ6ZnpMNFJGY1UxdjFCSFFCdFkwUGNqU1NjYUdOTFBFMEVVNjlIbE4y?=
 =?utf-8?B?TkV5NUJFb3B3R0NpVmpWdkZqdENLamw2d09TbGhnNEJVOWE3VzZmNFBrTmRO?=
 =?utf-8?B?TFA3cGV3ODRBam9zcE1UdGc4d2ErNWFMYXlRUWM3STBZTkFoSnRYdE5wSlN1?=
 =?utf-8?B?N0oydThOWVBzbS9qSlVVQ0l0TjVIRG45VlBPRzIvTUZCNThGZGc1a0NHMFNs?=
 =?utf-8?B?dlMzWUlBMVRaS3hUVUZtZ2JuYU4wbitHZDdwRStweUIxN0FtSzZnMUZTcHFi?=
 =?utf-8?B?ZnErSWRKajg5djFZZE5lUzUrM01JNGsvKzN4SHVvbUpQUUhlM3BFUHFOdlZu?=
 =?utf-8?B?N0N1M2N2V1lWdDZsOHppWW5rWVhlZjhNS0c5ckdLK3RXL0NBYi9GN3hvZlcr?=
 =?utf-8?B?K21pL2hUdklTNURGTlkzVmoyZ3pFU1RWRXUyRkt5WmkyVG1RVm96Wm00ODQy?=
 =?utf-8?B?WVgxbE5QcVkwbDRwdUxrcXVxZGp0cmpYd0daU1htRzlFeFJvZ2dmM0lTeXg4?=
 =?utf-8?B?ajFiQmhTNkJqSDhKMnFxNlUwTnl2dmMyaHdFRkJJaXd1UTdRcXF0VW05aWln?=
 =?utf-8?B?UWYvZVlobGltTmQ0ZXdLeEhTYVJuTythVWpaRmdaYlpETzlRV3VjLzY5a25Y?=
 =?utf-8?B?SzRTenlVT2c1ZkNqTG5ITFJVZldkUGFNcFFlKzNWTVAwdXc5QkdldndaeFhw?=
 =?utf-8?B?S2txQlU0WWJrYUZvWVZnaFY3dVBKU2I3SDQ3Y1VkRE1uS2VaSHphUlBkenVq?=
 =?utf-8?B?dGJjRCtwdWV5SEtjUHhpMFoyemtGaDBXNE1JZ1c5NlYxNGNVdThKSXI0V2lQ?=
 =?utf-8?B?SXhBNG44dVFmb21odUQ1TWhQTFFUd0xqZDBLZHFVR1lDSkFSRTJScDNYOXFv?=
 =?utf-8?B?V05PRUtibmF2M2JHRjErOWxPZGs3S1NGUDRJWXlON2NSVUlMN0F0U25ORm1O?=
 =?utf-8?B?K0x4WUYxREJ2MzAxSmJoeDBzOGJpdm5ydkxEaWpITXFtV0laanNVc0RabHd2?=
 =?utf-8?B?b3pZS1ZBakN1UzNSV2diakRMT3BHOFJMek02dzA0S01tSithaHEwTDFoTGFN?=
 =?utf-8?B?N2ZPakt0aGp5WndETStBWGNzSWFNMGlJeWszSmNrL292N3M4ZXI0dEdBRm40?=
 =?utf-8?B?MFNYMG5mZGdhNEFkSmlQeVFmdjBQb1pWUWYrT2R1U3pSeTJZZTRTRkRVT1F3?=
 =?utf-8?B?dTBGbS83MkxqY0ljMnloM3M1c2c4VzFVWUJUa0VFZUFDNldwdlJ0TXpScm1s?=
 =?utf-8?B?d3NQaGlUT1Y3czJFNkpyQUtUaDRiRkhiMERlQ3FQeTVNUzJSaHhpT05ISnFK?=
 =?utf-8?B?NTI0SUVYZ1VJYkxuckt1NVNFaHBNNDNoTUhGelJKaVB5eVFyQnNqdXQ0RHVF?=
 =?utf-8?B?SXh6amNlZTIyRmtWS3V3Nld2Y0o0V1ZHWkRIUVRDOFZORng0QU50NDMrOG9F?=
 =?utf-8?B?ekZuMTY0dHdva1NQQTgrTVlBZ2kyZ3Z2cGJUV2d4Y2F3UW9pWjhmbk5abFhC?=
 =?utf-8?B?bTdrVkdMcUsrZ3c5N0NIVFFiNERPSnl1VGpOUU1aUk5NWlRLdU5rd2NsSk1F?=
 =?utf-8?B?ZnorbUVrTGhZR08rWkIwUDNURXdHSUQ1TS9KaTZ2V0w4QlE0SHREeUcxL2Vz?=
 =?utf-8?B?WUI1bDA0d2YyWFFnUU9SZmhrcHI1OTlWdUU1UmVvWWVCV0NYcXZMdGxxd1p0?=
 =?utf-8?B?R0ZXeXBVelFxdk9rODJZSWF3SlFtRmxJNTBVaHhyN2lWNHpBS0VEczhqMnBH?=
 =?utf-8?B?UVNMWWlCT0NPdE9kcWpkd1RPNUUrQnh6OWZYeUFXSmVjUThvcU5PVXI2Uzl3?=
 =?utf-8?B?c20zMWt6aFd0cFVlclFKVjY4NXlGbERpd1dBSGI2VDFtZE5GQUhXKzl0RVNJ?=
 =?utf-8?B?dHpiQ0U1STFTT2VhZkYxek9oa1dOTm02TE1hcUpsOUpLUHRWbkNSS0FMUDFR?=
 =?utf-8?B?OEt3WStjSHJkQjQxNDN3VUdlQlI5UVp2TW92dERFK3QvYnVreWtJRytVQmVC?=
 =?utf-8?B?WFVGbWNXZHNlWURLMVYwNU83MUdCT2tlaitJd1ZsbWFMSFRBZEdCNDdKak96?=
 =?utf-8?B?YXNDUTdkMFdoYWUvLzRIK096SXBPYWlMRDBKNDZjeTFxM2RSRStvRjhnR25Y?=
 =?utf-8?Q?zE8pRoIMSR/Bz36RFj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71657a6-c3f9-4d6d-4597-08def7ecfd92
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 21:10:37.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/OA88OcsrM1Wo43yOghSJgN/OZ9wnqxijeL1KZHOptn5VYn473443MhuvCm1LZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881

Hi Reinette,

On 8/10/26 21:58, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Privilege Level Zero Association (PLZA) allows the kernel to use a
>> different CLOSID (and optionally RMID) than user mode on entry to kernel
>> mode. The CLOSID/RMID association is programmed per CPU via
> 
> CLOSID is also optional, no? I am not able to recall now why this is not made
> optional in this implementation though. Could you please remind me and add
> it to the changelog for next time?


Yes, CLOSID is optional as well. Since PLZA was primarily focused on 
allocation, I hadn't considered that use case initially. However, there 
may be scenarios where a user wants to monitor kernel activity without 
affecting or changing the existing allocation configuration. That would 
introduce an additional operating mode(See below).

INHERIT_CTRL_AND_MON:
Kernel work inherits the allocation and monitoring from the user space
task. On x86 this means that kernel work shares the same CLOSID and
RMID as the user space task. This matches today's resctrl behavior.

GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
Kernel work uses a globally assigned allocation while monitoring is
inherited from the user space task. On x86 this means a CLOSID is
assigned for kernel work and the RMID is inherited from the user space
task. Default scope is all online CPUs; a subset may be selected via
the resctrl group interface. A CTRL_MON group is bound to this mode.

GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
Kernel work uses globally assigned allocation and monitoring. On x86
this means both CLOSID and RMID are assigned for kernel work. Default
scope is all online CPUs; a subset may be selected via the resctrl
group interface. A CTRL_MON or MON group is bound to this mode.

GLOBAL_INHERIT_CTRL_ASSIGN_MON_PER_CPU:   <--- New mode
Kernel work inherits the allocation from user task and monitoring is 
globally assigned for kernel work. On x86 this means that kernel work 
shares the same CLOSID as user task and kernel work user globally 
assigned RMID. A MON group is bound to this mode.

I will add these changes.

> 
>> MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc), using RMID/CLOSID values and their
>> respective enable bits.
>>
>> Add the MSR definition and union msr_pqr_plza_assoc to represent the MSR
>> bitfield layout used by subsequent PLZA programming.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v4: Re-wrote the changelog and code comment.
>>
>> v3: No code changes. Patch order changed. Improved changelog.
>>
>> v2: No changes. Just rebasing on top of the latest tip branch.
>> ---
>>   arch/x86/include/asm/msr-index.h       |  1 +
>>   arch/x86/kernel/cpu/resctrl/internal.h | 37 ++++++++++++++++++++++++++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index 18c4be75e927..2503451a95fe 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1292,6 +1292,7 @@
>>   /* - AMD: */
>>   #define MSR_IA32_MBA_BW_BASE		0xc0000200
>>   #define MSR_IA32_SMBA_BW_BASE		0xc0000280
>> +#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
>>   #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
>>   #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>>   #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index e3cfa0c10e92..020ebc2c8a1f 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -222,6 +222,43 @@ union l3_qos_abmc_cfg {
>>   	unsigned long full;
>>   };
>>   
>> +/*
>> + * Privilege Level Zero Association (PLZA) is configured by writing to
>> + * MSR_IA32_PQR_PLZA_ASSOC. The MSR must be programmed on every CPU in
>> + * the QoS domain. Each domain supports only one PLZA CLOSID and/or RMID
>> + * association. All fields other than PLZA_EN must hold the same value
>> + * across the domain for consistent operation.
>> + *
>> + * When PLZA_EN is set, the CLOSID/RMID association used at CPL 0 is
>> + * taken from MSR_IA32_PQR_PLZA_ASSOC instead of MSR_IA32_PQR_ASSOC.
>> + *
>> + * @rmid		: RMID associated with PLZA.
>> + * @reserved1		: Reserved.
>> + * @rmid_en		: Enable RMID association for PLZA.
>> + * @closid		: CLOSID associated with PLZA.
>> + * @reserved2		: Reserved.
>> + * @closid_en		: Enable CLOSID association for PLZA.
>> + * @reserved3		: Reserved.
>> + * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
>> + *			  given CPU. When PLZA is disabled for a CPU, the
>> + *			  CLOSID and RMID association defined in the
>> + *			  PQR_ASSOC MSR applies, regardless of the CPU's
> 
> To support grep: "the PQR_ASSOC MSR" -> "MSR_IA32_PQR_ASSOC"

Sure.

> 
>> + *			  privilege level.
> 
> Could this also please highlight the relationship between plza_en, rmid_en,
> and closid_en? For example, if I understand correctly, when "rmid_en" is 0
> then RMID is taken from MSR_IA32_PQR_ASSOC, similarly, when "closid_en" is 0
> then CLOSID is taken from MSR_IA32_PQR_ASSOC. Thus, plza_en could be 1, but
> if both "rmid_en" and "closid_en" are 0 then, the same behavior results as
> described for plza_en == 0: "CLOSID and RMID association defined
> in MSR_IA32_PQR_ASSOC applies, regardless of the CPU's privilege level".

Sure. Will add that note as well.

Thanks
Babu
