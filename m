Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD351EFFA1;
	Tue, 11 Aug 2026 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416805; cv=fail; b=CgiZ6OibjVwEP4pubhlo7wIbMmpQg1brrPGATNaX4JwrS7rLcou8shFLRHiZrxmDkqQpcXAWFopOvLN7q5gqLjQnReSKNqVSpzBwkhCr9HWVE8e0O5sCJC/rUJPzt6s8BdBi3xJQdK1wgNdP/nNoVBORzd077tKK4GorM7LdBgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416805; c=relaxed/simple;
	bh=zLqaiQXp4vtycFWxpeSk6WrlpSsZu/1YziyW4/0F/R8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XqI6Nxm9O213bEQkUvpfFBFx5XBhMJKVmAoufEnJ7Q6UBnB/mQNwA75d6ZavX1074nD2DVN71CTgJKIYVSOdWzUYfS/+VHIXMPe1kGzyKePTorI9ic7LFTQoOM8mVtoDdaufM49Xo0oecmXB/RPPS0XBuSW7C8vVGbCIhkLGAGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyBodPAW; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyBodPAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786416804; x=1817952804;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zLqaiQXp4vtycFWxpeSk6WrlpSsZu/1YziyW4/0F/R8=;
  b=HyBodPAWWYRQ9arK890KqMWzVsGbF4kuCMZD+MQz7w6tcR3OodY5IiZ3
   Q5N7WoIC+sKVYjdOrw9NKVf8EYnV+/Wskm7w9IgQkz6wOw0P5dFkzGzGl
   QAnkkG5nkodinVf5/IRkLLfmp4L5PxTBQJLneG5CoPCwXzd0m47W+KcLL
   +ptXk3QCLzzckAElFSruZR031zk/GijPwMDNrO694RwmU+sSzKSjTO02r
   qUry2UKzmsWMlxuoyH21HW8RKIVeklgFahyMw+JQ1NSTr2jE/Sxa2uulc
   2JIuboWL+zWQU0jZfNy+QKu1itc+guIzB0VYapiUO9BV1WDqZhZIe7Y3+
   A==;
X-CSE-ConnectionGUID: 4/ACyuQsQBOEU8W7u4ZzVg==
X-CSE-MsgGUID: h0Clb8xCRSaaec3PN08s3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104333380"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="104333380"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 19:53:23 -0700
X-CSE-ConnectionGUID: uaQPUwJCQpKjtWFl0dPlDw==
X-CSE-MsgGUID: KAd/e+9WT9WKdXR6UGeF7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="260609623"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 19:53:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 19:53:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 19:53:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 19:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIBB61HHaDB8QAWHP27zwAniDfU8+Dlca6P9mg3pvBgHKeALz52ESdpMf0HkKaZvo4FC/Odyuh9Z2JJi2bVpbJcS2iP+BA2x/fDai2jucxH9hLiWgdqGW82iYl3AO27ugHT+1DQCka+xKd2T+Y4S5mbbdrzXgW4A6uoGK8a0GBzPOsXw0VDabvCx7hO9sDOLTWaGEuN9Bq8hCFW51JMFbvKkgjB8418CYEl9jTG/5nMibwWggBBmlcGIh6u1TgUG7hBLa1oxNpvDPWjhebPtkoR0C416iq42sgADuQ3VNoSgh7tMkPwNIx6SekbCEdn/J9fv3EWX9L0HhRFoWi6GKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB5cYfQGKU2yQ3AeEBdWIBOZo9PXtXplD9xt4Qu3GHw=;
 b=D70wX+K2jdwHrn+QF45cReeNM9ABcBRNP9aWXnOVYELTmppQ2hNvkllX6UJC5NpUlI+bBe6hFFJkQpLeqGfPJcjxmhM13K7TkXfvOzycuakRCj/oo690Q5o4upPYsQUsbp+h6fJ6NM2OOHXloCko7Dq0edZQQLpEqU80UoA8DISTUC4b0LN+CEF558IwSz5GGJUiJzLp1k1aBe2XbT4ZjV+WlNPgrAh/waAs+LrHrQ9WndxE5ijDAEb04i15ycqDfdyc/y9lBIiBh9uYUOE6h514BAy+zEDcnYGb7USneqc1l5fJ93JGajvd3jYPZvnuyVT/ZiXqrdi2ryG14GOkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 02:53:17 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 02:53:17 +0000
Message-ID: <d828905f-2194-4447-a1c2-7b604407bafb@intel.com>
Date: Mon, 10 Aug 2026 19:53:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 02/15] x86/resctrl: Add PLZA support to
 command-line options
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
 <d16019e92bef7c284aa69da7f7a36477c1623f0e.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <d16019e92bef7c284aa69da7f7a36477c1623f0e.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e59863-e0c0-4a69-e513-08def753b1fc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 5nBRo8WQtuS07bws7C3XMAVbTa6hqjKDB7/9wLTb8fmNa0YuXJdcljD4CclmnH7quowk7nacINh+qUHFQNyJeH8BSHTURY3+hJRST3bAPQH8EL2CPVqEAz8xC1/GXHvVrv6Nu74DPJMxO0BHzXZX1ZcUFR8tbyhHO3gQcvEkZQApgQYVYzVlLgGNCcYGiCm0Z6X09vvn/f96qd1DnCl+x2esK2TxORDQ4DY9FYQpRXsZYUARdupQNB9BE+qZpw8i75Tl+doSyn3w9pLcpAIR6gVwhgjNIbyYxq7hvMSfnXGK2Yuawcb/0hGECKa/0N9Oy5skODax/ykQ8yAMW1TmtztmTkbQb0GRHDfQpAVD38LSZ9M5mSvWPx6YtlCr3PkMIOTElZrm1kTpNMh+ryXfnScLXLIBL2EXWHUiyQ/PI4aPSYkGosixwdiSs5HmeeCw5uV0EUEEwZYl3O1h3PAl5ae2hqzGTQmKk9VCTUasMISz+pa7L3o/l6CURYjdxQEfQaacvCI1ROUGo0yLrcGUAdYinnqoNYiAkPNnUa8jcxBHatrEoN4JZcek3M+6svodvwTtcP3sajgd6kfmYwD1/EHX7Iu6BHT6ZtcvlswP+K4ycM4cb47TGiQ81Wf4wiyZ1G4vJootDRrwiwKvqTGysVIXGkl5xf80OHOkoP8ddd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHQ4Q2ZEdG1EM3hLWnFpT3VzaGx0TjFpWTVIREJOV050Zzg0Z1JEZDJKSnFn?=
 =?utf-8?B?OXlJcGhJWDdITk9SamhYbWYwMTdOdEM1WWFEUUFCbzNsdHAxa2hjVHI3N21Q?=
 =?utf-8?B?WjkzM2ZWNnRTUjY2RTRFWi9nUllvMlFnSDQ2Z2JOMkJkdTFvdHdpbnRqTXNx?=
 =?utf-8?B?SGRER0NvK3Nkb0F1REIxZDlWdTFnV2xKY0JaazRQUWZpRHJaalBMNTJqOWI3?=
 =?utf-8?B?YzZiRTJLMWpZdVFMZDVBOC9wcDErV2NEYTVTYmZreGpCeS84eGJRNjBiZGxr?=
 =?utf-8?B?ZUR5QStoL3hBb0I3WGtVSWx0dTR2UkhuWDlmdXJBYU4rdDllVWZ1azlrRExG?=
 =?utf-8?B?a0Naa2tXd3BBQUoya1lEdkxRZGFZRzEwWitrR1BKd0NrZmxJd3RXS2R2b1Vl?=
 =?utf-8?B?TDdoblk4dk9xR3IzZmJwSWtNUVlaajNXWkNhYy9oNHRRN3A3eGVqalEwaWVS?=
 =?utf-8?B?Q0RSQ3JyeDZKQVloQWpGcXk5NnljcW03cVpucmNNQjB4WXZKUzZEVWhjbzIx?=
 =?utf-8?B?T1VMWTlSQytxWTY4SnZWdGZ0NjEzdE9qN1E0MExyMEZNRXhDc0s1UkZySDh6?=
 =?utf-8?B?MWZxMmVaMXpLZHZ6NTFQVFlySGFYVHFRUFUxK2phcnpoTlpNV1VNSlJ1d0U2?=
 =?utf-8?B?bm9teFpoMzM0N1ZVemxpYkQyb2M0c1Yyb1NGcGJiRVdLcDdCTGxYcnNXQjdx?=
 =?utf-8?B?MTdsZW53ZTg5TDRUN3dRcERlRXM3VmZnbVdaUit5WmdZTkcwYXBDcDNZMzk5?=
 =?utf-8?B?U3ZqQmtWWkJlRkVwNDFZbHJlUklTa0N5ZEY0YzFrZ0piREtKVG5iTUtCb2xJ?=
 =?utf-8?B?dUdZK0ZLdFdoZHl3WVlMWTREdlYxS1VxTVZ4S1h1RkxGNVhEUHFmNGc1Rkts?=
 =?utf-8?B?M0ZLemNNS01UaHR3dUQvSWZERTFqRmw2bytIR0xjMDczcVQ4SXJlN1hMRk9m?=
 =?utf-8?B?TXdxQWF4WTdhZnJ1RHhKcHpkZ1NOdUUzVlJuN2lieXNKMS9idzJ4WTNsdXJ5?=
 =?utf-8?B?N2htNkxYb2FLWUdxRUpacHNPREN5U1JYdWtUM1MreDN5U2RhMTZRa1JjNHNj?=
 =?utf-8?B?bTBUTy9uRVc5S29TU0lXMG9HQ1BZb29SeDB1b3FLWkl1aW5OZTRkbTdhUVhp?=
 =?utf-8?B?Uy91WEJrUWw5TFhPUUFJNDQzTlBVQ2tUOVNHY0l0T0dTWkYrNTZGN2c3MXdT?=
 =?utf-8?B?bEF3VW8xejUyR3NFakxJck5ESnRWelFxVlBpTGx0QmpOUVAyRmRGRGFpNFlD?=
 =?utf-8?B?M09IYVhYbXlKZWQ2eEJQRnM3Z1l1bmZNQ0RQalZITXZpdnFvejZXYVoreEk2?=
 =?utf-8?B?OHVrMnJhUEVjV0ptTGFOSXV4T200cUtQUk9Zc3hiRFgvS29lWFFoNm9SckV3?=
 =?utf-8?B?NlBtUExERlNoS0p2TnFrMERzZzhseVJlTTNCcnVEVE1yVmN5M3dEYllHckZP?=
 =?utf-8?B?em5jTE43MU9OYzNYelU1U0hBSzA4OHVIY2tyNkdVQjhRa1o0Z0I4WlFvR1B1?=
 =?utf-8?B?NlkzVi9IMGN4NW04Q3psbTdJLzZLOGNLam9vQVlVZTRkQitQcTFpdzlyWmRq?=
 =?utf-8?B?S21Cc2ErTEtJdTByZ1I0d2dyektuTlZReXNId2VQNWh2UGxjcEtUYnNLalhM?=
 =?utf-8?B?dGpvN3B0Z3k4M1VvdUxvTyt1R0ZtRFZLaG80ZTJyc1BtdTk2dUtMUUcxK3I4?=
 =?utf-8?B?K1U2aTl3ZEhqWFJEZTMxcXVETlVTR0FrM2Z6Nm1hZERvckk4aTBoOGIwWkhF?=
 =?utf-8?B?aHhEaUs0L1czUStmY1Z5Y2liR3RlSlNGOGE4MW5uSWtGQzZtTFFBcUR5c0R6?=
 =?utf-8?B?Z1BaRGorK3hUZ1M5Ky9kb0oyU3paTkRpRDM0Wk9qOWxZczJlSkY5UXJ4c1dD?=
 =?utf-8?B?YjB1TDdPNUI3bmlJcDdLL1AwMHlhQVpsenQrL3JZNm9UUzVTTlNudUdPN1VC?=
 =?utf-8?B?OFRiNFhzZUxJcUlJQXFHNUI0ckpVTjZFMUNKa3crRFFRSDJIeHFYVFpaTkZY?=
 =?utf-8?B?WElubWREandvVEJGR0tKdFBMTGF4VVM4U3VjWHJDNGwyY3RKQWxmZ005eXFa?=
 =?utf-8?B?WUUvTmJzMlkrYjNML3RGNUNUWHFXUjQxZmtvaCt1aTByUllRSnM2d3VyS2Nr?=
 =?utf-8?B?SGVxUGxLRC9HWGZTUlZRS2xiVDRSSGRXYjdnZ0ZyQXh2ckxmSkxtem9ad3Y1?=
 =?utf-8?B?WnpyZVBZbHBiTW01RitkN1hDN3ozS1ZlMFVHdDVBN2tDWGxsSDZjdmo1cGs4?=
 =?utf-8?B?L3hMLzlvYlc4Y1BhQjc0bk5oNVBlelcvbk5ZamVBcVFzMENSRkJYRG9US0Z3?=
 =?utf-8?B?YzBpTDdSZFhGcWJCamVYc0E5VXEwUjREMjZQZHV5eWgxY1NQZkZUMERsdVlF?=
 =?utf-8?Q?EoSKlv5zk2AQAwTQ=3D?=
X-Exchange-RoutingPolicyChecked: WNg52uQppVVOoj//nsfnpduiTkaLeBhxBFWYvYO9eN3wYgp7YPI/yJvoWuARF3JjDCSUtp0DVml5M7rOfnDNsN1mGnycNZneAYgSxKqH0NdPbrs7wPC6gDq43CQE8djgSb6Ka55EYKk6xYdMxgPaaeKmFBFs+EUQKHkrc43mkPqZLZiNnK62L8HuW5xlIb/5WjMv+ztJekN8P6J+M8x41771Gse3++6shqFJO1WT51/uZEPLkLhqMeAj8LpIXtT1ixUhhzIzLZh4Kz/SySPFi7VhICK14fLH8WGyla+E9WCBMwxRun3SDh8LmRqo8CPV78+c7XLjeWfUVBixoR/9qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e59863-e0c0-4a69-e513-08def753b1fc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 02:53:17.5318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFcHahTDZF7aEXiexuMgvrGtvuHhkSZK02vYh4N9lT0JLS1vgryZISi9kvuta+YET802Wnn7zYChkkc/IbdTMdVlpiRyCaG0zdCUJV/PUvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Add a kernel command-line parameter to enable or disable the exposure of
> the PLZA (Privilege Level Zero Association) feature to resctrl.
> 
> This allows administrators to control PLZA visibility at boot time via the
> rdt= option (e.g. rdt=plza or rdt=!plza).

nit: Since this provides examples of the only two supported usages it may be helpful
to make clear when these options are required since users should not need to always
boot with rdt=plza to use this feature.

Reinette

