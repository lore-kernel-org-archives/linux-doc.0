Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF338F926;
	Wed, 17 Jun 2026 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781726176; cv=fail; b=JUh+NBW/ZhJ9Cu34skfjAVqB2ktMz6qrX4KgToAnpGFUALWGE7bVa4UJ0hJniHY/HeWLmgCxfIlD//HprdB3xPGL2evac8K360L7+pE2cXCTdA5ZYW9aIZJBWbgeAzPiMe+4HyyWhnLLKwVYC0x++ppiqQgAGVCLrhRf9ZEvrZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781726176; c=relaxed/simple;
	bh=Ym/NqtbuiKbdlwWa39e/jlH5S5AiMZOThzOLPMYeroU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=quh7Aczr8xaBUDyfFkMMG2RJplq2vOGhbiZrPjFIwnHBiWTF6Xerv2hzQuVROYbTGl54VvlRkv3mxTcJE16kIAVw4BRFXKi3qMFVCPX4lUUutcMnIiLGbLFr47KIkayBKZ8kQ4psXkqnwPLECw+KhlgHF+zuyTbWlm2Nwbyjcj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WBsEDVXV; arc=fail smtp.client-ip=52.101.43.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WBsEDVXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWXsNdEEl+6J+P9mRmRNnuQQDd6qXekKzAncwlJpu8U+WsofvlGCo7cFTX2rYnQAxypXnzRHt0cXEBmYAszmlXphkjFma650QnCsQmGpH+7cVFTAg3j4INJJVfETNR4IcZkLcHVQwM2nMmdn83jxef1PUgHql1VqweN7dOLUDvHzHwu2KY6+DS+hkZF5LQ/NvGHJjPEukwdseNoFR4OJd5mkKjvyAWkX0L3K1i0HXsW3yziO/5uGaH31vHnsWwxpMcOHfRY13uNpA2c/blAI2myWhy25LhMl8f4CtVgrUSz6vAzBQ0pF/nnZZodOU/xDjw03ewzx5L9BPr43QmgYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkB4UBL2Ka0qiKfW/BMkY2JaXnxm+qoluv5D020/TiI=;
 b=zAL2zUqOtrRx8YhDpt5JK5wAW+yKTVfOvnfTm1VtRyj2SzIh95t4tusnkRjrMEbhcuzKFfZNwKjDmsoiEzfoeuW/GlBgvlAqS/Dd44RglUwo8C71aAc/zsnCFyxy3QPxrjksHZq+C8FMOuylRS3nS2tSifOQzrc4MVTtO1CprkNxy4xuqkw/jP7KU7U/XCrheXylOrjlKJzUiRvObQf3dTC5NAf+Dg+ijNtR/uUpNYK01xvTDEwQNW8/zPWnuYPG8ICzThfA+UMnFFxII+Ds4A7egQSFXGU+jBOr+5NfriQzxBYzzZYf0vqc9i5YAL2fnAt48dkuPam9CapvNV9Cxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkB4UBL2Ka0qiKfW/BMkY2JaXnxm+qoluv5D020/TiI=;
 b=WBsEDVXV1++r8d4Jvovv3M/7g7HiKXXUDZpsGOLOUGjWeBgXzYSD0VWFt1I0V7RFbkSru671yiFO8qxDPFGxMe7FE7nYJAeAwPgqZs03K0fg+7wMOmu9UWexp2bwKM/7d66tQ0b8F/SG7dR6/t2I640p0V5jEh327U4dnWPJCOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:56:08 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 19:56:03 +0000
Message-ID: <90602d7a-c89b-4bb9-bf03-0149884c782d@amd.com>
Date: Wed, 17 Jun 2026 14:55:59 -0500
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
 <572cb801-c52c-4e36-8365-a309e2db6106@amd.com>
 <413ac3d1-0377-4762-a88f-3d7bfc3a9dff@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <413ac3d1-0377-4762-a88f-3d7bfc3a9dff@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::31) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c81e6c4-5211-4e3e-267d-08deccaa7643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	y3E/nE7deg8m/fDRTwCW4S3SWbjwXYp8hHEjmYCgd2Ils+akPgj0+/sEAFkyfY+l45o66MyQMGBu4erBafp/D6ahYLzeShmHj+4ze9NDr6AaSnpFGnpt95WI+n9kKRKkWK5NJGrozgbzWMqLtS9QO17K02gKiC87XyM5a1H4fD5r+IBapJl8QmB+y0oG8Fc7cgl9X6hrYdPvtKtJuUH+50ThobVBVHFM0eIB3/Abc4qnGBMxOqnl96VCyjvrOHmPef9s4ZvoRw7WJWyaKmoI3ItrlpK5gWnbnyYm+qKjAoe1bX39bfhdHgAgf0KiXD9FBPRmq/IKf+wOoKMYKo8AFjFJCOhsqM2gCdn6oiM9b9969/eOnJ8hvpSBb1pFa3XRn+oFOREkkhsuFpESEqsAk0SOjdFMGgO22EIjRpgFOzllyit0Q1qmaGFOfxsX6P8wKPMy+LFxK2bBu9CAJLun43+FxhGfeAOETZ48KSEINMGL7m3XltZIwBeMxPgow4dA7SUy5ybZaP/1RUZiCZ3fOpLpIx3Wi3UMDihyocZmkRpJpP+a3K6xBsRnevspkSVWN0DFq+wlr7kBoN6OeMB+BrhhJx9vePQGBla6EA7L42kDz0uKa+IQIAbF/Y0FUaMmkl26Vv9eTFqHInjAQZQJVTL9ColOCaOG2ULqlk0npiAf67mTWkSX8rPBB1rNBQkBLEKb3o08HliU8jNyyfegu82ZQkimhIWv26YquFhiylk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDNER2lCa3pDTlhXcXFaQzh3aElnc0hXSzJRcXh4M0VldXBETlNvOWMwMXJv?=
 =?utf-8?B?b2xUUW41WStPaTUxaTlPVmVWWEVMYjFBTGdrVVM1SDU1ZFhuM3ptdkdzSmFV?=
 =?utf-8?B?RSs1bExVbGJrL09sVkprWTJ3ekNpY0JuSy9WeVVtRkN0UlNabDJNR09ueHJn?=
 =?utf-8?B?Y2xJZXYzdktUSWN1R09OVlZ1NTR3RzBQTC9CTjZyVlZtMlhFazRQaE1lM25J?=
 =?utf-8?B?UnhONkFYTjU2Z2xDY3l3dFNkS3FoOUtldzFSTUFRakRUc0k5aHlIRC9SV25p?=
 =?utf-8?B?MEVFenNGU1pqK2lENnJYbDV1N3Vldy92RlZuSHBUUVlQRWVLRE5PNkIzazFH?=
 =?utf-8?B?cVZiaXZkdHFvZUN4L05ERDUxZ205dWJrczhxTTN3b0NmYUJ5RnB2MnpxQ2E1?=
 =?utf-8?B?Y1duVWFwU1Rpb1pCVktjRERINXNyRXVkTlNDd0QvN3hXWjA0OVVjY1pzWEtZ?=
 =?utf-8?B?WVpUTnNFbWdjTmhRZlRDOG5DcHJualRnZEV1ZWpvVGdSZ3M5NHE1T1B0K1dT?=
 =?utf-8?B?TU5iN0VRdTZjV3B4aHhaQjRXTGdKWklVYzltaGEraGlZYVo0OVM0T1NqT21m?=
 =?utf-8?B?aGdzZk9sc0pXM2tsYVp2T0YxckdFOVFvT3h0TktkNmZSMk1rcXJqZEV4RGNF?=
 =?utf-8?B?S1R3WVViNjJJYUs4anhUN1JERVc3S1BtQjRFRGMwVldHNVNLWGY3Wmt6WDlk?=
 =?utf-8?B?eC9tLzJQd1RWUENpY1N0aGVIT2N0SjZUUUtEY0Nodjg3ZEhGZGpFYnZkZGwy?=
 =?utf-8?B?TVF4cjhKTElPeVh6ZHBKWGtqRGNXbjg2Q2pMZC9ONFJaa1U2bkc1QnF5VVRv?=
 =?utf-8?B?U3R3UEQzMmZib0M4M1Z3Y2l1aDZUNlFQU2VBY3JoN0lrVGtkdTFneTN2UjJN?=
 =?utf-8?B?S3VMRHUwSEptdVJvb2hFK3VMNGREUjg2cloyU0l0Rk93aUQ2cENRbFpmNHRm?=
 =?utf-8?B?OHd5UFIrcEgxL0dtVXFBMWhNVDBId0VUVXVhNEs2WjZ1TGpEMHE0dkgxeE93?=
 =?utf-8?B?MmpFTi9tY0Y4aWJZc0hQUDJGalZMaGR6UmtDSFlDMWpVWVdqdm1icXFZZ0tz?=
 =?utf-8?B?eXpJUW54L0JPKzJRRW5zb0hkdW5uOTJsVHdrVCsvcVRwQlZlV21FUTA3TEc0?=
 =?utf-8?B?R0o0b1B6ZVovdEpaaXlwUi9MdHVLNkJtYVJZdmVGOExaY1dudGlyalo1R2x6?=
 =?utf-8?B?bXIwTk12V3orOEVyYnYreHVkTjRoZTRoeWJ5S0Y1ZVdJT3RzR0dzZm1ZNGIx?=
 =?utf-8?B?ZURJaFVXcnVrcW81MzZTZHZnZjRDejAwOXl5Yitsc3hGOHRzQVd2QWpXSXg5?=
 =?utf-8?B?Z3pyc1N4bzg0aWJZQU9DamFSZTh3ZmZhMndEVzZJRjE4NEVDLzA4SE4vbzBU?=
 =?utf-8?B?ZktpekZaVjc1eHhZVWNzcEUzcUZDRHZwVnlkYmZXNlhNaXZ1dEFFYklrTXgz?=
 =?utf-8?B?bndKQWdrWkM2VmJnQTZ0SXlPc1RuaDRmaUtMK2piT2dZVlRrTTNZaHd2RHoz?=
 =?utf-8?B?MEFraldIVEtSZDB3RjhnUVdFRmdYbHBQaGcxbFIzdys2dmRnRnRtcXFhTGE5?=
 =?utf-8?B?NTVFeStzWUkyRGV2NnF3RWs2STlkQkVhR1psdkltTFBiY0FqdllzRVRtbjhk?=
 =?utf-8?B?cFVXQmhmM0JVUXphMzcvRVpsd1R0eUQ4dCt2U2ZSSHVRRjlnMGowTFFOeS9j?=
 =?utf-8?B?cVE3bWQyL1hjNmRjcWYzdG9DT2d0ZFRmMlplWGFMK2d2Z2FqbkN4bG1QcnhE?=
 =?utf-8?B?VTNWYjZMaUNLd0tuMGJqVVlGWlNIQW8wMkpka0dPVWMyOVBEVS9NUVRKVjIr?=
 =?utf-8?B?RmtiaFlsc2dJbjYrZTZCZVExdCtxY3FkdVRoZDBGdTRuWW9VMC9nbmh6bWNJ?=
 =?utf-8?B?RVBTbk9iNnY2T2xLRmFIV0UyQjhOTElCd29BY3JLNjBLc0pSK3ZMRW1ydnlH?=
 =?utf-8?B?aXVCUFU0R1Z1QnFLU0JWOFJzTnprcmw5TmxJMG9yVm9ZSlFTY1hxRndvTC95?=
 =?utf-8?B?NVdhNHVXYjUvcnh2R016eDVPOTRBOEx0NU9ZWkRRVmVMKzNUeVptdFRWR0dS?=
 =?utf-8?B?cXdaL1VxalhNOThId01HRHZBNitYR3FnWUVvMFBIeFo2ZXZkbjlyNVMzNlh2?=
 =?utf-8?B?ZDVSSWlEYkNycUxLbVhaSEVzbk51R2FkbUdhSHJGQVJvakpLV3ZEbGljTUZS?=
 =?utf-8?B?NXZhYk01ZXR6MkpDL01wUnVTVFVtR0c5ZmtYSXp3YWFHQTcrUmtSY1BjRnB0?=
 =?utf-8?B?aUVFRTdTM3FoVE96V3ZxYTVZdDZ4YnhYMXFGOC9KMHh4Q0RrQ0JJSFNrNmJ0?=
 =?utf-8?Q?d7+/COopgZkUEKLrFN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c81e6c4-5211-4e3e-267d-08deccaa7643
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:56:03.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCN7lusiVYnOucbM8BXYB8Qntg2L6UCfLMuITPqfpygpXsqezOpsHXJ4EKWv26Jk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132

Hi Reinette,

On 6/17/26 12:33, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/17/26 8:56 AM, Babu Moger wrote:
>>
>> The display will look like this when the system boots up.
>>
>> # cat info/kernel_mode
>>    inherit_ctrl_and_mon:
>>    global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
>>    global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
>>
>> There will not be any group associated with "inherit_ctrl_and_mon".
>> It is only used to switch from other two modes.
> 
> Just two nitpicks (adding the "[]" to indicate effective mode and fixing the
> copy&paste duplicate mode names) to confirm that I think you actually intended to
> write:

Yes. Thanks for the correction.

> 
> # cat info/kernel_mode
>    [inherit_ctrl_and_mon:]
>    global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
>    global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
> 
> I would like to propose that the user documentation contains something like
> "the kernel mode is followed by a semi-colon separated list of properties"
> This implementation does not require more than one property associated with a mode
> so this does not need any code changes but adding that flexibility to the user
> interface should help if some future kernel mode needs more than one property.
> What do you think?

Sounds good.

Thanks
Babu
