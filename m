Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBD933A9FE;
	Wed, 20 May 2026 22:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315404; cv=fail; b=nbBwG01zUCv6iu0VPneJX8gQOTh/hwac/0BFIJjO7aCU6YFo6QDxl/i7aqY9TnIQCnDXNASZzuGF8KyNLcHSXfNjvH4PTswYlP8Ae9llwcO6d3KhEAaRVrUfdaeXILZinPjH6AiT0e5M0QwPunVmyiNpEEyVL7MNa9b/5vzrBdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315404; c=relaxed/simple;
	bh=WH33Ri0wYd9ZAdz7Xk7mQB7tgUsTDLcPlaQhLzgN/j4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lo9Gc+IAq9r16Nwef9IFo9L0COmTqejp5rzTu/s0YR5K596PPsHDd4tb/nASZImdfJt3YgIS53RIY+meMpqVaVNab5YpXMp+GMyilFAFlFowbeHUxJ5DG0Vk+bW2cAVWeqCL4lg9I71jqmHcqfD9j2B5hITmp5eHiN29BbK0DW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eS869X7i; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eS869X7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779315403; x=1810851403;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WH33Ri0wYd9ZAdz7Xk7mQB7tgUsTDLcPlaQhLzgN/j4=;
  b=eS869X7i5ykcZCuBNrMe1AjOk7tlPQelYoMZBA4vWjq+Z8lF4SqPhAOn
   E0Aygl054TFKDju70NqIfywwUn15SCvrNRNSId3Uni9Fwwj8kOmUqOwlE
   NGBfeteCm0mUYi/UCD/Vlg2oAcdqQpJebdMOusCxRsGXHQxdNscEZFivl
   EZ7Oul/AFf0yXdzh4SjFnjOoLhFcsIpd4/4mWCFLly6LjXA6Usrfm5Jxx
   XQxKvTNlB2UsWe5o8laXeu8uh4Y6jXy8D1mFhlV4sGiasVojM1kveMX9e
   uZiKgsqxeAzPp0Lesm1LJnC3GghvvR6Pv6RcgrSztsAP5BTFgEEEF2dqj
   A==;
X-CSE-ConnectionGUID: rF1wijKpSMKy213nP7+Ivg==
X-CSE-MsgGUID: K3l3hpKcToCecFTi97OtUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79254631"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79254631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 15:16:42 -0700
X-CSE-ConnectionGUID: kPIUbUglSqyl6pY+g8uPXg==
X-CSE-MsgGUID: oGgSxfK6TuqO+oXfA04aXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240571569"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 15:16:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 15:16:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 15:16:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 15:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ag4sEK/As42Umn5cqV3XYJjGYXWkDZxfslQu5oEV3O31hiGfmVREeqW6VOcw5WUk4G4h6PNSuqWi4DGNvwQq5USdV5GgJlfw5wzF9+rTEt9tlD2PhrB+Xh1eKxacn5aknAyRRgfitaplKVZb89DlLR9vXlJm4THNR2ASTSUxRVnPbr0cdZ3iBa9u0dpOTo9m0Fr43KyNcTmVz7yiCq9jmtO8l0TU7oVOq8jcZHhzjnkvdJWQVDdxYHuc+be4sERg3bhlMjICk3tjaiRljO89ghXA3M+GzenXjCReHss4/o43Iczc90JkWNb4lgt2Zj7WDi3LGf7jg/QJyJpNEBw4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdr8FUUUUmGUTwpqX748PABs1MwDh2qtwaP4ohfw8ao=;
 b=PI31CZRxtmHs798JalkbzKooG5uRSIxNZmnzo8MIgh4qmx5DGRArKEyz0P44uxU6DtUQv2rvrSY+mUNipuaF+wDEHXYH9DAl8aUArLJSrLRCf9VqpeFX0Ab7JVxVMGgqIXvvKdVMADcZCyWUSmpMxJmUP8gPXZIHh0EcYR14cwB+c5+76mxpVOBXk1gyejrAGsprZpwmYFr4u5/p3nkdvm/8lPxYYglGLLYo++meI4P7A5H92rDs3hZG6fzXBeSwKgWLW0G8t3cKwgOGosa7rPuS3K6hkUznwAKepe5YbFr64uCOV15bxsMzl4HHbH/yKRK73XOVzE3mDSs8ebLdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 22:16:36 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 22:16:36 +0000
Date: Wed, 20 May 2026 15:16:32 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>
CC: <corbet@lwn.net>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <skhan@linuxfoundation.org>, <x86@kernel.org>,
	<mingo@redhat.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <lirongqing@baidu.com>,
	<paulmck@kernel.org>, <bhelgaas@google.com>, <seanjc@google.com>,
	<alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
Subject: Re: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch
 hooks
Message-ID: <ag4ywKHsH1Fc15wH@agluck-desk3>
References: <cover.1777591496.git.babu.moger@amd.com>
 <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
 <agzPTMvJ_LdEmKXe@agluck-desk3>
 <1a410ca9-f4a2-4956-8477-033d61a733be@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a410ca9-f4a2-4956-8477-033d61a733be@amd.com>
X-ClientProxiedBy: BYAPR21CA0023.namprd21.prod.outlook.com
 (2603:10b6:a03:114::33) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e040013-0256-4a3a-72fc-08deb6bd749e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799006|4143699003|22082099003|18002099003|56012099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: nRzLxJfWfFkTBfZFmwygXn3Gl9hGKeQNWFqHK18j6ttt3wUeWaJIo7DQR8WTJlIXyjMaGX73/07iKx+GTzMu1FuwII+uw1N9r/KZKntsYE5asBhiAW97LLFywomlUQkfb6zgZB08nWf2nIzEVvywqv8r6q9iMwScqvMcGl26O/AO2PkbONYinDvXaSbafvMKimBv/6jI9o055G2lue5nHygoEpTFc7NR1CKDlkDAW62r5hYSWsIWVr8LUwClxYozzNW+Fh7Mch/tQVHPpCBGSWsO5nxLNcKdlaNWdUSYpcLezC0o+C5VbwVGIWp777rxAF5kxV87CwMk430G9hqbqAo/f/o9dZwNcVHMraOaXVH/u60Wdg1vWzMTFjHqnMgmlHfYpNgzwovqs4LCZd3DimF+P8l9Fb7ZFEmxQwHI+Bqth5X5w+HTxlinzh14F/wBv0vpv4c5H1nyp5NS1FiTRqI7xcBWhMTk6HJNb7cd2NibLtC8QLjjDwxq9yBJAFEtmuJi3SzHqLQGM0Eo1udi+Rmi/CmSP7i/scA7yl597kSzZSD5UQBL4oCvauFj+6l3cvKBK7WwvA7IbqHGjL5pIvIQzHgKsb2byy+yG1RTEwKWy/eImzwqyhTYEYg/h7k9ist1koSIuV5LL4Br8mrFSQaJjA615O1DxYeuAKt8HdEAS4Dqnm5pMn8gkRf4nD8c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm04REQ1SUJiRlRtWDcvdUZERURic3ZlMXNiakYxeWNVeEQxZmh4Q2Rtb09Z?=
 =?utf-8?B?aFl3MVdnM1pZeWxLWkIrZWVkRXJLNVp4RlNrZWRUby9CV3BOUGhicW5yV1R5?=
 =?utf-8?B?NkZXNHMycmg3MWVzMVVqNHhLck8zY0syR1Z0ckFsL1BodlJYVnZQL2VOdHM1?=
 =?utf-8?B?YTdUdlRSZGMyWXErWUlHL05yakljcnljc0lUdFRWdEtIMDVLV0ozRWlNMmJp?=
 =?utf-8?B?TEdVWmlmSEsvY3hiWGVWcVRXVy9rRWVhbHZUTGJ2MmluN0JYN2VtUnduSHZW?=
 =?utf-8?B?eHdhS1Y3MXNhUkVqa3lxYnBEdmQvcWZVR2RTWnk4REc2Uk9zYjJjTk5jK2RG?=
 =?utf-8?B?NWJHNENBdVhVWDc4SXpkTzU0S20yL3BhRkdyVExEc2VnL1VFVkgzWDhlNFRN?=
 =?utf-8?B?SnpPMUtQYlpDTW1nTHU5cHUwdTE1UjIrR1VMb1BUVHZiZDk2MU5lSWhvbjJa?=
 =?utf-8?B?RTljWkZQbHExSzQwVHpkNmRMR2o3VC9iYzZCS1IrSVJrc0Z1QnpNZUh0S1dt?=
 =?utf-8?B?bXkySU1YdEN0S3F5aXNob2xxYkdSdG51T3hkQ2xRVFBWdVUrS0VUSHdBRmo2?=
 =?utf-8?B?YnpiQ0dhUmZ5RE1LZW1KS0dmajhjSzhLUkhGd1JCNzFrK2tVTFJTYUk0NFQx?=
 =?utf-8?B?N01nQUs2WllDYVZUUEFZRjBDc3hyUVFlZEVaOFJGM1d4SlpWbXRLQWV4Mzhj?=
 =?utf-8?B?UTNJVmJRZGhDak5Zckd4a3F2WjVNUm5sM0ZrRkpoRHE0SjVEZFMrU0UzN3hq?=
 =?utf-8?B?aGVGNVhydTkwL2JWbDR2dldhSFY3cExKbGxaNFZiVXZiQnByYlREZU9jTWhi?=
 =?utf-8?B?S0VuTTRyVmtkT0pxYzhGcXp0LzY4S2Qrb1h3UUhlUVlDbnBRUlBab1poTm9G?=
 =?utf-8?B?MEhnRmQ2czdxS1RvQmg2eTZJUm00dStXTmNIT0lPK2FFYnVwRGpnV1NXNHpk?=
 =?utf-8?B?T0NQeXJFUVFPbXEzVHc1ZTZLTzFrWDFyaG1OT1hGUnoySVREZGlaem9TcWxm?=
 =?utf-8?B?Vm5vM0ZIaDRUYU1OblRvVkp6T054OEpwV2daUG9xQjA2eUs5V1lSSVRWcFNh?=
 =?utf-8?B?NnVzVzNidFZiRmhLdWtkV2QzdzQ2V3NRV3JyTlN2TVJZbURaWFR6VXplaXlh?=
 =?utf-8?B?MmF4NUplcGN2TWh0MmhyOG9iaGNOZDlSekZkTzJvYkc1cVY2K2RHK29meENF?=
 =?utf-8?B?KzVZcksxSE1lV3JQcmpVbjJNdE5FSUlKa0l5bk82VGdxUWdFbHRjNDMwME5Y?=
 =?utf-8?B?cHhFNnhwS2xGRGpxUU4vcWRDYkFQMmQ1a0xFUzEwK0d1Z3lPTDRROVVlZklQ?=
 =?utf-8?B?S3ByVjJqWEdxeUdrbDBBZWhXTDNqTmlnTVU1b1RRSi9RY2dzSzN3S1hBRjVy?=
 =?utf-8?B?ZllveDI1YTViV2ZFQ2VNN0JucHNGZloxN3prOUt3bDVhYmlJZ3hiVzVxUlNE?=
 =?utf-8?B?TVc2eW1VUStTTHgxbGZQaWF4a1pIRFQ1NGNiQm1aMjcvemE3L0duWVh4bVJs?=
 =?utf-8?B?VWJmUTdMeSttTHNMNHNCdnkzK205aG9hcVhVL1BwWnl2QnN5Yy9kaWE1dXZC?=
 =?utf-8?B?ckdTVFZZdXRjZlFoSTYzZ3VTRDdNVXRHVDM0bHVjTEM2MWRHM09PektSNDlr?=
 =?utf-8?B?L3RtTWFyY0VDUVh6S0I0bmQ5emNXT3FQWkRVMENrZ3dDdWIvTHE4dkZNS3V4?=
 =?utf-8?B?V2NsWnp4MENwRGNJUTBlVldLTjYwcUl3d3ZpbkR1THJtWXN5ZHNFRjZnMmlp?=
 =?utf-8?B?Wm1oZUcwc0pDeEtWdFI4SXZ3V3Q3UWltTWNQelYyU3duYmlQdDl0NmhWZ0pR?=
 =?utf-8?B?WHZxRXZGaUxZRGdDRmNrVForTjJPcFZkckJHMTdzaytJSGt0LzEvengxaUdV?=
 =?utf-8?B?YTVKV2FJVjBPMXdmNE5rekJPK01yeGhsQmZnclArZk14NVlDanZmNFBqZHNi?=
 =?utf-8?B?L1ZXcTdSYlEzUWRzMnZPT1VDd1hXUUJIMGlVT1FweDNGZ01FSlNmRGVuOXhN?=
 =?utf-8?B?MVVzVmM5cEpZRkJkU1h4UWFPVWZiRHloQXNHTTB0YUxZczVLSWhWL01lZ2sv?=
 =?utf-8?B?T1g2YmxBUUg4aEQzQVFEMXFRV2lad3Jqd0Y5TXBIRVlmZnNUVDRXTitjOFRB?=
 =?utf-8?B?dExZYXVGMzkwUW1JajlFL0RZeXlac2dHL2ROY0YyL25tNU52RVlJcVFySnEv?=
 =?utf-8?B?aHFCTTdMMFhVakZrcG1OTjlZcWVOTElPWGtyM2hiUkZ5akMzamovUjJScys5?=
 =?utf-8?B?VitKcGFscEVpRWFWNmxDcEFydmwwVmgyZ20zQXNyMGowcWpvb1hKTFUwdjlm?=
 =?utf-8?B?L1AyeThYTjREeW5ValF5REVyd2tSMTZneTZVMnp3N1RKVWFlNStyQT09?=
X-Exchange-RoutingPolicyChecked: GONYDtfte7qS8q1lGDdyQIZpj7ogPQNPXbMsC4JcpUhbKOFGxoIjoksYfykHMbvj47jDT0IMErF/4+ceB7N8gVNikvNfZ6kqh/MfeHpfqN0+Jfw+pC7Ydjmxw6q/W1ozzw6rTA90zxOUBnkWm9QMtymMXrJ92MdfLKpGNfjQ1ISebGgEsM33XW11su8u4msFBli2DikG1KPUh3AAB6xCVlTwkohydJTyCaPE8iqj1smcp7ljw+B3xOigg5yN+eenKwKSlaR4qkSvLrY4vlQU/Pbs21F0tuKCN5p8cvsoSUabGzIMIRXLjJ04S/M7hGqTR4LMCLZFDEWpVMXE71ZIXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e040013-0256-4a3a-72fc-08deb6bd749e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 22:16:35.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsvqCHeAwIIhJoBt9Ghe6Nd0joqQ85P7WBeCrw/kvq9/6HdSxC9L0rwFZ9iMYjCPhRcWB7FBZin7oEtx3KiGVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
X-OriginatorOrg: intel.com

On Wed, May 20, 2026 at 12:49:25PM -0500, Babu Moger wrote:
> Hi Tony,
> 
> 
> On 5/19/26 15:59, Luck, Tony wrote:
> > On Thu, Apr 30, 2026 at 06:24:49PM -0500, Babu Moger wrote:
> > > +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)
> > > +{
> > > +	union msr_pqr_plza_assoc plza = { 0 };
> > > +
> > > +	plza.split.rmid = rmid;
> > > +	plza.split.rmid_en = 1;
> > 
> > Shouldn't there be a parameter for the value of rmid_en?
> 
> 
> I realized that behavior is not required—it was actually due to a mistake in
> my v2 series implementation.
> 
> Below are the relevant definitions:
> 
> 
> GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> The CLOSID is applied to kernel work, while the RMID used for monitoring is
> inherited from the currently running user task.
> No separate monitoring group is assigned for kernel work, so kernel
> execution naturally inherits the user-space RMID.
> 
> 
> GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
> Both CLOSID and RMID are explicitly assigned to kernel work.
> This allows assigning a dedicated monitoring group for kernel execution and
> therefore requires a separate RMID.
> 
> Example: For GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> 
> # mount -t resctrl resctrl /sys/fs/resctrl
> 
> # cat /sys/fs/resctrl/info/kernel_mode
> [inherit_ctrl_and_mon:group=//]
> global_assign_ctrl_inherit_mon_per_cpu:group=none
> global_assign_ctrl_assign_mon_per_cpu:group=none
> 
> # mkdir /sys/fs/resctrl/ctrl1   (PQR_ASSOC closid=1 rmid=1)
> 
> This configures all the CPU threads to use closid=1 and rmid=1 for both
> allocation and monitoring across user and kernel modes.
> 
> 
> # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
>   > /sys/fs/resctrl/info/kernel_mode
> 
> # cat /sys/fs/resctrl/info/kernel_mode
> inherit_ctrl_and_mon:group=none
> [global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//]
> global_assign_ctrl_assign_mon_per_cpu:group=none
> 
> This overrides the previous configuration, and PQR_PLZA_ASSOC is written.
> 
> Possible options:
> 
> 1. (closid=1, rmid_en=0, rmid=1)
> Here, hardware uses closid=1 for kernel work, but RMID tracking is disabled
> for kernel mode.
> 
> As a result, reading RMID 1 reports only user-mode activity
> This contradicts the definition of this mode, since kernel work is expected
> to inherit the user RMID for monitoring.
> 
> 2. (closid=1, rmid_en=1, rmid=1)
> In this case, RMID tracking is enabled for both user and kernel modes.
> 
> Reading RMID 1 reports combined user + kernel activity
> This aligns with the expected inherit_monitoring behavior
> 
> 
> The preferred approach is to separate kernel monitoring by assigning it a
> dedicated monitoring group and updating PQR_PLZA_ASSOC to use a different
> RMID (e.g., closid=1, rmid_en=1, rmid=2). This is exactly the behavior
> implemented by GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU.

So maybe I'm just confused by the name "global_assign_ctrl_inherit_mon_per_cpu"

That sounds like "Use the CLOSID from PLZA, but keep the RMID from
legacy PQR_ASSOC.

So:

# mkdir ctrl1 # maybe gets CLOSID=1, RMID=1
# echo global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" > info/kernel_mode
# mkdir ctrl2 # maybe gets CLOSID=2, RMID=2
# echo $$ > ctrl2/tasks

My shell, and all children run with CLOSID=2 and RMID=2 from ctrl2. But
when they do system calls, take page faults or there is an interrupt I'd
expect the code in the kernel to run with the CLOSID=1, while inheriting
RMID=2.

To make that happen, I thing the PLZA MSR should have rmid_en = 0. But
the only code I see that sets this always sets rmid_en=1.

> 
> Thanks
> Babu

-Tony
