Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B23F0A8C;
	Thu, 13 Aug 2026 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648289; cv=fail; b=FXQJsAh89Q5nygd7CvgrsoMg7T7IPHHTeEluU68EOs1ovIZFrcLvE8C53zDBOXPy4D8Y7U7lC3QGLqNrnp5QJJ2nMgl9QArNKHfXlP2ABgXldn4GJufDAmgSlUHkR+XbSQbeicFjR440l/7Zb3Sewq/8NTeSgdJwNjrjxqb7dM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648289; c=relaxed/simple;
	bh=7wHAuijfOsxxw587P15AYcarJOSkwJzDU7NMyKu4TY4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K4mamVBQrSaDMu0O630sos/BwZabkcJFrzxSHB2BgNfNu8vCoev40qg9iMiO82J52YT8+LU5PwcTDZx51vSp+T4DMkb/BGvrwNQPNgeMhKv4SLUk51UHj59Bdgoekrce23ncyW7R4BxGmALgBX2pA/DhWajVOpaI7FMUtHf1hgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JJZFp1cj; arc=fail smtp.client-ip=40.93.195.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JJZFp1cj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbtbTdg50V8wFIk8j1EqGrKtn4d6QlTpQ7DxqM8BcWLRp5kK3ZFgIbjT3HYvpMpPCK07hJ6cxNzK59mblBgPk7SleJ5Q4+5SvqkLXXTc1tEWOQx+6y065dh3sbXnOvaupYIsdBvefspoXaWNbdbH1XthCQSm3AmUujn1aQsq9idP3tD2AaP7dRWxLiU2NBmhpc6DSvcDRaTOU3bhRZWkhW7Sg3FePl1lYkd83fQcz8eUrg2ZkDKmLYhkMhoNH7Vzy0ELQVSi2dzy3xrYI22+Hrsi5/OBtAF2VuU7sdfuWkazZtZ+T8LZkbXRRSsnHH7BgvHyEF7FwwQ9MYr2S9mxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4E4bLoxvr7s+TKpACXKHy7OkOil0ptaYr+CiPBQGHkg=;
 b=Hfs3QrXrtyFlBOV30OHoiSAQMpRr2dnFs7vWPg2ydl2GlnPq1TKKlyxOV3LEOaBGVHsyZZY0iaaf5ffSbWvY6zQOJeEv9A32yHY8kMC1Gfkhdk32uGYOSPMRZVkhm9lTPvhdBrg4sDS0jeBRTEoPb71aa9CwsQqQ4rhzwlQ7MmwqBv2IQF/EChn/4k5bqgjLPwDEb+abpQIOjUztZgUlnk/xrBj6wlvkzNxgN2BlL9qpQTgVM5oIiSHl/5PonVxCGmxd7XtDAO03PAiWRbL+QNDLPaglC6XOYIkeeLkybDkrYy+RK6UZh77tHzYLqyrztV0cKbKL7NYQ+vKng0my3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4E4bLoxvr7s+TKpACXKHy7OkOil0ptaYr+CiPBQGHkg=;
 b=JJZFp1cjfprxvdICnpLewgMGLZ9QCoTr5tMYQpAyCj83kjGA17kIGB7GVop9pmQfEhSpp0gTcVV9JO/w08MbSNgt8mzUEtvzn1zSkxRrgG8/Q7/CcVMiUVtMNa15iG4yipqbnwmBVT9pdmvPTL/cWE2LhFly7HAh3cxlgox/7lc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:11:24 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 19:11:24 +0000
Message-ID: <08d27ac3-c5a8-4926-8a60-f7e24d9c1564@amd.com>
Date: Thu, 13 Aug 2026 14:11:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com,
 fenghuay@nvidia.com
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
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <b4606050-277c-4a3f-9630-5453fa94df10@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:610:59::35) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: bf48d08f-15a4-462a-c28e-08def96eaac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|11063799006|4143699003|56012099006|10067099003|6133799003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	irDeSpzwYo9BMylc6NvGwqPP9qL14jobW8e4wHn69bQkc5J17uJuVIJk5EghI0DQ39mPO/J4Ug7gP3LZTvsa7uUs4kLiNHi26JmFLgAbgRE3Frb/jI6XeyrA2MC5lZw2rRUMNnDksk1Ozs4VCIdSBIzRgz/Qo8OUnckqct5Vek+9EPVPx19kO4LxuZ5HOtGkjb3NGQ10UHmeSKPaEIQMm7SAPrFVQIGUfhN11Ls6amCMKe9TKxljcksh72pb00afwyty8v/7/WfrSaqyIG8o6fSLDKgw15rjQZvsRzKCv9J0UbuiXKwRWZhe0S+2MmKnWNvcWZD+b87eGQ668Spvh1IVPXN1qpfcXmQe7FGgfTfc3eBpxhxGXKzNmlzAtCh05yhw/sLqsMUPVpGlFShnyfk7eZghivG8Lt1VuDtTFuiFcMealdTMaxgyQoZsKQDATilxgv2/p84li5wFqjkbopd79ckIGTyqscCTYuwJiiG+6Nz2tO7LQWLwTLh0cb7JKkJ90yDJTEz3oFVP1M6YeUh74BTcWOvVBOD2zQSlsUy92fFNKqzrdVEoWiY6pHRqCMyRW9mIhmgKeF51zl8aq/Bx+EXbqI8Pw25evnMEnyHdIzo4qq8gfI+Dd4VjRSIJnHe4zjqdYDVATp8jPdJWljS8RwMKRG6CE6nfQYy+UAYyIv3/RPLv9wpJrxn/51GUCqiDrqr2bzkNziCRj41+/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czZoa0RaajlMWTZ1SUdtanFpSlRNSU5DVmp0RXUxOGxWcmxtUVRJdUxTcmkw?=
 =?utf-8?B?L241bVUwWEVWc1NkaXZ0bXM1cERZU09xVmVNMjcya2NoaHduN0RZNW5VaWZ6?=
 =?utf-8?B?eGpMUGJWSjZTSytNWHBiZXZKQy9CNzBWdmZhSlZoa0xkdzBMZU1Qa2RBQjZJ?=
 =?utf-8?B?d3FmcDNlY2xVRWp1cjNnRGhXUUFVYlliLzFCWCtic0tVVEtFQTg2WnBQMUEz?=
 =?utf-8?B?MlI1eEtKcUpyTmFDb1d1dlcxL0JSdEhNZ1VNQ1NqMUJveEdMYmVTK2ZzRFlW?=
 =?utf-8?B?M0d5SWZ4UzZkdCtHL1RheExpVHZoMGdZemFaemc5VGF1UXp0M0tpMXFBNVNB?=
 =?utf-8?B?WkdYc24zT2c1anJwa1JDdG5BS0R4UVYvdm8xZEI4RGlkWE55YXNjejhTb29v?=
 =?utf-8?B?SS9hR0JmZEloTHVMcDdXL0krN0hkamdrZ2RUeDkydmFTNmp6ZmRRMXpaQWM4?=
 =?utf-8?B?NldoYjkrNXJ3V2FpbXI3a05rVmU2WGhKWGE2ZDVOS2tONjIyc3FLWFdiN043?=
 =?utf-8?B?djJPODVWMWxEL2hMUHNCVWw3K1lnbUNZaUJUejBmUWszeW00RlZLWStqaG1Q?=
 =?utf-8?B?NTEvWEdvbFdaV0lLMFdaOVZuNktqeEF6TmxWWXJ1Rld3Ui8zN3h3ZWg1em1G?=
 =?utf-8?B?aUV0ZVBSUm1jQ21YR2RwR3kxdkxmVy9DRmFndHJoNFR6VTFmSXZhaUN0MVA1?=
 =?utf-8?B?S3poUmZOcXlzaTdkeHFtNjNSa2xCa1FLRDU4N0JmM0xvczJ6a1k0TlJFUFI5?=
 =?utf-8?B?WXZOYzhiNnp3QVZ1RTFpajc2NDFJT0pyVWtVUnpQd29WbmZHQ01SejJJUFNi?=
 =?utf-8?B?enhzMHNVdzdKUHRvVlhURVF0Z0YxcHNJbFErTlRJb2pxdGo5aUI4UUQzTnlt?=
 =?utf-8?B?bDJ2aFpCeGtoQjh3eEQrejlnNS8xaGRNQStBdExURTFkYXE1SEJZWjA3QkVH?=
 =?utf-8?B?QkZlZ1BmYlYyN2UzQ21xb3ZYZXZlN2I4ZS9ENWQybTczQXl2cUZsWFVTWU5s?=
 =?utf-8?B?UWRvVlNmeVVmbFlWeERNV3lNckRpa2RtdUZMNlVNejlPYWgwa1o0NTV0N2d2?=
 =?utf-8?B?ajlSUGI0YnhZY0N3RWNzcTJ6Tnp0VWRiRUFiY0YrdllYYW1UcFNJOFpOTVNk?=
 =?utf-8?B?bmVxeHR5aUdZcnIzME9vWWRJT1BPN3MyNndVa2FESVg1U1JHTkhlRkNOeFEr?=
 =?utf-8?B?aExkYjJsZHczZnFqNkhCdlhHRm5BakgxTmJ0VUxYMkVFajZPaDBodVpFdGVD?=
 =?utf-8?B?SUtCWW1hVm9pWTRCWW5sbHh1S05ZeU91UUxFamhjL2NRR2xIbUZZMmw4OG9K?=
 =?utf-8?B?TDhKTDNXNHg5UTIvcE5ZOE1CSWY1YWI1QXdkRkNTaDlTRFJMbm51KzAvekdO?=
 =?utf-8?B?QXlpQUhadE5OZklRZzRyTXFibnVXbThoc0t4dCtWWTFXRytNb1EwRStSYWxF?=
 =?utf-8?B?Y0NXUXp6YjFjd2IrdUpISHlBNVFxMCs1dnlwYUZSUzlsM09zc2hNV2hTNFZT?=
 =?utf-8?B?cFhRRENBQXFXUEV0UU5ickRydWppVkU5aC9aWGxCcURpSWhqUUZydDN6dVJT?=
 =?utf-8?B?dGNMQmtXc2NzL3RQTzl5T1UvYUpraXR0QXVVNkxXb0d4Z09xNFdSZktZZ0NX?=
 =?utf-8?B?bXBPS2VVK2l0QjJ3cWxPRlBjdHE2MU42Vm1SdERLcDkvZlZsVW9ZeGlPTkpU?=
 =?utf-8?B?R3lBQmZIWFhacTg3R1B6OTlPbk1tZnVpTVY1ays1UjdLMlA4dEt3QytzMjdY?=
 =?utf-8?B?ditSNG1KQU1yQ1ZyeklrMnB3b283SXczVDhLdEZtYlVEUTMwdHZGcFVTN3Bi?=
 =?utf-8?B?eHZHeG9zWW9XUXJ5SXVhK1ZLaWdTNzJLbVFaRlZhODNMMFp2QnhqNW45ZGFL?=
 =?utf-8?B?dlkrTi93UEFTT1pUNEE1eVdIV1RiS1phK29CNGkwbmpSNlArSFN0MDNEQmJJ?=
 =?utf-8?B?NGo3Yi9zMzhRemErV1E4S0xiZlpMdldielJ6bk5tVnpFVStZbUgya0xCVi9H?=
 =?utf-8?B?c1Rua05XOEhnNzFIK1pqcUN1NTduUGRFWXM4emtJK0lXY3VrOVdORFBaYVpK?=
 =?utf-8?B?Qk5FSnd2TDhlczUrWWpGRUpqMjJkclRpcmVBY2JRSXI5WkFlZUt6WkZzQkVa?=
 =?utf-8?B?Z1JsUzNYS3FpNkRiNUJobXJtOWNDbTlMUkN4RWM5UjJnTnVXUmtwYXVQZFMy?=
 =?utf-8?B?UlorOWdNUjNFSVJWanFlUk9USklNSFJiUDEvOHlTa09uZDlJa1A4UGpFSVJr?=
 =?utf-8?B?eEM0TkJKOUxnRHJmcmozeGN2NDhKaFdUdFNzYiswRTI5YWlJaHFEQ0piRmRv?=
 =?utf-8?Q?RsAUMG8pOzskMxCXoZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf48d08f-15a4-462a-c28e-08def96eaac8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:11:24.1804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEOpSH3EE4Sz09X/ZG3QSgZkazENMzTVqkKaCOgHjlAiXBkukpRbaFhotCVe1rie
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002

Hi Reinette,

On 8/13/26 13:18, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/13/26 10:12 AM, Babu Moger wrote:
>> Hi Reinette,
>>
>> On 8/13/26 10:55, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 8/13/26 8:17 AM, Babu Moger wrote:
>>>> On 8/12/26 18:28, Reinette Chatre wrote:
>>>
>>>>> Please always keep in mind all the requirements and use cases we learned about
>>>>> during and after RFC v1 of this work.
>>>>>
>>>>> For example, we already know that "per group" assignment is something resctrl
>>>>> needs to be ready for. Consider the example in
>>>>> https://lore.kernel.org/lkml/aYyxAPdTFejzsE42@e134344.arm.com/
>>>>>
>>>>> There may even be "per task" assignment in the future.
>>>>
>>>> Yes. That is correct.
>>>>
>>>>>
>>>>> Constraining this feature to PLZA will make it harder to enable the capabilities
>>>>> that we know resctrl need to support in the future.
>>>>>
>>>>> This is how we originally landed on the "global" assignment distinction
>>>>> (https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/)
>>>>> "global assignment" should be kept or replaced with a solution that continues to
>>>>> prepare resctrl for these other capabilities.
>>>>
>>>> Yes. Makes sense.
>>>>
>>>>>
>>>>> I am not able to see how resctrl could support "per group" assignment with the
>>>>> interface you propose above. If I am missing this, please highlight the solution.
>>>>>
>>>>> resctrl may need to explicitly split kernel mode from kernel mode properties. For
>>>>> example, below shows an "assign_global_enable_per_cpu" as the kernel mode, now with three
>>>>> properties:
>>>>> - "ctrl" - could be "assign" or "inherit"
>>>>> - "mon" - could be "assign" or "inherit"
>>>>> - "group" - required if "ctrl" or "mon" is set to "assign"
>>>>
>>>> ok.
>>>>
>>>>
>>>>>
>>>>>       # cat info/kernel_mode
>>>>>       [inherit]
>>>>>       assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=uninitialized
>>>>
>>>> Shouldn't this be like below when default is inherit?
>>>>
>>>> # cat info/kernel_mode
>>>> [inherit]
>>>> assign_global_enable_per_cpu
>>>>
>>>
>>> I think it will be useful to let the interface:
>>>    (a) show to user space which properties are available for each supported mode, and
>>>    (b) show user space what the default value of those properties will be if they
>>>        are not set when the associated mode is enabled.
>>
>> The "inherit" is the default property if it is not explicitly set. Right?
> 
> "property" is different from "kernel mode"
> 
> Each "kernel mode" can have zero or more properties.
> "inherit" is the default "kernel mode", but it could have a better/more descriptive name.
> For example, "inherit_from_user" or ...?

Or "user_inherit_kernel" ?

> 
>>
>> # cat info/kernel_mode
>> [inherit]
>> assign_global_enable_per_cpu:ctrl=inherit;mon=inherit;group=uninitialized
>>
>>
>> If the intention is to display all supported values for each
>> property, then we should do so consistently for all properties. For
>> example:
> 
> No. The intention is not to display all supported values for properties of the
> different kernel modes. Just display which properties are supported and what value resctrl
> would use if the user enables that mode without providing a value for a particular
> property. There may be properties that could have values for which it will
> be difficult to provide all supported values.
> 
> For example, if "kernel_mode" contains:
>        # cat info/kernel_mode
>        [inherit]
>        assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
> 
> Then user space knows that if they enable "assign_global_enable_per_cpu" kernel mode
> without providing any properties then all kernel work will use the default resource
> group's allocation and monitoring. If that is not what user space wants then they
> can change the value of only the properties they need to change.

That sounds reasonable.

When the group is bound to the global mode,

# cat info/kernel_mode
   inherit
   [assign_global_enable_per_cpu:ctrl=assign;group=ctrl1//]

> 
> 
>>
>> # cat info/kernel_mode
>> [inherit]
>> assign_global_enable_per_cpu:ctrl=inherit,assign;mon=inherit,assign;group=uninitialized
>>
>>
>>>
>>> To (b), since the default resource group is used as default when the group
>>> is not provided it may be better to use "//" (or just "/", depending on system
>>> supporting just one of allocation or monitoring) instead of "uninitialized".
>>>
>>
>> To me, showing the default group would be confusing. It could give
>> the impression that only the default group is associated with the
>> [inherit] mode, even when multiple resource groups exist.
> 
> I do not see how default group is associated with the "inherit" mode since inherit mode
> does not have a "group" property?

Yes. Got it.

Thanks,
Babu
