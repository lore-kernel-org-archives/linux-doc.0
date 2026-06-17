Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6927391825;
	Wed, 17 Jun 2026 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781738133; cv=fail; b=d+5aTQSxuqf/JdxK6fcLByocISWQoFMKNcODLnSkZrgiGKGseZlja6iENcerHiVv+NRKmMxdxwFpkwvVMeR7AfSBJ3+z4ym0ST2D9JVhrdkTyju79Tutejj0KWWAe1NXm1Urm+RF6+BHnq1yUSnGpaxLKDqRdZR/dpi5KesiDKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781738133; c=relaxed/simple;
	bh=yEUnbYjH1BIxSRscSXVC1XmEQGImuDC8i+WoN6E/GKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rw/kYJQwzI/BA9jeFCLYqgSXgq9uLpHl63m8BEK8lpMIBWRxY7+3K8e87/UmG5byHCpHCxi2d4Rj51MbsIKYk+/8XxexCRWdssJRyzn2iDr3Z4B1lHYI3WXj8tgtpxaWWrGhAEkBADor1JA2ft7NTuBYsFygI//Ckyl7FhdKXXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fgDYUcud; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fgDYUcud"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOUfJ91rH4uBuDyvxSwoV3pSSUhUiXZ89j2MbpbJiVhDSD6SlRG7pPTvCRgLObh3b4npfNSmfbW+iSzcxjysi4kdVE41Lohni2sXY5ax8z/KYXEjPZa0H7wxyhxAqvT2F6yu9heWoXEKe8+mQpSE4vm/dagXz1PXvUllG5+6j+py3VO9COyo1ClyUMFxxAsgnZRVBoi2xVqh6Vt68MkMn9f3dppQM+l11gDpPCUbUyUxE4d8IY53xvfv/Q54SFxj6oWDhz951IuNLWjNU3ZVUHyIqtMEfEu3Dxrx2FHyNZJ7VowJ68R+Xg1SEdgN5ja/LfqmfEQ0rhs/5LM/m9gDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV3MElKRmrkYaUPLypFcNhdg1bXTMMU3xH+xoFyEEe0=;
 b=BM/A9ULC9Oy3HsBL0HIweAxGfdjJoP4E+F7dgL3tmRJgpYctPUWu6oaDUkPDvREwbMJI+UUb7MByY2ypc4NgBxeRi4OVZ0UI6wglquKkiuqldYftajbyLEXgTAgJd9M9R+KV5ahDycdoKqlz5Q/UM5T2A5veO5xa+xBj4B+o4LOALyyh3fqLbGG3zncT7o1MFoC3U/rHMT/H2TrcHRulM51O3zTMbYEgLEKJGkWI2/K8B8hheYo6HJ8RckW2jDjFSKxPOiOjZAYHbcsvFAjcE7hucBEwTfFGX3ft+D/4NqM6iGiLzWTi0mvST9Ak674h0UukRm51Aqq7ZPfAoIt5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV3MElKRmrkYaUPLypFcNhdg1bXTMMU3xH+xoFyEEe0=;
 b=fgDYUcudUQ2SpwUuVl7vu8FmHUoX7xEl7d5xyzwnQGKwxCOJoNGbfZgsmpgTXyQasySa+N2ZrRuyjcxOdX08V4LmMILv6Ngn9ZRcDQcdnHMWrw6RMQKfSIwMsK3zEL39h/10CCsBFBE3h/2AbBMSBgs6aCLj6oxObwIWrBE4CZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 23:15:26 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 23:15:26 +0000
Message-ID: <e2f118b8-289c-481f-bf57-33a698598034@amd.com>
Date: Wed, 17 Jun 2026 18:15:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch
 hooks
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
 pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 lirongqing@baidu.com, paulmck@kernel.org, bhelgaas@google.com,
 seanjc@google.com, alexandre.chartre@oracle.com, yazen.ghannam@amd.com,
 peterz@infradead.org, chang.seok.bae@intel.com, kim.phillips@amd.com,
 xin@zytor.com, naveen@kernel.org, thomas.lendacky@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
 <6273f424-9701-4731-9568-10b3eef8b5fd@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <6273f424-9701-4731-9568-10b3eef8b5fd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:8:56::22) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 096227d1-b883-48db-c3ce-08deccc65053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|3023799007|11063799006|5023799004|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	3pv/VpUr35lTblsGpE1lWI0nEJeNf9LnJWVH5D6rivm+3kmGK+yiyl6yr02vh49MmquVc/Sq1z/h4+D6kjmICiL/2D/f6d0MjJd2J9kYGPTA3/KfJYvHGIrxWqFxRONSuses9UD2PQkOsrQ4UOW+0/zTUQWH1e3/flAcH8Rlwh/Hqi4F7P9XWZtTD2qg6TwDuTtdbB+NfRD2rzxSFPqGMEQY7gAwTmfBL29tBLjBehVpyZAIQCGBILJwhjWmuw8HCIzNyDtDmHqSKSx3ssTgE2BN0XnzwxNXQGcg6FfXei/ZG6/Zg+waD8Kjv7vbmrs3MfR04Wy100uecgUgiW/HOB8W3frzXwosflE/HN7sosltzOcOLaKamYYN1ER4zwmT80LAza/5WZB5oyEWA4wKeSGyADYvm+hcmJF5KNWgj+vR/2CBcc0uQG/gxeDI3NqPXBHExSij1jhgo2+HNaN9eVY9LI7xgX9Ld/4UmjgB4FetO/WEjAuivqENh8LJOASyPljOmS6LeDqUNfL0FSXyr26O5oG+hEwHhK+N3ZI3zhFUuOu+liFqkMicXF//60CiPqsU+xJX6mw/YMboNXrDHz3Jho9lJNoU108kTmva7tRy12NVSw6bFAQM+Mpv+yMWxXAruR+K1Y+7Ch7JgcIMbsD54P3ASP/+m/wfV0iG/2hYIUiag+4rxAy6vuztxEpR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUc3bmhCVVp6d0M4TVNENnNQaXY3ZW12ZlV6Nm9DaWZaR0kzVkpQdGg4L0xu?=
 =?utf-8?B?d3VBdFNkYjJtTDZBK3NOeGVQNVhFZ0VmWmg0bjBhTDZMZXVPUDJIMC9VY1F0?=
 =?utf-8?B?c3pia2VDUXNZa3A3ZC9JTUc5QVl5cUZnZmYrTEZobUxZbWxrZzZKOUdmYXlI?=
 =?utf-8?B?YnplUjZQVEtKUC8yTWdXTkxyZkRCYTBpc0JaS056WS9ZSjlpOHc5bndSMHdo?=
 =?utf-8?B?VzNld2IzVFAxNXJMUyttQlJDNUw2VGhDYTlrUHlFZ1Q4d2FRL2JSRnUyd2Vo?=
 =?utf-8?B?WnVpSEZ2RmNqSWxTR0dncE5WRlBUSVFHR3lVejVSM3FvUU5ST0wyVmJ2MHdW?=
 =?utf-8?B?UHBaQ2VlbW5tR2ZuVEFEQk55bitRZ3ZLOXd6Z3pDUUJoTG53WWFqZnFwZDJt?=
 =?utf-8?B?Qmo5aFhJTDlaeVpNUWh6ejQ4YXFUSGtudGpsbm1pVlcxTlRZcWZyMUNrdWhZ?=
 =?utf-8?B?MGluc2V2SzlOL3hIZzVBb2dPYzdQa1UwaFVhM3JEMndoN1ZHa2VmYXlpajZX?=
 =?utf-8?B?L1JzSkpmOTVpTUUzb1QxVGZkaGZYNTNFSDU0Y09GZlhtbVpCcGNjL2l2Q0F4?=
 =?utf-8?B?UDRMTWxpN2FSdW9DMjc0NU9XK0kvNEswQXFveDN3UHBrRUxuR3FhcUNjRDht?=
 =?utf-8?B?RXN6R0dUb01DWndsWUREMThoY3pSdG1wUGpFdndGWHUwTFJsR0NPbWZwYTdQ?=
 =?utf-8?B?dFJsekhiR0ZMaDBEQ2Fydkk4RmpFMUJQZFlyRVZiMUtwSzdNYUlFa1IvUjlq?=
 =?utf-8?B?QS8vQ1R4ZWpTMDIxTmxIamd6c3lIcml0SWx5VElUb1Vza2pjMlpneUo1YS9r?=
 =?utf-8?B?NlV3ZVk4K0htQVZkVFVBcU1qRVJvQ3cxd1RncE1mb0tPaG5pVTVOenp2TmRi?=
 =?utf-8?B?TExkOWl6TzQwWHZCaEw1SDFNNTJiTzhiTE1obHZrUzk4U0YyaU4wcTNTRG5k?=
 =?utf-8?B?dCt4eG1MZkwxakdlVnp3QjhCWnFZYWg5cXUxbEhUdlFnQUV4K1ovVHU3bHc0?=
 =?utf-8?B?UVV3MjJQRWIwUkloY0pLbEl2Z3A1NFpPSFVtREM5eFhtZHdzQzVPS2dQejlt?=
 =?utf-8?B?RjRuSm83VTlrZVNlSnRBdkI5VnNIVFRVczdlOHV3cWhaZGNMVWYxM1ZRNGUr?=
 =?utf-8?B?TW9VdVJOb2lkOE9CYmZkaUI2bDR6V0ZoR0F0VmgwTDRvaDJYeCtwRThyYU9Z?=
 =?utf-8?B?V29mKzh3Qk9yVjMwM2J3R3BVM3krWWlHbCtIeWZHbXptQlA4S1BRV09TcDJI?=
 =?utf-8?B?MXZCbTlUdFlOZTVaWW43d0N0Z1ZqKy9SUFlMaFZDbkI4ZFJzZ201bCt3c2dE?=
 =?utf-8?B?N294eEdybFUvdEQxR05Hdk5lTTVDeEpFN3I1WFpnMm1ESWt5TVJwQkYwZURC?=
 =?utf-8?B?c1BqMVJGTnl2QlFpZjZFemYyenNQc01KM09lczNQSUhScXJiaDNKUFFOL3J0?=
 =?utf-8?B?WHN4ZmVISEg3VndqeVlZOW03TGhORnF4VEgzeVEzZnBDRi9HSncvUXJPR2RM?=
 =?utf-8?B?VVpuZjhySThsWGs5UEpRNUhlYnY1cTNURThaVU5xNENnb3FyT21jNGp2eWc2?=
 =?utf-8?B?MDY1OGEzT2Ztd1pxczd5NVI5K2tpLzAzWHovdE4xMm03Rkh0OEEwQStpMjUr?=
 =?utf-8?B?OC93RitGcGZ2SHYwTnFiUzhTanBkbkxncVl0L2FwcFFWS2Zwc21FR1ZnZDc4?=
 =?utf-8?B?SXlXSWt6Z2dNMHcrV20vYjNsdlNSaU4renBvcU16M1NoMXFKdmtOZGdsWXNz?=
 =?utf-8?B?NDJvK2ZZOGNrOHA2dTd6dG0wb1Z6RjF0OHdzeFpDVzhxd1FEbjlxVEg0cXdt?=
 =?utf-8?B?blcxVysyeVl0c0wwOFdoODdpQUNLSC9HYzY0R1d1QWFZYTlPcnhYT3F4d1Bx?=
 =?utf-8?B?MXVTS3VGNW5QMnVmSExxS1ZtT3hVQjJBemV3dy9peUlMeFdQcFBhdDA0WlRk?=
 =?utf-8?B?bk1iVEhmWndXVTc4TVBZdFl2alRPQU9HRU9ORFRsNnhFLzUxaGd2MlNaUzND?=
 =?utf-8?B?TC9RWG15VVhtbHk5Q1J0SmNTMzJ0aTQ2bEIrL211YkR0RW1UMnF3RUZEbFpV?=
 =?utf-8?B?V3RXTWZ6S1gyL0lMVG1mRWppNWt5VlgrSC8waEY4cDYrTjRzUzRqYjRQc1Fr?=
 =?utf-8?B?aGJLTFBMeEpWK0MwNDY1U3Fzc1R3d2pUWDV6emR3cC9wWVlNNXI5ZStWQmJi?=
 =?utf-8?B?eUI4R25YVjJEWThjMkpRYWJOZHp0ZzZQbGpFYWdnb3JGdDhhZkNZZExzT1do?=
 =?utf-8?B?Z3JDdnN5VkZWMkdLb3MrL2JHUTc5d0ZTR1c0NVNRd0JRdWptbUtwTm5Oenls?=
 =?utf-8?Q?zUMQnnUHPaMcX6c7iY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096227d1-b883-48db-c3ce-08deccc65053
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 23:15:25.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tCkrzlU5hvXNL54PTSuAOqTCOnsy4Vd+j1hxjOAFl+ZveHNNAZs4IaNdETijKoW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874

Hi Reinette,

On 6/16/2026 6:33 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> AMD Privilege Level Zero Association (PLZA) exposes kernel CLOSID/RMID
>> association through MSR_IA32_PQR_PLZA_ASSOC.  Generic resctrl already
>> tracks supported and effective kernel-mode policy in struct
>> resctrl_kmode_cfg, but the architecture layer needs a callable entry point
>> that can push those values into per-CPU hardware on a chosen CPU mask.
>>
>> Declare resctrl_arch_configure_kmode() in linux/resctrl.h with kernel-doc.
>> Implement it on x86: add an SMP callback that writes
>> MSR_IA32_PQR_PLZA_ASSOC on each targeted CPU, and use on_each_cpu_mask()
>> for the broadcast.
> 
> Above is clear from the patch. Please start with focus on why this patch is
> needed.
> 
>>
>> The hook is unused in this patch; later patches in the series wire it into
> 
> Similar to previous work: write changelog in imperative tone and do not
> refer to patches in series but instead let each patch stand on its own.

Will rewrite the changelog.

> 
>> generic resctrl when an effective kernel-mode policy is selected or a CPU
>> mask changes.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> 
>> ---
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 35 +++++++++++++++++++++++
>>   include/linux/resctrl.h                   | 10 +++++++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index b20e705606b8..68f1cf503904 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -131,3 +131,38 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>>   
>>   	return 0;
>>   }
>> +
>> +/*
>> + * SMP call-function callback: each CPU writes its own MSR_IA32_PQR_PLZA_ASSOC
>> + * (AMD PLZA).  Invoked via on_each_cpu_mask() with wait=1 so the on-stack
>> + * union pointed at by @arg is safe.
>> + */
>> +static void resctrl_kmode_set_one_amd(void *arg)
>> +{
>> +	union msr_pqr_plza_assoc *plza = arg;
>> +
>> +	wrmsrl(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
> 
> fyi ...
> commit 2232959db26d ("x86/msr: Switch wrmsrl() users to wrmsrq()")
> commit b5884070f9da ("x86/msr: Remove wrmsrl()")
> 

Yes. Saw that. Will change it to wrmsrq.

>> +}
>> +
>> +/**
>> + * resctrl_arch_configure_kmode() - x86/AMD: program PLZA MSR on a CPU subset
>> + * @cpu_mask:	CPUs to receive the update (see on_each_cpu_mask() for online subset).
> 
> Why is the caveat added? Will resctrl ever provide offline CPUs in the mask?

No. Offline CPUs will not be provided. I am not sure why I added that 
caveat. Probably came from AI review. Will remove.

> 
>> + * @closid:	CLOSID field written into the MSR with CLOSID_EN set.
>> + * @rmid:	RMID field written into the MSR with RMID_EN set.
>> + * @enable:	Value for the PLZA_EN split field.
> 
> Please describe the meaning of the fields instead the mechanics of the code
> that are obvious.

ok.

> 
>> + *
>> + * Context: Do not call with IRQs off or from IRQ context except as allowed for
>> + * on_each_cpu_mask(); see kernel/smp.c.
> 
> Why is this context caveat needed?

Again, Probably came from AI review. Does not look relevant. Will remove.

> 
>> + */
>> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)
> 
> Please replace "cpumask_var_t cpu_mask" with "const struct cpumask *cpu_mask".

Sure.

> 
>> +{
>> +	union msr_pqr_plza_assoc plza = { 0 };
>> +
>> +	plza.split.rmid = rmid;
>> +	plza.split.rmid_en = 1;
>> +	plza.split.closid = closid;
>> +	plza.split.closid_en = 1;
>> +	plza.split.plza_en = enable;
>> +
>> +	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
>> +}
> 
> function self has been discussed already
> 
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index ce28418df00f..570918e57e24 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -712,6 +712,16 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>>    */
>>   void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg);
>>   
>> +/**
>> + * resctrl_arch_configure_kmode() - Program MSR_IA32_PQR_PLZA_ASSOC on CPUs in @cpu_mask
>> + * @cpu_mask:	Target CPUs; on_each_cpu_mask() applies the callback on the online subset.
>> + * @closid:	CLOSID written to the MSR with CLOSID_EN set.
>> + * @rmid:	RMID written to the MSR with RMID_EN set.
>> + * @enable:	PLZA_EN field value for this update.
> 
> This is a resctrl fs API - please replace all the AMD architecture specific implementation details
> with what the parameters actually mean/represent.

Sure. Will rewrite it.

Thanks

Babu
