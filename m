Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73773239E9B;
	Tue, 11 Aug 2026 03:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418468; cv=fail; b=BSTf+rn9rqWP0dfjq1osXIjDP9ZjY2sAvnfRU8CGKxSGqNjvo2ChduzLcmuXOk1hWq0Q75RCeHW6qZXfM50REAHlqoDF0PYxLPyIxOsO+Jdph5/Xm6RGlr09o5XKUou5ioyu3I0j5whlmjYKvgIl8jxV5JhXGVOYTAqvfcR8rgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418468; c=relaxed/simple;
	bh=DPoAB5sepCidmH1kKgQDC+tJ4HgREZzPf/AdqTkqrpY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NlHYtMSOqvwVC4YC/gkXwiw24mEMiR23oF9zn+l2mRs/ysT22g2jkI8NL+5DNllCRlr+0AMqrSphi3k4udJkzhYZkCNSHQxNmbUqX5PebDMEtxW+K9WyG3x/NJqRHaKKpR640CO143tV3Pt64PvAL02fzfVwnxCL0nENKv0DRaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvGeAJQC; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvGeAJQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786418466; x=1817954466;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DPoAB5sepCidmH1kKgQDC+tJ4HgREZzPf/AdqTkqrpY=;
  b=jvGeAJQCrMWmziQAUcs4ySGH20yrQTX11PADyscqf0UMSQtBXFyBew06
   vJHOVVHFRdRHxsUVp2TMo52WvXAk1ltswmHHhs6MGhCxcFmN9xOcXkERI
   Hl/j0nlRopYQEFykOgxd51zYm6EBRncFqY2puDRkNcIDTv6ZwzwRORzWd
   SnQZCqtcRDvUCapT6/fci8N0HcqAL2R57/flzYAWX/ulHe2JeUGVWcIz3
   I4EeO5XhZkU8sCMS5tPmyPhAj/j4cVSXxJpYKWnOKcnp42V4IHeGO+i7+
   S4y6YSH4jYtkNPph+q7lGz4d7nA2kTaUenevTZ1TKD2DlceDXZ8oCbile
   w==;
X-CSE-ConnectionGUID: AHz2L7vuSv+puxc7frSiWQ==
X-CSE-MsgGUID: uTjxgX/gSSuo63rkEwZ1Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97600183"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="97600183"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:21:05 -0700
X-CSE-ConnectionGUID: 6GswrMuTQRyy/xKsQt6X0A==
X-CSE-MsgGUID: XwKwmRNyQ/mKe2WdGQkwsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="263808500"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:21:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:21:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:21:04 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:21:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9IT6stOj8UipmX+s8Cn+y7PTgLg+7Yddvnyj9PFWuHyJkph36vZ/989aFk0S2zYh/pH7hj1HXXBhH8BL1iU9V19C/uuQ8SdhCY0DU8fSiVMe8w1Hsbx7cUQY1gVisMt4A4px4A8fjRyP41GTBgvD9foBnGUjRFAIY6xfjUK+0SGPsxTJMhQFx/r9fnc6YYBemVNGm9uIWzq+xmqH9Flcx+3Pgs194Zyj9eAHjcx/cOem9f4uXXLIHPJKFtYXJv7YnTtfEsy1lZFPju51s1TPDNqEJgGtNEtLqfwo3duz4c59HIr/DDmkYoJk9iO7fqYu1Dtnqm+W7873qYpH2dPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7tBOap0jlX3mS40CjkoIN9wIJItN3WeqFCo/bmG2to=;
 b=rQVVpuH9LA2BtJihudibpvVzuqpbHDS00yY+J5gEzEhIEiX50J4x30yjeox9sm0rr5TuB53OMS5C1ebHE/zkRw3c1T5Z8tYQrj71YacbD28DwQ208aAEVcxgkDEzsXR7lyYOZUzSqA+QI6JrhUFsynGhLgKZFCIJJgYxrJn2ea4chDNx3YJJgFEHvvykPsblPIe44dLgEJYFqfFKgXjGCQqWMKxAnvEd3zEgJVRf3+eMsrtvTJjnqOxZ2lCYsreFiwJ5DTxcZ02Za92LDtfHcuGney2PNszSK4O34EYBBeNmAN0P1ePDg6Vk5F4TeR3jlhbvS+FUijcty3jYgi2SQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:21:01 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:21:01 +0000
Message-ID: <13834492-22f1-4135-8c57-74052544ed17@intel.com>
Date: Mon, 10 Aug 2026 20:20:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 09/15] fs/resctrl: Introduce
 kmode_cpus/kmode_cpus_list per rdtgroup
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
 <27afa5e408453c93790e5aef61fda31355d96ec9.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <27afa5e408453c93790e5aef61fda31355d96ec9.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:303:6b::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc24cfc-3d57-41b9-81a9-08def75791dc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|7416014|56012099006|11063799006|3023799007|4143699003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: ViFiDQXzuERtp9lkKEQ331PhcrG73F4DtMowiVM5JtLrb0Gk81dlKdInTxe8MrJK2Cm/OxiHUsCFjvzWKYOAnuaJ5UUrsScguuBKkyP9dlAFbhFM4Qm45ydb/mFmHpQVgwHyB6A+lf4KH9u7XtThIb2S10moQu+TFm0knzlpzLE13LAoa1f1NumwPGzSNRetV3QV3e5Igc6upcnWRMvkOiSC/DAisSAWHOXLoEQUGLsTpy8qvZO7s7nC7I+GP3AXYKTA63vF8G8/ts9eheGrgfOJNvvcbrWzIze8gLTWAvIrVNq8bVhbVcYWmDsMnlYMqZq4DL1I5g/zFjAWJXSoSkxBQs1gckwynPNVYi1GMmPzxAqdC9VCwbBfQ+D4bJ1qlKU0XgAYUTkp/HJYrKsW2uemArsYyl5Zhl4UQcm3il6murJgP7nkixZPZdjK9ImZjqTptJAyowPuxdwcUGorpzSAhchXSioJR1PW8RV4XlmHB8eulDfrJFeIkSkcb7EU1sbxsPXmmdalRdyCQuvDGRARG+Xyl2lMGNJIbrfjay6RrldevUCdGu/DRvlIOm+RgGRBva/cwH93WEJ6f+FzkpAXIo3E96b1KaTysVd5yyyKv4jo4D50cTkKqJliTBfqPFQ7QHAnrA/1nbKjTXj9VFDlOoIjHFHDG7uKLapUanY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(7416014)(56012099006)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzUzSmhmNFI1REhTSWhRWFZFdXUwTXNaTDkvM1lFMkFYckwzL3ZCb0k5eUpX?=
 =?utf-8?B?RlFsdmpjSkZLcXc4ZnhVV090N0h5aFhnb0xlN2hSMlJoeUJIZW1Kcy94U2FO?=
 =?utf-8?B?NzBJa3FVWldJeHdheUNaSTJiN0htZlNScjltTlpvN0xtNGQxOTBTQjRKS0Z4?=
 =?utf-8?B?M3dLUEd4VUtLR2lFQjM5aFpwRmZ6TUVmVUs1Qk1FTWhjU3M4aWw4ZVNZSFFj?=
 =?utf-8?B?ajFWY0xuV2w5UGt1UUlEOGx4TlBqYjNCTHRCTmIrVEpKWnlBdzB5bmcxaGtI?=
 =?utf-8?B?YWM5MnA0ZTVKcHNLVW5zZ1RTZVJ1eWpCY0c5SmFZS3pDTnJVUXQxcU1DTlVu?=
 =?utf-8?B?ZkY3VDJTQ0JSWkZVWW13SFlZeE8ycitWMzRKMDRkV0J4NHpnazVvdWxHSWFz?=
 =?utf-8?B?Tm5ZdzRrTXpMWHFzR2dLbno4cUF4cUhqbmNDMytIcklGcTRsNFRCdys1OExu?=
 =?utf-8?B?cTU4STBvSnlTQlhMNit3Smlxd3lWOTRWQURPaWFscTBNWEFnUE5jUk8rdHFs?=
 =?utf-8?B?S1FKemREZDZKeE1mV0lPRGhvUHdBQWptQWZmTUNJbkdiZHZyZUs3ZDhtbjZj?=
 =?utf-8?B?cXdLeHExcHc0TTcwc1NMNDAxeTNsdXprZG54Q2QrbmJFTE9WOEh5d2NGR1ho?=
 =?utf-8?B?dzZ5d3FsdDFrZFFpb0d1UENSenM0ZG9UdmgxNHNqSW0yNFBsOTBrWUJPMGdH?=
 =?utf-8?B?dWF2aVMxMDI3VXdXUGxuRXp5SkRhN0llT0xzTSsvTlBJdkVUamU2YXh3cWZz?=
 =?utf-8?B?UTdHUjhwaXNhRkZQR0tGa3d4VU81THQ2THlmaklGdkJIZjBzRjV6bUJNOUdt?=
 =?utf-8?B?cENBY1dVam1aUi9WUWJIOFhBb0pTUEVpaURKakxxa3NtOUh2SWpHUGJnZWMy?=
 =?utf-8?B?VzBNUVAxMysrZU9aMkpXN1U2bFVETUMrcGJqZ2k0d210WlIxUWVwd2hCblhv?=
 =?utf-8?B?N1Q4K3BYY1lOTGNHbTVjV0hvU2syUWJCdXYzQ0UzdURUejJlOS9EMHRNVTZ2?=
 =?utf-8?B?UU1QanBxUzBIZmtvekFEQ2tIa2tMNDMxZEVoRkd2QUhtNlN0Y0VOUnBFcFVw?=
 =?utf-8?B?bHBOeVI4OEQvY2V0K3d4cHhrTHRjYkRrYi9XbDNlT05mMlhwUkV4V3RSTGJS?=
 =?utf-8?B?SWNnTjBYeVorTlpVTElaM3JSV29rUThrZXZyY2NZNGRobEY5dzloTEtYdGdk?=
 =?utf-8?B?V2FXWjZhbW10dDdlREFaMTBmOWZ5a3JadXkrdG4va1NTSm95UVVneGF6R2Jr?=
 =?utf-8?B?c2tsVTdFanRVM1liUEtmZWxFbW1nYUZMVWVFUExjbWxwV3U4ekVKclk0MXdT?=
 =?utf-8?B?RDd4Y21CZVBnOXd5bCs2TEVwdlhNSnl4cGVxeGNxdDlJend0Z3l6eFNPaW1L?=
 =?utf-8?B?S1d2QlBsSzZuM3I0eTQ3bVZ6SjlLUlgxZVUrYit6R21FZ2JidWpyUUtZRE42?=
 =?utf-8?B?VDVBUXdUcnVQeUZuQ3lsa3NleTNPSTdzTlo3d1RyaEpYVTU2OVJheTM1V3Nt?=
 =?utf-8?B?Y1pja1M5cEsrNEZWNDJEWHpONG1HVzZDYXIzTUhmVXg2Yk8rMlBKT0ZZTElX?=
 =?utf-8?B?THM1V2RObGlROWRQaW5BYzgydTVFYUo4TUxCS2k5bWs2bzU2dU0xSHd3RFpK?=
 =?utf-8?B?K253MjNtRDJ0NWZqbkZadXdQUkFkelppakFZaXBFenZ1UWlEOHBrSXltOEpN?=
 =?utf-8?B?b0dlbjhUcHpFaXp0Zko2MGFJeE51d0tNSmN3NzJJRzdySmI0YWV4NFgzOG5X?=
 =?utf-8?B?WWtYKzhJcEZQRm5SQW14WE9HZGdMdWZrSGxVYWk4cWJsd25PVEI1ZWU5K3RK?=
 =?utf-8?B?TGdVak8vN054dzVNSXU1TDVvYmc5WFN3UTdLSCtkaWR5dkZoeXVmd0hyMHdt?=
 =?utf-8?B?dEdwTkk3OWorOGg2RWxRMnRmeDlKUmw5emtxdnZTekZPd2tqTkN1Y0U0dmcy?=
 =?utf-8?B?WmRHRWIvdUJsTDJWZkp5VzVxSFEzVjA3Z1A3dzRnRlRiRGlnYzczMHpvQnRk?=
 =?utf-8?B?a0FMNDhHMWFQSXA3Nk5HKy9YeVJ1ZzVVaVl5N0JEU3ZBdjZMd3RkUDdEUFdx?=
 =?utf-8?B?WFRCNnplZm8yUmx4ZDRST210dHYwdGxMTUpSWWVMQmRXQit3OWppQXR6QWp2?=
 =?utf-8?B?TmxVOGl2aHFRZGxWUElEMzE5SGxTMTZsMS96NmdBeE5WMkdJNmJKZXZIY05m?=
 =?utf-8?B?RWhBNVFWYUVZdG9UT1QvTXVFKzROSVZNcGNrQ2JyWTlmbUV1cC9aamdYOWZ3?=
 =?utf-8?B?LzhIcjZ3cHhSZkhxTGxmQzRpRi9iY1RVemEyUHpRVm1yL2FWNnJOZFA3d2hu?=
 =?utf-8?B?b3pQOXRXVjRXWnd1Z0VNZW4rcE4rQzEvMDIrWFdqMlBWcS83T2RCcWhKVUc1?=
 =?utf-8?Q?TzXU5sFCMrnRgtJM=3D?=
X-Exchange-RoutingPolicyChecked: frROmCdFlIllv/ijIf0tRMn8C2AlP5SHDxjJN04rV0Bd0plpfSqrDJFOeANtw4jmm5DnBv9O7Ai0hhZ4+J+imHgVh/pnACLANfpaA4dyt64JE2Zii0cjpJyIICFZlXYOtcmGNK0JmAy5jXV1q/1TfqWD+oUWA+Y1HaFaIg9oHXhPDDqnqa7PocWPksZoJsnIFZMOxX0FY9Txq3VQCmJviGOKjyJSIJQ7WQwrDEFcMpIk9//bw0hR8SeYjFKHRVt6UggegIp45QsWASKwfgWsHJgF8/AauP7mlF7PDChq38Xwqem7FK+0QdpV7GmPFyqL60HEfproPN/SOcJeuB3x3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc24cfc-3d57-41b9-81a9-08def75791dc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:21:01.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvFgXWciXnclTBoEbcBEcMFs05D/l1RLS5btxypCf58f81S/+UEc407ddlew0bA7hVGc5ZqOphuUAwoOs1DCWoPnoFffzPcCA65jaGTgOkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Kernel-mode resctrl policies allow kernel work to be associated with a
> specific rdtgroup, optionally restricted to a subset of online CPUs.
> 
> While user space can query the active kernel-mode policy and its associated
> rdtgroup through info/kernel_mode, it currently lacks visibility into the
> CPU scope of that binding.
> 
> Introduce read-only kmode_cpus and kmode_cpus_list files for each rdtgroup.

I think it will be easier to follow if this is deferred to not create these
files in all resource groups by default. Instead, at the time they are
created it should be obvious that they will only be visible in resource group
associated with the active kernel mode.

> These expose rdtgrp->kmode_cpu_mask in both bitmap and range-list formats,
> consistent with the existing cpus and cpus_list interfaces.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---



> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 178126bb2da5..12db6933bc54 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -216,6 +216,8 @@ struct mongroup {
>   * @mon:			mongroup related data
>   * @mode:			mode of resource group
>   * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
> + * @kmode:			true if this group is bound to a kernel-mode policy
> + * @kmode_cpu_mask:		CPU scope for this group's kernel-mode binding

"CPU scope" could be interpreted in various ways here. Could it be more specific to
say something like "CPUs on which kernel mode is active"?

>   * @plr:			pseudo-locked region
>   */
>  struct rdtgroup {
> @@ -229,6 +231,8 @@ struct rdtgroup {
>  	struct mongroup			mon;
>  	enum rdtgrp_mode		mode;
>  	enum resctrl_event_id		mba_mbps_event;
> +	bool				kmode;
> +	struct cpumask			kmode_cpu_mask;
>  	struct pseudo_lock_region	*plr;
>  };
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 346aa4df62a4..0d5c94169d03 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -392,6 +392,37 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +/*
> + * Display per-rdtgroup CPU bindings for kernel-mode enabled groups.
> + * Supports both "kmode_cpus" (bitmap format) and "kmode_cpus_list"
> + * (range list format); the output format is selected accordingly.
> + *
> + * Returns -ENOENT if the group has been deleted, and -ENODEV for
> + * pseudo-locked groups, which cannot host a kernel-mode binding.
> + */
> +static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
> +				    struct seq_file *s, void *v)
> +{
> +	struct rdtgroup *rdtgrp;
> +	int ret = 0;
> +
> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> +
> +	if (rdtgrp) {
> +		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
> +			ret = -ENODEV;

sashiko also pointed something related out but it is not clear to me how the
different group modes are planned to be accommodated. I think it should be possible
to avoid sprinkling these mode checks into user space interactions if it is
made explicit that (a) at the time a group is assigned to a kernel mode that
group is required to be "shareable", and (b) it is not allowed to change
the mode of a group that is assigned to a kernel mode.

Apart from that I do not think a test like this is sufficient to capture the
various scenarios that may occur. For example, while waiting for the lock
the group assigned to the kernel mode could have been re-assigned.
Could a test on rdtgrp->kmode be more robust?


> +		} else {
> +			seq_printf(s, is_cpu_list(of) ? "%*pbl\n" : "%*pb\n",
> +				   cpumask_pr_args(&rdtgrp->kmode_cpu_mask));
> +		}
> +	} else {
> +		ret = -ENOENT;
> +	}
> +	rdtgroup_kn_unlock(of->kn);
> +
> +	return ret;
> +}
> +
>  /*
>   * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
>   *
> @@ -2181,6 +2212,21 @@ static struct rftype res_common_files[] = {
>  		.flags		= RFTYPE_FLAGS_CPUS_LIST,
>  		.fflags		= RFTYPE_BASE,
>  	},
> +	{
> +		.name		= "kmode_cpus",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= rdtgroup_kmode_cpus_show,
> +		.fflags		= RFTYPE_BASE,
> +	},
> +	{
> +		.name		= "kmode_cpus_list",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= rdtgroup_kmode_cpus_show,
> +		.flags		= RFTYPE_FLAGS_CPUS_LIST,
> +		.fflags		= RFTYPE_BASE,
> +	},
>  	{
>  		.name		= "tasks",
>  		.mode		= 0644,


Reinette


