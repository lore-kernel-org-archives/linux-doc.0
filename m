Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711252773C3;
	Fri, 12 Jun 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278659; cv=fail; b=A/2fBSxxUBJR1wR5hueUrF0u/QGlLZ7y1iKBJnCdu1kZ9wQ+2bXzVWttaUKJwR5jQAQQVZ2Zo9nC+x6UQ7EaMSOY6s05xIZQ0EVasS5DJAy773lrC5m1rmqcqM8j8TAe/UlI/DQZpuA5M/V9awmI+tmIiRUbYRdX3seBkIS5DyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278659; c=relaxed/simple;
	bh=zV63jbQeTGtvC3VyaNgr7uTZqL3YICKneT3r6x4BisE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RZIBVnpH+kFaRLw+Kt2Sfdjg7H2pBLN1WNP6H+svxP6ifISzpQ672zetZ2uJwxWLkZTRVfwYcXNT/gxm+wpsI3aVrNxrfCAZyKhKNIAouvlgbiB8DUc8lYAdy5YNb3bfNKlDXU1IclLzF3Uo7BRFqoFRG4vOjnhyw/LHc6eFZu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G0oPf/Jr; arc=fail smtp.client-ip=52.101.61.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G0oPf/Jr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsiIUGj0DrJ+mI9wFLNcIASC5x4LTeYn5di+z8ls3f46AyT4B5HF/7c724Nh0KSBXzxWbsnUkWseG1HQBPmk/cNRDViaGFTteN1DLk5G7p+l1jQdXViirYHGpKa+Y4RoL3HNOxTMQkP4B/M3Ia1avq7UvHFycTnEIZgWzNmkirjrpaC39wdr955MURojlIBmKu3M56UOTbNnJhZ90POvny4oMzmlsumvGslMGEDDICtM27aLYkM+lOGXIaiihRL8XWup7f6L5060umKkID4S/7cLH/tfCnG3ydGnsofwN8sloqwqUtAN94IwR2iANQrKKkRbJk4fKIEcf8UaUM31sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvUUO1eBO2wO09AERZr2xy3p9sJVea+6JG6rYqmStcA=;
 b=RQJEWxmX2LzEE1oW96jHm7Ojda6AuUhC2ULWmMe5ug6+2PilYEzb5W8vV65kb+3SuE+UGHyLvNcrpP4J+Tw7bAqTezXDuMD2d5lnp5fkX9xERdj0zmWH9zUBO5hSHatm7/AdO801zg4qV43XZKI6ttJeWml9iKPmhzS7Abbe9iJNUWtiZ40DmRotsiq7zhPhHUO0yIV0njZZ6c9yFusbgUe06aGKVt7sp59kCZceX/d0LjUdnmVuLWFbtv9KCKJjzJyQ9GeuZq5H+FsprJSMmIEnRj+KYAQY1tg1aafeFmwOnq+HxXS2K2Ov9HfofBVO28Yn2mbm/IiNWxNLx0EaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvUUO1eBO2wO09AERZr2xy3p9sJVea+6JG6rYqmStcA=;
 b=G0oPf/JrhE+cBdbDPIeDdw89fK/WFXto1/0GSbnQKI3Oes+5wBUokqY0ecxmRzLEPraDCDl0yj15dRIrKkbubl11w9BTsfQ57YzBgQU+xddBYVm0QdMiLV2Uy7nNc4B9+CZ7mkVkDkLJ2J4z0Cr8u4kz6+TfvUpzvsBx7da68oQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 15:37:34 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 15:37:34 +0000
Message-ID: <4abf97e7-5ef7-4640-b182-83e8bd5bb418@amd.com>
Date: Fri, 12 Jun 2026 10:37:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
 pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 lirongqing@baidu.com, paulmck@kernel.org, bhelgaas@google.com,
 seanjc@google.com, alexandre.chartre@oracle.com, yazen.ghannam@amd.com,
 peterz@infradead.org, chang.seok.bae@intel.com, kim.phillips@amd.com,
 xin@zytor.com, naveen@kernel.org, thomas.lendacky@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <a1dbbb1a-ef78-468a-a80c-572a85220bbe@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <a1dbbb1a-ef78-468a-a80c-572a85220bbe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::10) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1414b5-ab45-4657-20dc-08dec89885b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|18092099006|4143699003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	D7s1ovOiuyW9E/520Gdv39pQy3tvwBbWZCv3cury61S7k7aJteAK9dt9ul2VK3zEXz+xnr75Hmffk1JPFCbISgLd18FIQjEpGchktXNp9XKrcjcMP/DQeIwQi5U/BQH3c5Q5a7XwDQdiqYwQyTNY7388+csTh2sMfek+VYYRhmi3X8tZYl750yAF5dh/pWTzFQB7sUCNZbZC/tnoZaYPBV6PnsycHQixDkEVkyg2VlwzUv+yaiZNr9RoLizS9/Ukt+F7Np8gdLyhhWwnBErCJgaLeuV1nYA8fFkVtxK2cJ8aV40fJBAdhFVhFrsIjkBgwl258mvvABsmncNABzgQSFvKwxyr5u+7SRa8sJcDlqdy7Mj+WuLFURTYjLDHeIay4F0a0dlrQnKmyTb7BsRspzWyXxqhjtkr1aTsW4aipDxql676bLxKs1DsYHfe3CzTgYUMnWN4nmj0MfMY3vowq6QbC57gwLvTETHyaigCbqavwkVkXy+qRGSzCxlyVQhL8ovfrNEFW4cEABxwo1UnPYKvIze+/UccLp2B9j0eHqlaxTfS8Smj7dUuienxnkWgzd6tM14sy2upX1gfSK0mw6pCPqtyV/DpFXAk9vhCd5dy8IHr33tB0DtS5/gi18r6xJ3D5p/s7T9AgTSvVvzO6ASRJAcGPMj2pqZKMQ2i20f1sJ4j8lkzxbn1VjKogzANfI4em8CEodSg/J2pSnfWxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(18092099006)(4143699003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0h5cHYyMk1YWUpza1ZnN0hRcnhNRFczWTZkYmVEMTd0Y0lnNWRuYjZKcXFw?=
 =?utf-8?B?Ri9YdUFNVUlJRmpkWks1bWlTRGxRMkt1UXZUTDQ3NjFkenlEWm96b3dPakhp?=
 =?utf-8?B?VjBDZHFydXJid05KeUo1OHp4NVFFM1dlU1MxSjFNejJIUDBMbkt0T2plMnk5?=
 =?utf-8?B?anpST2liRDZVNkJac1lwOHRNeWowOHFhWHBnNEU3WmhGa2p3YitJOEE0ZW16?=
 =?utf-8?B?em1IOEM2bWk2K2FUc1ZxQy81dnIraENJVkNZWUJ4K1ZHNFo3bGJPd01XSXdY?=
 =?utf-8?B?L1Bad2phYnY5ZmRnSC9OeERoUDlWOFdqelg1ZTBFRVlzY0xrYXM5T1RBTGha?=
 =?utf-8?B?UER3UVdoaWZZMnZJY2NqdDdPeUJLbDJUcUlWN2xVQ3B0MmNleUROQ2JYZm0r?=
 =?utf-8?B?cU9Db2pZNzg3dDAwRFpTckV2ZVR0V3QrV3pQeDZEbmJFbCs0ODhORmpxY01n?=
 =?utf-8?B?b0hnNVJNN212djdUNVBJQzFubXgyQTY1Mk1SQll3djRJQk94dHY4SlRzbjhU?=
 =?utf-8?B?MHhNUUJCS25JRlJRekMyY2p4WittS3lGY2FjeG80ZEFFbDkxRzdZR0x5SEpD?=
 =?utf-8?B?czNIQ1d2ZXYxS0NFeVZGNzVLdzJQbGI5MU1XOU1WWTRSV1A1bVd3S0hsOWxY?=
 =?utf-8?B?OG5SbUh2bHN3RVZ6SkFSMmtKVEJuSXJLbmdpajBvYTVvc3Q1RmpVd0xKSk9Q?=
 =?utf-8?B?V29ZSzBVYi9TbFhCREhZTU1FcGhGWU5UbjZuUlhlTmI0RkViNkpaK3U0enlT?=
 =?utf-8?B?cEI3NEt2WHJ2ZEhacU9relR4MDkvM3cyeGQyZTgvalI1QUgyVldzRDg2dnlB?=
 =?utf-8?B?cUY2NWtHUnBtVm9aTHZweXBPKzJPZjVqR1lmNG05OTlJby9peTB2YjFSN1R5?=
 =?utf-8?B?RlFyaDhpeEdlRlJmSjc3RkVtZ2JaU2RPVzRsVS9uc1QrQlZDbDRha2lUZFlP?=
 =?utf-8?B?am1ZNlcrQnJCZkhDZUwvRzFYRUR5M08wK1dzTFZUdGcvRFlXbVhpdGV1OFho?=
 =?utf-8?B?ZnRvNVR3dkNTcUFwWjMyY3NMR2RZL1VOWDRtdkQ3aXJGazZKaHJXdS9PMmxz?=
 =?utf-8?B?OVlNL054R0VEVWNLNVZueUtmMFM5U3o4ZVEvTjgyWXZDUnlrcXd4OUFQbUdo?=
 =?utf-8?B?NnVoSmluYTdhSmhIYTd1WjcwaTlLbGJxNWFtc0xGTVR6eitkNHh2aktldXE4?=
 =?utf-8?B?d1RyNjlkellzWnY3MkZuNmdpSmpZd2IzZFNwaDA2MUtmdFlkTU1lRFJRdDVX?=
 =?utf-8?B?L1hYSkNhV0VVLzRCVGRFMHZwYkQzWnF6SGloZE9Ia2dQY0F1N05MQjdVQjhS?=
 =?utf-8?B?ek8yWCtzS3BNb00zY1BJOVF4MS82eFdta0hyL3JHY3hqNnVyU29aQmhtNVha?=
 =?utf-8?B?MXZRVG1WK2w3QlcreDltRHJySlBkOFJ4eEtwVS9YdnJ5V0dITUF2d3lhWU9W?=
 =?utf-8?B?THplbjc5MEtRR3FYSjlXb0FPdUZycEdhKzdPNHFKYlNOSkhNbnpXWEtRUTlw?=
 =?utf-8?B?am94NTBJeGw2Q2hkVjNvT3NhTzJ4SWQ2d3BCWTNwTytKRnVpL2x3Z0U3eTR5?=
 =?utf-8?B?bjhtTWJJdE1PSHQ0YkN1YVlDUHI4ckozY1Z3YUhJY2FXYXNMa3krMGVVZUlN?=
 =?utf-8?B?Nmxmb3hWUllCYnJ5d2QvT0V2dDZQWm5vdmU1Z3BxRFAwWXg3MlczeXRjRjJ1?=
 =?utf-8?B?RFIzNk1KVTBTNHFCaGJKTHlNeXVvVDBtOTkwbVVpMkdJTWhlN0VvL2JPRlhl?=
 =?utf-8?B?dCtBTVg5V0FPY0lDbE01YnBZeHZFczRHQURtSWxTYjlPN0N2a3pnbUxSb2Zm?=
 =?utf-8?B?Y3Z1MkJGd1RZQzJPNkxmSXMra2xRbW81akxOR1lTMEd4ZU1tMDVxOWM2MzRm?=
 =?utf-8?B?VS9BK0JlVCt2R0h2TVR6aGdCQnBoSkd1bDJOSjJKRFg1dWtQK3o3WkZxTnpS?=
 =?utf-8?B?Wll4QURreXNVM3hXWWU0dktGYVRCN0dzQ2JQaitabHJjVjY3YlNVcWNRWVAy?=
 =?utf-8?B?T0NtV3FVSDBqOWlIODFsMlgwaGk2cDdxVWtXb2JRbis4YUJEcXFmWDNQZGJw?=
 =?utf-8?B?Rm9sUFhnQWhKSDN3Ky94RDEvUEx0cFJvNUM5WmtCd3YvMHhlSnUxalNDQmdo?=
 =?utf-8?B?ZTRKdGNhd3RyTXc5aThGTmlyeis5Rm00OFgrdHpYUHd5WFJaNVF4VTIvRG1u?=
 =?utf-8?B?cnkvMXJqN0ZCTEwwV0w0TnVNaXQyZmZvTC9NcEpnM2t4cEJEUE10TlN6d3Jx?=
 =?utf-8?B?Z0pYQ3N3Ym44MWM2aTlUL0FBd29yQUlHR2diRHkxNXVFWUdLYUhrUCtHaHBS?=
 =?utf-8?Q?h0LOE/Tz4MFe6qPykd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1414b5-ab45-4657-20dc-08dec89885b2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 15:37:34.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo4mPVLTMgWU13wt3mRTWqgZE0mAmbUAS5t1vCMtCohALQ/KGzGUqiHc1aS1OG3k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213



On 6/11/2026 4:53 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> Design
>> ======
>>
>> A new sysfs file, info/kernel_mode, holds a single global policy that
>> selects what kernel work is steered and which rdtgroup it is steered
> 
> How should "selects *what* kernel work is steered" be interpreted? Do these
> modes not all apply to *all* kernel work?

How about?

A new sysfs file, info/kernel_mode, holds a single global policy for 
kernel contexts and the rdtgroup associated with the policy.

> 
>> to.  Reads describe the supported modes and the currently-active
>> binding; writes change the policy or rebind to a different group.
>> Look at the thread below for design discussion.
>> https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/
>>
> 
> ...
> 
>> Examples
>> ========
>>
>> (See Documentation/filesystems/resctrl.rst, "kernel_mode" and
>> "kmode_cpus" sections, for the full UAPI.)
>>
>>    # Mount resctrl
>>    # mount -t resctrl resctrl /sys/fs/resctrl
>>    # cd /sys/fs/resctrl
>>
>>    # Read the supported modes.  The active mode is bracketed and reports
>>    # the bound "<ctrl>/<mon>/" group; other supported modes report
>>    # ":group=none" because nothing is bound to them.
>>    # cat info/kernel_mode
>>    [inherit_ctrl_and_mon:group=//]
> 
> This is unexpected since associating a group to this mode implies that this
> group is used to manage allocations and monitoring of kernel work but this
> is not true, right? From what I understand there should be no group associated with
> this default "inherit_ctrl_and_mon" mode.

The default mode is "inherit_ctrl_and_mon", where both user mode and 
kernel mode share the same CLOSID and RMID. This is current mode 
(without this series).

I thought we are going to set the default mode with the default group 
when system boots up. No?


> 
>>    global_assign_ctrl_inherit_mon_per_cpu:group=none
>>    global_assign_ctrl_assign_mon_per_cpu:group=none
> 
> nit: "none" does not reflect state as clearly as "unset"/"uninitialized"/"NA"

Lets go with "uninitialized".

> 
>>
>>    # Create a CTRL_MON group plus a MON child and bind both the kernel
>>    # CLOSID and RMID to them.
>>    # mkdir ctrl1
>>    # mkdir ctrl1/mon_groups/mon1
>>    # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/" \
>>            > info/kernel_mode
>>    # cat info/kernel_mode
>>    inherit_ctrl_and_mon:group=none
>>    global_assign_ctrl_inherit_mon_per_cpu:group=none
>>    [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/]
>>
>>    # kmode_cpus and kmode_cpus_list are visible only on the bound group.
>>    # ls ctrl1/kmode_cpus*
>>    ctrl1/kmode_cpus  ctrl1/kmode_cpus_list
> 
> Since it is ctrl1/mon1 that was bound, should these CPU files not appear
> in ctrl1/mon_groups/mon1 ?

Correct. Will fix it.


>>
>>    # Restrict the binding to a CPU subset; the write is incremental.
> 
> Does "incremental" mean that if the file contains CPUs 0-3 then writing
> "4" would set the CPUs to 0-4? This does not sound right since it is
> expected that user space can remove CPUs also?

Will remove incremental. Writing "4" will remove 0-3 and keep only 4.


> 
>>    # echo 0-3 > ctrl1/kmode_cpus_list
>>    # cat ctrl1/kmode_cpus
>>    f
>>    # cat ctrl1/kmode_cpus_list
>>    0-3
>>
>>    # Empty masks are rejected; use info/kernel_mode to reset to
>>    # "every online CPU".
>>    # echo "" > ctrl1/kmode_cpus_list
>>    bash: echo: write error: Invalid argument
>>    # cat info/last_cmd_status
>>    Empty mask not allowed; use info/kernel_mode to unbind
> 
> Why are empty masks rejected/not allowed?

No specific reason.

When the mode is switched, we discussed earlier to globally apply the 
mode to all the online CPUs.

At this point reading "kmode_cpus_list" will still report empty.

Users can change it to selectively apply the mode by writing to 
"kmode_cpus_list".

I was not sure what was the action when empty masks are written.

Should the empty mask apply the mode to all the online CPUs?


> 
>>
>>    # Disable kernel-mode steering (back to inherit, default group).
> 
> This sounds like kernel work is steered to default group which I
> do not think is accurate for the "inherit_ctrl_and_mon" mode.

How about ?

Drop the kernel-mode binding and restore inherit_ctrl_and_mon on the 
default group.

thanks
Babu


