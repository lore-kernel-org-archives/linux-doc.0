Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB930D3EE;
	Thu, 13 Aug 2026 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660085; cv=fail; b=HNUyD/LSLv4RM2bGh/RSMrDWZHSuHiDSvZfPqN65MbZ2oU20FAvguBDkrXJ6stvHlQ02z7G42I+icDhmr3/xyBJOoHckMwrUeQE1TazGf7pozqAJ+YS4f0pJ6lAt/dPz/P+58WO9Wb1ZomY34t4Uc/GH+68KeiJbtRJ6BZIzgqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660085; c=relaxed/simple;
	bh=pya985vdBAIoSWd/wrflhgCO3V3UYCQtfPP+wlzpvLw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Su4B0RA814LDSGeYJgvOzO7El3MQo1TcoE2DvJ1pkHiOPA3s46VnneE4hs1MOFmNu4vJjnrBiva3Q1eOkHYi5xWQRAzXtCC+MrNSpPumKhy6XDwlzJxoqnU/a2dEqJ9GJf1rwiBL7Z+5TWG2TBttA1vl1ChDcgjfvl3qJUytSnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cHxraQ7g; arc=fail smtp.client-ip=52.101.56.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cHxraQ7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzP08IAQsSK527LdDbS0MNf0Z9hCtzmhSib+FQ89khNNG9dBWPx5Y2PupN07QNguKhmoHtSnodAFc4KIu/55Fkt/KKiT3D5IL9QV9+TBBwfOlPXMKJ0lwXYInOl3Bh+NTTNOeYtmNuf4LZZLH8DRYtRrfgtUD2ks9CVb6IO+kBqOegMxegIKoQC2lDgOQwfwAxEabbX76wV7Z7hLauj6QYJ1fP2NEQ0PvP3Blr2FqKy4TBc+q0QWqDcAUR3nGTwDUVb8nJHALCP1veBu1gL+/wr1/vTHLKvTqlTdJCbSST8VZykg+Ueukv4vANVVibI4JuvTMrtFez6S4Qn/0CG4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foQ8U3DN+QmEhOpzuh947xIfVXNYmm+/BTIEgcRydIs=;
 b=vY7PpYUUKKPPW4H6NHdnsq2usZGUejWP2q8Mm/HGqAkQqh2qthyQOzBeSZzciagSFWg+HyFlc9+wUnHdlrzZdiIp1I2xsgpFvCjZhPqnBFifUYjhGIxazlqPNFLBbrpjwzbBNYkt8xR6NAS4jJP1egT7u0Rmj7E99Bcv8JWw5xdl4uSt4Bj+O2FSVTdUAwhIF2CQU2QLu+I9gKHs+vk8STDDxacEBYRnHm75SAAx/0hePS03jgvcnhn3GYBDfsGdl5ZylDI+Nm8oLC0U1MJqJ15BFaEpoJqUAIxSlxLzaIGLbIgalQpIC2ckwYsVQ5r6XHxq5qMLDnZKNQoBwKu+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foQ8U3DN+QmEhOpzuh947xIfVXNYmm+/BTIEgcRydIs=;
 b=cHxraQ7gZ7vwV89GO+1kvmCPImYiQkVAGgCPjzrOWwLL65AuYEJoC+KzJZWPrqV8KQAIBCRwKB4ldYfC0pKL8zArl5C1ur6/QJmrYnQbYiU28jbPlHlRhjQC9khnQIrPExvkaMj6H8bb8GOiwIbbd7incFV6TT4C0oj67DBpr9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 22:27:54 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 22:27:54 +0000
Message-ID: <209301a9-0c12-4af4-968d-fe116838fa26@amd.com>
Date: Thu, 13 Aug 2026 17:27:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 13/15] fs/resctrl: Add interface to modify
 kernel-mode via info/kernel_mode
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
 <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
 <4203f7a0-25e5-41d4-b6bb-95652540a834@intel.com>
 <9e5d9cb0-fabf-45d9-a0b1-5103559721b1@amd.com>
 <f8165d56-3048-42a8-9594-b82425eca88f@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <f8165d56-3048-42a8-9594-b82425eca88f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0016.namprd14.prod.outlook.com
 (2603:10b6:610:60::26) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH7PR12MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f33d34-7cec-4c6f-9559-08def98a1e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|921020|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LnpQoe24PUuf6KYhDMvVBHWF6+e8X7RcuI+fhBkykm9aCN7+1dl1WqDkr0Mhmwq1GgpwZteIm3F2hAraIE57TlsrjS7vVLsuKVmHP5OfQI0/JFXZ7PZvN/NxlZr/IytXNDlvUqNd6EqqaPb2u3de8mgtJyX91N3pToaVBzsAhHeRQ0OFoaBx7xdRbZ35kPX9tB+XKz1kxnZDzjfMScKdT4kGytLMv/x0LW2ZyNeIM18U02v3+kerRmp9kBqYKmIvxM3P+3x58Sboo3ege/f0Bp8m0kHDbbk7RaniOw+GWRqnhlD0T0DPV1Tgu/P72uB0jxx+CvCla9lw5MTcIZtYdoo5B5Yq4fSPsXFzH9FbL5x8coCudo2QReoM4U0a/R9ZtGuvvYDE5HBj76flyiwFm2Nm6kyWmhkEHiroAdm0RNscrumC1KqqOxsB3jWpk1sq5J4mXSArclo3hTe0kAQI4e72HFXK69BS6YLHuZZtChyapu7CPPtTmZ3E60Y1EFu7A7lczicpos2SW/vgcH9iw4jv1tU5h/wQiTh4kT8RF/Zf/5dF2Zuf2E66QHJJdTSiuKyjlQQqZOIkQ7kv3XtbcAbzOyP30jhwk4r2qUTPmJ8iKY5OrfMYI79+qkKxtSF+d/OLrGcj/vLvEzUUPqrcILDyL+EZaLDqR6rk8F+OlMSCp5b4r6NHInEFwqS5tmcyI4mo+yl5pJKcrGL8JGmW0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(921020)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d01uSElubjlaNG9mTEFEeFJXbG5uRWJMUlJSMDJid09Ba240eWhvWU1jYk1r?=
 =?utf-8?B?QXhGME1YKzBydXhrdWV1VDI3WXZOeG9ITlhIT0k4Z2NPc2hxVzJ6bmM4UXBB?=
 =?utf-8?B?RWU1cCtwZGwwSjVTbUU3bkR3TThLUHJIT0phM3dtdWh6eEVlbE1Xd1hxeWY4?=
 =?utf-8?B?N253QmZ5NHhHL2lNTGV1UFc4VTRDUVptcUl6UnVNSjNneFNtMlprcE05ekQv?=
 =?utf-8?B?Z2hGZnFJVkFITldiMmYxNEJxOE1nVVNwaDhQc2x1Vk9VcE53SXZzTVo4dHQy?=
 =?utf-8?B?TVlwUnNEcXJrbHpmcU4vTnZaZnIzR2w5TE1HRVdyalA4NGpPUVNndTJQdDJq?=
 =?utf-8?B?U0gyTXhta2FmUktQaXNHRHpxQUdGSGhXSkMzQ3VSektWNnQ2VGQ1UWpkLzM3?=
 =?utf-8?B?OVZrSE9uRUFORWpTQ3hkWkNFTFJqRU1wcHNPSTRRQVM3eTV1UFBTZ25tWkxv?=
 =?utf-8?B?c0hZdjlZNE9zNEprT05aVjlmckNlN1B0a1p6dEtiQVdlZHZ2WnVSN3pDb3hI?=
 =?utf-8?B?cHU2OXdQTHY5Mm5QRzhmeTh6OGE0dzExZ1lOenloaVQ5c0tvek95UjFiZ3Iv?=
 =?utf-8?B?M28rOGRERXJJWlNKdVRqSExwQzJ4dVlTejhEMVZ4cnUwMnlFR3d6dWxFYmU0?=
 =?utf-8?B?OWpBNnBIVUJDWVYxdXdXOHhHMkhIUUVrRkRjRjZRYThlRTYvS05qNXE0bmov?=
 =?utf-8?B?YnZEQVNvVnFrTWpPZ1pBaDlCMzFEaXZPL3FoRGFLTG0xd3hPNUNDNGVUS0Zs?=
 =?utf-8?B?clBKTjg1ZnNrMkxJa2hDR0gwN3pkTVoyamZhZUNtQUtrMUovd1YxNXUvbWdn?=
 =?utf-8?B?ZmM3WGlDajM5N3BERDVnSFZlMkNpd3dUMGUwYnh0S2xQZG5MVVpoYm5rOHFT?=
 =?utf-8?B?Z3orSU42RWx2RXRaNUNTNjRxRUxFbjZPZ0piN3oxQmFwQlhGMVNsbWdLSkVC?=
 =?utf-8?B?akpEN0R3RnJMZlhNQ2ZBWitoTUJRY09nOThMRFptdVlaRU1NZ0NwQ1FIZHhp?=
 =?utf-8?B?SzFMOGxQak5CS2hCK3dwc1hDbTRrWmNBSlFZTUlxa3BEbDBJTG5kR0g5UmFX?=
 =?utf-8?B?NVYzS0FlV3J6MVJaYmVkRjdiU3M5WVNNbjNUdlR2Ykk1QzVRMUh1WmQycVlp?=
 =?utf-8?B?NXFrYVp5TVd0VS8vRFE1Um5LYUZqaTFOSGc5Q2JrTjhtQkVoNkxiOXNreEVm?=
 =?utf-8?B?ZktTYitKdE9IM1RiSXFwTEhNdWdWY1duTGkydE9LNTYxQXM0aVlMek9RUUlP?=
 =?utf-8?B?R2xyVUlLZUFxRm45RGR6cmdGRTF3VHFaWUVlWFlzK3Bia0tQNVZzL3NUN2NS?=
 =?utf-8?B?eVQ5U3h0UDdMMDlWOUdIc0EyVS9YSkQxdjQwdGpyem9rZHp3TGNNM3ZLbDNY?=
 =?utf-8?B?b0U5T2hzcE5YaFVqVWtFeHhzaWpWWHkrZzAwWHVDc3BkT08vWnRwN2FxYkNi?=
 =?utf-8?B?aElSTG52b3hXVVRTRWNUVlc1M2NMdWFJT3hzZVMyaUZ6N0V3TWJaVWZENFZn?=
 =?utf-8?B?clZGT25vV0FrUE13azJOUUMrWGVZZnVIRVJ1OXcvTUNpWTFvVTl3NVZBaXdl?=
 =?utf-8?B?WnJBTU5yS3FLaTdNcVJjalZtQndDMW1jUXRzU0Nzd3JwWDBnRmoyMnVxNC9p?=
 =?utf-8?B?anZZQ2JycVZVSW0zMTVYSGFYQXB0QitLZjR6cDZ0R3RRb3NTY1orQzVPYmRj?=
 =?utf-8?B?UE51NDRwT0cvUHFTMHNwTUpuUzdGMU9nMVlOSUlCRkFub0NGSGxQTEEwdk5I?=
 =?utf-8?B?THRWU1VVRjlBQy9Hd3hKeVg3eUt1QVhXYlB3Zkx1VGZYRm1XcXFpVC96S01K?=
 =?utf-8?B?NlRzVFlRV00rOVJPcTFYZy84WE5SN1djSHVXK3hUV25tTDhnSUNHbTB6MzZC?=
 =?utf-8?B?MU1YWnM0dDlUUFp1MzAwM2d1NS9lRWlLNzFOZ0xLejQrUXNiUFQrNW03b0kx?=
 =?utf-8?B?VjlSTWZzRFRkdWFCQ0JYcGl1SXA0dnZ1WEgvcmpScFFucVRubFJoQlBMTHUz?=
 =?utf-8?B?WTVYbkgvMlQzSHVmazhCK2VvZWFWRVZHNkg1QUtYbFQzenVBSmVwWUJFT3Fu?=
 =?utf-8?B?Z3FrVXRtTkdURkFraUREUUp6bUo1bFM0cjM2cXhnbjhjYmZCcnNGYUUydkpD?=
 =?utf-8?B?cm1FVGtXUThsMWdEKzBTY25seHFYU2ZHT3lRUHJoWVJQRm5TYUEvYzBoNThL?=
 =?utf-8?B?TGdZVE1DbEthN2ROTzdlbGhxeURBUG4rSHBIbjV3R0lEQ2xiK3k0Q1RxMmNH?=
 =?utf-8?B?a1lGelluOTJxVnVtOTZ4Y3N3RHEvR1lZNXNBbzA5KzNaRkl2VkhCZXNBNStW?=
 =?utf-8?Q?w6eKk2Ci5GWBwmFw3X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f33d34-7cec-4c6f-9559-08def98a1e2e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:27:54.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDCbFU7A9RUI5Qoqw2P6EbAX1ggJxnOb1dmHyNVPvVctu488EkKGX/mMZckfQjU+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668

Hi Reinette,

On 8/13/2026 4:21 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/13/26 1:55 PM, Babu Moger wrote:
>> On 8/10/26 22:40, Reinette Chatre wrote:
>>> On 7/7/26 2:50 PM, Babu Moger wrote:
> 
> 
>>>> + *
>>>> + * Return: @nbytes on success, negative errno with last_cmd_status set on error.
>>>> + */
>>>> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
>>>> +                     char *buf, size_t nbytes, loff_t off)
>>>> +{
>>>> +    enum resctrl_kernel_mode mode;
>>>> +    char *mode_str, *group_str, *slash;
>>>> +    const char *ctrl_name, *mon_name;
>>>
> 
> ...
> 
>>>> +
>>>> +    for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
>>>> +        if (!strcmp(mode_str, resctrl_mode_str[mode]))
>>>> +            break;
>>>> +
>>>> +    if (mode == RESCTRL_NUM_KERNEL_MODES) {
>>>> +        rdt_last_cmd_puts("Unknown kernel mode\n");
>>>> +        ret = -EINVAL;
>>>> +        goto out_unlock;
>>>> +    }
>>>> +
>>>> +    if (!(test_bit(mode, &resctrl_kcfg.kmode))) {
>>>> +        rdt_last_cmd_puts("Kernel mode not available\n");
>>>> +        ret = -EINVAL;
>>>> +        goto out_unlock;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * INHERIT mode binds no rdtgroup. Ignore any user-supplied :group=
>>>> +     * suffix and let show print the mode without a group.
>>>
>>> copy&paste?
>>
>> Hmm.. Text seems correct here to me. Did I miss something?
> 
> This is the function that parses user input so the comment describing what should
> be displayed to user space seems out of place.
> 

Got it. Thanks
Babu

