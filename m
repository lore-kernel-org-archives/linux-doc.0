Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC033290BD;
	Fri, 12 Jun 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285566; cv=fail; b=fb+qVqcVP3SaCfp3rX3SbgrHKwEZSQhkCicMSCpJPr7/2NHFaFmrHkclqUNf4mdGRjF+1u/k69ByjAb9bQCChfyNc4BsbG0nTC1R1eSe44rx2d0r64h2AUSb6QB9KUoriMXtbKt/T5FGKn6wKk4U6Vwd/1Oj7sIrt0rEugUyeU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285566; c=relaxed/simple;
	bh=Q+qRqYBPHuCiEthwhTwMMAjLHs+FwwC7WEgd4uXGPes=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X7jWG1mU1pqsUi6F8jVp2J//L73nAl9DKIhVdd/mDL8CJkB8JdhqiMsZBk1MZSJMMSc5TCojCVZjijfvoUwCPHPM/R73OJiYHx8YeDTnfojoAvQCUDR6k7txgLooX/HgF5T/Cp1OtFuZd/nDhyec1dWu/sVZdl+uewTXktGpTXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5CV9P37Y; arc=fail smtp.client-ip=40.107.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5CV9P37Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLD4NwXVZtTiQ/UkUf0P5enGCzU+ufNeXodEbXks+YutVRBSbdsUGtdXXXYac4JSLN1lHHw1lipYDeaXjh6vAOmqZDFfgw6GzaIZIezDi3fy2j4sipo2qyxOExu697c/ltrkX6gRyqTL1w0mubHBWf8CX691W7oSBtnbx0yNvex7PvWgTn8v7lmNgHFtCeaS9tq2HegOEtRezqB7cGvHzGeNCwlXE8FtKNjNuMVCGKQYywIrpHc9uYvDELxFNJpT8/xDpJ9c5CPAEW7qlPi8GP++18u8SIXNz3gqdAYJAycXoeAmfUdKoJ785JiRPE9q4ZGHVEE5gpVG13Dj5aRS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f58uHhuOgu0p4cQbyH3ILNo+LBuRGcv/818fM5/FceE=;
 b=giaRaxEVUVybXEGAYuDSrugXlzDq21RD4CNhrU+xL1Ca79WapzSgjKDPr6fN1Tjgw0uqy/zHSHdFPQmOEyQqNGx6AGAox2QV7PRmAXNfsmuoepPM3l222Z5bbkbWpZZUvFKZdz0tRWxP2pWrlqaUIfZzaAFJP76feiuwUt1s3qcY7kBw22GG7TS1OkzR2nuCmLs7BasEVq/DHYx0Lx6Uy0uxIi8gxqIOVPBkpQvegflp0zTLYP6M4MWZKklzem0COG0lXpmBI7t47LzvFGt+M5xYv8v7QQPSUAIEGrtBxnBcx3Tmaffuvnm1T6ZIySc3BmXX5jwnxdsgQndBw2b8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f58uHhuOgu0p4cQbyH3ILNo+LBuRGcv/818fM5/FceE=;
 b=5CV9P37Yzg1tnOHW1/xuoYoP9BRsJjuFCddhRzj12sdZY2CRgDn3JCwPVbJmHOp2Lq7kV6wFbjx2cdTBfH/aFMb/MnJt6mPLnCdPt+55nLqcU2jj5F/gVO4FqhmWw2QhVdw29Z6O3pKPPeWbSajjtSKGWLpJ450nPgkKgKcFRLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 17:32:41 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 17:32:41 +0000
Message-ID: <190bf049-4928-411b-ab5c-30d39817f118@amd.com>
Date: Fri, 12 Jun 2026 12:32:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] x86/resctrl: Add data structures and definitions
 for PLZA configuration
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
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
 <e84fdbc324b312ff137d279ec154e3827c0aed81.1777591497.git.babu.moger@amd.com>
 <db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:806:125::22) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c577d9-7430-423a-382d-08dec8a89ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|4143699003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	l4QFoHTIc31vjdMXqeJ4IYJPtZNato20ToSxLtP1lGoa9/E44iPKELofuDwKiH8eJG6wWFQKfuIJ3hVWZL1xqu4dRAgoJItL6CFUCtN0oy/UKyq29OE8aojamE7COHUzx83QbiiTcyueUHYDiDx5ZP3qxhj18xvrzX0+KeIFHyBFRUU5rdQBLZCuj0m+bLbTsHVlwFgiY5vLn/c+IlLsmgDKXfm+s2344sxiZqZnHe7NmutK+KKr/zb1+b1Db5Vp5fUKRglZJUu+6hok5YHCCdl5wechlqsmqTm8i4H26T7Daj9JfcOfuwIKb996Y38KXHQO5AsTCnocwrGA8obzayIEFXo2MLrfsbVwjjihtCGDoBHnIYUD5DKEjS68cudng7QR0l6ldvn5DH9/hvuWeD3bGn/7UZ88y6SmZAe8PzMEDGe4OXbDd2denYG7HiOmLQ2y1qQHDQNoEfAfpqoEAUO0/ssB2Cq02GYcx6h7x4ArN++zI/txKoe3b+bKsjx4A1KyjxU3Vx1FbYopr6cwgwWXBa+FEzcUl3jruL+LE7ogZT+LS2mj5vyPpEOaGJ/+iOhP/wryc0IhA9d38B7UvwXfAjX2a7+ryDon2+Jqe8vNeIfSi2+nTJfMNk4akb3VIuhebdEoBGxASS/AYRTq9KPhlh8Zgha+mfmrbpZKNfqBetqq8p1VLKMk2qJVP3CV0DLJhBu5X7zy01E5Q81ztQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(4143699003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzBrbXQ0VmE3bzJtRE5VVG9DQXN5a1o0M2kwclJ0Wk5Pdm8wQWl2MDlUSGh6?=
 =?utf-8?B?ajNxamdvWno1ZFh2Y3ZBek1qdVNHR3ZnTTVCcGF0T1Zxd2h6M0cyODYrK1Bm?=
 =?utf-8?B?K2ptM29GZjBkSFVHRE83ZTJDT1NPVzhCdmtaMm9SeVFFbFBJNU1qOG9kcmVC?=
 =?utf-8?B?K1BwZUFZS0JOckRnVmxEdExkRVFQbTFJSGxxMHQ2elNiVksvcU1kWmpFcmg1?=
 =?utf-8?B?RzhOTFA3K1FSRHNRQ0xRcWh1Y080T2FTNWlmUy9rNjhNQnlMcXdSUlRSdElo?=
 =?utf-8?B?eUlDOFBROEROZkEzTHpxdnYvRHVLU015ZTB1NkVmd3h3SnZqcFJGK2k4aWRN?=
 =?utf-8?B?YmhWWHVZMkU2YUc2MHpVdjUwb1AwRGIyYXRxcVlhMkFMVWVKSEpTOGkzOFpS?=
 =?utf-8?B?Ny9OdThsRmEveWxaTndLS0phcjZSeC9KTUVvOHNvYnEwNXhCLy90NnUvdGdx?=
 =?utf-8?B?T1MxTXc2cldWVEE3LzhEWFkwT1pWSFN4WnZ2QUNrTzZVckpYWGtpdjFaTVdH?=
 =?utf-8?B?aGc5SGpQL3NTaWtmeGdSRTlmNmR2Q0dMdXhqbzhkVThDSEJiOGVCQVJseVFH?=
 =?utf-8?B?VENPZldFL3ZIVkZFYmhzdXJiL0pLcDB2SVovdXFPQXVPRm9wK0xQb2NwUEdm?=
 =?utf-8?B?TGgyYnJuNWZTMEhnUldtWVNYSlU5NDFZeVVhUmxXanZjWCs5SUtoQjA2RGd4?=
 =?utf-8?B?VkRQanFZNW8yUFdtTjFNZWEyOGtkUzV2bmpnc2RCYjE1dHZDNVZhMVM3SzV2?=
 =?utf-8?B?RWprdFRMVlhCSm1hVTlTODZjMFRKSEdoa1UybmJOeGkvM3RCMEFPOXQwNXkx?=
 =?utf-8?B?aHBDYTdMRStURUV3SlJJZVVjTktjMjJqY2x0cDErelJYV3EwNzdSRXJ4clZG?=
 =?utf-8?B?VGZFdE8vUFlqaFRlVjdaekRWOThqZGxGeElJMEVWbVBLZm1KblhNcGRCd3R3?=
 =?utf-8?B?enRsT3FWWHJVNlNnanlQR0ZXUS9HdGR3eDhrNVA4TjRxQmxWK2c5NkFSUElY?=
 =?utf-8?B?dU9rT3dLbW1DdGx6STlvcmR4dUNKTno5Z1ZBOEhpYTNVTlVjQUw5VTZvV3Fm?=
 =?utf-8?B?T2hTTU1ObzE0TDlsQXUwczNWSVRPZlBmOEd5cVA0Zk4wL2VZcFp3SUphS3Zi?=
 =?utf-8?B?Y1k4bVNDRW1nUHg0RE84ODk0OUxUNVRhcVc5WUdab1NtbXB6K0hhU2ZDTnFu?=
 =?utf-8?B?eTVMbkQvT1I4WHc0cGtkd0xTM2dOU3hTVHk1MVdLZEh2Slg1VmMvRW5xOEFo?=
 =?utf-8?B?TVM4c0R5R3FaeTdvUi9CSk83UktiZ0l6a2dvcENCa0JZSCtFZ3hiaGNRVFRp?=
 =?utf-8?B?R0d4Uk83ZVJkVndUQzZNOEo1RmFuSU5wWmFKSEw5WVFEQTFzS1JXeXBOU1U3?=
 =?utf-8?B?S1NOQWpLdmsrZm1RY3ZldFMydVA1ZjRYMFBiOFE2cHFiOUV2aWNNekZRMkc1?=
 =?utf-8?B?b2tRdWV4aWU4SUZ0N0JmVzVrOUJzNCs3NU5QWkUzb01lYVdRejhKK3diM3hF?=
 =?utf-8?B?OTQ0NEVIZE5nYldFcnNUQXluYnRSb1pLOHpUMmc2cHFkUm5CcGNwTy9aSEh2?=
 =?utf-8?B?eU80cU8yTmhsdGRia0phUmV2YllKN20xZGNQZTJhMHNCRThTQWlHSHRJTVA2?=
 =?utf-8?B?RjYzNnE3ek1ycGYyY29KcHJTb2k1TmRzaHlNMCszVmVPaUhUYjFTU1AxZjVS?=
 =?utf-8?B?Vll4ekNnNWRnS0lKYVp4aDNiYS9kTFhXYzAyc1ZjU0hEK1hEYUVLNWlnMmJo?=
 =?utf-8?B?Mms0U24ybzc0SFdnYWxIZlhUaVFxSlNuZG5BUWtUWEhTSmRkbkZCNXpjNVV4?=
 =?utf-8?B?Z2dmNHFobGNEU1NJR2lpakFVUmxxNTNQNWhuaUtDYjI1WVFmWjVySURmdW1M?=
 =?utf-8?B?ZDFnbG4zaXFXWjBiTTE3dUV4N0c4Y3pTTm83SXdadDBneS9XYWtLS1UyTU9S?=
 =?utf-8?B?MVFxZk8zVkFnMEQxVW9jSEdJcytoZ0NIOHg2UzQxTE9qdlFPQkhWVit2WSt6?=
 =?utf-8?B?bHJ5NkpkWHMrb2JEVnNtRDJPV054bkd3YlJ5M0hsQnhnUC9FK3puK0FWTTFr?=
 =?utf-8?B?VVh0K0JrU2tWeUlLSnc5d3MrbUlWSkdPWHRMRThsaU1GS2kvVWkrckVRN3Ix?=
 =?utf-8?B?UFRWYjFoa2YrRnlQMGdDMlhSdWlQZnhERGZoYmtSQk5PWER5d0FtRGxQYVpQ?=
 =?utf-8?B?YlEzNjJKR1pWbU84OU1VcVNCWXhnckp5WHBYMFZVVE10MmFST1pFUzdaVEtt?=
 =?utf-8?B?ZVRHMzAzWXllS1dmNEVqdU9SUGx2WXNpYm1nNDQwZDJrandQMS80dllzSXcz?=
 =?utf-8?Q?47lASxfiXkKazeumFc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c577d9-7430-423a-382d-08dec8a89ad0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:32:41.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+qzO2lG9fnSSfUISxKBlT/T1SYMk0oLR6WdZ1lmuDM+BhA1mqAXm2eb26YSJQQo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187

Hi Reinette,

On 6/11/2026 6:40 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> Privilege Level Zero Association (PLZA) is configured per logical processor
>> via MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc). Software must program RMID and
>> CLOSID association fields and their enable bits using the layout defined
>> for the MSR.
>>
>> Define MSR_IA32_PQR_PLZA_ASSOC and the RMID_EN, CLOSID_EN, and PLZA_EN bit
>> masks in asm/msr-index.h. Add union msr_pqr_plza_assoc in arch resctrl
>> internal.h
> 
> Above paragraph captures what can be seen from the patch. Please check entire
> series for this since many changelogs in this series verbatim describes the code
> changes in patch without helping reader understand why those changes are made.
> 

Sure. Will rewrite the changelog. And will check other patches also.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index 9dc6b610e4e2..623628d3c643 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1287,10 +1287,17 @@
>>   /* - AMD: */
>>   #define MSR_IA32_MBA_BW_BASE		0xc0000200
>>   #define MSR_IA32_SMBA_BW_BASE		0xc0000280
>> +#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
>>   #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
>>   #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>>   #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>>   
>> +/* Lower 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
>> +#define RMID_EN				BIT(31)
>> +/* Upper 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
>> +#define CLOSID_EN			BIT(15)
>> +#define PLZA_EN				BIT(31)
>> +
> 
> This is unexpected. So far resctrl has only defined the MSR numbers in this file, not
> the individual fields. This seems a legitimate use of msr-index.h but creates inconsistency
> with how the fields of the other resctrl registers are defined. This may be ok so I am
> looking past this for now. Since I am not familiar with this use I am looking at other
> patterns of this and it seems that the register fields are usually defined right after
> the register to make this relationship clear and also use more verbose naming to establish
> this relationship ... I do not think such cryptic names should be used without context
> in such a global scope. Please compare with how other fields are defined at this scope.

Sure. Will use the names tony suggested.
https://lore.kernel.org/lkml/SJ1PR11MB6083C069F99FAB8A0BEB8518FC182@SJ1PR11MB6083.namprd11.prod.outlook.com/

Also will moving the register "MSR_IA32_PQR_PLZA_ASSOC" together with 
BIT definition. It will break the sorting order. Hope that is not a problem.
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index e3cfa0c10e92..1c2f87ffb0ea 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -222,6 +222,33 @@ union l3_qos_abmc_cfg {
>>   	unsigned long full;
>>   };
>>   
>> +/*
>> + * PLZA is programmed by writing to MSR_IA32_PQR_PLZA_ASSOC. Bitfield
>> + * layout for MSR_IA32_PQR_PLZA_ASSOC (Privilege Level Zero Association).
> 
> These comments are valuable to describe how resctrl should interact with
> this register so it would help to be specific and document any and all
> constraints.
> 
> For example, I seem to remember that all fields except PLZA_EN are required
> to be identical on all CPUs. Please document that and any other constraints here.
> 
>> + *
>> + * @rmid		: The RMID to be configured for PLZA.
> 
> What does "to be configured" mean? It seems to imply that when resctrl
> writes to @rmid then the setting does not take immediate effect but would
> take effect at some future "configure" time?
> 
>> + * @reserved1		: Reserved.
>> + * @rmid_en		: Associate RMID or not.
> 
> Please elaborate ... what is RMID associated with? What does "or not" imply?
> Here it will help to document relationship with MSR_IA32_PQR_ASSOC.
> 
>> + * @closid		: The CLOSID to be configured for PLZA.
>> + * @reserved2		: Reserved.
>> + * @closid_en		: Associate CLOSID or not.
> 
> Same comments as for RMID
> 
>> + * @reserved3		: Reserved.
>> + * @plza_en		: Configure PLZA or not.
> 
> plza_en implies "enable" but the comment mentions "configure". Considering
> the other fields are "to be configured" there seems to be relationship but
> that is not documented at all. For example, if @plza_en is 1 and resctrl modifies
> @rmid should resctrl write "1" to @plza_en again to "configure" the new RMID?
> 
> Please add specific detail to help understand how best to interact with this
> register.

Sure. Will re-write this whole comments.

Thanks
Babu

