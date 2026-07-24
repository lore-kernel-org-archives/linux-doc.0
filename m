Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093A93A785A;
	Fri, 24 Jul 2026 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926664; cv=fail; b=CZmDhCH37SNQRA4D0gzKlZgIjtpkY0inYOq6rCc3W2pEsj6PZdtxGwuupkKfnqfGTMrd0JAyOaUI2HAB93gdGB3hu75xwz/vXkpcznQY4Wbyf6T+WOzoAlxz5uUYMbdhN/uC7+2k67A4Kc2uTU4mttHtlImd9k27V8eFKiriWQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926664; c=relaxed/simple;
	bh=jxIVgR/5XEwrLcocCyc7s1Qig6ntfMfIneKzCKqDwqk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aOkZjjYvePAjq8jNqAnG9GwCNa5SHhDgF94kJyxzhmlKRv6Wro3RsRYokpZUkbWes4gamW/C8Zlxeu0AAw9cnwxuO8mPNlbrdrYS8vJ8nEG2q8Z2+V/5Sp68vx7q4G6yXXEQWoQ3QARIo75RRRz077FDaq6L3OM6dKS2ZJ/RBEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A4mu5vzR; arc=fail smtp.client-ip=40.107.208.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A4mu5vzR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drlL43j8/8oBrx4/GhKlyQpKM61FzTbd20+kY2QunFsBWm4WswOnbycG2naZ2MrgLb6g2ZTPQJh8vFdv/+p/u9ARxc/Ueqd0F8uidH1rUdxL0a8TIpum5PEq51W+VKCnck5bXfSo3VkuCJpNdUi2M73tNvgeI6uaER4shvLomiTq+1W3oHprRLRPwtn9Lo+Jz/FxgJa2d1t4WHPcGoU9BIhdsrAaaKnluNsNZvxp0aATDqPI5xmxyLJV8OPN7/tIWqeIsdnCZ98CaqJKWKk4SA3+KEtbccIrcU+kps+3adEIge5Nn5JBlFB0ZHB/VojHzcNSLuga37clHilRffsUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5OIvhCsNbqauu9DkifR5u6ssOvm+DpmsIJSEquHByQ=;
 b=QsYaYDzwUTJqebT6/w7K1mNwFuGZ1OzGKU834xfZ/FHYLdQJeh2EZtgiNrakwjOwCONa6wxd9kg+r45e//8ubNbhwrHPHr1D/alKxmFp/e+I286f8GGqffqiK2h/Q3uOzTwe4FRovHTqPSupskkPPg40podwvwTlRQYnqssPxEEmq/cfysp4LNGw/qeYc9lYiYeyZP6E435RQLF60eZlbLOOoMKijzR7sA63Ek1EQkpuVNBrtvN+AbMAOYOPcpeWOVJavJ4I2qeZwr0n5AsKymXLwfnyeggkQkjU9hvqw4UpcMHVkLzMuSajKJhSnnkWmc7VjLvGi/mRl0qsyJyX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5OIvhCsNbqauu9DkifR5u6ssOvm+DpmsIJSEquHByQ=;
 b=A4mu5vzRFgdXRa1fOP5Egr2lF5xBk0usuYPvjnEXLizdEjlZ8HMjbsp1IjXHyvE7c8GUqGYcmJVs18D9mIT+sPltAkYr3AF+pvOEgdcrLuQysN5+OFe+XKLn/O4OFGjEXrYaiYoh3KPOaOw6RHhht567miSm+vE09WFbRCUmyLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 20:57:39 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:57:39 +0000
Message-ID: <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
Date: Fri, 24 Jul 2026 15:57:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, tony.luck@intel.com, bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
 <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0160.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::6) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ecbe5c-bdcc-4d03-1a2e-08dee9c63280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10067099003|3023799007|4143699003|11063799006|5023799004|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bzYPJatZNZP8Fs/YXit52/z+SNEEpW6MerkZI8ZryPQNgkYnqmMpyUqN9WXZnFMrz+MC4of+xEqG1FIGeqooOHGLERfiItIcDY3GMCZdBXb11PsakdTDlisnozyBhnh1tqufvLLRiB0H488NoPxTGy22vltmYQ06X+Qk0a3blthDi+orPaOi4xmLzM3+vXloPchWJF0RXZ4o3xN0SM5/ryV+wasJrqLGVUjpWpDM6hzlCAzfsxg+i8HanZmpYgfmLGq6cy1958z9/B+tqQVZOF1kjzsLWUfckWHHkmb1GZbxXjaZ/r4q7kn6FhGmkITevfnf2iOQ5lphpIcl5dbFxpzHIrm0lu/2F6m2vJdx06uLaFPX4DMCOlfXsjK8bAiiKaYBn4NawcOKTR29l55s1W3ckoUfW7yFpkEtPDOdUJQ+QHwCuaD0L4dP48aV4QM/Dr0zPTpsw+xByyGDEcwbAs8S5q6k+93URbKQNJNJ42WdyN+6PswvkyR5inr70wBO5drtJqh0sU/D+hVu13Wq6E0d3Mm7A/SDgWdSKHcVc7igyuT5rlYlKcpo2VuQL5FE0fcdmxdmTsA82H3MhlH7WnbNKyeA/GZ48MMVfQfsh6wL4lNOrrFEkksjtQlXVFXZdIcjog9UUnAggNCuIxE6Ms3zJpsPatv76dfVmmrKXf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(3023799007)(4143699003)(11063799006)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNvM0hCZE03UUZ6OEdZV3dyKzJvTzdjcm9LYmNjNUdxRmtCYk9VdHpyZnI2?=
 =?utf-8?B?dVV6QWhMU0UxOHB4RFllQTNyNnJWbDFNTGY1RGF1N2NxbnJ5RnEreUFzUjRn?=
 =?utf-8?B?N0pkNWtBYU9LRzJ0SS9YMmN3ZnVLV0ZHbEU1cm5vQk8rQVZOZTVnZ3F5b29o?=
 =?utf-8?B?c1dzZ1BMRFFhZFBNM1ZVV2c5ZWJqWXRFR20xTys2UExHdnFNYnFDVXNrTEhO?=
 =?utf-8?B?RmR3QndlVWhLL0xGNmZlK0pPTXVXc0p0dFBjWUo3VGtEa2pwc3ptOXJndWNX?=
 =?utf-8?B?YkxYc09WcGtJdHlZS0JUbXFwaTg2eVJkUG1wZEt6cERzRWJGSEYwSXRoenpj?=
 =?utf-8?B?UnFWaS9zN092aHN2WUhicVBSUmtjanUxVmd6Q1pLbXpMenB2SU9lYUgzLzZz?=
 =?utf-8?B?RE03d1YyMUk4dFd4NlYzZ0g3a25PdjVsc1BzSVBzNTBVRDRDK2V0U1FNOHNF?=
 =?utf-8?B?T1JnR3drSjNPWWN2TzdFNi9PODhGT1phRU1tUXRTb0JIa2UrbXg1UDRnb2la?=
 =?utf-8?B?QVprMi85cDJhQ2R4bzJ4RHYxTVFOZ1AvQ1hoa2IyY21FMmpVNkJmblY3K3hR?=
 =?utf-8?B?bTRSVlFjTVhjTjFvL1g2MzJOVXlwVzhMbmhLbTdmUTRzQ3hFVFBNM25rQzFp?=
 =?utf-8?B?RXVWQmFZT2YxM3c0YkdhQVA4WGVYdVpMZ1lJa1NJQStXM0kzSXh3MXRVeDhl?=
 =?utf-8?B?QURsZS9mYWRJMGtpZEhoSTRvL1lyTmtpa3ZOUjFDdGVhS1FzYWh2cCtiQzlY?=
 =?utf-8?B?bXAvWXdpVm94OVV5Z3NyQzczQVF3Z0FlK0E3dXM1UHQrQzR2SWROays2ajgy?=
 =?utf-8?B?a0pVNEtjMHZDNGhkd0dEZDZQWXNXZm1wNTkwdHJCemZIcGMrakM1OGVjY1lU?=
 =?utf-8?B?NTh0dlg2cDJzNTBScnNtYksxRDcyZDJzYjllYmlQczVUNnZjN3RtcVhIRDls?=
 =?utf-8?B?N1l1RmVYU3pFczErb3JMUjRnYkRzaVJWMzFsc2lJQzRma0dQL1BGMGRmNmV1?=
 =?utf-8?B?UUdUZW9teDVXYWtzZi9GYWNtZmk5REJTQWV0ZjBhMnNHdXBOWFEwRG1qdWdo?=
 =?utf-8?B?V3R6UzV4U0hIQ1NuTTk5MVUxaUsyN0xqenpwM1U0blByRDRZWjQyak5xR3Np?=
 =?utf-8?B?Y3Uyem9vSHlNK3ZRU3NNWlNWMjM0azNCYlYzQU1reGlmZG1yS0xTanhFYm9Q?=
 =?utf-8?B?eUExeG5lNWh5d3hOOVRuTGwvVHVGVElqZlNDY1NCYkFrYkxPZ1QzdFlLZ2dj?=
 =?utf-8?B?WGtUY2d5MEg2VXM0UGRnVjIvZUVoL001aDBwZXN1N3I5Z1lmSjdobFJlWHlZ?=
 =?utf-8?B?RjNGdEk2U09JWmVFdXk1VFZ0Z0FDbHAzeG5yK0cvWnpIUFVMVFZiYXRBNDFq?=
 =?utf-8?B?dGJIQzRQaTV6SncxY0pTdEw4TWZadGhXbFZhVWZ1RGw1U3I3SjRpNlloRndx?=
 =?utf-8?B?c3B1bjVobWs3WncwZ2Ywd2hvU1JjanQ5THJSWklSYU82VjQ0eUVTODJBM3Jk?=
 =?utf-8?B?UjNPaUxLdk1rN2VkL2xoZkYya1ZiQXdGdjh3bkhmODdpRGxPeWZYcUFydm44?=
 =?utf-8?B?R2hUQjVSQzh2WlU4b2hTVnNtU2xLd2hxellBcHl4dVJ5V0UweWJqNnlqTC9D?=
 =?utf-8?B?NkRMd2JUN3BwdDNWWEhkNnFZSVJ4eVVZTGRoaFlPcGRyMHVDSC9KeW14dHpi?=
 =?utf-8?B?WWxzWHlZdFphcHNkcVJxTkhRQUUrTFl3Z1FUZWJPQitiTUhudWVWaWsxc1RX?=
 =?utf-8?B?MjlVNERqaHlzaUM4ZzhKVTdzNzNTekdiY3hhSURvTnB0OXZuZW5yZWVkN0hN?=
 =?utf-8?B?YjYvN1NaeDRtL1AwMEFySytMdzRKVHZ0cVJXVUFvWitOcytNeFdJR2Y1dTV0?=
 =?utf-8?B?WXhQMEIrWW40TmtTa0UyVDVncmVJNmJyU2Y3MEM4a0x2aFFZWkNBM2l4dFE5?=
 =?utf-8?B?OGZWNDQycllDUHJxNDh1c2VybnpidW1CS3o4TGFQNWwwYy8rL0VkV0kvbE82?=
 =?utf-8?B?REJlNFc4Y2lRZHJNOW9jNEJsdlZTRmphUmp4cXVBMWdscVVMaEJodHl1cWNj?=
 =?utf-8?B?TkJGdUlPakNLdVQ5M1ZRT1RTMzI1QW5wb2ZXMkk5eEZDbGk4ckRhcDhUUnBv?=
 =?utf-8?B?L0ZjZUNROEt2RDRFVjgwTDlZNndoeDVOR0I1RXB3STFqTjBSbWxHNUVZN2gy?=
 =?utf-8?B?MjlvKzM0UlphdE9Mei81YkhDV0ErWTFpbmk2ckF4dHhFbVduYXVBblRPaThp?=
 =?utf-8?B?a1c2Y3diMWh6ZzZIZWpuaStjNjgrcjVIdTd6UElycjRuMXM1L3Nza0ppM3VU?=
 =?utf-8?Q?I49HY1ySvHQlUqGrUX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ecbe5c-bdcc-4d03-1a2e-08dee9c63280
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:57:39.4864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92HyIQY+Kw7ClrVsDJ5LJkL1TW8Gow9ZYJFDfkmGpu/FbHvrvLxey761N68V6Gns
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039

Hi Reinette,

On 7/23/2026 4:46 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/23/26 11:03 AM, Babu Moger wrote:
>> On 7/21/26 15:54, Reinette Chatre wrote:
>>> On 7/20/26 12:15 PM, Babu Moger wrote:
>>>> On 7/20/26 13:27, Reinette Chatre wrote:
>>>>> On 7/20/26 10:00 AM, Babu Moger wrote:
>>>>>> On 7/17/26 17:56, Reinette Chatre wrote:
>>>>>>> On 7/17/26 2:13 PM, Babu Moger wrote:
>>>>>>>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>>>>>> hardware that supports it. However, this can cause bandwidth monitoring
>>>>>>>> failures with existing userspace tools such as pqos.
>>>>>>>>
>>>>>>>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>>>>>>>> groups by default. On systems with 32 or fewer ABMC counters, this default
>>>>>>>> configuration can consume all available counters, since each group requires
>>>>>>>> one counter for local MBM and another for total MBM. If additional
>>>>>>>> monitoring groups are created, counter resources are exhausted and pqos
>>>>>>>> tool reports memory bandwidth counters as zero for those groups.
>>>>>>>
>>>>>>> It is not obvious to me that this is a problem. If I understand correctly
>>>>>>> there are two scenarios possible with this pqos behavior:
>>>>>>>
>>>>>>> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>>>>>>>       - pqos can create 16 or more monitor groups
>>>>>>>       - hardware still supports a limited number of counters with consequence that
>>>>>>>         underlying counters reset at any time as the different monitoring groups
>>>>>>>         need to be tracked.
>>>>>>>       - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>>>>>>>         events would return "Unavailable", sometimes reading the events return data.
>>>>>>>       - *None* of the monitoring numbers returned are guaranteed to be accurate.
>>>>>>>
>>>>>>> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>>>>>>>       - pqos can create 16 or more monitor groups
>>>>>>>       - only a subset of monitoring groups have counters assigned and these counters
>>>>>>>         are guaranteed to only track the monitor groups/events they are assigned to
>>>>>>>       - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>>>>>>>         - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>>>>>>>         - monitor group/event does not have counter assigned: monitoring numbers return 0
>>>>>>>
>>>>>>> If my understanding is correct then the preference is to rather have wrong data than
>>>>>>> see 0? This does not sound right. What am I missing?
>>>>>>
>>>>>>
>>>>>> This hardware can monitor up to 64 RMIDs without any counter resets.
>>>>>
>>>>> How many RMIDs does the hardware claim to support via CPUID that ends up being shown to user
>>>>> space via "num_rmids"?
>>>>
>>>> #cat /sys/fs/resctrl/info/L3_MON/num_rmids
>>>> 4096
>>>>
>>>>>
>>>>> I understood from original ABMC enabling that the underlying hardware counters of "default"
>>>>> and "mbm_event" mode on AMD are the same. That is, in "default" mode the hardware does a
>>>>> "best effort" assignment of hardware counters to events while "mbm_event" mode lets the user
>>>>> control the assignment. It instead sounds like this is not the case and there are actually
>>>>> two distinct underlying hardware counter mechanisms?
>>>>
>>>> That is correct. They are two different counters.
>>>>
>>>>>
>>>>>
>>>>>> As you know, the pqos tool creates COS1 through COS15 regardless of
>>>>>> the command-line options used, resulting in a total of 16 groups
>>>>>> including the default group. With ABMC enabled, this consumes all
>>>>>> available ABMC counters(32 counters, 2 counters for each group).
>>>>>
>>>>>>
>>>>>> When pqos is invoked with the -m option, it creates additional monitoring groups. For example:
>>>>>>
>>>>>> pqos -m all:0     -> creates 1 monitoring group
>>>>>> pqos -m all:0,1   -> creates 2 monitoring groups
>>>>>>
>>>>>>
>>>>>> Since all ABMC counters have already been allocated to the default
>>>>>> set of groups, no counters remain for these additional monitoring
>>>>>> groups. As a result, the monitoring commands report zero values,
>>>>>> effectively making monitoring unusable.
>>>>>>
>>>>>> In contrast, the default monitoring mode can still support up to 48
>>>>>> additional monitoring groups (64 total RMIDs minus the 16 default
>>>>>> groups created by pqos).
>>>>>>
>>>>>> For this reason, I still believe keeping the default monitoring mode as the default is the better option.
>>>>>
>>>>> It is not clear to me where the "64" number comes from. Even if resctrl sets the "default"
>>>>
>>>> The count of 64 is known from internal information. It can also be determined by allocating monitoring counters in a loop until the hardware starts returning an "unavailable" response, which occurs after all 64 counters have been assigned. This information is not documented.
>>>>
>>>>> mode as default, what will happen to the scenario you describe and 49, instead of 48,
>>>>> additional groups are created? From what I understand the moment the 65th group is created user will
>>>>> transition from "accurate per monitor group monitoring data for all 64 monitoring groups" to "inaccurate
>>>>> per monitor group monitoring data for all 65 monitoring groups" with no indication that this is happening?
>>>>
>>>> Yes. That is correct.
>>>>
>>>>>
>>>>> I believe AMD supports more than 64 RMIDs and in this case there seems to be three ranges:
>>>>> [supported by ABMC, depends on events but lets say RMID 0 to 16] < [RMID 17 to 64] < [RMID 65 to total number of RMIDs supported]
>>>>>
>>>>> Current default "mbm_event" mode uses ABMC so as you state this always results in:
>>>>> - accurate counts for 16 monitor groups
>>>>> - zero for all other monitor groups up to total number of RMIDs supported
>>>>
>>>> That is correct. With ABMC, there are 32 available counters, allowing up to 32 monitoring events to be tracked simultaneously. Since each monitoring group requires two counters—one for local MBM and one for total MBM—the system can support only 16 monitoring groups at a time.
>>>>
>>>>>
>>>>> As I see it switching to the "default" mode would result in:
>>>>> Scenario 1, 64 or fewer monitor groups are created:
>>>>> - accurate counts for all monitor groups
>>>>> Scenario 2, 65 or more monitor groups are created:
>>>>> - inaccurate counts for all monitor groups
>>>>
>>>> That is true.
>>>>
>>>>>
>>>>> I do not believe there is any way for user space to know when or if system switches from "scenario 1" to
>>>>> "scenario 2" on these systems and this unpredictable behavior that results in wrong data does not
>>>>> sound ideal to me.
>>>>    I agree, it's not an ideal situation, but that's how it has always worked. At the moment, I'm not sure about a better alternative.
>>> I see the current behavior (return accurate data when available and zero when no
>>> accurate data available) as the "better alternative". Intentionally returning wrong
>>> data when it can be avoided does not sound right to me.
>>>
>>> The changelog states:
>>>      The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>      hardware that supports it. However, this can cause bandwidth monitoring
>>>      failures with existing userspace tools such as pqos.
>>>
>>> Could another view be that mbm_event mode is the *only* reliable accurate bandwidth
>>> monitoring and any other mode (AMD hardware not supporting assignable counters or
>>> AMD hardware with assignable counters choosing to use "default" mode) can cause
>>> bandwidth monitoring failures (with existing userspace tools such as pqos)?
>>
>> Yes, that is correct. However, the bandwidth counters become
>> inaccurate only when users start monitoring more than a certain
>> number of groups (64 in this case). In typical deployments, users do
>> not create more than 64 groups, so the counters remain accurate for
>> the vast majority of use cases. We do not want to introduce
> 
> oh ... hmmm ... I have a different view of deployments since the message I
> keep hearing is "we need more RMIDs".
> 
> 
>> unnecessary complexity or inconvenience for those users.
> 
> This sounds like a request to (temporarily) change resctrl user interface to
> accommodate users that create between 16 and 64 monitor groups (where 64 is
> a magic number not exposed to users) at the expense of users that create between
> 65 (magic number + 1) and 4096 monitor groups?
> 
> 
>> Additionally, changing the current behavior could disrupt existing
>> tools and workflows, which would likely result in a significant
>> increase in support requests.
> 
> resctrl should aim to maintain a consistent user interface and changes to
> that interface should be done with a lot of care and with very good motivation.
> Above motivation sounds vague to me. You are concerned about support
> requests from users that create between 16 and 64 monitor groups but not
> concerned about support requests from users that create between 65 and
> 4096 monitor groups?
> 
> One could instead argue that this patch would cause more support requests
> since users will start seeing unavailable and wrong data the moment they
> create more than (the magic) 64 monitor groups.
>   
>> At the same time, we are not taking away the option for users who
>> require strictly accurate measurements while monitoring a large
>> number of groups. That capability remains available. We also plan to
>> add more counters and enhancements over time, and it is possible
>> that the mbm_event option could become the default in the future.
> 
> Similarly, the default capability remains for users that prefer to
> create between 16 and 64 monitor groups and do not want to assign
> counters.
> 
> Without exposing the magic 64 resctrl needs to provide a good default
> and I continue to find the accurate data the better option.
> 
>>
>> For now, however, our goal is for the default mode to remain the
>> boot-time default. This avoids unexpected behavior changes and
>> prevents users from being unnecessarily alarmed by issues that do
>> not affect their typical usage scenarios.
> 
> At the same time this commit states that, essentially, this commit is
> planned to be reverted in the future. Users cannot be expected to upgrade
> their hardware when upgrading the kernel so this behavior is already planned
> to be reverted on the hardware that it claims to support. Why not just
> keep existing behavior?
> 

I wish I could agree with you on this, but I'm receiving significant 
pushback internally.

The primary argument is that, according to longstanding Linux 
principles, we should never break existing userspace tools.

Before ABMC was introduced:

# sudo pqos -m all:[0-191]

CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
0-191        0.01      108184k    385184.0    34100.8       22.1


After ABMC was introduced and made the default mode:

# sudo pqos -m all:[0-191]

CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
0-191        0.01      109937k    385600.0        0.0        0.0

As you can see, both MBL (Memory Bandwidth Local) and MBR (Memory 
Bandwidth Remote) are reported as zero when ABMC is enabled by default.

 From a user perspective, this represents a regression in functionality. 
A tool that previously provided valid memory bandwidth monitoring data 
now reports zeros unless the user manually changes the monitoring mode. 
That effectively breaks existing workflows and monitoring applications, 
which is difficult to justify from a Linux userspace compatibility 
standpoint.

While ABMC offers advantages and is the direction we want to move 
toward, it is still relatively new and the ecosystem has not fully 
adapted to it. Making it the default before key userspace tools support 
it creates compatibility concerns.

I'd appreciate your thoughts on how best to address this situation.

Thanks,
Babu

