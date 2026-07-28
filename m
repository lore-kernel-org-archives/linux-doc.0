Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8FB3BFE3B;
	Tue, 28 Jul 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268742; cv=fail; b=Q/TnirE6jmF1L/TScy6Ecy3m8DQNMvtoEFOmwRo95PvD9aozONZ23qAVDUQvd3L5u/wYQclEZcdiipSRDuLIv5DyDcab+NNyJddiEeuKRn+PPto/jz31/K1fGG2zffZP4TAAGMe3wsREby+nWSs2MQqYbYL7IU2wvHmGqfBHJOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268742; c=relaxed/simple;
	bh=wCtdN2cwtk00YDNgLBufnyUgb4sVylxEgDtvTw+gKdc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KZslUZii0kUKxDsdHjRR7hMLFkRA5uUcadNAK+NAZuMciS/sYVBY0haLVNhFeHSFuVRDQPqObWsrSx6f1xTvLCLdJdYFwRCmHGVol4c7akuCMn+JxivTluzQAUwWMhZN0BPoumZMkFPJzv7biEgzmVPrez5zVkNoa5guuB7waX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFh77Jug; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFh77Jug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785268740; x=1816804740;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wCtdN2cwtk00YDNgLBufnyUgb4sVylxEgDtvTw+gKdc=;
  b=XFh77Jugqz0730INHaXWVZmX9halT1Tw8ySefVr38Mzb7SdTfSuQEst0
   hOwosjlzHTsRbQFLFlTiba7NT6t9wIxuBHnOT9x0nF5LhWRGlvnrwE+x0
   8WDkDwOSfhX/PJO/ullJ/6d8pgzGndLWJzhHPvwm6Bx2TW6spzh3YqiIh
   xHZakoAPUCRfXvR0+CXotomgXhGjusgjlx+3uY/EhGTlZ0Jd8WrtIcHi6
   454OrwfB3A/wzEEtNsYl6brRr1lxxB7pynFf+MgEG0nuoQ0s1EQavetsN
   egEa4aOSDJymF0kPKqxTociklR9QMyviMvCHn/vX6wffJ/ZOfCFB/582c
   A==;
X-CSE-ConnectionGUID: vTWi3jJlTGWBzaASXMaq0g==
X-CSE-MsgGUID: aUt1/XoaRLakjtzAkFBa4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96454540"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="96454540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 12:58:59 -0700
X-CSE-ConnectionGUID: W+dDq+awRAu3LEeZ7HwWRQ==
X-CSE-MsgGUID: hkuTReH5TFKZG0JJtzMnRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="264816482"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 12:58:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:58:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 12:58:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Df0/D7iJYF4BZaR/9OCJotOroEdgvZlxKbLXHvCO1cDgbVqcwuChT24FkBIlVZRrI+YtuKBQmtr8OcvYVz+8S4HZVCjfvUiI47nfZ64/GX06fdVATAhXx4t7M+wWjs+3yvicBMykLVDteMVLe2pTAJiRPD4so0SrccyXqbAJPi1OtK6As8qkUk7xozPLNhY9Q0wNYJfjdW86VdA/ciJrByIpv9H/KBVQJvO0o12kkA7S/KvGJd6ruknh+U5GCh9xEOtZacCXjT5fvjJIPTlDXaJsdpJ8hhWALpQP9+kRVpYKPhf4BtDyCZDBweKvvqfInCs+sBxHV4ArS7EoHpE8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCtdN2cwtk00YDNgLBufnyUgb4sVylxEgDtvTw+gKdc=;
 b=BquU0s/+fN6S5w3pJmCCD4+mOB2WQNHV0/Ze2RJrfUNqdmjHckc912YBfygjm8Tj6xNxVhasMbPnZoxPkk1Qf8yIDPBTGFKAOtX5pzv7IAflJorncFnv1I26WA+r1YIm1GaI42NYI/8FDfsEkD6mjMRngtz3bWkV+8N3LD2uI+VmVq99gOLOhj8lTbYy61nX26uTAQsF5yYxqIaqjmczLJ6ic7VzhUhzD7E6a4WpgEq6GURlBNXonUVDQe5s5Q+u0hvGr9I2hybsHH24gq2U4UDMUR3yZ4IqOVyqCBeVvXOU+83asqWztcNy35WUwYKRW98NNOM87c14n8Zs0Km9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by LVUPR11MB9859.namprd11.prod.outlook.com (2603:10b6:408:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 19:58:56 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 19:58:55 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
CC: "Chatre, Reinette" <reinette.chatre@intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Topic: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Index: AQHdFjFEDhWCop0Bz0ujShNoXAdDZraDX04AgAAH5gCAAAC/oA==
Date: Tue, 28 Jul 2026 19:58:55 +0000
Message-ID: <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
In-Reply-To: <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|LVUPR11MB9859:EE_
x-ms-office365-filtering-correlation-id: b073a262-c9ab-4178-fd5f-08deece2a7c8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: TaaTyjnDhH3B6RW2FWVuDdPYQqUHrSP5kEWG+tSlrcxo03L0f1wWk5HErP7l6D6I4mkReDUGyOOXsvUsYNrZav/cpLFsMudvurgNdjERKwqyHzOptwlZ0jhEBgPc5ynC2oCQWr+XpU7K8+PxbIavMddfsXDn8UZFIlHDABpdSvw9N7dryLnyrD2YYWeP4cpsGUM2T6v/IXL0r1K2JM4jc48kMnyuqCFlJEQhTbNIOYN6+9fvo8vAs7GDjG+Hbd6lpBqEC4MrisWOlwNz4V3wIRTD3N9zkt7UxAs+K3hiadLo/bgjQduwZNKiCXUjAUZcZNiCVhYDBun9f7+Nxkjw3NY+5xmhlWLJyTiuZ+tQy4zsA2LURsXQvLxpsa/iiK8estOxZXRZWgqyotivvl+z0iK2x6ALQSKeI2vyC6SLF4SC4QVbrqwpOWrcL86yNV/PxaH1APeRH5gLmx/dSxnFbMb8m47S2RORbNs5JSLFRS47biGLToCqC8byJC/z1xAVE48KsUO0eCnyEY6+lv3GfgQdCRL0VBAGwuuSyYLigzqo99Hv0pFU9A/hEjt90/SVi7imIPftu6g+I4L20+xzH0TzXZ/CjixXVjjSoUa0Oc6Qo5ntrQmjeudM3YV8DsBgzq4Ic81q9xI20TGHxYuCdgMI7iqqh5YGh4DRw+NL+3+1PH4BE7B3jWixqpFCSkNGFMCVMBXLsBjCLNRLoN2Nvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODZlem0vWjBodjYvcWdUT2NjNkpFS1NSTms1c0tHcmJ2ZSs4Yko0WTR3OFNM?=
 =?utf-8?B?Sm9DTlJsNFV5R3ZzTDEyeWdKc3lHcXlYVllsQ1VuSzVSUFBvTWc3dXc0UTlx?=
 =?utf-8?B?dE12SENXWmxydlNZWnpUeitkZkJrZWw0RllkMWY1YWlsZzZ1dHRWTTNwOC9v?=
 =?utf-8?B?ME5TWmhvajBhRlRGV1ZBdVdWV3BtYXZCcEpsOVVtc0xFZVl0bEEwZ3pOeHcr?=
 =?utf-8?B?eGtNTEtPYTBFa2lRbFJUV1Q4MytwT0lrMUcxVGRvWE1KQk55S281aEV1NldC?=
 =?utf-8?B?QjlVekhpNzlNaEs0Z1BHK2wreXFVdGZaYWlxVTdiWEJZckhFemxPeWp6c0pI?=
 =?utf-8?B?V3ZFUWxrYlhNQW1VblkySTA3VjNZcFlzL2QwZTlJaFZHcm1hckZUa1pXTmFV?=
 =?utf-8?B?ZVhsZXY0czg0bGpTSEJYRmZqQ0VYc0lvQ2Uwc3lkTG1Xb3F6d1dGZXpqbU1M?=
 =?utf-8?B?NGp4UC9LRkZTNHd6aFRWd0dLNm1LZ0VJeGxDdFEzQTlwRTBRMDA2RWVjRWlz?=
 =?utf-8?B?Wnc0TmkvaFNFNXkzNWc2OElYOXk4dGFtb0gzWUgxOTB1OUhsdkpHTHVHazJr?=
 =?utf-8?B?MnJZRWtWYkxsUkx6NE1oMjc3c1lSRHdnRWNWbGZOQ1pwNWNDTkFMdjJEemFx?=
 =?utf-8?B?VDlPN1lobHFSZ3cvZ1FaMERRWFBybkZ5VGFpcnJDVThmR2tPK05iV2FGS3pT?=
 =?utf-8?B?NDBFUk5pYjExdzRiM053V1dyYXFuMXRQeDIyWjhpUkFPSU5pQTFxOSs4ZUdx?=
 =?utf-8?B?ZHg0NWdCMDk5U2dVUHhGRmMra09iWFNGd1dnbUpjakVhR2g2WGFMTXE0enQx?=
 =?utf-8?B?Q290MEtRS2pWVUxKbjgyMk1PSUFOdlZTUUlkb295dHVnUGZCdEEyQ2JNUlM0?=
 =?utf-8?B?cFRJOHFtczJHd0xiamtVZHAvNDRRV0h1UFY1WGpmVHRQQ0h3RU5VcjE1UXp1?=
 =?utf-8?B?UkFQU1ZoSmpsc08xU040K3NNTVBOeS9vL2FqSm1ZT09ac1gyOFIvWmRENmtU?=
 =?utf-8?B?cDNDMmJiT2k3K0dZbFM2SGVsZ0Q1bDQrNGVHMVVCWVFtWUZOeHhUUHRkdTJ2?=
 =?utf-8?B?ekdUMmxjSzA1bXdVTUNtYlVkQU9RRFNtTHdHZWdBTnQ5YjlOalNNOFR5Yit2?=
 =?utf-8?B?OVhHY1dRRTcydkJVVXdJOVhDaVY5OHNJRk9zU2t2TzI2YS9wbjI5WXpYOWlp?=
 =?utf-8?B?bkt3dzl0aGJ4TmY0VlpJT29hOHV6S05sQUNieXJoM0ZhYi82OFBFSGk0YmZx?=
 =?utf-8?B?N3FZbU1GUDJZZHpHWEN4NUFsb2dhc0Roam9kN3JMZkZMNXJiU21QVWIvK254?=
 =?utf-8?B?a0hKQkFjV3dzcURqdVg2MUJGYnNjL2NvTFZHazlSeXoybFlBNVBMQ2JmYzY4?=
 =?utf-8?B?a0lUTDZEU3JxKzRPMWRjL25zOC9ya0RhdStobzdWZlFVeEFzYVNYVWo3U0Vq?=
 =?utf-8?B?TmwrZFl4bmlkR3JjY3BDQWZIWmZ6YmFneGJLMUFIb0F4dUlFWlp4MGxsN25h?=
 =?utf-8?B?a09MaFgvcXFOSHZhTk9UYktqMHoyTDZXUkhhU08xK1FPK3J5UmQxa2cvVXBx?=
 =?utf-8?B?SEozTGJtTXhkZ1U3Qm5oUXQ4MWRNenI3ZE1YSDN4ajdlUnFKaDBkTHFzM0oy?=
 =?utf-8?B?VTl0emhNZzcwbGUvQUlsTDJKaXc5SndoVjlhYXlOY1hsbkhteEJuc0xESWRG?=
 =?utf-8?B?WjBOMitjTnFyUmdubkJMaHBWZ2loR3dVcFBPVG04T3hXVnJaWWJ3SG9IeitD?=
 =?utf-8?B?bVhnWFZ3dXdVMVVOYWtVSnJUVnVVa3JKTWorUTh4bjkzRHVUMVVRa1M3MGd3?=
 =?utf-8?B?STNqclNyM3JLZHBRektHN3JwbERCa3BzbnRTY2t1aVNJMTgxdzYxdEVxWTBm?=
 =?utf-8?B?d3BaYUcveWNiWkVIL08rOUoyeHM4aENyVnhpOGIrTUx5c21QZzljU0ptTUd5?=
 =?utf-8?B?cDVtbCtpVjgwRkdwZ2ZnYldTT0JyZU41Y2tHNHEySEl3cTlwSStudHZVQlIw?=
 =?utf-8?B?T2dpb3ZxMlRRVTVjUmNnYTg1UXB6NlJRR2VpZTdTTytkd1NxQnovUmZoMytx?=
 =?utf-8?B?ZU5EL2xPOENLeW8vOGx6NEN5S1RteVF0L1VZWFY2VnZYUDRBUzRtRHcweldW?=
 =?utf-8?B?cU8vY0JkQndMTHZKY2FtZXpmcm5SekNRSWtycVB1Rk4xL1VYSW9BYjRMTVk4?=
 =?utf-8?B?T2kxVEgrb3QxQTJHM0lQbmRtRllVODZQMnd0THpoNUNmc2Z0dXZQNkEwamdr?=
 =?utf-8?B?RHJYbmFUaG9zSmJ5aWF2ZDJHUkZnYkExcEVpUW1VZUwyakRtMW9nSDhtdTJF?=
 =?utf-8?Q?MBdRge+/T+XLVfsOyT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mW9G8j5yAwVy0+Nmwlw5P0TU9nuXopzmC3yg1TiUDpxGOZQbwooQ6X+KwR+wx/12j8z3VPnLNM8wLBNaM5/YbVDfUoHzH3qVFeXdUhz345XK+gWFMR0HAtNn6e/npc5JeG0EfuMkYm4NxYwyikjIjU0+SkOzFPUW1C4GP2dVHdzFb3hLhWaqi23AIT2/xlAvZnUdmSPzRa1sj/zqH4Q5Lf+bpTEnrqirdWZmw5O0FU9PsG4wlUW6MlwlTYZo7A8IL2DCPD2l3cSaM+kJRRLq/cLCOMomgG75FEPLc7o0fJZApq/qnR5ZrGB+MoFpUJpGZDN6KylGIO1CzMv8qwnK8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b073a262-c9ab-4178-fd5f-08deece2a7c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 19:58:55.4528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SiWkgp2AV1RmioyuUuuEliatNOElVREArXAQY4SwrcS0hBlaK6XjUVFqZYH8jYBWEUSD60omTBGUixmlQ+uyKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9859
X-OriginatorOrg: intel.com

PiBBQk1DIG1vZGUgKGFsc28gcmVmZXJyZWQgdG8gYXMgbWJtX2V2ZW50IG1vZGUpIHJlbGllcyBv
biBBQk1DIGNvdW50ZXJzLA0KPiBhbmQgdGhpcyBzeXN0ZW0gcHJvdmlkZXMgb25seSAzMiBzdWNo
IGNvdW50ZXJzLg0KPg0KPiBCeSBjb21wYXJpc29uLCB0aGUgZGVmYXVsdCBtb2RlIHVzZXMgUk1J
RHMsIHdpdGggdXAgdG8gNDA5NiBSTUlEcw0KPiBhdmFpbGFibGUuIEhvd2V2ZXIsIGV2ZW4gdGhv
dWdoIHRoZSBSTUlEIHNwYWNlIGlzIG11Y2ggbGFyZ2VyLCB0aGUNCj4gaGFyZHdhcmUgY2FuIHRy
YWNrIG9ubHkgNjQgUk1JRHMgY29uY3VycmVudGx5LiBBcyBhIHJlc3VsdCwgaWYgcHFvcw0KPiBh
dHRlbXB0cyB0byBtb25pdG9yIG1vcmUgdGhhbiA2NCBncm91cHMsIHRoZSByZXBvcnRlZCBiYW5k
d2lkdGgNCj4gbWVhc3VyZW1lbnRzIG1heSBiZWNvbWUgaW5hY2N1cmF0ZS4NCj4NCj4gVGhhdCBz
YWlkLCBJIGhhdmUgbm90IGJlZW4gYWJsZSB0byByZXByb2R1Y2UgYW55IGJhbmR3aWR0aCBpbmFj
Y3VyYWNpZXMNCj4gb24gdGhlIHN5c3RlbXMgSSB0ZXN0ZWQuIE15IHBvaW50IGlzIHRoYXQgdGhp
cyBtYXkgbm90IGJlIGEgc2lnbmlmaWNhbnQNCj4gaXNzdWUgZm9yIHRoZSB2YXN0IG1ham9yaXR5
IG9mIHVzZXJzDQoNCkhvdyBkaWQgeW91IHRyeSB0byByZXByb2R1Y2U/IEl0IHNlZW1zIHRoYXQg
aXQgc2hvdWxkIGJlIHRyaXZpYWwgdG8gY3JlYXRlDQptb3JlIHRoYW4gNjQgbW9uaXRvciBncm91
cHMgd2l0aCBhY3RpdmUgdGFza3MgYXNzaWduZWQgdG8gZWFjaCBncm91cC4NClRoYXQgb3VnaHQg
dG8gc2hvdyB0aGUgaXNzdWUgcXVpY2tseS4NCg0KV2hhdCBkb2VzIGhhcHBlbiB3aGVuIEknbSBy
ZWFkaW5nIHRoZSBtZW1vcnkgYmFuZHdpZHRoIGZyb20gYQ0KbW9uaXRvciBncm91cCBhbmQgdGhl
IHVuZGVybHlpbmcgY291bnRlciBmb3IgdGhhdCBSTUlEIGlzIHN0b2xlbiBmb3INCnVzZSBieSBh
bm90aGVyIGdyb3VwLCBhbmQgdGhlbiBsYXRlciB0aGlzIGdyb3VwIHN0ZWFscyBhIGNvdW50ZXIg
ZnJvbQ0Kc29tZW9uZSBlbHNlPw0KDQpJJ20gZXhwZWN0aW5nICJVbmF2YWlsYWJsZSIgd2hpbGUg
dGhlcmUgaXMgbm8gY291bnRlci4gQnV0IEknbSBub3Qgc3VyZQ0Kd2hhdCBoYXBwZW5zIHdoZW4g
YSBjb3VudGVyIGlzIHJlYWNxdWlyZWQuDQoNCjEpIERvZXMgaXQgc3RhcnQgb3ZlciBmcm9tIHpl
cm8/DQoJU2VlbXMgYSBzYW5lIG9wdGlvbi4NCjIpIE9yIGRvZXMgdGhlIG1vbml0b3IgZ3JvdXAg
c2VlIHdoYXRldmVyIHRoZSBjb3VudGVyIHdhcyBhdA0Kd2hlbiBiZWluZyB1c2VkIGJ5IHNvbWUg
b3RoZXIgZ3JvdXA/DQoJU2VlbXMgbGVzcyBzYW5lLg0KDQotVG9ueQ0K
