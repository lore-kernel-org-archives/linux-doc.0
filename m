Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB52F361B;
	Thu, 13 Aug 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649278; cv=fail; b=JZV36xnkqmbbN7YHa6mjRV8fwkvyXOH1EVCpCtIns0o0QYcT9z+tnejTBnwI5IGtUU7vsX3Rye26CeVuGkKBfIyOFRN2HZqgtHcjiMj6fsq2Vyqye8xTWaUlaavR6Qx0osMX9K/82J3rskJU+hs3I5l7T/HFHlVyN1oyaR3aCMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649278; c=relaxed/simple;
	bh=OkeD16DKVeyhCX+ZmsphNcmK48EUEjYSXsNJroPMMLA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LFcaT6bYn2pSl5iUuVXeNLoyim7N2V/mafN17pJ9sWqmR38f8SU9Bcfu/zgE5JB+2sbj/GPmbrygW8HGkUuuVkRSUlA1tDv4LeNIexdBk4Z9DxL7Xl5uidxBLHQw07mMn9K+IMk8CGWBTBv2t1AG2CB/qVRBRKUlK5kx6SJtDiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fp7qXNLl; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fp7qXNLl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/b5Mndb4U3sF1Ab+y9Ai5XjL/VV4yQ/sxDH8TOXG0R+l5q5x3fOoQqg2TnWbqRFZyTfiziFhBVBLxpxTfNOhdXuxOLF6BMDA5RK8L6jcyiIxnUJEGSNnNvZ1MzpmWXMLWuCP07V8jiUX2cz5XH++UlK2Oe7xLpS350xgb7JxVSDuateY/Gmjvl0fsR6ZckgUC8WtyJchAGgrWsQPYcwp14FMv/CHWulk09kWs6evRE08RSc9zaDVvy0tggHcfekQp7DhNFPlxjV97JXHog89grxHxfnNjw1WV5oi6E8Ydvk5wzQUIK2/a7zbj1UpHtSqex51WSSGVi3OM3etHy8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBoKgDZqsjlqgh0lNVhLp1lGT4E2ahF0Mbq7YMMqRwc=;
 b=fLmMKSXK8mtQucQF/ANkxULVfXJMy9vk33AeBEukE2eqimeZW+Pfl5NF31MYkzInZ5tK7lCwwoQZiKqpzlUdSqjg3Ehw5F6uYKy7ZpsvEaj+y+czFih8obRs3MGb4DBitKfX32ggyv3rNNB9drNBFgynu7jr+RXXyYMhMdZwTM+4CNZibFaz2x+yS39V4tucBBOIQa73zQqxk30RGf2V9vUFN4167DQ52V9HHIUpt8V4GcNwSv7MRTNPfRdB6ZR27Iw/v/v4jPQn9zZJV2Dj4rNS/CUgaivePZKnzX9ggQffDAy1QHgz5JmBg0Qo/Rg7u2zfB8ptBS7uS3fRhBNS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBoKgDZqsjlqgh0lNVhLp1lGT4E2ahF0Mbq7YMMqRwc=;
 b=fp7qXNLlbn4CcQp2fU7ryc06Zd4lwzO2mUdMs/kp9B1+BbFEkD2dD7Ip9Ld5LAIO4ozBa2qHr8nwLIql2t5ymCDb/ESss6lFJL8BywDhEzz/j+gXCzv5xNe2edjtLbDrXhwc66eNRtCJwG/slfd0eHRJjCTn/SUKD1hCdUQk92U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:27:50 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 19:27:49 +0000
Message-ID: <de190a51-4c4b-44db-9444-5c79f75f0887@amd.com>
Date: Thu, 13 Aug 2026 14:27:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 09/15] fs/resctrl: Introduce
 kmode_cpus/kmode_cpus_list per rdtgroup
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com, fenghuay@nvidia.com
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
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <98568620-7e61-4d43-b72c-5866a7d3bca1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0421.namprd03.prod.outlook.com
 (2603:10b6:610:10e::26) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: a7101420-0d14-457f-1884-08def970f588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|56012099006|11063799006|5023799004|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b1vTVc6X5rPouXzIxPKemgUFZFe7FS2NZDma1GG8spDO9GP73gohhz0YRLkVyoarhZWMOeWeDcUtR7Y35Vj83/gbQ378mnCDsZ6v58gt1sGAh3j9bA/IP1Aolshq+maSFr5ZPXS4e2oVxkkgnrQKm3pws7tK/J7gbagRpwvr4GP/YhULfmKF4i75fNO6ZVMyNic364r8JPkGMO6Qj9qeYuNR6ilD4QJtUIQuboNgsq8n/D9BCQyCxBE8NW5jKN+UjqSj4fl6+xVPPIU4QDT1WLPMcbT+IRPceUaopCAwxA2Ei3JZkCA8KByJVwOKvTTSEuFRUma7ruybguxn4u25tXSNGKXATE274IPvOEC/SiYTqAtyaiAWreIk3xxYd/W/NCO7pPHEBGFU9J70pQDe36abZk2bXdo2/562PIaI5LcDKZA0hKBcv9slonVgCDB8MyCMeiRGpBw3xHSJFrofTEU8uihuKW+BafK1iQaVZARawH2GfZGNyg0R4nrcr1+sT+YFSkScSA216q0Ck2UcvBhdHZQrDcaVvHt1zB/2Q0J7sIZwISkSl93+TFNQkiz0Rvd2KOAQTMN8zXiM6rURVbfVVjRrth9kyNKu5TS2zHnHs+xGAIKlRrFKUhsOEfuSoWIfWHHPVM2DW4jW4wsbZppqQRt05E4qXZKn7ykiD2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzBKczNybi9CcVI3dEh2ZGE5UmN4aitwRTAreFM1RXBhUlhPalRna3ZvVTcv?=
 =?utf-8?B?NDQyZlltUmJFcFFBQ0lsKzBBbk1XWi8wandkci96b0tNUFlTYmpKVEw3Y0RI?=
 =?utf-8?B?RDdBSWZSY1VzVTUxem52T1NSSHI4NnJsZWdVb1pzKzk5YjZNbmIyaWt2M04r?=
 =?utf-8?B?bkVycmRoOFFrUzJXdjMyVFFCemhKUllRenFYTnl2Z0FSYkRXNU5KV2pBM0ov?=
 =?utf-8?B?SGFRSSsrcDhTbXY5K2dibUpSeFJWLzhhZEpmcUtWOFhBa1hJNE9UM2lQSk5w?=
 =?utf-8?B?d0xhWHg5RXlQd0pIaG1oNVFzb2ZITTlJZzU1ZlZHWjZZOGFpb0VnaWtFbytW?=
 =?utf-8?B?endCVjgrbmFURnBFQlg3Lzlta0dkOUllV1dKY09sam82ZjE4bncxak5KUFJC?=
 =?utf-8?B?ZUdYN0VCckRFYTZ1MDNUSXpGQ2VJeEt6SUtZMkRueGptbmhwaStpY1RleUJ0?=
 =?utf-8?B?KzdMa2lxbGdvbXBOdzlQSjQyVWlDOU45M0IrcjJMbllsS05xSGFHTVl5bi83?=
 =?utf-8?B?R1hSVnBhek5YNUV6SWdKTjZQaEZadElzOG54N3E0NHh2bHRqVjR6aTJpNndr?=
 =?utf-8?B?aXZwYzZiKzA5TXdwRmZjSHdkL1dFcHhzUHlKVVpIZ0JiUzlIblB4djlKWEJ2?=
 =?utf-8?B?d0tVTWRBTzYwUTUvUkNMZDlENDF2VVRTUVU4UXZVQUlaSWNqeDgzL3o2bmlH?=
 =?utf-8?B?bU9Gak9zcXRpcm1QYStVbjdwSVNibFJza0dTOEorV21KZnpUNjJ6aGlvUTBk?=
 =?utf-8?B?alIxd2pzZVZPbkZsekJBOTFsdExkZnFIYVFGTU1LQjc3UFlCTStVakdPeVFU?=
 =?utf-8?B?Mk8zL1JiSzVBWUlVRG1iOE81S3V3c2cvZ3JWVXN5KzQxbU9oR1NMRVU2SlQ2?=
 =?utf-8?B?dVhCOXFlTjI4TzdmKzV5dWdRcVQ0ZEcwd29PTy95VUhzSDBaWEJkVGhqT0to?=
 =?utf-8?B?Mm5OR2tBV0hTeDFtSGZNR0lrVDBINGlYVVJIQzBndVVaWlJBMGY5dlJibENU?=
 =?utf-8?B?SUI0ajdYRDkvWnhVUXAvY0hjc2paTDFUbmNiazFaNnoxYlc0MXdmSDNTL2h3?=
 =?utf-8?B?MFA2V1BSTjlCekZ0d045WXJtWTNjY2VNdWVtVGdoWlVxRXQwVjIyWGRBcWFQ?=
 =?utf-8?B?cnhFSXl3N3NwSXliZWhLZjc5VVQxeS9Qc1loUkNjeGE0MjE4VEFHckd5emlz?=
 =?utf-8?B?ZmdFSHpRVXpGb2N0NVdya2NOS3MxWlVyQTV0eUpHNVdYeDdZOTFicHdvM0ps?=
 =?utf-8?B?S0djbVo5eSt2UXhWdDNvbW1iR2grdEorejI4VkRNZDd4UEFCN0VKUE5PV0Q0?=
 =?utf-8?B?M0xINTV5YzhWSEYzRGwyOFhkNFNhMlZGd3A1bWdxYi85ZU13aXQrY0R2OHNq?=
 =?utf-8?B?b0Jpa1Z4dklINi9aWVRxN3ZlUG5zUzltdzFwWGFoVkxPbkUwQ0pZZWEyMWxT?=
 =?utf-8?B?YlErdjVuUllWd3F0dDdMMWRob0E3eEluYkZYekExaFVzZ21KVG5kRTVhNzhz?=
 =?utf-8?B?bTI0NDhNYktpSEk4dlpzajhlZGlaVFBPMWh1ZnJ0Q2VaWGova1JORmNaMWdM?=
 =?utf-8?B?S2RGN0ZKSmFESnB1M3I5RXFBSngvYUQzV1RaeE5mSHZYcWRNZTBzbE90N05i?=
 =?utf-8?B?VDBHdkx1QXNHYjRldjBZYjdIRlBpcktXYVJydzRIZnpFaVdHalg2anF1TER3?=
 =?utf-8?B?KzRZZ0xiKzNkNjFvU2dvTk5KQVdZU1R3S1VJRHFlaWZUZUdRTGtndEk4ZHZO?=
 =?utf-8?B?c21ZQXgvOUhUcFhtbENHVWhKaWowQkZSb1JmdkUrbTdZdHBCTEdRVUQwU1la?=
 =?utf-8?B?cDJuTnVZMytRUW55UzNWaGRtOG5JNmNLeEMwVGkzUHdjamtUb1BmWEFyMDRQ?=
 =?utf-8?B?YmZqSjVXVzJCWU5jcFRlNUl6a0FvU3YyQzZRS1hrdFRzV3liT0s1dHpVdzZ1?=
 =?utf-8?B?MzJDbDMwRHZKanE4QkI1Z1A3QmZkWThSR3F2TEU2VitmSXRjNC8xUzRBZHBu?=
 =?utf-8?B?dXNlS2I1amFGamQ0SkR6R3ZpWjFHNWFSR2pEbi8zMy9GOXFBaS9STmRZZGc5?=
 =?utf-8?B?Q2dXcDBDdW55bnFyZlpPV2dLY3V2eitQaXNod1NpL3VadFNSRkVwK2JuOXVK?=
 =?utf-8?B?TDhTSkpyL1BwZTBIODUzTGRlRy9Mdm1qekQ0RytwamxIQ3NzNkNxUWdEbWx6?=
 =?utf-8?B?Vml3T3FuSEdjME5JalhiWVBFRFRkaTZ2NTdISmdqK0c0UlU5ZUVsa2dzNGND?=
 =?utf-8?B?K09vR3dmYjdnUklsSmd2SWliVk5oS3B3LzRHNW5BbW5RaE9icHhCaTg3YXA4?=
 =?utf-8?Q?sBHKWUH6yuEtWsuitp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7101420-0d14-457f-1884-08def970f588
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:27:48.5907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H33EZJgGzjiRDabRu1pQHYvf9yd0UKG3HRLZrBstWrJcFjVaZQczzXXBWpfeh6/I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739

Hi Reinette,

On 8/13/26 13:19, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/13/26 10:57 AM, Babu Moger wrote:
>> Hi Reinette,
>>
>> On 8/10/26 22:20, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>>> Kernel-mode resctrl policies allow kernel work to be associated with a
>>>> specific rdtgroup, optionally restricted to a subset of online CPUs.
>>>>
>>>> While user space can query the active kernel-mode policy and its associated
>>>> rdtgroup through info/kernel_mode, it currently lacks visibility into the
>>>> CPU scope of that binding.
>>>>
>>>> Introduce read-only kmode_cpus and kmode_cpus_list files for each rdtgroup.
>>>
>>> I think it will be easier to follow if this is deferred to not create these
>>> files in all resource groups by default. Instead, at the time they are
>>> created it should be obvious that they will only be visible in resource group
>>> associated with the active kernel mode.
>>
>> I am not clear on this comment. Do you mean create these files when user associates the group to kernel mode? (during rdtgroup_config_kmode)
> 
> No. As this changelog states it creates these files in all resource groups. This
> is a confusing thing to do at this point in the series since these files are not
> expected to be present/visible in all resource groups, only in a resource group that
> is assigned to the "global" kernel mode. This commit mentions nothing about this
> usage and thus from reader perspective does not seem like the right thing to do here.

Ok. Got it. Commit message is not clear.

> 
>>
>> Also, you mentioned about rftype::create_hidden in
>> https://lore.kernel.org/lkml/0126a5e5-48cf-416f-a21b-c231a703c18b@intel.com/
>>
>> Can you please clarify on this?
> 
> resctrl has centralized functions to create files. For example, rdtgroup_add_file()
> that takes as parameter the properties of the file, struct rftype. With a new
> property, for example rftype::create_hidden the file's default visibility can be
> set _at the time it is created_. This simplifies the code by not needing to sprinkle
> changes to these files' visibility after the fact at the various places files are created.
> 
> One patch can add capability to resctrl to have a file property indicating that the
> file should essentially be created with KERNFS_HIDDEN set.
> 
> This patch can then follow by using the capability to create the kmode_cpus and
> kmode_cpus_list files in all resource groups and it will be clear that the files
> are not exposed to user space by default.

Soundd good. We can do that.
Thanks
Babu
