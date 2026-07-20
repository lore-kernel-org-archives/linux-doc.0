Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D9C43F4B7;
	Mon, 20 Jul 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566813; cv=fail; b=HB6lZHeW+B8c+p2kizqB+nAhxAd/xcsMcwPINTXpHsO3Uwy47QX2tfQtGvw4DwIATrkYlyT6MMAYe4iH/sv0WBp29v2PnFc2gvr/Et+/55iFljuOJaVvAwcHFT8qtTwXqeiW0WWBRWtamCtAjKKSnMBsLrg7x3NsuEPyt06m/+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566813; c=relaxed/simple;
	bh=vt4ch+KQefx/PakagrhSrbbHJW7qJ5FT8vJ4tez7Nv8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f00qApN1xaBfqEut1g33MFWOJcyMmjthFB1cXFVgdjUqGouoL/PkElBHKoelavYA58J7Y1CVxy9nCFjxV8GoLBo5meT2zH/xxCSx1DSpFaQ/sM3Q2iFUvPYP+W/PJl0goeiE4ZQS0myYUe9UJGsAn7T2mhOCbr3u++qnwAnXos4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SvgwYJ68; arc=fail smtp.client-ip=40.93.195.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SvgwYJ68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+O9oVAxU5I/XUTD0ak5gGjYHLNDxElSB9u5ffOE8MNEINYT20/4Hjgvf2lpEdJcwmhXxCtRWsohEeIOmiL8nZwiWh2sI0BwmsHdacfTVBrQsOXCkMCuhyZL/QHkvIzLeaAqdGEdk9Y0cfpiGA4xsHZ8SbMFqPcV00FSQ8CLheTHGXb7x8fvFn9/dxc5T+jQWYlh+wfM9XeRYqzEnpt6U3SiCZtjaO+7koBV1ZP/0YcgQNFdil1oxLFDHRmCIwtZXJL0GxTSNChzaKbcRkP+xV3FjaDTtehrdf59AnDysxzZunnTjmivGdIsVtq7RMl0wlO0/cMG0lcmvlbCZLO3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLOkQuJlolt5puFNfsIVqC6AsChDHEKPG3tPee1P4y0=;
 b=BM8kjwdFuiepce9vWxqaLRLes02wiDzRyXNdRvYE2gscrQZYmLrZ7ym8ljwwsfoMg4K0ZOsS0f71+/hKJIsFQGJgmycbel1mJVDnHOLHucRj/8W9cxU+6hAL6tlvJEh1NI936silAs0PubBFbkT2ZuaiV6448ZxuZeKMV2ru/5pQm8kiS8PbL/yJWDWZcdpygVlSyz94uqeKcti0xHBApgjbQpYvMqxZU1ddndbFlaG4MapI4AFxWpSM1k4eSN9XVOPpJq2Xd81rXPVdP6ASRo424DNKct53G36aF+e4biOlzLPhChUEw6pgizgAgzarKxFWSmU54gRvW+FigWPspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLOkQuJlolt5puFNfsIVqC6AsChDHEKPG3tPee1P4y0=;
 b=SvgwYJ68F0kWovu59yn8gjqFIg5g0KZD8Gdj5Cia+cRx/ROnbXNDUZj3anDl3Q2M0b6RLZ5vVJkLgLZ2pZ5IsnvYvNVW3qcUTZEmXKvtfYKZh7f2OeoO5Ac/KXWT0gBKxX/ALty9LMceLOiEoen8zX+q1iZreO1C30VJUgBaexU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:00:06 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:00:06 +0000
Message-ID: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
Date: Mon, 20 Jul 2026 12:00:03 -0500
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
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:20::9) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d4b8df-849c-42f4-0a30-08dee6805906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|3023799007|6133799003|56012099006|4143699003|11063799006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gzsgbTAkP+C+GGGOdq9+H9iRHxfPuwM5PSs2vijGS/8XICJqu+SQtoTAddm+o43qViBUZVlllcvIVCD10oYNSt+GIQhf4EVL9tvOJW3cVg6nYBo/xSADqIrxonHbPc/xtgdN+EogA2xpgRWbYHJ1pmJhS1xEOmCRcGG9X0NK9C4RfShObjSAx5stjhgurTTuNpGTfYjySkyyj5eHg4KVQAbyoDeZ8QsXnCnkL/zBiBN5hkx9VlQgRDvE4FYgg77m40H5WBxcibpUAZnGEhn5lyYcxLiQL2Q//DiKPNLcFzG/bez6WIoc5yZTB2834COB/zrGDnlAPl2K/U+4vibh+m5RCQNdYv2scmqRNM2KqF4KyPr3Wk/rTvfrZtVeWiSn9R9PvDOYizPTgb81A2fyH0oSJaejnIvpREzfClH1CIgKFs2vG+dP4kzArC6PpVB8V09zywnFPVYtCIiHmE9txCWqq8epyUqW+UZI/CMyHGYWYfcjf+pfYL2Jwxm984TL1znoERUhyEnNVArlDOBAkI9+EjRal0Q2a0/re42iBivinpbtT/ljPvxs14SzCfCx1Wiom0qCW4mGGD3zevJYnUH/h0z4uV40MLNTKr/7w1L2RPQMYyWfmBUqJyeeOi6vYFJ7R/PSlMrqiGaiXOUdtwXAfVw+SqYSSWWS6F9BCS4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(3023799007)(6133799003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3VaVk1ibTZQYlZZK3ZQa2NPUnlBcjhsSUpyK0puUmhZWW9EbXlITDFYU0Rq?=
 =?utf-8?B?bVowemFySW9sbGtNOW1FVXZyVGVwdC82ZHhjSUp2eTFFOU5ZNVdmVGY5Q2NU?=
 =?utf-8?B?a3M5OHN3WFZZWkhwSVAwTHJoSXBWSndhK1hUWkh3TDAyYkhlUzRtZ29BY05t?=
 =?utf-8?B?TFpJS2NyQm53M0RoZkVVdkYrbnBZT0tzL1ZRMG93dE1meU1KZlVvVjdPZXQy?=
 =?utf-8?B?dFErbzJVVnU1bmJMcGtKTlJmb3h6ZDcyVlJNL2tuYkJyOG81NW12OTFhNmFs?=
 =?utf-8?B?VHo0UDZHaGp4S1VrRDluWW4vYWdkZ2N5WTdzK29BTTNvSEdFamFQTG15VDI4?=
 =?utf-8?B?MkNhYktxTGtPYllxcmVqNHM5b1JlWFBXTWo0NzBWdFVIT3N0eXlnZ2pneFhm?=
 =?utf-8?B?dXdpWE4xRlVISWozVGlIbVVWSjZZSUpUVDg0VGR6d2I1K1h2M2tjNGpOZDJy?=
 =?utf-8?B?MlJZZ0VwTkJ0aXNYQmc4ZEU0UFNBam13MEZwczNKRGFMa2djZmdBYkxsQ013?=
 =?utf-8?B?T2R0VVRlc3pBVFZuQ1luZ0NMRTltNVE4SUtpZEtSNWpkNnVadTNRT2VpQUR1?=
 =?utf-8?B?WElBeTFvdHNQS01jWEhLZkdiZ1hYRS9QejhLRWthNjhQSGRKZHI2NHJNc0hx?=
 =?utf-8?B?WVRQY0xTMFJoWlBrWmNaaXdraVJhK2JrZTI3ZVRpSXF0ODJkV0cwUVFRZ3J2?=
 =?utf-8?B?ODBjRlNkcmZ1Rkk1VmNRU3p1WmVpRzJ6ZFhzZE5MYTRKOFFVQ3FCUWt5YWgr?=
 =?utf-8?B?eTg1QjJ4Tzc3dEtlVFVZd2hnU2V5VWZ6REdjSy9SdFhJYnBYZWsyRXYrdW0z?=
 =?utf-8?B?VTZwNkFEY0J3bUxOTlo1VU5TbnoxekJzZEl6dFJmampRWjJzbmluc1R4clh4?=
 =?utf-8?B?OTBoazhZZTc5b1QvbWZFbzdrTEdkTkE1RUloMmt1VzJydzN3Yzk0TVNFVHdh?=
 =?utf-8?B?enk5TlhOSlUyZlNXbDgrd3dYYitVYzkzSlZrRVUyM1R4MFgyMGthYStFcTk0?=
 =?utf-8?B?YTVUR0pSR1ZhSVY1dDUvWW9vMTZ2dUU4SnkvNm9TVkUrbGk1Y0dZNEtNS0dY?=
 =?utf-8?B?WWFEMGRpZDAwVDFaODFUcGp0Y0NXNXFrMFF2aS9oaVZDcGNLakZycTJvek9t?=
 =?utf-8?B?bHRJbHZma2I1dW05ZEhIbDNHNzNQVUQrZmNTQ25XUmExelV4NXdwQVRFeVpY?=
 =?utf-8?B?SGVRdFF1OWxZcU05UmNUUnFoQVMwRmlJbjh2a1FkcS96UmVYRXM5bk9LYnhs?=
 =?utf-8?B?aG9kazNWR0JlU1Y5M3VlSlE3V0ZZdm1iLzJKUkxEUFVCVytOU1pveDJZRm9h?=
 =?utf-8?B?UWtWMmVhL0JScjNUd05EL3VrMmZrU2tsT1lIM0htU3hNMS9RNURPNk9qZkZo?=
 =?utf-8?B?QU9LWHJUd2YrZ0lpb1VIejgwbytoTlFscUVGUTFROTF6c1ZaSjYvckoyelRt?=
 =?utf-8?B?SnB6Mm1udWRLWUpOTTFvYWpFWURiL1N1NWNCQXF1elhwdnRvbkRiazY2TG1t?=
 =?utf-8?B?NDJlQ2cxaHc4UEQ3ZmlIZ0xUT1FnVW00b3g3cVdpVTVZTjNaNnVuLzZXbHB1?=
 =?utf-8?B?Snp5b3RyRUh3TUVxWjhwMmh2L1Jta3ZhNXMxbEJUNDBpUHZnYTZoc2VoeTE1?=
 =?utf-8?B?YlFPaDBUczBnVzBuMHhKZkN5V2dvdkVxeE5aWnR4NTI5SE9vZ3pvNFlpTEx6?=
 =?utf-8?B?dC9KMEkzbDVNVFdZVnVKRGhhbVBZaGgrMldVRnY2RzJrSEtSMlRjc2lGT3pt?=
 =?utf-8?B?VzlxeVRXVWhXeHRwSERqVzBaTmNJVDFPc0FBdWNoWFFDN1N2RzFsaWI0dDNr?=
 =?utf-8?B?c3RJMks3bFE4TFRXRkg4bnpkU0dzOGlsTFdYdlVhemNRdU1ubTJRMnB1Z3Bp?=
 =?utf-8?B?QjhZVFRFclpGK0VnbWZpbzMwNUNEOFg3TVNPY1hQNXhjSk9TYnlkdkdnVFhv?=
 =?utf-8?B?Y3Z4YUpVRFYzbXFPcERIY1ZidEVWRm1iQitubHNyVVhSZmZUS3ArMGVlU3Ev?=
 =?utf-8?B?aHNCb1dkR2JZL0gzV2JLUUpDQmtDRGd5dWdZY1YvMkc1SzB0cFE4bDhOUDht?=
 =?utf-8?B?V0hlbzBiQkpXMjhvbktXVHlqOUY5ZjJLZ1V3UXBrcnZTZXZXWWY3c215ZjdT?=
 =?utf-8?B?WVI4Nnp3WGRZMEErOW0vazNXK25FQk1Cbko5Z2U2M2luSDF1MUgzYUtmZFBu?=
 =?utf-8?B?MWpkUm9yMXVoWTRmMFA4WWlMNVUzdUgwVC93KzJVeTcxUXhLakxyZXE3STEy?=
 =?utf-8?B?ZW5mL0tkbStnNFF6MElYR04zaFZ1azg1TmdHTWh0TFAxck9INVNoQkR6ZENh?=
 =?utf-8?Q?x0lOf5e3Cy/zzmiXFT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d4b8df-849c-42f4-0a30-08dee6805906
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:00:06.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAeP0WNEUk00AgkMh6t18E5xvnvjqo91bpBevhy6UPvKxiizrwlETQAoo4bFonAs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

Hi Reinette,

Thanks for quick response.

On 7/17/26 17:56, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/17/26 2:13 PM, Babu Moger wrote:
>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>> hardware that supports it. However, this can cause bandwidth monitoring
>> failures with existing userspace tools such as pqos.
>>
>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>> groups by default. On systems with 32 or fewer ABMC counters, this default
>> configuration can consume all available counters, since each group requires
>> one counter for local MBM and another for total MBM. If additional
>> monitoring groups are created, counter resources are exhausted and pqos
>> tool reports memory bandwidth counters as zero for those groups.
> 
> It is not obvious to me that this is a problem. If I understand correctly
> there are two scenarios possible with this pqos behavior:
> 
> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>    - pqos can create 16 or more monitor groups
>    - hardware still supports a limited number of counters with consequence that
>      underlying counters reset at any time as the different monitoring groups
>      need to be tracked.
>    - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>      events would return "Unavailable", sometimes reading the events return data.
>    - *None* of the monitoring numbers returned are guaranteed to be accurate.
> 
> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>    - pqos can create 16 or more monitor groups
>    - only a subset of monitoring groups have counters assigned and these counters
>      are guaranteed to only track the monitor groups/events they are assigned to
>    - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>      - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>      - monitor group/event does not have counter assigned: monitoring numbers return 0
> 
> If my understanding is correct then the preference is to rather have wrong data than
> see 0? This does not sound right. What am I missing?


This hardware can monitor up to 64 RMIDs without any counter resets.

As you know, the pqos tool creates COS1 through COS15 regardless of the 
command-line options used, resulting in a total of 16 groups including 
the default group. With ABMC enabled, this consumes all available ABMC 
counters(32 counters, 2 counters for each group).

When pqos is invoked with the -m option, it creates additional 
monitoring groups. For example:

pqos -m all:0     -> creates 1 monitoring group
pqos -m all:0,1   -> creates 2 monitoring groups


Since all ABMC counters have already been allocated to the default set 
of groups, no counters remain for these additional monitoring groups. As 
a result, the monitoring commands report zero values, effectively making 
monitoring unusable.

In contrast, the default monitoring mode can still support up to 48 
additional monitoring groups (64 total RMIDs minus the 16 default groups 
created by pqos).

For this reason, I still believe keeping the default monitoring mode as 
the default is the better option.

Thanks
Babu

> 
> The changelog starts with "this can cause bandwidth monitoring failures with existing
> userspace tools such as pqos". How could returning accurate memory bandwidth data be
> considered a failure? How does this issue manifest itself?
> 
>>
>> Avoid this compatibility issue by leaving mbm_assign_mode in the "default"
>> mode during initialization. Users who want to use ABMC can continue to
>> enable it explicitly:
>>
>>   echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> Update the resctrl documentation to reflect the new boot-time default and
>> adjust the mbm_assign_mode examples accordingly.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> There are plans to enable "mbm_event" by default once additional counters
>> are available. For now, keep the default mode to maintain compatibility
>> with existing tools.
> 
> This is not ideal. resctrl should aim to provide a consistent user interface
> across kernel versions.
> 
> Reinette
> 
> 

