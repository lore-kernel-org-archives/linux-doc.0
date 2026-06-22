Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10B1C2324;
	Mon, 22 Jun 2026 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782155002; cv=fail; b=ap9nkyn8E27V9cDfhTr566MUMz+GhJv1grlpFfCaVgZHguYAfJl6WaBipgGlyhiz7u+Rjh9j4J1KvN6MeRZMXWeJKhSWJCZ5ybT4eTBL0j/a76bH/OKbGdO7hlaL48udiaFy9gu6lYG6z+H+ZCK9QJNX45lFAxZ3GLrP7RqjR10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782155002; c=relaxed/simple;
	bh=U76pujQ3JmzKsfa8POyAlWC0mBm6d10pvGif9Sp9tkg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YIseEM84oyT/LiL826bD9c1h6dxNSAskgkGpT7MsYG3vJtyt/23GccZR5Ke4dNVR7vsiS3TelXQ0bBnCZUb4oTBzBSnHE8kvMMIswdxpCkjiiHbjfppQ8/qJeC6LBwF3H2ZhZJePPjvKcc9JBMhJWFPazGlf48huiXQKDCn5ivc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HT2XErM/; arc=fail smtp.client-ip=52.101.56.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HT2XErM/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVSTVfSzBCu3tkMyPXQzfxyqmsFbNGlyWOMdU5oL2FFKs5DU7uib3VBhM6CYa1/0Raqh8sg9s4isaMw095+OgEfccwPWa8NOERRQPqbY6WGbC3WM0Vpw6kd23tfwjzWVuJKB+W3KdJA6muPm88hCgNB9UFcGnA+2ak8Drhz8VCPvbgQlo0Ng0BzzuX0cKuk7P0BkanPM35r4a0gHqTuYbwrFWL0s1Uiy94pUhyNj3JX/ShJXHuUD0S/2CdUuD4Je7NKYBjfXvZdfQ20J7+EGuR8EfQsC39EnvP8dpSFPL6Qp2h+MIeHlYDRk8nm5Tym7lprUPWRyRUgBkQ9rcNY+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh1OSZkEeRVDswpRayW3TDgK/dKWJtDktEv9xQwjykg=;
 b=xjU93uM3qZa0y7lwDM17q40F91A5OR92EqkW/pbEc1vSTDreNQ+T0sXfGLuTwr0tuOPiatY1lbz2v5+rtgNcmvJHp7qfignq0gIhhvMPAaE4J8ulf7/ZffsuiGgnZ1VOPwLS/39tZCadHN+GMGSwEc+eAaViXRDIMRJqpy9ydJ2047zB1glxv1cUoNpIJTq/wkQp1fMbEPLLSiZ2WiCvH/+10E9VUH53Ep3GxttdZwIjpAcJXKe3goxHad9GurfQHHHYnplfCruWFN7XxKk3OEO1JSx0co5yNgDnJiPgjVAwCnpIqd7TMXFS0mQ94gqS+GPA41E0g91XtsW6xq/cFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh1OSZkEeRVDswpRayW3TDgK/dKWJtDktEv9xQwjykg=;
 b=HT2XErM/LDd9kiW3hgExUi0cgyioexfzZWtYdaYSVv6gGVmgN7n64pevuTs/Ln5fOgI9QQ4pesogkMY4Ek0kCr3irfePzfY8Rc/MO7XwwsMp2hR2P0u0lENo0ivjffY0is2drXcNxro2aaIGYyaJ0oZln1no/zrSr0LD7jbK5mY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 19:03:13 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 19:03:13 +0000
Message-ID: <5511a8c3-937e-47db-819f-c617fe1897e9@amd.com>
Date: Mon, 22 Jun 2026 14:03:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] fs/resctrl: Make info/kernel_mode writable and
 identify the bound group
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com
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
 <768d4b603542f3202ece4294c808dbbf1a8e3008.1777591497.git.babu.moger@amd.com>
 <57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com>
 <280f2dab-56be-49b9-982f-16f01727a732@amd.com>
 <510ee961-b3a3-41ef-857f-6dc210b6eb83@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <510ee961-b3a3-41ef-857f-6dc210b6eb83@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:610:74::10) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: b95460c9-1b7b-4537-d8d9-08ded090e88e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|56012099006|18002099003|11063799006|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	0agkWPjYHI5ZLWHuJVPCIM2i4ZDGUpNFnFRxovjVUdfvRYxOOfxlcdow6F8gNOoieTo0ugt55IKLfH1J56b7XNplIhmG8+CXe5U6SJ5H2kSJTzoiWFX4nDXEECUP8f9qVL0AR88w1mhr4P1mVB7N/loTnnOuBQ/Hlpt99YJ+lBnxy39ob4AvR+5QIkpvDbpFb1dVCviwieHuPCGHHDdYVImy1gmA8ivfija9ZF8sS1CnG0emdCziu6ibDnt0pGBlTf+YF5rXBiHHVEUuc2Dn1+ovRHjqg8rBNAc2Vws362qmoL3RBTugAkvzO+nCflH14UsyjxNrpAhkh2uxHZYVNgwlE4i3/skjhsSmdRiHa8oY4obT2IGwiEpenAW5dkTULhGl/mCAsDYnyfSyNikWee/JAPncqLRgSeI+4t+VtsGLB4wagBSU6PrDNHZ1dpSUTN/8nP0RAUEpeniAdHhQ2HGScLEuk6KkCkTIf3d7y3SRVs0fJzCW3oaths2b4f0+OUcOqfwBwFB9vN2YMcvp2xJmwslCVD1CqmaXcWC7MplwE3v3fJoVs3yS4qGyaTNRwcyk3Arapm+oYqiXs17KF3k/kj9XMLwjiqR3TtVNlKXDwULQEz8EY/7ua4AlrxQWYhpNwdUJ8AiKlndWjtL10kBEEp7KIwm+6Om1IyQ8oqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(18002099003)(11063799006)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGFydTFyc3JkV3VJZmpUcG9wb05rWjhEUDRyTVA2YzZtVVJFTDBXMDFHL081?=
 =?utf-8?B?cWZ3eUlva2QzMTNnOVBuVGhZZVFvZVpZVTAvQVNMYmRyQmpvaU1OOG02andG?=
 =?utf-8?B?TTc2cEFQOGJTMlA1dXMwZlJ1OGdwbXJFUkthMm5JYlk1MzdoRkJnMmVXRWw2?=
 =?utf-8?B?akEybTEvcG4xRmdrQ0RMSHBxaDI1ak5yb3RtdVp5RFFEa2VXZGFzMDAxeDF1?=
 =?utf-8?B?TWNoNDZDUDU3ejhuRFhvMGVyZGpMUWJ3VFBpYXFuYVRGaEJkRHZFNUw5QUZT?=
 =?utf-8?B?bE1GRWl2cEkwdURyZUl5RlJpT2YxT3RZOEZxV1pKeXBBNjh0T2RIWk1rOEMr?=
 =?utf-8?B?RGQwRWoxVENGZUwyWmdPbFRtdmVlZ2xXM3B3UXozN1pub1MrazRoRlVZekJp?=
 =?utf-8?B?aXVTekVPWHl2bmZFUmNXWnp3NEl3YW1oRjdPN2dMdnJXVHY3cmRHZytJZ1RD?=
 =?utf-8?B?aWx0MHI5MmRKYm9kUXN3c1U2c1NpdnhWMkFBM3lyWHhBL1N2RElLTm9CSXVM?=
 =?utf-8?B?N3BnWEFPR1YvK0NvWFp1RDh2aEtoZnNmS0tQRzRDMFNoR3lxQ2tYdTBaQWxv?=
 =?utf-8?B?MG9rZHFnemhRT05jZkFCa3ozTWxXUklpdENwK1RhVDg0RHoxeHlYSlJQa2xK?=
 =?utf-8?B?c1VwekpTMS90NnRyZXNzb2t6UmVhU2psdmI4R0tMT1VrRE5tbWQ4andSdXNw?=
 =?utf-8?B?TlVpSXhMK0x3Zm5Tbm1sTFNDN0RhV3VHaHlacEJ3V3hpZC9QaktOZ3JDWTRH?=
 =?utf-8?B?OTNyTW5FRExycHZBeDh2VTlFTitoR3R2SVNoeGlUWnRSU2hJR3FOUklwREJD?=
 =?utf-8?B?RXpUenBQVVhnSm5WVFcrSFFkenlkd240VlpOdWZhYTc3cXpVTXRtV25CWWJF?=
 =?utf-8?B?TWs3REE4TXhuSm81UHppVW9ZVU9MZW9BWWtVUVdTTS9JMlMyMU1kMFFHUHVI?=
 =?utf-8?B?by9Sa2dDdytWbTZwcTZrS3VnY1poSCtQaWpKSk8ybXlJcU1XY3cxNmdqZzJh?=
 =?utf-8?B?M3hpZk1LeFY4OEY0MVUwMGJkVHE2RVZEMGJnL21YVjlNQmYyK0NoSGQ5aUsx?=
 =?utf-8?B?Q01GWStyTDZZNC9NRWw0cjdOWmFESGpYUGRyOUlwb3RSLzFaTWU2Tm9Lbkx5?=
 =?utf-8?B?OHIvQ3BqYTN5bCtyMlhEYjMzNDlnZ1FFd0UyOGZSdVdENmVmRVUybUZ5ZGFp?=
 =?utf-8?B?N3dlOFo0UjE5eG0xcWJ0a28wZFdMY1RtWlVGK3NpSU53U0kvNEdSaGlzd1hj?=
 =?utf-8?B?V1Z3cHl3MjlZaGsrcENvWjlMa3JnY3lMR3c4bG9BWHdEMnhDUjVmUndnendM?=
 =?utf-8?B?aVI1bFlwcFJMQSttZEp4WXN3L1NUUkNEMkpVRno1Tzc0cTRISVBtNjArbGt4?=
 =?utf-8?B?UVUwQ21YMkRSTjQ4R3pldVdpYzhIM2U3MHN5bmZHYWtJT2RnRmF5MXRXM0Jp?=
 =?utf-8?B?WEZtYzE1MVB2VXQ5WG1IYWZoWW9ZeWdpMWFkM244N1ArYkpXSDZKWi9jZ0RH?=
 =?utf-8?B?WERBWFI4ZWo1MFVmakxXelUwVWdwcjZWRHhHYUxBQTFrNWZ0eE1PbWhTcmFw?=
 =?utf-8?B?aEM3Vm9EZ2xRdDZGeHdVbkNoL3piMFM2KzBxU2VmWVFXN1FYTmJKQmlsUWhY?=
 =?utf-8?B?OUc1cFFxVWt1dVRoa2doU09MRnZRd2tpWVNzM1NySGtqbmdyTVEranVuOVZ5?=
 =?utf-8?B?VHJySlJMODhJRk5BNktCR0U5SUtxNVl3TDRSdVRPNzZhS1l1WVQ1eTFwRGdI?=
 =?utf-8?B?cVZhNERTejZ3WlJ1cGkxdThLUFF1ZXZSdjlLMUE0SUM4Z3BDNmcrRzZlS3dz?=
 =?utf-8?B?QTdWdW84dkhXUjloaGZRdW5adUVRblVucW8zY0R2YUorb3F5Ymp3UVlkeUpJ?=
 =?utf-8?B?dm5TK1hsa2l2all6TEticG96aHBuNWpnaitDK01LYXRRMG1keEF3enZ1R0RI?=
 =?utf-8?B?bThEOEpQQzRRRWRnckpJdWJxWC9MVjZmenpIMjI2ZXVkbzcxOE9PYkc5bjlw?=
 =?utf-8?B?RmdOZ0M3MGlMU1NPWlNWOW1qUkFlRmVnVXJ5Y0FHZVlMTHRtS0Y2ajJnRUZx?=
 =?utf-8?B?azZrSDhvczhIVE42d0NNaFJtbU52cVpqdENLVklVZDZUdENGZEZXUmlvc0Nw?=
 =?utf-8?B?VXNDT3BRbVJ5Z01qTjRYVDZQUXBsM2xhMlRDUGp6SkJXYmxFYnJnbmtZSDQv?=
 =?utf-8?B?ZzhISFBjd1FmNHVMWUpNTE91SWtOU0NJQnFnTWV2dVVLb2w1TUJ0d3FoK3RQ?=
 =?utf-8?B?S0gzMjVndXlrNmJqbE9ERUF6OU5qQlVYU1dYZERzdCtFR2g3WkNxeEJMTFBt?=
 =?utf-8?Q?yG9lYCWZUpjCYsXPKt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95460c9-1b7b-4537-d8d9-08ded090e88e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:03:13.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka/USg7QM+0jwQuAUjSt+zLhIW93RhKKMmaXpHXTfGq6as8YW6dA3fv7w4PPRWMu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425

Hi Reinette,

On 6/22/26 11:47, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/18/26 6:29 PM, Babu Moger wrote:
>> On 6/16/26 18:42, Reinette Chatre wrote:
>>> On 4/30/26 4:24 PM, Babu Moger wrote:
> 
> ...
> 
>>>> +/**
>>>> + * rdtgroup_config_kmode_clear() - Tear down the kernel-mode binding on @rdtgrp
>>>> + * @rdtgrp:    Resctrl group whose kernel-mode binding is being released.
>>>> + *        May be %NULL when no group is currently bound, in which case
>>>> + *        this is a no-op.
>>>> + * @kmode:    Kernel-mode policy currently active on @rdtgrp, as a
>>>> + *        BIT(&enum resctrl_kernel_modes) value.  When this is
>>>> + *        BIT(INHERIT_CTRL_AND_MON) the hardware tear-down is skipped
>>>> + *        because no MSR was previously programmed.
>>>> + *
>>>> + * Disables the kernel-mode binding on the CPUs @rdtgrp covers (its
>>>> + * @kmode_cpu_mask, or all online CPUs when that mask is empty) and resets
>>>> + * the per-group bookkeeping (@kmode and @kmode_cpu_mask).  This is the
>>>> + * disable counterpart of rdtgroup_config_kmode() and exists so that a write
>>>> + * that transitions the active mode to BIT(INHERIT_CTRL_AND_MON) -- which
>>>> + * skips rdtgroup_config_kmode() entirely -- still tears down the previously
>>>> + * bound group instead of leaving stale enable bits behind.
>>>> + *
>>>> + * On allocation failure the function returns -ENOMEM and leaves both the
>>>> + * hardware state and @rdtgrp's bookkeeping unchanged so the caller can fail
>>>> + * the operation atomically and last_cmd_status reflects reality.
>>>> + *
>>>> + * Context: Caller must hold rdtgroup_mutex.
>>>> + *
>>>> + * Return: 0 on success (including the @rdtgrp == %NULL and INHERIT cases),
>>>> + * -ENOMEM if cpumask allocation fails.
>>>> + */
>>>> +static int rdtgroup_config_kmode_clear(struct rdtgroup *rdtgrp, int kmode)
>>>> +{
>>>> +    cpumask_var_t disable_mask;
>>>> +    u32 closid, rmid;
>>>> +
>>>> +    if (!rdtgrp)
>>>> +        return 0;
>>>> +
>>>> +    if (kmode == BIT(INHERIT_CTRL_AND_MON))
>>>> +        goto out_clear;
>>>> +
>>>> +    if (!zalloc_cpumask_var(&disable_mask, GFP_KERNEL))
>>>> +        return -ENOMEM;
>>>> +
>>>> +    if (rdtgrp->type == RDTMON_GROUP) {
>>>> +        closid = rdtgrp->mon.parent->closid;
>>>> +        rmid = rdtgrp->mon.rmid;
>>>> +    } else {
>>>> +        closid = rdtgrp->closid;
>>>> +        rmid = rdtgrp->mon.rmid;
>>>> +    }
>>>
>>
>> I can directly use it like below. I dont need to check for RDTMON_GROUP.
>>
>>      closid = rdtgrp->closid;
>>       rmid = rdtgrp->mon.rmid;
>>
>>
>>> Same comment as above ... but actually, why is closid/rmid needed at all? This
>>> function is intended to *reset* the kernel mode so needing a valid/active closid and
>>> rmid does not look right.
>>
>> This is a bit tricky. I may need CLOSID/RMID in
>> resctrl_arch_configure_kmode(). According to the specification, only
>> the PLZA_EN field is allowed to differ across CPUs where PLZA is
>> enabled; all other fields must remain consistent across CPUs within
>> the same domain. If CLOSID/RMID are not passed, it could result in
>> inconsistent values across CPUs.
> 
> 
> I see. Let's revisit this in next version. It is not quite clear to me how
> the rework of cpu_mask wrangling will impact the resctrl_arch_configure_kmode()
> calls. To simplify this for now resctrl could continue to provide closid and rmid
> to architecture (with the API documentation in include/linux/resctrl.h documenting
> why it is provided and that it may be unused by architecture).
> 

Sounds good. Lets revisit this again.

> 
> 
>>>> +
>>>> +    /*
>>>> +     * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
>>>> +     * and when omitted the default control group (&rdtgroup_default) is used.
>>>> +     */
>>>> +    group_str = strstr(buf, ":group=");
>>>> +    if (group_str) {
>>>> +        *group_str = '\0';
>>>> +        group_str += strlen(":group=");
>>>> +    }
>>>> +    mode_str = buf;
>>>> +
>>>> +    mutex_lock(&rdtgroup_mutex);
>>>> +    rdt_last_cmd_clear();
>>>> +
>>>> +    for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++)
>>>> +        if (!strcmp(mode_str, resctrl_mode_str[i]))
>>>> +            break;
>>>> +    if (i == RESCTRL_NUM_KERNEL_MODES) {
>>>> +        rdt_last_cmd_puts("Unknown kernel mode\n");
>>>> +        ret = -EINVAL;
>>>> +        goto out_unlock;
>>>> +    }
>>>> +
>>>> +    if (!(resctrl_kcfg.kmode & BIT(i))) {
>>>> +        rdt_last_cmd_puts("Kernel mode not available\n");
>>>> +        ret = -EINVAL;
>>>> +        goto out_unlock;
>>>> +    }
>>>> +
>>>> +    kmode = BIT(i);
>>>
>>> Can kmode be of enum type to be assigned the actual enum value to avoid all these BIT(enum value) usages?
>>
>> You mean?
>>
>> enum resctrl_kernel_modes {
>>      INHERIT_CTRL_AND_MON        = 1U << 0,  /* 1 */
>>      GLOBAL_ASSIGN_CTRL_INHERIT_MON    = 1U << 1,  /* 2 */
>>      GLOBAL_ASSIGN_CTRL_ASSIGN_MON    = 1U << 2,  /* 4 */
>> };
>>
>> #define RESCTRL_NUM_KERNEL_MODES  3
> 
> No. I mean:
> 	enum resctrl_kernel_mode kmode;
> ... with a change like this code like below can be simplified:
> 
>>>> +    if (kmode == BIT(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU) &&
> 
> 	kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU

Sure. Will do.

Thanks
Babu

