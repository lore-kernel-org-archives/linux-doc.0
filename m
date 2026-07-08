Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898F47CC8F;
	Wed,  8 Jul 2026 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522272; cv=fail; b=ODsQsONzywwWgC70PgtPeyI19zSUqE1/cAcOpVd1sOZ0DBbPbNc8MnceAa61961MNSqSS9FEIHjy1M4tCVmmB7UxVLvB5QKsLLHDQLsbdXczxUbqfOPUTTvKmLmmtJb5w8erdu9DX0Aj+y8BH8iSHVFhkLaBNASmGjcZBHkv7e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522272; c=relaxed/simple;
	bh=kPJC0hsdLAImP3TCqoxUF+kq2Y6QZz1NqCCs/0rcXtw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s7u/sTmSKbBymcVJbMRvbBBHOdEL56P1KwfSj5SC0vfKUB0kuP9VHqyewl78a5ZtLCWIl5m4IO9JRxvNPoPq1Y2w5DzGL5WAnXz5oHFwCDwcn/+zyEQEpQAbQH5/jGFrVs1q7qTEsNkuBkM4LoVn5EN5lLMXPm32bMc2RizteIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iRciKS58; arc=fail smtp.client-ip=52.101.56.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iRciKS58"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOuc9pD6ycKWZvf8yP6mLu7Ga1g5ucOhdWUCHTHaAFunq8EtKiLRVxPuHyghTC5G9hrwLOwPz8VzQmucUVO1XOaILCVwYZ9vrUMKu/Orx859PG4NX/4ezriV/WfX97v21uOq1LRzzmBgQh7irxhCA369UbnRjXMhibwhpYCXkFHkaeCcj01Xq167UOwIPjO8iEpGKA2KRMZKCFe3KtzN2z8kTgpZnnp0gya1RfCHB/H2A/1FxOL9ZjKefHIFY2Y6LZJd0cSiJIx11nKsWTgdtWS03TBVEA1p44BcDn+VFaGAa5ERV6Q94m8aQ3Vdjm/q/qgzBIwIaMZ4RbMRBzitjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EBtK/YjWkLTtEVdHiOIlweoxlptLunAf3Tq2pSDEOY=;
 b=KoFbBaUyFD16eC5o1FlKCL4LHkdFJGKeVxaOWe8zOq6HlA0RNcQSrVFS1t49U6hK5FZdGgNIRL4RS6s4XD4zRHgp+/rVlGjuq3iCT39ITnTKisFrnQkMaktxuBtd80FM8SnzYhYIz9Ego1b70NHE9F+V0Y4jTmDre/5xmt95zJmffmtOLRWMib5yxWpjdzeet62fRftAhPaZKv5dDMXBi7oVdLfxwInrSr5vc15/G+MHn4VfN0kC5MLT2ykJmTgiuxV1rLfRSWlEMNGPd9AglACIuE7XLzBdYy+NjqSR8uUISXwZUPnh6t3qPpDCQDvle1Qv+4UYdKj0x049Q+ZKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EBtK/YjWkLTtEVdHiOIlweoxlptLunAf3Tq2pSDEOY=;
 b=iRciKS58dvuujzszeI6sGAHoh+My3JXhxQKjnQu4dqgdqjUiz/JeD9g7iLKjlojuDFfTTZII4/V+iQR6k7J7f+z6z1heIBtNVpU/JTGxXUCjBRhVBfNfJEuzKwvQhxqUEWgmQzmlqywkgiJAne9s9T6FfYGPW/X+v/+k9MfNhZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 14:51:06 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 14:51:06 +0000
Message-ID: <017ac20b-851e-43aa-9043-f3a2def2a2e6@amd.com>
Date: Wed, 8 Jul 2026 09:51:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level Zero
 Association (PLZA)
To: Borislav Petkov <bp@alien8.de>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org,
 ben.horgan@arm.com, fenghuay@nvidia.com, skhan@linuxfoundation.org,
 x86@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
 peterz@infradead.org, feng.tang@linux.alibaba.com,
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
 <20260707220116.GFak13LChoDbSaCh1O@fat_crate.local>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <20260707220116.GFak13LChoDbSaCh1O@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0185.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::10) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e08683-30c2-4bd7-e1d9-08dedd005703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|18002099003|4143699003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	v4L1ZC42iEDV6quPp2rV1YFW5J340Nk0HZBQdce/YZ31JE+E6Hu+ueK8DeqOSc2MPp8Oxs9cxPVNPLudAXGD1+tBkVy0tr8eFHapSx2YPmqsYJh5mllwbTJLm/c2wzRHXKr+dy6/DMshx7XzGMkN9gLRlJMvM2yeLYR4A+8OtrozrOZAOCd6UzQD43yvRx0bu8fiiC+IKHPHo8GoJdQn8ZNr0knxE5gLFent8dDbkZfEqFL0dgLmkAvVxVrjbCNgDvFi/SACsQu6otHu92uRC6VV4fNTX4rZs3Gnvjm5kUAfOmHm/wRAhmOtkMjKdfhmivZmHfp9v/jN91/AN6boM+MMGZOclzD52StSCAqKBklzVdpeT/Sgc6zr5tSCfk+6yteQ30DBLiZAEba5Mo9LHNKgCAQVwkDW/Vfvu4DInjNa5+Y+9azPBIT9Hl2vSNIoQZoIFudHPgRcg17izIDAFF7/YAYrhamlSMxwNleVps6/sU9LIbFfOhn27Yx3u5ZqgVzL4nkHhFuW2S9nuEV59LB6YeIEmlRfK9zm1sUuSjfg0LSImMwGjbbTGbKR/BYmfDN4Dx3PBnr7JkB0pk7guWt0oPJB/77afZPpWiFT54aRJFGd6thz043XQskytHUHl/ZAwgHFhstrgvW2kFX558tkNICsQ4T4iF8hIrOxopM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(18002099003)(4143699003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEZjWThXeDdVRjVtOS9KVldubUFBU2ZpMnorNk5EREhLdmI5dTFxZWxSNXh5?=
 =?utf-8?B?YVpjMVdsREFaNnlJUXBDcVliLzBhQkp5OXdhSzNYSnJqemxiU24xNDJGSkpB?=
 =?utf-8?B?ZnZLZWwyemRzOXRiWUQ2MmwwUEtXMjVxZi9tNzE5NCtBbldlVHMvVzh4em14?=
 =?utf-8?B?N0REb1R5UFhoNkdkQ05ibVQxWGNYVnVNcXdzNktJNXhXNEJ1VFJxN2FaL0ZL?=
 =?utf-8?B?U1BmdDFuTUtNNlFCcVIrWkNnU3pPRDZXamdRd2RUajZRV3k2aTVyZHRaSitO?=
 =?utf-8?B?bHNpSVB2RTVwWWJialRSNW5QbXBXYVRXenVObUV2Mkk3WmJoVUo2ZnhIeW9p?=
 =?utf-8?B?a0RockN5UXZFZTNvSTRnWFh5Y0FkUERBMDR5Q3dzNmIvbXVlc2V1aEhhby80?=
 =?utf-8?B?ZWl0M0R2aU5nQ1hidHBqK3VhQTNnMXhvaHBRY25jQkkwQWNwczc0VSs2QVpz?=
 =?utf-8?B?dFdyd3Jpci80Q1VnOWh6eTRZQVVYSWdxR3Q4OUUvamtqUFVjYVZ3R05Ga2I1?=
 =?utf-8?B?Z2Y0ZTdqaWpiWEJLUVRQYW02UllJZUtQaXpnYitQZHRaVXU2aGVUdzVnTWNs?=
 =?utf-8?B?MlEvTFIwbGdLWXdhNm1iVHQrMnNtM1VIall5SWNZaUMrd3A4aXUwMGVxUHNG?=
 =?utf-8?B?L2pId1F2TngwQlE0czRUVDZSOFhjQlFIT1F6OFRFNks1NDJPODMzZHQ5QWtB?=
 =?utf-8?B?MGpWZUhvdU9Rd1g5SXAzZnY2MGVnRHdTK2dwSkw3dVhWNXA3bit2a2ZaVEdY?=
 =?utf-8?B?VjEvUGRXZmZEK0RQU3JUeU4rY1JxcTF1RktyUjJmV1FQM1ExWkpTSVFNbDFq?=
 =?utf-8?B?TXF5YmxDOEJHTnlMb29sOVR6NDZzVXdVM0twMFZidFRBNllGYzdYSHREK29R?=
 =?utf-8?B?dnB0TDJoa3RPeE1Gd2ZoRU4vOEMrUmtDVVV0ck9yWTE4UmVCd01iTGM3bEEy?=
 =?utf-8?B?K3Y3M1hGUzlDMUdCL2NiNnpVT1phWTVkeUlmTXpuTFZuTFFUZWFPb2t2bXcw?=
 =?utf-8?B?S0hYOGtSdDNnZ1U0Qm44eHR4L2RsWUVGM28yL2RqOXhuSG9nNXdiUTB1TFJh?=
 =?utf-8?B?d0k3MnlFU0NhdW9MUEdjWjZ2L0tlWWJOeGE5YitBVDhhWTJKTGVVVi9QZEJ6?=
 =?utf-8?B?M1BGUlF4WFZYVWMyNVd0ODc2NXV1MWUwMGk4YXpEM1FnUytsVE04Q2dISzlV?=
 =?utf-8?B?NWlhMko4MkVnUkFDcUxCMUJUZFJ2Q3hkTHFUOXJtSVdNbXRZK0dEVzRsOG1Z?=
 =?utf-8?B?TjZ3TjNUTSt2YkUwODRaRXRDUmFsMjlvQnpTaDlDMmZEbllyTlFQRm4vZEg2?=
 =?utf-8?B?eHJuc2Z6ZVlDN3FiRWY4dkhvSU9aNmtiQU45YjhuQ2h5OEJCYmFIcTc1c3A2?=
 =?utf-8?B?U3RlWG9IVXlZRHVtN2FGR1NFUmk1b3BOdHNxd2ZHN1ZjWXZLU1NRNU5wRTZP?=
 =?utf-8?B?WE45OU9icHExVzFNWDJCVkFTV1duV3h4Y3pSWktzc21veDcyVkJleGpUWkJ5?=
 =?utf-8?B?dVdaQ243UUtjM0EvdG5Bc2JmK0FheGxPZTZmSVFGSENtM0RFdXNiK1VpS3JE?=
 =?utf-8?B?SUJzOHJuOW9IUWdYTnNOOWxvbFlaNGhwelVkUEpIZzZINDl4NWdVejF0Nisx?=
 =?utf-8?B?L29qN3BhR25PNjBudGlaQVdVaHB0M09pTVp2cEdNb0NKV29USDd6ZHdhRmpZ?=
 =?utf-8?B?cjZDRXJMb3gvVnltOEZXWitJUzd1L0ExUjNKZWZvMmFlVUlQc24rZ2xhR3JW?=
 =?utf-8?B?R1NmUFA4MFpadGhWTTN6ZElOa0hoaEI0R004UjVYYXlJcUZIVFNkdE1LUHRx?=
 =?utf-8?B?aDNFdUg5K2tSV2dwdUpUTTBqaHVpUCtmT1pOdTlKRHRuOHlsMldrVnRBanJ4?=
 =?utf-8?B?TXE2OTZtaFNzWTRiZmVJbU1CNURaK3RMYWVZZG9OeVVLVVp6bEF2T0dpY2lZ?=
 =?utf-8?B?N0JNZGQwa2x6ams5Yk1WdlhManovaDJBeEhJRWNBbm10V1pBRlJ3Q000R3Nm?=
 =?utf-8?B?RVljejg0clRTS3ptQnJBbFBGZWpxbVZXQUQwOVFMWFh6czZJWWYySzFSMmxz?=
 =?utf-8?B?VGtQbVcvSlRoN253dGJQZGtzL3liY1AwOGZkUUZRam15amw2NUJVZWhHcnha?=
 =?utf-8?B?YVpDY0c3WVd5N1N0dG1vWDZZRUxKSUZncWYzOTY0ZXhENDB4TDhRZ0F3T2Mr?=
 =?utf-8?B?d1V0MnhjZVpKZGZBK29WQ0MzY0V5MnZSZEpZa2RWOUlOS3lUUW9CVTlXMVE3?=
 =?utf-8?B?K3RBN3Vxc25wMmVSeFBxSCtNZEpXVEhmelAyS2dVa0wzNjY3NjJFMXFpT0c0?=
 =?utf-8?Q?5P1kaL5Hx64J9Hi5WP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e08683-30c2-4bd7-e1d9-08dedd005703
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 14:51:06.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USQFG/wb4arxfE3Jwr5p47/TzY+nIuzEStAe8FzZ3SaWu4b7a2pLtIjo8YLyJb4u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311

Hi Boris,

On 7/7/26 17:01, Borislav Petkov wrote:
> On Tue, Jul 07, 2026 at 04:50:02PM -0500, Babu Moger wrote:
>> Customers have identified an issue while using the QoS resource control
> 
> Please drop the "customers" speak from kernel code.

Will change the text to:

When memory bandwidth associated with a CLOSID is aggressively
throttled, and a task with that CLOSID moves into kernel mode, the 
kernel operations are also aggressively throttled. This can stall 
forward progress and eventually degrade overall system performance.


> 
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
>> ---
>> v4: Split the patch into 2. This patch only handles x86 changes.
>>      Re-wrote the changelog along the ABMC changes.
>>
>> v3: Code did not change. Patch order changed.
>>      Added documentation link.
>>
>> v2: Rebased on top of the latest tip.
>> ---
>>   arch/x86/include/asm/cpufeatures.h | 1 +
>>   arch/x86/kernel/cpu/scattered.c    | 1 +
>>   2 files changed, 2 insertions(+)
> 
> With that addressed:
> 
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
> 

Thanks
Babu
