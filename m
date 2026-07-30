Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214A3B6346;
	Thu, 30 Jul 2026 21:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445204; cv=fail; b=MM57hc09F6Js8mr/BbZfOeXz70kJLffhZUyBV6A2XVsVDbL3pecf1e2kGDf+D01Ym9LJC7BTUiJ9HV5T9v/0DEfsvKcnYoEpt6mdHL66l4JihyVw9qu/lhYGA6uiCo8yn5+g7eAQpFVdmFc7zxar8U2J4YWpEuK9wlfXT3SjjnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445204; c=relaxed/simple;
	bh=NkOwRdnHMzOOFCVMa6iQQ2wuDjcI0ySCB3j+OTwc1Hg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W7EuNJnkrsUH78SW5jonKGTrhKwew44HjHUAM4H1TC7+PSxyHbOyR9oD0X6gP7Y0u2dUzsHynq3k8prkB/OlM0izdEuJzrZE75FATZmkuxwHvLcaOxFP5vbU721ZpaoUvkheGlEQMIoqcdUYAcBEAnZEYn1vb4YCR/vGsJOSNMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tGrqUdD0; arc=fail smtp.client-ip=52.101.48.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tGrqUdD0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abw7RgSi7hq8ddGTeVGs2ZganwiyEdS1OKV1jzFWq8TZVHvEdcvWAXYx9BJXl2YlvFtHZsqxSRccs+0k4BQlGVS6/Qo+2tCVt92HUBJ2QUHpiPYHmc5Uip8mytbvyTBoT9jYNYc/69XleOSYqakgbdq0wkbt0Eg3DCjWCfdi30jvduOmgEi9hGJ/qGmL2tdLhuMJ+uTl6V0DtmC7/9ywP7LzalYYsV2iBIgAcjMqZR9M1mGbGbFATJMwe7yP430i/C58PJ3N5LUHDQb0KYb9hlpOcMx/TwMO+V36yQCu0d6kNjbv/KW+v7bina2zmSzhorFeDH1+VHw9Hc6RgHIZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHh4MLuZ9Y/ONS3HA1SAYupIvsIfpL+xqcyRzYCuEn4=;
 b=fhW5qOtY7952olI91LW5V6DSLKYVMjy/Qr0I1ThQFIziK1m6L92tGczfj4bm6r/tF79J6fDo1iCpSsWvTzOWV4EINuA9RAv6JiWDNpJWHadXX8kB2/eJ4m4WCwNsGD8jAEVRCCCr51ThdUN9DC4LAnHH9Aqn9otfW0s3qpIwdNWIMO/7WkqPqT/084HHYvEgGgkcG6Mcq+FvwmKk1uU6KSuZUfi94BUFnbWq+LwkDUT/52GmAzh8gCzj8aiKDhL2auBDl1OAhv30YqDt9QkzCa2P8yENu+jmfjyn6R8h1IuRc4SbefZ8Cw3UBDH0R62hblKPjAfTFc02Sj6zYMlbrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHh4MLuZ9Y/ONS3HA1SAYupIvsIfpL+xqcyRzYCuEn4=;
 b=tGrqUdD0AG+J1NP4DSg3+c7rc9IdF4v3vSSQO8N7URf5KJcMkzh027yTTG9jk7mzdaAwEl8Ck9zVyR9OeRHNza+5kw6MSf7p61R3m+xlRX9EUqYEdPLWJMOZPoumrKp0MTMaWIs0Afj6qBTMejsOnnaRxTvefXRWCOM888ISCfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 20:59:58 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 20:59:58 +0000
Message-ID: <dee1a4fd-a5f4-4fb4-9bf6-31ca013d6843@amd.com>
Date: Thu, 30 Jul 2026 15:59:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: "Moger, Babu" <bmoger@amd.com>,
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "Dave.Martin@arm.com"
 <Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:806:d0::29) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 16430e97-6798-407f-d714-08deee7d83a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|3023799007|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sDXeJtntrvV8+t+KcIk4oqOIkb+Tmv7bUrkDkEU8Sz+Mgy10/r7vpiFfUS6d3xJXSb5QhLtyhMr8BRCTfUz+Osr8NE6zP1Wl0GdByoFZ7g6ZjPza/BtMTNmD6HFvBEsfu78b8tbmb+M8HHJb0n9I91M82Au8afctPQaAhXQ3Zf0psM8oyv2NL2y1w0O8Pz73cFD0EpX99eVImR9TEScV4islCTU/opZAOWb45cGSapuNeFTrv95DC94tunlUDCpylW+czjYNU5PY7DbcqwypgFZvouxqUqe+O9iU/tKJAOLOCA0OCYGCzluAdxYBOJhdB1u6uVN9K6+Qzf1GcEt2Jb1r2aiLlEtNtPfA4b2+MObDTvExu5Hihmaf/zCiLLZmjZ00XLvVof24y+kgVwCBmlx3oIpGinCltuaC9V35QIssA6g0jloScO0F1sTPXiLFqv8eLq4PQcOSRJx0d2qwrsW+gpDwRX2DDBvhCRt3kL+EET4KfKuOHvX8aedj/wkn+D6ZQ2qy9dLwufQVXpOPPXS33e2/diNVm9Rp88XErRJhK6AJV+BDb2okGUX/PijDuaE+UiUzWefyqp1WLN4gx/2BGfSC+rX+stPCEXLoOzBC7+iKLInLE12VWxFyQjG12L5AcFsc6CKCG4zWY+S3Njxgeiq9qRxlsJwKbBSbUDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(3023799007)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2djZ2t5bXJOc2JRcnFqc2pJbWprMmVtTGVwNEZqRDlKNlRzeHlOSVF0MmRv?=
 =?utf-8?B?RXpNTE5SMWhhVTdiU0orNUFmSU9WR3R3Tm00bWpEM1dSeUhRWXMzUkQwZ1Rh?=
 =?utf-8?B?aXVuNWFUNE9NTEFManBNVWZKcmh1VTF0VUR6bWNIcWVBYnBGR2ovY1dHZjRT?=
 =?utf-8?B?ekQvVkhQby9sVzRvL1dOMTllNUwvTzJ4ekd0SndaNi9DWlorNWZQMC9iVU5q?=
 =?utf-8?B?eU5raXR2Wm5HMFJDOWJMalZ3bzFWWkgwUnJGcWtIcEJ3SXR5ZUZGbk9HeVF0?=
 =?utf-8?B?SnJocnpwMUpYVm0rNHZHQzNOUGZiREF2OWEwMFB3L2RzM2tNUy85amhKNWtT?=
 =?utf-8?B?VFRZb1UzaU5mS3MveXFucWVJNXU0aUNLblNaRnVETXFHL0F0YUpNcldoTnJo?=
 =?utf-8?B?bzAxcGZXN1BDVERxdnJvMnJ4ZjdYZDJZd3RUZTZOSEI4NDV0djV4RThOVVJ4?=
 =?utf-8?B?NW1jZDF0aWkzT2ZjdUQyNGUwalBSeVFvSnpqU2M4NWU0Z0JwQ29hbzJHTits?=
 =?utf-8?B?WHBpd25MSTRjcDV1b2ZYR0l6b0U5KzUvY1RBQXJuaTBNQkZacVRYZmdMNUVp?=
 =?utf-8?B?dFBIbkJSRGZZa0taVnBZbmlOT1FISlhnbDZXSk9TRklPYlNZV3k3ZVZSNUhr?=
 =?utf-8?B?Z0U2bVhLYmRXVnJJSDBaeXF0dVpBVTNpNlpDTWFBZGQ4ZTVQQm1WM3VxT21W?=
 =?utf-8?B?OWRGcW8xc0tMaCtuSlg2Mnp2V2pWU1I0Y3BwYjNUTkpsNnJJVHRpSkFFSWNz?=
 =?utf-8?B?ZlhiT2phQ0JWRGZZdEl2ZHF4T0sraDdET2Z1dktxRElzWWFGMVJGZEVaWml5?=
 =?utf-8?B?Qi96WXJyUTVrd3RHcEZ3b1U2dUM0aXo4OFgxcW9yVWVjZ0FJVlJGSzlOVlho?=
 =?utf-8?B?YmxRc05XdHc4NG83WTBPMFEvM1U5NUhHTjB4cFN2UGhYbEN4MnNDZmM2a09w?=
 =?utf-8?B?eEliTXNRbFNwNms5TEtVcHhnRXpta0pGWVc4SVB0UmJZbk1vcHVTS0RmT1Vn?=
 =?utf-8?B?bEpobWxvWVVVL01YcStYK0E3ZzVBM29hU0Z5MTREandQcVpnVE5PMGdhM1Nl?=
 =?utf-8?B?ZmR4dHk5UEk5WHBRS1JWbjhCSG5tRVRzYVFGVWl2dTFhemFFR1NtNzg2M2to?=
 =?utf-8?B?VTZ0QWlZSnhKZ2xZcVJFR3VLZ1FOQ2s5dlBSNDJnUWlHWnRqT3BhSDE5aysr?=
 =?utf-8?B?RkVXbnZpOHdrcnAwMUs3YWE1VzJERUw2RTVoTFBYWlVNbEp3S1JrRXUrL2o4?=
 =?utf-8?B?SmU5VDhRejRSbW5USlNveEk1WGxaSVQxMU1IeDJOdTE3YUtFYy9zaUtqZjFK?=
 =?utf-8?B?STZCeTE1YnV3RW5icFFNaXJBZ3dyUXVDNi9BYmpMWm55NzdpeDAyNWNLcGpM?=
 =?utf-8?B?QXlkRFRZelRpdU1kTVFHd2ZsWmNYK0doTUZjWTI0L3lrbTA1S2VQb1JvRytT?=
 =?utf-8?B?RE80OTFVWjliZlVTRy85VWNXS3BrR2IrR2ZpQTE4VEFYV2VjRGNrSENtMFFm?=
 =?utf-8?B?eTNQaTdCeFY5UVJOMER0YWgzRTVaZUQ4RUF2WisybEU2OE1QanorRldPSER3?=
 =?utf-8?B?NUR6R28rODRRZURIdUNackUrQzJqa2Z6a1lHU3ZPUzZyclNGT0lRVjlsSEcz?=
 =?utf-8?B?SnNJVVJGdGo3R3pPUG5ybmlDeVJUTmkvbmt6VlVMUzdOOVFhNjU1d1U1cTlR?=
 =?utf-8?B?ZlpGUmhQSzBSYk9hTVR5Z3hkYjBycGc5ZzFGZFdkMXRwMDJEZUthWkh1cGg5?=
 =?utf-8?B?TVRBRkhxMDduZ3N3S3FncnA5SUVQS1dpa1RodEowaHVXTTdNSFdrQ2c0T0Vh?=
 =?utf-8?B?MFR0NWVFditCbEFnSjFkVkUvbzRVREdkbVFkTGpnellzWmNVUS9sY3ArL0Ew?=
 =?utf-8?B?L1pCbng2T0dvSGxFVG95MGJ5Q3NpaVBpaGFuWVRidHpiSE1NVGJleVBTV3Y2?=
 =?utf-8?B?cUpIeGlyc0gxNmpvOUpsTGd0cWRjRS9IUUplQWt2QkFqRXZ6ZDZBVDVJRWFC?=
 =?utf-8?B?WWhBaVdGVC96Wm5nL05sMkVLMmQ1NHVGRnYwRmtTNS80SVFBZ0VWYVBtUTcz?=
 =?utf-8?B?aG1zVnluZDVjV09tR1AyTWplN3FFZnJqSmF1R05nRzU1T0x6aGhmYWhNUWNS?=
 =?utf-8?B?V0ZCdEVOQnFvaGNwRVl1N3hpSWROb1I1NFpPQmJ1YXZEa1h5UC9BMjQzbExv?=
 =?utf-8?B?OHFxNUJyay9mOWxtWTBicW9PUWtha2d6UWlzZHlRUHhjWXZTTFB0MXFxekYz?=
 =?utf-8?B?NjJSa1hYR0s4S1BnWEJsMGNUdEtXa2YwT3BlTXFjMHZha2FrL0lBd0UzcjF2?=
 =?utf-8?Q?2QqwkZYnO5OydT293Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16430e97-6798-407f-d714-08deee7d83a5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 20:59:58.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKHue4Buw/yJ0tzwvnQDCpkc6Z3f4Cgu3n4UYbKdiMGrA86qtx0rEH4Z88ft2G1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491

Hi Tony,

On 7/30/26 15:40, Luck, Tony wrote:
>> In either case, creating more monitoring groups than available counters can
>> lead to innacuracies during measurement.
> 
> Is that magic "64" enumerated anywhere? Or are users expected to just know it somehow (or find out
> the hard way when they get odd results when using more than 64 RMIDs).
> 
This number is not visible to the user. That has been a problem with 
this mode.

Thanks
Babu
