Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38EE37B402;
	Thu, 11 Jun 2026 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781214803; cv=fail; b=JCJ4xZwlnJ/89A1NQPjW+IOU3Ie2tc/Kn2yCeIVKDkklcrVLsfvibdLdx87mopqCIBqTrZTH4d4B+pG1RrvPmrzNNW+/CG9yU9ZxLebNgSFcp/97bAlRr+aEEJXtbuAOPqzFs3YeOw0uhzXsV2+aZ1zbOFozM6lptX9tWkc/bGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781214803; c=relaxed/simple;
	bh=qRS8uGXIfisqsXMnUo5b1d17V8co4st5csoa+DBaLck=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ChV174ZxQl5QnZEWIgsKTNt67U4k7zVk+ygXLyKXTeM8byJoUs6JpsMAA5xkly0ZXR/HUgjBAJDg5kCVcm63/KbJ52iHaxyEj3NKNrSgsKnBHJJEjW8sFWSE+6JPMIcFfGJw52oXrSbZ9W33gI625omcTNMNcMEerVQGHOnWSuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJEXLb4K; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJEXLb4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781214802; x=1812750802;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qRS8uGXIfisqsXMnUo5b1d17V8co4st5csoa+DBaLck=;
  b=XJEXLb4K4rHLEc8+6Tiwm4d7P5yn5e+WIyQA1Vomcq0+5BJpAehjqvSG
   mskwl9S7JVGvlMtWjSAcT10EXHLIWJEFvw5yRjiQO3dL+SMLT3ksNPT7H
   2nDT6IRzBW1iE8VafvHdf1iVry4VGRtLrYKzRHfJI4OE8LPm6Y5ILGwHz
   l15LVkEB4sYMNCs2viPsURtNqDCk7Az9lEIa3nU+mE1IhLTgpHBZFaYZ7
   9/hFjmW8EWniMnBAll4yJD237zjpoSQtyz1eo7dVYvx/LPoOnnTrgXTsB
   Ny/aABMgBb+vxCZsQISALNSoBMRAm0+Hwy6rEOA0PggIyxRksjx+v6RxP
   A==;
X-CSE-ConnectionGUID: T1c/6F1eS6Clkw93Ib4GgA==
X-CSE-MsgGUID: n2BZWvgVQhC8Df/UT6EJ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85942061"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85942061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 14:53:21 -0700
X-CSE-ConnectionGUID: JPhfNF3ZTBGuhjpkOG7QYw==
X-CSE-MsgGUID: Box8wo2xT1Kzom4wgmD/dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250555298"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 14:53:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 14:53:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 14:53:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 14:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL7w1swG7Hqb80hofZ8ugdLtXlVIPqzurh+mw1pQD1teWnWIDbuU8WzdjgRuqVH3SHiUOI/xeCxI2hZKeAdZctTkHLl50cunCio/k9eklkUqo0mXeAXpv2ScmqOZBMQxQeeheSRx8r4aKZ3hJWzjKFwMeqhHSAimE74ZLo6FnB1a8V2dM7LACAgwoG5SGfnrZl3rSMymEvwzuQx57TuHqeHQr62GAl2Ns/NL5oDQPXZkp4xVMClrPcSu+KGPTIDOqaaFPm5X8PBFWK1Bdp5zt8+mxxU3wd/iuXo+w2PloQdCZYXIwsSc7/B3FiDHWli2j7U4OADOPQ/Cpp9HmwJaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0VTtk0zwg2TYY8TXOXaWM3iUfrGxOmqvuo8FR0e3TE=;
 b=s/9QHn2TgirakMy2U+WHQH2irZ7IeKqd5i4EdrZ9/9i0MmwZemF+4zhopAkrTytJGvBzxY6NVl4JMsu/XstY7ysx12NpxOWLzhdVJmtOY79eMI0PPElBn4iry0ndv41003OxcQlmrp29BMBJkxfZgIIfBBtolmIQRFxAngYbvt4+dR1qbJMjvBJYn+1Sc25Xm3m6Rot2xyUYZJ+ge05/A7HDVfyyoDKOC3FX+IWxOmyWiIIMI234yZY9kc0/15Q3phVPWrvfKSajekC7Xp54mkSJiJWtoG/lnEtwkdl6vaN3TD1VfQXbIK3q3k5w0lcMNP+qvKUNi4VO0AvXxc7bIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 21:53:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 21:53:11 +0000
Message-ID: <a1dbbb1a-ef78-468a-a80c-572a85220bbe@intel.com>
Date: Thu, 11 Jun 2026 14:53:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <cover.1777591496.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:303:b9::9) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd4cdd7-e583-44c0-91be-08dec803d4b4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rgQp7Y8gyqlw/9ywNfLJj2W/6LS9yGg9yp8zW1k2/SssvZXdLjLnNVpun3y/naJ1BlGSBGs/CsooUOb6lRuoWNa2OmGVVQjpOVQaWxVdJHcZyq8LPOnLxb6w69LFQsW/bM14OtivGIqWBYWxq0VuMCLgzDuBPjHSEs/gcfTgKbm4xvE/2TKcmuX5lfHDswQMUuvqktKVEGetOGTMRq3PaUhIiI+1NBwnTCocNsrIbRn5dBcoN0zeUhhSHln4h023rhORvU+RZ2ayKzwHkW9wpZaLMNcnitamp3pYOxyYiZy9mqsSao+Xo0l10rMEfUQN3WlypbRCqklo6JPdTb0IPr8h7OUxY+xpFbkYHWeEqZDnEU37XFvTtI9DURigksL1m6P8qYPvbV1BWt5qNH8iF0PcfQVMDGkirJR+AWnlAh25OjK8jE2MFbe6wO/dmm0hUe2AWgGUWCodz2VNnpo4BBqiXQo/Q2J+05K5LeH8sLZL7vlVf/kANIZXSY3ph3s3QLzxEJHwhX/9mTPtGKK04ycD5Evo1sQjBgZ0OdBLZ1SBf74zm2FOZaGAasWYuBWHLnYPsnAfnLaPg7qDZQstNaaiSH1IDQw98PORvBuSkV0l9iO5yynxqtjfBeBn1aE219GM7GIN8c9Q+NS6z6jDwG1VBlbF4x9b+8ruVoq50qmsJTEpVg6FzpVREACYhV07V1x44TqT23cm//9z+W2B6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFN0Ym13QTVmbzZrWEk2eWlMdkNoRkRDV01DRlpQYWhrYkFVMk9UQ0Z1M3Rp?=
 =?utf-8?B?bklyWHFJZFBMMTNSRkNRWmVzQnhML3lCbkJ3L3lyTjBXZTBuTTdEVjBVcWg5?=
 =?utf-8?B?RGNzWDhLb2F1ZVFpZ29ycHBLelFOeCtJTUFGaCt0RlQyQllKemdaSUF0QzlI?=
 =?utf-8?B?bmVWQThESGNjcHc0S3dwUkpMcFh0eHVwUnQxRGdHM1lMYVlCSlhBSFVRUHEw?=
 =?utf-8?B?QzE3OS9HT2h5b0hQcUhJa3Fmay93b0phT0xCV3JpcHFwbW03K2grM01rUWRa?=
 =?utf-8?B?Y3RLcFo4bysvd25ldytoZ3R4RTIrTVhPN3BYd1V6R0wrbi9UdDZmQTFEdklI?=
 =?utf-8?B?MVFuZDVhWW5FMnp3cWxjeE1HZDdHcHEyZ3ZLZExYcHg2Z1pCcEY0WndTKzhW?=
 =?utf-8?B?d1NOUCtxUG5UZ0xHZ09ZZkw3bkphNU9oQ3BwQkRqWmZqcXFsNy9vNTFPZFFt?=
 =?utf-8?B?dC9QamJEYjJsVFdCUTRUVlNKR3FBQWpEbGtadGxwdWU3OU9CZi9Ka0Uzd0tK?=
 =?utf-8?B?OTNjbzd5K2F0Y0JiZ2lZK1hGdmtCaVFVOVRwRWFSZGpDV0dlS2NxeXpwTnQ1?=
 =?utf-8?B?V0F0cmYzdWNwSFRYN0tzU1QwNFhvR2NON2J3K3IyUHJINUdEbkF5TFdvUEcv?=
 =?utf-8?B?RURHTGg1bGY4YnNMYkhiajNVS3lNRWVTdWhqVldrRktEQTlGM1BjQUk3bmho?=
 =?utf-8?B?dDIzbjRSQnBUTW41UFpsVFN3azNQOTBHV0NhUE9Fa0VqWDM1a2lUWG5sV1lX?=
 =?utf-8?B?ZFBiVGhkME84MkFDSHJiQWdsSnZ4NFRBc2dPcllpcG5uODFlaWphQUFUdHYr?=
 =?utf-8?B?YjI1VXE1ck9EWkxwK3BTcmRvSzEvSFB3aU44cXRpN3hRL0U1NDRnVlZKcEcx?=
 =?utf-8?B?WVM2VXViZTR3akhBRjRaczIrenNWYlBySjRQZnRRbmlweUhpV3BmSnFxSURV?=
 =?utf-8?B?amxJUEhZMWcwVzFMZzNwcXlPTG55NUJWMStCVDFZejd4VzRiaWYwdkhOTlB4?=
 =?utf-8?B?cUVjM1hQL3BRQ0FnY0RScU1XczNhRzZ3UWhGNWFpRzVGUHcreWJKcnVpL1ZB?=
 =?utf-8?B?a1dOa0pXWGZSU2lJUWMrQVJUOHBPNHNqSlE1RGh4YlJRaDVJT1FIc1pvQXRZ?=
 =?utf-8?B?UDVhWVMwVjVuNExjNnFweXptaVNFbm1UYjhKNnJ4S3VMNUg5Qkd0eWZMNFEx?=
 =?utf-8?B?VVZid2lrNGJhWEtsSlBLeTNjM3kxcmpTOXcvT2tTeDFXbEdPUG5CdHNpMkZM?=
 =?utf-8?B?NFZ1SU0vQnNwaElndnV0UWpKRGxoQ3dCVTk1RmljMXNlbEhxeGlDeVcyT0Ry?=
 =?utf-8?B?UVdSSUFNbDJpS3liM00zS1FNeE5FRWJjNHdCZEYxUlJIYTJNWklGd2IyU0hx?=
 =?utf-8?B?dDVybXgzY20wdHhZTSs1YkpaZk9MVDcrSmo0RVdnMTFld01RU095QTFVQk5a?=
 =?utf-8?B?MG5Lb0pZdXplUlZ2cnRRb0piRGcrSXJvYXpxYWJaQmRIZDBvd05GaGhZc1hV?=
 =?utf-8?B?aXM5RU9xM21SVmtmUjkrRGYwQUR5Y1VpMittdTJqUnVUSHozUEttaHhEZEE0?=
 =?utf-8?B?TFFsRGF0TFVpQUdsOU1PMmNkWlJXVm94ZHZsSHpWTHpNWnFJY0pCNWd1Wmtw?=
 =?utf-8?B?YitxVVE1TFZEdy8vRDBUem9JQXhTbFB5QnNPV1RzVkhtMlgrT2V4RXQ4K0R2?=
 =?utf-8?B?OU5oMDNwdjVRU05ITmczQXpVbFpDNjhlYzlvd29wcW5YMU91dTFuM0wwV2V3?=
 =?utf-8?B?V0t3bVZVVVltejRiTTRVeUs5SkFpTWVZdFo0YzRvVVc5YVN6bzZOeFpvRWFW?=
 =?utf-8?B?d2tCL3B6aUNNdUk3Q0tyREV2Z0Z4RFpOb2toc29zaWFGZFRIOUZyNzhzM2o2?=
 =?utf-8?B?MThXNVhGaEduUCtVNGNwelpwTUZxMzlRbDU2NnBTeDczSnAvSmwzRW9ac2l3?=
 =?utf-8?B?V1QxNUhXbjNWZXlXRThHS0tIWHhqQVdJYzFsWGd5clBWZGJCdVc3SzB4V0t5?=
 =?utf-8?B?SjYyR3ZmZnAzMjNxQ1JMaTk4WlRZQ3M5eU1maGpIUTNCc3FVQ0NkZm44TUZB?=
 =?utf-8?B?Qk02clU1NDd0OVN0UjhxTHdLaWxqSVpaQVQzcVdxUG5jUDJFNUtsblpCLzFq?=
 =?utf-8?B?K3VqeFRzUisxanFXeEV4U1dSZTZnSnpES0szWkhZZER6NUdGSDZJZXJFWWs1?=
 =?utf-8?B?VVd2eHNHOWZJc015UG55NVJWWks1VjIrb2plcUNXbXlxQksremlaOWRZNldm?=
 =?utf-8?B?bDMrdlNrQjNrQjM1MERXZXJDcmJtZldFbzdnRWNOTUs3M2J0RzdkL3lrWHJF?=
 =?utf-8?B?TkxwVWt4N1lRN2RkSy9ZcHczSjY2SGY2dk5raHRZUHNxd0tBQ2tpU0w2eGhJ?=
 =?utf-8?Q?7hGSmsNrCuP9S/Tc=3D?=
X-Exchange-RoutingPolicyChecked: sbd/oJdGbDInDur7czipY2QV1MggXkck+9xd1og2V08DiWzWCC5ywB7fFJ5lge9pYvPSCo85Mw2C8xjR7NGczZTtCLGt2ky/NNdqMLa9MkI68DguBavWmj/R59j/vRi/+9Zc+Ao6yqF47CDHoNoDh5F/c2KzQtSy64/nuCrucjemQHYuvG7ehFRVmVoIiEdSIfefNFjheHWlyA0fU1+CIIQhZQYq8C0z0UcIB5eOC9742vqtEoK7znhET6iWSWy58bt34qmC2O0nGFD2iGd0yVWxxGhMYFIV1RbvXgzQOcCJKnaqyOJf0+smaa3NCF5vSHvonemBCU6Af9Az9Op25g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd4cdd7-e583-44c0-91be-08dec803d4b4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 21:53:11.3830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdX//cmeaw8aEMmPeRmCq97dncmosKtLc3LKX6Ce3BI587r+fvN0mqqzhC0vcqRmpI7ccMhqoFYmYnjZfZKXpaLHkTPuyTXzKacPUiL6UuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> Design
> ======
> 
> A new sysfs file, info/kernel_mode, holds a single global policy that
> selects what kernel work is steered and which rdtgroup it is steered

How should "selects *what* kernel work is steered" be interpreted? Do these
modes not all apply to *all* kernel work? 

> to.  Reads describe the supported modes and the currently-active
> binding; writes change the policy or rebind to a different group.
> Look at the thread below for design discussion.
> https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/
> 

...

> Examples
> ========
> 
> (See Documentation/filesystems/resctrl.rst, "kernel_mode" and
> "kmode_cpus" sections, for the full UAPI.)
> 
>   # Mount resctrl
>   # mount -t resctrl resctrl /sys/fs/resctrl
>   # cd /sys/fs/resctrl
> 
>   # Read the supported modes.  The active mode is bracketed and reports
>   # the bound "<ctrl>/<mon>/" group; other supported modes report
>   # ":group=none" because nothing is bound to them.
>   # cat info/kernel_mode
>   [inherit_ctrl_and_mon:group=//]

This is unexpected since associating a group to this mode implies that this
group is used to manage allocations and monitoring of kernel work but this
is not true, right? From what I understand there should be no group associated with
this default "inherit_ctrl_and_mon" mode. 

>   global_assign_ctrl_inherit_mon_per_cpu:group=none
>   global_assign_ctrl_assign_mon_per_cpu:group=none

nit: "none" does not reflect state as clearly as "unset"/"uninitialized"/"NA" 

> 
>   # Create a CTRL_MON group plus a MON child and bind both the kernel
>   # CLOSID and RMID to them.
>   # mkdir ctrl1
>   # mkdir ctrl1/mon_groups/mon1
>   # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/" \
>           > info/kernel_mode
>   # cat info/kernel_mode
>   inherit_ctrl_and_mon:group=none
>   global_assign_ctrl_inherit_mon_per_cpu:group=none
>   [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/]
> 
>   # kmode_cpus and kmode_cpus_list are visible only on the bound group.
>   # ls ctrl1/kmode_cpus*
>   ctrl1/kmode_cpus  ctrl1/kmode_cpus_list

Since it is ctrl1/mon1 that was bound, should these CPU files not appear
in ctrl1/mon_groups/mon1 ?

> 
>   # Restrict the binding to a CPU subset; the write is incremental.

Does "incremental" mean that if the file contains CPUs 0-3 then writing
"4" would set the CPUs to 0-4? This does not sound right since it is
expected that user space can remove CPUs also?

>   # echo 0-3 > ctrl1/kmode_cpus_list
>   # cat ctrl1/kmode_cpus
>   f
>   # cat ctrl1/kmode_cpus_list
>   0-3
> 
>   # Empty masks are rejected; use info/kernel_mode to reset to
>   # "every online CPU".
>   # echo "" > ctrl1/kmode_cpus_list
>   bash: echo: write error: Invalid argument
>   # cat info/last_cmd_status
>   Empty mask not allowed; use info/kernel_mode to unbind

Why are empty masks rejected/not allowed?

> 
>   # Disable kernel-mode steering (back to inherit, default group).

This sounds like kernel work is steered to default group which I 
do not think is accurate for the "inherit_ctrl_and_mon" mode.

>   # echo "inherit_ctrl_and_mon" > info/kernel_mode
> 
> Tested on AMD with PLZA; the generic bits build clean on x86 without
> PLZA support and are no-ops at runtime.

Reinette


