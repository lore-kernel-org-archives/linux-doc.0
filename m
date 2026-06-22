Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09ED18FDBD;
	Mon, 22 Jun 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145324; cv=fail; b=aNtqxEbAmLoJ/RTKj3EqP2E7mP+j65+0Wm0choq03bbUSQQtXTaC7rNHTGYOGoH9B79ipKm0M1G+CY+5RHrdqhe2Rjo0P2fKgccUCg02Gyg/gs45yUmDO8lpV/9ytd2CjrUdCRDiUxAOJ5JvvmZe6sniadSrjG8uWaPqbBPgb6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145324; c=relaxed/simple;
	bh=aUaa/3dC+nDJKCf45Es7sDUDjtS5lyGvp8yofaP5Few=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kaHvHUCm6NDS+SU2MCtMkk+G4X+vOgWqrXLBKeBzaUtJZJL3myqqitisW2rTdP4jPwy7Le9w6gzuLiwu/J8zUspRjxhpeOZbEwoZQvXzy6PAIGrraHcfnuRZLocZ220rQAF76u41urpzapjIRz1eaEUXz6ljE/f7N+YfbsINFtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzbeccf3; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzbeccf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782145322; x=1813681322;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aUaa/3dC+nDJKCf45Es7sDUDjtS5lyGvp8yofaP5Few=;
  b=fzbeccf3hei42YL8EiQMdD+se5+iGg9+8Uc9nVdrWy3um0qY5hOLBEwE
   yVjz/iPQezMD7P1v3WdY0zEHQ1BjUAxkYMVcWmYr2i5OkgE5qbVU2dYR9
   J/2lVKthIYljrj8yspeSn9vw7LBCT/0OMABe63P3sdw431W5nvIi6wAM7
   augzN7jVw3+6+kKNRTR1GxlTI2NV1cKQ1V6lGszB9OCae9nJ+220htRn9
   b4O0aamHb3nhKOr4Bh8PIdAexoJejB2Udw75x/UTKeaRvFqyo5MI4XdkG
   8w0CWfosUjmSLxJYPLNJuYg4uN6tdeqavkyEdENAL1fRhI7Ax5k39bKJj
   Q==;
X-CSE-ConnectionGUID: Bm9SMG0GTv+iWvjU6Bby5g==
X-CSE-MsgGUID: LxoWWH6/RVK2BOezGFDqzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82748972"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82748972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 09:22:01 -0700
X-CSE-ConnectionGUID: NL7PeQwdSvCTDGJ8+wL7ZA==
X-CSE-MsgGUID: KN4kFVA0TWOtOaMVQPSp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253161713"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 09:22:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 09:22:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 09:22:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 09:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qvr3WxOPXBJaPLv9Ls68AUk6UhgPy6silixyIiaPT6c4jsaQ+4SLcoYLCxr+zfOgwp3Du+AdVbWAXNK7PVHjfanOZ+8i+XvTXYXA2gLpwHXtGEUQnpkTogXVMly4r7eLiYgMbCHT9dx3kFRzTa1etFSw15oAd+SnBGLEdwBfDsDYtbJgCeOUmRvzMx9we56OPH1IDLi8WaWyOSBVu7jU3fxOeT3JLyAQQZWdlESFE/aIx0YH+hr8nzGIAAjf92L2cmpot7hJyjav8gYO5brxERCyZiEJj4GUZMCuRqg1fx7uaG76wzsoeoLIqt6im+XLm7ySTE3GgKq+3iBai6mwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DzdQVxvQGW8L99WpBPNC32uVu0Qi8X825Lnl6s4cy4=;
 b=esjgN8ejKG7O0awmQLBhOOfanWyQvazfd4SOQCZPzBrNFDZA8stnDCOFrF65c6S+v4C348n3Vlk+bHZYz158e4g1xeYDQI/r4BcFlfU0IsQ5CA1uVAdWNfpULlxKajmMSVW6iw0tpXmMMjxVw1gLKGlXw+YmWDhs938fEncnzFnBakOjqp+JcGwbgM/hkz9n/3nRQBHhQrWSZGrXLCcT+dx+SBgejkiMm7tjYVOKIVjpsNo1h696c+naI5GAcMr4/OtSTaPZ8PSD/gg+KrKAobxEQnzGN3aY37RcduQvp6FCPWL8N4TKIoDZMkubtMK5cGvpUQ4R6ZCVXs/mCBTARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 16:21:54 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 16:21:53 +0000
Message-ID: <737a4228-52fb-4583-ac64-8efe79c107e6@intel.com>
Date: Mon, 22 Jun 2026 09:21:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] fs/resctrl: Initialize the global kernel-mode
 policy at subsystem init
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
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <38f794ae4076a3c118e8eda08ae2bc1e69eba979.1777591497.git.babu.moger@amd.com>
 <ffa4f5c5-9512-41fc-9354-803a182a85cd@intel.com>
 <416d685f-9e76-415a-bbb0-fc89f87827d9@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <416d685f-9e76-415a-bbb0-fc89f87827d9@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:303:8d::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 99396b24-6719-45f5-0a1f-08ded07a5f40
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: GTTZHFteyi2mUHwvQYdvlyqDfKaC0WmdMsO8HPTRSWgFcI4YZBrAx6GtAa2NkjWc3/AM6NFGExqAZY5OVOejWYES51u7hJMifK8DzDAHYsWa2l0Srwhd5b4Y39A7zM4UdCkl7lohY7lKI320oMaWck/350VxP1SSm+xxoqnD7JrZQlrhlr33F3nmUE1FcOq3FnKUbO7gyK/0glXXVqgm93JzQyjtfO3/gqwzIseRjvw3nI/F5+ooTPaayYzTgw+OHo6FEB9xUfJ7C3x0lGkbMnnUWGIXSDbgEr+oSL+KPxgDCzWZRKywesi64uUYXa8Y1HCIjgPnUYl8NymqBFPXGIo6piPhKBCOEUqN08WnNzjGoGVtrtuzF6nvjyl652X1YVj1jFuV+BdZEcrxvy8/0lMZG8Ic2P9sp3O4dyYLbnEX5xBMNtJrXIqRXCOWTdyuO79MoRSJXPCQJb5sCPbwhdyFM2xg+uth00ddr5jeNhnqacrqJG7GXJipkNpUpJAl2IVM7XcfnESFT/r4sFsm0BYPfdyPq9/ahvmAcGlMOcg+oaCK8uBFt1ziYvHlBf57gYMvORNagEH3EkLON6s8CgKkB3MZ/8ygYoP/wG8dhjSBNpe1EQUkCCG5FiD5QGvifzEN5s2rRKkfm/ruhzxQc8T1/nydtBzwDvr0c4qOA+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBWbVk4cW1ZQTdwWWRld0pLeitqT2RzZU1ZWk9ROXkvdkpTUDVuVHlpdldj?=
 =?utf-8?B?eWR2TTh3MWdlWVNvZ2hxem1ZZ3NzYktodmsrOGo2MHJDTCtCN2NBUkd4cEpC?=
 =?utf-8?B?a05maklXQ0VQcmdIeUxBZ1BPNDMwSFFvWnB6cVZNQkZXcktqNjVSY3FJR0lN?=
 =?utf-8?B?Q0lVREVoUDhsVC9aS2I3MW5sUFkrSC9LVWJOZlBmQVNSOFpsV1paSWJPMDNQ?=
 =?utf-8?B?Sjlub202VDB3RDlWWjk4ZEEycis2QjFlcnF2WGNydTRwcFJPbEYyV0dBWmFD?=
 =?utf-8?B?TTIwc2wxSjlEQUllbW8rOEt6d1RqQXB5LzdGOHJCZm9qRmJFN1BmQm1lelFw?=
 =?utf-8?B?SWkwcmQ1bEMvRGRsZTkxT0VnVE9qVEN5eWd5bmt4SG9OQWo1RnFJTHlVVGgv?=
 =?utf-8?B?a0VmL0wyS3cyVGdzdFYrUHdmRjJZKzBIbXdHbmYvUjUrU1BWWlVqdVF6RTR2?=
 =?utf-8?B?TlZ1Z0V0bTJ5cUp5WU9XTkdIU2lFdmZiSmVTd1U5VVdFMEtIVkphZ2Q2MllC?=
 =?utf-8?B?QmYwUnJhV2VTUG9qVnBNM1BCTU05cFM5TWJHbXFMWjdrMVZVRmlINEh2WXJL?=
 =?utf-8?B?bkJFU0tHcE5iRHhRWUhWMzhGZDlXYlFId3VQZUJ0NDBCSmhIdEtnMlp2Vkth?=
 =?utf-8?B?elJVQkRLamtGaDBOZ3piUnorWjVZQ0tsblRmSFNRdXhLY2xKdUdjUWNnVGlk?=
 =?utf-8?B?SzRqNHJVZjNzb1dqc2xPMldaWm82bUNZV0F2dlh5akdPSGR2NHczVFNKOHZ1?=
 =?utf-8?B?ODhRZDJHT09IL3lRMjQ5aXBPcnpLa0c2aGZ3MmFWcWZ1ODZUNTB6U1lQMnNt?=
 =?utf-8?B?bStVUklRWnZJTmxtQ3lmeWxtVXdNenp5ZG4vUUdOWGhlMzB1RlRjQ3lOSCt1?=
 =?utf-8?B?b3hqOHhiZndTS0ZKRWZrNll1djBSMG9LOXB4S1YyYnVPZTlJeGxYZGIwOUsx?=
 =?utf-8?B?NEI5a0dneUVDY05QNHdQMnZTaXR0a2Nwa3M5d3Z6SzFTa3dUd1cyUWR0WEs3?=
 =?utf-8?B?aHhrVGNKWEhtN2o0RCtnSFN5cnpUWHhLYzloakZZN2hMYXR3TXl5Z0FpZTNR?=
 =?utf-8?B?aDNPK1dNUHFLSWFpdlU3b0NRbjZBbDZwaVJ1QmxzcWN5bHNrQ0o1d2t3dlV5?=
 =?utf-8?B?UFA3K3UwUEFhMGlWN3czOHY0M0pDTGRqQkdjUHBGSTZnaTh0cE1jYXhQcVN2?=
 =?utf-8?B?UnU0OFg4ck83UkN2S01iT3hwWHA1OHRLc1l3ZHczRnphU1orTFJ1blZDdmhN?=
 =?utf-8?B?UEJDbk1ES3JmUDI3R3Ywcm1ZWUpFdlBNaDhkc0F5bWMyWU1DdU1jckMzTXN2?=
 =?utf-8?B?TjM2RnFxSEhndVBaNTc4SmI4b1ZsRVJ0RHgvbE1iV3JoOU5ycGlTNXYrOGM5?=
 =?utf-8?B?Sm5FMDdQRENYRGJmSlFOY3NxZjUzckltT2l6ZndVMStlSGVpTVV2K2RwTFpB?=
 =?utf-8?B?QTM0VGc4VThYMnhEdWFtUUdLdXVzN3BhUTNKa0MvNUI0UGQweEM3Zmt1WHov?=
 =?utf-8?B?UENNZnMzWmxKaHhrbCsxaFI3VlRlMlZRd0c2SmhvVEFKN3phVURyWWltVURQ?=
 =?utf-8?B?NFozT0p2YWpqbHJzR1VJY29QUlNUR09ZbDIzU1NGSkJYd2t6Mlk2R3VJa3Vo?=
 =?utf-8?B?cWkvTVp4VWdSeTV1bzFKRUFKclZlUGtNYmFEZElSQTNlWUR3U3EyT2N3RE1M?=
 =?utf-8?B?N1FodkpFVDJ2UmYrSk9HaFV3WGdteDNBUGhaVlYxUkRyK1E2Y293Z3F6S1JI?=
 =?utf-8?B?eFZLTHlqa3p6dlJ0alZJMVpkWUZIbXZabExPckhnRGhZVkQ0dDNDSjkzd2hS?=
 =?utf-8?B?SlUwczQrSzFxOERhWGNKTTRKdEgwaHhkYWhLS3RPdFUwS0xzSWZWUlVacEk5?=
 =?utf-8?B?MnBjeXhtdXh0ZnlNVXc2eU9OQmw5aTFHdnJ4YUgyTzhjY25yOHd1a3pDL0xu?=
 =?utf-8?B?ZXNwT1I1UTJ1TGxOQzVEZjUwN3daV2NjdUs4clRLcktseEIrbGQzZmg2eDEv?=
 =?utf-8?B?dDl2d0gwV2haaHEyS2w1TGppaTZJdmY2V0pjYWcyc1ZGYi81UEdrU1dNdWNM?=
 =?utf-8?B?c2tIRFJWc1pjUmpnQlFGT0ZtSitYTUsrT1oyZHJSaVlWWEFtYVl2WUlVQW1G?=
 =?utf-8?B?alJkcmo0SEplOEtBKzJ2S29JT1lORHpZd1hTZ1o0MkFWWER3S2dsZFJpaEhE?=
 =?utf-8?B?d3JESDB5c1Z0WEUwU0NKVDFiNTY3b0tPMWY3QXVtSXczWFlyTHFWSHRVVVJU?=
 =?utf-8?B?RzZFYmR4dFQzVFViMlNMbE84ekFkUHpEaVErazFuUktJOUh0RklCQ0lrQ3ph?=
 =?utf-8?B?NUxOWFlRZHA3ZG5pQTBaQThISk5KMFZWWEpmOU9yVmJVc3duTWxFZGJWK1ZY?=
 =?utf-8?Q?8RRAYcRVgZdNHQKc=3D?=
X-Exchange-RoutingPolicyChecked: gSamm5pJJZcTOif/aO71YWe/naycEV+PN2jbk03TkziqX9gR4wnyrZXwTQ66TJgh+p1DFJGHq2K4dal/PcLfkwUcoqOPrbnk19o47LH203O6aARDW8EaISgE9xsMFFHHLSqatgxUDR5CjYvNZMw5lPdNPkFfjvp1aXeeGVyGfxoHfsdVhXqDKS/6mFUAeFipOxzdi5qOhs39M+XJeRJt72Uh1KM00Gotl8k+iNf9wXaayFDMqrDeMRKGa92VVdWt6EQ4Pbg5wijGLnS9/qt3LPK/FIN/LIu3ase9+UtAKCfR/p1R+Tjzh6c1qCSDKVPVeqWwh4wXBYk1QXt4yCL2ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99396b24-6719-45f5-0a1f-08ded07a5f40
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 16:21:53.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFeXuJCzIN47OFXudFcVKxvtH1izyfjrWHw04K6aeTfwJ2P2WKcxdcKEkaoc6Zs9vLUgAZqE2KFhSvnZOE4rtowI6bEW0WyN3bdyA7WT3X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
X-OriginatorOrg: intel.com

Hi Babu,

On 6/18/26 10:14 AM, Babu Moger wrote:
> On 6/16/26 18:36, Reinette Chatre wrote:
>> On 4/30/26 4:24 PM, Babu Moger wrote:
 
>>
>>>    - calls resctrl_arch_get_kmode_support() so each architecture ORs
>>>      BIT(<mode>) into kmode for the policies its hardware supports
>>>      (on x86, AMD PLZA contributes the two global-assign modes).
>>>
>>> resctrl_kmode_init() runs from resctrl_init() once the default group
>>
>> resctrl_kmode_init() can be dropped after changes described in response
>> to previous patch. Apart from no longer being necessary I also find that
>> having the kernel mode fully initialized *before* the hotplug handlers run
>> to be simpler.
> 
> That means resctrl_set_kmode_support() will be called from the architecture layer, likely from core.c within get_rdt_alloc_resources().
> 
> The resctrl_set_kmode_support() handler would need to initialize both the default mode and all supported modes.

I see this differently. Since resctrl_set_kmode_support() is optional for an architecture
resctrl fs can just statically initialize the defaults. resctrl_set_kmode_support() would
expand the defaults to also accommodate what the architecture supports.

Reinette

