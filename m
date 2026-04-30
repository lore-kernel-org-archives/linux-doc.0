Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9075220F2D;
	Thu, 30 Apr 2026 23:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777592426; cv=fail; b=JUeUwxqbzwRNknFiq2YaNS+23FpZlFU0dZUJTOoPvA78GjzEFdEsiGGbJ+i9Rc9W55EG4FlzbktM3GCqt16edt6FEfBlYYtIqe+wGYR4vJp2iSmr7DH5Ks2lDY+NA6cJaWjvzALs6BvJ8oaSs9MBHe/W7xFtohOqMdBrsVZIUSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777592426; c=relaxed/simple;
	bh=fkqYaZIdqQEDtmCSSFFWwIvbQAidyHDMm0zTXm8ogn8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lLATKIEgLQMElWSG9yuz3VdOP2Yz5OgxfNCIrLGcmZ7/1IpIV+G6kdFtfOxI9krlVpm+cGQjZg3eJpNa0zXt1uQbcKXJ1yU3Kl8/QGrQvdbbVqQpGC1S3xJdUFxXDPoPaBE0z2IWIEus6008oQANu0K9ivwJ8xYCkHye6pGHtlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGebeqNb; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGebeqNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777592425; x=1809128425;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fkqYaZIdqQEDtmCSSFFWwIvbQAidyHDMm0zTXm8ogn8=;
  b=oGebeqNbrqDIdOv1VeicsW0SW3mZFRZObrVO9jM0pTHUa0M6eblpoDaS
   iOe/YlCkm4j8Nt9vcFoaw250B2KvWlGYKLxQexsHusmnPm0A8nU8CbBsb
   X7tzjSDkYKCuWOtLTT/tUMhyLdgmMVEwxx7z+riPhilSDSboRcNQn9FIq
   v6BJkl2g7cEsx3WfUFF7ar9CGQdxavpyFq+qXN1PJ5+2wGujfd2R54lQ+
   dpcOVownQDa8JFWL9IZe6eVxj5dM9WqEP2rqDUrqy1gSLE+M9ijVGJW7T
   MaXRScfgLzNK2Iv8QE75TkFWp1EULJznHTHpwDA5OL46aDURe+BWhrCbC
   w==;
X-CSE-ConnectionGUID: O1vUVlQoTgu01V3jda8P5Q==
X-CSE-MsgGUID: tmbp9adTRHOTD7DuqPt7Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82427522"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="82427522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:40:24 -0700
X-CSE-ConnectionGUID: 9Sr/aPSQROqhNPxzHqLviA==
X-CSE-MsgGUID: lpzIh7LeRT2aBBz3kpkY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="238695770"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:40:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 16:40:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 16:40:23 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 16:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZxBtcopemcOrHT//8xVcjkhmh446vKZmiE073+l9xPGj7oU6EaDapJ5EM6/Miy61LdFUKkCbFcYLJ/hnx9sHvFJk3DCZQ8h9ytlBnFdwkehTarBuMTjBhhOJZ8Rxmf04wfC25ZCWMQkFxQaVB3mOlZJ23DzqNGqM3owgk2CXcXBPyjLyxQOUB+D91wPm2Lj57MGN9LUa9vrIFZDU5fN2s6ITBHtzFyWTDWDB773Pf7whbHWsMpRsIessqE9bmA57ViuRH1Am9pazWYla0XY96YFTAFoNpuvwI8BxnrXBvZSRPw4Se18Z6MiULW6shSItIKYhNa6FL3kJGZM0aMHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HPJGdnsIgbOITQU7L8/5ooJQstPvAIknT/wAQB6rS4=;
 b=WWu69QqNNiW3xhJipqzgH1upWm61ksavFAZu2ovqm0xayonz3VnC7UwBU3ibenbHoSkmYTFmD2IcvBy0OZhX7lfEL5OP1/iANaUK1V9pL8l/cGS5geNa5RVN5hEMDo5nF5hU481I1Y7vvAck7VgkZocI8/xcqTTcdglOEVGb7RH+FgjrHSrscrzAs1pOmUwj9mz4GXsKwJURf7dpqPFBGDtUg7oEGtwpfDxGD4WfpywQMNCJlbXxWcC8WKr9iMpsx2uYZbUtj5yrOJccwtn089L8zhVJFqWR8ApQWMZ8EUNX7VVjC1og9vVXVDDq28UA/pPAC0t+Yr3Lkd1+YbKmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 23:40:12 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 23:40:12 +0000
Message-ID: <8939476b-1e1b-4aed-88a3-5b8764a63030@intel.com>
Date: Thu, 30 Apr 2026 16:40:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x86/resctrl: Support for AMD Global (Slow) Memory
 Bandwidth Allocation
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<elver@google.com>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <seanjc@google.com>,
	<pawan.kumar.gupta@linux.intel.com>, <nikunj@amd.com>,
	<yazen.ghannam@amd.com>, <peterz@infradead.org>, <chang.seok.bae@intel.com>,
	<kim.phillips@amd.com>, <thomas.lendacky@amd.com>, <naveen@kernel.org>,
	<elena.reshetova@intel.com>, <xin@zytor.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>,
	<peternewman@google.com>
References: <cover.1776980182.git.babu.moger@amd.com>
 <cb8272dc-4419-45a9-8cb4-110c803e62ee@intel.com>
 <797e863c-211b-46b8-b404-de53f8453527@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <797e863c-211b-46b8-b404-de53f8453527@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:303:2b::22) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c25e3a1-66e6-485c-b788-08dea711d274
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|20046099003|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3EwGF7mn32mSy//54EKdcGG1g6POHOJ36n4MaOpl7g0p93CK5m4rPI1jtb+2oXf9B4me0OsFvmdQSzQVnAaa3EbL5bYCVQRu1UForTywtp1/+J10ZNbe6QC7oCaCL9L17ZsHgRJ+KwexXvIF1Xax41gdhlLQRubEgmsIxjlPPTGA/ZT7i3hXNCioKPVlmNsnDcbkWU7y64WHymYXfcp90FfVPQjsfV49J6Uo7ArQgQ44yR5TYKvxoMvgtZlG97D544pEfcBIM++FEncE+F+xGR9pXKsYsOPMrmtzpKDAaavrt5+JoLnykpoQEn9UXQ674/ar3pf6YZGdIYSr47wu3IRfDaxMdl7jzC/c5qKga0/u+sG3UInXkQW78pGMGEgrPPK4jw6GJ4RvU+5XeX0+dbAWHqoyetAeARuKpe936qbJ5AF1Sd1k4aG53zvKljfqnroQFIbbsdwl/awkjSwxn4j3J9NT4EWdz2W+BiSSxJ1mjj2zXnC8d9PC6fksZwXJsBK3NlfqXYlmlsi+FqBzozSMcW1s1Tqe8/XKwMlct0Z31XuHArrVXKQ/6EwTKjkWz8E3amtRtFWu6i8DFEufbipgz8f2A2AqHNkE3ZGdJfBo4vn0UMn7pXu0CkHsCWnXZOaOH/EWyPYeRkjS95viXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(20046099003)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T01pd1V0aDZ3MjdBb2tVb2pFS0pjSW9wV0N5NEM3WXhLdHA3ZzZvcTVLN1Fx?=
 =?utf-8?B?UnVsYjYxbXh3ekd6Rll2aERsTmR0c1ZKU2ljMmJvSk96TTlsYXpMVTNzVGpB?=
 =?utf-8?B?YS9Rb1J4d3NVSGpRT0o0MUlwSnlKaVFzaElvQVA0eUZCTm1OSllZckttL0dE?=
 =?utf-8?B?SXpkdE1MZ0FtTlROTndsaVlzRDgybjJ1bjRsR2JTQTdSaU1pZHQ3cmNPeTNj?=
 =?utf-8?B?aXVTcjFaVmw0YmVsR3JqTTUraDNseU1UT2pxQ3puZGRxYytYVFhDemtDYnVK?=
 =?utf-8?B?aFFsT3M3MmVNVVAycFVtUW5KNWNIMnBzdENpN1U4UDIrMlh0ZXZyMzVwZ1ZB?=
 =?utf-8?B?amdySG9TU01IQWVKKzNtZnYxZHh2M2U1dDE3b2g2UGF6Um9SS3cvNTlQcVNn?=
 =?utf-8?B?SXpZYlYxZEVZMEEzRHNxV1dsWndIa25LZFlxeEYwMGhLMFFicjY4WmdpaHRQ?=
 =?utf-8?B?aHVRRlhkU1pzZ2pIU1VqTm5yL2FNT3lTZ1FTV05WWGttNldzZ3BHLzkzUHFF?=
 =?utf-8?B?S2JIUndYV08rNHhUc2RtRmFkVGo0a2hrZUhGelZjK3lZc2NmakxKci9nWC90?=
 =?utf-8?B?OXpTS1ptRFZWamtnMHhINTNSWGhXN25OakJCZ3R4OVdOaENiYU1GTGxkRkxM?=
 =?utf-8?B?RWdVSC85MW4zODN1NW1POEYzeHRia2RqM01hSHJ1cVB5S2tXQWhGaGpsUmUv?=
 =?utf-8?B?RHFsWlJjS1pRMDBrZ3g1UHhQUms1K280N3RNUkptYTFrSXdFbEQyOHpBSHdU?=
 =?utf-8?B?d1pPSjFuTGVWalJCRDZxWGVva2lWRCtpdnRncVdsT1ZWRE5VSnk3b3J3SHVY?=
 =?utf-8?B?RlFVc0NyQTJaZ1puVmFIbkk0OUd3MDd6UlE4RmpUR0dKUHZ2bmpvYWtUckFE?=
 =?utf-8?B?N3JVek14NXBuZ3NSSmFMaTRjaXdXL2p5ek1kSUVETHM4SnhuSEdnaWNSVXNL?=
 =?utf-8?B?U3MxYkJXL241ZmpSQkVsbnk2UUlxQ1NXYlBKNW4rWHEwMXBoeTJXU2d4N2Vq?=
 =?utf-8?B?N0J4WGdMU1FDdStjRVNVV2dXQUNWa2VWTVRxNmxBOGhUTnBKbEs1TFYrNmtR?=
 =?utf-8?B?bFBqWG5zcEhFeDBESGlPZnFzWmNkd2Q4YWZ3S096cmlaWHFEcTRkNlJVdUhK?=
 =?utf-8?B?bjBmWDdWRUExSjBRYmV0Y1dsUlpPVGNqUVV0TDlwMFR1RlA0RVViYnBIaFZS?=
 =?utf-8?B?TWV4eWVsQUJoTDBBb2FTbjM4NmJLVnJyRTlnRlJBNCs3L3NjaDQ5cjVhVncx?=
 =?utf-8?B?NWliVmVNN0V5L2NrbjM3MlFvaFZ1YzVldXlHWTh4OEpPVW1jWkxPQmNDZk1i?=
 =?utf-8?B?ZDZxb3kxMk54SE1SMUZBNXNnU2hsR0ppMkV2RjlIcnQvVmlnSVRFNzZGelFj?=
 =?utf-8?B?YU0zMHQ1bHU1Q1dGSkcyTk1HOTRZN20rL2ZVUlJ1Sm0wUUQ0MjBoY1R2L1Nu?=
 =?utf-8?B?QUViaTF2OEsrcGFvSFVKa0pCR1hEWVZlRktibUc5bnV4S1JPNTNCd1JoRUdQ?=
 =?utf-8?B?WmdNQnIvYVVjTFFPNXQ2WjQvTVR5UlZGdFJzUkVKd0VLalFFUDdYOGxuRVoz?=
 =?utf-8?B?ekVIci81a05BYm11SGE2U01kUm8xOVFVMjZYZVhIVEtQUU05MFRqc2hwblFR?=
 =?utf-8?B?Si9NN2o2WFBmM3ZFSG1oY1FoekJML2R1aXFlWFJtNVVld3ZtNWpac3VEQzlV?=
 =?utf-8?B?MG9iQ0FJL1diak1Zc1p1ZGkxb21XdS9hNG5TamlTVkFRYTFjTHprM2UxUlUy?=
 =?utf-8?B?MFNEVjBUNDJnQkErNWt5V0hJU0RaOE11MXhvOUFRZDJIeFpoaG1sSTRuTVE2?=
 =?utf-8?B?TU5CMlIwWkpKTlpJYldva1IrYlFUUFI1M053UUZDeVlsdnJhSkMvb0tsTDJ4?=
 =?utf-8?B?elNYVXVzYXZGRVE3a1BOcktqbk1iRW9OaStEY3RZQnBoZFM1WkRxOWlIUGs0?=
 =?utf-8?B?eUNBOUJxSmZ6amJWUmUrK3hBRTdSa2s0cWMzUDdrczF4cHY3dml1REQ1ejFP?=
 =?utf-8?B?a1R0MEUrVGRGSnIwaG0xMlkzZnhSR2d2OThBcmtPVzJFUUM2YkVReUs3SjQ2?=
 =?utf-8?B?L0MyU2w3a25YZXpxR3VqaC9mejJOenJ6UFVBc09RaUhkV05hREU2cGJqUTRa?=
 =?utf-8?B?dGFoL0J6NnNBSmZ3Y3liSkJUTnYzTTVZMTV0WW15elYvREpkd1Z4NTF0akNQ?=
 =?utf-8?B?VldJSFA3c0pTRkRTQWQyM0NtbkdGR2daTkowTjkxeTNQand0L21iWWJvMjJC?=
 =?utf-8?B?ZThrenpsMlpWdEw1SEUrNkVoYi9iUmJZdzJDaTdsU0R5bm5ySm5CL2svN29o?=
 =?utf-8?B?UVRGMGREeThJZUllWWw5OWtUR3pXd3lPYmdUckppbHFnd3doQm9PSGdEMkla?=
 =?utf-8?Q?x4xqArHSKw/LmEm0=3D?=
X-Exchange-RoutingPolicyChecked: rGIOJXw4arJx+v71bYLan/u1DoB50XE9rVMZRj2T2mqW58ImcQIaRhqbC+VLS37AF3sz600u9RV5dr+Obt2upOGzr+tlkzzCAMpzYuvEQCeo3u6ihVzHc74a5wBjPqeHI3KdDgPgxN3Kw2o3Sb1LhotoKsq/6otFD87CCckYi5Los9FIWmyMAelP3jfHPDR+ZNZ30FdBX5LPyqrwBSxCj0SkJ99Eny8q4avvBi+Uwb5jwvzSmfiNYHYYPTZsHH0n2NMsJwpfDuCJ6riPn/q/jv3ogw+dc6vjaoPtTaQfxzs0nDXKyLf0Cs6R77hcC4ktFszouNM5L8auFbxAWEilIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c25e3a1-66e6-485c-b788-08dea711d274
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:40:12.1789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syhDwfhMpIg/J1nZ1mULgiQKe8kIZ2wNpFgniZgN0PCO6j0wX4zQTtUxf0mzZAWR+EE/tbinU7jauNDIDgAkQ24fhYxl/Hh5rgEzxxZ1m2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:04 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/29/2026 5:34 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/23/26 6:41 PM, Babu Moger wrote:
>>>
>>> This series adds resctrl support for two new AMD memory-bandwidth
>>> allocation features:
>>>
>>>    - GMBA  - Global Memory Bandwidth Allocation (hardware name: GLBE).
>>>              Bounds DRAM bandwidth for groups of threads that span
>>>              multiple L3 QoS domains, rather than being per-L3 like MBA.
>>>
>>>    - GSMBA - Global Slow Memory Bandwidth Allocation (hardware name:
>>>              GLSBE). The CXL.memory / slow-memory counterpart of GMBA,
>>>              analogous to how SMBA relates to MBA.
>>>
>>> Both features share a new "NPS-node" control domain: a set of QoS (L3)
>>> domains grouped together and aligned to the system's NPS (Nodes Per
>>> Socket) BIOS configuration. Although the control domain is NPS-scoped,
>>> the underlying bandwidth-limit MSRs (MSR_IA32_GMBA_BW_BASE 0xc0000600,
>>> MSR_IA32_GSMBA_BW_BASE 0xc0000680) are instantiated per L3. Programming
>>> a single control domain therefore requires writing the MSR on one CPU
>>> per L3 that the domain spans - a new pattern for resctrl. Patches 2/8
>>> and 3/8 introduce that infrastructure so the new resources can reuse
>>> it.
>>>
>>> The features are documented in:
>>>
>>>    AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>>>    Publication # 69193 Revision 1.00, Issue Date March 2026
>>>
>>> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>>
>>> Series overview
>>> ---------------
>>>
>>> Patches 1-5 to enable GMBA:
>>>
>>>    1/8  x86,fs/resctrl: Add support for Global Bandwidth Enforcement (GLBE)
>>>
>>>    2/8  x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS-aligned domains
>>>         Add a new ctrl_scope value for resctrl resources whose control
>>>         domain spans multiple L3s within an NPS node.
>>>
>>>    3/8  x86/resctrl: Update control MSRs per L3 for NPS-scoped resources
>>>         Add resctrl_arch_update_nps(): builds a cpumask with one CPU per
>>>         distinct L3 in the domain, then issues rdt_ctrl_update() via
>>>         smp_call_function_many() on that mask. Falls back to the full
>>>         domain mask if the scratch masks cannot be built. Route
>>>         resctrl_arch_update_domains() and resctrl_arch_reset_all_ctrls()
>>>         through this helper when ctrl_scope == RESCTRL_NPS_NODE.
>>>
>>>    4/8  x86,fs/resctrl: Add the resource for Global Memory Bandwidth Allocation
>>>         Register RDT_RESOURCE_GMBA in rdt_resources_all[] with
>>>         ctrl_scope=RESCTRL_NPS_NODE and schema_fmt=RANGE, add commands to
>>>         discover feature details.
>>>
>>>    5/8  fs/resctrl: Add the documentation for Global Memory Bandwidth Allocation
>>>         Add examples in Documentation/filesystems/resctrl.rst.
>>>
>>> Patches 6-8 to enable GSMBA in the same shape:
>>>
>>>    6/8  x86,fs/resctrl: Add support for Global Slow Memory Bandwidth Allocation
>>>
>>>    7/8  x86,fs/resctrl: Add the resource for Global Slow Memory Bandwidth Allocation
>>>         Register RDT_RESOURCE_GSMBA with ctrl_scope=RESCTRL_NPS_NODE.
>>>
>>>    8/8  fs/resctrl: Add the documentation for Global Slow Memory Bandwidth Allocation
>>>         Add examples in Documentation/filesystems/resctrl.rst.
>>>
>>> Changes since v1
>>> ----------------
>>>    - Earlier sent RFC(v1) with Global Bandwidth Enforcement (GLBE) and
>>>      Privilege Level Zero Association (PLZA). This series only handles
>>>      Global Memory Bandwidth Allocation. Both the features are sent separately.
>>>
>>>    - Documentation
>>>        * Fixed grammar in the GMBA / GSMBA sections of resctrl.rst.
>>>        * Added examples to update GMBA and GSMBA in resctrl.rst documentation.
>>>
>>>    - Major changes are releated to RESCTRL_NPS_NODE scope handling.
>>>
>>>    - Commit messages
>>>        * Reworked the changelogs in all the patches.
>>>
>>> Previous Revisions:
>>> v1 : https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/
>>
>> What are your expectations from this submission? From what I can tell this ignores
>> v1 feedback in several ways:
>> - It introduces two new resources, GMBA and GSMBA, when the previous discussion agreed that
>>    these are not actually new resources but instead new controls for the existing MBA/SMBA resources.
>> - It does not mention or attempt to address dependency on new resource schema descriptions [1]
>>    to support user space in understanding how to interact with the new GMBA/GSMBA controls but
>>    instead defers that to a snippet in the documentation that user space needs to
>>    parse to know this control operates at multiples of 1GB/s.
>>
>> Apart from ignoring v1 feedback this new version appears to complicate user interface even more
>> since now it is possible for there to be a single control that may operate at different scopes but from
>> what I can tell there is nothing that helps user understand whether, for example, domain "0" means
>> the whole system or a NUMA node?
>>
>> We have discussed several times now how resctrl interface needs to be enhanced to support
>> this and other upcoming features from Intel, RISC-V, Arm MPAM, and NVidia. It is thus
>> unexpected that this submission ignores all the previous discussions.
> 
> I think there may be some misunderstanding on this topic.
> 
> Yes, we discussed it earlier. It depends on other requirements (region-aware aspects), so I assumed it would be handled by someone with full context and addressed as a separate feature. I didn’t have complete visibility into all the requirements.

Please read https://lore.kernel.org/lkml/06a237bd-c370-4d3f-99de-124e8c50e711@intel.com/ again.

You should have complete visibility into the foundation of this work since one of the
primary goals is to address the resctrl interface breakage that came with the initial AMD
support for MBA that resctrl has been living with until now. 

With this series you completely disregard attempts to support users in understanding
how to interact with the schemata file and instead introduce *another* obfuscated control. I
will not support this.

Also, no, this does not depend on region-aware work. Needing to support multiple controls for
a single resource is independent from region-aware.

>> Since there are so many dependencies on the new schema format support I am prioritizing this
>> and created a PoC that I am currently refining and hope to share soon. We can collaborate on this
>> to ensure that it provides a good foundation for the GMBA and GSMBA support.
> 
> That is good to know. Let me know when you are ready.
> 
> Could you please share which parts of the feature (e.g., Part 1, Part 2, etc.) you are planning to cover in your PoC?

All three parts mentioned in https://lore.kernel.org/lkml/06a237bd-c370-4d3f-99de-124e8c50e711@intel.com/

This does not address all the features discussed, for example it does not support emulated controls,
but I hope it is enough of a foundation to build on.

>> Consider what I describe in [2] - even in that response I speculate that a "scope" may be needed and
>> this seems to be case. I believe would help this "NPS = 4" scenario. Adding "scope" to what I shared in
>> [2] may look like:
>>
>> info/
>> └── MB/
>>      └── resource_schemata/
>>          ├── GMB/
>>          │   ├── max:4096
>>          │   ├── min:1
>>          │   ├── resolution:1
>>          │   ├── scale:1
>>          │   ├── tolerance:0
>>          │   ├── type:scalar linear
>>          │   ├── scope:NODE
>>          │   └── unit:GBps
>>          └── MB/
>>              ├── max:8192
>>              ├── min:1
>>              ├── resolution:8
>>              ├── scale:1
>>              ├── tolerance:0
>>              ├── type:scalar linear
>>              ├── scope:L3
>>              └── unit:GBps
>>
>> With a "scope" property of the control user space can know what the domain ID in the
>> schemata file refers to. In above example the "GMB" control has "NODE" scope so user space knows
>> that a domain ID refers to NUMA node. If the system is "NPS = 4" then the scope could be,
>> for example, "SYSTEM" (for the lack of a better term) so that user space knows that "0" means
>> entire system. What do you think?
> 
> Yes. Sound good to me.
> 
>>
>> Also note how the other control properties helps user understand what the schemata file control
>> values mean. This is what I expected the GMBA/GSMBA enabling to look like ... and you seemed to
>> agree [3] in v1 discussion. What changed?
> 
> Again, I was under the impression that this would be handled as a separate feature and patch series.

Right. And since GMBA/GSMBA depends on it this submission without resolving this this dependency first
is unexpected.

Reinette

