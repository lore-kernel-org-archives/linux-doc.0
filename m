Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4E038AC9A;
	Mon, 27 Jul 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165938; cv=fail; b=CkIltzjtxqvOkmGpkgeJGvH5Sw/50zeoWQmuSCRamoUkJmxtuEVG3q+KsHwCrQ17w+b2lkCF6q7dyhg5Tsj2J5pRow1uuo6vmUgkKTjWaR+pVAAjjxtJHsLAZt3U+mPmklGAvox0mI7aHaZAbrWAn4kWSoMeYXh1Dh/sgTsmays=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165938; c=relaxed/simple;
	bh=+KNPVOR2GxbFky36hoU505pqVskF0FbZpg1TePLIHQA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fJZkwZ3BEYmMXWgNo24pSa1Igy3cX1nOI79DbWdaDsd9E2/LCPrUqgJVLwRerlyDeTylrXgGS0ZafORFany/le/C2lT6xh7aayArl3wtTCBtt/jLO3UULLJ/tzZHZ/ieCg5I5O2xB5SQzRT6bKZjQaaflwvrU/AQHHUT++B1jF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrMlnSMt; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrMlnSMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785165936; x=1816701936;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+KNPVOR2GxbFky36hoU505pqVskF0FbZpg1TePLIHQA=;
  b=LrMlnSMtAafvCFzpw/9zV1I2mKMer8qbgenhCKkjqpk5JrW4w6yNQCTp
   VHym2Eg8Ys5E6nd0DE0jXBQriJel4Arogd5leJPZkJCrWEK1jKPFSmCUG
   5AaKptp6exHVE4B52vjkEr9LaRfiemV0FCt6ukUjXScNyiGSmLSqzYoUJ
   IG7NPvEDdV5eEXuNPRwukrvsIcX3RfdqHI5K2sPH+YhzFtghQAsXo/B+o
   BmyqUvY2YEcuk2j/00iyb4LA30nn7aYLR89Z9ezUbZIiBww+890H4F3EJ
   82qNdyXEcbf6rKO3tlyIrx4r4HalzZJOYILriOILVln1ad5ifsiOFHke8
   Q==;
X-CSE-ConnectionGUID: r+JH56VKT6mSCQiVOq8KQA==
X-CSE-MsgGUID: 8bs5BvR9S1aQ6+448dSPrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84714321"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="84714321"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 08:25:36 -0700
X-CSE-ConnectionGUID: 8aZW43VHTUm9EgjfPzUByQ==
X-CSE-MsgGUID: RSGZ9+yPSomk72gBvdnm1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="262927840"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 08:25:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 08:25:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 08:25:35 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 08:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMxhgxBKKm6BDwnEFHpYjCsLfD9wdWuiMZyV8SzANuvbuVdSPZwWMt3j9nV7t96dIWzeGjl/2DdnnIy6mIVxHKibGrMd4XUgfNe6Wod+AyJP6NQFEdtDO0JzaujgIyFJgMrURtv0YryTL9INXstY7m24nZKwIoMt1Ip9ye4m/uMnbNHWjLdaNymyz4+tiLNYml8QjWV5ahzQfaN5ffhKvbwrAS9jHGgdNf0KioZp21NCYIpmrwWyomH/Ie1ks8tajfUyUY2z45hYhv6it/z0nfaeSmjshju8AGgLHBr/JfqaK8lxgvtZ8fUZ5HnRpLtB+LAsOmQVFTWFLVeaIDjMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE2zmpjXK2STqpsPrVwLdYFKg7lpW+4kS2HPyzClI7Y=;
 b=cXBq1rNE1iJZr9mc3+1x2kAc1uaylC7MNTGWSnMqWWspBIbCKVZQtNduXbiDor0dgP+8GYUPsRsF/YaiPAepJ6VJKbOBmyBkhZBj8ba4ns8e8YxW0XagqHZX+NIOaJKwNtaBHB/kIT3wFWksy2BS+kqSWWH835MhVW75HkE0tWzd4TcK84wCXgMcrivAmKHPixN5iMgluLJxNGkC5QAgE2YKNz9oz7SKlBLBgJZMF5t9qea+Fjj2V6ViA3VFbHg0iW1Wrpr5ZOjKWZAOnj3Jxe/endtMiLL+KPIgJwLzAznjsMiy6UNOlnCuFRLh+THXHsneS6m7r1CWwKMJMMNHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS0PR11MB7481.namprd11.prod.outlook.com (2603:10b6:8:14b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:25:32 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:25:32 +0000
Message-ID: <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
Date: Mon, 27 Jul 2026 08:25:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>
CC: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<tony.luck@intel.com>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
 <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
 <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0363.namprd04.prod.outlook.com
 (2603:10b6:303:81::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS0PR11MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: d02d4f25-1094-41a6-25a5-08deebf34c3b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|5023799004|11063799006|56012099006|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wc2dEDQwwqyfm9K2SL12roO5wJhrcGBu90jHdF8JFo6+/01gzfG5WVnstvaE1C4Bu60xtuaRqq7A9hqAzivImmtd8GUQbKmaOKyzxQndcbE/AiQNoTRAjfR57k0cV/3eMpY8cuhg0lA0NXAq3cw3/2InIspLqcXUFFGv0xdUkEc2sX5tDGO3meA/1irKwCs44K0MpvxVLeJmTz0UUy9Cl0O9lVGstvTFXBxxP5X7jbB6lWkw4RbYXdpDOFsjHBz1qLTvnIq4m/56DBhUEb7RXRrd+Ce4FpNo3bPeLAH4ASlbnJjN4/0yAJsw/xV/4sTbofVzSjEN2FWbYGzmmJhpAAVnBHWSqMR3Ldhi6uNP2XYHNYhpMdu0b2FmEAmrql0Zej4+T0wzYy4NVTicxpxiePdXOuKYXl0j1GKArxR/Amsm3OqeZxUvWjKD1e6h0whAHimFlrF8CzJiklj1bgMs12VMHwyeoJlUD2+67p0ySootmW/7ajKYJ5mzxw3Oi2x+s3GSKCBrZ0BLJbvlJNcP+5eukHBzb1YN83QewXegQANyFJw5xkc5WyOKlxpUbrouIzkPGorh2ry/eXpVN5lhsGSonJBT0xDZj1Bi9GMXxSpkTkQio+142Gd6zVsPk/NB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0RTNnNnOVFZdm53YlFMMTBGUVNDcGZhYnJHeG1FYUlwQSsrdHp5emJHM2ll?=
 =?utf-8?B?a09QV3d5aXl0TDZ0WVZ1S09lQ2Q3QnhOVVNCV2xiOVdtbVVuN21QS2d4elBt?=
 =?utf-8?B?QkdYYnp3anU3REdBLzZtc3BLOGk5a2FZRjM3a05kNkFKTitXSlNQNzlYSUJ4?=
 =?utf-8?B?OG94cjc5WkNVQUkzanVudTBzRTdkR0pHOVM4UFBEaVFwTmNyNzIvdDQ5R2tX?=
 =?utf-8?B?R281R1FmQW9YampKdnI1VlFKM0lzZHp1ZHJqNXNrUG8wQ1pNZmtITHc2NEtq?=
 =?utf-8?B?TjNveGhkNklYTmVZNHVoUFE3STBDc1hGOWJRYk1XUTlWcHd2VkZpWXc4YkVk?=
 =?utf-8?B?S3huZjRNTXZDL0Nncm9WSmZTSjd3akdwa2JlMmdYWVZ4NWNHMW4rdFZPdTk0?=
 =?utf-8?B?N0xTKzkzVXdrVExHdVdXTXdYbXRpNWYvZUFUUGxnN1dDMDQ1ajd6MDJyUU8w?=
 =?utf-8?B?S3EyQ3VrSEJ6cUtaTWU0c3NPblNqZDlSNVFqeG9Tb1dhNUxZQVlYNXN6V1lI?=
 =?utf-8?B?QWlHMWw2OStVSjVpZHplWWJlVzdyVEVXYXlCZ2VCeUQ0MWpEV3pmaElwbTA5?=
 =?utf-8?B?b01kU0Yrekw2V1ozTXRHbk5nT3FjbmhWOWlKNDd1RmhSbVpleFhPYU1mQ2Yx?=
 =?utf-8?B?R21IWkg1V0o3NXozb2QzYUpSTnJwS1pRY2VoeVNBMmh1Q1F0eG5OZm9hOVU4?=
 =?utf-8?B?UTFqVWVwQ0tDMk1zSStyWStoU1p6RjZCYmFmd1NMOVI0UGNxOTl0aWdGRE5C?=
 =?utf-8?B?b29STC8xSDI5L2d3OG9IVzZMSEZFUER1VUdWcFcxdmp0ZSs2ZGhhemxHaC9p?=
 =?utf-8?B?SGptZk9wcXdYWUdrWkpVb0R5Z29BVUlTUnAvZEVGcGVmRjVNbjVVQ01CTlpM?=
 =?utf-8?B?ek0vYzRER0ViU0cralBMZ0ZTZ3hwb2dPRVRpUjFmYkR4amtOZHR1bVFMWHVj?=
 =?utf-8?B?VkpIWmgxV1I2UG5TTVFWVDUyZGM0UjI4aTBHb3FOU3lRcitBUjF5bHFLc25p?=
 =?utf-8?B?WnhIczJzWHpGWUd2dVRNY25kdEt0YnkvQXhhS1JrcVErdEhuVkJCbDBqUnNM?=
 =?utf-8?B?cWRYK0NoSHFOUnV4Wk80WmtQT2g5OEJ0NzhuRHNFQmEwc2hHTkNnbWhmWXBt?=
 =?utf-8?B?bXhVbVhFR0wzT0tYQ0Y5YWk1TDFZeXdnakEra0t3L2wxMWl6V0dwc01aTm1V?=
 =?utf-8?B?NjhQU29mYmJhZDdydTNtemRlWnpuWkJHa1FaWU42SVRPV00wZTdFNkNKMytH?=
 =?utf-8?B?YU5TcHBwTno0Z29GOVNXVVJRdzNMeUxvYkNsRTJZRnZYc3VwN1RQY1haMXhC?=
 =?utf-8?B?aWE4b0pqdUl1REhsT1lZSzQ1L3E4bDlUcTBuNWdHT3htU2pMdUg4MmFaM04w?=
 =?utf-8?B?RzdaQ2tpSklUYks5dDJkd0pmNEgrc1k1Mjh2Sk02bVdVZVNLeE1QZWZtM3VW?=
 =?utf-8?B?eDdSZm9wOTJDWFBCNjdPU3M1QjZrZzFXbHZuR1EzQngvZmwrMHVGc3VtUmM1?=
 =?utf-8?B?TW9OYVU4SkxVdktUdnVZVXRhb2wvL2JhbjNhWFBDcFdMckswY2d2Y244ZnNq?=
 =?utf-8?B?WEpoSHZpdDdOb2F0NTNsbmtHUzZqWFdJbXR2NHArR1k2UjVPVldjMEdvTElW?=
 =?utf-8?B?NlJkeEpIM0J3TFZwenhRUEllQmlzSzZOeFlWSFZSQ3NJbGpNakc4akN0SVVu?=
 =?utf-8?B?Y2djTVkyR0RWMDdNWEh4QUV4QVJpTGptWGN0TmN0U2RhMElNSTVLbGhiT0o4?=
 =?utf-8?B?bzdBVFNUeSsremFLdSsyMk83aFN5SUhrR1c2dVh2VHR2M2FkdFd0NXdXYzJP?=
 =?utf-8?B?bUVaaFBkbkpJa3VkWjBnMnNCTVRSQTMwcmVsaUJSNmRTQ0h2Y1JnTEZoU21w?=
 =?utf-8?B?ZmlnbzdEQXpFM2phM2hYeitQZ1dRVEc5Mk1peWQ0T3Q1T0RtdDdSY2JoUGts?=
 =?utf-8?B?eW9qYzRTdy84VUdOaUdsU2hlam8va1JRNjZQc2p2Z002RnlYcVdGMFZneEZw?=
 =?utf-8?B?VkIzSTJOMVQ4cEpEWjJsR1BsczJzQjJNcEROMkY1YUxxWWlUWEJVV2RFbE15?=
 =?utf-8?B?NUxJL1B1V3NtWk5zNE9OanJkUFREMHgyRmxwWkxQVjhucWhuUXlkVEdsVk82?=
 =?utf-8?B?WmFWbkFoNy93YUFqelZ3R3pHeENVVWFYRGFwWU80ZEQ2Z0s3c1RadDlWanlL?=
 =?utf-8?B?bmFab0lCeWt1OTFXYWlsWnU3dm9HOHRFSTIvSXlWNU5XRkpVODYvNVRrQlVE?=
 =?utf-8?B?eS9vY0ZvcytkZCtadTVpZldKS2lmRWd3U2xIMTZheGlBalV0OTFzZGVsK29h?=
 =?utf-8?B?cTJuZXhNa2VuSFJ5V3hVQTlab29UYWNWTlp2ZnlYbmVGVnFwS0djVEJPUEFR?=
 =?utf-8?Q?WQtdA49siTQ64hw4=3D?=
X-Exchange-RoutingPolicyChecked: jyWj3MA9xQ9Ray3ZOA2OwK3t20qohRm+u7NMQh7CUh90KqNrKws6caLvqRfW9zma9ric2w+SOtYGCeh6i8EWsToDCrI/bEwAJZgDlfGPoUyFKxRHoDScLY9ZSXZr6hLzI+5XqYBpjg/i4A0udPrEVnwir7TbAsawYQXOkR3pEGmKj/CxRjZf9xFofTTKysY6Bd/AJaR1erymw0+9kDc6G5zhbktFuRSRRh7hklb3v36kVAFIF+7rA+KxEmMgkyZK2ftoTZQUKBfJSFnqoo2w4C0pw5OGGKN4bnobIFw/HijVLCe6IsYVnQyg89LS+A7tfVOx26eY+8CYEPepLlVERg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d02d4f25-1094-41a6-25a5-08deebf34c3b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:25:32.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrUu3gJ3BIk1WyPt617mHAmsh7PQGs+ZTtq6nwjjNJhGhSfNRLNx/6rlBpAsZN4VbcHkKXbLMPZWiRRojgIqV65z60MzixibC/+UBSAa1hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7481
X-OriginatorOrg: intel.com

Hi Boris and Babu,

On 7/27/26 7:05 AM, Borislav Petkov wrote:
> On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
>> One clarification here is that as I understand there has not yet been
>> an actual user complaint. At least not that the pqos utility mentioned in
>> this thread is aware of. Instead I struggle with the speculation about possible
>> user complaints with different interpretations on how this change could be
>> perceived by users. 
> 
> Sure, but don't you think that it is enough that we know about it?

Only if we are sure that we have the complete picture. I do not believe we do, yet.

I connected with the friendly pqos folks on this issue. They subsequently did an audit of
the tool to understand how it may behave under the different scenarios. They found that
the tool currently parses text return values ("Unavailable", "Unassigned") as zero.
This could cause incorrect behavior. (more below)

> 
> I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.
> 
> And is the 
> 
>   pqos -m all:[0-191]
> 
> invocation not something people would usually run?

ABMC enabled (mode claimed to be incompatible with pqos)
--------------------------------------------------------
This example is from Babu's email that highlights that when ABMC is enabled this returns
zero as bandwidth from pqos perspective. This matches the pqos audit that found with text return
states, like the "Unassigned" happening underneath the output above, the return value is zero. When
the counters are not assigned then the events will always return "Unassigned" (until reassigned)
so having it return zero all the time may not cause issues. Once reassigned the event value
will always return a valid value (no text return values).

ABMC disabled (mode claimed to be compatible with pqos)
-------------------------------------------------------
Without ABMC there are scenarios when events may return "Unavailable". These scenarios vary
based on how many monitor groups are created and the workloads run. I am not able to test this
but when I attempt to combine what I know about AMD bandwidth monitoring with the results from
the pqos audit I am concerned that there may be a problem.

Consider a scenario where an event may return "Unavailable", for example:

<return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...

pqos will see:
A, 0, B, 0, ...

The "pqos -m" usage attempts to determine the bandwidth rate and, for example, when going from
"A" to "0" it will be considered counter wraparound that would appear as a very large and
wrong bandwidth number.


Question to Babu
----------------
Do you perhaps have a test/workloads that, under "default" counter assignment mode, can create
many monitor groups (more than 64) and cause "Unavailable" to be returned frequently? Would it
be possible to put pqos through its paces in this environment?

Of course, "AMBC disabled" scenario also includes AMD systems before ABMC was introduced. I do
not know why the issue with "Unavailable" handling (text returns in general) has not been reported
until now. I assume the pqos team may do most testing on Intel systems that do not return text.

>> When considering a change like this, should it be a stable candidate to
>> help reduce the number of kernels with different behaviors?
> 
> Yeah. It needs to be minimal too for easier backporting.

ack.

> 
>> The patch notes mention that this change is planned to be reverted at some
>> point in the future and I have not heard of any changes to this plan.
> 
> Where does it say that? I don't see that aspect.

For convenience, copy of patch notes from original commit [1] is below:

	There are plans to enable "mbm_event" by default once additional counters
	are available. For now, keep the default mode to maintain compatibility
	with existing tools.

Reinette

[1] https://lore.kernel.org/lkml/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com/


