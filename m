Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46B8394EA7;
	Thu, 30 Jul 2026 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440394; cv=fail; b=MJuE58rV2q9aqtdHCtFEsBPZL5lJo76t4CI+tNty/ktrDrbjvKtiK9QWr9GFyiRDXbNoVTLR0a0Rz9j35b135eV4309n+T2/kHSDAzDa9+lm/dsL4Fd9j2HZXOvxlDIGfoqD69Z8QfVi1SE2bfK98j8Ok7v/KYLYmtyQ/3H0ekI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440394; c=relaxed/simple;
	bh=7dUt0gdwBlI/8T5hO9ll4ialkmy1PhQcjfN+gEPD1aE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=foCWhSboedS6MdCURQnNB+VCxF1snNXuHjGlcmKVIBhUFo0kcWYitOYtu8S7NmQ3Ta3ftg6m2KI4yWdJHxyhhCuKHgtTTchB8Lir7HkRrPJJ6BZeJjP6V0A4l1Sb2vBnMlF1d3tmutFxYCN6Fcod8bxKu19l0dhJLzA57Z1EI6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zDIaD4Z5; arc=fail smtp.client-ip=40.107.209.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zDIaD4Z5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4ZgSDIpUgBX3wD2m4J9JB/Pd0CGjxiP1YcCywIUeJyoMB1+s+8zJR+bYFX+aLvmCGDbHHQX6CUyPigqYWs/Bkdh7lZDzlR78tLalC3Fv4I/WxpYKqHZdC8Sv+H/eViYCI5r3kz48ohYh+C+My+76oMD1eqhleIzKlqbv7l6tIpBCwv1HLZ8kCNnuKzfBS8nYEt5zFdKqg7tp5NTvsayMgiAP7uQNcjPVS9EzdHiT6oqvm/F+HdrzMfT15yAeubkc3IJNA0TcOVADGpcPqwz5JyTLTUumXQPKuAlFMOb7+SeJPBcBd32s+jQAqQQ3+/vL0E2eNaLWwh7kr2D9XLMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgYMD0etOLHrGGpMs0SsGu28Dz7m5vZlix6VpmH4jmg=;
 b=qyJp7lTdvOWiejx7A0eEHvKSPvU/sjXi6nObxrjLwukiTGIzqofUzuzlki9YsTdCejzX8bH8ApsXNb+bQbYHrkVMwWCmH7VixYB+mXlk26SZ5EAlxUDUWJfpiS8itESOqbCRFWQgzwsQCINODqBHfvL7/yI5YY/C9B/H+/CZs0V+h2zulTjquXWi0A+x2RCOZu1Ar9Ju3Az/Rf7/3ILyCxeDeMe8uU9OrRgcB3am76D1Osp2Skg0j2L+lP8MJGYN0Up/Bmge5bxD5hOLl9c0rRAMZCROB7QzlVeV+MIPcok489sjAoFfdEuGsV/ogL1BSkccu5Lg+j55aU7J8TK0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgYMD0etOLHrGGpMs0SsGu28Dz7m5vZlix6VpmH4jmg=;
 b=zDIaD4Z5LWCP9DlBl3Y7wsRcaXbUvgZSUTAp/T1nh+MOiyEJaBv/fPNQrS3pxFLX+iJTntD5UCQF24M1DXqDOsPs618MzdUEVDcZ/Qw9yaeQPaA1IUmjrrOM5pvfJyw1tSPoi1dll4B36V9d7UVJm50XB1woakmwA8MKfBPPJEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:39:43 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 19:39:42 +0000
Message-ID: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
Date: Thu, 30 Jul 2026 14:39:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>, "Moger, Babu" <bmoger@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>, "Luck, Tony"
 <tony.luck@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:610:e5::11) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: c82bb1c1-f7c0-408a-0e5a-08deee724d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|6133799003|22082099003|18002099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	IFeSMCos5QCqlQ7TDVpi1R9cLu/fqHekGkd0aZAQvKYK3kFMutWP1sVzRAG719CCuo+kih3rfMU9Ka7HE75/5MkL62+k23ykGkThRYqT6MX5rF2Zm4Bgi2T6UoSYAiiwak5XvMFwTCpBzGCiq+KqgTbYg/XNQGF1bNwNC3N8sjs4Q58KihNBFpRKfWcQVN0CYlueTSD++3y86n7+NlHEAMJhBOOMwl7wb2qsnHFBuQK4Dv4MsuKH0oMdzK5z/suqLbZmGnuyjFKVU73Cs5E+A1JRYH0sKwJ5i80guOT96yrv0JBhuGKkhrLUNZ01lY8gFyJUfvxRfaGJxklkHE+i1YJq0idulKimWr3BvtrbhY0UfkNnoYTQp7QRHU0g2pw63Xj9McRR7NTxSBDZxOUrX7c4edVd1ISawdn3g5w1lB5Yt9tm0V4ZvTaHkVFwCQUjl/aQ+6DmpXLp2cN7HJcMguJ+J8j3uV47CqPVU3AOmgp+6G5+a6E+Yfn73yRn0UD9ghGYvSPV7+1DL+o3BfMFpx+hOr43/z+w8kH+pIExX+G2gmYhFp0HiLbovKlhYbOkoW+HNzkSTZLDhsw31hb6II0gK67BPqlttJIlY8WaPazgP36jKNk+ZzhmhDWAkeg+Mz1apOITq8TeSKAt1Trr6Zuc8XvYXYSzadcVkGojQTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG1kYkIrU2c4QzhPWDVoRWtjSm5mNTE4L3VNdTUwMUtONnFlVFFGekljY3hX?=
 =?utf-8?B?Y3pxMURYUHM5QitucFRmbWVaNDVjTWtneCtwSGdoY0NsNDZLSW9TU2lpeWxW?=
 =?utf-8?B?aTlSbzd1OTJLWUhQblhPQmpCb29EeDBpMllUaDA4N0xsV0FqTHN2SWF4b0Jp?=
 =?utf-8?B?NFNLd3VIaUlyVmlMYVZza1lJNTBvWjg5Qy8yb091cWJXaEp6TU9pQzZPZVJ2?=
 =?utf-8?B?R0Q3aC9hLzUzays5UVVWL2hjWmFIRmIrUnVTcG1pcGFtTlkzRnM4QWxhb3gw?=
 =?utf-8?B?My9IakpGdXdoMWtTS0JuUkxSNXdwLzBEbGV4YkRHMVBYMkdRSUpLdnRtbHFz?=
 =?utf-8?B?a05yVVNPdDNaM3JnN2tRVURib1Blak50SFRKQlg1MWFMWjBOTVJkZ3RDS0xR?=
 =?utf-8?B?MTlEWkhHODA4dUV6WDRNNFQxUkQ3RVlJL3NSYnFydUdkRUUwNXNCSGlzeWtZ?=
 =?utf-8?B?UTJXbEVmQ0IzNURwTWFzenQyWExOZmxwc2RMMUo3QWZ6VWJyak9DbDZ4VXNh?=
 =?utf-8?B?SEZuSFpXTUdwZTI3dWhHelNkOW04cmRna2hMaVhFSXJDdDRiT095bWlzVXdC?=
 =?utf-8?B?THJKL0VONFNjUFBzQllEUHhxeWUzeE1LNkZ0UXExS21DK2t6eUJUMU1OSm0r?=
 =?utf-8?B?VkF3cTlHTEZzZzE3Zm1XazgyQVUzcTcreFFtQy9hOTlSdG1JWnl0b05HTHlz?=
 =?utf-8?B?SFNOb0Q1VENSUUkyK3QwdFpCdVZ5cmNxTjZjckY1ckR4K0d2ZnczZ2YxaWhz?=
 =?utf-8?B?cDJwRUYvY01aSmxEVXlTNlA1NFZuZ3NsSmxYMUVZYlNVN3RwNE5OMmt4aUJn?=
 =?utf-8?B?aTVMNVlqWnlNMnV2bGJyS3IyZ2RVM0NYZWk4YjZWbERkK29JRFkzT3U1Y0hl?=
 =?utf-8?B?eEpXeGc3SXFodyt6a3dnMjllK0Z2cUpYZCs1WnBoMmZzMnc0QWpiQnNmejZS?=
 =?utf-8?B?NnkxK0w5dVNMWDRmN2xEZ010QXhZMU80WUppRlUwZ1JBRHlVc3luZlBWbGQy?=
 =?utf-8?B?YS9NbVFmS0Z6czBRWGFsUTNCeS9qQ0RxMjJXMlh0SGxyVmVGMEJIWGFibGdQ?=
 =?utf-8?B?Ym9xMjRGY1RYellpb1ZCM0xaL1piOXdzVEFVc1pXbVFhSUc4ajNKUkdORXh4?=
 =?utf-8?B?QlZ0c2REeU1SM3Zrd0x4Sndhb0pBYS83REVwaEZBS25ta2Q0SWpNMkI5bHJx?=
 =?utf-8?B?QlF5bVBFVXRWSDRyblkraTNGb2x6QnV0dTU4MTAwTnJKbjMyaTV5dFVhazh4?=
 =?utf-8?B?WXhXdnBsQk04Zi9xZzM4eGtpd1pWM2JRMDNoeHZHNzkyQlBHMzR4endoeUZW?=
 =?utf-8?B?NEJrbkJqSUpod0ZVWDJJNXB4Y0Nsd3UwWkRmYTM1ZmVoVTRIcndZT3ExQ3Ba?=
 =?utf-8?B?MjRncFlJckpkMXdWQ2pYcWh1WHlDRmZEUi9XQjZIWmpRdGtVN1Fna0xjRDdD?=
 =?utf-8?B?YnAza0IwOW9Nd1h5b0tYSWgvSXlCSmN2UjRPSFk1eUJkZjYxVzkrbUdhMWdj?=
 =?utf-8?B?YlJLNkpnVGtEV3FFQnd0dTgwV1J4b3VZVlc5NitUWXkyakxNUTkvUDhBSEh0?=
 =?utf-8?B?SUlVa25TaVY4RGphSVd3M080ZlFQd01hYmplWUFic2tIQ0k0UW95akJvUWJZ?=
 =?utf-8?B?b1VtTnoxOXh4Y0FKNUQzMkN1NGxyQlA5bWNMeUd0RkVBTGJXaE1GdVh0QXVJ?=
 =?utf-8?B?MzNRbGdNN2g1ckZKdkhFcUV0TzFkZ1M5N1VEbHNhdlRBdTg4L1V4akpTV1pO?=
 =?utf-8?B?QjdBWW5pZk1UU2JLUDhzd2xnTlFJaXNybno3V0F0eGxrbmN2U3AzNDNGN0lx?=
 =?utf-8?B?MkdISDE5QURiUWFpQnVGKytBRVRNZmpTZmlKbURnTjRSK2NvR3BLTi85Ykd6?=
 =?utf-8?B?d0duVmdIcVJKM0pBVXp0NlNDaWpxMXN3YUxpaU53TUY4a2xhVE1aMU1oMU5h?=
 =?utf-8?B?SXpiZCtvdzRHYkZjQllyVWV1OVl2bkh4dk52LzlqVjJ5ZjA4dkZtdkg0Vk55?=
 =?utf-8?B?K0tDL1Faamo4eEhUdkczVmxPTlhScVNSTWJ4dFhlM2p5RXBNYTJ1K1lROGdl?=
 =?utf-8?B?emFNSllad0UrVjRENzEybk42KzhmcEtnb3VOM3VtV2FNVVg1aUpHNmNNMDdv?=
 =?utf-8?B?Y0dtOGpKZkJ4QXJTckxqWUJCT2l3TGRvL1RRU3lHR29qTjl5L2xmVlVuTHJi?=
 =?utf-8?B?NkJLRTBzVTM5WXhnT1h2TnJ6RlltTFFtTk14UXFlaDQ3WGdPb3VLYnMvMlV2?=
 =?utf-8?B?SWQ3OVo4cnFkMHQxTGFkc0hLaDE1Q0F3dkxiMjEyYjAxOXZCZW50YUc3eXdQ?=
 =?utf-8?Q?YbkMAwt5VuIisnNKb0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82bb1c1-f7c0-408a-0e5a-08deee724d8e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:39:42.9237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seIpruilJYVHJK5amdIjR0wMnnGnOUTHau7ox4Xg85laU0yVKAtsrG7IAxU6/mEA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

Hi Boris,

On 7/30/26 13:46, Borislav Petkov wrote:
> On Tue, Jul 28, 2026 at 05:20:54PM -0500, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 7/28/2026 4:58 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 7/28/26 1:43 PM, Babu Moger wrote:
>>>> Hi Tony,
>>>>
>>>> On 7/28/26 15:24, Luck, Tony wrote:
>>>>>>> 1) Does it start over from zero?
>>>>>>>        Seems a sane option.
>>>>>>> 2) Or does the monitor group see whatever the counter was at
>>>>>>> when being used by some other group?
>>>>>>>        Seems less sane.
>>>>>>
>>>>>> As per this code, it should start over from 0.
>>>>>>
>>>>>>      } else if (ret == -EINVAL) {
>>>>>>                     am = get_arch_mbm_state(hw_dom, rmid, eventid);
>>>>>>                     if (am)
>>>>>>                             am->prev_msr = 0;
>>>>>>             }
>>>>>
>>>>> Nope. If you want the value reported to the user to start over from zero,
>>>>> then prev_msr should be set to the current value of the counter. That
>>>>> would make the next read start from zero.
>>>>>
>>>> When an RMID is reallocated, the hardware detects the state
>>>> transition and the first read returns "Unavailable". At that point,
>>>> the counter is reset and begins counting again from 0. This is the
>>>> expected behavior on AMD systems. Therefore, setting prev_msr to 0
>>>> is the correct behavior.
>>>
>>> I believe Tony was curious how this looks from the user's perspective.
>>>
>>>>  From what I understand it is neither of the presented options but instead:
>>>
>>> 3) Internal cache of hardware counter (prev_msr) is reset when resctrl discovers
>>>      that the underlying counter has been re-assigned.
>>>      There is a separate software maintained cumulative count to which the
>>>      hardware counter value is added as the event is tracked. This cumulative
>>>      count is the value returned to the user.
>>>      The user thus always sees that the event count increase and it is
>>>      guaranteed to only increase based on a portion of memory bandwidth
>>>      consumed by the RMID/event being tracked.
>>>      The returned (cumulative) count will not be accurate if the underlying
>>>      counter was re-assigned. The user does not have insight into how long the
>>>      underlying counter(s) was assigned to the event being counted.
>>
>> Agreed. When this happens, the counters will not be accurate.
> 
> So, to summarize the situation so far (and all y'all, I'd like you to please
> only reply to the questions I'm asking. Babu, please do not try to summarize
> it for me - that's what I'm trying to do now.)
> 
> So:
> 
> Background
> ----------
> 
> On AMD, ABMC (Assignable Bandwidth Monitoring Counters) mode is enabled by
> default on machines that support it. Some systems can have 32 or less
> counters.
> 
> The old default measurement mode uses RMIDs (4096 available in total) and the
> hardware can track 64 RMIDs concurrently.

Therefore, creating more than 64 monitoring groups in the default 
measurement mode can lead to inaccurate measurement results.

> 
> Problem
> -------
> 
> In some cases, all ABMC counters can be consumed, leading to counter
> exhaustion and tools like pqos reporting zero bandwidth for the groups
> suffering exhaustion. It is important to note that in ABMC mode, two counters
> per monitor group are used: one for local MBM and one for total MBM.
> 
> In contrast to the old default option, the ABMC option which is the default
> now, is only half the counters so the exhaustion can happen faster/easier now.
> 
> Is that an accurate initial summary so far?


Yes.

Thanks
Babu

