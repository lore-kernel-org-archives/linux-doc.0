Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A71C3039;
	Thu, 19 Dec 2024 21:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642750; cv=fail; b=jyvpfTtLdpyYQiKnowoWaZf+hbX4SM9w1kPvWX3q+r/ctJIgY57bG/7VkZi0Qhw7OaLEY0YNcHWM1sX6qgqjrLCOuwiz82Dy9kUQ1bXHbZos2Bu1BioT9SZjEEpoUJSfFFBAPOhRQU7UQLq4Rw/eti5jhfVVKecH08mw2wOskEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642750; c=relaxed/simple;
	bh=HFURP3sok3be1vO8sCOpA5Jtpb2aGImeCQhWs/tS9E4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ros0tBxZ39Kg7OrY+csiDCaolJHRyv+ik875S8BgyAQKiUklG5/LD7NibE6sF3yUOeJpnVkSn53FvqByyKZn29P5BYVsdIBib0kaByasn5arxKXIbMjmjKHJOGJlYxQ7XG3ujOkpvjHfr+onhffOguMzigtM3tploQubsXNyVJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+g2a6fa; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+g2a6fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734642747; x=1766178747;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HFURP3sok3be1vO8sCOpA5Jtpb2aGImeCQhWs/tS9E4=;
  b=Z+g2a6fa/CiHkF1RkC15hvr09aQpMd6mPsvuTC36KYklGi75WE9K6kZF
   dw5rLvpxmyzFmtjPMgHbb3ecFW88EjnTan8FgqLAAFn/qd2QEcyGfr5oB
   3pfx2ru0oQfPTWEeyCOuN1TW26m0HRDRs7bw7XVRIQEcdxAzCRO7pfy+a
   fspQkjRLH53Q68SbtfeRu6zj4q4LNXylL4YaJ7YuGfwe4MprMy7gtu/63
   TqSraDCSkDoRiLUufP4TMWgHoLxdFmTipFvo75hdPBW6wFSjYew42T/QD
   EbXI2J8UwgvTWKG6JRcslBKWCw2B8/R9rTvpzRC40fkclbb39Wzyih0Vo
   A==;
X-CSE-ConnectionGUID: +YsbxDJyTl+q77KNSa56DQ==
X-CSE-MsgGUID: +nDgXQyyRPSp+SYub6HP5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="60561772"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="60561772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:12:26 -0800
X-CSE-ConnectionGUID: 7IhxU1inRVOLKAT+cn3b4Q==
X-CSE-MsgGUID: AvPh73s+SJibJ9s1RzjP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98523591"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 13:12:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 13:12:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 13:12:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 13:12:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4SptU1yUfqdubkBhu7fVkXmbReMkF6PLjOoUoLxH5xQXmJtpslEl5WFGulxQm91g6likIT30+DuOLmy1GhZOhaCXXBgSXXF6bgyEzE/QtjtEGvagdDs4zW1DJAJoo3vxGcbdYJz4Odv3E/chK99EmxA/rY6YUD8D2MoF0FStiV+xopNdx68Soeon2GPPFr+T23krnRZLMACYGcirji91SU2YeyvR7afLnIS0Cb4ckI330lmvRLl07Mn+wNLQfVjWn/3LqIuy/CW/0hdTTCbOAXHs1PcXgK+YzxMq/F/9Pb4hRvUWO/Uc1eQ+3wxvk40JjwvW7wKwyEo/Dk/WDAVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHUzGmuwJnRjZ+DmJK55zSgFJX4tlKsKPix3ZoJ0QHA=;
 b=VgqW7iRruWCBOfNH2+hfNBzATFDbJNpwrYXgxHojkEtYgAmzqS/EomKbtIcSaZRCpH/JDfGlEW2n0Ft57rLQfpBCTXdP2oJfdWBo0CxUpsdrQdsAQCeXyvFkyHXS6UYXv6plSrVoEMi4jb3VqcS5LfLPr/zSGy0W29xF1nw3VKtHB1dW9pY3adeCA3jLhsNJkfEWeN08v4SN84wmv4qhjXQnZC2gNQnttrO78VhBsLBhjHuU9IgOPQHdT+jwmOkgGqIGWUwjmAh79HGPL2hH3qvrdRnOGy2t/RHCSod6xIsr5AmSZGP20NNuDDk95pDpfM3jFGYWdAHdvBXTRWrplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 21:12:05 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 21:12:05 +0000
Message-ID: <50a4371b-d7a5-48d4-bb79-b9f0f935b5db@intel.com>
Date: Thu, 19 Dec 2024 13:12:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
To: "Moger, Babu" <bmoger@amd.com>, "Luck, Tony" <tony.luck@intel.com>, "Babu
 Moger" <babu.moger@amd.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peternewman@google.com" <peternewman@google.com>, "Yu, Fenghua"
	<fenghua.yu@intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "thuth@redhat.com"
	<thuth@redhat.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
	"xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "Huang, Kai" <kai.huang@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "seanjc@google.com" <seanjc@google.com>, "Li, Xin3"
	<xin3.li@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>, "Eranian,
 Stephane" <eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
 <Z1tzyrUYTFR_iHuJ@agluck-desk3>
 <e43b10b7-60b0-412a-b55f-96271764faa1@amd.com>
 <SJ1PR11MB60831C44DEE7711F93C3C26CFC382@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <8cffb2ad-6645-45a4-8d05-c967c82eb111@amd.com>
 <f8073d8c-7dd0-4e8d-a196-183acef13d66@intel.com>
 <8e96f411-14ac-4d41-82b4-e3076f1c13f1@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <8e96f411-14ac-4d41-82b4-e3076f1c13f1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fcdd8a-3f8e-4ff4-94f0-08dd2071ca33
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmdsYzVrdGw2R3FXV24xV2RyZVdmUFgwemhYd0tKNWxPUzNyMHplQ1c2akZW?=
 =?utf-8?B?dFV0NnVBVktjbnNtWFlNbXJDTU9SMjlqSVdzbytUdjBXUzNteEhrMFc2UDhN?=
 =?utf-8?B?eHZQTlVaK0ZwaGhnMWpZbWVXL01vUEVBaTZCQnU2THZEdFlwSS9jaC9va081?=
 =?utf-8?B?YjdBYjhUaWJkOTlXMktxaGFPN28xV3lobmVkM2tWK2UzMW1GR1lETjZXdzRu?=
 =?utf-8?B?Z21vakJDRSswcGo3Q3ZMdWkyaEgzM1g2QkpRaEdlcmlEMkp2cStJOXdvRHJq?=
 =?utf-8?B?RHFYZ1ZZaThLWVJ2a2lOLytNSUZQMDNoMjBBR3BXb0RUSmwzYjVJWTd0d0hi?=
 =?utf-8?B?dGQzWnF5YUdnRFZSdjhrV2Nla1ZmTnJNczRzY1E0TTVCSWNRRy9Pa2VIcnE0?=
 =?utf-8?B?K2JhNkZrU3cvL09uRldYc0I5ejdFRU5vVjV5cTNGUmdJa1BCZWhyckwvQit3?=
 =?utf-8?B?SWlOUmxhY2MrSmJKV0poVVY0TTlhZWE4TGtrUmtKcmVSTEhheFhpTUxja2RS?=
 =?utf-8?B?a2RPRklaTVlqNVhlbEtMRmEwdXFVSU15QWphcXFXejRKNDd1djZSZ2hWSFRN?=
 =?utf-8?B?WFQ3Y1RqdXgrengyYTlaNUVmNlpVWkN6R1RORVdYaFJDTENuODJVV0UyalVn?=
 =?utf-8?B?Umd2RFJDZklHQVdVNzhiMmdiNi9TQjgvMWVLRVRVbDNRRFRkZ1Bna1lKbHRa?=
 =?utf-8?B?MCs2Si85SW1oQll6NUorU3BacVNHMDZmNFJKQitaU2hhQ1RRSHhBWmR1Z09J?=
 =?utf-8?B?d0hYR2NmdTFMdTRnNHd3bVVhNHZwUzVSa3BPY0RUSlZRVVRkM1hrNCsvc212?=
 =?utf-8?B?K0gzVkpkTEUrMDN1L3dmTXNkM0JGNytBUmkzbFI3d29udVNwMW9icWNjejAv?=
 =?utf-8?B?cm1OSHdZUkpKdnA4K0JYb2tsVnovZVhZMzZCcDZiOVFPM0NsblByYS80Tk1y?=
 =?utf-8?B?N2prV0h5Y3hDQlBrbzV4SjlkZ0cwMkxTUlFKeGdBMjRzbUdqSWFzN0kzLzha?=
 =?utf-8?B?M0NhZ0lrZ2IvYzVXRTRKdWdsTytTV1owT0hidE1sb2hOZlY3d3dwVDg4UURr?=
 =?utf-8?B?dkZhWC9GZ3Uyc3pkdkdVQkxwWlJSTCtrZ1J3K1hOUW9POHNlcURVS0tDNmNL?=
 =?utf-8?B?SVlBVllSYXNlYzl4cDhVTS90OGxtU2hYRUJIZG9kdDlnMzkrd1VLNEVvZ2ww?=
 =?utf-8?B?ZjhEWFdkbldlT2UzV3VwRHVNRGtoMUp5dDlFMUIxbERBQUdiYzVKUG1sMG9U?=
 =?utf-8?B?bHBEbDFoMkhWajdhbVRIdm93RDFxYThRNVB4M3hLOUtoaS9rR3F3VDIxbThh?=
 =?utf-8?B?bzhQajgzWVp1dUJqckdJWWFJQ21OZXM1Uk55c3JYVUJwbHpLS1lTKzRYSS8w?=
 =?utf-8?B?RGZQc1R5OWJDNHlrZHlNUmtaNHp2WTlxOUV2dmFQMVJaakh6OHRHeGVqUXFx?=
 =?utf-8?B?UEF3SWYwZVV6Q29DS3pITGtTRFdRMmRhaHNTd1ZOT0RnbFhyWHNLdGxjT3lq?=
 =?utf-8?B?Sk1UUHhoemlaZjlQTm5uSnFnL2FkVkRKZENFVlR4dHd1RWtrOCtTZ1lnNEw3?=
 =?utf-8?B?WjlUSHZHcUx3WHJkY290TCtaZGJldVdLZXpWZkZ5OXpZY3Z6eEIxeGZ1cGt4?=
 =?utf-8?B?NTA5OUI5cVFuZDk3MVdLTjJORTZlYVJKT2ZKbURSaHArNmtURHh1MCtSWVdT?=
 =?utf-8?B?N09EcEYxSHgvclhHN0dzMmZSUFAraitSeTNoVnBvYlpRUmtTcWlYVUthYjV2?=
 =?utf-8?B?LzE3Z25LTXhPNlNpQ2h0d1M1U05aNzlYVVBJdHloeXFyN0ZHb0t0eENsZjdO?=
 =?utf-8?B?QlhBb0dvTllncHFuNG9ETDBxNGpwZGVEdzE0STVwbTBMaTRYS3JtK2NDd3lI?=
 =?utf-8?Q?bniw/W/2DBV14?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXdGZ3VwV3c0TitoQzd1WU9aRTFFVS9BTHQrQm81VmNpQk5weWVwSlZQS1Rx?=
 =?utf-8?B?VU5rczZlRWdtQW1oTzIwSFg5RlI0Wm8wZ0NFNWcvR0V5c2Y5NVRyVGYwcG83?=
 =?utf-8?B?NjR3ZzRRdGRyclNkUXZNK2tFcDhXWGNEcHM4aXZTQUc4K2Z0c3N5ZGY2ay9x?=
 =?utf-8?B?T3VTSkppd2VSS29CTWhTa250WG0rSjBBTGRBQnhkaS8vRWNETDJka0FheTlL?=
 =?utf-8?B?Q0ZuSXRXTnE2MlViM01neHFuVHBXTXFtN1NpSWdwSDZlRzNZdkZ2d1p4QXJs?=
 =?utf-8?B?NHlQMGxUK3B3TThrK3hNcU9reENKYTdqazVsNnFPc1lDd0dtZ1hEMzBwRUpu?=
 =?utf-8?B?M3JpK0N3ZjRjZ3YreUxyK09iQ2x4QW54TXYramlNdlBORUxBQ1RoVmVRRFFq?=
 =?utf-8?B?RzN0WmpnSWtHWGxlWE52SFd4VHczV1djTHRESm5tbmV6SVhZbjlUZEEvUlds?=
 =?utf-8?B?dFhTMmFXeTNqclNjL2tCNnNDdHFxbklNM0FJYklDK0FOcDJyOEtWb2Nwb25i?=
 =?utf-8?B?bEw4QkxUbVBIeVNucU5wdnlIQUphcjFlVnhSb09wSUJjVENGcDJuZExrWXJL?=
 =?utf-8?B?bHR4bTZUMXplZ3ZnWDFEbld2VE42S0NTeUtUbTlINHpObU00SWwyNnQwQVBH?=
 =?utf-8?B?OGkyYnZoZjNacVBEMWl6TEV5dGRJMmxNcUdXSFgyK1R5UEc5VDF5UklLWkpU?=
 =?utf-8?B?ZVZKdDdXU2twWnMvdWhGc0pQZUVwQ0J4VUs0ODFtR3ovU3ZkckRSMGRnZ0t6?=
 =?utf-8?B?WnNDM3dtcytRam1GSVV2cHREdW1LT0haaU9oeThwNHhGMUF3OVlWcEtSdUNJ?=
 =?utf-8?B?VW9UaVRYUlhQeEZEWkladENNU0w1aElVYjg0ZG5FRlNzQ2JZbVFkSW9IU0Yy?=
 =?utf-8?B?YzFzbCtpd2tnK3hsT1FpQkczZGxWNlVqeGQ4RDdJcjkwclJENi9uWEVWSitN?=
 =?utf-8?B?S3N3U0swNHRJaFVOcnQ4dDlRQTJKMFE1SVZXL0N3Vk9wMDFWWndMc1E4RWFR?=
 =?utf-8?B?NzlkbGNIczE4UCtzR2hKQ0hKL1pCTXhPQXFwSVVXaDN3bVUwUHpXMUVzSmoy?=
 =?utf-8?B?eGpidmRYMENpVVkvaVBZY2trSndqaGVOMkVXV3pudDFQWWE4SERYeEJiTGhr?=
 =?utf-8?B?VWRkdi9OQnhGc2RjRlAzZ3Z6VVprRGlIckl3Y3U5M2d3MFFQTnRwaE9IQ05W?=
 =?utf-8?B?Mms3ejQzdUZPUzRVK1Q2M3A5dm41cDZOcjRVazRrREFiU3h1TXE3Y2U0eHlJ?=
 =?utf-8?B?dDR6d1JNNHk3SGJSak1NU0Rxa1haYUJXbno3MFNUUTJGbWp0ZW93ZXNNVUpQ?=
 =?utf-8?B?QnJWbHM0bmhkNXUzWkZma1Q2ZUtzSTRBdVJPbW16WkpCbGNzaFNsb0JnNFhY?=
 =?utf-8?B?TTExd2pjMW9wQXEyRGtSbTRRVkJxZGhCRk51MmFNUXJYNG5VYTg1NC90OU1v?=
 =?utf-8?B?by9iaXQxL0FpblVKSS81MDE4L2ovclF3STJIV3lnV2VKZERUaXVzN0Q5RnJ5?=
 =?utf-8?B?cnUwRDlDVEgvODkydFpmN0ZzNy8xdEZTVTJYdGRPMUFVa0loeEdvWEVQQ3Jl?=
 =?utf-8?B?SkRaWTNCeFhXdXFBc0NZdWZibiswMmp4UlpTL0VLWjJyMjJpanc2YVp1ZGox?=
 =?utf-8?B?L0xQTDFCOHZXUGxNSVlpNEM3Sy8vbnQyNUw5ZE9kR0F5eWpBcFpaQ2lSV2R1?=
 =?utf-8?B?S3QxVVBlRXpZeWtMT3g1U1kzUXVYQ3Z0SVI4VnR6WXZDQlE4MWViU1VuMjNG?=
 =?utf-8?B?UlVwZ3hKS3pPdUc0dkwwcnNWWmw2SCsySXVCZW80R0NUejI0ZUdaZldVcnRX?=
 =?utf-8?B?L2ZSNXBSeTBOa2JNU2E1dzMxazNrVWpJeE5GUmp0NFlrYzhUelJPRU1HdGFR?=
 =?utf-8?B?dW54Tllmc2J5US9tNDcvMDNSVWlkOU5GU3hOb0JYd3AwY2lkMEttUGEvdGQx?=
 =?utf-8?B?T01mYmdvRGR6M0thZ3p4NFNQVTFqTzNMM2NsU1EyejhIVzR4NHV5eUJyTjJV?=
 =?utf-8?B?YWxBZXl0Rm9wbysrQ3hVaEluQUtPNmU1cGc3bnBra1p2dy8vREZTak0wemZM?=
 =?utf-8?B?bkpOZWorZmEyTzVyRk5XYVVCYjhocFZoSmFJVDhvOXkxZTZSdE5LYjNmQzZ5?=
 =?utf-8?B?NENLaXFLWnRJWnBKM0tXS0k1Z0MxZWw1azJuY0M3YW44djJPNkE2TkhWYTJK?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fcdd8a-3f8e-4ff4-94f0-08dd2071ca33
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 21:12:05.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0of6Ll9AN6K69x9lBl7sH+6wQzr0mZHZWMfYe5bES0tzF5bkjfFk1G1NJ/wbIzXDfufA6SI040XeMgziwFg05qmweWJ7X25mnW70pHEvZzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
X-OriginatorOrg: intel.com

Hi Babu,

On 12/19/24 11:45 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 12/18/2024 4:01 PM, Reinette Chatre wrote:
>>
>>
>> On 12/13/24 8:54 AM, Moger, Babu wrote:
>>> On 12/13/2024 10:24 AM, Luck, Tony wrote:
>>>>> It is right thing to continue assignment if one of the domain is out of
>>>>> counters. In that case how about we save the error(say error_domain) and
>>>>> continue. And finally return success if both ret and error_domain are zeros.
>>>>>
>>>>>      return ret ?  ret : error_domain:
>>>>
>>>> If there are many domains, then you might have 3 succeed and 5 fail.
>>>>
>>>> I think the best you can do is return success if everything succeeded
>>>> and an error if any failed.
>>>
>>> Yes. The above check should take care of this case.
>>>
>>
>> If I understand correctly "error_domain" can capture the ID of
>> a single failing domain. If there are multiple failing domains like
>> in Tony's example then "error_domain" will not be accurate and thus
>> can never be trusted. Instead of a single check of a failure user
>> space is then forced to parse the more complex "mbm_assign_control"
>> file to learn what succeeded and failed.
>>
>> Would it not be simpler to process sequentially and then fail on
>> first error encountered with detailed error message? With that
>> user space can determine exactly which portion of request
>> succeeded and which portion failed.
> 
> One more option is to print the error for each failure and continue. And finally return error.
> 
> "Group mon1, domain:1 Out of MBM counters"
> 
> We have the error information as well as the convenience of assignment on domains where counters are available when user is working with "*"(all domains).

This may be possible. Please keep in mind that any errors have to be
easily consumed in an automated way to support the user space tools
that interact with resctrl. I do not think we have thus far focused
on the "last_cmd_status" buffer as part of the user space ABI so this opens
up more considerations.

At this time the error handling of "all domains" does not seem to be
consistent and obvious to user space. From what I can tell the
implementation continues on to the next domain if one domain is out
of counters but it exits immediately if a counter cannot be configured
on a particular domain. 

> 
> Note: I will be out of office starting next week Until Jan 10.

Thank you for letting me know. I am currently reviewing this series
and will post feedback by tomorrow.

Reinette
