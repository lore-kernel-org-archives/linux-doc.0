Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747F31C56D;
	Thu, 13 Aug 2026 22:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660558; cv=fail; b=P1H532DzrHtDe0isNlm9fpRWtmA4fOjiTp59IqFOgjeI0eFqsq4UIro6K1Iu1DmH90mHiSWSYM0suLD5T2FONQ9GTPPyMu6RkGQx8KSyUtDMUDPL/9UVU9cBh5OKLwirbJiYqjp9yjJf2Hpr8E7jOjajf3u97nV8383hRNDdFeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660558; c=relaxed/simple;
	bh=6yZZFTstZd7zxZgqknV4pLyeXwqySwzO1neC7SxytgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Id1r5Zs/2nshErLCiurS6hkBp+ejvLaEFOfllPudPDACKb1G5zeFNgL9A4RwTRHarQQ9DzT0EnVoXugWS0vDqhKWWcZ9yvsbuCNxzIREZBgAzz0wtOjVAesUWowXOMoULP8b2jIj5HIYLl7l2zpx0Y0e3CXU+uZCFGAuIt2tpiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yLdII7uf; arc=fail smtp.client-ip=52.101.61.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yLdII7uf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbQJZidXCeTduN+5u4AnffQc+ViNKm++erDVq73VlBOXGXzL1c7Fmo4R0jtpcSz+EkrYLTgS/pkRXmK4Cj7R0GzM9VoFP1/qvZTcN8YeElcrMU5EyRfryQ9DXtx/iceploU9IztaEBQ0sm3gm9sBJUNgW928YECDhv0f8I6TwPXFswaps9SGshPyNLdodo//uGzxewG93PkYV27SZPCNF4esMvn4MN8MRGp5XYF2tuMD/jEu7Rs25sCWRkudY1I58uyIiD2cNvOU/Th/K+KjXqb2p+SqVUBJprSPKSKEQi0oh509efvcMDT5WXiZyV6du0S3Afk2Sr+2FtVpqPzamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkBSEp6838aSkycssSa7zQqX9h2Xro+sxjicN/KkmMA=;
 b=hFHEeXC2J56HZ9QL0uYTkS5cavA7ZuCSoMJShmVc+S7A11bYb7vawo9l0ot5uVvsyDyS0MYO7usT4Gy/HOaOND+cauX5rY+bBAJhm32070ldJ7p0Fa/9SM2PyJTquBh/S3VpasJ2AzPufhjO4I2Me3Z9H/UjNQEStOw3K1F/5pFHGTnWWiWcPayb6Tx84ACYXz93fpxf4lcZUrN4D1T0b/B2YTVmKgb1/dpIYJQfZiKVQ+sTsQxSLWqgZftXi1EUgij1JJWlEZtYwfPqevBwcyvhdRQpdn1Jjt3LD9e/ncKfSEUvWZKiJ+4GILKdC60Hup9zh5L5jzvdwg/9vvtIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkBSEp6838aSkycssSa7zQqX9h2Xro+sxjicN/KkmMA=;
 b=yLdII7uf/1rgGwThPiOK8PqlduxrUlewv/a892ghK5DMwKrloJy9cRB3G3sCM5mCA9a7mo/4Iy2xtbSt1WoNMQZKO5WVkaBCwMxtoKHSrd/0Pje/DdPMYYiKatTyVhHQFzBLcz7PfQRIXJZvmmYhc/5v5FNwrBa3bAjOHtO6Hzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH8PR12MB6868.namprd12.prod.outlook.com (2603:10b6:510:1cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 22:33:23 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 22:33:23 +0000
Message-ID: <669ad6ee-fbac-4851-a26d-6a03cf94db15@amd.com>
Date: Thu, 13 Aug 2026 17:33:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
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
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
 <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
 <5fad6e01-1052-4c1f-82f5-02c650ae1ffe@amd.com>
 <e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com>
 <9a53023a-9d6f-434f-96d3-188a176a6cc2@amd.com>
 <0c4e5b4e-4846-45fb-bba9-ae4127393f0a@intel.com>
 <fdc8b919-bd3a-4794-bb3c-06ba3882e02f@amd.com>
 <b4606050-277c-4a3f-9630-5453fa94df10@intel.com>
 <08d27ac3-c5a8-4926-8a60-f7e24d9c1564@amd.com>
 <f5879ccb-2639-4e8f-b83b-419b953b4fb3@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <f5879ccb-2639-4e8f-b83b-419b953b4fb3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::35) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH8PR12MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: acf5acb1-95f8-4382-27cf-08def98ae2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|921020|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 uf/L0mk/E06u8/kRQnNRHaMtNn0vBCSRb5U0oMkO6o6ST70FzrECyKaXavEPL4JFPEVw51WMBXyi9SEzkdq0qw3QOY+4iF04/hFsAebPkIMLLW+Z+pzJGgUhavEO5WV+vSJFYV4lx/++xf9SlsAXkFoHBVcR0r8f80yQsL1QEEGFnxEd1UgNaRuX/ZopQ8Guu4lZmHEebpNpYnXgAqN/OuL/+11bPJtz11/aD69WJ/cYADS3rgdxuIxAm9C02NqW4dMzPZc5uKKw+1HWqMvduVuncbuIzGc/WooptSpWP4/zj6XBfck6A21NnI3tMsMMwiuTwMgateDUmHikiguV8lXKB58qxZDS+cYis486nBA4U1KJ1QAz8MLIRzKACVI5swGnAreaDCkpPi00nWLZF9lRKOeDeAorXC/IVeOFdl7b9205wXYuebSZ8b14mkOvk5s/bsaU8wOikuq9792wbFS0IhO0s8UJBvsyaXOjhQ7erWHl0tgljGV1xD4ndXvI/fGKH3QoIAgRmbiBNu2dtHL1H7ILhJiV41Nu2gEKwMZ4+/i0UewVrRJ7NAQ94p3sNzUS1dXw2x4mTiDHjMYx3TuEwKcf1zOmqD51rUEwEnOrpyoDFhpoDpX1Cn3sJ6DqDz+gb9zNzEuz25lbdeogNirshl7gAC5zoLmFgBaPlGWlbi6xy54Z3jXaGUAcUFWiD3sjYQJpbaCyJEvfNhtCzg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(921020)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bW5tenJLM1pQbjZRdUFON2kzOTBON1pTSTJjOW91bkxKZDhlM1lUbGYrSXVq?=
 =?utf-8?B?QmUwRE1LZlVtSHlNMnhUbjRXTC9uNnZTN1hPek9LS1F6eUdUczlvVjZDSDJz?=
 =?utf-8?B?Uk1CT0pCZVZmOEVSWFk1TDlXbGYrSTJUVHpHSEhqTTEwN3pQZHYxU0c2SXFM?=
 =?utf-8?B?OWswL0NCUitMTVFJWDZtQ0pTL1YvR2N4S0lSNmlRM3Q0U1dncTUwNjEzY1VD?=
 =?utf-8?B?UWxvNzc0ZmtNU0dqZU95RUlabkRWUHNSNmJnRWc4VHRTMVRRUmoxT3RGQW1q?=
 =?utf-8?B?eHhsMkdoN3VpeWZ5S3Q4bXRQVXE0S1d2WmxYNzJ5MndwVzZTUTNIZ0d1NXU0?=
 =?utf-8?B?a0J4dnZFaEhhV0hUK2JHMTNtSTJuYi9iTWVBVEpvQXhtUWJBaW5Nbjh6a0tB?=
 =?utf-8?B?ODVkaDc5MUVhNElwY2c3eU5ZZTk0R3NXdHRpbEtoeFFha0xxVDQ3QjF6aGp0?=
 =?utf-8?B?bGY0OGNaS2dxR1lPNjlFekhBblBMK0c1SzdwdEI3TnQ3ZUhoYUFuN2FDT2NF?=
 =?utf-8?B?VmYxOGN0aEdReHU2aWFyaUo3eWhkUkpLUTA3eG50MG9PS3VnNkl3S1hUUm9o?=
 =?utf-8?B?WWpHNDFyNGpaQW1qZmo1VVhtUjZweG9xeldCdUxuTWtnVmpnTEg3eldCUWlu?=
 =?utf-8?B?T1kzR3dSN0xJaXBXZlMyZlA4VUtGZHlRV3VtTUpRT2plQVhlS0h0ZHNyRDVO?=
 =?utf-8?B?Znc3bkRnS0c1ck91V3JVVy9pMDN3a1N6YWZJdzQ5MjFGV2QvUUxxRkloQ1Mr?=
 =?utf-8?B?bmxNRkczRlp2TXhhQjVNUDlSaTBPVVNJeVg4eVpuc0xtZlJuQ1BNYVhCRkVG?=
 =?utf-8?B?MGpnL3V3MXBDNFlldkJVVFhCMkVzaTZWMTN0TGJXWmVyaDV1amFGcXpSVjda?=
 =?utf-8?B?REZFQnRFb29CbHcwTE1QcjBpQStNWkVXZlpaeERCcFcxb2VtT2hUTkF5cWp2?=
 =?utf-8?B?RCtyemxPOGJ2RFA3Z3R4SjYrTCtTc3pkZ1pzV3ZsSUtUOUQ0TjZTMHMzYjFI?=
 =?utf-8?B?T1BrTnZaYnV4UWVXMWw1ZXdsanNvR1dhdksvV2lXeEV3bnJRSnJMSlFERFBZ?=
 =?utf-8?B?RUtKZ2ZFNldsSjRNbXErbHJPT0xhMmpaa2lwU0VaVEJTNno5YyttOG4ra3dx?=
 =?utf-8?B?VEF5U01ZVVlwMXoyemZIRE56cXJOM2VZNmFndmczSnlXU1ZPY2E3bmVKcUxW?=
 =?utf-8?B?cGZ5VDdtRFVkRlVzeWw4NWYyQ1dOcE9oMXV5U01JTmpsTTVPUlR0Z3FyMzFk?=
 =?utf-8?B?UGZXQ0tYbWZ4U3c3TEk5VTVzdk1TMkc5Zkl5a1libHdkQk56UkRwUEhkRllX?=
 =?utf-8?B?TWRIQiswOUxtaXJpM1BMakd0L01HWU81RlBTSzU4TkQzQ2VYMW1JUHE1eVEv?=
 =?utf-8?B?T05DMWd1NWlXcWFsMnFRaUErRlZZcU1kOU4vOXBHQlAwZVIvUys3TUptWm5V?=
 =?utf-8?B?UkFOVGJBVGV0TURDZWF6cWpycDZzaEZjYVJveVdCbGxJK3RvdkoxTTVlczNZ?=
 =?utf-8?B?RDNDUkdHSE9hMmxkbmRtY3pLY2RveCt3R0x1RU9HR2g4VGNzdHhJWGd2T09j?=
 =?utf-8?B?aHFhdFVyWUNzcmNBb0dISGRuSGpSSG1BRklVbmZwdDNaeFo1Nzh4NnE4SE81?=
 =?utf-8?B?L0Q1L0s5QnhZRUFGUVFiZXpaNFRpV0V5Q0U5NFE0SlFvOGhEL1ZXN2hKelk3?=
 =?utf-8?B?WG40RHdyVnVUeXBHSnI3QWRoNVJTbitSRUZRT3U5VWViR1hNWDUyRkZXengr?=
 =?utf-8?B?aGVTZFRSZDExNjV5UlhxRGVVaytsNlB2MGpoU2o0K29nUnQ0ODVHVzgyOTcx?=
 =?utf-8?B?Y2xTbU9vQllLdXpkdkJlV3hLUTEreWRFUW9aa3pFem1QUzVFZHNuckJIYUpF?=
 =?utf-8?B?YUQ4eDQwMDZSZTBpTzBnTG12c3NQdFpLRzI1QytnRzJ3RzV0d1lkZnFnNm9a?=
 =?utf-8?B?ZDlpc3ovbVVxZmx1ZlY1aUgrekx5N0Jzb3lrTVBDMjJQM2xSa29Xb24vKzhL?=
 =?utf-8?B?YnppZXJsQk1ieDVCS1Jza0MyTm9HU25kWC94V0ZvRC9BWTkzQWh3a3oxNHlj?=
 =?utf-8?B?Q1FHeWcvTmdJdlFGNnMySmVUOEhIWEJtU0JOOEI5ZS9zb29jS0hsYWRiQm1T?=
 =?utf-8?B?QnlhNk8yTG5YRVA2TUlDcWFPbHNoWmNsSGI3eHl5MEFqVFkvaEhRRFAvL1Zo?=
 =?utf-8?B?V09YSVYxZEw4Nk5EZ2JRdEVDTjlNVjBaSmNtLzVKcm1FcHlGSGxGTjBjWW5D?=
 =?utf-8?B?ZHNaN1FRWU9TRFFybElybDI3akNSVzljNnprclhtbGFCS3dTZW9uSWpJbFBx?=
 =?utf-8?Q?yX5I7LSaRczhf/99xe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf5acb1-95f8-4382-27cf-08def98ae2a9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:33:23.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25EGzWe8qC1WnMdKUezkyAhA/BBflf1WxSew4KUZERD5gJBYZ4Or7vkNYmMkxygf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6868

Hi Reinette,

On 8/13/2026 4:12 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/13/26 12:11 PM, Babu Moger wrote:
>> On 8/13/26 13:18, Reinette Chatre wrote:
>>> On 8/13/26 10:12 AM, Babu Moger wrote:
>>>> On 8/13/26 10:55, Reinette Chatre wrote:
> 
>>>> The "inherit" is the default property if it is not explicitly set. Right?
>>>
>>> "property" is different from "kernel mode"
>>>
>>> Each "kernel mode" can have zero or more properties.
>>> "inherit" is the default "kernel mode", but it could have a better/more descriptive name.
>>> For example, "inherit_from_user" or ...?
>>
>> Or "user_inherit_kernel" ?
> 
> nit: to me this sounds as though user space inherits from kernel.
> 
> Also keep in mind that the filename is already "kernel_mode" so any text would
> be interpreted within that context so repeating "kernel" may not be necessary.

May be "inherit_user". We can revisit again.

> 
> 
>>>> # cat info/kernel_mode
>>>> [inherit]
>>>> assign_global_enable_per_cpu:ctrl=inherit;mon=inherit;group=uninitialized
>>>>
>>>>
>>>> If the intention is to display all supported values for each
>>>> property, then we should do so consistently for all properties. For
>>>> example:
>>>
>>> No. The intention is not to display all supported values for properties of the
>>> different kernel modes. Just display which properties are supported and what value resctrl
>>> would use if the user enables that mode without providing a value for a particular
>>> property. There may be properties that could have values for which it will
>>> be difficult to provide all supported values.
>>>
>>> For example, if "kernel_mode" contains:
>>>         # cat info/kernel_mode
>>>         [inherit]
>>>         assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
>>>
>>> Then user space knows that if they enable "assign_global_enable_per_cpu" kernel mode
>>> without providing any properties then all kernel work will use the default resource
>>> group's allocation and monitoring. If that is not what user space wants then they
>>> can change the value of only the properties they need to change.
>>
>> That sounds reasonable.
>>
>> When the group is bound to the global mode,
>>
>> # cat info/kernel_mode
>>    inherit
>>    [assign_global_enable_per_cpu:ctrl=assign;group=ctrl1//]
>>
> Looks good to me (while ignoring the "inherit" TBD naming change).
> 

Thanks,
Babu

