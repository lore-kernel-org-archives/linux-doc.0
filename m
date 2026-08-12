Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2B2EBB8C;
	Wed, 12 Aug 2026 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544377; cv=fail; b=XWkFmkrnqMVkc9SAyPtcZdyhW0A7xnfNyUwbaQ2GHudxjgISc6zWbscHvwh1WwHeaX7i7+37t/cQJWf+TWidbmX94NRUzDNC3+HSvIYfhWW1eXzlbQatXZ/SdLet8zp/rJyYfA7bXn+pX1c/mbxLv9hYRHk8A5Ym4dv2Htr/tdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544377; c=relaxed/simple;
	bh=6T3mmR7ZNj49cb3nWMt2kf+iqxWO5+5Dwr755KKeWCw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kyI0ecR0Y+KDWZu78YtJP8z2QrvHwGV+yFyym5iOCGGWgyJ6HiOzDnDzLB/KtCsgzqKvYS5GpM9u46iu4kXVJbOS+bPxxhyG7etOK+TQ2TiI37VAMMXcwJIjaxnWkx35DKWpx8tOtdHOGAlAc7lhju1SWzJO012pn2pXwC6y7Jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YIZtiiqr; arc=fail smtp.client-ip=52.101.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YIZtiiqr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3Mb/ITUJnz2MeHbhNIYwVYSpJRBQcuFHe49ReqvxN7DN+JDojuDiz1M/iOv1XKCZV4Vo2Gf6uPLRV2zHEfGRoC/aan+6++m1drzP43WT/IRTaTEia+aZddTvdhK/lVkOBpmTP8pX1hJln4b4DAG2376T2OUrjSMTFZf66VQ9/h1avzWgCMdwb2sNJ9AMKnj7KCG2R38i9WeG2SUkwqrnFywCsVmV8HGp3+1M4jP4B6KRCFN8DbDquyHd9zyGFCOgimxhMUDhLSwS2jD9IKnmXr1OD+J90VM4HWtdHlgs/7dTdvJwYZA8B8+ONuyx+Mn/GL810+OyUSLVV79EQkXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JcguE2u+pC4TvSrtnpF0yG+/8ZeE3l9WDcR/TLgnB4=;
 b=X1NyxNcRhtM4z1Bn7euTnMAlsJ+vuQ3CNk0XFhTqkQtad+Mb9YK2F0SwpZmfTAqrkEbzLR+R2VzIkbn/ijzP3SWTXAGxCowbZIP721cUhhfiaVgUm5AS/DWUNSTbAmZoilPhaefLi8mKeC8N/ZoztV1MLH+aiMKOQFZIvPQA5FfauFeW3L7Fjq1o6EHR8pusLfv1FxMNZO6EtpWyBYi7wh4CatX/l9M9FZbrGfXq1R+9EgLv7Im6aUAzOvvwxd3h+Loe1uGoIRCMrOxE6TIj+Qj5zCFOld11KZnjXylzCr9O7KhjqD1hKs3Uw93sx03QHBi1ZlvRQSsSXRt0dVNS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JcguE2u+pC4TvSrtnpF0yG+/8ZeE3l9WDcR/TLgnB4=;
 b=YIZtiiqruoDgmMrcD7tnwI6FadwNst6Z0c9TUPVdZJGyke4CDnWw94R/BC8EY/c1gSNpREGZuZ37ycgeJOAFn9hHYjFNJ9W7TMyLOQxGaIbAM+MuJLANQ2o6dJZpiA7pYwT9plyou4eRz0TbaZBVXa1AVh3ms1CXwGdtzJIGZzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 14:18:38 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 14:18:38 +0000
Message-ID: <b94c742d-4b90-4c61-a86a-62df35ac5ff5@amd.com>
Date: Wed, 12 Aug 2026 09:18:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 03/15] x86/resctrl: Add data structures and
 definitions for PLZA configuration
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 ben.horgan@arm.com, fenghuay@nvidia.com
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
 <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
 <a3bcdddf-70bd-43b2-8483-7f018bd3c4b0@intel.com>
 <ba27f90f-6cca-418d-82fb-fd63fb015b9e@amd.com>
 <0cc07711-3d81-4785-81dc-804178fb443c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <0cc07711-3d81-4785-81dc-804178fb443c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0437.namprd03.prod.outlook.com
 (2603:10b6:610:10e::17) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad0637c-5f86-473b-a8a9-08def87c9a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|921020|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DXcPt5JZY1V8Myx+tLyStjyjpznlpn7PDSRQopIEdpu7lxF942DYj+vvmKrx/kiGPs7XBNAdmImgr1xUxGlufOHRe5Y0FKJlSLA3PCO3tbZmZaWxjYDYgYguobHwi4twz2pr2uX+FrPehBba9dOYybFFSV6BIWQ1Fzt/mFRewxCeu1RBo8veAEJdlsFw2qz5yC0boNUG7uTugKDBAfQnwbD5iDmtJLoCGnz+qf8FwYRbsCQa4VEqRfNyzUoCSYvDmQ5jcxmO9pywS8x5GGJvDJQBLRwbKu5fe53HzhnMr/XUykQUuhL5cgYAmAbmJM/EWigH8rOZxWdKLX8Ztwm3hbiJD71bd01UFQgQ3yTQClhBGvoQeuWNnMoKQCnr4uOtp5dbCeSNbg1+pnmVuRAe1gqCD7IA4KllMfXf469/b6MZ/IzpIHaN6+yeLOqPXPhjf5Mv2UOPcA+72V1IltcmXRm7TZtYiscQREFHUcsIpBiMLlb2WFYG5EuD2o4zX9LVqR3JP4jK9lGz/1T5Bd2K05cciVT9qAQkPJHmfXwAiTr5Fgf4Xlhjy+d3RGa2fc/tFV/dy3papMdNMHMjNEG+5+grQ/yHsZaiMSCy1tPEQ3bOse6diI3a48Sj3IWa3jEZmpZtvqy47+5+Q7rs+GEz1J0Q8aWwlSWeOP2k+d+b3xn6mgU//vgdEqzthWw1qRzzl9aN77HJEUAFgBQw6cixuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(921020)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkRNRmN0SThCNGRKOUFsMkpGOHBaVXBEaUg4ODR4dC9JUmRMcHZ1MFUrekpZ?=
 =?utf-8?B?cngrMkJFZFlkTEVvaTZaVkloR01qZ3JYeTZWNU5ON2JvbXE4QVUwSDlGV3BV?=
 =?utf-8?B?MnVEcjYyczNaUlNTWkVjcXZOQXFrUlUvOWN4ZlR4RTV5VklPU0pwaTlSYjln?=
 =?utf-8?B?U3p2UGJDL3QyZDdkN21PWEs4aDhaVGJVNHhRL1I2emRoZ1ZzMEd3WlNrOERU?=
 =?utf-8?B?V2c4blFKMHE5dGtidGUwcmUxU05BbDhwbm5YOTM5MmpzSkF2MFRiVlBQd0p0?=
 =?utf-8?B?aUgzLzU2TXRPeXJjbEVMWjg4MXFQdllKY21idmZhY2ZuYkUvMXY2cnVzRVBM?=
 =?utf-8?B?eW1jZ0l6ZFY2Qk5XWnlJa0dvU2l6Znk5alFmYVFHKzJtbTl3eXNYcTczTTRK?=
 =?utf-8?B?TTV4bVNXYmNFc0tCb29BY1MrOUVzNEsyRk96NVpub2lESmhIMk0wb3RUTFEx?=
 =?utf-8?B?cHlSTDFkT3ZKcXkwaVlObm56SmRyVjQ0OHBuKzg3MDZOaUtHVmM1NWU0ZHhS?=
 =?utf-8?B?QndjbU5iVjlWWG5TcDRoOGU0SExSZGxUMFRxcUFHQ2p6T3VmTHY0cEYvZ0Vj?=
 =?utf-8?B?QkhiYzA0L3gzOGNrRXNON0hBbXBzUzh3ZDJSMXlTVnIwc2ZhdE9vaVd5SWcr?=
 =?utf-8?B?MHp4SmZMWGxSbEE2L1NTOUxmYmw2Q0xiaExqSDZtSTduNnoyMGlRU3o1Sk9r?=
 =?utf-8?B?QW01T0xQdmRqb1lPU3JINGJWV0k1ZEJ2TnNxbnY0YVNRdVJQcVRRdjYybFFG?=
 =?utf-8?B?MDY3VFNJOGhYSTBLNUlkdWZERG5CN2tFc0NhbEJOM0xlTjcxZjFNaWx6QTBY?=
 =?utf-8?B?TzVDOW5DaVhzRzFzZ1R3YjZ1czRHSC9UNEJVMHFvS1lwRVl1aGh6Umx2VHZs?=
 =?utf-8?B?dkdDUzQ1elc3QXF4ZjJBMTV0Z013T0pGbm5CbWM0YmNpQU93R1VLVWU3RCty?=
 =?utf-8?B?bTdqbThFUlVvTm9wZ3o4Y280bnNuRUZkZ0o0OXVPUC9zNzNiQ3F1dmZHUEhX?=
 =?utf-8?B?amZ2VUpEZWM2YjREcHBCbzFzMFIwWHpndjM1ZVF6dmcxckdtc0VOUWZQYWJM?=
 =?utf-8?B?Q082NTRwdTJjT2pHdHhWN0w3MXRndzl3ZnFhYzNKRXRDeUlIS0pyWERSaTVn?=
 =?utf-8?B?MDZjVlZHbG0vWENVL2tKcmJzT2dkQ0NFUnoyenpkNzlpUi9Ja25pNGMwbFJ0?=
 =?utf-8?B?dnF0eCtrVzVTMngxTk1zL3N1WmZRQXZTdGRLSGNuR1Jjd1dUOENWalhJUVk4?=
 =?utf-8?B?V3ZaZVNZV3hWSUxQVjlqMnJEOSsrQnVNVTZXS3pTeHdlVXBHdWZ4L1NzcTRD?=
 =?utf-8?B?K3dQZGZYaFE3UTZFUFB6SDZxRm9NOEhWc1k0Q3VhUXY1M2pMYzRDL0N6eFBC?=
 =?utf-8?B?KzBvN1FLZlEwZ0x1L1JmWXBpRkRVc1p5ZTZNMUxCOWo3VjJwekZmbzhuRUxY?=
 =?utf-8?B?RStpakdLS3BwL0tJVXlBcklpWHBMSWo1aVI5RS9nWHJtNFNZS1FGaTZYWnRD?=
 =?utf-8?B?R2VwWnNTb0NXZldKQ0VzN05tWmJscEU4S3RHMXJIRmc0a1FISCs1K3RZdkdk?=
 =?utf-8?B?ditZZnkrRDVHcGhjcnBzRGxMS0EvRUlyTkJQNVVzVVZwL0NpZVZXc3ZMRis5?=
 =?utf-8?B?dEZtNzFCRXhwK2pYQUllMzhIVGdrZjR3bXExUlh5T2lCb3hhZW1GRDlDLzQr?=
 =?utf-8?B?N2syK0VENVU0b09vbjlXeG5ZZGNKREdzQ1RmTXZhbDZxMVZtbEMvS0xwenhZ?=
 =?utf-8?B?ek83UGUzV2FlemRJQWNEV0ZSWVdiNjcrVkM4d2lOM0t2cE9RcEhjL3l5dlZD?=
 =?utf-8?B?T0RpdmN4WWJJSmlLYXFMVlZUZEVZenFmWWVaaVJBemNpTy9tS1dKajdtS0FO?=
 =?utf-8?B?bkVSWTd0WURJaUd3YWFVTUJTYzRPbGtaV1hEQ3VRSEFrY0xMcitYd1QvMGpa?=
 =?utf-8?B?MnE0Y0hZSjhWc0ZKbmRzT3pzbW80T3pBeTJhajRadzc2OFN1cnBFMWdBenFX?=
 =?utf-8?B?cXh5SEdmVXg5T1NxdGFpSGtpYW9tV2tzejI1RVl6MnFhNmh1U3orQ3lxeHFM?=
 =?utf-8?B?eGJ2d2xmWDJoK2E5b0RYajUxMmJiTTNRN3oyMFVyQW1iNFF4SENiWXM1Qk9K?=
 =?utf-8?B?WmZ5WCtKbWdlQ2VSUEUxdzVoMHpLNEoxd1lkTHZGcUpheDFuaEJ6aWdXNUd3?=
 =?utf-8?B?RkpQdHdJMkYxaFFSYmFkWElYS3E5MmZmQkpndldnZUV4cFhFM3krTUpnenNs?=
 =?utf-8?B?VlFENnQ3UEY2UVVCeGxaQ1VDVXl4NTdobTNCSk9xaE9OVW03SDdmaGw5V0RW?=
 =?utf-8?Q?7fQK6PaALJJbM1sOyC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad0637c-5f86-473b-a8a9-08def87c9a11
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 14:18:37.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K860GOcPkG8X4QMQC1cqmHOdw6yZ2OsM8u8l+tA79UmkNsupeS+UAk7FgMCb/r+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950

Hi Reinette,

On 8/11/2026 6:51 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/11/26 2:10 PM, Babu Moger wrote:
>> On 8/10/26 21:58, Reinette Chatre wrote:
>>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>>> Privilege Level Zero Association (PLZA) allows the kernel to use a
>>>> different CLOSID (and optionally RMID) than user mode on entry to kernel
>>>> mode. The CLOSID/RMID association is programmed per CPU via
>>>
>>> CLOSID is also optional, no? I am not able to recall now why this is not made
>>> optional in this implementation though. Could you please remind me and add
>>> it to the changelog for next time?
>>
>>
>> Yes, CLOSID is optional as well. Since PLZA was primarily focused on
>> allocation, I hadn't considered that use case initially. However,
>> there may be scenarios where a user wants to monitor kernel activity
>> without affecting or changing the existing allocation configuration.
>> That would introduce an additional operating mode(See below).
> 
> ok.
> 
> I think doing so will simplify supporting the different modes across systems
> that may not support allocation or monitoring.

Ack.

>> INHERIT_CTRL_AND_MON:
>> Kernel work inherits the allocation and monitoring from the user space
>> task. On x86 this means that kernel work shares the same CLOSID and
>> RMID as the user space task. This matches today's resctrl behavior.
>>
>> GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
>> Kernel work uses a globally assigned allocation while monitoring is
>> inherited from the user space task. On x86 this means a CLOSID is
>> assigned for kernel work and the RMID is inherited from the user space
>> task. Default scope is all online CPUs; a subset may be selected via
>> the resctrl group interface. A CTRL_MON group is bound to this mode.
>>
>> GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
>> Kernel work uses globally assigned allocation and monitoring. On x86
>> this means both CLOSID and RMID are assigned for kernel work. Default
>> scope is all online CPUs; a subset may be selected via the resctrl
>> group interface. A CTRL_MON or MON group is bound to this mode.
>>
>> GLOBAL_INHERIT_CTRL_ASSIGN_MON_PER_CPU:   <--- New mode
>> Kernel work inherits the allocation from user task and monitoring is
>> globally assigned for kernel work. On x86 this means that kernel
>> work shares the same CLOSID as user task and kernel work user
>> globally assigned RMID. A MON group is bound to this mode.
> 
> I provided comments about this text in following patch. Apart from that,
> I think a CTRL_MON or MON group could be assigned to this mode?
> 

Yes. It can be CTRL_MON or MON group.

thanks
Babu
