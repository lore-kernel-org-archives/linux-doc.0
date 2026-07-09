Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576A031AA87;
	Thu,  9 Jul 2026 23:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783638877; cv=fail; b=GzWxOsaKIVVDrLszeaKFfopEAw7Pjbz5QQ4P+CkqgxeseSZkR3Am0kW8U3zAg6Ugf6YG7Ix2bgVWRAtYh0dPnlM7V7nMh1F1Aqk/CamVlQ9w9YEgxm112Hggz9kvEJcrAdpuPxHfMBqEC26F5OGGMuuwHNl/C7yOQhXW2AuM9hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783638877; c=relaxed/simple;
	bh=43ZQOY4wichCvvnSUl0kUfh1Wz3vbhj2jrpoM7EaDlc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pjvkEDUNrf29RWnbHoDmujg6UQSoOm6wcBVm0UIESf6k3+vA9C6TJXPL20jSedP2F0nUKeX8AS8uUxfRmglQ4gs21RBrlg+OiZkRO2YP0pl9OVwxa8ydJhpRuyLJvO8IavKzGEakVNQD0y5gL/VhzZjThZf0g8tknmaa1kVqHXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G74AcWtg; arc=fail smtp.client-ip=40.93.194.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G74AcWtg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QB6Vi3o1FjCp3e6430cdIylR5Aw87ZyLYYVnzCjSX3JxpYfsGC89KDd3lavkEqZryZdsUA8GOyrg1mtbkgOCov8FQoi7wB7VberqJMKVkJ+H+Cirve4LTqGIr0gM6gpMCmNB9Q9cECXZ+7eGglnzWzZN7AbaydjkpyZpjigyTa58qa3+VN/IZXrmaZyjdgQBXtaW0zwMHb3aJ+D1Dry0Kei1C2d6Mrs3DzH/Eqo7JMpt6AofqD01QLaMTn2G56nNzkONH4+9RLnWUGo4WjeJ3jk7N7k2XwFBIyqhQ14Tx7lzo3zcnPEj2pQiovUB9vwD26uVit7VDEz8/uUPYXVSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK5UC34rjSi4VI2ZvSE1bPzcTRD9BahvIRyZa5FGCjQ=;
 b=FrMw0ax4T3Q+RMinhJMngY+c3QAVhclfEXfnUEe9DYFoFp9WQHE+KxGFOv+pRBKJwDfqVuFybVpsfWeMiFroqMNWx5OgYBPjmH71y3PVkRg6n/we3hPqvVB5OmLotewFsYo/tZiNL/qJ+I0QGikeHHOPS1b5xVeWmTsRycdEq4DpKc0GUEpeXFbEBnM4j0Zof932rZn4G25mw/dN/OHoQSeIgOiSEOYswjuV33Q208kG6Z2pW9VIdeMyNkI4XRJoQUPHADRo5FrvlAgr0O1nl0jdQ8AzOpjVK7KevghYtxQckDrEujC3+6tQcs7KZtrbG/00CXRtTSVZ8gY9L9pLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IK5UC34rjSi4VI2ZvSE1bPzcTRD9BahvIRyZa5FGCjQ=;
 b=G74AcWtghHIyaF+uWZ4UUJzC8GbIfEVLhZR1A1NUqIJlD60LVHBUU5i+jP8ZMb+rxRcHquMWPIw3SH5BklHUO/cEV2uaaw2Meh12CXtfNV0RaRs0suND1GDYBaGRPuv8EuYiX2TsvODw8N11STmWHyO/yQPO2EabRGWg0VQjFvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5326.namprd12.prod.outlook.com (2603:10b6:5:39a::16)
 by CH3PR12MB7545.namprd12.prod.outlook.com (2603:10b6:610:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 23:14:30 +0000
Received: from DM4PR12MB5326.namprd12.prod.outlook.com
 ([fe80::cb64:d14d:7f37:b883]) by DM4PR12MB5326.namprd12.prod.outlook.com
 ([fe80::cb64:d14d:7f37:b883%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 23:14:30 +0000
Message-ID: <d5b873cc-4313-4d35-912f-dcaa64d5b641@amd.com>
Date: Thu, 9 Jul 2026 18:14:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 14/15] fs/resctrl: Allow user space to write
 kmode_cpus/kmode_cpus_list
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
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
 <e2deefce19f3cf087ea96a7aba3f6850812e3036.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <e2deefce19f3cf087ea96a7aba3f6850812e3036.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::8) To DM4PR12MB5326.namprd12.prod.outlook.com
 (2603:10b6:5:39a::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5326:EE_|CH3PR12MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c27bc0-2fe9-42b6-d5d5-08dede0fd3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|18002099003|22082099003|11063799006|6133799003|3023799007|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	sROXUzKBpsFZBjlKlgfE6F8GtRrlltUnHh/AAejFV5ft3/ssx/Uc+n/GCpdFNV2ZmFwuNuQ3gcAqC7fS+N4yhv/435G4KOLdsQMy8gxbuYHtC0pY/iuEEoc4aRnrfbqZDBhun3GGCLYxj9i8yK20PP0PMhMS2FIkKhJj3ISga0jV9yUpKfFccu2kaEO7UYHShIW+3p4x3eChp+k64+weYFCchieKdHkzOyC70OViPwWwVoeP+D97GG+WFxr5TSj1BHqBbKsVG7p6cqeH+oKyyCEv1dr3fptl7hXnydC+Raun1YWgPw1mA6Jgp5LCgTPb/sJVWQnTmkKNR2cEm41LYqNdyGuyZ+N3hlbMIFAMD9tiAaZArqatpxOyI6XLtOJxlMgcum/79dJYq3VYlnilpt5ebvgGn6PnrSYZ+YymcU8YEQ5ZY+zlhLRsRPRIhYNE0cFMih/FUvgI4oICfjVny0A1TZdbjeesyB9jTOwwu156dvTmRmG4Ujd3FtEoxfJcRdjRAZ+1NCN5hOI1FncXMOo+ZVl/ZZVxqQ3CfDJvK7FsLb3O8CBE+P//YirMf7fzGd6wjjoQATrI9jpZ5NuEuOzvg8bVWCbCCTO+6QyoDMk3PEuxTszpp7WILokea2wQddiF7SH7imqnIZyQYMO4uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(6133799003)(3023799007)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU9sY2VCa3FZb0Q5bzFuRjRNQnJPekNFelRWQS9nUnp3bU9IOHgxUVN1dHJB?=
 =?utf-8?B?eGFmSGIxUFErd0hGUUpqY3lEMm1UejdnWit3dUl1R1hWRkEzdVNDOWd3bU5X?=
 =?utf-8?B?dDdTZUtUWHgvYWYzVVB6MEJsdFZ6RGxMZjNlVzBPdURCWTBzRlRxRklXNWZF?=
 =?utf-8?B?ZEQ1UFVHcGVzMnQvSitZcS9KcmpUeXpROENkOW5XY3lFUGtxYThoc0ZRSTMw?=
 =?utf-8?B?ZU5uUEJSUENoS2ttV21tRE9ObjhzYmJVdnBnUzBZRkZPMVRqVjd6cDFBWk16?=
 =?utf-8?B?QS9JOVROWGorQWtBSDVTcnpOL1hpelBFa3M5K09aUU5pVXJ3RGRZQjJFTXlN?=
 =?utf-8?B?TW9FV0MxQVJCT1FWa2R4SFVSWlA1eTMza0ZoeVRUaE9TcDZ0bm9OM25GYjYx?=
 =?utf-8?B?Z1J3b3pnbzltTStHenlmU1RxQzZrTGg4dTQyRm9UTzhDSDloS2wraTNTMW9k?=
 =?utf-8?B?N3JGMXNaMmFQNEM4VU5QaVNLZXhEeUdTc3JpUHcxbldVMjdPSmFxNGQyRkhr?=
 =?utf-8?B?MEhWQnNMdTMyeCtLQ0NNbk1MbTAxZFhvTkhJWWY0b3k3QkxqY0Izdk1rSVU2?=
 =?utf-8?B?SVh4U2pjRDgzSnpjNG9jSTB3aHdFTkQ0ZXJUVzd3c25ZVGlXdk9GT2NROFVu?=
 =?utf-8?B?N05vclY4dDhxczF0b1E3TFRnclZTZDE1T0ZKRGovRkFWenhVUU5OaVdjTEJC?=
 =?utf-8?B?TXRBYXFEcGtmZFloaFE3WC85KzRWUXlKditITG5NeTRramZzY2RwKzBaWERs?=
 =?utf-8?B?WDc3eCtUSFhhS3VjRFlwaHF6bDlmckJhVXRoYmhWV0x1WkRaaUZrOGVvbTdQ?=
 =?utf-8?B?TEVtazUwS0dMZitCbXdRbFJYWmJkT2FDZmlHcEVOMGY5SkNwam53U1VaS1cz?=
 =?utf-8?B?MDhJY2tRL21FcFdHQ0VJTGYrZ2dpWjZLZ01XU1NDck5UTkpzRENjQVNlRjk3?=
 =?utf-8?B?YzloNnJkbVBYTjFJM2Vwak1FYkhEendlVEkrcVZWMTdudnZFNDBpd011QWFs?=
 =?utf-8?B?Y01TK2hXam1qdktDNWk0ekpMQ2pNZUFwQWNHRDlBRWxDcGFoSzM1MTFDVElR?=
 =?utf-8?B?MFh0bHRiaG41Y0R3eFpsaUxQRGI1RE45dmNNQ2J0L1p1dThnd0VGNHNDNGx2?=
 =?utf-8?B?eHh4VXEvRzlmVzlLeFo1ajZDaWNkWStCM3dBMHdhOG8zbnorS2dyeHF4ZWVn?=
 =?utf-8?B?UElEUlFiZTFrN3krcWIxL1VUaHBrMDlBU2tobEJ0U01kMnFKcG90Z29NVFR1?=
 =?utf-8?B?OVR0T2RUWERkdHJIRFZzN1dYZTRqNGNQRmZUS3VqMUdMNVB1d2hYSHBJRHR4?=
 =?utf-8?B?S3prQVYvcEVNQzJHZkdPK3hVNUJ3SEY0Y3FpOHVtK0tmNVAyVVRBUzRHRlM1?=
 =?utf-8?B?QWtwZlpCZVE0bHljVCtDRWs4Zkc2ellzTExRL3gycjBRUzN5L2NFVkhUblB4?=
 =?utf-8?B?aTJ2aDgyc2xUeG51UmMxYWxkUUNLWHl4Q2IzUzg3UTJvNld6a1RrWW1mMDlK?=
 =?utf-8?B?V3g2aVJrclY5YlZsWkJiTzFyeFQyeHZESDFGUGZwWGVuQ2UzeFJkU2NWUEs1?=
 =?utf-8?B?cDVPLzZLTVE3OTNWenJCUFVUVFRhNEtaOTBPMmFoNW0zcnBWT1IvYmNVcGpN?=
 =?utf-8?B?REZaNHc4VlZDeDA3aXgxdWFreHFWVWFSYWdFdDloSkdDTW5kQkFyRDZGNFVI?=
 =?utf-8?B?UXpCaC90MXM5ME9KaGxVMTRTdUlrVVJjZTk4Rnh3cnBnS3pyWnlreko1QW82?=
 =?utf-8?B?WG5jM3J2emtaUkNJazdLVWdxY0xRKzkyYWtTYzlOc2d6LzRwQzhDdVNlelhn?=
 =?utf-8?B?UjlLRGcxcERmMGZkelRhcVIrY1FZVUVsK3JLdHNUY2VwMER6TmZOd2J0bVFX?=
 =?utf-8?B?WGt0eFF1YVZOTStCeDh4T1hsRkdScERPTTEydTN1bVE5VHgxSkxlTFpiVkU1?=
 =?utf-8?B?L3RhSDZlc1pPMEkrdVZJdFU5L1g2eGNzTEVUMzhNVDV6clB0bW5rY0xvZ0pS?=
 =?utf-8?B?VU1xUExtMW5qcWhzQ1hreXRianMrdTNGdTM3MnpPeGgxVEJ1cUlPTlFaczFt?=
 =?utf-8?B?aW5PQzlScWdVTWloSnJlQWYwUUMxbVI2Tzl6bnJYYWY2Sm5UekNEUHRHSTZG?=
 =?utf-8?B?czdnWkZBbnE3U0lNMzZwclJ4NVFwcHVqa05GamdtZTNWaVFSbWFFMStZSXU4?=
 =?utf-8?B?SjVNaUZMUElYSVFrT215U3BVbDZsUk14YUZKbGgycGl2dU5jb0JqU05GUFh2?=
 =?utf-8?B?U1UzS0RMK1YzZmczWDB1ZzlnOGxiSFJHOVpYSFNsTW5GOHNNSzNiOHRmL2Ro?=
 =?utf-8?Q?EJE6C/PnSSOGfF+uQo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c27bc0-2fe9-42b6-d5d5-08dede0fd3f6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 23:14:29.7311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIef7y2nI2anzEOqiHKcJBUtXwJPDdro0OjxnKPVtcTACrNf8Cw4z1T0mdYtCx00
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545



On 7/7/2026 4:50 PM, Babu Moger wrote:
> kmode_cpus and kmode_cpus_list expose the CPU scope for the rdtgroup bound
> to the active kernel-mode policy. They are currently read-only, so changing
> the scope requires rebinding through info/kernel_mode, which reprograms the
> whole binding instead of only the CPUs whose state changes.
> 
> Make kmode_cpus and kmode_cpus_list writable. Parse writes as a bitmap or
> CPU range list. Reject pseudo-locked and pseudo-lock-setup groups, writes
> to a group other than resctrl_kcfg.k_rdtgrp (including stale file
> descriptors left open across an info/kernel_mode change), malformed input,
> and masks that name offline CPUs.
> 
> Update the bound group's kmode_cpu_mask and reprogram hardware
> incrementally: disable kernel-mode association on CPUs in the old mask but
> not the new mask, and enable it on CPUs in the new mask but not the old
> mask.
> 
> Document the interface in Documentation/filesystems/resctrl.rst.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Empty masks are now allowed and updated masks are in rdtgroup->kmode_cpu_mask.
>      Updated the changelog.
> 
> v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
>      kernel_modes.
> ---
>   Documentation/filesystems/resctrl.rst |  30 +++++
>   fs/resctrl/rdtgroup.c                 | 151 +++++++++++++++++++++++++-
>   2 files changed, 179 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 5a13814d1325..4a2bdd74d4aa 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -676,6 +676,36 @@ All groups contain the following files:
>   "cpus_list":
>   	Just like "cpus", only using ranges of CPUs instead of bitmasks.
>   
> +"kmode_cpus":
> +	Visible only on the rdtgroup currently bound to the active kernel
> +	mode (see "info/kernel_mode"); hidden on every other rdtgroup,
> +	including when "inherit_ctrl_and_mon" is active.
> +
> +	Bitmask of the logical CPUs scoped for this group's kernel-mode
> +	binding.  At bind time through info/kernel_mode, every currently
> +	online CPU is included in the scope.  CPUs that come online later
> +	are automatically added to the scope and programmed with the binding.
> +
> +	Writing a mask reprograms the binding incrementally: it enables on
> +	the CPUs newly added by the write and disables on the CPUs dropped
> +	from the previous mask.  An empty mask disables the binding on all
> +	CPUs in the current scope.  The mask must contain only online CPUs;
> +	masks naming offline CPUs are rejected.
> +	Errors are reported in "info/last_cmd_status".  Example::
> +
> +	  # mkdir ctrl1
> +	  # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
> +	        > info/kernel_mode
> +	  # echo 0-3 > ctrl1/kmode_cpus_list
> +	  # cat ctrl1/kmode_cpus
> +	  f
> +	  # cat ctrl1/kmode_cpus_list
> +	  0-3
> +
> +"kmode_cpus_list":
> +	Just like "kmode_cpus", only using ranges of CPUs instead of bitmasks.
> +	Writable with the same semantics and restrictions as "kmode_cpus".
> +
>   
>   When control is enabled all CTRL_MON groups will also contain:
>   
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 7b06c3b3f00e..8ecd107368b3 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -423,6 +423,151 @@ static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
>   	return ret;
>   }
>   
> +/**
> + * kmode_cpus_write() - Update @rdtgrp's kmode_cpu_mask from @newmask
> + * @rdtgrp:	Resctrl group whose kmode_cpu_mask is being updated.
> + * @kmode:	Kernel-mode policy currently active on @rdtgrp.
> + * @newmask:	Set of online CPUs scoped for @rdtgrp's kernel-mode binding.
> + * @tmpmask:	Caller-allocated scratch cpumask used to compute the
> + *		incremental enable/disable deltas; contents on entry are
> + *		ignored and on return are unspecified.
> + *
> + * Compute the difference between @rdtgrp->kmode_cpu_mask and @newmask
> + * and call resctrl_arch_configure_kmode() only on the CPUs whose enable
> + * state actually changes:
> + *
> + *   - disable on (old & ~new)
> + *   - enable on (new & ~old)
> + *
> + * Then copy @newmask into @rdtgrp->kmode_cpu_mask so subsequent
> + * show/write operations reflect the updated scope.
> + */
> +static void kmode_cpus_write(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode,
> +			     cpumask_var_t newmask, cpumask_var_t tmpmask)
> +{
> +	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
> +	u32 closid, rmid;
> +
> +	closid = rdtgrp->closid;
> +	rmid = rdtgrp->mon.rmid;
> +
> +	/* CPUs dropped from this group: old & ~newmask. */
> +	cpumask_andnot(tmpmask, &rdtgrp->kmode_cpu_mask, newmask);
> +	if (!cpumask_empty(tmpmask))
> +		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, false);
> +
> +	/* CPUs newly added: newmask & ~old. */
> +	cpumask_andnot(tmpmask, newmask, &rdtgrp->kmode_cpu_mask);
> +	if (!cpumask_empty(tmpmask))
> +		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, true);
> +
> +	cpumask_copy(&rdtgrp->kmode_cpu_mask, newmask);
> +}
> +
> +/**
> + * rdtgroup_kmode_cpus_write() - Sysfs write handler for kmode_cpus[_list]
> + * @of:		kernfs open file (selects bitmap vs range-list parsing via
> + *		is_cpu_list()).
> + * @buf:	NUL-terminated input from userspace.
> + * @nbytes:	Length of @buf, returned on success.
> + * @off:	File offset (unused).
> + *
> + * Parses @buf into a cpumask and rejects:
> + *   - pseudo-locked / pseudo-lock-setup groups,
> + *   - writes when INHERIT_CTRL_AND_MON is active or to a group other than
> + *     resctrl_kcfg.k_rdtgrp (stale fds opened before an info/kernel_mode
> + *     change),
> + *   - malformed input,
> + *   - masks containing offline CPUs.
> + *
> + * Validated masks are passed to kmode_cpus_write() to update
> + * @rdtgrp->kmode_cpu_mask and reprogram hardware incrementally.
> + * Errors are reported in last_cmd_status.
> + *
> + * Return: @nbytes on success, -ENOENT if the group has been deleted,
> + * -EINVAL for pseudo-locked or pseudo-lock-setup groups, malformed input, or
> + * offline CPUs in the requested mask, -EBUSY if INHERIT_CTRL_AND_MON is active
> + * or the group is not resctrl_kcfg.k_rdtgrp, and -ENOMEM if the scratch
> + * cpumasks cannot be allocated.
> + */
> +static ssize_t rdtgroup_kmode_cpus_write(struct kernfs_open_file *of,
> +					 char *buf, size_t nbytes, loff_t off)
> +{
> +	cpumask_var_t tmpmask, newmask;
> +	struct rdtgroup *rdtgrp;
> +	int ret;
> +
> +	if (!buf)
> +		return -EINVAL;
> +
> +	if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
> +		return -ENOMEM;
> +	if (!zalloc_cpumask_var(&newmask, GFP_KERNEL)) {
> +		free_cpumask_var(tmpmask);
> +		return -ENOMEM;
> +	}
> +
> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> +	if (!rdtgrp) {
> +		ret = -ENOENT;
> +		goto unlock;
> +	}
> +
> +	rdt_last_cmd_clear();
> +
> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
> +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
> +		ret = -EINVAL;
> +		rdt_last_cmd_puts("Pseudo-locked group cannot host kernel-mode binding\n");
> +		goto unlock;
> +	}
> +
> +	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON) {
> +		ret = -EBUSY;
> +		rdt_last_cmd_puts("No active kernel-mode binding\n");
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * The visibility layer (kernfs_show()) prevents fresh open() on a
> +	 * non-bound group, but file descriptors opened while the group was
> +	 * bound stay valid across an info/kernel_mode change.  Reject those
> +	 * stale-fd writes so they cannot corrupt the now-active binding.
> +	 */
> +	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
> +		ret = -EBUSY;
> +		rdt_last_cmd_puts("Group is not the active kernel-mode binding\n");
> +		goto unlock;
> +	}
> +
> +	if (is_cpu_list(of))
> +		ret = cpulist_parse(buf, newmask);
> +	else
> +		ret = cpumask_parse(buf, newmask);
> +
> +	if (ret) {
> +		rdt_last_cmd_puts("Bad CPU list/mask\n");
> +		goto unlock;
> +	}
> +
> +	/* kernel-mode binding is only programmed on online CPUs. */
> +	cpumask_andnot(tmpmask, newmask, cpu_online_mask);
> +	if (!cpumask_empty(tmpmask)) {
> +		ret = -EINVAL;
> +		rdt_last_cmd_puts("Can only assign online CPUs\n");
> +		goto unlock;
> +	}
> +
> +	kmode_cpus_write(rdtgrp, resctrl_kcfg.kmode_cur, newmask, tmpmask);
> +
> +unlock:
> +	rdtgroup_kn_unlock(of->kn);
> +	free_cpumask_var(tmpmask);
> +	free_cpumask_var(newmask);
> +
> +	return ret ?: nbytes;
> +}
> +
>   /*
>    * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
>    *
> @@ -2531,15 +2676,17 @@ static struct rftype res_common_files[] = {
>   	},
>   	{
>   		.name		= "kmode_cpus",
> -		.mode		= 0444,
> +		.mode		= 0644,
>   		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.write		= rdtgroup_kmode_cpus_write,
>   		.seq_show	= rdtgroup_kmode_cpus_show,
>   		.fflags		= RFTYPE_BASE,
>   	},
>   	{
>   		.name		= "kmode_cpus_list",
> -		.mode		= 0444,
> +		.mode		= 0644,
>   		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.write		= rdtgroup_kmode_cpus_write,
>   		.seq_show	= rdtgroup_kmode_cpus_show,
>   		.flags		= RFTYPE_FLAGS_CPUS_LIST,
>   		.fflags		= RFTYPE_BASE,

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=14

--- Patch [14]: [RESEND PATCH v4 14/15] fs/resctrl: Allow user space to 
write kmode_cpus/kmode_cpus_list ---
commit 263cb432ef00bc0bc1801a5cac6bf42139e89250
Author: Babu Moger <babu.moger@amd.com>
fs/resctrl: Allow user space to write kmode_cpus/kmode_cpus_list
This commit makes the kmode_cpus and kmode_cpus_list files writable. It
allows userspace to incrementally reprogram the CPU scope for the active
kernel-mode policy. Writes are parsed and validated to reject
pseudo-locked groups, incorrect groups, malformed input, and offline CPUs.
 > diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
 > index 7b06c3b3f00e0..8ecd107368b3d 100644
 > --- a/fs/resctrl/rdtgroup.c
 > +++ b/fs/resctrl/rdtgroup.c
[ ... ]
 > +static ssize_t rdtgroup_kmode_cpus_write(struct kernfs_open_file *of,
 > +					 char *buf, size_t nbytes, loff_t off)
 > +{
 > +	cpumask_var_t tmpmask, newmask;
 > +	struct rdtgroup *rdtgrp;
 > +	int ret;
[ ... ]
 > +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
 > +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
 > +		ret = -EINVAL;
---------------------------------------------------------------------
While we reject writing to kmode_cpus for pseudo-locksetup groups, what
prevents the active kernel-mode binding group from entering
pseudo-locksetup mode in the first place?
------------------------------------------------------------------------

Will add a check "rdtgrp->kmode" in rdtgroup_locksetup_enter()
This should avoid the following issue
---------------------------------------------------------------------

If a group bound as resctrl_kcfg.k_rdtgrp transitions via
rdtgroup_mode_write() -> rdtgroup_locksetup_enter(), and
rdtgroup_locksetup_enter() does not check kmode_cpu_mask or active
kernel-mode bindings, it can successfully enter pseudo-locksetup mode.
Later, if the user removes this group, rdtgroup_rmdir() routes to
rdtgroup_ctrl_remove() instead of rdtgroup_rmdir_ctrl():
rdtgroup_rmdir() {
     ...
     if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
         rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
         ret = rdtgroup_ctrl_remove(rdtgrp);
     } else {
         ret = rdtgroup_rmdir_ctrl(rdtgrp, tmpmask);
     }
}
Since rdtgroup_ctrl_remove() bypasses the rdtgroup_kmode_detach()
call present in rdtgroup_rmdir_ctrl(), the group is deleted without
detaching from resctrl_kcfg.k_rdtgrp. Can this leave
resctrl_kcfg.k_rdtgrp as a dangling pointer, leading to a use-after-free
regression on subsequent CPU hotplug events?



 > +		rdt_last_cmd_puts("Pseudo-locked group cannot host kernel-mode 
binding\n");
 > +		goto unlock;
 > +	}
 > +
 > +	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON) {
[ ... ]
 > +	/* kernel-mode binding is only programmed on online CPUs. */
 > +	cpumask_andnot(tmpmask, newmask, cpu_online_mask);
 > +	if (!cpumask_empty(tmpmask)) {
 > +		ret = -EINVAL;

If resctrl_offline_cpu() does not clear offline CPUs from
kmode_cpu_mask:
resctrl_offline_cpu() {
     list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
         if (cpumask_test_and_clear_cpu(cpu, &rdtgrp->cpu_mask)) {
             clear_childcpus(rdtgrp, cpu);
             break;
         }
     }
}
Would this regression break the read-modify-write workflow for kmode_cpus?
If a CPU in the active kernel-mode mask goes offline, userspace reading
kmode_cpus and rewriting it (or modifying it) would be rejected here
with -EINVAL because the offline CPU was left in kmode_cpu_mask.

----------------------------------------------------------------------

Yes. This is an issue.
Need to clear the kmode_cpu_list if the cpu being offlined is part of
the current kmode. Also, need to disable PLZA on the CPU that is offlined.

Will take care of this in resctrl_offline_cpu().


Thanks
Babu
