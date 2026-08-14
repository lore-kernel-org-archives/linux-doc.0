Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F33C0610;
	Fri, 14 Aug 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720226; cv=fail; b=b6PfcITfKrenSNpcPSRfAsgOAYdpIM0HayL/COoBntWVgdoh5QQqXvMefN93YiAvVLZX2XsSNKOpQ8TttY+0ljcpo3iPDOYRjw1/LUKBf2sBgIQEpBhMaYztKE+zMSrs+NWGmVPHMKpo3ZN64c//KSzAkIahukR5m6UAeYytXkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720226; c=relaxed/simple;
	bh=y3APlveCffSROyg/soDPOhmJvkQVur+HL5K0UUOaMS0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z/dkwXEh8SQ9oZKVFKU28YzGDIhXV1O88yBVBegXBwJACoB3H6rMaLOY3A8em1EAp+bTMXgX5Rv8u/gtjxr+X4NW0Gzbb/NhoYCR2RgjDoYPLJPbgL7CIXUlRloAgpUmmF9ntvgSF8erIKEIgBsmWZgbNO4MX7Ptpt6bU4GaBu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hp5uMpCl; arc=fail smtp.client-ip=52.101.48.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hp5uMpCl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3mhmlACvMccv/7fqAH957J6M8sMih9703bH2JPm9Alvn7t38NtxfZTLWjNBAKrtL8U3Q1iEoxcKsNuM+CFEOdwg/8odUeAVIKhQkCf3qYJy9tdtmS/xdOgSR15GBzvQ+FebBZGdT9uI0xzPoQhFcnH2nn4I6f3PUuYVNgR3Hd5VSF/E2NR1E7f9laxiiAXAFkkajjyWsEP18ebh6gc/hkXDv/9dqyqxzlOT6NGdbGbxICvQc3DQsTlJTADr6RywcvS4Jn6vzPEx5in5ja6ExjoOLRAcTCPAH2yB6cg0J+aIGDPpaD8cfZRNX0h5SRBjS5s3ZjiZMH2Pw3RSJ41bDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0mElZWvLSwUHIjwp66yrSk9bnAxy57t+2QSHiKnMLU=;
 b=WIesOyNkqgWME9gjwF/ES5OAbfY1STKG1sz29iGw4C/Lzm7A1n5dplGV65pFXIcaaxuEbuF4eGT/UZBEZsrxdTuNguwY0LLfk2GSGKqTpNwa4An3jeBw1BPbeoDkNkAtkXB92udIle7MZ77n4ycCMktFKP4Dxn+C3v0lC55sZEoenDgUwPLdVTSmddBxL74g4VbJFIqRx+p4xrsthoHlkAxWYsvOsdnf5HlIldYpx5oH3F45rb41r08jqu5s4pnVaZZ866gXjjctUtV6w9Q5LW6m16mlMeR5fnSDsRK26P6u3uNWe+y9uZKJgrOxhImE+BxCpQtDLQCk7TyuW6RfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0mElZWvLSwUHIjwp66yrSk9bnAxy57t+2QSHiKnMLU=;
 b=hp5uMpClywH0y1Bj8Kj/FMn0/21eGQi36ALyY2QSA6jHeHMzJoJY/xQ2R+queUOXJMjG2qYkhJNW3FbKN90lInwjBYUN3yqy80gYIDY4gNpiNY3sQS9TSapQ+vZjJwfDMsuwFf2jj6D7m1WvkgO5UEUuMdMcxifO/fkVtAVpY1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 15:10:14 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Fri, 14 Aug 2026
 15:10:14 +0000
Message-ID: <6399ad9a-71b9-4ef3-9901-5569b54b082d@amd.com>
Date: Fri, 14 Aug 2026 10:10:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 14/15] fs/resctrl: Allow user space to write
 kmode_cpus/kmode_cpus_list
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
 <e2deefce19f3cf087ea96a7aba3f6850812e3036.1783461016.git.babu.moger@amd.com>
 <d297bec3-4957-43d9-9bcf-43b4676b0235@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <d297bec3-4957-43d9-9bcf-43b4676b0235@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::30) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df969cf-0b1f-4415-ea10-08defa162463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|56012099006|3023799007|10067099003|5023799004|6133799003|11063799006|921020|4143699003;
X-Microsoft-Antispam-Message-Info:
	s7XQJNwJyz7ji6qAp2Q7BkgMzbUIFQMPMUmoDP3jV4iyPZiDEKkZV8ejExh9FTzIk1idrj47hhD5VkguM235Y/99eq4xMivjmfisnXbW/AvfiI4R07co+SvBuecAlNmHvlCKsS/k4bapyhyWXJomcmkfiYA+St4KYhFSmUgSKQ+ntDqsscGpxzs0iEtAJU0rdKdFelr7D7iKoWeDUxSw28gj1tUQR+EgEAwzbGPDcXHQGWeIwKzbDa/sseWQ5A/k+SLQyWxtRW4YWYUhY0wpkvPOM8ILSmWVvl0HuPSewjzc3n6BNA+f1mFSAYWudlcUC7/WKGFrgaFspg9DuAjAv3Z5nH02kF1DHSDImRkpc++dQeQ25OXoPUeR0VXk61OvnCG0RhKe0HBeu5JizxQraIWoIiVvxRjcsGD9L8eR1Rqs5vgFjcmABs1cvu82SsL1z8bKFKcY+4bZ8PMt6pXXiAkgqoKZYqyiyIAkjoqpLovTBEJjNFAteLQe8Soxj/syvdjV6xCtC/hBiCsPug5IoCVbvwVds11LnQOw3tdf/O6YPpuNxcoI4vtG6aqA1N0bnPfPguep1QaytS2jtOjLv3JjdrRrltEeQfOCcRkNcBO6oZHmBJbxhjU02oMQnE283kFGH4U40MWXzl+5GIQEE6okmRw7yR0jHnQIygh5H0T//PbeGBWQlmXwoc39amU4Em4VjyOWm6/o4kk/vn78rQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(5023799004)(6133799003)(11063799006)(921020)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhUYzFUL1RLRHZ5NXVGK1NVREtMdmR6dWtnQVRWa1Q4WUU5UjFyTm15dnhs?=
 =?utf-8?B?L1AxRkFxTjZ5UmVFbHdUUjRVQ3kwTWl6M01WcnVOajg3OE9jT1ZIWGIwOG1Y?=
 =?utf-8?B?YTBPOE1WNWo5ckhWT3l1bFluMzV1MllQL2kvRzJvWnVmZmRnT1U1VWgwc2pw?=
 =?utf-8?B?ZWx1LzJnUWtRa0NsU2M2ZElMT3Bud29RQkpjLzBPaTJxVWNKeFNyNlZXVzhw?=
 =?utf-8?B?NzliNG1yajVXSWs0NWcxN2RTekxHSGFVYzlFZmx1SXNONndwc1dmb1RCVTIv?=
 =?utf-8?B?c0lKSUpsV3B2MXhxM2paMkJlZkV1aVNWUXp2d2p6b2Z6QXJxWlBBdGR1LzVP?=
 =?utf-8?B?OUdBN05ibG9yYjVDTkduL3dOamZqdDZBVXc1eVdob2MzSkJBaEdqemFDNXpD?=
 =?utf-8?B?clJxRVo0Y1lTL2FlVk5jMVFHNHNsenAxTEdOTSt4b25oSjhjM1czcjc5a0J5?=
 =?utf-8?B?dXpRRmwrdkJBcEFOSWw2OHRWYUt2T0dlaXJuRTBEejRLb3FWSFBUcjNnaVh4?=
 =?utf-8?B?b2xZVmRFdmN5WUF1SmQ3WXlCaktTUXNvcHUrd0R1N2FQajRwR3ozcHZwOU1N?=
 =?utf-8?B?NGZsMyt3S2RIOWV2V3JYa2p4Z096bi91UkoySmt0SUhTRlpxOEplRmQ5dnM5?=
 =?utf-8?B?K2xnVDQ1YkYwcHNUUHZETHBRR3lWV2tvTHQ4cDR3YW9zOE9TMmtaRXliZWl6?=
 =?utf-8?B?c3BDYS9ZdWJQeUZxd0lIeUU1eG9PZnFnMnFlZXVEanNuMnRHUzgxazdiSXRq?=
 =?utf-8?B?bU95MWZyWS9aLzNaS1YxN0RhV0xnbno4aGE3eUlHeEg3Z3hGZjY2Yno5MlVN?=
 =?utf-8?B?a3RqYnhCNzFFZ2p1b1l6RkNmSWZxWmpmL0J3eTVRdzNRQTJvbmJSNU5HYkVt?=
 =?utf-8?B?Q1dtaG8yVk1UM1lLVFVnUjZ4SVg5RmRIRVhiWnpuSGx4Z2xSNEdHYThYS1ph?=
 =?utf-8?B?MnZMcWh4RUhCdUNvSXkrV0NIUWdacWE4SXpXYk5DeDAxNUp3S0E2QmdUS2NQ?=
 =?utf-8?B?YWxsKytVb0dweW5YdmdZRzdHN3BlOTBpcUFFWXhNT2VYVVluS1NUVWNSUVpV?=
 =?utf-8?B?U0xNV0cxN09TeUpTZWUyTkRyNExZTitBdWErLzdPN3I2Q0VjWEExMFN0QXcw?=
 =?utf-8?B?Y1ZGM0RvZFRhNGhYZnY2ZkV1OGU1R1FyQ290dDRsVHJwSGRvMTZlSEJYL0tU?=
 =?utf-8?B?dlhHNXpmQUZwNFN1a1NvYzdXMDNrNXFxNU14UjFEeWNOYzhBa2Q0TVdlcjBR?=
 =?utf-8?B?L2xHK0x1LzRFamZJdG1OeERETks4USt2c0FjNnBzeHpaQkFlMll1dWlvS20r?=
 =?utf-8?B?RHhHa0NzRU92dlhUUVROTEZwYmVmKzN4R3MxcFpkekZGa25ZMnJjTXdrYjRo?=
 =?utf-8?B?YklzeVZmSUd4NXM4NjZ6TWxLYjRSdGtvcEMwQkdRSnA5ZCtISFhucHhmRlZB?=
 =?utf-8?B?ODJZVEpwYVRQM3RycWtjR0Z2d1J2QjBCbWh4ekgxUmZRRXNWRUQrWHNWZkVB?=
 =?utf-8?B?ZTVwV0VVaW9EeFJLUGN4Y1JZVlRFdnFUNGZzbkdLeEk5azFQQWpKU0hwRmxh?=
 =?utf-8?B?TytUcDNjM2NVY2dPeTZKbTlaQmFyLzlYNFBiQkVXckVmU21sREZwMlVrN2NL?=
 =?utf-8?B?WFgvYlQzOXRaTnowcmZwY1dqNzJCRXlCQXZrTmljdG9pNU1lb1dXeXU2ZElj?=
 =?utf-8?B?dEx0MGg1MmpmZ09YYWsxdERXK2I5NWpqZytOTDlCVitzbjY3TjBkUGppa3Jr?=
 =?utf-8?B?VEhHSzZqNHcyZmR3ZkUyTHZjVWRYaDZmenRNdWg4RTI3cXNadUVkc256YUNU?=
 =?utf-8?B?YndrcTI5Wm1GSGxtSURxZ2Z0U21IYjRob2JZaGxiU3UwZk1MUS9NeEZWQXUv?=
 =?utf-8?B?VGMvSnpJNEp0UVh6akZDSHFIZDR2b011Q3NSSHl1cElVYmFGaFA4VGRaZXY3?=
 =?utf-8?B?dFBwMi9PbzRWZmdocFYyVzcyallya0J3Q2Nld1NPM1o4dVFrekViaXBzbWdN?=
 =?utf-8?B?NWxTR1IwZ1dkZmRKU2hheU5DZ1M3Sm95enl0QTJCU293V2tzYmRPSFNnRkxv?=
 =?utf-8?B?QlUxd0Y3RXNBOTFRbmt2c2tGbTd1Z3A1OUFmcFpkV2Z2TCtmcFNJVEd6RDJk?=
 =?utf-8?B?YVZkMEZ0RGIrVzF6ZUM5cGFxV0F5UTFQdEliUjNsWlNxd0xoakxqWUJmMTJC?=
 =?utf-8?B?c3k3Q2J0WWNnWHpiZmREeW9FZjk1Y1NlUllJSHlGai9JOTFJbUt0dURNQmZ2?=
 =?utf-8?B?Um1LdTlVZ2h6bXdhaVgxRVRLZmMwK0w0b0VmSzlMZFJyUTM3N3RPU0M0QjNJ?=
 =?utf-8?Q?RE4ijxwEo6EmqlgC/G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df969cf-0b1f-4415-ea10-08defa162463
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 15:10:14.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaOlDuC8t1Wb1LDmdzmjzSEJg6TCH9AFOXN/fH8/jyW+ymwleBRESSHoD9k70Q0I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935

Hi Reinette,

On 8/10/2026 10:49 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> kmode_cpus and kmode_cpus_list expose the CPU scope for the rdtgroup bound
>> to the active kernel-mode policy. They are currently read-only, so changing
>> the scope requires rebinding through info/kernel_mode, which reprograms the
>> whole binding instead of only the CPUs whose state changes.
>>
>> Make kmode_cpus and kmode_cpus_list writable. Parse writes as a bitmap or
>> CPU range list. Reject pseudo-locked and pseudo-lock-setup groups, writes
>> to a group other than resctrl_kcfg.k_rdtgrp (including stale file
>> descriptors left open across an info/kernel_mode change), malformed input,
>> and masks that name offline CPUs.
>>
>> Update the bound group's kmode_cpu_mask and reprogram hardware
>> incrementally: disable kernel-mode association on CPUs in the old mask but
>> not the new mask, and enable it on CPUs in the new mask but not the old
>> mask.
>>
>> Document the interface in Documentation/filesystems/resctrl.rst.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v4: Empty masks are now allowed and updated masks are in rdtgroup->kmode_cpu_mask.
>>      Updated the changelog.
>>
>> v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
>>      kernel_modes.
>> ---
>>   Documentation/filesystems/resctrl.rst |  30 +++++
>>   fs/resctrl/rdtgroup.c                 | 151 +++++++++++++++++++++++++-
>>   2 files changed, 179 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 5a13814d1325..4a2bdd74d4aa 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -676,6 +676,36 @@ All groups contain the following files:
>>   "cpus_list":
>>   	Just like "cpus", only using ranges of CPUs instead of bitmasks.
>>   
>> +"kmode_cpus":
>> +	Visible only on the rdtgroup currently bound to the active kernel
> 
> "Visible" -> "Accessible"?
> "on" -> "within"?
> 
> rdtgroup -> "resource group"
> bound -> "assigned"

Sure.

> 
>> +	mode (see "info/kernel_mode"); hidden on every other rdtgroup,
>> +	including when "inherit_ctrl_and_mon" is active.
> 
> No need to mention that it is hidden in other groups.

ok

> 
>> +
>> +	Bitmask of the logical CPUs scoped for this group's kernel-mode
> 
> What does the "scoped" distinction mean?

"assigned"

> 
>> +	binding.  At bind time through info/kernel_mode, every currently
> 
> What is "bind time"? Could "bind time through" be replaced with "assigned via"?
> Can "assign" be used instead of "bind" throughout this text?

Sure.

> 
>> +	online CPU is included in the scope.  CPUs that come online later
>> +	are automatically added to the scope and programmed with the binding.
> 
> I do not think "scope" is the right term here.

ack

> 
>> +
>> +	Writing a mask reprograms the binding incrementally: it enables on
> 
> I interpret "incrementally" as the write _adds_ the new CPUs to the mask, which
> is not what the implementation does.

Will change it.

> 
>> +	the CPUs newly added by the write and disables on the CPUs dropped
>> +	from the previous mask.  An empty mask disables the binding on all
>> +	CPUs in the current scope.  The mask must contain only online CPUs;
> 
> "CPUs in the current scope" what does "in the current scope" refer to?

Will change it to "assigned"

> 
>> +	masks naming offline CPUs are rejected.
>> +	Errors are reported in "info/last_cmd_status".  Example::
>> +
>> +	  # mkdir ctrl1
>> +	  # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
>> +	        > info/kernel_mode
>> +	  # echo 0-3 > ctrl1/kmode_cpus_list
>> +	  # cat ctrl1/kmode_cpus
>> +	  f
>> +	  # cat ctrl1/kmode_cpus_list
>> +	  0-3
>> +
>> +"kmode_cpus_list":
>> +	Just like "kmode_cpus", only using ranges of CPUs instead of bitmasks.
>> +	Writable with the same semantics and restrictions as "kmode_cpus".
>> +
>>   
>>   When control is enabled all CTRL_MON groups will also contain:
>>   
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 7b06c3b3f00e..8ecd107368b3 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -423,6 +423,151 @@ static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +/**
>> + * kmode_cpus_write() - Update @rdtgrp's kmode_cpu_mask from @newmask
>> + * @rdtgrp:	Resctrl group whose kmode_cpu_mask is being updated.
>> + * @kmode:	Kernel-mode policy currently active on @rdtgrp.
>> + * @newmask:	Set of online CPUs scoped for @rdtgrp's kernel-mode binding.
>> + * @tmpmask:	Caller-allocated scratch cpumask used to compute the
>> + *		incremental enable/disable deltas; contents on entry are
>> + *		ignored and on return are unspecified.
> 
> ah - this is where "incremental" comes from. I think this is an implementation
> detail that should be invisible to user space.

Ok. Will change.

> 
>> + *
>> + * Compute the difference between @rdtgrp->kmode_cpu_mask and @newmask
>> + * and call resctrl_arch_configure_kmode() only on the CPUs whose enable
>> + * state actually changes:
>> + *
>> + *   - disable on (old & ~new)
>> + *   - enable on (new & ~old)
>> + *
>> + * Then copy @newmask into @rdtgrp->kmode_cpu_mask so subsequent
>> + * show/write operations reflect the updated scope.
> 
> This can be seen from the code.

ack.

> 
>> + */
>> +static void kmode_cpus_write(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode,
>> +			     cpumask_var_t newmask, cpumask_var_t tmpmask)
>> +{
>> +	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
>> +	u32 closid, rmid;
>> +
>> +	closid = rdtgrp->closid;
>> +	rmid = rdtgrp->mon.rmid;
>> +
>> +	/* CPUs dropped from this group: old & ~newmask. */
>> +	cpumask_andnot(tmpmask, &rdtgrp->kmode_cpu_mask, newmask);
>> +	if (!cpumask_empty(tmpmask))
>> +		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, false);
>> +
>> +	/* CPUs newly added: newmask & ~old. */
>> +	cpumask_andnot(tmpmask, newmask, &rdtgrp->kmode_cpu_mask);
>> +	if (!cpumask_empty(tmpmask))
>> +		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, true);
>> +
>> +	cpumask_copy(&rdtgrp->kmode_cpu_mask, newmask);
>> +}
>> +
>> +/**
>> + * rdtgroup_kmode_cpus_write() - Sysfs write handler for kmode_cpus[_list]
>> + * @of:		kernfs open file (selects bitmap vs range-list parsing via
>> + *		is_cpu_list()).
>> + * @buf:	NUL-terminated input from userspace.
>> + * @nbytes:	Length of @buf, returned on success.
>> + * @off:	File offset (unused).
>> + *
>> + * Parses @buf into a cpumask and rejects:
>> + *   - pseudo-locked / pseudo-lock-setup groups,
>> + *   - writes when INHERIT_CTRL_AND_MON is active or to a group other than
>> + *     resctrl_kcfg.k_rdtgrp (stale fds opened before an info/kernel_mode
>> + *     change),
>> + *   - malformed input,
>> + *   - masks containing offline CPUs.
> 
> This just describes the code and seems unnecessarry.

ok. will remove.

> 
> 
>> + *
>> + * Validated masks are passed to kmode_cpus_write() to update
>> + * @rdtgrp->kmode_cpu_mask and reprogram hardware incrementally.
>> + * Errors are reported in last_cmd_status.
>> + *
>> + * Return: @nbytes on success, -ENOENT if the group has been deleted,
>> + * -EINVAL for pseudo-locked or pseudo-lock-setup groups, malformed input, or
>> + * offline CPUs in the requested mask, -EBUSY if INHERIT_CTRL_AND_MON is active
>> + * or the group is not resctrl_kcfg.k_rdtgrp, and -ENOMEM if the scratch
>> + * cpumasks cannot be allocated.
>> + */
>> +static ssize_t rdtgroup_kmode_cpus_write(struct kernfs_open_file *of,
>> +					 char *buf, size_t nbytes, loff_t off)
>> +{
>> +	cpumask_var_t tmpmask, newmask;
>> +	struct rdtgroup *rdtgrp;
>> +	int ret;
>> +
>> +	if (!buf)
>> +		return -EINVAL;
>> +
>> +	if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
>> +		return -ENOMEM;
>> +	if (!zalloc_cpumask_var(&newmask, GFP_KERNEL)) {
>> +		free_cpumask_var(tmpmask);
>> +		return -ENOMEM;
>> +	}
> 
> Please see related recent changes to resctrl:
> commit 242c0ab4d51d ("fs/resctrl: Change last_cmd_status custom during input parsing")
> 
> For comparison you can view latest
> implementation of rdtgroup_cpus_write().

Ok. Will look into it.

> 
>> +
>> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>> +	if (!rdtgrp) {
>> +		ret = -ENOENT;
>> +		goto unlock;
>> +	}
>> +
>> +	rdt_last_cmd_clear();
> 
> rdtgroup_kn_lock_live() now calls rdt_last_cmd_clear().

Yes. Will update.

> 
>> +
>> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>> +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>> +		ret = -EINVAL;
>> +		rdt_last_cmd_puts("Pseudo-locked group cannot host kernel-mode binding\n");
>> +		goto unlock;
>> +	}
> 
> Similar to previous comment I believe this sprinkling of pseudo-locked mode
> checks can be avoided by ensuring that (a) a pseudo-locked/locksetup group
> cannot be assigned to a kernel mode, and (b) a group assigned to a kernel mode
> cannot have its mode changed.

ack.

> 
> In this case then resctrl_kmode_cfg::k_rdtgroup can never be a pseudo-locked group
> and the if (resctrl_kcfg.k_rdtgrp != rdtgrp) check below would be sufficient?

Yes.

> 
>> +
>> +	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON) {
>> +		ret = -EBUSY;
>> +		rdt_last_cmd_puts("No active kernel-mode binding\n");
> 
> I do not know where this "binding" term came from and all of a sudden it is
> everywhere. The inconsistent constantly changing terms used in this series makes
> it difficult to follow.

Yes. Will change it to "assigned"

> 
>> +		goto unlock;
>> +	}
>> +
>> +	/*
>> +	 * The visibility layer (kernfs_show()) prevents fresh open() on a
> 
> Visibility layer? Another new term. After this introduction it is the only
> instance of this term in all kernel source.

Will remove this. Let me rewrite the comment.

Thanks
Babu

