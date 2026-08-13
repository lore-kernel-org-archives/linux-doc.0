Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011017.outbound.protection.outlook.com [40.107.208.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D3339393;
	Thu, 13 Aug 2026 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786650531; cv=fail; b=FNpq3Cwd5BPfILl61QpNFHy+v9dilN3koFQiH3T4IysGbvTvzKHWTQRupiN4Bboa7Qnjy4vz9mVzOtRZSzpgEMY8ZFxB6j93K1MiyWYmmzjkS/P0dNmPg466D3ltVmzv63H5WXk4yli6TlkkewX2dlWAHj6FuyXM8M+3MeckNJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786650531; c=relaxed/simple;
	bh=WAQCTOsB4Gy75LumTi2k+7KYm0Ij0mBOW0rZtux7xNc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Njc0UNkBV9IRF1lIuP/Mdcp+Be4QMWkUxJV6Y2Y64N9SLXP1cv+EWL37tZz4wTjRSgNPEjq13LvL64z75fZ+vexwK7eFcSXo3hmXszHq99R7/xC2rl4XfXYEnoNXRSe7gFmHPz7dZxeVDrhSG/Z6/9NkLLY9pQC0o/3Ophh/HRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5GWYl0/3; arc=fail smtp.client-ip=40.107.208.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5GWYl0/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+tVKbD9KwzWTK9pW0/4cIZY8pg7kY8UPNydhO5SXDAEJ8jmnSYW8/c1UdmDR/WR0qUSU+vhOXtQVXkxdC+9VEUmGHpu3e1oV0teoA4HioroIpA5kvgUo3Lqa2LykQKGipVDZPNvH6m6F3lBav8LYXhf1e5PpOonoQt3z6anWpZv7OZ2d5+yVFjqe1safnS9MoWPNJdZry1O9Xo/VyQMXzWUKyMRFzVBHVTfZR8u4VzGGOVFXsvS2kudFocX1+2tBUmzNBq8i7o7a1bEe2+qRe4cmlCAfBn8hUUjN7rJVlYFAdesm9+BgEz7Rmw2nsYZ0KYY8V/BmnKOlPdvnswnpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rdo8utClRzl0ecSDE3k818vh7zQ7aEEYgb4p+VSd6OY=;
 b=HwMdZ2GqTwQZYIvMoTyNfkz+VLvyn4qcRxXnOeDCOQbISWpcDrWRlV4K/TUDptjY4xKxkckY8KZdLilPhe6VTxnI/SCj82J1xfFzU2sQ5vOXlrPzH41SIsby/c2I0ryhJ3Xwuo8EMLoPJznbM4xsqZCA6lpsMqtoJZZcd+lmDn+VDpX6YQeqSuCpwsOacGXTEsCDTJunFG4mzHVgP2BqUBNHL+R8rwh0Fc+bvK7x8r0KKvL0ImaXOAfZEGO+/7h9dLoSmpT13N53TIH5tdP7bnG//F5cwoVPDBBp64cRxwlmHLYLiGP7X44/OQKuFYoGSYD6xCvyOJ2AHGfxAMi2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rdo8utClRzl0ecSDE3k818vh7zQ7aEEYgb4p+VSd6OY=;
 b=5GWYl0/327z0qmiOsDIc3DbP8N5FL1eciUc2oIilXpaN+wR4soeKd5czPO60n1BBaqCCxXnnXvtSwr7IIMFy5fakyI/kh7lsq1C4g9ooznEqexn/Q0CmmA8FnYuAMPTpgz4d2ZioXsFiHctpUkhb14UUH2cEPI/yPbZnSlKoVn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 19:48:45 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 19:48:45 +0000
Message-ID: <f5d11dc3-327d-4e64-885e-a148cbb13a0a@amd.com>
Date: Thu, 13 Aug 2026 14:48:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 10/15] fs/resctrl: Reset the kernel-mode binding
 when an rdtgroup is removed
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
 <89a5b2cf3b727d04591d49775a88ba38be57a5f9.1783461016.git.babu.moger@amd.com>
 <d97f9c33-519b-49bc-996e-b73ef197953c@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <d97f9c33-519b-49bc-996e-b73ef197953c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:610:76::6) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a01f4d-0397-494f-5498-08def973e2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|6133799003|10067099003|4143699003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1nVXZLCdYSwq6uTyrIFgnQYUuH9HJTYn4Cz1RxtaVTBdswRpmToeeYZx/FZZ2M9t6mgabrx8IHieid3N0cUK6vywwUanCmM34G5fBO45RvJT1UqnXt3bkUlwChx96GeD2KkrGRMtML1lpgf0Qst1eRdLlrntrP3Ep2DL3LRn9az7oUHCsl5HHtLX/HtuN2r/3e+o4IOJ9hpeAz57Wia19QxcrOZa+MOKDhTB2kCVhvkPoW9lsGowESaEjaHmTyfF32+azcA+oCXaWPUL9uv9NCOyp+IY3j0aK1peP6amcZ/FWEmGARpnVe6+5cEAiWhFEhTMnRZGsoupnIB/u8Ktfb6VrvHaHGv2wGw0bPSZdSlsdBOOqNUCIjYnZbWF1umHSv9BjxuAtCdB2fvP+ryAAVjXOyNonF1Rdno0CvrmOugy2wgdVkH3qzTnJim0tDT9rDDv9kilo1hS+uQwBRWRra7RIsPS4jJpbD7kSYP1ZNpf6dBIP447qkvkRJficelumfJAgv4+LEBXxBfZr73dK3tGXdCHNHYuZ5gZm3EpAs4zS92DAMo20R3HSXuP2N5+3socitw9p1rUesaYCyKYf7mLdxBwyk7GFmzzOx9f5yz+R3JHn1cqz8YMJxJm27O6xZ0ziDM/lynUxU75sCjNb5lOsiJIyKz2HRo0Q+ydetA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlpGSmVuaGUySHZ3THVJaFN0UFcrcldFbFZ5cU9HejNGdHR0MWhOVlBpdGtQ?=
 =?utf-8?B?czg5eXJVKzFKaVpGRVlVampKR2pLRzNKbnhISzJaSXhkdFpMKytNcUdsaWx3?=
 =?utf-8?B?WXkwRlhoeXZ1OUJQRzZudU0xYU5KaTdiSS81ejhRenNMb29yVnU5MUVZUDYw?=
 =?utf-8?B?Z2tMdlh3T1pOYzYwYmFVOCthZE5ndGd2NDl0S2xiVWVodWI3UmZTQUQxTmUx?=
 =?utf-8?B?UjA2QWdiV3JsZ3VGV0dyNHhqSWp6SmVMTC9MYysxdWRSOGgrSlU1a3ZmYzdT?=
 =?utf-8?B?K3pCVldPUXZ4VnFPa2FUc2RNTVJxeGxxcHZRMmZNamU5NTlMTVA3cFZRWTVE?=
 =?utf-8?B?RjRWK3dOckFZVW02UlFUOXpOQjFqWC9aWExna2E5WStYQXNUUCtpazlmYlNY?=
 =?utf-8?B?ZHlJU2FGdi9YU0VDK1ZTUGNIZXB1emJNK3NHdVlxR3BqTDY0VU5OcWY0Yk1m?=
 =?utf-8?B?THIwOTNyY0RSZFFGMzY5TGFONG5nenpIa1MxVkwrU3FMZ1NpaFJtM0pVK0oy?=
 =?utf-8?B?czBMY0h4Y09nbFgycitDZE0ydmFMUWZva0toK2x4NmpxZTJxRHBpMVhhV0Ez?=
 =?utf-8?B?c1F1ZnRzTWprMlpYRjg0NXhudjVBNXEzdkkrVlp1NGkwWTcwUXlFcktWNDZu?=
 =?utf-8?B?R0xLK1RNaFZEdk5pdzRVeGlDbVJGYmJFbW9oSHJOTmhqWFlpRyt2Ny9UbENS?=
 =?utf-8?B?WDRSMHVZZEtNS0JwVDJMWE5udlZ3NkdjK0FVaUtwMGNSZGhhUDAxR3dadU4x?=
 =?utf-8?B?Ym1SQ0luN2x2NC9nUWVZN0ZxTUpMVWcyY3RyVkFwMzdnaGJaWFhZalFiS2p1?=
 =?utf-8?B?VDRjaGlQK2s4TlVRN1U5QzU3YlE1OGVPZE02K3kwQ1liWjI1UzloM2NqT2dE?=
 =?utf-8?B?L1BaZlF5U1BmREVHRFZkRCs1Z3BnRndGNk1kZXYrOFUxcVV4R2FxZzdJRUxY?=
 =?utf-8?B?NVJOQi9LU2h1Z1cvNFp2cnpJMVgxK2p3VkhzVmQ1NjNWaGErWTlBcGMvaEFD?=
 =?utf-8?B?Wkt5VVYrUVgzbWxSL25HWXJLM2d3c2lSRmJKQWhSMEc5bXRUdzE5amR2SDdL?=
 =?utf-8?B?REVmSk5QZGV4b2VjL1NPSFJ3LzcrQlBCdWdGQ1pVRlpCelpHaFd5a2lsNC9Q?=
 =?utf-8?B?YlFSZllGTkprMWc5OEJPL2VwZWJ3UzV0MkNJUmpjZ3RNNGlHbWJGSHN5ZjIz?=
 =?utf-8?B?bWVKMjRiWnIrYjdoZ1F2aHNBVjhlZno5YmpPT0JKRzlYeGNJaEY3SGE1UE4r?=
 =?utf-8?B?Z05tTC9zbTVTUkNOa0NkMllVdXlPZi85QUJFVStkdE5TSVdEampSS2NZb3lW?=
 =?utf-8?B?NVE2ZTJQM1Q2YXlmbXZ3V3FoanhHNFdkb3A1S0p2bTRUN0ZaS0FDMnkyV3Q4?=
 =?utf-8?B?ZE9qcHZYcG0wcjRaVTZOUmNsTHBOSUZqQk5MWFkwWWRuZ3F5TkFDejhXcnhX?=
 =?utf-8?B?ckNLRXdyMDdPdXVyVWpVbFB0R0tSa3N2a204YXFRVDNiQ0RaS01xSzhkVjdQ?=
 =?utf-8?B?RzRnNWJMSVR1SkM5U1ZsOHdSMEMzbVBhd2JTWlMyVERwaUxMeEdwcTVHT2R2?=
 =?utf-8?B?eS9qN0lsNkNkOVVSV0RnV1g4RUdxVG9DWUxTOVZFV09SNkhoVFFGdktzaVU2?=
 =?utf-8?B?Z3IwVlZ2OXY5dnhBQ2dFQUYyT1dmMUlpMFFaTStaZTRld3NjVGRQRFNhYnFn?=
 =?utf-8?B?eHBrWndqbmNZb1pjTndBK2lDaTJla2oxUitsclRXTVhRdlgwTmdtU1plZktr?=
 =?utf-8?B?dk9JclkyaGg4OE9yR0srUmVkVGhhei9vd00yRW5RSzdsaVI3ZzNoaE54Tkwv?=
 =?utf-8?B?MFo1STRYSTQ3cUF0VWdHWXJtdkdCYmRkT3p4YlY4WnpRVWx6ZHYzQkNYYnQ4?=
 =?utf-8?B?aWRjc3hxR3owK3FkNHdXemRVTUZ6dFRaN29PRmd6Tms2aVl4Nkt1THo2Ymdy?=
 =?utf-8?B?VHNwQzN0R0VHUVFWTGFhaEc3a3Myd0hyU09vR1ZKa2UxYzE1WVRKYy83a1BN?=
 =?utf-8?B?U2lLME1TbmlvaFdJMkVZSXdGb2xFcEdGUHZ2V1g4TGg4MmhySlFZYzJMY1dm?=
 =?utf-8?B?cWNuRENyMW00Qmx2c2JHMFBCZHBLTGJVWUVsVnNieXBwUjIwRStrUitJc0d6?=
 =?utf-8?B?QW5JRENYdVJLWlRBdDRkamEyQ09NRlplb2dWdzFJaGJnYzhuQnJXdEdiNG4w?=
 =?utf-8?B?dWxJdW5ZaEFISjJza2tPaUdrMVJ3TzZUUlFOemtSNVRCT21taDB4SncxaGNS?=
 =?utf-8?B?QkZucmRoL053aHRpSG0xeE91T3hmRlU3bVNUMGd5SDVHUVlUNTZpZTRpVFA0?=
 =?utf-8?Q?SAiw0cj8XjMWmE5Cr1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a01f4d-0397-494f-5498-08def973e2cd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:48:45.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHBJ8AReXkmlnXZMaFSPWXOEdNtTZGXLhE66RQ1LN85jPV8I/MlHHohy+dRPhXc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035

Hi Reinette,

On 8/10/26 22:29, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Resctrl keeps track of the rdtgroup backing the active global kernel-mode
>> policy, including the group's CPU mask used to program kernel-mode
>> associations.
>>
>> When that rdtgroup is deleted, resctrl must update both its internal state
>> and the hardware configuration associated with the group's kmode_cpu_mask.
> 
> Instead of updating the hardware configuration itself resctrl fs will request
> the underlying architecture to do so.

Yes. Sure.

> 
>> Introduce rdtgroup_config_kmode_reset() to disable the active kernel-mode
>> association for the bound group's CPU mask and to clear its kernel-mode
>> state. Invoke this helper from rdtgroup_kmode_detach(), and reset
>> resctrl_kcfg to INHERIT_CTRL_AND_MON. Ensure rdtgroup_kmode_detach() is
>> called during group removal and filesystem teardown, before the bound
>> rdtgroup is freed.
> 
> (Same comment as before - please do not describe the code details and write in
> imperative tone. Please check all changelogs.)

Ack.

> 
> I think it will be helpful to add reminder why "reset" call needs to
> include all the existing assignments. This could be part of resctrl fs "contract"
> with architecture on when and how it calls resctrl_arch_configure_kmode().

Sure.>
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v4: Re-wrote the changelog.
>>      Added the call free_all_child_rdtgrp() and rmdir_all_sub()
>>      Simplified the code comments.
>>
>> v3: New patch to handle the kernel_mode clean up.
>> ---
>>   fs/resctrl/rdtgroup.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 0d5c94169d03..21659fd75850 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1127,6 +1127,61 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +/**
>> + * rdtgroup_config_kmode_reset() - Tear down the kernel-mode binding on @rdtgrp
>> + * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
>> + *		May be %NULL when no group is currently bound, in which case
>> + *		this is a no-op.
>> + * @kmode:	Kernel-mode policy currently active on @rdtgrp.
>> + *
>> + * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
>> + */
>> +static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
> 
> So far the word "active" has been used a lot when referring to the "active"
> kernel mode. To complement this I think it will make this work easier to
> understand if this is renamed to rdtgroup_kmode_deactivate() and to match
> it rdtgroup_config_kmode() could be renamed to rdtgroup_kmode_activate()?

Sure.

> 
>> +					enum resctrl_kernel_mode kmode)
>> +{
>> +	bool assign_mon = false;
>> +
>> +	if (!rdtgrp)
>> +		return;
>> +
>> +	if (kmode == INHERIT_CTRL_AND_MON)
>> +		goto out_clear;
> 
> When kmode is INHERIT_CTRL_AND_MON then there should not be a resource group
> assigned so the work done at "out_clear" is not necessary?

Correct. Not required.

> 
>> +
>> +	if (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU)
>> +		assign_mon = true;
> 
> Could use the same assignment as resctrl_kmode_online_cpu() and kmode_cpus_write() ?

Sure.

Thanks
Babu
