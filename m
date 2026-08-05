Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D217E3E5EF6;
	Wed,  5 Aug 2026 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969618; cv=fail; b=NBd6Qw10DKI2TRlX/mkQQUjwhWuo93QaIhlPxyKIZuqe7bY6oA+3w3LiI8lKnRuPj75CkS+Vt6jXCdry61aOh4y65jRgRv9p2ISiNKndk2BEmFUWbTDE/BuTKQvyv/5Ky/C+XVfKwbbVV5GS8ZyNgXiwmK5jp91sr8ufdSLhYK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969618; c=relaxed/simple;
	bh=A8oZvR3tjPs1Dx1XxDLuwMDK7wWJXVZpODChEqsWKrw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OwAyDUUT3agu4FSIEaEPMjNaaX0SQFLYpLD3c9IZfAyfJ7ICnHixZJjop33THRIIabjBvUV9EnpmqEmcn+5YHiTGW6u5EQjt/rb+sThD9fEO0I0XcyPZB9omT1P9Rom2S2w0ySMZ2RYFG6mb8JHnMhZZmu/utY5f85tx96278EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M8Wj2EYA; arc=fail smtp.client-ip=52.101.57.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M8Wj2EYA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8wE5sM/ArvTIW3q/2ab63YMOEhVvreLY+y8Qrkz1AyJMnj99qEvZV0NCqTbOKKOt6rTzg4+hl8UzP+5FG06Ghdiagvd2CVH8zC6olnLMuUt96qtCOmSszx4jZmziXta3I9CIpD+DPONRFplyR/LUCNJIdAT3PlgfE9E8+hu3oX0JyTkVpwT0Sl6HqIG5Rh55pd6xMzahmFQ/oY/eKCUKlBqPGsFYlxKGEJPqBmqsBVOB7eD5B8q2a/YQjdEEuKUcGkTFAnF1MznlZ8USKuDCbIDPKdBJ5YdXhSj/Ov604+DSVtOcotTFoYXTbPjEp6MmXYPySwEOBJ+m49jKDb4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mkh0F8xwbBk0z7XO9mHdV1HZbnQgZViOyWjC9X8pIM=;
 b=ZhBxXShMKrkwvGd7C9B+znvfvlZJyTAg6COIN5Wr6kThs0peOH4K0uWIY9KCdD7E3GJke68n0sLyP6tZrDGrk23xBUMm5WtUXyhh46SlOLuYgLk0Fz86xdlFajE5+6tKSshVayKvUpTZuGWxanVJOHjGU6JI8Wc3cLJIxl+l+x/sSrg2/33a9Xj3nIDWnCYZQmQ2RSeF/An0EFolFBm5rQkNpCG7WT1ccW9RceoMTDs0BQYOGS2dhdCocgpPyPnEPh8Rm44s94yH08KUZBNo7Kcc2DT8WrcFcohOwrDK+LkH2dGUbd2yvU+HwaJmWFng3wtSvlmCnZtEyY9DvpxGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mkh0F8xwbBk0z7XO9mHdV1HZbnQgZViOyWjC9X8pIM=;
 b=M8Wj2EYAjYYEPngD2Mk1ALyBZenqyNENDjPES5qvOVxmsxeQJuYBk7ciZ4NYFcaE9losEsoNvyKYboI2UEYiF5HyYcmsL2Mj+nYH0ZTnHV3VDHASOEWSosR4bsWvo0PX0L6GY9uSOcF+LPPEPp1z6VsRa1oTs4Uc/CfxpdZtHRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH7PR12MB5711.namprd12.prod.outlook.com (2603:10b6:510:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:40:09 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 22:40:06 +0000
Message-ID: <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
Date: Wed, 5 Aug 2026 17:40:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: Babu Moger <babu.moger@amd.com>, "Luck, Tony" <tony.luck@intel.com>,
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
References: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0068.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH7PR12MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: 01663008-cd43-427e-5277-08def3427f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	N9Og8qzkk6QkQs2TmXiCXrDuRSM5CF1prhEzdIyaZjTJ9/ChCt20QhYhSRPc/JJfaPRVka4Er65dqcm2cNKaaoTMscdiqv30cwPCXoHKfOn++iu/SqHrpzOwBYbb/xsr+oCqXDc5y/lcCkdlByE3epHfL2t457WlzkUjB+zYPA+7NoAVglYx9P4nAYXOOZ2MpWYlJo2P9th3OvhManZLOxJcpXDdWz5lHbVfN7/NgVjWoZfnBp7rMTKHaoIjEbeb/BaAXDQCI73gPJmhjFjAg3xFlywzPe59cIkEUZ/260RQOjY1/BC6gNtvwZj5E4xzrYZnDY7qz4DNbxvvzyniobDM8Nvh+NdOS4Zn7ZOw/Qezas9bs9OZQkGiUSqW6rsptoyk51v8eybJp47EebxkrJpySZftU5yxNp2uT6BMblx4dOmjztjUNGXKtU7sXTifUt0epC1G7EBNBKwXtEhyhbvh/7ESuzk2Shwg0hhpHzhawRw89Y1xiD2Gg5d06xJCuXDol4zJGnBj2BH11HxeQb4E34MeMs1sN7Sju3xp/X/1JI/XFqAR9XQH426l6QlVSFVL+HT49MAmauNvgnCpAoXewZlt81lHZ9JMNjrHK8gGA4Yt0kj1ZS9GeuKX5mp47prfyohu3nb3K+Ba373PgDnWUzP2QWI0DO5nKWfoMGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUVRVHg5R3FNRitLbmNPekw5ZUxMNld0d1RiNzBzZ01oWXcrL2ZrdVpvQmFp?=
 =?utf-8?B?VHlhNk1TNWYram03ZVRXdGNqM2NrMXVCbmMxQi80U015cDhDRkdVQzBOTzhT?=
 =?utf-8?B?cS8rVDFsSXNTdW4wdVphNWlsL3hiK3pRbEpxVkNMVnQrdStuVUg2ZktVWVBC?=
 =?utf-8?B?TE0zdjlmdTlnc01nS3ZhNjREdFo2Yjg4azdNZ09waml6TFJES3lkOU5SMFRD?=
 =?utf-8?B?Q2lZTkMvQThzQld5ZStrN0pJRFAyY3N0ZzlkU1kva05TVmgzM2RYdmFIU0Mv?=
 =?utf-8?B?dW9Rb2lUVzZrbGtPZzBSNzJDa1Voa0FtTVArV1V6eVNRYmhCaVpJeTIrUWJM?=
 =?utf-8?B?Y2ZSSnVwUEFvMU0wSlpjYkxjelkwMXpXVmJnaW5VTkwyaWdwSkUxOWlTOVdj?=
 =?utf-8?B?YjlJVy96MlpITnA5bFc4anBlbW8rWFJGSHVQN2RQVDBGN2IvUTBVUjZXMmNH?=
 =?utf-8?B?QTQ3QjR6bnV2Q1JRYThQbXFZdFZjTFo2YXBSTy9NWVBiTURoc2tSTHNuV0N6?=
 =?utf-8?B?UEhMN1I5c1NWSHdtdDVYNll2VWNpR0xXRTlFa3JpZWY0cXVMQnk1MmgrQWlF?=
 =?utf-8?B?L2I0bTkrQWZnRnAxOTdCSElnekU1QjMrYWE0WE5oa25XUWViU3JneWRmQjVy?=
 =?utf-8?B?cXRXWDNVcGwxejBTNFoyME9jTXBJLy9XZkdVVkpnZEdzcmw5ZER2QW9RYUhE?=
 =?utf-8?B?bEEyQVRxK1h0UEVPZUUvOVVJUUQzNjdzVTU1M0g0WFlLeGRTaHpLSTRWUkR3?=
 =?utf-8?B?OU1KVGlNNXZORFNWUzJkcEhZVTMrWDVoTnhXa0FEYjZzRU4vb25KVEJSU0Jj?=
 =?utf-8?B?TnI3NURSWHJHSS9nZTU0ZTRuWVZCS2lNRmhkdDlSUExwTTdMZTg1UUY1RTIy?=
 =?utf-8?B?TlZsMDBOUWYxZSt5MG03T1B4eFdEZmhxT0YvS3VMTzdGNkczdFlFOVZlQk9Q?=
 =?utf-8?B?UURNZDdtLzRUb09qejdkY01LdWF3Q2tzODhMcytyS0J5TC9kVnJaMWV0VXMv?=
 =?utf-8?B?eG9WWkg0QXFiWkVVWWI4dks5TWtJbWZ4WHEyNE9QTEp0NGlrL241R1JqL3pY?=
 =?utf-8?B?RnpUanZQZTJ2Tys3V1pVWFc1VVNEb1hHK2VWYU5FSDlXNFFsaWRVbzg3Unha?=
 =?utf-8?B?S2oyQzZoR3dNTE1Kcnh5aWRLM0hLc3NycXVqTlhlOVA0cHB2YUgxNldzVVZx?=
 =?utf-8?B?em9ZOHNZNkdHU2loMkVnRS9zamkzZGZqbk55WlNnNExIODcwa3liNlBJcm5a?=
 =?utf-8?B?b0k4WGlLZUExTG9VY005eG96Y1EzQ0tPdkJLMklPM3dZdmQ0bmFwdm05VmE5?=
 =?utf-8?B?TzQ2Y21OcGxYc3BjMU1sR1Ayczc5QXhVQVhRTFdSdjl5THJqVzJhOGEwakNG?=
 =?utf-8?B?Q2w2Zms1M0pOM1FzTVJBVmxYL1BqMHdIa2lMVjJmMU56WlRCTVhHb1BUYTJB?=
 =?utf-8?B?TDlsckNJSTFBK1BnL3pvK0ZFdkVGRisxK0JSOXRkMUdmRjJOSlo2SG56Z1Vo?=
 =?utf-8?B?NW14RFl6ZThsdG9FL2VtNkdFckRlekhyVnp5OTU1Z1pyUGI0OXJmNUtzWjMw?=
 =?utf-8?B?NFZ3QytJRHJ2dmlGajBGN0tzK29KN0VzWXExMzN3YzBiZWpla2lVek8vYm5M?=
 =?utf-8?B?a0dabjVkRnMxWit0ZmdnOFdrWUNEMmNKS0tIQzdnUzYrRUpFSGg0SFByRXcr?=
 =?utf-8?B?R3BONW9HTmpBLzF5Um40TVRHdjQ4NmRLNElCV0I5K1E3cjd6L3duZ2pvSWph?=
 =?utf-8?B?U015K2ZMRFZ1bFdZd3laa2Nad3N3L25qVGlISk5OQVErU3M1bjBLV1RyUUJW?=
 =?utf-8?B?NDRScHY1M2c5NjBFTnp3UlNlbVB2OGlUdjIrRVpzUkFLM2Uvd3dXTWJwTXZz?=
 =?utf-8?B?ZWkzRWNnM2x2aUFHM3ZRZmV5djY0eGNYSTFlQ281WCt1VkJKa3JXOUtjRmR6?=
 =?utf-8?B?NkJwSzI4UFM4cFpyMnFIYnpvcm0vbDdMaERNcllEd0JrOXJveVhaWjdoaTRK?=
 =?utf-8?B?bnV3Q01Pem01dFMwd2xNQURjQlBpQ0F2TUtDdFpQYmRPZlNUTnBhelU3WXEy?=
 =?utf-8?B?VVJnMi9KVXBNZjBCbXRWbVVISCtVZFE2b2FlODJtdzFmKzJVUVJWQjJGUGh3?=
 =?utf-8?B?OVYzRzg3TzNyS013ZGZVUFJuZUxJYjBvbGc3Rm9qV1BHYXlMQzl3eU40cEdT?=
 =?utf-8?B?WlVHNnB3M3pjSDF5WWJmbTJoYmVEY1BTdEpNU0U3cjgwUGQ2NmNpUXk1RjdE?=
 =?utf-8?B?M24xMCtoQ1k1OTduQkJ3OHppN2d1YzFmS1BacVQxRDAwVldEblNQcXpZQ3Y0?=
 =?utf-8?Q?JyAxp/7wDUmQguuh8z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01663008-cd43-427e-5277-08def3427f70
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:40:06.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih2pZBbl1b8o9zC5h+4jPzDMm5AhtbG9WzxY0BrzsXWHPrCyK1UYgEre75nEAkRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5711

Hi Reinette/Boris,

On 8/4/2026 6:35 PM, Reinette Chatre wrote:
> Hi Boris,
> 
> On 8/4/26 3:47 PM, Borislav Petkov wrote:
>> On Tue, Aug 04, 2026 at 03:10:18PM -0700, Reinette Chatre wrote:
>>>> So, long story short - and I appreciate the explaining - we should switch
>>>> AMD's default behavior back to RMID + 64 counters - exactly like it is on
>>>> Intel - and the ABMC thing will be explicitly selectable by the user.
>>>
>>> nit: s/exactly like it is on Intel//
>>
>> What does that mean?
>>
>> What's the difference between Intel's RMID mode + 64 counters and AMD's?
> 
> Expanding on what Tony answered ...
> 
> The 64 magic number only applies to AMD.
> 
> In default mode both Intel and AMD enumerates the number of RMIDs supported
> by each resource and both Intel and AMD limits the number of monitor groups
> a user can create to the minimum RMID ("minRMID" below) supported across all
> resources.
> 
> On Intel the monitoring behavior is consistent no matter how many monitor groups the
> user creates. User can create up to minRMID monitor groups and reading monitoring
> data from all the monitor groups always return accurate data (never "Unavailable").
> 
> On AMD the monitoring behavior (without assignable counters, aka "default mode") changes
> depending on how many monitor groups the user creates:
> User creates 0 to 64 monitor groups:
> 	reading monitoring data from any of these monitor groups will always return data
> 	and it will be accurate
> 
> User creates from 65 to minRMID monitor groups:
> 	reading monitoring data from *any* monitor group may return "Unavailable" and
> 	vary in accuracy
> 
> 
>>> ok.
>>>
>>>> This way there are no surprises when running any tools on either vendor and if
>>>> one wants something special, one selects it.
>>> This patch, once minimized for easier backporting and marked for stable, would
>>> accomplish this.
>>>
>>> Two nitpicks:
>>> * "no surprises" should be "no surprises (as long as AMD hardware does not return
>>>    "Unavailable")".
>>
>> AFAIK, Babu was unable to reproduce that.
> 
> If this cannot be reproduced on AMD hardware then AMD did not need to create ABMC, no?

I haven't been able to reproduce the issue in my test environment yet, 
even though this has been the case since the very beginning. I'm working 
on reproducing it though. It requires a very specific scenario where 
more than 64 monitoring groups are active within the same L3 domain.

Prior to ABMC, there was an attempt to address the problem using a 
"soft-RMID" approach. Saving and restoring the counters in software.
However, that solution was eventually abandoned because it introduced 
unacceptable overhead in the context-switch path.

This is where ABMC comes in - because reading counters can be very 
expensive on every context switch, with ABMC you get the ability to pin 
certain RMIDs for longer without the hardware invalidating them as long 
as it is pinned.

You can imagine that there are hardware limitations which cannot allow 
you to pin 2 counters for *each* RMID. So you end up monitoring a subset 
of groups.

> 
>>
>>>     There is the known issue with the default mode on AMD where return of "Unavailable"
>>>     is treated as wraparound by pqos.
>>
>> I guess Babu can address that.
>>
>>> * "one wants something special" should be "one wants accurate data".
>>>     Caveat: User does not know how inaccurate data is in default mode. Users need to learn
>>>     about existence of accurate data from outside resctrl via external sources, possibly
>>>     leaving it up to the tools considered here.
>>
>> With my simple thinking, I would expect that accurate data means, the number
>> of counters being in use is not hitting the arch limit. The moment that
>> happens, I guess one could deem that measurement innacurate.
> 
> Agreed and matches above summary. The arch limit here would be the 64 RMID that can
> be guaranteed to be counted. resctrl does not limit the number of monitor groups to
> this number though but instead uses the number enumerated from hardware (4096 on this hardware).
> To guarantee accurate data in "default" mode a solution could be to add model specific
> information that teaches resctrl about "64" and it can use that as RMID limit instead.
> 
>>> What is the plan with https://github.com/intel/intel-cmt-cat/issues/311 ?
>>
>> I guess that should be closed once we switch back the default.
> 
> I expect so also. Even so, it does open a new question of if and how tools are
> expected to interact with assignable counters. Instead of this bug I would propose
> that AMD work with pqos folks on expectations from tools to support assignable
> counters. To me this bug implies that AMD considers enabling assignable mode on
> a system as a bug.
> 

We have discussed adding ABMC support to the pqos tool, but it has not 
been a priority so far. Given the current discussion, we will need to 
revisit it.

We would prefer to keep the current mode as the "default" for the 
following reasons:

1. The "Unavailable" issue is not new and has existed for a long time.
Most users are unlikely to encounter it.

2. Users who do encounter the issue can use ABMC with the intended usage 
model described in [A], where a subset of groups is monitored at a time.
We will document this properly.

3. It solves the current "pqos" tool issue.

4. From AMD's perspective, this is the most practical until we find a 
long term solution.

Thanks,
Babu

