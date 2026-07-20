Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E686C3B38B8;
	Mon, 20 Jul 2026 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578361; cv=fail; b=KoIH2w4LlvWPGjo8Fer6sQjbM0Fm8J9/nhM3GYTRUlUiL4X3Vr0IK70XHJ1b//BsY3M2BsjtgLDlotWiuaGgd7jY4dL9LL5Uth08XZSjjliS+Ijx09h6yiRQXbi4Rj8v9MYgjKxRSfXQ6floGIEoW+vdrb3xI+ypHr8/iTzqAoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578361; c=relaxed/simple;
	bh=SlmJA6ddr+R74hSWzdkt78tk5DV3VsMK60zdD2DQNP0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PxD4hXoa2rRHVC1QzvDTdE1gVuN18TTQDK4xUBA7bUeh0/pPpWaZWoY92Y2RTsxWRjsIx5/bTGaGOgQbTHkjF3F5YScc4A468SPEmS8CSEfV3M9kE5OH+2CnQctcHO20eWQfxNllSrzfg7T+WD1I8bqeNnn2morh70NHmhCy1q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gKxQ9zq9; arc=fail smtp.client-ip=52.101.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gKxQ9zq9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCXuCezcMAVg8tkbdKccV9r5aisZYef6RWAheUOW7ej0fTHeUnKdvRr9tMUIi5/K11j5Uk/hO5FYmEomGLGuq1cs/tflAJ/BtRYnbmYfgcq19tUxFQNm2JWXzZAIflWhU6OzODOwhwCxceldH+NUE6FwTu3P54koFBmuIBU2Kj5C9azNdq7/w4mjfdhN/GSggC80iGXsx+M4WeSYz75ud86iibARoxO2hLIWhqPV++qGysxmrUrxNwz+gSggveHeLavwWQ84yVvgmBQO5TWd/Il5Vlrzoc2SJCof0fsuxlwzLE/VMW5Je8sRJu+s8QRMB31/+AZH8CcsbQ+RXJHbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66RlJaj/qyXhurYhBWPfp8SMAckuoY0hXysRyh/Zosc=;
 b=shIVHNIR7Ggp1alY9M4T6z2I5791gy4x5zAw0xZbuNz10ynVmk7SH4wzNozwz/ZAKdxGdR1WupgqjhCApmrJ0Udy/tCH4P4by9JQKW57CMx7QfiWF1fuexUZB7Q+b5O0G9z6B80u6/ALanCKJYJtnJ+qPzaNF1jV8yRKD6XQQr8bgS3x5lOzT1iqTrnqOyJy5PKaVg5LkV+QKuzlbB+HiE4R45hxTmBg5uUKpakCiPhktDD4o1Gi7+GqYPPjlHDoNetl31rJZVsBxaYuQfVlfOHK+AqfliCN0PTthLqJx2yzwR3BVPsE1HRCwfW1KY7xrzevD+/7XXrjQXqXP/U65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66RlJaj/qyXhurYhBWPfp8SMAckuoY0hXysRyh/Zosc=;
 b=gKxQ9zq9lDlbxKNWfMs+4QdjDWVBKxuy5hgEqhoF19Gb+iFsq2VSs7GCADhopP+9E6aQHrmxEnnHPQcg6jy2ERlmkzcAfdK3FgzmcaFsuoDAKuFF7MiOPbUtySVcik0mac2YTB4MM+Lv8LbxsB/1LiqSnXnpQiJ1C6PYTyjsbHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 20:12:33 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 20:12:32 +0000
Message-ID: <ca1bfd7d-9820-4acc-8ba0-bfdedd6e03ea@amd.com>
Date: Mon, 20 Jul 2026 15:12:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: tony.luck@intel.com, reinette.chatre@intel.com, bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0084.namprd04.prod.outlook.com
 (2603:10b6:806:121::29) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bcfeb6-f00d-4756-b093-08dee69b3ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	k0S9V5kkSDLmtDzKGe0lNDErYWIognQX38iAuvIOittz4lSxKY14bq1qxBeO4gryGsv/tHbrKAUGSfBlhVOK5wNLDD36AVgpQwBb7Gyj9OTspkSa7HyJ6KHHeJ/girV+Cv4QqKFHOK0nLzvcjtRwaVvl/+u9Q2TQJNNSdogJCmw8VKzEoMMqng4xZWirT6uBbXR9TPh9a8mvtm40b+uwXN0hUI2nCKmAS2WB/mTOT/fTvQyDwb9bDaUitt1/Rldf/DNz2k33u4vBBghZUME8ngBYBddEe8opQlVAl6PFEePqA5+KIungHkP2tr1W51BGEk8Uf8FZhY1XM8/Iez8yPDou0K8rA2TFNAITn1mYAMBfSaFez7V8/PVDHPLssLpLcJL4quZoYjTJSp1Ba+0T2Sa+m+50a+urIAn3vQZ0BBrvGusv/bNlPOkl4dHtgPZCBvsogcv2IOjoLtwZk8HnlDQfliUOys8T2+eJ5dA8/U5hWmOO0vk8s3x20A6tHK6vV9RYixmCNjh/nHbyOFe4TRmuDoJH2IfpirX2Q1r8ZUDHEp9CGPwjKdB+Na9hWFTp9hnhtRJ8xvtZA27RuyYXYwlgN8xZ7t/Ck8b/Kcmy9hQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U01uV1RYS1c5elJrWSt1YUt3bnNWMGZTSUtXNkd2aFhCMDdybm5rTGFNUE5O?=
 =?utf-8?B?YUxtT0pRZS9wWEg1ZmM5SWVDSHlpdW1ENHVvUnVkUWI2NHhtZTFlMzZOK3k4?=
 =?utf-8?B?eEtBa2lGRHBNZFVibEQ4L1RaaVhTMnhmeVBUdFoycGlsL0FZc0YzdjJBRlRl?=
 =?utf-8?B?MkNkWXRxLzVJK3BqYmxUemVheFU0Y3ZhMFZQSExseUR1MFlQN3l3YnlqS3Z4?=
 =?utf-8?B?S0tYWnVDZ2JieUE5R0dIUnlCYUNwTTA1VjNSZmt4bURLbUpmczM2Qi9YLzdx?=
 =?utf-8?B?SVZ6a3d2TmpmK1Q0aW9FZnQ2RUFmREFPbmpUTzcvR1d0N2FsTWxaUEFoQ1Zs?=
 =?utf-8?B?NVB3K05id293UG1FVFZpOFIySEtuMDlVdFRsOUM4NGFWNFZnamVuUnFRbWdZ?=
 =?utf-8?B?NWZaL1hWSjRNYWdRTCtweU14bVdZNkY0bEpyR3NTOURrM0djVE9uWDlDalJL?=
 =?utf-8?B?QVFiQU5xQytqQ3Z5ZU1Gc2J3cWs3YkIyVDZJU2dvN0xwcEozV0llZVFVN2xl?=
 =?utf-8?B?b29DdlBnMWNMMmhpbzhLalJtaExNd1N1VzgrNkhIdXlxRUVsSmFVaDZVbkNF?=
 =?utf-8?B?VXp2YlBpeUpDdThGQTJjUll0K2l6VXRITHcxdEwrd2lyVU9VRXB6MFd2QVB6?=
 =?utf-8?B?MUFpbllVZnIyaDBtdTN2MXl3VGxYMFM1SytmWUprR3FvYkM1ZEJCRnN3WFFF?=
 =?utf-8?B?VmtHYUl4UFpicUdRSE1kZ2V3QndJRDJwUDJmU3crd04xKzk1eTNSQlFkdldi?=
 =?utf-8?B?WFZKS3R4ck04R3FIOTBmTHh0bVJLUGp2M2JvVWw3YnhGOGNwTjh5T29qdHhO?=
 =?utf-8?B?UGtBcUI1bUMyN1hla1B3Y0wwdVAzQ0c5RDdoK1I2OFJQWVJkcUE1aFRoQzdE?=
 =?utf-8?B?WDBad2VYc01yVFY0aGFrNXhmdmZZV1VjUXQzbXpLZGFZY0xVNFZoTW5uTGVB?=
 =?utf-8?B?K3VDaytRWFFSL1V4YkZONmlCQVNOWGc1dFIrUzNBVnUrclhPUktaL3RINktr?=
 =?utf-8?B?cjBQVm9QbUlyYTYxWUlmNnNTRE9ka2hEaHhrZmpLUGYrTzRYT2kyMUNqWWZh?=
 =?utf-8?B?bjdmOE5OS2tzYkVYcTlOMWxtOUc5emVvc1hYM0FVdFVZdm5sZGtwYW5tS1Fr?=
 =?utf-8?B?TFNYVmVldFE1SUp2MkZtaUZaWVBReW42dTcxYSt6MWc0MGlkZ1dhbjY3WDBH?=
 =?utf-8?B?U1hkYytwZ1hDRWVFMEttL3ZJbUhRaksrMHFmaU5FbnpkTlplVmtlaWk1TEZ3?=
 =?utf-8?B?UUZOZGNLN3BsWUdkbVkrbEhYUWNrNTdzakxJK1RNZVhhbm96TjdJL0E3MjJJ?=
 =?utf-8?B?eGw1b2tqdlZicXl2Ky9SM1daOU1ES2UrbHdsUlU0eFNpaEZzQXlVcFNubENK?=
 =?utf-8?B?QXUwT0M4ZTlZOVJwMFEydlZ5TlJheGdQZlVGS24wZTFBN28rS3F1SkMxbm5l?=
 =?utf-8?B?UDRsV0cvUzltaE9oR2VpR3VhSjV5SmdyemxaQVdVUXp3WkZWbEdEZEg3enNW?=
 =?utf-8?B?b0NBaW9Fd2p5anNrdGx2Wkg0eVhNclhnUXo2V2NTUEtRanNGSzJMZ2xMa0pI?=
 =?utf-8?B?UU4rZWhnb0JqcXIydmxtVmNsR0NDWXlSV080WStHMkltVlB2MVJwakt4eS9S?=
 =?utf-8?B?Zmw2UmgvemhIL3hkem9teE16a1VQTCt2VlhQMjl6SEpVU1hMekIyL2JPZWYz?=
 =?utf-8?B?VXcrY1ZrbUJ2dU1rMWI5dHh1UnRmUGpWclY5TGhNb0RyRDJzaXZ4NzNXcWpY?=
 =?utf-8?B?N2drSVVMZW9qUDRsVkVkRDJYTjVKSjcyUmwzSVJ3clBrMXYzM3k2M2JERWNm?=
 =?utf-8?B?ZjZ6MmxxVDQyUkM5WjFHaEdiWDB6M2k5M3BNUVNkd1VhWXhHbWxSUjl6ZHVE?=
 =?utf-8?B?WkdlU3JicncrT1loZmt5d0RyNUEzMEsvRVVyaHBUUndJbU9XUlZWT0xPcGY2?=
 =?utf-8?B?WlZuSkVGOEpDM0MzekQ2ellDbUdFN3lBcGFBeDJkM3ZCNlNSL2hpamtHY0dh?=
 =?utf-8?B?N1YxL2FNRHZpMjZrWG02K2wrbzV0SXdaRE1pdlp3OHMyZ2tNdVhOTldYK0Uv?=
 =?utf-8?B?cXloNGZSeUlYdVY1QlMzVVNLbHdjdlhELzd2RUczN0F5NXhOeDdDcWhRUFc2?=
 =?utf-8?B?RU8xYmxMUkxydXhQWVJtcmtzei9PUmppMEQ0VFdBQmh6LzNUbmVGVVhneHFJ?=
 =?utf-8?B?WXlveVc1NisrWkIvYndkT3BJeHluaHA3UWFPdmE3djN3ZjJRcitrMG5MdEll?=
 =?utf-8?B?NG9TMHhuN3JrM3RjcmVPQlEzMm5GclBRUkg5L3k1OE82V1pkcngvMExsb2hL?=
 =?utf-8?Q?7eugqkSnM8RieDgK3p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bcfeb6-f00d-4756-b093-08dee69b3ba4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 20:12:32.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nACp1iW0ktVzLrMcZLgLv+F12RYNcae4Xg4OX5oXHw73MOFXB2wwLk+MiE/3x+Dp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448



On 7/17/26 16:13, Babu Moger wrote:
> The kernel currently enables the ABMC-based "mbm_event" mode by default on
> hardware that supports it. However, this can cause bandwidth monitoring
> failures with existing userspace tools such as pqos.
> 
> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
> groups by default. On systems with 32 or fewer ABMC counters, this default
> configuration can consume all available counters, since each group requires
> one counter for local MBM and another for total MBM. If additional
> monitoring groups are created, counter resources are exhausted and pqos
> tool reports memory bandwidth counters as zero for those groups.
> 
> Avoid this compatibility issue by leaving mbm_assign_mode in the "default"
> mode during initialization. Users who want to use ABMC can continue to
> enable it explicitly:
> 
>   echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> Update the resctrl documentation to reflect the new boot-time default and
> adjust the mbm_assign_mode examples accordingly.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> There are plans to enable "mbm_event" by default once additional counters
> are available. For now, keep the default mode to maintain compatibility
> with existing tools.
> ---
>   Documentation/filesystems/resctrl.rst | 71 ++++++++++++++++-----------
>   arch/x86/kernel/cpu/resctrl/monitor.c |  1 -
>   2 files changed, 42 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index e4b66af55ffb..e38bfd15fc3d 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -355,8 +355,8 @@ with the following files:
>   	::
>   
>   	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> -	  [mbm_event]
> -	  default
> +	  [default]
> +	  mbm_event
>   
>   	"mbm_event":
>   
> @@ -375,19 +375,23 @@ with the following files:
>   	to the events. Otherwise, the MBM event counters will return 'Unassigned' when read.
>   
>   	The mode is beneficial for AMD platforms that support more CTRL_MON
> -	and MON groups than available hardware counters. By default, this
> -	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
> -	Monitoring Counters) capability, ensuring counters remain assigned even
> -	when the corresponding RMID is not actively used by any processor.
> +	and MON groups than available hardware counters. On platforms with the
> +	ABMC (Assignable Bandwidth Monitoring Counters) capability, mbm_event
> +	mode ensures counters remain assigned even when the corresponding RMID
> +	is not actively used by any processor.
>   
>   	"default":
>   
>   	In default mode, resctrl assumes there is a hardware counter for each
> -	event within every CTRL_MON and MON group. On AMD platforms, it is
> -	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
> -	events between reads resulting from hardware re-allocating counters. This can
> -	result in misleading values or display "Unavailable" if no counter is assigned
> -	to the event.
> +	event within every CTRL_MON and MON group. This mode is enabled by default.
> +
> +	On AMD platforms with more CTRL_MON and MON groups than the available
> +	hardware counters, hardware may re-allocate counters between reads
> +	while in default mode. This can result in misleading memory bandwidth values
> +	or display "Unavailable" if no counter is allocated to the event. In such
> +	cases, it is recommended to use the mbm_event mode, if supported, to prevent
> +	reset of MBM events between reads resulting from hardware re-allocating
> +	counters.
>   
>   	* To enable "mbm_event" counter assignment mode:
>   	  ::
> @@ -471,8 +475,8 @@ with the following files:
>   
>   	Determines if a counter will automatically be assigned to an RMID, MBM event
>   	pair when its associated monitor group is created via mkdir. Enabled by default
> -	on boot, also when switched from "default" mode to "mbm_event" counter assignment
> -	mode. Users can disable this capability by writing to the interface.
> +	when switched to "mbm_event" counter assignment mode. Users can disable this
> +	capability by writing to the interface.
>   
>   	"0":
>   		Auto assignment is disabled.
> @@ -1788,32 +1792,41 @@ a. Check if MBM counter assignment mode is supported.
>   
>     # mount -t resctrl resctrl /sys/fs/resctrl/
>   
> +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +  [default]
> +  mbm_event
> +
> +The "mbm_event" and "default" modes are supported. The "default" mode
> +is enabled by default.
> +
> +b. Enable "mbm_event" counter assignment mode.
> +::
> +
> +  # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>     # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>     [mbm_event]
>     default
>   
> -The "mbm_event" mode is detected and enabled.
> -
> -b. Check how many assignable counters are supported.
> +c. Check how many assignable counters are supported.
>   ::
>   
>     # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>     0=32;1=32
>   
> -c. Check how many assignable counters are available for assignment in each domain.
> +d. Check how many assignable counters are available for assignment in each domain.
>   ::
>   
>     # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>     0=30;1=30
>   
> -d. To list the default group's assign states.
> +e. To list the default group's assign states.
>   ::
>   
>     # cat /sys/fs/resctrl/mbm_L3_assignments
>     mbm_total_bytes:0=e;1=e
>     mbm_local_bytes:0=e;1=e

Shasiko reported.

https://sashiko.dev/#/patchset/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger%40amd.com


--- Patch [1]: [PATCH 1/2] x86/resctrl, Documentation: Keep 
mbm_assign_mode "default" on boot ---
commit 41dfae2edbe7538cef040aa9e0f1f0f5a5873564
Author: Babu Moger <babu.moger@amd.com>

x86/resctrl, Documentation: Keep mbm_assign_mode "default" on boot

This commit changes the default MBM assignment mode to "default" on boot to
maintain compatibility with existing userspace tools like pqos. Users 
who want
ABMC features must now explicitly enable the "mbm_event" mode.

 > diff --git a/Documentation/filesystems/resctrl.rst 
b/Documentation/filesystems/resctrl.rst
 > index e4b66af55ffba..e38bfd15fc3d0 100644
 > --- a/Documentation/filesystems/resctrl.rst
 > +++ b/Documentation/filesystems/resctrl.rst

[ ... ]

 > @@ -1788,32 +1792,41 @@ a. Check if MBM counter assignment mode is 
supported.
 >
 >    # mount -t resctrl resctrl /sys/fs/resctrl/
 >
 > +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
 > +  [default]
 > +  mbm_event
 > +
 > +The "mbm_event" and "default" modes are supported. The "default" mode
 > +is enabled by default.
 > +
 > +b. Enable "mbm_event" counter assignment mode.
 > +::
 > +
 > +  # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
 >    # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
 >    [mbm_event]
 >    default

[ ... ]

 > -d. To list the default group's assign states.
 > +e. To list the default group's assign states.
 >  ::
 >
 >    # cat /sys/fs/resctrl/mbm_L3_assignments
 >    mbm_total_bytes:0=e;1=e
 >    mbm_local_bytes:0=e;1=e

Does switching to "mbm_event" mode automatically assign counters to the
default group as shown here?

Because this patch changes the boot default to "default", users must now
transition to "mbm_event" dynamically. Looking at the transition path:

fs/resctrl/monitor.c:resctrl_mbm_assign_mode_write() {
     ...
     /* Enable auto assignment when switching to "mbm_event" mode */
     if (enable)
         r->mon.mbm_assign_on_mkdir = true;
     /*
      * Reset all the non-achitectural RMID state and assignable counters.
      */
     list_for_each_entry_rcu(d, &r->mon_domains, hdr.list, 
lockdep_is_cpus_held()) {
         mbm_cntr_free_all(r, d);
         resctrl_reset_rmid_all(r, d);
     }
     ...
}

This path clears all existing counters and sets mbm_assign_on_mkdir for
new groups, but does not appear to assign counters for the already-existing
default group.

Prior to this patch, booting directly into "mbm_event" mode handled the
default group assignment during rdt_get_tree().

Will the default group actually show _ (unassigned) states here instead
of the documented e (assigned) states, causing bandwidth monitoring to
return "Unassigned" until manually fixed?

===========================================================================

Yes. It does not automatically assign the counters to already created 
groups. User need to assign the counters manually to read the events.
The documentation needs to updated.

Thanks
Babu








