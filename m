Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DA23446DA;
	Thu, 18 Jun 2026 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802905; cv=fail; b=sHg9dtLA4G34XY2Mkjr1YWLFQpOsGVAGSIeKE9T0R4NyhVVJgR2r7Jqr1dywvU06FWvyC3RUSiEfG/u2XQ99gxAbsa/5eZuY/fXoAdL1+OHG3oh+n5UO1jxN7UztvviqSg/fsiJSLtoEXK6PjP62JDeVGiOw+cBe97wbNboYmRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802905; c=relaxed/simple;
	bh=/FnVt6fzqEZQxT3u5zwn7Zr5MEHZC6HSXpDCBl71fT4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FxSYF6PAKMkIhnD+1dh2J6J9TMjL+S+QCCQSV7bgoGloennDtAzkOhMPXj2ipwW20upNXEJC0WAsmf3HsBOX6VDCaGV3TL1oXJn4pXo3sGRzEppa46f1UByx8hdbWvE0WuecdOnm32ENdn9wYQXyJhpN56+G76o7cvMJ7L92JEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p9wuSKpT; arc=fail smtp.client-ip=52.101.53.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p9wuSKpT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7D2nsjLYo8aXe9KGVlQN0c19WObj6v4Knkp1CMJjCXVIuh81Ga2JZwyVMg9d8Svsjci6uemtNZSE4uwZJj6BBW8d1M6wDnwRz4B8Fw+WC6KOSrtpTvUR9oGPsBkvAJlO420knEla2KQmOFYLQczFxjM6SxSEAxAXZBL9/ZKhaqAKHnHwqpxu3SiU/fwDLiuGnmEW/MtHTuX27JsnluuOZ6pFtsYI+V8+18odQ1vKH8kDHRRWu86DMpeap7C+6TjbIgepUcVmWk2cIUj7iLRXS0oRlqQjX4gNKqJZF1zUyOPTvSIYrXks/W/K+d7/D8Vd8ZJnWSQYthHvPZlEcJO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp7s0WZBKHfxaExe0eCTH67Z0YYqVpGNrQGayLyLXOw=;
 b=Z71KsGs+HLWjfcGKSFVc4egFYakn8aulKx4bgxohodi09ytmx/yyvzylQWQO4CXGOYMUs8GNUAVG6XWsDA05HpfOYB1cG/mLl/thAoYX4jkNHJqJ6nQeQO/wCvu25Jfbrs6MlUsqklqAmqzXHC1tlf3CBDFapk3NY+Q9v6MOONPsysXOx7l7Q/2vO3EnEQbZ4wZEONAR+ah4iIBkcExK1XD9uVaOlOuqD5gOjbni4P75htot4eGby3b3jDNVTLv1WzGuH3P16Gq66Zq4FdUJ0P2SCRREUuwG1iC7LmKVD8HdM15goHGosbfVbw037e9gxSRUO+n+8wVJH14KmbHY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp7s0WZBKHfxaExe0eCTH67Z0YYqVpGNrQGayLyLXOw=;
 b=p9wuSKpTFkSFh04Vb7390u4erznG7oIGAGgZUQYLDT2YGT6Fz7JyDHd3v/7YBVea++oZnFxNVyEJN/90nc7vSZ10UfgyCmZpMoXmbyP270K55a4pFFJsFzQEj51WKebeTpR/E7hBlsECAQRjRCUwZ9Pnzp6hkJZ7NMSnojNP4rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW6PR12MB9000.namprd12.prod.outlook.com (2603:10b6:303:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 17:14:59 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 17:14:59 +0000
Message-ID: <416d685f-9e76-415a-bbb0-fc89f87827d9@amd.com>
Date: Thu, 18 Jun 2026 12:14:56 -0500
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
 peternewman@google.com, sos-linux-ext-patches@mailman-svr.amd.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <38f794ae4076a3c118e8eda08ae2bc1e69eba979.1777591497.git.babu.moger@amd.com>
 <ffa4f5c5-9512-41fc-9354-803a182a85cd@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <ffa4f5c5-9512-41fc-9354-803a182a85cd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR12CA0029.namprd12.prod.outlook.com
 (2603:10b6:610:57::39) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW6PR12MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b89064f-f60e-489f-28ec-08decd5d2095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	64QhXd8ZPTwyWG0sInvQqnFHDd19C5yG9BoqgWDGXGRjfqPpsCt8MnlbGTE//wshTFifM2SYhMO09ndzG1sLZ28HuSbL3uOOazRCVKFkqqOSpEeDa+XucixYkMAieH3T6Hk9u1sioAwTJ2mA2h8jT2dk+O3tPNQWERFVObd2clWzx/PW8eDX1GypsT5y3tSWTpQBuaRAAghyp5Wydq8GQuXhGfl4xCOi2MKWOtJ88YeRenLLmONzQPhwEGpu5rmJjE3Fb3cEs+wI9t5FuwXT4qfjKC1ReoVM9lLs5Bhm04DVpnxeZ7UobqUqpsD5mlNu1UMdW72K0W5B9/R1f5+vWjmTAdUhnr0C/ADbJY+JaIpohMT5mom9S1k4GBLtC17Trr8OEFqri6nyrs1Qlfdeg/q6798H//6swyM88hpDs7gKEC3zauICOws5c2NAGL3dMHevWAuzKTKYN1GfOihH4D1NNWAquSd0mtcmZNnXZFXlq6gkUf2Q9DeHHKo0zghkGfyVJetbSy8Lc976KwBZBkBYhEf+DPIkiOqvP0VfsMfxD22V02e92ncSYeu+VIL5k6iFNE0YQg7KFZfEkrYMRvhf1k53IGNkfAd18HK1st1iwguwXO9C4vfpac3++wzryixxidSZtEcPIxpeEbPAoaNNIAiWmahFjGNQYeWkbVxWapboh/wRCRlQFsnYmv50
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZxNUtERWR6WjYrdXlVTEFvR1orcUVwMkZvdzRTSjNzZVdGUVNLUE0yY3lt?=
 =?utf-8?B?ajgrcUVpdC93d0JCb0FEWWxSMzRvMWJhSDJIK1NseXU5L3E1T0lvZ3gyeHRp?=
 =?utf-8?B?aHdtMzFVcXgzSWI1Y2h0MUV5OVJ1aGcwU2xkZnpVbnpsTEl3UHpLQXRsOWhC?=
 =?utf-8?B?VVFxNkFqQ2NHL2l1U1hueXRRekYyZGtYNXBxSjZnc2xhNkJpdlpKbnYyS0h4?=
 =?utf-8?B?SXlPU0RZbUxIUXY5R3o5Z05IamVCbzBZREYrVTl0U0xpNmsyNVRUNnhPdGpv?=
 =?utf-8?B?MzliRmJwa0ZJOSs1SExlSEJEQy9OeTRQNDdrY0lWbWJJN3NhdE9qRUxQOHdB?=
 =?utf-8?B?anJUaGRZa1J4QXB6d0Y3OFZvc29kYTBFVGxnUnJKQ2loU3VtZlBZekc5YnZy?=
 =?utf-8?B?TWhydXdablNHUjdZR0hHbmRxKytaZTBpcVVHWFZjbjkrSldyTG1Eb1Nrc00r?=
 =?utf-8?B?eXptSGVqbEU5aEgySXpjc3dJbzhYZlNIRG1BalN4dzc2QWhDTFFSYlIxSWt2?=
 =?utf-8?B?RlBqQUxXd0ptQzJJeTZoMkNBVWZraWJ2MWFvVXByRkc0V0xpZThKT3dsMmhX?=
 =?utf-8?B?dEtaRko3bVhGSFFHUlBYK0FNRnVXUWxlbFpnZlQwN1licmthSVNJOW1nM25C?=
 =?utf-8?B?MFZxZHNnbXdmak0zenpIVkxBTGlCZFFjd1lzMnorUkdmWStnVWtQRDJSVUtH?=
 =?utf-8?B?YXhDa3l5cmV5MEdUeUplRFM1cmNmcEw4VFhGYitUZldGV0l2akxNYXZ0WHJa?=
 =?utf-8?B?aEJjWnUvOEZKdTJaeG5sZXZ0L0x5RzZPUWZFQmNOS3VEWFB3dTZOcGtUUWxp?=
 =?utf-8?B?a3ZZVnBCY3dZdlY3ZWxIeTFiZkhqWFJ2OGw5SS91TzJqT3VYUy80bmZRbXd3?=
 =?utf-8?B?aGZyV1llRVM1akZrckRyTEZhUVVFSGtIMGZxVGZLVnpXOTVUdkY5aTdEcktO?=
 =?utf-8?B?Wk1SRlB1cjljcitNNTNJaWgwOFYya1VXS0FiNTF0S0VjdC9sR2xRMFJFY0Yw?=
 =?utf-8?B?UFVubDkvdlNsZVowR3B4Sm9hYzZsTkI4b0NWV3laS0t4OXFCRGx3Ymx0aFRH?=
 =?utf-8?B?a1N6OU9Ma1RUVWdtZWIrR3U0dnZDY3JMWXRJdEtJVXBNcWdtbEl3TG1tRWFr?=
 =?utf-8?B?WHFxRVR1WFpBZHRld2ZwR2NlTFdqSnRnZGFza1lqMWZoOGZxL2lITU9mMURM?=
 =?utf-8?B?dG5Fa2tCRDlaNXZNSXZWbzZuWXE3ZDlrMVlhVUVvbHFIVVJHUlVIb3AyTThY?=
 =?utf-8?B?aThEUGlNWHFoUHExRVJDdXdIMlFJQms5Ymd6YlNjVnozZm9UTmRKNEd3NFh0?=
 =?utf-8?B?VFlqb0lyazA0Q2k5T1pjb1lKQi9mZ05PUUVIcGtOWlJwZTM0cEN1WmNQUytM?=
 =?utf-8?B?YytWQmN2WjV1cC9HRW1tUDdvVFlJTXNnWDdzUUlpQStOa3NZeTYrenFzZnow?=
 =?utf-8?B?ODVlTnN2SlFBV0swZGxUYVZLNnlTYlRJS1NqUS93SWg4Z0ZVYlFKUDZEZmhV?=
 =?utf-8?B?aUhyb2pTYUlyRG9zNVJGdkRRckdIU05NK2IvOXY2UWdBZWk2NFVIa1ZuUW5T?=
 =?utf-8?B?UlhZY0NUSGM0cHNldmcrdW9LSkQ3ZngrZDdKYkZBV1JHOTlzMHExMHF0aHk4?=
 =?utf-8?B?OEpVTlRmRnhaT2UwcjdGR25XU2NYc2JqWXlyVUcyU21KUkdHM3RaVXltQitU?=
 =?utf-8?B?UjhkOUdmWldJSHQrZ3RHMXRyR1J3allhWFR6bDFJMEJDNC9PQkdWdWJ1WkpC?=
 =?utf-8?B?ZGpaK3ErcVBLRzBJdDFnNmNpOFFmV0gyVjRya1lldlZyd3pkYlMyRm04WGJ4?=
 =?utf-8?B?L21ObGdiN0Ixa1o2UGUyVXVoNG9OQ2lrTjRMYlpxOHlIb1dtc0FXV2F0Y0dq?=
 =?utf-8?B?OXhrZGRJVWJxKzgwT0dtK095bmZwT0dDYm1Rd0xwM2owMnByMTlrQXIzY215?=
 =?utf-8?B?WGhBRmY5YUY2RWwrNjJrMm0xeVBBdE1RSk55bjFCNktneFJnSE9tU3pRVUps?=
 =?utf-8?B?YTFQb2g0cXhVL1hhWitDWndxWStpS1RoZ25mSzdHeEEvTk1TNldTUDBPVmt6?=
 =?utf-8?B?TEx5c0ZnaFBOMmt5SE9wcU1xYm5KQlA1bnFmWUdLV240N0VQeU13N3Z1Zk1U?=
 =?utf-8?B?ZDBvd2Z0QlJqdEFqQ0hkR0hobFNXbXNlM3VZeEs4M3VXNDc1RXhxcTVkb2Jn?=
 =?utf-8?B?R1pOUGZtZFhON1NRcWdrVGFDN2pjMnhXdS9CanEvTlQ1clpUM3kwazhqQlI1?=
 =?utf-8?B?NCtDTDF4TXlJZ2tOVStGbHo0NUFiU2ZPanp2OG5hVEhLK2VzWmlCWGZNcEZk?=
 =?utf-8?Q?FYgY1goqTAqrMVOzSy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b89064f-f60e-489f-28ec-08decd5d2095
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 17:14:59.6381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afMi9QXS5LYCj9yv/b04RFG+PFlAPP6sMIPpG0cvwc83QLKnfX5/EN7aJBY5nn9O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9000

Hi Reinette,


On 6/16/26 18:36, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> kernel_mode feature needs to add the interface that lets user space
>> choose between INHERIT_CTRL_AND_MON, GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU
>> and GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU.  Both the generic resctrl
>> code and the architecture layer need a single shared snapshot of the
>> supported and effective policy plus the resource group that backs the
>> global-assign modes; that snapshot is struct resctrl_kmode_cfg.
> 
> This does not seem to match implementation since this implementation does
> not actually share struct resctrl_kmode_cfg as described above. Only
> resctrl_arch_get_kmode_support() exchanges this struct between fs and
> arch and as already mentioned that usage looks unnecessary. The other
> arch/fs touch points use either individual members or their properties
> (like closid/rmid).
> 
> As described in response to previous patch I think this can be simplified
> while also making it more robust.
> 

Ack.

>>
>> Add the file-local resctrl_kcfg and a helper resctrl_kmode_init() that:
>>
>>    - Adds kmode and kmode_cur with BIT(INHERIT_CTRL_AND_MON), the
>>      universally supported mode and today's behaviour;
>>    - points k_rdtgrp at rdtgroup_default so global-assign modes have a
>>      valid backing group from boot;
> 
> If the default mode is INHERIT_CTRL_AND_MON then should the default group
> not be NULL?

It will be initialized to NULL.

> 
>>    - calls resctrl_arch_get_kmode_support() so each architecture ORs
>>      BIT(<mode>) into kmode for the policies its hardware supports
>>      (on x86, AMD PLZA contributes the two global-assign modes).
>>
>> resctrl_kmode_init() runs from resctrl_init() once the default group
> 
> resctrl_kmode_init() can be dropped after changes described in response
> to previous patch. Apart from no longer being necessary I also find that
> having the kernel mode fully initialized *before* the hotplug handlers run
> to be simpler.

That means resctrl_set_kmode_support() will be called from the 
architecture layer, likely from core.c within get_rdt_alloc_resources().

The resctrl_set_kmode_support() handler would need to initialize both 
the default mode and all supported modes.

I see that this is where the hotplug handler gets registered. Therefore, 
the modes are already initialized before the hotplug handler is set up.

> 
>> has been set up.  No user-visible behaviour changes yet; later patches
> 
> (drop "later patches ...")
> 

Sure.

Thanks
Babi
