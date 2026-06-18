Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010007.outbound.protection.outlook.com [52.101.56.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D82D94AB;
	Thu, 18 Jun 2026 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810199; cv=fail; b=s3aXPcdbbug9aN1mlGXtcRndMUAU/UvZ+8zhONH37BXVo49P7odqptYoMvCrXWbpJXxaFXsSHLE3XUh+dyabABDZDBhFKy5Y0U0STMvMsKGcB7rclBJ6/x8YNqJLpSNSaxWSB4gakgg9NPo4Qjeq06IX3hppDiyh/+UD/w7aFx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810199; c=relaxed/simple;
	bh=yW6KYBfrljEQhUsUcBVDGS+F6JdNmpPNWxmcnksZSaI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wm0SdePaneQ5Os8wgqANddYlUb9JAYT4P1iED+x23vHmHKnOUyAyDHUKhTVf/aS5sto2CA8QpTDMhUJOr7QBirkgTqQSXR0/hWGLe99TMydtd2QyyBqLjoOUjNZT53k3WpYVBW4uzn9OwRlkegfFyjnzL2BE2pmY+FDkl9jh9GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yvGPJD3v; arc=fail smtp.client-ip=52.101.56.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yvGPJD3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQVvuXC7H5jyeuA0DFPOskkxY5VstaV7ZEn96Ys38Jdy5UAghbcd+pTz+5vnL0mn3O0m7mlnrAk19f2zKyhfCF3NAnrkdR579OTVKYX8vXHYCGg/9ohsZMGA1xAeHF0mVWtTl7V69klfHz+90bijJ1hEV+oCyXz/Ye/mbrUvOF71DUD1vfBRbRNZpfSpoAdJPGlH4YLaugZWTZhNXxcaEiUl7EOKCIuI7v6SQMxd+a273F3f+N/9dO1h5QKyPqivP/MtBtq6sI1Eo17w+4O8/88ItBLgVL51hkwufKkctV2TkHsRsbncUDejGh+c0XaHvjIT72KCiZW9zhsNTibf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqEJypRVGDKEIb8bKxF5n8969ZibxJZlCFrh54UWFe4=;
 b=evDyJrNmm+2itaWkjBTEfiArZ/ZYEzp5+7jo+F/yy3YOROHG6nWttoXpViaZQI+Yx7SijAvs/MzTjEK4RJLlHbI+VlepYODMhSfO6yZd2rqpo51qJfT7HQbWtpM7p5MhxU2rtkMhM4QPq4uww/gUb6WJQUcdZPHBVTTUmOnZnkwg2o4k3ig7ZRNipkkPo2Z9S/UjEVK6jm+q3ljMHCnp7ZDRKeGvr4TOiSG1M72c+FZHE+jSCZY7a1H/697Bx1A/0huBw0dztNLvRWRW0Jm56NjwhPnk8MG5udx0/bICgtN3I/WgpktJZ/LYx5xPRvZshn9n3o+2ddjRRehKbwiZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqEJypRVGDKEIb8bKxF5n8969ZibxJZlCFrh54UWFe4=;
 b=yvGPJD3v6yhwmOQU0LUjuiXI891mBxliuTkZjISn7AdqytNbb7cj3FpRnVBDtauQN4/khbtaTQ4yEYbjA0J9MNv7bnbcgQ+ucLs4Fepw4+Ta6X5cYkyemI3mgEgOuDErn4vVyW70NUenKgfgVHy/ermkdc6/v++VROwfwJ1QEoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 19:16:32 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 19:16:32 +0000
Message-ID: <9bef3096-724d-480b-a58a-aa24be922c78@amd.com>
Date: Thu, 18 Jun 2026 14:16:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] fs/resctrl: Add info/kernel_mode for kernel-mode
 policy introspection
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
 <549bf0fadf1cedb5938599be58e53b7464c939b5.1777591497.git.babu.moger@amd.com>
 <2429a51a-92ad-4810-bee9-44bd6fba3443@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <2429a51a-92ad-4810-bee9-44bd6fba3443@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0441.namprd03.prod.outlook.com
 (2603:10b6:610:10e::34) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d4a069-db12-431c-f4c7-08decd6e1b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NHT7D/rNsTUfTDYEeIJzwaPb85NYo9XGIixceCdAtbmSPqtwCnaErwlm7bwdGZB9SSheHElBuIWn+D4jABjToai6axft7RayVft26jkQBTJ7RgFXTPGCTSsA0PEUDb2f9N0TEfAOcssjZM5/oab1MXcNuzgwxycUaAX7ZLQ8qoq53c3+NiFGLKEcq+0z67zfXSuDZA4tftfQApMAAq8yIyOm9OenY/zm5Mmw1C4/utrp/8F0WBsw4RBTyIFQAjLdIl7f7TvsJdh29mh8/WHD16eH1psjRSSSFF8E6h7wQkE1JRTijbyZwgRlhF9cF8ufud6o2J7AvOq2IRlQCsUqky6mkqjEL6ef6mxdAlSb/gAxrQH0qC/1KEKEJqiDyhGhBj/dk5DCo+4sANN93iMmxoEkaLeJf+5z1tYyFlbgZc/l90X/+4mGm+yfkUFllg64Dfkj+oNY4ff/x4lM/EJ9lQuv5nVnT832WNfmBDX0RJNbVGLnPdjISCo+F6pljLpgxwxXLMc+cX7gG6QygNNNgTb5LdIlMmva0Fc+wT/WaWvexr1BdkAFS5isnvZeVGlniY+FSeHvfXR0nrBtMaqZVEmcJhMHFAmPIWkc2E5haNJCafH5ispp1v11TL2i/5Tbxp6eAbHjssMtIvRbLwvoGX3QYgqbnWZkNqrzIiomVQRlti6eX02Cy3xgIxO+75m/8sIKrGF6GHivh2EhkLizNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3k1Y251UVIrLzR5dW40dkthUGlCUXFQQXBxZFpmcmI3TVJaRWpyc045N1V1?=
 =?utf-8?B?aWI5TTZPbXV1M1FQUUg5TWVlN01MNFlQY0xQUVA0OGhzWFNIbjRibmdkQlRZ?=
 =?utf-8?B?dW5mQ3lVejRWMWZmMFA3Z3VHT1dSb1dCemplUXRHS2UwWGFMakVidUczaEpv?=
 =?utf-8?B?ZXBUWWtyVzBMZG9IUkZRSDc5MVE2Smwwc3V0cXZvMitUZEdBQW50OC9JaGQv?=
 =?utf-8?B?R1FhUWw1MWQxdWU2VkREd2lIMWdFbDR0cDVnN0l4Zzh0cFhuQzFFWm13ZVhl?=
 =?utf-8?B?SE5acElZKzVxQk96T29oM3YrNWpLMmxqanRreVVCNlB6NmgyK0RiL3BjTGlx?=
 =?utf-8?B?SzNyeTRSK2FUVnVTdExaK3BoVWlLOXlEeFZYN1N0ZWpydURKNWQyNlhIV1Y0?=
 =?utf-8?B?MHltYzVWNmI0UEg2S0pXNDk3V0ZzZUlkRmF1RWRWS2RvZkN5a0V0eWtnZm5a?=
 =?utf-8?B?aVVhM2ZQeWtZM25Da2ZveEZvbHFGM3lmOE5ZdkxkbXhyK3ZEVlBVZ3MrMVEw?=
 =?utf-8?B?UGdzekxqSVRZMmhla0U4cy9VcjR3NGpjN01KVUhscGhjcVpHMkRucVF1b2ts?=
 =?utf-8?B?c1dOL1lMMng1RlMzUlFCVUN5UDVMQnpmSGgvQlI2QXlVSEdMdE9xMXl4bnNN?=
 =?utf-8?B?M0IyRS9hd1VDMjVYMDdzdk94REVZdCtYR2ZBTEF0cUtwWkRwY2g0eWRid1JR?=
 =?utf-8?B?eHFscmZBWDFUdjh4SWpnb05yclN2b0VVTjMzKzhPSnFGS1NKbnRoUXZYcUcy?=
 =?utf-8?B?U212enBnakRyRitlV1pvUDhYdFEvRDNoUkQ1U3kvTEtMRm50R1RBa2liSWhp?=
 =?utf-8?B?eDUxOHV6SmR5YXl6V1BzQ1RDSjB2S1BQNnIzRjRGbWpVL3ZlVjJsSldldTNw?=
 =?utf-8?B?dlVwVGVHdnE5aGF1enlubktvSEttL0YxY1Z1OUJkeVFwaVZrR082dkU4OEQw?=
 =?utf-8?B?eTdhVlNqVGhEUUM1TEFkcVhGa3JoYUdtREhjZmh1ZlpRNWFXZExwMmtxblRH?=
 =?utf-8?B?NGl6U1k1S21seWUwMFV3cXgwZy9hY2tvYkNiblRiREhRcWJIRVh1K1R5MlBQ?=
 =?utf-8?B?NkQ2dCthL0xrdGYyQ2pnS0JMcFEvWTR4YjdZc0lRWTRmQnoybFViRVdBQ1FK?=
 =?utf-8?B?dFMyTXpFRFZsR3J0eE4zeGJqV2xYUWZqOEtvL0hzQS9LcmNabG9jazBNRll4?=
 =?utf-8?B?RkRUOHU3QWczWWEyeDVBaVBnZ3AvM2dqYzZuU0w5aWdRK3UzYUtvclU1d2p6?=
 =?utf-8?B?bzUxWEpudjExY281N1E5Tm1HS0J0T0Yvd0hpQTRkSlFzdXdFMk83SG9YazB3?=
 =?utf-8?B?WWk0dXVxZEtZWnNCK1dDTCtYLy9TUFNCVWFuTlZ0bTNYcDdQcVordk9YNm15?=
 =?utf-8?B?U0ZOUEN6Z3RnYmRlNWFkTnlHZFcvVXZreE80bW5hYmdUdkZJN2JyTGhXQStl?=
 =?utf-8?B?eTM3cm9WZWw4aFZqN3E4eXJCYi83OHhkTkhqZnR2a3J1SlBmdWZ5dmVGS0pF?=
 =?utf-8?B?RkplUEdOTERXd1N4QnhIMlJmZm9xZTdsazNlTE9saTl3UmVZSWFEbHJicWxJ?=
 =?utf-8?B?RUFuS3pHam9QZjAyckc2azNTRmVqOEVxdHNRM2VMcGF1RXVSY2o5Rmp0SWx4?=
 =?utf-8?B?aThyTHB3T01pNmx6Z3JsV0RwYjV6SFdNa1BBMi95dER4TmFnWWd1cE9UMzRU?=
 =?utf-8?B?eTNMTUFySHdqcUxUbVdHS2QvVktkU3NHYzJaQUZBdlZXSlF1TE84eHYzRVow?=
 =?utf-8?B?UFVDSjVXWnFrbWl6cU9PeEQrS2RsdytyRHFyZ0RkY25qZnhiSk8ra01TbWZj?=
 =?utf-8?B?UFBBR00rYUpxVGZQWHMyd0dReFZDRER4YndYeHU2Umk2d2J0WitDMy9vSytM?=
 =?utf-8?B?UzU2NmxUcFIwWTZXZTZjbVYrQ2JMSjA3R0FIQ3JxVnhSK25OUVhEVUk4MmFL?=
 =?utf-8?B?eTBJMkRMRHlwOTA3R1JiYVA0RnovYStLOGhmMEhsMllCeCtPT1lMNnNLRUg1?=
 =?utf-8?B?SlRzWk5jODBOOEZMTWR4Q0diVmVUVGtWa0JVNngxUDVOUkVSTml2QWprQjRq?=
 =?utf-8?B?TkhmT084WEdzbmpsMVh6MmhVcHdOS3NJMWl2cittVTZZbnFjbFhkSklvZFdh?=
 =?utf-8?B?d2FOWWY1aktOMWpHSWV4cnZvYm5idDRMZU9JQU8zTWlSdEFBOHNJbzByVUlP?=
 =?utf-8?B?SWU3WEJROCtCSHY1L0R3UVFFNUR6eHVTRU9wSWpPWldFR2toQWgrTG5QcTBq?=
 =?utf-8?B?MlFhcDR1VFQ3dTJpUG1OWjlyR3I3SGdib2tEYjlsckJySjVVYTg4bEdEU05M?=
 =?utf-8?Q?RJFkuw5rCmYkrqFxZp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d4a069-db12-431c-f4c7-08decd6e1b4b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:16:32.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPczmLLDoU+y9drU+c7sTo/g06qnBcHXk2JuoHCyUjAsEFyHg1SAt6aoEXSqgL9J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482

Hi Reinette,

On 6/16/26 18:38, Reinette Chatre wrote:
> Hi Babu,
> 
> How should "introspection" as used in subject be interpreted? This just
> displays the supported and active kernel modes to user space, no?

Yes. Will change it.

> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> There is no user-visible way today to see which kernel-mode CLOSID/RMID
>> policies the running kernel supports, which one is active, or which
>> resctrl group currently owns the kernel CLOSID/RMID.
> 
> Why should there be? This is a new feature being added in this series.
> No need to write this as a bugfix.
> 

Sure.

>>
>> Add a read-only top-level sysfs file, info/kernel_mode.  It emits one
>> line per mode advertised in resctrl_kcfg.kmode, in stable lowercase
>> spelling derived from enum resctrl_kernel_modes, e.g.:
> 
> All these changelogs feel so strange ... as though they are written by
> somebody who simultaneously has no and full knowledge of resctrl.
> These verbatim descriptions of what the code does is not necessary. Please
> start with why the patch is needed.

Sure. My bad. Will re-write it.

> 
>>
>>    [inherit_ctrl_and_mon:group=//]
> 
> This is unexpected. There should be no group associated with this default mode.
> This is how I interpreted our previous discussion ending:
> https://lore.kernel.org/lkml/6709398b-269d-47b5-9b41-084f410bb1a6@amd.com/

Ack.

> 
>>    global_assign_ctrl_inherit_mon_per_cpu:group=none
>>    global_assign_ctrl_assign_mon_per_cpu:group=none
>>
>> The effective policy (resctrl_kcfg.kmode_cur) is wrapped in square
> 
> (needs imperative - please check all changelogs)

Sure.

> 
>> brackets and its :group= suffix names the resctrl group currently
>> bound to the kernel CLOSID/RMID (resctrl_kcfg.k_rdtgrp), formatted as
>> <ctrl>/<mon>/ with empty components left blank.  Inactive modes are
>> reported as :group=none.
>>
>> rdtgroup_mutex is held while printing, matching other info/ show paths.
> 
> No need to describe details that can be seen from patch.

ok.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: New patch to handle the changed interface file info/kernel_mode.
>>      Changed the group name to "none" if kmode binding is not done.
>>      Reinette suggested "uninitialized". "none" seemed more relevent.
>> ---
>>   fs/resctrl/rdtgroup.c | 74 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 74 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index a7bfc74897cc..9cdcfa64c4a2 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -988,6 +988,73 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +/* Sysfs lines for info/kernel_mode; indexed by &enum resctrl_kernel_modes */
>> +static const char * const resctrl_mode_str[] = {
>> +	[INHERIT_CTRL_AND_MON]			= "inherit_ctrl_and_mon",
>> +	[GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU] = "global_assign_ctrl_inherit_mon_per_cpu",
>> +	[GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU]	= "global_assign_ctrl_assign_mon_per_cpu",
> 
> Please make alignment consistent.
> 

Sure.

>> +};
>> +
>> +static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>> +
>> +/**
>> + * resctrl_kernel_mode_show() - Enumerate supported and effective kernel-mode policies
> 
> "Enumerate" -> "Display"?

sure.

> 
>> + * @of: kernfs open file
>> + * @seq: output seq_file
>> + * @v: unused
>> + *
>> + * Emits one line per mode advertised in resctrl_kcfg.kmode (each mode is one
>> + * BIT(index) per &enum resctrl_kernel_modes).  Every line carries a
> 
> Above is clear from the code. Please instead describe what this means.

Sure.
> 
>> + * ":group=<name>" suffix:
>> + *
>> + *   - The effective policy (whose BIT matches resctrl_kcfg.kmode_cur) is
>> + *     wrapped in square brackets and <name> is the resctrl group that
>> + *     currently owns the kernel CLOSID/RMID (resctrl_kcfg.k_rdtgrp),
>> + *     formatted as "<ctrl>/<mon>/".  A component is left empty when it
>> + *     does not apply: an RDTCTRL_GROUP emits "<ctrl>//", an RDTMON_GROUP
>> + *     under the default control group emits "/<mon>/", and an RDTMON_GROUP
>> + *     under a named control group emits "<ctrl>/<mon>/".
>> + *
>> + *   - Other supported but inactive modes are emitted without brackets and
>> + *     <name> is reported as "none".
>> + *
>> + * Context: Called under rdtgroup_mutex like other resctrl sysfs show paths.
> 
> This does not look accurate since it is not called with mutex held but instead
> takes the mutex itself. Also no need to refer to what other code does.

ok.

> 
>> + */
>> +static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>> +				    struct seq_file *seq, void *v)
>> +{
>> +	struct rdtgroup *rdtgrp;
>> +	const char *ctrl, *mon;
>> +	int i;
>> +
>> +	mutex_lock(&rdtgroup_mutex);
>> +	for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++) {
>> +		if (!(resctrl_kcfg.kmode & BIT(i)))
>> +			continue;
>> +
>> +		if (resctrl_kcfg.kmode_cur != BIT(i)) {
>> +			seq_printf(seq, "%s:group=none\n",
>> +				   resctrl_mode_str[i]);
>> +			continue;
>> +		}
>> +
>> +		rdtgrp = resctrl_kcfg.k_rdtgrp;
>> +		ctrl = "";
>> +		mon = "";
>> +		if (rdtgrp->type == RDTMON_GROUP) {
>> +			if (rdtgrp->mon.parent != &rdtgroup_default)
>> +				ctrl = rdtgrp->mon.parent->kn->name;
> 
> Isn't default group's kn->name is initialized correctly via
> rdtgroup_setup_root()->kernfs_create_root()->__kernfs_new_node(root, NULL, "", ...) ?

Yes. that is correct. I will remove the check.

> 
>> +			mon = rdtgrp->kn->name;
>> +		} else {
>> +			ctrl = rdtgrp->kn->name;
>> +		}
> 
> Can the names not just be initialized directly from kn->name?

Yes. I think so. But I need to know if this is a control group or mon 
group to make it generic. Let me see if I can optimize this section.

> 
> 
>> +		seq_printf(seq, "[%s:group=%s/%s/]\n",
>> +			   resctrl_mode_str[i], ctrl, mon);
> 
> This is not where I understood our discussion landed. I expected that the display will
> reflect what can/should be assigned in a mode. For example, mode "inherit_ctrl_and_mon"
> does not have an associated resource group and should thus not display one,

Correct.

> "global_assign_ctrl_inherit_mon_per_cpu" can only be assigned a control group and
> should thus not display a monitor group also.

Yes. True. In that case "mon" is empty. It will print correctly.  Let me 
see if I can optimize this section.

Thanks
Babu
