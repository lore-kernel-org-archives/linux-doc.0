Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A89390205;
	Tue,  4 Aug 2026 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785884764; cv=fail; b=so62PsJVPuG7Is8CLoM/HTU5sWqKHIO70C+ltStLV/1di1sRDgX0G/MFm3g/bRpD7lssLkdIu3pTHqFXch/dz3w4ZNp02SVOL6TkzRDGjfOMgUY41EvJrWhOjQpH5d3OQo3oPs6N8JNMHzXhjSQ1t+hXbeJdd5BChPpM2iIMnGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785884764; c=relaxed/simple;
	bh=WKbL8DVoFAoff/ccETyeLlVZ7t8XnfayTUoJXDI2exE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cq64WWuQBAnsKxSxUvTWLOpGPu/nrVJ3DZrs9ob0GOs3//+6OZ9Rv24/vUM3axo73dsDsTyiXQ/Yq/1+PG32aLkYJ+kqC7kZ5TyVaz/2+Jr8Y9MN+J51JDJukdBijLKcpnfkl52UQs5DL4+7r4+3BKE+6JKwT9mIcWRymyB//R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj5z6la9; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj5z6la9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785884762; x=1817420762;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WKbL8DVoFAoff/ccETyeLlVZ7t8XnfayTUoJXDI2exE=;
  b=Mj5z6la9GZ4WOT7pyqij1vBc2lOz+5EfqF+7cqoZ3gMpBwnTU6yIjqWA
   VZ+fgzHRN4kXTSSG2JeSNvZfItoB9QjFSKpR/GpTVkDUx1g9Ojybrf6ov
   ce8ZpAGkyigzu2k/ewxgMd6NKIs/xkqURyYiozuMoWmvuKytkS2d8NMMg
   BOp1boDyq87Qx4IR1+B0SJwXGMn5J7s0zNfin+3cnW7Y55uAMVZgYXKB0
   ayK8SMoaVAdueln3l5amDaH9qAXPm3Bc8mTBkbbsxf9vjUif1k7ybdfWH
   YGKECPFxAk6NCHzI0Ggo1rcKaXZFdEiB11W/Pi+4mzjnUJXNevtgDP7GC
   g==;
X-CSE-ConnectionGUID: HSoGzcanQeSC5PdvWIbWjA==
X-CSE-MsgGUID: vFnf42h7Qi2OCxIkwxn+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85427847"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="85427847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:06:01 -0700
X-CSE-ConnectionGUID: ED+YDKW8RdyZeC7gvUQUTg==
X-CSE-MsgGUID: 4sfjU7qJSTWoqrrf983Ydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="258291918"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:06:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 16:06:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 16:06:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 16:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+P6xnGFJg0tqR5VurbRiSs/5cYEJxGnmHS3Z32/S/XxfnleFiMdyRF5WoWkKdGcmkObXVRQGkQ6F2l2HBisYSqAJUVSXSyyKG4jS4ukiqMthwtrutpHJUt/CnAoJf01ih2qC9COhOzacMH9eLHNQDV7YU4FmYvc4JNas2nqD+CGZPr87Z/6Zbv28rdFn2Kyn2ilFZaWO8e1PfRk/dhp61l+Au4s0SFAvaEpHMcsRtggHRbgIf02rRmA71QYAm5mZRLcpnok6h+RfqmmmPZEV+LQe7xL2mVCUG0xddFVYFAAZqGeoAQuctAkXZhtd1x6mEZtYWgm5WmMFqukRCvyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKbL8DVoFAoff/ccETyeLlVZ7t8XnfayTUoJXDI2exE=;
 b=v72GMjeirvqdEq57D4OQfPy0afDZ52tBF6aqJpwCdOwgwnilTB5aFATtLNdXJg8+kqpwHp47ThmK8/onFcU4s3K8djeMUhGQk0je45Z97UnY/m0oZkugwJ0/HnnFPlhn+1I6wElGUNvZqZtp79agr03DrE+DjlFOssADlEvbBAcufkGqrGt/Gsqee2K3CRfRgahXmVwgeLfXPiZsFpenfWs07jcu5YgUv+2JAtAm8UarYreDA2KvpFjbEjWx775xvn9287RNoxCwMrhYdWcxY2XuFvqpV1KiMT9lKBje+kjNqRQoeBC/9SxAzxaFDU2LhMRg1unzkr1VDnUNs+7/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 23:05:48 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 23:05:48 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>, "Chatre, Reinette"
	<reinette.chatre@intel.com>
CC: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	"x86@kernel.org" <x86@kernel.org>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Eranian, Stephane"
	<eranian@google.com>, "peternewman@google.com" <peternewman@google.com>
Subject: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Topic: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Index: AQHdHtxAj4YGLGgJr0yKZVW5LIjWgLaDgPwAgALovgCAAA7gAIAAARAAgAABkYCAAA3vcIAAQdcAgADxugCAAK35gIABd6uAgARrUACAADCpAIAACkWAgAAD/8A=
Date: Tue, 4 Aug 2026 23:05:48 +0000
Message-ID: <SJ1PR11MB6083C1B9D29DF6184B50597BFCD42@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
In-Reply-To: <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH7PR11MB6834:EE_
x-ms-office365-filtering-correlation-id: d970b1c8-91e8-45d3-e09a-08def27cec37
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|22082099003|18002099003|38070700021|3023799007|56012099006|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info: p14Mq78ABaBJNcwxNtt7gFizKJgNAZRvMIv/pdBocnt8jxCBTN5gs04e7NnMV+LJty5OHwCHXICEiZ6I/RRs9Q57CgmpKQrznGf1oI/O8LMC5TQAvIp37pw9SooOispBjcfFA+PH7q0oTT8pfcfKO51R3+PFBCAzVlqgi0GA66DV8uAuxCeMUw7mNGBbMRJLp5cklYF2TRGltmAgDBmysFmI0Jy4UjkmAK8gcS5OWwRZms9iFjGhFNjiM8D2k6XOgCgXlUBhIzNlBH/29BZuHBdk4qXfU7RCsLHimZicLtDv/+vLwon6xqx3H2SIAHzpzFq2KEH7V9vJ1cSsNd/b/9um+T3hbnooQYcFmX0fzYZUIvtJYE57HCSzaF77E9XdIeY2HPWh0jB6sgHCvdbeWYE/JsVqmHLiaIvA+ycMNDZ6O8SRL9dUJSk+T2kQ2I5eg3ZX/pptytoGkOPEJe1Q/gbkRtQBVHjulRAE/e3u7WTIzF0UUWfiI3oM0/HOxE5WyWjI2Z2ZJktGkuBi3fY0K8WLWFAc1x/7fgYklNewRW5YMc4aDu6fHAGh/SjroUiXU/aiPu6SnuCltRhouzy+khCIs5pAIU/hxe/IL5jTB87OTt4WMIzmDsxogmoc5tpgAdnKNrttGmgDPd5EkeE2IDvMA5EjcC1nmdllRUKiXJDe8BqtuCpGrY4guhMbjhYhUNq4g/kGTtlXDglNGfwDPIToHUo0O+2eL0AhBZMymHI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0RPclV1VEVabWJ4a1dtYVg2MFdUY052eW1zQThJWTVSSjZManZ5Ky9nZmF4?=
 =?utf-8?B?YWxvSVBNalBoeVIwbFg5VXY3bTRWUDVlbys5MnYwL1oyTzlUcUJVUTdaOTRZ?=
 =?utf-8?B?a0l6SndERkt5ZVBxWmtzOFllSkQ4T1pIQTQvTVBrOWx6VldYVzh2cE5UUGdX?=
 =?utf-8?B?ME5iR0xLa3J4REZQRXN5RVVjOU5COFBLeWt6WUN3enNRZUdSTDFUU3BpeUMx?=
 =?utf-8?B?SThRRHB3MGgwRnJnUGUzeVhhQTFSTHZsNEovUHhwMHJ1WHFSS2UvWm1rVUtN?=
 =?utf-8?B?YWNCOFVPdDhnOE9ZeCtNQlI5T2Z4Ukk5elZCR3c3dmQveWhzOXcyVWJZNjZ2?=
 =?utf-8?B?WjhJV1lEaFFQZ1hQVVI4ZGJ4d2N1Yng4WHo0Z3JkRGQyNi9FYUYrM2J6Q3Vp?=
 =?utf-8?B?bjNEeitIYnYvUVgrWnlWUHZPejk3ZHVxRWp4RStETitwdUVZSnZQenlCUXlL?=
 =?utf-8?B?azFpMjgzcFkzMWFJR3pOaDlLUjNWNTZyQVNUV3EwVmZmV1hZRzdnRlpnSGNT?=
 =?utf-8?B?WHVPN29OcGJIR3BSUW9NSjg0bi9ldGV3VDdqMk5pdGtkZVZpZ3czMERQQ1p3?=
 =?utf-8?B?UnhCanUyUHk5Ujk4VnQ4czNpTWdpNUVYL0xheldzUzdoV3lUWkFGWTd2WkVS?=
 =?utf-8?B?NFZaQUYwai8xdWU1bFNZb21jTERjc0lueTlVL2ZJTDl2dyt1T3dOckVBM29n?=
 =?utf-8?B?aFZVL2dKbkxZU05nQlc4VW9aQURVajY2dis0VjhveGtqSHR3eTlObCtkd1gr?=
 =?utf-8?B?MnRabm1aSGZyNGhmTWFmUW0yUVlCd2hCaDBMWkI2YWVib2dJRUViVlBYTnZJ?=
 =?utf-8?B?aU00dW85MEMwVjNpTEVCbmhsRFZLWXgyVmFMTFY2aUdscUNQWTZRVEJiMnNL?=
 =?utf-8?B?RklBK0xISlpOMnBUeTM1VXUyQ0RuVEpUYXhmODdZUktuOWpHdWFuZ2habGFS?=
 =?utf-8?B?TlVDNEdKSWI3YjU4dFlRb25jUlhuTE1jRnRwU3hBYmxYYjVGcm1LdHYxTVIv?=
 =?utf-8?B?c0x0TkNMZFk2bXM3U3RuQTc4KzdNSnlXckZvNXBtWk9oejhWZTlEWjYyVGRx?=
 =?utf-8?B?U3JoMHhmSHBFK3liUFBBTzRLeER0RlUydTB3V3JwTnZGVmtod3hBcXp2bytB?=
 =?utf-8?B?R213Y3ZzZFFMZHlmckg1VFVIenNLSm52bGhCUHJ2cGFteE93VmFNcW52MUJu?=
 =?utf-8?B?WFc0K2xxY3ZraHMwbXhicDhJMjlIbXJ6ZG9VWXlZOWFqMVErQ3pZUW9XWWsr?=
 =?utf-8?B?N2VNN1NhZTdVWVB6TStUZHFESEorTFNYRmpMWCtIU2Jxekl5M1NyTktQd2t3?=
 =?utf-8?B?R0hGSVhJUkVidjJJMEdFbFcwSG1iNmJhT1BnREJzd0liaXBIWmtKTnhvaGFV?=
 =?utf-8?B?bk1CaHBtcEE3d3lsMTBJRlBmMHBVZXlPVHBjZTNpQnBPa3FXUnpubjZEV1Zx?=
 =?utf-8?B?N0FhWGJrV1VJeEdBRjRWT01lQUVFajc4dnZZR0ZQdmZSaEttTHFWbldGZ3Bk?=
 =?utf-8?B?WGN1YVdyQ1hJVFhEbmpQM2tRYnpBb2wyNTVmS0lYV2N1VmtDelkwOHl1SVpP?=
 =?utf-8?B?SHo3NE1uWnQxdXorSDM0RW4rTTJFN1ZKTTMxZkl2YTFTQ2lnOVMvejlxL0xO?=
 =?utf-8?B?RWJobUJLb0xocnFZZkdNZGM5cmJnak9QbVc1UVRhRC81cENDWkwxS2VreDlZ?=
 =?utf-8?B?Q1AyRUwwZm9tT1pYZjdJVThRNE9ncXFmbFBGNmFyWkFCK1NHUk91M1c2MzFC?=
 =?utf-8?B?WnJGSHY3dGVqanFON01QSkFHMmtjc1EwSjBmMy8yZERyVjdsR0w4Y0YrNDFY?=
 =?utf-8?B?Z21GS1N3WGI4YTZhSTNzd0dWb043UzlyUEk4aytBRzhtV0M2TFJRZlRPUEpr?=
 =?utf-8?B?bVRQSGJIekZUOFFGNWk5UUFSSWF6cHNmWHJsZTlrQWlMV0ZpUFdZeXI5M2xK?=
 =?utf-8?B?K0J5NUJqelVnNVI2Qmdjc21hWmhpS05KSHdXQ1lWaE5icVNKcWJrM3dqTGo0?=
 =?utf-8?B?VkowR1RBS1ZZVnVVc2J0aTIwZWxUYkdxNDV5K3B3ZXhFRWtCM2xVUjlhUFdJ?=
 =?utf-8?B?WUlVUklCQWRCdUw3NFdzdFZ4MUxrWG9HV09aNlFWYml4a21OVHdyOURWSS96?=
 =?utf-8?B?VDd6S0w4YUo3WUZuMThraWNVUy9ObE1zYzkrb04xU01QQkNjTE5qVTlDdlFG?=
 =?utf-8?B?Mm8xMnhneWV6aEMrQ0k4UHEzckV1UnlEOXA3a1JDL3dKZVE2bXlwS1NoNFNO?=
 =?utf-8?B?anZ0U3JrOXBBbU1EbDk1TWVDenZTOUNZNjB4R0JnbCt3amRUVXZMZHZiVVE5?=
 =?utf-8?Q?mX5aaCpcW2Qhitkknb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PPEbNcSEfT60IIskPoVdLQHiYyj3rZXX8DK5yCurrxOafQ962gSQKvhXOkNsXIl0rAcIOVzEdwWaavBM/bcWE/zKbZxJUCsCtX1b7rg0PioCQP/t7hGihbE9dkDpvVKraLgjYsGU0Jwmp/XL4IFgG+lfGz5YMmFiEtjRT1gnVmdpBSRgU5Vj8ELdO4V0zedjynrve3pK14pTph4Mygpf6qM/DXwtbswQ+a+mi3mvPGaUytsVUGhTfOEXNWeSoqDRhXMg3uz8p7zAxmQyCQfN55vk5O9HHj/q0oEM+4kRzCiKvS0+DMn9IHJCh2K9RAhHN0hwCX/x/kv6x3AwMNDuRg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d970b1c8-91e8-45d3-e09a-08def27cec37
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 23:05:48.5714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odbSLxQAfLKUFpA6ebsnT7pX9JWvu9V95/jKctyXW7QPPIFFVG1v7S8LgD51mJG0pGuVbd+veFaLuf5FUybbrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
X-OriginatorOrg: intel.com

PiA+ID4gU28sIGxvbmcgc3Rvcnkgc2hvcnQgLSBhbmQgSSBhcHByZWNpYXRlIHRoZSBleHBsYWlu
aW5nIC0gd2Ugc2hvdWxkIHN3aXRjaA0KPiA+ID4gQU1EJ3MgZGVmYXVsdCBiZWhhdmlvciBiYWNr
IHRvIFJNSUQgKyA2NCBjb3VudGVycyAtIGV4YWN0bHkgbGlrZSBpdCBpcyBvbg0KPiA+ID4gSW50
ZWwgLSBhbmQgdGhlIEFCTUMgdGhpbmcgd2lsbCBiZSBleHBsaWNpdGx5IHNlbGVjdGFibGUgYnkg
dGhlIHVzZXIuDQo+ID4NCj4gPiBuaXQ6IHMvZXhhY3RseSBsaWtlIGl0IGlzIG9uIEludGVsLy8N
Cj4NCj4gV2hhdCBkb2VzIHRoYXQgbWVhbj8NCj4NCj4gV2hhdCdzIHRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4gSW50ZWwncyBSTUlEIG1vZGUgKyA2NCBjb3VudGVycyBhbmQgQU1EJ3M/DQoNCkludGVs
IHN5c3RlbXMgaGF2ZSBjb3VudGVycyBiYWNraW5nIHVwIGV2ZXJ5IFJNSUQuIFNvIENQVUQgbGVh
ZiAweEYgdGVsbHMgTGludXggaG93IG1hbnkgY2FuIGJlIHVzZWQuDQoNCkFNRCBzYXlzIHRoZXJl
IGlzIHNvbWUgbGFyZ2UgbnVtYmVyIG9mIFJNSURzIGJ1dCBkb2Vzbid0IGVudW1lcmF0ZSB0aGF0
IG9ubHkgNjQgb2YgdGhlbSB3b3JrIGNvbmN1cnJlbnRseS4NCg0KU28sIEFNRCBpcyBub3QgImV4
YWN0bHkgbGlrZSIgSW50ZWwuDQoNCi1Ub255DQo=
