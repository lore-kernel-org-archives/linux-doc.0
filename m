Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6E3B42DE;
	Wed,  8 Jul 2026 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542022; cv=fail; b=OIBh7E2EDQCx084K2iTd2gYNNvQThXdxlyHhkBD8luYh8mbuvy02dXm8XVtKGy/y3xIqzsLVJenBOf8qXEuuRxZVrwk+FHl0JanJACJ2iZkJkp2QhNozdR/oU1LFDxsmHsqzkR9e+6aI5Qusg/i8hvPrzoHbHIDV/tNk5fDVVBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542022; c=relaxed/simple;
	bh=qcWEaZuidP7dGm2hn/xPMKuil1sOSJfGd6TIlq89fTM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QtOS5QzF0Ong9dHlhQkaNgzfAbkBOnCB2sjnvtbcSB5IFAzCL+mITh1UCLL7TChiH/HarrYp/8uRRzj7BOmOd5Jgv0bEalKCg6o96TdrTx6H+ujEpHySWzXKIIm/lMO1Aq14JjCRFfFJ3K0H+REOzp+lZ+3WQLt9udrxckXe6oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XQagJJTK; arc=fail smtp.client-ip=40.93.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XQagJJTK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCgNqZn84M0dolsgiCtE3sktOzN8EFor7AHyCyiuiYinddD4k6ikgdQHYPanKlbwPN8E87JD6CdkjvP07fK1HTZ+Y8aSAn6gCWNq6GuH/cJNSE5rvc3XLbBQg3UpMSTt+OtzCN/eneh4JcyhuGgKpaxu09sBKJQ3F1y1guZ/5s1qGKF14YbKL2GNkE/R2WeuwkjHo6RsZv3O39JX/MPfGMzfGzcMFSwFrtXXT1OQzopkkHeZzhnztUpE9/yPfoyui90pS6o8Ry/IhU78BFU7pIPqEw+kfcvyfxq3ot2hmQPA71N38ckokHiDIy8GuEHOtLhciGiIYpvFg9tRgEulUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/zIZq68PQyCTgznxjt9WhjpXjw7zGkUkPsKp0mO2V0=;
 b=kDh1PgNRP/DxOv3qCGXXiiLHRypqdKwDqMXv1iybH5Xs4Pn3VX7dt1syx25niW2FqWpRCw2Z6pfYlOTQzorgl/rhsRTjq4NE9IpFGLsfWxQx5NVpUz8p+R+HVyE8CWIYxAqH0CZp4vXMEMPxXyClJWw4RfotnWspaD93aRbmmFnogtX4IsXMMVDt9QVOZ5yrKJrA4vJUFF5gOEyI7zLnuabC9n07AUGUwalDOklLjyJTwmb6gZmQTKkhlRBgrhsIXAIaIh7viEMucxZAATcx1A+Z0gi3GdPXqbQ2qXCi+sKmOX6d3YdPP74j2OLTZ8ThHZQfONe/O3HV7S8xJjGOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/zIZq68PQyCTgznxjt9WhjpXjw7zGkUkPsKp0mO2V0=;
 b=XQagJJTKmoKu+YZE/RKPabiFlYZ6a33cgSm1DEirwf0Snl2k3WwQMQnTlGRcJzocfPlFhmffhG4/CGuGnB3cgO7zpB3BZ3BuLzXmjAUKfiF2d9jlD8D4SGDugjvG+uJfsG+56wnDCPgMhc6I+ICL4mMkZCdlxKi9HaxxxZtk8D8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SJ2PR12MB8064.namprd12.prod.outlook.com (2603:10b6:a03:4cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 20:20:12 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 20:20:11 +0000
Message-ID: <62ec8ff4-bc69-40b6-8e6a-55f2e24d0e53@amd.com>
Date: Wed, 8 Jul 2026 15:20:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 03/15] x86/resctrl: Add data structures and
 definitions for PLZA configuration
To: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
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
 <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:610:cd::9) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SJ2PR12MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: a650bb45-b61b-4f8b-5847-08dedd2e502c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	YlTsFsv6r8SmYXUFILQx+ptaXZh8DGBv9U6uHe1BpYr3uLRQfW0GRPUiz9DN5F0PLgrAWQgo+4pSTL32QJmUOvAuDboA4jWs/WYf/vmZGAr8bo5Ez+FQTDnc3fgfimNWwKjPDWWayQIFiIgI8kDO6yC5PtrWHaha6eBdDHP9ytc5+ywtHD9tOv/nZQU69Ybxcbfr33bQ8uC8AP0wMFMcSXBzhXB3UqRxJswEk5EUke+UgxEmy7kb2ppW2grCo4Wp36TLkNepXG0YzJBh1+4koUs7aoyUclGkEHCRBP8Eeb7iWXIYwNqfnfQNvP86z/ZeUlMnu86Fkzw8U97L9P++YEqbSj3bN5cy+nW9ZK5LOFJ/Kle/bjPD4TlaGjLoyH960RHv86EA/GzdQCFmArXPoUoBUfqYaUa0FG98kptdspeKQO55zoaqDDEyjK0qfWwxHCHJiTaD7n2kjZOO8ZPZ4mCmUUe0FRlY7OILcSMrDaTKKa2PWzsQO51u4tIw67OuWQgH/KNdRlmVvyb8l6WRr6LKfRJ7yGBP/JUNDZ9yIvVz+37AtCpYuFK2SQR1RQxgAQn4L0cmJfGC38ZQSlFsL1lRWcwH+sASkeH0lAy4fSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmhON29sOWpMZEtMVE9GSG1uUDcxNGw4d1VIbUR5NUdnc3BYZ0lZRFhMejNE?=
 =?utf-8?B?Zmsvak82L2pIVDdPNVllaEIybHp2S2swSGhWMkhVVXBJc2Jha3JKeTZJYXhk?=
 =?utf-8?B?MG1Gd0RsZUlSVFB4UWxjTFY5R0lNbEJkSFRiaVMwcndUTXp3ZWFkTUNSM3RQ?=
 =?utf-8?B?dEVFeWRCTllrR2xKa291YklQaGlmaVNteWExYjNFSmJ0ODFpcEFRUklEWjVN?=
 =?utf-8?B?S2RGSGIxQjFWZnMzcnBYeVdTSmM5dXA4YlNla0QySDV4VlJ6WUQ0QjRCcktP?=
 =?utf-8?B?aHh1V05sUmYyamF3bkZOK1dGejlvMCtGOHVHYzBVQ3RHOEFOR3U4S1RVdzNz?=
 =?utf-8?B?dVUzcHFPb1FUbzdqWitCYzIyTVUvRmkvcEhnakFpdGhNRDhZT1duQWR3OU56?=
 =?utf-8?B?UWhCYXZPa1VlWXNGT0M1K1NxK096STB1TXpMT0NQUVkyemIyRk5Way9qemZO?=
 =?utf-8?B?R2tHTkJrU0lHcUpsc3dUeWRZOU5qeHRoZEdiQi9qMmNROTFpMlBUbzJsVklU?=
 =?utf-8?B?UFh1KzB3NlBtdzdoR1Jrc0lySDhWNlptY0trRjM2OHFjZ2p3ODdqYXVLZUQ2?=
 =?utf-8?B?cTdEeHY0VUdKMnNpM3ovak50R21kaklTbEdLdEVlVDNKS2xBQXJUaXBrOEpN?=
 =?utf-8?B?UWJlcXkrQ2V0dDVDSnJ2QmVwN3B5UVZVaEtRcUt1Ykh3ODVPZXI1S1JBbGZq?=
 =?utf-8?B?T2hGNm5PNnljUk1iV3lldGdrVVU5akxHbVZMTFZOdlFKQVM5N3NBbU0xWjU4?=
 =?utf-8?B?ZWhzUS8xVm5BZDBCUUZNeStwV09paC9hcW1nQWxQbnBYT0JYc1VMK2xZcEZ2?=
 =?utf-8?B?cWhBbVlYZVNacGhZNERwRm1VU3VBTUwrZkxVaC90bGdlSGFSbkNHSWhBeE9H?=
 =?utf-8?B?amtyNkx4dWZEYmduUG1OVEErdXg4dHV0WGNTZVNETzZwM3lkWlFPZHhrQ21U?=
 =?utf-8?B?TGJVaW41VEU1bmFoSnltTyttbDB5YnpXL1kvVncwUnpTOFhoalpYb0Z2bHN2?=
 =?utf-8?B?SGo5NUUzN0pRbk9DZEJKNzgvdTY5VklHZjVSQ2YyWkp4QUMyZGVyZUlGT21D?=
 =?utf-8?B?anBnM1ErWmhGTDVqYlFGNjdHQ01JdzhUd0RzMHhzSHlFbXdWdEpISVZGLzNy?=
 =?utf-8?B?SVhVeE4rRUE1SFBPMVlDdlJTSkdlMzExRUExbEhQcVpxQVJHdnROUlRERWlN?=
 =?utf-8?B?aHFWdTM4N25OQ0xhVEJSbFRydUFpK3dEaGMrZFA4QzVscW1WV0s3RTNXOFBR?=
 =?utf-8?B?WG1BZTA4bGlkdVFydGdJek5NL2NrdUF5SHNOVWE0b0t6ZFNMcG0wQ0lsQmV3?=
 =?utf-8?B?Qm5ub3B5VHg4VFJkZWpkS29ycEtid1ByOHNkMjBSNUYxdTliR1BXaEloR0tT?=
 =?utf-8?B?NUFUbkhkUHl4SkcwZG1CTkRxTGZQUTZIbElub1pUcFlNcFp5SWRoNnczY0d2?=
 =?utf-8?B?M2RYVFZyUmdNWEFNOFBLUW9EejZSajh2cTk2dGhxbnRVSklFcnNkTTRRKzNV?=
 =?utf-8?B?YmR4UWJNNVkrazdZdWJkcWZiaWtRZFN2OU9BODgyZS9YRnJRTm84U09Lb1Nm?=
 =?utf-8?B?ckkrVUhQUXYwQnlPQUJ4TWZBbU1hVTFoTmJ1b3JLeHowb1pKRnpaTlJxSWNw?=
 =?utf-8?B?bDF6dittUmNtRFVkMWk3TTFCbGl3dXkvKzZXNVg0L3JzQ1hsQ0F2MWczTmZm?=
 =?utf-8?B?WkpWbWRiK0swTVNhN2p1OWZNc0xjRnRTWm16UEMyVklFdCtld2dsUFBtQVo2?=
 =?utf-8?B?Rld6a3lxK1RxeUFMWVhjZ1BqZU1GdEx3VTA2bERtNXpUYXBzdFVxNENaNk5J?=
 =?utf-8?B?ekhLbUJBSFYrV3VGS3Rudml2dWtGczNXQTJRTWFGRlI2anBXR3BnMnBMc0Va?=
 =?utf-8?B?amJ4eWdHcW1mRzl5allPcndacGxrWktLRHdiUmpQakxFTnJuZmw2UExxNUts?=
 =?utf-8?B?YUp6eVgzb2R2emMrUHNObDdCelNCL3ZkTkNSTHdWaUtWZzN6bld0bmpWZldX?=
 =?utf-8?B?SlIvNitsN0FzMEVqK0dyVFdpaHRQd25vVVYrUVlIZUd4Rkw4Vm8vWHNKSDVG?=
 =?utf-8?B?Z0taRzZXNVJBVzZ5T25tSGMxd0J1alBUMHFOK1RSdkd0VE9CTGg4VmdqamNl?=
 =?utf-8?B?NmlQM1M1NWQxY3dPWjE3UXorUzRyZFo4aS9haXYxMzJjUllaSDNlV0FvUnNh?=
 =?utf-8?B?ZHExMlVQREdLZUhCYS9WZDZOUjZ5VnAvREx4SlV5Y1IxUnY1Nlk2bkc2MkRs?=
 =?utf-8?B?N0NBQTRSNXNMQ2dxcE1SOEtpK25JMTQ0SW5rSGg5VDUwSkRkK0M2VzJkbmtJ?=
 =?utf-8?Q?a/7lCF2sSFyuFvSeRA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a650bb45-b61b-4f8b-5847-08dedd2e502c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:20:11.8155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyDqfkav+J2dldLGG+lH5nk1LpBXpXEYS4u+lDzdp/tMkNKCsbL/EkKQKESnwKHY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8064



On 7/7/26 16:50, Babu Moger wrote:
> Privilege Level Zero Association (PLZA) allows the kernel to use a
> different CLOSID (and optionally RMID) than user mode on entry to kernel
> mode. The CLOSID/RMID association is programmed per CPU via
> MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc), using RMID/CLOSID values and their
> respective enable bits.
> 
> Add the MSR definition and union msr_pqr_plza_assoc to represent the MSR
> bitfield layout used by subsequent PLZA programming.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Re-wrote the changelog and code comment.
> 
> v3: No code changes. Patch order changed. Improved changelog.
> 
> v2: No changes. Just rebasing on top of the latest tip branch.
> ---
>   arch/x86/include/asm/msr-index.h       |  1 +
>   arch/x86/kernel/cpu/resctrl/internal.h | 37 ++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index 18c4be75e927..2503451a95fe 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1292,6 +1292,7 @@
>   /* - AMD: */
>   #define MSR_IA32_MBA_BW_BASE		0xc0000200
>   #define MSR_IA32_SMBA_BW_BASE		0xc0000280
> +#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
>   #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
>   #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>   #define MSR_IA32_EVT_CFG_BASE		0xc0000400
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index e3cfa0c10e92..020ebc2c8a1f 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -222,6 +222,43 @@ union l3_qos_abmc_cfg {
>   	unsigned long full;
>   };
>   
> +/*
> + * Privilege Level Zero Association (PLZA) is configured by writing to
> + * MSR_IA32_PQR_PLZA_ASSOC. The MSR must be programmed on every CPU in
> + * the QoS domain. Each domain supports only one PLZA CLOSID and/or RMID
> + * association. All fields other than PLZA_EN must hold the same value
> + * across the domain for consistent operation.
> + *
> + * When PLZA_EN is set, the CLOSID/RMID association used at CPL 0 is
> + * taken from MSR_IA32_PQR_PLZA_ASSOC instead of MSR_IA32_PQR_ASSOC.
> + *
> + * @rmid		: RMID associated with PLZA.
> + * @reserved1		: Reserved.
> + * @rmid_en		: Enable RMID association for PLZA.
> + * @closid		: CLOSID associated with PLZA.
> + * @reserved2		: Reserved.
> + * @closid_en		: Enable CLOSID association for PLZA.
> + * @reserved3		: Reserved.
> + * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
> + *			  given CPU. When PLZA is disabled for a CPU, the
> + *			  CLOSID and RMID association defined in the
> + *			  PQR_ASSOC MSR applies, regardless of the CPU's
> + *			  privilege level.
> + */
> +union msr_pqr_plza_assoc {
> +	struct {
> +		unsigned long rmid	:12,
> +			      reserved1	:19,
> +			      rmid_en	: 1,
> +			      closid	: 4,
> +			      reserved2	:11,
> +			      closid_en	: 1,
> +			      reserved3	:15,
> +			      plza_en	: 1;
> +	} split;
> +	unsigned long full;
> +};
> +

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=3

 > This is a pre-existing issue, but does this union truncate data on 
32-> bit x86 builds? On 32-bit kernels, unsigned long is 32 bits, but the
 > bitfields sum to  64 bits.

Will change the union to use 'u64' type for 'unsigned long'.

It also reported problem with "l3_qos_abmc_cfg".

Will fix that as well.

thanks
Babu


