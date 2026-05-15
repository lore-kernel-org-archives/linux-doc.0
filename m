Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7A926CE11;
	Fri, 15 May 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859086; cv=fail; b=s78l9/yJElK56P6BvWbGoUg6D7CtK5SYXPO7yVuzDlCerkDRIdCf6lvrJXAJYLXzbA+fRXchgT5Q/A7LAbs1S0chyko7hNUbgO4ScXrWmOBysq4pgaHj2hMKl3lVCvPQ1YfUdCSbhNHPs5kmBMdmmr7hvlA7eDH321fAK1e8Mos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859086; c=relaxed/simple;
	bh=ugQeZ8UKssKRFXNodokpFV/yfMOj34v5yh31K6rJhww=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dfgrStye6x5PEG1HgOoEZuV+c8/Z+RdX767PLre8LjHTwtgYpvgkDJIoUi106ZHgZ++aEAenTO2829vHnSnaMvl1BHad3/xv6MuuI2jFp9olNQRLTeroMmL1cvdinLZkFbDvjHpe/6ShHymWdYk1Bx4fV0TYRMH7JK9q/nHvY6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BPNjuuSj; arc=fail smtp.client-ip=52.101.43.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BPNjuuSj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STrbOVzs1fsWcxAyOCo73pwsMjci+ctd5SiuWUZPQ1uD0+pqiR0KxTBuipa8ek+gGilq+0b3c6++WUlvipBV81Dtc63mmUt4Q3Gjoz/YuCKiHbdzYsQt2bblHQTK2Wlj5cVCsHN3p6Arn6F+g2xya4gn7uYZeuH91SS8k+O9ZTmP4EwZUVceJ1gSUhVZSxTEA7SjoR27o1cY4UHw9hXCWwMVwfTHuWWKl8QgJQtjDTD5OqC1ysyfndivFmD9BkerP2NIO+JAcYlTQTUaSULh/Hz/XjTcQXlpO7Z1cyOZN8lTxD2BcBcxjDdxk8g1ZaW3u/HvbyJLeGl6MVgU/k/7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbxliYRO9CtjhTanJtpVYYWZkYtYTH32ocudMA+EHqs=;
 b=HK1/9Jyrip5sJpVJSxdRaej2TCEswEIwa/i9AO+i13hTGb8ydpoaaSdz9iiE/S45bKhmzz3kL2fPLduC5209c+G99crSUZrWenAnsgqZ5fqRF3gwGzTiZOZsVGzFKyn7bonOakgc7XPdgoTuYoIjGOFtgraAG+icYWD3Qlf63n0jazjOA7sJhEsyF5KZ/iQjmWbgLphXpM44Yu1/2satdCB3pOgq25Q+oRU5voNuNsWItD/q5K8RE/itQZWfvrOhpx23S2d8bOqoNxxZUb2VCtp/O+SPLpvhaWGiQoHGCsLJaa16KVyotsGqu1bVgQ12qECcU0k5ZfGSpZzj0kwgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbxliYRO9CtjhTanJtpVYYWZkYtYTH32ocudMA+EHqs=;
 b=BPNjuuSj3c/baLy0cCTkNTWmdeytGn8q73jxMGp6TPJy+xAaeYGqhjMORG7d0zuJMQot5hYB5qh2Yagb5f87wShURz6SglWSX+QtIBQVN/GOV95nqxT041AQm7jBrKLmmHBPns0PXkelF+GNq9nCVy2uWLETS+x/q/paEPbFVss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
 by DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 15:31:17 +0000
Received: from SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f]) by SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f%6]) with mapi id 15.21.0025.019; Fri, 15 May 2026
 15:31:17 +0000
Message-ID: <67782399-2d96-4207-8ee6-815bd0c4104b@amd.com>
Date: Fri, 15 May 2026 10:31:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x86/resctrl: Support for AMD Global (Slow) Memory
 Bandwidth Allocation
From: "Moger, Babu" <bmoger@amd.com>
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
 <3bc59b3e-4506-4489-a424-6e7f91232af1@amd.com>
Content-Language: en-US
In-Reply-To: <3bc59b3e-4506-4489-a424-6e7f91232af1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0394.namprd03.prod.outlook.com
 (2603:10b6:610:11b::28) To SA3PR12MB8803.namprd12.prod.outlook.com
 (2603:10b6:806:317::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8803:EE_|DS7PR12MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: df150084-eb8c-4625-8f45-08deb2970195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|13003099007|4143699003|3023799003|11063799003|18002099003|56012099003|22082099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	vEPfLB1Y7rDbVA8tDtaFA8DBbuPmTu3Mm0XbDUK+5bumHZ6584oVZdMm/Dskd4+JhwC3KiMJxLj/wlONC4LziJtiAwmn0QwZBK0+EOPE+sxka5Hoo1JX3qpzjx1Jz1UiQHBdEUtFbJ9y9tIKTMvCo9rbCNm1y7UHe+HIm9DVxDbSYHNvrFIO9M3vmgf03uRshr7VOaBRS397Ylw1cIZBYt7uL1KYQZrjzxh1Ii2ag/EOPisXvTv6+Y9Z7wiBNpKX5fonygwxiDYjMpopos+UX5cgTLQ2UFqnQW1mXo+r2++SGv35s19kS9yJcq81fAAfffXFOa2Lu+UQD1wErLaCB6hrqZhVLdtY/isF7RZVzmpZ/PAu/rTkBi3y0f8ia4poUlsdjGFb0fDCnJMZOfhdnIAnWnM7YnszUB1Ia09nJefpgGjCYtNr4W+q6kjaa74Ipll+OMjO/tPa4+bhYzeVJGoJcTJ0TRZLm7U76o7dwWSWSNFbzeSdXa1ZZTtTCSLA34ViP3eeEfbkWxG+ER8nMxsTKZFbJ/L3YN/7jsoIuO9HgdO3YMX1uXDtMMegF9j9IyY1Se5HmMFAie5clxO+QELIrT29yxH3FcNKMrTCffCnDBjZOE7kskC0sVi78e83txkmqgnpJmqBnVMNjTV2S0l7rzKIdmmub2KNS0aa5IykTf+sOZOuxImteBDaR9t9VjyNsTsgt17IbDNt4PSenQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(13003099007)(4143699003)(3023799003)(11063799003)(18002099003)(56012099003)(22082099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDBDZGJJM1BYK0QvUWIvbGVJOS9CaEt1K2tPYXlOSzdhNk9GZjBrRC9MSGFX?=
 =?utf-8?B?UWE3MFNlM1pXQndQR016eDVIaDJ0R0Y1ZUJYZ0V4OFMvL0tURkpqVjJ2bndm?=
 =?utf-8?B?d2JWcVpxWmtBVjRDSUlEUkV4aFVlb01oWHZGNE1CaU92SE9uYjN3NWJSdjVk?=
 =?utf-8?B?cEovMVM0VUVxR2xGSjV2MVNMTUVyYURLLzJOZ3o2dDdGUjhJM0c3NS96cWJy?=
 =?utf-8?B?ZFJJdzBscXFsR3pKdVE4UWtzenV0ZHViUUsrWDJVRWlDRW9KRHpaSGdIdndL?=
 =?utf-8?B?U0ZhREJWWHg5VnFtM0dqVm5CUGd4STVoS3ZKNnpuWlN4elpXZGpXSmtHMDM4?=
 =?utf-8?B?QUk4ZndHcG0rYlN2VGkyd04rdDN1ZE1yZFNVdmVBeC9ueTE5UDBFR1RUUDFW?=
 =?utf-8?B?UU9mUk1XZUVYVlIxZkpQd0w2ZFNpWTZVWTZ4OVBLRnZJbkM2dXNGNnpXWkNp?=
 =?utf-8?B?Q1hpMW4rdWRuMzRodTBkbEwvOHlkci8rTEJhTnpOQmhzMlZHUmdKZFpIVkEz?=
 =?utf-8?B?Z0NRWHRVcWZTa2VpT3RCMnEvSFBONWZYRmNqcHRJV1hzcXJ3N3BidXd6ME5r?=
 =?utf-8?B?QzMvWUNXRkZ4OEtuQ2IwRjVwNDhVN2xTbFhxQUhDMlIwaG1YRndZNGtGckdR?=
 =?utf-8?B?TVZSZEJ5N05XcUxhK093SE9uTHRNRjE3UVNmUk9ydFEyUThEd0tmcEF4VUMw?=
 =?utf-8?B?OFBRMzRxSms2YUpnMzhWaHhEWUZxeUE0L05PcFAybG5QbkJSS1FxUzFvaWVI?=
 =?utf-8?B?UU9FaUhielNGdTFMcjRWdy9FMVFQYnVJZWpTczI0RE9iQ0xzdWx2dVBkRm1I?=
 =?utf-8?B?T1JTanlXMkV2U3VWL0l0ZXBEU2w2ZVU1eHErWnd1SVkyUTIxanh5Zk5TTTZI?=
 =?utf-8?B?djdCMjdsODNMdVV1T2lUSGJRMWltVkkyd2hjbVpoWTZnNjFSckIzRDN0TGJ3?=
 =?utf-8?B?UjMyeTh0TzlVb3prM2hnMkpuTTBHZ0RnV1IrSjV3OHkvelg1UmtTdUkzUXVs?=
 =?utf-8?B?WnlqWXV2NTdTVFF2ZittZGpwZTJsd2p5U0xobXZuUk1BSU9ydW5KTmFFU3JH?=
 =?utf-8?B?RVhodlQ2cU1KTFp1L0FsejJ0SU1YYXI2dFprOVliTStHZDFBcCtWS2xyM2JB?=
 =?utf-8?B?S1ZreG5tNEM5VVAyck9zK3VEWlFoMndJNGprM1VBVnVqTkxYNXdUL2htcm5I?=
 =?utf-8?B?VjkraEEzbktGN1BlaWtURytJYk43UnZObWhHOFduVDhVcXVZN1pWYTFvZzd1?=
 =?utf-8?B?OFRxcHgrc3EySGttY2FjeVBERDh2WFpIY1RhMi95eEE5UVd2ZlBoVVhmejd0?=
 =?utf-8?B?L2IvSlF2cXlkK2pLTGxBY0tVa21TWTIxaS9iMGVPYWpTZi9yc2RVU2NzY3Ix?=
 =?utf-8?B?Y2N0bW05WSs2Nm44eGg0RG8wOGhHZWR5SllvbWRSMnF4OXFIRWhPZGFpbW11?=
 =?utf-8?B?blJGaUErWkMvanFKU3FtakE3S1ZGZERzUlZtTndzUEVtT2YyQzhoanNsNnVV?=
 =?utf-8?B?SXp4cHB6WmlSZFNTOEVEd2FmdEdYallSSy9XQStQWUVPeWNnbmlBNWxLTEFP?=
 =?utf-8?B?YjFRSlFsVGU5RlVIaEZ0RzE4bXlnMDlxRWRETC9aRTRhNU5oaEhyQzAyK3Uw?=
 =?utf-8?B?NzUrRGxTYXcxVk9xRjFiRU9rRTVlQ3ViMXc0VVo5c0lOMkJhQTlGYk40S25a?=
 =?utf-8?B?RnpTcjRkcEp2MU9oaHo1T1NYQkY1RERTSGljMjhkR2FOOC80OWlRMXZTVWlp?=
 =?utf-8?B?cHJVc3NPcXhwZDJ1RFBkTnBNZEpsS1YyOTZ4aytsR0xCbUhRaW9ERzlCaGdr?=
 =?utf-8?B?NHNXSHZuN2tKWVRLWkZSVVYrTFVkRHRxTS9BWTBXVjhKdjJRVSsyWUtBQUY1?=
 =?utf-8?B?TURDNnFoaSs4VHN2ZlQvdk9qTWRJVlV1L3NlS0YySWEzM1pEa3RRdGFySUZ5?=
 =?utf-8?B?R0dLcjFnN0FaWlc4VTczczhDd21qenNLdVU3TW5LeHBLZ1A5RlFPcWNtS3FT?=
 =?utf-8?B?cmRsN1g0dy9EOEFYOHpDYW1rWEN4ZDhGTkZwOC9WMmkrSVgvTWRVa3BqQjNN?=
 =?utf-8?B?UXhtU2RRRTdIUVJmemVkSWxYcjE2OFFZU21wUG1uZFlIUVVhKzZDVmZRSHgw?=
 =?utf-8?B?V1BvMTg1RzZBZThoTDVLMTliYVJ5eUlnd2QyTlgwUWplV0ZLN2paNStqcHJh?=
 =?utf-8?B?ZHlsRW1tSVladGhMMzhBZytJM2F3N0NqdVVqMEVxbktCbnlBNjk0RDkvTUtj?=
 =?utf-8?B?Ymk1aUk4RU01NjMybGxSdVJoMXNhMERoTWlkcElXQ1ZjSzRHSUd6U01MclVk?=
 =?utf-8?Q?kD6f8mipwuBt/1Bvrr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df150084-eb8c-4625-8f45-08deb2970195
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:31:17.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zfJCAO7beCnEU8cZpB1d5GqpZUpKvky+1hXWwdfs65ECP4z9M4hezDUqlhyiqDj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024

Hi Reinette,

On 5/1/2026 9:38 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/30/2026 6:40 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/30/26 4:04 PM, Moger, Babu wrote:
>>> Hi Reinette,
>>>
>>> On 4/29/2026 5:34 PM, Reinette Chatre wrote:
>>>> Hi Babu,
>>>>
>>>> On 4/23/26 6:41 PM, Babu Moger wrote:
>>>>>
>>>>> This series adds resctrl support for two new AMD memory-bandwidth
>>>>> allocation features:
>>>>>
>>>>>     - GMBA  - Global Memory Bandwidth Allocation (hardware name: 
>>>>> GLBE).
>>>>>               Bounds DRAM bandwidth for groups of threads that span
>>>>>               multiple L3 QoS domains, rather than being per-L3 
>>>>> like MBA.
>>>>>
>>>>>     - GSMBA - Global Slow Memory Bandwidth Allocation (hardware name:
>>>>>               GLSBE). The CXL.memory / slow-memory counterpart of 
>>>>> GMBA,
>>>>>               analogous to how SMBA relates to MBA.
>>>>>
>>>>> Both features share a new "NPS-node" control domain: a set of QoS (L3)
>>>>> domains grouped together and aligned to the system's NPS (Nodes Per
>>>>> Socket) BIOS configuration. Although the control domain is NPS-scoped,
>>>>> the underlying bandwidth-limit MSRs (MSR_IA32_GMBA_BW_BASE 0xc0000600,
>>>>> MSR_IA32_GSMBA_BW_BASE 0xc0000680) are instantiated per L3. 
>>>>> Programming
>>>>> a single control domain therefore requires writing the MSR on one CPU
>>>>> per L3 that the domain spans - a new pattern for resctrl. Patches 2/8
>>>>> and 3/8 introduce that infrastructure so the new resources can reuse
>>>>> it.
>>>>>
>>>>> The features are documented in:
>>>>>
>>>>>     AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>>>>>     Publication # 69193 Revision 1.00, Issue Date March 2026
>>>>>
>>>>> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>>>>
>>>>> Series overview
>>>>> ---------------
>>>>>
>>>>> Patches 1-5 to enable GMBA:
>>>>>
>>>>>     1/8  x86,fs/resctrl: Add support for Global Bandwidth 
>>>>> Enforcement (GLBE)
>>>>>
>>>>>     2/8  x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS- 
>>>>> aligned domains
>>>>>          Add a new ctrl_scope value for resctrl resources whose 
>>>>> control
>>>>>          domain spans multiple L3s within an NPS node.
>>>>>
>>>>>     3/8  x86/resctrl: Update control MSRs per L3 for NPS-scoped 
>>>>> resources
>>>>>          Add resctrl_arch_update_nps(): builds a cpumask with one 
>>>>> CPU per
>>>>>          distinct L3 in the domain, then issues rdt_ctrl_update() via
>>>>>          smp_call_function_many() on that mask. Falls back to the full
>>>>>          domain mask if the scratch masks cannot be built. Route
>>>>>          resctrl_arch_update_domains() and 
>>>>> resctrl_arch_reset_all_ctrls()
>>>>>          through this helper when ctrl_scope == RESCTRL_NPS_NODE.
>>>>>
>>>>>     4/8  x86,fs/resctrl: Add the resource for Global Memory 
>>>>> Bandwidth Allocation
>>>>>          Register RDT_RESOURCE_GMBA in rdt_resources_all[] with
>>>>>          ctrl_scope=RESCTRL_NPS_NODE and schema_fmt=RANGE, add 
>>>>> commands to
>>>>>          discover feature details.
>>>>>
>>>>>     5/8  fs/resctrl: Add the documentation for Global Memory 
>>>>> Bandwidth Allocation
>>>>>          Add examples in Documentation/filesystems/resctrl.rst.
>>>>>
>>>>> Patches 6-8 to enable GSMBA in the same shape:
>>>>>
>>>>>     6/8  x86,fs/resctrl: Add support for Global Slow Memory 
>>>>> Bandwidth Allocation
>>>>>
>>>>>     7/8  x86,fs/resctrl: Add the resource for Global Slow Memory 
>>>>> Bandwidth Allocation
>>>>>          Register RDT_RESOURCE_GSMBA with ctrl_scope=RESCTRL_NPS_NODE.
>>>>>
>>>>>     8/8  fs/resctrl: Add the documentation for Global Slow Memory 
>>>>> Bandwidth Allocation
>>>>>          Add examples in Documentation/filesystems/resctrl.rst.
>>>>>
>>>>> Changes since v1
>>>>> ----------------
>>>>>     - Earlier sent RFC(v1) with Global Bandwidth Enforcement (GLBE) 
>>>>> and
>>>>>       Privilege Level Zero Association (PLZA). This series only 
>>>>> handles
>>>>>       Global Memory Bandwidth Allocation. Both the features are 
>>>>> sent separately.
>>>>>
>>>>>     - Documentation
>>>>>         * Fixed grammar in the GMBA / GSMBA sections of resctrl.rst.
>>>>>         * Added examples to update GMBA and GSMBA in resctrl.rst 
>>>>> documentation.
>>>>>
>>>>>     - Major changes are releated to RESCTRL_NPS_NODE scope handling.
>>>>>
>>>>>     - Commit messages
>>>>>         * Reworked the changelogs in all the patches.
>>>>>
>>>>> Previous Revisions:
>>>>> v1 : https://lore.kernel.org/lkml/ 
>>>>> cover.1769029977.git.babu.moger@amd.com/
>>>>
>>>> What are your expectations from this submission? From what I can 
>>>> tell this ignores
>>>> v1 feedback in several ways:
>>>> - It introduces two new resources, GMBA and GSMBA, when the previous 
>>>> discussion agreed that
>>>>     these are not actually new resources but instead new controls 
>>>> for the existing MBA/SMBA resources.
>>>> - It does not mention or attempt to address dependency on new 
>>>> resource schema descriptions [1]
>>>>     to support user space in understanding how to interact with the 
>>>> new GMBA/GSMBA controls but
>>>>     instead defers that to a snippet in the documentation that user 
>>>> space needs to
>>>>     parse to know this control operates at multiples of 1GB/s.
>>>>
>>>> Apart from ignoring v1 feedback this new version appears to 
>>>> complicate user interface even more
>>>> since now it is possible for there to be a single control that may 
>>>> operate at different scopes but from
>>>> what I can tell there is nothing that helps user understand whether, 
>>>> for example, domain "0" means
>>>> the whole system or a NUMA node?
>>>>
>>>> We have discussed several times now how resctrl interface needs to 
>>>> be enhanced to support
>>>> this and other upcoming features from Intel, RISC-V, Arm MPAM, and 
>>>> NVidia. It is thus
>>>> unexpected that this submission ignores all the previous discussions.
>>>
>>> I think there may be some misunderstanding on this topic.
>>>
>>> Yes, we discussed it earlier. It depends on other requirements 
>>> (region-aware aspects), so I assumed it would be handled by someone 
>>> with full context and addressed as a separate feature. I didn’t have 
>>> complete visibility into all the requirements.
>>
>> Please read https://lore.kernel.org/lkml/06a237bd- 
>> c370-4d3f-99de-124e8c50e711@intel.com/ again.
>>
>> You should have complete visibility into the foundation of this work 
>> since one of the
>> primary goals is to address the resctrl interface breakage that came 
>> with the initial AMD
>> support for MBA that resctrl has been living with until now.
>>
>> With this series you completely disregard attempts to support users in 
>> understanding
>> how to interact with the schemata file and instead introduce *another* 
>> obfuscated control. I
>> will not support this.
>>
>> Also, no, this does not depend on region-aware work. Needing to 
>> support multiple controls for
>> a single resource is independent from region-aware.
>>
>>>> Since there are so many dependencies on the new schema format 
>>>> support I am prioritizing this
>>>> and created a PoC that I am currently refining and hope to share 
>>>> soon. We can collaborate on this
>>>> to ensure that it provides a good foundation for the GMBA and GSMBA 
>>>> support.
>>>
>>> That is good to know. Let me know when you are ready.
>>>
>>> Could you please share which parts of the feature (e.g., Part 1, Part 
>>> 2, etc.) you are planning to cover in your PoC?
>>
>> All three parts mentioned in https://lore.kernel.org/lkml/06a237bd- 
>> c370-4d3f-99de-124e8c50e711@intel.com/
>>
>> This does not address all the features discussed, for example it does 
>> not support emulated controls,
>> but I hope it is enough of a foundation to build on.
> 
> Please share your code when you are ready. I can build GMB and GSMBA on 
> top of your patches. Hopefully, I can reuse some of the code from this 
> series.

I didn’t see your acknowledgment on my previous note, so I wanted to 
follow up to ensure we’re aligned.

Just to confirm—are you planning to share your PoC?

My understanding is that I would build GMB/GSMBA on top of your patches. 
Please let me know if that’s correct.

There’s no urgency on the patches at this point; I mainly wanted to get 
some clarity on the plan.

Thanks,
Babu


