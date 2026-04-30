Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D22398918;
	Thu, 30 Apr 2026 23:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590295; cv=fail; b=bYRfEdYlkTWlkEVsnC3O4mdlhBVlFIgplHZzbfy3FyY+hKKDM7ODGs5t/c+4mxiJJyhfpJ+Xs5qEq29pBueU0iNgxy9J8fnkEz6S93Tpr1ZecvBLY5QDcDjNHT4cRYYwT69aljhUDQz27DU5JjLn+up97Z4RZafPAL8U41MFTVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590295; c=relaxed/simple;
	bh=QR/DlXwGmHLZ/tVRl6gEWvtTDEeRqOmbqfOmMt/XgSc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uCjGTI/C7tAeJqhb1hY6mDvRcaGBpNl2ANI0QTizYLax7KyGz/4z9KxbdA20wm+7llyXsqh2xTwQwHST4Oxu30NqHGJ08KANZevDWSpp5o3FrHQ9hgpuL+DePszhUYfL8VsggdS9fQH90XQZpTrK+fvHTKb9G9sQEVhxafj0j6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qi33MI2V; arc=fail smtp.client-ip=40.93.198.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qi33MI2V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nfr8cbQssAG6Zrjht2TNbIIw+EUumTFP1cINyoW1g9BnyVWJ2pDDeiOV1DFRlM6JT2iLztXmCEOGO7RaSVKT5cxOC1bcuoh+XFVhY9Vd5moAq6UJ7Tiox3OGzl3BN26pS+TrfP0FN5KvrrTFuQtgjHlytm+lb+qtWUgNWZbYsoZO68cMZEjwnn/MwNpkQ3BKpvI2b8DEiL+5zr/vCSQ+jIRHKAXLGJb2dv2fsqxEJzHwvOoVc9N1VhxVCBINxbNsHeJE2IIsSgNSzliJyDTaq2rFQZgoG+R4w+4ZgJyMheP6Lx9YpFGfJWr85wzw8lEWCepzjr++lnj9mfQg4NC3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS3L0d1WARak6tx5MohMnpf/P9KepRVAn0dP8dSDZFA=;
 b=QYg0aJCSJnJDwVaXKE6b1MTx8P+t2wmWsHa0RYLzaXuvOA7XpYnadi0MYNjp55md6eIIg5REPVDVBQ6Q42sgKKekqvCNFuOz9Kn03IujAPaG6FAvdJrNhThlZSOG+e72KnxPmmycHAiyROD4yHgMyqAejnDx7QSwE00cXWh/ctt37mAA1Ghn5k4gtZerho95Y5cbXzKicVGTtgw584LaFg4NAGVq4qU6S3XCxZ7M19UoQd++qOKVWYhVXTBXsATIvFYegIEIiwXs3cdnVXaihYvSEEjUUFTNV01e9xNYSy8OyUjakxGwdRTe2t05LnC6WQ3zr2gwytPTy8qk+WSvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS3L0d1WARak6tx5MohMnpf/P9KepRVAn0dP8dSDZFA=;
 b=qi33MI2VOz0kqmdeI4W/YCRKg9gITHE3adc/PLCPUGSfyQURy3+1NzIaN9wDFU2Rc8456NL6xKcEzxtpZU0O1DtKh1vPtJEcIarM2q2KNHLKhzvUkhHoFUl9o6YlQ1L8bDgvFCc47CvPrwPqb90cdTFsJz7IB1bYPjxsyjODe14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PPFA3734E4BA.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::65c) by MW9PR12MB999207.namprd12.prod.outlook.com
 (2603:10b6:303:301::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 30 Apr
 2026 23:04:51 +0000
Received: from DS5PPFA3734E4BA.namprd12.prod.outlook.com
 ([fe80::d03f:ffac:bea5:143c]) by DS5PPFA3734E4BA.namprd12.prod.outlook.com
 ([fe80::d03f:ffac:bea5:143c%6]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 23:04:51 +0000
Message-ID: <797e863c-211b-46b8-b404-de53f8453527@amd.com>
Date: Thu, 30 Apr 2026 18:04:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x86/resctrl: Support for AMD Global (Slow) Memory
 Bandwidth Allocation
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, Dave.Martin@arm.com,
 james.morse@arm.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, dapeng1.mi@linux.intel.com, kees@kernel.org,
 elver@google.com, lirongqing@baidu.com, ebiggers@kernel.org,
 paulmck@kernel.org, seanjc@google.com, pawan.kumar.gupta@linux.intel.com,
 nikunj@amd.com, yazen.ghannam@amd.com, peterz@infradead.org,
 chang.seok.bae@intel.com, kim.phillips@amd.com, thomas.lendacky@amd.com,
 naveen@kernel.org, elena.reshetova@intel.com, xin@zytor.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1776980182.git.babu.moger@amd.com>
 <cb8272dc-4419-45a9-8cb4-110c803e62ee@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <cb8272dc-4419-45a9-8cb4-110c803e62ee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:610:58::14) To DS5PPFA3734E4BA.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::65c)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PPFA3734E4BA:EE_|MW9PR12MB999207:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ee5955-fd62-4a37-1d4f-08dea70ce1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|20046099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NzUzHe9E/JMWSQFTKgg7GXmUTrGAB6uQwN2PFNUHBvEQ0XbZ/mKJFAfEjw1rD1+ytdcHX6SxjnCWNIoZ321mkRzjrunWbsroTv1ZFV8D6CfDGwUP+3wMpv6DzG3PijrBsCNLIMZXyBTt3EPjfKVpyQNzNMYT+TM1OhyCilLKPqT4+GaXoTUZ0gI7N/oMuWkjfKTuUcCZgOaJThG4U9HkOSvTIG5Baz778KALS8wKr2ZW5diuwM2Fz5sQUOHQkPMQDAgKejfCl7KAGU7wCT9hj8qXhlBqskK5hpOXl34HBRg2PjZAqSjoS0CbDPE3XBzw+P9ZVMS7YkRUqse+EbLKR837xP0M8hdGLObfjruwSblqs+b/VNejiPvdX4VLCoARWXnmRmP65GE9LbHQKHZy59Hsn+TGUGFzw9mgxzc5KMCnwGrmaUVsVEKC9LXDas+RrVPSPemXFUXMcyWMKhYEYt2aAN7GL94C/po5Yr0Rcm/5b2bppVIeEyWnZw6kh0/bgslGCUNFAqND9NAuWKyQdWYMt4hoQzeYKsh8hXEDP8k9GMinb6aJAzC9u7E2EXXWfckpksUHoCrPyD5mTJ+zQVrB4bclogUgF4ltMOSZq4bLuw6r8qNgq8fG2mD7CDX975cEeJpXuxRuTClvo5LCWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFA3734E4BA.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(20046099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJEeUNYSmVXSlRGbDd6ODUwaGRHdFJkK1FwQVZsdTdvUjZxOS8xRzJCc0NB?=
 =?utf-8?B?NkJWRDVzZjdndDc5WDAvdTFpUDVQeEtCQ0lWUUpBWVFKTW5aUkNPY0dyZ292?=
 =?utf-8?B?Zng4cnlSNmc5aCt4T1gyUnMvV0FqN0RFYlYrNnhEeEtVYjFlZXg4WWwvbHVt?=
 =?utf-8?B?TGJ4VUQwNWhxRlgzT2pqTnBRUlNKeTBISVRhV3BtQk94TXlHaitYc3NJZC9k?=
 =?utf-8?B?cGMrbElpanJ0K1ZoUVJrVkJuak9vUmdRTzM5NzYxQnJBNmgxS3lPZjQ1azFh?=
 =?utf-8?B?SnFQcGhGT2d2aXR6NkVTWDZxY0tPWVVKbk8xako5OWZwUFBteWxtOHE0Y2tm?=
 =?utf-8?B?bGJVYzJPMTRIN2Fmcm5nbG9td2oyQ3JFUmVVM2xhQW13b2NQbmxOQ1E4OGFM?=
 =?utf-8?B?djBFSGxUSkFiN2ZRQ2dWWEJBVk80akRzTlpHTEQyajZPSmQwNTRyUzlWQm0w?=
 =?utf-8?B?VFZuOGdkcDZmL0grMjEyRFNwTDVldm82bVdtd05vdTl5cEhBZEpVdUVrbUJl?=
 =?utf-8?B?RHY0aitEL1ZZNDVyUW90NDFPdS9BUFVmZzNEUjlWUzBmNnEyS2Q1NU5ibFFM?=
 =?utf-8?B?N044bTdxcE9Ndi9GNkNCbDhLUWR1TXAyOU1ENnJweVVSbjc0MnBhMlNHMWIw?=
 =?utf-8?B?Sm84Ymw4dEJ1Ym12c2JLZFpQeHJHRU5DTVNiajZtVkQ5alJoaU9RaHFkOEhN?=
 =?utf-8?B?Qk5pdlBwSytuNnd6Qk1TQnlsZ3diMml6VG9wdDJoQkVZL0tMUVZBdDlENW4x?=
 =?utf-8?B?cWY5NXBJempmb2dEeUtHK2RuMTlhbkNJV3NkTldnNnh1dkFrKzlEYlpNUFZs?=
 =?utf-8?B?RkZaN2dTQ3RJODczb09WR1QxTmpSQTAxT1J5ZGlXQ3ZLTkJpVktqT3htMW1W?=
 =?utf-8?B?NUJlSTZqOWo3d3V6WUZiNmNsSk5LVURqQWUwcnlZUXZldmt2cUhERTViSGZi?=
 =?utf-8?B?aEJveGhXRXloT0F2NzFNeHB5WHFuRWZWS2NTQXNmVjZndjBNYnUrT0s4RXdB?=
 =?utf-8?B?UDhxcUZqMGxYTmFjK3V2THlPR05LNmdSWnlJVmdtUXNVVy9UMGcwZm5YZFNW?=
 =?utf-8?B?QjNreTBDSlFudlQ5YWFOYWNienlwZC9xQ0ZQNHl1aE8vSkFsUkhGWmNaSmNp?=
 =?utf-8?B?eFE5UnVlUGdGOEFZbVVLdTZCbVhWRWk3K1JmckdXNWcwa09DVEdLN2xMVWsy?=
 =?utf-8?B?aHFtZTFBai9pcGhyek1ZbWJqUGNLWHNKckx3QlJIQmg1VjBZcVgwSlJoQmNr?=
 =?utf-8?B?ZjFPSm1KMHpBdFcxR2ZKN0g4ZmdoR2ZQMXk5ak1GZDlFWnBHNG1XWGVsRUQ3?=
 =?utf-8?B?b3I4Mmp3VWdSSXhvcmtWNU5CYUhLSUFLZUdZQjVFaHAwMWlXcEJmNUJsTGpZ?=
 =?utf-8?B?YS9kTXBFczludWNPMWRtN3lnR0VyU1MzdlN5Z0Z1dWdzSVR4V1gvbFZrOGRP?=
 =?utf-8?B?dThHLzVzYlVMcDdZU1F6NEJCaUlNcHc0MlFoWkF1NktzZTU1d2VGWnhMMXMv?=
 =?utf-8?B?MUhYRmZmOVZDR2RSS3pvU3AxNW0wY0s0SmpNdXN2TEJxcFZuMkMvd0U5K2l5?=
 =?utf-8?B?eno2TUdjVmhMRnVtbjJ1enpQMFZCZ0swZmgySXgyRHF5WFhUZEp3ZWkwaGts?=
 =?utf-8?B?K2Q4QTZYNndNKzFTSjdORG54dlRjQmtNWG4vU1NMa2gyMWZwN2VJcGdVaTRR?=
 =?utf-8?B?UjRWTWE3MThpRU1zMVVtQ3dmOTRwRTNQbDJLa2xaMy9HNjhiZ0ttbHN0VDAv?=
 =?utf-8?B?S1A1QWg3MHpuUXFTNmt5RkFub1pzdnN5NVMrRGhTdEs3MWpnUzU4WkU3VlNK?=
 =?utf-8?B?U1RtN1hEeFJWVHI2Qm1IazhOeDkvenFrQzkwWWQxTjFFaHRvYmtrdmFkeWpS?=
 =?utf-8?B?TldjcXFOSDdYOVBjUDlOVVRKUlc4QmhPTGdqM0M3c0hDdVVmUjIxU29XVlg1?=
 =?utf-8?B?dzFzL2FkbzRtRmkrS1hOSWZ4dlp2LzdhOVNSeEJyaVJpVnI0cDRXbEkzeERD?=
 =?utf-8?B?ZDBueERiUlV4bkR6bHI0QithMGViZDhLWFcvNlRqRFk0Wk56Wm5WMk84dHIz?=
 =?utf-8?B?eFpJUnNXUVRJZVVKbjF2Ti9VWDFoZEdBVDBDZVplRFZpVDh3UmZmM3V1TW5t?=
 =?utf-8?B?cUxXakRSQ045ZzczQm45ZlFPWVlzYUluY29BZU0wTGliNlpUN1BLbVJyNzFW?=
 =?utf-8?B?aXdsNXlsWURXa3pudzRoSGZUM2hHT2daYm05SUdSZzVHSmhkT2Y4UmNrNDVX?=
 =?utf-8?B?N05GcEFWSno3SHIxcHExZWEvN2N0YUhqZ0VDeEVSL2htWUpuZU5ocWx5MTlC?=
 =?utf-8?Q?CDRGDAtiy/UlXfsE9m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ee5955-fd62-4a37-1d4f-08dea70ce1fc
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFA3734E4BA.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:04:50.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTntpoOM2L22lWIdCyojxf2+WDRCfOXfHcbcwqeSyumtrjzvXi+bIAEeMHihtH3p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999207

Hi Reinette,

On 4/29/2026 5:34 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/23/26 6:41 PM, Babu Moger wrote:
>>
>> This series adds resctrl support for two new AMD memory-bandwidth
>> allocation features:
>>
>>    - GMBA  - Global Memory Bandwidth Allocation (hardware name: GLBE).
>>              Bounds DRAM bandwidth for groups of threads that span
>>              multiple L3 QoS domains, rather than being per-L3 like MBA.
>>
>>    - GSMBA - Global Slow Memory Bandwidth Allocation (hardware name:
>>              GLSBE). The CXL.memory / slow-memory counterpart of GMBA,
>>              analogous to how SMBA relates to MBA.
>>
>> Both features share a new "NPS-node" control domain: a set of QoS (L3)
>> domains grouped together and aligned to the system's NPS (Nodes Per
>> Socket) BIOS configuration. Although the control domain is NPS-scoped,
>> the underlying bandwidth-limit MSRs (MSR_IA32_GMBA_BW_BASE 0xc0000600,
>> MSR_IA32_GSMBA_BW_BASE 0xc0000680) are instantiated per L3. Programming
>> a single control domain therefore requires writing the MSR on one CPU
>> per L3 that the domain spans - a new pattern for resctrl. Patches 2/8
>> and 3/8 introduce that infrastructure so the new resources can reuse
>> it.
>>
>> The features are documented in:
>>
>>    AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>>    Publication # 69193 Revision 1.00, Issue Date March 2026
>>
>> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>
>> Series overview
>> ---------------
>>
>> Patches 1-5 to enable GMBA:
>>
>>    1/8  x86,fs/resctrl: Add support for Global Bandwidth Enforcement (GLBE)
>>
>>    2/8  x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS-aligned domains
>>         Add a new ctrl_scope value for resctrl resources whose control
>>         domain spans multiple L3s within an NPS node.
>>
>>    3/8  x86/resctrl: Update control MSRs per L3 for NPS-scoped resources
>>         Add resctrl_arch_update_nps(): builds a cpumask with one CPU per
>>         distinct L3 in the domain, then issues rdt_ctrl_update() via
>>         smp_call_function_many() on that mask. Falls back to the full
>>         domain mask if the scratch masks cannot be built. Route
>>         resctrl_arch_update_domains() and resctrl_arch_reset_all_ctrls()
>>         through this helper when ctrl_scope == RESCTRL_NPS_NODE.
>>
>>    4/8  x86,fs/resctrl: Add the resource for Global Memory Bandwidth Allocation
>>         Register RDT_RESOURCE_GMBA in rdt_resources_all[] with
>>         ctrl_scope=RESCTRL_NPS_NODE and schema_fmt=RANGE, add commands to
>>         discover feature details.
>>
>>    5/8  fs/resctrl: Add the documentation for Global Memory Bandwidth Allocation
>>         Add examples in Documentation/filesystems/resctrl.rst.
>>
>> Patches 6-8 to enable GSMBA in the same shape:
>>
>>    6/8  x86,fs/resctrl: Add support for Global Slow Memory Bandwidth Allocation
>>
>>    7/8  x86,fs/resctrl: Add the resource for Global Slow Memory Bandwidth Allocation
>>         Register RDT_RESOURCE_GSMBA with ctrl_scope=RESCTRL_NPS_NODE.
>>
>>    8/8  fs/resctrl: Add the documentation for Global Slow Memory Bandwidth Allocation
>>         Add examples in Documentation/filesystems/resctrl.rst.
>>
>> Changes since v1
>> ----------------
>>    - Earlier sent RFC(v1) with Global Bandwidth Enforcement (GLBE) and
>>      Privilege Level Zero Association (PLZA). This series only handles
>>      Global Memory Bandwidth Allocation. Both the features are sent separately.
>>
>>    - Documentation
>>        * Fixed grammar in the GMBA / GSMBA sections of resctrl.rst.
>>        * Added examples to update GMBA and GSMBA in resctrl.rst documentation.
>>
>>    - Major changes are releated to RESCTRL_NPS_NODE scope handling.
>>
>>    - Commit messages
>>        * Reworked the changelogs in all the patches.
>>
>> Previous Revisions:
>> v1 : https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/
> 
> What are your expectations from this submission? From what I can tell this ignores
> v1 feedback in several ways:
> - It introduces two new resources, GMBA and GSMBA, when the previous discussion agreed that
>    these are not actually new resources but instead new controls for the existing MBA/SMBA resources.
> - It does not mention or attempt to address dependency on new resource schema descriptions [1]
>    to support user space in understanding how to interact with the new GMBA/GSMBA controls but
>    instead defers that to a snippet in the documentation that user space needs to
>    parse to know this control operates at multiples of 1GB/s.
> 
> Apart from ignoring v1 feedback this new version appears to complicate user interface even more
> since now it is possible for there to be a single control that may operate at different scopes but from
> what I can tell there is nothing that helps user understand whether, for example, domain "0" means
> the whole system or a NUMA node?
> 
> We have discussed several times now how resctrl interface needs to be enhanced to support
> this and other upcoming features from Intel, RISC-V, Arm MPAM, and NVidia. It is thus
> unexpected that this submission ignores all the previous discussions.

I think there may be some misunderstanding on this topic.

Yes, we discussed it earlier. It depends on other requirements 
(region-aware aspects), so I assumed it would be handled by someone with 
full context and addressed as a separate feature. I didn’t have complete 
visibility into all the requirements.

> 
> Since there are so many dependencies on the new schema format support I am prioritizing this
> and created a PoC that I am currently refining and hope to share soon. We can collaborate on this
> to ensure that it provides a good foundation for the GMBA and GSMBA support.

That is good to know. Let me know when you are ready.

Could you please share which parts of the feature (e.g., Part 1, Part 2, 
etc.) you are planning to cover in your PoC?

> 
> Consider what I describe in [2] - even in that response I speculate that a "scope" may be needed and
> this seems to be case. I believe would help this "NPS = 4" scenario. Adding "scope" to what I shared in
> [2] may look like:
> 
> info/
> └── MB/
>      └── resource_schemata/
>          ├── GMB/
>          │   ├── max:4096
>          │   ├── min:1
>          │   ├── resolution:1
>          │   ├── scale:1
>          │   ├── tolerance:0
>          │   ├── type:scalar linear
>          │   ├── scope:NODE
>          │   └── unit:GBps
>          └── MB/
>              ├── max:8192
>              ├── min:1
>              ├── resolution:8
>              ├── scale:1
>              ├── tolerance:0
>              ├── type:scalar linear
>              ├── scope:L3
>              └── unit:GBps
> 
> With a "scope" property of the control user space can know what the domain ID in the
> schemata file refers to. In above example the "GMB" control has "NODE" scope so user space knows
> that a domain ID refers to NUMA node. If the system is "NPS = 4" then the scope could be,
> for example, "SYSTEM" (for the lack of a better term) so that user space knows that "0" means
> entire system. What do you think?

Yes. Sound good to me.

> 
> Also note how the other control properties helps user understand what the schemata file control
> values mean. This is what I expected the GMBA/GSMBA enabling to look like ... and you seemed to
> agree [3] in v1 discussion. What changed?

Again, I was under the impression that this would be handled as a 
separate feature and patch series.

Thanks
Babu
