Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC613148D3;
	Mon, 22 Jun 2026 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146327; cv=fail; b=fZBoXrAuAGvKUS2iSrdBDA4htsae3DbX/Io39U9PLgjRSBx+/A6Lyuz7hZAeHR2zD6KASIURxFQERygKI/AwZj5YU+/1clWGmVFK/bXcMiYLE5BpLxtYHqR9Ff1s9t5jUlWt1Ynptkzo6XiVuQwDCaThWeG5vMxLkCqqF+afnU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146327; c=relaxed/simple;
	bh=xPnDph3mZIH16tPMLNgs9dvJ2tUfYEs/rdr66C2xKQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q/ZfzUCSsaePATFD4Z7K3n2+ZbgSyPGlvItNab+ACOeyttg5QaPTNaxUwcS2KwJ89nunpnX5CjPXYUtR/TD9s7UWEp5wJ/Pbelm3KlLAMhUI21ssULFmRTyTG3cdLisEqYjQEmWMZtNhHhvsQHZEAhtMlmc5pn5als/+KPvVW2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uwwF0xst; arc=fail smtp.client-ip=52.101.52.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uwwF0xst"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQBM43lCPCiWRVidoARpaKFKMCbnc5Tr9ri7rDQvsU+154ruRwMN4vbFtrzNDEwLR0BeorRWyOCl5LJUNwvnT8ExcbSf2H0eV7V74EuSG3FGH9FVmTfzMU3fD2le+EFjQEfjPYWcW8ZpNv77juzTyO7KkQspB8rfNABvfP+R0PGhWIicvVIzeMuQv6n5iI16EuSs/rue17xo24vNpxTyyQTJMjxCRRsFe7NEtcr2e7awhV1+5RiNDh2FKcdDljG10ZuFLIb1YAzV8XTvUopwgy/q+dA0LL+RtafkQehvNo9yXTpjH/6MC5nlStrb+oHCu9My2cOcbyT3zZQFjMh7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJOhOf5Fa61WwzftQbkJYLp0M1wsjMrUnIKdXjdpeHo=;
 b=KRKITUNcQ7eUNtWQjaKq5s4rHTR+O1TorpGw7cbZI4mQxft65ShsDTX6vGQH99cA0TnewrY8uDqIhple/VN+TYS2W8GtxiejYIndwugiux2RqMmDEq03U8mMAp3DmP/UQ2B5tbwGvS9hLL6dSA5OfalLMsQjsf4OgUpP0FeKCiMsfg9omuoX6wMwHDg3jxxf+cDhHWNuu5fGpLKsXnWHk66Coz/r73zIyXVkxKu1xgVJcdNib6hD20mFtnmJWNzVvKQ2eHbnikCvEXDWKBpUWzV1qEkwouwY5aIxxYMlQz88QyU6uiNJV7XUAIetbgblO9PJRKjGI/9wWLC7tK/Uvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJOhOf5Fa61WwzftQbkJYLp0M1wsjMrUnIKdXjdpeHo=;
 b=uwwF0xstR/xP6su9FjSnOL/FD12VCMJFc+hTJZK1fZvkVFdY7Y919IQtBTHvt/cdqBTPIkchu93pPeB/8C0BWdkWcgacatLnAW9aLrhEYbuagXW3ZXKgcdnsHTG7HR0yDXhEUrya5eU5FKEAmbkLfoZVFmQCl/H0hvYZmVkK+3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Mon, 22 Jun
 2026 16:38:35 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 16:38:35 +0000
Message-ID: <98054b24-b7d6-4ef1-a6c0-c407292d4fa1@amd.com>
Date: Mon, 22 Jun 2026 11:38:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] fs/resctrl: Initialize the global kernel-mode
 policy at subsystem init
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
 pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 lirongqing@baidu.com, paulmck@kernel.org, bhelgaas@google.com,
 seanjc@google.com, alexandre.chartre@oracle.com, yazen.ghannam@amd.com,
 peterz@infradead.org, chang.seok.bae@intel.com, kim.phillips@amd.com,
 xin@zytor.com, naveen@kernel.org, thomas.lendacky@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <38f794ae4076a3c118e8eda08ae2bc1e69eba979.1777591497.git.babu.moger@amd.com>
 <ffa4f5c5-9512-41fc-9354-803a182a85cd@intel.com>
 <416d685f-9e76-415a-bbb0-fc89f87827d9@amd.com>
 <737a4228-52fb-4583-ac64-8efe79c107e6@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <737a4228-52fb-4583-ac64-8efe79c107e6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::14) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MN0PR12MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 61722841-8181-41b6-5ac4-08ded07cb447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	iwi7JANjCMI4e+amNvl8E52RMRgmBMmbWlLwCWnb4GOPruFFxteHdmJOOmbWDHJIHhFQeKe0NuCqn8nFUWlqyZhkhCcARyxrDSEPTUJhjjDgqnc3vjnGQeBjL0rzm79VbpS8bS2dyZ/sGE1eq6zJfJO4+QbKUcYuf4iptIT6MS7axjlbwJEL4Gqppe0M5OH5UAaU6DEVJXB7iNVHxO307m+LwXZwDT4/0ksvTpgzLstS4P8/YgFUEPW4rYZjznuKBLO1YrEPVvpRD/yLqf03i3of/kJEk9eUvD6DPyb+8gxPzGUcTRdtxzli9LyDQGvqd+S5nuYP+flmN6GwU2LG/wM0fa/JUWuTnY2aaQMFqEe3W5mZQwM3mCo7SFfq3bYbrtPjQT5NSdXS90NfiXzD2BQUCw9d8/4BoimnXmakanOv5rbQULduXkI1y7ULqHE7pI6Uh7gWaygaXimP2BM4tfmfxUpGYJKY/3pFriB6CLCNorZnJq678F9pHM92M6kkd1xALqwTWiEm1AEHsv/e9obq9NCk/ZJ3fUqSvQ5/lTIdpS0IZmr8YK22iiAxqB8d+X0DvaRZNn4nGnfLWp01kJB/iVvbVG7XEjS+scapWSJAEhMbYwGmCQSgW+22xssqS46Lo4lxoYj1Tp2GsixXbJxdL5kkDhpUwMeu/6lSs7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHJuZGxhSnBRV3VVaDZxbjNubmxIdENvUDBsMHVGcm5UeHhTUEZobzl0QkN3?=
 =?utf-8?B?QTA1M2FmVG9GekFCTDlhRmpaeE5LY3psVHlRZ1VJcUdKWG82WEhoYUVuWVRq?=
 =?utf-8?B?clliUU5paThtZS9nazRWMUhQQ3oySUxiT2FjYng1N2c3V1g4Z1B2UUlTb2dU?=
 =?utf-8?B?MEhGRkJhdDNuQWJHUjBnM0hKYUpST1Z5eDFUQXZBRWZYOWF0MU5sbHIvS0pS?=
 =?utf-8?B?aFI2RmZYWWd4eGFHdUE4WjV1NENiclpaWGp2c0pkbFJBdEUyekZRZlNkemFS?=
 =?utf-8?B?SXNxVXJsNE1lNnV5Q1FsOWlQakFPNzJXWkVYMEQ5NjhUeGtSemxZdUNISXhJ?=
 =?utf-8?B?WCs2QWRTdDNRZmtuQU8xZlJwUHIwMFRwd3UrQzRDQ2VLcnUrUkZvWE5Qcmpl?=
 =?utf-8?B?dW0xY0RIY1NEMFhGRlRiLzVsK1dDT3RONWx0cWV5Yk9NZFUrTVFPNytiYkpF?=
 =?utf-8?B?cGVjVXdOMDA4bElnWHNLWnM5eTc1MDJqWWFLeC93SExTMEpUZWNvanRMQ0ha?=
 =?utf-8?B?RlFYSmVwR3NweVJNR1IyWStHa0MwUkhHd2p0VTRYUHpjMG1JMUxYaHk5a2pK?=
 =?utf-8?B?b2RYSFRtaUFJMEMrNEZwRHJrSkpMenBXNmZPMGhsSU53eGFUNmhzZG03UDVv?=
 =?utf-8?B?ekRBWEoweXZxejhiWWFOMGVvVkNhMGVuKzh1NWlQYXRmdlUxdVZvb0dxN1hF?=
 =?utf-8?B?NWVoTk1YdjFHRldkY2Z2SkR5b0FlNVlwZDRSclI4clc5TkpvdjZrQ1NCU3E2?=
 =?utf-8?B?NURITkdGMlFOa2paVjhjeFdCdWQ2YWxHNFRVT0hwQk9oOGlJT3cyS3BUOWF4?=
 =?utf-8?B?aytPbitxYVhubWtMbEw3bmtOeEhLODdqcUtIS3o1aUFpcmJOL3VHaEVla1h2?=
 =?utf-8?B?ZGlhNGI1RFlNUGdyQU5hd2J6L284VTQ5R3QxbWd6L3hoK1VNaVl4UkM0SUs4?=
 =?utf-8?B?TjUwK2RYTFgrN0tFTXdOY2hFSlh3UUpjYXFubmI2aGo0Vmhqb3huaXFkYms2?=
 =?utf-8?B?cnlLK0NnekVrMWFGUWdaZnlZTllHRk1lQVl0Ny96dEVpTVdabDNWQkwxZmRY?=
 =?utf-8?B?ZW1VYXB1TEdPcjZZaU5SK3dyOXBkbm1KdFY2d2pmcEhuL2NaQzRoQVgvMkRG?=
 =?utf-8?B?RGV0OWQwd2dCUVJXTE9lNmx4OUllMThFclJia3lnb0hkZ2xWcFozQXpHa3hh?=
 =?utf-8?B?bDBRUk9MUW12UUlkVFhjYmcraldDSk9Nclg0Z0NwLy9WanR4cDBSanBuYTBE?=
 =?utf-8?B?OWdJalk1eTZxMmhLQ0xsSzdDV0lLbWtJTWI3dUZOSUVWN2hqcUkwWG9CTTJD?=
 =?utf-8?B?R0tyRzdkSGd3N3hkOFV6V3VrdHE4WTJ4OTFkaEFNNHpUOFROWW40UDA4YUFP?=
 =?utf-8?B?VWRzekJyV0xyQVVYSm52WWd3ZUlnQkQrZnlPYU5SRDB2QkpKOWwwVXVHSVZJ?=
 =?utf-8?B?c3FzamYrTERoVnlZQkNiVE9aaitMSEk3WDRUQ3BCNXNKRmR0ZjM1YVRPVi9W?=
 =?utf-8?B?aVNYY3hWeHBZMmtoNnE0dTRRNXNHMTFyK3RDYzZqZi9NdkVLTkwvdGlGYmZy?=
 =?utf-8?B?Q1hTeXRUcTUzUnd2N2QxTDR1aDRwUS80bVFtYXFjQWtiam1XckxkbEpjNDR0?=
 =?utf-8?B?bnNVSklHeHVlZFZ1cmN0VkFUdXlUQktXWmpDMllvL3J4dmxUTkVjMGEvdUs1?=
 =?utf-8?B?Y1NVUlp0WkY2alVwZSttcmFOVVJKSjJweEs2LzNCUW5ydEVVWWFDbzQ5Y3JP?=
 =?utf-8?B?UFZCMnVzSVpvT285YXVrUHJjUFpQYy9Ea0VoTWZMWklQek5mWTJTVVhOQTg1?=
 =?utf-8?B?bW5HVW41QlRCWWVvTjJ2a1U1VWRmMEpNZ0pwMFNpbysxMzFobi9FM1FVNFpm?=
 =?utf-8?B?ak5zLzUzZ09IU2s3OTM4UUtiaXJhZllwNFMwS0VzY3cwQUJ4NTI0MkttTDhS?=
 =?utf-8?B?bHRGek92UFNySWdvSUQyaXVOMkRlMThKSkhIWjRJczFHcEVHZUoxUnJhbG9B?=
 =?utf-8?B?U2tuU295aVVPS0xWRW9aODVmbDFLRnRibno3c20wSFBvdlg3WXJ6MjZUR0t3?=
 =?utf-8?B?ZkJvZ2lUTEU4RzhIUXY1V2wveW4wbmJOT1hzRVhxWHBQeTIwQ3lKenNaWUtv?=
 =?utf-8?B?bnJ2NDhHNFBRV085UXdUbk5seUNqR2dlNVJ0TkhUSXNHanhWWEVhMDB5ckVo?=
 =?utf-8?B?NXJheEd6R09WeDd6NFBkMXJNNnNsQVZmem5OeEc1T0Q2UEhuakNwWElUeTk5?=
 =?utf-8?B?eE5MZFg2bEdCTktiWTdDRnVySFdCWW5tdWppMEtBMUFwY3JHUWc4YUZhMHhp?=
 =?utf-8?Q?2QHgejeh1aS3j2TO/Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61722841-8181-41b6-5ac4-08ded07cb447
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 16:38:35.3848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDLadGfoOWDHNhL8rbUBU/3gor9Gmv7lL/19Mvk/VUdWSpCSB9+a1o5AVtEQ0IQn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367

Hi Reinette,

On 6/22/26 11:21, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/18/26 10:14 AM, Babu Moger wrote:
>> On 6/16/26 18:36, Reinette Chatre wrote:
>>> On 4/30/26 4:24 PM, Babu Moger wrote:
>   
>>>
>>>>     - calls resctrl_arch_get_kmode_support() so each architecture ORs
>>>>       BIT(<mode>) into kmode for the policies its hardware supports
>>>>       (on x86, AMD PLZA contributes the two global-assign modes).
>>>>
>>>> resctrl_kmode_init() runs from resctrl_init() once the default group
>>>
>>> resctrl_kmode_init() can be dropped after changes described in response
>>> to previous patch. Apart from no longer being necessary I also find that
>>> having the kernel mode fully initialized *before* the hotplug handlers run
>>> to be simpler.
>>
>> That means resctrl_set_kmode_support() will be called from the architecture layer, likely from core.c within get_rdt_alloc_resources().
>>
>> The resctrl_set_kmode_support() handler would need to initialize both the default mode and all supported modes.
> 
> I see this differently. Since resctrl_set_kmode_support() is optional for an architecture
> resctrl fs can just statically initialize the defaults. resctrl_set_kmode_support() would
> expand the defaults to also accommodate what the architecture supports.
>
Yes. We can do that.

thanks
Babu
