Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CF3C3BE2;
	Wed, 20 May 2026 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318583; cv=fail; b=jnVEUV9nphpbr2bylq8QtywYGmA9lovlh2isrNrE/NQPxnNrBnkQulpqog/H/vplg2DheVtXI0ZKAGKdwqYj1OvS1MFiv2+ijy39rrGRanvzOoedQteTb/Fx1eookYPDgCCW6lNur35HwvuUzmBSnVggAzRDI/wfREZ+8oHARLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318583; c=relaxed/simple;
	bh=/McGb526heZwg5s+1WHaghqcy48fLvxiUaG7oYHS6qY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J7FO/CAiN6alNcVauiOLZjRZkmIiA18N/sU7uDmzi4y0OvJvFU1KOD8EheFpr0oegFwVqz0BJ5qv8SEe5SCXyzNSf1an+U1J5eKeBCSGtB4+k/2D073Z4gStaLGqFgLQm8VPavOBJ52ey6LawWYJ6i2nWXkwIFn0MY1Z/YRFGTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rpBeJPfN; arc=fail smtp.client-ip=52.101.52.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rpBeJPfN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYvewEZN0VjJ2mAyIOaDgP2hdBzZZPsbTsK7owzB/gx6V/d8+K1XnjgVm1uotvQu1iFDYxAI3PVht2U0xyFvmaGeKNkWiQzzzkfpXyO1po+9G1GTn2wvh2D8c0tyX7wVn+u62416CpjNhQELwasKOgfEWj/GO7dzvJYSkFrZmml625eBntaVXG2Cp8DljlWbkPmAjminuOLpQo05w9BrH7CVEZ3RHj7ygD7gL+3Ya1wJ25yPdMx8S9IgPhSxeVr7vf5nNS/sSQsy3Qi3xC8zQoSJBDOEhzvxt8bcOzHOm1YXJUPUMHFFdAvfHf76FxLu5hIsuCLfhFAdXxYvLkqAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SLbX6pRR8NkyH1E29/shmPSDLQj0YAAzy3OZBmnipE=;
 b=MI6i5NnQvbNOhM59bMqY1bd+z/SPuONDX74mDn+Y9u31WdsB2Zs7bAr/TVNv4SUwISI6tyGqGr+bNfYR+lt3MIw2KJHXvC3ZtdaYCmJtH2hoPDNUAlOxqioSWv6zKvgTJ/UsLNOzQJ0kSm3TZSymSWVd5sUK0bHZ6NqId15jxsEOJ1MNkLVoz6k90tkXvWth9zlnvcxaeuaLvukH3ocRr9lvLFyoXG+JVt40uk9b+hixSL10kYJ6PcuZPsB14jPVCEVpVJsGsAOM6/rz030ZJVTeuCgaP2O6iUgUWio9g3CHI28b86wd8EJw+AKQnudlRCl2HnkYh5uH94ToJVcOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SLbX6pRR8NkyH1E29/shmPSDLQj0YAAzy3OZBmnipE=;
 b=rpBeJPfN7w7KGubAscOrwvN3Zlu9YpU8dbYmrgqb/faA3sJH57fZug69xUlPmg/1makhZ1stztVposCg0Kuez3vZN28Kg+dGy0ZoVmWGZV4fV9x4gbGesCER86kBNjTbNS/CErXgRcAuy4mZmYnzxXaxvz8BSyP8vmEnN47mKDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
 by PH7PR12MB5758.namprd12.prod.outlook.com (2603:10b6:510:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 23:09:34 +0000
Received: from SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f]) by SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 23:09:33 +0000
Message-ID: <a56f8ecc-cf1e-48a4-836d-7e7723072c38@amd.com>
Date: Wed, 20 May 2026 18:09:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch
 hooks
To: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com, skhan@linuxfoundation.org, x86@kernel.org,
 mingo@redhat.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, pawan.kumar.gupta@linux.intel.com,
 feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, kees@kernel.org,
 elver@google.com, lirongqing@baidu.com, paulmck@kernel.org,
 bhelgaas@google.com, seanjc@google.com, alexandre.chartre@oracle.com,
 yazen.ghannam@amd.com, peterz@infradead.org, chang.seok.bae@intel.com,
 kim.phillips@amd.com, xin@zytor.com, naveen@kernel.org,
 thomas.lendacky@amd.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, peternewman@google.com,
 sos-linux-ext-patches@mailman-svr.amd.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
 <agzPTMvJ_LdEmKXe@agluck-desk3>
 <1a410ca9-f4a2-4956-8477-033d61a733be@amd.com>
 <ag4ywKHsH1Fc15wH@agluck-desk3>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <ag4ywKHsH1Fc15wH@agluck-desk3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:610:33::30) To SA3PR12MB8803.namprd12.prod.outlook.com
 (2603:10b6:806:317::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8803:EE_|PH7PR12MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fcaa7c3-c793-4284-d8f0-08deb6c4da74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|3023799007|56012099003|22082099003|18002099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	uRuXGxfPuPbHXqrz4nL0vjeLgqDFn/drrtuWlqwvXmjEKmdLr7/C+lUFHA5r6ea+NfOFP7zobMy7nVIEDQ9uspMH1FvFBrQQSJ9SiuqJcG22QmHnRRRarNLq/Bkp7tDZvucMtoDH6fLheS3yF0mp2HECKMVYvIwwD4kkoIxB5vk4VEyDypLNijXBkAjwZ2hvlS0UC3dU4bGHsTffWU7ynjLyUL62Kpy2THJXEMc5c0goB/gfrYMQv/yySsBYwUNTHZL8HbMBnHp7ZL7aLXuixWFWWaC6ydPsGTk+TlT6T5OkW3Ojsw/GNNYcfFLOZ6ImkqIBvsTVPz3tbENJpYfWX5nveukvN/Fe1GJ0MZsnyhpdLaZUqMRXkroaXr9OVmoZv5xrz2NhX7Mo5T04bKrkvdjejtqRNWPFmlOlp/leWMO8+O5MvafP0U8SJS3dZAQWEPl446Mp1b/NeVzN+UVEssmBx2/q2SSsycD33XN7AMUqV204lLdlaP6FvHm40TH4IKnRpGrMFzEIG1xKLMucfQcSF9VJtYIXjsQxWZRZQ6PtNFll6pmlfKIO8Nmbp5AWwOw0UCwmsD6vKVMJJu/VaWU7eoHTIjyNplO/HsAg40cmAwZOqdtJTs5W+61kyVWfNyjm7xXOi4hzPjl7tuG/l8IPYTpvzMVlK5qj1X59Dm3BcgEsLk+t0lBHsnRMlqvw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(3023799007)(56012099003)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0pESlJMV3JhTDRrait2TUdZODBkU3M1SE53VXNXSXprUWlwU1czeit4aVgz?=
 =?utf-8?B?M3FoWTZXWWJTQVJoaGpIT2NxMjlmYzZldmRwUUdoN0JTOG5PNGFlM1BtSGJ1?=
 =?utf-8?B?bGZ2Y2VZSGJ2ZFdDUm5qMjFmVjZFOU4wYVRJWEVDUFM2cEpUMG5ncTdUdnoy?=
 =?utf-8?B?bjJOTFk0SHN3YlI3OHdDVXFpUE1najZaSkp2Q2l1b3JyVHQyenMrVnNnNmo2?=
 =?utf-8?B?aHpyeWtmU2lOWkF1d1hhbzFORFRNSTJLVnQzV3VVY0dwc2FYU01vb2ppYXM0?=
 =?utf-8?B?cnFPbFc3TVlMS25WZDRRdHFwMWRjSHJtbUdZMmFwRmlhVTh2QkE5SjBhMTM3?=
 =?utf-8?B?UFdJQ3hSQ1ljQ0JIeUNpaFdLV3BqS0UraWNhc0Y5R0JiME12T0FCV3JPTm4x?=
 =?utf-8?B?Z1QyNHFjaUtjMlZmTVRBU1AvZFBmQ1RIaWhBZFljZlI2YU9zeXZod0dUUlJn?=
 =?utf-8?B?d0xycHFiR3FVaVdoT0RXOC9hOW13RnJ0ckNaakI2NndHUE5oRk5uY1VaTUhY?=
 =?utf-8?B?MjdKeHB6K0s4WFhIYW9aL0JPQlIzR0VKVjZhd0F6OThZTUh5U2VHU0JuT0R2?=
 =?utf-8?B?OXlJSVcyRnNnNVJ0bFc2MjQ3ZUxoM2g5ejBCamVsQTl4WVFNaXVvUmdqUjB5?=
 =?utf-8?B?OEZJOUMzdWxCOU91UkNpR1g1SmtyTkVpVGpUZ2s2M0tsdmNxUVlRc3dCVUwx?=
 =?utf-8?B?N2NGTkUxaThEWVdKYWl1alE4SmorM1kvTFVrODZJMHJwbWVROGd2UUpvNUdE?=
 =?utf-8?B?U1p6OURkZXZTMTNKbTF0SkZlTUlPYXNhaGozYXQrUHFQenZSVnJnTVdUQ25N?=
 =?utf-8?B?eHdmQ2oxZTh2NWVkcjV5NVFuZ1BFU0pWR3hjbzRzdHZIa0IwUkQ5Q3dvSXBK?=
 =?utf-8?B?WE9UTUdiREVmZGVxTlcxTzdmTWJzamNhanlMNm5DOEhodjM0bGdObjd0MHlx?=
 =?utf-8?B?eUZLbUpLNHE4NG1ybmdJOExSNnhPbDdmdE5zSkl4Mmt0cDRKR0Y5VFlqcWZZ?=
 =?utf-8?B?MUFlczd4TmhkVE00QmJjQkJVQWVnWVFaZCtZY3RZa25ScHo3WTdoTzBJQk15?=
 =?utf-8?B?Zk5wUDlvUCtxZVZtQVI1NTRZRFEzT3czbitDL1Q1c0hsaWpMMitCbUFJcURw?=
 =?utf-8?B?SWRRSFNlRFlhRVdmQTkwMm5uYzgrS3hFMm54QlJXVTBjeGoxKzREVzE2ZWF6?=
 =?utf-8?B?a3dvU2MyWmxOSk1DMVA0VHBqV29MUEVkTFRHTDc2TytOZGRQbkxaNDNoMHpO?=
 =?utf-8?B?TU1jVGticU90dng5RTkreTBwYjdxbEtHUjdmS0dDbzBQOWVlQ1dLWTNCbXQ4?=
 =?utf-8?B?c0lPV28ydUJSeUY0ZHFlZEQ4ZWI4Y0Y3TjJIYVVhbDZZN2txWXQwMS82Tlh4?=
 =?utf-8?B?WHFsaTZ1YllxTW5BeWFUZEROYWlXbGdHdGVxeEt1OXRyQ1JXeVF4OWw3NUJQ?=
 =?utf-8?B?bnVhZG5YN2x3cjNTbDRWV3VLUTdoMUpHd1dOR2FURHNPSjI4cmFWSFpjVk52?=
 =?utf-8?B?bXFMUWxHTHhLZnVHb2dhWUtRVTQrWkdjcVdHZjdDU2Iwdng0TnpmbnBwMnFa?=
 =?utf-8?B?Z2ZVYzdlVlQ0aUZFWldOQ0kvNG5BSnRGRUR2bDBrcGNnMC9BUGpWSVZZL21Z?=
 =?utf-8?B?RC9RU3puajhZUjRHVXQ0R0JNekhhRDN2NlI4d2JVakovYTFVNXNJeW1jUW9O?=
 =?utf-8?B?dWtCSjhJQU5vZVlheFVrdloyN0J6S3drTldQYkk0RTBnQnNQZ0NiQjd4MWt0?=
 =?utf-8?B?WXBDNTNDNEc0L1llenNmV0I1MEVZZVphZ3hCY1IxRVBBa0liaElxYnJDYkpk?=
 =?utf-8?B?bkdGRlcwQU8rR1pCd3g4QlltVGM1eXh2ZjFqc2tFVDJJWGYzN2gvaUpwanpD?=
 =?utf-8?B?OVdrQTVnMitiSUhrSHFYVllQMDB6dVExdFdvMjZiTVJXb09yeW95VUg3L01x?=
 =?utf-8?B?a1R6V0RLVkJrek01MFpIMjBIUHRXR2hMTExvL1k1Y2JRbXJzWHdyTEcwSHZa?=
 =?utf-8?B?akZxSkNhS01BUXFVVnAxMkxqWE81Vm1sckNrYTVONTJQdHc3RDB6THFSUE55?=
 =?utf-8?B?Y0hHSmlOWUZjYVExVGdSUHpxajdIdHk0bFdqVVFNN0hMT1hDckpRRFNFWDF3?=
 =?utf-8?B?dFl0QnVndTlpRmF2R3lzMFRkVHlSd3ZKTU9KbnE2TXhDUDVMUm4zYklaaERx?=
 =?utf-8?B?ZDJwVVFHMFNpaHpIOUVWTXZhWktBNWRwaHY3QklvcjV4Z1EvVE81RTFhbS9E?=
 =?utf-8?B?ZGtubjVMakFiU29pRHYwT3d0NHZRblRIZVdYZEJhVEErcUk0MzhmVWlDRnpt?=
 =?utf-8?Q?vBHqf3zKSFSWsA1bNd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcaa7c3-c793-4284-d8f0-08deb6c4da74
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 23:09:33.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFudGqpr29zpcnmbvz7uCuYhfjkX1JueFDHtX/7RwaMxbN4tLMyWvxDguMLB7/W5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5758

Hi Tony,

On 5/20/2026 5:16 PM, Luck, Tony wrote:
> On Wed, May 20, 2026 at 12:49:25PM -0500, Babu Moger wrote:
>> Hi Tony,
>>
>>
>> On 5/19/26 15:59, Luck, Tony wrote:
>>> On Thu, Apr 30, 2026 at 06:24:49PM -0500, Babu Moger wrote:
>>>> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)
>>>> +{
>>>> +	union msr_pqr_plza_assoc plza = { 0 };
>>>> +
>>>> +	plza.split.rmid = rmid;
>>>> +	plza.split.rmid_en = 1;
>>>
>>> Shouldn't there be a parameter for the value of rmid_en?
>>
>>
>> I realized that behavior is not required—it was actually due to a mistake in
>> my v2 series implementation.
>>
>> Below are the relevant definitions:
>>
>>
>> GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
>> The CLOSID is applied to kernel work, while the RMID used for monitoring is
>> inherited from the currently running user task.
>> No separate monitoring group is assigned for kernel work, so kernel
>> execution naturally inherits the user-space RMID.
>>
>>
>> GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
>> Both CLOSID and RMID are explicitly assigned to kernel work.
>> This allows assigning a dedicated monitoring group for kernel execution and
>> therefore requires a separate RMID.
>>
>> Example: For GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
>>
>> # mount -t resctrl resctrl /sys/fs/resctrl
>>
>> # cat /sys/fs/resctrl/info/kernel_mode
>> [inherit_ctrl_and_mon:group=//]
>> global_assign_ctrl_inherit_mon_per_cpu:group=none
>> global_assign_ctrl_assign_mon_per_cpu:group=none
>>
>> # mkdir /sys/fs/resctrl/ctrl1   (PQR_ASSOC closid=1 rmid=1)
>>
>> This configures all the CPU threads to use closid=1 and rmid=1 for both
>> allocation and monitoring across user and kernel modes.
>>
>>
>> # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
>>    > /sys/fs/resctrl/info/kernel_mode
>>
>> # cat /sys/fs/resctrl/info/kernel_mode
>> inherit_ctrl_and_mon:group=none
>> [global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//]
>> global_assign_ctrl_assign_mon_per_cpu:group=none
>>
>> This overrides the previous configuration, and PQR_PLZA_ASSOC is written.
>>
>> Possible options:
>>
>> 1. (closid=1, rmid_en=0, rmid=1)
>> Here, hardware uses closid=1 for kernel work, but RMID tracking is disabled
>> for kernel mode.
>>
>> As a result, reading RMID 1 reports only user-mode activity
>> This contradicts the definition of this mode, since kernel work is expected
>> to inherit the user RMID for monitoring.
>>
>> 2. (closid=1, rmid_en=1, rmid=1)
>> In this case, RMID tracking is enabled for both user and kernel modes.
>>
>> Reading RMID 1 reports combined user + kernel activity
>> This aligns with the expected inherit_monitoring behavior
>>
>>
>> The preferred approach is to separate kernel monitoring by assigning it a
>> dedicated monitoring group and updating PQR_PLZA_ASSOC to use a different
>> RMID (e.g., closid=1, rmid_en=1, rmid=2). This is exactly the behavior
>> implemented by GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU.
> 
> So maybe I'm just confused by the name "global_assign_ctrl_inherit_mon_per_cpu"
> 
> That sounds like "Use the CLOSID from PLZA, but keep the RMID from
> legacy PQR_ASSOC.

Yes. That is correct. We need to work on naming this correctly.

> 
> So:
> 
> # mkdir ctrl1 # maybe gets CLOSID=1, RMID=1
> # echo global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" > info/kernel_mode

This makes kernel mode run with CLOSID 1 and RMID 1(Use the same RMID as 
the user mode). [1]

> # mkdir ctrl2 # maybe gets CLOSID=2, RMID=2
> # echo $$ > ctrl2/tasks
> 
> My shell, and all children run with CLOSID=2 and RMID=2 from ctrl2. But
> when they do system calls, take page faults or there is an interrupt I'd
> expect the code in the kernel to run with the CLOSID=1, while inheriting
> RMID=2.

ctrl2 is not a PLZA group. So, RMID 2 is not connected to PLZA.
> 
> To make that happen, I thing the PLZA MSR should have rmid_en = 0. But
> the only code I see that sets this always sets rmid_en=1.

Setting rmid_en = 0 in [1] disables counting of kernel usage for RMID 1 
(from ctrl1).

The key difference between the two modes is:

In one mode, user and kernel usage are counted together.
In the other mode, kernel usage is counted separately from user usage.

Please feel free to continue the discussion if anything is still unclear.


Thanks,
Babu

