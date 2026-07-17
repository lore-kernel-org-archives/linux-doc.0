Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C673FD147;
	Fri, 17 Jul 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293645; cv=fail; b=PO/5Owpk3sv1cwUtk/BZlaWENKOt4ANOlUu86IxZCTRC/rK369B2jiqHv4858fcurdr3uBnqGmg4M7nKQT3/2wfT+Zpb6YxldzpMrrGCe1hxiDHJaz13sVPXxW6ovFqzDHO8avAvNyqN63kuQYYEs9VBitrci/OmvQJGHq/NXa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293645; c=relaxed/simple;
	bh=7TY2L0F4joWcr+usGxy7t4zejMZKCQau4tks2s//sZk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dT+xJhbyU0CeVEbR9ICzXcjLnp+HzEWXCXDO+Y/E2eiqvfbb7UFYrtBdiOyrQ+gJiQFhMQJ85nmyozukQOdiwc4nARrJdm/ILNBm4r7lMkspL9osUtBjpDwwjXzfbMYd+9IddxT/nR25REAP6LAmdz47gNUX6bNb5Vp4Mlu8vN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J30hWc6u; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J30hWc6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784293645; x=1815829645;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7TY2L0F4joWcr+usGxy7t4zejMZKCQau4tks2s//sZk=;
  b=J30hWc6uL0xjDUqrOg27Agzkdo96B00ORFIX0fpucFbm5Aq/d9l7MNbr
   +EuYqEP8mmZAP9mMJ/ZSWowP0L7qQv8cvbUrT+q+l8snwUK0kj+q91Q7v
   DUBkV3WT/60B8OMWngHKuQbAcdYlHHfSexkTts53LCv+hoENAFHXiAiD7
   6ZslyYs2FpL5W4wb+8grykX5/+Tj9E5Z2kkvAWbbsX3sErfb4RT3zXbV1
   xWfLEIpFkCWJlcwCPTSNUBUNNUUnFAFfTzpOFgvl7JYJhffB0c668H10F
   LmRsPySi8rgQVpYLKmYUuhz6hxfi5Z2zG3fjh8AeCPH7pXdWCfPuE+glP
   g==;
X-CSE-ConnectionGUID: Mun8gQl1QQOfBh7ksWgIxg==
X-CSE-MsgGUID: SP6N1G8ERs2j2+c31WG/jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84741566"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84741566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 06:07:24 -0700
X-CSE-ConnectionGUID: eL29+wEBRlyovGsnp5RBdg==
X-CSE-MsgGUID: 9pE5Ku4NSdaZtB+v11NMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="255022978"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 06:07:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 06:07:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 17 Jul 2026 06:07:23 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 06:07:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZxV3O0OpgYxYMYm0qKkBcXZMr/5xmFnALVemJ4pn7iJSw8n15vvwzFvpU3IqE5tdY+ERByVtjQxXu+EedACJB2I/5ltl7tGmiqtv4f4xaG++V/hyRTNrmBlxhpb5PWNBy2Lwn3LYyv0tfLBiygjICRVKY2koyYqAIEVk3wDiPAIZ276ilKnWSw/hXDwxxTaWhvdRllMglXuvBp40t6q3JMmSISDaZEbC1AKUKw5rquJI0dmfOmkATLfqJI8/ONHPAHfND8Zohytwvulq948VdwXJ4Wgs14FjgvT/R0B2UHFRvalRr8Uw4QUrA91QEbKM1puSxCw4u03nexQ9cOoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TY2L0F4joWcr+usGxy7t4zejMZKCQau4tks2s//sZk=;
 b=wFt/kUITZBfgvD12DjrSJbcU7hyHUF5+dsKrVBm4EDF0wS725R4RVBx/u+sm115rnrFWWicFDV/7NBydH09RHLV+/7yJTAdkZUvzh40wdI8152N7pxVkvwcUhusQHUisT47eryB+MjRGVycRMnN3Wa+ymg5HGhmq63b/j+1APdJE8Xqwx+QnRwbX+5wvj1hZ/MCa+mP2ngNlsI+vcpzrGd4JE2FS+4HDhL5RL/GIa/y6x2tl4vIELIYNIYpUkDC67jBMhPLhTl1gOa92APNTvT4j8/KephGjIrie5SoX33HXVav4R4wd+NjzeK0SqKLDIOXsqgu4L7KAM8Mo4SWMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 13:07:18 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:07:17 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>, "jani.nikula@linux.intel.com"
	<jani.nikula@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Topic: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Index: AQHdFXQJuF+WY4cC5E+1bbvL8qTBCbZxr3iA
Date: Fri, 17 Jul 2026 13:07:17 +0000
Message-ID: <bc201789fb00c339971fee35c046e9f0b59dcb6d.camel@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
	 <87tspy5zjy.fsf@trenco.lwn.net>
In-Reply-To: <87tspy5zjy.fsf@trenco.lwn.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|LV2PR11MB6048:EE_
x-ms-office365-filtering-correlation-id: 81a5faa8-c601-48d6-4f9d-08dee4045425
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: DKMdAYqLFn6YxvL5FrsE+ME3i8FfNCqZPfN/1Cd+zwB1cafL6ydr1eQjduJtIDhcdFEXVgub2RakucsLONtm+boUxep5Jfv7JQXomAm9bmnDRnv2AA8uXbyWniFN9gk/X/2Ga84iwXenaAVa59xeMMbEh72HCnE9X7+pjY9Q/+RNNkWrbappI2HkvceyZTNru5jFwVTSutLe5F7IudGyqpKFglp6V7SLTwww/uJh/lSQFjDDeHgltLWcUVnJK6fJrxJWrIShGbG3ZnQmKwBx/VuVGj9SP5UYNpOVN+XjAa/p8ksmYl6Gb892rcx3CvovCV/jTKUhTICrxBLDOXFUkwzu01Jg8hIY/MSI5FlY6ciaz8A6IJyMqYQA0CPPjBzHLkou9WNiG44+cKhjoOHe/vWblvtg9V2eNyzqittB3nQyVh+5yozBsjg09qjvp/8KxTGmoB65Bw6zTA8Of6ulLKyWpwJRsrM/B2eQTBzKxHg7d3ZwK95EFptnK44Wb5WqJPcL3NU67ew2wSTUE5Iet92jxa6dP9/ra4LUKJ8ki3T83+A2x04EIK6hdaRxjfmvPqer6fC7c0+mMGtMQB+3H2/875tubo9esm6oBgIpxM6+5gQVV9EP893ZYhiGx/HgQ2G3WcDzyBMxWnNctRnF7X+rtnB3+RQn86gy7alaOfiBSPy15e00Q24GZa4HDIpKHYQxwxbJem/dkFESLJjN8JO0QmAdGnzU0U2z9eR9cIo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5663.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekFrMDdDcjhXTnA4US9qMjhDRnNLQWdpbWpzVk5RMXhqVS9QbzkxbGlyWlNQ?=
 =?utf-8?B?VFhVR0puK2JPUU9aUS9EL1ZRSWJYWEl3cGpIQXd2cmZwNE1EaXEwM3BlSGJS?=
 =?utf-8?B?WTdySEVDd2R5TEQzVTZPR3h6bk5IMldxaU12SWE0ZWVIZEZ0RHpPbE82Smly?=
 =?utf-8?B?QTZSRDA2Z1NqS2pwZmVsdVlqanZmYWlOVEhyTFQxN2JKYmtLUGNCMjBRQU9x?=
 =?utf-8?B?a3UzTXh2MktJcE8vU0svTGtSZ0JVdnYwNmpIczlrOGlDR2UwSjlaRHlYM2h4?=
 =?utf-8?B?SVlyVldOMFd5d2VuRUkvMHdleGNnazFwSXJJY0JkcWZydzJTRGR0QTUwVExw?=
 =?utf-8?B?WnA4eWFjQ0NYaTRUM1VuekltWnFlNEVpUmw5Y3g0QkdBdjVRa0dlcVBrTnM0?=
 =?utf-8?B?MXJYR0YxWkNLTHZhbEtPbW5ZYUdXZCtYcVR0eVVabDlvYmFQbE5oWjhMMnNT?=
 =?utf-8?B?c2dCOWZocU9IWGc2N1UxQW1EblB4S0lPSXBPYjdYZ2hEY01pS1M0WURSUGU4?=
 =?utf-8?B?SksrNGJVN0pkSnpGNXRMbnVUZDVkWUI5RnRNaHRCcHgvUGpNK1h0UHRlOHVH?=
 =?utf-8?B?a090dC9iYkNzYjMyWjZGbFovL09EeXZSOG5ZbFJUMmg5blRQNEtjUm5MR0dt?=
 =?utf-8?B?Qi9zNUtvNmtKWTF6VTRmelR3alZGdm5zMlpOSTB2VUxzOHpHMUE1aXBuZFFJ?=
 =?utf-8?B?WXZNWmZEeXA5UmlLb2NLaHUxRkx5OERzYUQ4dXRiV1R5S2d1K2lxQklmWXB2?=
 =?utf-8?B?eHBhUVVQbVc5Z0wrSkhITDMrc2xuZWVTQWNUMDRSdXBocUtDOHFWUHp1NWVZ?=
 =?utf-8?B?bEpmZTJoa1kvMmMwZXM3Uk9RT25vUGZnZVRFK0pFeGJTV08wUVR2dWFWSnpY?=
 =?utf-8?B?K05xSWh1TE5lTXdOMEs0VXpmd1NTRCtrL2xiWm9PUStROERDaWhTV3draWpK?=
 =?utf-8?B?aUZzRjBvSmFvNU1GRXFsMFNROExrbGczZnhNdzJvMGxQaFBnNk44SG5POSsx?=
 =?utf-8?B?TnR4aW05cURybWRiSGZJU0ZiY2s0bzhZWS9sbi9TUWZwYzhMbE4wTlFHWEMy?=
 =?utf-8?B?bDF3azZ1K2FFUzMwVFhidjIxc2Q1WVRIaktVcmtYL0JSdThYTzdFVmE3Nmph?=
 =?utf-8?B?bDNoM09jNHBkWEUxNnkrc2dhNW9vRHd6Z0hoQWltQTFhalhNZ0VuL0pTY3Bo?=
 =?utf-8?B?c1pjRTRHWU1ZL0xWN29DMUthWU8rWDA1S1dBZ1NmaDV1R0F6RjhPN0JhN04x?=
 =?utf-8?B?VGZpSjZwbzRlcW56YTlsMjFYOFI2bjBXVDhCNmVHbDQ3MGd4cXd2Zit6RWR2?=
 =?utf-8?B?NlcrUFJSTnFtclQ1Vy9SUjdLQWxBZ24yRndscWZJQjNjOUczdkRVcnRZekhN?=
 =?utf-8?B?MDI2WEgrZmhsNzBnMVZJaXRGRVh4QzFaOEdyWE5qV09oVmpLY2NzSTRaZFVw?=
 =?utf-8?B?Ri9NSFBDM3pjWWZESGdZQ0p1RFVsZkdkMlZ0R3FjZ3piWGduTTFZdkdHOGVz?=
 =?utf-8?B?alBnOWNYSHNoZTJlUGhLbjFRc3VQZXQrdVlYZE5qZmNWRi91eVovY2huTWtk?=
 =?utf-8?B?a1Z3V3N4M3hrSTUxWFR5QTVsbzIwTU5DOHZGanBwTmtyVVhjeUNpcklqS3Av?=
 =?utf-8?B?NlhhNUtDL3E3cWR4ZDFFd0RKN0dQU2h4SlQyS3U2aXdGdXAvN0tQcmFmeUlP?=
 =?utf-8?B?Z2hDUVk4cmgvQjhEb1hyQTQxQTdjK1lGRDVVY2pmeTRTMUlrS1k4SE1yL1Ew?=
 =?utf-8?B?bHJNYzF1aVVkVzlRMHVrMTk0Nm9jRmlBVytzSDJJT29tNmErR1JaKzJaaGVu?=
 =?utf-8?B?MVpCRkw0a0FIZ0djMG1EWVVxZ0RUYmk0Z1ZZWDdjci9KenEvUUwwbDg5TmdX?=
 =?utf-8?B?cWhONkUxQkhzUzZZeFdIeVppZFZnRjhONWZqQm43MFU3elpDOHV6ZzdQZVlU?=
 =?utf-8?B?aDlvV3RmclFYeG9wcmRSa3JPK3JTOUhIZGswbzVta2VZaGh2cUpxRFJ3Zm9m?=
 =?utf-8?B?YnNCSGk1azJ3aytpdWFZVEtRL1pYaVBFc2ZnTDJwaHFIay9udjlyUEpwM0JH?=
 =?utf-8?B?alZTbE5PUkR5U2N2VGF2RWxxcGtmNmpPeTdKUjVJdHNYN2JDWCtRc1R0cy9F?=
 =?utf-8?B?UjJ4enpIbHRkNWxIZjh2Y3ZncGpoSlljaDFheDNDK2YxM2hQVXdiYVJtTW5L?=
 =?utf-8?B?VzNPMVpONlVZSzM4aWJPRVZMU1RYVDY3ZDhnaThvUkw2Ty9HYlZUYjhqSHh0?=
 =?utf-8?B?Y0lKenczeXBvTXVGaUdaNys2NWhGdnNrd2tkUCtLRXhWVisxV0FyUnB1Q29z?=
 =?utf-8?B?SUFjYzkwYVNoNWN6dXR5bHZwM2wyc3AzT2d5bW5hdmRIQzVBcXpJdUd2NjFo?=
 =?utf-8?Q?2xggAdr7L9Cyh9RA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A163D7F0EA1E448ABE707A4085000B6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lphMMw+WtQqphS53kerk/pUpmWeR+9meRH2foofcXhaqzYRoEdzpj2zK5kUODUFD7vFS+cmS77hTaPzG3R605IFxP+B1Hf5ldgp0NbgiUrUzJVWRVSakwslAA3jZ+5WzNFFFPupAW0/OKKHith23cP+4YyY6h5un/BuEZsv3CwgiF9vT4mch+ZhN9/nkToMX6IbipGHD9L0e4ilTUwqM/sTyEDWtKL6z07dPelMSlHlNkZ8p1I0eFwdnfVTM8eeJoX30PMTViquio4RyYD87lSgDSPCSbRkJKWc3ZVdevK7djLTfezUyt0sHDrMoQn4z37vaXN+FLfAvyVipDokKcQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a5faa8-c601-48d6-4f9d-08dee4045425
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 13:07:17.5724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZ1NJUNexhGCoWHU9FD0XfGmrepuOViNbOTec9Ogm9747wiQRoQfkeKeXOr582iVw7j8pDlikr7QMffa27yGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA3LTE2IGF0IDE2OjQwIC0wNjAwLCBKb25hdGhhbiBDb3JiZXQgd3JvdGU6
DQo+IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4gd3JpdGVzOg0KPiANCj4g
PiBTaW5jZSBjaGVja19zZWN0aW9ucygpIG5vdyB3YXJucyBpZiBhIGRvY3VtZW50YXRpb24gdGFn
IG1lbWJlciBuYW1lIGlzDQo+ID4gdGhlIHNhbWUgYXMgZGVmaW5lZCBpbiB0aGUgc3RydWN0LCB3
ZSBjYW4gc3VnZ2VzdCBuYW1lcyB0aGUgY2hlY2tlcg0KPiA+IGtub3dzLCBzbyB0aGF0IGl0J3Mg
bW9yZSBvYnZpb3VzIGhvdyB0byBkZWFsIHdpdGggdGhlIHdhcm5pbmcuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogUnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICB0b29scy9saWIvcHl0aG9uL2tkb2Mva2RvY19wYXJzZXIucHkgfCAxMyArKysrKysr
KysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gU28gSSBhbG1vc3QgYXBwbGllZCB0aGlzIHZlcnNpb24gb2YgdGhpcyBwYXRj
aC4gIEZvciBmdXR1cmUgcmVmZXJlbmNlLA0KPiBwbGVhc2U6DQo+IA0KPiAtIFBvc3QgbmV3IHZl
cnNpb25zIHN0YW5kYWxvbmUsIG5vdCBhcyBhIHJlcGx5DQo+IA0KPiAtIERvIG5vdCBpbmNsdWRl
IHZlcnNpb24gaW5mb3JtYXRpb24gaW4gdGhlIGNoYW5nZWxvZyAocHV0IGl0IGJlbG93IHRoZQ0K
PiAgICItLS0iIGxpbmUpDQo+IA0KPiAtIFByb3ZpZGUgYSBtb3JlIGNvaGVyZW50IGNoYW5nZWxv
ZzsgdGhlIG9uZSBhYm92ZSBkb2VzIG5vdCBzYXkgd2hhdCBpcw0KPiAgIGFjdHVhbGx5IGdvaW5n
IG9uIGhlcmUuDQo+IA0KPiAtIENDIHRoZSBtYWludGFpbmVyIChtZSkuDQoNClN1Ym1pdHRlZCBh
IHYzIHdpdGggY2hhbmdlcyBNYXVybyByZXF1ZXN0ZWQsIGZpeGVkIGNoYW5nZWxvZyBhbmQgQ0Mn
ZCwNCmJ1dCBhY2NpZGVudGFsbHkgc2VudCBpdCBhZ2FpbiB3aXRoIEluLVJlcGx5LVRvIHdoaWNo
IEkgaGFkIGluIHRoZQ0KY29tbWFuZCBsYXN0IHRpbWUsIHNvcnJ5IDovDQoNCj4gDQo+IFRoYW5r
cywNCj4gDQo+IGpvbg0KDQpUaGFua3MsIFJ5c3phcmQNCg==
