Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B58438FF2;
	Tue, 11 Aug 2026 23:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786492288; cv=fail; b=nmypvf8FlpM31CEmtXIFaHxG9HhrT7IzLRRlS4PSbTVzUdehPXMz7nEPfgbV+Zp/JtpGb8/cBmo6+ofpjXhjSiDeStREsSvHL8ozkmHG4TgSPlnLTV+Vrzrm4D0wpAf5diANPz8CyplFaKiTRf9uQIoQ3pz8IN7ESZLQaWxx3TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786492288; c=relaxed/simple;
	bh=IuSsc6qb+42vQHovIFMsRaWVeXMkPzuNW8o7/rwo3SY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gHVI2jmOEG5QV6Djb/lS5152VzXjGBJBYe2LDew+JtvjDTltgE2eost8EY9Xynxaq840sY/j1yvcVmZwNhSDhkIaMyQIGBzxapljCSMAG2A67MYcIXkbfoeQgAxy/5VA+zz+4W+Lhx1KL8+1L+lEUPcdAUUTNpXjvvmRHMMPG4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhgHXLqT; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhgHXLqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786492286; x=1818028286;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IuSsc6qb+42vQHovIFMsRaWVeXMkPzuNW8o7/rwo3SY=;
  b=YhgHXLqTzoxEfBSLuj6d8O1hfgbvHxgZQIskx+Af3SLuwKVfgzggItbn
   umbFC5UhiST3COmgOsuNdrfM62fEofmFD76wQlHHZkFEvik8gLdM+epvE
   5xlxztY2UvgpJvmm1zg6sRkaxi3vbeASm7r4QY/UpTFww2cBxjeBMTnqp
   tCur/uclvG/z2SsT+vuJfbM0o5VZj3AFvlzAoyodCVD6dqd8NpD0/dJj9
   Jt1JsYiy0UiAJF2hvhk4X7wv3xZ9X7MU56QfM1B7yrkBdzJodou4qWPkh
   fedfha4zVDaDDL/ImKkBdB6YZz9NrrK8HAuXBl5dEeVgSgvgC0+1Xk156
   A==;
X-CSE-ConnectionGUID: S0P/ngzPS1i0hfvu6YcxqQ==
X-CSE-MsgGUID: gi5I5/fYRX+UzPevBGHOhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104419770"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="104419770"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 16:51:25 -0700
X-CSE-ConnectionGUID: DeipzUeMSE+fnXrF3VVJmA==
X-CSE-MsgGUID: +y2+kzArQE2QblwnBPMK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="259629111"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 16:51:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:51:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 16:51:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDRjA/1goQaNijmYsJV7SxRGYj7R09K1L66iQ42bFvfH9u6ejUvy3+/H9OWTXNYRbjPYW5yN8EpC3WKs6lnCrcjdHtNV9lRoR1AekEx54aGN1oUyfX+5ZRRUj+6lnEOkaIecY2zkE5e6FNXIi36W8YZCDFhiGzxGdLpgqIDYNie6u2t1O+mnutDGu5T/aWviqCWIzy2015YaTZ05IoEsXQwiBmgfdSpgssFz+7yI8S8X7/y/Jy/DzmDpzKYp0wWXcvvlTb5qKylq8+Ypp8q4uqB3SOjBEh+UXwRdV/1pYWTdKBEk62wK2xlgv+wY/jXyBjY4bf8r6xWQu34Xo2yltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhjVs5vlTaALhb4OabFqGgD399Ng/PAdS2DshJgfwjo=;
 b=ATZzyQtqze3xZoUsneZrbU7Eqkdx21EZy5IbtC4g42YN+XGNGwBkmQPoZZHTQsps4E/haDWUmWE2QwuT5MADV9scCaICGe+Ya6H/g+leqFcMd5XH2WwjaD9Jnrdl/+BWnTeSeiNVLYEHkwKzzuJVrW9CS5ZVfg+5+AGuJrKaQUQ4FNJRsIBgLx+wUx0/arh0q8Pl3I/MTyj2pieTw29hAvN+cz6V+NmlhpcQN76MKO7kuoYSN6u4APZXtwUpeYV5un1p53XMBFCciGKRar439InjCZb80qCF+Hw5poQeIvIPiUKht4d/YiCWe3IJAbCZjAdEiicx4UjVg4vTXySdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV4PR11MB9489.namprd11.prod.outlook.com (2603:10b6:408:2e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 23:51:19 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 23:51:19 +0000
Message-ID: <0cc07711-3d81-4785-81dc-804178fb443c@intel.com>
Date: Tue, 11 Aug 2026 16:51:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 03/15] x86/resctrl: Add data structures and
 definitions for PLZA configuration
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
References: <cover.1783461016.git.babu.moger@amd.com>
 <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
 <a3bcdddf-70bd-43b2-8483-7f018bd3c4b0@intel.com>
 <ba27f90f-6cca-418d-82fb-fd63fb015b9e@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ba27f90f-6cca-418d-82fb-fd63fb015b9e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV4PR11MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ace400-bcc2-4839-3925-08def80370b9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xyVpjgL36kW2xuv0uRdC+TgYHoaZXKjIcrTUUfoKnhuPvlrMVYbfbM46Qjnes0To2jH+jC9lhu569OV6G0HbzVbgy4j86NI5zJ0Iop+6RsOcxHPe6MoT7mOIDz6Rg+fwBqHerVCfL2C3ZO8Eh8l+tEMcS77gt69UTzKVXLJajL3xrzH3wMBQBx80+tg91hWXxxj/Du2SjOYIvneZXcPJBH7NNErmYZV0a3PPXCJxdkk9ZZb+xZlOe9s4wqOuwCxAGCiWveTkJMre10J0uU8x2Rk5LVL4rodcYkoBf7ncK2/TuhXShBkvIesAvCBylrZyKyyEy0xYVN2VY55XRCfjdtmteHqJicadtKpRUBGvVatV0cK/DfKbxltu43h5+fEmU85qoqDBLS67RkxTB3zNTUCc6ZT1l3cRtIb09onXF5xlhuiBiJq2dLLw7+YqRJvZrBSk8fhXv2KfpGZjJHPjcZWO7B4h33L6WsATy1rMMVy1/dCMiZVrs/jSTTfVWd/8hIND5o1MowIEAv/mRcZWlyStkNb3FzoN1F87SpsGn3WF+xFzXEq8s55r0I8Lo19iEWCGxtlNlw1IGonf+1yjXCpN4H1kBatyHJdkW/id/Rr0T/dMKzsFbT5NhV/hxywR+hqBZ6nxwxVU6wGCE+YrxUYfObL4eXHXARxMWYpgUwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdxQ0pLRjF3aDljdTdPL3NUWXFIQVNsa3dEMnRvT0owaGljYXBsK0swVFZq?=
 =?utf-8?B?Njk1TjZsb0lxaWNFM2t2NmRvdGt3bTZpd0ZNQXdseUVzdUVJbVhlRVl2Vllt?=
 =?utf-8?B?NDlWMTh4elB6SERTZnl2S3oweENBOHBuZGZGVjg3TS83dFlYYmhXWVkrZm54?=
 =?utf-8?B?T3kxbXd3cDgwVUZxM3hMNE5WRzNmRmcyNnhyaGU4eWhnaWJuOWQybi9xYVN5?=
 =?utf-8?B?NFpUTHRXQTNHUWU5SnozekovKzRzUGtWQUtSRW9pZ2k3MkdYczgrMUJOQWlB?=
 =?utf-8?B?UFBJd0Z6RHF0VnNHenlGam1meDlyZDR1QTRFV29pa2RacHkzT05Td2FncXdL?=
 =?utf-8?B?Sm5RMmlLYzlONFA0Q2tSaVBDdUFncEZlZUxiT0w0S1ZSOVNBUWRVV0lRanlo?=
 =?utf-8?B?N0hjMUhReWFaRXlPVTE4K2treFd3RUlReTFJQndFMlc1U1JGcmVRS09vaU53?=
 =?utf-8?B?SW5pZDdiWEZ3WjZGek1xRUJpR0E5OGU5Q2REY29PVFVQQWk4RmY1SnRNY0d3?=
 =?utf-8?B?ZXFhaFRGWE1mOUdMTmhlUVhwbmorVW5BRVBoWUkySTFzZTBUaXN0WlZaTzdV?=
 =?utf-8?B?VDdmN1VxQ3I1VkNWbmp0QTFpWEFHV20rMjFPYi9uYXRxWERLWHZGTUVyL3Ex?=
 =?utf-8?B?OFhlYWFwMkVLUzdIZVg3RW1UUDMwUTVCSmUvVDloSXRoa1NFcWx5UWk3eE9j?=
 =?utf-8?B?cjZYbC9RTjRkMG96eFR5d2VGOVZaLzBsZENONnhKTVVCWlgwaTFESmZMOUtv?=
 =?utf-8?B?N0c3QlNmV0JXYVhiVHBhSFVEN1lrMFpqbkJ6K3llaUNoWEhySzJlcis1K3d4?=
 =?utf-8?B?N0NPRjFWeUNaWmlqN3dMNlN3ODlUdWszMGlyMnA5SXZ2SHZLV2l6MDgzNlBJ?=
 =?utf-8?B?bStNZ25GUU8rZTFGRTdZNC9YWWFvblN6d2xBLzBQRTZUNzZvcUh4MTJyRnhq?=
 =?utf-8?B?Ykc4bDFlQ0FabXdwZEIrYlFIVWJjOVh3ZVNMTVJOSkRJZHY2ODlFcnBydGdz?=
 =?utf-8?B?dkNNaVl0Nk5hVFZHd282eHNwdHpXWEtqNHJwVHRKNUhFeGxZT1VOUHhCMmFn?=
 =?utf-8?B?WjRzMjhFSkM4RnlHa3daQWEzcml1TlZhc0FUaFJRelZKbHdTSTdmaUQ4MU54?=
 =?utf-8?B?TlpKcnhNMTNDZ3JveW5UK09Ub2ZaRVVaSkc4TDZ1SjdMd1lNdytqVlNqWEt0?=
 =?utf-8?B?bkV1aXU1eWorN2FTdDZjVFkwQm9weHEyUFZNejBIOG9NWHBDc2p2NHhGazVi?=
 =?utf-8?B?bk9WdFBzSEQrKzRuQ0JVSDdBL0ZLZmxuWlpwME9zZURvTVJkK0pJUkdFT1l5?=
 =?utf-8?B?Y1Zkb2hoUGV4ZjdNYUhwUnVjdzNDbmNPbXZ2YWc1Smo5Y1hwK2hpZXJOV0tq?=
 =?utf-8?B?ckpmSXV6M1BoT2t2SXNTQzNYR29xeDFjRGttWVNmZWdmeWhKMlJwcDZ3LzUy?=
 =?utf-8?B?c3B2VmpOMGlTTWVEU2VKR3JIMStsWGNrS0taR0toMkk0YisxZVdveHhyYzVO?=
 =?utf-8?B?dmRQTmZMaGN5N1lIVDFVNWJkRlc2V3FiWWJsSjZDdUtmcHFva0xCQ0lHZXZZ?=
 =?utf-8?B?V2ZRWXZPMDFJRUpTbkp2OTdEVEIvcUdEMlhiK3h4OHMxcVBQeldpTFY2WDZM?=
 =?utf-8?B?K0h4T3hhVGgybVdVUlZLa1JtMCtrak9DcWgwR2xKd2FOVHJQKzBBdDZ5a3Zm?=
 =?utf-8?B?Ukp1RVc2Mjd1UWt1N29PQktiaFVNOUdna1g0UnJsdWIzTXNQVkVRMllGbnBC?=
 =?utf-8?B?WWRENUZSOEJkMk1uWlRDMTBLaXk3WElrTjRPeVZJU3huTHpkUzZRM3FTdHM4?=
 =?utf-8?B?MVdCTHZWNUpRS1I4anR2emV5b21WUjVOZzB0OGpqUEZxYlUyUkFTVE13dTlX?=
 =?utf-8?B?MHRYVitFbmRYNmxxbXdyS2JKSGJuSGVFcjZ2czlQRXRIWGRuUEI0RGR1UHJ6?=
 =?utf-8?B?dXVTK3djalRtdzVOYVhJdHhPUFdLQVNRU0FNRDAyb2JDNCtOOG1rN3hwbmRJ?=
 =?utf-8?B?bUdYdnljRTVnaHRRanlPNmp4bEhlanU2VGwrblpET3QwRW5iTjJqOVFBdnlR?=
 =?utf-8?B?czNObjlNUUllWU93RHF1cDhWZkZQRjRZVXlsRlBxME5hRkVyV0lRUnA4NHB1?=
 =?utf-8?B?eTU1SmUwUi9WZVRzRE4zbCs2dnE1TzI0Y1owaGkzU21NVjRMcnJ5RGRaaXEy?=
 =?utf-8?B?QlRwUW8wbFdEams0djRySGU5N1RWZXpzbDN6UTQ3bk9qSU9IcEtESVViOFZT?=
 =?utf-8?B?bjZDS0hJR210STNWOVdzM3ltUWtybnVUKzVLQjJjUkdoTFJGVm1jeUJXaWdx?=
 =?utf-8?B?cXJjdnRzKzgralBNM0ZDZVdIT1JOT0dCa2xJQzJMRS9pc1FaQytuTEMwWU13?=
 =?utf-8?Q?XtmZU/RtnE1AXI6E=3D?=
X-Exchange-RoutingPolicyChecked: PWbDvVwa0Lfv7CrzQLVzsLXJ1cvjRvBAXqN/MzyZkq5XHXZh4iyLXs3EI1ziZkpf/6AVioLHPMNdjcwqMLojQBgBAC2v3L33xQ0LIfxoeS9O0DAhryzy7nMlHKBLQrzQ9eKsrvq2IKrXuPkMTMGagD6qJnkmtp7C1PCd897DPf1gskvq0VoH1dB6bDGpa2396fsUdrhan7BjkzPZ97uL+AH8lFCfgBtPlirPMLcia0D1wIi4pX07Qt3Qluu2HMEEOdUd1SY+YNbOdgp4CBNFz31c3AGnyvA//wxAq94z4QLIZMoUU2GLl2La9kmLXOvAVO5B3EQlW8+XsVl6ATb1EA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ace400-bcc2-4839-3925-08def80370b9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:51:19.4698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DChRGSJLV38crRKqtWKgO0GPZJcbZYXHCGfxIBfJ3G7vECeo3NXee0eGD3WRoPHZ0mejzaY3s34ultW63VGy0gGQMrxtyhlb0jrYKFIgHkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9489
X-OriginatorOrg: intel.com

Hi Babu,

On 8/11/26 2:10 PM, Babu Moger wrote:
> On 8/10/26 21:58, Reinette Chatre wrote:
>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>> Privilege Level Zero Association (PLZA) allows the kernel to use a
>>> different CLOSID (and optionally RMID) than user mode on entry to kernel
>>> mode. The CLOSID/RMID association is programmed per CPU via
>>
>> CLOSID is also optional, no? I am not able to recall now why this is not made
>> optional in this implementation though. Could you please remind me and add
>> it to the changelog for next time?
> 
> 
> Yes, CLOSID is optional as well. Since PLZA was primarily focused on
> allocation, I hadn't considered that use case initially. However,
> there may be scenarios where a user wants to monitor kernel activity
> without affecting or changing the existing allocation configuration.
> That would introduce an additional operating mode(See below).

ok.

I think doing so will simplify supporting the different modes across systems
that may not support allocation or monitoring. 
> INHERIT_CTRL_AND_MON:
> Kernel work inherits the allocation and monitoring from the user space
> task. On x86 this means that kernel work shares the same CLOSID and
> RMID as the user space task. This matches today's resctrl behavior.
> 
> GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> Kernel work uses a globally assigned allocation while monitoring is
> inherited from the user space task. On x86 this means a CLOSID is
> assigned for kernel work and the RMID is inherited from the user space
> task. Default scope is all online CPUs; a subset may be selected via
> the resctrl group interface. A CTRL_MON group is bound to this mode.
> 
> GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
> Kernel work uses globally assigned allocation and monitoring. On x86
> this means both CLOSID and RMID are assigned for kernel work. Default
> scope is all online CPUs; a subset may be selected via the resctrl
> group interface. A CTRL_MON or MON group is bound to this mode.
> 
> GLOBAL_INHERIT_CTRL_ASSIGN_MON_PER_CPU:   <--- New mode
> Kernel work inherits the allocation from user task and monitoring is
> globally assigned for kernel work. On x86 this means that kernel
> work shares the same CLOSID as user task and kernel work user
> globally assigned RMID. A MON group is bound to this mode.

I provided comments about this text in following patch. Apart from that,
I think a CTRL_MON or MON group could be assigned to this mode? 

Thank you.

Reinette
