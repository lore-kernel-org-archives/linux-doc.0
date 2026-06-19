Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42230DD11;
	Fri, 19 Jun 2026 01:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781832594; cv=fail; b=eChHhfXVSTjKttEXwfl6FKw3pd9RJ3gT/5hDpoG/NZlxoiRzFMQ/NApZlEW2ewO7Wmm8EY/SwfeFFQ31+cQi+kCa3/e+uaQodbYOeWESp3lrpoWzA/egde7weLEIKfHYuwmB9w0AQgYsFlt80RQrI4ZFNqUfs+wES2NC6WM4hOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781832594; c=relaxed/simple;
	bh=GaPWAd9hC9TlczbqPQwz23EhTScVHG427gyka4SAl70=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d7cg3tUEFl1A+pqsba708CUNV25PKxrX2BbRv5/MWwtvFubNB/5bZynRz/fmSf2K7sWCK2HV2De/LFpPNTc6p4OLDRWSVyKc1VuVsh4yt8kk/efkqrBmHbFKSe5Kzk43v0xWhJiRu5HOupF1u74OPrD+xS2boFwMJX8pS83B0aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OCF2Uwit; arc=fail smtp.client-ip=40.93.195.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OCF2Uwit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1RG+m56+bNQ+J2KdEXsd6zkZgMhywAcyEHOeXo2T2H+SIlG/nZ2BCzw+wcs+4p1dWrvVywR+zPUe2NUzFPUDRpUM9Ftucl/2V1dh9WohSZq2oibqTwM02S77BYuGdkp7ifyGqFgmVrUNSV0HqzuAEaMV9RUQS9aA4FjfHud2Xm3C7yZAu+RYgCYe1TF2WhS3QoqIQQAWHJc6czZH1iu2koByUb1Wvuop3H95A/En8LKOIihm8EZQ7m+9B0li7LhIx30kAVDrkIyayVJvI5PdD8fEW51lsnAKLkDFIQeVGHXY12yXXoCq3YIYBN+WjiEbh5QQ61dmQDApPwcCMxnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ioI+yxH70yai6ANSrWMCi6fEPVDX/O8rkej9mltbdQ=;
 b=KM2C6mGGvI3bkBS9J0r2LYWUt5rS86IfoyzdegmTr5FGGhsLxtvY6cgV1tLGv/FVz064fi5/UgRW33/eztCJg7bVJkAVs6SNEl/0C5YGHEsWj9HU5gXoP29msb0fUQZXLdgyYc3Hu9ZWFgIFhNK8sAkzJmbfusqeD67r7qrdrd7Ierm9LTmDt3S+LF8ox6YYEtXnZCWDCMk1wnthO/NwdUal1MlTKYmq7QI3P8INK9Upu8DL3kp7MGYViRKb7c/LIs0YlcoYWP5UCH32vZ9IEHrPbEU1auNHEbOoslRGjb1wA9SyawtWBNJBif9zFhXblo1ZN8jQxoB8dMQwIQeFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ioI+yxH70yai6ANSrWMCi6fEPVDX/O8rkej9mltbdQ=;
 b=OCF2Uwitj0+eSt0uNyzxE8y3UCUfVZKL9g4OEy/fC6CgJoMbMH3e0fWVu+pVZJ9ed15bC9AdxzeEeSgZWNJjjak0WpsVSZ7mzUEqjiH5hoB3f9FB1Dw3nW2vZJbIoio69cHZrybCgkHtMDwLhBlFyttbfSSiDrfkFTrSes6ynGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 01:29:46 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 01:29:46 +0000
Message-ID: <280f2dab-56be-49b9-982f-16f01727a732@amd.com>
Date: Thu, 18 Jun 2026 20:29:40 -0500
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v3 08/12] fs/resctrl: Make info/kernel_mode writable and
 identify the bound group
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
 <768d4b603542f3202ece4294c808dbbf1a8e3008.1777591497.git.babu.moger@amd.com>
 <57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com>
Content-Language: en-US
In-Reply-To: <57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::13) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 97eff0ad-8351-4e1a-f960-08decda23efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|18002099003|22082099003|5023799004|4143699003|3023799007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	EANmwQ/5l72vIuE2KAkPtzCN0wmYUAZPmRnJVnLjZGWhjflB2CypaVEocfMRuwk1EOfGn2IyXsQR2n4gaYAEoqdujx5hcQF6Ub/bAZ8j/hV1SIon5SBCreIzXeIdQMbI2/UX0hKguLBzqZc5aUgZfEGCr6w2xsje0sFolwbTTnn31PAu39PVcn7vXTiYcNCUAsKbyWT+1rMaubbpATD8ZqNY3mS3rjtZvcoM5OMIK3vRBv9xF6xQktN+iegGWWINb26WabI5ovREKOMBHmd6Vn1CVRPZ3OTa0DvjZqfVAWcTDvE+UvTSXJD91vv0CZ+mLsU3HZJfcUKEIpW1WWmMZ0Fde6JZ8q7poIFkCpF+cUl1aNP4Z2+90jZl9u2KFCmEZT96Bn+dY9OuVL6fNKQo8PVnzjYnXYNedNDFihwGNDOqru8sDMiQNXmUK/7Dp4uwDsfxk4UmFYy22G2SiO3JIFM18wyi6gE8JNiG2WjI43FL1h1eriAYalZ9G7iCptTdE+EZda5B4+sTBekwB/nl4mAsO1P+EGVGm6Iz3ATQcbPuR7XhC4UizoOIwCQY5SezXGgzMbaa8t3UIMdmlxvIdQhhEx2QKoYwGihkCsyEhbSC3/k/BZ6H7j9+x+bxZw32yE5QEKh4CU+IipAa1000sxlsjFpc4PIHj84uhPh5zyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(5023799004)(4143699003)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFdITkJ0aC9Db0V1a1NwWG04SmdpTXZLSzJCUU1oaXM3QWFVT1RYOW9Ed3J5?=
 =?utf-8?B?VnBJeFlPckZucGJ3VHNUL3RFTS9PNHJwREpDWlEydjlUTFI4UE9nczJDODFq?=
 =?utf-8?B?dFk5RHFZOHBiUXMwNGlqZFROVmU1V3F0cDMxRUl0R2tOSWtvTlkwdmFxM2Nm?=
 =?utf-8?B?dW5QNmxrZ25Vckl0ZUJXdlJKTk8rSGlzYmxsUys0SnlBOHhFVkNCbUFXMmVN?=
 =?utf-8?B?NUlNRDBzWkRCVzZaZzZ3cGZDTVpLT3haOFIvSGx6UTNZSVF4SElURUVDYytV?=
 =?utf-8?B?SzMwUmRFbE5lNGZKVElTM1RxU2k0ZThUT05NV3NtMCsyZjdKU2Z5NGRXM3hI?=
 =?utf-8?B?OEUwL1ArRk5selNabmx5Zm9CeEkrOEZ2V2YwZGRuTnpTNEt4NDVmRGUvazc1?=
 =?utf-8?B?cTR3d3MyQkFQNjNhZGJXU0Z6RHZCNG4wR3gwajFzMHF5NFdUeVdINWY2clgz?=
 =?utf-8?B?SEdqQTBDcEI4b0c0OWxINnZCVnVSK1p2dU1vSTBDeURjOFdRcDBXaFgyRkNT?=
 =?utf-8?B?a1R2UWZZU3Y5SFVDUlFjZGhZSHBGZHRhM0UzeUtBZEphRWF1NDB4aWdtSG1m?=
 =?utf-8?B?M3FuNkVuOUhkZzR4OHhtVGVMOC9HVE5peVpUb0NVRkdjeXdGUm9FOC9iTVVh?=
 =?utf-8?B?QWN0RmtMRDcyS09sZzY4bVN0clJXK3ZNUzRFb1c2alJ4eXd2NXN1TkFWV1ZB?=
 =?utf-8?B?Z2I2UDllejBIa1FkVkpSdDMwNGcva2loSG5HMkhyVURjdzFSNGUxUG9MSVd5?=
 =?utf-8?B?TmNPTVNHSVYrWFVSOE8waUdQN3d6Nk9UTXlmTlJKSjRzeGFOZmxseWE3TXFK?=
 =?utf-8?B?a3ppY0Q0Y0N3WWV3NGFQMlNlMCtEelFlU0tRbk1kVWUweDVUb2VQM1Ztb2tr?=
 =?utf-8?B?bDRDZzNjL0F3cXNjV0hwQ2VvMUNxNlpGdFFJQURZUmFIQ25KM1BhKzJxZVNs?=
 =?utf-8?B?RnU2RHR0N2wySDRqKytiNUpmVmUwb245L1A3TVZiVXJkL29vcVBSVGxsOVNy?=
 =?utf-8?B?YTN6UVYxMndRcE9teUlqbERjdzFZTjk2eEdjZG5FYXJJTVAzS0pNVXQ2ZGEw?=
 =?utf-8?B?NGFTcVU5SmRSYWJ1UzBqWlpxTFhNQy95ZTlQSGxDRlhCQVltd1h2QXdVU25M?=
 =?utf-8?B?UWRxNUZtQXp4S3hPVlIxN2JtRVFOVi9LUnpGTnNOZ1IwaXNsMk82L2dNUUJK?=
 =?utf-8?B?bHNhVFg5RzRWaGhVSE9uUzFPNk0vVHJOYzhDaGNPaEEvYkxtNEpHZ2hlaEVz?=
 =?utf-8?B?N0kxQ29oWnhqSW1DME5QOFFBTGNEZDlyR0tnaTZMTkRhZjhMYnppd2puWUlj?=
 =?utf-8?B?NWVIL1gxNW1WUjM4YnpIRmU2cUd5alZtdU4wUGJNa2FHUXBycVZnQTZhMk5h?=
 =?utf-8?B?NjBSNFMrb0g5bFpRdDNJUkRCckxtV1l5N0w4OXF1Njh6ZEg1eGlzVGJPdXIz?=
 =?utf-8?B?VkVKeE4wbWVxeUNoZGI4ajgvaHhJVDBuNkxKZit2K05JbmhrMS9USlZvZjJY?=
 =?utf-8?B?VmVzM1VheXBzWUJMclRyUk5KUHUrRnBkU0lWSEE0cUp0TUpXYUdHS3dHaGx1?=
 =?utf-8?B?SER5czBNRVAyczB4MDRaVUpDRmJuMnY4bzBWQnZvOWhVTUVLaGhGeGsyaENN?=
 =?utf-8?B?c2xVSENMaUx4dVB2UUV5UmJVVkhlVU9mN0V3V1hKYjZwRS9DWW1EUk9ydmsy?=
 =?utf-8?B?eU9wVXZyOXl3NXVmbGVrcHcydFU0VWNDTTFKL2ZHc0xqT1JwNkxjdTJzT1V4?=
 =?utf-8?B?aVVZbnFBaDhYSFFmWkZhdTB3NkxXeHZCSktISjNjZyt4TUpFUXQ5bjZKZTVr?=
 =?utf-8?B?M2hPNFFVMWJFTzBZQmtYeEtJeitXd2NUR0hqaWZMT3dQUGQ2c0Z6aS9tNUh5?=
 =?utf-8?B?TWNzN3Q1QVNRMHV3U0tKUFdmMU1xY1lFYXloQ1hQU3hmM0hQeGJNdFpzZWVq?=
 =?utf-8?B?aXVYUENPYitYdnJEWkpRbDd4N282VHcrQ0tCS1NPMWlwMDJ5NSsyaW5Ybkxq?=
 =?utf-8?B?ZlFTalFadC9wcGlqZXl0cUJaM3lJTTZhTnR3WTdub1h0N2E3bE9FSEJuRjc1?=
 =?utf-8?B?bVRxZEF1OWMxc09kQi9aS3dmUStvWFQxWUg2WTE2cnRzQUJCS2hjd2J0c0hp?=
 =?utf-8?B?ajdsU3J6K2sxV3FVeWtpWDJMNDZrc2FZNzNrSkg5N0E1dFM2cmN1RSsxSVhO?=
 =?utf-8?B?cmhJaVAva2psRHlvOTdSR0ZVUWFzMTdiWVVxTjFBVWt0eDUrQnFnQUU0RUJw?=
 =?utf-8?B?QmY5aUJSL1psekk1RGZibjZieWZzRzVnU0VyR2pMV2NRdldrb3JVamtvc0lK?=
 =?utf-8?Q?Op5iFMt4KdbrN1WZ0p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97eff0ad-8351-4e1a-f960-08decda23efc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 01:29:46.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Amc4aoCx+mOORazwPeZD9+cf3arU4nrWOkHcRU6R9Gv1J1wUWLlhbSWVSCbEokfu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920

Hi Reinette,

On 6/16/26 18:42, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> info/kernel_mode lists the kernel-mode CLOSID/RMID policies the kernel
> 
> (also here please drop the x86 specific details and consider the resctrl
> fs changes to be valid from MPAM perspective also)

Sure.

> 
>> supports and the one currently active, but user space has no way to
>> switch policies or rebind to a different rdtgroup, and the file does
>> not name the group that owns the kernel CLOSID/RMID.
> 
> This adds a new feature. No need to describe this change as a bugfix.

ok.

> 
>>
>> Make info/kernel_mode writable.  The format used by both read and
>> write is one line per mode:
> 
> This sounds like multiple modes can be written to the file as long as they
> are separated by newline? I do not think it should be needed to support
> write of more than one mode at a time.

Will change it.

> 
>>
>>    inherit_ctrl_and_mon:group=none
>>    [global_assign_ctrl_inherit_mon_per_cpu:group=g1//]
>>    global_assign_ctrl_assign_mon_per_cpu:group=none
>>
>> The active mode is wrapped in "[...]" and ":group=<ctrl>/<mon>/" names
>> the bound rdtgroup ("//" for the default control group).  Inactive
>> modes report ":group=none".  Documented in
>> Documentation/filesystems/resctrl.rst.
> 
> Above describes the output of the file. This changelog can just focus on
> what needs to be supported when user space writes to the file.
> 
>>
>> The write path strims input, strips the optional "[...]", validates
> 
> strims?
> 
> Wait, why support the brackets as input? This seems unnecessary.

Will remove it.

> 
>> the mode against resctrl_kcfg.kmode, and resolves the optional
>> ":group=" suffix via the new helper rdtgroup_by_kmode_path().  An
>> omitted suffix or an INHERIT-mode write binds to the default group.
>> On success, rdtgroup_config_kmode_clear() tears down the previous
>> binding and rdtgroup_config_kmode() programs the new one before
>> resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur are updated under
>> rdtgroup_mutex.  Allocation failures in the helpers are propagated so
>> the write fails atomically.
> 
> This also reads like it just describes the code.
> 

Will re-write it.

>>
>> Add struct rdtgroup fields kmode and kmode_cpu_mask to track the
>> per-group binding.
> 
> Please do not just describe the code but *why* this change is needed and
> what it means and how it is used.

ok.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: New patch to handle the changed interface file info/kernel_mode.
>> ---
>>   Documentation/filesystems/resctrl.rst |  51 ++++
>>   fs/resctrl/internal.h                 |   6 +
>>   fs/resctrl/rdtgroup.c                 | 375 +++++++++++++++++++++++++-
>>   3 files changed, 431 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index b003bed339fd..89fbf8b4fb2a 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -522,6 +522,57 @@ conveyed in the error returns from file operations. E.g.
>>   	# cat info/last_cmd_status
>>   	mask f7 has non-consecutive 1-bits
>>   
>> +"kernel_mode":
> 
> (dropping the documentation here since I believe earlier comments apply)

Will rewrite the documentation. Will drop the x86 specific details.

> 
> ...
> 
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 1a9b29119f88..9435ce663f54 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -216,6 +216,10 @@ struct mongroup {
>>    * @mon:			mongroup related data
>>    * @mode:			mode of resource group
>>    * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
>> + * @kmode:			true if this group is currently bound as the kernel-mode
>> + *				CLOSID/RMID owner (resctrl_kcfg.k_rdtgrp)
> 
> (drop CLOSID/RMID)

ack.

> 
>> + * @kmode_cpu_mask:		CPUs scoped for this group's kernel-mode binding;
>> + *				when empty, all online CPUs are used
> 
> Why does "empty" signify "all online CPUs"? This complicates implementation and
> creates different interface from existing CPUs interface of resource groups.

Will change it. It will display all the bound CPUs.

> 
>>    * @plr:			pseudo-locked region
>>    */
>>   struct rdtgroup {
>> @@ -229,6 +233,8 @@ struct rdtgroup {
>>   	struct mongroup			mon;
>>   	enum rdtgrp_mode		mode;
>>   	enum resctrl_event_id		mba_mbps_event;
>> +	bool				kmode;
>> +	struct cpumask			kmode_cpu_mask;
>>   	struct pseudo_lock_region	*plr;
>>   };
>>   
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 9cdcfa64c4a2..5383b4eb23ed 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1055,6 +1055,378 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
>> + * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
>> + *
>> + * Derives CLOSID/RMID from @rdtgrp->type:
>> + *   - RDTMON_GROUP: parent control group's CLOSID with the monitor group's RMID.
> 
> This seem unnecessary since when a monitor group is created it's closid is inherited
> from it's control group?

ok.

> 
>> + *   - RDTCTRL_GROUP: the control group's own CLOSID and default RMID.
>> + *
>> + * Calls resctrl_arch_configure_kmode() with the kernel-mode binding enabled
>> + * on the online subset of @rdtgrp->kmode_cpu_mask (or all online CPUs when
>> + * that mask is empty), and disabled on the complementary online CPUs so
>> + * stale enable bits from a previously bound group are cleared in the same
>> + * reprogram step.  The caller (resctrl_kernel_mode_write()) is responsible
>> + * for validating that the (kmode, group type) pair is permitted before
>> + * invoking this helper.
>> + *
>> + * Context: Caller must hold rdtgroup_mutex.
> 
> Please use lockdep_assert_held(&rdtgroup_mutex) instead. See "Documenting locking requirements"
> in Documentation/process/maintainer-tip.rst

ok. Sure.

> 
>> + *
>> + * Return: 0 on success, -EINVAL for a pseudo-locked group, -ENOMEM if
>> + * cpumask allocation fails.
>> + */
>> +static int rdtgroup_config_kmode(struct rdtgroup *rdtgrp)
>> +{
>> +	cpumask_var_t enable_mask, disable_mask;
>> +	u32 closid, rmid;
>> +	bool need_disable;
> 
> (needs reverse fir)

Sure.

> 
>> +
>> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
>> +		rdt_last_cmd_puts("Resource group is pseudo-locked\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!zalloc_cpumask_var(&enable_mask, GFP_KERNEL))
>> +		return -ENOMEM;
>> +
>> +	need_disable = !cpumask_empty(&rdtgrp->kmode_cpu_mask);
> 
> As I understand rdtgroup_config_kmode() is called when the kernel mode is switched.
> Also, earlier patches made it explicit that "Default scope is all online CPUs".
> 
> It is not clear to me how kmode_cpu_mask is initialized here ... it almost seems as though
> if a resource was associated with a mode at some point and received some CPU changes then
> when the mode switches between some other resource groups and then back to the original
> then the old cpu_mask will be used on the mode switch. Should the resource group's cpu_mask
> not be re-initialized to all online CPUs? If done then all of this cpu_mask wrangling seems
> unnecessary to me, just use all online CPUs?
> 

Yes. That is correct. It needs to be changed.

> 
>> +	if (need_disable && !zalloc_cpumask_var(&disable_mask, GFP_KERNEL)) {
>> +		free_cpumask_var(enable_mask);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (rdtgrp->type == RDTMON_GROUP) {
>> +		closid = rdtgrp->mon.parent->closid;
>> +		rmid = rdtgrp->mon.rmid;
>> +	} else {
>> +		closid = rdtgrp->closid;
>> +		rmid = rdtgrp->mon.rmid;
>> +	}
> 
> Considering MON group inherits the CLOSID if its parent, can above be simplified
> to just be?
> 	closid = rdtgrp->closid;
> 	rmid = rdtgrp->mon.rmid;
> 

Yes.




>> +
>> +	/*
>> +	 * Empty kmode_cpu_mask: enable on every online CPU.  Otherwise enable
>> +	 * only CPUs in the group mask and explicitly clear on other online CPUs
>> +	 * so a previously bound group's enable bits don't linger.
>> +	 */
>> +	if (!need_disable) {
>> +		cpumask_copy(enable_mask, cpu_online_mask);
>> +	} else {
>> +		cpumask_copy(enable_mask, &rdtgrp->kmode_cpu_mask);
>> +		cpumask_andnot(disable_mask, cpu_online_mask, &rdtgrp->kmode_cpu_mask);
>> +	}
>> +
>> +	if (!cpumask_empty(enable_mask))
>> +		resctrl_arch_configure_kmode(enable_mask, closid, rmid, true);
>> +
>> +	if (need_disable && !cpumask_empty(disable_mask))
>> +		resctrl_arch_configure_kmode(disable_mask, closid, rmid, false);
>> +
>> +	rdtgrp->kmode = true;
>> +
>> +	free_cpumask_var(enable_mask);
>> +	if (need_disable)
>> +		free_cpumask_var(disable_mask);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * rdtgroup_config_kmode_clear() - Tear down the kernel-mode binding on @rdtgrp
>> + * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
>> + *		May be %NULL when no group is currently bound, in which case
>> + *		this is a no-op.
>> + * @kmode:	Kernel-mode policy currently active on @rdtgrp, as a
>> + *		BIT(&enum resctrl_kernel_modes) value.  When this is
>> + *		BIT(INHERIT_CTRL_AND_MON) the hardware tear-down is skipped
>> + *		because no MSR was previously programmed.
>> + *
>> + * Disables the kernel-mode binding on the CPUs @rdtgrp covers (its
>> + * @kmode_cpu_mask, or all online CPUs when that mask is empty) and resets
>> + * the per-group bookkeeping (@kmode and @kmode_cpu_mask).  This is the
>> + * disable counterpart of rdtgroup_config_kmode() and exists so that a write
>> + * that transitions the active mode to BIT(INHERIT_CTRL_AND_MON) -- which
>> + * skips rdtgroup_config_kmode() entirely -- still tears down the previously
>> + * bound group instead of leaving stale enable bits behind.
>> + *
>> + * On allocation failure the function returns -ENOMEM and leaves both the
>> + * hardware state and @rdtgrp's bookkeeping unchanged so the caller can fail
>> + * the operation atomically and last_cmd_status reflects reality.
>> + *
>> + * Context: Caller must hold rdtgroup_mutex.
>> + *
>> + * Return: 0 on success (including the @rdtgrp == %NULL and INHERIT cases),
>> + * -ENOMEM if cpumask allocation fails.
>> + */
>> +static int rdtgroup_config_kmode_clear(struct rdtgroup *rdtgrp, int kmode)
>> +{
>> +	cpumask_var_t disable_mask;
>> +	u32 closid, rmid;
>> +
>> +	if (!rdtgrp)
>> +		return 0;
>> +
>> +	if (kmode == BIT(INHERIT_CTRL_AND_MON))
>> +		goto out_clear;
>> +
>> +	if (!zalloc_cpumask_var(&disable_mask, GFP_KERNEL))
>> +		return -ENOMEM;
>> +
>> +	if (rdtgrp->type == RDTMON_GROUP) {
>> +		closid = rdtgrp->mon.parent->closid;
>> +		rmid = rdtgrp->mon.rmid;
>> +	} else {
>> +		closid = rdtgrp->closid;
>> +		rmid = rdtgrp->mon.rmid;
>> +	}
> 

I can directly use it like below. I dont need to check for RDTMON_GROUP.

	closid = rdtgrp->closid;
  	rmid = rdtgrp->mon.rmid;


> Same comment as above ... but actually, why is closid/rmid needed at all? This
> function is intended to *reset* the kernel mode so needing a valid/active closid and
> rmid does not look right.

This is a bit tricky. I may need CLOSID/RMID in 
resctrl_arch_configure_kmode(). According to the specification, only the 
PLZA_EN field is allowed to differ across CPUs where PLZA is enabled; 
all other fields must remain consistent across CPUs within the same 
domain. If CLOSID/RMID are not passed, it could result in inconsistent 
values across CPUs.

> 
>> +
>> +	if (cpumask_empty(&rdtgrp->kmode_cpu_mask))
>> +		cpumask_copy(disable_mask, cpu_online_mask);
>> +	else
>> +		cpumask_copy(disable_mask, &rdtgrp->kmode_cpu_mask);
> 
> Having kmode_cpu_mask accurately reflect the online CPUs will simplify this to
> not need any of this wrangling and kmode_cpu_mask can just be used directly.

Agree.

> 
>> +
>> +	resctrl_arch_configure_kmode(disable_mask, closid, rmid, false);
>> +	free_cpumask_var(disable_mask);
>> +
>> +out_clear:
>> +	cpumask_clear(&rdtgrp->kmode_cpu_mask);
>> +	rdtgrp->kmode = false;
>> +	return 0;
>> +}
>> +
>> +/**
>> + * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
>> + * @ctrl_name:	Control-group name, or "" for the default control group.
>> + * @mon_name:	Monitor-group name, or "" to select the control group itself.
>> + *
>> + * Matches the path syntax emitted by resctrl_kernel_mode_show():
>> + *   "//"            - the default control group
>> + *   "<ctrl>//"      - control group @ctrl_name
>> + *   "/<mon>/"       - monitor group @mon_name under the default control group
>> + *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
>> + *
>> + * Context: Caller must hold rdtgroup_mutex.
> 
> (lockdep)
> 

Sure.

>> + *
>> + * Return: Pointer to the matching rdtgroup, &rdtgroup_default when both
>> + * names are empty (the show form "//"), or NULL if no such group exists.
>> + */
>> +static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
>> +					       const char *mon_name)
>> +{
>> +	struct rdtgroup *rdtg, *parent = NULL, *crg;
>> +
>> +	/* Show emits "//" for the default control group; round-trip it here. */
>> +	if (!*ctrl_name && !*mon_name)
>> +		return &rdtgroup_default;
>> +
>> +	/* Control-group-only form: "<ctrl>//". */
>> +	if (!*mon_name) {
>> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
>> +			if (rdtg->type != RDTCTRL_GROUP)
>> +				continue;
>> +			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name))
>> +				return rdtg;
>> +		}
>> +		return NULL;
>> +	}
>> +
>> +	/* Monitor-group form: locate the parent control group first. */
>> +	if (!*ctrl_name) {
>> +		parent = &rdtgroup_default;
>> +	} else {
>> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
>> +			if (rdtg->type != RDTCTRL_GROUP)
>> +				continue;
>> +			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
>> +				parent = rdtg;
>> +				break;
>> +			}
>> +		}
>> +		if (!parent)
>> +			return NULL;
>> +	}
>> +
>> +	list_for_each_entry(crg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
>> +		if (!strcmp(rdt_kn_name(crg->kn), mon_name))
>> +			return crg;
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * resctrl_kernel_mode_write() - Select kernel mode and bind group via info/kernel_mode
>> + * @of:		kernfs file handle.
>> + * @buf:	One line in the same format emitted by resctrl_kernel_mode_show(),
>> + *		i.e. "<mode>[:group=<ctrl>/<mon>/]" with an optional surrounding
>> + *		"[...]"; must end with a newline.  The ":group=<spec>" suffix is
>> + *		optional -- when omitted the default control group
>> + *		(&rdtgroup_default) is used.
>> + * @nbytes:	Length of @buf.
>> + * @off:	File offset (unused).
>> + *
>> + * Parses @buf, validates that <mode> is listed in resctrl_mode_str[] and is
>> + * supported by the platform (resctrl_kcfg.kmode), resolves <ctrl>/<mon>/ to
>> + * an existing rdtgroup (or picks &rdtgroup_default if no group was specified
>> + * or if the new mode is INHERIT), clears any previous binding via
>> + * rdtgroup_config_kmode_clear(), programs hardware via
>> + * rdtgroup_config_kmode() when @kmode is not BIT(INHERIT_CTRL_AND_MON), and
>> + * on success updates resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur.  The
>> + * display-only "group=none" form produced by show for inactive modes is
>> + * rejected.  Errors are reported in last_cmd_status.
>> + *
>> + * Return: @nbytes on success, negative errno with last_cmd_status set on error.
>> + */
>> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
>> +					 char *buf, size_t nbytes, loff_t off)
>> +{
>> +	char *mode_str, *group_str, *slash;
>> +	const char *ctrl_name, *mon_name;
>> +	struct rdtgroup *rdtgrp;
>> +	int ret = 0;
>> +	size_t len;
>> +	u32 kmode;
>> +	int i;
>> +
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
>> +		return -EINVAL;
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	/* Tolerate surrounding whitespace before the bracket/mode parsing. */
>> +	buf = strim(buf);
>> +	len = strlen(buf);
>> +
>> +	/* Strip the optional "[...]" that show uses to mark the active line. */
>> +	if (len >= 2 && buf[0] == '[' && buf[len - 1] == ']') {
>> +		buf[len - 1] = '\0';
>> +		buf++;
>> +		len -= 2;
>> +	}
> 
> I do not think the brackets should be valid input.

Sure.

> 
>> +
>> +	/*
>> +	 * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
>> +	 * and when omitted the default control group (&rdtgroup_default) is used.
>> +	 */
>> +	group_str = strstr(buf, ":group=");
>> +	if (group_str) {
>> +		*group_str = '\0';
>> +		group_str += strlen(":group=");
>> +	}
>> +	mode_str = buf;
>> +
>> +	mutex_lock(&rdtgroup_mutex);
>> +	rdt_last_cmd_clear();
>> +
>> +	for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++)
>> +		if (!strcmp(mode_str, resctrl_mode_str[i]))
>> +			break;
>> +	if (i == RESCTRL_NUM_KERNEL_MODES) {
>> +		rdt_last_cmd_puts("Unknown kernel mode\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (!(resctrl_kcfg.kmode & BIT(i))) {
>> +		rdt_last_cmd_puts("Kernel mode not available\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	kmode = BIT(i);
> 
> Can kmode be of enum type to be assigned the actual enum value to avoid all these BIT(enum value) usages?

You mean?

enum resctrl_kernel_modes {
	INHERIT_CTRL_AND_MON		= 1U << 0,  /* 1 */
	GLOBAL_ASSIGN_CTRL_INHERIT_MON	= 1U << 1,  /* 2 */
	GLOBAL_ASSIGN_CTRL_ASSIGN_MON	= 1U << 2,  /* 4 */
};

#define RESCTRL_NUM_KERNEL_MODES  3

> 
>> +
>> +	if (!group_str) {
>> +		/* No ":group=" suffix: fall back to the default control group. */
>> +		rdtgrp = &rdtgroup_default;
>> +	} else if (!strcmp(group_str, "none")) {
>> +		/* Display-only placeholder emitted by show; not selectable. */
>> +		rdt_last_cmd_puts("Cannot bind to 'none' group\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	} else {
>> +		/* Require exactly "<ctrl>/<mon>/" - two '/' with the second terminating. */
> 
> User should not be expected to provide monitor group when the monitoring is inherited.

Yes. Will add that check later. I will update the comment here.

> 
>> +		slash = strchr(group_str, '/');
>> +		if (!slash) {
>> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
>> +			ret = -EINVAL;
>> +			goto out_unlock;
>> +		}
>> +		*slash = '\0';
>> +		ctrl_name = group_str;
>> +		mon_name = slash + 1;
>> +		slash = strchr(mon_name, '/');
>> +		if (!slash || slash[1] != '\0') {
>> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
>> +			ret = -EINVAL;
>> +			goto out_unlock;
>> +		}
>> +		*slash = '\0';
>> +
>> +		rdtgrp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
>> +		if (!rdtgrp) {
>> +			rdt_last_cmd_puts("Group not found\n");
>> +			ret = -EINVAL;
>> +			goto out_unlock;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * INHERIT mode binds nothing; force the bound group to the default so
>> +	 * round-trips with show (which prints "group=//") are stable and any
>> +	 * user-supplied :group= suffix is silently normalised.
>> +	 */
>> +	if (kmode == BIT(INHERIT_CTRL_AND_MON))
>> +		rdtgrp = &rdtgroup_default;
> 
> rdtgrp = NULL ?
> 

Yes.

>> +
>> +	/* No-op if the same mode is already active on the same group. */
>> +	if (resctrl_kcfg.kmode_cur == kmode && resctrl_kcfg.k_rdtgrp == rdtgrp)
>> +		goto out_unlock;
>> +
>> +	/*
>> +	 * global_assign_ctrl_assign_mon_per_cpu binds one CLOSID and RMID for
>> +	 * all kernel work (Documentation/filesystems/resctrl.rst uses
>> +	 * "<ctrl>/<mon>/", i.e. an RDTMON_GROUP).
>> +	 *
>> +	 * global_assign_ctrl_inherit_mon_per_cpu assigns one CLOSID globally
>> +	 * while leaving RMID inheritance to user contexts; that uses the
>> +	 * control group's CLOSID slot only, i.e. an RDTCTRL_GROUP.
>> +	 */
>> +	if (kmode == BIT(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU) &&
>> +	    rdtgrp->type != RDTMON_GROUP) {
>> +		rdt_last_cmd_puts("global_assign_ctrl_assign_mon_per_cpu requires a monitor group\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +	if (kmode == BIT(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU) &&
>> +	    rdtgrp->type != RDTCTRL_GROUP) {
>> +		rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	/* Switching to a different group: release the old binding first. */
>> +	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
>> +		ret = rdtgroup_config_kmode_clear(resctrl_kcfg.k_rdtgrp,
>> +						  resctrl_kcfg.kmode_cur);
>> +		if (ret) {
>> +			rdt_last_cmd_puts("Failed to release previous kernel-mode binding\n");
>> +			goto out_unlock;
>> +		}
>> +	}
>> +
>> +	if (kmode != BIT(INHERIT_CTRL_AND_MON)) {
>> +		ret = rdtgroup_config_kmode(rdtgrp);
>> +		if (ret) {
>> +			rdt_last_cmd_puts("Kernel mode change failed\n");
> 
> If it fails here then previous binding was released successfully but new binding failed. What is
> state of system?

Yea. Need to change this one. Will use Qinyun Tan patch.

Thanks
Babu

