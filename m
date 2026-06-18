Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012065.outbound.protection.outlook.com [40.107.209.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719862EEE69;
	Thu, 18 Jun 2026 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799630; cv=fail; b=Gmczha1xnC1yZJmKhqDnyohxqvcUEk4jXAg0n+ud5GR6AnFTS7S176G4Qh1PiGv4CpKohwQIZCXAbe3aqy6CKn8MW6VuA3cpc1o47LoirEh1oXoACuZoWtBSlzSbkreIzyyQsdOr8Kh0N+qGn/enWdaQjH1Y1nKF4VMp/rYbmY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799630; c=relaxed/simple;
	bh=3IDD50hSliI35FfFgLp5drl54uX3L7n3rZb42ALIQf4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eTShm5g30izAh3i96WG8fEef6+fFq7jL6S69agAkI4wyWQoqNALlKs5k8e+sJQjcPejdaeMZKehTq7tP1c4R26gGjC+ulUY2gcBYvoqTQoAmwp1HnpFI5GkjlJ4uDfkbWdYfSq9a3Nta/hvKQOdSZ55jFZbp7Xq91YhWjIftGOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gC25Bndx; arc=fail smtp.client-ip=40.107.209.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gC25Bndx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQgsrcOWhAEBP0xEaMKVJMnQZcdtty6FBS2b1gr13U6QhCVPXzo+YluwHCqX+Y55zz6IzeFoG0QGb1TUab8QpriU19kD71P0jTT9D+xS3asfyMFBGhVRzP0zDo9Cvk1OytL1lLsPeswHo/oK3i4H49qb76E5NqoWJEyPVIhG1grH1uSrQy+70ZKfekllY01HBlGOSqNMauGZxLzoejW0v8DngpFGvKP8ZKIDVXGBe8OpvJWjAfRDRDd0j2q4Mkxov2OeYCp//rg723vmhV5zQQan1xW6q+wQtwkzjAscgsCSePTJJoOMFgKUZjG8ahlzKFFaYoJVSm8XsecCuZ6DsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgZ716fJ1IDCkC7FeAkgndnVV0EQuHOePlB3spoAq9k=;
 b=vSjk4UusYU4FzToUx1aUS1fcVPge2Dgzbu7WPr/zOZAmvOW+IhjZ1Vl8SKWIlqAQUACwiy1pFnd8KE6ATTSDefEEpCwUKDR9BxgliIHW1/aFR24p0JVDnAUafLdUmNH/fPJ5cbVeYD9n2Lti554OoBSahcBMWMJ4MxqdpTRRm/jgfhCyDJ63tpLb0krFdhmX4/cPzkDAP2ce1mTZgvllx9xTtmbfxQGn1Ct1lM1by5QoThQVOzqBbPF7t4qzRKrMy0ZrdqQm5R5NLFosMgPkpNyuJq3MpNpHh1eovPwppZSgLWsBFnw5DlPnoJzub5XwwyKdPvFuF2iHUg2fU7aiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgZ716fJ1IDCkC7FeAkgndnVV0EQuHOePlB3spoAq9k=;
 b=gC25BndxCYzR5b2Xt3ZdCO6S8XmeHX5NhEOiJ5bLF5vmSpu32SUR6zYN7vdPxlbcjDddhQQ5IF8Lqg6ZqNmcswjeRhBYt530yQifmTWUPEUcfKtRABBe+KlhjgB1G5ZNG8dvhojWbvkQqOYhQEuKhFNj8xvkzv8os0zHqrsLT6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 16:20:23 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 16:20:23 +0000
Message-ID: <5e23a0f5-0dd7-4fe5-b5db-7793ca23b4b2@amd.com>
Date: Thu, 18 Jun 2026 11:20:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] x86/resctrl: Initialize supported kernel modes
 for PLZA
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
 <95188117225c9235be89753edcace115cf5c2e5f.1777591497.git.babu.moger@amd.com>
 <283777e6-679f-4f02-8342-47b0349e92db@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <283777e6-679f-4f02-8342-47b0349e92db@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR05CA0017.namprd05.prod.outlook.com (2603:10b6:610::30)
 To BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5b2cd6-637d-441d-6e76-08decd557f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	TBjdoRAuPFAAaPsni8+f/womEu46Ye7wTG5pNlE57+cEekSawKFoZrY7yj6ZnpRsdUzv1iagQV1rLgIeLoQrarPG0W3qVbVpt36JQN1hl2hnqFXtWe9ogYeZWvqJmdaXVoKQ4HJq5b3jm/QR1y6a6HW8sK8Z4gA2DDzTeDZkOX6Nd6W3DRmxwmlEJfS4UFGR8KrNf95pZYiBBbVIFQf+8IWaBR1P6phmGPmi+yEBHgr23VWZPv6eE/+BPjVsfa3QFmQrA9WB1RUNjfv+Do5BaElomi1MKSXa+s81UV8r06cQajTCMy6Mz3r/lJfz+9FSKUdtpRbBbQBDhBpgi5uWhQDdsSPFH5Vmbwa3yNqcCtE8NWWsDB0s72NE70v7fPJqC2qItmNMqh2u6PEToxdhZeQ2rS+25Y2JHavatUnxrl4qautN4PUO3+s0E+p4b9T4jcQg5g0Wr/Gkzhmrm3F+UV7ytdibEd+x2aZH1fsMuqyPeYJg/57PfmDnIFe2r2WPJCTsdar9QMy5o0h38Iff2zmgvnqc1vuLoM4UsZz9M8X3v5Q/MhTp4R17XUNFXwDJYAwLH74bG4TIBKlHGwXdWuN2k+0Y+dNwZMrCS4Jb9fKvW8YhhRoOYsXUnBTX8X38XLThSb6xFbUu3vYRtZfqZNqiZh9hHmkkZsqqQiqOvRTug5X5kP3mADQpnkGWSRaO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU9pNjNSRGt3ZnJKNWZualZFaG5aWVpUU0g5dzJjSyt3dGJLTmVtNnpPNk45?=
 =?utf-8?B?WEJDMnhybEtobklDNHQzdi9VdzBuNHY3VDRGc2tNR2ZwZ3c5d1ZCWXoyNTZ5?=
 =?utf-8?B?WldNNE9pdWZsd3lyUUZVaFNXUmx1c1RoMGNiU2l2THJUYzQvdzRFei9RY0xZ?=
 =?utf-8?B?KzVSeEhVQ3NqYk9yK1dZUkE5a0RpVkdOZWxoMEtBNkJ1UkxncUgvQTZJV2hl?=
 =?utf-8?B?SHFjWEtUMUhTMDhWbkp6MHEvQ2Rkd05ObnV3NnpIM3FkWWNYMWJ2bkNCNzdq?=
 =?utf-8?B?L2VqYkZDK1pQRmRldGsxTStiM2lKKzU2L2pNZHVLdW43OUZlZkdMcWtMV0tp?=
 =?utf-8?B?aFgwSVYya29hb0E0aUlIVlRWbTYrK0VJQVIyQnFSblc2ZHppWEl4eDdMTnJs?=
 =?utf-8?B?NGNIS3pJdk8xV0R4MVh2b1lPRjU3c0dBWVdJUEE1Y2U3bFljbmYxZTZ4Mjh4?=
 =?utf-8?B?WU0vUTN0UEFDNG95WmFFWHFJTk1rUkVURVJ4MlphR2tFdjduR2s0dmtCWGxY?=
 =?utf-8?B?a2VVNzE0STAza080Yys5ODBIOGdDTUthNElnaW9YdlRPK1UyU1RZT1JSay92?=
 =?utf-8?B?cmtGdElxREZuNzNDNGJkZ2NFY203amJvVVp6MDJ1T0Y4THhIMWxNL0pGMDRU?=
 =?utf-8?B?Sm8yeHg3Rm5GMDNQd1ZZSUFLb0lwSnEzTVUzc0h1TEwrcjB0dWFETTVaamVI?=
 =?utf-8?B?VGt0bDJURTBQWExDYmNrQmlmc09YdTRFanBRZHpRb3NvYUE4YzZFWk1IWEs3?=
 =?utf-8?B?ZkxpNE9EYUpyWVZTNmtjS1gyWk9yN2Uwa1BJVzZrTGo4WXdYVHQ1MldvR01m?=
 =?utf-8?B?MG11MUYyUW9hMWZjM3A1ZTFGMG1EQ1ViWlBvNWlwK3NsdWtTOUF2dytlYWNl?=
 =?utf-8?B?OXpBeFdBN0JMWkhlaDFlMEhWT3hVNzBBbEZJU1VNVHN0ZjJLQmpSd2Mwd3Jm?=
 =?utf-8?B?S2FQMDJjazNTNi9WOU5iM1ZXK2YwQU1mU3ZaWSs3dURSUG9Ceno5ZFM4czl5?=
 =?utf-8?B?RGNFazgwQlBDQ28wZ3pMT3FkS3I1QnlLUlc5c25lSE5MaFhBQnhSMEJZMSt0?=
 =?utf-8?B?R2pJK3RBcmtvR3JHbXdNcmpNQm5JeXpLc29peUdDOFplK2JITzRLU1RBM1By?=
 =?utf-8?B?VnBFRVVWNVJSQTl0bXFtL1JFVDlPNWkvR3JOMHBGNXl3T21UWlVJM1V5K2JW?=
 =?utf-8?B?T1RUbFd1THh2MmVzbUpOV05ubE9TUnRHcWVxOUpVR3RjSHBmY3JGZy83V1hr?=
 =?utf-8?B?b09ITUVsdFpNMUdxbEVhUnZVOW0yQjRYckVEdE4rYk9oYW1IbWN1c0F3VWVz?=
 =?utf-8?B?VzdiWjhFVnhpTFFZTWZUd1N5MkUyMGZBcGdrTDd5WGh5TklIckxQdkQzelZS?=
 =?utf-8?B?VlUxUnlRWG9lV0NxV2NXU3NQc0NQQVpMZjMwTlB0VWhCR2NMY3lpek5xYnUr?=
 =?utf-8?B?MHBRZ3RUOXlGc0VCTFMvendreU11M0ZCVDlsaGFFeU1WRlZiN2xoV0EzT2lL?=
 =?utf-8?B?dEhiN29VYk50eW9iMXQ0STlCaHExY3U2ZGpoWDRiaHd1elgxNnR5MmswTUJK?=
 =?utf-8?B?L3l5L0FvNDBFREgxd2tTMGZ4MWdDUFpSbXR2QTVCV0ZiakxPSENNbFB5MFBj?=
 =?utf-8?B?MUNXc2hCRXlRdTEyZnlBcGtzU3ZBeFdRSUgzaHlmTTdMb2lCQUREUk5DZ2xO?=
 =?utf-8?B?TGtCK01Bdm1xY2NrK0hwdUN6TEJKWXQyeUt1QnJaWEVzTjNWZWxnSm51a1lB?=
 =?utf-8?B?SmFvWWpmS3ZCdHlnR0ZzZUdaVTFaV3czVjdIRzFyWm1wN05wRHZjUUZqWXBZ?=
 =?utf-8?B?TnFtRUNJTEI5bjFnK3BtcTliOWZqbnVoTXdkSnE3blIzSXNGVGZuVkFlM0JJ?=
 =?utf-8?B?ajFrTG9uQkNUdmlka3gwTkxzOWdTcE95T2puSlk5d29tcjFwbjNHZFlJMlhu?=
 =?utf-8?B?QTVxRUZnNGJnajVvVU1pcE5ka09JYWtRQkFiSlIvYVBOdENZVGpZVVFRd2Fv?=
 =?utf-8?B?QTFNaDUxZ0JGRkxIUC9WS0VCMUljZ1hKR2thYVZJdDVnUVZ3RzhQY2V4Wk5J?=
 =?utf-8?B?cXhkdWdwb3NiNjhacGR2RDhlUmlhYTdPUFl3bGlzSTRuRVBLZ2VNb0J2dnU5?=
 =?utf-8?B?enRWbzVCMWxONkVMblFGV1BKd3pxNnk3Z0hjNVh5bzFqNjBhdVNkclNrYlM4?=
 =?utf-8?B?eTZBYVlnQmFPczh1RXl0eGFoM0ZhSis5N244dkRqZ0N2djY1bnFsUi9vejNG?=
 =?utf-8?B?WnRrVWFxZWp1RGo0dGZYeE1YbWxySDgzR1JKZHpXaUt1N2lULzhZaDN2K2dE?=
 =?utf-8?Q?AdKyze+rSgPBstmL35?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5b2cd6-637d-441d-6e76-08decd557f85
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 16:20:23.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /f0CVY9N0MzYFI+JeKzdpA63hys+8py7EovYpWmvKACk71E5RRHf+PT7Re4mEIa4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791

Hi Reinette,

On 6/16/26 18:35, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> Resctrl subsystem tracks which kernel-mode CLOSID/RMID policies the
>> platform can offer via struct resctrl_kmode_cfg and
>> resctrl_arch_get_kmode_support(). AMD PLZA (Privilege Level Zero
>> Association) is the x86 feature that allows kernel traffic to use an
>> assigned CLOSID alone or CLOSID and RMID together.
>>
>> Report the available kernel-modes when x86 PLZA is enabled.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: New patch to report all the supported kernel mode by arch.
>> ---
>>   arch/x86/kernel/cpu/resctrl/core.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 4a8717157e3e..699d8bb82875 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -894,6 +894,21 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
>>   	}
>>   }
>>   
>> +/**
>> + * resctrl_arch_get_kmode_support() - x86: record which kernel-mode policies hardware supports
>> + * @kcfg:	Cumulative snapshot; OR bits into @kcfg->kmode (see &struct resctrl_kmode_cfg).
> 
> If this is intended to be a cumulative snapshot this is a very subtle requirement
> for architectures to "do the right thing" here. To make this more robust I think it will be
> simpler if resctrl fs boots with resctrl_kcfg initialized to expected defaults.
> Instead of this callback resctrl can add resctrl_set_kmode_support(u32 kmodes)
> that the architecture *may* use to further initialize the kmodes supported by it. This
> function is implemented by resctrl fs, instead of architecture, and it can fail if
> architecture does not support INHERIT_CTRL_AND_MON. This will help to keep
> struct resctrl_kmode_cfg private to resctrl fs while enforcing any assumptions about
> which modes are required to be supported.

Yes, agreed. I will move resctrl_set_kmode_support() to the FS layer and 
have the architecture code invoke it when setting the kmodes.

That will make the struct resctrl_kmode_cfg private to FS layer.

Thanks
Babu

