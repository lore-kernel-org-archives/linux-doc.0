Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5892F616B;
	Tue, 11 Aug 2026 03:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786417418; cv=fail; b=ODjb8n+qj0he4XgLBeT3x0Stn0LCcpnNM7Ur2RukeWWojulp6wNdUjse+cJf/jSn9Nr94W0nwkd4xSA0FR/aAGqOppRbTkjCixOsLDoZmNYYnGG5Hp3T6qGvPn8RXmi5P5D/1xdkHDWuFSXpMJyh2/RJnjGAA9NMAJs3T0PY0j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786417418; c=relaxed/simple;
	bh=moUb/k8JTydxkL0W5emnuYaBZEtI1Gtc90MvkTSslv4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oGLMJDFFGB4klyHVx2aiAlxB07fzba7bYqpSLu5XpUKpswXL01QwU7Sq8bYAUUes8DFvUCfBrFZ01KTXOgsW8F77CtYEgvH6YtVzHs0uPMSatnuq3xrFgh/x57ynwZjhFbTNxaBDSNeRPpXZfnMUA3TzGu0RZYkFwbArV+U7Fxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyuJfLIA; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyuJfLIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786417417; x=1817953417;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=moUb/k8JTydxkL0W5emnuYaBZEtI1Gtc90MvkTSslv4=;
  b=OyuJfLIAgN/oRUKEwNjVqv4idFFI+PBpy4gUINl2Ua0tW6lvhqJjNf7z
   4ykiQ0kXgELi9p1VgUeo8PWujv5IGWBO7RqffbMuQg74h1u4TH+Y4jCOi
   neai4/VCW9aP6vE9Ei9MqWEbIxOFiKs/SJV163YMMcMptDAFwpjY4BWAX
   0HTzjL4PeE64ICUPH+/2swz+WRCHh+TZ6sWq3FtdlTKio0STFEITDzJLi
   nv5VtyHNYCzK6c9ur8aMQBhMWHomYB0Z+4qTDyGO4OtT9nhlq0CNjtV78
   cKO6jvY+GF0Gkwo7zhupw8JYcC6kpe1kNIiexCAsFA3GX189NVrqOvi43
   g==;
X-CSE-ConnectionGUID: ao6rLoiYShibZthR8Yuj0w==
X-CSE-MsgGUID: c95s8UpTTT23txIzLk52Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104474698"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="104474698"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:03:35 -0700
X-CSE-ConnectionGUID: XFD2+gkrSPWsTEOxboECww==
X-CSE-MsgGUID: FfYLJTubTMCYbvhZHahfdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="286626609"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:03:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:03:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:03:34 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D89lUuBiT5TnnFry9zGUIe0b/1Vu4smHbQ3Y8NpWQQMv/bTcmmr0i3421h5NHqJYsnZ1A8gYk6UJljHQSgiItGLw5W6z3dCZ9tcetwGnuWP3q2cXuQ6UpblqiUZKMT8KRaEzjIxc9kGZwPbJjpjuHxrElJbflKF5kBtM+OiR44nxHVG7dOh1or32ZK/belGjs6uM8HXpkiTIGeYC3bEFP+DpGcBpBB9IaAIngSEK6AjrllS2MyRP7A2q+yXsWXlWU5GJcAGYpo4FHsHd3DRsnB2Z9Xa0W109tlWKueysOVG29dUIlVcBj6xvhMYIfcSNOhCSZ83b0abWm7NZR285hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjnF4J9H/0eigRBS8YNJiTWgYT092elB8QcU2w3onUA=;
 b=RKSfhLXg3AI1jrS1L6y8vCMSQHV1UyQn3VqfQx0YGK7WpQN/7B3YEY6HoeeeWaSrxoKtwURY9lKiCrEnc1ipjw1Z7rWG3vxYtt2x6ceMtW5hiKOAAQIqUUga114VjogxYS8fEG6II029HPnjGpD9MMziriboH1a0rnBEiJcuTTjcYTNy8rbFUyXddeVq25U58a+/dv199629kuJ7T5zOkEbtutyT40Pq9h1/Yv28Xgr5vvLzirjcoeuTJu+uH8k0vJjG7TGtXrjTzeOSyviwfcLYVrLNKpALdp7s6vuAYYiMJmz7EhzUVAU7kwfyn54L0xTJKa2bLh0sOQk4LFQi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH3PPF8C0509479.namprd11.prod.outlook.com (2603:10b6:518:1::d37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:03:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:03:25 +0000
Message-ID: <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
Date: Mon, 10 Aug 2026 20:03:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
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
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH3PPF8C0509479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5d4f3c-cfd4-4d9d-2ac2-08def7551c08
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|11063799006|56012099006|10067099003|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ytfB/9PinUPZ9sRUniLxVMUZ5V3PzJwNjksWGcc4OMYgXHYkczTrFE+UrXFiVVlq1mrEgpfCkZxr5VaJqbHtYJpdgrQgGqHNzbDt89N9xGKg1xWSMP4I8j33fcWS1LrEHcDjYZdavomr7Khvk7LNhj0sK7RcalSKRBjQFaqFPnyBXqc8KkF5AJCdxPnXDvGoaqlHomeRdVo0+FInpgBDBSFi3uSaa+giugiZVqYiSebjaHIXS3LclrRRw5xgmt83DxoMpTJPjz4DsxHeBt/c6qEJS2Utfa4Ix3UWC3CJbmn4LHkzcHLk1xkzH0OPruwwIV2Hoa8qRTluhNcchqS4eDzjmLX983IvP8xgXqoh5D3WleoF8sGJAMkhI8nvU/hFjRchCeM8qCkKMoANg9MeZ3d6A46yg/qqTRhOyZpMLcmh0feV5/F6qxlXoPC1pWeOCNOFZ3gvgtby2KNtXnZk0JIpoO2VyzO87JG7QjKffFgnC3oBCewPaJ3e8ZnaBYGaYAjHiytOKGt6cD2fga4Tb+ss1BalA1OL+J9i7hVvHqhuZubIeTUl3GYdgmlASmjyBr+Nx3CGhF9oXnKCiGjue/RaoGmA15BX/gp9uALuvUx7RAQqyuJWgOBerxaioKAjUsEW/D4udvEh4ZBOHlyE0JJIRO9raxC3an9muMc7zrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjdVOXEreU0wbGtkOXBIKzE4NGRWVEZvYkd5TEFkYm9JWWNYbS84UlZHaCta?=
 =?utf-8?B?VW9odnFxMlN3cVBZQzZsdU5ieTNaNkhJblNZWHp0QlVKNnA0NzUxbzhsOGJN?=
 =?utf-8?B?dys0a244aC8rWllsaXpYUkhhMWJOYVNtV0NVTXVvaXBLUUtRejRoTGRLczFK?=
 =?utf-8?B?SnVSTWpOV3k3RldHZ1ptVDNxeEI2WEpCVXptOUUxT0dVQ2x1ZVl5bXVVakxm?=
 =?utf-8?B?WnNLSjU1TXJta20rQUVsdW9wdmtXRTY3cnBpSjk0VCtYVGc5WFVMUVR1R0tl?=
 =?utf-8?B?NnRzQ01tTFBSUmc1NzMwbFNYZjc1OTJNTyt2NW9KR2h0eTh6VE1OQWxvdjBK?=
 =?utf-8?B?UjAyM1pDOUpqTWZGL1RDVkwzVmVEaUQyd01Ia0pHOCtjaWtabGZUR0dNd3cv?=
 =?utf-8?B?cVhPTUUza2FtOGJjNzc1R01sZXBMOVB4RFVzZjdzZVhIN1dKVFAwcnF5Zitq?=
 =?utf-8?B?NUxwa2JYemVycEFYUFo2a243Q0dhY09MZXdtZWltbDNKRGU4WEg4UnN5UGdh?=
 =?utf-8?B?YjQyUSsrTmxBejAxOHoyOXFhMHFnUmp3UHpXRDFIK3MrbDBOblNjWEkwUWxE?=
 =?utf-8?B?VXVwbFllcnFmdjlsaUppWTBPVWIxTy9XMmNWN2dvRzgyMER2ZEZTTVVkSG1r?=
 =?utf-8?B?eDYzTkE4eW9ZV3hjdEQ4MkVSUS80cGtFN1cybUk4MHhyemlkWVVrR3UyOXRB?=
 =?utf-8?B?TVNTVmYwWVhFZVl5NTRLaTZ3UHhSZWpKZ3ZZenkxS0RIWEswZDBqaEh4TlF0?=
 =?utf-8?B?T2poZk80SWxjMWU1K1ZUWXQxVHQzVVJnWmxZc3ZoNUZVbUxWRzdrdW1zbkVL?=
 =?utf-8?B?eDZYZi8vd3RRVDJHeTh5TEJQZWJmM1BUclVNazB0L24vK04vQjRIcXB1R0lx?=
 =?utf-8?B?VnRyU1hOQnA1T0dEQk5jSmF5T21zbGduS3hjdDhGZGxmTVpOQ1loR0VsNGs0?=
 =?utf-8?B?ZE0yVGZNVDVLbmNKZnV3Mi9vWFBKQnRzQXNkNml2bkIvamZZbHBvSmZFOGRH?=
 =?utf-8?B?bFArWUFKbmNYWldUN08yVmcraTZUanpzalJyaTNnM1NxcHNqajJ3T2NGclBL?=
 =?utf-8?B?Vyt2ejZyZit3TXhiOGVmdGJ0UVhlYXdtTnJoUGVzZmE0L0k0L0JlTUlWbjJa?=
 =?utf-8?B?V2VTbGxuMW5PRjJJNDBLMTJuWUtJMkdic0o2M3VWem82eDB3a1RCMjRRVmNJ?=
 =?utf-8?B?U20ybm9kS1dwOXJReE5LSlRINzkxNzZSMGVYZXJjbVlSK0FWOUk4cXNlUWlj?=
 =?utf-8?B?MFE3UEttdkk2UmxSaFVFNzdKckgzeHIwL3B3NjkxNzVFT004VkdCNlJoNW41?=
 =?utf-8?B?RXo5cXN1M1p6ZkZmc0U5Zi94NXpkZUdDb1JPT2VocGl2SWlYOWZLa1NGUk9J?=
 =?utf-8?B?ODk3amx1THZUVzFEaE1QaWgzL3dwa2RqS2U3c1piMVkvYUIzWEJDSVFTNVBU?=
 =?utf-8?B?ZVZWYW13TjNBdHhYL2l3MG9qcW81R01XbDBwZE0wazlmamhZMkpISU9BY3VN?=
 =?utf-8?B?MjBTSXJSV3B1cEVrd0g4ek8veEN2N0ovOEVsWlBuKzh2Tlc5TFVjKzFkcVVz?=
 =?utf-8?B?TWNwTDc4T05kNVlCK2FJU0pNczNXeUJMUXRpeUxaZU9DWDdBSFRwSUp5d2xP?=
 =?utf-8?B?V29Wd3NNMVBCU1lLUkk4NXFkODlVWEtLcS9iRDdxUkVGcjNiK3dGc0RGbENa?=
 =?utf-8?B?MXpkWGI3Q1I1cWp5dkxkcEMxeVUvMUJRYUdzU1JQTk9GQmlxZHlpNzlOZlg3?=
 =?utf-8?B?QmNOOU1xZGhOMm1GbVBISGFKemxiZWlMTU1HMzBMNnhPeGR5ME51d1ZLL3ZP?=
 =?utf-8?B?cWh0dGpLZ1ZDNzZIN013NW5KYTdFMG9qRFVkMlJtNWFCaWVPaDVqdnFtSS9X?=
 =?utf-8?B?eFpOTXNIRWx0RllFZU9hUEVXb0pzMkVDVXBRQnowTnBYMlVFOERlOXdQZmFn?=
 =?utf-8?B?c2VkaTlSRTVlSS82WHo2L1piaU51VXYrRVYzVHZPcWJrWmFUVWVLNnBQMHNo?=
 =?utf-8?B?L3VGb040cmI2OFRkUE5CdTZzQ0dyVlNMN0JBVUFXZGkrWVR4VC93Y0FjQ0E2?=
 =?utf-8?B?V2NFanJUZk8zQzlrWnRjT29oaHlmcy9mU1p6RFA5RzNsc3Y4RWx4SXBneC8x?=
 =?utf-8?B?WXBKeDMyUllTejBGc2FBL05oVEVhRkxtdGFtY0lWNWlPTEw4cXd6RFlsdFpF?=
 =?utf-8?B?YVRDWkwzejBlUDMvYm01MXdNQjdZL0JjNElQOXBwTkYzcnBoUUpPZlVJaGNQ?=
 =?utf-8?B?anBlWTJ4ZDNYc3J6c0puSjRyQ0g2c1hvTTB0R1NFTHJRbW9IcDJaaENQRWxN?=
 =?utf-8?B?STZTNGtaT24xbUxzZEg2UTlUMzdtVDEzTTkyYmVzYkNueHVpa3VQbHRvT3BB?=
 =?utf-8?Q?e+yeP5l/J+0h3k44=3D?=
X-Exchange-RoutingPolicyChecked: D2N6wP+Oe9ZCRI5u7v+vpS7zxA0FcdHw1ka+rDbzztfu863E5/nVgSgO9+XeQWDiwRFBVPd5OcbvM6OyUpjPRFanq/2njb6cLDGiu0pTgf8rlXoiPIiZ/yjKs1sL22THbTaCQKS/uMqjkj9AHjaqX4fxlWLSYv+U79O8QBKIfBsDI2UOdVqmj2UbD0vJjjGvw0V84MpmOeHOcfw69tltjFgshyocXgqHzq1ZKOZZESXkwVucDMXV0OYDtN2yxEblXfPl4m/xKfCnHOUDgQrQf+NXDBfrD02rPcKS2tVo4GJH65npxE03LMr+zJOih8XMTFSSqLBidn30NyW8OhqG7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5d4f3c-cfd4-4d9d-2ac2-08def7551c08
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:03:24.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmIixdyFuZ0UTNvI3lO3L0aCzxHnM7m3UTo9yLrSM2ON45kwOSdj6OO/xMZuO9hJSJfoKkuMSZAlrGD933oJ2FLX0NYPPdFGlsvcV3mr4vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8C0509479
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Kernel-mode traffic can use a different allocation and monitoring context
> than the originating user task. On x86, Privilege Level Zero Association
> (PLZA) enables the kernel to switch to a different CLOSID (and optionally
> RMID) when entering kernel mode.
> 
> Architectures need a common way to name kernel-mode policies before resctrl

Please pick one term and stick with it. While reading through this series I
have come across "kernel-mode policies", "kernel-mode binding", "kernel-mode
configuration", and "kernel-mode association". Is the distinction even needed?
Could all of these just instead be: "kernel mode"?

> can report what is active or what the platform supports.
> 
> Introduce enum resctrl_kernel_mode:
>   - INHERIT_CTRL_AND_MON: Kernel work inherits allocation and monitoring
>     from the user task (current behavior).

The issue with this "combination" mode becomes obvious in patch 7. I also
see that sashiko hinted at this issue but I am not able to see from your response
what the plan is to address this. As highlighted by patch 7 and sashiko the
"allocation" and "monitoring" features of a system are independent - a system
need not support/enable both. This should be easy to reproduce by, for example,
booting a system with needed rdt= options disabling allocation or monitoring
features.

I think it will be unexpected to a user on an allocation-only system to
see interface like:

 # cat info/kernel_mode
  [inherit_ctrl_and_mon]
  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized

Should it not rather be, for example:
 # cat info/kernel_mode
  [inherit_ctrl]
  global_assign_ctrl_per_cpu:group=uninitialized

Similarly the user input would not need to provide a monitor group when system
only supports allocation.

>   - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: Assign allocation for kernel
>     work; inherit monitoring from the user task.

I am not able to parse "Assign allocation for kernel work" 


>   - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: Assign a dedicated allocation
>     and monitoring for kernel work.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 73ff522448a0..c7abed51cd5f 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -703,6 +703,37 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>   */
>  bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>  
> +/**
> + * enum resctrl_kernel_mode - Kernel-mode control and monitor association
> + *			      policy.
> + *
> + * @INHERIT_CTRL_AND_MON:
> + *	Kernel work inherits the allocation and monitoring from the user space

"inherits the allocation and monitoring" is very vague. I think it will help to
make things clear if this is described as the control and monitor groups being
assigned.

> + *	task. On x86 this means that kernel work shares the same CLOSID and
> + *	RMID as the user space task. This matches today's resctrl behavior.

"This matches today's resctrl behavior." - This cannot be expected to age well and can
be dropped.

> + *
> + * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> + *	Kernel work uses a globally assigned allocation while monitoring is
> + *	inherited from the user space task. On x86 this means a CLOSID is

(same comment as above)

> + *	assigned for kernel work and the RMID is inherited from the user space
> + *	task. Default scope is all online CPUs; a subset may be selected via
> + *	the resctrl group interface. A CTRL_MON group is bound to this mode.
> + *
> + * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
> + *	Kernel work uses globally assigned allocation and monitoring. On x86

(same comment as above)

> + *	this means both CLOSID and RMID are assigned for kernel work. Default
> + *	scope is all online CPUs; a subset may be selected via the resctrl
> + *	group interface. A CTRL_MON or MON group is bound to this mode.
> + */
> +enum resctrl_kernel_mode {
> +	INHERIT_CTRL_AND_MON,
> +	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
> +	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
> +	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,

Please drop comma on a terminator line.

> +};
> +
> +#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
