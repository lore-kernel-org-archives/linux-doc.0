Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD66481643;
	Wed, 17 Jun 2026 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711838; cv=fail; b=IK1j4BKTmkDdh0jp71KTpbxabFnRwoW3d/ywSrz86/TUpJCBET46+EHpsvOz+pu9KuhjyuzzqCMS4dlk2Cf5J3QfIGWLlax3w1XB5oY7wIj08eiWjepxg7g89pqbUIfJPlCzVqY1mehUsUUFXTJfCxgTwa7gg/8gjJqasMHfZ3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711838; c=relaxed/simple;
	bh=RV4hWfgs9r7b5M+wQNzQotMvobzzINcTdTHhNtJYW6w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d6o8ppGTtSrGgVQkGRQm4iBN0IxrUnnzw0pA55SprcQuTwzV5GBIwIz/Kv8jdDnx3kyI6PWb5IVCrpcf2GDcp63IblCGvdXzzILzHmme8ta4vkzxvyDRkVgU6445vm32eSqQ4VkLUdrqW1UMIixvyvc/gO2cv4gALZWO9F3LOCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lK82mYF1; arc=fail smtp.client-ip=40.93.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lK82mYF1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlcU5azKVpnksHAo5mcGZag0Z4MKh+nXKxz6+ojrQPdIEYuPBtjh22iWfCj7DDx8ksMm/Le8ee4FeXIQ4IrKxlMkDkbTfpdVemD1OlG4lsVln3JKkL2gaUgtpGlP5UlmGteyfJXuAz1/Cvomj93XcsNYNJPvYbWgZEHpkx5teN2TE2WWTwipGSU5iwEaghcJqm296uyPGdGMTpI0UXPqfMF+zM06csvMuULXY/C5H2cWSp77qSUpYrx7G5zeTwE1p7FmmvZKM8KMZAiiqSp0YuEhhlqzFY++mBedl+pFIyZIVGhmvTuOMfwpDy9oVfKL1K2owa4Toh4cT+dtsLmWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL/oC/q1INkR0CdPJ/1NG87TZjtjPHvvRA8Gt9kQW80=;
 b=GcwJMTgIdGlkxuK0HzC9is8JCabGKzrDBnmi/jyUlghStWI7lqLVnkHeYW4CuJODC0DWJRDVKh3iM2yg9XFTlpir0FeJkKPjSNk3BdXYPtGsDD9rztIJhdseAlWE0lKvJC7bLTCc1Rn9g+cl/D5SWBpVfDe3GCBZ6tz2ihgraGftLJkIlr7ICxh+gSRrDkTqQitZKm0W7k3xcrCE2UDKYmx0PUyEfqnmGobAv81XlH6xLvdGzJlwzCOHo9C19dBeB0NKxn2ZAoefh3ghcc5ALy2hzVKmKTCK0BqSy5dwtHbHo6XEyOlO7zkM5sPUqFF9Cy50uI84oUukepBrEPH2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL/oC/q1INkR0CdPJ/1NG87TZjtjPHvvRA8Gt9kQW80=;
 b=lK82mYF1aWAA/WXhCQbj6du+9x5tH62rU48DVbZetZAIjuBdYAUJxT0GucpZw2JbOqtzqicb1TZIPH1hAG7fixQQjaXu2N3CbwdukOtsZqn+qBg3EqVCK0s5YDjFl93XPbWMKEhKxYjLdmMSdMnzF/G7vpEDHmz5fJ4xTDLS+vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM4PR12MB7720.namprd12.prod.outlook.com (2603:10b6:8:100::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 15:57:02 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 15:57:01 +0000
Message-ID: <572cb801-c52c-4e36-8365-a309e2db6106@amd.com>
Date: Wed, 17 Jun 2026 10:56:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
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
 <4abf97e7-5ef7-4640-b182-83e8bd5bb418@amd.com>
 <2ba92dec-47ea-404e-8dc9-197a846bdb2d@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <2ba92dec-47ea-404e-8dc9-197a846bdb2d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:610:cd::8) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM4PR12MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 83579d6e-215d-4e5a-d465-08decc8911cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|921020|18092099006|18002099003|22082099003|3023799007|5023799004|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	L9YaIHSI6qg2I03VRw/h/sbjEkMtAdWl/772oySPRBw44vPMKz4eucSMaz9TKQvlczadHW6k5lSxGTaS4+97z61/nW7VaKR23eXrxbQlKcB9cEe6R68yi4FtK17eN4PI5+NzmyfB51bpH3uc0wXoq21llUWnstZPgfW8SOsV/dD6F3o+rUT5IbypbwLyHVaC5uYc12guRpYyCp4AR4AksB6/H+LWq8dmuVr6y8vNUcBsZarMluuYKZg5Gw+JfYUm16AfEO3N8MRs3iH6n7Y44rCiK9aMY4Mt3zYvpdZeQBAkx7eghukG4OmY9xblUWwus54MoMY8p0C4CtObYyx0gmVl2XUkqJZZ/HziJI/4G6aDf4z86G9dYBJ3omzb4oz56mwYy1P5WcUADs8XkLxL02ZN+GOY/l3PDdfK3h1QEo0VHIMC8s1kOVTjYNrE2b0Xt3rfn8bRPpogFNuZMmrtop4w29oQXelwaMCaH3rO5Mc+eGlIoykCo9nT3R+C8QzhTVYNvese8UGFpwOAGolk3uPq7FU64h34UQm003P3KuZHjWcvO4Ip+FdPDAK5lPLaFQnq8VTMu+vNcACywhUnLzg/OuUQib2An2uXYav7g8b4ZO5RZAN+5+z5znvJWCkRMzUzNyiIjJawmSJ8DNJsGvQLtlZ1VSVAjXg9HIDBw8pKOpT+tpndxyvNyXTakiuKRU3VQgN6NxFTQwk+m9NaYOKuuoF/N4yYCh+bOsOFGOFDsh2AtjrFCH2LZ7DX5SkG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(921020)(18092099006)(18002099003)(22082099003)(3023799007)(5023799004)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUpoQmRFTnFZcXlPK1U1ZmY5QTRWY1Z6ZVQzQUkwcndZTWlvMCt1NWFQeXE3?=
 =?utf-8?B?SURCZ0RyZkhOVU1vaWsrRmlDSFZOYTNSWXhtTDcrS1hLdXNzcmtobUpCdGtP?=
 =?utf-8?B?dnFmS1BxbXJNRXo3WGh4N1YvMW91YUllZGNmWWMxODNmVWFjZU4wWGcxYjho?=
 =?utf-8?B?VDYrU3dlcTZZWnJ4T1JGdFBKcEdrL3k2aEt6YmJ6bEpNdm9wT2ppb0JNcDVP?=
 =?utf-8?B?bDVmR0NCODcvOC9vK0xBVGpkbXNjVEtObjZuZEhLSTltTHdLbjA2dllVV3Ax?=
 =?utf-8?B?QzVOSzVsWGRzQjI1R2xjbk5DMks2SnJmejhFOU0zN09wSU5hTzNjZUFNVExX?=
 =?utf-8?B?Wkk5czRNRnBncHhwMHZNcHZCa2p6YUluS1FmOFJXWEx3NlRRckhTaFJmeUxw?=
 =?utf-8?B?Q2MwaE9NUksrcVpPVE5Qd01XbWpiSnlNMFNmbE1lakQ0U0xsOEE1cWthckJo?=
 =?utf-8?B?enJ1eExVM1QrK0ZzUmJUeitSMjA3dEh5dzRhNmtkeVF0MDdYb0Fnc0N2aXNS?=
 =?utf-8?B?b1FWNGFJNzR2c2ZNTEpxdTVDRE9JVGo5UGxWalBPUEhCTS9DU2dHWFpJY0pV?=
 =?utf-8?B?RHFiZFp5dFpsNTZORkpEemZIQ2JqSGJlREdkSk8yNWNTZTNQbkZIYjJEd0c2?=
 =?utf-8?B?R0tKeVlWdVY2cGN0ak5GUks0Uzc1ZUVxOWZSNzRBR1FXMUZITnhwckh5bGxp?=
 =?utf-8?B?T2tkOFBsNk1RL013S2VYTjI4STFiaS9CNUN1OFljMGt2bTdlamtOcUlJUU5y?=
 =?utf-8?B?czRKTjl4MFZxKzcrMlRBc3RCWllLZWlYL2xQVXEzS21FUXBjaVpRSkhqQmZY?=
 =?utf-8?B?RmNUV3AyTUh0aEJBekR3eGtQUXgyeTN0T1REbHBLcHNZT0xhVjZWWGpubldN?=
 =?utf-8?B?K3QraTdLUU41bzlzZ0lLejE0VTc4d3BsemgvWHAydkRXSWtIM2cxV1ptOHcy?=
 =?utf-8?B?OWxIQUpFU1JkYzczSUtOVmlSMlVtQ0JJemp5dzBQVGUvSmJIK21wVjdOZVNO?=
 =?utf-8?B?aGtlOE1Ebkt1bURPNHFadldhRUxjUlZ4Qm4zZE05ckh2NndaUkJkc0VXWWtn?=
 =?utf-8?B?RVo0M1E0Qy90MTFOZkxHM3ZwUVJjRUlPMWdwSm8zWk5tVnNHRHdIenNLQU5z?=
 =?utf-8?B?YkMrOUJScDB3TTZ0dk1DMUlObXUvNkh5MC96cURtUzYxbVRBaWJ1b0NoYmNa?=
 =?utf-8?B?ZGc4b2w4SHd0aEV2TDI0SU4xOGMxbkZGUU5YbEE1Q0hlY0VWQll5UUhaOUJO?=
 =?utf-8?B?VEZCbmdWaGNvdGRCQWJwczltR21ab0RaR3dWdmdVY3pEdG1EWnB5RFhlbHlh?=
 =?utf-8?B?aWREUjdtRmp0SENIR2VWQVBZNFoxL1NJamJWR2syaVFDeGlQL2pGWlZEc2ow?=
 =?utf-8?B?c2JZSEwvQkVTRnAzazBVcUZidDcwRHBBaTN4Z2kxUVNCektvMm5GMkkrdlA5?=
 =?utf-8?B?WElJaThOK29DSC9EYmUxdGIwTEIwNmRrd0tNelVUYXVOMkJWZU55VGpCekNU?=
 =?utf-8?B?YlpDemJMcS9OTktvaGZvUGZuY2w3RUZUYVBBTFowalcxQkl0dTJKWGNIUDhE?=
 =?utf-8?B?dllDUHpqVW4yNkcxZVdjVUVudHNaaklpK2R4RXlGcHRxYmdFVjF2ZEFQN2VR?=
 =?utf-8?B?NEJMWm1ldHVIWTFSbHZSeG1XSVdIRDNyVTFaZjJNRkw3L0JhY2R2eUYyTnZv?=
 =?utf-8?B?T21ucnQvY004U1ZiNjVpNC9uMUhneXY2SHFDUnJiaUFnS0xrZ0pDNkloT1Ns?=
 =?utf-8?B?a1VwVHVIYW9SNWhWSkNnUU1KVEU2VTVjbmlaSytvTlBxM0t5SlJoSThvYUZI?=
 =?utf-8?B?dUNIV3RyS29JdUJaK1kwbGRoRW1rWFlnZnFtRlBkMEExcEJzTm43SXFWSWVS?=
 =?utf-8?B?NXVMcnVRcHRCdWEwYVkxTmZ3QzBuWnJqSHl2VCtwN2RNbWkxTHhyblcrRldM?=
 =?utf-8?B?ZHZlb01RamZhNTJoL0E0K2xhNXlqSkRCcWZWMGtzQnE2QjVRSVBjdnpkZlJx?=
 =?utf-8?B?WHRBb0FEL1ZQdTRYSkJERTNDeUZmam04SnpoTGtXUWpWeVZTMnFWUmhkMmFa?=
 =?utf-8?B?MERqUDY1YlVOUHIxRVlBeURzNzIvNTVHVStsV0haL0FaakVQRkRtS0JhbTFD?=
 =?utf-8?B?bGlQZWlGNENKWjlJdDkrWUw3WE9KUVk1NXFteU1Xb0huMXEzMHNLVEhyRlpT?=
 =?utf-8?B?b21PZmxhMWw0U0RLUXJKQm80a2NXWFk0aHRubklBaVhvUnBhTUdWVmwxNGJw?=
 =?utf-8?B?Ly9LMCsyYitabHFJOGJIeEMwaHJrMW5ja0x5TkJ6ZnlqRnBKZWtTcnBreTBv?=
 =?utf-8?Q?c4FHPpv94NlyK2LjWX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83579d6e-215d-4e5a-d465-08decc8911cb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 15:57:01.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukxNoiMJsImSuvWO3m6vS8BmO6gHY39QEGNN2P9wg52TI4C6QatZZiQ2I13VxMkS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7720

Hi Reinette,

On 6/16/26 23:34, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/12/26 8:37 AM, Moger, Babu wrote:
>>
>>
>> On 6/11/2026 4:53 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/30/26 4:24 PM, Babu Moger wrote:
>>>> Design
>>>> ======
>>>>
>>>> A new sysfs file, info/kernel_mode, holds a single global policy that
>>>> selects what kernel work is steered and which rdtgroup it is steered
>>>
>>> How should "selects *what* kernel work is steered" be interpreted? Do these
>>> modes not all apply to *all* kernel work?
>>
>> How about?
>>
>> A new sysfs file, info/kernel_mode, holds a single global policy for
>> kernel contexts and the rdtgroup associated with the policy.
> 
> What does "kernel contexts" mean here?
> Also, since rdtgroup refers more to "struct rdtgroup" that is internal to resctrl
> I would suggest "resource group" be used instead.
> Consider, for example (this is just something to get started, please do not just
> copy&paste):
> 
>     A new resctrl file, info/kernel_mode, holds the global policy for
>     resource allocation and monitoring of kernel work and the resource group
>     (when applicable) associated with the policy.

Sounds good.

> 
> 
>>>> to.  Reads describe the supported modes and the currently-active
>>>> binding; writes change the policy or rebind to a different group.
>>>> Look at the thread below for design discussion.
>>>> https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/
>>>>
>>>
>>> ...
>>>
>>>> Examples
>>>> ========
>>>>
>>>> (See Documentation/filesystems/resctrl.rst, "kernel_mode" and
>>>> "kmode_cpus" sections, for the full UAPI.)
>>>>
>>>>     # Mount resctrl
>>>>     # mount -t resctrl resctrl /sys/fs/resctrl
>>>>     # cd /sys/fs/resctrl
>>>>
>>>>     # Read the supported modes.  The active mode is bracketed and reports
>>>>     # the bound "<ctrl>/<mon>/" group; other supported modes report
>>>>     # ":group=none" because nothing is bound to them.
>>>>     # cat info/kernel_mode
>>>>     [inherit_ctrl_and_mon:group=//]
>>>
>>> This is unexpected since associating a group to this mode implies that this
>>> group is used to manage allocations and monitoring of kernel work but this
>>> is not true, right? From what I understand there should be no group associated with
>>> this default "inherit_ctrl_and_mon" mode.
>>
>> The default mode is "inherit_ctrl_and_mon", where both user mode and kernel mode share the same CLOSID and RMID. This is current mode (without this series).
>>
>> I thought we are going to set the default mode with the default group when system boots up. No?
> 
> As I have it, the end of our discussion on this topic is at:
> https://lore.kernel.org/lkml/6709398b-269d-47b5-9b41-084f410bb1a6@amd.com/
> 
> Based on that discussion there is no resource group associated with the default
> inherit_ctrl_and_mon.
> I find the above output confusing to user space since adding the default group as the only
> group to this mode implies that kernel work inherits resource allocation and monitoring
> from the default group but that is not correct.

Ah, I misunderstood earlier.

The display will look like this when the system boots up.

# cat info/kernel_mode
   inherit_ctrl_and_mon:
   global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
   global_assign_ctrl_assign_mon_per_cpu:group=uninitialized

There will not be any group associated with "inherit_ctrl_and_mon".
It is only used to switch from other two modes.

> 
> Your answer seems to refer to other discussions about what group should be used for
> a mode when switching to a new mode and user space has not set the resource group. If not,
> could you please point me to which discussion you are referring to?
> 
>>
>>
>>>
>>>>     global_assign_ctrl_inherit_mon_per_cpu:group=none
>>>>     global_assign_ctrl_assign_mon_per_cpu:group=none
>>>
>>> nit: "none" does not reflect state as clearly as "unset"/"uninitialized"/"NA"
>>
>> Lets go with "uninitialized".
> 
> ok
> 
> ...
>>>>     # echo 0-3 > ctrl1/kmode_cpus_list
>>>>     # cat ctrl1/kmode_cpus
>>>>     f
>>>>     # cat ctrl1/kmode_cpus_list
>>>>     0-3
>>>>
>>>>     # Empty masks are rejected; use info/kernel_mode to reset to
>>>>     # "every online CPU".
>>>>     # echo "" > ctrl1/kmode_cpus_list
>>>>     bash: echo: write error: Invalid argument
>>>>     # cat info/last_cmd_status
>>>>     Empty mask not allowed; use info/kernel_mode to unbind
>>>
>>> Why are empty masks rejected/not allowed?
>>
>> No specific reason.
>>
>> When the mode is switched, we discussed earlier to globally apply the mode to all the online CPUs.
> 
> Right. I did not see this being done in this implementation though. As I mentioned in
> my response to patch #8 it appears that it uses old data from the resource
> group's kmode_cpu_mask. I do think that applying it to all the online CPUs
> matches the intention and would make the code much simpler.

Yes. Sure.

> 
>>
>> At this point reading "kmode_cpus_list" will still report empty.
> 
> I do not think resctrl should do this. This is not accurate and conflicts with the
> existing cpus resctrl files. It should be simple to just present the actual and
> accurate data to user space, especially after incorporating Qinyun Tan's contributions.

Sure. Will do

> 
>>
>> Users can change it to selectively apply the mode by writing to "kmode_cpus_list".
>>
>> I was not sure what was the action when empty masks are written.
>>
>> Should the empty mask apply the mode to all the online CPUs?
> 
> Users are used to being able to use an empty write to remove all CPUs from a
> resource group. It thus seems intuitive that an empty write to the kmode_cpus file

Ok, That seems reasonable. Lets keep the same behavior as we update 
other cpu_lists.

> behave similarly. Sounds like this could mean that if user space sets the
> kmode to global_assign_ctrl_inherit_mon_per_cpu or global_assign_ctrl_assign_mon_per_cpu
> and then writes an empty mask to kmode_cpus then it would essentially be setting
> inherit_ctrl_and_mon mode? This still seems ok since if disabling one of the "global"
> modes on a CPU results in that CPU inheriting from PQR_ASSOC then it seems
> reasonable to extend to when that mode is disabled for all CPUs.

Yes. That is correct.

> 
>>>>     # Disable kernel-mode steering (back to inherit, default group).
>>>
>>> This sounds like kernel work is steered to default group which I
>>> do not think is accurate for the "inherit_ctrl_and_mon" mode.
>>
>> How about ?
>>
>> Drop the kernel-mode binding and restore inherit_ctrl_and_mon on the default group.
> 
> No. There is no "inherit_ctrl_and_mon on the default group". There is nothing special
> about the default group when it comes to inherit_ctrl_and_mon mode ... or am I missing
> something?

You are right. There is nothing special about inherit_ctrl_and_mon on 
the default group.

> This could be something like: "Activate inherit_ctrl_and_mon mode to let
> kernel work inherit the resource allocation and monitoring from the user space task."
> (and drop the default group from the output associated with inherit_ctrl_and_mon)
> 

Sure.

Thanks
Babu

