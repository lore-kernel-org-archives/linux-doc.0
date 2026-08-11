Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0A533936B;
	Tue, 11 Aug 2026 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478566; cv=fail; b=lox4ZrXuPlutALhMwIyW7mvgEJ0e55ncVzbSEsAM2OYk6XSvPP+r+h03kTRb4MIkHaHFEG2y6uFZr0io5zLxuNspC6Jc+/DSIBN+mO4lXGL15wQ4eVm+wKGHwAHuExHxncLn96i/+3wowNLQflbhwOPbhVniMFC4s25jOsoMW1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478566; c=relaxed/simple;
	bh=S6o8+fp3rn8t28aJEI6Xr8q+LfHXWb1IXIyVwNbo0Ng=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=obYxU/kMUrr0/Cyir+xQkuHo0f9Pg8QTgFsztuMp1pk9EZn5g6TEQCKwGYNBN3GEngWls8mh8duRZ/PPmi2HIvA76QjergaaqppFYgeeaBnE4kvjPGSFx9y8lzzqfv7MzTujGeGhcjg9+rpX0TZsDrylA3USFqPh0hP4xWAddtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oWy6uMXO; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oWy6uMXO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhyBhL9K/dsGExAdiCGtjDsDkDkuRuliLsJ3hdF7R7nnD5kL9NDusCSFQK4k1lfb07eqFgtt8hk+4WyYD7HeV9nO88MU9wp8TA00Fq2RKbRFRpiOu/HDSBgfJVFShVICO/5mhvz/y2/6lNAUV8JgVdYNAy8Drn/ofLfp6BV7ifNkXF6MCtGJYYte4xnCnK8ARhsNVXiVqazkPscE1D0ykYemQQQ7wTRiCwe+o7ggW1/RDOoM9otLFI/uvliFVusB3oZoXv3BaSmMK1pp1sK1uHAiVa7dYgB4sQS61s/xCf/2JCf/We90IJHDUoLUI8o8FNZ34R/cgcZnnTgHywBhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXKPo9annWDWE5tVX92PsUQqde+9nZwo80t43ZOcCZQ=;
 b=QkuL6EJZuSQD7mL+b10lI2uUv6KTSYsmwnPb44FAd2Ok0XwyRdmX5ICKjPwH6gULTHtTB4SiibC0/yZvYtQgNT7lWJQleLAnMlNCkhs1pyz2l7tZr1G2XqZgSzX7l8dpukeg/JUWhpeQlM+maBiIDn53e8Gn0BpLQYUuOM53MZYo2RHqjXLOk8KnNbgJ9UJ4t++tDQkzQqxdNvl9PTc9UyjJogjGEoB2bk7ySDAPKnvd6NfPzQwPn9wm2IdSV/q879Ri07jvazj5eN+YKECGoPsOnoASvyE4SiGrt7N2BZfs10HgRHaLKheg2r3f5inbplYyDWW7FXtxywhZt4euUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXKPo9annWDWE5tVX92PsUQqde+9nZwo80t43ZOcCZQ=;
 b=oWy6uMXOR4VB0mop8uCXX50HrOLMtpyuIqJ3OXezNq9dmpmgjtGAZYsjNzBx/b1B4jDfsMmgl9iszHjFcvWIAs3/LLLu/jrBvXZ6AD/IMmpCM+fluzGOnlbomDf4bX+nkoDMa7E4P0lwlKIRCm5gss1jRe4zLvTcx3MihWlnZwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 20:02:40 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 20:02:40 +0000
Message-ID: <b0dc3986-63bd-4e81-ba5e-5c98a259fc26@amd.com>
Date: Tue, 11 Aug 2026 15:02:36 -0500
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level Zero
 Association (PLZA)
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
 <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>
 <3e655139-8d8d-48d2-be47-0e3200122773@intel.com>
Content-Language: en-US
In-Reply-To: <3e655139-8d8d-48d2-be47-0e3200122773@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::34) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW4PR12MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 7793783c-bfa5-440f-d8a4-08def7e37f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MSdafk7JVUFdKvTG4lngXMXog0dI9Akl/gFRbM2Po/uD5/mLfeQ+SpV1FKdgMoRUYNgBEfjpGgEwmyRDBg6h45VmTNjdF6FmhwBvoWqP6AQyri4KBbKMWipGtnE/759WzDrEOhA4SlcCMsBC4Y2gY8ExYffzyHB69ftYIRE4fr/YK+pI259dCqdeOIxHKRM0fQFS+YzoVmqePxLirvs03/WXQP6JyARQ4pzxC68hlgaB/AciwhZ1ZogdTKWhJcPimZuH2S7yMd8JYKEm5H5J2p2pxi3+AVeqw3un0pD2WNZ52IxAGU5RC62Fsa1QcwHMJ3DnYs9nXN/mSuZeO5fI3dzjmg9nTOhmNfkJOqEr4QrW9IGzizPtraDN11YdB8vMQTg/gtxMLTnNT9Z4wYZJNKNb5WpuyhDMaCf0xnVXZDVe/byllOGoNqNa/kUdNnt2CP3Jjn4dOA5VfW6M1nljqjwAwkSQpO21AIoV0AN3Mq7+DxO7nsLQC17E8X73HklvhhEADspHMB+G/ggopnW7u8n64R4ebUsRKoAB39PpyEQeqi1uw4u70UEvMOWSKMLZuG0OP7QPHqLcsJzQwHOjcdCTm88HqfLd012LCvmIJX/MM39s3rxWB/BEQqf313ib085udJmrIfrlwMyMmOpYgBpt8WRhix3CZ0ovaZSaALM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEJUKzY3TWQ5TXBHQnRRZDNWVWkrdytRL2tyUzdsZFJhMUwrN3N2ejkzRkZu?=
 =?utf-8?B?Vm5yTVJYcGZqN3lXckY1cVBvcUtWVEw1TVh6c1RhcHlOQWtWaGQvS2w3VW5J?=
 =?utf-8?B?WGYyUnFoWlpHdnByb0NIWWFhazFHUkZZNHREalNTOFJ5ZEgzbmwraUZVU3Nm?=
 =?utf-8?B?UXVNZ0RQLzVsQmNXd0s0bXA5enBqK0NGazBvTm85L3g4d1ZrcW1hUFZMSjNx?=
 =?utf-8?B?RjR1OUZCa2dHZk5PNHNlWFB2djRva0pmU1k3dTErTi9yQ05QcXd3cVZnempa?=
 =?utf-8?B?ekxKRG8zYVEvalFuOTlLYVJZRHNuaGZmUElnajdoNW80TzF0aFk5N1ZzQTVC?=
 =?utf-8?B?Qkx0L3c3cTNQRWxocUZnMW9wc1hPOUJGcFBuSEMxelNjUXVJMm5mQ1h4ZnZU?=
 =?utf-8?B?Z2wwaXZOR3F3dzVKSFZoaWUyQVRpOGV0azdTcWswUjhMdG1Dczlyb3grUzVs?=
 =?utf-8?B?NlZqTlVrZElFVlA3WDZyell6Y0w1WHA4OXRlNTVMMlVZT1RaZmdFRHhMR2Qv?=
 =?utf-8?B?OFRna0ZGRDZoQklQeW9YRWhuY2h0aW0xT09tbjN3bTgvUThhOWh1SExYZjFo?=
 =?utf-8?B?cXFtV0k1UmdjQUU3RmplMk8zS2x2MUJ4V3VDdWhyYUdDc1ZwUG51cHhVTWpC?=
 =?utf-8?B?UlZsM3BkRVA3elVwVUxERWdIMjhwanZubk1jVm96RzQzWllWVXJablNKMCs4?=
 =?utf-8?B?czFGaDVVVmRjSUVOZFU0L1FQQUVSNWpnS2lUbC9UTmpObDRKWXRZWklmZ081?=
 =?utf-8?B?QUQ5NjFtTkdXU2NvajR1NXpGN211SG1BVW5KSW0zdnVqdVNJdUJ5RU5VcWhM?=
 =?utf-8?B?WFUzL1BZMDBwbWFyenFoUGtoQXpDdW4ram1YQTVWbTZpam1hNE02NkVqN2s2?=
 =?utf-8?B?MFlITnlLWGEwN0w4ZnpqZ0NNSGY3am9xWVNUcjdPUWI5S2ZjZUl5OXJYeWNi?=
 =?utf-8?B?alQ0WDNWSjFCZERYeTdDblppZ0hHeVBtdEZtYUx3TE1pZWJKSEY3aU81cjBW?=
 =?utf-8?B?RmNUcjgyN1V0Vk1RdXRVaEdQTW5ydTUwa1N6dFBSZW04dTJzT29FZ1dvNGt5?=
 =?utf-8?B?TkxqZHZEc3Z0ckZoQmdLY0I4ZHpSditRWjB4bmtXa01JSGtSbi9oU3UzZjNZ?=
 =?utf-8?B?dHhJM1hrcUdvZzZpZWo0cGxZYlMrN0lFcWJwb1pkQkN5RXliNVc4TkxITnlI?=
 =?utf-8?B?Vnk4WGpQQVE2blNpOXNhRk1LdWQ5UnRoRWpoSjhMNXZzOWN0dkxGb1E3bTJM?=
 =?utf-8?B?bXNRL2NlWGFVdjhrV2s2S1NOcU0rVXJ0N1NTYS9SdlhCMklWUlBYRnlSblRs?=
 =?utf-8?B?UUlxQTh3V0hTcUpybDdJSVVlVE93Zm1LeC9GUVZ5RW1VSmFtaU1mV05zanJY?=
 =?utf-8?B?RzJCYXJqVC8vYmxzK0Y0VXpHdWtmcFlrTmlKQmY0MWFabEViTDBrWWVGRkoz?=
 =?utf-8?B?K283MnZ3am5OMjhMbzRKQlh1dWhFSGI0djdwanlDZktWU1NjbmlvQ2FEaGpD?=
 =?utf-8?B?R05mVkJKbUJ1cEhwTXhDN25Kb0hvdGRQVk5tWU1kQU1TRmNFS0prWUtLeDFY?=
 =?utf-8?B?Tmxjc3Vvekh2MlRGZ2sxOW1IbGdGU3R0U0ZwTkUwamQxTEdYQ3ByZ21pa21p?=
 =?utf-8?B?V0ZyVVhPYXZuV2M0ME82VjY1Z1h4SjBYcTBOQzF4VmZ6WVNNbGVqOGFQSDBZ?=
 =?utf-8?B?QnBVY29kdlkwVXpvNk1aT0QzV2J5TGsyUjZKRDgvQXRyanAwb202SDg3Tkk0?=
 =?utf-8?B?LzR2Yk41aW5RdEh4RzN3QWJ6cG43L255cW9lWm9mNW9peU5uR3FoejhqdUNK?=
 =?utf-8?B?Zzg4Q3c0d3I2WE9JNnVEVkJBYVRuVHgzM2wyZnM2dHREakx6Mk5ZWWxiZDFE?=
 =?utf-8?B?eE5vSmlXd1hSL05xdEhvQk53YlpoV01rNmNobFpkUVdKVkhnbXRKSUdTRW5y?=
 =?utf-8?B?U2JHYzIvRm1ITDFQbmtkeUY5VUEvTGZPM2pYYmZHR05vQzdvTnRaQXZDZmN4?=
 =?utf-8?B?YXNsNmlOQlRBanBOUS91UGdFVTMxZ2VOSm9PU050MXhUVW1FSzgxaUVHWkpO?=
 =?utf-8?B?ZmpSMHRYc2hFbkJzMmhNemhCVGIzMTVrSHI2ZHIvcjIrZnVaVzhzbDVSZWFx?=
 =?utf-8?B?Y2REQTRPUkM3cmc5UjM5dENtcWJ5dGhKSjRvb2FUS2tWVndOeUZ5NzdKRDho?=
 =?utf-8?B?M2FRTlkrbzRYOGZMUHVkZXZocDBHYXlhQ3VTN3pCRUNDa3pKWmVVMVFBcmoy?=
 =?utf-8?B?Yjg3NlNCbEJEVXo1L1dLMURqSmlVTWtxTUtLNzlZLzFtK1VoTGVZcHVic0dU?=
 =?utf-8?Q?QdwQq9oTuePpL2Hq+2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7793783c-bfa5-440f-d8a4-08def7e37f5c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:02:40.3307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qOd5J8tMEpgR0xDR7JyH6ING4aYW6uYSGKCnfU3SExNxwLAA2Q0sZ+BiglMmVrM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466

Hi Reinette,

On 8/10/26 21:51, Reinette Chatre wrote:
> Hi Babu,
> 
> Could you please switch subject prefix to be "x86/cpufeatures:"?

Yes.

> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Customers have identified an issue while using the QoS resource control
>> feature. If memory bandwidth associated with a CLOSID is aggressively
>> throttled, and a task with that CLOSID moves into kernel mode, the kernel
>> operations are also aggressively throttled. This can stall forward progress
>> and eventually degrade overall system performance.
>>
>> AMD hardware supports a feature Privilege Level Zero Association (PLZA),
>> which allows the CPU's CLOSID association to be changed during the
>> transition from user mode to kernel mode. This allows the kernel to run
>> using a different CLOSID than user space, which can improve system
>> performance in certain scenarios.
> 
> How should user interpret "in certain scenarios"? Could the scenarios
> be highlighted ... or maybe just drop this since it is already preceded
> with "can improve system performance".

Will remove "in certain scenarios".

> 
> This description implies that PLZA is a feature that is only related
> to memory bandwidth allocation where it can be beneficial. As I understand
> the feature impacts all allocation features concurrently, including cache
> allocation where it should be used with care?

Yes. Let me add text about CAT.

> 
> If the goal is to describe all the feature capabilities then it may be
> worth a mention of the impact/usage related to monitoring?

Yes. Need to mention monitoring also.

> 
>>
>> The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]:
>> Privilege Level Zero Association (PLZA).
>>
>> The PLZA feature details are documented in [1] available from [2].
>>
>> [1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
>>      Publication # 69193 Revision: 1.00, Issue Date: March 2026
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
> 
> Please follow "Ordering of commit tags" found in Documentation/process/maintainer-tip.rst.
> 
Yes. Link should be the last one.

Thanks
Babu

