Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3AD46F4B8;
	Tue, 28 Jul 2026 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271406; cv=fail; b=oMYTA04ULjq9ZGoV/AuH0QVLqe2d54cLGl/tRZUOz5O3RPC9nMqkBquVKnT/s0gEXYP3KYItyKQSs0US4jV2m3Z3gRJgOz4FLjE1mFCZK3KSChRz93VJJjjqyy/JlPnU7cAlbK0FJ6NZ41+cEhK7HUotW9iVSsxAkXj/qVIE5RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271406; c=relaxed/simple;
	bh=B4nYH6Gy7w9QLKKoKl/p7D8kcXK4DsCNJkAuap1rtJI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oBzFVbC8c3/TATWf6BkVzmz+5LCtCAM+tOg9eDO7wisJTlVrdmc6EReF9XfSTnbZBQaalL5rslvx1YfwDSO4wK5eQ+JN0j9ey5z9VovpB0/IWvhSOegcEKkkzLtSAv26L2Vjj52Lot1s0ctQxO4SrWGUtdiCAUO+Xr1veSLCyYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QIOYdnnM; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QIOYdnnM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drQHkTQqnEm//1+M6V88mAJyhkNUD+FXYCxJybHLYX9DvXxBT7T4rvgdr1JdSkvJRG+TNfCIXKrQNnUsETqWpJH6ZMybImbM/xcafFa+IUthNQuLdK3mW0Y8m3YBSDZYJoIXg1sHl6UaK7KDx6ZL5l0zqNE+wcIS+V+y/Pqi4hsBd/fT37udCFouo5Qsjj80yLcvJUOIEwpgoAyz3pgfzHtT93xXwNOPrFnV05FxXKd93xJVSSlR4sIQ9azQoTN6q+9lQ5dUydrn6KDH3InOZmVSoa7buPiBRgNLwxvxMBEmfoqquDeFjb5iQOlEXHRZ0/vDSIhXOYi/YTiohHfgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6/KoB9aASFNtGHiyVQYvxbfnpzaXpSfRCJED1o+kio=;
 b=IF067zlFpECJ/2P8DHb9TqiSxTTIeFSuM7r60RUd9tTksQPLF3wZZulwSlG9g+bnPxKzeoffQVSsCTIjZAXz5Vk7lZ2WKOWsU7Agj7+OJ+It0KeSKtQ9TDLqc1/iL6RYuQ24NLAue1wc5kDCJ+CoqQcVZkE5ipAP371HPj7A0iZH3RXb7MoVDQ+SmsngSfbNxWLQKtXD7Z7izOojthOcFqiUJ1nCqQOumAIwixXiCxGqSAB/3Eg52vlTTlXz0KfsQGplvjYFG+UKGO7XXeYF3pm1GmDyVUpZXnoKb83HObddOyYLjX+isXrfsFS2O0FzwpO0e2PMd8EOoxHm4Sa+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6/KoB9aASFNtGHiyVQYvxbfnpzaXpSfRCJED1o+kio=;
 b=QIOYdnnM35WZBKjEmzGe6iTo4+pwut2F+VYDuDf8dQxDjcEephTZS8UvgowDIbWxC0o0zXKsApV2uSbQA39IpsX4gD7lm8H/dcjN8VIk8DnXL2hELGVSbXEXnU/kibQMUpXyTok7seCjkTvCpB+V30tuMYWy2FR9I+H6ST7p460=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA1PR12MB6306.namprd12.prod.outlook.com (2603:10b6:208:3e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 20:43:22 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:43:22 +0000
Message-ID: <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
Date: Tue, 28 Jul 2026 15:43:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep
 mbm_assign_mode "default" on boot
To: "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "Dave.Martin@arm.com"
 <Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::29) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA1PR12MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 1014e9ba-4ee9-4655-622e-08deece8dd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T8nTSOHhrdF8DBYFyT5RiOeXNV7a3juYrQHESE88fX3gnQztdVTU4t7msfZhMEyaeWeZIdarthz90qOxnx+Izy4b1+o2Tq7pBPe9EniH2ib8TN/ajFUXzA3JdXQE5TQ/T7Sv9xkY6OPOgADFiQ18Z54XjwYPyx96FaD/t32AE1Iot7gC9fhxehk9+wBDhOdZ8BweldM59F9DiNUMWy9soAHcCsVRsXBEvVSyMb1qFQsDvRZkqTh1SInedo6V9H2sY9CQSnf4qWh/aeK6+FrCPTgOpVXs2ZCTBhYh2xtxuvI4DNSGJDBChCLizibsorfCOvWTuBTsVL1Dvfqnmm8CJWU/GhMV39XSLEDxwJjIGhH9XnaGkO94s+ZXltJZjGj207gd3s04dWeV4a904Gdg5ST+ztaFNs10ap+3iOgK5oS+Rc5S5CR7FhiDJ7pVq7JhzAi3UOZzE7ZEI2CU105mJcthl2EC6P0kDjO2t2R+0bBZCAvODphAW7dQ9hmzwW1Wlsx09CzGfYIqtlsIEjUMRBQn+lNBg7T+5JZKc2EXuC+dmB4rN5pf2mPoSQouELv5lYduJgHdPnPqg7a0+2qu8bJNUhRqaN3Iu6c0+5363qTcHF6J//i2/dUudp2ActCwItyY0QRq6QKA34JwUEt2R+lQoW6wOiZSzpZVUqriLu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akJZL0E2TmdTRE41T0hsT0NKNnl0TUc1SXZQUkZPVTVYaHJSdHk5Mk9CUURC?=
 =?utf-8?B?bFIvOXZ5R2lhTyt1SlFMRklIM2MyYlFMbDNIQlFkd29PSzlEdTZsL2VEZXpN?=
 =?utf-8?B?dXVGWkRmOE5Md3Q1QzZSNzloemw1a2JZbVdRODZIbVBCZHRiSEJRWElwcUg2?=
 =?utf-8?B?VDlmTEVuMEpRd2hQU1F3NVZnWXZFV2hxTEdWVVljWm9yU1piWThkRlZ3cnBH?=
 =?utf-8?B?WGxBeDRRN2NGMWpwNjNNRCtQTkU2dStSdzJ1T0RpalVQOFM2TEh2b2g1TFNO?=
 =?utf-8?B?MGppeXVnUzZ1L0RsRG83bnBuUlVYY1VpUUVvTzFnZExUWnFEais2QTdWemZB?=
 =?utf-8?B?eFo3ODAxSzR1ZG5xaUdGckNlNWdFY3p1R1VKSXRUOUdlV2hRaE00QkFnM093?=
 =?utf-8?B?aVZaZmRFaklVWlNxTm1CZ0pwcUVubW4xWXRuYW15Y2lSak9CejdyWXk1Mnph?=
 =?utf-8?B?WFA5MzhCM2RtRjhNMzJyM1NhQ3ZWNlo0OGg2S204YlRZc04yOHovV3dQcXdq?=
 =?utf-8?B?VGNieXN1MGEyU1R4My9jbE50MCtkbkNmd0pxOW1oMnp3ZHZpZjEzRzYzUWIy?=
 =?utf-8?B?NzBhL1B0dkpRZWxtTElUWTBnbkJiRHBTa0YzV0RBd2F6aVhaQ0daUFNrTERL?=
 =?utf-8?B?Qm9waXhXNGxDaTNqUXBOcFFUdVFneHVWdlFBWGtOM0kwTjFpWWZZWmZNNnkx?=
 =?utf-8?B?cEVHd1NWa0FHQVMwZlM4dEVnVC95Y056K2pLYm9CSjJEZzNLaWxzcU1TNGJY?=
 =?utf-8?B?ZWkwaGNZdGlxWC8vckJSZ0JHZWVkUFZiV3J0RHAvNlk5UXNFTmFCL2NlNFFk?=
 =?utf-8?B?THhrL0hqTXhjQmYxWTl4YzdaU3NTSFF5RHIzcVVoQ0NWaWRwMmdpa25zYmJ0?=
 =?utf-8?B?VGgzMWdBalRlUkt6OXcyL05RNWdGYjhVdkV5d1JBWUlzdzhkY1FjRzJBMVJQ?=
 =?utf-8?B?STRxeENDd2RxRjBIaW5ud2QzYmVEQVBIbmRhWEFpM04vWkcxcTZHVU90VHYr?=
 =?utf-8?B?QnRzS1VQRDBhdVpEampKMGxES2E4Z1dJVG13a3B5NW1BaFA4WDVrMkw2OXN2?=
 =?utf-8?B?TUt2U1JTL0E3c3BQUWN4Smd4VjJqOXFOUlN6THFsYlpYV05lTWRHVlBiMTV3?=
 =?utf-8?B?cHZ4RjBJRVRBZG9mUjgyNWJwRWVRV0RUZXo4azlPRUZhOTdSeVJYUWhBMERu?=
 =?utf-8?B?eHhsK2JHdU1xQ05lM25GcERvakZHZ1NXSVRpcDdaNms1eTN1d0NFVm5mUkx4?=
 =?utf-8?B?Z2pKdHJ3bXEzcFB1TXQ2dDdpUXBhSHFPckh0akRwZVZGRmh0cnhZZUhIQkxV?=
 =?utf-8?B?bGFrYlF2MitiQ0dOVE1PVjNxejZyeGhwL1FiNFVPS05pOHFiemx3TUYzWG5p?=
 =?utf-8?B?clN5U0ZQNmcwN3M0T1lNSXl5dHhwMGtZa1Y3cW1WTzhKSEFhWGdvQU9mQVU4?=
 =?utf-8?B?R20wOFRHTEg1MkRTUGwxaEwzRU5RM29UVnU5UWoyakptUmJ4RHN1aU9iTmw3?=
 =?utf-8?B?UzdaKzcrMjFkWDh2anVaMjU4ajhueCtDcHU4dUNIb1hJTHdXOG1DOU1wQk5P?=
 =?utf-8?B?OWVhUEtmaXRjN1crMkVDVjcvanBYdUtzeFJGemZOUUFTdzNtbHJaamo1SzYy?=
 =?utf-8?B?Yzg0MERIVmRYcktkZUxhRFo0Mnl3KzRQanJqL3ozcEU4YjhadkMyQWpCREI1?=
 =?utf-8?B?ckRDeGlrN3F3d2dBMGRWL2hYMUt0T2EwcTByMjRSTTF5c0w4bFI3cm1XQ1dx?=
 =?utf-8?B?Rk9MbGF5MnZSN2piS090VjVka1ROOVZKUXNQQlNIL3FMSHplRm9MTnNpTDFv?=
 =?utf-8?B?ZkpyY1BXSDBVQm0wRXdWUEE0UTRhT3psa1VjZnJvakJvai92TUhEcE1pSFdl?=
 =?utf-8?B?V2dCWmNXUFoycjM5Qk9EQTYrZlJ6ajhrYURjMmUvVlhsVzJuZDRNQXp3VlBz?=
 =?utf-8?B?MHI2UTdSb3AwMzF2SlRHSUgwY1VHRldnSUtlOFl0L3BvdjNCN2xZeGl5VE5q?=
 =?utf-8?B?cmhycUtsUzB0ZCt4L3dUdUFOeno0Mm9GMG9VUThtYUJUMU5LdnRhb091L3hU?=
 =?utf-8?B?V3FvTkVNNHNNaWx1OGZKa0x5eCt2YzRzcEJ1UTUzbXg1Sk1ZdUtCV0ZyU1dC?=
 =?utf-8?B?WFZUZjIrNWg3clE5Qzh1cE81UkJIL1NPbkdnakx5b1lJTi8rM295QnJURmg0?=
 =?utf-8?B?QldWcXRwaEd6ZkIxeFpqVS8wd0w1KzVlYVU5UlNXeHBQYWpLemZwMmZpWFMw?=
 =?utf-8?B?V2I3TDJub1hvNGEwRU9ZRTl5RWFPQStxZGRQM3JTR0dqZmhpRG9wS0t2RW1h?=
 =?utf-8?Q?G2I7J3DuXCZCsQydiO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1014e9ba-4ee9-4655-622e-08deece8dd0d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:43:21.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SuVOeqpTQl0DUD55+/3ExRWbynVxfsmvzzl6IGKT712wDXXY7yKZ2iiJ1EYixtK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6306

Hi Tony,

On 7/28/26 15:24, Luck, Tony wrote:
>>> 1) Does it start over from zero?
>>>      Seems a sane option.
>>> 2) Or does the monitor group see whatever the counter was at
>>> when being used by some other group?
>>>      Seems less sane.
>>
>> As per this code, it should start over from 0.
>>
>>    } else if (ret == -EINVAL) {
>>                   am = get_arch_mbm_state(hw_dom, rmid, eventid);
>>                   if (am)
>>                           am->prev_msr = 0;
>>           }
> 
> Nope. If you want the value reported to the user to start over from zero,
> then prev_msr should be set to the current value of the counter. That
> would make the next read start from zero.
> 
When an RMID is reallocated, the hardware detects the state transition 
and the first read returns "Unavailable". At that point, the counter is 
reset and begins counting again from 0. This is the expected behavior on 
AMD systems. Therefore, setting prev_msr to 0 is the correct behavior.

Thanks
Babu
