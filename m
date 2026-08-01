Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC0E1DFFB;
	Sat,  1 Aug 2026 23:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785628031; cv=fail; b=fagCvqR3Yoeu+i5P/5rf1OZK61/rcxMsqQ0o5vNfxEe5eJB7V76q2xEtLqpACoQQqaFwjgxyT8XoA91UeqfNTqF+9ab0GMTK1Duz1+O5647xtRbtGcb0x+bwAKGBIGjaxUHut3tChogPuBNnP/fYNepRhbbtkpTKkIrSnN/ayCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785628031; c=relaxed/simple;
	bh=UNYqw7FePHXxUu1uC6hcRD8UtI6fEQ/cryUwe9XZPW4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qGYRk3mjH8yKgKrps/bfJIVeYEdnACOVUqEXaF4QZbbeDz5XfaKENqoXhD5iMzwzq6EngEpGGgWAdcq+gNDJLqspRNH0VnAMP7GHQTwQNvCO01cqQF4eRY8tCJiYZ6d1SKc/FAQfoRo/SdJErXbnOo4OHHuTIZu4v6InX3T9Bd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXoc/6Ab; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXoc/6Ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785628029; x=1817164029;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UNYqw7FePHXxUu1uC6hcRD8UtI6fEQ/cryUwe9XZPW4=;
  b=BXoc/6AbkNiTbyn8J8RGEKBxGsO4s0n6ayhPtDtrOA1McY+DWevlNwc6
   Ffg4rNHJb/e8WHBsuII1uhAwaKmVCyRP0md8n9h+0nC+0otxyS+7jNwBU
   imp35+XTuwbGEMLXKHvlUHWl3PTlx1TqzPld8gxoaUcM/BdzkBR3nJb/6
   J3MT2NfsUfjsHFl9uxL0TEwr/3PZ/FRIZH1YwIIokCq4diaA1be5FwDaP
   d1h3LSFABOhlcP+TelFgt0nNQp/vehElRw19TPHMgQW0GosMFkJovAQ8U
   TQvycczhBe9t5o0v4CFsqFZRnXldm02LKi1gC3xYGmOr9wt+4Pbjznf1t
   Q==;
X-CSE-ConnectionGUID: c8YGZDzgRj6CBMGeB7jNiw==
X-CSE-MsgGUID: fJN0ZAtQQOGQ+rQb+ehnNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="96875455"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="96875455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 16:47:08 -0700
X-CSE-ConnectionGUID: +XKkK5BtQA6oV3tbjqnNNQ==
X-CSE-MsgGUID: KkHD151ZTH+HjtknoLEIlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="260944005"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 16:47:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 1 Aug 2026 16:47:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sat, 1 Aug 2026 16:47:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 1 Aug 2026 16:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFTvSjyr5fvWrYRRpCLNADco9Fbb36Wt7t0+a8ONNQqK3oUIS1nBlxiPIo2jYqakD3tZeQ0DfvrsfIwLdHEeCHOwsBbbpej6M2dIZV7n5p4XQKYp1cZFEGhxSOu2seVzS4mWV2lPHFBC+SRjIXOcEZh+b3RFC08TC7iXZ1zvWdbJAVxsk17OoNpOSUNAKqolRscnKxTK066t1EN+m80W18rBbay8rALxMv2sncB9zw3FAsNe3QWkE376P1mSD/LsmKL/lMIR1pS9jfF4dNUIy7QWwZgHAnAsAB/vqfdsvg08ChCLU+nQ9gtE8hIb28BDNDXBor2nMouqwJGHkIx1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZPaqdzb+5uDPFSCRRq068t2pBU1xWmg2IiPDfKbe5I=;
 b=cef9Y6RrXrdf5Ichcn+4j/bJu72S1Z873aTrtY1c3mC/2HI+k/qZp6focCrA6cYkeQsjx5FUJP4hbEeXMtfh7lnxAVWy61e/Hru3pQgS3ZjYXiT6OAljAjGwDS4UWOa75kzqlf7XXbF1gdgsHG2iq8BUxw2pHTlq+m5Y/FqK/XRxjGS4wHC9fyUCwUOnhrdZgygfDHP8OQN7wmZVV295WzikscWk56RRS3K/LdZE02QepgcJgy9HcSDaPAHozhOMFmXdgY1ag2fiVQWx3KggoDd2bNxjpasvOR8fCR8PBCvKUm+Xg9BM+BLYj24btbNQvXvoZJtzA9cNyZIt4MtPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 23:47:03 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0270.016; Sat, 1 Aug 2026
 23:47:03 +0000
Message-ID: <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
Date: Sat, 1 Aug 2026 16:47:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>
CC: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	"Moger, Babu" <bmoger@amd.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
References: <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:303:6a::23) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: f8518619-7bf6-4e53-4996-08def0272fea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|6133799003|4143699003|56012099006|5023799004|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: UAth/eXmMsVGlJiAkpjgZxpinZT4EbEv3r3QN8EFvn3sXx4lboxOVL3Fk+ng5PxMxVLvQWct7sgVhluSyABm6u5MtlqMXAkKFoVnw4GrdsA2Y6TyRiBIuCmpeg8XTz5/FcMJj11uPw55fBdi0+7JAGxyEmofeuBdOS6i54SIverMIbiZwx9dDFTOb0forOblBYp0W6LKtHYcGf3JrZg02D9UN9ijxPomVq1aYxk9x80kkuon35zMhp/7XtVYvx065C2shPgs7fhMrG/zE/kaujNypAE/OWLXxAJlIDQjtEEQTa/PjJ+bk0QEh4YJdafgS88dgecgb9B67K/UhjmaRPKh8OE5RdCey4BCivvZdLMBctnb3CMgIe9AbXpQ3sAAB7v6jFvcTncaPfcecKQUvUmUikZ4b6L1AkXpmNzgMNNYhp3XE7xdHAbTeRXoDuS1NTw2cPhEhRHIVjOBe3sXI8RtTTPlCSR1K8aPmr4JOCjbsSlKM7GLbwGMMX87MKdubY42XOeg3GiF+GaD9fzn49h2SN3UU/9hDY8VLux++/KurVjN5Sf0x+TwlccaLbZBc1ysl4MqWXNxVbZBQjYuPPRMw6Qi7ggOeZZJS5sNl5ZKVelX+IkORcTOexmXASqX4YekNrLwfHGSzR6OuZv0G0ce3ER8ulh8AHZwsJSWF5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(6133799003)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3JUdnZEZlJMQktHZDY1UFI2SnFaOXo4Umc2SDlXQi9WZGRlRkRhdHpFTTVm?=
 =?utf-8?B?OHhHUEJNSWZKZzlGRmw0bW1NWHpPVjIva1NETXRraXVSZk1PcXBUdWcxMWds?=
 =?utf-8?B?bzNaZ3JNRzZxMVFpY1VaMlhYbkcvMlA5WWVma2NOeHZ0YnlROExRblNBM3FP?=
 =?utf-8?B?dHdyWTFoUnlKSnNjUHV2R0kzajFWNExDOEJ6NUoyNzc1V0FaUmx4Nm41dWVN?=
 =?utf-8?B?QmQ4RmpuemhUZzBVZjIxa1YrZFhML1dQQ0VKOVdFTUo5TldFbndSSTY1ZnRu?=
 =?utf-8?B?YzgwTnR3VU5RUmZ2U0J5a09nT3ExNUJ6V3Z4UE5WVkVWRDNUM3BESkNObTBZ?=
 =?utf-8?B?TTZjNWRZUUlOVFV5a2sxalRmNS9xZ1Q4ckcrTi96Nkd5YVRobThaeXlNSGZs?=
 =?utf-8?B?OEVuNmg1a3NWWWN1ZXFmQWNGb29zR041U0JPWFAwanZUaFpUKzQyZndZWWd5?=
 =?utf-8?B?R0F1VnNWVHF5ZzFvSmp5SkhOK2l5cVJDd1BEUVNUREFiSUxqcmhvZnk5LzlW?=
 =?utf-8?B?ekRxK2c5QTJLUUc5TlQxOHBGcTBQUGdDSGVyZWppbU0zRVQrV1puRFNEQWMw?=
 =?utf-8?B?UnVnQlQ4QmR1YzFXYmxiZ25MOXRHVytQVWdtYVhWZXJORGErM3I1QmRxd3Yy?=
 =?utf-8?B?emM5NjE5cXVPR2RpdVArYmhoTmFRcG9Tam9pYURSa0luOGRVTCtrRU9WZmdl?=
 =?utf-8?B?N3k4NDFVOTU3ZE50SW9pR3ZoV0NlaWFQM0ozZmFaUGxIYjB3UE9qd0tVZzdJ?=
 =?utf-8?B?YVVNWnR5cXlIb3hOWnZYYWE0YXM1RUJtYUEydjlTeGtnY2VHOVI0akNlak4x?=
 =?utf-8?B?eTEyeHVuME9VTXpqcW4vczAwMG1qOE5SU3dSQ0MyTHUvQ3l0aXhPZUIvak9u?=
 =?utf-8?B?QW1JUTVuY2YvYVZ0TnQ0RUxVYWphMFlzTU1xc0JuYXVtWTNiUm1FMDJnMTNS?=
 =?utf-8?B?QmRoMWNhZjVpUWhjNFMrbkRRZVVwMmhnTHd1SWEwd1RwTXJUTFg2TUlwRE5B?=
 =?utf-8?B?Zk40bktrbEVvaElaRnBFL2dHakVObFU1RGw4QWpWeVI3eit3cXVVM3owZkNL?=
 =?utf-8?B?T1cwc2VyZ1lvM1VNcjdJT29lRnQ0V0kxUStqdFVuYzJVQkFOcDhDOURUM1JG?=
 =?utf-8?B?RGdOTkVDaUdLS2ovdUhvUG1GU3dPOEp3L2plTmFydDh3YjdwYjN2N1BUQ0pt?=
 =?utf-8?B?amg3L3BpQ1UwYTQrSXRhZlFZQzNEeFhpU2tTK25tVFdNNWpBRDZvUDlqdDVL?=
 =?utf-8?B?cU1PazBKd0c5Z2dCUCtrQ1NuZzRKdE9STUdKczZ4OVl1aU1XMG1ORDJvVWhH?=
 =?utf-8?B?bGl5OHBjRUlWUFQ0Z1BqR3ZGSVhIR3ZhWjJxKzFjcWg4eXIrOGlTcEkxUjVj?=
 =?utf-8?B?NjhWWklUcjB6U1VNa3diTTB1TGlCUmMrRTBiTTNsODREeFd0NGhSVkhSVlo3?=
 =?utf-8?B?NlY3eHpvUU9wSTU0TUVSTnhhcHBWK1lOaEJVamZla3lhTWRaZ0ZVUFNndlVl?=
 =?utf-8?B?bVUrZHRzS0JlY0dkZ1lhc1lTVXR6d1pBTG1VTUJuZ012RVZnU1RFR2NwZjlX?=
 =?utf-8?B?TXMzTmd4K0JxM2MyMS9CZHM3TzRBQk9VMzFlWGRDbFdmNUxOUnV5Ullxb25Z?=
 =?utf-8?B?Tllyd2NTYmQ3YXBLQ0lRVFhWSkpwYWcxcjl4ekFxZlVkd2laWHJjMG1mbld4?=
 =?utf-8?B?MTgxTEdpOWRKcENPcmNRWG9uUTdpaUNITG1uT2JsZ3FjcWFHek5xSm1kSXBl?=
 =?utf-8?B?UWRlaU5UNnpkdUwvNFNOTi9BVWNlWUora0Z5VDJBUHNWa09zTDBsM3BuNVRG?=
 =?utf-8?B?NldnNHAwZ2ZRNm5TdDFUUytzVkFCU212NDJpTzZXVTlHSEFwdGRxNGxKRWVD?=
 =?utf-8?B?U05BV2p3OFpZb1VhZ25YUVZXU1NDSnNVRnZybkl4YXViZUswMld3dzM3dGVy?=
 =?utf-8?B?S2diNktlaW9vd2UwWS91eEJ2b2ZsWDUvd2dYRWxMMlBpNDFwak9nREphL1lP?=
 =?utf-8?B?WFVwcURKZVJienlGRkw5UmpMMnowenJOZUJOMEd2YlRqNERFMlk0MjZoQ3J1?=
 =?utf-8?B?NjR1VjN3NGZadWtwdXhpRTBzdGVHZzR0WWZqanJQTVFXOXVoQ0tXaXhvMWFC?=
 =?utf-8?B?Wm81bTFUY2gxWlRnaFhDbFFmZ3BnNi93WUxXQzFlNHo2NHJNN3krQmlvRVV5?=
 =?utf-8?B?eGJpZU5Qb0tkNlBsVlZxVHh4US9RMG1hdmxwM1RPZmIvME1MZ1NWOFBhMFdP?=
 =?utf-8?B?SWdXcE5qYVR0TWVMUTZsM1VWVmRVM3hqNjJtRlEybUJXUVo3aE10TXJlM1Nl?=
 =?utf-8?B?Si9HZmI2QWQzTlVtQi9FaUdvWVhEakFPUHh3ZnhmR3d1OEJ3dTY0ZWhHSW1v?=
 =?utf-8?Q?E4+0OuC1z3xMvWDA=3D?=
X-Exchange-RoutingPolicyChecked: o0L5pjBhuvrs4N8vNAsVv7ChWdlpSXDF9S3/6p+pGRVb9c0tXeL85f/nyQhqRwj8fQO5Yeiw2Tpa43DPMdIljskA4ux/QnxcJ4Q2Ey/hLNlDf0apeeEdRlJ8ux2v6in9WxWjkOgoyrClXuPY+ZJJuMgUwtD65/JtPE0F0zxVGR8VBrZgaANhF3Df6oMpyt6Cr9sU5DaBZrkoPZvNmwFzATGkl8DnkBvee9QYs6E775q2d3U4g9HExvbofi/ZnDx8F35tF6gi+Y1Q0RiUIatalS8i2XDebhcV2/F+4kitHSz5VI3A70u9kJwrHgE0DAaZwMDIo+hl3YPpFW6JS43Shw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8518619-7bf6-4e53-4996-08def0272fea
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 23:47:03.3172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4NobDe45jVB5AYIQFhFhowhozFcEUP+9kLE9gIDrKIj6mKeZ1GQ7M+3q8uF2C+IXyH1Ydoi3ThHMK03fa2pn8cpcGTr8iXtRVsWHNw8s9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-OriginatorOrg: intel.com

Hi Boris,

On 7/31/26 6:22 PM, Borislav Petkov wrote:
> On Fri, Jul 31, 2026 at 07:59:46AM -0700, Reinette Chatre wrote:
>> The underlying implementations appear to be different between AMD and Intel.
>> On Intel side only the RMIDs (not separate hardware counters) need to be
>> considered.  resctrl supports this RMID limit by placing a limit on how many
>> monitoring groups the user can create.
> 
> Sounds to me like the AMD side should do this too, no, if it doesn't already?

AMD PQoS (whether it supports ABMC or not) also exposes an RMID limit that is used
as the upper limit for the number of monitor groups that can be tracked by the hardware. 

> I mean, it is kinda natural behavior to track counter occupancy and deny the
> allocation of new ones if there are none free...

On AMD the RMID limit is separate from the hardware counters that feed event count
values into the RMID event counts. On AMD the two limits are significantly different.
Babu shared [1] that the hardware of concern exposes 4096 RMID while it supports 32
(exposed to software) hardware counters when ABMC is enabled and 64 (not exposed to
software) RMID when AMBC is disabled.

resctrl could theoretically limit the number of monitor groups based on the number of
RMID that could be accurately counted (with the caveat that resctrl cannot always 
determine this number) but based on the numbers supported by hardware that would severely
limit the number of monitor groups users can create on this hardware.

Users want to create a lot of monitor groups. Each monitor group contains a group of
tasks that need to be monitored together. Creating a monitor group and assigning tasks
to it is expensive since it involves the actual resctrl monitor group file hierarchy
creation followed by interacting with these files to move the tasks into the monitoring
group that internally involves changes to the various task_struct's.

While resctrl could thus limit the number of monitor groups it would push the
burden of monitoring many different task groups up to user space at significant cost.
Instead, resctrl exposes a per-monitor group interface on AMD systems that support
ABMC by enabling user space to more quickly switch which of the supported monitor groups
are counted at a particular time.

> 
>> The Intel/RDT spec does leave room for this to occur but a return of
>> "Unavailable" when reading a monitoring event is not encountered on current
>> Intel hardware.
> 
> Why not? Because nothing's reaching that limit or?

On Intel resctrl only considers the number of RMID. Hardware will return failure if there
is an attempt to read an unsupported RMID that exceeds the limit it exposes, but resctrl
does not do that. On Intel there is not a separate "hardware counter" limit to consider,
only the number of RMID need to be considered and they are always counting.

> 
>> The user can always expect a value when reading a monitoring event (on
>> current hardware).
> 
> How does that work when you exhaust the counters? Or it does switch between
> them quickly so that there's always *something* that counts?

On Intel the RMIDs are always counting. Please keep in mind that these RMID do not
actually return raw counts that are verbatim passed on to user space but instead
the returned value is "upscaled" using a hardware provided scaling factor to obtain the
value that is returned to user space. This is done on AMD (with and without ABMC)
and Intel.

Reinette

[1] https://lore.kernel.org/lkml/78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com/

