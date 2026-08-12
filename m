Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BEA315785;
	Wed, 12 Aug 2026 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786575473; cv=fail; b=m65IByU+Pi3mmBYBQScavdzGVRGXwpn/3PcgmMY3iWY3aY1wwUiAZ8A7yWK0WOfaLUSl/nmnETR7ptkVnKR4TQpci+LAhZgdgHJZ6fnVNv9l0BAxpgc3NmSJr66So80nSf8JGnKqojRSc5wOV4gHypH33O8AVTvwh2hDOENDCwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786575473; c=relaxed/simple;
	bh=LbHCCssVBk/gOU446F0PRoxscLtW09DvvLlcQm0DoDE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rBx1BgGZsen/gvs8tHvCv5yYaJxV5nsV++O5aLtWaoLz2bE8l9msvOloI13GuSNc5jPXAll8VyvjtgmIBHsGmMZhQAzbcLFZiLANFT5eZNxrMP6avynCxn4kEE0UJhHMEvlLEAE31g5oGGRkQmULFU2NH5bEHmLozXDGNvQdDEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W06/Okp2; arc=fail smtp.client-ip=40.107.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W06/Okp2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaWOQMoB69DLyLJF1LMFJkZg0fqSAJspy2p60xOlFCZy9UyML/Hquv5ftt2RYCsRu43H97GQ8/ezpwZg1MPNUX5hvetW1ZHilpEIf2L5MdMF97EF3VR0f6ewozSPOAT3oNJQ9sCfYcDgIXgCELdqisYvjbLu52DzKYElquHOfRhKlG8+4GMv7YZpBTpzFXrioK35cUCVzYIozMZQayNgYpmeUoWD+SFIo3iycyNf0AloPbhdFHNdgjqXhH4qJdxwaZiolGkeYKiocuDNB9OWXtGy0rotKDBBUjgBSB3kP540q/iNFFcwI5PfjYzIRK3sy8o8k9mAG7pSaZOLHiGdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHxTVaNQf5qDkU+gIOu4NrNdvWlv8UluYM/39vdupCc=;
 b=UI9llJ+9aThk5LOAfUDNQ8lHZ1sf5JKAC3sy96eKnMLIrvXuFuALN8COtAjWu1QxnAbWQ8Xv5QBhxEcWlufeXW71CNGf3nJdcMebrOAT6sAXWvZ+Nc+uQ9w88tsYVMYhckDvjrxKKgrw3MTqdlPvX262YP+53mQQXXUbXhGOYJfIQ/HxBE0qu/CK9zUWSkgcFQ7EOKBu6sS4CZnVK9WeAC8LyR2+3w8zp1LjUCeZ1C5TyY8wPlofbvJSRcjKO7TQYRQjMb7Vb2uwQeUeETU0w7+/WB1WM4DcbKGIBhD4McpDhpGhDKxbdycqdO/ZSTBWsYq65VPPoR0jCZBV9peX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHxTVaNQf5qDkU+gIOu4NrNdvWlv8UluYM/39vdupCc=;
 b=W06/Okp2+6X9taW9ubITosSrjQe70eS7o9OiOuV5pvxFfosKwTTd823BPraGPtMq7LkrSOkiCod4KYpD1QTnmoeZRINSV4GKvNPKffQuGLx5d8v5XjhbWirFzg7tKTBKAAnw7UwBdPveH+fGMBqGIZYXYA5YPvWTQx4STYhtMos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 22:57:42 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 22:57:42 +0000
Message-ID: <924aedc6-c2dc-4c09-84d5-2bdf1370ab36@amd.com>
Date: Wed, 12 Aug 2026 17:57:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 08/15] fs/resctrl: Add interface to display
 supported and active kernel-mode policy
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
 <c86c7a64f25171b773077ec47a20850b44f73ada.1783461016.git.babu.moger@amd.com>
 <328e237e-3d26-47c0-8167-8ffe5d765daf@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <328e237e-3d26-47c0-8167-8ffe5d765daf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:610:58::12) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 9210d3ee-1277-441e-c8a3-08def8c51dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|56012099006|10067099003|6133799003|8126099003|18002099003|3023799007|22082099003|4143699003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	fudcy/ZOs44D+1AIDbXNPImHu9GhXTyvxuPrxPiO1bW835CqN2OcSx272HWTw/Dm9JBXL8HpQciaNx0auYQVzftrwqeOf0I0UKVJkmno1VP1NEQVtHxktLjPzZ/SSZBxfg3/W065ZBCKjzJq+t+lB3lLNB4HODBoOa+bEyEIsATpD9AkOVTMXeG79RJsuHGkVReYQmM9vc5JYCFuYEKTGYhfmqZJ6db42wUx65TTUKjY0nJjz3mbHvk7H1kLnhmhAogzrFTSrskRw/mn3vypDDTuk7DizgbxmjeTWtENxaKB2WEhfCjQnI0JN+pcBy9XcAI/FOBChZixpCiT+tSCHfwu+JoV9LJWcX3/I5iiLis10i4Gt5VvLz22kY8wf8JVoX7MH0keWu2tFeYO6H1sl9wVFO5RX2gItkJEONZ90ipDLLDwXAWv+MiFTjDXnYbf+GYf1ANzv/6SNkVb6O/VJ+ZAaQa2Y7Zu6l5fFH/RaFBAalTJrSWjmXpnEGhiTqzNBf4SyXZoEs0RIbjHA9aeGi9WeDJazGar6dh6V7zNYfRuEvTxjVmUad6Ey/E1BkBcYdT3t/hrWzBX+v0BcQpkg0lw0KIPZP3R7t3V24BW5KO+VdwgUNn72+amoJwr4n1/M39pgbLXJjcN2Bu1jOTHu1YihqIkCOMVMLVz4wS9mAC2nw/sKYROaxDQaluWvR7L2WESZgYh1a+p1qaoh6Ah9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(6133799003)(8126099003)(18002099003)(3023799007)(22082099003)(4143699003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFJ6dXUzZ0IrTTN3elVXM00yTFFmN2tScTIxSFhwbXdXR3BOUGsxYVNYMW8x?=
 =?utf-8?B?NDdpcUVsNTZVOHZyMGJkbm1NWlJTNnlNWFZ0d0tsanNVRHRsVWoxcElSSEdt?=
 =?utf-8?B?YVlUdTlMRjFCMkdQWm53TzN0T2JzM2lwZmhYc2FreEFFS1JzUUhUMGJuVnl1?=
 =?utf-8?B?Vk5XWXFYVTRiYWsxMVFoSGhmblZiVTZOcVE3VzhOYy9KV3owT1NTYVM0REZS?=
 =?utf-8?B?VVh1T3BuZ1pFWExJdGVXL2JudFZCdGQzU3U4ZUZrNmtuL1hVdlhQQzhQWGhH?=
 =?utf-8?B?eEEraG83TXgxaXkzek9uVHMyZEMycUxYRVFyUnFRalR3Y0dNUWMyV0tjS0xB?=
 =?utf-8?B?TlU5c1ZwRXRIenhrR3pRc1h5YWw5Y3BTTmhGUWhvbnRNUzl1WW4zS3hic3Vv?=
 =?utf-8?B?WDRzOWViLy83aVI3TWxMQmpHc3NKaHMrckE4M3k0RFZhMndYU016bzErNlVz?=
 =?utf-8?B?TndIdTlWUWw3OFJaamJsNEpONGVGdklvWHdBM1pwdWcxTUlDcGRrK2E2REVW?=
 =?utf-8?B?ZE12SndYdTlTQ3FjYlpiLzJJaVVsV3hYSzQ1VEcvVXZiTXpPbjRwY2FTRVlu?=
 =?utf-8?B?ajRNQmNoUlFzVzBHdUVIYUd2MHVxMEp6QmJ1Y0twUFhrcVhjNFFieDJsMnBK?=
 =?utf-8?B?TUgxeVZEcG55dDM2Z01uYzdUV0Q2UWtwblJWblAvcDVza3d3YUk1VGt3b3pu?=
 =?utf-8?B?c1VGVmx4Vm1CL01XLzRNRVlFa3I3TTBCNk9UOU50WVlLWGdxVlVCb0xxam85?=
 =?utf-8?B?ZXptQTlOMytCb3kyNWprbGdGc2RhQU1uenhYK3RpS25ZcEFtRnM4clJyeEdj?=
 =?utf-8?B?cXlMNkFKMTVIWGRPUkJNNkdsNVdHbGlMdWNpZFNGQUpiMnJmWnhHS2IyTzMv?=
 =?utf-8?B?NEZXVitKVkNKbjlnZTV0Ymk1UUFML09ldHNQdS9KZVJkM0o3QzVNVkVSTnBX?=
 =?utf-8?B?V0FhdGV0QzlOQ3hwTlY0YkRLbG4vQlZGRlJtQi9GYVl3THBiS282ekd0VU8v?=
 =?utf-8?B?a2pKRFZqQVptZ2ZYaFh2UGtwekttNU9OWHpwc3VUZnhUdDE2R1VVMzRLQkM4?=
 =?utf-8?B?SXVCRXlmQ1lEYXJmeUxNVWRrbWhoTS9UVG9NMWRoZWJ0MGhEd1BmeXAyMnVm?=
 =?utf-8?B?UHQzMTRPMkp3MUVVMldzQlh4ajN5RWNUNnBiVUtLd1VlNjUzUzUzN2xxYjJI?=
 =?utf-8?B?Rjl5ajhvcUhzZGl6L2huQ0lSQU9BUy9TVVVWeHRaTDhkTmZBU0JMejJIWThQ?=
 =?utf-8?B?aElkSWtUNmhrd0FiRXNJR20zZGdwengwNVdkZXBDOW5UUENBQWlHSXpwdWl5?=
 =?utf-8?B?a3RxQ1VUN3NjWlAvLzM4cnVNeGVsUHQ5YkdJcEpFZ29OQU40dCttVlF1d1JM?=
 =?utf-8?B?bmlXVGlLM0ZlTDB5M2VQMTc4UjE3VTAybCt3ZDR3NHloQkp3UmdZbHJaMlI4?=
 =?utf-8?B?SUN1ZEtha2l0SUFVMUlscDhwTG9lMnBIYXZPT2x5ZUl0R3dYUjNRUkVySk5R?=
 =?utf-8?B?T1ArM3NIajVoWkRWVWFXdW8wY21rZ1ltWlVPOGZqSnRZaFJ6NjJ1NGVRdkNG?=
 =?utf-8?B?ZUVraWRhTFVjM0Yyblg4UVgvbUVYbGpmU0xBMmJGV3dhNEc4UFpnbHJSTW9P?=
 =?utf-8?B?L0p2NGEraDN2VEh2YzBDNDlLWlIvd2Zsb2UzYTArRFc3N2lSTUt5UWNndER1?=
 =?utf-8?B?QUs5SDFYZmdpcTAybTR2UTk5Mjk3Ylc5UmlKWTZ5Mk5vUjl5eXJYUDh2TFUx?=
 =?utf-8?B?Vmp6aW02S2p1ZXhHa0h6VElSckgzRlRmeHdsTmx6ZjVrOGFVcXZHTnNxMzlI?=
 =?utf-8?B?L3prOWNLbkU5ckFmUXFkaWtvRmVNYTlFOThPbXF5QzdQZ095RUtDN3ovQnB5?=
 =?utf-8?B?d2NDeW1kcmtEczZZd1h4K0FQMUhQNkVhcC9yYVZlNi90U2FqdVJVRzU2bmxw?=
 =?utf-8?B?UjFaNWNObnZQRDU4cmFTK0t5SFBETm04eE4xbDJvQmtTR1d5UDd4L2xlSkJs?=
 =?utf-8?B?M2k3aHNhWTlQMVR2TjRyaDliM1VnSWJXY2s4RzJNYUNsZGVLMXYrb0JRbHU3?=
 =?utf-8?B?aUFxZkJkMmxFTUM4a080NkNWL2owYTJ1YmtBbUFRT04vWFdWdmZFYjA1NjFW?=
 =?utf-8?B?V2d2SGhGa216OVlkMHVjVW5Tb1d3UHlvS21sZ2hhTFpkcFdUc21ZZGdRbU1G?=
 =?utf-8?B?ZWRyMVRXTjgwczBvN2ZqVFhNeWZpLzlBVmJrQmwrQy9YajY1MXJvbStQZ1kr?=
 =?utf-8?B?QlVYL0x5Lys0a29OaDgwdEdsUE1KcHRqN3ZNNDZwelBkT0U1MGhDNGhWcHpS?=
 =?utf-8?Q?QaKeK+F9VJMgO20nCO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9210d3ee-1277-441e-c8a3-08def8c51dc8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 22:57:42.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+DtQXHBDxcyXRaG6/nZdUOSWH4zziNPZIbnn2vG451W20PVMn+iiWeh/S+vB6jn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225

Hi Reinette,

On 8/10/2026 10:18 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Kernel-mode resctrl policies define how kernel work is associated with
>> resource allocation and monitoring relative to the user task. Generic
>> resctrl tracks the supported policies, the active policy, and the resctrl
>> group backing any global assignment policy. However, this information is
>> not exposed to user space.
>>
>> Introduce a new resctrl file, info/kernel_mode, to expose the global
>> kernel-mode policy and its associated resource group (when applicable).
>> This read-only sysfs file lists all supported policies, one per line, and
>> highlights the active policy using square brackets.
> 
> (please rewrite with consistent terms)
> 

Sure.

>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
> 
> 
> 
>> +/**
>> + * resctrl_kernel_mode_show() - Display supported and active kernel-mode policies
>> + * @of: kernfs open file
>> + * @seq: output seq_file
>> + * @v: unused
>> + *
>> + * Displays one line per mode set in resctrl_kcfg.kmode. Bracket the active
>> + * policy (resctrl_kcfg.kmode_cur).
>> + *
>> + * INHERIT_CTRL_AND_MON is displayed as "[inherit_ctrl_and_mon]" when active
>> + * or "inherit_ctrl_and_mon" when supported but inactive, with no :group=
>> + * suffix in either case.
>> + *
>> + * Global-assign modes append :group=. An inactive mode is emitted as
>> + * "<mode>:group=uninitialized". An active mode with a bound group is emitted
>> + * as "[<mode>:group=<ctrl>/<mon>/]", where <ctrl>/<mon>/ is derived from
>> + * resctrl_kcfg.k_rdtgrp.
>> + *
>> + * Return: 0 on success, or -ENOENT on error.
>> + */
>> +static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>> +				    struct seq_file *seq, void *v)
>> +{
>> +	enum resctrl_kernel_mode mode;
>> +	struct rdtgroup *rdtgrp;
>> +	const char *ctrl, *mon;
>> +	bool active;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&rdtgroup_mutex);
> 
> The changes to make resctrl more robust have since been merged. Please consider:
> 2d77f9768850 ("fs/resctrl: Prevent deadlock and use-after-free in info file handlers")
> 
> When you rebase, please use the new info_kn_lock()/info_kn_unlock() helpers.

Sure. Will do.

> 
>> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
>> +		if (!test_bit(mode, &resctrl_kcfg.kmode))
>> +			continue;
>> +
>> +		active = (resctrl_kcfg.kmode_cur == mode);
>> +
>> +		if (mode == INHERIT_CTRL_AND_MON) {
>> +			seq_printf(seq, active ? "[%s]\n" : "%s\n",
>> +				   resctrl_mode_str[mode]);
>> +			continue;
>> +		}
>> +
>> +		if (!active) {
>> +			seq_printf(seq, "%s:group=uninitialized\n",
>> +				   resctrl_mode_str[mode]);
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * There should be a valid group when any of the global
>> +		 * assign mode is active; otherwise, report an error.
> 
> This would indicate a resctrl bug, no?

Yes.

> 
>> +		 */
>> +		rdtgrp = resctrl_kcfg.k_rdtgrp;
>> +		if (!rdtgrp) {
>> +			ret = -ENOENT;
>> +			goto out_unlock;
> 
> If this fails there needs to be content in last_cmd_status. Otherwise this
> fails and then last_cmd_status reads "ok" or worse .. an old failure message.

if (WARN_ON(!rdtgrp)) {
	rdt_last_cmd_puts("Invalid kernel mode group\n");
	ret = -ENOENT;
	goto out_unlock;
}

Thanks
Babu
