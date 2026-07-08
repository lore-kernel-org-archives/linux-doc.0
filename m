Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94973ED3CD;
	Wed,  8 Jul 2026 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783544205; cv=fail; b=l6yHSnVpsCTX7IcgJgYHXH/+iIXAigUPlFi3qm32FjoXqt4zdcLRN/LNhnCAMRUggZcMgilFK0T6AygIL7CX+AQerPiCRj5gjBu8K8F/0lJdmM1bGSnE8fPsBBVJor4lV2ClFGdZOPSXeJzktX3IcGDJhsvQRHwPtwhSuhCc1T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783544205; c=relaxed/simple;
	bh=in3DWATj8cvvt2hck8UKopL1HkzkfawoQKPzVxdg1kQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Znqudbpt1z8vctxBht8BQPNGYp3JhFYkuBCfhwgDl8EwjX4Xgu15Q7DmHggiGu8WKJKPnPli3Szbde9VrwHI4GoYhF2ieITD7ZZ3/zOZ/M2vaUn93SFaWsO8VqTviHAxiLzhZjhTrZj9ljnMhFeFvN0GyvC7Y7njcFZsI69N0vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2OISmJ/X; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2OISmJ/X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TI+NlvQbc0uHaLLpgPNNLUDVBw1ECH4+JjfpMCRL7wIjDReTQ4qWIRbVXAZnVaU3rqL5DxKjvtJ1IU+rD46vaCjw4haUwbdDcT0FO/b/ynuNE/TEUTBUaqc2h/M8qRZPOAYP1FoiglFvavHQl4qypIVXFJrvZTpZ8BAjDpkkJnRHAoLiAOJMJvDheHedbnvDcjV0av1ZlKqP0cROmnEDI0CVfzliCnycKGftV2RwzdilAIMpWwQxVrKdF9B3T4i5ZiW4O7W4qtKKTu1NIbPVJTecWDYhM7ljBljLgz641T8su3iiOv3DPFhLOFmbG/qyJOO9+TFI3RZfA26HZNUVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XM0tnYGXzOF8NvQCkjAio1ichZeL1rxHoFoAIc1PdI=;
 b=uZQYlN7L1gVENkizZibIfd6RqbEFX2hwuFXhB++XUXhlDCd++8gYjeUZT3dWkqjf1KFaASy0s5bvTdjMAD7wA/dQ09tkIOgxpb7cHIMcy59uvf7CwNETUdw/rvGriCv5C8t3QUqRUkDv2YeelKJbjSdY4UncO2wryfNhpm9t74etGooNjYW2qhPc6eRbVNC+bIbckhJLo1QqEm39QtfLx8zJq5YhHbrK25lyzHkfRu55gaQfEVZBoLmmswg08QAjYYXiRqCY/+8dkz7Ia+F85VNPrmDU4S7791kW8kH/Vx7yvxvgkCn9di1cl5z9+Lg63CvDsU+Q8UubBEmJwgoeqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XM0tnYGXzOF8NvQCkjAio1ichZeL1rxHoFoAIc1PdI=;
 b=2OISmJ/XoU9IfgmQnSWWgCKf3npS6VsT9ekDE/mn1s5/uifc3TMLYe4/S2q03T23N2MntlMw4hvFWHf19NYtreiLrNrKTlMJNV0umHlXYnkSg9Ct48oX7wJ7ynSVC/Ya+XcDTVw01dvHVpkbzpsJZQXwhYXxXnBledOBzC5rbW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Wed, 8 Jul
 2026 20:56:36 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 20:56:36 +0000
Message-ID: <870eff54-6faf-477f-8242-e5f266eddf94@amd.com>
Date: Wed, 8 Jul 2026 15:56:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
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
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH3P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1e8::11) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH2PR12MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: c46994d4-b11e-4452-6a1e-08dedd336636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VitX70BbTMLZVfeFMrVUCTEPWKH1jrn5eZc4QLc30rBHNnO2JTjZ5ttneIiPfQJsR5q4xuyjQQZ8ef8wBM9dThUknk1FIPXD8t+Q64NFJfdiQ/yL9jvmRiwZDHZlwRIEPh3kSc8xNYlA5qTyFMlfIMijU1lDW1iHvRm1XcewkZ4lK268YTZZULq70LLTYow/W/NhU9VUzVkqOHxRv5QMsZZv9D7y9eXsPDlUZgWPVYJM6xM89kSfsgBYhxMffC5I/Jt+BGaGZzkqGHVUFt3AZOERRtNsSLuWlOYItDMaKIl+g4PpZX2soENbDn2HP3YS2N3b9W5qvFMgWWbgtEWqzkWNH9w/gj6cPZvQ4JuKkoAFFp/nbahNbiz7G/T8vm5gc7Tru3+lOvN3jUJAhJAimF2PfpHw0rZxLEotbt9MmhGbZbkLVBfgrUA0zMVMOSfeFJF3V5U655wN1aOkWdxFtYRcFzNpAMLSOSgpII0sCKxEzOPeEqhNMaHKe5BdVkgvr1jlqCiUYT0BtqGlVggnvmimWUOnrEdU2iGp0hOcoTDeevbSXUNVv/0+HJwhZC6za2D+t6g8ze0P5ac7qG+9o+3rtEU2Vn3lplUJ+pQS7jo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFUzdUN3MHMvWXRMYkx3S1o2RE9CKzlpRUg1SUVtUUs3VXdMTVJqYnR3NXN2?=
 =?utf-8?B?VTdENkkzNUwvQzRVMkdzOVVNRi9yd1FBdjkrd0JVbTlTT0xLM3gxU3ppeFcv?=
 =?utf-8?B?M0w0YW54K1l4K1dTSHNsODk2eWtudHREajlXaWJjVWwyOG1sdU5ZemxHVzZD?=
 =?utf-8?B?clBrd0lmT2VyUXpmajZGUDNUMzhCbWdyYTdTYm5na2NIam4wb1JITkR4dU55?=
 =?utf-8?B?WEhSNVpZbVlCOFlXd2t2cUZXb2tyZFJQQU9kVnovZWgzcmtmY1pUL251ZFFF?=
 =?utf-8?B?UG1vVzFlR09XSkIwVENXUDVLZngwRkR1THNxWFI4MmJERXkwVVkvMTRCeHhV?=
 =?utf-8?B?SzJHcVhSOUU0a2VYNXJzZXVNa09TV293UUhUSGpXT2N5c3NvbldWZm50UWx4?=
 =?utf-8?B?TXdUdE5ha1JWaStYSkN6RytaTUtGQUNwV3MrbU5MZVlHMTdJWEtLN1B6M2t3?=
 =?utf-8?B?WFArUVB6T2h0RlFMMkN4NWZ5dWd6bnI1SU5ZZ0ZBanhQb0VWZmJqdU10SXYw?=
 =?utf-8?B?VTFJZE5xQ2JpNDQ5WGVuRmMrOGNYQUJCVUhPUGpnTk42QngrU3dHc1M2d3Bp?=
 =?utf-8?B?a2JQUndueHR6Z3Zjc2FEdko1MGswRjhhWjVxUlJ3MjBjM0llRmQvRjBDVHR1?=
 =?utf-8?B?UGgyTVVWOU9KQVVZMVVNRU96V2RoWStmYmQ2R1daNDZHZEVyUDhWRDZieFBZ?=
 =?utf-8?B?M2lOTXgxZ1p4bHZiVTg5bFl1WDFuZkFVdzA5MkdNN3hGMjRxWlBzbEdlaXZy?=
 =?utf-8?B?RGJ3bHVIdS81Wnl4eWJXZ3BxSjdDV1BEbTBETENuaGxpSzVLNVkxVU12b3ps?=
 =?utf-8?B?YTJXaXdZU09oMHdGYzZBb2ZpZVJ1T1ZrN2c5MWhMclpyV0pMT0hwWDJaelcv?=
 =?utf-8?B?MXpQYktjZmdYVTArR092VzhQSi91WXFCK0VnNFAvekpYWGQvR3phTmlNUjlO?=
 =?utf-8?B?SHV4NWFEMmpJcjRuY2hXSEZiOUhydFQ5cCtPd25FQlpZbU5QeTNqMHc0Qmt6?=
 =?utf-8?B?NklwZTA0MUdQREYvV3A2MTBLWXE3QmltdTB3RWFNa0NDVEp5VEZWbmhmWCs1?=
 =?utf-8?B?SXF3MlhJSGprQW83K2E2MitQQ1NIcHA1YmhHSjBkdUlySm9LcWFNNDdzNHpL?=
 =?utf-8?B?bnhPTjZWSkkrcGlaSnJFOVdaRHBwV0RpNTF3MFZvSi80U2wvNVpkdG9NR0hi?=
 =?utf-8?B?L1VKdE1hbWRUMUtmaUJUbkJTc2NjWDV1cVlRam9qQ2JpV0locGF5Z0hsQTl5?=
 =?utf-8?B?UHNyKzdlQlBRclRKK2QxaGNjb2s0cG1xUjBvZlVxOGtPcnZLdjNpWFpyOGIv?=
 =?utf-8?B?NGpMeW9aQ1NxWlN0Wkl3N3gvTytEZm51cmhtdGovOGFTanFTZDgwVXJ2Skdt?=
 =?utf-8?B?Q3NOY2xrMmNMWXlDbkVZVUphR2JHblVQcW1KMzFRejBSVllJaVA2dW5CZ2k2?=
 =?utf-8?B?cW5FK1JOSUtrN3MycXg0UGwyc0RNQVlYNUM5OW5CS0VvdktmSHBDWXFhNVUy?=
 =?utf-8?B?SlMxQkJnOU1Fd2daemZmRXdGOXJPZlhXYUZwWHdOelhNNkFrUXJkQ1pSdWI0?=
 =?utf-8?B?TEtkbXVjYkJMTHJoWktQTk9GNGtkeFZoR0F2OHgvSERLTjRmRzEvcjJJL0Ew?=
 =?utf-8?B?MDQzYjFqKzRObzNiZ2IzcUR2WkdWS3Z0cjRKSDEvQUE0TzEyT2F2dkZ6Sldz?=
 =?utf-8?B?N1ZGZjhxbEFhQ20xTTlma2g5ZGZ0RUV6MlFuNnlLcDVxK3BQNnlFaTk1ZytV?=
 =?utf-8?B?TEptNm9SSjhQVFpFSUg4MkVRZE5NamFBbXFhRGx3aE5UVWFtSnZocldPb3R2?=
 =?utf-8?B?cHZIcFJZbUVhdHU5WUZBR3Y1alVlWEFncFBKaTdOM0lXdkZOY09ORmtCNE9r?=
 =?utf-8?B?VDNDeUNnSVFkNjZiVmEzQTFKQ090VkZYb3pnVzNwNUk1R2RlYUJUMXVrQzRY?=
 =?utf-8?B?KzJsVXhYMU01R0FQSHhoU0JneWtJR0kxVGs4M3BlNnlBQngvVk5KYjB4S1ps?=
 =?utf-8?B?V2U0TElNcys0L2NPY1B3bXQ1S3NWdUVwLzY3eUFyNFp3VDQxUXQ3RkJRZ0lQ?=
 =?utf-8?B?ZHpyOGhUcHd3cHJLckkyVHNjQlhvT1ZSZjA4V0lCRFJlU2JYY2pYV1RVZFNK?=
 =?utf-8?B?MmJSbFJsVm5meGx4Tys2NlMxL2hyWENVZU5TcW1SMjJIanpON0NmNFBZNzRP?=
 =?utf-8?B?bi91ZE4vZWJ4dmpXTThjVDVyZFJsenpVYXJtWk5tV3BuMFE2TXQ2VVVJMnIw?=
 =?utf-8?B?ME9nYSsyMnlTcnZyZFRiSkZKTkRlRmJ5V0RBc1V6Q1BlWkZRV3lRZlNtNHN5?=
 =?utf-8?Q?nwj67hJUSzwc3kvuh/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46994d4-b11e-4452-6a1e-08dedd336636
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:56:36.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rE0sknTu+xJTgKEzNsfLhigflLjdS8X0KrSe9mZvIuM4OhSkYun4iiEHPztkmEgW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087



On 7/7/26 16:50, Babu Moger wrote:
> Kernel-mode traffic can use a different allocation and monitoring context
> than the originating user task. On x86, Privilege Level Zero Association
> (PLZA) enables the kernel to switch to a different CLOSID (and optionally
> RMID) when entering kernel mode.
> 
> Architectures need a common way to name kernel-mode policies before resctrl
> can report what is active or what the platform supports.
> 
> Introduce enum resctrl_kernel_mode:
>    - INHERIT_CTRL_AND_MON: Kernel work inherits allocation and monitoring
>      from the user task (current behavior).
>    - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: Assign allocation for kernel
>      work; inherit monitoring from the user task.
>    - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: Assign a dedicated allocation
>      and monitoring for kernel work.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Updated the changelog to be generic as possible.
>      Moved the enum resctrl_kernel_mode to include/linux/resctrl.h.
>      Updated the code comments to be generic.
>      Removed resctrl_kmode_cfg from the code. This definition can be fs
>      specific only and architectures dont need to know.
>      Changed enum name to resctrl_kernel_mode from resctrl_kernel_modes.
> 
> v3: Removed resctrl_kmode definition.
>      Changed the kernel mode definitions to enum resctrl_kernel_modes.
>      Used BIT() to set/test the features.
>      Added details to changelog.
> 
> v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
>      https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
> ---
>   include/linux/resctrl.h | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 73ff522448a0..c7abed51cd5f 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -703,6 +703,37 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>    */
>   bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>   
> +/**
> + * enum resctrl_kernel_mode - Kernel-mode control and monitor association
> + *			      policy.
> + *
> + * @INHERIT_CTRL_AND_MON:
> + *	Kernel work inherits the allocation and monitoring from the user space
> + *	task. On x86 this means that kernel work shares the same CLOSID and
> + *	RMID as the user space task. This matches today's resctrl behavior.
> + *
> + * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> + *	Kernel work uses a globally assigned allocation while monitoring is
> + *	inherited from the user space task. On x86 this means a CLOSID is
> + *	assigned for kernel work and the RMID is inherited from the user space
> + *	task. Default scope is all online CPUs; a subset may be selected via
> + *	the resctrl group interface. A CTRL_MON group is bound to this mode.
> + *
> + * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
> + *	Kernel work uses globally assigned allocation and monitoring. On x86
> + *	this means both CLOSID and RMID are assigned for kernel work. Default
> + *	scope is all online CPUs; a subset may be selected via the resctrl
> + *	group interface. A CTRL_MON or MON group is bound to this mode.
> + */
> +enum resctrl_kernel_mode {
> +	INHERIT_CTRL_AND_MON,
> +	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
> +	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
> +	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
> +};
> +
> +#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
> +
>   extern unsigned int resctrl_rmid_realloc_threshold;
>   extern unsigned int resctrl_rmid_realloc_limit;
>   

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=4

--- Patch [4]: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode 
(kmode) data structures ---
commit 1114f46dcb9c990326351e5e6fea6cb114024be3
Author: Babu Moger <babu.moger@amd.com>
fs/resctrl: Introduce kernel mode (kmode) data structures
This commit introduces the resctrl_kernel_mode enum to define policies for
allocating and monitoring contexts for kernel-mode traffic. It enables the
kernel to either inherit contexts from the user task or use globally 
assigned
allocations.
 > diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
 > index 73ff522448a02..c7abed51cd5f0 100644
 > --- a/include/linux/resctrl.h
 > +++ b/include/linux/resctrl.h
[ ... ]
 > +enum resctrl_kernel_mode {
 > +	INHERIT_CTRL_AND_MON,
 > +	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
 > +	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
 > +	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
 > +};

This isn't a bug, but does this risk polluting the global kernel namespace?
The enumerators INHERIT_CTRL_AND_MON, 
GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
and GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU are defined in a globally included
kernel header without a subsystem-specific prefix.
Should these be prefixed with something like RESCTRL_ (similar to
RESCTRL_KMODE_LAST) to prevent potential name collisions with other kernel
code?

Yes, agreed. These names need another look. They are quite long, and we 
should try to shorten them without losing their meaning or context.

I'm looking for suggestions as well.

Can this be something like:

enum                      sysfs
KMODE_INHERIT_CTRL_MON  "inherit_ctrl_mon"
KMODE_ASSIGN_CTRL_INHERIT_MON "assign_ctrl_inherit_mon"
KMODE_ASSIGN_CTRL_MON "assign_ctrl_mon"


CPU scope is already handled by kmode_cpus.

Thanks
Babu

