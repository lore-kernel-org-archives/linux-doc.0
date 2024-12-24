Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A761392;
	Tue, 24 Dec 2024 04:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735014111; cv=fail; b=P362N4qm573HgSYXDa2glsCtENAZCM3TsbiQnANm8JK8Q/wylqUpn3Y5I7uRemOJv5ZC079QbkDhjgRcFNnqCHSeuO9LJ3JLBWhLbf4s3h0PQwOK4+mPn7HFCszQXw5e2w55KMdnNH1jTOCgUpkR5hw03cB5hfHnitR7OCkJjCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735014111; c=relaxed/simple;
	bh=EFiV9nEW/xOgxvnbMQSc41Ft3OIagyMr9UheQO/7Nj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c5fQXNysu2E0gWyc44lhr29fDv56+ZqiM/H2Y2jr+qMHPT5q2nj1PD+qmjmcJfKSP9Q0p3J3drFfIjytF2wGueFgw6KcBTTBauCslKxESl2/YT1KFqRJPwtbXLYRkeNkHPoRtVnPEEGmtdyvI9zniB4p1If64qiIBHoByHqFYqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MTpq5d7f; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MTpq5d7f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShZLRGQIt68Drgqhfe8prNJo0R1TBiqhCWJJWMAbZuJfKcsMRxKDNZ+Afm/tX0yycMSAkwo6Fuy9M7aSmfG10Enztos/lBlH5T2xrqRZ5KJSRCaO5HfwJ+0CwsrxQmK+u+SQ9xqfYDSyArfb1iZxNKu+JNyeQfRaBrhCUXtwJOvld3Z1lehqvFaDFSQ22MNd9lhuSfMt3zXI83dzjpSEp0uyUO3jVg/0yDlRmRcn8OVWin8SUpWHxAN/xnhj7MoO7ZFQtT8IZ6Tixp5zVCMOzn6oqmGyuzMTZFOTnOL3ypRlQG1vS6rKEOryE5IYhuHTZO9IHbR9Jc9LGkFZXLAsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlwUUr+tRQQE1iGplEcuRmCGTxPdayW30Hv8huldYtY=;
 b=MnPFvR00LzSiiT4YkZsirs4ZHifk7DIhg27S8NVQwtH4o2tVICs3obsUEsskmxN3fWbmLtGYR+VzzLP5nal3cbzkA7b1FAnsgVyLclT9eL4+e4oFeEsJSUzJWKIsX1mQeI9zkK3PFB+6b4mC/PhcaCqCzhIg0UxN0f8qdq+0PKHoAo++9/RrVHU2Spla/u+Jw1RXRNA9/b/Swv1umUUvHmIqLthqxS5fREZ8kcoOXeSAgXkUT5+AvrWjzGSTxVhufhg7PhjhlbKHM9O/J+y9BlnXjW7BJih3UZYJeiV37SX9J7dJymWzzkQqzU5M8VPEZcHGDn/nrP0Rqgy7DItrEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlwUUr+tRQQE1iGplEcuRmCGTxPdayW30Hv8huldYtY=;
 b=MTpq5d7fep3eNFssL7se/ysYkbjeoNEoslOxoQ1fpXLy57xK99Loefg/16HbhI2DXEiaPCtyDnJf1jImKyW+7QgKC+RFD/4gBnBODJ1vNRgs5LGhpMqeusRh5Em72Y+g+FbHiUv+GUfwXR62eOBe2Dyjjyx519XVIqSTfqwOZs0=
Received: from DM6PR04CA0014.namprd04.prod.outlook.com (2603:10b6:5:334::19)
 by DM4PR12MB6399.namprd12.prod.outlook.com (2603:10b6:8:b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 04:21:40 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::d3) by DM6PR04CA0014.outlook.office365.com
 (2603:10b6:5:334::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.20 via Frontend Transport; Tue,
 24 Dec 2024 04:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Tue, 24 Dec 2024 04:21:40 +0000
Received: from [10.136.33.190] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Dec
 2024 22:21:20 -0600
Message-ID: <89e35d89-f764-4de4-8250-6923a2fea721@amd.com>
Date: Tue, 24 Dec 2024 09:50:57 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] sched: Move sched domain name out of
 CONFIG_SCHED_DEBUG
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <alexs@kernel.org>, <lukasz.luba@arm.com>,
	<gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>, <ravi.bangoria@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
References: <20241220063224.17767-1-swapnil.sapkal@amd.com>
 <20241220063224.17767-5-swapnil.sapkal@amd.com>
 <f1f58a96-ea2b-4635-a139-acdefc20b69c@linux.ibm.com>
Content-Language: en-US
From: "Sapkal, Swapnil" <swapnil.sapkal@amd.com>
In-Reply-To: <f1f58a96-ea2b-4635-a139-acdefc20b69c@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DM4PR12MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 259565d2-58fc-4f56-9726-08dd23d27711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXJ3dmVlakJWRGxabXhrdGl0KzhIOXZVWWJ4emJFQjcwV2Vvdm10YkpFMHl0?=
 =?utf-8?B?ckxVM1RENmh1RzdlTnRrRzVFZEYwKzI4eEI3Z2tPOWZtQjBpL0RBZ3pqNVIv?=
 =?utf-8?B?ZFN5WGd5NDlPZWJKbVQ2SWdIaUlKbGZoUGhjbnloZmZNaUl0T1YvcERYWGJO?=
 =?utf-8?B?amZ4ejNyd2doRUVKWDNCdlZJQ0F6VjZPZU13OWhocEMrREozOE5WaU02NGpR?=
 =?utf-8?B?bGtXUzlPS2x4SSs4T1UwQ0svQWlmMlgwRGYyZGVzVWx3NmEvNGVKcloveGFE?=
 =?utf-8?B?bFN1alJ4ajQzb1JMZTBkeE0xeWlSOHpJY1NBODRPSWp2N1BHbzRWL0pQbC8y?=
 =?utf-8?B?Rm1JN3YxVGEyY3FFNURRVllJdmJWTmY0eisrUTR5OS9YS0IwbnhGU1k5Z1JK?=
 =?utf-8?B?MkF1VDJUVFduSDBpUzNZNVpNdVFUVUc0eXlMOXFSako2RklISFZ1UC9YNFJX?=
 =?utf-8?B?aC85Y2t1ejc4SEhqWUtnOXJlcUtMYnI4WGhXdDVLY0krY0IxbVRlWVFhclFu?=
 =?utf-8?B?ZWRhcG1QT09YTUo0MGk3S3ZjR1VLeDduWnhraEtMeXNGUVg0ME9iOXo4OVhX?=
 =?utf-8?B?MmhSVFlEY05oZ0M4Qmk5SzJIdk5RSHpRcjUzeGpLcjJOYUszVWZiVldXTnhY?=
 =?utf-8?B?OGFvTW1nbmRydndXOGo4QXVuRHEwWnJoVVRUaDAwaElIM29iN3ZGOC8rMmkz?=
 =?utf-8?B?RUpaWFdvSlAyZUNpaDJ3ZDRxeUl6RnFnSXIyL0xRb3B2OGlXcDlPcldBZHJT?=
 =?utf-8?B?WDloR0VvTzdIOVpBTzFrTytzcUd2TVZKdHMvQXNObFgwQm43cGFyRnhJU3F1?=
 =?utf-8?B?Y2tWa1doeXVQbGtwZGtES3RtcG5tZ3Z6cWZaaG1pUFJEZ3ZUc011bDhoZURV?=
 =?utf-8?B?cm5Xb3lLRHFyc25Ua1VGcjNPTHlybmZzR0pDSUE2UUNEOVpjSzljbjhFcVhX?=
 =?utf-8?B?SDRBOEpPTzMzb2RrZ2NxK0U5ZlRMVFhsOEpMV1I5OTZCeHhQdGordE5PZkJ0?=
 =?utf-8?B?N3dWUmp1aDU1QU1uMHZSb1JrT0dlUXFUQVdBc01Va04wR2xrMTFTMVhZRzdJ?=
 =?utf-8?B?YThwMUNPOHFCMUp0Yzg5amtMN0w5em02UDB6NUpReEVxekhvK2tUbWFBM0FX?=
 =?utf-8?B?QjNyZ2MyTC9RZ0o5eER3bGFRM0h5a2QydENIYTdYYVBmWUlNajVuZGdwa1lG?=
 =?utf-8?B?cFo4YkdrcnVRcEplV3A5Q0lYWGd3NUxWdThwbFU0NXFibkxjVXMvcGlDNlRU?=
 =?utf-8?B?VllvZ215RTNteGE1Q1BKdXVXd2UvOWp1RE12NG5ZbklVeVRhaTJiamFjZlUv?=
 =?utf-8?B?bURKKzJqSnVHTVA1dWhIRVNCcTlDZXdsaWkzUFV5S1FuaytXNDF0YmQ4d0dD?=
 =?utf-8?B?UC9ENW9HbVpCTFIxTDFTNHFnTi9QN1o5V3k1aWYwZ1prWlZoNXE1ZUo4NWxR?=
 =?utf-8?B?ekczWEw1bW9hbEw0VENjNzJoa2hDb1hXK0tEMXZYc2IrcS9OUGhuK0FNZER6?=
 =?utf-8?B?Y2xWY1ZERi9Hb3Q5R1FkZXh3NjI5NjdaU2FuYTV5cWhpRGZ1ZDNDSUNpSVVt?=
 =?utf-8?B?VGZPUnA0M2QyTWZST1VOSDhQNnVEUCtGanJ1enpuNVlwdGZDRnliUWl4bU90?=
 =?utf-8?B?NkhjTXR6eWdFdytsMW1nRUw1WW1MNnRZdXM0VGwvazI2WWpXaEJIWUpzYm52?=
 =?utf-8?B?WElRVU14dEYvSHpTUUNUOEhzc3BMdlhtQ0pGTWpwc3VzakErSEhreXhZcWRD?=
 =?utf-8?B?R09FUW1zTnZIVU9QOWZGTkp3MC8vak9pd3ZiTjd3VjJ2cVMyS0Y2TDcrTGtQ?=
 =?utf-8?B?dDhyZ092V0lpTGl0UTk2TytHUkx3c1d3VWFXenQ0N29BczV2amdWVklCWmRt?=
 =?utf-8?B?ZkMzNFBxcHIydWFRRDY1UjhOMUFFblNuNm9vamlYd3R4QXE2NS9ZM2EzT3Ex?=
 =?utf-8?Q?qpbqhX/exgRjVBVx41OXR1ZlFSseQKFq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 04:21:40.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 259565d2-58fc-4f56-9726-08dd23d27711
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399

Hello Shrikanth,

Thank you for reviewing the series.

On 12/21/2024 12:29 AM, Shrikanth Hegde wrote:
> 
> 
> On 12/20/24 12:02, Swapnil Sapkal wrote:
>> /proc/schedstat file shows cpu and sched domain level scheduler
>> statistics. It does not show domain name instead shows domain level.
>> It will be very useful for tools like `perf sched stats`[1] to
>> aggragate domain level stats if domain names are shown in /proc/ 
>> schedstat.
>> But sched domain name is guarded by CONFIG_SCHED_DEBUG. As per the
>> discussion[2], move sched domain name out of CONFIG_SCHED_DEBUG.
>>
>> [1] https://lore.kernel.org/lkml/20241122084452.1064968-1- 
>> swapnil.sapkal@amd.com/
>> [2] https://lore.kernel.org/lkml/ 
>> fcefeb4d-3acb-462d-9c9b-3df8d927e522@amd.com/
>>
>> Suggested-by: Gautham R. Shenoy <gautham.shenoy@amd.com>
>> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
> 
> Similarly i think patch 4 and 5 can be merged into one. and similar 
> comment about updating the stats doc file.
> 

I will merge patch 4 and 5 into one.

>> ---
>>   include/linux/sched/topology.h | 8 --------
>>   kernel/sched/topology.c        | 4 ----
>>   2 files changed, 12 deletions(-)
>>
>> diff --git a/include/linux/sched/topology.h b/include/linux/sched/ 
>> topology.h
>> index 76a662e1ec24..7f3dbafe1817 100644
>> --- a/include/linux/sched/topology.h
>> +++ b/include/linux/sched/topology.h
>> @@ -143,9 +143,7 @@ struct sched_domain {
>>       unsigned int ttwu_move_affine;
>>       unsigned int ttwu_move_balance;
>>   #endif
>> -#ifdef CONFIG_SCHED_DEBUG
>>       char *name;
>> -#endif
>>       union {
>>           void *private;        /* used during construction */
>>           struct rcu_head rcu;    /* used during destruction */
>> @@ -201,18 +199,12 @@ struct sched_domain_topology_level {
>>       int            flags;
>>       int            numa_level;
>>       struct sd_data      data;
>> -#ifdef CONFIG_SCHED_DEBUG
>>       char                *name;
>> -#endif
>>   };
>>   extern void __init set_sched_topology(struct 
>> sched_domain_topology_level *tl);
>> -#ifdef CONFIG_SCHED_DEBUG
>>   # define SD_INIT_NAME(type)        .name = #type
>> -#else
>> -# define SD_INIT_NAME(type)
>> -#endif
>>   #else /* CONFIG_SMP */
>> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
>> index 9c405f0e7b26..da33ec9e94ab 100644
>> --- a/kernel/sched/topology.c
>> +++ b/kernel/sched/topology.c
>> @@ -1635,9 +1635,7 @@ sd_init(struct sched_domain_topology_level *tl,
>>           .max_newidle_lb_cost    = 0,
>>           .last_decay_max_lb_cost    = jiffies,
>>           .child            = child,
>> -#ifdef CONFIG_SCHED_DEBUG
>>           .name            = tl->name,
>> -#endif
>>       };
>>       sd_span = sched_domain_span(sd);
>> @@ -2338,10 +2336,8 @@ static struct sched_domain 
>> *build_sched_domain(struct sched_domain_topology_leve
>>           if (!cpumask_subset(sched_domain_span(child),
>>                       sched_domain_span(sd))) {
>>               pr_err("BUG: arch topology borken\n");
>> -#ifdef CONFIG_SCHED_DEBUG
>>               pr_err("     the %s domain not a subset of the %s 
>> domain\n",
>>                       child->name, sd->name);
>> -#endif
>>               /* Fixup, ensure @sd has at least @child CPUs. */
>>               cpumask_or(sched_domain_span(sd),
>>                      sched_domain_span(sd),
> 
--
Thanks and Regards,
Swapnil
