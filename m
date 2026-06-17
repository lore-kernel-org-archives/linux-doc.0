Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579937B00E;
	Wed, 17 Jun 2026 19:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725029; cv=fail; b=cABG7K+1PhjYfdAf/2CWhBczQIXsRRyBBuOYuoc/2+mTcitsxnpsB6o+TX/4+xJOC7Yivt770eMk1mWJet0kEaDm3/unwWl5+hzGAU1yIlnIoQlbQvlDofXAiUOryKgav7BHb4DpFQowdydBIxOqY9TAxKE+DaZcmzEXv+HH6X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725029; c=relaxed/simple;
	bh=KWu35kFG89pg0xNAQtcTDX9l47Xd/nnHn6gpCcOMlbc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oMKSmaOEbD9kGzm0zQ+fRR/+XjmN4eKePrSW5y6YUsqd9+vhXc/VymIJAtFSuO//fhVtLNXSrNDen9OvUVdyeMXxSy2/AIxhHMdNfeWblOuUw3H3hPAjvuX4iZUC5wMRW5r/TIqTfNrUd3HWZAr9QfwoJt/aqPNmUWxIWpabXkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dnT0po23; arc=fail smtp.client-ip=52.101.53.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dnT0po23"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPAV3h7NU90D0efQ36fJmwGVP/dwH966f31CRDMHkP6Rva1RFcuC2gV5KozN8vRn7TAcKQAVVN5VXBnlHPPBEjzHudLF1BbZkFRfi7JcWZ9uJ+xqnNAL+4RY/adEyn5tahm5mVaTKJ9cCAgPoKH6eElIrX4hF8yqQM6g4VhBA2O7Pj02nVRf7HzeYLQB5efQdSVtQ2wWp0HVQn2w6lwo6F+QpyqERDGD+Z5fwnF1O1deBKybh6b288o0pD3R+dAWxeubOG1xfQvlDtFlgvXtQoebZiPJQKoXRDCY8GFEnTLmyufdllt1LgCs0GpSeAVDL5Ga9317jMndtOA/rncPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyBhCGejAw6wGBZ6DoNRj6s1qGSY4dUpxPANrC4xKqQ=;
 b=PvDpBgJNtxyw1/d8neLSwOnu97oR4G4jkGJYPL3NV+jzu5nIsqPSkeJ9PVWmOPm7ZHMKPOta0j9DW4w2znT/0W054vz+Kb5D7YgzGJVTX5+cN800cM9EfSvQkhpasbFZoeIecdXWmXfDZGNdkiTP7JMopS1B5kfmIIzfUcQUIQAGMndZxLs2rWmCMGO0xjYeDFTTs6mjSdQcFDsYDcRw0oeA+6trJnekesZbwyophz7wiY8cYzRk0jWaJb608568+XlYAAzaDuMTSk2oX/3m3EdEDZfP5QIoOCbnWCSpZ0HDkqLLdhYxITOqnoKMkdyIll+LOeus7RYoR7DiOe8amw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyBhCGejAw6wGBZ6DoNRj6s1qGSY4dUpxPANrC4xKqQ=;
 b=dnT0po23Jtm5Cv3J/rPhYz5jqw9I2hoNmseCA0XpfK7GaFXfsmY3G9gdq2O482V2wZkklFy2Gij56tuTqM+G2M57DC7QxDJgaLa5mqS/QRBIajPp2b7l/YwvDyViTU4QdmHO1Z8TmMcRxWOfqhoLNh/jnzT9mfd+RITS+mx5HUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:37:03 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 19:37:03 +0000
Message-ID: <f33c301f-0dfd-46a9-8f99-415e4c587393@amd.com>
Date: Wed, 17 Jun 2026 14:36:58 -0500
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v3 03/12] fs/resctrl: Add kernel mode (kmode) data
 structures and arch hook
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
 peternewman@google.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <3996883c2d1d47e094f97bab2a2e74df3f8c55e7.1777591497.git.babu.moger@amd.com>
 <d994c06c-db1a-4745-aaab-3abb05466a67@intel.com>
Content-Language: en-US
In-Reply-To: <d994c06c-db1a-4745-aaab-3abb05466a67@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::9) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d4d2c9-8549-4641-503d-08decca7cd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|4143699003|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	poQaAQD39Yt8ZHa+tluX3agZCesaGVnaRMdjgu/siu8gnEMrPh78wckgsX9zemkvNr6YpttSPHlgf/9OGSZNvWqcNeBOIbEj22wFiYijF031Z+ZWLegzOMKE8at5eCGucrb7j5BQlNoBhTSFBOCcXQixkRfnvRPnmTGEhlHnK3c7hgyT2WdX6xgtCnuDLbvHPYCzpix7MPOwhFnFgf1iT4CT7qh4b3yE3oRpfbovBElKPfo7PrngLqtcKuI0PnxtDowNRNRtBFbb7+exCgQ0bUx+mp8TZJn2q/OuD+ur5KQpaJ+qmeLBqiGnTbIgAQNN8VApHOuHxtFKOLPNWNVnb5hjsa0lnQiV2kJFcs7nknPUoL7cOsNCDaiLGZ87Qda4rZ8faYe1n1hO/fpL5X9weqyi7bIVTkzp6G50Xn7Nv9UKMjL0bqLuVf8f9l1mP12wPlhUVMqQYX0O1kngDvhWU/tjX73a7t5c8HTWdfseb1tFKQB3a3WArfNXRjPrvbxocV6QsLRON3TF7I5yRlIoSyAHhmb/GyypiikgyVhnqn4sM50Bx/JZNzS35jLHLqsZZUKE03zffodakHb9+JbJsesv/TLyg1neH1NfTrsCNBT1DXB8um4PnrFC5jkHehwKoDbdjcEwExSjaqNvCjL/fsAyof9f9FJv/as+UeWov1OkudrFSuLuZ+Xb0/2hqc/mk7hOi8p+84ZzS2xchmlRcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3daS2I0MHQvQVMwNFlyMW42aHdBS0FJVVdFRUs3dGF1WS9LZUZYSldLdlNx?=
 =?utf-8?B?Nzd1K1dFNFhjSHZmb2hMYWlwQjBydkVlSC9ybXdLdmNJVFRBaTRFYlcrQUtJ?=
 =?utf-8?B?NldTa3JRSkRQb3Fma3JDb3pySDlpRlBQeGZ5a1l4OVVvVnBrSktWa2hEQm1j?=
 =?utf-8?B?Z2VodHZ2R0w4VkVHYWJGU1BJR1pFZU9WdTZKSHpsb01qR1dIbW84SllIek5M?=
 =?utf-8?B?UHQ1ZExZbVdxMmJUZFV2L2NBL1M4WVhtOE03b1A1OUNhbWlwdGtmOHVKVDR1?=
 =?utf-8?B?ZmxxTnY2V2x2OTA5NG5KdkhNZVNCOU1vbVhlNjAreUZDS3FYL1NwVERmLzBJ?=
 =?utf-8?B?VUNPQ2hqQy9kUlEwRTkyaUpJQVNiU1BTTnZsQlRUTktVZU1Jbi9RUUtQOXkv?=
 =?utf-8?B?cXNOcUpHVVJqK0dYNE5ibDZ0MysvaElRL2RhYysxTFBpOGdYM2xaanhkVlRZ?=
 =?utf-8?B?OFU0STlaV2xhQTVvakt1MnhOMzRULzcxd24zWnE2b2dYOXIrN3BpNzlKbXd4?=
 =?utf-8?B?Y2FONzBIdzc1RVR5Tkt0c0ZTTEN1amhLWXhoM3Y1YXNlM2J4ZU1mdGRyNHpZ?=
 =?utf-8?B?U1MySjZMR2F5NkpMYUNNdExKMGo3SzVoeGFSem9CRWRNWjNRbTZwZ1BBbE9a?=
 =?utf-8?B?YUpWQjB1WC8vcE12elJCZlNGQ1FZbVphRkxVdHF0Qk5pQUNacXFwckZQZmdM?=
 =?utf-8?B?bkM4ZEI0UUZNSmJzdmRMMGl3ZUNTVk5aaHNNa3FoVGZzckVYZHl6bzFSaWlw?=
 =?utf-8?B?NndzUWJZVUZwb0lpcjdVc1pxSE5Ndm1TNk5ISnFnWjU0V0xpNG0xcVlTM2lT?=
 =?utf-8?B?YVhPTHF2L1JVL2taQjNCUmN6LzJleXJvZm5oa241T2VOVG15YmdBRFY3bWNC?=
 =?utf-8?B?YWhENHBONU8yY0tmZXI2QWNwb3ExSmVUR2RvU09vQ1RCMUUyRWIzWWhvWGRU?=
 =?utf-8?B?czBPNnVoeFd6QUtUVUFGYzJTc1BkMkdFMVQ5UlVEWklodkQvWk1TdlJyN2xi?=
 =?utf-8?B?bzZ1VnVnRU5RVFl0NmliL0hPSUk3YUZlMVJyOUM1M010Wjg3UnBySC9JV3kr?=
 =?utf-8?B?ckJjdGx4ejZOdjF0ajdaUTlMcFpUcUJkQlhvbzNRMWhPblhIeXBsL3NmbnE5?=
 =?utf-8?B?U2NETGR2Z0htUlEzeWNiWGVkV2l6YXA5aVVsRzBwdkVCZmkwK0hEVWZxb3dH?=
 =?utf-8?B?d0ZxSlFNNlNUb3lsVGV1L1JJVVV6ZWpwZkdndStYSERENVVxZHUxV1Q4OFgz?=
 =?utf-8?B?UG5wU2tTRndZOUNrOUdSOVZ0YW5EN0lTd2I3VWk3RXIydnIzQ1JSbVhzZXpV?=
 =?utf-8?B?Q2xFcTZzTmN3elJBWU5GUy81V1pGWmNER0lhVTJXTy9ZVENmVmo2UzI0YXZp?=
 =?utf-8?B?TE5pM2c5MmZMMlhqKytDSWpQN1YvWVpKZUFjWjVuRHg1cUhpQzVLRTg3dEJC?=
 =?utf-8?B?OE9qSkhPbGdMRHdyc1BVRmZZeDAwYWhwZUd4ZS9nSDZyMy9HNkhFT25SR1Zp?=
 =?utf-8?B?N3liRk5tR1BZWml4VWN6QVRnSG1Ha3VVbVVaank0WktGOUo3ZjRsTGZUQXRP?=
 =?utf-8?B?RFBiWGhtelVMWUppd3hOMnZjRXM4S21mRkYyNzRpeGYwb1ZiMmhnK096dHlt?=
 =?utf-8?B?TStQblBLRGZiMnp3dldveW1ieU5SaVoycFpFL0w2MjU0enJ1QlNUejJ3N2kx?=
 =?utf-8?B?eFZNU0VleWVOemxLby8xMVNXMnp0Tm13M0IzM1llMTNJR2tVSFdpVFFGWnQ0?=
 =?utf-8?B?Rm9aeEdLbnRGVDUzaTlkMnJyTmtIRjZYS3RnWkJPa1pvUFFwSW1icnd3TnEw?=
 =?utf-8?B?L2NCc2pzMmxYeEQ3NEVBbERCWU1sUDRmcnEvQnVGV2xUckJ1L3pEZVRSclRj?=
 =?utf-8?B?K3NDWm4vRlhSYXhqNTQ5QXZBd3pIeHMvNHRuU0c4SjRnR0NIYmQ4Q1NvbVcw?=
 =?utf-8?B?UXBKTHdtTDd2aTAwaXIyamVYak42RjB0QzR6R1NSMktuZ3hjK28yVUE5NGlk?=
 =?utf-8?B?b3JZRW9kb0JSYll1VWV0WEdXMHdDMS9CRWtUZDIzeU9rSHBERkQrR0ZJUWlx?=
 =?utf-8?B?ck9BckU4SVd5QXN6VWNFRTBJMWo2aHJVMVN4L1FxWnZERUF4VFJnV21rTlc4?=
 =?utf-8?B?T1VWLzQ2T3lZV1V4MW9na2tTWXBQRTdBK3h6V2U1Z1Nra3diZThaZ1pDWHBX?=
 =?utf-8?B?YUdFZDBBSkJYQWozREs0LzlzVWpYbEJWaTZ6QWlyOTVSanpmYVN4SU1FRWhR?=
 =?utf-8?B?bnN3UjV3YWxWa0hIZlRrL3dtT0F3T1Y5ZkF5VklydFFqYkN6aGRmaGk1T041?=
 =?utf-8?Q?86gt5U5SgM7TVokJDT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d4d2c9-8549-4641-503d-08decca7cd9d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:37:02.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4P9cDsx/TE8xvya7pY+iVPhPcwgohv8HJW/PeZqtQqerwPWYV8jVsFyrD6z+s78
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934

Hi Reinette,

On 6/16/26 18:30, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
> 
> Subject prefix makes it clear this is a resctrl fs patch so please take care to
> not mix architecture specific terms with resctrl fs generalized support.
> 
> Something that may help here is to consider all resctrl fs changes to be
> relevant from MPAM perspective. Please do so with all resctrl fs changes in
> this series.

Ok. Agreed.

> 
>> and/or RMID associated with execution in Privilege-Level Zero. Introduce a
>> generic enumeration so that architecture and generic code can agree on the
>> available policies.
>>
>> Introduce enum resctrl_kernel_modes with the following values:
> 
> Please make the enum name singular, "resctrl_kernel_modes" -> "resctrl_kernel_mode"
> Doing so will make its use in code easier to parse.

Ok. Sure.

> 
>>
>>    - INHERIT_CTRL_AND_MON: kernel and user tasks share the same CLOSID and
>>      RMID.  This is the default and matches today's resctrl behaviour.
> 
> CLOSID and RMID are x86 terms where the meaning is not 1:1 with other architectures.
> Since this is a new resctrl fs interface it is expected to be usable by all
> architectures. Making this architecture specific is not appropriate.
> 
> These are the modes that are exposed to user space and user space has no insight
> into CLOSID and RMID (ignoring scenario of debugging). I see no reason for
> resctrl do dictate CLOSID/RMID assignment as part of these modes but instead
> what the modes mean should be explained. If it is helpful then any x86 specific
> details can be added by highlighting it is x86 specific. For example,
> 
>       "Kernel work inherits the allocation and monitoring from the user space task.
>        On x86 this means that kernel work shares the same CLOSID and RMID as
>        the user space task."

Sure.

> 
> 
> 
>>
>>    - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: a CLOSID is assigned for kernel
>>      work while the RMID used for monitoring is inherited from the running
>>      user task.  The default scope is all online CPUs and may be narrowed to
>>      a subset via the resctrl group interface.  A CTRL_MON group can be
>>      bound to this mode.
> 
> Is binding a CTRL_MON group optional? Consider, for example:
> 
> 	"A CTRL_MON group is bound to this mode."
> 

Ok. Sure

>>
>>    - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: both CLOSID and RMID are
>>      assigned to kernel work.  The default scope is all online CPUs and may
>>      be narrowed per CPU via the resctrl group interface.  A CTRL_MON group
>>      can be bound to this mode.
> 
> It should be possible to bind a MON group also, no?

Yes. We can bind either CTRL_MON or MON group to this mode.

Here is the discussion about it.
https://lore.kernel.org/lkml/1d7c79bf-1e40-4db7-8f66-45f234b6d87e@amd.com/

GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU can be either CTRL_MON or MON group.

GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU can only be CTRL_MON.


"A CTRL_MON or MON group is bound to this mode."


> 
>>
>>    - RESCTRL_KMODE_LAST: highest enumerator naming a policy mode.
>>
>>    - RESCTRL_NUM_KERNEL_MODES: number of policy modes; use this to size
>>      static tables indexed by mode.
> 
> The last two can be dropped, this is clear from the patch.

Ok.

> 
>>
>> Also add struct resctrl_kmode_cfg (the snapshot architecture code returns)
>> in include/linux/resctrl_types.h, and declare
>> resctrl_arch_get_kmode_support() in include/linux/resctrl.h so architecture
>> code can advertise the supported modes.
> 
> Above mostly just describes what is clear from the patch. Instead this can summarize
> what the addition does: "Provide callback with which architecture can set the
> kernel modes supported by it". (not exactly what this patch does though, but more below ...)
> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: Removed resctrl_kmode definition.
>>      Changed the kernel mode definitions to enum resctrl_kernel_modes.
>>      Used BIT() to set/test the features.
>>      Added details to changelog.
>>
>> v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
>>      https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
>> ---
>>   include/linux/resctrl.h       | 13 ++++++++++
>>   include/linux/resctrl_types.h | 46 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 006e57fd7ca5..ce28418df00f 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -699,6 +699,19 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>>    */
>>   bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>>   
>> +/**
>> + * resctrl_arch_get_kmode_support() - Advertise kernel-mode capabilities
> 
> "Advertise" implies a "broadcast" while the function name is "get" that implies
> retrieval.
> 
> Why does resctrl query the support from the architecture? The typical resctrl initialization
> involves the architecture setting certain capabilities. This simplifies enabling since
> it does not require the addition of this feature to be accompanied with an implementation of
> this call by every architecture.
> 
> Instead, resctrl can just initialize the defaults and an architecture can
> make any adjustments using the optional callback. So, instead of
> resctrl_arch_get_kmode_support(), why not resctrl_set_kmode_support() that is
> implemented in resctrl fs and called by architecture?

Yes. We can do that. We can add resctrl_set_kmode_support() in FS and 
call from architecture.

> 
> When considering the x86 implementation of this it seems as though this implementation
> assumes that all architectures will support inherit_ctrl_and_mon but this is not
> enforced anywhere. Having any assumptions enforced/verified will help to make this
> more robust. The fs/arch separation depending on so many architectures
> "doing the right thing" seems risky.

ok.

> 
> 
>> + * @kcfg:	Architecture ORs BIT() flags into @kcfg->kmode for each supported
>> + *		&enum resctrl_kernel_modes value (see &struct resctrl_kmode_cfg).
>> + *
>> + * Used for optional features (for example PLZA on x86) that can assign CLOSID
>> + * and/or RMID to kernel work separately from user tasks.  Generic code compares
>> + * @kcfg->kmode with the effective @kcfg->kmode_cur; when a global-assign mode is
>> + * active, @kcfg->k_rdtgrp identifies the active &struct rdtgroup. The default mode
> 
> Does the architecture need to know these implementation details?

Not required.

> 
>> + * is INHERIT_CTRL_AND_MON and group is default group.
>> + */
>> +void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg);
> 
> Why does architecture need to know the layout of struct resctrl_kmode_cfg? It only needs

Arch does not need to know the resctrl_kmode_cfg.

> to share the modes it supports and need not be concerned with any of the internals - from
> what I can tell the hook to program the kernel mode does not use this structure either and
> this is the only "outside of resctrl fs" usage and it does not seem necessary.

We can just pass the modes to resctrl_set_kmode_support() from arch to 
set it.

> 
>> +
>>   extern unsigned int resctrl_rmid_realloc_threshold;
>>   extern unsigned int resctrl_rmid_realloc_limit;
>>   
>> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
>> index a5f56faa18d2..3aba07764b99 100644
>> --- a/include/linux/resctrl_types.h
>> +++ b/include/linux/resctrl_types.h
> 
> Please keep in mind that resctrl_types.h is reserved for those types that an architecture
> needs to use in its asm/resctrl.h ... it does not look like any of the types added here qualify.

I will move it to include/linux/resctrl.h ad both ARCH and FS need to 
know about these modes.

> 
>> @@ -68,4 +68,50 @@ enum resctrl_event_id {
>>   #define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
>>   #define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
>>   
>> +/**
>> + * enum resctrl_kernel_modes - Kernel versus user CLOSID/RMID policy
> 
> What does "versus user" mean? Can this be dropped?

ok.

> 
>> + *
>> + * Enumeration values are contiguous indices from 0 through
>> + * @RESCTRL_KMODE_LAST inclusive.
> 
> Above sentence is not necessary.

ok.

> 
>> Global-assign modes treat all online CPUs as
>> + * in scope by default; a subset of CPUs may be selected by using resctrl
>> + * group's interface.
>> + *
>> + * @INHERIT_CTRL_AND_MON:
>> + *	User and kernel tasks use the same CLOSID and RMID.
> 
> Similar comment as earlier. Since this is generic resctrl fs interface it needs to
> be applicable to all architectures. For example (same suggestion as earlier),
>    "Kernel work inherits the allocation and monitoring of the user space task.

ok.

> 
>> + * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
>> + *	A CLOSID may be assigned for kernel work while RMID selection for
> 
> "may be assigned" - this is not optional, right? How about "A control group is assigned ..."

ok.

> 
> 
>> + *	monitoring follows the same inheritance rules as for user contexts.
>> + *	Default scope is all online CPUs: subset of CPUs may be selected by
>> + *	using resctrl group's interface.
>> + * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
>> + *	A single resource group (CLOSID and RMID together) may be assigned to
> 
> "may be" -> "is" ?

ok.


>> + *	kernel work. Default scope is all online CPUs: subset of CPUs may be
>> + *	selected by using resctrl group's interface.
>> + * @RESCTRL_KMODE_LAST:
> 
> Documenting @RESCTRL_KMODE_LAST is not necessary.
> 
>> + *	Highest enumerator that names a policy mode. Use RESCTRL_NUM_KERNEL_MODES
>> + *	to size static tables indexed by mode.
> 
> No need to document this.

ok.

> 
>> + */
>> +enum resctrl_kernel_modes {
>> +	INHERIT_CTRL_AND_MON,
>> +	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
>> +	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
>> +	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
>> +};
>> +
>> +#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
>> +
>> +/**
>> + * struct resctrl_kmode_cfg - Kernel-mode policy snapshot from architecture
> 
> Only @kmode is initialized from the architecture. The rest is managed by resctrl fs.
> I do not see why architecture needs to know the structure details.

Correct. Will move this to FS.

> 
>> + * @kmode:	Hardware- or policy-supported modes: each enumerator from
>> + *		&enum resctrl_kernel_modes is represented by BIT(mode index).
>> + * @kmode_cur:	Effective mode(s) in the same BIT(index) form as @kmode.
> 
> "mode(s)" ... this is plural implying more than one mode can be active at a time?

no.

> Should this not be just one mode and can thus have type "enum resctrl_kernel_mode" to make
> this obvious?

Yes.

> 
>> + * @k_rdtgrp:	Resource group backing global-assign modes when applicable;
>> + *		initialized to the default group at boot.
> 
> Why is this initialized to default group at boot? I believe inherit_ctrl_and_mon is
> the default mode and it does not have a group so should this not be NULL by default?

Yes. It should be NULL at boot. Will change it.

> 
>> + */
>> +struct resctrl_kmode_cfg {
>> +	u32 kmode;
>> +	u32 kmode_cur;
>> +	struct rdtgroup *k_rdtgrp;
> 
> Please align struct members in tabular fashion.
> 
> Not specific to this patch: After so many contributions to resctrl I am very surprised how
> this series does not respect Documentation/process/maintainer-tip.rst in many ways. For example,
> later patches at some point just stops writing changelogs in imperative tone and just
> documents what the code does, patches document locking requirements instead of using code
> like lockdep_assert_held(), variables are not declared in reverse fir, changelogs refer to
> other patches in series. Following Documentation/process/maintainer-tip.rst should be
> very familiar by now.

My bad. Yes. Will focus on process in next revision.

Thanks
Babu
