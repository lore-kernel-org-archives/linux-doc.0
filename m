Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49240DB20;
	Wed, 12 Aug 2026 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572688; cv=fail; b=VodI19/D+6IT+stztgecnz8WXNEkV/556mD3yeQM3bkcfWRjXJcq55hT4MDD2eEyuEBx36g8o54PUAb5WzrWjSHr5JYqm4s+xifaHbDgMV+G8QfskLKIxq8ddcRC/11MY+c0KKA3QA+/1EjPNVho031JvNQ39f0fKyYAF/B/VR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572688; c=relaxed/simple;
	bh=xEwyJjTB1i8Ec8PpSFwN2f3pDACi3EBi45fM+AWi9FU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=goBuehfM31Hi6yde/EaNzbYRwO1GebVTlNcZY8/9FqyNVHIxbmiJjgyozozcV4HhgT38LMY2hzR9ttG19HB0da+ZptZsxXXvmNLpjSs9D5kiO54DfoZC8ppHE04i2OIPvkD0tX9IdJxunDuXHUg2lCXYfYIbWXroorC0k7zVFJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ej5WWL4C; arc=fail smtp.client-ip=52.101.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ej5WWL4C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTG+EKFgThsaHiU7pJRIvTu310vyGb5qhXbGGdBoH/l7UHYrfAchsPNLoNcKIGxszzDDZUtoYFDrttyRomBMI7xMgUOpPAe/vznCHVhspCgdzZYLcGNWKasNFLZmxIGqzwutHtKzb7/2G9hFWyuqOGyr5oUBy2zUDCnThBQwFbfzkgLO+CGBCWshgctDsZza8LS2rgKJgCBbrQH0BCCmyr8a3wNBR2UOmgUqBTTZFTLWWpmvIyuxG3y0EmJE8QJqn4CWrUJMtLJQx/Y1iDbZfJ2krC2TQGJRO9kCXpQJuG57jWtmRBjgRrNxCgCEmq+YI8M6jMkUv2fGW4h+ZHry8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMg/rTeNmqYopqz83YSX+/DoX1kxgDKLNRHgSS+kykw=;
 b=Si9MCgOUkn16i32RtEOLzslCA0YWTZCXPhBJrAL07JziQU0v7usLpDeWZ1CGLot1DJVlA0B568a2J9V9mhpN+DoJKVixIY84gSp6aPs7xtVsP2v649q9qDHub+e5nPlFTzpPtWsd2PSApS6tY06oZpL7jYZK7nzRRnFOSGfwSq4gEq2HgLFIdWclXfhJ0z7b1tuDnB3usZOuPLA2t/sS7wjAofUt4IrXBVo5hIPDS41TsrmnPN7CiGXMlZdvANvR0/oe6CulZuKjNMapBqo0FVTGiBF6kK5gJSZMnjwC/0eTu80zQzqhtenZx/qKURegRYfg0ELR4n62T+ISyzrb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMg/rTeNmqYopqz83YSX+/DoX1kxgDKLNRHgSS+kykw=;
 b=Ej5WWL4CePvm8DuSt6aAzX4yxDjMZ28+OlPdzaZ+w3QANGrBOXNsDtDK2TMjKLUaL1xwtZZs0GUe9a1cyKg7HA02t/1osq2gLnt9Au6/BR3XpLCAFb40saGwEA88uwGAFFgPyEF4IkcqmLkA9V+cvxokpU/IjTJmWFN+0EpuhP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.13; Wed, 12 Aug 2026 22:11:20 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 22:11:20 +0000
Message-ID: <d0a0ffd1-c759-4c3d-be09-f1d49ead29e5@amd.com>
Date: Wed, 12 Aug 2026 17:11:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 05/15] x86,fs/resctrl: Introduce architecture
 hooks to program kernel-mode
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
 <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
 <0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR15CA0025.namprd15.prod.outlook.com
 (2603:10b6:610:51::35) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 3754d24c-e9a0-496f-8a65-08def8bea33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|921020|6133799003|10067099003|4143699003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bo3Ir6J9SPxbx7jCywlwEBaNlMjK8rJKKNrFXWIvq4wA0lM85ZEmsRVA4682V67CTgfy2jSGFWsbQViu3UmZt/o35mNRO2M9N6XWg+rV6i4PFo9UPkMAxAwqEEtG6nDSfQaDZ3/Z2eR3cbmG4yIcacQvF7yWs4zqG2REB81k/Vm71F3PXt4To+A0LS1sYeYr1i8hoQooBlJPK/KnshrRA2bsh72E3rvfgrCALXcKeOhrz4gJHwmaM1ectt8GE3tCl7l3zSAbLAviHoK4xz7I317CehIE1TbGNMaPBIEQms474dk5jB5exAc23YSEx346mDjtwkbjpMWzTv6ZvHIVQp6eN56wLQhyDXogwid/8oVFNFVGlmIH+pbZ63bmb4mC/7W/MZm+BSD5dtIE5zA66BIDbD9VLLzkOBpgUWQi5gg0fWuaOVB7FzGIXO4Ms7uu+eXULVtLwHx7Nx/78ZQGmifn65Ls2uhQzMHwgAbGZXgve/4aeDLLxVMF9hhqZdk2MCAzu1HxEQzJD9tEOLMk/+9a5YKA5epNvdO/mA2oCtUufAlzt2W+qz3L+14aG6ZVF0P1ecy4xhTqq8tzlQc66IDsp5poZlP3TFsRFt8KVZOWEcEtpXRnNld16hIdy2QG2g9x+n46S2RvkK2EGZo6KVlR4GKVICXTx7IMIWLAdc7BRM94CW0I6YhgqWt2OBkgcJUsp6xpRWgZp8v61N61bA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(921020)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vkl1RzE3aW9FRmpPWTd0Ujg2OU4wN2YycGdydkZZVEUrYlVUZ1VTK3J3Zll5?=
 =?utf-8?B?MW5GVUlIWThFRk5SZ2xsUml1Y09xek1iMmhYRlBNRS9mNU9DY2hsMlhTMHIv?=
 =?utf-8?B?VXNYSmxLeHNUc0w2QU03THZyUDMxMVFYdUwyaFpHZ2M4eUJwejY5TVVUekgz?=
 =?utf-8?B?clhRaERkd0o3Tzh2THJCWGRDd29BOE1pVnFZQ1BRUXFxVldyUXl4MDNFRVkz?=
 =?utf-8?B?YnliTE15V2VRVXBRNVdtb2dneGtmak54RGhDc3RUeWVVY1lXY2o5Y0U4UjlT?=
 =?utf-8?B?bHVTZlpzbzFzSXArWU5SdUwyY0oraEh3bkZkeXkxZmpoZzc5d2V5dC9vcUFG?=
 =?utf-8?B?eURJaHVYSElBZkpyR3BMekFIODE2WG1PaXpUUE5Mc0hPL2F1bUtjSUZEcHRN?=
 =?utf-8?B?VlUzYUZtOHZaR1pzdm1CNXc4UjdaYWRqVjdFaWxKUU11Q3dwd08zWnNhQjU1?=
 =?utf-8?B?THJGYWwyVU1PUVJodlFyOG14ZTYxQ1ZVZHdJSTFNdUdTRGp6ZUpMeWo1ampa?=
 =?utf-8?B?K1Vvamo3VHA1UllRQThabU9wT21NWDlSeVVncHVhM2ZMUVBYbzZVSFZXZUF4?=
 =?utf-8?B?NkJhZW8wbXhmclYvRjhRT3E4RTQ0Z2YwdjY1aTJUc3UxYmxXamFROTFqWnln?=
 =?utf-8?B?TlkvS1Y1UzRyc0I3bnRnN0pCSk9uVW1NbWMxTHZjdW5QMDdicUtHMzBXcW5W?=
 =?utf-8?B?L1krT0oxR0gzbHFSYUN4a0ZXMmpOR2ROWVA4dEtSc3JzcUJUQlBBNHp4azRS?=
 =?utf-8?B?c3cxMHBlbVdtVW1yTytrWVNvQzZCcVI5MkNoRWJUd2ZlYTJMSXVzaVVKd3p0?=
 =?utf-8?B?QXRVRm91RlMvQXc0dmxrdC9IdlNzUUJYUVpDay9SWmlobHpRTGt1aitXSi95?=
 =?utf-8?B?R3VsSmhCOXZqTXMxSEY0ZkV3U3gydjQrSkFTSS9oM1FSVm5wRmRXWXhvMXkz?=
 =?utf-8?B?MWVBWGx1OUdTc1Jhak5tNS81bzlBSHdOTlNSanlkcWYvdXhZNU1abDF3U2Nq?=
 =?utf-8?B?Syt1WjR6akkzZXhveWZSeE1nQ3M0YTc5K244YnVZaDNGeExiYWtBL0hHcXQv?=
 =?utf-8?B?dnJYUUV3ckNEU2VQNk03K1MvMi9NVlo3QW12c3Jab09pMXNtOWUxTGtLa3Fp?=
 =?utf-8?B?MXhPUDI2Qm1NcHRtNERuZVdIQU8wSjB3Mkw3MEtSamhBNGlVemFTR2Z4OGVp?=
 =?utf-8?B?YWhwaXZzaGhFai9sMHhrMGluWWY5ZjFjc3FUaHFjdnJKMGNoSmxmZFc2dTlY?=
 =?utf-8?B?SjV2REQydFJNamp2cjFKNlBaUFpYTTJhbDNBZlhOaE81QnVXQXh2a0JoYlh2?=
 =?utf-8?B?RENpZEtSSkpRdTdEVlI4ZFhZVFNHOCtUNkpOOUdqS0xDdVowcnNNbmp6VmM3?=
 =?utf-8?B?YUlXdDc1L0svUVNucHN1eW9MRkpBdTlvNmgxYzkxekFTeERPaTFmblEvRHg1?=
 =?utf-8?B?U3g0T3RQMmNZQUtXT1AwcEx0NlBTa1duNWp5TW56b0NTN05iRThEb2lZZGZo?=
 =?utf-8?B?YVdGaEU2Um9QNXgwdVptMXNCTCs2bWIwa0J4bjJ1TzhGNmRhYS9GR1l5OWl3?=
 =?utf-8?B?UXhaODRMVmNHREdYcVNRZ05Fc2tUOEY1UDdxcjh6cGYrcStYQ0RVd0Z4aUxE?=
 =?utf-8?B?OEdXVWVDV0NsZmVpd2d2ZXdNTFB6TjRWYU1nV0YzbEFVRW1USTFKb2prVTc3?=
 =?utf-8?B?RlB0L2MyWUJOOUlGTXc3N2VtK3V4WXIwZHNsSkRZRGJ5MjlONSt3VW1kK0xI?=
 =?utf-8?B?MEJ1a1JNOGg4aEJkRGJIV1Zvb1VzRjc0Z2dybkNZbVFodGJGeDl5enNUZXpU?=
 =?utf-8?B?bm9pT0VoY0VMUFhqelhuLzJodUFuQ3JQZHl2MGFDVUFNMTVBeGJLUnh6cXRl?=
 =?utf-8?B?MUhaNERHbjI4TDN4MlZMM0dIL1U4cDc1b2NHL294YldQSjAzd3hHMW9WZlMw?=
 =?utf-8?B?M2l4OC9QWHJKMU94Tm5hVmp1VC9JZWU3bEh1NHBMRC9NeDZoQjU2alR1T0ZW?=
 =?utf-8?B?SnR3L0w5T3ZXT21MUC9VRHFwU3NQZGQwa1ZNcVBXa3RIcW5rc3ZxdCtrVUF1?=
 =?utf-8?B?MXcvUzRaeUd4V205dllsL2xQVkVSMlF1TkRycTZRTHBXQ0F6czk5MDhNK3dO?=
 =?utf-8?B?S3JRMTFuODFPR05FMlJRZDY1bk5Sd1luY1VXU0RpeFFpOGg3Z3ZjZHIycUVC?=
 =?utf-8?B?bXRpcGpRUHFKSzFkTVFTbFRaUHNveFBJS3JHL045NU9NR3g1cmNYR3ZyL0tv?=
 =?utf-8?B?L3VkUkdMWVo5Nm0zaENmempBSnRrOG1meE5jS3oyR2k1MXRjM1NRWWdLTERJ?=
 =?utf-8?Q?LmobrkTAUWFgO6+/Z/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3754d24c-e9a0-496f-8a65-08def8bea33d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 22:11:20.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX5LPvNt/gprlxA643OH4XP6KSTWBaQIy6KN1fW6woJJKOD6fOGxMA3bOBEZtL3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464

Hi Reinette,

On 8/10/2026 10:14 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Kernel-mode policies defined by enum resctrl_kernel_mode must be applied to
> 
> "Kernel-mode policies" -> "Kernel modes"?

Ack.
> 
>> each affected CPU whenever a policy is selected or its scope changes.
> 
> What is an "affected CPU"?
> 

Kernel mode policies defined by enum resctrl_kernel_mode must be applied 
to each CPU whenever user space changes the kernel mode or modifies the 
CPUs associated with the active kernel mode.


> 
> policy -> "mode"? or rather: "whenever a policy is selected or its scope changes" ->
> "whenever user space switches the kernel mode or changes which CPUs are associated
> with the active kernel mode"?
> 
>> Generic resctrl therefore requires an architecture-specific interface to
>> program allocation and monitoring associations in hardware across a given
>> CPU mask.
>>
>> Introduce a helper, resctrl_arch_configure_kmode(),  to handle kernel-mode
>> programming. On x86/AMD systems, this helper programs the
>> MSR_IA32_PQR_PLZA_ASSOC register on all online CPUs in the specified mask
>> via on_each_cpu_mask(). Also provide a no-op stub for MPAM systems.
> 
> No need to describe the code details, please just make it high level of what
> the code accomplished as opposed to describing the code self.

ok.

> 
>>
>> Generic resctrl does not invoke this hook yet; it will be used when user
>> space selects a kernel-mode policy or updates the associated CPU set.
> 
> Looking ahead how this arch helper is used it really is a "one size fits all"
> based on what AMD requires. Specifically, as I see it this architecture helper
> is called under three very different scenarios:
> - A new kernel mode is activated
> - CPUs are added/removed from an active kernel mode
> - A kernel mode is de-activated.
> 
> There is no way for an architecture to distinguish these three scenarios. An architecture
> that, for example, needs to do some arch-specific init to support a particular mode will
> not know when it should do this.
> 
> This "one size fits all" may be ok for an initial approach until we learn what other
> architectures require, but the API needs to be clear on when and how architecture can
> expect it to be called from resctrl fs.

ack.
> 
> Consider, for example, the API description containing text/contract like:
> - If a per-cpu kernel mode is active when user space switches to a new per-cpu kernel
>    mode then resctrl_arch_configure_kmode() will first be called to de-activate the
>    active kernel mode on all CPUs that the kernel mode is active on.
> - When user space switches to a new per-cpu kernel mode then resctrl_arch_configure_kmode() is
>    called with cpu_online_mask.
> - When user space adds a CPU to an active per-cpu kernel mode ...
> - When user space removes a CPU from to an active per-cpu kernel mode ...
> - resctrl fs will always provide the same closid, rmid, and "assign_mon" parameters when
>    activating a kernel mode, all interactions (adding/removing CPU) while the kernel mode is
>    active, as well as when de-activating the kernel mode.

Will add these texts. Thanks.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v4: Added assign_mon parameter in resctrl_arch_configure_kmode() to program the RMID
>>      as discussed in below.
>>      https://lore.kernel.org/lkml/20260605100642.1103628-1-qinyuntan@linux.alibaba.com/
>>      Changed cpumask type to "const struct cpumask *cpu_mask".
>>      Added MPAM stub to avoid any linking issues when resctrl_arch_configure_kmode()
>>      is called from FS layer. Thanks to Qinyun.
>>      Re-wrote the changelog to be generic.
>>      Updated code comments.
>>
>> v3: Removed task based PLZA implementation so related changes are removed.
>>      Removed handling of rmid_en as it is not required. The group type assigned
>>      will be different so the monitoring part is already taken care.
>>      Updated the change log with details.
>>      Removed resctrl_arch_set_kmode() as arch only provides the modes supported.
>>      It is FS which decided which mode to apply.
>>
>> v2: Updated the commit message to include the sequence of steps to enable PLZA.
>>      Added mode code comments for clarity.
>>      Added kmode to functin names to be generic.
>> ---
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 36 +++++++++++++++++++++++
>>   drivers/resctrl/mpam_resctrl.c            |  5 ++++
>>   include/linux/resctrl.h                   | 15 ++++++++++
>>   3 files changed, 56 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index b20e705606b8..025f139434f2 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -131,3 +131,39 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>>   
>>   	return 0;
>>   }
>> +
>> +static void resctrl_kmode_set_one_amd(void *arg)
>> +{
>> +	union msr_pqr_plza_assoc *plza = arg;
>> +
>> +	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
>> +}
>> +
>> +/*
>> + * Program Privilege Level Zero Association (PLZA) on @cpu_mask.
>> + *
>> + * When @enable is true, CPL 0 allocation traffic on the targeted CPUs uses
>> + * @closid from MSR_IA32_PQR_PLZA_ASSOC instead of the CLOSID from
>> + * MSR_IA32_PQR_ASSOC. Monitoring is redirected to @rmid only when
>> + * @assign_mon is true; otherwise kernel-mode monitoring continues to use the
>> + * RMID associated with the current task.
>> + *
>> + * @cpu_mask:	CPUs whose PLZA MSR should be updated.
>> + * @closid:	CLOSID to use for kernel-mode allocation when PLZA is enabled.
>> + * @rmid:	RMID to use for kernel-mode monitoring when @assign_mon is true.
>> + * @assign_mon:	Whether PLZA should provide the kernel-mode RMID.
>> + * @enable:	Whether PLZA should provide the kernel-mode association.
>> + */
>> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid, u32 rmid,
>> +				  bool assign_mon, bool enable)

Need to add "assign_ctrl" also.

>> +{
>> +	union msr_pqr_plza_assoc plza = { 0 };
>> +
>> +	plza.split.rmid = rmid;
>> +	plza.split.rmid_en = assign_mon;
>> +	plza.split.closid = closid;
>> +	plza.split.closid_en = 1;
>> +	plza.split.plza_en = enable;
>> +
>> +	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
>> +}
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 226ff6f532fa..630b6cfc0269 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -158,6 +158,11 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
>>   	return false;
>>   }
>>   
>> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
>> +				  u32 rmid, bool assign_mon, bool enable)
>> +{
>> +}
>> +
>>   void resctrl_arch_pre_mount(void)
>>   {
>>   }
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index c7abed51cd5f..47db34dd167e 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -734,6 +734,21 @@ enum resctrl_kernel_mode {
>>   
>>   #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
>>   
>> +/**
>> + * resctrl_arch_configure_kmode() - Program kernel-mode association on CPUs
>> + * @cpu_mask:	CPUs to update; the architecture applies the change on the
>> + *		online subset of this mask.
> 
> Could architecture not expect cpu_mask to only contain online CPUs ?

Yes. It should be only online CPUs.  Let me change the text little bit.

> 
>> + * @closid:	Allocation class for kernel-mode traffic. On x86 this is the
> 
> "Allocation class" ? Care should only be taken when using "closid" outside of
> kernel. Please see all the other examples of arch API in this file that uses closid.

Sure.

> 
>> + *		CLOSID programmed when allocation is assigned for kernel work.
>> + * @rmid:	Monitoring context for kernel-mode traffic. On x86 this is the
> 
> "Monitoring context" ? At this time it is quite clear to architectures how to do
> needed mapping.
> 
> Some archs will use closid/rmid separately, others will consider them together.

Yes. Will change based on other text example.

> 
>> + *		RMID programmed when monitoring is assigned for kernel work.
>> + * @assign_mon:	true to assign @rmid for kernel work; false to inherit
> 
> This is where the only distinction is required when considering other architectures.
> Note that, from user space perspective, it is a monitoring group, potentially identified
> with both closid/rmid  that is assigned, not just an rmid.
> This is thus not a request to "assign @rmid for kernel work" but instead something like
> "kernel work should be monitored by resource group identified by @rmid, or both @closid
> and @rmid, depending on the architecture"

Sure.

> 
>> + *		monitoring from the user task.
>> + * @enable:	true to enable kernel-mode association on the targeted CPUs.
> 
> "the targeted CPUs" -> CPUs in @cpu_mask?
> Please be explicit what is expected from architecture when "false" is provided.

Sure. Will add that text.

Thanks
Babu
