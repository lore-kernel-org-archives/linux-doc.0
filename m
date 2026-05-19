Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812063B3BEC;
	Tue, 19 May 2026 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779224407; cv=fail; b=qiZ+Ixr98Nqn6KezBWUOgYDzDKIc5e/yg9Zvwqyo5VDV4Fk+P+uHTG0HFjd6ov/6rPYuwDfEpeN1MfiMhREDTdQtJYnE28IaANYOrwyl6SA617h7f7vGDvJiSsAbkDdax/ifUJzmJORZBp2agZ6QtQ03lr8PdcIajk/LcCeKx4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779224407; c=relaxed/simple;
	bh=MfFXgFFQWdDVG4h+XTXCetsJXHMDf59tLKNSCPE9bCw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FG9daknCseJaQ+KylNdeGEPQKh+zOiHjR7884s8850nYK5DrqYa8B5BW5OUtqJZqlLjZt1+n3galrexu8GvaEwDUZ/gqc6/dpdDmbtGjDekgepCF6jsZbvjHxqagLQ0+sn4P9fugfkToJ3ElT9vutuPu5kJocIdghoJpSXsQBqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lp687JFJ; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lp687JFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779224406; x=1810760406;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MfFXgFFQWdDVG4h+XTXCetsJXHMDf59tLKNSCPE9bCw=;
  b=Lp687JFJNbCEUo1vNBHAuip4cNzzHBQUBgYgJIiAvdYCBFjaTUJGU5SQ
   vr700ayPcEz9b6N0Y+Yr80o1S6BFTciLVDn6cloVi4b3B8438d+4BqZbK
   6m/sXQ1TGnOcDG3WAOKMTxVtmsGoaqw9ZwVbQxwraB0aptcMSrvcx82cP
   5TzmIeuD9lXqwAg4oNQcb1yS8OYpwOiuCMJ3AJsH7fsVSnpSUfMb7OaZY
   TTQm8yhfgZo+viiRM9pLnvrp2BzKwNOPRFmPzVlenL5mkhIKigQwF2kMr
   vQsPcuuHkg6GyPYqFRki6fLBt7rSgBsnR7bgH++PWyKlOBMhp9BA5NU7U
   A==;
X-CSE-ConnectionGUID: C348nOSyQ5eqOd0eMqrSyA==
X-CSE-MsgGUID: mLddzsuhSIq8bzICfSeADg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80232032"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80232032"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 14:00:05 -0700
X-CSE-ConnectionGUID: iBbuwIFuTv6FEmQGZJDySg==
X-CSE-MsgGUID: t+DpIhEcQyeJKDXKzwVSyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="278011817"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 14:00:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 14:00:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 14:00:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 14:00:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsampaJEewCQtk/hm9fwo/GHxt0zk5olBNk5ztt3J6nkBxJiqwxi1ulwX6vCoidhgrkxEMp1W9MYsW4P+NHxT5R6U9V6O9SrVQKr2bSLZYPmyF8JE4U+gU+zFzA3RmR+SjyT19BooHIkd+fuhRKC3G2oAxxds4ctuBAzK05Ask2D8i75rv+VVzj6lapX0McThk0Xx7vBOtWZ8g1YeJejjcVJ1tlHOLWfxEz8yeyrDZ+9iAXI5MNaikLGwIbqt5uOoti0XrnYRZHSWJcG7Ij1KTZI0HKSdHxMr4Kxm6mIdN9YmuBAZuRLJh1gfavtrC4Y5zrRtbvpjRP+j00URt0KWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AosV9sL8x640dFpB4TwGyaWy5nuoAIz+rv5JtXTnpbo=;
 b=akhIeyU3Z/NL09ndH1mtj1uSCQdYTN9yCTP9M7dqQdO1MYm8RbFzCJOxePdjoUavZ5GL3NG1h4ss5o+ZUmlWC8q8sWN6PPQi4zyFwrDxqQUmtRZuPWj4KEWJ+SeK+3EkdZhW1qdduxydmraV6RMYZjiL1yt8n2LqqgNrM1wyC777ecvGue7Fkuny+0vwXQs/AV1fyOj6wEGsBoWC7y/vat2Eo8yqE+WVT8oX2/7IlY8mtuMhNMlLStQzEe09Nsdoxn2R6NJalEPUOq4oZOt5fzIAj3d4YfOeywaTCK612XAbiWeIZ9ZMqLimHkg6+NG8/MbyZIgTiuM4jeJAnyngWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) by
 CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 21:00:01 +0000
Received: from DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::5502:19f9:650b:99d1]) by DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::5502:19f9:650b:99d1%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 21:00:00 +0000
Date: Tue, 19 May 2026 13:59:56 -0700
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
Message-ID: <agzPTMvJ_LdEmKXe@agluck-desk3>
References: <cover.1777591496.git.babu.moger@amd.com>
 <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
X-ClientProxiedBy: BY5PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::43) To DS7PR11MB6077.namprd11.prod.outlook.com
 (2603:10b6:8:87::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6077:EE_|CH3PR11MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: b0629f99-9e4c-4f1c-bd99-08deb5e9976e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|4143699003|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0+0vHATZpFMCcp5zze9ccagdAClO+IUHzyVsvozYaABZlCzl04ZTWAstViPnDAM+y4em5Nlca97S3B9wS3EV30KvgjGnVv01X/cRnQI1lUSD6BRI67JS8GsyjMfZ2rj/9ATbg+BETBDJdkav7Auzy2tXuMz0/lhg5xbjEpx+DFB+dvbsP1c81aRQsL8DWIYyXG3UQATfRBBqEGxTEMowJx5ffXTLT3qCWIqflj9XmoHKm0bsA0kxqZIWyQushb/3Ebpda0Vmbo+qIIZWr8g4xUk7UxEPT/fgPLF5Sb5WckHuW9EI/peVtnHNlDlSlT+tBIfMsF1DBt6Sbeweu8D5MPkwaRHht6Sxc+Ahy9kxS0bLab/y+mPsXYngZgN7nTHN+pa9/aSiufDecHQ7M+K5tf9RqfUSCP8V38Zf09yxl6mQT/96m2L7mJJ92jPBsNcPSrPtWmHMcuzs6i6jrpWV8h7g56ea3trCA+IP1JMC5tCHcgoVjQj71T4M6AGuWGV8LSDxO3keAffURxQjn4wYBqOk4RM0cd0jAXeemExLQ3Da+pM/VkLI7H0WSxUOiNb6pMtg4zVeEg6OGK87sT7dz1mC8W8H3MwSiRVgjxGVEgweE2+rr2dhDda3+lzlgRclCFIYb80fTnfcjag61G58lGJBCLxFzwlOAbC6gv7ySf/Csz59bUveEGpz+TjGyk25
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(4143699003)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?th72xxsOjZC/TAMMO1e6RHdUJFQApOlz5w4hRYUCkW35DFxxOdYm1kyOEBuq?=
 =?us-ascii?Q?fACm1tyAMMZNzImotGl4JfDEQBrQs+0iMnPmEEPwOzY8V2fx5jdKX7QUQWEo?=
 =?us-ascii?Q?88hAB3dMaOj1NxjQ93mHFSVmcDxKDMo5aQzWlC6rLiZA8yxy5ydFDaWb9E11?=
 =?us-ascii?Q?6umIl/Gk3HPgfFcF58nVsO4zPTd2XXFv/2tdbEa+zpRf+ZLE9NVp1SI1td4U?=
 =?us-ascii?Q?50JeJmbqIkZ7//yuic2xhlQa6K/T5WktjqlIpZjmIiHVvNJ2LWspzL3ubsRQ?=
 =?us-ascii?Q?255tkkck7ZkgVxSUMiLxF7XeXyFwEKfZkCzKbkUu0uxF3o0UFOtDB7PNAxbG?=
 =?us-ascii?Q?XNfB0+qEIIDs5XsAkXJ8/DDvK1DFCKdNMPl7ZmFyPbWhK+kFRBggG1uGJkUT?=
 =?us-ascii?Q?0P8McWOYot7ZfRrwrU7o4vCdejaOvdowvZC6M7jziL74BwnHNYszkir59WbJ?=
 =?us-ascii?Q?VdmcyXoa+Bldp5zH+XCfzD0HhJUygwCPwGUh0ckdCKQ+cNgMtbMsWlu5eo3D?=
 =?us-ascii?Q?PNfbAVkLIAS6WuFufdyIvquxQk47LD2YhuWwgWQfGzJGFVBaCcAXTB+9KV9A?=
 =?us-ascii?Q?wAKhyRhjv9B5g+MY/r4wKy/8RZo40/cLO4tcY2JhXA9K290ItC3HNYsmy+Qj?=
 =?us-ascii?Q?POn+k+ZIP5cCwvQ5AlMt3mhwuhJe7FqeklwhsQF2JjVaNhCdPLjTcZEExYF8?=
 =?us-ascii?Q?shz9YGREGh35PjtZrzni0aqPHDlTVGKomLPJThCtBjtEEqhKvqvKRxlTCW3L?=
 =?us-ascii?Q?mGSMiJhedgR6KiMsbE8t0VZGbWsFwp8FHX6LtufN8SLSVQepkhHskqzreYbQ?=
 =?us-ascii?Q?H4arng+UZzcTluMGGyqv0HGc9NECHxKp1UESrF0n3OhMxvBRaaH9Li9trqAG?=
 =?us-ascii?Q?jGtwxJhrUez3wB/eMXNDlq0cceELLztsWR4HTvkorYpSgBZUq5r10nYwqAw4?=
 =?us-ascii?Q?qx52N/AQC/b5DmBw4RBHd2kwj2xXVmw5BAUWUJv0R0hlNBP36pfBAK5ZBjOx?=
 =?us-ascii?Q?gG+y/KP89RuuAH+eCWVOo/6bJwRVo70h3A3o7gXrxgKXYYQiNo3xoqhlDecF?=
 =?us-ascii?Q?h9glbeLxREmUzhdkSo3TOHcxuFap414k3uD5GWcEuwZSUk2oA3Aurm8+QOSX?=
 =?us-ascii?Q?Dh/FJvgQCyAVHuYvgfLtbnKujDbfpWEMm6GV4J5YuxDoLhPphybCEiB9KL3a?=
 =?us-ascii?Q?3d0Z/wrimW0eJ3uCw7w8zMgp/QbIfCbqSbCGql6fXIn0B40dTjjSFSzCEKDC?=
 =?us-ascii?Q?gOky968TKIvsvjNK4/c1N5Bo+xV8DjWj4juUj5oAbHkvoQ1HYRMlrh/uO6df?=
 =?us-ascii?Q?x/7ktLkizZjXuyf2+lJ1eoXAqS4L/Pqwqmf8r+gEiAEES0cZEsxbw//qTgFg?=
 =?us-ascii?Q?O+6V+Q9Tl0S/Qloe04FKjly7iffDJhG106TvyY6zZx77fAjaw/Rf3hxl7s3M?=
 =?us-ascii?Q?7KcxamAguEOoqpa2SYNj6TKgMwzT9fZEl2aBGY2+/EZhdlcmOUpJuX5GO2Tu?=
 =?us-ascii?Q?tpyc56oo8VQuXIr55h/DMt6HP8fUPqFwNtbvyh7QPr6K89PDSOgKi1e7xi9u?=
 =?us-ascii?Q?p5Hm+fAKPrvX5SgzGEYO8+hQHClx2wddpHaaKhqlbhDwVBWN+khoZbDybH5+?=
 =?us-ascii?Q?aM2ph0sSrIqhjWvzlWIG0hSUnjh2XASyxprrHwblUE3yrDITk5Kfm4P3tsnP?=
 =?us-ascii?Q?s6wn7gQsDDWut1p37NjElsBzFuRacNM/6Qbj04+E21hO6JsDBQF5D/kf4wRK?=
 =?us-ascii?Q?CmBUeAci8A=3D=3D?=
X-Exchange-RoutingPolicyChecked: wrvCBFqHWS9mD2ecXQOFhSZkFQZQKEU4kNxbUrtJPm1ESMsECvku9tiNmMsp0T5KDe/VLzIeXEQCr6nAVOvg1+rUhfchvEmARESe7ohpBHsWMnVdpbBK8FNvr5SKSeNTxWauRLF31MLNKYSE+ZrWUU2h3Nw8jJEa1gtN3854EtYv+K1wZvws7Vtkl89TP/FddxD4nk32jGcE1Nra3IPrLe+wU6D+sAF9tBmbnRFpWQDVRvoSN0Cxxb6wzPSAQ9q7pTYS3ELWY3KgRd4oiuB+dwg6G6h24DsLpr65VUvME+oGZG2FtkUVP53Ez7J5QKc5w7nzNR1WOHF7mNwYXd40Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0629f99-9e4c-4f1c-bd99-08deb5e9976e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 21:00:00.8652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyYh0ZNEgkhi9IAYqMrcmvhd3wT7i9gsj/LB+qaR9IS8XuZmDcfTqhV5Pf0sg54dOEdHnrs8r5U/m9JQhEhL+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
X-OriginatorOrg: intel.com

On Thu, Apr 30, 2026 at 06:24:49PM -0500, Babu Moger wrote:
> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)
> +{
> +	union msr_pqr_plza_assoc plza = { 0 };
> +
> +	plza.split.rmid = rmid;
> +	plza.split.rmid_en = 1;

Shouldn't there be a parameter for the value of rmid_en?

User asked for global_assign_ctrl_assign_mon_per_cpu set it to '1'

User asked for global_assign_ctrl_inherit_mon_per_cpu set it to '0'

> +	plza.split.closid = closid;
> +	plza.split.closid_en = 1;
> +	plza.split.plza_en = enable;
> +
> +	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
> +}

-Tony
