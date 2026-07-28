Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8B155A5D;
	Tue, 28 Jul 2026 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270253; cv=fail; b=bCUwV9qHBqdWHyhIiL+4eSDi4Q0wqsUwMLXOAVnINOuG0+9cNJNdQAQoB8hqTmzhdI5P2MIrF2vmuzLv/BBMLFkpJfr3u7j7mDdff26xGW5qjRgY8jDvHhmBzYy52G5yh+p5Tq5fKjGQWcVEhbof7m3/AuFGkrc8pQJ2g2F7Bpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270253; c=relaxed/simple;
	bh=9AzxEBoE9wEHY3851JTlo//fKYHrmCL1wqKCbDV9ydo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K5DGeDJtbV5m4fA34wGmBF+E7BmdDv5gZw8MR2Y6xKlFU5Cl+drfVGvSMk5+OUicqhIQvUNiigPmh9daRXonA3WLxUomTZtdlYcKC1IAbO0CZYtRoSyoBWiU/vuRUTuC5t0dpPSsuf575MP8vXl5yyeApZYIvWXjYzkwt0dYxWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl1jO1X1; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl1jO1X1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785270252; x=1816806252;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9AzxEBoE9wEHY3851JTlo//fKYHrmCL1wqKCbDV9ydo=;
  b=Zl1jO1X1V/t7ZwOHQuTGDsgTHTeqZBamv8ZQmGwxmvOzQSOfXOu9Qga9
   qeND4FwkhZW1iZfIlO4Sq1liAoMaOeExsW6HjpmKT9c0ETtEhwK5S6C3m
   L81Ut90gPFIDvl4xCEKm/95WCmJ5XSacFY97jVXwFzqV6egNaItjiJsBk
   6CN8l/GeXi5isd5MeXNK2wVCMu7u28ahMxX42c0FDYlzAVqfQcDYgrAHz
   HYK4mEbb57JAFZwH7oHOoVs/NDCXxgEGlCqR4BqrOUJRp1rHcN2m6AMMH
   iZ0ApUY5fAmcUBNTQyQ51o5bYUOVwiRwRfbg1Cn5DVnYIXksvK5TTzfpJ
   Q==;
X-CSE-ConnectionGUID: T2U6sVSfTvu3a8dXkQr1NA==
X-CSE-MsgGUID: GOjBil8hQNecORrpgSEGyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85909428"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85909428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:24:11 -0700
X-CSE-ConnectionGUID: T7MeOqpWTu6D+NY7yW/+kg==
X-CSE-MsgGUID: tcMXcvT/RnKU+Lfdj2Ar9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="253468958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:24:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 13:24:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 13:24:10 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 13:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNwX5N9N1gSCDaJOl9OObJ3dV4RvSn6LgqrZKUQW89za3zsG4X8Ke0/OYxV4wUEiu6SrQW1dN+4twKHRAqfRKd4P2HztuYmeLi4WHf1/MFHO55TRVMj1nEmc/ObEihWrNN/S+UBeJCyNO/fBiV6i8ozNulNDqk55aBdo7gVZHynR+fz9wpKv7KZtrQ7RlJum9BukxkjpinnGYiRs6SaCirflVO4FuXF2afGoK0FPzfp4/7pwDDRLVN+4JCPvvLSDrAJbUaUFg3rl+qo1aft1m8zQzqD6T4e8dX+W7u9BTaQmqz3bz+OGwpnRyssgU0ttqd6+BZimdpr4ZY5sEHLtGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AzxEBoE9wEHY3851JTlo//fKYHrmCL1wqKCbDV9ydo=;
 b=Z7h97eNlfTkbzLqQwOEpGOvw2A/34TcHMAmFZ8iApYn1kQVpdJ4n1YMQ8bZbx7lsj6d1/VNA22mREFR0zMZUYJXAQgl7oXxO9tu6Q8ezlf7/rfaAkdkTO+MSFpMXD6OayT2r8OMoihFXyP3NUZJOMigY7g4yMOnoaVc5+Y1Uo8/Q6fVA8O56ew3f9Gx2D1tILi1M2a1kfF/fgQ5GkNFPmS7Rk7M8QsUW+bx2iyH6GtwABUF/CAmK4dWzzhziBOO+puX//BOctQuJyT+fOFSl9V/y3RBoxi1QgsY0Ir21WYkdraicnOmk51eauF8HsYVI+hciajfzJFY2NX7Tv5OviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 20:24:03 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 20:24:03 +0000
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
Subject: RE: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Topic: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Index: AQHdFjFEDhWCop0Bz0ujShNoXAdDZraDX04AgAAH5gCAAAC/oIAACCgAgAAA2mA=
Date: Tue, 28 Jul 2026 20:24:03 +0000
Message-ID: <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
In-Reply-To: <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS0PR11MB7408:EE_
x-ms-office365-filtering-correlation-id: 0cb35a12-11d8-4c05-c05d-08deece62ad0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info: Rnnw1cKy48KgqtrKLSsdS6suBsTgyRS15+UaGlmavzK52gac9ogsIlMNDCIixONqpPlSZM3Xz2/67CRZem2cbjMUjUdTE4kHGRGyrQh999grg0mhYMjVosyzwIvM+GoPyNiUD+IaHI7D8nl5Houvo05JNBrTTpC+NdLtM9168kjFIFNVQFiFzzvazfA/PhScKMvyM3W9qndsCjmG8//DBYZ8Amkjh58gqyWVIza49X80O7HwqrLd8CVJcsAQ216yVzhNw/ecFsLPLhmOAx4i9xvH0Y+h+hb9KkGjN+FcKIJU/aVq5QX9V9G7+pFM25h3yRW34qO0UtEDdUKEnPiodsGVFYCjp4DYSZSO/Pfgk1QjFNwdWu0lObUJA58TEKcETgq5a+rQ39dz4GrkrJwgVm5WpS7b3GhwzZbZSmMrRFbhqSNWti3u8dEOZbWkV3P32W8+++7HBDF6qHTCigSZv2AGTD+xwLrOw1oVaYZEahU0IFRsxrOEGZ0w0yNp4YpVdJtkjdqOP9ZttAIWaWWZS7W9cJSe1+KSRMRA7dibajnxHzefKjEmclK/z206R/Ph3sshx0SBdNYIsvAnkJkmxBG9rcocc5PYSDFpRo7zBXtChB7dyffPn785N+cBPU0Q8jUo9yWOwsvVjt0qgbQBNY5874pAyuzLYc3rG9ICWzDBnY6TXDLpHNWSceIrhtHmYvX1E3xDNV1u156uvjnnjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3htWm4ralpLL1pySVBwMWZsRHpiSWQ5QTIrNDlxQ1ZibjQzT25OakIzQjNQ?=
 =?utf-8?B?b0FjeWpnQ2IvQkRKdlVqTElmMkNGdER4TDltQTRBRkE0VzhjbGFrRWdWekdt?=
 =?utf-8?B?a0V2MFhReE02eU92NSs1UXFaLzRtZHRnV2NXdHc4V2FqbzRMR29hK3FPemZD?=
 =?utf-8?B?ekMvdjIvdlRoQktTdWpNbHRWeEJRbWFtMExMYmhCSjQ3VGsrbFlRTE01MUZu?=
 =?utf-8?B?cWlpL2UzU1poWEZOMUU2K3Q4VjFJaFBvSDJYVkZTbjE5TE9ldHZ5L0hMci9M?=
 =?utf-8?B?b0RDL29HNmV5b0RFQ2dBRk1EZmdNNWQveVgzaThFdURUUFZjZkEwZnRMK25F?=
 =?utf-8?B?VlNqRXBNYkRDeVprQW55dDFJazR3QTB0ekJoSnZORS9BV0ZGaHo2Smd0YkNk?=
 =?utf-8?B?ODN0UVJjSzd6a0hSR1p4MVRBU1hxaTFWMzBCbXdSQ2liazJ6enlkT3JlRmZs?=
 =?utf-8?B?RjFvSXNJdGlOQk9ET3A0dHQ5QmdjZnVjRjBGdm01RHBUOXpJdVJUcTN3aFQy?=
 =?utf-8?B?bjlPY1ozYktsOTdHWWozaHZYdUxMTWhWNkl3OHBHbGZ2RWhPS3hKaFdtQ09k?=
 =?utf-8?B?SVVYaHZuV1NQYjJaY3ZWdjM1VGJzQ241K0lFdnM3TmVoVWMvaEV0NzBrbGEz?=
 =?utf-8?B?VzAxKzNjWncxdjcvSDdSYlZnbmptYUNjTTg3T01GdHpzNFNnRUhmZDdFVG5o?=
 =?utf-8?B?aTAvTVJvOC91SE5YL2VCbHhwb0FzZk5ETTZrSjFlNENXeWozOCtPUENUOHpS?=
 =?utf-8?B?QmFGTU82UUU2RzcyOGFLL3p2MkpWdzNldXNtWWNYUzNVRGo1UTQxZ1BmNkcz?=
 =?utf-8?B?UVo2Uk5NRnN0bXNzTS9FdTlYRWJIeHRUZ1N0QjdXVzR1alF6NHprZFZmMTQ0?=
 =?utf-8?B?MFZtKy9JVG9tdHoyeTRBYnlMUE5wT1JOZ3JPT0d6dDZjUmZIUXB5dTJ3MlJQ?=
 =?utf-8?B?V3pNeVRDUWFmamx0TUIwam80dUQxaVh0QUJKWStzUWQ4ekZYTFlwcGU2NVdp?=
 =?utf-8?B?MHMxUXlaUTlSSFlUNm1LRTd5ejg3eTRlbG5nRzlWcTFwb005bnh3bThUUFM0?=
 =?utf-8?B?TUE3TjIwMkJ1TGlaZmtDbGs0WE1hek1lVjd0RUJOR1hWNGpJb0Q3em1zYmFi?=
 =?utf-8?B?aFhiSlhZSEpZR1NUVFoyb3ZXZytCd21EaTYwaC9wRlR5WWU1dmllZWxNN054?=
 =?utf-8?B?K1NoRWgrUlVzYXFnZHd4L3BzSXlIeUpEV240K2lGeW1XQ1d0M0ZMdzZ5RnFE?=
 =?utf-8?B?MEIxblphOS9PUDJNVTV4NnZwR3hiVUlXQ1ptaTFIdWRURDcvTHRUajFiNnBE?=
 =?utf-8?B?MmN4ZGRIMlZUZ1RWbFJiaVZrZ0c3OVZKQWdQUlQrLzZmWkc4RFRCZGV5TWpK?=
 =?utf-8?B?ZUlXYUtGbGxiQWp5MDFubnVXR2c2RkRKZW5jMWppMEEvTnVrYTlqaDBGSm9U?=
 =?utf-8?B?RjA4ZlUzRGphamV2QjlpNDIyTE5jbTJxaTgxdGZuclBhaTA5VjdjQ1k4SUFD?=
 =?utf-8?B?RXVydzZVVDA1emE4eHB1MURYV2t6cEZOMFluRy84Y3Rmci9CaXhRUGc4V2Vk?=
 =?utf-8?B?cUxNQkJ4VnJpSHhZTHRJYTNKbXAyaTE5WTNHY09VVE00SEJNK1piUmlXTjVY?=
 =?utf-8?B?dlA4S0d4RFR1Qm1BamI3MVBBSzQ4dHZ0WklaRDlERDhYTERxWUVxaXh5TXNO?=
 =?utf-8?B?bURwanV3bCtKSFJjY3BJSFZrQ2hQVEJYaC9uNUJVSEw2U3U0aWpGNWo5L0F3?=
 =?utf-8?B?T1MrQ3pMczROOVMrQk5rUzF3V3ZBbDZUTWczQnBrQ1VmTXBCRW0vNkVNR0VI?=
 =?utf-8?B?OG1KMm15dDBuQlNUdFoyQStRSm94VitjNTIxelJIUGZRVlMyRkswbTI3cnR4?=
 =?utf-8?B?ellMbERuVHVORnVpMEpKOGg4WmJkKzl6SCtUb2tYUlY5YjFxQ1hSaS9ZbWFv?=
 =?utf-8?B?bjBFNXh2emNDMkRRdVJmb3cxV3E0T0JZdEVFYzZlNHVRS2E2MWlnMzVhdVRH?=
 =?utf-8?B?NG1uU0V5N2cra3NNbUIwQVJEMGpocnFYUG9VbmEzMnI1b0EwOWM3WWE2S3RY?=
 =?utf-8?B?YkRKSDlISXg0ZWFnd09jZExPZVlrNXpCbjVmZmJ4SnI3R1Vja0x1L3BZOTQx?=
 =?utf-8?B?NzBDU2pWVjZ3Z2diWUo3NkZpTU9ZNzhHL3JiZjhTVEsyQWo5aDBJdEZhOFBO?=
 =?utf-8?B?d1ZZSmtORStwdnpJSGdLYWw5aktYSUJyUlEwYTBlUVptMHZNT1c3Mmc1U2JH?=
 =?utf-8?B?ZFBnWS9VQmROSmMrcCt6MEx6ekxoOFRFek1LZ3VNV2x6bWR3d0JpZWRXTm9V?=
 =?utf-8?Q?pS7etSU1qQxgIIUm2u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IkL2X4VbXqGEVUtBACTZhm30JlHEd8z5pB/Q4O1gfRsTnGNzrL4DKBlTqeVS8XRxQxUIUOPw0XemFdTLt/qDoMYNylWR0Hdjg8SQneuEeJw2tFoAsVhObf4No668rqXvSFjxKGWsNOqySP6Nm0/wJiZBE623y+0ZIC2uwavt3TWKABq4f91964Pp14NduCHsj8CqqfjAg4grH1JY6xemvQezuGsSLp4khmu7dlttGfDUMiufur/+e6j9gFIEGXr/XpNM3+7Ic4gH8KaQbRaPLbB9FmN8aLgSu3U3L41sSjWoVZT39lf6aIXaDcL+5V/ksqjdQLnRv5uNHdIvLyPtXA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb35a12-11d8-4c05-c05d-08deece62ad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 20:24:03.7820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPFZd3DLYfW+xg9voSIrB78er5sPOFG1eUSFnLxYfSDqutNmG4kWe/G8xp0WqIN+7z8DaCOz8f6XjN9nonNGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7408
X-OriginatorOrg: intel.com

PiA+IDEpIERvZXMgaXQgc3RhcnQgb3ZlciBmcm9tIHplcm8/DQo+ID4gICAgIFNlZW1zIGEgc2Fu
ZSBvcHRpb24uDQo+ID4gMikgT3IgZG9lcyB0aGUgbW9uaXRvciBncm91cCBzZWUgd2hhdGV2ZXIg
dGhlIGNvdW50ZXIgd2FzIGF0DQo+ID4gd2hlbiBiZWluZyB1c2VkIGJ5IHNvbWUgb3RoZXIgZ3Jv
dXA/DQo+ID4gICAgIFNlZW1zIGxlc3Mgc2FuZS4NCj4NCj4gQXMgcGVyIHRoaXMgY29kZSwgaXQg
c2hvdWxkIHN0YXJ0IG92ZXIgZnJvbSAwLg0KPg0KPiAgIH0gZWxzZSBpZiAocmV0ID09IC1FSU5W
QUwpIHsNCj4gICAgICAgICAgICAgICAgICBhbSA9IGdldF9hcmNoX21ibV9zdGF0ZShod19kb20s
IHJtaWQsIGV2ZW50aWQpOw0KPiAgICAgICAgICAgICAgICAgIGlmIChhbSkNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGFtLT5wcmV2X21zciA9IDA7DQo+ICAgICAgICAgIH0NCg0KTm9wZS4g
SWYgeW91IHdhbnQgdGhlIHZhbHVlIHJlcG9ydGVkIHRvIHRoZSB1c2VyIHRvIHN0YXJ0IG92ZXIg
ZnJvbSB6ZXJvLA0KdGhlbiBwcmV2X21zciBzaG91bGQgYmUgc2V0IHRvIHRoZSBjdXJyZW50IHZh
bHVlIG9mIHRoZSBjb3VudGVyLiBUaGF0DQp3b3VsZCBtYWtlIHRoZSBuZXh0IHJlYWQgc3RhcnQg
ZnJvbSB6ZXJvLg0KDQotVG9ueQ0K
