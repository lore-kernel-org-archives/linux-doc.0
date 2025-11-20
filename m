Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD327F74B;
	Thu, 20 Nov 2025 03:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763607922; cv=fail; b=PrfzxwBIfijWkNQwuaMCVk5iItw0e9WubtveQCzmtrC+Czui786Bvty/TG5/Lu8OQfuJPER/h6kK+NRsF/tWxybkWvOO0CKVgTSEz25Lp7rnAWWddDDguMeAvnSXl5glrgLHd9YSh9ZMpubm3ZlDoEDg6fCpA2gT+dORIpSrXZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763607922; c=relaxed/simple;
	bh=JoRDdZjaaXMchAluhc28EcccewRPKoAF8CP8ossC1Mc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FhTlP1C7ACZTiiZ+3q3CRqNWI/8/AZdbT9KWueNi4aoqv5OSWHzHc3CrPTeQg+408p+TFgRqGbEzyM3DQ7BwgfqZrI8qTeuIv6sG6LHf9K4H0Bg8uwPKhksjZjk8qGYXkJv5/QzGbtQS6NGsTnaHPeX7qqkdYnZWih7WYRGxlcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H70Bmzjq; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H70Bmzjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763607920; x=1795143920;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JoRDdZjaaXMchAluhc28EcccewRPKoAF8CP8ossC1Mc=;
  b=H70Bmzjq1FoLXGR0vrJhcis/6Z1IroDYnXX3ouMixqqH9eQYYHBNv+UJ
   vJrYi7NIWggLT0Ryn/Zea6lMlsme8z405b+M2Gplfl1Te9hBN7rjZAehr
   zNvLKxF8Foha6NgjhbPRuhCrjH68iudd2d4NZKhrCOQi762vcndrUJ+V8
   dI/H86/c8+8TfToM5fU2s/YPIRVVglSLPmaDm/OuMTcyCD1lktK3VhzFk
   j2xJwc1YhR4PsFuG+chwCKBkvZT/ovB3kE/C4Zu0qfRQrs+2B/Hg7lmAs
   1O0OdyN3GXanDIrwzba2RV0zhJJ//V4ZdRoQ+/S3rXIo+TdZZw0PoaQ6d
   A==;
X-CSE-ConnectionGUID: HEXwIHX9SbW2XAK3M7M+TQ==
X-CSE-MsgGUID: esGaE8rFTmmfhvOioTrNYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65543857"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65543857"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 19:05:18 -0800
X-CSE-ConnectionGUID: tX7bqI9QRyCLGGx8Byte1Q==
X-CSE-MsgGUID: FoX1FRsnR5ytdQHzf/H73A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="190499898"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 19:05:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 19:05:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 19:05:14 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 19:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+wQQMoyeCG2iuGcGf0IgTNCl6Hfsj2FvB9Myp4AUEDv4GT3Kss3y6w5Uiv9cvBqmQNc7vb7RWZdykhukZTVlegEqOBK3vnksWg6mKSY65huaopgIZUA8icTXYDUmeKp4qAepKMJPg/vC4fciM1u0KVyFhHF85ggWloYUxDw3A9xqAwDoE85gFTOJHS6RuNIGZIPtPNlwp61f7RibLWhORa23CKiza80RLbSl9Nwo1/xalviHlh/dzj+XZdY1l8ICFSxhae5aQDG+DIg0izck8n/vLMx6bPaFldKD5DjBPsQjfem9ueRwBFTmJsE9ITq73SrBNQKL6WZYXj+9pOYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlCuoYxcch6vPPiYyaZP7yfm3ePRVHyEIoUXxQYNhvs=;
 b=xUg0NIrypjpXc6jZ6TNE7RwLrdIgyIb+jy2Y5M9hJKT+nTLU35DCMJFvXf+dqLKoYJ//414koYK8YOv5UnnqfWWMUvNPmUgIyReRlF4dDZ9M3G7F9wWfPTw3m/VrTEaDkdYjHP9xOnDWfe5R2fGAL4Q0dXFwtpc008RR59nPPyGzwgp/tdcuUzoqd7ugvCi2XxKNVLiv7BeJxEsBJMyoR9tLXvxlhmwUmjm5FKv4UISnFfgFYtPZ/G9IRKI4rZ8NYOkozPlCew48Kuy55vj1KDxNT7ExjJi6Vxw2tWbJCm5GLBodmuuzh+guAhynA5YwMP5P7glZ2z4w467m4b/rXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 03:05:12 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 03:05:12 +0000
Message-ID: <caa771e1-e86b-43b0-bc4e-09057f598fab@intel.com>
Date: Wed, 19 Nov 2025 19:05:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86,fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Dave Martin <Dave.Martin@arm.com>
CC: <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, "James
 Morse" <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
 <136d9c83-e816-4188-ae0d-322478a57a68@intel.com>
 <aRyVHqeHaRtrKqvG@e133380.arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <aRyVHqeHaRtrKqvG@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f37214-8c96-4bbc-9509-08de27e19ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STZyUytyMkJNTjdEQVl0ZDhHOHFoWTNwdlNNYWgvcXcrUGp0aXFUeTVkMXFr?=
 =?utf-8?B?czRvaEdyR2hBL1FOakNZclRoWHFuSlJPQUV6d0ExeTdhdGdVWFFhRkhtSldB?=
 =?utf-8?B?ZENUbmtXYmJiRkFDUW4xSlduSFh0MDNlTDVQMmI4OUg0bTVQYzI1emJoRTBK?=
 =?utf-8?B?cTE4SlJIMGxLMEpvUTFjNVJmcUZEazJKYzQ5NTgwaVZYNTJjeVdQT2RxUkxy?=
 =?utf-8?B?TFVqOW5PbmRYUkg4cS9nRE12Zi9iYnNKTU4xb09GQXIveVBUaFgya1hBaFJI?=
 =?utf-8?B?TEVIS0xUR3Y3S0ZVcFc4d3FBak1kWDJHMGQ5SkZ1cW5IZlk1NE5mR1hSdXpO?=
 =?utf-8?B?dmk1UnlBMjhuTFJPT29TVzVtYlo3OEVBK1lGUmJxd1hrTmVSdTRlaDlRdTZY?=
 =?utf-8?B?WEZacDNUZUwwd2RuNmM0M0lLTHhZRDZlV2gyREpuTmdUUEF6ZVNNUXRoVXc3?=
 =?utf-8?B?aTh2eC9vY0pTcmtCV0pXWDVqayswd2M3TWhydlpxVUFpMUJRazlJbWlTUVU4?=
 =?utf-8?B?aUlHUmtrc1BSY3Z4a2ZyUVg0Q1pVbzUxNHFuNWRTa2hValNrMkZYUUxNbWI1?=
 =?utf-8?B?eTkyRG0zNVJBTnJQeFNER0xEemtCbi9iWEhjQWcxdC8wWUoyYVJwMjFoWmpq?=
 =?utf-8?B?ZDZmUEUrTWlYSGdkSmQ0OEx1ZGt0ZWNvNlMvU2pJSFV6bGxVK2VUNEpGdVJK?=
 =?utf-8?B?TDcydzF4enVaVGZTK1J1cStMZFdUK29SYUVhNUhnazNPTGszWnNSbWZlc2Vp?=
 =?utf-8?B?SktLT1BvQ3V0ZWFIS0FWYVFuUXZLQTZMbENKNVNxamtaOURPcGpjTEkrekFp?=
 =?utf-8?B?TDZNdUJjclJkUDMzMUpxU2RlOG5Mald3dnNsUjE3NENnb2pGSFBCTkpkSVVv?=
 =?utf-8?B?ejM0Wlk5UFBYanZUbmFZM1BxcHZ6eWVucGNuNTZFLzlHVU90dkJEK2tUM2tE?=
 =?utf-8?B?QmNKMHVoUEcvVGtEd2JEVCthS0V0YlNvTGlNd0hMZHB6dURpdC9QTVo4TE5X?=
 =?utf-8?B?YnExbFdFYmJoVWtram1EREN5dXV2VWtGUXdIa3NrT21yd01RbTJKU1lWVlRC?=
 =?utf-8?B?ODZ3b1kzekZNLy9BN21xZnhKcHNPVnlJTnNxdG5uaUJEcVdUQ2dkUWpHaWJ4?=
 =?utf-8?B?UndOSXNseDJBaUp5dGluMzVTTmpJZXV0NEZJNXlhQ3AvcHBHY3RZNVY1WjRK?=
 =?utf-8?B?Q0pGNUpiVWVxWWRjK1h3S3RiNVdiSlo5VTN1MHJXOFUzbFk0Mlh0UEE5RzQ1?=
 =?utf-8?B?VEk3cjhqVHJ5NjlBSUpBUVRKUzhzSisxZlBqNC9tOU9nNWo5SVhSUWx6SnU2?=
 =?utf-8?B?RmttRnJhbUZBRzg0T3ZrZG0vR3JSaFFPNXQySWpoUDV2ZkZRTXNkNFZTNSs0?=
 =?utf-8?B?SXVqNG82aUtSMldGTGxqZEc4WUdRemk4MWpDdWNMVkZBWVNRRkdhTndXQm5N?=
 =?utf-8?B?dzVUWFFabEg4TlRHWmJyVXdvNVM3QlFpbnlOSkEzTEp2TVVyQ1hKWlNJdFFk?=
 =?utf-8?B?L0U5c1ZxcGZsM3JUVFgxOHFZK0psSVRid2s0WXdnRTNjZExTcWFzM0hjYkVp?=
 =?utf-8?B?R0xoakpubllVZmM0MEtzU3dGQUZyNkxabVliM29BTGZzZVlRaE50NnhOdlNV?=
 =?utf-8?B?Z2ZpOG0wWFEyOHM4NVdrL2U3eHJsYkpGNkxoZXBRTnNaeTFVRWV6ME9QZG1h?=
 =?utf-8?B?WkRVekp1R0YzeU5TN05xUnNyZWFJQ1I4ZVFUYi9jN3NxZHEvb2dkN0VxM2pZ?=
 =?utf-8?B?UUNIVVhwYm51S0UyRlVlU1BES3BVTS93MUg5Q1NJUCszdm1DaHZGV1BYTWw4?=
 =?utf-8?B?OFlRbHFsNWhCR09iMDhQdzhQcFJWUlpmSnNSOFpBandUanBiR2FHSkF2SEtx?=
 =?utf-8?B?cGxKWWFTS0YxZWhGOHlDR3BIZkJvS0puNnZGWGlTTmZuN0dCTXhvTkltNXpJ?=
 =?utf-8?Q?vFB48EZsx6bkEWafIRtj2wP1YCpTyCtu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG5DWW9IS1dwQ2Nzd3BZUVhQdVFMUUZmUE80LzA4SWhDV0ZSRVVYcHBkSHF2?=
 =?utf-8?B?S3ZjYkRRVkxzMzQxdDdCNkF3S1dxQVphSkE2S01qeW04VWxZMCtjMldld0t6?=
 =?utf-8?B?cHRWZUNaMkVIVHlibWkrVHV0b3c5Mlg1ZnNkeEhpdjlHbCtNU0lydE1kd2VL?=
 =?utf-8?B?M2hRTDZJaFV4QktMaTE4V1ZJYlpKbnRsWi9VOWhUN2kxQWY0YUN4TnZWTmFZ?=
 =?utf-8?B?akNlQVVpb0Q0cHNVWjFBbms1LzRTQVR4K3ozLzlFYUx6alFNYlhCNWlGZFdC?=
 =?utf-8?B?ZWtJSW13WkxDcEtyajlRd25lM2ExNE5sTDhkNnFkZHpZMklOTTNNUjFQbWNp?=
 =?utf-8?B?eE5oZVFRNmZMMTRBQ21sUm16RnF6SUVHS1lMWXNOaWszTnAzS0NEQldLeWVQ?=
 =?utf-8?B?OWRabWFnNWc2amJaaFpGUjlTNFgwS1c4c3RyK0pMTUFpeGxBR1h0Y1pDM3pZ?=
 =?utf-8?B?Q0lHMENpRkQxNzE3Z3I3ZVVPU3ZTRFdVOENNa1VyZm5UcUREakFScDNXMEd6?=
 =?utf-8?B?MnFScitjc2JnWDFWbnFwWEQyMituekcvdkpCaFNtR1NqZ1IzYjlwcTc3T2xJ?=
 =?utf-8?B?aThDTWtZL29aSUNoTUZnckI4cHhya3k1bjkyNlIvaFVoNlFnL2VQQ3dDS2VO?=
 =?utf-8?B?UUdIbHkzeWZGazVvRWdkSEF2SkVVcHBWNXVQM01TMnNSdlFIVGpuZ05mYStv?=
 =?utf-8?B?bFk5T0YwaGZ0WWNjQWc4QnlpbmVSazZ6UjFMRXhtNDZqLzBKWE9zVW1FRlBO?=
 =?utf-8?B?M2pPQk9qd2IyVG5nZVpPbVAyazVCMlBGamFRNWJPd25DMDIySDMvVHdleExF?=
 =?utf-8?B?QVRHSXJrczNrZStrSms5MVpSS3ZZaUNDc09FdU1IQTljR1laMVRwb0dvS1Qx?=
 =?utf-8?B?U2hFY0FPOHNMV0RtV1AxWTFhcko3eFFwNU5kY2h1WmR6WG5SYlByRjRPM3JG?=
 =?utf-8?B?VjNucUxxa0pmT3IzV3BGV0ZkWFlTSnBEK283ZkdEQUl2MUJYTVBFaXNvV3BJ?=
 =?utf-8?B?cHhOcS80R2YydGRNRUpqTjhrTXVlOERoZ0RPZXNjNlRlZEJsUys5RVBORU1Z?=
 =?utf-8?B?SEM0aTlLelBDWTZ6R0hRZ0hpbWNVQUY3Mm1venVKVi82SHFST1lKSVFIaEsw?=
 =?utf-8?B?eGkybE5JTWpIcmxGcWNkcFMwQy9uY2F3bUlLWGVJNkV2cnh0QTdNZEVYUE4x?=
 =?utf-8?B?MTRScFhhS1pGazRPZ2g1UW9BcndwMitjVnZaZEVJSG9qK2xpcG9qTUlJVFFQ?=
 =?utf-8?B?Ris1UTZ6NEhOdDFtQVh4N2p3d1crTjhVQVNMT3Z0L3J0T1kwODkwR3JVQmFK?=
 =?utf-8?B?a1FjTFVOMnNDT3NLdkhJZGZ0Uld6czE0NVNidFQ1dis0N0Z3dzFGamYzUDl1?=
 =?utf-8?B?R3dWQ0pYLzdlNHV2K0xRdFUrNkNKOFk2c21kMFd5aWluUU1ITy9rU2VLTzFG?=
 =?utf-8?B?Nkl0UFdFSVBZZSt6UDBKcFdQS1BmaytiSnVKNUo0d0FpT2lCUnZac2htVVRJ?=
 =?utf-8?B?UldGd0gwWnN0WXRLVHJHUEpiV2lucDN4cllvWnArNTdHbHdxcUpTSzlrV3Ja?=
 =?utf-8?B?S3c0dzlpanoxbXZwMEVnUFA1Y2o2cXdvTGlTQkQvSEF4SUIyS0hxUjA5Q3p2?=
 =?utf-8?B?cGwwQnZiNXlTU0VHTDhPdFlKYjJhUjBPaFgwZlJER0FjSWdtL0hlTWx4VVlr?=
 =?utf-8?B?b2pBVlNHSVYrbXVvTk9PZ2NDZTFQbHo0WXMzL0loT29acVRQOUZoRkdhTVow?=
 =?utf-8?B?Q2ZLMWthL3FkdmVzNjM1UDBqWXZvV0RHR0NJVWF4Sm5aUTlEM2NPNmNWSGxH?=
 =?utf-8?B?Qkl6UDFvRnhOM2hhMTI3U00wczNYQkJaWTNyem4za1ZrTXMrYTZ2NHNWYjl4?=
 =?utf-8?B?d3RyYm1uemI5MTZUWm0xL2F6VlREajR4WmJXcXlocHRvbjhZc04xc2JNdk03?=
 =?utf-8?B?cWxtRHhkcFRMNmVHRitWaXUrMFRwV0NDcUpLZ3Boc1g3SmpnMForbFNMV21o?=
 =?utf-8?B?R0RzWWJoZGN3ZldENHlEdXdaUTFkSDlMam43OGI1RmFmcFdJT0ZEMytkN1Bh?=
 =?utf-8?B?aVZrWEJTM3JCb3VhaWVoMXA1NHFubHZTNS94TEVjOFY2MTZFQXZsNko5TEdM?=
 =?utf-8?B?eng3OU9vU3M1UkVVdFJIc1REVHk1Wk1pSVVwcnJ5L2RJUUgrL1dzbFVwdk8v?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f37214-8c96-4bbc-9509-08de27e19ef2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 03:05:12.3011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mp1Rgy83dKa+SIzhhUZE0sKY4goGlhX/2xhT10kYuZUEMtMC3WZin3Frq/IoQqKbiAc5eh7o4M3hUr+iy0jsSBmWkP8LEGMCXzLyIxaOc5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
X-OriginatorOrg: intel.com

Hi Dave,

On 11/18/25 7:47 AM, Dave Martin wrote:
> Hi Reinette,
> 
> On Fri, Nov 14, 2025 at 02:17:53PM -0800, Reinette Chatre wrote:
>> Hi Dave,
>>
>> On 10/31/25 8:41 AM, Dave Martin wrote:
>>> The control value parser for the MB resource currently coerces the
>>> memory bandwidth percentage value from userspace to be an exact
>>> multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
>>>
>>> On MPAM systems, this results in somewhat worse-than-worst-case
>>> rounding, since the bandwidth granularity advertised to resctrl by the
>>> MPAM driver is in general only an approximation to the actual hardware
>>> granularity on these systems, and the hardware bandwidth allocation
>>> control value is not natively a percentage -- necessitating a further
>>> conversion in the resctrl_arch_update_domains() path, regardless of the
>>> conversion done at parse time.
>>>
>>> Allow the arch to provide its own parse-time conversion that is
>>> appropriate for the hardware, and move the existing conversion to x86.
>>> This will avoid accumulated error from rounding the value twice on MPAM
>>> systems.
>>>
>>> Clarify the documentation, but avoid overly exact promises.
>>>
>>> Clamping to bw_min and bw_max still feels generic: leave it in the core
>>> code, for now.
>>
>> I think they are only theoretically generic since arch sets them and resctrl
>> uses to enforce user input. Arch can thus theoretically set them to whatever
>> the u32 used to represent it allows. Of course, doing something like this makes
>> the interface even harder for users to use.
> 
> Hence, "feels".
> 
> This could perhaps be refined, but I didn't see an obvious reason to
> change the way this works, right now.
> 
> Or, is there a problem here that I'm missing?

No. We are in agreement.

> 
>>
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
>>>
>>> ---
>>
>> ...
>>
>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>> index b7f35b07876a..fbbcf5421346 100644
>>> --- a/Documentation/filesystems/resctrl.rst
>>> +++ b/Documentation/filesystems/resctrl.rst
>>> @@ -144,12 +144,11 @@ with respect to allocation:
>>>  		user can request.
>>>  
>>>  "bandwidth_gran":
>>> -		The granularity in which the memory bandwidth
>>> -		percentage is allocated. The allocated
>>> -		b/w percentage is rounded off to the next
>>> -		control step available on the hardware. The
>>> -		available bandwidth control steps are:
>>> -		min_bandwidth + N * bandwidth_gran.
>>> +		The approximate granularity in which the memory bandwidth
>>> +		percentage is allocated. The allocated bandwidth percentage
>>> +		is rounded up to the next control step available on the
>>> +		hardware. The available hardware steps are no larger than
>>> +		this value.
>>>  
>>>  "delay_linear":
>>>  		Indicates if the delay scale is linear or
>>> @@ -737,8 +736,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
>>>  and can be looked up through "info/MB/min_bandwidth". The bandwidth
>>>  granularity that is allocated is also dependent on the cpu model and can
>>>  be looked up at "info/MB/bandwidth_gran". The available bandwidth
>>> -control steps are: min_bw + N * bw_gran. Intermediate values are rounded
>>> -to the next control step available on the hardware.
>>> +control steps are, approximately, min_bw + N * bw_gran.  The steps may
>>> +appear irregular due to rounding to an exact percentage: bw_gran is the
>>> +maximum interval between the percentage values corresponding to any two
>>> +adjacent steps in the hardware.
>>
>> What can bw_gran be expected to be on Arm systems? Could existing usage be supported with
>> MPAM setting bw_gran to 1?
> 
> Architecturally, ceil(100.0 / (1 << b)), where 1 <= b <= 16.
> 
> So, the possible values are
> 
> 	1, 2, 4, 7, 13, 25, 50
> 
> (with 25 and 50 being the only ones that are exact).
> 
> In practice, something like 6 <= b <= 8 is probably more typical; this
> would give advertised bandwidth_gran values of 2 or 1.
> 
> 
> Re your question about existing usage, were you suggesting
> unconditionally setting bw_gran to 1?

Yes, I *was* suggesting that. I considered bw_gran of 1 to be a "safe" value that
provides architecture with most flexibility. Now that you have provided more
insight on how MPAM uses this value I agree that bw_gran of 1 is not appropriate
for MPAM.

> 
> Since the values are converted to/from hardware representation in
> resctrl_arch_update_domains() / resctrl_arch_get_config(), we
> don't have a problem, provided that the value doesn't get rounded in
> advance by bw_validate().
> 
> But if bw_gran is always 1, it will mislead userspace about the
> precision.  This feels stranger for userspace than fine differences in
> precisely which percentage values get read out of schemata.
> 
>> What will these control steps actually look like when the user views the schemata file
>> on an Arm system?
> 
> It depends on the number of bits in the hardware value (the parameter b
> above).  Picking the smallest, non-trivial value 3:
> 
> 	schemata	hardware (MBW_MAX)
> 
> 	 13		0
> 	 25		1
> 	 38		2
> 	 50		3
> 	 63		4
> 	 75		5
> 	 88		6
> 	100		7
> 
> As currently implemented, I believe that writing the values from the
> "schemata" column above will result in the corresponding values from
> the "hardware" column being written to the hardware.  Achitecturally,
> there is no guaranteed representation for 0%; we would advertise min=13,
> max=100 in info/.)
> 
> A round-to-nearest policy is followed for intermediate values on write.
> 
> 	(hardware value = round(schemata value * 8.0 / 100.0) - 1).)
> 
> Reading the value back translates the value from the "hardware" column
> back to the unique value in the "schemata" column.
> 
> 	(schemata value = round((hardware value + 1) * 100.0 / (1 << b)).)
> 
> 
> In this case, bandwidth_gran would be advertised as 13, which is the
> largest step that can be seen in the read-back values.

Thank you very much for these details. I appreciate having a better understanding
on how the hardware enforces these control steps instead of some software emulation.
With these steps enforced in this way on the architecture side it creates 
confidence that the user space expectations from interface can be met directly
by architecture.

> I would rather avoid promising precisely which values can be read out;
> merely that they are consistent with the approximate precision defined
> by the bandwidth_gran parameter.

ack. I believe the accompanied changes to resctrl.rst supports this.

> 
>>
>> With resctrl "coercing" the user provided value before providing it to the architecture
>> it controls these control steps to match what the documentation states above. If resctrl
>> instead provides the value directly to the architecture I see nothing preventing the
>> architecture from ignoring resctrl's "contract" with user space documented above and
>> using arbitrary control steps since it also controls resctrl_arch_get_config() that is
>> displayed directly to user space. What guarantee is there that resctrl_arch_get_config()
>> will display a value that is "approximately" min_bw + N * bw_gran? This seems like opening
> 
> No guarantee, but there will only be one resctrl_arch_preconvert_bw()
> per arch.  We'd expect the functions to be simple, so this doesn't feel
> like an excessive maintenance burden?

Agree.

> 
> (All the resctrl_arch_foo() hooks have to do the right thing after all,
> otherwise nothing will work.)
> 
> 
> With this patch, resctrl_arch_preconvert_bw() and
> resctrl_arch_{update_domains,get_config}() between them must provide
> the correct behaviour.

Right. This blurs the lines of responsibility. I interpret this as:
"resctrl fs makes promises to user space that resctrl fs *and* the architecture are
 responsible to keep"

> 
> But even today, resctrl_arch_update_domains() and
> resctrl_arch_get_config() have to do the right thing in order for
> bandwidth control values to be handled correctly, as seen through the
> schemata interface.

ack.

> 
> (x86's job is easy, because the generic interface between the resctrl
> core and the arch interface happens to be expressed in terms of raw x86
> MSR values due to the history.  But other arches don't get the benefit
> of that.)

That is just the benefit of being the first architecture to be supported.
If determined to cause headaches elsewhere it can surely change.
> The reason for this patch is the generic code can't do the right thing
> for MPAM, unless there is a hook into the arch code, arch-/hardware-
> specific knowledge is added in the core code, or unless a misleading
> bw_gran value is advertised.
Understood.

> 
> I tried to take the pragmatic approach, but I'm open to suggestions if
> you'd prefer this to be factored in another way.

I am ok with this approach and will respond to the patch details separately.

> 
>> the door even wider for resctrl to become architecture specific ... with this change the
>> schemata file becomes a direct channel between user space and the arch that risks users
>> needing to tread carefully when switching between different architectures.
> 
> There doesn't feel like a magic solution here.
> 
> Exact bandwidth and flow control behaviour is extremely dependent on
> hardware topology and the design of interconnects and on dynamic system
> load.  An interface that is generic and rigorously defined, yet also
> simple enough to be reasonably usable by portable software would
> probably not be implementable on any real hardware platform.
> 
> So, if it's useful to have a generic interface at all, hardware and
> software are going to have to meet in the middle somewhere...

I believe that we could also use above as a quote in support of the schema
description work.

> 
> (The historical behaviour -- and even the interface -- of MB is not
> generic either, right?)

Right. Even so, I prefer to use MB as motivation to do things better rather
than an excuse to make things worse.

Reinette


