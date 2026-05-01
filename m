Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3B93A542C;
	Fri,  1 May 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646332; cv=fail; b=oDNNXyK80Th3UlwtMlyHngR/XXuOHno5PtkxWCkXgrLEvf5+Z6/TynRcNVyXMeqwOdrRyTMuI2yZYVsX9fyj9FbexKC4ZzOypvYb05kUH912O0Ks5x8I+2Vh9QtrzGaM2Go4wvP9rpBBMnV84AZEYYZ5VoBG3EvzWuYz7E8AAhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646332; c=relaxed/simple;
	bh=1vLJHbUbW5MjgNdlOveCz4p651dtYiT/xTSsfQwGVNU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Npjkgi6MA7jmeELZsJ0k2rljbmIEldCrkGidrVyoA8NzsE2RFWh1DXSHoBAi/F7WDYkpEYkHCNxoRhZgmP0Pua8+Jo281lnWhrUdJoecoYeXQk1Q2J3AzRQ7Ia81/srUhmlJt1cgHbrcXUICWrPArx85U4owHQKyH+99dr8XAD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kqRm98fq; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kqRm98fq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJdbC088BPk6fq+ZyswdMu/lDMCfg5wnctO/gn/HwrheaHkQAqy9sgvWUFCd57XGC5TMvMtSQfr148+nuJYJ/eUJiw6pn04SA603QqL4hoX0fC0v52y5PCu9c6mTFElwZmbpFKA7Yy4eGWEoFXy6QcJUp48dIaFPHT09ODk4qYUujnVZxQFO0mJ90AS22fuGTCl3n6tyGft5/pwKt0sr71jGiUOWrqA7QIKqdQuItwxptf6rLDNIXA3coEJWCVlrcQFL03AOShWCCQY+hahRur4ufOBhdfCqaIw7seJp5LXV5VNZUo6Zx9cIkUts2mJeCj1rYHFlI4NgTY7jkq8Xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkloTrzSecyRB/XHDbxlUiomhzu3wIo7v+4SSVxEpco=;
 b=k/8jO9uCZg8V7dztza2sq/tFdd3dYZif2iMyGqdyE61LdCIJ1Rkzp029miZ6Hh4OURkwDkXHYwxLY7t2r7fQIt9eCn7LUzvVFBJR7dJED9eIP+QaoHRw0kJq3zZHgTRYivDJ9seUzX3cfgCCUMbGJ0Cu55b7ZqrxB7Jzw4MAg/R0kJkMsOCRWE3oFKIKa7mEYhEn5OskvWrwl8E/yD4GazwBQQJ8ORrAbo7qKL6nbwlgTeSNnmzDGJYKHkB/M5+IVAIT3nJgFKC0RogRaTIxbWzYQJXFO93hrMB5spSqrPsm8sTZTMUGT/Q2vQ3UixIPHfVHilpNE3Kq1P9Dawkbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkloTrzSecyRB/XHDbxlUiomhzu3wIo7v+4SSVxEpco=;
 b=kqRm98fqAJeRkCzgxcjPVRIARlU4OTd9ZnRneNSGUQv0J6IhsXlpfDDGQxdrVyJy0Qbi9JC9dl+IAJ+pXbWU3cLP/0vcXYbgAz9LGGP8pLVk0dSPNtGf/V4ppPb4T5iLqDFsdCPwFKz2DK7/fVwh+MrKgoU5r6zryWWQ21aFaf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PPFA3734E4BA.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::65c) by MN6PR12MB8592.namprd12.prod.outlook.com
 (2603:10b6:208:478::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 14:38:47 +0000
Received: from DS5PPFA3734E4BA.namprd12.prod.outlook.com
 ([fe80::d03f:ffac:bea5:143c]) by DS5PPFA3734E4BA.namprd12.prod.outlook.com
 ([fe80::d03f:ffac:bea5:143c%6]) with mapi id 15.20.9846.025; Fri, 1 May 2026
 14:38:46 +0000
Message-ID: <3bc59b3e-4506-4489-a424-6e7f91232af1@amd.com>
Date: Fri, 1 May 2026 09:38:43 -0500
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
 <797e863c-211b-46b8-b404-de53f8453527@amd.com>
 <8939476b-1e1b-4aed-88a3-5b8764a63030@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <8939476b-1e1b-4aed-88a3-5b8764a63030@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P220CA0047.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::15) To DS5PPFA3734E4BA.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::65c)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PPFA3734E4BA:EE_|MN6PR12MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cfc17f-9628-4462-365a-08dea78f59e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|20046099003|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SBeOnUi7Ae+06h3DbJemjrGRELLyEfFreGiDKMHiS317MreCNyXECxtxgiHLmnoszgkSZNqNmUlxDWW9g7B6GTlkX5Sl8Ehln0f6XGy6KqCr8Yhq5TqPhlKhl+kEllIFy9IfCmpzqBHm5fEQNs6MzK/oN9lmZp16cLKkw22YVZEibhFEumTN7qYQwom3i+fK0lbVPCvJLiAp3MuRUBKVei9Oh8z3AoFMqDi1gV43is2JnJL6lxIJX6WExDmRuCdNZ1QQExk1huKWlwDfKN/gp2tn14LptVQ3gROF64Yi3BDApBMs5O/LE4jObPFNYBNi+F71L8KTGNLsn1WLC9VgoVBBvbbClgaCg5nI25nyatz0mQDz1Ac+HQiXw+KGNYIusBZcSLJF9fcRupkaXExTA/JbZ0ztaNVxPBy4Elu3rl4SEgTB3q+/Ovc+AGFxXLY0AMsAtUZDzOaMZSgqTnmjAH7/f62edPhFYWiWJBbknga1XpKnYPd0G7/2y1JLOW2UcEKVQ4n+nurSHHxui/ZlpNzW5Wz5lBm4v9GAgNVtRfl27vShuFecPmfP7tsBYwbmdcJ6pQMuvJAa2b3FwTS5PtYhtcULHqlEnUSgb8Tbt9C0mKhlCzKjVEshxc1bSyxqIWxxx/MPMAWXLEIppFNI4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFA3734E4BA.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(20046099003)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NldKUzlVcm9nbW1LbUhxVXpsY25lR2s1YkNiU3ZHTTVDY2tQaXZZVnRlRkp5?=
 =?utf-8?B?TUp1YVUweUJrOHNwb29TN09CLzBZTFNnemw3bnFvd3ZrZ2l1MVo0NXQ0dHZX?=
 =?utf-8?B?OEgyV1N5bWZ2UXk3MlNpZXp3Nzg0Tkgwc0VJR1RrVjdBeUFySWdMZndMcnpy?=
 =?utf-8?B?MlZjbWc5cmVEWTBGRkt6bW1iSEg2RlI2OTVLV3dCTldKTXgxTU9oR21McEdP?=
 =?utf-8?B?dXhDNi9wS2pRY3lwbTZMN05iL1V3aS9KWW10T0lvb0llU1JHS2RESG9aQW5B?=
 =?utf-8?B?WnhNdzRZQ3ZVZkU4MnZRZk5WbVM3YlUrWllpOTF2QzZDQ0VVMUcxRFBnU2NG?=
 =?utf-8?B?a3dxZHpRNENTZEpPcDJYandDNnB4VXZQdmlGeEtZN2ZpR29jRk9uWmFmblcy?=
 =?utf-8?B?cnhDRi9YOURiNmNXeW16QzAzWHlTcFEvTVdZZ1p0bWhkMVdDeWFtbjh1dDQ1?=
 =?utf-8?B?QWJnOGlicWdhMVBjcXpjTHMrMmVDN09LNmlDc3VwMWw3S0xheWxRRGNkOFZ3?=
 =?utf-8?B?YUR2YllaY0tPU1RTY3Vwd2h6blpwYUt1Q0JWSUR6S3dwRUszM0w0aHhSZXZ2?=
 =?utf-8?B?R2NQdFBzYVZEemNhZHg4K3E5VWZyRHJXeDgwcmdiYUZzMGZja3JtQnZMNWRG?=
 =?utf-8?B?UXdONzhpNlN6QXkzN09ob0hHbWRwby9NYkMwblg0NzJWNS8zTU8xZFlCcEkx?=
 =?utf-8?B?NmJmSnFYZUpGZURNR2Vtdllod0VmN3MxYzg4Y0srbFVNNVBBelhiRVpUQ05R?=
 =?utf-8?B?Rk83TkdaTndTa1E1WWd1TjR4RnAySE9va3IwZUIwMk5aMlJTZHpQNmtmYWVN?=
 =?utf-8?B?N2NwSTRzM0RhTnVTaC9pS0wvYVBpN0IvcUt1eFdxaW4xbWFvSU5pZVJrbTBq?=
 =?utf-8?B?ZXJRNm13NEFBcjArM2VJaWxaMWNOUlEveEtLS2REVlh2RWhlMW1NRUxWN2Mr?=
 =?utf-8?B?Y1EyWDd2NHVva0NRL2plL3IxSUJ0a21pVEtQRmc0cHJORENUaU1wQXpVd0Jr?=
 =?utf-8?B?bmRidmhTMFpDN3FWQzI2aUpIVzVEd1BISEplenR2RlYwMVlacHRUU3FjU0h5?=
 =?utf-8?B?bElxcHd6V2tTdExaZ1FIOXg0c1RMMWdkNGxUZ1hzM3BoMFNPc0MxamljK0gr?=
 =?utf-8?B?ckdzSmNvaWJ2S2dNdHJSbFd0Q0lSaVBTY21FbEwwWnYwQk9zemgrSVZVKzlh?=
 =?utf-8?B?UHJBYmpPMy83R2l1bkdITnJ5T0UyMVdFS0gybWpjd1huSW15bTZvN242aXNu?=
 =?utf-8?B?ME04R1ppM2hHZWo4RktyVWN6a1dxOExyNVYyR09rd3AxM2tRL0xPSmJaZWZZ?=
 =?utf-8?B?RkdqaXRYcml2RWNnYlloVXJVQ0E2RkFlUjBpbEN0NC96ZFcvYm5yYll1K1hW?=
 =?utf-8?B?QW1OVmJuSTVETWpTS1F6L1ZOZ3drSFlqMGdrNEpnZzQrUmJqeFgrcFpDNENy?=
 =?utf-8?B?OEZLU1hFREpvSEo2RE9GbUx4bXNDODc5Zk1kbzExSHNUeHFBZ3JxNmpPM2s1?=
 =?utf-8?B?Y29wZiswZWY5UCtVRkN0UXV3aTRXRXBzZzFRRDMySVMzaDk0NlBENWpXTkdu?=
 =?utf-8?B?ajRoVkZ4Q0lJcTZMS0pQajJCb3F0Q3h3U2VXQWFjZkg3bytyYUVIb0hGQzJL?=
 =?utf-8?B?SXd5dHhjTmZZSzltekNsKzdKU3lvdDFsUWJtUERJRXVCQ3MxTVRBZlNVVkg1?=
 =?utf-8?B?WHA5R3ptNGhRUjZrOTd1MzYwUEp1MHRRQkE4RGIwL2NZcmVZQzZzN2psVG96?=
 =?utf-8?B?QUNFTmU1T0RlOGl6VkZmVXBEN1pIczlwRG1OaVIyaExEaCtNblFZdmNpYnhu?=
 =?utf-8?B?Q2ZuVmhWdU1rNzNGRTlKSFhibTZXREw0S1VHSkJ2QVJYU1FCZUVxdjZjNXl4?=
 =?utf-8?B?RkRJa01uTEVXdkFLUmdYMUlLeWVZQU9BL3lvVC84TjljWHFVdURNUFNSNXFt?=
 =?utf-8?B?Skd2SW1XVTJnTE1CTlJkQlN4T1RXR1JYcGF2VW0zRlUzMVAwelo0RFhrWVNR?=
 =?utf-8?B?Z0ZVaUMvdTlIQ0xrQUxmdngyNC93VFU1QVJxRURhNkhQa2FVVVlZV3UrTnB1?=
 =?utf-8?B?TFRPT0NlaHQ2SUxEdHlmZVIzZXpDMUREYjMyNnh4emVLWml3U2k3TGc5WlU4?=
 =?utf-8?B?WUp1aTlna2FWTE5sSjQ5SkQweXU0czVId2N2K0RVK1VPcjczNm5oMkFidHhB?=
 =?utf-8?B?QmN5RzVRNGRQWVBBSkRkOHd6U2NsK1JEdDFLQW1tejdCMFY5UnJWU1NUaGlr?=
 =?utf-8?B?c2I1V0pFQnVoQVVjQ3pGcmlweHZBOEN4V3pkNjloSzdCVlQ3RGwvemVTOE4v?=
 =?utf-8?Q?rNNFvuY2g1LXwcpnSN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cfc17f-9628-4462-365a-08dea78f59e9
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFA3734E4BA.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 14:38:46.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ptCXYXNcV1DcLQsQhM0XCbG3AwYK/7noDhlFsku+MmSEQNtFg0VAm8DhiYM43ey
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592

Hi Reinette,

On 4/30/2026 6:40 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:04 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/29/2026 5:34 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/23/26 6:41 PM, Babu Moger wrote:
>>>>
>>>> This series adds resctrl support for two new AMD memory-bandwidth
>>>> allocation features:
>>>>
>>>>     - GMBA  - Global Memory Bandwidth Allocation (hardware name: GLBE).
>>>>               Bounds DRAM bandwidth for groups of threads that span
>>>>               multiple L3 QoS domains, rather than being per-L3 like MBA.
>>>>
>>>>     - GSMBA - Global Slow Memory Bandwidth Allocation (hardware name:
>>>>               GLSBE). The CXL.memory / slow-memory counterpart of GMBA,
>>>>               analogous to how SMBA relates to MBA.
>>>>
>>>> Both features share a new "NPS-node" control domain: a set of QoS (L3)
>>>> domains grouped together and aligned to the system's NPS (Nodes Per
>>>> Socket) BIOS configuration. Although the control domain is NPS-scoped,
>>>> the underlying bandwidth-limit MSRs (MSR_IA32_GMBA_BW_BASE 0xc0000600,
>>>> MSR_IA32_GSMBA_BW_BASE 0xc0000680) are instantiated per L3. Programming
>>>> a single control domain therefore requires writing the MSR on one CPU
>>>> per L3 that the domain spans - a new pattern for resctrl. Patches 2/8
>>>> and 3/8 introduce that infrastructure so the new resources can reuse
>>>> it.
>>>>
>>>> The features are documented in:
>>>>
>>>>     AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>>>>     Publication # 69193 Revision 1.00, Issue Date March 2026
>>>>
>>>> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>>>
>>>> Series overview
>>>> ---------------
>>>>
>>>> Patches 1-5 to enable GMBA:
>>>>
>>>>     1/8  x86,fs/resctrl: Add support for Global Bandwidth Enforcement (GLBE)
>>>>
>>>>     2/8  x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS-aligned domains
>>>>          Add a new ctrl_scope value for resctrl resources whose control
>>>>          domain spans multiple L3s within an NPS node.
>>>>
>>>>     3/8  x86/resctrl: Update control MSRs per L3 for NPS-scoped resources
>>>>          Add resctrl_arch_update_nps(): builds a cpumask with one CPU per
>>>>          distinct L3 in the domain, then issues rdt_ctrl_update() via
>>>>          smp_call_function_many() on that mask. Falls back to the full
>>>>          domain mask if the scratch masks cannot be built. Route
>>>>          resctrl_arch_update_domains() and resctrl_arch_reset_all_ctrls()
>>>>          through this helper when ctrl_scope == RESCTRL_NPS_NODE.
>>>>
>>>>     4/8  x86,fs/resctrl: Add the resource for Global Memory Bandwidth Allocation
>>>>          Register RDT_RESOURCE_GMBA in rdt_resources_all[] with
>>>>          ctrl_scope=RESCTRL_NPS_NODE and schema_fmt=RANGE, add commands to
>>>>          discover feature details.
>>>>
>>>>     5/8  fs/resctrl: Add the documentation for Global Memory Bandwidth Allocation
>>>>          Add examples in Documentation/filesystems/resctrl.rst.
>>>>
>>>> Patches 6-8 to enable GSMBA in the same shape:
>>>>
>>>>     6/8  x86,fs/resctrl: Add support for Global Slow Memory Bandwidth Allocation
>>>>
>>>>     7/8  x86,fs/resctrl: Add the resource for Global Slow Memory Bandwidth Allocation
>>>>          Register RDT_RESOURCE_GSMBA with ctrl_scope=RESCTRL_NPS_NODE.
>>>>
>>>>     8/8  fs/resctrl: Add the documentation for Global Slow Memory Bandwidth Allocation
>>>>          Add examples in Documentation/filesystems/resctrl.rst.
>>>>
>>>> Changes since v1
>>>> ----------------
>>>>     - Earlier sent RFC(v1) with Global Bandwidth Enforcement (GLBE) and
>>>>       Privilege Level Zero Association (PLZA). This series only handles
>>>>       Global Memory Bandwidth Allocation. Both the features are sent separately.
>>>>
>>>>     - Documentation
>>>>         * Fixed grammar in the GMBA / GSMBA sections of resctrl.rst.
>>>>         * Added examples to update GMBA and GSMBA in resctrl.rst documentation.
>>>>
>>>>     - Major changes are releated to RESCTRL_NPS_NODE scope handling.
>>>>
>>>>     - Commit messages
>>>>         * Reworked the changelogs in all the patches.
>>>>
>>>> Previous Revisions:
>>>> v1 : https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/
>>>
>>> What are your expectations from this submission? From what I can tell this ignores
>>> v1 feedback in several ways:
>>> - It introduces two new resources, GMBA and GSMBA, when the previous discussion agreed that
>>>     these are not actually new resources but instead new controls for the existing MBA/SMBA resources.
>>> - It does not mention or attempt to address dependency on new resource schema descriptions [1]
>>>     to support user space in understanding how to interact with the new GMBA/GSMBA controls but
>>>     instead defers that to a snippet in the documentation that user space needs to
>>>     parse to know this control operates at multiples of 1GB/s.
>>>
>>> Apart from ignoring v1 feedback this new version appears to complicate user interface even more
>>> since now it is possible for there to be a single control that may operate at different scopes but from
>>> what I can tell there is nothing that helps user understand whether, for example, domain "0" means
>>> the whole system or a NUMA node?
>>>
>>> We have discussed several times now how resctrl interface needs to be enhanced to support
>>> this and other upcoming features from Intel, RISC-V, Arm MPAM, and NVidia. It is thus
>>> unexpected that this submission ignores all the previous discussions.
>>
>> I think there may be some misunderstanding on this topic.
>>
>> Yes, we discussed it earlier. It depends on other requirements (region-aware aspects), so I assumed it would be handled by someone with full context and addressed as a separate feature. I didn’t have complete visibility into all the requirements.
> 
> Please read https://lore.kernel.org/lkml/06a237bd-c370-4d3f-99de-124e8c50e711@intel.com/ again.
> 
> You should have complete visibility into the foundation of this work since one of the
> primary goals is to address the resctrl interface breakage that came with the initial AMD
> support for MBA that resctrl has been living with until now.
> 
> With this series you completely disregard attempts to support users in understanding
> how to interact with the schemata file and instead introduce *another* obfuscated control. I
> will not support this.
> 
> Also, no, this does not depend on region-aware work. Needing to support multiple controls for
> a single resource is independent from region-aware.
> 
>>> Since there are so many dependencies on the new schema format support I am prioritizing this
>>> and created a PoC that I am currently refining and hope to share soon. We can collaborate on this
>>> to ensure that it provides a good foundation for the GMBA and GSMBA support.
>>
>> That is good to know. Let me know when you are ready.
>>
>> Could you please share which parts of the feature (e.g., Part 1, Part 2, etc.) you are planning to cover in your PoC?
> 
> All three parts mentioned in https://lore.kernel.org/lkml/06a237bd-c370-4d3f-99de-124e8c50e711@intel.com/
> 
> This does not address all the features discussed, for example it does not support emulated controls,
> but I hope it is enough of a foundation to build on.

Please share your code when you are ready. I can build GMB and GSMBA on 
top of your patches. Hopefully, I can reuse some of the code from this 
series.

Thanks
Babu


