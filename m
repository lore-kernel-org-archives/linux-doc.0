Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013030.outbound.protection.outlook.com [40.93.196.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BB31B83B;
	Mon, 20 Jul 2026 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784574963; cv=fail; b=pXnDsPXJ0bov0zTN+yUbXCkuz1rih8vxXpaLtYoDc1h465fjD7yOUhFgZpMr7kMTAHVhZZfB+O8pS+1XKyrJ2cN9Rz2epfmNjHEzCOtA42jwBvGpDaYfZzWz7sW2e7nWvgLOLEQJo8DaYBiZH9J2mdE+5h7KQ+jdMurOMjCGH88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784574963; c=relaxed/simple;
	bh=oKHOOjYHl5l5MHIpvGZ8G0fn635exWhSNtmUam76X2I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LxEjJ8tmkEC2L/AxXzggidMHfgRw7mpg3ZWPzszgJUXq/frGyHfKoiBSWoz4/cpSSsqvbOZslyhVa+Qd+ksVnr6NZEHSi+MNg//g04NaWnFipKQe/uYQsFFc4kGo+0sbwbuYMeyOBiaB8xDYcVEpVFt+HZj6RARyZyaOsVSu1o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lr/5xe+f; arc=fail smtp.client-ip=40.93.196.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lr/5xe+f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQjOyD/dgkQJ+luGqN1j/vUAgnVu9PKrhC6NeijN8tsQLt0eZWEZM0CnuYU3IeqR7uNyhOz1i2soyUAQs60pYZCp85bNxTlSrBneQ1LQevZxsXPJNgSkUA4k7esFP7cOG9ozT3HfTyvciI0W2Si6LoyBGAc/zaipBfRNKNhfJZqUesoRllzbPU1eQYLmTO+0D36ykAE+9XiO2jZFF09yU9m7DJhbfwXpJHzV+NWmIuMLzDWL7YKP/oRttlzX85kEZfYnsRtnDF6gFLiByUMXvLNvhHxO/6mWf5hffq4MauBpMkxkNNYSVl+rtdOhyMnJEZpWtbl4nAMyQbcT8JFCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qe9n/xDfsAFf6+Su155reWpIoJZFRxq2TWZQQJvvePw=;
 b=IHDWXc2O9/8Swod3SqeQyb37ClOB/IL9dh0c5Bdq8dvvluKfFox4OBtR42jl9CbufRYCu+18YW9TdwUD3Fp3cnhaV1ey/Ws8hZjaMW3SYdsLUlLmsuFC/FjW5t1QscdaTTWVOdV0ZVkKd/jN9hC0W0LX/74Stz+IuxPrbs7l9MyG9EVEl+VQ0so1Ll93ZMo8YauY+giS/oN2oFoiYWTKYYrxpPAlrltX5LVepTz+ZTWeef2/3WboYwGLhaI99nRWUqLMWNXTFQizagmWIKC0DH9hjqmqR2XVSBy4qcpa45WJOq7N5WlOKTKgNVwQVm5dGOxa/RERCv6y0+Zaq1WA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qe9n/xDfsAFf6+Su155reWpIoJZFRxq2TWZQQJvvePw=;
 b=Lr/5xe+fe4/hlnDxU8YmkWFN91PvopUbwR4V98V9/Du1PaKqWxpHvQNnUwhhVczKDcpIoxvtIbqch4GNUwKjfcYxL3b5VMlZRyqYIeR0kgt0I/Gp6oYb96JOKmdvPebvorD4Aw0LXlPCbRc2fvcXkrLYr6YXPJlQ4TTxzXtJHKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 19:15:58 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 19:15:58 +0000
Message-ID: <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
Date: Mon, 20 Jul 2026 14:15:56 -0500
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
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:610:e7::11) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a445f01-ae87-4d9d-07ed-08dee693546d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|56012099006|5023799004|11063799006|10067099003|4143699003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YuJU/uEryYOwMW8GB8QP+OtvJ4q1/NBfPRu1wtx/2mjP2YC5PoNUMXjXIFo2AsOjQjNXpS0Na8Xo8aa2vXe0UBpRX8nYXOc129nxjnMCLJ7LTnXQFN6qfjB49X6854wgTeZBB+8ExOPm9RSzJzpqBKvKHhJPsXfQATzC/L7FWeo4j8G4fUyP7XMjNz4b8RtIHUgWANiJe6Q1FYC2cc0Y1dhL2A0VNW98ugLp2Do3MOgj8vZANYYqzafD0Vx9sQpbEHxwLQc5WnmK6s1zJB4V1GM8wKf5LY0+bTXZX8m05DYHEhZTArhDrzrAQRATbAUyrW78gLpUnQdHKAa8dJMrsGE9GajFVol8YG7YHab3vBjkE7ZjlaklT/TnvEFzNhcSEpOCakPpFtvI9WTsfb5QFshhgpmaPt92qd/SGgICixp5uEt5VPp0HX5JDh4ZOQioPnDzVqFfXGnAhGcWrMn0Zllzv1ZYjQNQu8Yz/DskZeFFpnV1YaxSdv/bhrLsYOkBx6K3JXzeLV6719wZ01dzbnu89FPZV+1+d3SnA7hugmgbcH/cebKFIofytgw2G7ZAraeMuUWELhO5MfjKEzTGNCDF1Ykg2EdgqP+6CeT5MIALAetQTDbKrUNEgNw5m02uy3krWEqwSTWGi3ybBR85/IMXPZBKPObAHPP/i/L9dcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(56012099006)(5023799004)(11063799006)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2dYb0ZKVmJyN0dSa2UzMUpxK3dsTmtxQjhMWmZwYW9rU3lzRkc1cnUybDFO?=
 =?utf-8?B?cmlXWlVMQnpyemZqSE9EU3djVFgrSDlmalRsL1A3cjFnalA1VnVYQmlYbkE4?=
 =?utf-8?B?VHdDOGk4bHJBYXorMzRQMjgyc2FpOG0ySGJtNEttbC8xVHF6WlZDNVM2K2xY?=
 =?utf-8?B?N2xaYWQwZlYxVFozRlZFSGNkdlFnRi9YcXEvZWFFZGxmaVlrNGZTR3A4MW5J?=
 =?utf-8?B?OWY2NmN0dkNwRjFucFErZWVGL3A4dWZmUG9UYTAwSTk1Q3ZyaXY5OW5tendI?=
 =?utf-8?B?TkVBZU9aQ2pvTWFhODdzOGk1VW5ZcGtHOW1MdHBTazU3YkplZExyNEZQbDJS?=
 =?utf-8?B?a0V0OTZTMmNXRmx5NjJTdmxFQ0N6UUxRNk05RFR3ZnZZWSt2S241V0E2Q2FG?=
 =?utf-8?B?eDU1WVRZUitIZHdUdDJmbU5ZTVBVMU1pcjVxLzg3ZWlFSTlnNUUzdTR4QkVi?=
 =?utf-8?B?a0E5ZUZZTHRjaENJRys3U2xhcTVZVElUcXdtRE1CVnVYNXJEaWRHU3gxOXhi?=
 =?utf-8?B?Q2dGQkJ4N1BLeWpBNC9xVkFidk5HVUh4bnR6eVM2eUpXZHdwR3MvRDNSS01m?=
 =?utf-8?B?YmcxRFcwSW1seHUrRjNoU1Z3UkFzZW5XWjJKRTJPNmdTQ0VtZzJlYU1USS9U?=
 =?utf-8?B?a3p6enRIZ2x4RmN1VXFEMjl1cTdOa0l0aWxWSnZFOHVUY3pmSmxIWmVpWVJV?=
 =?utf-8?B?cTI4RFp3Um9rdzY3Vkp0Y3JQV0ZUM2d4cnhqdjl4d3FpMlhHdWFjSDkxb1FV?=
 =?utf-8?B?TlZyRGh5QjhGSzVFZ014bmtUQ21pcW55YTlaaCt5MVJ3bTkwVEhBbjljUXQz?=
 =?utf-8?B?SFNjbmxQVldrekp3d1B2WS91ZDJ1eVd2ajJmSVdrbUJjRC81SmxvRU5jV1lv?=
 =?utf-8?B?clY0N0laZ1ZYLzk5NG5rczE0Zm1MSEl5VnF4RGdXWGpuUGxHc3RlNGRISFF1?=
 =?utf-8?B?OWVkWmhGaFVnYUU1Mmlpc25VcHY4RUhiWmdnVmd3WW1hbHpOYXFPYVdQTS8r?=
 =?utf-8?B?WGRKb2x0TmsveDJsakRpL2d3eFJBcFpKWHdRWnI2OFBaTVc1NmxRanhlVDFE?=
 =?utf-8?B?ZXFLODlvaStjTWYwMENDZ1o3bmxnZ3NPMktMNjhsbEZrRnJYS2NjRFVzTmth?=
 =?utf-8?B?L3lMMzhLOUxPSGE4bVNVVFplc080M1AxV1VobnZaVFVjc0dsQnVRTTF3c2pi?=
 =?utf-8?B?NEtKVXAzVW02ekxKM1dHOGhWb09pYWJLZWs4YUxCTEhEK09OSk5PUVJHdGY5?=
 =?utf-8?B?OFgvK3lOZnlFS2xkTE9iYjdKYXlEQm5EZ2NsQXVGR2xNend1dzBJSFVFYUp2?=
 =?utf-8?B?djlZV2ZUUDN6dFU4MWFlWW0vaHlYUUcrdm9HeXZJZ0U0TW05NlU0aVB1cUlB?=
 =?utf-8?B?K2xFWmtVeVhONm1Sd2xPWk5mSEk4dXFtTmFnQzNma1FGWDBUdXVDSmMreFBV?=
 =?utf-8?B?UXNUSHBKRFJwWmo4bnN5R2ZCQnJWb3FxQXcwM1JYQjEwOERvR29IVm9qTnhs?=
 =?utf-8?B?Wm03UnFaWGpWQTlvbDZvd0FvdnNpaEIrTVlGWGZRbTBkQW1UdW02amljUWNh?=
 =?utf-8?B?V2MxUHVJQWFkZFpZK0pRTUdQU2lQSEkrNlEyZ3lNRFB5ZVB5cVNuWTl5RUVV?=
 =?utf-8?B?bXc2SU5VNjM0Y2c2RWxmWnF6RjNnRUVmSmpKN25UcTRNbTRXM2ZTT3FnQzY4?=
 =?utf-8?B?SmRlZ0cyeG5TVzlTNmpIenB2c1hhdUdIMU82L0xmRXk2QWY0YUgzZUxocysr?=
 =?utf-8?B?N29nOG5JUmN6ZVY4dmtjc28wYUxLQWlUZXB6ZXZxb0JLR0l3aGljSTRod1FT?=
 =?utf-8?B?SHhvQlNiZkgybm1ZUFlrN3NtQTVkYm5hMHB4WmdScWNaTmozVFc2Rnp5OFlP?=
 =?utf-8?B?MWw1ekowcUtlZGVScWVSTjlVdnlpUGxIaS82eDRiZDAvK3QwOU10VGZSWVpU?=
 =?utf-8?B?RHd4Ui90SmRHUVVrRGVnWU9FUnp2dS9ma0szVklnSDEwTmx6WFdFZEZObU50?=
 =?utf-8?B?ZlFma0Z0RXgvSGtnMElLU1hCWW1pVlBQa21BcWk0RllpN1A2WHlrMkhra3pZ?=
 =?utf-8?B?RTRFODNtMGwyeWhJQVJpSkU0TWpybFdJOWJMNTI3b3hqM1c1N1VOb0lFUlRI?=
 =?utf-8?B?dVArbkR1S3A1dkp3Mk9CVFFPQllsYVRKWE5HMkpYcUZsTUZVeWMwcCtFaldW?=
 =?utf-8?B?REhSeTFQVUdCcDRoTDRLd0tWZ1pJOG0xVXp1UDJOSkNNZ2creDNQaGdEOVJz?=
 =?utf-8?B?aDZmRW1NNWRDS0xXbDloblZQOXVIMHJqdHFrUEFVOUszVEhkZEwvejFiMTZx?=
 =?utf-8?Q?5s09LSocWapV6CJMjZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a445f01-ae87-4d9d-07ed-08dee693546d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 19:15:58.5517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFp4Mpe15nQE9nJmbR4imIbcfKmKHLsC94ACM37Uc96fU3cMcfFMv8nD03UVdsKZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961

Hi Reinette,


On 7/20/26 13:27, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/20/26 10:00 AM, Babu Moger wrote:
>> Hi Reinette,
>>
>> Thanks for quick response.
>>
>> On 7/17/26 17:56, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 7/17/26 2:13 PM, Babu Moger wrote:
>>>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>> hardware that supports it. However, this can cause bandwidth monitoring
>>>> failures with existing userspace tools such as pqos.
>>>>
>>>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>>>> groups by default. On systems with 32 or fewer ABMC counters, this default
>>>> configuration can consume all available counters, since each group requires
>>>> one counter for local MBM and another for total MBM. If additional
>>>> monitoring groups are created, counter resources are exhausted and pqos
>>>> tool reports memory bandwidth counters as zero for those groups.
>>>
>>> It is not obvious to me that this is a problem. If I understand correctly
>>> there are two scenarios possible with this pqos behavior:
>>>
>>> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>>>     - pqos can create 16 or more monitor groups
>>>     - hardware still supports a limited number of counters with consequence that
>>>       underlying counters reset at any time as the different monitoring groups
>>>       need to be tracked.
>>>     - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>>>       events would return "Unavailable", sometimes reading the events return data.
>>>     - *None* of the monitoring numbers returned are guaranteed to be accurate.
>>>
>>> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>>>     - pqos can create 16 or more monitor groups
>>>     - only a subset of monitoring groups have counters assigned and these counters
>>>       are guaranteed to only track the monitor groups/events they are assigned to
>>>     - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>>>       - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>>>       - monitor group/event does not have counter assigned: monitoring numbers return 0
>>>
>>> If my understanding is correct then the preference is to rather have wrong data than
>>> see 0? This does not sound right. What am I missing?
>>
>>
>> This hardware can monitor up to 64 RMIDs without any counter resets.
> 
> How many RMIDs does the hardware claim to support via CPUID that ends up being shown to user
> space via "num_rmids"?

#cat /sys/fs/resctrl/info/L3_MON/num_rmids
4096

> 
> I understood from original ABMC enabling that the underlying hardware counters of "default"
> and "mbm_event" mode on AMD are the same. That is, in "default" mode the hardware does a
> "best effort" assignment of hardware counters to events while "mbm_event" mode lets the user
> control the assignment. It instead sounds like this is not the case and there are actually
> two distinct underlying hardware counter mechanisms?

That is correct. They are two different counters.

> 
> 
>> As you know, the pqos tool creates COS1 through COS15 regardless of
>> the command-line options used, resulting in a total of 16 groups
>> including the default group. With ABMC enabled, this consumes all
>> available ABMC counters(32 counters, 2 counters for each group).
> 
>>
>> When pqos is invoked with the -m option, it creates additional monitoring groups. For example:
>>
>> pqos -m all:0     -> creates 1 monitoring group
>> pqos -m all:0,1   -> creates 2 monitoring groups
>>
>>
>> Since all ABMC counters have already been allocated to the default
>> set of groups, no counters remain for these additional monitoring
>> groups. As a result, the monitoring commands report zero values,
>> effectively making monitoring unusable.
>>
>> In contrast, the default monitoring mode can still support up to 48
>> additional monitoring groups (64 total RMIDs minus the 16 default
>> groups created by pqos).
>>
>> For this reason, I still believe keeping the default monitoring mode as the default is the better option.
> 
> It is not clear to me where the "64" number comes from. Even if resctrl sets the "default"

The count of 64 is known from internal information. It can also be 
determined by allocating monitoring counters in a loop until the 
hardware starts returning an "unavailable" response, which occurs after 
all 64 counters have been assigned. This information is not documented.

> mode as default, what will happen to the scenario you describe and 49, instead of 48,
> additional groups are created? From what I understand the moment the 65th group is created user will
> transition from "accurate per monitor group monitoring data for all 64 monitoring groups" to "inaccurate
> per monitor group monitoring data for all 65 monitoring groups" with no indication that this is happening?

Yes. That is correct.

> 
> I believe AMD supports more than 64 RMIDs and in this case there seems to be three ranges:
> [supported by ABMC, depends on events but lets say RMID 0 to 16] < [RMID 17 to 64] < [RMID 65 to total number of RMIDs supported]
> 
> Current default "mbm_event" mode uses ABMC so as you state this always results in:
> - accurate counts for 16 monitor groups
> - zero for all other monitor groups up to total number of RMIDs supported

That is correct. With ABMC, there are 32 available counters, allowing up 
to 32 monitoring events to be tracked simultaneously. Since each 
monitoring group requires two counters—one for local MBM and one for 
total MBM—the system can support only 16 monitoring groups at a time.

> 
> As I see it switching to the "default" mode would result in:
> Scenario 1, 64 or fewer monitor groups are created:
> - accurate counts for all monitor groups
> Scenario 2, 65 or more monitor groups are created:
> - inaccurate counts for all monitor groups

That is true.

> 
> I do not believe there is any way for user space to know when or if system switches from "scenario 1" to
> "scenario 2" on these systems and this unpredictable behavior that results in wrong data does not
> sound ideal to me.
  I agree, it's not an ideal situation, but that's how it has always 
worked. At the moment, I'm not sure about a better alternative.

Thanks,
Babu
