Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F004245020;
	Mon, 27 Jul 2026 21:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785188533; cv=fail; b=BLkIfuU6ICf/rK+e2bTm4jIPvbGhYnVneqqlSu3d4GsPkJWH9Vu4xYiDaPofWQnCnN/khFzCMrYTPryPC7FbNyHYLHena1mW6rHfysL8FpOgDt+Zt/TKrWyRkGFkFAP/U83oLbfqaXEeqnLVCNjDI2FtcsHNsD2JhUYTIPP4v5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785188533; c=relaxed/simple;
	bh=R+ZKmMfO+p+h/Z7Fl0AmXI6BfczQKFXSdP1fJYPi224=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XDk+GuHQU9K02XU2Krs7yFEKoovVlf7yN25/nAq8/GE2gbA+rw33hbCPPdS5notP1Omcoxw5rRSMquepQIxb54O7nv1vnAqV2OmH313eCDijfhfPIUWsGAYi/zTuxRQrnzA+pbkN7HH+uls/9A0BhjpZ87OjR6/63mJN83MD62M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxQ8tQQl; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxQ8tQQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785188531; x=1816724531;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R+ZKmMfO+p+h/Z7Fl0AmXI6BfczQKFXSdP1fJYPi224=;
  b=QxQ8tQQlLD9Z64rgQ0WFedNrBlk7WDlbxo41a4ZsKm0fus1kHLBs+ECn
   oNCQnBrQ7CR98Dxg7CJRRb6HoU0jHQVGloAcptVx97S3snxoP0Yk5Ylq5
   B4CVnCq8Ra3ICnwD/Hmo47iBFmH5Hk+PpaqNYySB6koOSiC7/6iptwStY
   qrTTOdQt4u2o9RqfAZT7QvouHdSWEGlmfEoGXYbjtBN+m7XCaWznTggXl
   aCSL/wE6ThURYrmCoRpyLi/m5ZzbNwO17iEW1g/fDSN1V0SFg0SUzGROj
   PkvRdh9fnwKQvTdVx0LEZy130Os6gCrF/Fz/8kGZK1SNtyjiL/BjbEIWl
   A==;
X-CSE-ConnectionGUID: FenRlVJTTfy84SvByDPlmg==
X-CSE-MsgGUID: gvVhcQg7RdqUhgfL4w4Rog==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85885726"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85885726"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 14:42:10 -0700
X-CSE-ConnectionGUID: Rbirwe1vTP65dyrvcxYNNA==
X-CSE-MsgGUID: PEYxqi9EQuytAGKJutiVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="255210920"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 14:42:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 14:42:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 14:42:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 14:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYgans5DUSL504PrepxnaEfTmuIkgf7735OnktZdgQcM5Ck9IIz5Nb+QPfZXUzLtQ+3eWXsdf7IWU668q9kUb06KYq0JGZO8KwLT9L7id5B0lw03oAUJtRRmKkC1wivwZW9tqf5eHQ2bXvSPyOmG0bdsz+T95ANWOe08gzA8XtxQL1TuZVdD37INRUFy1q+9ScI/ZulsVYj3404WbrFELEdLbHt1KKCiyNfEkPTDLFj+1XuR/nrFaYzzAxlGdCy9oN33I/6mL8m5n3N0p9c2u/4ZEAXihHGgr8RO0V0pf9cK66sa1UNsvLU+1fayPUkFKls7SgzipWOm2xJsG5aJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqvX6pOdy5DcRuXvUNTqcPsn6OsDQei4/duXd1cq7E0=;
 b=zQqitzgx/3dXyyHbjS2XYqc8a19yupwJkEXciOrCN0koPlLLlZGEufYNOshdsyCuRlF1k/tORwLtYEBgSlYcjnrrimWBbGKrev/9OxPsCNoQp0CxDlBA6azTk8kL586tesLlKqJGwYo0+33JFOu7mU9Ne5un6m9whYFQYzhNH638S1fVJZ9SAuHhMaJEStdbnBD9fGeNUwy1+dci75wj7ynSbCllcdzMpK0tAv24iwVCKVuz4gdmyJpUQCwp+I7o65bks2MqO4NH/eA+mj/05qIzmSGrDsipBseYypVaOev1GqcufwQrcpyvxNRfL2isWroFFuX3NClEchdY5LLeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB9155.namprd11.prod.outlook.com (2603:10b6:208:569::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:42:05 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 21:42:05 +0000
Message-ID: <62559344-5182-4d16-a9ad-e22163b20e7a@intel.com>
Date: Mon, 27 Jul 2026 14:42:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
CC: "Moger, Babu" <bmoger@amd.com>, <tony.luck@intel.com>, <x86@kernel.org>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
 <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
 <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
 <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
 <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
 <d2c4e17c-2aa3-43a6-980f-ab4bac769852@intel.com>
 <5a8815ce-487c-4ec3-8c38-d9b3c067302f@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5a8815ce-487c-4ec3-8c38-d9b3c067302f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 8173d47e-627d-4532-e892-08deec27e6d2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|13003099007|6133799003|5023799004|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Ag6FF+UqZKCeJPwqcqe/XJQXOig15YOIOdC79/pXMBTr3zIfFinDO4u4CXXZ7yR9LmSgkdNsw7fivmnEhcDZIXKKHc1R66thL5atahyXKVQydSt0wOpXXuY7DZeSnW3Ljwj1TADjvpjCuyLagC5hLhcb3UxTcNvpqhqmVrHLTd+fWXCEWsxsqGYACwQbgghoxo8+Iyz4kVjDriAXN4rv4ON1gWwqtKO0s/NdCZVxUfg8Bm+nK4giOt3VUGaHAX5SyUgcW/4ZCXtMM6nKv+DNSSfGwzQdgOXteo2KjCALz6Ckj+zTJEuAKClOEZF+Xgc9PVj9EORrEc+AMrYuykOmGeh7NE4L7QbZPfCK/p0VGQN/Hvh+T9D4IT7divVtx0mn3rgwR2+lPxSvK9Z0K/+Bb0uhpmQyYc/jlfx66fd8QEF4h0XOY9g/dcNu61ikRUm/BSiSS5qFTeJit4eWyUBY5CqEtlSsAPeBECAHsI51PhymiYQkZ7jUhNziZh8DqSxHZ77ppaA2Ksf8jzt30MasuM2n0rqVBI7pep0a7HzCr8kwKcELjYBOwo9pvUgekIFNXJRD6LZCF8F8WTFz4ErVGpND8cID9eiL5lrasYjNq8OAXezGA4bfC7hlPDQnGYl8RQYDBbOINETop4KhNThqRbqoJMTerq+6cFKDhKx4pM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(13003099007)(6133799003)(5023799004)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEU1MU83T25XcENDVTV4bThPUXNudnc1WVFkU1RmSzVUNjF4L0xNZkN4N3Ft?=
 =?utf-8?B?TEd6dm9VcTZIaytWZ3ZJU1NqSmJZc3Z4UDhhYnhpTXdQNW5yT280STlJRHVU?=
 =?utf-8?B?Vkl2V2EzS1lWaUtRNmxGd0VUb2hyLzFPYVhDaCtNRS9sZHBCeFhKN2w1YVQr?=
 =?utf-8?B?UDJHMTArU3FZYzRPU1pRTklaeUJSSm90Y3VxNGtCM04vQWFhSlBuVlRwSHJ1?=
 =?utf-8?B?WndLRjZTRlBCSTFmT0ZxdzNyWXlaby83T0l1bWIrMWN4SktZais5d0tVNy9j?=
 =?utf-8?B?WGRDdzZxK0kvRUNCUTJkOGgyWFRETXptaHErM1o1WW1CaVBJT0ZyUy9VRVp6?=
 =?utf-8?B?K3NRRllwU1pwdE12bjJCVnBXTDh2eXdUMXVIUmx2Z0RRYmFFUDdjYkJITlE0?=
 =?utf-8?B?cFFkdFVVb1ZpMkFGKzdOZ2ZPVk5jS290S0lTWCtQT2M4Z21OY3BmMWQrYVZE?=
 =?utf-8?B?SFRmVFVGVnlLcWRWaXdWY2xXaGtJc0l3Rk1wbFVjdnFmUFg0TmtOdnBLbERJ?=
 =?utf-8?B?K3o3QmFDSUNBMHF0VlVFZnZVWGVyWnNsNFB2elFPRHoxdCtKZFUrTjlqVzVa?=
 =?utf-8?B?bnhPSUVWZ2pqUy9qbFEwUngwUDBJVU9lQTcyWEVhK3h4NFRjMU5VbDFSOGt2?=
 =?utf-8?B?MDFzdGk5NGpaSHZ2a2VMV2xuanlieWNobWI0M1BEdE9VeC9rUXAzQVBpcnpp?=
 =?utf-8?B?RHB2MW5rVjVWTldhM1ZtNkYveks0SS9TUlJNbTVUWDNHclgxR2dFMGM0UGIr?=
 =?utf-8?B?R2k0bWdEY1NtRUpWUXFjQ2JWcjhsQlVyc2ZQVjFiS1oxbmx5eVVGVWlycVNw?=
 =?utf-8?B?bDMzb2F6ZUozZW5Pc3A2SFlsaHNoTTkzWGdRYUthQ1JEbm84bVRMeUhUUXNE?=
 =?utf-8?B?NlpyUzFtZkpHUjRiWFZQWitCUWxjaDMvMzJZcUNyMkhHMWFuWW0zSVJBREpW?=
 =?utf-8?B?UXNoeSt6ZUxIcmJ3SENoZXJDZVhiMCt4U3oxN1gvTjlydWc4NEZCY2xyZHFa?=
 =?utf-8?B?dFZaSmxMR1hCQTVVbk1CQTllRWdsWER1elNYTWlxQmNTMFFCa2pMalZNaEk1?=
 =?utf-8?B?SzJHU3Vhc1YwRGpUNVk2NHlIcDJtcE1oOXJ2WDNkUEgvZWFEZnF2SG9Edjk5?=
 =?utf-8?B?RzFGMm02YXhibThFMFZJUW5wTzdSZVhUcVFaMEptVVFvUFJvQk43RjZ0RTE1?=
 =?utf-8?B?Q1JIcElYdVIwVkRCaTMvLzMvWE4rbjYzMUhYM1FkVUVxc1l0UVYxbXdFRDBt?=
 =?utf-8?B?S2MyZWNidGRuYldRMklpMkJRZVl3TzJJSC8xMUh0MnN0elFtZGVPTjMvUjU4?=
 =?utf-8?B?K2xzZUZnZ1o1TkxueFlYR0o2Wjc4YUwrTFpSZ0lLdEtIQU5JdU1vMG5pRVdm?=
 =?utf-8?B?Z2xibXB4UUw4cTE0dHBYa3ozcDFRcVUwMVZnV2txcmE5TXNjUVExSHVoeVFW?=
 =?utf-8?B?b0VxeldPUzM3d3Q2cTAwQnZ2V0lGQVVSaTNkaWlha09pdnBsaVlldGl6MWUy?=
 =?utf-8?B?Q1o2VE5JdHpzYnNMY3cvS2N4T3VlVjFYWklMaThaSUN4YU9TYnppd0hrWUhL?=
 =?utf-8?B?K1RadXdTZC8wMGxhSTBXMHpyRzIxUW9YUW9rb1NPUVBMakd3ZjRJQk8vejZ1?=
 =?utf-8?B?NEUvNDJ6WGxDcDJqU0xLQjFSZ2VqeFpEemtSRXMxVFZYRVpRT3c5SitWZjgw?=
 =?utf-8?B?WEpLQ0RJdGZpc2NSUDJUTU5ydFVadEJKQWtkcmxzTWtJa1lpaEhrMXAvYi9q?=
 =?utf-8?B?aFRUdk54d21IWlo4Yis3bnFlRWJYdWhacXZvVHJUbTBIYTJSRjJpckVaTWxi?=
 =?utf-8?B?YmdvUE1ldTBOTnZQV3R4WWNmVldqL284R1dJVS9zVkVZN29EMDh4c09ySmJr?=
 =?utf-8?B?ams4OVZXRE5BSXpoRHBZOWxQaE13cGFSWnpaLzJ3VjJwVUZBQllrVWZIejF6?=
 =?utf-8?B?Z2xDYUxXSldObWs2bnZnc0g1R044azExRERuNTR5WCtJRmsxNlRzK0FCdXJm?=
 =?utf-8?B?bWdVNHlMdGl5UUJ2OGpYd205TUM4RW8yRFJmbzQyRlpCNy9ERllXOHJsaStD?=
 =?utf-8?B?a3pYUGZHVExPL0RjTnFLQmpBZUhZVWJiOGRjOUlwMTd6L2o4OW44eGtjVnpD?=
 =?utf-8?B?azVWVXlhRUMvYS9LK2pUYXpRUXFDRFFEWHlzZHB5MXc5MTJJb3EvKzl1VnVM?=
 =?utf-8?B?ait2R2c0KzgxaXl6ck5Xc2RMcGx6VnJWNzNEcWVvTUN2L2duNmpLY3RTSDRh?=
 =?utf-8?B?T2gwSWVPYXBvaGVqOXo4MnU3amhzUjY0WEtaV084UVgzTzR2QmlxQjFWbm9Z?=
 =?utf-8?B?cnFRODg4eVhsajJCbk11UnRIUVRTNHJUTUsyZVhxcVoySVlvNXhYMHJ6NnVK?=
 =?utf-8?Q?GjvqHevrlg+xNxOI=3D?=
X-Exchange-RoutingPolicyChecked: WHILO1+aTjIYgTtSNaNgY4UYToWICTxnjE8BWY58hyATaOwV7JkFxHJLMbGuTYJ8CYNx+tdQLijSvR+IqzOCkAjz/XjAJr5Zx9kuer4YZepPV7W3JEEhsxBPwnoOyZJxcwtKuElPfolXCR4L4Q1U28ICTZUyMYSnY8ZtyxEXug1Y/iJaC1gBfUJEUdmwvCdlGcIMvpA8JurtCo3E3aNspLYPobNa45+9g+eVwcFAmNiCrBCfVeyEdLfY7VAhL1q6pXJSw5qegS6xX/JyAgXcfTGNK+PaSU5MM0X8HmQ9taSVIGqc0cX8snpJLakooNW/RMJepGtuWptZxd0qRiUjtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8173d47e-627d-4532-e892-08deec27e6d2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:42:05.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYtBi1uWChMQ3owypjdxzu7XYz+FN8+zQcHqPoZHmRw7drELuNXT+E/AgP3eGpoR26ppSNbfxCfYazf5ReYpgsPKPPP+QGhqLK5M+r+BwZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9155
X-OriginatorOrg: intel.com

Hi Babu,

On 7/27/26 1:17 PM, Babu Moger wrote:
> Hi Reinette,
> 
> On 7/27/26 13:12, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 7/27/26 10:24 AM, Babu Moger wrote:
>>> On 7/27/26 10:25, Reinette Chatre wrote:
>>>> On 7/27/26 7:05 AM, Borislav Petkov wrote:
>>>>> On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
>>>>>> One clarification here is that as I understand there has not yet been
>>>>>> an actual user complaint. At least not that the pqos utility mentioned in
>>>>>> this thread is aware of. Instead I struggle with the speculation about possible
>>>>>> user complaints with different interpretations on how this change could be
>>>>>> perceived by users.
>>>>>
>>>>> Sure, but don't you think that it is enough that we know about it?
>>>>
>>>> Only if we are sure that we have the complete picture. I do not believe we do, yet.
>>>
>>> We already have an issue open for this, and it is fairly
>>> straightforward to reproduce. Please let me know if there is
>>> anything specific you would like me to try.
>>
>> Just to be clear, when you refer to issue it means that pqos is returning zero for
>> unassigned counters?
> 
> Yes.
> 
>>
>> Is this issue public? I am not seeing any related issues in
>> https://github.com/intel/intel-cmt-cat/issues
> 
> Opened one:
> [1] https://github.com/intel/intel-cmt-cat/issues/311
> 

Oh, now we have a mess, no? You start by stating that you already have an issue for this and when I
ask you about it you quickly go create one with the pqos folks for this behavior we are
currently discussing to change! Why not create an issue for "Unavailable" being treated as zero that
I believe all agree is not correct.

What are you really expecting from pqos folks based on your bug report? Or ... are you now just
using that bug report as leverage and planning to close it when this patch of yours is merged?

To be honest as AMD representative and the one that enabled ABMC in resctrl I would expect that
a bug report from you would contain guidance how pqos could best support assignable counters.

Please take a moment and consider your report from their perspective. I think it may be
reasonable to view the current pqos behavior as correct since that is what the kernel exposes. 
If you find current behavior incorrect then please provide some guidance to pqos folks. For example,
do you expect pqos to always switch to default mode when it encounters mbm_event mode .... or do
you expect the pqos should do counter assignment, if so, how should it go about doing so, or ...?

What are you expecting from the pqos folks in response to your bug report?

>>>> I connected with the friendly pqos folks on this issue. They subsequently did an audit of
>>>> the tool to understand how it may behave under the different scenarios. They found that
>>>> the tool currently parses text return values ("Unavailable", "Unassigned") as zero.
>>>> This could cause incorrect behavior. (more below)
>>>>
>>>>>
>>>>> I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.
>>>>>
>>>>> And is the
>>>>>
>>>>>     pqos -m all:[0-191]
>>>>>
>>>>> invocation not something people would usually run?
>>>>
>>>> ABMC enabled (mode claimed to be incompatible with pqos)
>>>> --------------------------------------------------------
>>>> This example is from Babu's email that highlights that when ABMC is enabled this returns
>>>> zero as bandwidth from pqos perspective. This matches the pqos audit that found with text return
>>>> states, like the "Unassigned" happening underneath the output above, the return value is zero. When
>>>> the counters are not assigned then the events will always return "Unassigned" (until reassigned)
>>>> so having it return zero all the time may not cause issues. Once reassigned the event value
>>>> will always return a valid value (no text return values).
>>>>
>>>> ABMC disabled (mode claimed to be compatible with pqos)
>>>> -------------------------------------------------------
>>>> Without ABMC there are scenarios when events may return "Unavailable". These scenarios vary
>>>> based on how many monitor groups are created and the workloads run. I am not able to test this
>>>> but when I attempt to combine what I know about AMD bandwidth monitoring with the results from
>>>> the pqos audit I am concerned that there may be a problem.
>>>>
>>>> Consider a scenario where an event may return "Unavailable", for example:
>>>>
>>>> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
>>>>
>>>> pqos will see:
>>>> A, 0, B, 0, ...
>>>>
>>>> The "pqos -m" usage attempts to determine the bandwidth rate and, for example, when going from
>>>> "A" to "0" it will be considered counter wraparound that would appear as a very large and
>>>> wrong bandwidth number.
>>>
>>> Yes. Agree.  This is known issue.
>>
>> Has this been reported? I do not recognize it in https://github.com/intel/intel-cmt-cat/issues
>> and the pqos folks I spoke with was not aware of this behavior.
> 
> I was not able to recreate this issue. I just opened for the one I have seen [1].

So to summarize: it is known that pqos returns zero instead of Unavailable but it is not reproducible? 
>>>> Question to Babu
>>>> ----------------
>>>> Do you perhaps have a test/workloads that, under "default" counter assignment mode, can create
>>>> many monitor groups (more than 64) and cause "Unavailable" to be returned frequently? Would it
>>>> be possible to put pqos through its paces in this environment?
>>>
>>> Yes, I tried to reproduce the "Unavailable" issue with the pqos tool.
>>>
>>> So far, I have not been able to observe the issue. I created 64
>>> monitoring groups, ran MLC, and simultaneously executed pqos.
>>
>> If I understand correctly 64 monitor groups will still have enough underlying hardware counters
>> and always return event counts, never return "Unavailable". It is when the number of
>> monitor groups are 65 or more that the hardware counters will start to be re-assigned, no?
> 
> Yes. I created 64 monitoring groups and then ran pqos, which creates an additional 15 monitoring groups.
> 
> 
>>
>> Even so, I do not know if 65 would easily trigger the issue ... sounds like it is possible to create
>> many more (4096) monitor groups on these systems so there appears to be some room to make it easier to
>> create scenario where "Unavailable" is returned.
>>
>> On a higher level: could you please run the test that can expose pqos to environment where it will
>> encounter "Unavailable" and observe how that is handled?
> 
> I was able to reproduce the condition where the hardware reports "Unavailable" for some of the MBM counters.
> 
> #cat /sys/fs/resctrl/mon_groups/dir*/mon_data/mon_L3_00/mbm_*
> Unavailable
> Unavailable
> Unavailable
> Unavailable
> Unavailable
> Unavailable

Thank you for running this.

Do all of these monitor groups have workloads assigned that generate memory bandwidth so
that they do not just keep returning "Unavailable" but often return data also? I just want
to confirm that this is not just a variant of the "Unassigned" test case.


> However, the pqos tool continues to operate normally and reports valid bandwidth values:
> #sudo pqos -m all:[0-191]
> 
>     CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
>    0-191        2.55      55146k     74496.0        20.0        61.4
> 
>>
>>>
>>> The issue has not reproduced in any of my tests so far.
>>
>> I'm confused. It reads like the issue that you mention earlier is a known issue cannot be
>> reproduced.
> 
> I meant that the pqos tool continued to work as expected even after
> I recreated the condition that caused the hardware to report
> "Unavailable".
> 

ack.

> 
>>
>>> This might require specific test scenario to recreate.
>>
>> Right.
>>
>>>> Of course, "AMBC disabled" scenario also includes AMD systems before ABMC was introduced. I do
>>>> not know why the issue with "Unavailable" handling (text returns in general) has not been reported
>>>> until now. I assume the pqos team may do most testing on Intel systems that do not return text.
>>>> ...
>>
>>>>>> The patch notes mention that this change is planned to be reverted at some
>>>>>> point in the future and I have not heard of any changes to this plan.
>>>>>
>>>>> Where does it say that? I don't see that aspect.
>>>>
>>>> For convenience, copy of patch notes from original commit [1] is below:
>>>>
>>>>      There are plans to enable "mbm_event" by default once additional counters
>>>>      are available. For now, keep the default mode to maintain compatibility
>>>>      with existing tools.
>>>
>>>
>>> I added the text below in the comments section (after ---).
>>>
>>> On second thought, that was probably my mistake, and I don't think I
>>> should have added it. I also don't see this happening anytime soon.
>>
>> ok.
>>
>>>
>>> Considering all of this, I believe it would make sense to make the
>>> "default" mode the preferred mode.
>> The original problem statement is that pqos is not able to handle "Unassigned" return values
>> that will be encountered when "assignable counter mode" is enabled.
>>
>> The request is to disable "assignable counter mode" by default to address the problem
>> when handling "Unassigned" counters.
>>
>> Disabling "assignable counter mode" will under certain circumstances cause "Unavailable" to
>> be returned on event read.
>>
>> At this time there seems to be a mismatch in understanding how pqos can handle
>> "Unavailable" return values. For me to sign off on this patch I would like to fully understand
>> the risk doing so. Could you please confirm from your side that pqos can handle all scenarios of
>> the mode that you request to be the default mode?
>>
> 
> I created the maximum number of monitoring groups supported by the
> system and was able to reproduce the condition where the hardware
> reports "Unavailable". Even under those conditions, the pqos tool
> appeared to function correctly and continued to report valid results.

Could you please share the test details? Just having the maximum number of
monitoring groups would not trigger the issue by itself, it needs workloads
that generate memory traffic that intermittently do return data.

> 
> It's worth keeping in mind that ABMC mode is not available on the
> majority of hardware currently accessible to public.
> 
> Furthermore, default mode has been the longstanding behavior in
> deployed systems. Moving back to the default mode is therefore not a
> new change, but a return to the behavior that users are already
> familiar with.
 
ack. "We returned wrong data before. We can do better now but we want to
keep returning wrong data since that is what users are used to". 

Reinette

