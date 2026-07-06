Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CAB42E8F8;
	Mon,  6 Jul 2026 21:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373611; cv=fail; b=dKYQEhw+ixrmHk53mH4bFw9bJmwd2V7rlQ+P8cBw360MnQsdRnezI1O8gcocvYRc9GMwVUn+leJrie1ZJyz8+wj4nutxIozN2ekUi2FrkDrPW8gXysdky4RmuEj/nubg8Sv45yJvidLZuNuRME5kvky0KDNlrlBchSO9HwSDA5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373611; c=relaxed/simple;
	bh=q50gX83gX0S26S7zq3ify+H5JUcaWlkLz/R1i62Ifxo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P6uXvhbNH5bpzPbe9RhVS4tfQTnaRsbVBgPHPjT3Z+Vt0+FU9rEbHZ5yGdLwJiJoCMx63USKUMo7Nr343EDcC26QI+n0QwZcS+bvTyBoW1v/0GWAQ09C9SM6/+RfSe92/TGJctozx1hkQTOR9XI/O4X72ucqQSD1uLd16sKMiJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQrJ+quU; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQrJ+quU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783373609; x=1814909609;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q50gX83gX0S26S7zq3ify+H5JUcaWlkLz/R1i62Ifxo=;
  b=fQrJ+quUmW2TS1UGCnvuBmOX9F45PKPY8XprFNSEO8jT81f951qLbXke
   pjO6WC4EsiYN2BCG9LLKboEkbUzgNaIWtcnbqTNcJpgELAvmpztUmu3Ef
   3Uxd5bQzD6ZdiWaMIfatz3STbZXnbt6lMj/D1WX+XTtFJu6TSGjU9uK/a
   mUwLRWnxleiSFJenuNSfA/6HfGryaDKUyfmjeCbpAnU8g4g9d7v8BP8nq
   mkvAkNvhFZTvo4EiCmSk+5R/a5B3BLgiUvDgzXHsXsphurNQkmp+AQY4W
   p/MBhL7GCfw0DN9akMzQjzTahxzQea4+QhLAwIe+b1If8Ism00WLhM8oj
   Q==;
X-CSE-ConnectionGUID: CY84i7huTw+/i+7dixFwdQ==
X-CSE-MsgGUID: HTe8Ws60QqOTx4bL7UQbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84137682"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="84137682"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:33:28 -0700
X-CSE-ConnectionGUID: i0Zjhx/bQsGcIQTnxiyKFQ==
X-CSE-MsgGUID: y8pVdWlhQz+0NjZGfLAOgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="291991888"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:33:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:33:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 14:33:27 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwkQMJmc9dF6Wego6F4G+qNvndiVI2Zg1KToz285BSD/dxEww+x54k3Mh4aHzryc8mVYHDTqXu/aOF1wrq/6qlZxaBu1LMPmVWGunWYFUt+ugvLUksfmD9myNxKhvtd6lkNcyy2uuchE3V/g87jWCAWp7PgqpT4Kzo8xjKnF7mc4ndZ4RlhiRveqgs0hcpS+eC3HXbxNKzmgVyaDYqLv8GEaNLWNykOcsjuWniswn7j/Lex/yGyNvihKL1PxBYgewe+qoocyHXwyCjILtnRNQvUrImjrSDwS/PExtUNOrtnXtYYV5bsEcAJIhIavpWPup0U/ywz1A6NAB1OSnT1d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHnkhHk9ieblGmjpLor0ugGGuX7aHsuvhZ689olqqHU=;
 b=dO+lh5F6G8VX5klr+dH3J141An4/TL/ctnBSgcn/o6KWTbKgp0uZ/V2qQ3AtxEw68wNJ/VQn726TszN6OExRqQUIwsYKSFmOjOeFDxCU+2lz6CgU2WohHXSKwjs/Ors5UGo04jIHMFrKzWceCigfp+C90XZfq3Dtd/TIHZjnPXs+0KDJ7H605PQ8HMMxf0DmgCLsjy/0AvbvTL8L+65DjsZ0g5Z2Mb5prqqHyAiMgDPxiF4wRQk81aNX2FJ1R3ynPjLHdPfKKfLV4VOqYMbxqHdFJ4VjmvFtPFKuWZuVKd1uSghCIliTIDk2+VVIwXtI0syWBNs5fNRtUnq1p7EQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 21:33:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0159.018; Mon, 6 Jul 2026
 21:33:24 +0000
Message-ID: <643be9eb-06ea-4811-a879-ca014d09742e@intel.com>
Date: Mon, 6 Jul 2026 14:33:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-2-ben.horgan@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260706160639.2136674-2-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: eae13a12-62d5-41a0-8b09-08dedba63585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: orVIKqxSKv3VZ0ENyAXV2/5qm6pjcEwDsqmHBfD0tQc+P0S2OdfpTNYrZEVy/LebRC5J2L2Yxh/gtw3AnNTT1LtGDalhlIZZCsijOCxPutZOyic4C9nWH4Vttom+BFeLzYF62AcRJjUG5UlXqzNw4K2Qwj12Bbd28gq4HfTKmi3auDO4RVOlVR0QTzHfHC14XWG0W/A2qYG8CXNsosVgttVO7QnAJvavLne15Ee3pgaJT4dYDIZhEfnoS4chskbS87SVqC/3mDgX1Jt4G9UGis51nmKZynFahZUeiGGczL09R+Yz3xpVjxOOwu/uUVTYX8BF1U1ATMqlfowjERmmNVSVRCt+8VZ899LvwfFZXydvk2d6HQc7/R+UhK7Zt98rJs04phyQ/cPDZBH45wpR9Ugy/46kDvZWt90K19AUldQ70XmP04fVFK1iUp0BPrPelqldj0jJaHK/WDzBAStaUZ9Q14uScKQwGKOD6e8BEZxaLoPed9FfS44Iusn7p4K4kA86Tnd1pggBJ0L990ub8OCPVuZ84p5pPzoVuKsuPsbHB7Fq8nMLEAhR6c2w81nQoTuK9GSkBfJ74Hw1+QP43ffOgKmxtwjwI1QYTKzTW2VDXEsuXV2abhZyL0A0uMWQZty7dFWVG5PcCdiKRq372KtklIuRNxgZ2WIUYzpSpog=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHFTRXRmRC9zV0Z0TFppZWMvazY5V28yejRIWnZQY1lJUC9STHdnbUY1VC8z?=
 =?utf-8?B?elZzMGYzS3BUcnFDZ2IrUmNQQjVjamZuVUphYWRXWmw0NDVRUENaWkF3eC91?=
 =?utf-8?B?Tyt0cnQ4Z1lyUEFPd1djNFhYR1F4U0ZISVlra1JpVXgvWllNWlBDTXZmQ09o?=
 =?utf-8?B?VitBbU1nQndkVStnay9XL3JvbGNJQ3BOcWtIK1ZEdC9QdC80OEsxY3MwVFpH?=
 =?utf-8?B?UHM5Uk5VVTRmeEhSUDQ4NmlpOXNRQjd6U3d2eXpwcGxYSm9EVnNiSGFIeFYv?=
 =?utf-8?B?OG1OWWxPekl2VkY5TjhqeTBTZTNNWW1YUUI1SEJHOVFsejhMSnRqTktudUZx?=
 =?utf-8?B?WGhqa2owSHN0WDFLUzFSUzRkL0hGR1ZCaTh3UXNqc29PaEljVEk4Y2tjcnZ2?=
 =?utf-8?B?cFdVZkFITSt1ZkVTS2dsV0lJSnZXM3hlcFhHZlVYYXBON0F2dWJPUnZBT004?=
 =?utf-8?B?NlN0NWFhc1JFdkNYbzByYTgyMGxxQXAwenp0TW83dC9CK2VFMFhSOW5FTGd6?=
 =?utf-8?B?Z2JPMVF3emUrK0g0a0c3RGtCTkl5L0I0SzUvbmFzb1c5cWVTRnI5NFNQZklw?=
 =?utf-8?B?azJWSXpBMUlybXE0YlYydy9zdVZ0N1hZc0Q3WHJJVWRWV016aWpxTHBSQmNr?=
 =?utf-8?B?Q0NZTTd3NDJ0VzZ2Smo3NU1XYnNTT3RXZnN6NnltSkh2Yjd2dWg0VmdTd21P?=
 =?utf-8?B?U3BZR0UxV2NpTWdKUDhlOWJDYVBNQjZYS3JNY2tUV3dzVDVraUE0ZVB6VjYv?=
 =?utf-8?B?NzNRUXFXaWc1bHRBYVBJM01vcWt0YWtxZzMwVlM0endkZzFDVzhtNmFXRU5I?=
 =?utf-8?B?RGF5RlVDUDIwamlaZ3NxZjBmRTdKczhRVHc1U1FoWVZNYjNZdHR3NjA0OVI0?=
 =?utf-8?B?U0RZa0FzRVdBaExhQTZ4Tys5ZC9ndE9la1AvaDBvUmxQUUhpT0xTOXNkdmZi?=
 =?utf-8?B?TFNaK3lIV2w5OEE1S0dRODBsQ3h4b2RuS2J6dTgrcnFNRGF3UThDQ2I1dldR?=
 =?utf-8?B?SCtlV1RUMHI4eTk1ekJ1WXcxN09SNFR6amp2T3Z1ZXhWMnJEaXg2MVUrTUpm?=
 =?utf-8?B?S3ZBYlRtYU5FbzNEamliRDBPeWVld1Bka2REU0g1empsb01RZTRZcTVXaUp4?=
 =?utf-8?B?ZE9adlp4VkdSc1lPSmRRQlJ0ZTVHc0lRUEVhV0ZvQU84QVAvaFZyYnNvQnpF?=
 =?utf-8?B?L2dFNkhKcGtsTU1LZ0thTlJEcC92dVRKNEhIbFYrZTNzSWYxb2hDbHZaV0sr?=
 =?utf-8?B?Znl3RlY0VVJ3SDZib1NhVUtMVGluT3V6RitYVXlBZGpQRkJYTTlscU5NMUdv?=
 =?utf-8?B?UHZVTHh1OXJRT3ZpNXZ3dUIySzNyam0vZkZNYkc5Q1ZtSHJvdks1WHZFRzhT?=
 =?utf-8?B?UlRGL0lWMFlwakMzYWZnZnNaeklYbnhiYXM2OVptaWdocXgvZ1QzMTBLUGtt?=
 =?utf-8?B?V0JjNzIzcVpZWERxVUIrK09oSUdIMzYwOFBrZFgyQU1KdjhEbU1PNzZRSHVm?=
 =?utf-8?B?TFNTejBTVkY0YzZFejRsZnhnNjVmcndPNS8wOWdsU09SVko4aDVycFZiamhK?=
 =?utf-8?B?eHBKc2QrTitFYXBSaUZMSXlvaXFYLzR3SUhSNXVUL25NWWtKM1JnZmNrZWs3?=
 =?utf-8?B?YUVQZzRFVG8xbEw1dFpod1JKY2RjWk9BanYxUVIvV21JOXkrbEpkUmx4bE1V?=
 =?utf-8?B?OUtsekg2SHlLRDJhU0xGOXZLMUt6T3ZUeDBXb2VYRXE2MW1RVDY0UWhsWU1K?=
 =?utf-8?B?MVpnVjBxOXlkRUFMUXppWWFQaHhIRy9ZNzZUR1E3ZXE5SDVwRE1pMzZPNDM3?=
 =?utf-8?B?U2VDK1FJaGZvb3YvOWxCc0E4bEpnZ05nbnhTOXNEQlc4T211YnZiTUdUZ3ZO?=
 =?utf-8?B?STRjeTgxcGx6ZUJWUUNiNjE1dnEwcklZUXFNaklUNXM2VjZ2NGRJSXJDV0Jy?=
 =?utf-8?B?a25MaU1ZVmxIanFxNVYzM0ppbDhqdnJZc3NuRzNFdTNZaHpjdWpTbHhVY2ZN?=
 =?utf-8?B?eVJJVTFYeHkrMDVIU0xBVFdxQzNvVzVFQUtiR2JZTVF3eDZTUElvWHd4VGtB?=
 =?utf-8?B?eFZwc2ZCWHVkSjFZMCtSa1dJRE1YNWNaV0VtZWN2Y09qVDRCUDhYSXVVMW82?=
 =?utf-8?B?U21Ja2lXekFZbjU5WitOc0JLeFFZcEcxSzYvdW5RcFBROXJqaHBMTHFybmJV?=
 =?utf-8?B?MVd6M3BGc0pNZktRN3prbDRtbzJNMytSRXd4QzIxTkRQWFIwZHF3dWkvTlNI?=
 =?utf-8?B?d1BSQXhyRDlYd2pVWFg4cHplM0JoMFpyVlBnTXZnRlIvdzdXVGdPSjU5Si92?=
 =?utf-8?B?bGpHaFZJZE5rTzdUbG1LbVg3SWtkVG05aTRrRm9tVFRPem1RaDZnb1RaOG54?=
 =?utf-8?Q?vZ8q2GSVFtFiPPwU=3D?=
X-Exchange-RoutingPolicyChecked: kXFUQQSMVI5ZLZRD2PvuVn7Sdd8S1Tr2x0vPC9Lfr08cTADE3bhNrO5D630skR6dmFh2C2OIjCJaX+LuDDqoWLNhhSwcbvHVfsn3QmapmjzArhztgImBF6zUA8WdagCQmu0HL5DXA/4keHOlNeTWLDVr/oLL3Q13Yx01sT7sfg3sO0IIzK7aqFSluBn10kTJSCa+nhHgdYL64BPrdAEOw3R36QWGdf2haQj0dDap5/6hk0SHld1IW9rJ/GE8V70ZEWpz1OwvHqm0u1lJuZBTRINlYBDy6Gxlr/DArSRYMOS6QWmJl9rGAuoTM9BS1WMbB2lmgSYe+5XosWyPoKoi+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: eae13a12-62d5-41a0-8b09-08dedba63585
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:33:24.3634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hos0iMKgy+K2Og2VJKAoufoQT1nc7YlvJAKBsbhpkZbey4erurb5ptQqDFjAQjS5xnU+zcVhecuvO5QywhG8JNLyaFm1IB5AmftNBie06yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
X-OriginatorOrg: intel.com

Hi Ben,

On 7/6/26 9:06 AM, Ben Horgan wrote:
> On MPAM systems the rounding behaviour of the MBA control would be improved
> if the rounding in the fs/resctrl code is removed but this is not the
> case for x86. To allow any rounding or conversion of the bandwidth value
> provided by the user to be specified by the arch code a new arch hook is
> required.
> 
> Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
> This is currently unused in resctrl but when plumbed in it will replace the
> call to roundup() in bw_validate().
> 
> Signed-off-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

This chain does not look right. The first SOB is expected to be from the
author but the patch does not have Dave as author. 

> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---

Reinette

