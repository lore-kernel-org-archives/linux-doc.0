Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C8915F3FF;
	Thu,  2 Jan 2025 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735839082; cv=fail; b=hy8Dsqt2I2UW993wjMIcVoJuBZEjYZwnVydNn2nTjP8Y+D8/6F45nB4LF3waLHAOtsHhhjqmQiGxwRxDZpzdAW3gDj1Bg1dxJsP05afpHe86+G6qtLZf98cvk0autPaqaci4YcqHk6cpBD//LjVxwmJgzGb7b96Wf+18Y3C/QmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735839082; c=relaxed/simple;
	bh=BI7001tgvcoqU/aRl1F34MBgmiuRe91qt7dsHj5s0hw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cH5Sp7MD3kMq5RwAOKaWc2idblx3e52owSnPEClCwPO9gXVAFVMGLr9xqzULZQbDJbaXwqP4VO4NnegcQJ84LcHDLV+026Q9eTvbvaWod3YBSRKHUAs6hKg1vop0r4NcD5a8mlQaC43PY8i6sNSTV6uhz0c0Orc/8hglR1f8NxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiAhNu+V; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiAhNu+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735839080; x=1767375080;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BI7001tgvcoqU/aRl1F34MBgmiuRe91qt7dsHj5s0hw=;
  b=MiAhNu+V3ejjZWEYDJvLrqx9ZqN1xZZmwvfl6bi3uGoZp5ka45ZhvTVr
   PL1uTHaFMta2+Bz7EqpbnC7/W3dydGiqogwuMCL3cXl50H2rtiO6Hqt3W
   UVUxSbWpfiNaalfPcRjDFoBVkANgnslqUQLvidF2VM/DU2KXNpuegl+Ea
   r9eWlpeYr1OIN5mUK9c3w+SVQ+ctqmLBzxCfDSJu7L/iSqNQRR75tkhB6
   0qQJfciNrnc13R6MOFZMGhB0KrbUsh3sPwc7ykUides/Q7UZfCfh+Pv6o
   Fg+u2hHhMT6VlR5Xi1vFemMh4PEcxg71AxP5fKu94z0CdJPbNdXyjv8OI
   Q==;
X-CSE-ConnectionGUID: IWKJRRh8TP+5z/AVC3OwEg==
X-CSE-MsgGUID: ki1s1856T5uuQXKtFAY1pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="58547743"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="58547743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 09:23:53 -0800
X-CSE-ConnectionGUID: MwAJO9gcTaqHCJ7i2I+yAQ==
X-CSE-MsgGUID: hqhfQahYT1WnXjbg+cVgzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102058873"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 09:23:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 09:23:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 09:23:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 09:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TU5VpfxHrz4tJCSy6+godsblEGT+FCCz0F9unGRdSd3WL/0UsNlB/KWL4n0wpqDR+b5LtxRXD1REO1Yfu+5RafPKExBELyrEkuCvtYtgVlxA2eNJYdUbf3b2nAnfc/+1t6dJBADhvFIObPZ3TfpxZwl+W5JYW7ebhpxDhOluQYb3ZObrpmk7dI+3feXVC5GmMbYGOkSMTRBkd2EBXpbCZbIO2iJhwXkpzPhIjvqRMr5W8DMAnQUhzqfmCdpNDn2RvR494/QmNG1ZeZZI6hqNSqN/5R2q68GVTUf543vhgDiwbipV5j5qKKvnEQL7Usol+NOwJS8VECwgsOm5464JUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI7001tgvcoqU/aRl1F34MBgmiuRe91qt7dsHj5s0hw=;
 b=aKMKZp5QDWpiIQfEECmbnSb7nHEUyWV5q2CgG5118hSPe2giEHnaa4c7s2D8V/FyLpE3hrlQWzb7yBaAFvO/AwWxGmLEGYG+jUXiP9U14MNSJFIabw+b+NjF428dMOZh0jKAGNLC9x1YrnpG+TrDxTIkVQFoI7gW/X65co17+VykMMK9RZVKDo8jFT9q5x8BaXj+Zcck2LovcsW71rNNY+gc5kyFNH5znxc7Uj3BxPe2zHgu3MZa85QdgHTmpD33PF6684/x2mjG1mio3PT2PdUami5JehB2y6u7NPBKRNdArrTq95U8sMp7n8weFd8MG2ga71qA6eoFfsf8IRiosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 17:23:28 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 17:23:27 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "Yu, Fenghua" <fenghua.yu@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "xiongwei.song@windriver.com"
	<xiongwei.song@windriver.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "daniel.sneddon@linux.intel.com"
	<daniel.sneddon@linux.intel.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"sandipan.das@amd.com" <sandipan.das@amd.com>, "Huang, Kai"
	<kai.huang@intel.com>, "seanjc@google.com" <seanjc@google.com>, "Li, Xin3"
	<xin3.li@intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "peternewman@google.com" <peternewman@google.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Eranian,
 Stephane" <eranian@google.com>, "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
Thread-Topic: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
Thread-Index: AQHbUZVFgsgWIr2vP0e0IsmHTeMxRbLspnHggAeZSoCAD5K+EA==
Date: Thu, 2 Jan 2025 17:23:27 +0000
Message-ID: <SJ1PR11MB6083F03111DBEB3FFD0E8CF3FC142@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1734556832.git.babu.moger@amd.com>
 <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
 <SJ1PR11MB6083741B72BDBD509F9BD2D3FC052@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <dfc63874-9150-41de-959e-cb782257e580@intel.com>
In-Reply-To: <dfc63874-9150-41de-959e-cb782257e580@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA0PR11MB7211:EE_
x-ms-office365-filtering-correlation-id: e3bae7c5-94bb-4338-62d6-08dd2b522bc6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?elRtdGtxRHhwMGJLTTl3RTVPcy9iTjRCN0k1Z0NIdWhJMHZLNGZMVVZPNnAr?=
 =?utf-8?B?aGNMZ3N2OHl2emdueG9RRXB1ZUdubGtDcVp0Z01YSWtrcTFhdzRKSkovQ2p4?=
 =?utf-8?B?VmRHY1JsZjdtb0xkbkxmUVhhZDZyYU5KczdadWhqeHZORHNkaG5tRUlSRVVU?=
 =?utf-8?B?RS9KRlpXMS9TVjNsQVRrMlVYVWo0bFR6UndUWVdFRklxR211YlBJZ2lPdzY5?=
 =?utf-8?B?WXNjelZyaUplSE5HUFk2UXdHQUJKTzI4RzRuaDFwMEF3ZzFoVHdzbC9IYUt4?=
 =?utf-8?B?S3R5cm1NdU5IQUR1MytYVEE2VEJ4SERRcmVtL0Z6TklVdDNjRlQ1clN0bXZC?=
 =?utf-8?B?b1Y4NkxPSlBjdVNnbjJMYzgrdnBXcGhIS2I2dzlQcDRBdUR1WWNVbzdCZzFK?=
 =?utf-8?B?bzIvSWdISXNNeVhPZDFnT0FCQUU1Z0hXOTh3NDlWVUJxUnArWXlJcERmclZp?=
 =?utf-8?B?bWZMUkZ2TytHWDM3LzFkYkVDblUrZkZ1RDQrcDBoOFRUQ3VuUVkyeHlsOXhC?=
 =?utf-8?B?c0diOFFtNnF1c1MybDNUdmNaSE1IMkl1V1F0TXVRL3VISG10dVRVd3JEb2kx?=
 =?utf-8?B?NHNFVFRFL255d0kwWTFNYTcxTUJkU3JoNU5OTm13Y2t2TmVPajBRenB3cU1S?=
 =?utf-8?B?ME5SNzEwaHJBaTlCZjhOUXB0ZEttY3VtUklMaC9hV1k3THNqZVRabHRHa09q?=
 =?utf-8?B?RituUk1LVDNtc1hzbG91TmVHR2FXUGJUOFlFdERFQmh5MkZuZ0YrS1UrQ3hT?=
 =?utf-8?B?d2pSZ092dy96U2RrcDlGZ1VxRllEY0NCZW11K1JnRzVYaHpqcFpUSjZhZE1J?=
 =?utf-8?B?amU2c09YZWppZHdiQnA0bmpVVm91SGpYTGlmWEY2VGRUWDNvenY2YzZFVmR6?=
 =?utf-8?B?ME1BK0dFK1R2ZHZ0blpaTDF4N1kwTmxmZkVhT1FhSk5YQ1FZbXZRRVNtOGg5?=
 =?utf-8?B?QzdUUmVoRHppUVhjRGQwMTV2RnZlcXlNWXlCOHFPUFVYYVFJSHQvUndaNTd0?=
 =?utf-8?B?aUFGSXZ6bVlsZlRKM0Jqb1Yxb0hjNnhsSStweDJDL0kzYW9RQTJLamdxSkxB?=
 =?utf-8?B?Q2o2V0xTZnQ2cEhMbnNQZGI1ZXFFU1piTGxPWW8yOUljc0dFZlNvMWo5WHJm?=
 =?utf-8?B?bWpQRWhGbmhCRXVoMjE2NUVhc3hQbjFZUkdrY0pDZU8rc3dwZldsSmxiY0FQ?=
 =?utf-8?B?WEtDeCtBTmhjZW1OYmc0Nk1OTWVSd2RiY0tvR2lZbkg5QVFGUWxiUnBRa05P?=
 =?utf-8?B?Z2wyaE5MaDNEZHExWFRqNERITEtuVGNKMEhZcGVxeHpiUEFlZU12TTFhMnp4?=
 =?utf-8?B?REVVTTBwYTRVSFUrbzEwWWV6Y0JOZTZqU2lac1U3czZxeHBmSEd0UFZaMXZS?=
 =?utf-8?B?NUtmbHNwN1hRcHhCMWd4dHBpZGs2YzZlcHUrWlZZUmZ1WUs0ZjZIMnk5bEp3?=
 =?utf-8?B?bm5JWnI2Vmh3ZnlIK3dCOEgwWThkRWpGYzlON09oSHovSXhuU3ExbWozWGli?=
 =?utf-8?B?TVBQZVpGcGNZOVUwdm43a24zMGo5TTZpdzh4NjE4eVIwZ3orTlg3UnJzOU5V?=
 =?utf-8?B?bFI5UG5Pa1NGRW90eitWaDhQNktQVmk0QVFZUSt5M1BlQlFHMlZieVRqMmMv?=
 =?utf-8?B?Zi83b1dFZUxSTmVtWVlhRVVXLzJvU2J4UXFBd2RHVHdFYjROeTBvSkxvNnJS?=
 =?utf-8?B?a3ZIbEJUeC82Q0djd1p6T01zcjBNdXBGZk5talRUSlFqSitORjdZTklxSkJN?=
 =?utf-8?B?SXBRanBnUllKd2VHKzd4ZU1EOFJkNmwwVkNGYnFGd2tyTGFVRkpVQzlBNkdP?=
 =?utf-8?B?OXlocS9zejFYV1hvaHVLSjJJZXVadzdKS2dGUTZoU1RiZFpzc1hDQVFyM2xZ?=
 =?utf-8?B?Zk5hMlZLb1F0OWtXWmFOam90NXVuZnFIZ2dOajVIdlFpcEhwTHBJdXFsdmhH?=
 =?utf-8?Q?GTCw7C6twnWPxuuVHIfyjr2CeMJx9SBl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmo1ZU5ZdTZuaTFWbnFzc2NuOHR4L0VkRUFBSnNkODVGNjRSVEhKTHMxQjN0?=
 =?utf-8?B?OXBhVzdjVFRHR3U4eUJZTlEvQ3F4dHJmM214THpMK0VEL0JSNmxVZS81RVQr?=
 =?utf-8?B?bldSVkM1TkNQRmduQmFzVXdKSzYwdlZ6Z3h5NnNjZEZlaEpabWN6MG5BRThB?=
 =?utf-8?B?b25aUElqSkdNK2d5LzEzMFFMTG52YjJ0N0lSZUNXK3EwSTFUMk0zUWhVcE00?=
 =?utf-8?B?U084eEFYbHpGMEIxZ21YUWlFR3ZvcW9xOVo5aXNmTlg0QllOV21IVnR4ZWla?=
 =?utf-8?B?MkM2NXJMY2pIYThBS0Y3Zzk3Y24yUmk4dW1TQWdxU1JwengxYWl4akNSUDg0?=
 =?utf-8?B?L3ZrYkUyN0YyL1BkWVozWlZEdkxsQ2g5VzRRc3Q4SkZxclJFNTNGTFdGMHZh?=
 =?utf-8?B?S2dld05QL25sdHpONzczRVhpcE9mcGVMT1pYUExsS25NYllCZE9NL2I3ZzI0?=
 =?utf-8?B?RlJLT0dhTS9POEU5cm5HNWNsbVBkMFc2YVNuNCtTMERYSVR2cjdKcm11M09K?=
 =?utf-8?B?SzgwbEh2ZDI0ZXJtclBGK0IycTBKQVNPalhZQm5yay9JZXZjQzVOdkk3U0Qv?=
 =?utf-8?B?eW5NMmRrTTh3REw3RXlXdDNBRVgzS21DOUtUOFMvcWsyL2cyT25GZzc4ZDVx?=
 =?utf-8?B?ZlcxVUVGelBEWXh4bWtRd2liRGFaSDhlSlZHck9iL2ZtbmdZazF1eXRNY0xX?=
 =?utf-8?B?bExrM1RON05LRWRNUHd1R0pzR1I0d3JnU084aHJPQ3krNFZHS1ZBVk83YmVp?=
 =?utf-8?B?VkdCT3N5MGQrZXpDUEZjamluaEFiVGdKMEkxUlgxSnNaR0JMYSswQ05zcTNO?=
 =?utf-8?B?M2VrQUE0Y1IzWEFRbVJPR09neG1rTDdEakZFVFQveVUySWM5TmJ0d3lLR1hR?=
 =?utf-8?B?RDdhWElmNHd0UjdrQzN2VTUyUzkvTlByU3NpS0RNSllhTWxxUnRtZnhMQVY0?=
 =?utf-8?B?UXYzVk1EbjVkR1BNbUpScEs4dXRDcEZUWWJ3c2IzSnhNQzd5Z3RuQnZPYkFz?=
 =?utf-8?B?b1dZUm9kVmUvUTZtN0NkY1N2SHZ0Wkp5SEZKNzhWeE9pdVVlcm5DN05ianA0?=
 =?utf-8?B?dW1TdTNjdkpBNHdiVkNUQXhYaVVsMFpHWnVPRVNFSnZnWDI3WFBGWnlrS1Z2?=
 =?utf-8?B?Q2ZQOEgreFpHM2pJenplUEV1SzZkeUI1WUxkR1RCNHViVWtKdDIxSDg1VXpt?=
 =?utf-8?B?cDRWMWpJRUFNME5peXBoUFZzTmR4MWsramdnNTNHbW9ES1VjbHJZTnp0bzli?=
 =?utf-8?B?WWpKVUlFVUNLVnVHa3hVUnZYemRjT3RKM2hBNzZ6YXIxVHRYa29jcnhzL1kx?=
 =?utf-8?B?Qm10c0FwcmtKUEFKdnBmdG5YaG9Ea2o1Ni9obkVtV2tHdk5LeG5ndEVoRXpF?=
 =?utf-8?B?ZlVud0FCUGhLU0kxMEdQcUhVRHFLWlpXYzJIa1FhVTJWMXBWdllwZk9kSVg3?=
 =?utf-8?B?ZXFWaEprT1NaL2g5OW1KUlNpNE9JU21WZkI4a0UwVkx3ajVFVVQvdGlpNGhy?=
 =?utf-8?B?dzNJaVZKTkI3ZE9LK2h1TkhVQkR4N0NORGdrMTlKY3IyaE9uM2pLMzlNV2l3?=
 =?utf-8?B?ZWJZSTNzSGc0TXYrTExiNlVaSkdrUW45VDhXcTFKQkZIM1podEVUNEFhZ0tU?=
 =?utf-8?B?Qkwyd0IvMjFmK1dGMXFrQk5kb1JvVEVCK25hM2lieXo3MGpBMnFlenVWODhO?=
 =?utf-8?B?V2R4YnhhSDE1aDEvK2FKYkR2YVhaQzBOMi9wcmR1TmNURDZBVkhMeXVTUkhU?=
 =?utf-8?B?dFZkVUtXdmVvN21DL2JqaGxxSVFWREtrZEtnVGJxcVB6amJNQkRhV0diVnd6?=
 =?utf-8?B?TWxKblQwem9OSGZFSXFEUmtzc1BkMzg3S2gxa2wvVStiMTl1a3d5N05VYUFN?=
 =?utf-8?B?eXZxek9WbzFkM2pJbi9Cby92Zk5BL0NWZmdJamxXWUFObUtnL1EzeG55MnFL?=
 =?utf-8?B?VUh1amphWWVFVmpSRytTdFIwbGtBMkNOVUpnRm5veFZ4WE9rYnFtTkJFdy9N?=
 =?utf-8?B?dUJQbWpsaDR6d2VWM3dQUkJ3SVRqbEJPMWtrcTltd0cxVWd3ZjE5akJiUGI3?=
 =?utf-8?B?WGpranNnZ0wzZ2FDdXEvMk5LTzVleEt1UU45MWV6YUE3L1Byd1RIcHlLMGk1?=
 =?utf-8?Q?1TWPK4EFR8pdLUTr+umoYXWKc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bae7c5-94bb-4338-62d6-08dd2b522bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 17:23:27.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6uD0iZrQQOXXpiskYokR1H0V3xi2Y9OT2gEjgb57gdsz3vWW7MecjUAgBN5B39zcAlYULwrzWu/O1iZezD5Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com

PiA+PiBzdGF0aWMgdm9pZCByZHRfZ2V0X3NkY2lhZV9hbGxvY19jZmcoc3RydWN0IHJkdF9yZXNv
dXJjZSAqcikNCj4gPj4gIHsNCj4gPj4gICAgICAgci0+Y2FjaGUuaW9fYWxsb2NfY2FwYWJsZSA9
IHRydWU7DQo+ID4+ICsgICAgIHJlc2N0cmxfZmlsZV9mZmxhZ3NfaW5pdCgiaW9fYWxsb2MiLA0K
PiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkZUWVBFX0NUUkxfSU5GTyB8IFJG
VFlQRV9SRVNfQ0FDSEUpOw0KPiA+PiAgfQ0KPiA+DQo+ID4gSSB0aGluayB0aG9zZSBmZmxhZ3Mg
d2lsbCBtYWtlIHRoaXMgZmlsZSBhcHBlYXIgaW4gYWxsIGluZm8gY2FjaGUgZGlyZWN0b3JpZXMN
Cj4gPiAoTDIgYW5kIEwzKS4NCj4gPg0KPiA+IFByZXN1bWFibHkgeW91IG9ubHkgd2FudCB0aGlz
IGZpbGUgKGFuZCAiaW9fYWxsb2NfY2JtIiBhZGRlZCBieSBuZXh0DQo+ID4gcGF0Y2gpIGluIHRo
ZSBMMyBkaXJlY3RvcnkuDQo+DQo+IENvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlIHdoeSB0aGlz
IGZpbGUgc2hvdWxkIG9ubHkgYmUgaW4gTDMgZGlyZWN0b3J5PyBJIGRvIG5vdCBzZWUNCj4gdGhl
IHByb2JsZW0gd2l0aCBoYXZpbmcgaXQgaW4gTDIuICJpb19hbGxvYyIgY29tbXVuaWNhdGVzIHRv
IHVzZXIgc3BhY2UgaWYgdGhpcyBJL08gYWxsb2MNCj4gZmVhdHVyZSBpcyBzdXBwb3J0ZWQgYW5k
IGRvZXMgc28gd2l0aCBpdHMgY29udGVudCBhcyBvcHBvc2VkIHRvIGl0cyBleGlzdGVuY2UuIEZv
ciBMMg0KPiBpdCB3aWxsIGluZGljYXRlIHRoYXQgdGhlIGZlYXR1cmUgaXMgbm90IHN1cHBvcnRl
ZC4NCg0KR29vZCBwb2ludC4gSSB3aXRoZHJhdyBteSBjb21tZW50Lg0KDQotVG9ueQ0K
