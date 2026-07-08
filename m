Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010013.outbound.protection.outlook.com [52.101.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3835959;
	Wed,  8 Jul 2026 17:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532359; cv=fail; b=GFzIJZVFXE1YnO1OF7AXBopW4Afp+zR0J7hwudIz+4ArWu6hK8KZfQslo/jMdEHwY5QAiBqyqqykR+0tZ0tP6DQbAklVT4Y/Vb2dittDmXyFOSvUHy8I9IzI2T9W8A+PrG3Om8tw/9/EGrzXarkj/WVpp9jZnA9YCG+7+RLlhPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532359; c=relaxed/simple;
	bh=6TUMTfrDJ2cciuqxEBVM2AGDeM9+V5e9H6s/s4ZAX9g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BQFaI2PvSMWP+eKQJxAppDUjpA2THJsnc4ft3HfIkInUvbe9Ymuxf9opOQT8SZyDmZccPGLPMk0Qvl5xoKwVFPTgFvZmafeGcSrQZNi/1/uYEVV3J1QhFDEpoKqBHMNWQvBfRIM0jYpQCsgiNN202FFxCLZBAJ4XV5SJFa+i6Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oQDpxuX4; arc=fail smtp.client-ip=52.101.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oQDpxuX4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQ94XMk9eXRHhrr5VJNU4aWLHj4VAaDRC5KifmeBiYr461YUd9a6VF1iXC++WitW0fql75OLQjj8tjmaHeN43aBpDrknhVNPASUMfJ3sfVGpMSzgvJ/VOnsw+2HnXXhQzdbEpF69x4NPWApJ67mEI60PTHACcqTyZvWZFqF+WpSq9+cwzcKhPFIMkK5C6Fqy3Tot3CZNSPmOa+mJSoAicMnwQEw6xDZkZrR2QIqDaXCVvOfB/5athqIUgTu9WotOEllrxlmR0MNTAXyWcgxiPK0Z36HEulzJiQBSVddqn2pvEMxy2tNiNPBtnltqdmnEfGOieO96w2S7gJfwbCqgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58UIzR398bdyQ9QLXw5sxbSQMp0laB3iDbzvyEiGme8=;
 b=pBOGGJ9oVg+WyHvetYNbrnwLUeS4SYrdAKgb6ChySX3CCHQXDdIpqXTPJ6/9Ypoac0KYPY0jJT5ZCTljjd98JrX2eI8OMReHuOnk8Ip5Vp+irVfnseauyszTfr8yqpeab42uN7rahj1D9IULQm19w63lrrVjmTXOcvmdqklYkLGUZzVeMTxAhBZHcuVTUGN3Zwf2bx7PLXp4OOqo8qaX6AerHyVL6jNXtVFMAZLQ8Sz3xMCVox68sTMuTIgYX1jJFt3bdD8g65CKCv4rLQJxTICVH9nf6vHTeIDAfHPKmJWd+14d77LMNRJ55P5m26sPh+x2e+8oj3yMybAS6sDxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58UIzR398bdyQ9QLXw5sxbSQMp0laB3iDbzvyEiGme8=;
 b=oQDpxuX4CuSvEtBy+2yKeWK97lNX21nAt1VRpS2LpEU5FWqEPHkGcpMrjJPrTCyJxpZOAgEfpId3etnG8v5WZnAT8LaasnXcOJ8KqBSaxsRMZ/Zdyn4VnN25fwzN4Ij3D8ot7UInDeUcGUktWjgUvaDVnJtn3Taq5UXuxXQbI9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH7PR12MB6419.namprd12.prod.outlook.com (2603:10b6:510:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 17:39:11 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 17:39:11 +0000
Message-ID: <ea096d12-aba6-4e14-b4b8-aea9700556c1@amd.com>
Date: Wed, 8 Jul 2026 12:39:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 02/15] x86/resctrl: Add PLZA support to
 command-line options
To: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
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
 <d16019e92bef7c284aa69da7f7a36477c1623f0e.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <d16019e92bef7c284aa69da7f7a36477c1623f0e.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:610:51::26) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH7PR12MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b20488-8041-410f-58f8-08dedd17d1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|4143699003|3023799007|11063799006|6133799003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	2yK8raUVxZuwi+M9gQbert3ho67y0oQyF2gm8fJHU5UxZZyevZDVe2nWO5AKRCvmDtfZVMg6BIbGenvhTukAJvqexjo0m7q339Orvx9cz9DIbEIf4NGVaCaJXe2qg0kIXqwJsgtt2M/YEICdEaHzB9ZfwK3qrEf3l9cTTEGma9b8t6i1QY5sTKZi9MCBK7iRTflssW2vtUHPMjZRuREZTcYtsTYI6yXRk1BKZxYifJoeOeEHjUmNtABi9+mNsmQCS9/wc/HGfgHSzmMPiThULJtA4ZhjWKTGcjdalYqF2aOIAzo2C8vHQWOnUWC2CCqiqaM6cddZpUEWmcHJ5EBgFyCMTb5yCxnex3/eIy9qv54PhEfP+LRp+RimeAsFtrvUX+E/R5EL5X2JX+1f09496pG3iopcoluIZ1eMoTKesCuFgipWxoCPKsUMfAL5o1duiXgaX/2gepBZvoBdvS2Y3h4WMIjdQzupph2X+ykXKNyP6hWpt5VB1MGIwdk2/IeQ4C0BWDrmmOTjt9L7/2xy1qhpl9waARYz0m5XcXK9kr0f63seg25qfZTzVhJRwu2D0EnNqR7iJmlDmfcAEEHFZyUolohc36NlRIqBAzdJ0QI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(4143699003)(3023799007)(11063799006)(6133799003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eS9GaU1HNk9OU1U2dkQrZkQ0a1ZCVlpsK2Rka1gyU0Y0LzlXTlphY0FrYzB1?=
 =?utf-8?B?ZXRMMVRaeUJOREVxOTlobnRSV0RmQTlWbjlIMFVTK0o5anRGQktWUWhuOGJz?=
 =?utf-8?B?eTZHVWRLVTZ2amlZWGc5dUR3RWM2K2xZd3B2SjFNUDRNeDVxU3ZzdTAvNDJ1?=
 =?utf-8?B?NWRKZjNTei90YWlmamNTazBaNCszTENmTlJJTTFua0krRTYwZmEzbzFteEJk?=
 =?utf-8?B?QWxmTHBFNWxwSS96VkdjVWp3aXNIc3pvUmYrVEtXVDZjV3FaVys4UEQyTFBx?=
 =?utf-8?B?SUNlODlqUkFLTkxxRHBVYTVvTnlFclFQUzBNS1NQVjZZQlpJSmV0cW1uN2ta?=
 =?utf-8?B?aDU4aEFsV1U5RHhGS0pxOC95blpxc2xkbjE5dHZMYVNzYlNpbHlSVmcrQlZp?=
 =?utf-8?B?YXVpbjFLQ2xzcnc0WS9YdXBZQzFIdytWK2JvN29uT0hoQmR5R3pXNlBscmZz?=
 =?utf-8?B?MFJRSTNHOExsdUFIb0Zoa2RWa2thT3VuVXVoTnNBc2pINC80N0g5SjNyVERU?=
 =?utf-8?B?YkJKTHhtTzhzcTJHVlQwMmVXZW5TaTBUclVSblByYkZURHBrSkZXRFl6bjdK?=
 =?utf-8?B?S3lEbWhCcGxZQ2FGZzR1SmhDRWdBcXFaSW9Dcmc5dnI0eTlkdHYrSEtkWDlV?=
 =?utf-8?B?aEY2NFkyZk5rOE1KTHhiSTBmVkJQK2VDNTFtd2hsNkh5TVJTUlBZblQzQnAw?=
 =?utf-8?B?VnJPZG5iWnNBRU5xeDdZZlpkczZ6UVZZakdab0xFV2gwdFYzamJZYmFrcGxq?=
 =?utf-8?B?eEl6a3VVcExSS3FGZWlrcTNoTS9PUHlLb0psdUZ5RklHRXgycGtzTlNoVThK?=
 =?utf-8?B?eEVvV1p4Q09JSGJmT3NkWklTSlROeEZUcit5SllhR3A4cTBvWUJRdFhVdGUx?=
 =?utf-8?B?UHNFYmJVenRqVDk0MFFmT04zWUljSjQ4VUc5UE1IRjRyK0VPZzdRN1FjU1Ur?=
 =?utf-8?B?cGd0Vy9ubXQvUytvU2Jrb1BDbEtieUdjNStYR21tTFFqMk9Wa3FNbkRTemdj?=
 =?utf-8?B?aGU4RGduMU1YVWR5NzRDQ3JiVGtIREhtYXJFd0VnODdZaVZ4ZHhqUVBaRExC?=
 =?utf-8?B?NWl2d2NDencza04zdWJlNTZEbVNrdnEvMWtwTjA5cjdCNkhIaG1KbXpHamZC?=
 =?utf-8?B?OTM4U1lhM1ViTmxKTnpYYjA3ekwyZ25OUW94cEx0VHBLTTk2RFZvNERnMUJB?=
 =?utf-8?B?eStLY21Rb2UzUWtiajBrQWVmbHgxQjc2ZTRpYXhodVZ4RVA3RjZqUU9tSW91?=
 =?utf-8?B?LzZubHpQM0g2N1d6TXlzVDNNVnNhUmtydEF6ZHdxM2lJUlhUclJDZEJDSkFv?=
 =?utf-8?B?L3Bwei92RWNUSi9vdFdZcTVGdzA4Uk9pRHhQNEhPR3Zxc3JibnBsYnRTeVAr?=
 =?utf-8?B?UHJPVkRWT1dpL3FXWVlBR21YNUlDWklySkt2TVI5eVZWSzR4bmdHT0FGV0E3?=
 =?utf-8?B?eElqUkN0c1dSTE9PSWZlTW9MZVRqbFZLc2tUZDVxRUxFSTRQL3pJaXdCMytx?=
 =?utf-8?B?L0oyd0RHejl3a243RWRkZUdRcnhaM250bUpVWmxuY3RldE9xT0w0eFJ1YUFo?=
 =?utf-8?B?dU5Pa1IyeGNrNjk2d1JYQzBzWlEzUHVOak5uai83N3Z4TDlKLzQwYkNGQ2dM?=
 =?utf-8?B?bUduci82MmFvUXV5WTN4Z0JEVkJ0Wm5ER1JIcURuWU9sb1VQTWgzSjFuNTB2?=
 =?utf-8?B?eG9vT01XaHlIZXo4K2tSUm80cHRWUGVCZ3crdzFhVUhRbmQ3cDVycmJNUUpx?=
 =?utf-8?B?OGc0VityeklpOEJ6aWdlS0FjdzJiVkhoMis4aWMrZHFhYzhkYnYwZjBiVGk3?=
 =?utf-8?B?WWVvZVFPR2dxVE5SUDVOVkpDS3krUGNnQWZodUVXYTlKWnQ3TjZQNUFxMzZ0?=
 =?utf-8?B?Z2d1SGJ1L280ZzlsRElYNXRvWWZtU1lyRmNFYUFPZytpYldORStkV2Y0bHhG?=
 =?utf-8?B?QVFMTXoxTTJLZkVCVE1NMkVDRXN6RjVYNjJVNnZBQ3pkNVlNNERhb2I1anJL?=
 =?utf-8?B?UXR2ajVRcFliVURESTNKWnRQZTVDRTdvelFEZGJlaFhrT0V5Um5wOXllSGYr?=
 =?utf-8?B?L2IzeTJUUU0zczdYTGhmalhOUnFQZVprYlVhQTlXUUp6MkdEcFV1R0tLM2cr?=
 =?utf-8?B?THVhTlR6cjBsUlhWN0tEcHZIajltZSs2aTZhaFg5RnVicXJkQ01zRGMySFVV?=
 =?utf-8?B?QTdycmR3QmV0S0hHVWwycmtKc3VtQ0tURk1BRDVhL05xcWNueUl1bHJaR0p3?=
 =?utf-8?B?OWR5MDA2WVRiMXNsb1RXQ3BiL2s4Y0h1ZmNzL2ZhcmRvM0FrQXFXYkpUQnJj?=
 =?utf-8?Q?xhJJDf55s0a2LEV80q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b20488-8041-410f-58f8-08dedd17d1c2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 17:39:11.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6Zeif+1gVbnfpOUCMy9gM38+/MkwDgDJMlF5IhAsKGXvOcyvvXGC67YF6tJN1tK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6419



On 7/7/26 16:50, Babu Moger wrote:
> Add a kernel command-line parameter to enable or disable the exposure of
> the PLZA (Privilege Level Zero Association) feature to resctrl.
> 
> This allows administrators to control PLZA visibility at boot time via the
> rdt= option (e.g. rdt=plza or rdt=!plza).
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Split the patch 1 from v3 into 2 patches.
>      This patch contains changes for resctrl subsystem.
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 2 +-
>   Documentation/filesystems/resctrl.rst           | 1 +
>   arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
>   3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..1de27055cb32 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6401,7 +6401,7 @@ Kernel parameters
>   	rdt=		[HW,X86,RDT]
>   			Turn on/off individual RDT features. List is:
>   			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
> -			mba, smba, bmec, abmc, sdciae, energy[:guid],
> +			mba, smba, bmec, abmc, sdciae, plza, energy[:guid],
>   			perf[:guid].
>   			E.g. to turn on cmt and turn off mba use:
>   				rdt=cmt,!mba
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index e4b66af55ffb..f3e941404967 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -28,6 +28,7 @@ SMBA (Slow Memory Bandwidth Allocation)				""
>   BMEC (Bandwidth Monitoring Event Configuration)			""
>   ABMC (Assignable Bandwidth Monitoring Counters)			""
>   SDCIAE (Smart Data Cache Injection Allocation Enforcement)	""
> +PLZA (Privilege Level Zero Association)				""
>   =============================================================== ================================
>   
>   Historically, new features were made visible by default in /proc/cpuinfo. This
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index f452e8ce4cef..27e09cded829 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -803,6 +803,7 @@ enum {
>   	RDT_FLAG_BMEC,
>   	RDT_FLAG_ABMC,
>   	RDT_FLAG_SDCIAE,
> +	RDT_FLAG_PLZA,
>   };
>   
>   #define RDT_OPT(idx, n, f)	\
> @@ -830,6 +831,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
>   	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
>   	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
>   	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
> +	RDT_OPT(RDT_FLAG_PLZA,	    "plza",	X86_FEATURE_PLZA),
>   };
>   #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
>   

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=2
===================================================================
Is X86_FEATURE_PLZA actually evaluated anywhere in the resctrl subsystem?
The commit message indicates this allows administrators to control PLZA
visibility, but it appears there are no checks for this flag (e.g., using
rdt_cpu_has(X86_FEATURE_PLZA)) in this patch or within the subsystem
initialization logic to act on the administrator's input.
Does this implementation actually configure the hardware and expose the
feature, or is there a missing patch in this series that evaluates this 
flag?
======================================================================

This flag is passed to rdt_set_options and can be enabled or disabled 
using the rdt= boot parameter.

This comment can be ignored.

Thanks
Babu
