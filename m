Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC04908C0;
	Thu, 13 Aug 2026 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637111; cv=fail; b=Oz/y6lFb46Z+UzNd0omdD/663LObiaIvIRgtO32bthcmmKmb0Bl/lcz/NVM5GuWZ/1UraRIq/om0CD+7pn00NXPL0rBYDuiNSEvE9gExBkFbXaafrpAEUlC9rBR15P/TILNbvTZkA8anGqhiSToihCosbTyGghwiCUEij8RW2os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637111; c=relaxed/simple;
	bh=wkYfV3PpZU+qdrFrM8bywj7WWpTSQ5CiwamLeJzD0Y0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OgMtMDWeud2MJqszMOz+CUR31rN4oozhZGZ6YI3TyBQoHiYDEyBL2IIRzx2aHB4PaMM3eWmku4KkbK3GEQtXG5tWjODY44NhSyCb/kLstcZUHNNe3vI8uJ55pJ3EPjo5nw8AiblQU++cmTwQ4maULeM3cnxmKjVGoVS6sqJl4FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xJw8KJ90; arc=fail smtp.client-ip=52.101.56.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xJw8KJ90"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P47yIrEc2HK7Ggbfx2snlm5Nlj0HF+s00vJdj5Xh0SiPqSsYdxmbgT+ujWKmqYhWng/giafoedbtgvL+tATWrjhA9BOMTSdDyjkg4qpUOr/oufD2jExZwgptWb/mq8oUiVAr06J9AhY8UIi7GVIIPwuto5TzkTNsagFsxpl0mJiMN/0wsr/SLH7f/4HyitT/AuIqn3CLhXwqefASu2u3pXrxO84vq7FLnsqJbHYucrX7ufhkPyC2b0olvtwnaZH7xnZjisDDbZ644DIIelP8H0TVxUtfSz72FAyEWr6YxrlLJlpPb81t5I3FxDDX8NIudzYLtI9uq59U72r9KZKxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuwfRNkniZgYSttdbyWekq6zo+VoGVNyOACnO0jdz0s=;
 b=WZeKLr/Vungw7Yps2M3RVmQgCAQ9x+tMJFtqBHA4g/EIkCZixvnElq4SWuraqYgRyI0CMZCvq6YU44wRJRJreeYXTxuDMUqSeH+C1iHyFl4sqhYzknbOM3AC8qI6+jsfuWc5n9g1zo/H2B4twxCLXdvlZYqoYoogzCcMVcD0wcipUrPht5WJoIGB7+p8cItVCe4G4l01frI9AdJZbHpq++anZzit5GeprVUd/923xbExuqs9hmFYQom6dUPEcOXfY9qcBqP1PLDsJIwzGnh9a3jRmbyag3sqVgdqyz7ZUN6B5AYVdjSNpU7rCLcjyFfRzGctbrWSHaz5RgVIyQ6GGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuwfRNkniZgYSttdbyWekq6zo+VoGVNyOACnO0jdz0s=;
 b=xJw8KJ90514wydpe8UG5P3RYKYA+hBfGwjgkSBgFr+0bfmuuRI+Viw2sTdTmgzzqNF58tBp4Rs9vfu1jZJUHQx7CU9V4jpj/ULn4rhj5HZKIa5FvoqM3cd9CdQaI2WEMqzBzoQedDN7aqS3p0oz14s59yrSrdgjwFSvFUELcqQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 16:05:02 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 16:05:02 +0000
Message-ID: <f85e440c-8de5-444d-a7aa-8f9c2a58bcff@amd.com>
Date: Thu, 13 Aug 2026 11:04:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 08/15] fs/resctrl: Add interface to display
 supported and active kernel-mode policy
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com,
 fenghuay@nvidia.com
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
 <c86c7a64f25171b773077ec47a20850b44f73ada.1783461016.git.babu.moger@amd.com>
 <328e237e-3d26-47c0-8167-8ffe5d765daf@intel.com>
 <924aedc6-c2dc-4c09-84d5-2bdf1370ab36@amd.com>
 <24adc700-2062-44d1-92f3-4bc18d134b8d@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <24adc700-2062-44d1-92f3-4bc18d134b8d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:5:330::14) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: b4959c72-8fef-4543-c238-08def954a1b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|921020|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mR4oi1E67k4BCRVnMPJbXoHWV229Jpnl81XA3yaZK93KKxXGxeM1+idegQQAXaBBi9Zx+YPsaGLYiotFTBQlxDsMaoFEHYJPQPsfvuQSYB72Xr4HUiVf9Zl2yT5ufZQG22PKPlGf1g3IXNMliAZ4SxUWo4Prv20EwUcqc+Ntn9wG8nbQH7fBsj9h5KkAZSpQjyTL3v/Hc0daY2sFJdJwZrADMR+t9tunELORERy/HuAy+F8tw6ysg+VB4uwdhlxLS/KJ/PzyLgeh48kN6DLGjF+j8h60Zu5w0WIYaBPS/evp8ZafBtPMOZ4tsC9kgqVF1UmLBl/d/dIhqa/e3bx42RfawVvBXytEusCaiEw1V8N6kWiR5oTXkhXexT2lR2VncJdCqWCnWE+ZoMT7x6g4Ct3qPOyfUyaOCR7BdWbwxcDdxsLmZe4xaewIBKzyfxUnyERgsuLBJIw80/t8zDlHzIYrDiXNt1+CxWW+wdbZEaBhmO+2ySalauDrRDlEvWfPHoMcLmakI8CRPli4h8NGMRF0l9y4U8wetDHvEK3/HN5OfFXWYyFVwEv5YTPPuvBef8E7hBWhT0E2sa2kpmY/7/eP2m1+WpAc23WHRAn0JK3XIt4CSLZrE+n6aXKeuQrtBl+5AaPVBZsol28IY/X5r1tAcy3h+SU36VBFAoy9Als45f9vw7NP3i31A7UlsaFJTSvA3PPdrl4r+jpySH7oMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(921020)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWp5SE9HK1JSNnNjV3BzR0tjNUNZcU02L3BHNmkzcU0zdWo1UFF6cFVrRUV6?=
 =?utf-8?B?TjhaYkFtQXVYOTFJV0V3OVZwcE9Pa2VPV0pjWjl5V1hWWVlvV3FhOUVKaE85?=
 =?utf-8?B?T1p2VDFLdDhnZFBQcEZ2UG9EZ01Ka21PTGZtRS9WN3VuV0pJT3NsbWdDVmVj?=
 =?utf-8?B?TEpsRUFlRUF5cHdCeExVNU1MSmxMS2R1VndtaCtZclN1cW9pVjRFc2FMUno3?=
 =?utf-8?B?R0hKV0xwajJIMGlvNXlnMlVUbW0zL0lGL1BzaEZnSDlGbHJRclM3clJkc3pW?=
 =?utf-8?B?L3o4aTFKa1ROKzN5TmZPNmQ2OFN2ejBJUTVPYk5hVWZGdUdWOVBYbmNYbkRt?=
 =?utf-8?B?dVRXWkt4MWxvYVhtcjJQaEpwaHJRZTVMVk9IYjdJbzVnUVdIZ2hDOXBpZWdw?=
 =?utf-8?B?NTgwZGw0Y1RmNE5XWk1qREtRYk9vb3NYd2pKc095dUhVVFQ0VSt3VTNsbCtr?=
 =?utf-8?B?cEdVY3MwWFpla0w1RGV5TGc5YnpUUzZkaWZWc1dnTnhZNEEwdXAwQmFkN3JU?=
 =?utf-8?B?ajZUSkJTd1h4TlhrYnZQQml5cFhKNWIvQzRRUW1uZDJtYkxxbGNuZnR0UExF?=
 =?utf-8?B?TS9ZKytrUUNrTmw1N0tacytjNndwcXhzMGxqT3VielBEUWVNZGRTVXdBVllY?=
 =?utf-8?B?VUtXM1lvVzljM1VvQVNPZEx1TEFTWUxUQVNRZnhMajM3VVlDWUJGYTIyWUhZ?=
 =?utf-8?B?dWQzN3NkUjBQSDgyN09DY2tVc0gxdWJxdGRkWEZNWUY0NXEvZDNWV1E3MzdR?=
 =?utf-8?B?d2ZpdjBYdUJUVFlaTjdZZEV0SUJOV21aa2MwMmNSaGhrUDJrek0vSkpZem1G?=
 =?utf-8?B?dDlnQjFsVnMrekRvUlVSR2xpMVF6aG9MUFZnbzY5Ni9OenF6NXF2N3c4dVh5?=
 =?utf-8?B?MTBzeHJPVjM2RXdBbW5JKzdVc001S2p6V1E2TDRFVWF2UkVIbkdlTXRuMldq?=
 =?utf-8?B?UVorMThVdzdkckpVY210OFVkZjhZVTZSRDRyYzB1R2hFdDVKSCt4SnhFRFhS?=
 =?utf-8?B?T1V5K0REa0VicHJ0bDkyS1Z1dVNGblhlK1d0bUtaQ0Nac3ZEY0hxTDBzM3Fa?=
 =?utf-8?B?ZWVZR0k0RmFQb2VZRndFVWJPdXNVc1FSUHpySTAxa2I0VlE4azA4d09keVgz?=
 =?utf-8?B?cVc0ZHcreGJRcGs2ZmoyTytCeWhHTlFmZDVmUXhtK0lqRjdJeG1vQ1JHc1ZD?=
 =?utf-8?B?cVVLVnRuMXdoU1k4MHVGdFZXRlNnRkdCcFdVaGJiSVBPMVJIRVpHN2JHV25w?=
 =?utf-8?B?UTBFd0pma2NLRVVEV2hRWDhMeWl4cnZlVmJ0NllVeW1uSmk1UVZTTFdrczhS?=
 =?utf-8?B?eUhpSEVNbVVRUGFEM2FjQXVJbytvZUtPRzd2SXU1dzFYS1p0RkVMU25JRmFX?=
 =?utf-8?B?TjVLOFVqZEIzeWpGcUFhR2tRelA3blhVNlpvSGNLc2xSeW1mUVc0S0NTYVp4?=
 =?utf-8?B?Yjk1VWNsSG8xTlMzdjZTTWRseWhPTWN3QlFFYkt6UEk3dkhrcndqdU9vbmRT?=
 =?utf-8?B?c09SZkFtMG45cEYrTmZzUE84RWt3K1czdlpDODdHQ2UyVW5jcEdhU3FOWnQ3?=
 =?utf-8?B?UXozOHpQNDU5S2x5NVdTY1laeHJWVXBYbkFMV0t1YnJuVVIxM1M4ZC9BeTNq?=
 =?utf-8?B?KzBuUGtQeGNia1NPVEZxbU90Z2R1Zm05SXlGWGpMVkFyVWVGQ3hFMXcyNG1t?=
 =?utf-8?B?TkNob1hIWSthQmxDQ1dKQnhEcllZUU0yd2hIVDZXb0JRZSt5cmhDcENQM0d4?=
 =?utf-8?B?QXE5OHcvYWpDY3VIaS92c1dOWTljcE1DandGYjZtc04rSHVYZjRjVFgxM2Ux?=
 =?utf-8?B?M3Y5YkxzcDdMK0tQdUFKMG1kbGJrdnU0OURoUldCMHdVNThLQ3l1bTJNODhG?=
 =?utf-8?B?VjBMR0FQVHJDcFJmN0tnQnpEc2tWRDlWZEdXQmNNcGYrZFJ4TWZyTWFVd2I3?=
 =?utf-8?B?eWp4cGNhaFhkY1NXbW9wNkJiL3NvcHBETy9NdGd6NkpGTk1iUGZWeXhFQTE5?=
 =?utf-8?B?ZWt4TUprWDFPMUYvdUIwYlNxNDNpci9xZ2loQmJFem1lUFRoYmgreGNnaGdH?=
 =?utf-8?B?Nng4SHFTdEtpM3Q0YjM4THpCbjdWV01WbjBvU2ZPcnBJenFnSUhnSTV0QSt1?=
 =?utf-8?B?OVVUU2VNOVU0ZUR1MXltUGFHUm5DZ05PKzloQUpzZ04wQkJEUGVpdTRaQlEz?=
 =?utf-8?B?bCt4NTJiamczZ09IazQ4ZUU4YzFzNjF3ZU84cjBUVmZsNDVkYjROYTZEZ1FQ?=
 =?utf-8?B?dzZ5UXhZYUJvNUxLMzg5SkV2VG85Ukp1OWxvQmhidEIzcFVIUW5nbnBWYmQ2?=
 =?utf-8?Q?R71dbJH9InyH8FkYBX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4959c72-8fef-4543-c238-08def954a1b5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:05:02.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+5uCTtkpud6OP5gIu6rfhmEVO0iajSvDqaOy9y2uGyD74cfNv4F6+VWaaylOCZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

Hi Reinette,

On 8/12/26 18:38, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/12/26 3:57 PM, Moger, Babu wrote:
>> On 8/10/2026 10:18 PM, Reinette Chatre wrote:
>>> On 7/7/26 2:50 PM, Babu Moger wrote:
> 
> ...
> 
>>>> +         */
>>>> +        rdtgrp = resctrl_kcfg.k_rdtgrp;
>>>> +        if (!rdtgrp) {
>>>> +            ret = -ENOENT;
>>>> +            goto out_unlock;
>>>
>>> If this fails there needs to be content in last_cmd_status. Otherwise this
>>> fails and then last_cmd_status reads "ok" or worse .. an old failure message.
>>
>> if (WARN_ON(!rdtgrp)) {
>>      rdt_last_cmd_puts("Invalid kernel mode group\n");
>>      ret = -ENOENT;
>>      goto out_unlock;
>> }
> It is not clear to me why the WARN_ON() was added. Is the resource group not being
> associated with kernel mode not a legitimate scenario if the kernel mode group was
> re-assigned while the reader of this file was blocked on the mutex?
> 
A valid group is required whenever any global mode is enabled. Reaching 
this condition without one is unexpected and should be treated as a bug.

To help catch this, I added a WARN_ON() to log the issue. I think 
updating last_cmd_status is reasonable as well and should provide the 
necessary user-visible error indication.

thanks
Babu

