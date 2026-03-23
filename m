Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C230DEB5;
	Mon, 23 Mar 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264519; cv=fail; b=QL9O3YR0txLDZjtzoEuwe+5+0bHFC7fPuph3sXPNdGrnYK7gOOiY2v3vQf8DRVoqsVabfyl6ljmyLAXr1SbHgaJVWcoDOYcss6e65aXcfxCKw4jcLbEwWSHsgmv7PBzxVq3OBOn84A2ijtksdBILDc6cv0n7kIAu+eYD9W5TstQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264519; c=relaxed/simple;
	bh=AA5iQpGa7G8pqR3N1ipSxhh5BaZ18ADkesm6gqII7q8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nrgTjgsdJlUhUB5ia0yJV+6OAlQFbsorscrmtAfz7hUG2iL6T5RO5PYKpWJwhhIWTusE6ZoRMW5GDpusXMc0kOJO28kFEx+AH4tVw9hpMqn495cnGChCoGOW7SrV/qjU8WdYZ6mgA4SMfwZP6ssPXkCuKEjRP1FpUidcvBMHqgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtRxHZo/; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtRxHZo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774264516; x=1805800516;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AA5iQpGa7G8pqR3N1ipSxhh5BaZ18ADkesm6gqII7q8=;
  b=YtRxHZo/nI6tg/tCWDfs4iHmehsmO4SnThyJoM4xwNWIkkCZU5V72oUV
   tXelS1wz7VD1iQ+bnP1TyaUPOfwDNJfjTLIsrba8XheWcNn70zbnT56wJ
   7FkA+xbVyMOmVtHdpG9cKvhpLq4CkPP4NZ04WVxPxqx/C/v+kfNIycpFp
   0CeHxfA9w5RMJOhV8FgM16whtvtlrrXKhgMbYAnAYJyQAPKR5CmnAS11V
   92zH/0eGNlZSzFXhjK8VIG0pqX/rQLYtEXZYEWWUFRdjso4kinyUyMw2Y
   G9W7RB193lb2G3b/QcY9H068pGaA9qCVsvv4hjuxLwEKlHkHdliGXRal+
   w==;
X-CSE-ConnectionGUID: 7ZO8vcB/SUi94c/HROi1vg==
X-CSE-MsgGUID: wp6x8cgxT4mMahdkzBNKng==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75379392"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75379392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:15:16 -0700
X-CSE-ConnectionGUID: 9eEwhV2/QyOg+a39oxTyeg==
X-CSE-MsgGUID: 0Uww6ZK8Q0SxDQOqKaFlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228920095"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:15:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 04:15:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 04:15:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 04:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msgMEe+1INBl+BxX+RfMw9iFTcCdUJTdAbmmPOMdYduObvtLDYsYHposJntJolQWVfBosMIFEV6OR0CilyC4Y41cukjRd4IhINkjeOnRyBXeY3gomZ8nTOEGowlor+G/+sC1Sqeeezj0jeFkOeVI/ZgHmv9ZHLlDVgvhk/QtSAH1X+kpsoM167y9rD0ngxMFefeLrwqQVCB3Pe3fU5/adnMqDTwgLLqVo4tVoscglYl8FusK2uDA4HfcH/Qg4/w+Mfj9uOuLbHh+oZAkPVgA09d23xL2FPWGVqCOq9ZGk6LxdAoCv3f2FPf1kJvjNFCqLD9/NrklbGbqsRyMaWCgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AA5iQpGa7G8pqR3N1ipSxhh5BaZ18ADkesm6gqII7q8=;
 b=TcEyPaJ2+nRnMpBc4OG7V3RjsBdjE+ul8WhYHaIamrrfKRldwxaxIpdr4vlHsy5m/h7CR3eLppuEGZsqayq/JeBpQMDz8XmB52k0O+Sz0QUoLO3LWJhJgOfUyv5ebNVQ5HR92X8NfdWX5xpQs9mJJHrWy0q6Ga1kMkiBNFZh6HOkL4ZNQmEAHjlsNtQpUrKHVI/eoYv6aBKM8Ujpe5Q4wOfQWEVZx+gTJepM/xvuREw9dwlrNwHQ54ieTMFzvZiuDrT7XrGfmiL0RqDOwJS2k5g+nRry3a2cuj5LerlvioLXIueFk+gpEhw8JfdX0YnSjVaIBRehO4/zXB3ojbDnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 11:15:07 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 11:15:07 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>
Subject: RE: [PATCH 07/10] docs: kdoc: better handle source when producing
 YAML output
Thread-Topic: [PATCH 07/10] docs: kdoc: better handle source when producing
 YAML output
Thread-Index: AQHcuqT/+iao1GRfyEyEUoJ0vLEaQbW78e2g
Date: Mon, 23 Mar 2026 11:15:07 +0000
Message-ID: <IA3PR11MB8986894467FCB9CA96243F40E54BA@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
 <77902dafabb5c3250486aa2dc1568d5fafa95c5b.1774256269.git.mchehab+huawei@kernel.org>
In-Reply-To: <77902dafabb5c3250486aa2dc1568d5fafa95c5b.1774256269.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|BL3PR11MB6338:EE_
x-ms-office365-filtering-correlation-id: cfb2e180-a0cf-4376-1542-08de88cd7084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: dRqiK9bJun8iPROEi5mZfujPvFwOMLfwoPi/ZyYwcpLk1Rsmkx1twu4FEPE82JXvwJ2yajUD4Fuy/CzdVU2Tx2+9QGjevs6Cr2aOu3denCZvUbHmd4m07yrSPQn728oiHLV98DmwRUlxp4j/eJ/rZtiTHcvXMEgv6gQEUo5kCl6K148uTvHE5pA8mvCexiPJHQ7YcClFWvjbDEIEy2v8exX7d3FNjn6izxuzi9NEsZYQV52JK0EI4rpnhE3EkcxpDxcAvGMfb1eZRFCT0pkpt20rUx6EoISykbRx/SjanbBF7802DZjFB8QAI5DjRiTKJTq7j9asHGbGE2h7jwOJqBD6n7BLpkOGAgHxQqNvq5UT/yhwshABXCX18XNHhewy9ziPlJ38dy9oeccG9RvMxg0Ym/DUKPmz9uFJUgLvGUwJ9b3nIT9BGEX3q0NwshzaviSr6V/89PYUTbqjwf4p3BSqHbu7+FlLSMyKV8glI+BVAxMkcTyfJMILZWCRPyCELOnk0lFHK7LXzS5eJDnRRZhmc9d7lY9vuzFm5OfVblyTWnuVYtaaRY5OR+YqsYvtO4iMFsfz4oQy/VjzvSvhS1ZOnlFulY+1InWABYMjOy4J0LL7eIH+fKbmLD+w8boRpOenfehV14Qw4Hpb9BJmV6MgZ8jhVmbptk+QKNr3VeK7tLRuYF2QnOYP9JcFyhlmpjjMG5w2eRe1U+Us/KkF7kysn1LqNfGOjbN5kMSDk7VXfUFtiWh4Laxmsqdr/FnuQQEEe/y2UoPvS3JclBOJD8GjXPe3/mZFBrXk7xgJlhE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFhJc25ybTlKUXFpQytGK1g1NVBNUkxYZ1VqbG1rSU5HUHY1T0hiOWpLYkhQ?=
 =?utf-8?B?cFJMQkVHRXR2T2ZkUERIS3M5bHVmOFVudkl5UFhXZzFFT3lkUWh2WTlHU2M1?=
 =?utf-8?B?b2dhL0Jpb3RidGswMGIwaHlpRkJYZktvTlFsTjR3WkUydmMzNTRWQ0JNcEJT?=
 =?utf-8?B?N09HY3hORHNFbzROUXlKMXpGd0JpRHU3Z1V4WVNKVWJNdmZhL2t2TTAzLzFU?=
 =?utf-8?B?VHd6T25INGtwR2tYVU5hMTF1bFRQd3VXYmJzYzcxMXFuaWxkSFBjWi96cDB0?=
 =?utf-8?B?OEpFd3BxYjBrZFhtcEQ0U1M1UjVvdUZaL1B6TDJMWkJpNHpDOE5qdlFtK2lF?=
 =?utf-8?B?eFZGZ1NWT0o4UHhmc3VpY2UyakdrWEY0YWZROTluNUwzaS85RmZvTWRBQitj?=
 =?utf-8?B?b2s2RWNiblBKejQrbUx4b0ZDdGpqQzZmUFZCbC9FYUVSc0dpcVc3MGRBNGc0?=
 =?utf-8?B?SVRHYVpYdXJsZ0Y3SktCRFhaNGNVWnl1Z2d1Tm5wY2lyWVE3a3RDTG54NFE3?=
 =?utf-8?B?SFdTcW9oUU0rWWNVNjRJVEgzZHZCR0RycUhEanNDUU1lNnBqQVdZaHJraWdo?=
 =?utf-8?B?QXUzNVp6Nm1nMmUyNWZoUkg0ejFRSVJ0Y2FKZmlkWVFnNFoxcldveVBZNCtD?=
 =?utf-8?B?eFp2SkFvcWtJWG5kbGpxTEVXUjJzSnUxSjFETWJXNm40MHBzV3R0UWM3NUsx?=
 =?utf-8?B?UmRYVE5uajFaalR2MTdxdjZlWDFWdXppYmtWYWtjSlN4bGVxeUM4L092cTd4?=
 =?utf-8?B?RURwcndobDAxbnlYbmg3UFhaUGgxQlAwQzYySHY3L2JrNWZPZDdScUVvV0o5?=
 =?utf-8?B?dGRYZEU4WkE0V1N1V0N5d2hPSklIdDVGaVk2WEVNM1pzR2JlempDOVlMblEv?=
 =?utf-8?B?QkdaSEpWTUFzMjZVUnNVVTBjS2NSTWtJb1pLT1NXdEpuL3JLRUdNODRkQ2hG?=
 =?utf-8?B?cVRyTlZBcXJMVVh3RFNoZGt3d2NoRHRpclNjZU92c3VZY1hzb1JEZWRYV1Zl?=
 =?utf-8?B?bFVVcGJVbnlsZStGeDRTdGJLODNpZ09Nd3QxT0d1ckF5NFB5S2h6TGFtZkVM?=
 =?utf-8?B?QkhFRVFwWHBuWGlSNXg3SlIrdTRYS0RuaXBmQ3h2L0lZMTVJRmlRRE1jY1pp?=
 =?utf-8?B?bURyMlp5Uk9rVmpYRmdsMGJNN3NpazlFdkpONkdQNWlmVDlXZ283VkV6Yjhz?=
 =?utf-8?B?OXNNenRrZG5EVXR5eTZtMVZRVVdvT2c0RjhRZjZPMk9BQlFxdWpRZFpobWRF?=
 =?utf-8?B?ZjkremN6N2h1MjBvaHkvWFJVcnc2RTZEdjV1R0FRZjFSbkRRT1g4ZFJXblY2?=
 =?utf-8?B?UjlkMmZ3UFpWaFpqQTVGTmhzRjdZSlVGOS9HazBQVUtSNkxBVzJ6cmhsL0lJ?=
 =?utf-8?B?S3p3SVJ5cjQ1dlQ5UkhzSkxLa2NSdllxSWlTR01YWVdaOTdMTHpnTmp1NFB5?=
 =?utf-8?B?V2FqSzNoc3oxMHN2QUo3RFNHU3cyVFoxd21YeWFKamdJOXQzWkRMbGF1dGdz?=
 =?utf-8?B?bTFqZHdtVVA5cmU2djlOaTZxU1crcW9XbXZ3OHRhN0EyOCtRaUtHeDgraWp1?=
 =?utf-8?B?bUlnOVk2eGNydWlKN3dwQkc5dS8vMnVFRUo3UGc4NXVlNHQ4bWFXTkpkK1ZH?=
 =?utf-8?B?cG1UdEdXaWJqbWhkRCtVSUl3QjJXOWhJTXFHNjJFZXhhYzdXUXVHdzZHNXpB?=
 =?utf-8?B?WS9qSmVQUDRmWXVzc28vMU44UDBnVWNJeDY1MDJ0aEtQRXlFV2wyWU9ocW1p?=
 =?utf-8?B?K2kzK0Zmd1FHdndDZ0Z1cmdDMktQeUUwVDEvcU9XUFY3dUQ0Um0wVVMwUUNn?=
 =?utf-8?B?bVZZYkQ5WDdJbUZaTlZnb0NWY3RWRHRqd0RsZVdGMU91UUMwQ1c4VlBuUUw5?=
 =?utf-8?B?ZmRzZDhIWmZRMXd5Z0k4Ylo0V0JvN0pFdldOU29pVTVVd2I0VUhVN1kyMjJn?=
 =?utf-8?B?SFM5S0VoV0RJZTlMWHBscW91MVRHdm1OOWp0NDcrS2ZwT2JxT0NEMXlHVWZo?=
 =?utf-8?B?TmFnNVVWdGFCSHBOd2RqSC9PZ0drTVEza0lEaUZWZytldnhTQzh3YVh3N2FM?=
 =?utf-8?B?ZXcxZUs1QUJ3dGdMc01PSWM4RmVCbDFuU3plSEFXMUlJVGcxOVY2S2NwVDVt?=
 =?utf-8?B?L1VMVTRxb0ZWdWtVQ2k4eU0yOW9PR0ViZXMwams1Vy9hcGY1bWJFWSt4MEZP?=
 =?utf-8?B?eGY5enZxMm5KWEY5czh4Uy9tcGpiZFRRWGZ3VWVEYTZMQXVoL1Q3SE1pdkxl?=
 =?utf-8?B?c1BrdlBseldocU1yMU0wUU90NTQ5RlN0MEpFcE1RTUNRL3RPL1FqeXZvVWxp?=
 =?utf-8?B?N0JMZ1dXZ210UHZPWE8raVBIUXErRjNHVXV0ajlXMDB1Y1pSN1lrY1lCM2FX?=
 =?utf-8?Q?8TtEgVeVDoRBLxAI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oqGmJrIqULgHZwRKd0TFeMQX/xXR1zbKIPowewl8olEPVG8+ljgE9Tto3TY4oQflRYyZfZLtKi16q3opq9DdY9RA+mJYWSsZMtzLQjnas7mv7Cnjlr6yT+Wpw0XbosVdXFuMjdc6G1mneWQX3JeJfppGZT2poMYAMSqYiR164YdzNLXmkmVqr72jy7vn65du8XGfuhtinHD61BtiuBofj3yMWvV9oskBXa5W/KLPR97vuBIn9gjLt6sOHijl9zzsPU7uCyjMQYCWuaWwAJcqs/HVenLc7UAU7t0GWpWcSzqT47KAnQnfW5xoayVxianvajuC43/MoZo+Zpvm8+sBWw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb2e180-a0cf-4376-1542-08de88cd7084
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 11:15:07.0495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LE9NN9bcUHLoB2zT0PEz/VQbRD+QekRIjjS5HNrp84cGWaKU7+ZV2LHZsSNoGLM2mvNQ33gfSI1x1t9E5KvUsvhiff6PO2opr5+43od3wSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIE1hcmNo
IDIzLCAyMDI2IDEwOjExIEFNDQo+IFRvOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0
PjsgTGludXggRG9jIE1haWxpbmcgTGlzdCA8bGludXgtDQo+IGRvY0B2Z2VyLmtlcm5lbC5vcmc+
OyBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4NCj4gQ2M6IE1hdXJv
IENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZz47IGxpbnV4LQ0KPiBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBMb2t0aW9ub3YsIEFsZWtzYW5kcg0KPiA8YWxla3NhbmRy
Lmxva3Rpb25vdkBpbnRlbC5jb20+OyBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz4NCj4gU3ViamVjdDogW1BBVENIIDA3LzEwXSBkb2NzOiBrZG9jOiBiZXR0ZXIgaGFuZGxlIHNv
dXJjZSB3aGVuIHByb2R1Y2luZw0KPiBZQU1MIG91dHB1dA0KPiANCj4gVGhlIGN1cnJlbnQgbG9n
aWMgd2FzIHN0b3Jpbmcgc3ltYm9scyBzb3VyY2UgY29kZSBvbiBhIGxpc3QsIG5vdA0KPiBsaW5r
ZWQgdG8gdGhlIGFjdHVhbCBLZG9jSXRlbS4gV2hpbGUgdGhpcyB3b3JrcyBmaW5lIHdoZW4ga2Vy
bmVsLWRvYw0KPiBtYXJrdXBzIGFyZSBPSywgb24gcGxhY2VzIHdoZXJlIHRoZXJlIGlzIGEgIi8q
KiINCj4gd2l0aG91dCBhIHZhbGlkIGtlcm5lbC1kb2MgbWFya3VwLCBpdCBlbmRzIHRoYXQgdGhl
IDE6MSBtYXRjaCBiZXR3ZWVuDQo+IHNvdXJjZSBjb2RlIGFuZCBLZG9jSXRlbSBkb2Vzbid0IGhh
cHBlbiwgY2F1c2luZyBwcm9ibGVtcyB0byBnZW5lcmF0ZQ0KPiB0aGUgWUFNTCBvdXRwdXQuDQo+
IA0KPiBGaXggaXQgYnkgc3RvcmluZyB0aGUgc291cmNlIGNvZGUgZGlyZWN0bHkgaW50byB0aGUg
S2RvY0l0ZW0NCj4gc3RydWN0dXJlLg0KPiANCj4gVGhpcyBzaG91bGRuJ3QgYWZmZWN0IHBlcmZv
cm1hbmNlIG9yIG1lbW9yeSBmb290cHJpbnQsIGV4Y2VwdCB3aGVuIC0tDQo+IHlhbWwgb3B0aW9u
IGlzIHVzZWQuDQo+IA0KPiBXaGlsZSBoZXJlLCBhZGQgYSBfX3JlcHJfXygpIGZ1bmN0aW9uIGZv
ciBLZG9jSXRlbSwgYXMgaXQgaGVscHMNCj4gZGVidWdnaW5nIGl0Lg0KPiANCg0KTm90IHN1cmUs
IGRvIHdlIG5lZWQgRml4ZXM6IHRhZywgd2hhdCBkbyB5b3UgdGhpbms/DQoNCj4gU2lnbmVkLW9m
Zi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnPg0K
PiAtLS0NCj4gIHRvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX2ZpbGVzLnB5ICAgICB8ICAgOCAr
LQ0KPiAgdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfaXRlbS5weSAgICAgIHwgICA2ICstDQo+
ICB0b29scy9saWIvcHl0aG9uL2tkb2Mva2RvY19wYXJzZXIucHkgICAgfCAxMDAgKysrKysrKysr
KysrLS0tLS0tLS0tLS0NCj4gLQ0KPiAgdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfeWFtbF9m
aWxlLnB5IHwgIDI4ICsrKy0tLS0NCj4gIHRvb2xzL3VuaXR0ZXN0cy90ZXN0X2tkb2NfcGFyc2Vy
LnB5ICAgICB8ICAgOSArKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwg
NzIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGliL3B5dGhvbi9rZG9j
L2tkb2NfZmlsZXMucHkNCj4gYi90b29scy9saWIvcHl0aG9uL2tkb2Mva2RvY19maWxlcy5weQ0K
PiBpbmRleCA1YTI5OWVkNDRkNjIuLjI0MjhjZmM0ZTg0MyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMv
bGliL3B5dGhvbi9rZG9jL2tkb2NfZmlsZXMucHkNCj4gKysrIGIvdG9vbHMvbGliL3B5dGhvbi9r
ZG9jL2tkb2NfZmlsZXMucHkNCj4gQEAgLTIwMywxMCArMjAzLDYgQEAgY2xhc3MgS2VybmVsRmls
ZXMoKToNCj4gDQo+ICAgICAgICAgIHNlbGYucmVzdWx0c1tmbmFtZV0gPSBlbnRyaWVzDQo+IA0K
DQouLi4NCg0KPiAgICAgICAgICAgICAgc2VsZi5yZXNldF9zdGF0ZShsbikNCj4gDQo+ICAgICAg
ICAgIGVsaWYgZG9jX2NvbnRlbnQuc2VhcmNoKGxpbmUpOg0KPiBAQCAtMTU5NiwxNSArMTYwNiw2
IEBAIGNsYXNzIEtlcm5lbERvYzoNCj4gICAgICAgICAgc3RhdGUuRE9DQkxPQ0s6CQkJcHJvY2Vz
c19kb2NibG9jaywNCj4gICAgICAgICAgfQ0KPiANCj4gLSAgICBkZWYgZ2V0X3NvdXJjZShzZWxm
KToNCj4gLSAgICAgICAgIiIiDQo+IC0gICAgICAgIFJldHVybiB0aGUgZmlsZSBjb250ZW50IG9m
IHRoZSBsaW5lcyBoYW5kbGVkIGJ5IGtlcm5lbC1kb2MgYXQNCj4gdGhlDQo+IC0gICAgICAgIGxh
dGVzdCBwYXJzZV9rZG9jKCkgcnVuLg0KPiAtDQo+IC0gICAgICAgIFJldHVybnMgbm9uZSBpZiBL
ZXJuZWxEb2MoKSB3YXMgbm90IGluaXRpYWxpemVkIHdpdGgNCj4gc3RvcmVfc3JjLA0KPiAtICAg
ICAgICAiIiINCj4gLSAgICAgICAgcmV0dXJuIHNlbGYuc291cmNlDQo+IC0NCj4gICAgICBkZWYg
cGFyc2Vfa2RvYyhzZWxmKToNCj4gICAgICAgICAgIiIiDQo+ICAgICAgICAgIE9wZW4gYW5kIHBy
b2Nlc3MgZWFjaCBsaW5lIG9mIGEgQyBzb3VyY2UgZmlsZS4NCj4gQEAgLTE2MTgsOCArMTYxOSw4
IEBAIGNsYXNzIEtlcm5lbERvYzoNCj4gICAgICAgICAgcHJldiA9ICIiDQo+ICAgICAgICAgIHBy
ZXZfbG4gPSBOb25lDQo+ICAgICAgICAgIGV4cG9ydF90YWJsZSA9IHNldCgpDQo+IC0gICAgICAg
IHNlbGYuc291cmNlID0gW10NCj4gICAgICAgICAgc2VsZi5zdGF0ZSA9IHN0YXRlLk5PUk1BTA0K
PiArICAgICAgICBzb3VyY2UgPSAiIg0KPiANCj4gICAgICAgICAgdHJ5Og0KPiAgICAgICAgICAg
ICAgd2l0aCBvcGVuKHNlbGYuZm5hbWUsICJyIiwgZW5jb2Rpbmc9InV0ZjgiLCBAQCAtMTY0Niw3
DQo+ICsxNjQ3LDExIEBAIGNsYXNzIEtlcm5lbERvYzoNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxuLCBzdGF0ZS5uYW1lW3NlbGYuc3RhdGVdLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGluZSkNCj4gDQo+IC0gICAg
ICAgICAgICAgICAgICAgIHByZXZfc3RhdGUgPSBzZWxmLnN0YXRlDQo+ICsgICAgICAgICAgICAg
ICAgICAgIGlmIHNlbGYuc3RvcmVfc3JjOg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgaWYg
c291cmNlIGFuZCBzZWxmLnN0YXRlID09IHN0YXRlLk5PUk1BTDoNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzb3VyY2UgPSAiIg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgZWxp
ZiBzZWxmLnN0YXRlICE9IHN0YXRlLk5PUk1BTDoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzb3VyY2UgKz0gbGluZSArICJcbiINCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICMg
VGhpcyBpcyBhbiBvcHRpbWl6YXRpb24gb3ZlciB0aGUgb3JpZ2luYWwNCj4gc2NyaXB0Lg0KPiAg
ICAgICAgICAgICAgICAgICAgICAjIFRoZXJlLCB3aGVuIGV4cG9ydF9maWxlIHdhcyB1c2VkIGZv
ciB0aGUgc2FtZQ0KPiBmaWxlLCBAQCAtMTY1NSwxNiArMTY2MCwxMSBAQCBjbGFzcyBLZXJuZWxE
b2M6DQo+ICAgICAgICAgICAgICAgICAgICAgICMNCj4gICAgICAgICAgICAgICAgICAgICAgaWYg
KHNlbGYuc3RhdGUgIT0gc3RhdGUuTk9STUFMKSBvciBcDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIG5vdCBzZWxmLnByb2Nlc3NfZXhwb3J0KGV4cG9ydF90YWJsZSwgbGluZSk6DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBwcmV2X3N0YXRlID0gc2VsZi5zdGF0ZQ0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIyBIYW5kIHRoaXMgbGluZSB0byB0aGUgYXBwcm9wcmlhdGUgc3RhdGUN
Cj4gaGFuZGxlcg0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5zdGF0ZV9hY3Rpb25z
W3NlbGYuc3RhdGVdKHNlbGYsIGxuLA0KPiBsaW5lKQ0KPiAtDQo+IC0gICAgICAgICAgICAgICAg
ICAgIGlmIHNlbGYuc3RvcmVfc3JjIGFuZCBwcmV2X3N0YXRlICE9IHNlbGYuc3RhdGUgb3INCj4g
c2VsZi5zdGF0ZSAhPSBzdGF0ZS5OT1JNQUw6DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICBp
ZiBzZWxmLnN0YXRlID09IHN0YXRlLk5BTUU6DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIyBBICIvKioiIHdhcyBkZXRlY3RlZC4gQWRkIGEgbmV3IHNvdXJjZQ0KPiBlbGVtZW50DQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5zb3VyY2UuYXBwZW5kKHsibG4iOiBs
biwgImRhdGEiOg0KPiBsaW5lICsgIlxuIn0pDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICBl
bHNlOg0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgQXBwZW5kIHRvIHRoZSBleGlz
dGluZyBvbmUNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZWxmLnNvdXJjZVstMV1b
ImRhdGEiXSArPSBsaW5lICsgIlxuIg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5z
dGF0ZV9hY3Rpb25zW3NlbGYuc3RhdGVdKHNlbGYsIGxuLA0KPiBsaW5lLCBzb3VyY2UpDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICBpZiBwcmV2X3N0YXRlID09IHN0YXRlLk5PUk1BTCBhbmQg
c2VsZi5zdGF0ZQ0KPiAhPSBzdGF0ZS5OT1JNQUw6DQoNCkl0IGxvb2tzIHRoaXMgYmxvY2sgaXMg
bm90IGd1YXJkZWQgYnkgYGlmIHNlbGYuc3RvcmVfc3JjYCwNCmFuZCBldmVuIHdoZW4gc3RvcmVf
c3JjPUZhbHNlIChpLmUuLCAtLXlhbWwgd2FzIE5PVCBwYXNzZWQpDQoNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzb3VyY2UgKz0gbGluZSArICJcbiINCkl0IHBvcHVsYXRlcyBgc291
cmNlYCB1bmNvbmRpdGlvbmFsbHkgcmVnYXJkbGVzcyBvZiAtLXlhbWwuDQpJc24ndCBpdD8NCg0K
DQo+IA0KPiAgICAgICAgICAgICAgc2VsZi5lbWl0X3VudXNlZF93YXJuaW5ncygpDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfeWFtbF9maWxlLnB5DQo+IGIv
dG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfeWFtbF9maWxlLnB5DQo+IGluZGV4IDE4NzM3YWJi
MTE3Ni4uMWUyYWU3YzU5ZDcwIDEwMDY0NA0KPiAtLS0gYS90b29scy9saWIvcHl0aG9uL2tkb2Mv
a2RvY195YW1sX2ZpbGUucHkNCj4gKysrIGIvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfeWFt
bF9maWxlLnB5DQo+IEBAIC04NSw3ICs4NSw3IEBAIGNsYXNzIEtEb2NUZXN0RmlsZSgpOg0KPiAN
Cj4gICAgICAgICAgcmV0dXJuIGQNCj4gDQoNCi4uLg0KDQo+ICAgICAgICAgICAgICAgICAgICAg
IHJlc3VsdCA9IGNsZWFuX3doaXRlc3BjKGRba2V5XSwgcmVsYXhfd2hpdGVzcGFjZSkNCj4gICAg
ICAgICAgICAgICAgICAgICAgdmFsdWUgPSBjbGVhbl93aGl0ZXNwYyh2YWx1ZSwgcmVsYXhfd2hp
dGVzcGFjZSkNCj4gDQo+IC0tDQo+IDIuNTMuMA0KDQo=
