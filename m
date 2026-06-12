Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CF359A6D;
	Fri, 12 Jun 2026 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278868; cv=fail; b=FF4v0W7AbtpJIbj9NW2Ql8t5jKvenvMAHYH0n1YGEYn7SaxxLj+ksU3SyaC+JeGM/FOrvbwIQjTF3uBPmhEYvRm+tNQpN6gYNo8hVE0VdLvoLU+/0ALOis3pi25wnPC/1B3YsKdN5zq+IK5BONhBf2MCHmVIn56rCxtRg16ZrEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278868; c=relaxed/simple;
	bh=6pjLmYZlLuNVUw4QY+AawSs1FFuCu0NO/iTYnxBg3m8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hm0nim7iF+wDT/jxoO6ZDghvqP6//eyxCETGdDGWC5i/zVTSaLp6E0Rma1QL/9oXV82yANZ2mwDz1RJw4uZja0LIj7WRO1i0GU+3nEIcpsOeIN7RqzzSNggsDvSTuc6nE9H96aSiEjYnw/CaNpHpLQnlpub6iqVg9dam7bacqiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fesU+Sbi; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fesU+Sbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781278866; x=1812814866;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6pjLmYZlLuNVUw4QY+AawSs1FFuCu0NO/iTYnxBg3m8=;
  b=fesU+Sbid3DqnAXFrgOrnuipcCT5BCLe3P4EnPE+kMDsIx9kIQLiMhAA
   dFONBFpDBVksP1OZ0QfbQ7F/ZEOmjDl0wm7PgVkxXJDYPODJLi6sbgS/k
   9pghfQCogeXky3ea8T1W+9ZclfCt2ZLVntzfesGwor77ctrFp2WNBBl1+
   qBxM/+wtkwCfdS5PCVDJCerRQXLH6+3g9AST9JlHgFwjCVWhp87BLg2nE
   jxoL2xRdt1CGqbVoJ0cwY+wVKe779NHe9wC54S1y00c6tFuG4lhyqNLEi
   rybGy185K7m3zsOsnmWtxVV6HfcdXLBr3nBvI16sgTTyiqN/X2McHa7aQ
   g==;
X-CSE-ConnectionGUID: hrvvV2oSQQCvpTs3YveFNg==
X-CSE-MsgGUID: WELx7kH4S2agGdi7arOJYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85953496"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="85953496"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 08:41:05 -0700
X-CSE-ConnectionGUID: nsKkiSEDTJ64FngdrW5+oQ==
X-CSE-MsgGUID: Y4CEoa0lTN6sCY4y11pQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242474753"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 08:41:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 08:41:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 08:41:05 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 08:41:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijx6jdGuKT9aHhiV00fDMjcdw2dh/2vUFcVGJDmW/a1LuNGv3KmO9DV8hJyy7M4UYTJBraMTGZwdjzyvYhHGHIvGRjU2q3gMC2KZMc2PfarVndafVqzxZYJlAehVIZ9IXHNfvGMCbi1PWeUcwVqai2R1WuHqekdfjO/2bsUQh5J3Ly0N0zJu2zxhU7K02mZtUKCQq6/h1YaIYw0fCfzpZB2wPI5FcXyY7wSrR66PVXEk2nR/IVBCpeM49djeWqGUZvIksh/FFoX3zpLKvmTgkDiZu8+w+1fGdY2aWXujfHEhw/0eNFmq6hXzInTpZuVlJ6EI81ea6T7N5BUAb1Zo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pjLmYZlLuNVUw4QY+AawSs1FFuCu0NO/iTYnxBg3m8=;
 b=Rw1BMVb53PEq+E6PGK/y6VDLbrjL05vL5w8NN7yb6WhvYt6pcb7rQ0PVLuODzZt8mKH4fCdXPiR2Jmom57TqX7/xlWiyO3bsKQ/Udk2vrs2NKE9ifjp/KWbcCyygnYen2awru9ozQ1CjH0x5uX6LYLjVpUjxIJhHlbmCGecSzM7vR02kL3Ec3ccrea+UsTsCYBb6GSJ38u4UfJS/YjvPoxpsTYS4ft0US6pSBWh24DVrbz7dhLtGTxC6HoLkgZTInunj+g86vPr0M27zKkyXLGf+6tuOH9mV4zEEktVZrcXzknpcx+HwY0cu5CCuTa7SS3pCB4zaibc2Db8qTmUSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SA1PR11MB8595.namprd11.prod.outlook.com (2603:10b6:806:3a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 15:40:54 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 15:40:54 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "x86@kernel.org"
	<x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"feng.tang@linux.alibaba.com" <feng.tang@linux.alibaba.com>,
	"dapeng1.mi@linux.intel.com" <dapeng1.mi@linux.intel.com>, "kees@kernel.org"
	<kees@kernel.org>, "elver@google.com" <elver@google.com>,
	"lirongqing@baidu.com" <lirongqing@baidu.com>, "paulmck@kernel.org"
	<paulmck@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"seanjc@google.com" <seanjc@google.com>, "alexandre.chartre@oracle.com"
	<alexandre.chartre@oracle.com>, "yazen.ghannam@amd.com"
	<yazen.ghannam@amd.com>, "peterz@infradead.org" <peterz@infradead.org>, "Bae,
 Chang Seok" <chang.seok.bae@intel.com>, "kim.phillips@amd.com"
	<kim.phillips@amd.com>, "xin@zytor.com" <xin@zytor.com>, "naveen@kernel.org"
	<naveen@kernel.org>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Eranian,
 Stephane" <eranian@google.com>, "peternewman@google.com"
	<peternewman@google.com>
Subject: RE: [PATCH v3 02/12] x86/resctrl: Add data structures and definitions
 for PLZA configuration
Thread-Topic: [PATCH v3 02/12] x86/resctrl: Add data structures and
 definitions for PLZA configuration
Thread-Index: AQHc2PiouJlH/JV7Wk+hT8Iz/66xUrY6RX6AgAEJdEA=
Date: Fri, 12 Jun 2026 15:40:53 +0000
Message-ID: <SJ1PR11MB6083C069F99FAB8A0BEB8518FC182@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <e84fdbc324b312ff137d279ec154e3827c0aed81.1777591497.git.babu.moger@amd.com>
 <db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com>
In-Reply-To: <db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SA1PR11MB8595:EE_
x-ms-office365-filtering-correlation-id: 216df105-2077-4de1-0530-08dec898fd20
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|38070700021|3023799007|6133799003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: tpKozo08OYGrB4BmGDCEuBJsQ3diz6m9uEwHAa2sSo6mCF5pm6kmKHsQ8wntRXndvfEsrXVdgeESg+IDnmgrKf3/dLmRr9SES6hFSWMFNUjhW+tuJIBcq2WxZEw44wXgn/ckDeCO63zidkj1QFusvqnbytvNHNkf6lQcN/gEWT975blUjr1BMl1eUFX7Jjg1o1oWXEbB5gNUHYURMS3qifSD3BaSe/jDUCX50dxare40NR2lTtu+3pvVkBUloiTXOL5yMRYhvujMQBvhpVYubqwLyquMviAycZLotYC6slh+Un3FfWGlTIj9iKw+wXvGiJAcIXg8lhe1rFNe7BCAWKVErFqZaaUFrTjUXaPUUzuLBC8T+ZYem2n1bn3ALZweAJ0r0WEGgEMFaamXjiNj0LbrLSUNQz3qm1EB+86twuBCJln8rFk3Am6mHSQREOf3RoV+YG3SVaspxFbkn2kRQ8Jxe3j+akOnkkNNhVuZrIX3aI6Y7Pv3Fb1eiDbnMfVAT1hlvKu01APrnluvS8aWyQZnS7Lnh5c3irDFrAnPrSNidKNYcLNnj9QnQ3RzQJLbN0aRfJm8HfQAGQj8AfiS10Wk8SaFG/XQqp9fjpxGQvoJZ3bsF3b1yFVCTf/vpUHIQw8F0rCwiOY4YF0aEjiXvflRI7Ca3d3AEtReLhuM0a4L5/qqnuHehN4iyrhXxqlwa02yHqFAKHZjlM+E/5ff94O+H3812jh2is2druxHrheqM0SJY2rW1N5ssNi0ybyM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(38070700021)(3023799007)(6133799003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OS9iNDZ0Q0VlNyswSjN5bHlYaDEyN2hvaGlvaWxMYUlJaTlSeTYzRjVqb0pI?=
 =?utf-8?B?UzdFaHpBaWM5a0lDSE5BOHNuSEp6dkhmbjRjZ0o0Qk9YQWtHTW1ZSFFSVmJr?=
 =?utf-8?B?ZzZ4b3h0MTFGYXJId0JGUTNUYTJ4cHhYQlBER0I0RjBhQkh0ZUl4SUltSUpM?=
 =?utf-8?B?YURmYVN1bHZxN2ZVZ25lTmVHMWUrQ1VTU0ZCeDZGS1UxT3B3cHRFVWMwbk9r?=
 =?utf-8?B?Y2hhbkNQaGNSRDBkVHFBbmNRSTdGWlZmRTIxaW5zYWhlT0ltbkw3Y2ZwODJV?=
 =?utf-8?B?L2lhVUIydWNnS1pCb25VaW05L2l5bFRrbjRHWWd1MnkxbFNyUjd2cUpoMUZp?=
 =?utf-8?B?RFRHenBhcUdabkpBeGhGblVEWHN4ODRrV0RxYVNTVXp6SS9VOW1sYjdLUkl1?=
 =?utf-8?B?c1NyU09HZmxjdjVNLzBUcmE2NlhhbXhpL000eTQwOTA0NWgzVmwySFJoMHI0?=
 =?utf-8?B?Z1ZLU09SQjlxNWVoNzhtQzBaR2QvVUFFZFNZRWdEeDJLMUtxY1FxSzhiWW4r?=
 =?utf-8?B?dlZzSlR4U2gvNTF5eGxsWHBhOHVKc3d1VlJ1SG5qcnVYcW5QWkRYaWNNa0xl?=
 =?utf-8?B?NFRoc2I4YkQwenA3OHFWQnZNY1VLTGxSM2pCVExLTDUyZXF1bHNadXhTWmNS?=
 =?utf-8?B?ZUtiSFRFT3E5YXFlNVh2VWdjS0p5ZjkrV3ZiZ0luR2F5NE1TeThRYjREcXRE?=
 =?utf-8?B?QXM0ZlZBbHhPanpBb210aEFSak1YRnFnSWtwZVRMMjU3NzZ5V3JZZkNMWE9X?=
 =?utf-8?B?UzJDMXNXaDdqRVdZUHFaRGdKVTFpdkw0czdpam1GRlcwRUlpYmpzeW9qTzBD?=
 =?utf-8?B?R01WazBzblI5V203S3p5T2p0V2UrSWtGSURrTGZyZDBkZGp4ekJhWjlrK3du?=
 =?utf-8?B?R2UrODNSbWRVeW9JVG1HcjVFVUNlZWJ4VzltdklqemZQUSszNkZsampxR0RH?=
 =?utf-8?B?ZmJkc1JaTXJURFZlN0w1L29mMnlQRWFBcXJUdkpTdEhzakhtdGl4R2JiM09D?=
 =?utf-8?B?VWY0N3oyVmwvK1FVQkVnaWY5b25RQ3lqMVk4U1RmOWl5MVY5OUZzaVhuSStR?=
 =?utf-8?B?T0l3U3JHV3c4WFVGay80TEg3OTl4UU1TUytsUXBmS2NpQ1NadmwwUkVIR1Ro?=
 =?utf-8?B?R2NSbEhpY3RXTXp3encxSnV6YkxjaDJFY0tjYVBxc25WVFBYOWxuUjhUSzRP?=
 =?utf-8?B?d2lVWm5nVkN1ZExzM0NPdDBDekVxUHd4MHRxa3ljemhYMlNDNHpRb0V5L3Mz?=
 =?utf-8?B?bjJZQ092SERrSDRzNkU3a1VUb0FXKzRKOThEYWM0M1ZxTnJNL2tUVFNwRUlB?=
 =?utf-8?B?ZHFSL2IxL3lpT2FXT1YxMWtuT3lOTDF4Q0xHYU5rVjFnRk1QZjJtRW42TUxi?=
 =?utf-8?B?Z1hIeEVYT3NvcHVTUGJMWm9FY0J4SVpkQlBHbmtoRWpsRi9CRE1QSnpTSlFY?=
 =?utf-8?B?Q0Nsa2VOeU1oWU5rTytBb2FXZjMyOWhBU1dweVA4dkorRitHVzBITjRFNDVN?=
 =?utf-8?B?SkxXSHJldi85N25raXpvdVk3S0YvSTcxTjVrZmd5MUVLMkVFUDFLUXVkZkwy?=
 =?utf-8?B?U2VITzRRT2JJNWE4WXl3dFJzVDJIUFlhc2laOFZtMGtCdlpRU3dGNzFnY28z?=
 =?utf-8?B?VWdUeDZ4end3MW5rN0hIQm9uY3J0c0dRL0V5SFNFVGtQYTd5MXF4L2lDZ0lm?=
 =?utf-8?B?NGxVS05wQVhQWHZNd2lDUFJvRDhyZnZKRjBJUmxXU1F5OUFUWnhBS2ZWaUU2?=
 =?utf-8?B?aC9Nc0lwYTVuaHhqZzlOZUREQUF1S0RFU0FnOGFwWS9ycmJjY1dvY0lpT0VK?=
 =?utf-8?B?aklvYlIvT1RDOWszOUxSNXJ6dEsyRi8wZTRnWTJDZGt3ekZ4UzlxWkxKbVAx?=
 =?utf-8?B?YkIxMGJ3RGxNeVJ1NFBFSGZUSzI0ek1vYWNka1l5d3pWQ2FCRWRSaFJFTXhT?=
 =?utf-8?B?YjAzZFhqL0J1MHRKZ2lmcURuK1gwSjZmb1doaTFrRHZVKzVrVDVHQStQdDVx?=
 =?utf-8?B?SzZCeHhOODBJVXBOOHhEMDR4VDNhT2ZOb2szR2k0NnN0bjNpZm9lam55N3hv?=
 =?utf-8?B?akRMeDRFTEthdEUvc1JwbjJvTnlDdnJpOEZqV253T3JodnUrVnZ5UlBYVURi?=
 =?utf-8?B?NHhKVnY1Tzh1M3NBNm1saXlpZEFwRnZwM0hrSmFTdGFFZG5pbGJrbUF5UURR?=
 =?utf-8?B?VlJ1bGFJZW5LMHdmT2hxQzJyTHB6dFFCeWs1ZFFMeG9nQlkvQUoxTW40WVFM?=
 =?utf-8?B?ZGpYMFdlcnFYVldEZXRWeXRubEhtVFYvemxxWUh2cU5HVEdnRC9OS1FVRVJP?=
 =?utf-8?Q?ameAdGWggXDOTfNwdn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cvfl3LDyb+PbPcuBVjusrOtOCUNnOGbCvSXQowZhzsnaqVeSTc6J8TwtdgrCOAP9gGkqkxEItnC0cxw+w+6iVR+Ez9ge9JWXmjedjiXmq3h0miBgNspSexbFgiMFAq7GTq7XKG2uC+coyo0xRFlJrpo15BVoS345qDlUXyEpqsYsfSreJpHLtib4CAGIftxaz5F5PtObZMuuceann+kpV+WCwqA87nbQSOBICu/yZ6jlYpg/yDNeAn5WNgvLXO+1lVPVoddhZG37SgTUKU6R0Kt5nn6np39S+LNxkdEIjCLHRURHzLCm4zknQDzmveTk0ANNhbx6D3W8P2BF1q99qw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216df105-2077-4de1-0530-08dec898fd20
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 15:40:54.0399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+Zha7UlX1Kedbto6/ZVkGYh7fDzJwd3G0v9vegRwO8n7hje+iy+cvC4umAcQzfGSgWq05vJulo6UaX3ZdwjqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8595
X-OriginatorOrg: intel.com

PiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL21zci1pbmRleC5oDQo+ID4gaW5kZXggOWRjNmI2MTBlNGUyLi42MjM2
MjhkM2M2NDMgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vbXNyLWluZGV4
LmgNCj4gPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaA0KPiA+IEBAIC0x
Mjg3LDEwICsxMjg3LDE3IEBADQo+ID4gIC8qIC0gQU1EOiAqLw0KPiA+ICAjZGVmaW5lIE1TUl9J
QTMyX01CQV9CV19CQVNFICAgICAgICAgICAgICAgMHhjMDAwMDIwMA0KPiA+ICAjZGVmaW5lIE1T
Ul9JQTMyX1NNQkFfQldfQkFTRSAgICAgICAgICAgICAgMHhjMDAwMDI4MA0KPiA+ICsjZGVmaW5l
IE1TUl9JQTMyX1BRUl9QTFpBX0FTU09DICAgICAgICAgICAgMHhjMDAwMDNmYw0KPiA+ICAjZGVm
aW5lIE1TUl9JQTMyX0wzX1FPU19BQk1DX0NGRyAgIDB4YzAwMDAzZmQNCj4gPiAgI2RlZmluZSBN
U1JfSUEzMl9MM19RT1NfRVhUX0NGRyAgICAgICAgICAgIDB4YzAwMDAzZmYNCj4gPiAgI2RlZmlu
ZSBNU1JfSUEzMl9FVlRfQ0ZHX0JBU0UgICAgICAgICAgICAgIDB4YzAwMDA0MDANCj4gPg0KPiA+
ICsvKiBMb3dlciAzMiBiaXRzIG9mIE1TUl9JQTMyX1BRUl9QTFpBX0FTU09DICovDQo+ID4gKyNk
ZWZpbmUgUk1JRF9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMzEpDQo+ID4gKy8q
IFVwcGVyIDMyIGJpdHMgb2YgTVNSX0lBMzJfUFFSX1BMWkFfQVNTT0MgKi8NCj4gPiArI2RlZmlu
ZSBDTE9TSURfRU4gICAgICAgICAgICAgICAgICBCSVQoMTUpDQo+ID4gKyNkZWZpbmUgUExaQV9F
TiAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMzEpDQo+ID4gKw0KPg0KPiBUaGlzIGlz
IHVuZXhwZWN0ZWQuIFNvIGZhciByZXNjdHJsIGhhcyBvbmx5IGRlZmluZWQgdGhlIE1TUiBudW1i
ZXJzIGluIHRoaXMgZmlsZSwgbm90DQo+IHRoZSBpbmRpdmlkdWFsIGZpZWxkcy4gVGhpcyBzZWVt
cyBhIGxlZ2l0aW1hdGUgdXNlIG9mIG1zci1pbmRleC5oIGJ1dCBjcmVhdGVzIGluY29uc2lzdGVu
Y3kNCj4gd2l0aCBob3cgdGhlIGZpZWxkcyBvZiB0aGUgb3RoZXIgcmVzY3RybCByZWdpc3RlcnMg
YXJlIGRlZmluZWQuIFRoaXMgbWF5IGJlIG9rIHNvIEkgYW0NCj4gbG9va2luZyBwYXN0IHRoaXMg
Zm9yIG5vdy4gU2luY2UgSSBhbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlzIHVzZSBJIGFtIGxvb2tp
bmcgYXQgb3RoZXINCj4gcGF0dGVybnMgb2YgdGhpcyBhbmQgaXQgc2VlbXMgdGhhdCB0aGUgcmVn
aXN0ZXIgZmllbGRzIGFyZSB1c3VhbGx5IGRlZmluZWQgcmlnaHQgYWZ0ZXINCj4gdGhlIHJlZ2lz
dGVyIHRvIG1ha2UgdGhpcyByZWxhdGlvbnNoaXAgY2xlYXIgYW5kIGFsc28gdXNlIG1vcmUgdmVy
Ym9zZSBuYW1pbmcgdG8gZXN0YWJsaXNoDQo+IHRoaXMgcmVsYXRpb25zaGlwIC4uLiBJIGRvIG5v
dCB0aGluayBzdWNoIGNyeXB0aWMgbmFtZXMgc2hvdWxkIGJlIHVzZWQgd2l0aG91dCBjb250ZXh0
DQo+IGluIHN1Y2ggYSBnbG9iYWwgc2NvcGUuIFBsZWFzZSBjb21wYXJlIHdpdGggaG93IG90aGVy
IGZpZWxkcyBhcmUgZGVmaW5lZCBhdCB0aGlzIHNjb3BlLg0KDQpUaGVyZSdzIGFsc28gcGF0Y2hl
cyBpbiBmbGlnaHQgdG8gdHJlYXQgTVNScyBhcyBhIHNpbmdsZSAidTY0IiBhbmQgbW92ZSBhd2F5
IGZyb20NCnRoZSBsb3cgbGV2ZWwgaW1wbGVtZW50YXRpb24gZGV0YWlsIHRoYXQgdGhlIFJETVNS
L1dSTVNSIGluc3RydWN0aW9ucyBzcGxpdCBpbnRvDQp1cHBlci9sb3dlciBoYWx2ZXMuDQoNCkFs
bCB0aGUga2VybmVsIGludGVyZmFjZXMgYXJlIG1vdmluZyB0byByZG1zcnEoKSBhbmQgd3Jtc3Jx
KCkgKHRvZ2V0aGVyIHdpdGggcmVsYXRlZA0KZnVuY3Rpb25zKS4NCg0KU28gbWF5YmU6DQoNCiNk
ZWZpbmUgUFFSX1BMWkFfUk1JRF9FTiAgICAgICAgQklUX1VMTCgzMSkNCiNkZWZpbmUgUFFSX1BM
WkFfQ0xPU0lEX0VOICAgICAgQklUX1VMTCg0NykNCiNkZWZpbmUgUFFSX1BMWkFfUExaQV9FTiAg
ICAgICAgQklUX1VMTCg2MykNCg0KW21vZGlmeSB3aXRoIHdoYXRldmVyIGFkZGl0aW9uIHByZWZp
eCBjaGFyYWN0ZXJzIHNlZW0gbmVjZXNzYXJ5XQ0KDQotVG9ueQ0KDQoNCiANCg==
