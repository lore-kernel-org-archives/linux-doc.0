Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4D038DC4F;
	Wed, 12 Aug 2026 19:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564751; cv=fail; b=IXrFrsTO/OoekYZAZTHC6BtZQdDkfCNx99nKCYpC0FjB5HEHA0rQODNZmufZ7o8OTpt1zxhfRbXVd8C8iLNV4gIPD6kmcg+ggIgTSnkBPzPT/QpFQ8LkWYtdCPfXXxWEZEqOTKwzU0U6CM1yLW5zXXlEYAItnxGTWWsLd4wnkOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564751; c=relaxed/simple;
	bh=JcFwUSJzrh3wYoiYtqNzEP20fKPeC/jlufb8nFyeLDU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WlzJGNQ2TvPjLbaZX6wUGtC5+b2yoDsTgehQ8R4QQSNppbS7hBvGLyXHmndHMV/Q2SxHsmWLeDyWE3AH32y75BIBh0+qf6KndP7OLB8na8ZMDHAMKgXs9yW0GKgsvEUuT0ph/8GtIbhbnux9X5E5EO70vLsxSfXJ5wvb9X1OgAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GC8llU59; arc=fail smtp.client-ip=52.101.62.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GC8llU59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeKan96X1qdD5i2Cc4N6iB+ns76LJ5XWVGZYeX8lCf5lb9EYrKzkoPuQhN1alSb8ggKXS5611ar7vzUXNJteG1TOa8FhNFkcljUCSSydtcWI205QgQcOqNRDO7I/3L5cpSXW3VnpbM6avXRFXOHz6lzDQMNyVt97bNVyVBO9E8hwDljDILj/EBb5PQf2FOtJMZXZd8qiOGOcz30vBZoyYY/z7t/O545+l7VvqmmBEqIQMF5E9bqd33vs7qWK691SmcB29kCu4aD9my/BjhPH+VzGCBmm5qDaF1oY8yIfB3arw2/dHRyiJGvFy281uY9j6DNCVPnzOEom2LF8f9AZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmq07TnSUHP3V+FWtggFVI38i/Jfgm/s2wAOcGc8pAU=;
 b=wLFifgoILsrI2ECgF0/lgV9W4Os8u5rlROFijD8IF7cEa9fG9F8gNxwtHMhSKkvZAZ0qBFD7ndIAxhUrqrQ/5XpUgdYMvKSwwPLg1OuGbd8/dk7vE9q+E/LJAihtmYM5agTY3wGTJx2yGSalK554RThT0M3KGzw3J1dhW6RyyDnNkRM+c/ac9CFKvEOjT5rQeTnn7953cxVmJ2r2muOXSGS9LEbKF9Mcg0OPwgbGX1vB7ZfXkLKRPXMCnpiOdBCA2gOCQV2vlpTPIPZNK0PdqlZ9o0eoskm57hi1n8bRwpBZmd2aL8zXILkq1G6UbuG98zoq5zxR1WOlONBXKEj+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmq07TnSUHP3V+FWtggFVI38i/Jfgm/s2wAOcGc8pAU=;
 b=GC8llU59yUANvdq0/EI3DJXq/xbvEpm1R5hDA5zDPZ36AlPJKxlCMccunDCXxG6Lr6OLeWeNcs09ROp5Qsj//YfOPc6F9gyI3rPQzkbhL3kBBozKku8OTfbSMPp/Tu9FPZOeV75n281izdwPJ3y+hOJq0QCivLufmFlSWVxAtkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 19:59:02 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 19:59:02 +0000
Message-ID: <5fad6e01-1052-4c1f-82f5-02c650ae1ffe@amd.com>
Date: Wed, 12 Aug 2026 14:58:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
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
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
 <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0115.namprd11.prod.outlook.com
 (2603:10b6:806:d1::30) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA0PR12MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ede6b5b-5066-45a0-ddf8-08def8ac2802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|11063799006|4143699003|56012099006|10067099003|6133799003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AgfO8dPVBxKpZy5E3Hy3fOzmAdUNtvEKlf6SI71dUn4vGrKSJKB67RTwagQU1GK/4GHLv8E/adIMaDtljeVvJkfaQTntMdCDJsJiRiHEmJODKyZ35BQBDbCiDQCgxApMGnUULIDL0PLeBxO0XW2t/4T69hCKgi+fsXh2zSwWVwWpV+76N6GCj3te1zheAO/ui2JTV/kJbFq/irLbtLghtECY1EE9+VGAvjUVb+YY1NOsiyXrBEZgVFvbrh8f/MpiyXTP8FYvcQjI1yMsJygn94mUapScfN6ptfXhdupq0p6sECFKLSAfJ3OISi3t/bFnv3h3+FusPwTBx+dX24D8CGW7FSGTfKwqh3GWVVQmk5TCGXHiTHf7Vgw3H4lo0e657/8IgIOUabxXE7KcvExFvBKG2RGkynHr9+DGxaTp6MWcuz+QGbCsVaPAVd8W8D60QTOGdl/dzllvxgWvbsu8Va1TOxZ0nqCSIBpxSO2d6d85138gSIpc1L5WOnHhDgBnucd+1dfOzlhy1avlMAg3RFml5S/aqj3WHCk47zvlbNQ9JAu2A+W5zTLPNB0IFimeetot63RRmEb1DFqXnUuS1QeBXw+ARTRTgCdU1uiEEp+i4Xhv6wtBQ3aGA25OQpjeYylKo9qjK7NWrFllpshJUlUeoHVB9xN897u/Qu1rgnzyEVc1F2KcE+FaFuICVUZ6AdQge1Mtm4W8bpu5WrV1iw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmJoRm9kTGEzR25KNTl3TWgxSmhrY0ZzdG9ON1NaeTJBWEpPSndsM3hBWjBE?=
 =?utf-8?B?K3o1TmpBVGoyRnNTUFoxeGN1ZEo4TVJhQ3IweVYySFNNbFNYUmlDWGMyL2Zk?=
 =?utf-8?B?U3gzQ2Z0WHJGd0M2R0dxV0hhSW85emdyVEhzY3l5TFZSS1UrSGpYelQyMzNj?=
 =?utf-8?B?S2p6aXM0d3FETlFvQWZQSzFRbFI3MmFmUm1WOHhOQnBSOEVqOEFlUjdXTzFG?=
 =?utf-8?B?WUxvM1J0dkJXbVFkL3Q0dkI4TmlvUWpBWG8yb2pSUGk3MTk3YjE4QWpMcXJM?=
 =?utf-8?B?MFpBWUJBV2twbnZhcWlZa1hSSGxMUStQaExmVVF0MmU1ZU1Gd29Jc1Axemhq?=
 =?utf-8?B?c0Zud09KK1owbjI1MFF4d2xiaFQvejFJeFNQSVNTREwvT0VlUWNnNXE4ODJ3?=
 =?utf-8?B?ZStpODBFS2lSMGRPNEF5T2czWVpucHJudUNZeHFNby9GRno2djdKL3VkQnFF?=
 =?utf-8?B?KzVSSTJmaGJFRVJHclFjdHhxWjRyeUk2d0FsU1JuS1JwRXJuQ1ZCeXNMNytG?=
 =?utf-8?B?Lzl2UVowcTBnZU5zQmlpMEVKeE04Mi92V3VjTUVOKzdvU3h1S1pIZDF2dEpl?=
 =?utf-8?B?bVhlekExSnBISlA5N0REWDE1cm0rNWFPVi9rLytKSkIvTTRwRERFWjA5amQ0?=
 =?utf-8?B?WEErdjJTdFZONnZyZkZSQVltOXZFMVlkRHdISExOMkxldDBBWWwvVSs3QUR1?=
 =?utf-8?B?UGxvUnl3ekdDYmRtYzRVV0d5ZXpZK2xSbHpMOGR6V0Mza3pSUERzV0t3TFdq?=
 =?utf-8?B?TFJYRTRTRGdBMllPcWcyN1FQbkFBOVFTaEgyT1FnODhKdTRCR2k2REpzeHNo?=
 =?utf-8?B?MHMzNjlPaG83emN3c3BWakJOc1AxemFaelBaVENYZkd5cHlFNVluQ3ZlOGRW?=
 =?utf-8?B?YmtXdmFzdWNnNGpWV25HbUtDS2JHMm50VHBGRVdvV3hVSGVhZzI0UFcvbGY1?=
 =?utf-8?B?NFRMNnBTV05VS3dqTHZIT28vajVmOW5UMStVL0VvMGdqOGprMmdNakk3YWFY?=
 =?utf-8?B?QzdpREYxeXFnVEVmZG8rbTVwdHhVV3JDc3lZZmpDV3E2YWl2N3NmbmhWUkl6?=
 =?utf-8?B?RlpYL0YzbDNMeTIxeTJwcngwMVVkRTRlODh4M0hlSU5ZK2pSZUNxYnhna0cy?=
 =?utf-8?B?Mk9YSS8vaTBycnNrWkhIUXo3M0dmQWJvRE5TWEhCRzhpRVF1VE15dkhiL042?=
 =?utf-8?B?ajFzQ214Ui9zdDdJT3BJNzNMcnNkZXhvR1RXL0VhNHVIVUZERFo0YUN6L29v?=
 =?utf-8?B?a2xiYU8vTHpDY3MyVVUvTENaQmtGYlBOaGNrSytVUnk5YkV3SFZuUE93OGF5?=
 =?utf-8?B?T2VIRllNdzY4Zmxld1pIZERiN1piaG9QQlUyM2NKRG4vTEFXR3NqMlB5eGFv?=
 =?utf-8?B?bHNWNkJOejVYVW0yUVRSV2VvditTR29nTlFkVVZNZGNyeG5tZHRaTmpzb1p4?=
 =?utf-8?B?K0RweDhTcWhTampnajhsMlFuNzlEZnZPMVZGc1hKMUFEUlJ2K2J0UVBCSTNy?=
 =?utf-8?B?MTg2TVlPWW1tZkIxTU1VVzBZdnhhRnN1dHk2YzF1RUJWVW1paytvZXljTHcx?=
 =?utf-8?B?SGc4N05RVlRuMStKMUtTN3NPWkNEa2tqRGdaZHRVOGdRQVVmcStaYitobzVZ?=
 =?utf-8?B?R05zMXhTUkRYODFMTUszYTF6WjJIS0laZ3VHZWt1eGRPT3RuNFJIVUlFVDhL?=
 =?utf-8?B?Tk5NYmEyYjkvd09yOW1NVCtlOEFERzM4T2RpeVNSUnFpaVBuQmdyemRpZmRm?=
 =?utf-8?B?bXRwc05pQVdPdE1VQnBJZ0pibGJPd3hYaDZzOExPWHRWZ2Y3N0lCMkdCR2ky?=
 =?utf-8?B?ckVnRHFCNWtWcDhkTHNhNGJTTWRlbnkyL3JGS1J0MWQ4NURCSkFSVkh3K3Nz?=
 =?utf-8?B?elA0WEc2QW8wQ2w3RXpGQk5FUzZlZjFhcWM1NE9JdDBwQXYzMkQ3Z0hBRUo2?=
 =?utf-8?B?dTVhK0tMZkhpM2t4a0phdjE3Y05maWFqUlpqNnpNaTU1dEZSQUIvYmVZSTF5?=
 =?utf-8?B?UFluOHI1WTU3WXdJTEptdFdSVGRPdHVTT2dBR0dOS0FQRkZoSkxSQ3psWjB2?=
 =?utf-8?B?S2xuZVdOUzVNRitWMGpFWUgzbXMxcW4xemJ2TFRTbTZpcVd0eG5ublRQY29S?=
 =?utf-8?B?TzkvRnlSYXZkVTkzSXorOTRteWZobUxpZVRld1Z1dldxcXFXTjZYMWNleGJS?=
 =?utf-8?B?bENtV2ZSVkQ1TjlFNGZiZG1BUEJDUWRyN1Q5VXB5UDVqbjdvdHVSS3JsaTNN?=
 =?utf-8?B?M1pycEpwNDZaSjlNR1k5elFWUm1ET05LYUpNY3V5SFpIQUNwMWtXeUQyUEZV?=
 =?utf-8?Q?LBRta0ziSDUsJ4zpnS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ede6b5b-5066-45a0-ddf8-08def8ac2802
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 19:59:02.5932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLLM1laSE0NXOiKmT/LXX9ozmCdIpG/+LeUVksBvebuqA464OjII77NA27m03tXc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698

Hi Reinette,

On 8/10/2026 10:03 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Kernel-mode traffic can use a different allocation and monitoring context
>> than the originating user task. On x86, Privilege Level Zero Association
>> (PLZA) enables the kernel to switch to a different CLOSID (and optionally
>> RMID) when entering kernel mode.
>>
>> Architectures need a common way to name kernel-mode policies before resctrl
> 
> Please pick one term and stick with it. While reading through this series I
> have come across "kernel-mode policies", "kernel-mode binding", "kernel-mode
> configuration", and "kernel-mode association". Is the distinction even needed?
> Could all of these just instead be: "kernel mode"?

Sure.

> 
>> can report what is active or what the platform supports.
>>
>> Introduce enum resctrl_kernel_mode:
>>    - INHERIT_CTRL_AND_MON: Kernel work inherits allocation and monitoring
>>      from the user task (current behavior).
> 
> The issue with this "combination" mode becomes obvious in patch 7. I also
> see that sashiko hinted at this issue but I am not able to see from your response
> what the plan is to address this. As highlighted by patch 7 and sashiko the
> "allocation" and "monitoring" features of a system are independent - a system
> need not support/enable both. This should be easy to reproduce by, for example,
> booting a system with needed rdt= options disabling allocation or monitoring
> features.
> 
> I think it will be unexpected to a user on an allocation-only system to
> see interface like:
> 
>   # cat info/kernel_mode
>    [inherit_ctrl_and_mon]
>    global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
>    global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
> 
> Should it not rather be, for example:
>   # cat info/kernel_mode
>    [inherit_ctrl]
>    global_assign_ctrl_per_cpu:group=uninitialized
> 
> Similarly the user input would not need to provide a monitor group when system
> only supports allocation.

Ok. Yea. We need to separate control and monitor separately.


How about something like this?

  # cat info/kernel_mode
    [ctrl=inherit,mon=inherit]
    ctrl=assign,mon=inherit:group=uninitialized
    ctrl=assign,mon=assign:group=uninitialized
    ctrl=inherit,mon=assign:group=uninitialized

If allocation(ctrl) is only supported.

  # cat info/kernel_mode
    [ctrl=inherit]
    ctrl=assign:group=uninitialized

If monitor (mon) is only supported.

  # cat info/kernel_mode
    [mon=inherit]
    mon=assign:group=uninitialized



> 
>>    - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: Assign allocation for kernel
>>      work; inherit monitoring from the user task.
> 
> I am not able to parse "Assign allocation for kernel work"

Will change it. Explaining in control and monitor groups terms will be 
better.

> 
> 
>>    - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: Assign a dedicated allocation
>>      and monitoring for kernel work.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 73ff522448a0..c7abed51cd5f 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -703,6 +703,37 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>>    */
>>   bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>>   
>> +/**
>> + * enum resctrl_kernel_mode - Kernel-mode control and monitor association
>> + *			      policy.
>> + *
>> + * @INHERIT_CTRL_AND_MON:
>> + *	Kernel work inherits the allocation and monitoring from the user space
> 
> "inherits the allocation and monitoring" is very vague. I think it will help to
> make things clear if this is described as the control and monitor groups being
> assigned.
> 

Sure.

>> + *	task. On x86 this means that kernel work shares the same CLOSID and
>> + *	RMID as the user space task. This matches today's resctrl behavior.
> 
> "This matches today's resctrl behavior." - This cannot be expected to age well and can
> be dropped.

Will change.

> 
>> + *
>> + * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
>> + *	Kernel work uses a globally assigned allocation while monitoring is
>> + *	inherited from the user space task. On x86 this means a CLOSID is
> 
> (same comment as above)

ack.

> 
>> + *	assigned for kernel work and the RMID is inherited from the user space
>> + *	task. Default scope is all online CPUs; a subset may be selected via
>> + *	the resctrl group interface. A CTRL_MON group is bound to this mode.
>> + *
>> + * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
>> + *	Kernel work uses globally assigned allocation and monitoring. On x86
> 
> (same comment as above)

Ack.
> 
>> + *	this means both CLOSID and RMID are assigned for kernel work. Default
>> + *	scope is all online CPUs; a subset may be selected via the resctrl
>> + *	group interface. A CTRL_MON or MON group is bound to this mode.
>> + */
>> +enum resctrl_kernel_mode {
>> +	INHERIT_CTRL_AND_MON,
>> +	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
>> +	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
>> +	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
> 
> Please drop comma on a terminator line.

Sure.

Thanks
Babu
