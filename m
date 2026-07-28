Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010059.outbound.protection.outlook.com [40.93.198.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BF1F3B85;
	Tue, 28 Jul 2026 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268004; cv=fail; b=rWhCFkm0t8TSXTAsHEbVry0ht61S2YMOvUIbkS0u3QBhXphZuv9Dje4jCkYh7gcEFsJ5atGAGbHyhe9jWKE6fAng0HkOPmnv6YqUj1ubbQaanWEl0U8Y+r0IhYWpmyd+YgxigwBfKGQpO27cWmbCnE7tTElkRVCGkacMwXQjzi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268004; c=relaxed/simple;
	bh=9rZwNGgaXzLHLkvBYNFaymGxpUsldW2dyZ/pycyyeYY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GtRWj7P1WMTIgSJHtr7r6KMwXNPyXVaV6piiotbiHUIye9ogcMDmcXqaqAAcMBdj1YGGsHjvbO2G8dOC2/kgMe/Y6tZa15/XPXtYWBnOryZmM7ehARy7GahZVIguwLinGCiaKhcHXFdd/4v/gwiMeVC13vb0Byf+s8PJ5MjG5HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GjFNhMyE; arc=fail smtp.client-ip=40.93.198.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GjFNhMyE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAIEwIN3LyYA7/p7SQzbD7vqk/l/32Qo+UfF/vAEN1SLR5nrw6k/tQDOsyd9qNLKFp8PUnLWtvLXh3QYWE642l9oC1yif2eV4UM5wGrdbMwrKcZRqWnrB973IYLgBrXx4/IdCHAvwWGVysT7dC3RdLzKpOx0RVa9TcE0U85DOG+UCnuboX1ZlFQyiL0NjCsdKEwkkny5Xk3Wlm3cGr5Lw7nNXuKbvdL715+4/73n3gglN198SuCfKrWj+chyIDWIiEITM9h+yQnshmKdor8QQtGDEyeIS6xBrqUx/YvdLdwpH4MEzmfHZzpWQxmwBLip57V+oUJpRkPBh9tIbU3SSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AvB/74zE92MM5bhNQoes4ZWP2IemkmpGrFwyE9cEfk=;
 b=LmwyeY1SQMBypKecp99o7fAJARKFeyiT/9tQ0Mffi+73grwzCvn+R5Y1b7b1fHF0YKbGcPMzbv8PSsvNd0+zAaF3Ka1auPASzZW//jJ8b1XyhbrCgO7CpZTDMWKrK85YJPRaDb8hA7dMxrSckPw3UoCUPxFM6lrOU//Cc9Igv2y4+0ZpSUD4hVRPJ7fr3BKVHUrhnXA6qvI3H8aKCRUBAbooAvK3mzNiL4dpilCfNZd5ZhbulvjMZ5BOT1jPaefLAJATh4imVV09Y96Ij/+orWDF1tNGY9qRh0LC0KmQGTdSptmvRz9chUojNxGzMb5NDCdB/PH1EYbMIv9uSWdTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AvB/74zE92MM5bhNQoes4ZWP2IemkmpGrFwyE9cEfk=;
 b=GjFNhMyEpcfDf5d+h4efUchZW5E07M1C3iJM3cQ86zGjIG5u5fx91VzpUZPViFtv65+Sqj1grS/NvycAAf8tWIh2HqJdVWhhSrqKyG5rIjNwcITQdcbPcjHdGkZ53ko66WCevxAK8VWJmvYC2oW0h08/Vsbjuoj4zhmxF4spB2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS2PR12MB9688.namprd12.prod.outlook.com (2603:10b6:8:27d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 19:46:38 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 19:46:37 +0000
Message-ID: <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
Date: Tue, 28 Jul 2026 14:46:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org,
 Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:610:33::22) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS2PR12MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b66a05-de52-4ef0-9601-08deece0ef8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|56012099006|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mk0cZwtrQbfjHB+W1BWOAe4PZU6Alf5zWgahYQr5nPJ6sLKOlpRd+KS5FIbWOIpi/8+B511mxchUy54n2B4dtW4X/U3GNzzDr9LEt2CHkgXaBE9BJ/ITXIVnRQO5ueCnK//BX7qg2cUP67V4ixqS16iSYqiAVy3bzdY2TCW7SswyPqQB0stxbn40vfl4C6VsZGA5sN+zd/f7DQm0jGZZ35LIw9/i8aa1lG6Mq/WCMJwov/DnQlOEKleuRN3G4YzJztj3/Ox01i4p9iYCw3ERk2XSOhJlH24NlQec0s16mbdlVPInYb5a34STMdi30b3PSBBdRxH7i9yQkW1ziJea3pv3BfS84gwKJIfwqvevg9wbhRhlnn0C6rjFflz/R6Ggf7W/hEM5mmZVvlj18K6GGwHiQk4i9fZjbewnbcb+j5dYkC9Wy7N/2Wf7iQqO3Am+ao98of43Y3U7JrhFWbOfoELOV9luPTfToFdCQ81145IVWkyr/LwZBxWkYUU1zz7kQCcCggdswGsHgCkiq87Fq0en5oAymTzk9aUiBlW9qCS81oKWN20TBqK32Q7vH5Q7Ep2nK5oq54y60ojYkv2M79b5KRQa3r4VJnq8KiewVEtrThHx7D5Lj6Ads1B5m41pGEJ+9GEbAwgeMQ5Fu7/eeI2lL1J1Fbn2cYpTeWOnfw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1BLNzNBcjF6T3dhV2hRQ1hBcklzRTVqdnk0Z29QTkZCVnJqa3psRXVWcnBk?=
 =?utf-8?B?UlZmUVVQMWcvY0ZzOWowWUY3TFRXUHlDMitoaktZaVQvOHBZdWY4NzNMLzcv?=
 =?utf-8?B?Smo0TkZWaDBCY1VjZXE2V2VLM243MFVkWFhDVFZGaXlRdHRrZlQ5QTlxdkp3?=
 =?utf-8?B?cTVLaklULzZOV1BPQitEWjdZKzlQZkRkSU9CT3lnTmRCTEZqc3c5RnowNjYy?=
 =?utf-8?B?cXkrR1o2Y1J4cnoxbGRKc2VyS0lac2tLRGs0aFFBd3ExQjhDVllyU1hsL1lU?=
 =?utf-8?B?cDRDTmcyYldKcFZSNzBvS1VwdzRjcW0raGVRVWhUNFVxV3lNZDZMWmVwS3Jm?=
 =?utf-8?B?dVJLZGN3MnlFU1NwanRvRXRCc0k1S2dnWSttVG1EZmZpK1hNMGs3NWxTTzY5?=
 =?utf-8?B?SmNpVUIrZ1kyNmlIb29DbFI1QVIrdUJsNHV2ZzJjMW82aXE5dDZiRG5OK0k5?=
 =?utf-8?B?My8xNUxoT3JEaUJqRXozSi9DMXlXYjZzQUorY2dMNHcySFpXakp2Z1NaanE4?=
 =?utf-8?B?VjllL0JNSCtuS1pmeitzVWlNaEM1TFp1bjJrRzhJbXpWZk92bGpKbVVTejkv?=
 =?utf-8?B?SHJ6VEFubCtYbU4vVVVhNmwyNkpNQW5ta0h4TWhJSW5OdE9FRFptaWtFYVR6?=
 =?utf-8?B?d2F5bWxuNGljUnpEbFM0Tkg0Y2QzbzhOdmlZV0U0eWthVlR2M08vTGRaMUxO?=
 =?utf-8?B?VjUvL04xS2hmU2JRaU1kK1p1a2d4bGg5UGRmbFhrclRhNHIrQUpacVZCb2cx?=
 =?utf-8?B?OHl6NXZ5RUxLVDRHWmxTczFrZ2FFSXRtSFNRMUYrbURsdStJZXczK3BFLzNT?=
 =?utf-8?B?Mk05SmhEb3NVSHdhd1NybGpsZ1Mrd3hGNTdmb0pqanh3akovc0Y1SjVuLzJt?=
 =?utf-8?B?VXB4S1o4WGR0SWhFbWg0LzZOOWVhcUZva0tDR1cxOHQvMnpkTkxjRndVZFNO?=
 =?utf-8?B?Y0J6eEprT0R2Q0psMFpHOUpJcnZwWDgrY1oraWp3Y0J0T3lTYTRTNzlQSVBs?=
 =?utf-8?B?bUFTT2FlTmZlLzZPT1drYmhwZzhxT1l3S2N4SSt5VFFmRFF5WUZnV0REVVNy?=
 =?utf-8?B?MEluOUJLMG9oamZYcUhaUktWVnpUVWR3Z0VHK29yeDUxeWdWSjNYSXhUNy95?=
 =?utf-8?B?Ti90WS9ERXFxem5NN002bWc1YloxUTZueSsxTTJLT1AyMlc5Ym9YdjY4dTdB?=
 =?utf-8?B?S1krUDVFSWNYd2pvVDlrNmlmSVZmenVHR0tyRTgyUElNS01WTlk5VU9EelBo?=
 =?utf-8?B?VDVaejRIQmJPbFE5WDkvMzRRUitZZFZjOGlWMk00RHFoMG5MZmdXMWNHWnFB?=
 =?utf-8?B?aTNyYkRjUVU3RElreEE0V2loYmdkdUw5YjlmRCs4WG04L2J0cWJFNlBuSmVV?=
 =?utf-8?B?MmFtZzRmS3JZejlaUEQ5cmdUSCtrV0dmN29vb0RHN3FuWkVTTDdLSzFRUmxy?=
 =?utf-8?B?SXVLdXk2clBlWll3OW9Ma2ZLeWhnYlZSMXlCNVh1dEhkelV2bTltYTF1ZzRp?=
 =?utf-8?B?S000a09tRWNpb0lrWEswUDUrdmd5UkwxQ3N6RjNqWndCbHFFeFZaZ2VkTmRI?=
 =?utf-8?B?YzJpSUpkWjBOSVpPb0dQWnhtZTBTZHRtNkcxZ0liYXRHRjBLbHpWVWpBaFFV?=
 =?utf-8?B?R1dac3haOHFBNDlFWkV2aEZpdHBxMFg0SXh4aHo0MWdQajIwcGZEUGt6R0dV?=
 =?utf-8?B?QzYxbEVWUW5QbHNkc3crWjVyU25hZXVuK2RQMFV5NjhiTHZpa2p4eEowU1lz?=
 =?utf-8?B?R0t1VWZCRDRpYkVNb2I2Sm95am0rT1BoZ2I2TUp3RXdabmdGZUpuVEFyZlk1?=
 =?utf-8?B?RGIwb1lNS2t6aUZRT1QwdWU3eUtDUFlwY2hZeHg5ZGFjTkNLTnAxT3JMSTZh?=
 =?utf-8?B?MUYzcnpyT3F5NFl6dS9uSngyS0laZlBrb2F4Mi9ubEZwd1BKd2JOajJUVVZw?=
 =?utf-8?B?MWRRTkZFTytTekQydWE4YzFleFJLTnJ3Z0RBdHNnZUJjQVpvZlpOYk9tWWp4?=
 =?utf-8?B?Um1EWDVWcStaaVFnVUhBMHJuaml0QTVmbndtVXZiOW81Zi9LUVNwbFZnUjFR?=
 =?utf-8?B?NXdPbWVTNC9VU04yQ01xc3V0WDJCWlhJOGk4dzhiOHNndjAxK1pmRjd1ZEo3?=
 =?utf-8?B?MVVhQmk0K2d2WUpWS1o1eEdrNnBuYWp0VzhXYlRhdmM0Yk5WSUJiRllkVnZp?=
 =?utf-8?B?VXRXMnk2NFNHbzJyNE1jaG5tdG5MdDVXZG1VNVl6SlJPZ1ZQQXMxck5BN3da?=
 =?utf-8?B?TlY3UlpHUVdlM3EwTk5mQTUvblQvUTZxdVlDSG9KVkM0eTVVYUNHSTUvWEFy?=
 =?utf-8?Q?Squg7nQ4eMa1LD21vm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b66a05-de52-4ef0-9601-08deece0ef8d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:46:37.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dX+T5GFOggk089IUTDJt0fV0Figm5qJWy9iKSxQCBxEXO6INEjj+KW0e7m0Q9zd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9688

Hi Boris,

On 7/28/26 14:18, Borislav Petkov wrote:
> On Fri, Jul 17, 2026 at 04:13:55PM -0500, Babu Moger wrote:
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
>>
>> Avoid this compatibility issue by leaving mbm_assign_mode in the "default"
>> mode during initialization.
> 
> Question: why doesn't the default mode suffer from this counter exhaustion? Or
> if it does, why is the whole issue better in the default mode?
> 
ABMC mode (also referred to as mbm_event mode) relies on ABMC counters, 
and this system provides only 32 such counters.

By comparison, the default mode uses RMIDs, with up to 4096 RMIDs 
available. However, even though the RMID space is much larger, the 
hardware can track only 64 RMIDs concurrently. As a result, if pqos 
attempts to monitor more than 64 groups, the reported bandwidth 
measurements may become inaccurate.

That said, I have not been able to reproduce any bandwidth inaccuracies 
on the systems I tested. My point is that this may not be a significant 
issue for the vast majority of users.

The possibility of reduced accuracy when monitoring a large number of 
groups is the primary concern that Reinette has raised.

Thanks
Babu
