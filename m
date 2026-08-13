Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013009.outbound.protection.outlook.com [40.93.196.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F53043DB;
	Thu, 13 Aug 2026 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786641170; cv=fail; b=h/2f1INSPo+IBzAk8G0FGFNErT8wqlpBamsft1ZJy3236lPBRCOp5Gc6wY/FTAl4bK+4TEvEJH9OpZQ/qZxPzLWJm2NMGvf5nEvdlzfn/dhAspVMUa9K4j6pJ6lckc/QogO1CfLxRim2FfGYFRebPV8g4UHlYuPyUakyOzIKbX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786641170; c=relaxed/simple;
	bh=qzpR+3PCvvnd0sHHn8CzaOCSAq/fPCHfEy4p0kn8jTg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rxwwyk1dCtI18KG3dJB2Rx2Bq6vAC8TfoCLfu/HHw/SApExvrA5AE1r6F47w15Oj2g59xdHEBydUD5b0Iha5zD2SNP+8J4xb5wwgZy6qMdu2J7PvBHu1LkTHeoCsSvmeRyE9JbxrkgkW68Dba30feJHYDxsJs7Gkt8hXIV5jlvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HV4NS9CF; arc=fail smtp.client-ip=40.93.196.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HV4NS9CF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u57KxBDGTGo6Ni9pOCXHs5KXIrZsvmMPyV+9NJJhTwV6vfTDm8r3PDyi/NDZCVmYxSPAlgwiU0vh/CVnOfSsPoKOMaz8lQofY79at8Bd/UY9oFCNInxe3GapERWFFCwGB7hQjb2slJQZIrGvTuY6sz0yFCyR9Qs76aoh1UeZ7YQVF1/LYyuj6GLVAZYfXeaBfVHrQyc5kIYmG7gBt3sDfYmKJlveIVZf3ISJ5V3GqbknjC9LnxlQKl8vhpPxRc7LAc10ttOvPs617PX1qSBL1KW1caw5KGqiRPjxOSeRJxL84RvN9BRxxwRcKZ55CJAQqqLSbtRhLxOjFYqbV+oqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfrMihla/Mc8EjDkZY0cbA/ncQjCLRe3Z+OArytAh2A=;
 b=N87WYq4QfGf2pa+pvO9sTR165eOqVG9CrexByEQHclHkt21+E1tq362zmrZcC6oSpK+l0ctKUwbz+oyC2PsjDHBmiUAVXtRejofhS1DIHNAE2DmGggzGdLR/cKEYlOjfXpdOMof1IOwsbyiOy7HNio4qC7ZcbpZYB6SRrO9AiVj06rIQrt4L0Owcn9YyZU3BBhj7y3mzbQej1nnwjd0jmz5BIthFFz/dsIx7xXVLXNtTmb4w4DUlTDBNU6sml1mNB5dcingsWod4u6tH61Fh8Pjv8AWd3Oa5zoAyqhRum8XiXpNsTNWYSk1jdfkVQ8WK/J+VJJ6e92q8FsxmMk8Tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfrMihla/Mc8EjDkZY0cbA/ncQjCLRe3Z+OArytAh2A=;
 b=HV4NS9CFu+4eKqsz2P7r0jqBFsHbEna+BV20A128l7cJfXVBRSImIF7fbruVNIqholKiyzH5x2uimvD5TNDTaPsix9Wv8fbGRJEAHQTEcX2EVgw3o6At/SyRlX4O9Q+D0RtYQOnEGiHeGGiDpKV3f28a3wv3Jsl/i4LllRbqVlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by LV8PR12MB9714.namprd12.prod.outlook.com (2603:10b6:408:2a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 17:12:42 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 17:12:42 +0000
Message-ID: <fdc8b919-bd3a-4794-bb3c-06ba3882e02f@amd.com>
Date: Thu, 13 Aug 2026 12:12:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com,
 fenghuay@nvidia.com
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
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
 <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
 <5fad6e01-1052-4c1f-82f5-02c650ae1ffe@amd.com>
 <e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com>
 <9a53023a-9d6f-434f-96d3-188a176a6cc2@amd.com>
 <0c4e5b4e-4846-45fb-bba9-ae4127393f0a@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <0c4e5b4e-4846-45fb-bba9-ae4127393f0a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::22) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|LV8PR12MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b33bc0d-a1c4-46bc-4cfa-08def95e15c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|4143699003|10067099003|56012099006|921020|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ld5kS+V1mzYFiK3ktminaujOja9Pe+anFKnoB4+4TuvOvS1IUupBg1LmEA7rYhcS34LozVXZKvOwgRkM7iurYNYsfyawr0JBmX5VSa9D7VuaPPugPbT4mpU7C9rVd+lD9rA4gl2x14pKRNXTzr9BKtE3+sXaai/rm/DjN9qiXzkPeWG1ZnjdDbc3PAffB81gX2C7GwGgHq1eLHtgplltF6AXfz910XxXF6zRCzijUOCHQNCRu4OB7y30KBpADYH3uShxCpYmb4VQA8tgCgnIbNekxEElXx7ThUAaF7eM1UXZipKaYT8cMpaL1zn5BnkDh6rBYR7IP4u3PIf0/z8i7t7vpoUM+AGzDDCjmwpknCtaNrhUEuArjU2zTX2JRRKuOzDPsuuSXOdychuhlOgXWemYMqr0Y/gxU4/9akBQo+a3rSbVzDINlPbC2nKdWdke+1w2anJUhdCHMS5Bw+2MWgBds6ddZNhNkOdWgu5dJY708mUXyr1FMRsIV1sm8X8BRN5nJe1xTnWj59eFFAPpEqWN4AS+1ZzkK6cm6cS5wxhn5wDwGQbeFLUGmxz+XmuS6OzNjTdD5aNXxfWZPAzF4wy+FroGSDrmDuZm+x6Pa+fqfzqKrwr/rQl+Dx7usT1/2QRiVZdkYuX1EDgXEv7sMgtSCGCZPk+WdfRU6RreTVNgujiG/jkdbMMV60QllU74+j7WgBvOqR+B9ro7Cd0bLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(4143699003)(10067099003)(56012099006)(921020)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXNjR2RHaW15cU90UHBXVjdtWXpJQ0k2bHQ0Q2Y0RkllRzRhMWliQ0R4K2Zr?=
 =?utf-8?B?VzY3Um04SnJTM0VEY08zaFFRbUNkaEUxSE5jT1VZcXpnK09aM2tKeGFZYUpI?=
 =?utf-8?B?SGp3OEN5NlpvUTRjNHphLzhBTWdLWXYrL1BCNVZBVndlMG85akpYb0pLOFg0?=
 =?utf-8?B?WStobkRpcFhoeW9LYmswdDFWMk5CeHRFUXFveld2dVZlSW1YR3kxTlpuZzlY?=
 =?utf-8?B?eG9YMmd4bzZBUUVVM0dTb0dsdXZjOVRBOUY3Q1FGY0dCbHBobXh6MkdGRjVx?=
 =?utf-8?B?akZZaHBVb1BrWE9EQnVNN3h3blJzTUgralBWZGZadDVYS251ZFpldGNLakdX?=
 =?utf-8?B?cFJKWWljMEwyQndpWm9aREFzcVRIdEhEbkxZcFJhNWs3L2VqL2ZKYURUcGlN?=
 =?utf-8?B?N2g2Q3pZUjlaZ09ZRWMweWNEV091cS9tNDRXUXJwb0hyczU5T3dpbitnT1oy?=
 =?utf-8?B?b05jUjd4bkxGYnFOMjYrM3JsYW5KS1JVa0ttbW11L3FVcWFXai9MbkY3QlE1?=
 =?utf-8?B?OXdPa1R3bTRoNG8wcGtrRkZaWml2Zk9MaXJtWHVqVDNmMC85a0xzdmowZ0FY?=
 =?utf-8?B?S3RsbXBpenI5TGM1UFBSZ2tPYkdCUG9YT0tHWDlFZWFjS2NacXRzcG92aG5s?=
 =?utf-8?B?ZitmenVKaDZYaTBHaFltWmdNRjRVUnlPYU1Ga0wzNFZEd1pnOEltK3BPT29Y?=
 =?utf-8?B?VWMrUWNkNFBOeVJ6cU1GNFBNSWltUHRDb1BtMjJmMCtheDBmemZwV0hSNWV6?=
 =?utf-8?B?VHpXREZEZ1h5MkVsVE9kSjNQc1RwMnZENVdONmh6TWdTTEpjMUhWeW1jUFEv?=
 =?utf-8?B?RldSK1JLUWJyYVhEb3hZc2d6MkRlZytybW5aYTVnVUJuL2puVXNvS21TMkhZ?=
 =?utf-8?B?ZVJZL1lsaVhGSi9mWFNPV00zS1QwRU9qcEpVcHJDUFJxdkJWQ1ppcUVwMWpW?=
 =?utf-8?B?SGJBUFBmdkNxdEI2SVF6dFFrZVlDNmVjWDhmLzZXbDlzNVk5eGs4NUN4MWxz?=
 =?utf-8?B?U2NqN2dDVk5FbXdSNWo0SzJSM0tMM1RCSElRL1VETU1VWG01OTlSUW5NbTkv?=
 =?utf-8?B?RlN1OGZWUnZ6dytHUnRib2pYamFLTTVhRGpnRDMxdS9wZVhUSlhrN2dxRzIv?=
 =?utf-8?B?WjNOaityVW9OdzRMeUNVeXczS3BSb2dYRjd6SG0rczFsOWExVCtyRnVOQWV0?=
 =?utf-8?B?Yk1pNk5EUVRzd0YzN0JLazF3UEhzdWRDTm14clg0bGxpcVR1NFRPYWlPKzhF?=
 =?utf-8?B?U3pOWldDejZBc0E2ZHhkekt2YnpCQ21zTWJPV3ltSkU3QXhoWXhOZ3RuWjRS?=
 =?utf-8?B?bUJ4U1A5RVNLbmtsek1FM0loTTYwWVpVLzR2cVFpVUNTZUFudS90bUNQVzRp?=
 =?utf-8?B?YWI3S0FOK0x1RVFoWURpUTUvVlpVeG43Q2RiTi9pQVdVc1BFcEdPVkxsTjQ4?=
 =?utf-8?B?MldZaUhySWpPWGJnQjBubFdwUkxRRnlXc2pLZmQ3bm5OWmRHVUdoci8vRGYy?=
 =?utf-8?B?aERUSGVvc0dNNVJyZjJvcVREQmRVZk9STWd2S3UvU0lTTmV6bysvL2JydE5Z?=
 =?utf-8?B?empnZ3UwaFBWcTUxRFE3ck9NSnI1dUprQnJ3TWQzYjJQNjdoSFMvN3pONjRE?=
 =?utf-8?B?UlJWVWd2ZFE5QmpvQmVQT3hQUkIwNTJqSWlyMmVPZGZWbWNwdk5idmtTQjRO?=
 =?utf-8?B?WEFRbEtBM1hZTmJ2bWlEMU40Q3ZyVHh5aGxlT3J4Qjk3akwwRXh4MEREaGky?=
 =?utf-8?B?eWFhVDhHUmNNYW5ZMEJlZkVXL0k3Qi9MaWpZL3A1NGdiUnpLd0szaUdsSWFT?=
 =?utf-8?B?cVowQ1JPRlhCaWlMOXJ0RldrQVQ5NHphYzFlSzNEZGhkd1J6SFZNbmRBa281?=
 =?utf-8?B?dUl3SDNwMGRyWWt2aGxRMnhOTmhvRndtV2VrMkN2Vm5kQjZwa09NSlBNTHZi?=
 =?utf-8?B?MXZQcEVyMDJZdjROT0xQUXcxU1VEeE1lcDloUVNaaGg5bjBkYzRjTXA2bTVQ?=
 =?utf-8?B?QjF0S0ZnL2Rlb0Y1dXpCM2hsWkgzTlFmcEFsVS9iWDkxRUJJWi9xVGRScGZC?=
 =?utf-8?B?VWJTb2o2bkUrMWJoR0RaemsrbHdWU1BibW1KUzJBeFhJMGpPQ0RLbnNrUXg2?=
 =?utf-8?B?ZmtLNWVQb29DRGlic09hYmhDeFBzM0lKdXE1YUM4MTdiK1Rndkc4MFhYM09s?=
 =?utf-8?B?Q2lGa3B5VlNUMHR1R0tNNktaTlZiZjAxeTJVemdwOG1YKyszSEwyZitzcmVQ?=
 =?utf-8?B?cVZXbDdBKzNPb1BLUVBKQmdBclMrZWRHTFlkRHE4cEo3U3VYd0VCaW5hdGVm?=
 =?utf-8?Q?HNPm9PIoqXSlWy1snI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b33bc0d-a1c4-46bc-4cfa-08def95e15c9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:12:42.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQmogdY5fRQB6et+GYNUM47iYvVc6JcfhjAITIEA+hyXvnTIyCz+F3FHFw7OMoDz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9714

Hi Reinette,

On 8/13/26 10:55, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/13/26 8:17 AM, Babu Moger wrote:
>> On 8/12/26 18:28, Reinette Chatre wrote:
> 
>>> Please always keep in mind all the requirements and use cases we learned about
>>> during and after RFC v1 of this work.
>>>
>>> For example, we already know that "per group" assignment is something resctrl
>>> needs to be ready for. Consider the example in
>>> https://lore.kernel.org/lkml/aYyxAPdTFejzsE42@e134344.arm.com/
>>>
>>> There may even be "per task" assignment in the future.
>>
>> Yes. That is correct.
>>
>>>
>>> Constraining this feature to PLZA will make it harder to enable the capabilities
>>> that we know resctrl need to support in the future.
>>>
>>> This is how we originally landed on the "global" assignment distinction
>>> (https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/)
>>> "global assignment" should be kept or replaced with a solution that continues to
>>> prepare resctrl for these other capabilities.
>>
>> Yes. Makes sense.
>>
>>>
>>> I am not able to see how resctrl could support "per group" assignment with the
>>> interface you propose above. If I am missing this, please highlight the solution.
>>>
>>> resctrl may need to explicitly split kernel mode from kernel mode properties. For
>>> example, below shows an "assign_global_enable_per_cpu" as the kernel mode, now with three
>>> properties:
>>> - "ctrl" - could be "assign" or "inherit"
>>> - "mon" - could be "assign" or "inherit"
>>> - "group" - required if "ctrl" or "mon" is set to "assign"
>>
>> ok.
>>
>>
>>>
>>>      # cat info/kernel_mode
>>>      [inherit]
>>>      assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=uninitialized
>>
>> Shouldn't this be like below when default is inherit?
>>
>> # cat info/kernel_mode
>> [inherit]
>> assign_global_enable_per_cpu
>>
> 
> I think it will be useful to let the interface:
>   (a) show to user space which properties are available for each supported mode, and
>   (b) show user space what the default value of those properties will be if they
>       are not set when the associated mode is enabled.

The "inherit" is the default property if it is not explicitly set. Right?

# cat info/kernel_mode
[inherit]
assign_global_enable_per_cpu:ctrl=inherit;mon=inherit;group=uninitialized


If the intention is to display all supported values for each property, 
then we should do so consistently for all properties. For example:

# cat info/kernel_mode
[inherit]
assign_global_enable_per_cpu:ctrl=inherit,assign;mon=inherit,assign;group=uninitialized


> 
> To (b), since the default resource group is used as default when the group
> is not provided it may be better to use "//" (or just "/", depending on system
> supporting just one of allocation or monitoring) instead of "uninitialized".
> 

To me, showing the default group would be confusing. It could give the 
impression that only the default group is associated with the [inherit] 
mode, even when multiple resource groups exist.


>>
>> When the default changes to assign_global_enable_per_cpu:
>>
>> # cat info/kernel_mode
>> inherit [assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl_mon1//]
>>
>> Display the second mode with properties only when group is associated with it?
> 
> Please consider this from user space side. The user needs to enable the mode.
> How will the user know which properties are available and what the defaults are?

To me, this may not be necessary. This interface is primarily intended 
for administrators, who are expected to understand the feature and its 
configuration. The documentation already covers the available modes and 
their behavior.

Thanks
Babu
