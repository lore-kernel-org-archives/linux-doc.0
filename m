Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4AA315785;
	Wed, 12 Aug 2026 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786573756; cv=fail; b=Sgf1UAdcp/EmxmlXU/iho7KBB6CUA8lnK4SNac3XULGMn0Wvk4g8YPE/bCGahvDGA6WOiPofgLwYWvOTqhhB5SRIxt8meSDaANH7z8WVw9iBVAIH/1nOYF3Grfw/7edN7aUJwbFevKoFR8kacx1fv9Wcqegv9aCRfFWR+nfponY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786573756; c=relaxed/simple;
	bh=bLsFJUyoIeg3J8T6Y8lodSaGe0mYU7ma0MeN68YdmnA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Yf4HH4fHw/ljEdfS9iGO17w6DD07ocRsHSMY+k42VeN3S3T9970fKlbZ+sFmQWJgobZWgDilwFFKCV5c81lg1E3UK+KogUC4BQ4VX8xLkzG3pf2JrRn2IeI4QcEA3r/axDVAe9TCfmms6ng/tKRKaSwLwPKnWv1GstwNDQMNcRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c4GWBpvz; arc=fail smtp.client-ip=52.101.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c4GWBpvz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VH7yuZ4H/Fl1kAUC5NOj9rk/0zVce98SQwJ7hSaUtJgdxh8/vSomJjui51hO1h2Q5ZcQ3AaCWKnRT//3RTKud3OvU8xzDwCV4SSlGyanjfQazynl63SZHEK4vsVkCHORRiKJ+MlTknM5Vuy03O1dG036or3ad+8NPD3EWRzWGjrUVw2Nfyg+CDfnx6NdsFcToABY/W78G+w+KKpqhEhFCxmr0aV9Rd98pRD1ezcl44xVWW3gDn6Cbccr3QMVLRlLs1DYCEwI1CVOIjeHWQ+c7D4lGGFHn2oIcVX+UyuFwy5yUIObjA4yCgramrKN0XG8uMf32fIvTDgF//Ffe3FwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcZ2+6QgJxweuFQvXffSgzG0ODI6T9SyKbyxV1nK0i0=;
 b=UNtrhMueK51hGDaFnJQjVz8ouDxZeJeu9Z3Ia9pzy6nw4kkXKRygOKnKA3nIni/LXqnrM0auMjebJd2RmVzZytgP/WDDjhdc64ZuLmfIMNqUW97sGioSXiYaVBPbTc6gGUFTBOPoVetpE4qlxQeU8Q0aiZXLOxFLLqy1OEeksS1BwR3GZteqfzPN+pQZVG8cxvYrce66NtQ4msebJ6yPFYr3Pi/go7Tt5rf5sLQUORdY9Y5k8eYFYhfdSimG9S4yM5PEXCKldsO0ecPtTeUjlEEvlmOREGvn4322kUEmpmYP5/BEFhLEVuH/ttKTsqTbmztui/4GwyxjXwUTUJLZ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcZ2+6QgJxweuFQvXffSgzG0ODI6T9SyKbyxV1nK0i0=;
 b=c4GWBpvzfnCz9lE8EK3nyqPQ03jCrZtPK9JhbfcF8uTrBCPiiSm9NO6ErwC0ZIYtW10thuSYfj3N9Dp7IQ119DePIl3/RQnwYH+fT5V2H7R4kw7SPVvMLnBcog/asN4Bn3IFqsyi6SsuDaoOM69udurejbpGHK/9jMoUoYktiK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DSWPR12MB999153.namprd12.prod.outlook.com (2603:10b6:8:36e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 22:28:56 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 22:28:56 +0000
Message-ID: <521ef280-e311-4949-b520-fc4e78b67206@amd.com>
Date: Wed, 12 Aug 2026 17:28:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 06/15] fs/resctrl: Introduce
 resctrl_set_kmode_support() to initialize supported modes
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 ben.horgan@arm.com, fenghuay@nvidia.com
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
 <f4926d9bc70261ba0245a1d1158d8bd3d09bdefb.1783461016.git.babu.moger@amd.com>
 <681e0257-80e0-44c3-b826-20e314a3eb0d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <681e0257-80e0-44c3-b826-20e314a3eb0d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0049.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::26) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DSWPR12MB999153:EE_
X-MS-Office365-Filtering-Correlation-Id: e579cc50-19db-4ba8-761c-08def8c118da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|921020|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v6JzYSw1L9iYGQkFKW4naO0SXPiNhbYeOt5UsJy0V+jBgJK+eHluK98G9ZoJNen9QAvVPZcvwdiznAksMT7OBXQWhqghkK/fw1k/WicJP3g6foid+ii1pKshVrT55rMfkwFqVypN7qrfs4XdzRuT01pQtoVixBheh53kFG2zgOk2c08EiejxBVOjkgqU0zt3fkPaP2t737H0siGep82TOcn18NtpXfhjZGxdmFy7xQWJ3xaJMEBvx1eYQHqDUgIdkGv+zwSl5aDA6xt8rA3B2x75n+f9TVwvnktaioHS+xgveb85qyqlACNvigQ0LJHFAbA9NgxkvZ/VbFzYdMwaBvtXDUFsrw7tB/1ovAJQNfd4cziJp3NZMzyN7oZ3k9zqTL3nR/XQPqhzcechQui6wNRhSHIooZZHnSkpZFgF4D93z5g6UyaDqNH1I4CfHfkjAmTuIzj0qTFwss3LWWBUkQZDMpHwpHGWc49mETv178RW1HJYpFC8uebRyKhE7MFuL3ePHFX8+udqcnI3unzmcse8mytOeBR+N9s29iGFx1yi5AtgmvUiEiV8yE7gbQgmVoRo2x1ipiHnrg+cQkAhaJirKTe0uAcyKzpcpBVxBFTuOq6LowPhW/Tp7FvYy7sWS4LVOpHogJcIqPZvGRXdr0T3lNafixtOKfob5St0zzpXjydiWo3HinFEOHGMAqW8tP7y6pPyOk36N1iwuFCDeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(921020)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTRQNURPTlg3aDJkRzA3Mi9Hc2F2YWlpeUVTOFNUdWdvcGRacDRZU1M3RkE2?=
 =?utf-8?B?NlpJbWc1K2Q0M241eDUrMGZ1Nko2cFh3bWh6MGFjdjFTanN5eFg5c1ZQeUt0?=
 =?utf-8?B?cDVxYzhCODhnSHQzY2g0OUZsWG5yWC9GcTdQNGJOanBHTEM3WFMrNi9xamVv?=
 =?utf-8?B?azhPQWZVWTRLMmI2OFpUUC9VQ1BnMS9uOGhpMG5rYzVWMnlDTG9BVlhWQmJn?=
 =?utf-8?B?TVlNQkJNLzFiV2UvY2czeVp4bFVoRjliaHkyVWlLYmZHeDg0a0VvS0E0NEtr?=
 =?utf-8?B?WnB6SlhGejR4ZE9BVHpyQUVOYjZMTUI4UGV4ZGtwYmhva3RveFMzWWVJL0do?=
 =?utf-8?B?bm9VaDlzOTVMSThsUWUxOGFzelo3SUZvaC95M3VITktyUFREZkhsaUJSMUpN?=
 =?utf-8?B?cmdITWtpWWg3SWNvWVF4NmI2bExaQmlCQ3psQUtyc3Q5OWU4M2JLMkIvVm4v?=
 =?utf-8?B?NkszZG9UT3hETWg0dmRVWTMwZVhESnkwc3dQNFFFTkp5d3JOaWs3bGxYQkxJ?=
 =?utf-8?B?OE9vdnYwZXk4YkdzaUxUQ0N2ZUpMeEI2ODlGaFhINjB1MU1KL0RXSFZLQXFM?=
 =?utf-8?B?ME1ob1NTSjVweXVKdm1EVDBPRFdHZGpUaTdDTjhKalNta1FHSUpWYlJZU2Ft?=
 =?utf-8?B?bzFTRUtQWG1VV1JUVFAraUpLQ0NqV3Z5Uy9Qc3h5SS9jQkE0bWxBRGI1WVFz?=
 =?utf-8?B?ZG9oUkRsUTVpeUFBTmtPYVdVTEhPTzJMWE00dGFPeHdSSWpyUmRyMWhmTFh3?=
 =?utf-8?B?cjRGcHI2WVVLMWFia05uL1FudFZTVE91SnFoOWhhWXNqcjFrZnRVRksrRkNB?=
 =?utf-8?B?ZHFMbEtzZEs3SWxUeWYvSjYrcFNCZ0hxQktCbTlxc2QxczNtSnNDK3JMUjJn?=
 =?utf-8?B?VllPc0tlNGJZT3FqN0luVDhyRnlJaVFJSlRZUXVmWmZXZ0dTdDV6YVg3N3dU?=
 =?utf-8?B?K0t4SzBGUjhMM1BxdjhJMW9XQ1FtRmxFU2ZzYWhOVk1BeTVCQVYwN0FqRzJV?=
 =?utf-8?B?M0oyWGJkR0ppZ1lDK3dnTXIxMjNFeUZWT3doeGY0ckFtdTBJdytBS2pNSkxl?=
 =?utf-8?B?NFJzaGhPRU0reTRQSTlQYmlXNG5tZmxWWDBVaU9pWkpqMFZpL1I4YlB4bTk2?=
 =?utf-8?B?Vm96akVlcWZtdFg0dUNqYVlJNHE0UXZNY1BmcGZra01JUTZWaE1xS09sUk9i?=
 =?utf-8?B?UUpwYVQyWjNDOTJ3MG9zRmdBU0VEQzBiWlB5UXloWkdyWnN5Q2ltU21VUGY0?=
 =?utf-8?B?UWNndHJrYlJCcW1DcTZFcExibG5mUTIxbzVXaUIveFR5NFk5c1NuVG55K0hu?=
 =?utf-8?B?cVR2UjV6WFUyblM5d2lvRTY1aEIxT2I2ODh4N2tyam9mcXg0V1RiMFdRMEMw?=
 =?utf-8?B?eTZYYkFwcHlJQXdDMWpJaXFyM3lLNkp4WlI0NVRLMm1LRmd4TEk1Ni9UQW9E?=
 =?utf-8?B?d0d4WTQ1bU53UnNrYlpJREhPNmN5V2p6b0hHSmNuTXNSZUI0bTJ3QTcrdUdh?=
 =?utf-8?B?cGovcmhWcC9JbEl2QmxGTHUvYSsvbENQYzZDNGRMVHZ2ZXczeGF0V2pvVXgv?=
 =?utf-8?B?TVlQZ1V1WDY3R2ZpNG5OaVAybmR3UVdKVGZJK29rQzJ4K0ZNejE0RlBFV1BG?=
 =?utf-8?B?eS9nd1VEZ0pPWXQrc1k2aWRDMXZBUkpESFZjVnFWYWU0VlF1d3QxNloxVFJq?=
 =?utf-8?B?amJqazRlWEpSOUtIcnROZmQ4dVdGTkZZejdKOVVQc1NhZ292QVkvNFNtT2Mw?=
 =?utf-8?B?Zkwwc0t3dGxwSFZuQlhWZmxmZzNIRVQ1MVZLeEl5dmNvYTBkaS9RbDdTU0x4?=
 =?utf-8?B?U0lRZytDVTYrWDdtZzA3Q2tGRjd4UkFSSnJLZnRyYUJGKzNtWWMrZVhjbkdO?=
 =?utf-8?B?K1RldjZ4eUxLQSt1RG0xbWtsSDNjcEZxdkNNQzlsWWdrWDBNTWdTeU1hU3pu?=
 =?utf-8?B?UnQwZC80cFVhS2E1UDdtcFZ3NWR6OTVsYm9LNnNoU2VoVnhMZUxqclNRb3Np?=
 =?utf-8?B?K1hlTUJsOEpyNVpmZHA1bWpiL296TWpsUTBFRThmRk96WVlTaHF1cGMrY0Nj?=
 =?utf-8?B?NjhIQ1dwRlVuci9zdEFBNGUrZnJGM2V6dUl2L1U1N2Y1dzJzOVR1SldxQlZK?=
 =?utf-8?B?MER3MUU2bGE1bW1BbkRTc29PQUJmZXErYXlEUWZvaDY0UjFwNHNjNWpyRHdT?=
 =?utf-8?B?aXNBT1lzR3FWY3Y1Z0hwb3VpWW5jKzBNYzBub1hJWlRrNm9uSXh6ZW9ERWJL?=
 =?utf-8?B?dk1yWkk4Mld4WFFjUE9yUC9QMzBRbHIySTZNL2h0K3lSQUhESG1qVUFOMTBa?=
 =?utf-8?Q?GAXLGRRQQeMdmEWwva?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e579cc50-19db-4ba8-761c-08def8c118da
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 22:28:56.4069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBdEMfDBSq+0NKVRxuv3H7BnyPV1LPDPeuXg7SqGP+6uCkHyu3NLNey1WN9/dBUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999153

Hi Reinette,

On 8/10/2026 10:16 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Architectures need a way to advertise which kernel-mode resctrl policies
> 
> "kernel-mode resctrl policies" -> "kernel modes"?

Sure.

> 
>> they support before generic resctrl exposes those policies through the
> 
> "policies" -> "modes"
> (this is related to the earlier "use consistent terminology comment" I
> will stop highlighting instances)

Sure.

> 
>> filesystem.
>>
>> Add the `struct resctrl_kmode_cfg` to define the default mode statically,
>> and introduce `resctrl_set_kmode_support()` so architecture code can
>> register supported kernel-mode policies during resctrl initialization. The
>> `INHERIT_CTRL_AND_MON` policy is supported by default, so architectures
>> only need to register any additional modes.
> 
> Please keep changelog high level and not describe the code that can be seen from patch.
> When doing so, please write in imperative tone.

Yes.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v4: New patch to initialize supported kernel-mode's.
>>      https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
>>      Changed the kmode_cur to enum resctrl_kernel_mode in resctrl_kmode_cfg.
>>      Moved the resctrl_kmode_cfg to filesystem code.
>> ---
>>   fs/resctrl/internal.h   | 12 ++++++++++++
>>   fs/resctrl/rdtgroup.c   | 23 +++++++++++++++++++++++
>>   include/linux/resctrl.h | 10 ++++++++++
>>   3 files changed, 45 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 48af75b9dc85..178126bb2da5 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -314,6 +314,18 @@ struct mbm_state {
>>   	u32	prev_bw;
>>   };
>>   
>> +/**
>> + * struct resctrl_kmode_cfg - Kernel-mode policy snapshot from architecture
> "policy snapshot"? what does this mean? This is not just from architecture either.

  struct resctrl_kmode_cfg - Resctrl kernel mode support and active state

> 
>> + * @kmode:	Bitmap of supported &enum resctrl_kernel_mode values. Each
>> + *		supported mode is represented by BIT(mode).
>> + * @kmode_cur:	Currently selected kernel-mode policy.
> 
> How about "Active kernel mode"?

Sure.

> 
>> + * @k_rdtgrp:	Resource group backing global-assign modes when applicable;
> 
> (stray semi-colon)

Ack.

> 
>> + */
>> +struct resctrl_kmode_cfg {
>> +	unsigned long			kmode;
> 
> How about "kmode_sup" to complement the "kmode_cur"?

Sure.

> 
> To make it obvious this is a bitmap you can use something like:
> 	DECLARE_BITMAP(kmode_sup, RESCTRL_NUM_KERNEL_MODES)

Sure. If the code remains same.

> 
> 
>> +	enum resctrl_kernel_mode	kmode_cur;
>> +	struct rdtgroup			*k_rdtgrp;
>> +};
>>   extern struct mutex rdtgroup_mutex;
>>   
>>   static inline const char *rdt_kn_name(const struct kernfs_node *kn)
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index cc9966ff6cdf..0ee0dfaf9065 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -78,6 +78,16 @@ static void mon_put_kn_priv(void);
>>   
>>   struct dentry *debugfs_resctrl;
>>   
>> +/*
>> + * Global kernel-mode resctrl policy. Architectures add supported modes before
>> + * resctrl is mounted; @kmode_cur tracks the active policy after user selection.
> 
> ah - above it is referred to as "active". I find "active" to be more descriptive than
> "selected" as highlighted above. The "after user selection" seems distracting.
> "@kmode_cur is the active kernel mode" is all that is necessary, no?

Sure.

> 
>> + */
>> +static struct resctrl_kmode_cfg resctrl_kcfg = {
>> +	.kmode = BIT(INHERIT_CTRL_AND_MON),
>> +	.kmode_cur = INHERIT_CTRL_AND_MON,
>> +	.k_rdtgrp = NULL
>> +};
> 
> This initialization needs to be reconsidered to take into account that system may not
> support allocation or monitoring.
> 

Yes. We may need to change it to dynamic initialization than static.

Thanks
Babu

