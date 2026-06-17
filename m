Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C348033C;
	Wed, 17 Jun 2026 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713747; cv=fail; b=rz539qA0iUlscHQNdmiE4adli/D+poJTILhziUg3b+E8VLZU2jSPL3tSeF+Tu2WNDrLul93gr+C8rge5BHQeF4e1CPidMTu7WiB+a+OFV26ha+lcwtjSfxk4dpMwXt6slgQwTHB7UPMPdHlILNn1mWOF2fz170OqK2PMU4fDNKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713747; c=relaxed/simple;
	bh=WnG/0VH5RTAy3ITzJ0Kad12dfuGkpWpfqps++8da4Hc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=go6KBsZ6nZAYm2geKvlMYz52Tv+jaArlWXmwWMndodre7XiPbAELDpePjKVttvNUq2cEvkwv8ezXr6ppC9B5EU8mjzO93ETsy5yfAXw55FdGBoXVavTFZoi8rUccoNuP4Cuyxbzxzfm0owXoi9nZszU1/WgZ+7G+/XMimL2UM0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r36s7PO0; arc=fail smtp.client-ip=40.107.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r36s7PO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTeHIvJEbf60ZXLF5qQkjqiXRgUy9R2rQPxTyHKmEVxPh62SacYD1bHplNQUDm6kjXBnchueg2ogCId1/mMH9E3hyhiGNMyEgA0Ql1wHLBfZyEA69eX36RAs0BCnBi5dMsToJwJSo/Ucn3e4IaNCzssD2qMw2kJ9bFSeAlqQAwR9nRFP5kZ26CSXB8H6Hq9GeathxsMkY71avxaTwg9QenGE6VHYMZFSVV6Wo7VwyfK0D8R8IkXWsP93qfJ+kH1vIHCmAcgRAz1MEJ5+yi2bk58IkDPbkisKzIBR5Iv0YQ3h0wsZTw543e6sne5LKs9YFSL4jXvab5jhxq8lLfDanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s09ELI2fgq1gOgprCgBW918HNVwfUJZ0z+hoEIW5hYc=;
 b=j4quPgJM6rHoPO2FWkzfwJ3BYpBCR4DP/Z/Q2UKh4ghx9nfTL+wmdoQRzHKfXKIIwIQH3fcJ4xU5AxtZefpJEJzXu/7yPjd39D1NhX5now/xa29nfS+Rp15D4uD9Q80Y2IUr+r3x1FlIIi+4Fbd48PXCtJqwtZzXPNOyAZmW+2dB0W1jwFejZomakIXKia1MLtz9OTjdjP5qx86gOgH0pLGF4hOP46P0OwRlio8ySDEu6kzoru+sWkEgp2ZJw8BTjbTawf0XmWHqxeyXNd/b7wqf5znk7qspP4rAKGgGO3z9Av0SKGnw7HXsualuAXoKyoCFGBUbmWndi/Pat2SY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s09ELI2fgq1gOgprCgBW918HNVwfUJZ0z+hoEIW5hYc=;
 b=r36s7PO0BnI2laQobGyGyJfy5ST2trF10UjBN7P5QsGKE+WZKpmWUVy7h/BSZcTRpKmVBu6z+TA8oC5l1VlbfeQ0R1jQsJwfy86Ma58WymK5hkBBP8hAfK7nQ3mbijt7IKbi1otbaSZS5fmHrOv73vjjGFP7i4V3qasFvL0bYgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 16:28:54 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 16:28:54 +0000
Message-ID: <a5041b92-36c5-4ce0-811c-277a41f4d01a@amd.com>
Date: Wed, 17 Jun 2026 11:28:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] x86/resctrl: Support Privilege-Level Zero
 Association (PLZA)
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com
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
 <f59c7f5404f29b2901af68d8032ee615b7f0efea.1777591496.git.babu.moger@amd.com>
 <081b5cd6-37a3-4aaf-862b-b41e9536bb66@intel.com>
 <a737ae9e-9cbc-46bb-b565-0b888e69f0ea@amd.com>
 <353185bd-2b3e-484e-bf4c-e774c70ea63c@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <353185bd-2b3e-484e-bf4c-e774c70ea63c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::8) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d2f783-d45d-475d-4698-08decc8d85ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|3023799007|4143699003|11063799006|921020|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AE4ER0AMLOmeqqgJnxlHLJGW0Q9PMkVGhlJHi4GZX2vyC1e/B5WiCPeMvCHryrIZWIiHHqFcOPIH3pRhJIjHQt+c4CebujrF7Q1fYDv05wnB0zeYkRMZm7eBOKFM2MV8Uu2Qt5yzxOZSyxqdTlsJIZsajgqnDr7lVQKES9VFpw47VftiLOajtBvcMqgEObbh/hoUk9DNNLA/Hef3/DA9ui2lME6CsEp9p2te03ENH0r4hD9MbzljywvcEeAuGE5WOJuYEQgp3fJtuO2wpADyGz6BpIP02X4vXbX7HgOd3my5NQ3WyJqp7v2nXSihm29Lmqb5FGuJPwEMmRaQePbVE7fQVqFxsGeBRg92PcuaHJvPv5lpSiBjwX1zJAoA6PJJLmVAvGK3lj6eoliD6zxWIhJFjAqJB5Aaz7E0/SVS9GcpblwDgNR3k1G2qVPVehDEYgFuBax/aT9LzDgZa90srfm/1x9eHsJZO8NTscs8zH5me4UU0n4KpVyE7HyQfuwBN18SDq8bWTbAl7Xcz07Lc4/Lq6qXpVaR8/D4yKKS6nrr4kPtiIu210kMW4WWrTCMRoPB+7kIUGOwQSyi3n4tAee28QZUF6YIIVruyiXjCm8+T5exho01OuoHHmS1V/n8DDVe0GWVggXHsddIBvb1uBhynsTLd8zoI1/aRjKH1u0C+uRYyK6+oI3TueivFLYR2SRh1Ns4Uqa8z1deyphvtKsAvZq4dDmCs9patTakYCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(3023799007)(4143699003)(11063799006)(921020)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVZZNHVnUFMxczBpTnpsQUpZbTF1TlBEUUJTd0wwYWVad283Vk9FRSs2aGFN?=
 =?utf-8?B?R1E0MEE1UzkvajE3WG5KbFFFQzJFekVHc05MWDMxZFhQbHNLY1lkQThrS3hK?=
 =?utf-8?B?Qm5xVWVBT0xaNE1HUVVpWVBySnlocThVcUZZSXhwOHRwQ1RTRDBELzl0Y0Nz?=
 =?utf-8?B?amdxeXRRdGhubXNhMElzUVhDcXArcXpmZWNOV0dydFFzSjBSNGo3eGtuNnJV?=
 =?utf-8?B?eE11U2JmZXJGcWxrWEhzams4SXdZOGdkQTBMTy95amxNLzBvN2xwUDVoQUZU?=
 =?utf-8?B?Q0dLYkpsSTA3SUZRSDMwM0R2LzZ3T044QndUeUpZZ21IWlFEa2xpcEdjWGFW?=
 =?utf-8?B?ajluVStGL1BkNVFkcEZoa2piS2ZnR1NSbUFTZ0svVHY0Mk9CYVRCc1c0TVZF?=
 =?utf-8?B?TEdsNExvWlRwSFgxSmZvQXg3WXp4b3dURnlRN1FPWHdBVWo5bmd0RWRwMUdK?=
 =?utf-8?B?YmxLaXRlZG1uOXgwOWI1N3JrMmg5RC9yc0NCd3JFT0N2QmY1Ym9CWHdLUGhR?=
 =?utf-8?B?N1lXM3Bpc2JIbGJYNUkzaURIMmRIL2liditMdXIwVHNWb294QjFIMXduUDdr?=
 =?utf-8?B?bGJaQ1lEWVFHcU1wTkp3N0tkUVJ0WmhINVpSTzNPc0pXTS91WE8veVlGcXhM?=
 =?utf-8?B?ZWw4UzFOSmNwOHkvQ21reGVOYmJRRnM4K2hUT0dFeWlFYnc5eDFuTlgzdk11?=
 =?utf-8?B?WE1xaHZHSzMybnArMmpRdXJFcjBrT21WOXNrSm9OcnlGc1YvOHN4WkVVR0JM?=
 =?utf-8?B?RkFVcFpRTjdkYXFoWW9oNk00UE1hMEVZdGUxUmlHWkVyS3RxWGpSc0V6VmFm?=
 =?utf-8?B?TFZKdUpSaUF4MzNWTGx5anhJbGx0NkNUMkRIcW1WYkhOR3RMZnBNZmQxVVRW?=
 =?utf-8?B?a3ZlMGVXVDRzcVJreDNUMWZHSys5WjZLclVNMFFRc1ZxM010dFA5TFIwUGRZ?=
 =?utf-8?B?VnZkbjROT0ZIKzl4SXREeCtaTXczUlJ4L1ZKMzF6OUJPdS9KMzJkY2plekhT?=
 =?utf-8?B?NmFLK21vSnNVY1ZtdGNOYXZGRXMxM29NWmcxZTRzNlZVWjFZais2YkFRcnNu?=
 =?utf-8?B?c095aXFDSFRUSGtubUY0TVh3dzRxN0hTdHhIZkxwMUF0Z2p4OVlhNjRvMks5?=
 =?utf-8?B?OWFScjQ5bEJnbC9jUmpsbmplQXpiUE9oR0p4L1hpM3dEREIwS21Pd2x5dG5M?=
 =?utf-8?B?WUNPRnV5cFI4ck5hcmt1ZEtUbVQwM2d6NG9GbnF1alprNEdmbENsNTEvRXh1?=
 =?utf-8?B?eFZPcExHWXdSSUc0ak9PbDVJODgvNDJhbm9CdWRvTXo3OEdMYklPMGxxMlVV?=
 =?utf-8?B?VFlQT1NVMVFDYVVZdEVEOEtOaDJvRVVGM3BFT1dwcUVFdWM0MnZPTFJvUStH?=
 =?utf-8?B?MXhYUzBGOWxpZlhieXFVU3RWbkJLMnNzWWs3RG54UFVHeW52RHpScUVhS0Jl?=
 =?utf-8?B?bjg4dEhmNFcvODNOZUx3alZzR2I4NXR2cWp4SzFLS0laRm44QmkrR2cwdUp1?=
 =?utf-8?B?aEVXMENKc0l3RXY3bFREV094VjlGcElIanJTWkVJOStBWUs4NGxqQ2Y5S1hX?=
 =?utf-8?B?VjRvbWhaS0dESW5YdmNyMzA1M3lTYjhiNVNkSSsya0VSTmJIQnN3RmdweGll?=
 =?utf-8?B?bzM1NFpwcmhMTm5VYVJnYmQyYVFzQncrUExLY1ZKT1puUHpuRVB4TDd1QUhW?=
 =?utf-8?B?bFk3OFNRK1RCelorNVAzNnNETE1XQ0tXNGNBaFQzV2NWOVk1WEZCcWNieW5h?=
 =?utf-8?B?Um93alpRSWdnNHJRL2lOVGxYMjhmSUw4V3djeFZha3ROWDNTZ08vOHFlQUs3?=
 =?utf-8?B?YlVnbFlZSlRPVEpwNVlnSjJBQmNDTjdLN3NlOG9mcUVrSk9ZT2hTaUdhbnpH?=
 =?utf-8?B?ZjJJYUM3amJzNjZOZW5tS3cyTzdoQ1pJRlhTTFZyMURxUEVFbjZreG0rcDll?=
 =?utf-8?B?Y1gyaUFuRllmVjhSdHcySkxldmsydXF0TjV4WTNDalN1ejBRV3lYMy8vNU1Z?=
 =?utf-8?B?WVRIMEt2MUYvdzJXZnZpajdaWUMrdXkyejMrNUVHTGRSYklkYkd3OEErekYr?=
 =?utf-8?B?MUcxcTN2anRqcDNvNjAyQzYrcTRPcFFkTVM2bXpoTndQWGZMditINnBNSGk3?=
 =?utf-8?B?SXRXa1A5akp0QzVyUGVkMlVkclQ3NHZZMitvcGIxdGFlczBkQklxYWg1KzVP?=
 =?utf-8?B?cjEvc2FZb2Zrc0I1YTNiR2ptblpmajl6ZWdRWjRJSFpvRkVMZnI1MnpWQisv?=
 =?utf-8?B?bkd1NmlOTEZmM2VWNVZNM25NcUU1cFA0WWg3ZDNGaXBYMk4zS1hzaE94Q2Mz?=
 =?utf-8?Q?ep131uGCQ1LvOw5YV4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d2f783-d45d-475d-4698-08decc8d85ce
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 16:28:54.2016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGB45T+Pa4FeCpDRzZN4aRekWuL3RL0JcbsySMcq9CWawwbDYRt+MNtt/AsF0ump
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582

Hi Reinette,


On 6/16/26 19:00, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/12/26 9:56 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 6/11/2026 6:23 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/30/26 4:24 PM, Babu Moger wrote:
>>>> Customers have identified an issue while using the QoS resource Control
>>>
>>> "Control" -> "control"?
>>>
>>
>> ack
>>
>>>> feature. If a memory bandwidth associated with a CLOSID is aggressively
>>>
>>> "a memory bandwidth" -> "memory bandwidth"?
>>
>> ack.
>>
>>>
>>>> throttled, and it moves into Kernel mode, the Kernel operations are also
>>>
>>> What does "it" refer to here? From text it seems to be the "CLOSID" but that
>>> does not sound right? Should "it" instead be something like "a task with that
>>> CLOSID"?
>>
>> sure.
>>
>>>
>>> "Kernel" -> "kernel"?
>>
>> ack.
>>>
>>>> aggressively throttled. This can stall forward progress and eventually
>>>> degrade overall system performance. AMD hardware supports a feature
>>>> Privilege-Level Zero Association (PLZA) to change the association of the
>>>> thread as soon as it begins executing.
>>>
>>> "change the association of the thread as soon as it begins executing." I am
>>> not able to parse this.
>>
>> How about ?
>>
>> Customers have identified an issue while using the QoS resource Control
>> feature. If memory bandwidth associated with a CLOSID is aggressively
>> throttled, and a task with that CLOSID moves into kernel mode, the kernel operations are also aggressively throttled. This can stall forward progress and eventually degrade overall system performance.
>> AMD hardware supports a feature Privilege-Level Zero Association (PLZA)
>> to change the CPU association at the user-to-kernel transition, so the kernel execution can use a different association than user mode.
> 
> "change the CPU association at the user-to-kernel transition" -> What is this
> trying to describe? CPU association of what?
> 
> "a different association"? What does this mean?
> 

Will change it to:

AMD hardware supports a feature Privilege-Level Zero Association (PLZA),
which allows the CPU’s CLOSID association to be changed during the 
transition from user mode to kernel mode. This enables the kernel to 
operate with a different CLOSID than the user mode.


>>
>> Privilege-Level Zero Association (PLZA) allows the user to specify a> CLOSID and/or RMID associated with execution in Privilege-Level
>> Zero. When enabled on a CPU, as the CPU enters Privilege-Level Zero,
>> allocation and monitoring for that CPU will be associated with the
>> PLZA CLOSID and/or RMID. Otherwise, the CPU will be associated with
>> the CLOSID and RMID given by PQR_ASSOC.
> 
> 
> Sounds like this is vague because MSR_IA32_PQR_PLZA_ASSOC has not been
> introduced yet. Could it help to introduce MSR_IA32_PQR_PLZA_ASSOC as
> part of this patch and then the changelog can be specific about PLZA
> feature introducing this new MSR and how it complements MSR_IA32_PQR_ASSOC?

Its probably better to remove the second paragraph. This text can go 
with the patch which introduces MSR_IA32_PQR_PLZA_ASSOC.

With splitting the patch, this will only have cpufeatures changes.

> 
> ...
> 
>>>>    Documentation/admin-guide/kernel-parameters.txt | 2 +-
>>>>    arch/x86/include/asm/cpufeatures.h              | 1 +
>>>>    arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
>>>>    arch/x86/kernel/cpu/scattered.c                 | 1 +
>>>
>>> Please split changes to other subsystems and make these changes
>>> obvious with their own subject prefix to avoid sneaking changes into
>>> other subsystems via resctrl.
>>>
>>
>> Ok. Will be two patches.
>> 1. For Documentation/admin-guide/kernel-parameters.txt
>> 2.  arch/x86/include/asm/cpufeatures.h
>>      arch/x86/kernel/cpu/resctrl/core.c
>>      arch/x86/kernel/cpu/scattered.c
> 
> The resctrl changes found in (2) would be documented in (1)? That does not
> look right. Why not just split the resctrl changes from the cpufeatures changes?
> This would be similar to how you did ABMC enabling.
> 

Sounds good.

Thanks
Babu
