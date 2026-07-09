Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB924195D6;
	Thu,  9 Jul 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620956; cv=fail; b=f/UXC5o3t7AKAjwgrtOmY+yNl/pwUV5eAPzprQuDqpAcz/XVrY9pwn10Q2tzhHlKXdF1NHpoi5eqD/05I4RES+qQzo2O5ZzyLyk+RyPcBvigamEPLS6+vvKY/6vBGWk2Pkfs2ItyzhLB/JpCfX6nA3AS3wCCRp4ifv5+dvoqnyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620956; c=relaxed/simple;
	bh=hTrjvzxkiwa2NfNDqgbzzcbPz0yOPJ3/W3iWIM5/VoI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PFC3z54aUN7FLRpgPr+R5pavClfZzXOpzoDqBfQq3efytMqj+M9ZSaogpkBPIYKHWbzjc8q8/hhG/OBSe6TxBRr7HYJPcqgLZghYDJ62Ry2U8GDnY0L8KpJFFufjWqE6kG1vmaW9m+DDj7HN7ah3808VM7JUFYf35VxbB3MV338=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZmIpstr/; arc=fail smtp.client-ip=40.93.196.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZmIpstr/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szAjEMEStZ3ulUaoydTJvUSI5NjPnR5drDf5m73LJ4HldSrSv1ZW8Iw8sRVsJUCB1hnZ72EWgzXTbitk8KzWrxo58yTDF6xew8wtkmi7C2c6Ta4y9jK5V4PEi0hg1AW3Blibn/VrmFXkMoLaKOlG/x5g+Z2dD1v1z3E3NYzWIgxD72qSvbYnr8jEtYnKpe1CI0jkS+tku092V4mr05plArv2v3UofVDZQXp3ZKpIF1UR4S7N2KeAxl6vS64yLxyHweTQ9n7R0/eKr9fQw2TmyXKJQfr4iC1E0+QtYa/6G6NNUBOp3ArN5p9/my/OxKS7HJEc54FEc1IkLSvvNmY9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioajlhNZoFEW5KJLhX7iGyAz3D80wRbAuM7dyJdWiSg=;
 b=LhNNP1bnODMe3oIkvg1+e6NRHmv3nPtAL6IQn7kbXlKIbORsetLQJhKdHiZykHXpXVfqqGIutgKJnybCdMnTsK1MsDTFrOeen4zKxAW1meKr2AMZsvXfib/4TtALd1UjsGooZynrtzPf1Sl0yCH3lOknz7JOTHcrHEsOcV+3PnbSUjOvEa+r6f5ZgYhMGxfq5TYCvgd67UDIBIhO9NCxaix5Nu2tXcJEnaQ7x4+ocjbZm/M3GySvvvL3oSiZ/ipnPGzQXxzaFnfJdXdC7YALllqIKjGpKvO9GcoQ4BUDvfeOMOJVM7kzXbymRDrtz4eiKf2OoWUccIMUTP3baSgY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioajlhNZoFEW5KJLhX7iGyAz3D80wRbAuM7dyJdWiSg=;
 b=ZmIpstr/0C4N2okoLBV/Wva4miv+nsIdNDZdSP3edKG0rFHQRE37tvyBXrBAoMAeVygEWlPZ5dDYuc/xOX3cU/2rzSWexrBNxwczs0HNLVYqSY4JwY+OYSwZuAUq7bS8KEJv9CxjKLSVhs4Jwl42Dd1Qa/4GlXgoui4344+4XKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 18:15:49 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 18:15:48 +0000
Message-ID: <aafe2c29-08bb-4e0d-ac77-330749445fd0@amd.com>
Date: Thu, 9 Jul 2026 13:15:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 10/15] fs/resctrl: Reset the kernel-mode binding
 when an rdtgroup is removed
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
 <89a5b2cf3b727d04591d49775a88ba38be57a5f9.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <89a5b2cf3b727d04591d49775a88ba38be57a5f9.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:610:4e::28) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9d4a29-15d7-4795-7729-08dedde61a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|6133799003|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	I7JHjHmlJXVBQoTP0zdmWBkmGxIdYNK1FmGPy0XbbixIaYN8aZw8/jWajQNtSIEoldNrDLAc+REJSRFldgHF+Ug3zDRyBxnloNPmwoC8jFFZV9PeHov2S39jrMLkpvp5Lv6MEPHZo2v6pVNE5D9iqpGB0dwvBzbItZDT2cRl1tDd+hSSi/xhBE740GxRCjhX6RqVX+hIbh8dmogRWHCHIs7TqcwCe0wWbmH0hhxppsKoPhPbzpHoydjv+iWURCEgan8LCo+1MEq9W6qVA45WCQaYXN1jhIPSLmHfx5xTc3N90EVC2QslrTQAsov0VkOm1PE+ASd46JNl11VHLikcOivH4o5FI/GZha+5wsPo01S23SrmDzlIyH4RBggk7HH6N6Bf2GobtJUN5fJW8mk8kR77QyQhm6IhqWLzEF2VkEhyA0T48VMeTFrKPNvrFMFOixSEgEzy1TVxv1yd9jYxA4N6E2D16W3V5KER9e9LrujyQx7TWtz3rGRiv6mf534mme3c2YlQcRwKKy1VYZDqWWqxAO3k3ZFJGqNB9YKAVlY0rbtKMejvkqF/Se7Hh5Ck5l5l0ne7/OwHxvFOdrrn3K+xeINwvrSaEp3Es5xYClI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDVNaDhyS0RIOFV3NDBqUzdMY3FkZ0F6dUtTaFVHMVFpMkgrL3BCd3h2MXJ5?=
 =?utf-8?B?c3NtTDA1ZkNqSlg1Q2VmellpUmkraW01VzM0ZDhlUXhTTVM0WGppL21zV0s0?=
 =?utf-8?B?Uk82S0lhanEzYy9DUGM4aWlhTEJtRXAxZnlNR3lXNlkrUEFub0t6eHRTcTBt?=
 =?utf-8?B?ZUQvZnV3T1VaSHdLVmdMaGxtTWZiR29WOGE4OU0rSWpmNzBHekd6ajQvakJY?=
 =?utf-8?B?ZkhCNE5FUm5FdXdoK0s4TUc2eHpOTHhiSnBhTDl4bERaNkFhWGxyVUdxSkxm?=
 =?utf-8?B?TFM0UkRCVjBaUFoxQnB1RGtJeTdUQlhQUExvNjlLNWZvQnczdUwyMVprd3RP?=
 =?utf-8?B?NVRlSE9YM2s1NnpRRVNRd1JBNjNLWWwyYXF5c3lTQlRNcVN4bXFRb09SV3pz?=
 =?utf-8?B?KzEvZEZkNGpCaUxDT3h6UDJhbEVmcU54V3ZLWGtpb1VOd3JCbEVTeEhUeVM2?=
 =?utf-8?B?WURPajA1OXZQTitPR3NwWUllMUYyazBXN2JCcG5YNm9HZ3czY3BtRGZzdExa?=
 =?utf-8?B?cG8xaHRnM0pzaHNlbDA1cHZFWlJrN0JBNnlaY1VsNkNFYmc4Rng0QVRNQkpP?=
 =?utf-8?B?OE50OWI2VlowRHlSdSsxZFoxU0x1cGZZRUQ4bHJ6WWdqK2I3VGV5Y0JFdm1X?=
 =?utf-8?B?SSthWVFTNXNKLzUwdkVOaVhPdXB5azA1aVFJc1hOdEdFM0xCMC9iQjY0Vlo4?=
 =?utf-8?B?TGlmU1JkcTVZWmRNNTJPenk1ZjZrdnVNcFlMYjNzL1EyK0ZUcWxlSlZUeXlF?=
 =?utf-8?B?eVFWSzNtclJTMkpZNkgxaTJPeGR6a3RWcCtYWGZObmduVkVhRGlTWjl1Tktm?=
 =?utf-8?B?T1F3Q3hGdll4aDVGenpOTUZmRmdnUWQ2NDhSSi9UNnBSazJEZ3Vld2RXNCtu?=
 =?utf-8?B?K2VhTGk3QzVvdU96SVRzbnVieU1OY3p5alRLdFRHSzlyTFBzZkFlNjdPSnJR?=
 =?utf-8?B?QzlkRXV0Zi80YXJFeDc1NjRtTVZMZDZkZ2d5YzJBMGlNcTVyVE5YNFZhVXZ4?=
 =?utf-8?B?bnl1MUZ3NkZ2bEFDVmV1bWs5VzlGazFXc2dxQ1g4QUk0M3RGL25VVXZTZzdv?=
 =?utf-8?B?QlphdUd1WXJYYTlKbFNnaURUMnFCZ3pTamxJZXQ2TEZVZVZEMzdXNXFVU3ZT?=
 =?utf-8?B?ZjVQU1hWUWFIWmgyQ0FiR25VdlhCTU10ZzhseDc3UXFVc0cvL2NsbnB6b0hm?=
 =?utf-8?B?THFwdVhJcEMrZDRKL21pUEhJNHlwNTFXTXVDTG50NUdTdkJYV3JMZ1pkSzZG?=
 =?utf-8?B?bU44Rkd0RVpTK1FjMlZXTzNyV04rUEZaTVRRU2krK21DekdPL0dTTTdtWXJL?=
 =?utf-8?B?VnJqcnlFaFIyMXMwVXFPUHFodnMrZ0crdWs5OWpSd3RZTzNWWHBLSytRUmZs?=
 =?utf-8?B?QnlwMWVsK25Zay95TXN0b3MzOFRnbk90L0lKUjlNdlkyY2M4dlg5Sk5leWFN?=
 =?utf-8?B?dFVFRm5sNXBUeEVyTlFDdXpSSHRKZlBZRnIvVDZibjhaNUVMVVFWWnpQUGJE?=
 =?utf-8?B?WUM4em05eHorbjR6cGhUNmlHSmQwQVNaakVnREFyZWY1dzhaSlhmU0dPOFNZ?=
 =?utf-8?B?YS9CZXV3bDVZSGNrR0RYeEdyR0JtSWdDdjZJYjB0UHFJbitPR3lwYTkrQUpn?=
 =?utf-8?B?aGpRTmpubm14M1FhUmZSL3VGZUlDNlpocDdSbGJqOWJGbmVHaWQ2WncwdjRm?=
 =?utf-8?B?dDVWMmxKZTVmM2V2cm5URkR1VXdla3lvVERqREVKZnhaYkxldmJqbExmQjBS?=
 =?utf-8?B?SENLbE03czhVNmxrOS9sV2VjOWxaWFd2WklhcXN0aW9RT0Y5QjRvZkt4d1hl?=
 =?utf-8?B?amdNdVBuYWgydE1MYy9OMnpGQWtXRXlRcEdaQnM3NTVYODc2TFRFYkgwWVk0?=
 =?utf-8?B?b0tXV09aWFQxV3Fub3F4TWpESGpobmFxaDEvVXo0ZGI4WVBqTlJZdVVtN2Fs?=
 =?utf-8?B?QnMrR0R3bHhTUkN5ZjJmWGJ5SzFxdmE1ajQwZERNOVBZdFgzMUFldldPSWYz?=
 =?utf-8?B?OXVQeU11SkVYbzFZcFNsWjk1L09vUDJrTkIyeXg1VmlZMHcrRFM1a1R2amdk?=
 =?utf-8?B?cENOSWN3UzZxRnhkdndSR3kyME5PQjNvdVJRU2t4QVA5K3Fla0xvK2o5WFho?=
 =?utf-8?B?eFFyMkt2Z1U5eTJQZktRY0Z6a0ZFL3J6SlR0SzM4S3BldE45NVNNa0dJaVVN?=
 =?utf-8?B?VEVIVGhDMDBia2JHc0RCa0NyUDV0Y2Y2T3BzNWVNMEh6Y3ZrZUY1ZTU4ajhR?=
 =?utf-8?B?TlFKV29DTklOb2NrUVZUQUVCc2xEMjNxVC9vZmp5U0VKdVlvTjJuWHFRcTY3?=
 =?utf-8?Q?JHtUL1tw+SxTJZAkgw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9d4a29-15d7-4795-7729-08dedde61a18
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:15:48.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXEFcbuTabAKrVcYCOIkvGSG98IsicV9JSvFy9L2KO/lN5i0Xt7TsEeJho5BY3uc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470



On 7/7/26 16:50, Babu Moger wrote:
> Resctrl keeps track of the rdtgroup backing the active global kernel-mode
> policy, including the group's CPU mask used to program kernel-mode
> associations.
> 
> When that rdtgroup is deleted, resctrl must update both its internal state
> and the hardware configuration associated with the group's kmode_cpu_mask.
> 
> Introduce rdtgroup_config_kmode_reset() to disable the active kernel-mode
> association for the bound group's CPU mask and to clear its kernel-mode
> state. Invoke this helper from rdtgroup_kmode_detach(), and reset
> resctrl_kcfg to INHERIT_CTRL_AND_MON. Ensure rdtgroup_kmode_detach() is
> called during group removal and filesystem teardown, before the bound
> rdtgroup is freed.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Re-wrote the changelog.
>      Added the call free_all_child_rdtgrp() and rmdir_all_sub()
>      Simplified the code comments.
> 
> v3: New patch to handle the kernel_mode clean up.
> ---
>   fs/resctrl/rdtgroup.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 0d5c94169d03..21659fd75850 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1127,6 +1127,61 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>   	return ret;
>   }
>   
> +/**
> + * rdtgroup_config_kmode_reset() - Tear down the kernel-mode binding on @rdtgrp
> + * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
> + *		May be %NULL when no group is currently bound, in which case
> + *		this is a no-op.
> + * @kmode:	Kernel-mode policy currently active on @rdtgrp.
> + *
> + * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
> + */
> +static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
> +					enum resctrl_kernel_mode kmode)
> +{
> +	bool assign_mon = false;
> +
> +	if (!rdtgrp)
> +		return;
> +
> +	if (kmode == INHERIT_CTRL_AND_MON)
> +		goto out_clear;
> +
> +	if (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU)
> +		assign_mon = true;
> +
> +	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
> +				     rdtgrp->mon.rmid, assign_mon, false);
> +
> +out_clear:
> +	cpumask_clear(&rdtgrp->kmode_cpu_mask);
> +	rdtgrp->kmode = false;
> +}
> +
> +/**
> + * rdtgroup_kmode_detach() - Detach @rdtgrp from kernel-mode assignment
> + * @rdtgrp: Resctrl group being removed or torn down
> + *
> + * If @rdtgrp is bound to the active kernel-mode assignment, disable the
> + * hardware association programmed for that group and reset the kernel-mode
> + * to INHERIT_CTRL_AND_MON.
> + */
> +static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
> +{
> +	if (!rdtgrp || !rdtgrp->kmode)
> +		return;
> +
> +	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
> +		pr_warn("resctrl: kernel-mode group not valid\n");
> +		return;
> +	}
> +
> +	rdtgroup_config_kmode_reset(rdtgrp, resctrl_kcfg.kmode_cur);
> +
> +	resctrl_kcfg.k_rdtgrp = NULL;
> +	resctrl_kcfg.kmode_cur = INHERIT_CTRL_AND_MON;
> +}
> +
>   void *rdt_kn_parent_priv(struct kernfs_node *kn)
>   {
>   	/*
> @@ -3215,6 +3270,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
>   
>   	head = &rdtgrp->mon.crdtgrp_list;
>   	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
> +		rdtgroup_kmode_detach(sentry);
>   		rdtgroup_unassign_cntrs(sentry);
>   		free_rmid(sentry->closid, sentry->mon.rmid);
>   		list_del(&sentry->mon.crdtgrp_list);
> @@ -3252,6 +3308,7 @@ static void rmdir_all_sub(void)
>   		cpumask_or(&rdtgroup_default.cpu_mask,
>   			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
>   
> +		rdtgroup_kmode_detach(rdtgrp);
>   		rdtgroup_unassign_cntrs(rdtgrp);
>   
>   		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
> @@ -3347,6 +3404,7 @@ static void resctrl_fs_teardown(void)
>   		return;
>   
>   	rmdir_all_sub();
> +	rdtgroup_kmode_detach(&rdtgroup_default);
>   	rdtgroup_unassign_cntrs(&rdtgroup_default);
>   	mon_put_kn_priv();
>   	rdt_pseudo_lock_release();
> @@ -4149,6 +4207,8 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>   	u32 closid, rmid;
>   	int cpu;
>   
> +	rdtgroup_kmode_detach(rdtgrp);
> +
>   	/* Give any tasks back to the parent group */
>   	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
>   
> @@ -4199,6 +4259,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>   	u32 closid, rmid;
>   	int cpu;
>   
> +	rdtgroup_kmode_detach(rdtgrp);
> +
>   	/* Give any tasks back to the default group */
>   	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
>   

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=10


--- Patch [10]: [RESEND PATCH v4 10/15] fs/resctrl: Reset the 
kernel-mode binding when an rdtgroup is removed ---
commit 42354ae9f22a1b788ec34201f40310a30c5f5247
Author: Babu Moger <babu.moger@amd.com>
fs/resctrl: Reset the kernel-mode binding when an rdtgroup is removed
This commit introduces rdtgroup_config_kmode_reset() and
rdtgroup_kmode_detach() to tear down the kernel-mode binding on a resctrl
group. It invokes these helpers during group removal and filesystem teardown
to disable active kernel-mode hardware association and clear internal state.
 > diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
 > index 0d5c94169d03f..21659fd75850e 100644
 > --- a/fs/resctrl/rdtgroup.c
 > +++ b/fs/resctrl/rdtgroup.c
[ ... ]
 > +static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
 > +					enum resctrl_kernel_mode kmode)
 > +{
 > +	bool assign_mon = false;
 > +
 > +	if (!rdtgrp)
 > +		return;
 > +
 > +	if (kmode == INHERIT_CTRL_AND_MON)
 > +		goto out_clear;
 > +
 > +	if (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU)
 > +		assign_mon = true;
 > +
 > +	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
 > +				     rdtgrp->mon.rmid, assign_mon, false);
Does this teardown properly handle offline CPUs?
If a CPU in rdtgrp->kmode_cpu_mask is offlined before this reset is called,
the underlying IPI might skip the offline CPU, leaving its MSR unmodified.
When the CPU is brought back online, clear_closid_rmid() clears
MSR_IA32_PQR_ASSOC, but does it also clear the newly introduced
MSR_IA32_PQR_PLZA_ASSOC?
If not, the CPU could resume executing with stale Privilege Level Zero
Association state, potentially causing incorrect resource allocation for
kernel mode code.

----------------------------------------------------------------------

Yes. This is an issue.
Need to clear the kmode_cpu_list if the cpu being offlined is part of 
the current kmode. Also, need to disable PLZA on the CPU that is offlined.

Will take care of this in resctrl_offline_cpu(). The changes will go in 
patch 11 (Patch 11: [RESEND PATCH v4 11/15] fs/resctrl: Program 
kernel-mode binding when CPU comes online)



 > +
 > +out_clear:
 > +	cpumask_clear(&rdtgrp->kmode_cpu_mask);
 > +	rdtgrp->kmode = false;
 > +}
[ ... ]
 > @@ -3215,6 +3270,7 @@ static void free_all_child_rdtgrp(struct 
rdtgroup *rdtgrp)
 >
 >  	head = &rdtgrp->mon.crdtgrp_list;
 >  	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
 > +		rdtgroup_kmode_detach(sentry);
 >  		rdtgroup_unassign_cntrs(sentry);
 >  		free_rmid(sentry->closid, sentry->mon.rmid);
 >  		list_del(&sentry->mon.crdtgrp_list);

This is a pre-existing issue, but can unmounting the filesystem lead to 
a use-after-free here if child monitor groups are present?

If the admin unmounts the resctrl filesystem while a user process holds 
an open file descriptor to a file within a monitor group directory,
resctrl_fs_teardown() calls rmdir_all_sub() which calls
free_all_child_rdtgrp().

A few lines below this hunk, this function frees the monitor group 
(sentry) via rdtgroup_remove() without first calling 
kernfs_remove(sentry->kn).
The sentry->kn node retains a refcount and remains active in the kernfs 
tree. Could a concurrent read() or write() by the user process access 
the freed sentry structure via kn->priv before the tree is finally 
destroyed?
----------------------------------------------------------------------

If a user process still holds the file descriptor, the waitcount is 
non-zero, and rdtgroup_remove(sentry) is not called. As a result, the 
sentry structure is not freed.

Is this actually an issue?

Thanks
Babu
