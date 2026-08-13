Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70FF46AA7B;
	Thu, 13 Aug 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634282; cv=fail; b=OXQjHIE/IIHN8EK1ZLPI91LBWidy5yErHmvqNok1gQZF06Cgf9TwYZnmFMvDfDs/X5mRuY8rfJUyWLYtN3JQMPL8s9ymmoRbTYA31y/xAzjq2TwKOA0BkhFebaLzAtkzlbrTrSYqO9dh59kP+YSfhmVCYVdLBCSOAMRDl4kpalY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634282; c=relaxed/simple;
	bh=Uqa1tBlSudylop7WEs8pyXr2wXrHASTueFrJ8Nb/gvY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KhtKWNtAzOtIgBCZF7KW3HZA/1apwZ3aBU1dKZs0rOStzd/Prq/4cJefqfH7RUGqZMMUXEUSgkX3C0z48RPuyFKI9Mi/+y2lZfReb6mGOk3++XcV1EQI2GUdnZhTxbPl4bRBp0xJNry6V34cQJGJxPYo8nYwparvTArBA7e5CI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UTU3QnXM; arc=fail smtp.client-ip=52.101.85.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UTU3QnXM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXaTYRUmby/7degF2RT91u0CDYSqcHr38ueRyrqLq88tU1GB2qvhWPkgGUCRLzUm8yp1JoQIYJ+h6bmYa7Hx+L7gg6WVyKpj21IQmYEu788k2XfIsROqrQiS6mGMU+I+x7l6PS0lzKTwFEMTx+cBoVYMNIqTNz0ldEe7VkY5WYqARI+9pI0aBJ7q7qLBB2IwHN/bFlq3h5sBkHXHsHZTV4zDaOVItyL7pASkR5eKoA3bSrGmLmKViMfZyCXBa3Hm/Q2Z2vRWTEXevcMVE0oyBYd1qHByduyUXXm/VdApoHyDwUJ9f53OkrErv/U/FwZeqzPon9b1gRlynfmaMMQ8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XKJmKbRg+5j1tAJkOUQT3Wjd4geKZm9UrPI1Nxt6Xs=;
 b=K8I1KsZNKi6TvNKedY+CK3p9iWclGdRWmkrtNIhgmo/5viNoji79tsPwo6e4ydKFvYkksAb8JaXkfv9nrw+W3hnnngboqRZAgnpxruzRQg01YxaKrLKzmAgXEV/MJkGNCAlg1msQ8Ck1aFMbOBhAm1sKzIC2GgXBMuCfBCxvYj7BY7D77uWb3b8p96491BUGglE8myhxpor+9rtl+baxxeDx7rf4w1uTW+pwO5x+MfHXlPygvz0DMsOIDOEJw/TTH4i70UTRdXFWlvvlFLVSVbLkGRAArv5gMJNshIhmA5JVtCKlRpwNm35lqgpdIDYElkaGRPQO2nEtGqx2CQ9GJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XKJmKbRg+5j1tAJkOUQT3Wjd4geKZm9UrPI1Nxt6Xs=;
 b=UTU3QnXMlgOhkwxwF26Y9flIRXAkGdG/3l1VmJ68jWUZbaA3hp7GRx1TPnQithA4i0M/V+UGEQNfV1Src3KiQLL6/kqGi1nE7OAYNGKz92w0E11qtoNkfKnCa5DkWZgo7o7yg/yoXSQqKb+zAnYYT5gO/7w45/dwdXezFP0inEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS3PR12MB999242.namprd12.prod.outlook.com (2603:10b6:8:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 13 Aug
 2026 15:17:56 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 15:17:56 +0000
Message-ID: <9a53023a-9d6f-434f-96d3-188a176a6cc2@amd.com>
Date: Thu, 13 Aug 2026 10:17:52 -0500
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
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH3P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1e7::29) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS3PR12MB999242:EE_
X-MS-Office365-Filtering-Correlation-Id: 595fafc5-0938-48f9-7271-08def94e0d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|56012099006|10067099003|11063799006|6133799003|4143699003|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	BahEh6azaB34c/bS4IgrwI3wGs6UhcvhBStacw8NqVfPjgyUfMgsJXbSzmxqxmnTZPBpA5CanLl6Iubzpev0YfM7ejA6SighjO6oO1xqvZQQZkOADNSN3mdgRKfNG9k+/vvxfDR2lqfCPOhxdjQc398nNYFqm3CIzuzZkns7dREpyiik1jHWbOKZyQtZ3Ud3nMMFBbepgQkWiBn1p96gD1Kzjf/XuaiWLEYLwiuN6vrZreliVXh8nz5zb9pbEz7HkJGthR7EmCdrE2e41Evv639mbdacE7iJn2xRYz9N0NGYx/1PBXXqDsJ6Yb0Czn2HBWdtrY3uTNsKU78J4bKV2uw3VNswy0RW9aA/bdeBgxfVqQn84RP7u3wUcrc5/ZgeoS9thu92Gofpz/OLIp8MdCoQGFeMNUJ11KS2dGTWiBmloxEoT/0WXQMlt2IQqH1Jsb/BrFSKMD/hf00G1rjnQ5pG59EqrIjN8LwJeKZPpKs6dDIZhw/9e+FZYZ1kK+OYtMgr2DMzy75T/DqC39mCV/tTckuT1UMMahOTvIsUc/xi3gMw6iMCXC8Nz3QpAaPDRQplGYpzt3GvLQ1FM3EsT0XU96xvGm1rSwCmb0lynzG9u+BfXR4fZl0QSd0q3xiQuTvjOwsZLssn4BMGfv3Ixaj0B7IiUowwXelcBTeGYvRSSGXp2uDCO9Aeo1m69m1ZLjdlTZU323iCGRYRpXYkfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(6133799003)(4143699003)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkZGNUF0UFl4THp6clhidFh6Y0RFcURqNTQzOWRzTnhGVUNmQU5tT3l5K1Fj?=
 =?utf-8?B?Z1FnUUJMRWJSa2xCcUNNdWVMeHN5TFFLcnpxK3dQN09lVnBnTjB5R3V3MFJy?=
 =?utf-8?B?ektDd2ROYmZRT1hKRm1lN1ZIU1VJSnN6a3FHYTRoSjRXaE9oQ0tpbjdPZ3ZS?=
 =?utf-8?B?d0JweXZWVU1kZHhTUktVVkgzM2lMQlBsNVlSTXM2RzNEYkpnVzVUUXVsN3hk?=
 =?utf-8?B?bFVNZm1acjRWSzFlMkQwSmo4bDN1VE85KzBidnpEZWUzazVpM2hxaXFLWlli?=
 =?utf-8?B?Q3NqNEwxcy9tdnZXSFhLVXc4VGdyMGNIbUxLY0dPeDBCVUpkVmFXbXlwc0E4?=
 =?utf-8?B?UmJBWmlsdW5ON01wTXBkdkVCWVorOVZXSjdZcEIxcUVFcVpYOXBaRWEwZ1lM?=
 =?utf-8?B?MjlDa1FPZUZuVDVORzlzSjk4eU5uWjFaY1dlbDZ0blh5NDQ1M1RwTXp5dThQ?=
 =?utf-8?B?RGtKWHRmZEUwZm03amhwRGo2OHVPYThtNWVRZmIxazJsSExobTQwRE5kTVNB?=
 =?utf-8?B?THhiY2JEaXFLbzYyaTV5ZzdhNEVibWFydGxwTlJ2MElqeGtuT2UrcHdWam5X?=
 =?utf-8?B?bVRoMjllVWdXU2VyTk0rUGdQbjR2VTJLWUVYT0pVZjRpQm8vWE9Wdml1TWwv?=
 =?utf-8?B?Q1FHcFUxbFRmYlNMY1JJanlzQlNpVXg0Z01udTAwcDJYam5GZlNEcFMzcC9q?=
 =?utf-8?B?M295a3Eyb1hwTWJYL3c3Q3NDbUxwN2VMT3VnOXpTb1dFbnByV1M5blVndFE3?=
 =?utf-8?B?Y2t1QW9hNnR6Z05CelQyNlBldDBBVDJYNzF6VnFpTUdtaEZVS016MGpqWnN4?=
 =?utf-8?B?czVPQ21GeWkwL29JcS8yQ3B6VVk5Q0orbmxyQXNBbHJlQXY2M3VhbUxKTGhX?=
 =?utf-8?B?bjJTcnZPNkVFY0hJV0R4WGF0MmszK0VMaHlwc2huYVpZQUNXQWdLQUV3c2lT?=
 =?utf-8?B?WVZWSHcvOVNpazE2NTNSSnpWT2d3L1N4WllpMkJ2bVZnVXBuV2o2dW1vcjRV?=
 =?utf-8?B?S3ZZb0poYXdyRWs1cVg1ek5XN0RXelBzWStRdG9xQnhRampMZ2hNZ2habTlV?=
 =?utf-8?B?L0Z4MWcxQmtHV0NUNDIzVExpM3JHNDY1cFU1VksreGVmOFAvUW1VWEJhR2VP?=
 =?utf-8?B?TFNadWdKaEpBa3JsWnc0dHRxbmNTWmdrNkhFWjh1WXJQZzR5SE1NV21rV0RP?=
 =?utf-8?B?aHlGZ2xiZ2o0dzJrOEFGNVBLUW9QMEFrcHFoVUs2OWs2Wm1Yd1R0VEJHUXB1?=
 =?utf-8?B?UmlZMnJTcUk2THM0ZysvYjNKL2lnbGZIdGtXSWhqQ0hIVzNSQm5rTkxDS3lQ?=
 =?utf-8?B?MHYzYmt3OWJWOWtWZzVLbGcvcTdCYWVyY3BraFdIZDdDbTBmMzJFd0NoejdY?=
 =?utf-8?B?czE4WDFPN3I2WUdTQk9PYzllUUJPZDc1QURkSHB3TFdsb245S2hNK3AwYlo3?=
 =?utf-8?B?S0VjeUV2Nld3dnQyUDVGWmRvUndEek00VC9GUWNHVDQ0UlRJeWhzTjVLNGdQ?=
 =?utf-8?B?OGlLbnpKKzZWYmNKWDB3aiszZ1ZJTzdyWnZPSFZuRGR4d295MzhRTmRqSk1I?=
 =?utf-8?B?TGloc0oybWpuVE01WVcrNWYzYnZuYmtkYWJsQ0V1OFFyUXprTUVWbURrUDZM?=
 =?utf-8?B?UTBZNEFPOVFoQjdmUFBwK21oZStBYkNmbFYrWGZvTEpqWWdqZ291WnpGTitv?=
 =?utf-8?B?TG1MMDU0dHgvdzJuMGVXS3FTZHdZcDdrSWtlM0pQb20yb1VDOVBSNmgwcHFR?=
 =?utf-8?B?Tlh5MVNldnpsZzQ1cnR2SWIzYWRrNWQ5Yy8rRnZVbGJ1YVB5MjB0cjkrZTNK?=
 =?utf-8?B?Z2pUMEVBVEsyK1hYZmxrQTNaaVRIdFNzRVcrNWE5MEYzOGtmWFNQNWRMWTlN?=
 =?utf-8?B?ZERuSnhqckNoTnF3YmplYzNlWms3QXVFUE5pUlpnMnZMMWdMTlJncjJtcTVN?=
 =?utf-8?B?RmFUVDVxa3hJUUtRTjNoeVhtTHRMR014MmNFblNoQWh4WWdoMEhQSXFVNkUx?=
 =?utf-8?B?NmNwS3VQVzdZYndRRlpZeXZhaW9TMDJHWDFuZGxFcWxMZ2lIWXh2aXBzK3Rz?=
 =?utf-8?B?WXFRRktmdnV4OTB3TFRSdm9JRmVGaFRjVHo4NjMzUUpyZVZlTmg0K0UrNDBB?=
 =?utf-8?B?UGJmNlcvamExdFBNUXJNK0ZiMXYxdEhVb21RSlBGVndPYndma3AybWQ0R2NG?=
 =?utf-8?B?eEFuTlIzbDMwbkY4U2xzQjN5RlNLRmFPUGFXYVVKMzlVVnQ5QnF2dDhnUm9z?=
 =?utf-8?B?d0lNNlorRjB2U1M5aDV1WlpoM09OMzdzQzlQejZicXZOMVkwcTFJNFdRT3M5?=
 =?utf-8?Q?+qz84j/sdWBV5EgtXN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595fafc5-0938-48f9-7271-08def94e0d5d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:17:56.2255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39JJp47LgRuQ18KbAhGVkdQA5yZyx6bQQi8TnD2bLnZacIxq3GzSswV1Ybio9LIe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999242

Hi Reinette,

On 8/12/26 18:28, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/12/26 12:58 PM, Moger, Babu wrote:
>> On 8/10/2026 10:03 PM, Reinette Chatre wrote:
>>> On 7/7/26 2:50 PM, Babu Moger wrote:
> 
>>>> can report what is active or what the platform supports.
>>>>
>>>> Introduce enum resctrl_kernel_mode:
>>>>     - INHERIT_CTRL_AND_MON: Kernel work inherits allocation and monitoring
>>>>       from the user task (current behavior).
>>>
>>> The issue with this "combination" mode becomes obvious in patch 7. I also
>>> see that sashiko hinted at this issue but I am not able to see from your response
>>> what the plan is to address this. As highlighted by patch 7 and sashiko the
>>> "allocation" and "monitoring" features of a system are independent - a system
>>> need not support/enable both. This should be easy to reproduce by, for example,
>>> booting a system with needed rdt= options disabling allocation or monitoring
>>> features.
>>>
>>> I think it will be unexpected to a user on an allocation-only system to
>>> see interface like:
>>>
>>>    # cat info/kernel_mode
>>>     [inherit_ctrl_and_mon]
>>>     global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
>>>     global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
>>>
>>> Should it not rather be, for example:
>>>    # cat info/kernel_mode
>>>     [inherit_ctrl]
>>>     global_assign_ctrl_per_cpu:group=uninitialized
>>>
>>> Similarly the user input would not need to provide a monitor group when system
>>> only supports allocation.
>>
>> Ok. Yea. We need to separate control and monitor separately.
>>
>>
>> How about something like this?
>>
>>   # cat info/kernel_mode
>>     [ctrl=inherit,mon=inherit]
>>     ctrl=assign,mon=inherit:group=uninitialized
>>     ctrl=assign,mon=assign:group=uninitialized
>>     ctrl=inherit,mon=assign:group=uninitialized
>>
>> If allocation(ctrl) is only supported.
>>
>>   # cat info/kernel_mode
>>     [ctrl=inherit]
>>     ctrl=assign:group=uninitialized
>>
>> If monitor (mon) is only supported.
>>
>>   # cat info/kernel_mode
>>     [mon=inherit]
>>     mon=assign:group=uninitialized
>>
>>
> 
> Please always keep in mind all the requirements and use cases we learned about
> during and after RFC v1 of this work.
> 
> For example, we already know that "per group" assignment is something resctrl
> needs to be ready for. Consider the example in
> https://lore.kernel.org/lkml/aYyxAPdTFejzsE42@e134344.arm.com/
> 
> There may even be "per task" assignment in the future.

Yes. That is correct.

> 
> Constraining this feature to PLZA will make it harder to enable the capabilities
> that we know resctrl need to support in the future.
> 
> This is how we originally landed on the "global" assignment distinction
> (https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/)
> "global assignment" should be kept or replaced with a solution that continues to
> prepare resctrl for these other capabilities.

Yes. Makes sense.

> 
> I am not able to see how resctrl could support "per group" assignment with the
> interface you propose above. If I am missing this, please highlight the solution.
> 
> resctrl may need to explicitly split kernel mode from kernel mode properties. For
> example, below shows an "assign_global_enable_per_cpu" as the kernel mode, now with three
> properties:
> - "ctrl" - could be "assign" or "inherit"
> - "mon" - could be "assign" or "inherit"
> - "group" - required if "ctrl" or "mon" is set to "assign"

ok.


> 
>     # cat info/kernel_mode
>     [inherit]
>     assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=uninitialized

Shouldn't this be like below when default is inherit?

# cat info/kernel_mode
[inherit]
assign_global_enable_per_cpu


When the default changes to assign_global_enable_per_cpu:

# cat info/kernel_mode
inherit 
[assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl_mon1//]

Display the second mode with properties only when group is associated 
with it?

# cat info/kernel_mode
inherit
[assign_global_enable_per_cpu:mon=assign;group=ctrl1/mon1/]


> 
> When resctrl needs to support "per-group" assignment "kernel_mode" could contain
> below with supporting documentation noting which per-resource group files will
> appear when "assign_per_group" is selected that user space can use to manage
> the assignments.
> 
>     # cat info/kernel_mode
>     [inherit]
>     assign_per_group
> 

I know it is future. What could be difference between 
assign_global_enable_per_cpu and assign_per_group?

Thanks

Babu


