Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD827702;
	Tue, 24 Dec 2024 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735018878; cv=fail; b=PEYKlP9IfnwPlH70aeZH0fjPT1wwdagYp7nbpHX25l6jajsj1Zk+2PsfdxWCXFf321X/d0xQHVwJH0qgpcnj1vo+4Nlwijvy8TySQH6iJ1+rBw/i3ty9BoNTDa+j1X3U1L3yEiqAgFzULhh1bb3SAU69jzyR1zC0WvvbHsxuGz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735018878; c=relaxed/simple;
	bh=HN17gRYImvWNdgE9qL/PcB2uma8/5rvXnbiU7ib542s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TGbA/JLfuGI/7VvJY2gqShKWAj/RU9uQta9Pa6T/Qawyh1It14A9jCuZORPft/jqH3pBZS96/UbRESH8blW5xuDeW2jKtxXhWkVkDt+iThHtyLKAHXBBo201HV2LEW80Yr87JjOzWGvdd+zpfN4Xgx2Wsp/O/ZxNSbebXSIVpRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n8NDQ2Yw; arc=fail smtp.client-ip=40.107.94.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n8NDQ2Yw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5TG2g5pXaBuENcBrfnkxtls9U39QI+gV48jJ18GMeBJYrIHWHDtSilp7nhD2Gw/csiCw6T4ok25BRloyXFDR+V7qutrBfj0WYeUTLpPx5hLVWzNR/Bvz6EjezGdc28YJIw8tVUiK498i8Srl+znlNR5sAWp7nYKzSgtPNNypA2MBqrcyTvd7sQN9KEeGx+obb93eVN5NrB9jhH9IeTpFuw/Pib40X597XMITFW+wxi0HrsM4wnF13r1Ib/bttAdBQih8YwtC4GWXeiXRPbTiJdMfXL1+h2VQFiKm2bAmKFdRoJOtijbAq8rMi+jbhxVcrWbF8S62P9yYmRnlv6Q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVDcRqnF++3el8wtEU9xZSmqn18BbOcxVJ8p458P3Y0=;
 b=woo8wcKNFFmo8qaGPClblDu/yU2M0X7U2vlQXorDV7jMdvnzq7zRgBoZCuze+nddAzY8/ELR1sr/vucK0u98u/VyAHe6McJZaEN9LnuuWoDeqDArevRqkzUIpCW68BcR5cM2yAaJYVxl1Mm0U0lRGoFaC/g1O7B51RUG5VkOLOwXgRugmJlshZDhP1lwFbKyRsJ/a1Yjk5xWid8jZF+wNwqH0ttoZ3RcWdz4gdyaBMTQtoHqWRK5EWaZpWUA4HQPPl+vyzkRcScgQr+p78RZCc68vCyj5ewpxJ8N4EiM6yCjY8pFBgUAAMpN0gMU1DRflUVFWiDATOcaX2aa00ldGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVDcRqnF++3el8wtEU9xZSmqn18BbOcxVJ8p458P3Y0=;
 b=n8NDQ2Yw3zs9+Ad9kq3EJh8oRRV2mKoR0hkgyOGzNv62uQWr+zd/RJ4kRs9H5JVzO4WK3yAfAcK8+UVFdXXpaVGRkSQovZ2mjjmMVwmYCnfV9H10AFb5LqhVQffqR796E0nfezj5GO+Uu1MczTA2nKrdhfRaxviNxJLw4B9JEQ4=
Received: from PH7P220CA0141.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::29)
 by SA1PR12MB9489.namprd12.prod.outlook.com (2603:10b6:806:45c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 05:41:07 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::93) by PH7P220CA0141.outlook.office365.com
 (2603:10b6:510:327::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.21 via Frontend Transport; Tue,
 24 Dec 2024 05:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Tue, 24 Dec 2024 05:41:07 +0000
Received: from [10.136.33.190] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Dec
 2024 23:40:56 -0600
Message-ID: <1ccbc757-2437-4b40-b3ea-1e6926bc5b0d@amd.com>
Date: Tue, 24 Dec 2024 11:10:48 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] docs: Update Schedstat version to 17
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <alexs@kernel.org>, <lukasz.luba@arm.com>,
	<gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>, <ravi.bangoria@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Adam Li
	<adamli@os.amperecomputing.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, <corbet@lwn.net>
References: <20241220063224.17767-1-swapnil.sapkal@amd.com>
 <20241220063224.17767-7-swapnil.sapkal@amd.com>
 <1914488d-6c37-4a3d-8008-13c64a6fccf0@linux.ibm.com>
Content-Language: en-US
From: "Sapkal, Swapnil" <swapnil.sapkal@amd.com>
In-Reply-To: <1914488d-6c37-4a3d-8008-13c64a6fccf0@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SA1PR12MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: d11417c7-5178-469b-bcb5-08dd23dd9077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1hLVWtCYWFST2dXcGN5R2lQT3NHaUZ5ZmNSNDNaV0pLZjIvbmt4UmpJV1NP?=
 =?utf-8?B?WE5LbUtKc3RYeVROMS9VdzZ6SEhQdlZzY1A5M2NJZWhCd1dJT043Q2RTZkV6?=
 =?utf-8?B?RHY4MkxvUC9RMkdiWUl2RUVPenhSc09zNnpjUy9zREVyS0lGbk4yK2w4TFBo?=
 =?utf-8?B?eGFQelQvRG53dE9mTVVhdEg5WjFEcVAzejBkeEVYZy9tUUpZS0ljbVphRHhu?=
 =?utf-8?B?U2xObW1ZZU5rWG5PUmUwMmRSV1NRRlp5Ym5qVzZYdVdWTjBUUDlUanIxeEtL?=
 =?utf-8?B?b2pNUktIblhoczdoTFRXMkxNSmZVcWhHM0dyK3c1YjRXS2NzZ0NuUW9CWlRC?=
 =?utf-8?B?Yllpc2pGeFF3QzAwTklKdjJZYnl0c0grV0M2K0ZyYW51VkVtelFVN2RUUHN1?=
 =?utf-8?B?ZnF0L1ZVRVR5azh3ZStndmp2WVd2Q3NkdE81eFA1R3VZdmFlbzJ4OGZibjRP?=
 =?utf-8?B?MWlURWhVT1FvRjhsWEVVa3BBTW1lZGx0MXEyeW9rT1pGdFl0citleGRCbEV1?=
 =?utf-8?B?WmF3ZGs5N3E1K0d4WXdMZjhTQTljTVZxLzEvYktDaURNMGdkY002YzY3ZzBi?=
 =?utf-8?B?Y3BxQTFwV2d1V3hucFBVL0xDU1Qzc24zK2h2ZUxZamV0dS9ZWFZHT0doWjJm?=
 =?utf-8?B?M051SmdHVnk1VGc5OG9kNG96ZDR2c2Z4VEFCRTBQT3I3bkN2dEkza083d1hT?=
 =?utf-8?B?VGhWWnVnYzVSUDM5T2ZranpZN3NHZFdnVmdZVDBBalB3VVZlVmdYMkVXbG5J?=
 =?utf-8?B?UmNzM29ydmZ2WGs5U3M1eXhkdmFXSHltYmF3SlE3SXljQkRkdWxtRXNOVWlj?=
 =?utf-8?B?UElzMUowY3RuR0hxVDhDeW40UER4Q3ZTVVJmR0FoaXVKMWlTQTI3TStNNWhx?=
 =?utf-8?B?RlJZYmxWRW5KYVRhdThPSTBEQVZHRkZhSnNGeDA0S0FIUmpBdDN0VldrNk5w?=
 =?utf-8?B?eGVualJoWTE0eHdHS1hqcEVabnZYYUs4bXF6ck5ndkdWTGE0T1dSaGhvWHln?=
 =?utf-8?B?YWQyb1RsTEdMeElmWEhreDNBa0hPSUx2NDR2amlaY2NkeUR0cEZ4QklOZjI3?=
 =?utf-8?B?L2xuZHYxQkpNcVkvcko0ZkFmd3NjNDcrSy9CQWhRaDRpbFFKQU4xZDQrRUFi?=
 =?utf-8?B?am9RclNPblpWemllM1JxaWorNUVuQzBhU1Z3SHBhM0NYbDV1UGZYa2lPcWlU?=
 =?utf-8?B?cHoyQlIxbk15T1BBUWZjRmFTamkvUXRLUm1FUFcwQ0I1Ym9hWDJrc2Fsd2Vs?=
 =?utf-8?B?azMyKzU3NFBRRHFvbituc0VqVStMcG9VT01QcEFmYUlPeEpXNnpMSVJoZWd3?=
 =?utf-8?B?Zy9FR212Uk9QQ25ZTFZzbFZMTUZRZFpwWkpKSjRtNnd6TU9XaXBzMnY0dFZh?=
 =?utf-8?B?aWd6cXFGSkVVQVhDVHlxT0VKaWN2SlpjVjJQNU9CcDkzU2hnOEVKRlEvNENv?=
 =?utf-8?B?dFg3VzkvVFY0a3hzOHp3bEd0UDhXbEt0NGhsUjd5d2FURnk1eFJSNjVVK0N4?=
 =?utf-8?B?TG5CUUJwanNRVmhmeGZGZEFlRTJTZnMxQm00dG13UEdkOFgvbmx2YmwzNjBl?=
 =?utf-8?B?cDJONkpTdTkxSFlKaXdXQURtMVN6NHoxTGRvSUxkTVluMlV2M2ZkM0NvUW8z?=
 =?utf-8?B?M0dPcTZjbjRmK3Jza1hZMmxFUmFNWUlCWGNJVUgyeWZ4OWtEbmVreENtb2I0?=
 =?utf-8?B?Q2hyZ1Y3UXR0Z2RQWEFWL3R0RCtCUUN0QkM1dzhleittYzV0Y3lhUXcwbVFK?=
 =?utf-8?B?cm1Zd1FBOXR4elMrRlppSGUzRnM3ay9wOHhNdEFFSUdnZ1Azbm1SL0owR3l1?=
 =?utf-8?B?UkRUWStkMGswMy8xaVdtYkJMZjJpRDV4Ni9COUhEMm5NK05KRVdLZkJ5ekY2?=
 =?utf-8?B?TUxMVGdZd3JoZ0NjTkxydzlGRzQxK1BWS2NKSGRVeU45dWtWRUFJUGdOUDlF?=
 =?utf-8?Q?UvhumoAu5GeOU17ci2zMEz0VWuT9X8eq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 05:41:07.4207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d11417c7-5178-469b-bcb5-08dd23dd9077
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9489

Hello Shrikanth,

On 12/23/2024 1:05 PM, Shrikanth Hegde wrote:
> 
> 
> On 12/20/24 12:02, Swapnil Sapkal wrote:
>> Update the Schedstat version to 17 as more fields are added to report
>> different kinds of imbalances in the sched domain. Also domain field
>> started printing corresponding domain name.
>>
>> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
> 
> +Adam who had posted a patch to correct the doc for flip of idle, busy.
> 
> https://lore.kernel.org/all/20241209035428.898293-1- 
> adamli@os.amperecomputing.com/
> 

Okay, I was not aware.

>> ---
>>   Documentation/scheduler/sched-stats.rst | 126 ++++++++++++++----------
>>   kernel/sched/stats.c                    |   2 +-
>>   2 files changed, 76 insertions(+), 52 deletions(-)
>>
>> diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/ 
>> scheduler/sched-stats.rst
>> index 7c2b16c4729d..caea83d91c67 100644
>> --- a/Documentation/scheduler/sched-stats.rst
>> +++ b/Documentation/scheduler/sched-stats.rst
>> @@ -2,6 +2,12 @@
>>   Scheduler Statistics
>>   ====================
>> +Version 17 of schedstats removed 'lb_imbalance' field as it has no
>> +significance anymore and instead added more relevant fields namely
>> +'lb_imbalance_load', 'lb_imbalance_util', 'lb_imbalance_task' and
>> +'lb_imbalance_misfit'. The domain field prints the name of the
>> +corresponding sched domain from this version onwards.
>> +
>>   Version 16 of schedstats changed the order of definitions within
>>   'enum cpu_idle_type', which changed the order of [CPU_MAX_IDLE_TYPES]
>>   columns in show_schedstat(). In particular the position of CPU_IDLE
>> @@ -9,7 +15,9 @@ and __CPU_NOT_IDLE changed places. The size of the 
>> array is unchanged.
>>   Version 15 of schedstats dropped counters for some sched_yield:
>>   yld_exp_empty, yld_act_empty and yld_both_empty. Otherwise, it is
>> -identical to version 14.
>> +identical to version 14. Details are available at
>> +
>> +    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/ 
>> linux.git/tree/Documentation/scheduler/sched-stats.txt?id=1e1dbb259c79b
>>   Version 14 of schedstats includes support for sched_domains, which 
>> hit the
>>   mainline kernel in 2.6.20 although it is identical to the stats from 
>> version
>> @@ -26,7 +34,14 @@ cpus on the machine, while domain0 is the most 
>> tightly focused domain,
>>   sometimes balancing only between pairs of cpus.  At this time, there
>>   are no architectures which need more than three domain levels. The 
>> first
>>   field in the domain stats is a bit map indicating which cpus are 
>> affected
>> -by that domain.
>> +by that domain. Details are available at
>> +
>> +    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/ 
>> linux.git/tree/Documentation/sched-stats.txt?id=b762f3ffb797c
>> +
>> +The schedstat documentation is maintained version 10 onwards and is not
>> +updated for version 11 and 12. The details for version 10 are 
>> available at
>> +
>> +    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/ 
>> linux.git/tree/Documentation/sched-stats.txt?id=1da177e4c3f4
>>   These fields are counters, and only increment.  Programs which make use
>>   of these will need to start with a baseline observation and then 
>> calculate
>> @@ -71,88 +86,97 @@ Domain statistics
>>   -----------------
>>   One of these is produced per domain for each cpu described. (Note 
>> that if
>>   CONFIG_SMP is not defined, *no* domains are utilized and these lines
>> -will not appear in the output.)
>> +will not appear in the output. <name> is an extension to the domain 
>> field
>> +that prints the name of the corresponding sched domain. It can appear in
>> +schedstat version 17 and above, and requires CONFIG_SCHED_DEBUG.)
>> -domain<N> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 
>> 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36
>> +domain<N> <name> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 
>> 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 
>> 41 42 43 44 45
>>   The first field is a bit mask indicating what cpus this domain 
>> operates over.
>> -The next 24 are a variety of sched_balance_rq() statistics in grouped 
>> into types
>> -of idleness (idle, busy, and newly idle):
>> +The next 33 are a variety of sched_balance_rq() statistics in grouped 
>> into types
>> +of idleness (busy, idle and newly idle):
>>       1)  # of times in this domain sched_balance_rq() was called when 
>> the
>> +        cpu was busy
>> +    2)  # of times in this domain sched_balance_rq() checked but 
>> found the
>> +        load did not require balancing when busy
>> +    3)  # of times in this domain sched_balance_rq() tried to move 
>> one or
>> +        more tasks and failed, when the cpu was busy
>> +    4)  Total imbalance in load when the cpu was busy
>> +    5)  Total imbalance in utilization when the cpu was busy
>> +    6)  Total imbalance in number of tasks when the cpu was busy
>> +    7)  Total imbalance due to misfit tasks when the cpu was busy
>> +    8)  # of times in this domain pull_task() was called when busy
>> +    9)  # of times in this domain pull_task() was called even though the
>> +        target task was cache-hot when busy
> 
> pull_task has been replaced by detach_task AFAIU. So it makes sense to 
> change this to detach_task?
> 

I went through the git history and got to know that pull_task() had been 
replaced by move_task() which was further replaced by detach_task(). I 
think it makes sense to replace pull_task() by detach_task() in the 
docs. Please let me know if I am missing something.

>> +    10) # of times in this domain sched_balance_rq() was called but 
>> did not
>> +        find a busier queue while the cpu was busy
>> +    11) # of times in this domain a busier queue was found while the cpu
>> +        was busy but no busier group was found
>> +
>> +    12) # of times in this domain sched_balance_rq() was called when the
>>           cpu was idle
>> -    2)  # of times in this domain sched_balance_rq() checked but found
>> +    13) # of times in this domain sched_balance_rq() checked but found
>>           the load did not require balancing when the cpu was idle
>> -    3)  # of times in this domain sched_balance_rq() tried to move 
>> one or
>> +    14) # of times in this domain sched_balance_rq() tried to move 
>> one or
>>           more tasks and failed, when the cpu was idle
>> -    4)  sum of imbalances discovered (if any) with each call to
>> -        sched_balance_rq() in this domain when the cpu was idle
>> -    5)  # of times in this domain pull_task() was called when the cpu
>> +    15) Total imbalance in load when the cpu was idle
>> +    16) Total imbalance in utilization when the cpu was idle
>> +    17) Total imbalance in number of tasks when the cpu was idle
>> +    18) Total imbalance due to misfit tasks when the cpu was idle
>> +    19) # of times in this domain pull_task() was called when the cpu
>>           was idle
>> -    6)  # of times in this domain pull_task() was called even though
>> +    20) # of times in this domain pull_task() was called even though
> 
> same comment for pull_task.
> 

Acked.

>>           the target task was cache-hot when idle
>> -    7)  # of times in this domain sched_balance_rq() was called but did
>> +    21) # of times in this domain sched_balance_rq() was called but did
>>           not find a busier queue while the cpu was idle
>> -    8)  # of times in this domain a busier queue was found while the
>> +    22) # of times in this domain a busier queue was found while the
>>           cpu was idle but no busier group was found
>> -    9)  # of times in this domain sched_balance_rq() was called when the
>> -        cpu was busy
>> -    10) # of times in this domain sched_balance_rq() checked but 
>> found the
>> -        load did not require balancing when busy
>> -    11) # of times in this domain sched_balance_rq() tried to move 
>> one or
>> -        more tasks and failed, when the cpu was busy
>> -    12) sum of imbalances discovered (if any) with each call to
>> -        sched_balance_rq() in this domain when the cpu was busy
>> -    13) # of times in this domain pull_task() was called when busy
>> -    14) # of times in this domain pull_task() was called even though the
>> -        target task was cache-hot when busy
>> -    15) # of times in this domain sched_balance_rq() was called but 
>> did not
>> -        find a busier queue while the cpu was busy
>> -    16) # of times in this domain a busier queue was found while the cpu
>> -        was busy but no busier group was found
>> -    17) # of times in this domain sched_balance_rq() was called when the
>> -        cpu was just becoming idle
>> -    18) # of times in this domain sched_balance_rq() checked but 
>> found the
>> +    23) # of times in this domain sched_balance_rq() was called when the
>> +        was just becoming idle
>> +    24) # of times in this domain sched_balance_rq() checked but 
>> found the
>>           load did not require balancing when the cpu was just 
>> becoming idle
>> -    19) # of times in this domain sched_balance_rq() tried to move 
>> one or more
>> +    25) # of times in this domain sched_balance_rq() tried to move 
>> one or more
>>           tasks and failed, when the cpu was just becoming idle
>> -    20) sum of imbalances discovered (if any) with each call to
>> -        sched_balance_rq() in this domain when the cpu was just 
>> becoming idle
>> -    21) # of times in this domain pull_task() was called when newly idle
>> -    22) # of times in this domain pull_task() was called even though the
>> +    26) Total imbalance in load when the cpu was just becoming idle
>> +    27) Total imbalance in utilization when the cpu was just becoming 
>> idle
>> +    28) Total imbalance in number of tasks when the cpu was just 
>> becoming idle
>> +    29) Total imbalance due to misfit tasks when the cpu was just 
>> becoming idle
>> +    30) # of times in this domain pull_task() was called when newly idle
>> +    31) # of times in this domain pull_task() was called even though the
>>           target task was cache-hot when just becoming idle
> 
> same comment for pull_task.
> 

Acked.

>> -    23) # of times in this domain sched_balance_rq() was called but 
>> did not
>> +    32) # of times in this domain sched_balance_rq() was called but 
>> did not
>>           find a busier queue while the cpu was just becoming idle
>> -    24) # of times in this domain a busier queue was found while the cpu
>> +    33) # of times in this domain a busier queue was found while the cpu
>>           was just becoming idle but no busier group was found
>>      Next three are active_load_balance() statistics:
>> -    25) # of times active_load_balance() was called
>> -    26) # of times active_load_balance() tried to move a task and failed
>> -    27) # of times active_load_balance() successfully moved a task
>> +    34) # of times active_load_balance() was called
>> +    35) # of times active_load_balance() tried to move a task and failed
>> +    36) # of times active_load_balance() successfully moved a task
>>      Next three are sched_balance_exec() statistics:
>> -    28) sbe_cnt is not used
>> -    29) sbe_balanced is not used
>> -    30) sbe_pushed is not used
>> +    37) sbe_cnt is not used
>> +    38) sbe_balanced is not used
>> +    39) sbe_pushed is not used
>>      Next three are sched_balance_fork() statistics:
>> -    31) sbf_cnt is not used
>> -    32) sbf_balanced is not used
>> -    33) sbf_pushed is not used
>> +    40) sbf_cnt is not used
>> +    41) sbf_balanced is not used
>> +    42) sbf_pushed is not used
>>      Next three are try_to_wake_up() statistics:
>> -    34) # of times in this domain try_to_wake_up() awoke a task that
>> +    43) # of times in this domain try_to_wake_up() awoke a task that
>>           last ran on a different cpu in this domain
>> -    35) # of times in this domain try_to_wake_up() moved a task to the
>> +    44) # of times in this domain try_to_wake_up() moved a task to the
>>           waking cpu because it was cache-cold on its own cpu anyway
>> -    36) # of times in this domain try_to_wake_up() started passive 
>> balancing
>> +    45) # of times in this domain try_to_wake_up() started passive 
>> balancing
>>   /proc/<pid>/schedstat
>>   ---------------------
>> diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
>> index 5f563965976c..4346fd81c31f 100644
>> --- a/kernel/sched/stats.c
>> +++ b/kernel/sched/stats.c
>> @@ -103,7 +103,7 @@ void __update_stats_enqueue_sleeper(struct rq *rq, 
>> struct task_struct *p,
>>    * Bump this up when changing the output format or the meaning of an 
>> existing
>>    * format, so that tools can adapt (or abort)
>>    */
>> -#define SCHEDSTAT_VERSION 16
>> +#define SCHEDSTAT_VERSION 17
>>   static int show_schedstat(struct seq_file *seq, void *v)
>>   {
> 
--
Thanks and Regards,
Swapnil
