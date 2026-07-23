Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA82FE56A;
	Thu, 23 Jul 2026 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784829818; cv=fail; b=RA9kS3iJhvPu4/zXcdVU+jY5tRy433siU96GLxBUZ1or0LDxBElpFuyeVflDlxHe5W1K0GQJja2MuQTQyIQ4lWVZpePFYFfLx3m49T05IUSSGdfH6E63hZ0QPDWwsXcSkfyHvvjvAd1MNU2D41fiu0YZPdAjnxq4VU5q3X1IbT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784829818; c=relaxed/simple;
	bh=KK5uOrqJeYwKoc1zneobUja/pT/pXm1fzQH1AadGOdk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R2L2Yv5hVxS8gVWrlMoYNqTCHoVPWLq4WwekFCrN4Q+DfdIk5RqHqIRCLCu1+Cn0gFi+e1ZuPHpQcJHkUrzG2jfNJtmWeY42djHYd3Ksb5mAlS8VSlzfwgRDsF1Qx8TqjaC7S/lfm3gZn6/o2o89u4I3wPuTRSeLLihmrk54zR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=24WQ9C7u; arc=fail smtp.client-ip=52.101.62.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="24WQ9C7u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsfB0uL6mW7l0RIczAcKbQFcwhVVQIhIE9aKqwve3+ghGJE9i4ShG64PhBTYfGXv29NewSxn+spd2VJ79tOFAs1ChzwfAsh34rLXARQPd22EM66nqSlcQV9PxdOQEFopPfMpHJEA1Ty18Ymm2Wew08KURdL0QUHFcEXMjw5AoB9pqcqKDqb1wvuFymNXxWoFpyhSyRmYb82ZOMXRqTBPs4hh/jA/1B/gkVfRxsBzeMCOlhCF4uu90vToV4xGuxUiIsXb5CABAc1S4zfFobeQ3VtF4ymmXnLXq7pKWEWohXFmCtrwzQh92SERFVrLOb4TYtu1M4I07vD/GP/b54EMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRql7eAABGvZW7ixIXso9fyMgAFZJwKFvUf1eVlCaLg=;
 b=MuzLqU1psYUgrKssRZbOPjelPPXIP4iyDZQ+wlv3ZsVM6KQTIOP70OwmUYdxpF+dKe917ijY+K0Zp1KIn1dwuT2A0DaTNFwYlQ57dZQ+nyqSUXTUBM1JeQcDFoqxe/sGqtR8WfBZRPIfaUSGxnDl7zGBf1rR6Xc93vL0lzzAIj3/2Db19m0XDIzblzumb/XIaW5LSdn7HEadBzIAJmMB8wVwks9qBt7UPZXHH5nk0HgxHa/EN8yylp+/O6lvD3TrIp1Gz0bZKZHzKoWbksjOHPY4z8HloGdZ28o/LoMyCjv1QAvlEnztP0Se07dk0ze3g2+w4a2kc2Q9cvc0kcdR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRql7eAABGvZW7ixIXso9fyMgAFZJwKFvUf1eVlCaLg=;
 b=24WQ9C7uLiVAbPMdTM3apbGcnxbauYr9O4mAnSk3SZYVGRA9THeR+CxAcGGm+tqNqaA1zv7P7d4Os7a/lPu/5KhND7JWsLSSCZRTX+5ieCDazWm+cBjmz6kJZ6fTcqfvxTmVAGgxlB6HkcceOSE0RkkMCC4i1yNkICQDOCYH8pA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH8PR12MB7352.namprd12.prod.outlook.com (2603:10b6:510:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 18:03:27 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:03:27 +0000
Message-ID: <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
Date: Thu, 23 Jul 2026 13:03:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 bp@alien8.de
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
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0302.namprd03.prod.outlook.com
 (2603:10b6:610:118::24) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH8PR12MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a1167c-d08e-486e-5fb1-08dee8e4b1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|376014|10067099003|4143699003|3023799007|11063799006|5023799004|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zRHgdUAHICaTLUfm9M08Bs9VU2ufBf5+PDmpDEUuwLtXuk/sahDqbIZp7eIUMz3HzkYngW5tYJCkptFa785JX8kmugGrVeS8JBH3gLOqX42s8zu/SA3NHaS4b9ZyjPgSWsSItb3FcdGPbJsvFKhqJaLf67HrOODk9LdPzu+f1Vu3PluRGkgwHakK8ygE/BHtRwGTALshc0C1bmlQCh6OnxpHpaK5QKxceniNf/6MA5cJSnAIHlzXLgt+7j13KKLNpKqqsLbY+DXqCx7ZVCYnkTSjPMeKGoMPlE3flb1sqCCRgoE9VnVj2fEG1vcmFxtjXk3XZPWKepGDgBDdXJmcf/s36H3Q8jL/IMk3bApMkIZy6SZddsTBZKezeecaM8D0wFxeDDWOxur3PEtq3XcVhhfcugvUMROFyqjroPs5t/mGluV9rNHfgVwxgUc4+JiQSQdqnL/JOb0o8Uwp88L3TI7zwdlzpLDRYH1xyeAO2e5yGxZ87/HDEPozLgRLezYGbjdRzGWrwDYKKvo/SdsaUXpgKqCkzwW+ACJpPPbuS+i4bYwwjGqncxq625dUXbiuK+wcPdq7lW5GlW+kWu18j4xxTcQNR4xMsV4rTCy9TfquoUB7FpDvIEqniqLHNELl/TsJy2JOhY5mdFo/lHDOMyDnJ8tCcyd4ZOfUWCjdYM4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(376014)(10067099003)(4143699003)(3023799007)(11063799006)(5023799004)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFh5L2xtMC83SDk2WERrSlJMYmpYVFRBS3l0S0Jtblc1NWRaajdVU3VXY2cy?=
 =?utf-8?B?aTRqMkJ5TDNoTFNWenFtV0U5WHBPa0JUWWNoT0lQd1lQMnA5c25iYmlnclR0?=
 =?utf-8?B?U1ZLWit2clhOTVJCelliZHBBbFk2VUpncGY1dmk0bnVYWGQxZjRLR1JvR1Zi?=
 =?utf-8?B?LzdpV0QwbXFqK3hvZVFCc2NYbzZOemltYndpRXpNQjBQQ2ZLQko5QThtcm1T?=
 =?utf-8?B?WWdqcE1MSTNDaUFmc1NZdjFRbUVhMS9zUGpmbXhyR2xJZ3lvUFptRGtHTUJF?=
 =?utf-8?B?T2VINWIra1pYS1FPNEpacDJ5SGtESjVMQSt1cWNZS29ZcG9zdDVUMEpyZHhL?=
 =?utf-8?B?SjVmV1ZpZDRURDMwRGoycmpXczBNVG14eXFCNzMwL1Z0SHpibkJjT0dnTlI2?=
 =?utf-8?B?a2lWaFlkN2pJM2QyaXVyOWMwUXI4ZFBxaGJLNjJhL1NpTEpZYVR6Y1oyMnJr?=
 =?utf-8?B?bzlSOU9zemRGVWFmanJhNlBnS1VJUVZrR1VZTHFMVG1MRm1sRFhpcnpZMk5s?=
 =?utf-8?B?eUVUek9ZL1dGL1pGcG5RRVJvWVJUb0NWZmVhTTdyMVBSTU9UVTRkNThnZFZX?=
 =?utf-8?B?OU1JTWxPOXRTMWhBdzR0SS9sVjR6RUF2RkNFOHRZaGNVRXhvOWxCVEl3VXUy?=
 =?utf-8?B?bTVuTkVsdWJRWUViTEdPRHRIL3A5dEQ0TXl5QjJaOCtxRlpxSHo3T3dMbnhN?=
 =?utf-8?B?dDNldzFabEIyUVRGSnRxWEpVV3A2aWxQeVZQKzc5NUdQMWlUZFJNQS9DN3NS?=
 =?utf-8?B?U01BRFRqa3RLakErMXVaSEpVVXQ1UDVZcWx0TjhjTFNyTExNbFJEYndsenp6?=
 =?utf-8?B?R0ZpWkU4L3pOVWhmVEpwbjlCRFpISXNPVHlMYWE3SmZMQU8rOUJCYytxcGg5?=
 =?utf-8?B?NUdFaWJteEdicVI4MFlndDBtWndKYmNGck1DVHlZN0pCWm9XMTJoZ2hSWit5?=
 =?utf-8?B?RXVYaExBSWhKQlRodWxEU2lNSGdWdkp5WERZUUdJY3RubU1OaWJyS0ZCTmJQ?=
 =?utf-8?B?TFl6ZDBOa0JHWHRBR0o4dFFZKzl6WnRZdjNiWDBVZW56dmZnc2F2NTFqU3pz?=
 =?utf-8?B?VDZycUdDdHZuS0NuQlBuWGplV05BbzRuaW1UKzBobGI3bUVuL3ZPV0lIbmpI?=
 =?utf-8?B?ZnIveGtBcytkMkUybkxGQmphdVo3M2dxWFJraXNtU05rSCtTSEdrUUYwOE9G?=
 =?utf-8?B?Q0tlTFBoRUQwRmZlT1krRGxCMmxoVnlNMmJEYzZhVHF5R1RWYitvT1ZySnFV?=
 =?utf-8?B?NFBwcVZmTnAvRXJDcWFQMFZZUk5yTFBhd1pKZVNHSStDTCtKOHRkbHNlajF5?=
 =?utf-8?B?M0IzZFRvQURSbVZITlN3bjhEaTMvR0tZTVRmdG9NQW1nNGFvY0ZLdUdiVW9I?=
 =?utf-8?B?SERLNG1OQlBRYmxYSEdrY0hQZnJMRS9hSmhUTUxaMTFlaUxJenRNMTBrbGU5?=
 =?utf-8?B?VGs0dTB1ZXBlRmVDSG9wNi9hRU9HT083eFVwS0JjdzZVSlZKK2V5dGMxQnFE?=
 =?utf-8?B?cFdha2lXb3FQeWU1NzNXVHdybjFGcW5SM0NpbUJwenFOYnR0ejFWRFNPc3NW?=
 =?utf-8?B?Si9lSHltRGlmbjFGZ0Y0RC9Ubkt3S3c3M3IrOXJFc3k0NW5KeFpSblhGcG9D?=
 =?utf-8?B?M2drU2xBb2RkV2psK1dDVmxQOEFIU2JQTHlob3Nqbm9HNjBGWCtxQ200WlpF?=
 =?utf-8?B?WWJWM1JzVUVZV09iTWpTTnJpT3hYc0QxbUZOWDN4T1JZTG5PYVFhVXBrNnF4?=
 =?utf-8?B?eFB5NUNjWDZocktpdkFBRUpISFlDeE1pVnFWblZVUW5NeTArVWlUQ3BDNm9j?=
 =?utf-8?B?aEU4UDB0Z0p6RDJJck80ajh4S0w5QXlrU3hxTmRiTXYrOVd5WGFDN2VTOFRp?=
 =?utf-8?B?bVVIUkJXM3hWcWRsdUZseDhtREltbW1xZEFDbGVTeEg0R2ZoWnAwSlQ5OUdh?=
 =?utf-8?B?UXQ0V3U4VnUrbFJqdmhEQzZYSEl5TUFaMGw4dE84YzFsZVBqWUVtWDNTZktl?=
 =?utf-8?B?VFl5U2lyaTJKei9UQnlZYnNOZ2FvZGxoZkl6Y1F3V2drVmd2aEhlcEc1bWdF?=
 =?utf-8?B?Z0lBU1FsNm5zVnl5NnhaYnlhdHFWMzRnRUQ1MlJ6K3JXODlvODAwb1lvSzly?=
 =?utf-8?B?ZVF4R1d0ZGZhZzhNcGgrQWNRSHpVNE1CWGR5cmRNYm9aNUpyUm02NkhmcHFV?=
 =?utf-8?B?dWtJK0JEOGU4WnBiWXYwVFNqd1htQnNHVUowdldjbHdpSExJOVA0U1BNbzNV?=
 =?utf-8?B?bjNtbmYwWlFFZFRUNGhzZjZod01QdFlENUdPOGN0cHJDbW9IY0lPNUlNMXhD?=
 =?utf-8?Q?DHdQLvMJa35QTJPCTo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a1167c-d08e-486e-5fb1-08dee8e4b1f2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:03:27.1406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kE8+ARkELsIrdWK6TVjAByR0OkQ8KiMs+vdXeW2juuAmOkLkXdQ+yWHu5wWWf2tg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7352

Hi Reinette,

On 7/21/26 15:54, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/20/26 12:15 PM, Babu Moger wrote:
>> On 7/20/26 13:27, Reinette Chatre wrote:
>>> On 7/20/26 10:00 AM, Babu Moger wrote:
>>>> On 7/17/26 17:56, Reinette Chatre wrote:
>>>>> On 7/17/26 2:13 PM, Babu Moger wrote:
>>>>>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>>>> hardware that supports it. However, this can cause bandwidth monitoring
>>>>>> failures with existing userspace tools such as pqos.
>>>>>>
>>>>>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>>>>>> groups by default. On systems with 32 or fewer ABMC counters, this default
>>>>>> configuration can consume all available counters, since each group requires
>>>>>> one counter for local MBM and another for total MBM. If additional
>>>>>> monitoring groups are created, counter resources are exhausted and pqos
>>>>>> tool reports memory bandwidth counters as zero for those groups.
>>>>>
>>>>> It is not obvious to me that this is a problem. If I understand correctly
>>>>> there are two scenarios possible with this pqos behavior:
>>>>>
>>>>> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>>>>>      - pqos can create 16 or more monitor groups
>>>>>      - hardware still supports a limited number of counters with consequence that
>>>>>        underlying counters reset at any time as the different monitoring groups
>>>>>        need to be tracked.
>>>>>      - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>>>>>        events would return "Unavailable", sometimes reading the events return data.
>>>>>      - *None* of the monitoring numbers returned are guaranteed to be accurate.
>>>>>
>>>>> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>>>>>      - pqos can create 16 or more monitor groups
>>>>>      - only a subset of monitoring groups have counters assigned and these counters
>>>>>        are guaranteed to only track the monitor groups/events they are assigned to
>>>>>      - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>>>>>        - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>>>>>        - monitor group/event does not have counter assigned: monitoring numbers return 0
>>>>>
>>>>> If my understanding is correct then the preference is to rather have wrong data than
>>>>> see 0? This does not sound right. What am I missing?
>>>>
>>>>
>>>> This hardware can monitor up to 64 RMIDs without any counter resets.
>>>
>>> How many RMIDs does the hardware claim to support via CPUID that ends up being shown to user
>>> space via "num_rmids"?
>>
>> #cat /sys/fs/resctrl/info/L3_MON/num_rmids
>> 4096
>>
>>>
>>> I understood from original ABMC enabling that the underlying hardware counters of "default"
>>> and "mbm_event" mode on AMD are the same. That is, in "default" mode the hardware does a
>>> "best effort" assignment of hardware counters to events while "mbm_event" mode lets the user
>>> control the assignment. It instead sounds like this is not the case and there are actually
>>> two distinct underlying hardware counter mechanisms?
>>
>> That is correct. They are two different counters.
>>
>>>
>>>
>>>> As you know, the pqos tool creates COS1 through COS15 regardless of
>>>> the command-line options used, resulting in a total of 16 groups
>>>> including the default group. With ABMC enabled, this consumes all
>>>> available ABMC counters(32 counters, 2 counters for each group).
>>>
>>>>
>>>> When pqos is invoked with the -m option, it creates additional monitoring groups. For example:
>>>>
>>>> pqos -m all:0     -> creates 1 monitoring group
>>>> pqos -m all:0,1   -> creates 2 monitoring groups
>>>>
>>>>
>>>> Since all ABMC counters have already been allocated to the default
>>>> set of groups, no counters remain for these additional monitoring
>>>> groups. As a result, the monitoring commands report zero values,
>>>> effectively making monitoring unusable.
>>>>
>>>> In contrast, the default monitoring mode can still support up to 48
>>>> additional monitoring groups (64 total RMIDs minus the 16 default
>>>> groups created by pqos).
>>>>
>>>> For this reason, I still believe keeping the default monitoring mode as the default is the better option.
>>>
>>> It is not clear to me where the "64" number comes from. Even if resctrl sets the "default"
>>
>> The count of 64 is known from internal information. It can also be determined by allocating monitoring counters in a loop until the hardware starts returning an "unavailable" response, which occurs after all 64 counters have been assigned. This information is not documented.
>>
>>> mode as default, what will happen to the scenario you describe and 49, instead of 48,
>>> additional groups are created? From what I understand the moment the 65th group is created user will
>>> transition from "accurate per monitor group monitoring data for all 64 monitoring groups" to "inaccurate
>>> per monitor group monitoring data for all 65 monitoring groups" with no indication that this is happening?
>>
>> Yes. That is correct.
>>
>>>
>>> I believe AMD supports more than 64 RMIDs and in this case there seems to be three ranges:
>>> [supported by ABMC, depends on events but lets say RMID 0 to 16] < [RMID 17 to 64] < [RMID 65 to total number of RMIDs supported]
>>>
>>> Current default "mbm_event" mode uses ABMC so as you state this always results in:
>>> - accurate counts for 16 monitor groups
>>> - zero for all other monitor groups up to total number of RMIDs supported
>>
>> That is correct. With ABMC, there are 32 available counters, allowing up to 32 monitoring events to be tracked simultaneously. Since each monitoring group requires two counters—one for local MBM and one for total MBM—the system can support only 16 monitoring groups at a time.
>>
>>>
>>> As I see it switching to the "default" mode would result in:
>>> Scenario 1, 64 or fewer monitor groups are created:
>>> - accurate counts for all monitor groups
>>> Scenario 2, 65 or more monitor groups are created:
>>> - inaccurate counts for all monitor groups
>>
>> That is true.
>>
>>>
>>> I do not believe there is any way for user space to know when or if system switches from "scenario 1" to
>>> "scenario 2" on these systems and this unpredictable behavior that results in wrong data does not
>>> sound ideal to me.
>>   I agree, it's not an ideal situation, but that's how it has always worked. At the moment, I'm not sure about a better alternative.
> I see the current behavior (return accurate data when available and zero when no
> accurate data available) as the "better alternative". Intentionally returning wrong
> data when it can be avoided does not sound right to me.
> 
> The changelog states:
> 	The kernel currently enables the ABMC-based "mbm_event" mode by default on
> 	hardware that supports it. However, this can cause bandwidth monitoring
> 	failures with existing userspace tools such as pqos.
> 
> Could another view be that mbm_event mode is the *only* reliable accurate bandwidth
> monitoring and any other mode (AMD hardware not supporting assignable counters or
> AMD hardware with assignable counters choosing to use "default" mode) can cause
> bandwidth monitoring failures (with existing userspace tools such as pqos)?

Yes, that is correct. However, the bandwidth counters become inaccurate 
only when users start monitoring more than a certain number of groups 
(64 in this case). In typical deployments, users do not create more than 
64 groups, so the counters remain accurate for the vast majority of use 
cases. We do not want to introduce unnecessary complexity or 
inconvenience for those users. Additionally, changing the current 
behavior could disrupt existing tools and workflows, which would likely 
result in a significant increase in support requests.

At the same time, we are not taking away the option for users who 
require strictly accurate measurements while monitoring a large number 
of groups. That capability remains available. We also plan to add more 
counters and enhancements over time, and it is possible that the 
mbm_event option could become the default in the future.

For now, however, our goal is for the default mode to remain the 
boot-time default. This avoids unexpected behavior changes and prevents 
users from being unnecessarily alarmed by issues that do not affect 
their typical usage scenarios.

Thanks,
Babu Moger
