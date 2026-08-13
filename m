Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D705336892;
	Thu, 13 Aug 2026 22:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660873; cv=fail; b=Ef3GVnsYuFfRWwdAVgBOiHB7IJ2ke6pSBduLZ4lyf4y17U01kfqGQkL4EjeHDJIqcpIyYQZABQnfNuI+rIk2S2RKhytfMCQz3TVRJebkNUjPaqsSEZnx6Rkm8QeSLFNfs1egYiafdZ552+DVCOJHX7g8QgAWhRtwu4FLEFoooFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660873; c=relaxed/simple;
	bh=Brjxv+9oIWXLCy/U37ayM4kf244Qv/Rdzw7ip8/WOmQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sGYp3lMZnB+eUVgBKby5afrsK19wE65pGXMGG1wW8LVKXsuHggRnudKZk01Kfceq7VCa0EEhxchw9dwRxzPwn1lTnyPNT0PUQmPrCo09I31KdCLI0WoNiE95aw54tb5IsN1pt0nHrIdIp91qCwGU+E5qrAwHPlzvL8KKS0wlpHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U8KBczVY; arc=fail smtp.client-ip=40.93.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U8KBczVY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThK07yzLNpsr7bQzlGT2jPMVnI9a2pNJ99iAic/DzsehAlasxegu2kPrOY1FWXwwuRnaemSLrTaG0Psv8wZgJvEhjxGSiRXETnq081cci+WBry+AXTaJgHjC0kgqu3pMcPwZeMyhp5aixuCEq6TOCK6E9TqBCBUvn1DzTP31IjPhZpGP+zCxq4J1eScG+5fbrJ1Cy1jbP6NSyI1aMWf2lDKnLRwXFAI5PbN1OwLroFUJn6zrpxuQYcTGlzFCoD40CyDwPZaBkYxJ2pOyTMKJ6PZjwei+QxFFFP3LFfCJ0jMy/odh0Eci6zykmaLa+wPewi+AKYZEc4oR/qZTNZPaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OLYDhXsKHK8xKvkHT7yNasi758hJR9l/6Jbro3UYsI=;
 b=Id4xOkf0hnedWn4AQyzdMDMYa1keIq0usMW4r9ab3zi9TTIkZuDXzJ70lQ5RX0qWEsmuNHMZGQ70HtVPkyjlQ4XA2XSFnp8zcnp+Zv8cCjVsM4dTYDgFk2GGRqfaOZpunc9C2TFizMMwuktDm9qVmExMJNtdLDuaEOcasPL4N+m4snVn93anv4sWUMOXJNWiAQ/FTMPHo5gABBfmGHQvHAc/krPxnfw7cpMa8dcnfzgwrpJlWgjkuUNOqgPl4JjTv9E9E3ci3bvgjNWVgaVindVpzmAq8oNCeWH/0tBWQZsoApqwX9kdJzYyewTZh1KN9DmpHNXxz0WRTqKAeUrGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OLYDhXsKHK8xKvkHT7yNasi758hJR9l/6Jbro3UYsI=;
 b=U8KBczVY4kICStZCq+QjvlNPbuN9u0ZIZGXMv1dKmoV9IjfkaOgvGB9mI35WUuLcKYSKIdLaKLsrDu3FV1ZYcId9wkFac593pf92QIWtiLynysfxn1xvzBhesB6VpSaZX1VNDcqll2Hvw63AKMgWAQZqFRgQTVVdYekwkWtfTbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 22:41:06 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 22:41:06 +0000
Message-ID: <58989940-5f9c-464f-8675-322aa047345d@amd.com>
Date: Thu, 13 Aug 2026 17:41:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 09/15] fs/resctrl: Introduce
 kmode_cpus/kmode_cpus_list per rdtgroup
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
 <27afa5e408453c93790e5aef61fda31355d96ec9.1783461016.git.babu.moger@amd.com>
 <13834492-22f1-4135-8c57-74052544ed17@intel.com>
 <c4311423-cafa-4b59-8e50-189fdc241de8@amd.com>
 <98568620-7e61-4d43-b72c-5866a7d3bca1@intel.com>
 <de190a51-4c4b-44db-9444-5c79f75f0887@amd.com>
 <bc0e0864-d1e6-45e5-b24c-c073f9cb3fc1@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <bc0e0864-d1e6-45e5-b24c-c073f9cb3fc1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:6e::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 230afd23-1b8e-4ed3-9b46-08def98bf66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|921020|4143699003|10067099003|5023799004|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CiafttIrLl7PR8dPXdiACNdkVcJWzCwbsdNu1CrsWrBpnV2gSP4eWcvQvQNRAi1KJAtI1Jwz5hgnbbW/xQrWcSOa/j+caOJbEVFwMABoF+NRsI6G5+I4BciEadIshlOo6/qkimUBu8tSJia88rYQ4T31LpQKZG1YjgrR2N6Qg0zPvxdoHZVdG8Fe7vEoQdQLjynkrzsX3oy1gX+JdUHou8ymsUnXm7vzXk5pJ08oDIvaignDpydAYuLjv0vC81N0Qvre2H2kgx7m372gy9SXbANzhNMyPBdXHTEaVJag6lYmS7hZTtRgvRO4+ODeS9n2Cw3aeLVUcUPznrRUV4PDJ0KKRX3UU+hxPpfjP7T+pHEdpQKwZFp9hUqW95DXzGtjx/C/vONrewJE/r07J0upx1A0mRlVnEtFKGSbMW9PGCHdpn1CgO2GZDn/QAXk4w1wRX4OHQEmAOwFZFWjQ1ZFt1f64osur3UGIDkniF8dXbM3K4n12pjHXmW3uuesVzsFRxTrOmVXSYA3GNeJ2PNNi61dvzYzONpwytEdCBRj1Trj0gSSpia4akDddjHkXXRl3ubEeI57QPWund2zNtWgRsEycFmB1twhu54b0+f29kpJQDUexBo6q2ycD/M/iSx/VvMG9GBUoEGXAFW03Fy51eqJDb0+227s2MF6//h+8ababYuQ/JkOsb3AgGDnuWqljPk1IaW8qPAvBY1J9WS+QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(921020)(4143699003)(10067099003)(5023799004)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGJKL1BOMWdwb1pUOEtwQ2cxa0NHNXJPS3d3VVpldi9Xc25NZ2FUQXFSUVdD?=
 =?utf-8?B?OU1laG8vamRYVUhXaE11d2UxOVg0UzZmSW14K2JJdUFxZWhxMU9CcEZKS2Mv?=
 =?utf-8?B?ZHNOTUIwMXRVOEY5Tm1GMmpOdVhvQ0YwSkoyKzFJeFlvWlRsbHpUSVBCNlhp?=
 =?utf-8?B?ZjJDaDZiNEhaa3lXK0Y1cGNNTkwydm5XRGllRU1rYWJDT3dNQW8xa043TjJO?=
 =?utf-8?B?Z09KOWdNVjNrL01vOTVmRG5Rb2hwM1crbG1aWlpyQlVTa2NlMS9pQVVBdlRW?=
 =?utf-8?B?bXpFMkJGODZqRFlmR1pidm0zSVQzMnpyMmJORXhMbmp3aytRM2lyNjJVWmdr?=
 =?utf-8?B?aVdQb3V5U0NWclg1WGtMRzU3S3lndi8vbDYvMVZGWVpGN1BEQThsTm1hV1Nu?=
 =?utf-8?B?NlZtY0VhaGpIK1gzMFBVVzhMSU5jdEJmUUh3d1dxT29XYkMzd2gwdTFzSGMx?=
 =?utf-8?B?cWorNnhIUmh4Y2dERmhIOWRyLzhieUdQaEJKdzZrQ1BLNGE3Z0YwRXFwMVpk?=
 =?utf-8?B?TC9KTWM3d3dOcThFM2d1RXh6Skt1Q2U0SFo2OTIwYXcxcGNPUE40S1VtSlVk?=
 =?utf-8?B?V2hENzZVS2JuSEZ6U0hwRDZjeFF0VWdBLzd0YkJFZ25kbDNPVGRCT2Qxazdw?=
 =?utf-8?B?K3o2cFBoOEthRTBsekRYM2dXKzBmQ1hjQW1sU3ZVSkE4enNIMnRrU3RyaHNJ?=
 =?utf-8?B?SWlOUFo0ZldnZzg0Si8yZy9IcGROR05WN2R5NnhVcTJQVW14Y3UyK3M0RXdF?=
 =?utf-8?B?R3V4WStURlkvODJTT0FQTlIvVVVMYi9NbXJ0RGo3QkRlZmZHV09IWHZ6bUdk?=
 =?utf-8?B?LzB3N3VsNHM4b1lrcmtncFY3N2F3UFU4WWJZK1BHMzJTUU54d09OQWVEb201?=
 =?utf-8?B?T3BIU3JWak5NeWFaUTZmN0pPSHlJNzJoNHlDb3EyVC9XMUFncmFGM1pRMGJ3?=
 =?utf-8?B?NERGSDZBWFBINmZBUmo5TnNUcHZYaFg5Ujk5TmorbUVsUXBScmQ1eXhXaVBk?=
 =?utf-8?B?K2d3RC9TQzc4eUJpbGU4Wm45b2ozZ3hnV0tEUUR5M2dTQmlIUkEwT1NJNm0y?=
 =?utf-8?B?R21ZY2xJelh6UlNuRFV4STk4aHBacHZqaVQ1NW9NR1NFekxQb1dmdUJ5RE9u?=
 =?utf-8?B?Q0ZZMnV6ZnZncEtMNUl4aXV4MTA5RnlYVTNJOVFpaEFiTzAvN1RzUWxnbnBM?=
 =?utf-8?B?MTVMN2ZKV0EwQ05nT2xvMmJNYUk1a1l2c0dqUWprV0NGMzZua25BbHhFSE5L?=
 =?utf-8?B?Tmt0SFZ4UFVBaU1XWStucDdPNEV5UE1ZcndadlNtR2hybU5zUmthdk1mYTdF?=
 =?utf-8?B?YjNudVRFYzhSZVJKaHlQSjdTUGI2V2N0UWEvUk4vemFPY29oaHY3NFhaSlFo?=
 =?utf-8?B?UVh3MWdIRGF3ZFpUTUlpcVhQQXgvTGdJYlZwRDIwTTZSRDZzNmJETGdKQlhE?=
 =?utf-8?B?TnZTYUs4MlVnM2dERkRmbC9jUVhUdXM5UEg2ZE1jOVJocGlnWkpGUGNma2N3?=
 =?utf-8?B?Tmdpb1htUlphNmpWK1NpUGF4YlJaOUk5c1FNaXVCOFNxbEh1TWVLMWJZQXhR?=
 =?utf-8?B?VEMxYnFuZExrYXo1SkdZcXJBa2kvTE1rTzRKZXh1YWtzUGpTWEpIcEkyRmJw?=
 =?utf-8?B?MXplNnFlaW5rcU1KYWlIS0FPeXowSURIMTZWV1Y4T21XVXI4cGlNVDA2Witm?=
 =?utf-8?B?VDNRTHF6L3czZkJyMURyYlNYd3R3bDMrZk5zR2JLcXd4VFpVSjlzUXdDL0Fn?=
 =?utf-8?B?NHEzSG84OC8wK0NyNzlIaVF0cXRjTjA4azBuUnVYWktYQXQ2enZDU3UycWxY?=
 =?utf-8?B?ZkplSkdseC90RzEzSVBmZFQ3YWpkVnpQdnVvNUl3N25yTXFJcFlHdWNGRG9x?=
 =?utf-8?B?R3RhQlArbnRoTFZxV1VzaTJ4d1dlTUNmRVMybUZmQU9NMU1YRW96K09DelNU?=
 =?utf-8?B?QVhEdHdWcndxRzhNSjMyTkhqRGd0UlJ0RzJ0QU8zUWlkcDduUnhyL0craWhW?=
 =?utf-8?B?MFpkbGxoaGYwZzF4dkZ3dURrbWdOdTVtZlAxdHBERU80WmdOL1dlRVFYN3NL?=
 =?utf-8?B?aGJrUXpiK0tVR0dydEhMOTBHSkdjWGdoSFNQY2FMR3A3bUNyOHIzSUxJOWph?=
 =?utf-8?B?VldaOVpBQXN0NlVOU3MyamQ5Y3JYWTA3M21hNjNzTjY5ZFU2dWNtNzY4M1lh?=
 =?utf-8?B?aGVrTUk0OXJmZWg2YVduYWtYOERiMWtvdEJNUEpKWHRWUEdwQjlRc3ltdCtn?=
 =?utf-8?B?bG10WHNMTUJIWGNNMEdCRmN3aWdvQ0hkaDF6ZXJqb0Q0eTVyKzVPZDRyUXZ5?=
 =?utf-8?Q?iQbMvqclt5ipA58YDi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230afd23-1b8e-4ed3-9b46-08def98bf66f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:41:06.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dThBxlIKDGKDNA4Cp49LfGjvyRP2iGUNP8hN1HGve5gumlxZFz6X39hMV6x6ZeIg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725

Hi Reinette,

On 8/13/2026 3:49 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/13/26 12:27 PM, Babu Moger wrote:
>> On 8/13/26 13:19, Reinette Chatre wrote:
>>> On 8/13/26 10:57 AM, Babu Moger wrote:
>>>> Hi Reinette,
>>>>
>>>> On 8/10/26 22:20, Reinette Chatre wrote:
>>>>> Hi Babu,
>>>>>
>>>>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>>>>> Kernel-mode resctrl policies allow kernel work to be associated with a
>>>>>> specific rdtgroup, optionally restricted to a subset of online CPUs.
>>>>>>
>>>>>> While user space can query the active kernel-mode policy and its associated
>>>>>> rdtgroup through info/kernel_mode, it currently lacks visibility into the
>>>>>> CPU scope of that binding.
>>>>>>
>>>>>> Introduce read-only kmode_cpus and kmode_cpus_list files for each rdtgroup.
>>>>>
>>>>> I think it will be easier to follow if this is deferred to not create these
>>>>> files in all resource groups by default. Instead, at the time they are
>>>>> created it should be obvious that they will only be visible in resource group
>>>>> associated with the active kernel mode.
>>>>
>>>> I am not clear on this comment. Do you mean create these files when user associates the group to kernel mode? (during rdtgroup_config_kmode)
>>>
>>> No. As this changelog states it creates these files in all resource groups. This
>>> is a confusing thing to do at this point in the series since these files are not
>>> expected to be present/visible in all resource groups, only in a resource group that
>>> is assigned to the "global" kernel mode. This commit mentions nothing about this
>>> usage and thus from reader perspective does not seem like the right thing to do here.
>>
>> Ok. Got it. Commit message is not clear.
> 
> This is not just about the commit message being unclear. This commit adds functionality
> that patches that follow undo. I find this strategy unnecessary even if the commit message
> is changed to reflect this. I find having the functionality as intended from the
> beginning easier to follow.

Ok. Sure.

This code will also be revised to accommodate the addition of hidden 
file creation functionality.

Thanks
Babu

