Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD88D202963;
	Wed,  8 Jul 2026 23:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551879; cv=fail; b=BnUQSISVdmar9YPexXR32fm9xv/s5GQnWzqc7zlSRaW3QX9P1rDNGvU9istsq6llnj1yJMZ7H+pdUx6/CqMX9bWn+bYLSJwMmaErTuYmpzsNLHTF7QOro2lhgRtgtdZp5uYzcE0yfAv2pU+3Br5Q3VI5MFs5NhoSupCThCHCaV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551879; c=relaxed/simple;
	bh=iFeYyQqQ2ESYVJ/Z9qzIlDs5uOXRhXE4SratLAfQr4o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MkZa43823Av6HCUHc+Kig3McOZ6DTZCe4TJBymey/ASgco+2phQ/bfdijVHSJHQOOF19TDqYW74bM4ErFVK/AlrvyH23WqZuiSHhrNlcUvyLury97fhXYaJlh4+oc+mQoi5iqSdf7odOlzjkRU5wx/jPUdIz3YB5KSlYIfjvlDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iWbQYYTe; arc=fail smtp.client-ip=40.107.209.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iWbQYYTe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnOa5b245H05vEHhMXJ3ABezFZ//ve9Qu8TfNmfUyFzNATHD6O+IQIfK833OM+GtrBhVfI+7aERLSFssS+E0JBNpnoVsxVtiranplTOPGKpUY6CjDXDZqlrFxq3E0XmKPwAPT6QupuW+zbaige9YY5rpB/MLHHCtXH10cP43H87CCvx3Ngq+PVeeo481Tz7fJzjZvHvMfzltKxLdDTxFFokMus/21FkrchDv2KWNSr/SNczk0mOFJpdWWpD32pfSoViK0cPVfysrjiXdkI4sNfojt7Pg1RZ0sOTT58r+cXNjG7iVTdvVPD94WLSzlyyPS1GKkezDnsXhxRo7YCyg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ7rfUlKoTW7CpSwrS03RKUAkuZykq+CVQRCbZrVIMs=;
 b=mA0b4s0ZhILz8zq8+n9vaGAObk030N+IoSJnibo+DxfBrMsW9pEtNEWndu97HBb+PE9yF1HOIQkF0OwYjCG0G6AJsv9oV52Mnx+RZs+D/zTUonl1zAKu2f9tctUgbWjhI75LhBTHsE2L9bRyOhRjs7DSjTyi1hUcgFFGWl4F6+/Cseb8gJJV1hmlaLOtKRISbPWo2DjYJlGK1GyB4qvn4TiulDR+jCvUdkVObP5siQ6WAtfFiYnhFIfzgUDQOL157i0Yn+ulj3n2X3zz/GVk1qMurlKwDt+LfyyZJ4IfYPigdwq3OilH8dlQ55Y7XjaZQpbFt19Eg04SbNxT5oUztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ7rfUlKoTW7CpSwrS03RKUAkuZykq+CVQRCbZrVIMs=;
 b=iWbQYYTeppuzfUwAbBvuNasjaLqwNHeASu3JVg6eZZ+JmgdpXO3bYO2SoVpVhAxrRe3OoEOFXHTlljDniBM2y/KUFHu2WbVa59UztSab+2IkIdQWOsAZnfUxOKq/hy5kEKqyhalgkKJ45pXwQhRtisJ8qrIwHueHwMxDa8wNRVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 23:04:31 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 23:04:31 +0000
Message-ID: <e828f9cd-2820-480a-bc48-6964f551ffd6@amd.com>
Date: Wed, 8 Jul 2026 18:04:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 05/15] x86,fs/resctrl: Introduce architecture
 hooks to program kernel-mode
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
 <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:806:23::19) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 713cc554-0bca-4c0b-8b79-08dedd4544d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|921020|4143699003|5023799004|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s2M0WssJI8bpMhdz2DnK/pWyIuTNFOHOoHh22Por67EScZgZ7TAGxkFilwebJEumfz5kAl2xmWTRYAozFjnbXXWdP+3a5wnq2eEYlS9CpKpgB9KDNDp1hqYQjchkkRC6ebBpYlxEOxCP60uwDMfCcVRahd9XFfE7OeZujC8nEYj9ld1WVqSC4wbzxpPAZnBvVUHjXFhg6yHEdt5FFAegvU0WTZ46umGjQu4o+h9ahQplgEODi+weVn6hcUucK5B797L8MLVyXzqRVfj6OKWA1b5jb8RqO4lK/68YuywOJB38r8E+JfaoH0AgCc2eoojB4llSYol8F0LeFx9CntC7DkGW/6C5sK4pfKbsBEE5mHCDgw+Wy/K80l4HKgAIqBIkdswJPDMb/pEVhAHbmKJVKDMxaQWYp5/KoobtpvdxggE2Tn/UjxK2CYId83A8s07x3r+xsPa3QBLDUALUFo4pOCs85VVXq/Sm/x8JmwCu1yDs6boN7NDXop1wSxMQL7weCCcc3yGC1tORsbaB+O1jLNmuVcpaGpz02oVnr7aLhyS41ZvEXFkiNqml2eJWv/cPrpB8BPSaeSBdfb1njkBkfVjrhqXdXxum6FkTgRQ4GRv04jx4lwZelN9khulo5t8dc1B3N3lmEYNs/kMGgavCiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(921020)(4143699003)(5023799004)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0V4VjBOdzBLWFA1cjhzL2N4dTFBOUZUUzRJUjZ1SlpQM1JSWkEvUk5PRmUy?=
 =?utf-8?B?aGFxZVRYeWhySitDdE1BRW9QWmpPYjBHbExuU1duNkVuYnlZNlJ0ZWFqVHhC?=
 =?utf-8?B?QVQrbHpGTTRybTI4eXc0V2J2dnIzdVNZeEpoRDhnTzBab0w4WTRLNTBjVGFQ?=
 =?utf-8?B?S1NHV3dxRmNsUzlERERxQ1ByRmVUSXhwUGJwL3JieG9WWlRyQjVGR1o3Qnlw?=
 =?utf-8?B?WXRxV1FIdEU3dklwU3NpNjNPcU9LQUhpV0xDZFZLb1NLK016YVB2bTNtNGxY?=
 =?utf-8?B?OFBsemkxeG96c0hFcXBuWWQxSmNCc1hkUzh6MTN6VXR0YnhLbTN4Q2xMNUhp?=
 =?utf-8?B?TWE3NjBiREprYUk1aHdPTG5ENXFlUGcvUDJSVmpmelJVRmprTDFSSGtLSXRK?=
 =?utf-8?B?SXFkaVRlMzJGRVZBakcyMUhQWGM1VEdTOTFuMGdTMi81RXN2bEpHeDlaVGxi?=
 =?utf-8?B?NHZBci9KZkdpZ1JpbnB2c3hxdll0OWMrVzF1dUh6L2k4ME4xSnhVWGw1S0d5?=
 =?utf-8?B?MXFldUFWM205MlI5Z3J2MXVFVWNUN2hlT1lOV2ljRmlTMzF2L3YwMlNnWjFy?=
 =?utf-8?B?N015OFhhR2MwVHFJSE4rMjc4VHgrMFBRQmZkaGtqcE9ZVlY0LzUvejQyT2Mx?=
 =?utf-8?B?TjhhNllXU2RLYVgzSmFBV2hwbHh4Q01hWVJ2TENDNTI2ZUJVRlo2MEg3STVx?=
 =?utf-8?B?VEdHYXhPY2RiQm9QN05QQkFaMDdjbEFCV2FQY3gwWTUrVFBWMU4vc2VTWWVu?=
 =?utf-8?B?SkpnQXRnOUoreEVlcjlDYVhjc1o0ZCtuL0REeWtLL2VmYTl6WUVLQzNGNkp4?=
 =?utf-8?B?TXJRTzgwNlRFMzZzdFd5bWk2S01DNW9OZXo1aURVWXczY01ZNW90TnBHOXg4?=
 =?utf-8?B?Y1dBUDd0NjRQRDRxOXYvcWxxVlBKSXY0QTg1dGttTUNSM3RLZWlNYWdpenZy?=
 =?utf-8?B?OTJzRjNNc3ZFcG1Dckx0TXRWajVxWjNIRzZ2SVdKcjkyM0JVZUxzQWRIZ1JX?=
 =?utf-8?B?Z2lKRktZdTRNUDJkM3QveWFyUDIzdXo5S2dQaG1KQ0k1Qmh5NnJleS9WN3BP?=
 =?utf-8?B?RVlmZkxvcmhsaTlvNXhTKzlMSUU3TmxabXNCOGpLajVsNDlsbUtpb2NxUTNj?=
 =?utf-8?B?YmF1d2E4MUhxYVorcFl4ajF3OE0wbDdhZ0t0eEZEWW93Wjd1UjhFdWhraG54?=
 =?utf-8?B?a1pMdE5HemJBTGNsMEdhUHpRVzRxWm9XNjl3SWtDSURkbGxsSTJQMGVsaWU2?=
 =?utf-8?B?NzBKRDBiRFdLT3JMWllOd2Z4SW1Xc0daVytwaFl1RWFHM0Fkc25SS25CWXBp?=
 =?utf-8?B?cnlhaHBlRkZkSzArdWdqaGQrOWo5dVNRQjgwUnBYYUsvNEFBOVJaRkl1bnJX?=
 =?utf-8?B?WjMzT1MvYTcxaGxwcEJ0N1haNGxsQWRVdC95M0dKNWVBdUczQ0t4djBhaDgv?=
 =?utf-8?B?clVoN0Vvd0Vnd1BMd0NEdmNITnBUVmEybll3T2NibHA5VXRJNmZrZ1YvRDNp?=
 =?utf-8?B?K295U3F5M2tjd1NjZ3RrT011NnVjUGtiYnhWck8vcGdzYk1NTHJDNHlaWFVH?=
 =?utf-8?B?QnZDNU1sVlZyYzlUc2ptUitHSFFub1kvNVdrS2VtZnMyL0pWZ1lXaVEzSWNi?=
 =?utf-8?B?dE1paHBwdkFkeEZsc25ycjF3TUpnUjdLbTVWb2IvVTFBQ1lWN05UaGJjWkdC?=
 =?utf-8?B?c2lJYTUyc3poa254WWdyZ3Y1QWxaclFHQmFxOHY0UmR2NzUrWm5TRllsRFJU?=
 =?utf-8?B?eWo4YTlMakpRY1F1dkZ6K0ZkUmp1SnRjWTNPRTQyTHRFcVRycDBZZEtsN3RQ?=
 =?utf-8?B?NlVnWVJPeVpoUS8yZnBNblh4MHBPbEt1U3lFTEZCY21DRzFWUnA0cEZHakdH?=
 =?utf-8?B?SW8vTERlN0VLckFpYnk3TStEU1NFT24rSk92Z29McWtWR0RUVlpkdURuMnZR?=
 =?utf-8?B?cmtnak1KWmZqamk4OGVKcTlrYnNZeVlJYlFKWW5XbUdYRDJRRTl0cG5Ya0xY?=
 =?utf-8?B?djdPVmxVekZaaDgwRmdlUDg4c1hsMVg2bFhwYTFXYXgvY2s2R1lCOFRvaGdW?=
 =?utf-8?B?QXJXYVNpNld1QmJlV1VKcElMSGZlM25oTmtNNTNmUm1VRXBOQUZJQVVLUXFQ?=
 =?utf-8?B?bU5oNTJoMnhjTHFBNThUSDNhbnFkenZWMUFZNmVhRzBsYnFDd05FVUFFekhi?=
 =?utf-8?B?S3FWa243R1JQa3dSQmZncDloc1Q1ZW1Bdi92SFpuUldtSXdmTmkvWnVJYUJr?=
 =?utf-8?B?b21zVXVMNUxiZDAxVS9MUGptRjA0UC9ERm5EemdnbUpDcGdkQ3czVXVHOEdS?=
 =?utf-8?Q?u3aeX147N/Bkq2gLIv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713cc554-0bca-4c0b-8b79-08dedd4544d7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 23:04:31.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STas7dXefMIUnvXIncOfHeboK00nxCMCfqNmTuaooUCH97wv8r71nfTQOYUA4b62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819



On 7/7/2026 4:50 PM, Babu Moger wrote:
> Kernel-mode policies defined by enum resctrl_kernel_mode must be applied to
> each affected CPU whenever a policy is selected or its scope changes.
> Generic resctrl therefore requires an architecture-specific interface to
> program allocation and monitoring associations in hardware across a given
> CPU mask.
> 
> Introduce a helper, resctrl_arch_configure_kmode(),  to handle kernel-mode
> programming. On x86/AMD systems, this helper programs the
> MSR_IA32_PQR_PLZA_ASSOC register on all online CPUs in the specified mask
> via on_each_cpu_mask(). Also provide a no-op stub for MPAM systems.
> 
> Generic resctrl does not invoke this hook yet; it will be used when user
> space selects a kernel-mode policy or updates the associated CPU set.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Added assign_mon parameter in resctrl_arch_configure_kmode() to program the RMID
>      as discussed in below.
>      https://lore.kernel.org/lkml/20260605100642.1103628-1-qinyuntan@linux.alibaba.com/
>      Changed cpumask type to "const struct cpumask *cpu_mask".
>      Added MPAM stub to avoid any linking issues when resctrl_arch_configure_kmode()
>      is called from FS layer. Thanks to Qinyun.
>      Re-wrote the changelog to be generic.
>      Updated code comments.
> 
> v3: Removed task based PLZA implementation so related changes are removed.
>      Removed handling of rmid_en as it is not required. The group type assigned
>      will be different so the monitoring part is already taken care.
>      Updated the change log with details.
>      Removed resctrl_arch_set_kmode() as arch only provides the modes supported.
>      It is FS which decided which mode to apply.
> 
> v2: Updated the commit message to include the sequence of steps to enable PLZA.
>      Added mode code comments for clarity.
>      Added kmode to functin names to be generic.
> ---
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 36 +++++++++++++++++++++++
>   drivers/resctrl/mpam_resctrl.c            |  5 ++++
>   include/linux/resctrl.h                   | 15 ++++++++++
>   3 files changed, 56 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index b20e705606b8..025f139434f2 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -131,3 +131,39 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>   
>   	return 0;
>   }
> +
> +static void resctrl_kmode_set_one_amd(void *arg)
> +{
> +	union msr_pqr_plza_assoc *plza = arg;
> +
> +	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
> +}
> +

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=5

--- Patch [5]: [RESEND PATCH v4 05/15] x86,fs/resctrl: Introduce 
architecture hooks to program kernel-mode ---
commit 97958c0d99b7e538d1f8d019e6c63712b44a6289
Author: Babu Moger <babu.moger@amd.com>
x86,fs/resctrl: Introduce architecture hooks to program kernel-mode

Kernel-mode policies defined by enum resctrl_kernel_mode must be applied to
each affected CPU whenever a policy is selected or its scope changes. 
Generic
resctrl therefore requires an architecture-specific interface to program
allocation and monitoring associations in hardware across a given CPU mask.
This patch introduces resctrl_arch_configure_kmode() to handle this.
 > diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c 
b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
 > --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
 > +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
[ ... ]
 > +static void resctrl_kmode_set_one_amd(void *arg)
 > +{
 > +	union msr_pqr_plza_assoc *plza = arg;
 > +
 > +	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Will this truncate the upper 32 bits of the MSR on 32-bit x86 builds?
It appears that union msr_pqr_plza_assoc in
arch/x86/kernel/cpu/resctrl/internal.h uses unsigned long for both the
bitfields and the full variable. On 32-bit x86 architectures, unsigned long
is 32 bits, which means reading plza->full will truncate the 64-bit value.
When this is implicitly zero-extended to u64 and passed to wrmsrq(), the
upper 32 bits of the MSR, which contain plza_en, closid_en, and closid,
will be overwritten with zeros.

Will change the union msr_pqr_plza_assoc to use u64 instead on unsigned 
long. It should take care of this.

Thanks
Babu
