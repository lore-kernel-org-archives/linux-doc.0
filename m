Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D7182B7;
	Thu, 20 Nov 2025 21:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675736; cv=fail; b=nFbK+YOINbF8s0fSXHXBTVT7bhbYgSNcmDC0ITQ7J8DPMobGJ+ntjr8dElGWhXW6KcVPiOaYGzIe+mU4wUuk+6WbZTkYkCYaa+u0jWUFBPHmIVK5PDkzQ44fTEokb+zwbF36fr4asg9MzLWlYRlEkApMxAgTQ/fjGypIryEd/j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675736; c=relaxed/simple;
	bh=k72PnU1GLWdOjfdSUechfk6TpOa3C5Z7BsTKSKIyXDE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qRe13hSKz70Cgdl11Nt/e6HbVBRRjKqXRg35qSwM+5XhA0/by3zK663H6HJx0vB5aN2jrlaih2b1yK60wH/lNqQkaMnwNckDtL/1bMYqBx8KUiujfQp+Quo+KBTwBm2vb7f4GlHTQRUiis6RdJCXsq45dk3g0HL4ztkyKbHJoQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+9VvtAH; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+9VvtAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763675734; x=1795211734;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k72PnU1GLWdOjfdSUechfk6TpOa3C5Z7BsTKSKIyXDE=;
  b=a+9VvtAH6RpOjpzKBqNUiwkiohGqdp1Qgc4qpQVkLbEoa07/4FtT0FuS
   TnquXhh7BN4gca2RBL5piOUbQoOgDLs7of+eXPQi6C70YXmEgeln1Ws1n
   ez0gtYj6zUERe0UsduOibemRTLO6Gt5iUBnJQEHzYMtj5JUqKA5DpXP5H
   tJHTncoXsxtTNhAZMTDeFxg2ELf/HI5Ew1ne/nR62AGK5264Ox4XZTPG4
   gm0VQJ5jDTW+1xa+i+7Nrh0rhM3q+j0j0/JSlgEg/tZ6HV/YQwD9Kml9v
   DrRKnHgB6v7OEej7VTte4fbGQdtDLZ1z6ji/wfW6MLPVh+AsEkWs5/00G
   w==;
X-CSE-ConnectionGUID: pwL5+zdMRQ+TTd7A31UqIw==
X-CSE-MsgGUID: lmZOMSirSe2YabbiBgKu1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65654868"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65654868"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 13:55:31 -0800
X-CSE-ConnectionGUID: QXLKajleSbWgslaflZ+ivw==
X-CSE-MsgGUID: pEPMF+0STpW/aRW4zH/R4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="190723252"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 13:55:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:55:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 13:55:27 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:55:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7mrHNPMBmLWNmjOS9FsIFTk4sGXv0d2sy3tRyejH5Anao0C652sj/abVcPYx71UPvRMsbRimskuxHyq90qZvseReFEK0Iw5V7gF9hMk+npna6FxVIaiQ026csusLmwFQ/GImsZwbgLPSgcKwJR0xIlp4VHmgDM9eMXVGSqsZt8A9uE4nEGXJ0+tgXGGCLksQbAbHH80dQhDuSjPQ0PIL++gRph1xEJGjoo45kDkes9IqFBW33c+clIXV8VEDlOYlLn/Jm/55C28I4yPEaS9ib2xhtFK7d1mhF93xKGmwOMvwSxaknsz6YDagn4fBuPWoC+U3jLO02sBHYAPxMHEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzHnkDPPkavxqi2mMOQSmd9xTodlo6ssF6Szvu523og=;
 b=NoGdWP4O6/eQVHVmwLnJJaRwIiTsKJhjCPrDcPumpaSJOi5iQ1/Wg0nswVdAGt8Ow98ZLNxSX1lWcUDJBmexbx6lJQ6YnTTIzxPY14rp6ljbfctUXtBHfNz8W4rvR5U0zP1CEkXzoFqMq4eVyo0/oEOdsGfcfbBDBrAKo+OL9G4VmgSmXsZHqob+8/2eyOVQqqLUl5bCr7TKxiK8kXXkUGBzXHl8phUAQ2zpwuFkw+fhBDFxY8MCk0Kl2Edf1kxxucvUCQDpusWfwNPm9ttzmv0D32p6qNvZYta2ljIPR35TO+NJKWCDL+Lh64Njl3AhCvK7KJcxVCLroTLCzG6coA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 21:55:25 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 21:55:24 +0000
Message-ID: <e5928f9f-8c41-45d1-900f-6801eea775a0@intel.com>
Date: Thu, 20 Nov 2025 13:55:22 -0800
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
 <caa771e1-e86b-43b0-bc4e-09057f598fab@intel.com>
 <aR9KIxMIDrf0V95D@e133380.arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aR9KIxMIDrf0V95D@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 336de343-6499-4302-3fea-08de287f8226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME5qdXNuQ2VCSW45YkZST1lqNjdBem9rd1MyMms0L1c3cFFVTmgvQnM3QTJT?=
 =?utf-8?B?NkVOOGZ5R0ZGVnYzZGxLbXVlWlZwc1RYVThkYlhoekpzTExSTnpKR1ZhdVNj?=
 =?utf-8?B?ODVEZDNDTjJVRmt6bmxDOFpTQlFTQ0VBWlJLVUlRV0Mxazc3L0NYWnY3akpL?=
 =?utf-8?B?Rk1kNDc4QkpRN3ZwdVkyRkROT0syT1NxcmlaNmtEWjViY0FrQjU3N0UvY3NC?=
 =?utf-8?B?dkdKVTJqQ3huUHFva2ZsRFRibUM2V0ZxZDF6TklqV2lUeTdFVzlLM1hRUGlJ?=
 =?utf-8?B?Y0NOSjZxYW9yV2RBMzdjcTdOblBhMm9jOVhGa1dGelBzRHNldVVtdGkyZzdD?=
 =?utf-8?B?ei82N1ZHM1ZwaFJpNFI2bFN6Und0ajF6MEJMYU1NYVFkR0NzbFZOcXJzMjRz?=
 =?utf-8?B?aHcxd1BRbUlneUJkbnhReXdkV3pHTUFTQ1AyOTBjSUJ0UTY2VnllNEE2WkF1?=
 =?utf-8?B?Yy9RZWZBSG44NmdCTVhZSFo1ekE0YzhsWkNnQTNGa1NsYWhZaGR3R21iRDVF?=
 =?utf-8?B?dTQ2K3hHR2l4RE9YVG1PT0NZWGVGQTVUTFVJQUFCb3k4K0lZKzM2SnhLMFNn?=
 =?utf-8?B?b2pjUkIxTDVLa3RYaFB0UzBrVGw4dWtaMXF3Mi91aWdyN2VqdzFVYnBFVFFB?=
 =?utf-8?B?bDYrWTJPQmVJNFpja0U1UThHZ0NhQW9yYU5NdVlreFFJMTE5SjFBbWxad2gv?=
 =?utf-8?B?cnI5QjJPRmRncjl6Qnd3MnFLaWtXM2hEYlJROTZ3UWdxNDlUSnI4OE5zRTRv?=
 =?utf-8?B?QkJUZUhTV3lXZStDZjU0UW1xN1ZQQzBIb2dVYTdnNGlpUXhNbGZFZmpQWkhK?=
 =?utf-8?B?NzVFRkRzVXJZdDRPNkF3anpKeVJ3ckFpN2JsNVUvOXB6QTNXQm1VNzE0S2ZM?=
 =?utf-8?B?TnZOQlg2TnB4RFJndktRbXFXclhrZ1crYmVkbmN0OWNVMTNYL2NoV1lkRGtv?=
 =?utf-8?B?Zm1hRFF4eU91TWZWZ0FDZytaUmRrNU5MUGllTkRJbS9LanR1bHBBUkNNUk1K?=
 =?utf-8?B?TVBCOUJrc3NYeHBKbXBRUk9iNGxCMFJIZ1RCbW0rSXlBZ3J5MVhJbmFpOUtw?=
 =?utf-8?B?YlIydVhMZjVOOFF6WnNHUE5Gb2w2U1FyT0FlbHNhZnl2ZGh2ekR1S2xvYVFX?=
 =?utf-8?B?eFl3cVFTd1pZUTQrdGdTS1FRMnpSQXpHRkZqZmxXVEJlaXJibXVWMWYvMWUx?=
 =?utf-8?B?cUtOc09OeUNjQ0Zhb2tCR2R0RGZPbWJOU0RWNTNlL1RLK25IckJ1WlA1QnJt?=
 =?utf-8?B?ci85SzVhVU15a2dkOW1NL1N5bC96RnVTNlc5WnBVdTdDVEVZcFdWVUZTQnF5?=
 =?utf-8?B?QkFjQ0NYak1hTExmaGt1L0lRQTgyUERKRnNzSTFTS053N296V2NGYnVjR2xO?=
 =?utf-8?B?VHZwaThDS05heEd4OVV4cy8wY1A0ekVoaXYrOUVqMmdZcCtFU3ZIWHZUN0lI?=
 =?utf-8?B?Z3p1cHNRY0svUnFjRkFwNVN5M0ViSEczRzdBMlg4aDcwUzNOeFN5QUlRZ0Rl?=
 =?utf-8?B?dTJnRGNhbElkSmNSa0V2Q21uc0xWZ1pvaXk0TFpQT1NOdDRHNWw4elJjbGNm?=
 =?utf-8?B?emNkTVZYTzhlbHI0ZXd5RHJPYm1jbGZRWUs4R3BrR1g2eC9EaEFyNTJoS2hs?=
 =?utf-8?B?am5wWGVlQUJCMzVTdjZuTVdPZnVRdlhTQk53UGVjSE8xYVdjMzQ3UzJuWlRk?=
 =?utf-8?B?KzEzbHBDZFZRaU9najBxSkJnTkVwRFNJbVZwV3FwRGMra2twclVKbHdMeXcr?=
 =?utf-8?B?WnJIMC9BZ08zTFRtU3Q5NWhWZE8zTlFiTTJhTkVhMTFQbHdwTnF3dDFGdVBh?=
 =?utf-8?B?UmhiY2JBUVRVUGo4WXFHRWtRSUlOb2NOZHltdkpyWTFuNWZmb3hxS3pVNGJJ?=
 =?utf-8?B?cTBTZTNGYWdwdzVCYnR6ZE1TSjc4SE1oMzlJMnNWbEREVFJ2QTdVY1J2bm9R?=
 =?utf-8?Q?nQo5EROgFBsQ63+sGAr2wVeeQMhNQFSB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGZyNUZ0ZWFhUW1WbjNXcDZZaFlBV3hNTHByZTNUUk5weUtZV1RxY3JaRm5C?=
 =?utf-8?B?MEx6azhEK2RjT0NJVElhRlNFYkZ2Y0lqajRnVVIwaklTbitXYkh3MldaN0Fn?=
 =?utf-8?B?dmI3a2N3MzZ1SlRPcmtseW9IVUh3aGc2VzhJTHFrVlNUb2VpajMxNDZOdktl?=
 =?utf-8?B?QnRpYm9ldmpJZVRQazh3M3ZEMWxpV21mTWhZTytVL3dGK0RMVjk5YVkwcTBo?=
 =?utf-8?B?WmVyTFpDQkNEYjdtUjh3MDJoN3VZbmhGYzM0M1ZMQ0ZRTzNlcTFnNEU0TWgz?=
 =?utf-8?B?Tlpvams1MnpCMGZzVmd4VmJxV2FxQUtEVCtiSktlTXhUbWNvRDNiLzY1cmZO?=
 =?utf-8?B?UTc4dUlMNUhTTkFLOXFDY1NOK1lLZis2QndQN204YTRpTXdRMDNEb3l6N0tL?=
 =?utf-8?B?VUhpTHowU2dlTE8vTTE5MzNoMVZIRDZVRG0vcFhXYU43ZmhhRlQrM0Y2TWFB?=
 =?utf-8?B?cSsxRzhtMEw3QWF3MVdOdVcwZTM2eGk5dFV5VmY4V3ZpaHU1d0N3VloyL3FE?=
 =?utf-8?B?blBUdFcweHJuT054cS9TUzNCeG80SXd5eFA4QmZWWGYvamdMMDJleGFhdlFO?=
 =?utf-8?B?VmNtWXdKOG1oMXVUZ1FJQ0x3cTRPQXdSeUZpcEVxUDl6Rlp4RjdoUFZlR2J2?=
 =?utf-8?B?cUZwTFBPd2FWSDcwQXVtT1BhZUY3ZXZ4Yk9nbnN1N2kvTjZycUR1Qnc4UzRl?=
 =?utf-8?B?WDZnc2pRbW9TQ3p0aDFyTW1ubWN5enZJWTA1SFJzRUMzeUhCY3BkUE82b2xT?=
 =?utf-8?B?YVNuUkRkeHV2amJoVXNVT2wyeXVIZ0ROYjJiS05uaTB5R1RQQ21CT1lqbTNE?=
 =?utf-8?B?c1lwWmJqOUp2VjRQd1lRd3pobW1HcXliaUplQ2NhR2o0YStYeitnQXNtcy9p?=
 =?utf-8?B?Zlhrc1lYUFQ2a3JiNHdDWjd3Nmo0Mk5jRHAycE1DNTd2cVl0cWJuS2MvWUkx?=
 =?utf-8?B?TDJic2NlcGVIWGtxN0JMRmxNaHdLZGhpQTM2K29iZG04YmRWZUJkNmQwMTY2?=
 =?utf-8?B?T2ttbDlXY0ZNekJVTXltWnpRMndxbXBXR3RZK3NwOS9nTnk0UHd1M0g5L2Jl?=
 =?utf-8?B?UktESFFGdkViQVVydHNTSmFLU2lTSTI1MFZIYWg5RjlFMnR4T3JZbHFlZDNG?=
 =?utf-8?B?Vnh1QnUyY1RzTHNZRnBaMW92Y3NpRDVrRXMvYk8zdnpMRWNkRERxMndZMTY3?=
 =?utf-8?B?MU1OenlsUlVHQzBrWjR3TFQ0RVgzaGQ2ZG9oSjNmUWQzSTBrbEhDWGduU2J6?=
 =?utf-8?B?cXNzRFM3SnJXSEt0cFVONHBpWEhYcTUwZStpVUFxN0NuS3RmdUtERFROL1Fm?=
 =?utf-8?B?NUdCM29pdWpNb29MWmFpNS90eEhPU3ozd0hLUm5oQm1GY3dtT2dqU1kvRkMz?=
 =?utf-8?B?WkVkZzNHVlZTWXpPM0hwdHRBOGoyWEU5ZkExWkNtRnNJeDhzQTlmblE2WXVR?=
 =?utf-8?B?WG9VMExLcmtwM2Zmd2VydmpNSStLcmptSXhCSmJFQWxrbVcvaDZtckFkYm9k?=
 =?utf-8?B?Y25zMC9kcDFOUFZDOTNBWTZYZWVRQ1V2Nzd4MDQxN2Jsb2xjeXIyQ2ZHVEJY?=
 =?utf-8?B?R2ZhQ2F0TkNJS2U2bGR3SE9ubUtndGk4Ylpjd21ObGxWU0QxWHg4dUUxYTVX?=
 =?utf-8?B?QytOaVZJTldUaUpqZXNMSzV6b1I3SytEcWdRRzJUcVkzZVA1YTEzZEMzSjE5?=
 =?utf-8?B?Q1JmWFkzSUZZSFZxNDZEZ0l5cWZIRGl5aUI2MUFBWFE3N0p0Qk44eTQ0cUFO?=
 =?utf-8?B?YThWNHpqbTVFYUZ1TTY2UENFWUlrWjgxN2tHMzBOMFNvdVV3UXVvYklRdjV2?=
 =?utf-8?B?Y2p4MkliZi9CNGxxblNVR3Vpdld2Y055cGNpdktpaFhZTm9QYWhBdHRPZHFz?=
 =?utf-8?B?TGl0QlZYcnRmbkFhSWlOaDRUN1R3RFVqbUdzb0FlK255dHIyNlZLUzZiemd0?=
 =?utf-8?B?MGt4eFZFeUhabzdKK3c2ejByTjcyU1MwQWwrVlVFV09aMVJWaHJHbnNzdGNl?=
 =?utf-8?B?NDhJYlZWdjZuV2RETXFRaExiTG9UcUdjM0prWkRhSGZqY29wbzNGMnkxTGhr?=
 =?utf-8?B?eTFReTg4a3A2QmJUclkvNDJ1V3Q3Q1MzUkpTMmc1Qk1qMUx6L1JScGhkWDNi?=
 =?utf-8?B?VDlIc2dadXVyQVRjaUtnY3VramhmQXd2V0pwYmJHVm9aUGxuTDRROGgyMmxQ?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 336de343-6499-4302-3fea-08de287f8226
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:55:24.7638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2txBHzcBDPQbcWy3HCfS9RrDlpSKnf7jBkNqOOEh9VtXqHqKx4/CCp927MHMPry9CkF1KxCmL/InNCiW1w27a40RzJkBqsEA2CN0R7ZEmH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
X-OriginatorOrg: intel.com

Hi Dave,

On 11/20/25 9:04 AM, Dave Martin wrote:
> On Wed, Nov 19, 2025 at 07:05:10PM -0800, Reinette Chatre wrote:
>> On 11/18/25 7:47 AM, Dave Martin wrote:
>>> On Fri, Nov 14, 2025 at 02:17:53PM -0800, Reinette Chatre wrote:
>>>> On 10/31/25 8:41 AM, Dave Martin wrote:


 
>>>> With resctrl "coercing" the user provided value before providing it to the architecture
>>>> it controls these control steps to match what the documentation states above. If resctrl
>>>> instead provides the value directly to the architecture I see nothing preventing the
>>>> architecture from ignoring resctrl's "contract" with user space documented above and
>>>> using arbitrary control steps since it also controls resctrl_arch_get_config() that is
>>>> displayed directly to user space. What guarantee is there that resctrl_arch_get_config()
>>>> will display a value that is "approximately" min_bw + N * bw_gran? This seems like opening
>>>
>>> No guarantee, but there will only be one resctrl_arch_preconvert_bw()
>>> per arch.  We'd expect the functions to be simple, so this doesn't feel
>>> like an excessive maintenance burden?
>>
>> Agree.
>>
>>>
>>> (All the resctrl_arch_foo() hooks have to do the right thing after all,
>>> otherwise nothing will work.)
>>>
>>>
>>> With this patch, resctrl_arch_preconvert_bw() and
>>> resctrl_arch_{update_domains,get_config}() between them must provide
>>> the correct behaviour.
>>
>> Right. This blurs the lines of responsibility. I interpret this as:
>> "resctrl fs makes promises to user space that resctrl fs *and* the architecture are
>>  responsible to keep"
> 
> Ack.  It's a joint responsbility.
> 
> Thinking about it, I don't think that the value returned by
> resctrl_arch_preconvert_bw() is used in any way except for storing it
> into rdt_ctrl_domain::staged_configs[] for later consumption by
> resctrl_arch_update_domains().
> 
> If so, the meaning of this value is really arch-determined.
> 
> It is convenient for the x86 implementation to convert this to hardware
> form at parse time, whereas, because of the way the MPAM code is
> structured, it suits the MPAM driver better to convert it later on.
> 
> In the x86 case, it means that the arch code doesn't have to
> distinguish much between input values for different kinds of control:
> it's just a matter of writing precomputed values to MSRs.  This keeps
> parts of the backend simple.
> 
> In the MPAM case, it's more about encapsulating grungy arch-specific
> details in the driver.  The common resctrl structures don't contain all
> the information needed.  We might have to pull a lot of junk out of the
> private headers in order to the conversion in the context of an inline
> function called by the schemata parser.
> 
> I think that it's likely that either all the conversion work is done in
> resctrl_arch_preconvert_bw() (e.g., x86), or all the work is done in
> the resctrl_arch_update_domains() backend (e.g., MPAM).  There's
> probably no good reason ever to split the work into two parts.
> 
> Does that make sense?

Good point. Yes.

> 
>>>
>>> But even today, resctrl_arch_update_domains() and
>>> resctrl_arch_get_config() have to do the right thing in order for
>>> bandwidth control values to be handled correctly, as seen through the
>>> schemata interface.
>>
>> ack.
>>
>>>
>>> (x86's job is easy, because the generic interface between the resctrl
>>> core and the arch interface happens to be expressed in terms of raw x86
>>> MSR values due to the history.  But other arches don't get the benefit
>>> of that.)
>>
>> That is just the benefit of being the first architecture to be supported.
>> If determined to cause headaches elsewhere it can surely change.
>>> The reason for this patch is the generic code can't do the right thing
>>> for MPAM, unless there is a hook into the arch code, arch-/hardware-
>>> specific knowledge is added in the core code, or unless a misleading
>>> bw_gran value is advertised.
>> Understood.
>>
>>>
>>> I tried to take the pragmatic approach, but I'm open to suggestions if
>>> you'd prefer this to be factored in another way.
>>
>> I am ok with this approach and will respond to the patch details separately.
> 
> OK, thanks -- I see you already replied, so I'll respond there.
> 
>>>
>>>> the door even wider for resctrl to become architecture specific ... with this change the
>>>> schemata file becomes a direct channel between user space and the arch that risks users
>>>> needing to tread carefully when switching between different architectures.
>>>
>>> There doesn't feel like a magic solution here.
>>>
>>> Exact bandwidth and flow control behaviour is extremely dependent on
>>> hardware topology and the design of interconnects and on dynamic system
>>> load.  An interface that is generic and rigorously defined, yet also
>>> simple enough to be reasonably usable by portable software would
>>> probably not be implementable on any real hardware platform.
>>>
>>> So, if it's useful to have a generic interface at all, hardware and
>>> software are going to have to meet in the middle somewhere...
>>
>> I believe that we could also use above as a quote in support of the schema
>> description work.
>>
>>>
>>> (The historical behaviour -- and even the interface -- of MB is not
>>> generic either, right?)
>>
>> Right. Even so, I prefer to use MB as motivation to do things better rather
>> than an excuse to make things worse.
>>
>> Reinette
> 
> Cheap shot, I know.
> 
> I guess that more is known now about what kinds of control behaviour
> are likely to exist than was known about when resctrl was first
> developed... though we still don't have a crystal ball.
> 
> My aim is generalise enough to cover most of what we know about today,
> while not inventing pie-in-the-sky abstractions that may never be
> fully used...  It's a balancing act, though.
> 
> There's a fine like between a "random nonportable junk" schema and
> reasonable exposure of an architecture-specific control that makes
> sense within resctrl but is unlikely to map onto other architectures.
> 
> We should certainly push back on the latter, but could it be appropriate
> to expose arch-specific control types in some situations?  I don't like
> to rule it out absolutely.

It is difficult to fully reason about merits without an example as reference.
We'll have better information when faced with enabling of such a control.
Some initial thoughts are: First, while a control may start as unique to an arch
we cannot predict that such a control will remain so. Second, with the new
schema descriptions it should be possible to easily add support for a
new control type. Of course, the first arch that supports the control type
has benefit of establishing the needed parameters. It would be ideal if a new
control could be mapped so that it appears all architectures support it but
I do not think resctrl should make that a requirement for support of a new
control.

Reinette



