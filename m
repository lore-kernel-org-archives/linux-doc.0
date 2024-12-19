Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728A5FDA7;
	Thu, 19 Dec 2024 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645842; cv=fail; b=oqcABNyE/k0/RZ3ObdhZ6mMhBMAU4E6irh5O9A53qIcLRtKnUUhje82SlcGtFVX0LwJj11MRLHMWXwdHl+0oixPkmGNAUh5+Mz3Vd5CwDiCpe8TFcd+S89crsQcmtgpq0TGVVzjo8OQ6f2iMtOQ0Zp7XD5zbupTXfhyWedj0tH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645842; c=relaxed/simple;
	bh=gqTqgR3NTNZiv4eHdYKqB9bzsbYHmnzVPnR3e3M5tf0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YsAPvKKPvfihbQUEYEQQw9B1PeGanWzfUK0FRWnbRivARGlVrol3Zqx1SOjy8FO1WnnCG5agECSTw9bF/EbOzOJ1ptykYiY7tXocf4oIQEF1VVqgxImjReEV+3jMzmppKDi/4+/uxImaf3keNnMUiQNvxfVwju0YvVP6ZsYMM64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2d/P1WU; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2d/P1WU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734645840; x=1766181840;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gqTqgR3NTNZiv4eHdYKqB9bzsbYHmnzVPnR3e3M5tf0=;
  b=D2d/P1WUvWYjSpc8q6i3FzIqDa28GfxgYwKv8TloeH8XJuSxKFaS7SXw
   gi8VI258cQvGHAPkdN6GA6U3DNwIq8bkDiBXrSOK/6475PBYwI2jI6K4a
   gxs2I8uy8RZluvJel3XVTcsEHa72n0KRFmjEKQciw/OCvxrbql+g0lv01
   ol+/7tq51xOsHL0Ibbg+umF8RnEqg4dXuJ/8b0vedVqVGnQbmeM2etPmG
   at3vOiBDGikJv2ZkA3/cImj9JIkpjFCRFB7KelpH5kI6HTTw5zzorxz9Q
   mMPsQw3guo1/yWzl7dSJQ2fP8O/OdYWQeaBkq8TulEKOpD4kaIGFSr0BB
   Q==;
X-CSE-ConnectionGUID: nfHYhBMaQjqVs2rO7se3Dg==
X-CSE-MsgGUID: aSgqcPLeSD6uMRo1sXD2VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45868723"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="45868723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:03:55 -0800
X-CSE-ConnectionGUID: 5krglxdpRKah7snXHK8LRQ==
X-CSE-MsgGUID: Cc9SVGYNSEyxQXujZC/JyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102941223"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 14:03:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 14:03:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 14:03:48 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 14:03:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJA+7l3y6d9KJPZ/qq7B1sMl+xXhAfbPRPcKcrT8T+HaZP2JcCTtolk0JFCvAv+Tno5TX4yrOKCa1ZZO1x6iuGfVSWsk09roRDGHq9QrwG3XKWLZ3PPg5uIuTwTD5VqDeKA8SGiwqILr1wf901Ey4lqDg5o1ON//dx7/boAF8ySJDFzBi63z+TXgbCFwEKHvsNsseZBn2jF+Z+ZmJwiaD8xMiVNLgLvzNZ0tZdmpyJjdadKDrXBm7ZDdp8feo6tTQylnxHz39kM5RxSuznsA4uOfAcknZ5JUY7nKGGNkQ5NWMffSBMUGcyVNyN1YELGMTQxVLm8eAhB+VO8KaQxWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tW5s6GDdi3Q7AaLNo50w6GBaComJFwQUFFjmf1Xpvg=;
 b=ei+MjmjgoOVb2Ud8d240odT8ZpRzmxKOBsGLo9ZviCMwiRy1BAD15beYusOmu62MvWDT1xtTY7BqCqfKUuCciAa0YZp9IJwb7NzWQwSvZ33UhhBe0zbp40yTq43A+n5BlGQbf82NLWeebUxYLMIHA5HWMHfiSQNUHH1EOPNU6pIDK9Bm35Am8YIJvftrHjBIDDGaHrlX6kFd0XxtkgRbm4NZw5/YQISp7+7tHdwPX35yEkPaRoNZ7NkGCMSxeeqgKwCpodHLag9fpF1UBnhKPIqZ/EyhYjuTFpnVDNvcNLG/rfPJByX7CkWqoMkyPhoCsxvIE5VtMEceofSXAR7O5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB7995.namprd11.prod.outlook.com (2603:10b6:806:2e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Thu, 19 Dec
 2024 22:03:40 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:03:40 +0000
Message-ID: <a1672556-5771-493c-930f-749d721b73df@intel.com>
Date: Thu, 19 Dec 2024 14:03:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/24] x86/resctrl: Introduce interface to display
 number of monitoring counters
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <andipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <5aead3f35b7799239b8f9952675b4435f6e7644a.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5aead3f35b7799239b8f9952675b4435f6e7644a.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f71f11-53dc-4261-da3e-08dd2078fee7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0Z2SEx6OFBWanRIRnNQNGZCZXN5UVo2TzBiMTVqemYzanVCSHp0dHFLRjdG?=
 =?utf-8?B?L1Q1L2l2Nld1Vno1WGRmZ0NPcTQ0amNaeXoyL0d5YzFseStqajVRTk5GVGlB?=
 =?utf-8?B?Qk85Qld2bHN2cWs5M2pWSDBuY25zNnlpSzNUWGtmbHM3Y2xXamQ1enl3NXRB?=
 =?utf-8?B?M3VudXBoQ2tjYkh6dmsrakJBWGowRU5zUm9WemdDMjg2bk90MGt0K2hYWGt1?=
 =?utf-8?B?RXpTd3l0T1lHeEZlV2JPdWtpWXNReVVCNlZMZGpzK1Rmc1J0MFRHbnl1YlR1?=
 =?utf-8?B?alBpR3RHWXk2Vk8xR0svV2ZvdVVPRUhyUkcwRkpoQVp0VXpyNzJZUEhDMW04?=
 =?utf-8?B?TTlOVjE3S3M5OExUK2VSOWgwcGJZT0I3ZWkyeVpCREhXaHFVQ2xVQ3hsd2pV?=
 =?utf-8?B?UENxVVdMMUFUa3VqbTFITWtZSzRvLzNVZFFmYk12VGVFTFlsV2JleUZnc0hX?=
 =?utf-8?B?bmoyNTEyTWUwU0poS2JDbGdodWQxdkQvUDJhak5DRm01WjlIQy82MWdVK0Yx?=
 =?utf-8?B?VVJNSTVVZlB0SEFkT3cvTXJleGJXZmkwMUlkS2d5OXZXbVpaNlpKRXpQYnE2?=
 =?utf-8?B?TXRDTERJWGw4UlZMTXNCWEdFQnRVbnAxVlptV1lKeVdXTXcyeTA3anVOVXNM?=
 =?utf-8?B?Y3h1ODhLRXhxQTJQY2gweU1xVm03amZ2NFNDb3RvaW05KytDSkVwaXN4SHhQ?=
 =?utf-8?B?SU9MditXc0s0MithSDBodHJock01SEhDK2J3T2JjcTM2MUwwN0tlY1NoNTVF?=
 =?utf-8?B?OXV0czZEbFJ1YW1zRlpudUlyU1dZdk1IWFJoZFFlV2xaYm9uSnkvUWJGWWRa?=
 =?utf-8?B?S1dubXVLdVU4OTc4eEJsL21wMnlHZ244SllpZGtHdW5PTTl0Q0F2d3JESHFI?=
 =?utf-8?B?R09icEt0TGRTOEhiWm1GN1A5OS95NjZBZ1N3TmRJTjMrWkZ3Kzk3OVdmdCtz?=
 =?utf-8?B?S2dCYlE1QmlXL1ZhZzBpaEZtRkViV3F6aTM5c3JPWEgzVFBCdmZmTGlPZ2l5?=
 =?utf-8?B?cFJjV0dsQm8vZW4yWlBaNnJwUW9zcmM2ZzY1bE5sb09nVFdXS3ZwZ1Y0aUR0?=
 =?utf-8?B?UmZvblpnOWV1MDhQK3VSVHQ1c0pKbjZmazRVTkM3NE83blU1eUpXMVYwdDRZ?=
 =?utf-8?B?VlFrdDVwS0tNOVVVdTZlenNLTENmU0xTVitpeEhUcS9Fc3kvbHFTTnpCYS92?=
 =?utf-8?B?WWZzd3A2RVBRek5FWEJOTGREZEppNERFRDhVZEdLWUlvNWFqMEFYZ0RjOU5o?=
 =?utf-8?B?SUF6cWdmeWRvRFRUSVlQaGVYZ21MTjBxWVBpVlhmMUxVbHIzc0NhdmZmdk8z?=
 =?utf-8?B?R3N0K3A2WEpuRFpCNzM3Sm1aa1RxNisxalZOUmNsSXo0a1NmaHNGSmV2QXh5?=
 =?utf-8?B?cXo2QnYxdGxJUEMxeGlzcGJldFlFenBNR3BsVWc1WS8wc2JSRU9oUHU3a3lq?=
 =?utf-8?B?MVdGdGxwRVdGYzhNVmNWaVpqRkJTOXJ0ekpaRkpkanNINm1ubUs0cWRFeis5?=
 =?utf-8?B?S1B5M3JLbEg1bElkSWU0UGVxZDNsSE42c2xMbXZMUEhSdmpGU0lQVVF4MG5G?=
 =?utf-8?B?S3hIQUV4R0J5MmdMTWpMbk1ERDVYQzNqSkcvOGFtKzRaWjgvcGk4K1lIaXFw?=
 =?utf-8?B?WENWZjJuUjY1MWNIR2RIOUk1eXg1ck9jWUUzSkJkMEg1azNDdnNJT0NaQk02?=
 =?utf-8?B?dGZKT1hYaU9aSjBTd00vQjBaYWRNTlVPNVhpNWIxdEJacEVMOHJaTWkwL3hT?=
 =?utf-8?B?RUs4aUJOU1VWaDhHYnQ0S2xRSm5Mc2F1OWhBL3RCNFFaSDlaZm5jT3hocDBK?=
 =?utf-8?B?S3J2c2lhUjFMd0RyU0JjQStkbGw5WlYzY3hDOGFraXBMWUM2MW9WeHBCWjIr?=
 =?utf-8?Q?5zasoOA3nlwN0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXYyM0hDbll3QlJpUmFaeUw2QXpFTG1FbU5XOTBOUU1pUDhFTm52SEJQOWYw?=
 =?utf-8?B?cTdLWnpLSGVxb05LbVVRYmtjcGM3R21vSEkzVlRLaFlHK1JCR1I2SjkvVW13?=
 =?utf-8?B?aFNrME9FZEdrclFna3NCZWNaNHduM205R3d5azYxaG80Z1d3cWwzd0pTNm56?=
 =?utf-8?B?S3FOVWVYUFZUYlhNYnBOZHBUdGRDYks0RUMxVjV4M3V0YVlBWU8yaTFxYk1T?=
 =?utf-8?B?OW5teEFKRWw4OGFNd25pVllTRE8wZXIwZWpCQXhZWW00elQxRXc3Uk1YYXd6?=
 =?utf-8?B?dU9BdnNldVMraFhLbllaVjh5UXpacVUrdTRuUnh6UGI4SkhSQXlKb1VmNjBp?=
 =?utf-8?B?NWlqRlAxM2k4bkFXN1N6ZEswWjYvcFlJTjZ6L2ZrNnI1NTBBSXRDajI0V085?=
 =?utf-8?B?U094TDM3U0YwS25oMU8rb1FuSlBKdEN6ZjJ6RElXUjV3bXYrUFBCY2xBbTB6?=
 =?utf-8?B?SG1pWXIwQ04zblBBdFNNWG9XbEFlVW90K0pxN2VmUHZyUFI4QjI5ZWJETFJT?=
 =?utf-8?B?RHRoMVdTa1NmVUZ0QmxxUEp3cW9iNFlKbnAyaVA4YnMxendBcWFLQmpvUzU1?=
 =?utf-8?B?c3VUdEFHbnV2WDNrSzU5NjVyUE53N2M5YVdLL3N1NWNyV1pObWkveWUzR0hr?=
 =?utf-8?B?MWttNTd2d3djaEdmVzNmNEJVUFYwS2Y2eCt6QjNLMUdCYUhGcFFOU1k3RmxP?=
 =?utf-8?B?djdZRkxOK3o1aGNIU1RoaGJmbE5ZREt1NzFZczF0VVk2UTBCUFdWUk9DS0Qv?=
 =?utf-8?B?aTkxaFgrOFNTTWJpczhHckE1eE5OK1F5ZzRrTTdZa3VBTGZuZk9EWkdKaGVW?=
 =?utf-8?B?ZkdOd3p1cDJXeThLWlVOT3MvcTFVbWNRdFc5TDN6RmFoSnBEeDdaZHUzQndJ?=
 =?utf-8?B?dmJ1Z0JNd29FRlZrQmU0Z1ZsZVpjaTNxU2p0aDhua3h1WXhjaTJuR1BJcnQz?=
 =?utf-8?B?bG4rbE9KRVNiU0RIeXcxeDNsaWpaZGlXc2F2VXhWeE0yWjFRbFpSRmxocW1w?=
 =?utf-8?B?bDBydzZjbEl2bUV2aHgxd0ZtRDZ3OVlCVEdXSUhGTHFkeEwyTFcvcjA0aFJM?=
 =?utf-8?B?SXBTbnR4WUROa0ZzOThHd09XUFBvK3lzNkxSd3FwY0VFSkZ4QUw1Wm9QNk5Y?=
 =?utf-8?B?TlkyZDNFNlR3R1pac0JiSzczOVBydjdHUWxnTU9yMHV5UGFCcm02TzdzWnJl?=
 =?utf-8?B?ZkJpZGhnRTg5NG8xYTNNREh1M1dJT01lSUhRdFhHNlhCK1d6Rmh3L1oxa0xt?=
 =?utf-8?B?YW5URHlvVjZBK3N6Y3BORXJFZElDem5zTkcvZzAyMVJLd3NOeE1lRzRxUW80?=
 =?utf-8?B?c2h1Q2JEQnJIMjNTM3d2eGtaSkRJbEhVaHd0UDNIOWFMNWNtaUd2eC9TMEw5?=
 =?utf-8?B?aXlaZjRQQmE0bHJCcDJjZDBCTS9tU0VzWGdsQ1QxWGdjbmRwUktPMTg2NTBH?=
 =?utf-8?B?aitZeFRNOXhPOTBSeTFVZmNNaFdrb0xBSDdrbHRJMTBGNXhZSXZWczJQUGlQ?=
 =?utf-8?B?MUE2R1FtMXhjaG5mSmI0RkFVUVpaZUxSN0RXRWw1ZEJhcGFsYnlUUlRFZjNZ?=
 =?utf-8?B?ZndraE9EY1RNdStxTzA4ZVk3U2RJL3pwU2llenVEMExFWFl2K0MvZGZiZjU5?=
 =?utf-8?B?anY2N3o3RW5RSTdJT0tTTEo4Y1RIRG9FN3Vvemovb1VSMWdtZWZ1aTVaNDBy?=
 =?utf-8?B?MVg2NVd5aWxXUFVhL21oNXhLSGdSRS95ZFFVWUdWQ1oxNjR1aENFdllUSmp6?=
 =?utf-8?B?UzdZM3J3ckpwL0JtRGZrTmorMlk0by8wRmkrWkhMSnpOOHRtSXhSVnUwYS9C?=
 =?utf-8?B?ZEs3QllUTmpERUdrb1kvVnE0aEdsckp3Y3E2NzZ1bjZOY1NCb0M3NnB0RTR6?=
 =?utf-8?B?YjRpQ3pRcUtPeXBBcTdkTXloMXpzQXVtRW9sM2VwOXpGZ2JsblFYaWU3SSt4?=
 =?utf-8?B?Z2VEVUtaTmJFQzBYQXltQmEyU0NrcFAyUmJnc2R1bFpXS1F5ZGJNb2VFdisv?=
 =?utf-8?B?NENjazF4eGR2YkxXenV3by9IRHQvMWtVUEZWMGhRRmkvRytiQVNRZHZGeG5W?=
 =?utf-8?B?dTNDY1ZiYWRmNjZwdjNBdEpjL1l5Nkp2ZGtHczFId0lMT2FxK3JoQUR4Rmhk?=
 =?utf-8?B?MnE2aVdVcE9MZG10eFZHNElpWDN2ay90TEtsQjBGQ1JNMS95YWgwYzZkM01M?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f71f11-53dc-4261-da3e-08dd2078fee7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:03:40.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUENc3TxZ+5xzzsLm8jTOLstGnDOLDrRvYvTJvJAhexHEp5xAhJdycYyuI7A1cihFlY2nwrrgfPrfDOmnbutgVe+Gr69WahIN4d3CkeinUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7995
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> The mbm_cntr_assign mode provides an option to the user to assign a
> counter to an RMID, event pair and monitor the bandwidth as long as
> the counter is assigned. Number of assignments depend on number of
> monitoring counters available.
> 
> Provide the interface to display the number of monitoring counters
> supported. The interface file 'num_mbm_cntrs' is available when an
> architecture supports mbm_cntr_assign mode.

How about: "The resctrl file 'num_mbm_cntrs' is visible to user space
when the system supports mbm_cntr_assign mode." ?

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v10: No changes.
> 
> v9: Updated user document based on the comments.
>     Will add a new file available_mbm_cntrs later in the series.
> 
> v8: Commit message update and documentation update.
> 
> v7: Minor commit log text changes.
> 
> v6: No changes.
> 
> v5: Changed the display name from num_cntrs to num_mbm_cntrs.
>     Updated the commit message.
>     Moved the patch after mbm_mode is introduced.
> 
> v4: Changed the counter name to num_cntrs. And few text changes.
> 
> v3: Changed the field name to mbm_assign_cntrs.
> 
> v2: Changed the field name to mbm_assignable_counters from abmc_counter.
> ---
> ---
>  Documentation/arch/x86/resctrl.rst     | 12 ++++++++++++
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 16 ++++++++++++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 1e4a1f615496..43a861adeada 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -290,6 +290,18 @@ with the following files:
>  	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>  	there is no counter associated with that event.
>  
> +"num_mbm_cntrs":
> +	The number of monitoring counters available for assignment when the
> +	architecture supports mbm_cntr_assign mode.

"architecture supports" -> "system supports"

> +
> +	The resctrl file system supports tracking up to two memory bandwidth
> +	events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
> +	Up to two counters can be assigned per monitoring group, one for each
> +	memory bandwidth event. More monitoring groups can be tracked by
> +	assigning one counter per monitoring group. However, doing so limits
> +	memory bandwidth tracking to a single memory bandwidth event per
> +	monitoring group.
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 80be91671dc1..c23e94fa6852 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1237,6 +1237,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>  			r->mon.mbm_cntr_assignable = true;
>  			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>  			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
> +			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
>  		}
>  	}
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index f25ff1430014..339bb0b09a82 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -869,6 +869,16 @@ static int rdtgroup_mbm_assign_mode_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +static int rdtgroup_num_mbm_cntrs_show(struct kernfs_open_file *of,
> +				       struct seq_file *s, void *v)

No rdtgroup_ namespace, this can be resctrl_

> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +
> +	seq_printf(s, "%d\n", r->mon.num_mbm_cntrs);
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*

Reinette

