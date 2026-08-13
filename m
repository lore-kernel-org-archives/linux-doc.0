Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F01E3EA973;
	Thu, 13 Aug 2026 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643853; cv=fail; b=VHbXvSqcugRMZARrZ8dk76/t9c0FbQiWk3/qFuZJ4dmGuJVvlp3M4iMpKu4vYvXcSPNwFMGDQMgkjh5VPLDVtOLZI5ABCZhIfhhdJ/dv3PzhcKdm7JXoaahBTfpNs0oXaslW6mIJdNjxfITJEp1tpeEBiVIW5UXuHKxml4u1qfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643853; c=relaxed/simple;
	bh=OPl4cvoWUvld0leDdK6CUpJrDtq+z69lGAAepAq/oO0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iSc7yad+2GbLxXLxXWuYNd+bEI7GEGGPeiARao+4pBBgMuVZndRGeEvmVxjY1ku2nAhCMllOmnTPllHfzMvBklZ5HWsNqz3QEJTVXBKp8w48bPNyHAmVRvOwusJq16rG89M3WqGsfCMqiw2U0H7vrGcYPSkPE4teA1lntWe3L+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kpGlafzB; arc=fail smtp.client-ip=40.93.196.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kpGlafzB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5jkALXN3ymjTCmT7kIp6VGjHF14TvXpHhHo8vE4D/JYXpNN8aeUADpqvH9EMgfdmeAu/1h29f26/mwinsYdnZO9VNLSOy89uw564+wjuw4SkiY0BUy+kkTEXEbDrA44xbSpIcgWJLcknxRCe+9feDruqWYip0DwGqAuZIiOkpQ/uVhKtMemm7gW2vD5bUutfO0k13VPZn3lBcYpb1iRUfrRppUlk1BDi7LXb5L8rhIFnUXUlcLrkVO1iS14C/n8Nx+BVy2VKmwyz8Rvo5nJ3SJ8D2AIKERise2xj9Y3+Jo6XeovewBZq8w2nQJ3WO4coviQAthT4HXoOU5ACUbUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D1OxCTm2yOWA2E+H7XDb7WjOP3jlz/sTfA+aG1+QGs=;
 b=qkUF7OqlM0zBjfDRJbVwGw3Wfc4yq1amWNYAD3Aa4uQ7mynw0Tk6lTDltOvv4T+HCsRtXMc9jGj08UKTfrSTym8+PsBsA5pVSBusXcdtGNqFEBkC5FE9KwL0Wax2WcKK1zHsNNF6d6026H6iSiFNvTh1mregcXSJvCqap4542EdPw8SlrlhB6eVvFgmsf8eC7yEaBT3Pqcq3Lxtxj0tzUGNNUVEuu5E45baUuMhWV4E/LN2knQkEabx9C/mrbQsrckXxNz/7IEQX6xgCPux3UHGcybwPlp2R5TDj9i9y/iNi5SUW8tjupky+oCbHdpGFh+Ytmec/D0nqQ3dcRjXjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D1OxCTm2yOWA2E+H7XDb7WjOP3jlz/sTfA+aG1+QGs=;
 b=kpGlafzBlNXI+EbZq7SqSk/rUWGZ7SLb9NsDSiprBaPuT7N+ATnBuwvuQZpCqgKJ79UA9xXblUh47NP2XXXVbF+EmZiwloxfpO1e7VkPE5IDX0EDd1HL47qKNxlCpet+7Gv6pH5Er3FZncscGzoe+It3daBS4vU2H6cReRYEYS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM4PR12MB6303.namprd12.prod.outlook.com (2603:10b6:8:a3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.14; Thu, 13 Aug 2026 17:57:16 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 17:57:13 +0000
Message-ID: <c4311423-cafa-4b59-8e50-189fdc241de8@amd.com>
Date: Thu, 13 Aug 2026 12:57:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 09/15] fs/resctrl: Introduce
 kmode_cpus/kmode_cpus_list per rdtgroup
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
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
 <27afa5e408453c93790e5aef61fda31355d96ec9.1783461016.git.babu.moger@amd.com>
 <13834492-22f1-4135-8c57-74052544ed17@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <13834492-22f1-4135-8c57-74052544ed17@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:610:52::39) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM4PR12MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7b4fe1-1bf3-437d-b718-08def9644dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|6133799003|3023799007|56012099006|10067099003|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zE16gqHxNOXy0H8QdnJqTpL9bPdqwhtl565vm9neJ4y3wgHgkkjCaFoqjQZQ22/4uazTlc/hiiXE4zwnMhCisykgXaD8ESjAT6RX55WzvJwhps1TGI+yWzJ6HiCpg9LBIEWf9jjp7IlViyAvYw/1sRiWsW13bE2I3E1rXGPHsnA7F1aiHpICob7yCZvJXeSN/7z/s9AKhDXLBJooM6VmqPlk4UQjYVrZ9SnPWo6DLmih/VofiNQMqGTbMnIVtSxUOCPgmtMcXJ0Ny1oEnTuLpCW+nE4QVPil8MtY2ogr85aDjksKPF2FlYMifrZyapueU+X/7vsPPYbjfT/bUV7uOBF/Djw5GAvUSVbEzOdCI6g39oxqtg2y0KkT9HOuu9hEsSJZLU0qcLR/NeIQHYz6cu96xqVnnJ/2yNonCGJns7EQ99kRxhhxf8tkr+AbzwxbwxuvNgPGbOQ8xrmo5iNmPX9kK1rboxm+AJaBrE+9s4vmOXvsUDB/GIkpFMNvI4OM1H53ki2hOeoCMkmKsn4hWbPplIDighz1Q7ZVKl2sHxmcSfWo+O7YG47CuYJLgdF3gt8xAY9WlnbHSKD3/bNP58x/wR6GwJhIomZcoLsMBC0cKSCVZfx/SIg95KgEKUMlh9X+brMLcZaU5gJbso8MJGGRWnZpb1zspNvZOqQma+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2t2bHdFYW9FdlRLUUlUam1KR0h3dHh5d1ZEa1JVQ0M5WmprSSs2Y1ErUTZt?=
 =?utf-8?B?SnpWM3dSdVczbE43cmNoTWlOcmpXQjRjaElBcGFkMHlaV09KR3RPeTRVYWkx?=
 =?utf-8?B?YnpJN0VkeUtDbnB6cHBvc3l4c3hKZjNqbjR0UHFnbXYybTI3NzdpUEo2WXhX?=
 =?utf-8?B?WGx5TS8zeTFhRFlSaTFzVEpvbngwcEp4d0h6NjdSaW00dytiVW14aHNYaGMw?=
 =?utf-8?B?QVBwdkdxWXVKemRoVVhPdkFlSDhBOFFxaFMxNWtQbkx4TVl6NVczV2FjLy9J?=
 =?utf-8?B?YnpRWWttMzFCOFZHN2ZaanJEd3hnYjg2VTVUNFQvWHlUUHVla0sybldYOS81?=
 =?utf-8?B?amdqc3h2bXlUdEFmZ1lZK2liODNGNm1MRGd1WlVJb2djclpNN1VtT3BDak52?=
 =?utf-8?B?TUphek9xRTZ1bFZxZXl3NHhZcWpIVUlPbzNpcmJ4WHMzRjVUd2NLZnkxZ3dY?=
 =?utf-8?B?U3BRbmtJTkJidkRhQWM2WEhubkw2MldYVGVFekl1SmVrNlhKcFplUUx0YSto?=
 =?utf-8?B?ZjY2STF0ZXA4Ujh2Um9oaktYYnRHbjVlZGlLaFhQSHBjUlhBVXpuMm5ScUw2?=
 =?utf-8?B?L3kxRDBaM0RpNi9HWVMyVS9Lcmg4bnQ1SzJUMlNlVy9FbHZzUWhoa1NlU1Jx?=
 =?utf-8?B?UVkyMi9CcHo5WDZ3ZGY4WGNyMTNiaUU5cm9oUFJvU2x0ZG9jUHpkZC9yMllh?=
 =?utf-8?B?ZWJoNytUM1Nwa3AwZ0J4d1FiS1poazV0SWtJeVJIN2g2aVNKSmRndUpTSWhK?=
 =?utf-8?B?UnFSUUxSN0FGNU5FWnllSXBTL3cxUm4rN1hWeEtYK28xQTFkQkVJZFVnRUVK?=
 =?utf-8?B?K2JFeG9nTElCcHBRWDFNTU1tb2pmUlNlZ3A1Z0dRK2F5ejlPY3ZQdzVSOEx0?=
 =?utf-8?B?K0VhUzMwOUVSZGtOV1hJbVFoemFOaHFlMlFCd2U0TkZxZmY5MUhPaHlKMkUw?=
 =?utf-8?B?RmIrbDZ5YlZEOVB3WU1oVzBCanpaOXpKY3g5eWNhWXhEWENRSDBpRnFHeW9T?=
 =?utf-8?B?aVRwYTFacm84R0lFWndCTlAvcGlDNjUza2N2QTZRSjVzdEgzYVpWSndBNGhU?=
 =?utf-8?B?T2RvUjllQUFQaXRTZ1M3OUovTEhZb1hmeDdzVmREVkdQVGw2WHMxQW5VdW5p?=
 =?utf-8?B?eGZTUGpGd09vemloL3BGdGVaNHdnS3lscnhXSW81TTNCbXlGcGk4MXd6aEhV?=
 =?utf-8?B?VXZKQWNKVE9RdlV0cjRLNXZycGg2dDJvSVd0MFFqTlZpeHJOLzRCM2xrVW8v?=
 =?utf-8?B?OXpxSEtPSzhocjhBa1RDRUU4dURRNlRQNDAzR25McUZxcjMwT3NNbDZEQVRP?=
 =?utf-8?B?UVdwZGxPMlBpdW5rMFAzTXBDVlpXRmtnd2Fuelc5d0trMTRiQ0JyZmNFVVU5?=
 =?utf-8?B?ZVRYSDZwbzcrVVIxYUZqdEx1blJzVkZ3VEhlb1pleTZDR3FnQmtpcWp1R0lK?=
 =?utf-8?B?eW9TMWtCSTVGYThHK1Z2K2JsTE5zSHhMUGFyY29UTFdGWVRsQ1FYVFZzN1Jm?=
 =?utf-8?B?MFRnTXZPbktraDJNZm9acDhDMzNHbkw3NDJjUmJLWi8rZmtoODNJMklFWDVO?=
 =?utf-8?B?TUlWM0dDMFFkNklmc1dOT0d1eWFHYUc4eXdGTmhhMmpYLzl0Y2xxU3NxVExz?=
 =?utf-8?B?SXF2VW5zVndpcnk5MVFKVzRVZG94UWlqN1lEM2NXa0JuY1FJL3htSVZSU3lY?=
 =?utf-8?B?eDdkZmlnY0Q2KzNWS1FMSXRaTkJSVkVoWHZoOTZ1aEw2VVZMeHc0bU9OVUtz?=
 =?utf-8?B?c2VyWFFIOHpNNzladEFETzVFYVZvaHFOZE0wSWxLMFVxMFpQWjhYVjZQQUdw?=
 =?utf-8?B?MDhXL1ZaMG1mTEJGcER6WDZWRHJoN2k2V3J1TUQzZnNNVVdPMmRGRmZvUXlz?=
 =?utf-8?B?bGkzcUFaT0N5ZWZmN2c1Zkk5dGxYRU9RbVN3dTJtZkZONTV3clhyUDljSWxW?=
 =?utf-8?B?Qk0vQ1R2Sk14ZjNMUFhudStnQlNlS3hvbnVVRFRFL2NmQVFuWXFSVndwVzZ3?=
 =?utf-8?B?eU9EUlM2Vk9jS0JiaVlzb1ZpQTNMTlBnT2NYdjdtWmJJYm1KK0xEVGE4Tkd6?=
 =?utf-8?B?bmtmaEE5WW5WblJmaU04ZGZ1REtOVXdOOTlUL1FpSkVueHFQVHRtbFZpNDBZ?=
 =?utf-8?B?YVBYVmFveUxLalg2N0c1OWw1YU9hQ1NWaHl2MXdkcjQ5bG5qYlQrQ29aVVo0?=
 =?utf-8?B?SlBCT0tlRER1dWpxTFQyZEw1QTlwd1JSQlVsbE85T0l4bGIvQUFrTElwVUFC?=
 =?utf-8?B?eHJYMUxkTThvZ2FoSUl4RU4vS1lHZkhKM3lZa05ObTZaRlNaTThkMFVLTHl3?=
 =?utf-8?Q?XaE0cmVIr04kl/qYFW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7b4fe1-1bf3-437d-b718-08def9644dbb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:57:13.1437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mv7PiJHnMFMqiu2J0yD6pdeZA+6URWngP/1iKq4IiohtmgvXtZGv2W/jv2xK1QVJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6303

Hi Reinette,

On 8/10/26 22:20, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Kernel-mode resctrl policies allow kernel work to be associated with a
>> specific rdtgroup, optionally restricted to a subset of online CPUs.
>>
>> While user space can query the active kernel-mode policy and its associated
>> rdtgroup through info/kernel_mode, it currently lacks visibility into the
>> CPU scope of that binding.
>>
>> Introduce read-only kmode_cpus and kmode_cpus_list files for each rdtgroup.
> 
> I think it will be easier to follow if this is deferred to not create these
> files in all resource groups by default. Instead, at the time they are
> created it should be obvious that they will only be visible in resource group
> associated with the active kernel mode.

I am not clear on this comment. Do you mean create these files when user 
associates the group to kernel mode? (during rdtgroup_config_kmode)

Also, you mentioned about rftype::create_hidden in
https://lore.kernel.org/lkml/0126a5e5-48cf-416f-a21b-c231a703c18b@intel.com/

Can you please clarify on this?

> 
>> These expose rdtgrp->kmode_cpu_mask in both bitmap and range-list formats,
>> consistent with the existing cpus and cpus_list interfaces.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> 
> 
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 178126bb2da5..12db6933bc54 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -216,6 +216,8 @@ struct mongroup {
>>    * @mon:			mongroup related data
>>    * @mode:			mode of resource group
>>    * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
>> + * @kmode:			true if this group is bound to a kernel-mode policy
>> + * @kmode_cpu_mask:		CPU scope for this group's kernel-mode binding
> 
> "CPU scope" could be interpreted in various ways here. Could it be more specific to
> say something like "CPUs on which kernel mode is active"?
> 
>>    * @plr:			pseudo-locked region
>>    */
>>   struct rdtgroup {
>> @@ -229,6 +231,8 @@ struct rdtgroup {
>>   	struct mongroup			mon;
>>   	enum rdtgrp_mode		mode;
>>   	enum resctrl_event_id		mba_mbps_event;
>> +	bool				kmode;
>> +	struct cpumask			kmode_cpu_mask;
>>   	struct pseudo_lock_region	*plr;
>>   };
>>   
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 346aa4df62a4..0d5c94169d03 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -392,6 +392,37 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * Display per-rdtgroup CPU bindings for kernel-mode enabled groups.
>> + * Supports both "kmode_cpus" (bitmap format) and "kmode_cpus_list"
>> + * (range list format); the output format is selected accordingly.
>> + *
>> + * Returns -ENOENT if the group has been deleted, and -ENODEV for
>> + * pseudo-locked groups, which cannot host a kernel-mode binding.
>> + */
>> +static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
>> +				    struct seq_file *s, void *v)
>> +{
>> +	struct rdtgroup *rdtgrp;
>> +	int ret = 0;
>> +
>> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>> +
>> +	if (rdtgrp) {
>> +		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
>> +			ret = -ENODEV;
> 
> sashiko also pointed something related out but it is not clear to me how the
> different group modes are planned to be accommodated. I think it should be possible
> to avoid sprinkling these mode checks into user space interactions if it is
> made explicit that (a) at the time a group is assigned to a kernel mode that
> group is required to be "shareable", and (b) it is not allowed to change
> the mode of a group that is assigned to a kernel mode.
> 

Sure. We can add there checks.

> Apart from that I do not think a test like this is sufficient to capture the
> various scenarios that may occur. For example, while waiting for the lock
> the group assigned to the kernel mode could have been re-assigned.
> Could a test on rdtgrp->kmode be more robust?

Basically, I need to check for rdtgrp->kmode  here. Sure.

thanks
Babu
