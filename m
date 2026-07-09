Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B74315F;
	Thu,  9 Jul 2026 22:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783637198; cv=fail; b=h8OsDr/Hn+DCvjM+lABuJaMpUhxO8nvNTKMhZkVLyLpunNHe6a4X3bnL9NTtwrTECWFgnFCgLj7yayIikV+IgfQpY4MuiSwK+tlL83+wZbFmjfmtEqK2TgsVhxLyOhPsv913X49a+a91DJRZV0o6Ol1azk75R0AM4xHd97g1AR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783637198; c=relaxed/simple;
	bh=0bvPOCyg0RFNsQ3+zYbsNKtRqg/Slb9i2Ge/hA0oE2U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RJBClORJ7wSqzbJzdxBeeEzRykW+rgv34bEBIZNwECIJQqnWeWZN5N4/YeuJPqPSmShqvdBsZcd/+bewp6FzH/G7A/lXpXVoJ5F7Q1GhlpDmkkeA7GmykRntD4JgEOP0jnb8M5jXJCwqDku88fmFRXUDuJr5YbnGKK6vILyrWrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gcgwFgBZ; arc=fail smtp.client-ip=52.101.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gcgwFgBZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+i66ZrY0FFAKohwBe8TmDcJEVjbs5m9BzKOYAkLGg1NGtoQ/hSz2TbJv2AEyuyD2PYkaLodQ+iF0J6z1aVFTUPn0nsngwEOr8a+iOHObkxHz4Di57s2UvACyPY+Z84W2TiFmvNcpnbZtZ8n23JZdm+56N4EBQ6LYk7PxZiqi/w24ZxaML84p7IdAMAgdLRs0a18aNQnbzyP9m+j3tNUp0pfgmgiBboUFEMgpJLPzsWtbIihTOUWT8tXa9/zboNBj1+3ZrEPMFLy0RiomRy13Mr9nGSZIv6QKr/Lbc0n06xsFTJ39Oq4uBxSsrFk1BY1+fp99OopncvZZHA2J1RD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhYg6wFmiWNg0GuQsyXA7ZZ4B+sV48BYQZU3GjDhIxQ=;
 b=FQsEqwNQx5NNXVxgMgh4AAiK/m5aF+/lT0lkvLbsg75Nxx0MQhk+bxewF+Q+5wUnMmNcOtx/5gQZdOp1CczIUBZm16h4tOicqNnls3nbqgx/9BMxaIKzStKUOJX7dFVP3KDZmq2GiONwdC8GLP7ryKYCKAkLqUyksY0p40D6cVynJVDt7Fiwk+s3R2b6/2ZnSoNeaan4wYHQ3Njvi2Q1x6On+ytIE8i/zO0cpwDNo6S1gPZibxLDqyTxS3zWBl/NtKF70axtDwgaF7zCXHb0y025s7UiF4bLfZ01MaRdcmOLkVpmN9bO1jug/qjPTpp3tVjbXic1OMg3O08Mf9w06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhYg6wFmiWNg0GuQsyXA7ZZ4B+sV48BYQZU3GjDhIxQ=;
 b=gcgwFgBZxp87eDnQ23B4DRGJHijQeD3VjogrMQC0skabwGk8Qi/Oy3pPoOmY4fH56fhJ6Ric9LFpcq/viBanwMp8syjA6vgvW7nyAYCr3/+K06j9RYzVcW91g1jMUzN3VzN/6hyJwK8ojIVEmjqNUjbcc+4tSp9q66kWZhImKv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS4PR12MB9587.namprd12.prod.outlook.com (2603:10b6:8:282::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 22:46:30 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 22:46:29 +0000
Message-ID: <57dbf7cd-0197-4158-b022-770d45c0e8c4@amd.com>
Date: Thu, 9 Jul 2026 17:46:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 13/15] fs/resctrl: Add interface to modify
 kernel-mode via info/kernel_mode
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
 <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:610:b2::26) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS4PR12MB9587:EE_
X-MS-Office365-Filtering-Correlation-Id: 140daa03-da58-4755-facc-08dede0beaa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|56012099006|3023799007|8126099003|6133799003|4143699003|11063799006|18002099003|921020|22082099003;
X-Microsoft-Antispam-Message-Info:
	dcNCXLPTJyE/uMn7udQIoF6u5h/blMfZak97PnUoZWZP+78TZz/NO+kjBubv+qREzOsfT8lBuWKPPHlhZlJ7fNNYGkCAu0P4cLmnHF9bgOOtxFSdkSdqFm/L35WKdMCgyXAG0HC51VgrefskY1+bUY/kbytFGtNyFJKdt7SP1FUgXA43mTkIT1EwL5O1ZnFR8yXqYd+g7hFxBwP1UYnJogxDopQN+eURqtskQ3i+at26vU5bXVNUiAUpH4ueDFg2QMSUVDRPMw/m5oKofbMuxJwoysoQTly4KScYshGI/OgWMrEbl0R+O0Wd13Gm12HuEtLgJQD+NT4dl7tm0pexERSSXm4G0w7DdXPy7CfrRFne76MPwJX0UW04r9lA4SaTadsHZBx64j3uNAPaoYt5VLgWmN8Tw27SniimA8mGeOx1i7R1eVPrznJkN4FUAv5Ofu400ROT1p8QYO+n94D4BnO8WioXc2qPQTt79bC6/8ee2kGn6apwxAsSzzkAyzxXC3nJFJClwugzZ/kaxc9ZsejK+tCPZfZpux2p8hv+zuSbHAMGaQeUSS6VnlqW1oRvCGd/41tvSxY4/3KldOe2MPzZYXwmXSq6eB0FrYULH1H+1LhPXOdqSJl7EuoRGTPTSCiXmSxYz5Ko7R2WEKETQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(56012099006)(3023799007)(8126099003)(6133799003)(4143699003)(11063799006)(18002099003)(921020)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGthQlRmZmdKc0xibnhLa1BLdmxyUmttQ3NPYStJOXo3RDI2emhyNFZJVk4z?=
 =?utf-8?B?VmYzNSswVk1JQk9rZjMwc3VMZVY3OUp3eXVoQnhYeXlaU2p2S2JaL091OFFG?=
 =?utf-8?B?cHJKVEZEcXJxaU1HQXNDUjA5L3ltYkNZVm56d1JOMVVyQ1p2OU1qcnZjaFFJ?=
 =?utf-8?B?WnA3MFUvTFhzRDVTMHlBcUJWejdnUlhlcFBkTitrTHhMRy9OaGJjYVVIZGVE?=
 =?utf-8?B?T1NqRC9tNTdEdEx0SGI0N29LTjA3Y3pITS90VWRCZXhQUExLYTBlVW90aGpZ?=
 =?utf-8?B?L3J6cXlTNTV2TXJWSVdoa1dGaEx3STNUN1N0bGZpVGw1WS9WYStDbXJqOHBU?=
 =?utf-8?B?ZHIvZTd4MUY3UHdianBCRUVLc1piSXkxRE1nMlUxNU5NcFQrTk0xL2xVQ1c1?=
 =?utf-8?B?Q3FZbjBvZ1VtTnhRODR4MVVuVVZZQ05iNWFpaDZxNCt3c1E1akdRbDg5ZkMw?=
 =?utf-8?B?WFpQd0FaMFlBRkZPcWdBVE9oUDRXNUNIeHkveXNGYU1QS3NaaW05TXVJVk41?=
 =?utf-8?B?L2RKRU5lYzFmSWNycm9ObHIxai9GMUR2ZjBMdnY1R3o0ZDRoeTBzbk5RbHZS?=
 =?utf-8?B?NkkyOVppbzN2aDFBaVNpSHNGYU5BdjZVVi9sM1VnRGNtNERtS1BIOUNGS0py?=
 =?utf-8?B?QTJTcmFZQjZlNUUvSnJydkZhYW56ZE5OTWJmRDFxNS95RXZjeFdmWGxIbTY5?=
 =?utf-8?B?TUdzWXRvMzFpUkpuT0E3OXAxN0lCWmx6d0dCNGUzcTAwb3Q0Qi92RWFiby9w?=
 =?utf-8?B?eksvMmVpS2FJMW5RODd5bWtVbVhFSXp6WlJCb0F1dHdMQlFuNCs5eWxpcVdH?=
 =?utf-8?B?YmlwdWFPbVAwVVdmQUhkY0txTnpmc2UrdWQ2VkxSTG0wYUIra3VkeE9qaFlK?=
 =?utf-8?B?UXBTS21OZThlaHlNZHE5TVJZV1RLUVplOWQ2dkpTQzVVQ21YV3pYaXRTUjNt?=
 =?utf-8?B?UUUzTWxla3NzUnFlWTlKNDF5djdSY1JjVklsVFR4dHhJbiszZFNwaUQvSU5O?=
 =?utf-8?B?d0djNUhBY1RMcU53eUc5aW1FWE1LZUIwNC9tUnV2dHlHTkJ2WXZWVHI0RDA5?=
 =?utf-8?B?S2ZUYXVna091WHRsWDRsMVVQanJkVXE4TEJtNWg4UzMzV1pKQ0pIbXQvMGQr?=
 =?utf-8?B?V3BIbmhZdGp0TXhDaUgybzRraWdHU09mOERQRDdPMUxyQ01QdDlaM0x4a3FN?=
 =?utf-8?B?cjJ5Y3dldGF2Ukp3aUlTeGlGTnlZYXJRb0I0cmZHcDlSRGwrZ0tSajRtR01s?=
 =?utf-8?B?ZkJ2MUt6bVJaM0dJaGQzcFRuY0hxL3N3cXNDMGRhR0ZSeXRBSU5FOHF1TUsv?=
 =?utf-8?B?akYzVmRzdzJMeGx2NkxsR2VqKzdHUWI5MTFaYkp6MkxDUno5TTJ0ZTMvYllL?=
 =?utf-8?B?VFBKQ21Xa0tCV041em9Bdk9hWEYySm94dHh3S0pVVUFhblE5b2h3TmFnRWRk?=
 =?utf-8?B?N1JJeEVLQTJEbC9NVE1hRDRvakZqdkdkdlNzcW5SS0JWdjBaWjNuL1RJMjF1?=
 =?utf-8?B?QzRybm0yemR6V0JneDZjZ1gxNFZ6NUg3WDdLV0JmaGlydkUzU0lzcnlDTXMy?=
 =?utf-8?B?SWZzMm5jSkVEcHlmcnYvQWpYUGNJbDA0dmpTQ0lBNm4xZG1UZFFLNDFiRWFU?=
 =?utf-8?B?K0tvbDY4Wm1zSHV1aG1Wb3ppY0NRdlpFYlFUY2RZMi9TdEZvOXVhaVpneGcv?=
 =?utf-8?B?dTkvVVQzYnhNd2RVNVJoYXd6aWczaDhEYXhwUzZaUWVLQ0NROW82L1hNN3JQ?=
 =?utf-8?B?amdFUXJ3OUxDWGJtamloTE1HaFJWVzR4WWM0Y1pwaUhURVZ3VDJQbnhlUDhy?=
 =?utf-8?B?UVkxNUs3U3g5Z25rTSs4ekR6SkROU042NFZjenoxek9ZTlpoVXNBT1ZFTWVK?=
 =?utf-8?B?c3BidXZuZkYzaDdIaHg3QTUwZ3RZMXpHZ1BOYURwdWxxa0I5dGE1Ym52QUZM?=
 =?utf-8?B?NWhyZDVvL3RUTVRXNnE4dW9sa2lwbEVBd1BSMTdGa0JjYkVLNzgrT3RoMTJm?=
 =?utf-8?B?dFlqdXEyZ3N2S0J3bnN2TFpValFCeEczUTZ0RGxIRVBtVElGS0xzYUdOaFRF?=
 =?utf-8?B?azc4QTI4R3cxYXNJQUJqcmdYQ1VKRFY0OG9sWStBUERTbWRRRFk0aTZleUs2?=
 =?utf-8?B?TVAxb0l5dEJ3VEMyVVJNUFIwNm9qUzlDMU1TZldXMlBRWStyL3hsbmhvcGdE?=
 =?utf-8?B?UmlKZTVzM1FHVklOTXBQWElHU3BrSmRBMEpQMFJEVWR3SjZ0czU0ZUMvaGlk?=
 =?utf-8?B?Tlg4Uk9JN0pOdGtqR25RRlpyK1BoUzFJcWRnUTRicVQzNTJUQ2MrK0tnVnA4?=
 =?utf-8?Q?RFqr2HpBX/+izd9HZU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140daa03-da58-4755-facc-08dede0beaa4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:46:29.7590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VddDEQ/hf7HhYpLku5LiF8kdg13BuzrLk1uaFrkUTroyOgLsA8bKAP2/GdRMQaBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9587



On 7/7/2026 4:50 PM, Babu Moger wrote:
> info/kernel_mode reports which kernel-mode policies the platform supports
> and which one is active, but it is read-only and does not show the rdtgroup
> bound to the active kernel-mode policy.
> 
> User space needs both pieces to manage kernel-mode assignment: it must be
> able to select a policy and bind the global-assign modes to a specific
> resctrl group, and it must be able to read back which group is currently
> bound.
> 
> Make info/kernel_mode writable and extend the read format to identify the
> bound group for active global-assign modes.  Inactive global-assign modes
> are reported as "group=uninitialized"; INHERIT has no group suffix because
> it does not bind an rdtgroup.  Square brackets mark the active mode on read
> only and must not be included when writing.
> 
> Document the interface in Documentation/filesystems/resctrl.rst.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Rewrote the changelog.
>      Moved all the fail path earlier so that failures will retain the old
>      binding.
>      Taken care of requirement
>      assign_mon can be  RDTMON_GROUP or RDTCTRL_GROUP.
>      inherit_mon can only be RDTCTRL_GROUP.
> 
> v3: New patch to handle the changed interface file info/kernel_mode.
> ---
>   Documentation/filesystems/resctrl.rst |  80 +++++++++
>   fs/resctrl/rdtgroup.c                 | 238 +++++++++++++++++++++++++-
>   2 files changed, 315 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index f3e941404967..5a13814d1325 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -528,6 +528,86 @@ conveyed in the error returns from file operations. E.g.
>   	# cat info/last_cmd_status
>   	mask f7 has non-consecutive 1-bits
>   
> +"kernel_mode":
> +	In the top level of the "info" directory, "kernel_mode" controls how
> +	resource allocation and monitoring work in kernel mode. This is used on
> +	some platforms to assign dedicated allocation and/or monitoring to
> +	kernel-mode work.
> +
> +	Reading the file lists supported kernel modes, one per line.  The
> +	currently active mode is wrapped in square brackets for display only.
> +
> +	The modes are displayed in the following format:
> +	"<mode>:group=<ctrl>/<mon>/"
> +
> +	The inherit_ctrl_and_mon mode is shown as "<mode>" with no ":group=" suffix.
> +	Inactive global-assign modes report "group=uninitialized".
> +
> +	The bound group path uses empty components when they do not apply:
> +
> +	"//":
> +		The default (root) control group.
> +	"<ctrl>//":
> +		The control group named <ctrl>.
> +	"/<mon>/":
> +		The monitor group named <mon> under the default control group.
> +	"<ctrl>/<mon>/":
> +		The monitor group named <mon> under the control group named <ctrl>.
> +
> +	Modes:
> +
> +	- "inherit_ctrl_and_mon": Kernel work inherits allocation and monitoring
> +	  from the current user-space task (default).
> +	- "global_assign_ctrl_inherit_mon_per_cpu": A single allocation is
> +	  assigned for all kernel work; monitoring is still inherited from user
> +	  space.  Requires a CTRL_MON group.
> +	- "global_assign_ctrl_assign_mon_per_cpu": A single resource group
> +	  supplies both allocation and monitoring for all kernel work.  May be
> +	  a CTRL_MON or MON group.
> +
> +	Only modes supported by the platform are listed on read.
> +	Example::
> +
> +	  # mount -t resctrl resctrl /sys/fs/resctrl
> +	  # cd /sys/fs/resctrl
> +	  # cat info/kernel_mode
> +	  [inherit_ctrl_and_mon]
> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
> +	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
> +
> +	The modes and binding can be modified by writing to the interface. Writing
> +	one line (terminated by a newline) selects the active mode and binds it to
> +	a resctrl group.
> +
> +	Writes must follow the format:
> +	"<mode>:group=<ctrl>/<mon>/"
> +
> +	The ":group=<spec>" suffix is optional; when omitted the default (root)
> +	control group is used for global-assign modes. Selecting a new mode or group
> +	tears down any active global-assign binding before programming the new one,
> +	including when switching between global-assign modes on the same group.
> +	The inherit_ctrl_and_mon mode ignores any supplied group and clears the
> +	active kernel-mode binding.  The mode must match one of the supported names
> +	exactly, and modes not advertised by the platform cannot be set. The
> +	display-only "group=uninitialized" form is rejected. Errors are reported in
> +	"info/last_cmd_status".
> +	Example::
> +
> +	  # mkdir ctrl1
> +	  # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//" \
> +	         > info/kernel_mode
> +
> +	  # cat info/kernel_mode
> +	  inherit_ctrl_and_mon
> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
> +	  [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//]
> +
> +	  # echo "inherit_ctrl_and_mon" > info/kernel_mode
> +	  # cat info/kernel_mode
> +	  [inherit_ctrl_and_mon]
> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
> +	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
> +
>   Resource alloc and monitor groups
>   =================================
>   
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index c537846d9264..7b06c3b3f00e 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1059,7 +1059,8 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>    * @v: unused
>    *
>    * Displays one line per mode set in resctrl_kcfg.kmode. Bracket the active
> - * policy (resctrl_kcfg.kmode_cur).
> + * policy (resctrl_kcfg.kmode_cur). Square brackets are display-only; writes
> + * to info/kernel_mode must not include them.
>    *
>    * INHERIT_CTRL_AND_MON is displayed as "[inherit_ctrl_and_mon]" when active
>    * or "inherit_ctrl_and_mon" when supported but inactive, with no :group=
> @@ -1068,7 +1069,7 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>    * Global-assign modes append :group=. An inactive mode is emitted as
>    * "<mode>:group=uninitialized". An active mode with a bound group is emitted
>    * as "[<mode>:group=<ctrl>/<mon>/]", where <ctrl>/<mon>/ is derived from
> - * resctrl_kcfg.k_rdtgrp.
> + * resctrl_kcfg.k_rdtgrp. The bracketed form is not accepted on write.
>    *
>    * Return: 0 on success, or -ENOENT on error.
>    */
> @@ -1164,6 +1165,8 @@ static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visibl
>    * @kmode:	Kernel-mode policy currently active on @rdtgrp.
>    *
>    * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
> + * Called from resctrl_kernel_mode_write() whenever an active global-assign
> + * policy is replaced, including a mode change on the same group.
>    */
>   static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
>   					enum resctrl_kernel_mode kmode)
> @@ -1212,6 +1215,234 @@ static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
>   	resctrl_kcfg.kmode_cur = INHERIT_CTRL_AND_MON;
>   }
>   
> +/**
> + * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
> + * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
> + * @kmode:	Kernel-mode policy to program for @rdtgrp.
> + *
> + * @rdtgrp carries the CLOSID/RMID to program. For monitor groups, the CLOSID
> + * matches the parent control group while the RMID belongs to the monitor group.
> + *
> + * The caller (resctrl_kernel_mode_write()) is responsible for validating that
> + * the (kmode, group type) pair is permitted before invoking this helper.
> + * This helper records the current online CPUs in @rdtgrp->kmode_cpu_mask and
> + * programs those CPUs with @rdtgrp's CLOSID/RMID.
> + */
> +static void rdtgroup_config_kmode(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode)
> +{
> +	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
> +
> +	/* A new binding starts with all currently online CPUs in scope. */
> +	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
> +
> +	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
> +				     rdtgrp->mon.rmid, assign_mon, true);
> +
> +	rdtgrp->kmode = true;
> +	resctrl_kmode_files_set_visible(rdtgrp, true);
> +}
> +
> +/**
> + * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
> + * @ctrl_name:	Control-group name, or "" for the default control group.
> + * @mon_name:	Monitor-group name, or "" to select the control group itself.
> + *
> + * Matches the path syntax emitted by resctrl_kernel_mode_show():
> + *   "//"            - the default control group
> + *   "<ctrl>//"      - control group @ctrl_name
> + *   "/<mon>/"       - monitor group @mon_name under the default control group
> + *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
> + *
> + * An empty @ctrl_name selects &rdtgroup_default. Otherwise @ctrl_name must
> + * match an existing control group. If @mon_name is empty, the selected control
> + * group is returned; otherwise @mon_name is looked up in the selected control
> + * group's monitor children.
> + *
> + * Return: Pointer to the matching rdtgroup, or NULL if no such group exists.
> + */
> +static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
> +					       const char *mon_name)
> +{
> +	struct rdtgroup *rdtg, *parent = &rdtgroup_default;
> +
> +	if (*ctrl_name) {
> +		parent = NULL;
> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
> +			if (rdtg->type != RDTCTRL_GROUP)
> +				continue;
> +			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
> +				parent = rdtg;
> +				break;
> +			}
> +		}
> +	}
> +	if (!parent)
> +		return NULL;
> +
> +	if (!*mon_name)
> +		return parent;
> +
> +	list_for_each_entry(rdtg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
> +		if (!strcmp(rdt_kn_name(rdtg->kn), mon_name))
> +			return rdtg;
> +	return NULL;
> +}
> +
> +/**
> + * resctrl_kernel_mode_write() - Select kernel mode and bind group via info/kernel_mode
> + * @of:		kernfs file handle.
> + * @buf:	One line of the form "<mode>[:group=<ctrl>/<mon>/]"; must end
> + *		with a newline. Do not include the square brackets used to mark
> + *		the active mode in resctrl_kernel_mode_show(). Leading and trailing
> + *		whitespace is ignored, as is whitespace between the mode name and
> + *		an optional ":group=" suffix. The ":group=<spec>" suffix is
> + *		optional; when omitted the default control group
> + *		(&rdtgroup_default) is used.
> + * @nbytes:	Length of @buf.
> + * @off:	File offset (unused).
> + *
> + * Parses @buf, validates that <mode> is listed in resctrl_mode_str[] and is
> + * supported by the platform (resctrl_kcfg.kmode), resolves <ctrl>/<mon>/ to
> + * an existing rdtgroup (or picks &rdtgroup_default if no group was specified),
> + * treats INHERIT as an unbound mode, tears down any active global-assign
> + * binding via rdtgroup_config_kmode_reset(), programs hardware via
> + * rdtgroup_config_kmode() when the new mode is not INHERIT_CTRL_AND_MON, and
> + * on success updates resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur. The
> + * display-only "group=uninitialized" form is rejected.  Errors are reported
> + * in last_cmd_status.
> + *
> + * Return: @nbytes on success, negative errno with last_cmd_status set on error.
> + */
> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
> +					 char *buf, size_t nbytes, loff_t off)
> +{
> +	enum resctrl_kernel_mode mode;
> +	char *mode_str, *group_str, *slash;
> +	const char *ctrl_name, *mon_name;
> +	struct rdtgroup *rdtgrp;
> +	int ret = 0;
> +
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +	buf[nbytes - 1] = '\0';
> +
> +	/* Tolerate surrounding whitespace before mode parsing. */
> +	buf = strim(buf);
> +
> +	/*
> +	 * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
> +	 * and when omitted the default control group (&rdtgroup_default) is used.
> +	 * Trim mode_str after the split so whitespace before ":group=" is ignored.
> +	 * Square brackets from resctrl_kernel_mode_show() are not accepted.
> +	 */
> +	group_str = strstr(buf, ":group=");
> +	if (group_str) {
> +		*group_str = '\0';
> +		group_str += strlen(":group=");
> +	}
> +	mode_str = strim(buf);
> +
> +	mutex_lock(&rdtgroup_mutex);
> +	rdt_last_cmd_clear();
> +
> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
> +		if (!strcmp(mode_str, resctrl_mode_str[mode]))
> +			break;
> +
> +	if (mode == RESCTRL_NUM_KERNEL_MODES) {
> +		rdt_last_cmd_puts("Unknown kernel mode\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (!(test_bit(mode, &resctrl_kcfg.kmode))) {
> +		rdt_last_cmd_puts("Kernel mode not available\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	/*
> +	 * INHERIT mode binds no rdtgroup. Ignore any user-supplied :group=
> +	 * suffix and let show print the mode without a group.
> +	 */
> +	if (mode == INHERIT_CTRL_AND_MON) {
> +		rdtgrp = NULL;
> +		goto update_mode;
> +	}
> +
> +	if (!group_str) {
> +		/* No ":group=" suffix: fall back to the default control group. */
> +		rdtgrp = &rdtgroup_default;
> +	} else if (!strcmp(group_str, "uninitialized")) {
> +		/* Display-only placeholder emitted by show; not selectable. */
> +		rdt_last_cmd_puts("Cannot bind to 'uninitialized' group\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	} else {
> +		/* Require exactly "<ctrl>/<mon>/" format */
> +		slash = strchr(group_str, '/');
> +		if (!slash) {
> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +		*slash = '\0';
> +		ctrl_name = group_str;
> +		mon_name = slash + 1;
> +		slash = strchr(mon_name, '/');
> +		if (!slash || slash[1] != '\0') {
> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +		*slash = '\0';
> +
> +		rdtgrp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
> +		if (!rdtgrp) {
> +			rdt_last_cmd_puts("Group not found\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +	}
> +
> +	if (mode == GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU &&
> +	    rdtgrp->type != RDTCTRL_GROUP) {
> +		rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
> +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
> +		rdt_last_cmd_puts("Pseudo-locking in progress\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +update_mode:
> +	/* No-op if the same mode is already active on the same group. */
> +	if (resctrl_kcfg.kmode_cur == mode && resctrl_kcfg.k_rdtgrp == rdtgrp)
> +		goto out_unlock;
> +
> +	/*
> +	 * Tear down any active global-assign binding before applying the new
> +	 * policy, including when only the mode changes on the same group.
> +	 */
> +	if (resctrl_kcfg.kmode_cur != INHERIT_CTRL_AND_MON)
> +		rdtgroup_config_kmode_reset(resctrl_kcfg.k_rdtgrp,
> +					    resctrl_kcfg.kmode_cur);
> +
> +	if (mode != INHERIT_CTRL_AND_MON)
> +		rdtgroup_config_kmode(rdtgrp, mode);
> +
> +	resctrl_kcfg.k_rdtgrp = rdtgrp;
> +	resctrl_kcfg.kmode_cur = mode;
> +
> +out_unlock:
> +	mutex_unlock(&rdtgroup_mutex);
> +	return ret ?: nbytes;
> +}
> +
>   void *rdt_kn_parent_priv(struct kernfs_node *kn)
>   {
>   	/*
> @@ -2117,9 +2348,10 @@ static struct rftype res_common_files[] = {
>   	},
>   	{
>   		.name		= "kernel_mode",
> -		.mode		= 0444,
> +		.mode		= 0644,
>   		.kf_ops		= &rdtgroup_kf_single_ops,
>   		.seq_show	= resctrl_kernel_mode_show,
> +		.write		= resctrl_kernel_mode_write,
>   		.fflags		= RFTYPE_TOP_INFO,
>   	},
>   	{


Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=13

--- Patch [13]: [RESEND PATCH v4 13/15] fs/resctrl: Add interface to 
modify kernel-mode via info/kernel_mode ---
commit f22e9f0418857d31e6764f0d2604e8d9fd48827e
Author: Babu Moger <babu.moger@amd.com>
fs/resctrl: Add interface to modify kernel-mode via info/kernel_mode

info/kernel_mode reports which kernel-mode policies the platform supports
and which one is active, but it is read-only and does not show the rdtgroup
bound to the active kernel-mode policy. This patch makes it writable and
extends the read format to identify the bound group.
 > diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
 > index c537846d92648..7b06c3b3f00e0 100644
 > --- a/fs/resctrl/rdtgroup.c
 > +++ b/fs/resctrl/rdtgroup.c
[ ... ]
 > @@ -1212,6 +1215,234 @@ static void rdtgroup_kmode_detach(struct 
rdtgroup *rdtgrp)
 > +static void rdtgroup_config_kmode(struct rdtgroup *rdtgrp, enum 
resctrl_kernel_mode kmode)
 > +{
 > +	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
 > +
 > +	/* A new binding starts with all currently online CPUs in scope. */
 > +	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);

In the resctrl_kernel_mode_write() call path, cpu_online_mask is 
accessed here without holding cpus_read_lock(). Could a concurrent CPU 
hotplug operation remove a CPU from cpu_online_mask immediately after 
this copy executes, causing on_each_cpu_mask() to issue a warning for 
offline CPUs?
---------------------------------------------------------------------

Yes. Need to hold cpus_read_lock() while accessing cpu_online_mask.
Will add it in next revision.

---------------------------------------------------------------------


Also, if a CPU is brought offline while a kernel-mode policy is active,
is it removed from kmode_cpu_mask? Looking at resctrl_offline_cpu(), it
clears the CPU from the standard rdtgrp->cpu_mask but appears to leave
kmode_cpu_mask unchanged. Will this accumulate offline CPU references,
leading to warnings during later policy resets or changes?

----------------------------------------------------------------------

Yes. This is another issue. This will be fixed as part of

[RESEND PATCH v4 11/15] fs/resctrl: Program kernel-mode binding when CPU 
comes online

----------------------------------------------------------------------

 > +
 > +	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
 > +				     rdtgrp->mon.rmid, assign_mon, true);
 > +
 > +	rdtgrp->kmode = true;
 > +	resctrl_kmode_files_set_visible(rdtgrp, true);
 > +}
[ ... ]
 > +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
 > +					 char *buf, size_t nbytes, loff_t off)
 > +{
[ ... ]
 > +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
 > +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {

This prevents assigning a kernel mode to a group that is already
pseudo-locked, but what prevents a group that is already bound to a 
kernel mode from entering pseudo-locksetup mode?
Looking at rdtgroup_locksetup_enter(), it checks if rdtgrp->cpu_mask is
empty but does not check rdtgrp->kmode. If the group successfully enters
pseudo-locked mode, rdtgroup_pseudo_lock_create() calls closid_free().
Could this allow the closid to be reallocated to a new group while the
hardware remains actively programmed for the kernel-mode CPUs?

-------------------------------------------------------------------
Yes. Needs a check for rdtgrp->kmode in rdtgroup_locksetup_enter().
Will add it.
---------------------------------------------------------------------


 > +		rdt_last_cmd_puts("Pseudo-locking in progress\n");
 > +		ret = -EINVAL;
 > +		goto out_unlock;
 > +	}
 > +
 > +update_mode:
 > +	/* No-op if the same mode is already active on the same group. */
 > +	if (resctrl_kcfg.kmode_cur == mode && resctrl_kcfg.k_rdtgrp == rdtgrp)
 > +		goto out_unlock;
 > +
 > +	/*
 > +	 * Tear down any active global-assign binding before applying the new
 > +	 * policy, including when only the mode changes on the same group.
 > +	 */
 > +	if (resctrl_kcfg.kmode_cur != INHERIT_CTRL_AND_MON)
 > +		rdtgroup_config_kmode_reset(resctrl_kcfg.k_rdtgrp,
 > +					    resctrl_kcfg.kmode_cur);
 > +
 > +	if (mode != INHERIT_CTRL_AND_MON)
 > +		rdtgroup_config_kmode(rdtgrp, mode);

If a monitor group is bound to a kernel mode policy here, what happens 
if it is subsequently reparented via rename()? The existing 
rdtgroup_rename() logic allows the rename if rdtgrp->cpu_mask
is empty, ignoring kmode_cpu_mask. Since mongrp_reparent() updates the
software closid but does not reprogram hardware MSRs for the CPUs in
kmode_cpu_mask, might the kernel-mode CPUs continue using the old 
parent's closid even after it is freed and reallocated?

---------------------------------------------------------------------
Yes. This needs a fix. Will add a check in rdtgroup_rename() for 
kmode_cpu_mask.

Thanks

Babu



