Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495332B9A8;
	Fri, 19 Jun 2026 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781900566; cv=fail; b=J2yFyZH6l6X/72dnPcEOwfNyUTnm909ny+qXMn3kTi8WrGa/VgRhOH6mfEprnirFyEnlxBLFbn7W/dT2SyPE8WqejBlmJj0kU7sapcxC1sTPz9bmbmAFlaJrdfGobzwiZ1Ok8rkbcuijLemrPEM/XElk4VA2L4JnXDjiHTN+hPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781900566; c=relaxed/simple;
	bh=Chgm7G459MG4RwyIN8KbMoiF9oplfCJQRkudlPyH/8o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pIDOa5g+LjmMaAQrlk6SiW/z1tdhBieByu5dZc7pNQNbgvdsCkYJucc7ZRtsqGryRXrw7tzfBZTyO95iHUMf/hktkIhYnQCnEsC1CAFph8P5s559em+MjFOrPhjsTSowEEX0AKj9eJJORA6I8UpDq0UyRVV+IXFELFUK17621Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ndYqCLrx; arc=fail smtp.client-ip=40.93.198.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ndYqCLrx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UO+clD/rm509qVwqmk3jiGcKR2wyDpA/55qgk3nS/wkXlmb/BfzyLLMxC3Op4pYNmc7dyANXjouMo07Xf1bNtQIWc0Dgubm4CvtMdj195TG4qaaGumuPsYrK+IkCauVgiLFqniRkhhX8yPA3uLM4xX3HlshZ/LBbOr/eRacQELzvuT/29Z4mBEvivdwnUo6LPxbkLQ3BSIhnTUm+aVSKQIikr0I7fjpifMJE/oCw7xUzUQS8g7bUd0yvStdPlioi7CfnKH52KnZA2UV7h7EKKV0Wew6JWbBGVdYR9SdySX8RNC2kK7C1KPMw3pOFCSbxx+fkonaMQv+Gzy1nsNFsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek+nHWxEaHx/jMj7rK6WrYTMORIVMee0pF2W3BEdiPM=;
 b=uUIPIhASjp8A76HElYvaQv/cAC9HJbQ8/TfIKOyAG7rwuYXpafWhS4DHT5clxlR7qCWuuh97x6PNnX8vR3MD2QNnr7d8IsHXFv3RTj6ZU/5eUo8K1HThT4jV7KFvzKRRiNwoKn7I+/Wf9z+jd+9j5wiWk8c4wIs+X58h7kMIzK/mmYDLuwnhx+fkHpQZEW+DZBPc8+4gricD6hC5aXgDqB/FomGOW0DzyS5Ht1+NgNY+6qYmKDuueQxZMBjesv9DDiU9CxMpjBYB4Z/r65jAtArxE3sbqkg1j+7STasdlqNPpdRWhbE9YXsShh7sTjAgZqYq9REBWb0Y28SKMjVMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek+nHWxEaHx/jMj7rK6WrYTMORIVMee0pF2W3BEdiPM=;
 b=ndYqCLrxxsOE03+lIprzCmT78QFtUZY3NWKHmXPvX35RR/RHN389KAbQ9C6ctSM4htzyZXsKckRlkg5MURjmD3r5/1FpcP6Z85Gby5qiZxitFhwRx4yaBI8suPFyo4+CqB48AqgOhrMF2LkNb6gmoEw5nj0qL2/kG7YGtCvUSBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 20:22:36 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 20:22:36 +0000
Message-ID: <68dc8822-c707-495b-8379-bc614dd9e4d3@amd.com>
Date: Fri, 19 Jun 2026 15:22:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] fs/resctrl: Reset kernel-mode binding when its
 rdtgroup goes away
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
 <280912ae2d2ee068fe5ec94aaf7e6e3f4e1c68b6.1777591497.git.babu.moger@amd.com>
 <10c18df6-d990-4050-bd79-1ca914eee673@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <10c18df6-d990-4050-bd79-1ca914eee673@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0112.namprd11.prod.outlook.com
 (2603:10b6:806:d1::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 8738f072-e5d6-4e3f-7504-08dece408096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|11063799006|5023799004|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	O4UhgZnKHAgvjGqp5jfuXv+O3A26P7OktJxKM2pb4mq1oBIhM1u0FAwJV4TlwtrqanX2bDTiQIhwHcNYHImRKH9nAa0wzU+apPxwL1uZe7IHLoiuK+E0Jrni0uFgYAB+9fGYuenWnvzwo1ynboJzML315DvdkNjkmp0LxdYXsyM18OVZccwxVWMxRKC7hMu89Fl3IP2eWWuQ/9FKhSS4FxlrGyktOpvN0AcKnn/cq42gAyePmy91Y4uhLEcahS3vBX28eobp3rjXj0x/QFdsSAKIHxaR54MCgDAALu6o0WyXWgdz82yCH57T9xPBSuUaOui+RUqLTk6YeGWvOmqzrvvoRM+7CHSUHC7DSREwGDL9pMlSmeH3ROvXOfc968KEQundukUHhLRpwOH+3lmqJbSlpD2GbG9juoxMJlYuD1RjVZiA/tq8fSlX+U93IK76Cm2s2avbwWf406CnPnLKLVGk9A0QpV9/UjlpR1lCd/fmqqTIJexIyLxl9vtoNM/MiJMUO9LFRwYCzk9yYbXqcSgH2nZ+42zSfE4yP/mMJFCe4QrpgX9xlQG2yT3unsV1CSed8fFxi1Mzog1RV6WzXW4JSROGXrtTX0vKFbgX2MCa28hQGUO21ijC6CrMmhDkR9j7K/q/kWnOZC8YbAzPRwKzMNdTu1F7PvkM55Pcd0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVN2QTZBQmJqT0RnY1pTQmpBYW0yOFhFRUZQQmhkdUpHZDRHTmZaU3d5SkRW?=
 =?utf-8?B?aXYvM0lubmJhaFRQdE9XbVdVWndrQ1lkQ2h6dkxrQ0hoNzlNZnRHWXVMTlVq?=
 =?utf-8?B?VzdqWTJXOTFYRDZPb3RIMm50WmwzdEErNk1Xdm9pNTdlMGh0eWIwbHRDL2NV?=
 =?utf-8?B?SldEN0xkVStRSjdnR0lyOFNXVk1xRTBTdUduVUtwTTJ0aEFqOG50Yy85UzBF?=
 =?utf-8?B?ZVlFWGZuNzVXQjk2WlpNWU9mZGFkRVlCTUJXTXJMRXZSaUJLaU5uRytKclJR?=
 =?utf-8?B?d0dmVHh0alBQSjcvc0xoTXRRVVJYdjJ1dDk0NU5wN1RoVzFJNVZyaWdQQy9V?=
 =?utf-8?B?S05aUG95SDZTQkNPTnhWcTltZlN2bEtFZkJrQW9ydWhxeTlnV3Uwa21Cd3hD?=
 =?utf-8?B?QnFqR3BBN0Z5bGVMOXpSR2tSTnU3Z295V2tQdVlzcEFwVmpITitKM0dIcHoy?=
 =?utf-8?B?dXlRMmFVTVVxOWtKOGpBdC9wNHY1aDRHNU9DWkxVNTFrRzJ1dXFQNmFETjBr?=
 =?utf-8?B?R2hKVWZZcFFkUU9MWC9PMDBWVmRTdS9oUFhrUDhvRFg0UjFmbXdBNy9MNyto?=
 =?utf-8?B?K2Q1dk93QzFWNFBmL0xvVGxoSHFtb0x0MjU5dC9uTzFicHpKSE1UZWk4dm9Q?=
 =?utf-8?B?bEVUQzZyTG9MNE16aG5BQTZrRGlrejA1dHpuM1Q5bzlsbUpqQ0tQZUZDT1VN?=
 =?utf-8?B?UlBHbFVCamlYOEh2RDgrMC9ucXpBaHE2cy9CV3lYYWFuaHkzYkgvOUVkMFla?=
 =?utf-8?B?N21PanVEeEg3cXdCNk9ucy9zZmM5cUk1N2Z2NStROW9WZk1lWWgxWEI2UTJ5?=
 =?utf-8?B?S1RPbUUyWXF1a0Q2NFovYlRPeExWZ2JOM0ZSTjFEWllNTFBPdWllelZtUzRV?=
 =?utf-8?B?QTM2bWVKTnZCMEtyTG1sdWJ3UGdDRUR0VTFEQ0hSTFVsWVpsMTM2aWxZZ3Ir?=
 =?utf-8?B?am4zeEozZ1R4RkxyV0VmOTltTjhhMTJIS0tXQ3E2RWpIc3RyVXpKMkhETUNp?=
 =?utf-8?B?YmtrM0l2b1FCVjlnNGpJWU9tUkxMZ3RQWnh1cEtXMXVLbnNuL0tudEQ4alk0?=
 =?utf-8?B?N010MCtJV2w1YlV2UHV1dW8vd1VNMEJleEVZWEwxcEE3RnRZdE5Ld3RIZDhn?=
 =?utf-8?B?ajAvVlBrOXZ2ZzB0bEQ0cjFsUEc2YVpYUkR5ajdXNFYyUVg1Y2FBVllwTHFI?=
 =?utf-8?B?bm45YXN0QkNBZUNsUEJVcitRUmNnaDk5M3c4RG5oTzVXK2EwYSthZ0tpU2k0?=
 =?utf-8?B?MlZKRDNCckxBN3ZDQS9kb3FZTzBweWM0NThpYndXTFVrNDBsZ1R4UXpGWElo?=
 =?utf-8?B?cTIxTGRQQzFIbjRvSk5jNlhYcFRJaUJrbEhmMnhQdmdxVnZxbXRUVm5XREJR?=
 =?utf-8?B?aVBHNnBpMEpMVnpnc3V5NG1XQlhrTU1PMlBycmtoSmFGWC9jWFFpbklWemc4?=
 =?utf-8?B?Znd2TVI1TFhHLzZGUFpJSDQ2M1RDcEhMQ2xTOEJhb2tmbFo1bnZ6QlJuU3pY?=
 =?utf-8?B?WjBRUDlTK2xrV2I2TGkxVmtISWNyYTdmbWxDYjI5em56ZVdacm9WdDlOOGo3?=
 =?utf-8?B?VlIvbkZvZWtxZUgzUS9OanB6cW5SbXloR0c0ZmIvVDRRLzJzc3duL1pteklR?=
 =?utf-8?B?SlAzdllJRlFMV2dCSzdRNjJIdlFwSEZiT1hmTlRMYWYrN1ZnVUhHVklCeTRH?=
 =?utf-8?B?SlVBRDJJS1lmaFY5QitIM0NJTDZFVER5TnlBUGkvTEZvaEtTcWtqNzg3UzJr?=
 =?utf-8?B?NzBpOEFUY1lVUWNZZ1NmVTJzWVJ2azQ4OGsxQ1gzTkVJbHBPakRGcllBR1lX?=
 =?utf-8?B?SjVXZmZTS1pEOU5oRXd1aUdCYlY4c3EvNnlmSUhaWS9ZM3I5RHN0Uk91MnJ0?=
 =?utf-8?B?SnNJenRwNnVUaEdzRUVGMW9jaElQb2JEUWI5aWhscllqQjR6L09NaCttblBN?=
 =?utf-8?B?ako3d3gvNnNHeGlGMDY4N21OdDBFWGQ0ZWtZMWZmNnZKVFR2Tlg3MklIcUVh?=
 =?utf-8?B?WmlNSS9qTDc4bkJPUFJ4MVR0YlV0ZjVyMXZNV3pQRGhQcW1ZZ25UOVMxZWZS?=
 =?utf-8?B?Mkk0UytTVy92SlA4cUhhU25JN2NPOTQ4K0R4c0lQcE9qVC92UnIxeHg4Zm1L?=
 =?utf-8?B?L2YwR0wrTkw1bnIyeml4c1NmdTh4d3o1OW5rMDdlcUFHVlgvOHNWU0pPNnNr?=
 =?utf-8?B?RTF1VXNrSFh5YWQ4VkVCb3NEbnRXeDd3VGg4YzJwMFdJenB4Ri9TcUtFcVFC?=
 =?utf-8?B?bGFjODZIL0VIY2JCV2FtUkZpc1d1RkhrbDhEaUxaVjNxREZtbkxsUFM3MURk?=
 =?utf-8?Q?VE37J5FOkmk19diuZV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8738f072-e5d6-4e3f-7504-08dece408096
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:22:36.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEacFibQLc0Kzxsn0gw1xYmNrj1kP9k/iRS1pHJpZObbL97JkX6LPvJxPntdoqnT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6413

Hi Reinette,

On 6/16/26 18:42, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> resctrl_kcfg.k_rdtgrp records which rdtgroup currently owns the kernel
>> CLOSID/RMID, but nothing cleared that snapshot when the group was
>> removed.  rmdir of a control or monitor group, or unmount of the
>> resctrl filesystem, left kernel mode enabled on the CPUs the group
>> covered and left k_rdtgrp pointing at freed memory; the next read or write of
>> info/kernel_mode would dereference a stale rdtgroup under rdtgroup_mutex.
> 
> Please do not word the enabling as bugfixes.

Sure.

> 
>>
>> Add rdtgroup_config_kmode_delete() as the disable counterpart of
>> rdtgroup_config_kmode().  It clears the kernel-mode binding on the
>> group's kmode_cpu_mask (or all online CPUs when that mask is empty),
>> drops the per-group kmode/kmode_cpu_mask bookkeeping, and if
>> @rdtgrp was the bound, resets resctrl_kcfg to &rdtgroup_default,
>> BIT(INHERIT_CTRL_AND_MON)) so subsequent sysfs operations resolve
>> to a live group.
> 
> Could you please reword these code descriptions to describe why this
> patch is needed?
> 

Sure.

>>
>> Call it from rdtgroup_rmdir_mon(), rdtgroup_rmdir_ctrl(), and
>> resctrl_fs_teardown(); each call site is gated on rdtgrp->kmode so
>> groups that never participated in kernel mode pay nothing.
> 
> Does this handle the non-default resource groups removed on unmount?
> (see rmdir_all_sub() called from resctrl_fs_teardown())
> 
> (please refer to earlier comments that apply to this patch also)

Yea. I missed free_all_child_rdtgrp() and rmdir_all_sub().  Will fix that.

Thanks
Babu
