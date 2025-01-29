Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8951818A6DF;
	Wed, 29 Jan 2025 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738143775; cv=fail; b=klFyQixC8NRFlksIEFgnHOLdwJnN9Sp0ZPNwK5tdS0zM5AJiTX/SuWRqH02LZ4wYvgpvewqcvn6Gp1Pqjb4bHe1RBj4ZRGAjoEk9EtK2sbuI6FSRSCL2MDOhR4MAEMlZbQv6dEgSIzWH1tCn9QR1YL2xLnDv8D/a85drqEhq2G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738143775; c=relaxed/simple;
	bh=Hnolp5b85e3e2H4SAY7Cz0X1GJx13OsAI8TDSkLtabU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f4s13hQ88/w3TsqFgTwNdK7QQI4+wVWDr+XIb2NvYd2mDN2QFHNYbJGPitNXDgeHrdu2tqrlONJryhwNufaIImdkq6Cmb69fVC3qiKplTAXALcMzgbhniDEy9dpdjdTHtIpti13Smezq7UYkac7hBLsJy+uH1pc2z4JpjcwasAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cr/ZyGtS; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cr/ZyGtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738143771; x=1769679771;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Hnolp5b85e3e2H4SAY7Cz0X1GJx13OsAI8TDSkLtabU=;
  b=cr/ZyGtSCJWn1H5NNpwDLNGwNiE8skH/fOi4RbP0DTKSKa9XnBAT/vUe
   8VxOKjPuzgG/HAB6QRhBBkD0wG+7vSZVeSpEccddb1Njn0ZtmwLrwlhaU
   neNIGeffTgt13S8TY4GE2oWHltDFvaYy6QTIY47u83rfSeQFnXn9iJ04h
   Cz5TC07Fh6a5Fn0g1lI1vF559Y/maCVvMzmlionjXvTFUWVkR3k/XwEyS
   kk7T+Ml/AfwmiREDl35M9dl4cvZJ+zZts96IXZ/qBCT6WvXdd2OEdJKqM
   ii10UrEmMcaaBDqAzo64J3M87ERAfUnwRmjR/y8fFEdcLj1tmAoRn6IUj
   w==;
X-CSE-ConnectionGUID: 6mJFwS2FSce+IuQ+dNnCBw==
X-CSE-MsgGUID: LwrCi6rMRJqgTBq674DkfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="64011372"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="64011372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 01:30:42 -0800
X-CSE-ConnectionGUID: Qcf1E8FnRO2Vyx3s5z3h8g==
X-CSE-MsgGUID: Woij/L6ORlichrv53yGrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113965621"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Jan 2025 01:30:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 01:30:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 01:30:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 01:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIrkxKR4TRBF/U5Z69Xol/RmMZV51D0ctLzmhwDqcxQAc2uwxCSUfjHBNJJRDdzTv5kkm+Z3b9OaBhV985gmgt6zgROT1vkM6H2rUmHrIMW2wJYC2vOswIgII0dWkAcMe/1fWPlICVj95cJlDSO4e7d/1a/4Fg3e0/OEw2AHTwNQ//0dQor0ABsNHNGcaMVV02sjM894RqwYUEJD+J3ALpJwqMhqUCFnW1WfP5wDCVw7t9nrIRQw7tUw/oOtZNV9Dv0ksBNb+izv2o2AyFpl6adsTIo0FFDpnLu9aRH0w1gkc8ATjGL4KdcUgSlmo4nurrs27zvXUu2Hygp/5O1mow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj4IDoMQDaKuRiJ52beRKKzusBhr0oW3igGovkNfaFU=;
 b=CGCK2CbQt9zZS08xBFHKwSYF3sIS5lBg563lCv04xCv6X8fo9GWyuEPcORn9/CcCVsh2EdTVbzG4bFme6NrA47a3xqkhVzLI5INXths8BF0UPIljwUzCDdWbtGJIjrjETpyEkyMTkC0krxRJcLFeBtrLAyUTLr1CcJ1ZT6xNs4GApDOq0q8c8nyGlAlgTFW0QgBztSzq8RuHZ8T+PgtD9qwH1pZa8y/oly4gY3W9H1sdRfljpMPbjqgvIHWHSKVnEwn52tH0ged92RRa90B4ABc2mMPMUA+S/PyRbpQSWiSfRvqYkZ46ah1EjvUycVEjV2hEjQgqw+u6+2VOd/EXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 09:30:10 +0000
Received: from PH7PR11MB5862.namprd11.prod.outlook.com
 ([fe80::7d59:aa70:2555:e6fd]) by PH7PR11MB5862.namprd11.prod.outlook.com
 ([fe80::7d59:aa70:2555:e6fd%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 09:30:10 +0000
From: "Mohan, Subramanian" <subramanian.mohan@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "greg@kroah.com"
	<greg@kroah.com>, "corbet@lwn.net" <corbet@lwn.net>, "Hall, Christopher S"
	<christopher.s.hall@intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"Dong, Eddie" <eddie.dong@intel.com>, "N, Pandith" <pandith.n@intel.com>, "T
 R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>, "Zage, David"
	<david.zage@intel.com>, "Chinnadurai, Srinivasan"
	<srinivasan.chinnadurai@intel.com>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>, "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
	"giometti@enneenne.com" <giometti@enneenne.com>
Subject: RE: [PATCH v2 1/1] pps: retrieve generator specific data from
 framework
Thread-Topic: [PATCH v2 1/1] pps: retrieve generator specific data from
 framework
Thread-Index: AQHbcY90+zSmFnorO0iL8FfHuBZAw7MtUfQAgAAIwdA=
Date: Wed, 29 Jan 2025 09:30:10 +0000
Message-ID: <PH7PR11MB5862283EF5540BBF7BF0C853F7EE2@PH7PR11MB5862.namprd11.prod.outlook.com>
References: <20250128141743.52031-1-subramanian.mohan@intel.com>
 <Z5nQeAFx3UlI9hxE@smile.fi.intel.com>
In-Reply-To: <Z5nQeAFx3UlI9hxE@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5862:EE_|CY8PR11MB7292:EE_
x-ms-office365-filtering-correlation-id: adac0876-b4de-4c73-8254-08dd404786d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?p3fLiC9oXZXfuhEly2GW63bafZRHuRaZbOF7vlRfei5fFhbawhn7W1xs81sI?=
 =?us-ascii?Q?KdjQba1HpJDDbWGwAZ2l4bpvkmU9V7vr25FDqtd4nT6bgjCJOKBOva4Hksqd?=
 =?us-ascii?Q?lElU7IzCZU7CppceT75/fByj5JNQah7kXfCPxSkByWZBsTlx/0QHLl7CetjO?=
 =?us-ascii?Q?9cskfz2Af0QgamDQ2oVJPy/uUw8ppgy0zuxC+VSIiyCoBSaUCcM6C8dBHws3?=
 =?us-ascii?Q?wnsWPJ05ZRCiFmkmj98OaQekdtvxwXmvIHZSsl4AvZ5od0zf+onpRfDkZqQ4?=
 =?us-ascii?Q?9k7eg6YuGImBkPGdeQcN5h9kKjzDYfA1lB3mkgK8HzH+cGMk+tbcsesFJiv7?=
 =?us-ascii?Q?fWMwSXIb9mgsG0i549tDcWhSMFyIq9GXoLOqqKGVhBTFFEXYzNh06YLojprI?=
 =?us-ascii?Q?FUDFvrunpc9+ueq6toHR7heMURtZjF+CSbGWLIF8YpiY00gGWzBCWHvk4KAk?=
 =?us-ascii?Q?7Ca12vNOBkk7JRBObVq+Ch0sTvsBJiexF8bRlLQOvQRsa8UIM44W74yBZmGB?=
 =?us-ascii?Q?OyiRBk4UI+umTV6vywgYEC4ioR3WVtmaWGaBWSJX0BsazbAWMce5qTrh/EKB?=
 =?us-ascii?Q?LPJ4hbt/T1jZG90u5ZG8ZIB/X1G/5vvpW6gUWOYlK/aDdd1H2a1SUt66GwUf?=
 =?us-ascii?Q?J3uegfC2FGB5w2PkWIhuZ8OwTEwpshEvyc2sJn9lL63ssSbiY/OhLJ0dN2AU?=
 =?us-ascii?Q?W4sLYyOoLMrEI6vqswoxXz1yF8jWfDhngCVl/FFmL22PNk4lNKlFEyDLbq70?=
 =?us-ascii?Q?LWJDsMO+lNSmqURfMpzIIYvmmMiQ2QlYO6WbBar9F/7yOCzJVJlbfIHsMBDy?=
 =?us-ascii?Q?yD84jFJdArXjI3RVtn37xX7EzqRv77QFU9CoRqLkhJ3BXw5wEt7dbgzZHZ/J?=
 =?us-ascii?Q?z3gP+caSL9p1rCgO0Il2BRKLM7nPrA3FNA/tKXniLZmQs3POuxU5CgqZNeWu?=
 =?us-ascii?Q?O9lQr9siFPrhwlgPviOJFEteXgsvlIeMXtB0dYGFJ10tWif37+SNEOTpg+Ck?=
 =?us-ascii?Q?0ri23ro6T/EzSOuhg7VnII0uhWTGlrzZ3umCy3v16RBHX5dqmgVNQ05Zo60t?=
 =?us-ascii?Q?94P/J0Px7gHxcAcL38riH3hl5mgaH5wZsFyvSclxvPbshlLBLNwrifxW98J2?=
 =?us-ascii?Q?iSmSQWANJx0X1HCoMKTOjGu3Os6hW2r5uWCxTEfPtHb64a+vOWIYTWLREAjn?=
 =?us-ascii?Q?Ql3S6odUCi1xv42vDrOyNbUwYrhLf3CQTxxzFp3uy1FNDlkv43UJYMKg38sX?=
 =?us-ascii?Q?48MqLRAkpX60Sd7ctWJ+cqExi9dfy0uyLDbvth+U9jCf0QGoKZ/6ihSuiVu/?=
 =?us-ascii?Q?hwzb5Y65VPmqFhlxmOXSbssFL4ywewVqaLsynISyRyQejEH96YXasOzTWFyq?=
 =?us-ascii?Q?I44NmJ7zjkeo/5ZNNmH84hqb6sAbmbJHL/DiiBg/dp6Ond76icJC1dS9x6LO?=
 =?us-ascii?Q?DvAb8LgFTMLduDlCVurAbg5Bdw/x5hT7?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5862.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9J1nfHdiGMZVQ5CpBxqY9GkIZuAKLlsMjNGWPrbOgJA8xZhzPjQ3w46g6tV5?=
 =?us-ascii?Q?ZW6a5GwUpSlUTqldgKuyHYP4Tvpz+KqaDcB4rnaphswnyuYOykIb1fCNo1hk?=
 =?us-ascii?Q?RgOBVy1Qk+FEZp5RkKlgYB2ut9duyrqXbWSalz7mhgbsq+DXm2rfylqBn1oS?=
 =?us-ascii?Q?aydDdPy22Z90WIY0tmQ1RufJRliG122CAJM46R51Y5SaVCA+K+A6NbMjDn01?=
 =?us-ascii?Q?7OEtcjsx7WHLHhmWxo83dijWRHFab32EPK+GIhcPmisUFRM+oaQj5wHC5nVa?=
 =?us-ascii?Q?ogbNJc5CX+mMINNZGugRfMwOXoBFiQYo2xSKh6WSCciZhUAyNc9NzJBkPKIS?=
 =?us-ascii?Q?2lH37CqM23Lj6ItHTrOTgo3OS+CAmlBlm9vBADNFlGtO2mZ2SPRYx93lxt83?=
 =?us-ascii?Q?8lLRcw9DhAGjtKfI5+hlo3huVUsG5W5HQBAP/PXbH4VJjo3U5fgUfqKDdUaA?=
 =?us-ascii?Q?7VH9VqJ3oKWvDrGU5k//cxxuUcMva5TCXiLDUEtINULv4Wenu4MQc4abhoR9?=
 =?us-ascii?Q?cC4HO0lYqCgyD7MpKgQUYKpQw9V03xekPalzHAUInCfNt7TmM0eYEuOktQOi?=
 =?us-ascii?Q?9WsTwS4gbE8Yff/Qcx2zTSsBqzqhGrHfHCOtFfnGS30O+hGrOEdoAmOyeTmG?=
 =?us-ascii?Q?qLmDPVNDbn3jdw9pCjReJqdyOdEuv/1VOY6f/WLjwe3x6gPKMzzkBD5fk0gD?=
 =?us-ascii?Q?kovUCs542/cXGlss1lg8Ye05jP+EqlzYKe/t+x9ySbGvzB5DwkEDEemeS3RC?=
 =?us-ascii?Q?SWg9hnS4Dg5aeVTlSGEcx4um7Dqv/co4fLQBK8JiTK3inPpZzHaSOgssbyrX?=
 =?us-ascii?Q?+kS30Bq5RFrWRq2Gt5SGXtWtTqfWQei/9J41iCz16mYcP1wCPgvq5wHHUjMG?=
 =?us-ascii?Q?lRbA2IQk3kJkbVe0Qaauz+16Y4W5tcnEeGTknDWLYm8OecXEXpHITNxPHyhX?=
 =?us-ascii?Q?MpihBTExzxGxRTVlQfpKzO1/9GX41bw+JSA09SSdvhIxgv0Wp09tN2xpEnq3?=
 =?us-ascii?Q?l4nZ3eL0hdgulpydSeyHYe52HSorYDe1OkU/iufypglNpwRNvGr+5R+xoPS/?=
 =?us-ascii?Q?OngJ0BQwoAiBHDBwW1KrvgqGXdD3CVvtuZkRonAUx82bK0DJ9vDQ1lKz/bun?=
 =?us-ascii?Q?eMY8I1kDJDnvYiHCE6JlB4etoNLyq4wd6+OM2I1ddieDL/h4S80r1AoZWwli?=
 =?us-ascii?Q?1u5mNtfrzdxMpMTedADkFWmniY329i0fPA0C7YdIbdvOLzWxy3a1DRbjB2yH?=
 =?us-ascii?Q?PDgYNTNHCWbxyclt3/w6hDsmpmj/vX/bWsZP7q6Qz37jTR/QjE8MX8nmZ2iG?=
 =?us-ascii?Q?qImMCTBaI8QzV1FnLqil+gdmFQuuN7vFeJd/z5dztUFCqMsvvGJiUyo7uahD?=
 =?us-ascii?Q?gdzGMIGpm4TPym+CdvMENrbAFNuUtE/JsiPQ+Eq3tvRV3VD/rNGOZVUZhe+r?=
 =?us-ascii?Q?xYgumwYqYGRo4EkrfbEVvFPK1StvBFQNULJ8vWFIOEsj5M3PWyZWT4gJE8/T?=
 =?us-ascii?Q?0e8121Q5pWX8WFnD4uySJBCWDaTSkjyAfj3kTcGxQCqnpcYzU85u22s/N2mm?=
 =?us-ascii?Q?kSgfXvZKCCXmBDjqNxAyfldjbp5zyGMDrCAWP9Ks?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adac0876-b4de-4c73-8254-08dd404786d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 09:30:10.5373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cez6mnXJuQuTtdNq3k9fbqPawYrid9slGuQvcbQfKUVOf9n+CnNR6SiPaCrJnywlqcY1ByClguteR+7dkzay/0U0IOu1U/Ld7D9VRmfyf7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
X-OriginatorOrg: intel.com

HI Andy,=20

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Wednesday, January 29, 2025 12:24 PM
> To: Mohan, Subramanian <subramanian.mohan@intel.com>
> Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; akpm@linux-
> foundation.org; greg@kroah.com; corbet@lwn.net; Hall, Christopher S
> <christopher.s.hall@intel.com>; tglx@linutronix.de; Dong, Eddie
> <eddie.dong@intel.com>; N, Pandith <pandith.n@intel.com>; T R, Thejesh
> Reddy <thejesh.reddy.t.r@intel.com>; Zage, David <david.zage@intel.com>;
> Chinnadurai, Srinivasan <srinivasan.chinnadurai@intel.com>;
> rdunlap@infradead.org; bagasdotme@gmail.com; giometti@enneenne.com
> Subject: Re: [PATCH v2 1/1] pps: retrieve generator specific data from
> framework
>=20
> On Tue, Jan 28, 2025 at 07:47:43PM +0530, subramanian.mohan@intel.com
> wrote:
> > From: Subramanian Mohan <subramanian.mohan@intel.com>
> >
> > While adapting pps generator driver(tio generator as an example)to the
> > new generator framework, As part of driver registration the
> > pps_gen_device pointer is returned from framework. Due to which there
> > is difficulty in getting generator driver data back in enable
> > function. we won't be able to use container_of macro as it results in
> > static assert. we might end up
>=20
> container_of()
>=20
> Can you be more specific, what exactly happens?
Let me provide some more info:

/* PPS Gen  Device  main struct*/
struct pps_gen_device {
	struct pps_gen_source_info info;	/* PSS generator info */
	bool enabled;				/* PSS generator status */
	......
	/* More members */
}

/* TIO struct */

struct pps_tio {
	struct pps_gen_source_info pps_tio_source_info;
	struct pps_gen_device *pps_gen;
	struct hrtimer timer;
	struct device *dev;
	spinlock_t lock;
	........
	/* More members */
};

Once the framework registration is done in probe function through pps_gen_r=
egister_source we get back=20
pps_gen pointer and stored in our struct pps_tio.

As part of enable function:
We are trying to get back pps_tio (parent structure) with the help of pps_g=
en  as this is pointer container_of does not work here.
Hence proposed add a new  generic  private pointer inside the  pps_gen_sour=
ce_info structure which is exposed to driver.

static int pps_tio_enable(struct pps_gen_device *pps_gen, bool enable)
{
    /* Trying to get back pps_tio struct is not possible as pps_gen is a  p=
ointer in structure */
     container_of(pps_gen, struct pps_tio, pps_gen);

}

Compilation Error:
In file included from ./include/linux/bitfield.h:10,
                 from drivers/pps/generators/pps_gen_tio.c:8:
drivers/pps/generators/pps_gen_tio.c: In function 'pps_tio_gen_enable':
./include/linux/build_bug.h:78:41: error: static assertion failed: "pointer=
 type mismatch in container_of()"
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                         ^~~~~~~~~~~~~~
./include/linux/build_bug.h:77:34: note: in expansion of macro '__static_as=
sert'
   77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS_=
_, #expr)
      |                                  ^~~~~~~~~~~~~~~
./include/linux/container_of.h:20:2: note: in expansion of macro 'static_as=
sert'
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
drivers/pps/generators/pps_gen_tio.c:172:24: note: in expansion of macro 'c=
ontainer_of'
  172 |  struct pps_tio *tio =3D container_of(pps_gen,struct pps_tio, pps_g=
en);

>=20
> > in using static pointer. To avoid the same and get back the generator
> > driver data back we are proposing generic approach to add drv_prv_data
> > pointer inside the struct pps_gen_source_info.
>=20
> > Example TIO structure wrapped with pps_gen_device and usage.
> >
> > struct pps_tio {
> > 	/* Framework Related * /
> > 	struct pps_gen_source_info pps_tio_source_info
> > 	struct pps_gen_device *pps_gen;
>=20
> > };
>=20
> > static int pps_tio_enable(struct pps_gen_device *pps_gen, bool enable)
> > {
> >
> >     /* Getting TIO data back */
> >     /* Note: drv_prv_data will be initialized in our init routine */
> >     struct pps_tio *tio =3D pps_gen->info.drv_prv_data;
>=20
> So, what's wrong with the container_of() against pps_gen->info?
> We have tons of code in the kernel that does it.

We are trying to get our TIO/struct pps_tio structure back using pps_gen po=
inter..

>=20
> >     /* Access tio members here to set some of the parameters */
> >
> >     return 0;
> > }
>=20
> Okay, looking into the implementation I see what's the issue (but it does=
n't
> mean that commit message is good here, you still need to explain better w=
hy
> you can't get the correct address).

Ok, Something like this:

"Adding new generic private pointer to the struct pps_gen_source_info which=
 can help in saving the parent driver data.
 In the existing adaption using container_of with a pointer to fetch the pa=
rent driver data/address is not possible"

"Example as shown above can be given as reference"

>=20
> The problem is that info is got fully copied. Perhaps we should rely on t=
he fact
> that it always be provided? I dunno any data structure that defines callb=
acks
> and other "info" material should be considered as temporary storage (on
> stack), it makes not much sense.

We are trying to get our TIO/struct pps_tio structure back using pps_gen po=
inter..

>=20
> ...
>=20
> > V1 -> V2:
> >     * Updated reviewers.
>=20
> Please, use...
>=20
> > Signed-off-by: Subramanian Mohan <subramanian.mohan@intel.com>
> > ---
>=20
> ...this place for the comments and changelogs.

Ok Will take care in next version.

>=20
> ...
>=20
> > +	void *drv_prv_data;
>=20
> If really needed we should probably use a better name, like "private".

Ok, will change the member name to private.

Thanks,
Subbu

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

