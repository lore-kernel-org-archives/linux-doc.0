Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773A22A4E1;
	Thu, 11 Jun 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189218; cv=fail; b=Ppql/yVzFdtg8FSUdc/KHQTqcAqMhJH25cJhU6uIowMIITkMRpvKj6qr5P78dLpeEfS1DIr02RtDpKcgDw1kVze0kof4Uuz1XzlnQmwHnJTQPEAisxCuxDY/HdlDYSVfiGjc3m+4Q1XtMhKCut8gDYCyt57eJpVK2wvaXwz7S4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189218; c=relaxed/simple;
	bh=58fxTg3ermuIi+LJ5FZGZtl5FzOPeutSY88rpYltcp4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jX2OK2xqf97fW1pJmLoQ8Eij4SfyoB6Bm2vXkrrmIp3gAJMXXW6sIHwRzGfo2HL5Z6ETQxUUo2o8BfYROOzBD++ENOgbYyXpS8QZA6qyRnQN5EQ5QGT77whRJ5JFOF3Y1HRYIiMXSizlz3jnwPVqwbXY6jN+QaNJNE/tAMJ5aeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gmH9nD3z; arc=fail smtp.client-ip=52.101.56.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gmH9nD3z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yfl0JsnBR044vaOVO5wJpOcOvNANQIG9aKziNCPlnm75ATX2OuIWP+gvNIGfB2wzcUG73n8t5ik62GdkCnRibO+gffx4I+LPTQevcNZE9UCjrPb6380dyvwNqCGQbsxzntQDI5m9RlDXvUwZdKdQr9/6ZCTzw3rQuw9JY4LNZPrg+UVZdC2TQZdJ7TklO6+JQSW76nK87MgvZFK7vUVMpXrwy7XgI4VnWuOCj/kqUPCwyaDYhAkGr0cYS/Hjbtxzivx8j78ah2vL1T+MNF/FT/llSBSonWckUvrTtpoDm18VUGdvPKOKQQOoeCUBA2bHR9Nc6x1Awxx1swpiPQD2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzXumaAdTCV7UytoeINkQsGWGu/tWht84TAu86WP2WI=;
 b=oDaJs0uEZaa57Lrnkxr790yme9vkkb5AJJUuh0QbviR6oFdB42wtQ5W46ZrvKcN3D16hl4W8iIDPvLcJk58GAV2q17RBPF72PPjDtukEHwuiMv/Y3yJSN/G0Yc/sDaT9v3Nk9oyVKypwvX3LQVGvDyo8TOAAwlqpE4Z8X2nWAirz46GquJqJott/w2yPjjIR2pj4RwobkbfGXSp0GLVpxYOqKYoJb83jNdptLG67RAWHD70uKtnlZIHpo0Jw8yEAm5EC4N7OOVY+Gztp7kkRlBnXWVHR7WXybq2pdUXBItQmnOoMbyMo2aJXGFjgXi/FIqcOqKY76UDOGCWg+SaWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzXumaAdTCV7UytoeINkQsGWGu/tWht84TAu86WP2WI=;
 b=gmH9nD3zA8olU6HMqIK0C7qpvB/qI367+WEzCbzllRC5zZ/Ezp7WDZ+ti+fdvCDTSZ6Eq2vbg+66qy8XRXbnR4QSJIWChy/yGibf4+B+jjbeYCfNjbZFpxEWxPYzXNRwXcByFF8u8ZEL7RbMwrIa8NCrsdLuttppEvvbMvbEydU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Thu, 11 Jun
 2026 14:46:47 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 14:46:47 +0000
Message-ID: <7219a677-f6fc-4126-87fe-c3f2addf0f05@amd.com>
Date: Thu, 11 Jun 2026 09:46:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch
 hooks
To: Peter Newman <peternewman@google.com>, "Moger, Babu" <bmoger@amd.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, corbet@lwn.net,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com,
 skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com, hpa@zytor.com,
 akpm@linux-foundation.org, rdunlap@infradead.org,
 pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 lirongqing@baidu.com, paulmck@kernel.org, bhelgaas@google.com,
 seanjc@google.com, alexandre.chartre@oracle.com, yazen.ghannam@amd.com,
 peterz@infradead.org, chang.seok.bae@intel.com, kim.phillips@amd.com,
 xin@zytor.com, naveen@kernel.org, thomas.lendacky@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 sos-linux-ext-patches@mailman-svr.amd.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
 <agzPTMvJ_LdEmKXe@agluck-desk3>
 <1a410ca9-f4a2-4956-8477-033d61a733be@amd.com>
 <ag4ywKHsH1Fc15wH@agluck-desk3>
 <a56f8ecc-cf1e-48a4-836d-7e7723072c38@amd.com>
 <CALPaoCj=UTSvk42n3+OY8LZ_mrEmDpsNXJ53oJd5t+9QVXA6Uw@mail.gmail.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <CALPaoCj=UTSvk42n3+OY8LZ_mrEmDpsNXJ53oJd5t+9QVXA6Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:610:60::31) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b280409-802b-44b4-d2b7-08dec7c84384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pQ98RMd0NOMJYeYuihcQ0KPz6VtwIIbyxAzsqref14Rmlv1sVCa3FWcnGlxL68PCkJo2x8oe7XKzvcPRzsVw1KNsj6mchCr5BpzP9S3ORbgV1Af3XfVR0IINPfW4MQOD3pP+ozS0e+jgouiYmaLOlMQaB+b6tKhy3LvIdnFcsk+CUamDNfQIpHpKe3RJqqMBT7SeLhsyvYPNrmxn9NV15NuVBeAKeF6Er/KvBp1fyvigQfiAiTn0RziZ76MSELHITx0O+zHSP2lnsF67yp2jMwPHmbpnH4EQZaFtqc33xt5uB+gy/luxrw5R8AuvOlYtZBnF1Hr7j0ywtGCeqPeuNICjGCRmw8jNCAUWKkSM+Go0ERh6XjnGhjFC3DXmZAhsiD66gdj4PrED17ImlHRaic5FFFDXkAkU0f3l6Qv1S7dewrfrncS5fUyQDW1XbJiUz9spoDYFci7I4K47ZRAJKlX6WGNQpKT+0Brt3wwI63LpV3Ek/o37iXfFOXgLTLE8kc5RQz6B5yJhLLEzQAtZIe3xWCFBIfasDL4VfJQJWHZSNM0tnNyUzelKB+kNhSo1YKBXYhCGJvKRbVpdBQLNFtYMvEdqUOL1VznruHDT6SUVhmCqHl5q45fEB15XWDbFooeOBREzCu75kgvsOHY6p4gWOhEF9Mdndp4BazdY2a+Pb33NMaMmRwQMEgXK+fg+Pz0YWccD57Lk8rp1mRwdHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGQ4R3gwbzIxNjRPTWRDMFMyRE9sdVVHVUJiVmVyV0lPSTBQWXlMb3g0bUZj?=
 =?utf-8?B?NEcwZ1IvV0NyM00xZEpOM0lOVDdQZ2lsQ1JWYi96N0ZCV051WDJ3RHdtbDlX?=
 =?utf-8?B?NGZpblJsVW10REJtMUZKdnJBZzhVZWNyN2tHdnNyb014UjNlOEVnQXFzV0E1?=
 =?utf-8?B?L0wwbzJrU2JOS2lsYlNvcVNnMG1YZnJrQ1RXSU41ZDB4Q1JqUFVaSS9CdC9z?=
 =?utf-8?B?V0FpQjlzSmwwb2xqV1F5SWpPVG9iM3hRK0pwMVVBaktvYnhEMG9wS0xzN29W?=
 =?utf-8?B?Z0VYbUllNGtHaGxZMEtlYktpbDFYU0dNaU43Mm9TVkpGTzh1bThZZDRab3FK?=
 =?utf-8?B?dFhENlFzSjV0bHdsWVZ0c3g5Q1hPZENSekViNWtDRnlLVkRLZGJwOUljWURl?=
 =?utf-8?B?T0MvTzNpcUJ1MHlWa3VBNDdIbVg1L1J4eXZWY1FaVzh4ZW9HOG5iWnprd0dW?=
 =?utf-8?B?bXJDVDcxV0E4Q1cwU2gra25FRUZLVjhrRXRQaFFHajNlR1krRyt6ZC91L3lm?=
 =?utf-8?B?akQ0aS9IREpJREkzNXNWVElWN215UzRTS3RhVUlSSWU4aTRNS05sZy92TUUr?=
 =?utf-8?B?ZWIzQmFoVmtUZ0Y1TWJLTnpHc2VHWXA4UUhQVi9FK2FYc1o3cGJ6WG9HYWFi?=
 =?utf-8?B?MzJrekhRUWYxRGU2SWdVMFN5V0pQNDNSZExEMU5RTWxNM2pmUy81S1AvVVRX?=
 =?utf-8?B?bkduelpzaFR2MzV1ajVPNFU2UmM3b3krZjBzWkY4dEc4dko4bE9yU0VSTjBm?=
 =?utf-8?B?aWZqRGVLcGpWL1dNejZtNHVTcU1GMnU3Q1RtcjV2V1BHdWVtRlBsVHR5Rlhl?=
 =?utf-8?B?bG5hbXJMMVZ1RDVmcjdZNWdnd3VOZnNCMW5HRjNqeVd4bUVqZUIrVTYyL1lp?=
 =?utf-8?B?TkVMTWgvbFFZV3o0eWFXWk9MdkJxVjlJdnNlVXBEN0JVL1A3SVNSSWVjTkFT?=
 =?utf-8?B?S1FSL1RRL2lvMVNqdTlXRmp2Y1BpWkphM3BGZlVCeHNaTUljMGlGQ0ppbGNN?=
 =?utf-8?B?b0lQeWJ2aGlqMlpnVzV3NjRxOUNpMlRTSW03alVXQ2FRVHg4Q3EvZS84WnVh?=
 =?utf-8?B?cysvWGZkTWtaZ0hvclR5d1A4ZXpFckJzcURLbkxKVXc3Z1FMejFiUlJZekVT?=
 =?utf-8?B?eGJJT2QwU0N3OHE0ZERaeVhtNENWRTM0Tm9mYmtrVStyQTU3ZVN4YXJqZEVq?=
 =?utf-8?B?cGlOYmFEYzB3S2dmaERCbUNyTmRpTHZ2ck90WUFranRtUXFwaTg2eVhjVkVO?=
 =?utf-8?B?V1NEd3M2bVM3cmhUMk94SDlLdUlNQnpFdkVKYUxFUFRWR21jTmJNMWdESTc5?=
 =?utf-8?B?cExyU2pOUDh2b0FFTkV1Z3gvV3ZiT2NqdFNONGd6ZGhlK2Rsc1RaNVNCU3dq?=
 =?utf-8?B?Nm1VYW9FallXblVqcjdjZHJkK2xZVmhab0ZTMFF3L3VJZ0VqMFc2R0cvY2Yy?=
 =?utf-8?B?MVRoSW5hWldkSCtJVWRzTnJMYTcrTGR0SGpzenZhNWx6SWJPaDlsTGRBWkQ3?=
 =?utf-8?B?NzhhYXB1Tmo1UTM0VFFBQ2Z0eDU3UGNVd3BVdlRCdVc2Mk53UmJpQnQyNXly?=
 =?utf-8?B?TjVjVkppSlAxUGxkY2drc2MxZVk0MnB2eDdlSnJlck9iSmMzUkR0emMrWXEr?=
 =?utf-8?B?Zk9pRUwyUkJ6alU0STFacTZSZWxzT0lkL0tHN0MxVktvVU1BMVczSFBZM1NW?=
 =?utf-8?B?cURsUkFuM29iTVdQRXVEVnAwWGxwNUJMdXlMZW0rcEVDRDN3YmtjSGtiM1BW?=
 =?utf-8?B?MExsYmhHWHVjdk9KYzE5bVlubW9kMmt4dWNyUzRKeDNDSFBVQW1lZ1IzOEpC?=
 =?utf-8?B?dG1wUWh5Wnh0dEJxV2lGWHhrMndIVlc0RkZvK0kzbjE5Um5HWW1iL1VuNklj?=
 =?utf-8?B?aHRKNVJsZHFpOG04L3ZLdllUellvVGtpdE15c0Y1NmhkbDhiUlBqNmhVR0ZW?=
 =?utf-8?B?MlNXUmRWUTFNZGRDYW5NWjdyN1FWV1Y5Rm9Obk1xckJ4S1dKaXoxSTRHTEFY?=
 =?utf-8?B?ejNWYnBFOThiNjdQRjllSnd2a2x5SVRyUEtIUWpaSnJxRmhqbnZlVlFwZVgr?=
 =?utf-8?B?T1hhK3lrS0FLM3pQV0hUOWZmZnBuSndSKzlCYU9uYjhyb2E5NTNtZTBwdjhG?=
 =?utf-8?B?d09rb3h6bW1ycEhTamZZdjlOeVRkdHhFakl4RnhjZDMzRU9pbHFrZHhYOGNn?=
 =?utf-8?B?OXVwRnNxa1RwUzhuTFJYU0FRS2lpZTdueHgrKzlTc0NtMXExaGltMFQ4T3BS?=
 =?utf-8?B?dHN6NXpTUXk1U0huUDY0Z1FOZzVDd0haSU9icjhlaUdOQlpqczdpa2VFQjFs?=
 =?utf-8?Q?XB/4dGbLZOse47t5BL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b280409-802b-44b4-d2b7-08dec7c84384
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:46:47.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSCYk0Oc/JUS3KdRLXfyvwkqavkQyNMoLJwtRIyXfDKPxZ4DOm4K5mdM8DWjwwVw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

Hi Peter,


On 6/11/26 06:44, Peter Newman wrote:
> Hi Babu,
> 
> On Thu, May 21, 2026 at 1:09 AM Moger, Babu <bmoger@amd.com> wrote:
>>
>> Hi Tony,
>>
>> On 5/20/2026 5:16 PM, Luck, Tony wrote:
>>> On Wed, May 20, 2026 at 12:49:25PM -0500, Babu Moger wrote:
>>>> Hi Tony,
>>>>
>>>>
>>>> On 5/19/26 15:59, Luck, Tony wrote:
>>>>> On Thu, Apr 30, 2026 at 06:24:49PM -0500, Babu Moger wrote:
>>>>>> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)
>>>>>> +{
>>>>>> +  union msr_pqr_plza_assoc plza = { 0 };
>>>>>> +
>>>>>> +  plza.split.rmid = rmid;
>>>>>> +  plza.split.rmid_en = 1;
>>>>>
>>>>> Shouldn't there be a parameter for the value of rmid_en?
>>>>
>>>>
>>>> I realized that behavior is not required—it was actually due to a mistake in
>>>> my v2 series implementation.
> 
> Really? This is in fact the only behavior we wanted:
> 
> https://lore.kernel.org/lkml/CABPqkBSq=cgn-am4qorA_VN0vsbpbfDePSi7gubicpROB1=djw@mail.gmail.com/

I have responded to similar comment already.

https://lore.kernel.org/lkml/1d7c79bf-1e40-4db7-8f66-45f234b6d87e@amd.com/

You are right—we should not set rmid_en = 1 in all cases.

For the "inherit_mon" mode, rmid_en will be 0, so the monitoring counts 
will remain unaffected. This represents the generic use case.

For the "assign_mon" mode, rmid_en will be 1. In this case, the kernel 
monitoring counts will be separate from the user’s.

So, we have both the options. I hope this addresses your concerns.

Thanks

Babu
