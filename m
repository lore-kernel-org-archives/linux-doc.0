Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E5340D9D;
	Thu, 13 Aug 2026 20:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786651635; cv=fail; b=D3ck4JTxu33FW2kh2VPWyqh0wmzN3EAaCU7afqTJms3OtEDzZZgtJ5Pu153HLJOMxAAp5fvEvjoRsP3HNkqc7tYaQ2Fju1RTv648SreD2VYDWngxDz9NCzDAnJ2UxDTEATiqxan7XY/yd3zn4SVoVZUHAcTaGHPiG1pAlCxlTUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786651635; c=relaxed/simple;
	bh=qBtEvLWrR6demPWyBQJJiYqBJvchTZSc9ja4/fHxm5s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=shM7dJ/PLxTFBjTREeFCe0Lf1kqGVFaA/AqJdwsWpOOauwG3eTsHZEBj/jsmp3SB8MzX5umJx6H+/AgZqkLmtk/vqPcgKPTHwkl6dOfIcR9iSp7RgbCii+aYCk/h21xNcST+Hz1X0VuvJd2mkG/jhEVjvnOncHN41X41NkWEwm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SNGzmFmQ; arc=fail smtp.client-ip=52.101.56.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SNGzmFmQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcXXk3C9uN4Fe0viWM0H6awRKKyE8OzLjvZU9tUbLt1GEMyYbf9FdyqIqnbPW2DEgnDh/+Xk+a/lEtv7aV+CkjbA/nGhhEIWBnfk85qnPT+zjqvdb5H56jeFPq3OGqGNzmOfekHhXW4B7hE5qCryHMkIK8T/nltm/gw19Fdy/eC83xBtgkVMXBUCT/HNnn3myejg4l34WfLZkXXbo6OFVSaVfcAyLqJafp/+dn9iCDEgeBK9nBrIr9eodUj8BFYQJZz1xXdBYX4ZVuCacA39X0GAcpsISfr4thXD4aJZxG0+kOs7CyFllabECF8JiWgUjx6Jo8luFaNLz2L6FGJ4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQk2ts6bdaP0C3pHtOsLm8rJ3SA/FmoMs579sqrO+Sw=;
 b=xLRo6WQXrFKWRB9L0F8EfWUyG8XMSI0Z/JZFkgb6ybxfyEgx7bh/qteAu3ED+mm5iLlOWZpzBcE9Wv/u4/6Wcc3pqg5NkBNVyAyuGmVjXlkmCxX4XIUvlBXj2Yakanag6PICDmIt/T13gve9gN4vRkYbCqisZyUqa2w2fGP/EWUCNRxFkD+oOxWTP4tJdd4mt9/9JN/rkNNCG7fCTSLQ8cht5fuZaLXuS3/f5IUUdMa0OCXaWgMTVZd0t4ffjOBvLt7Z8ZR5Q6yn8Dw1rspnG40Z10i80Srf7OnAFdD2Qv5mB439fyWImLjPNJ/xIE3HM4+6W2koGPMgnCfAZe4xGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQk2ts6bdaP0C3pHtOsLm8rJ3SA/FmoMs579sqrO+Sw=;
 b=SNGzmFmQfFbZlnXZF1CkGVY+418XA6bYvDkhHdPfHCgHHe/Bl0njX2wUbwCmZgszuv5xts9U9KbvEOY/J1yxXc3oC6b5NaHUHoBOjPorGShd2T4dSEvX/TEpBdDoDYydh6POUUIDNwYBVBPwGhNztfTU89XLsntW2o+ZFSE+DMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DSVPR12MB999148.namprd12.prod.outlook.com (2603:10b6:8:38a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 20:07:04 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 20:07:04 +0000
Message-ID: <a2429484-9275-490f-baa3-638e2b8f0bb9@amd.com>
Date: Thu, 13 Aug 2026 15:07:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 12/15] fs/resctrl: Hide kmode_cpus[_list] on
 groups not bound to kernel-mode
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
 <8cfc12d1f79cf649633de01c5878ce5ab777a58b.1783461016.git.babu.moger@amd.com>
 <0126a5e5-48cf-416f-a21b-c231a703c18b@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <0126a5e5-48cf-416f-a21b-c231a703c18b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:610:5b::39) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DSVPR12MB999148:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af83b78-8baf-4f70-239c-08def97671a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|5023799004|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	+XdunnVTHo3+JeGR9TZDZS3382zrGg9pM78CbkmsEM3ijPLUPnznie0pWULpG1OuORV7hhTgCMV6M/WaN6tPJu+sQWvwEtvlq+tTllcFSxpLJZ/TlrTpOeRUpp6/TrEYyv7gB75lTV2NGfrg8eyoMAi38EyXzSoMUTFho/zS/8eusNZ8Ar2VO94v1KFRPopsTvaXbSxocc8KLnSg9diGUqCI7lAqkXeIN/qlHTeIQsPrmiog3qcRyNQ+Nu3vv2JsiI0o+vm6fvQKEJTB7JlywpBOddzw0MHT8dor6bH8Wd4/UdT+bW1ho0v0hOUdwGmm2n51bSPhXnneUe1T/XfEhvV+OhKQWIAuJsdT9CqAjiPKLBl7elK8RzSAc6zfy74ocUnniPsM03YdPaNReI74lEAVQkmrcnT2e5AgEPtqsU2bfY5uUJtakPWe26LScc3ox8eN4YzBNbgMdpKbDavN/0iQgWZSrXcMJJZYVFbM5t0xaEsMSicprmPLOntDiRkGfNyBRIUjZ4tU4goPXMfhTFZRqzG0nWOM5O8d7tPmp563Y1CBubeUlHV77LBnWFu9iZ4tl7C3c8t9FfTLdzUFCgRMHmVfmZ/k2op/tKrg/kA6J/yXQItP2IRDth/0Vg0tNVxC+CKD/TuSYPGooY/1LecjMq7uj7h6RVftI2uQgl4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(5023799004)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnBjRmdoWFZKKzR3ZktpMGtWek84aklZU1dwMUtLVEY3SGdpZEJOT3RzZ3l6?=
 =?utf-8?B?VlJsRGRRUlJ5YjBBenJNR053QkZkczBFRERJbytNUC9lZmFqSEpTa2p4aTZW?=
 =?utf-8?B?S0RrYytneGR1U2wrMkc5bDN6NGhTM2tYNXVwTndabDNDZ0pGeFVOblR0bFF2?=
 =?utf-8?B?cXM3L3B1QlJaY1dkOE9wdVh5RWJzVkRwQUpaRWhYbXZBZDl1RzBhZVZZR2JF?=
 =?utf-8?B?STVHbWxJSTBDVVZqK1d0OVhHWDlSbmNuYW81QzNERXBkUFM3WVpUWWpRN01y?=
 =?utf-8?B?N1FjdHN0d2prRForWVlaZnRFbEE3RUtPakczU2dHOUJTSWFpMTBwOS9JdU1y?=
 =?utf-8?B?aVE0clMybThzWXJlU1h6OHlkR3kzRHpsT1lFTm9SV2RBdlRRNlRDVDljOVhN?=
 =?utf-8?B?L1hWTFNIMGhPbnZIVHRjT1NpS3JBdi84WWpKRUhOVWlRSHExOFc2dXpUZ3l6?=
 =?utf-8?B?bHlSaGNBT1FjQmh1K3Y3TUliN3FjeW9ac0JsWjZETUQzUDRnaHV3aTBpdXV4?=
 =?utf-8?B?dzhCL2RNSGdiV1hnMEpHWlozd2h3cnIzMFIvbU10eks1Z0ZZclRCSm95bDA3?=
 =?utf-8?B?NTI4M1RMQWdtOHBucytPdk1RVU0yVTB2WlV2SG1QUG93RktTRUI5VldGSVJ5?=
 =?utf-8?B?SkdObmc4NWR0eStLbHZ3dml4cXdKMnYvaDkyaFFNYjZZWUo1RnlqcEpBaG13?=
 =?utf-8?B?RWlDSUw5bDR6UHFMcVI1UFg0S3VLYWtJOXpZMEZONFo0ekRQUHlDTWpoY2hT?=
 =?utf-8?B?UWlpa2F4RFN0Q20wTzBaVERETzR4SU8rdjZzbjFIVWpMemRETk5pallyYTFD?=
 =?utf-8?B?My9CNEFCalUxYnVIU1BnKzVrMzF1SnVIRXR5WHl0ODZ6Wm5yY3REb0RyR0E2?=
 =?utf-8?B?bnN0bmdPWDkrekRRWjV5cVBkekdwUFlmbU9qd0NVK2NpeTZYRm5RSlk3RDcr?=
 =?utf-8?B?Wm1OMXVMdTNjalhIMTBRaTJKR2VucVVRK0pvNUVvNlVDQTdkZ3BIelF4bFpi?=
 =?utf-8?B?YVZ2bEZIdTlxK3R3eTZIMXZVVjdoaGQxOGYySU04QzJwZHEzZlRlTTJSLzZM?=
 =?utf-8?B?UmhGNlVEWGY4ZzVpajVIV3kvN0o1bzBPdG5mL09sVW5RZStzVFJaRmhNSmFF?=
 =?utf-8?B?bUNiOXhkdytRWTdJU3ArdXNtV3JnaURkMENyY3pFdFRHYytTeXRxSnFycTVz?=
 =?utf-8?B?YUxjSHBuT1ZLV1dBSFlNenV4ZzhkMldwZ3J1RkVzRDhOS1lKUkJOdUM1emcx?=
 =?utf-8?B?ak82T1I4Sk9zWDhVQkt6VEJ1Wm5qQVBpakFUY3h0M0REUWUzSThJckg3aGhG?=
 =?utf-8?B?WEIveC9nVEpua2gzdmpzbVI5ODViNmFyejNCaEV0dzluaGJrR0c2U0FMaVdY?=
 =?utf-8?B?dWZ2aVlMdkVhNmxoaDRtUE96UFVhSkZ6Q2xrbEE1Q0xiY1ErS2FCNldTZURt?=
 =?utf-8?B?N0Z2ejVCNlRYUWJUSzhHeGdVdVgvRHRvbjllWVdlbjAzeksxMElzSzVVTzFP?=
 =?utf-8?B?S3p6Y3lOdDdzQU4zS1ZxN29udU9iUE1LTlVQRFJMZ2V3cGlQTUpYUGthWlBI?=
 =?utf-8?B?NitiRXlkY3lBSTB2ZUJvU1U2V3YvTmwvOW1GNzgrVDVtcDB4ZE5qaDdlcVJT?=
 =?utf-8?B?RXVjeHFqeVhxdXpPL24wNExPRUtoNm5tNzNWRWF2emd3Sk55YnZvZE5rcTBF?=
 =?utf-8?B?NENLRHM5TDZLejNoVHhMOVdmQytzek9VTDBaVDJHOGFXZkkxRHlBejJWaGxl?=
 =?utf-8?B?ellrY2d5L2ppdlpHbFJIVW1tSm5jeDBvNnVYbzExazNlWEExMXBBVG5HMGN0?=
 =?utf-8?B?MDl3Q043bDZqTFBEMWdCRGxlcGZ0WGZWNUM5b3RoU3pERHVBMS81QkZ5dmtr?=
 =?utf-8?B?c1NTcmJzdWdvaVlqOW9vRUxDeDV1S3R2ZGxmb2ZvUkdaS3FBdWRtdFBOTXpk?=
 =?utf-8?B?Yy9GSVFTa3FFeGo0NWVGVWhyUjdtc0pPcmptT21nVlp4Z3lkOTFtOFRkRlJw?=
 =?utf-8?B?TUxlMVVuUWlGZS9rdXJDVmg1Mm5McWszdTBHYm9DbjRzN0hEMUU4TFlJamtR?=
 =?utf-8?B?SHFQS0Z2M1hhcCtSTDh3MXVlRHVsQ3NpUkRlZEMyOXJPNkFKbWZrTWV1OGdL?=
 =?utf-8?B?QS96cW5nR2FVc3BmN21hM2hTWWlzbFRnOFlDQ2NYcFprQU1qT3BDM1o0OC8r?=
 =?utf-8?B?a2tnUkNLdW9ZK3VXWVZSWEVGQmc1NXRDdy82dXVTYit4U3oyNkdZSllIZ0Nr?=
 =?utf-8?B?cTd6VFcwRHMrTEMzOXIweU5jZ1FGN1A4OW1kRXI2ejVsS1grUGFJdFZHSVhs?=
 =?utf-8?Q?0xkpf3BkF82fIp62ZJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af83b78-8baf-4f70-239c-08def97671a7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:07:04.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKIZLmqsZFyXyhb2k+Zy69EXv7cZ1RziEO2T7K+Y1p4UU7rXWICmIjPQYYggvsZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999148

Hi Reinette,


On 8/10/26 22:30, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> kmode_cpus and kmode_cpus_list describe the CPU scope for the rdtgroup that
>> owns the active kernel-mode binding. They are meaningful only for
>> resctrl_kcfg.k_rdtgrp.
>>
>> On groups that do not own the kernel-mode binding, they appear as inactive
>> stubs and can let user space inspect or update state that does not apply to
>> that group.
>>
>> Hide kmode_cpus and kmode_cpus_list on groups that are not bound to
>> kernel-mode. Keep the files hidden when groups are created, show them when
>> rdtgroup_config_kmode() binds the group, and hide them again when the
>> binding is released.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v4: Updated the changelog and code comments.
>>
>> v3: New patch to hide/show "kmode_cpus" and "kmode_cpus_list" when kernel
>>      modes binding changes.
>> ---
>>   fs/resctrl/rdtgroup.c | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 413d3ff14546..c537846d9264 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1127,6 +1127,35 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +/**
>> + * resctrl_kmode_files_set_visible() - Toggle visibility of the per-group
>> + *		kernel-mode CPU files under @rdtgrp.
>> + * @rdtgrp:	Resctrl group whose "kmode_cpus" / "kmode_cpus_list" files
>> + *		should be hidden or shown.
>> + * @visible:	%true to expose the files, %false to hide them via
>> + *		kernfs_show().
>> + *
>> + * Each file is resolved independently as a sibling under @rdtgrp->kn.
>> + * Failures from kernfs_find_and_get() are deliberately ignored, allowing
>> + * callers to invoke this before activation, during group creation, or when
>> + * the kernel-mode binding is updated.
>> + */
>> +static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visible)
>> +{
>> +	/* Keep in sync with res_common_files[] entries for these files. */
>> +	static const char * const files[] = { "kmode_cpus", "kmode_cpus_list" };
>> +	struct kernfs_node *kn;
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(files); i++) {
>> +		kn = kernfs_find_and_get(rdtgrp->kn, files[i]);
>> +		if (!kn)
>> +			continue;
>> +		kernfs_show(kn, visible);
>> +		kernfs_put(kn);
>> +	}
>> +}
>> +
>>   /**
>>    * rdtgroup_config_kmode_reset() - Tear down the kernel-mode binding on @rdtgrp
>>    * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
>> @@ -1155,6 +1184,7 @@ static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
>>   
>>   out_clear:
>>   	cpumask_clear(&rdtgrp->kmode_cpu_mask);
>> +	resctrl_kmode_files_set_visible(rdtgrp, false);
>>   	rdtgrp->kmode = false;
>>   }
>>   
>> @@ -3068,6 +3098,7 @@ static int rdt_get_tree(struct fs_context *fc)
>>   	if (ret)
>>   		goto out_closid_exit;
>>   
>> +	resctrl_kmode_files_set_visible(&rdtgroup_default, false);
>>   	kernfs_activate(rdtgroup_default.kn);
>>   
>>   	ret = rdtgroup_create_info_dir(rdtgroup_default.kn);
>> @@ -4098,6 +4129,7 @@ static int rdtgroup_mkdir_mon(struct kernfs_node *parent_kn,
>>   		goto out_unlock;
>>   	}
>>   
>> +	resctrl_kmode_files_set_visible(rdtgrp, false);
>>   	kernfs_activate(rdtgrp->kn);
>>   
>>   	/*
>> @@ -4142,6 +4174,7 @@ static int rdtgroup_mkdir_ctrl_mon(struct kernfs_node *parent_kn,
>>   	if (ret)
>>   		goto out_closid_free;
>>   
>> +	resctrl_kmode_files_set_visible(rdtgrp, false);
>>   	kernfs_activate(rdtgrp->kn);
>>   
>>   	ret = rdtgroup_init_alloc(rdtgrp);
> 
> Sprinkling these resctrl_kmode_files_set_visible() in every path that creates these files
> seem error prone. Could this be simplified with a new, for example, rftype::create_hidden that
> will instruct the file to be created hidden. This would just create the file correctly from the
> beginning and eliminate these calls that go back and "fix things up" for kernel mode use. This may
> also eliminate the need to ignore errors in resctrl_kmode_files_set_visible() making this
> more robust while making it obvious how the file visibility is actually connected to the
> kernel mode since that would be the only points where the file visibility is changed.
>
Already discussed to create the hidden files for all the groups during 
the group creation. Then call resctrl_kmode_files_set_visible() based on 
visibility requirement when group is added/removed from global kernel mode.

https://lore.kernel.org/lkml/98568620-7e61-4d43-b72c-5866a7d3bca1@intel.com/.

Thanks
Babu

