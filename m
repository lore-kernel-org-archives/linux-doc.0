Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127BE431484;
	Fri, 31 Jul 2026 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509146; cv=fail; b=CeWZHBYR2b8gTPl21NZjhdeV+SkTaq/W/SvRL5ITo7Tw/nhQekh437/uBajjOKHtP2yr8sM7J9xnFXnxmfQGmy8DEcNw0jhgyqnRhyPrzLThYOB4xDnnolXEpAuFoOj/m+Z+kr8caVIvMB6webldJYiKYEByrz6KnQAhIyVWuig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509146; c=relaxed/simple;
	bh=PoYvs9rHnAuRYHQ8EiKVCb3mtwbe622Hfh9R5odYQ7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dtf7bpDWEVOIojmNFyXy8gDhWm/SegJSSCaIg+tFoHO0xn72fygzkkOJICtZyZptQnDieI0LcO3V9bG69FfCDgTFzzG8O6Ia2id+maOy6EP5l38UVdLKcqHCBywaTJiBWODEwlsGgHDfHQSgHeeK5a647IiMIvD71R+9E4+97fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWMWZFk7; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWMWZFk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785509144; x=1817045144;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PoYvs9rHnAuRYHQ8EiKVCb3mtwbe622Hfh9R5odYQ7Y=;
  b=OWMWZFk7X8DJstCeQGoOuNfyZphWf3pA31dOhBy5gbpQIjOnnLy010nN
   Llf7wEqg0Do+fyPIdy8UfSG3gZKCdc0ehPcReis+BjIKk/lNpzkMFqU3p
   zIyMpxtQ12bMxDF8q+CeybmcZJ5wzmXyQoVGHFAgL3U3uBxtzW4DHoZ1A
   1ZcvXtSSEB0CmW7THHpTg0Yua+xqpps7rqwJ+d1AxZxfr1ZC/QDN+qhrK
   q7yQ2rv4tbQjNJwOwU4CocgIASGq2/GMk+nAo0kG0zqwpphx5cwI6+Za7
   T9nY7bmdbWeWFrOtu6LFzpTpxrrsTgNtWyExgtXZp5N6Ifg/Lv5lZk+d5
   Q==;
X-CSE-ConnectionGUID: /Qmm/UYCQXSVdA1FwyqpGg==
X-CSE-MsgGUID: UA4gWkcJQ0a61qKa7Y3dvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89814903"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="89814903"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:45:44 -0700
X-CSE-ConnectionGUID: MzXBHiVpQFi1+a7bkd24rQ==
X-CSE-MsgGUID: MYt0kwjbSHmu5KpOAuQKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="290537833"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:45:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 07:45:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 07:45:43 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 07:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P87IBPwgIHcMGLelCqCjjIRp+u35655fiPWNB+sB1+fl2PO58BFv91i6qxZO2DwYiv5RTx6lXZxu3DOCjHPxds/92ZLZm2T6Y893popkEfPj2m4eDtD4IDmqr28/8rXDEDbwApUqMnPML94h/o2gcQD75Kj+hroFzyQOhS1b4Y65F3S+6WWkwOf4Ds9QFSDTuU1umQfdyPu4KeMrnGTb1nnHe6RxEzEC4Weo0d+vI84Eg5MYTR7TZXepUtH08z+eyVr3NoBzHZKk/nnAGK3NdKRyJcHSBEy8sgTOUV6H5gHn4Al8QiCHdI5SE2/wHy4+Ir6+RJ4dvaA9WJxPZwpLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoYvs9rHnAuRYHQ8EiKVCb3mtwbe622Hfh9R5odYQ7Y=;
 b=IC1b2vzP79pPJBoBdlx278aTPcPpu0HphuTop1DR7g28FlkmxEyPnjAVoredWbBRX+yufRuzaR/0IBdBXdhfgW++BVDt4Or3KpgXh6+c2wOuL7sWtR/tCjOxSH6sYv0Ioo7YUrHlIhCcKi8dJn5p9mhAhswi63wIwSfA39QBx7WrDFACV/KuGKhatSIp3EfXVgFm5C4D7hNPZ/wHK0Snrd76xXSQdyPT6dmVppBCbHPkXjm+ZpSkvvC8WnQq2uRJvMigbEQeKJQxc2vEca7urX73+6uvKr1vg9geCE0jvMGb4AfkUFEbv1BS5gxIESFazC4g9HcemuY79d5CPn7Grw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by DS7PR11MB7858.namprd11.prod.outlook.com (2603:10b6:8:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 14:45:38 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 14:45:38 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "akiyks@gmail.com" <akiyks@gmail.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "Lin, Shuicheng"
	<shuicheng.lin@intel.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jani.nikula@linux.intel.com"
	<jani.nikula@linux.intel.com>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>
Subject: Re: [PATCH v3] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Topic: [PATCH v3] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Index: AQHdIJtsBYniYn1mfEKX/ehj0UpGZraHtUcA
Date: Fri, 31 Jul 2026 14:45:38 +0000
Message-ID: <261314bf888b1e9c36878702beeee5b9295d149a.camel@intel.com>
References: <20260717125753.634550-1-ryszard.knop@intel.com>
	 <22a9276d-c103-4306-a617-7f34abcd5c29@gmail.com>
In-Reply-To: <22a9276d-c103-4306-a617-7f34abcd5c29@gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|DS7PR11MB7858:EE_
x-ms-office365-filtering-correlation-id: f343eb54-c235-44d2-3f75-08deef12634c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|4143699003|11063799006|6133799003|10067099003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: dltq8XA0xfxB8MP2CtK9meKGxyV8cttL6WrMBa73wJYO75dYAFFFUdalBvO68Q2xYQcPBKOz2lMg5kNKHOUNAJ3eJBjWOHb2pu5EOPsEyMCHZD2KPXuigZzJa+BqGysm/WwcSiK7bPjDC3/bP4VmiWghDnmKcbepguDrb10tvhGLcir7d5DD0K4HaktAWtq+hun9rYHc0ggexVzwz9X1YqM8fXf7IUuk11IzNs3OKPj0k2opvEjW7yXnYoPfvUbI7drXkXuRGcNP2V6BP0mDnAq+XQfH/J4V1op2y5+iemBNdlQj9tbT/VnZj5Gr/0EHcjQGr0N/N1PqmHxekj910cirpoK00mvaQjEPREejnrapc90I1HpuzlAAMJMZ7kKrpYwnwWqyBFkrEHCaDQEm1bB7B7gJ8rTU6x4f0PpBEPokx4MAZ4vuYgLBi+Fj5utrFlwq6goD74wYPlsAnLTBO+06yMFtsyhCGR2v6zP6jiGN0SReUvH/eTDUhGT2N37mFIgkzuUHHYxozkPVZAn2RlclCRa/ObPxZrIiPPWEDjRsqCZz2Ds8tD5JP3HoqlQQcu17ks6wGmTNOmm8IsD/Kjigk/a0iRB5JKTfnanRbFdpeVUU5byG3ouyo4YqpRi+S6FCqOAoO1iU0PqHIz7YfTtYiuwFu+oGLSiQRp+ZGEsF66xdHK4Z/jNFAYfSKtCfl1bxYoJu7zkvpzL9yQDzkbz27jmnsdrGrzhYOn1Defg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5663.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlVCcHlNclBCQUhldFhlWHdQczRDTVpXcWxYcytUV0NVSUZ0MkZyZVoxNDcv?=
 =?utf-8?B?ZnBZdGlYT3paTkZpbGJ5aDlFenpZeHk5S3M1VHRjcWViQlB1bGxTM2VSM09W?=
 =?utf-8?B?TCtZcUIzZzF2cXl1K0tLamxXbE1ta2NJTVBJMVRYZGlVYk85ZzdsNWhUamlQ?=
 =?utf-8?B?T1BicWlNYmVKNlhqTlZzenk3ZzQwMGs0MUZNcHBnLzkwYmFXaEFJQmdJZ1lP?=
 =?utf-8?B?Uk9BZm1OeEJ4cXhTRjVTd0RkV0ZENEVkWU9uMStPV2tTMGZzU2R4U3g5aTRh?=
 =?utf-8?B?NDErSDdpaGlZemZ2VTRORnJnQmJkeStNQ2N0TnlML1A1ZUFZZ0RDUWhOZzJa?=
 =?utf-8?B?Y21PNGxNRTlnMGIyMlUxTk93eXNQVXJ4YkNsc0NaaktRd1FaN1o3UDI1QmlG?=
 =?utf-8?B?cElkS1VYcUlLQmhHVDUxMWZ6ejhyOFN2L0FsN1lpaDA1NDdOMjdUOUl3OE1h?=
 =?utf-8?B?U0NvRG5PRzZSbDJkYkZzRENNN0R0QVJOUVIybU5zUVJ0YUhxckFaUDcwbmxv?=
 =?utf-8?B?aXdqWFhrd2M4ZDdFK0hVMFh3bXBSQUtwclVEQkVQU0NvbUJHWDl2NW5EVWtD?=
 =?utf-8?B?QjJPM3NhRXlaSDZtMjRFMVJKK1RFc1oxM29ra1cvWmVlVnpFbmRYZFFlNk13?=
 =?utf-8?B?WHFDZnIvbWUweFFtbVRDS2VMK25rdEROZzBHTmN5TU92eDE5a2JnQjdjelAv?=
 =?utf-8?B?WGRieHgxRXgzOVNoOVJzLzVLaHZVUFZmbSt5NHMwZ0xtRzQvN1kwamovckhD?=
 =?utf-8?B?TE9vblNCQk9vOG41cHN1eHNvQUh3Yk9WLy9tdUdwTnZKWkRVT2d3S0puVVdZ?=
 =?utf-8?B?ek8xdE9qSzJzN3RER1VEdkhobG5iRnhrM1FQOVNMZWJJNUl2bkswbFNDODdL?=
 =?utf-8?B?QnFKMTIwVEdOT3R0eDF0OTY3MHVOWUxMT3ltS3JrdncrWWV0bEhrRy9tcE5q?=
 =?utf-8?B?V3N2SmRpTGY3N2ZtYmRKUGI0WmNCVC9ydVBPRmNDZXpycURUdWs5UXVPaXNX?=
 =?utf-8?B?ZVNhcExraGYvTWlRQkF5anQxSVZNV3l3WDZkOWRsR0ZYc3ZlNjVSUVcrYVN6?=
 =?utf-8?B?M3FMeGNINWt1c1p3NlBjc3oyWWZXZ3pIK3RuRENld3VCeUlkQXlNSmo3eU9l?=
 =?utf-8?B?SjdqNC80TzlXUmJLWFBDaWRqNFlCWWtERDdNZWhEUTVNcW00SFFza0p3amFQ?=
 =?utf-8?B?R3NJZ0NXcTBBb3FmdE5MSkpOZEVqTmJSNXpzc0x4ZnFsczlZSkFyU3RWVVd5?=
 =?utf-8?B?Znh1WEZWajBDZHZDRmpPZ2JiZk50ZW1FbG11RDQ2cWxvcmJtU0ZyRE00aThN?=
 =?utf-8?B?TGRMay84TnFDV04vYkRraVFnYm5SckFuZ3IzdUt2L3RKaWRucVhMdXQ5SUg5?=
 =?utf-8?B?QUhFVnE0MllqQUxFc1dnaVI0WUNlNTczMkppRlFWdTNDR1dxaEIyUU1CZHRm?=
 =?utf-8?B?a0luZkl1TWo4YVM3TldxWGF2aXVjR0ptNmFmQVVYa3EvWURSYzc3UERnUU1H?=
 =?utf-8?B?RysxMjJvcjNDMFlxc1dhbXdUTE9uekV2eDliZ2YrOGNqUmZqQ1dWMXZROUhL?=
 =?utf-8?B?WjR2Yk16b3ZMN1Q5NlJBR1ZIZ1M0cm1qR1RqNDVGL0paRGZHaUgxM1BGUnhG?=
 =?utf-8?B?TThWcXBnMUVGdm5aWEVkbmtteStMNzNTYU5ZYnhKOTJVUEl0Y3diZ1RBaXZa?=
 =?utf-8?B?OEFjQlFnTDQxcTFOTTNBVVlldmhxbDJJRi8xTTdQMlhQTzMzOUdMUW5qd25V?=
 =?utf-8?B?UVU2c3hlSzZJUkU4K281NnVnbmZSbUhNOXUwNW9qL0ZuL2NvT0lSL24ya2o0?=
 =?utf-8?B?aGhrOUFIZElWcEVpb0drM0kwUnFsMW01YmtOS2sxdTBzQzJ1L2QycE9TZEVa?=
 =?utf-8?B?QmZOQ1crUmVkUy9CZ3ltUTZMYUxqY1RSeDlHakEyNVBORXBJaU9mMUkwbTVW?=
 =?utf-8?B?YlF4SEFkbUtObTBabEhuQmgwaDIyM2RkRVB1Yk9wOWRsN0ZvNE5FTTlIVnRG?=
 =?utf-8?B?c1A1R2UzSUNUZzgra0lMR2pzQ0pwKzhuVnVhZ1B4UWxwUjFBRDJCLzUxRlNq?=
 =?utf-8?B?T2lKTU40ZjlreDR0S2N4T1RKNUcvVWZZSVYxUVlaZkVBczQxNjFIMlhLaGRh?=
 =?utf-8?B?bFI5NTc4R3A1MWNRbm10cDhmMFVKSm5kNXhUcWVNbXViR0lIdTF1Y2pCWS90?=
 =?utf-8?B?eGY4V1JZUExzTzBpVit4RzdzZVNFUGlLYU4rSVZ3SVdtR2YxUnlwdnJmU1JO?=
 =?utf-8?B?bnB6aHMxbDN5VFBPdit5TXptSDJiUVFqVmFBeDJOTnFBSjFoN1NkSEI3VW40?=
 =?utf-8?B?VE9CTHZtYWZmWVZCekdMUExqajBGWUNiU05pY2NuUjRCeE9udXRwWXlYZkFy?=
 =?utf-8?Q?HpSVOfpRedxr2WnY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B53AE6EE1ADA34E8F54E028E0539B42@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GXCa8KbihRqLUV2WqtGyHY9KQChEX6UfaBuE2Uk2gZXfluskqAes0oA6rNoLsREnBtkitZzJsXtBygN9CytzRQ5ErTHd8Lv4O/3b8rqr71t7gxsfCOhOUyfNuUlxeh6dAYhXbc1wBppiHhoEBeR3dy00/NLcbrylD72bo9SpR8ZZiiL4v4vOLFADOWvPC86OALBRbWHT+id1/ynpffklsOb7tLH3Kf3OFvOy6YKlp1hQzegMjS2Rq9HCnK8C/889qFnizQDt1qX07pySkhDnMmrAF23Vvt8OG/zju0lPRzOZLS+UtTLYHenTrkDZIunuezQIBaEYIgNPaPXfUh6hmw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f343eb54-c235-44d2-3f75-08deef12634c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 14:45:38.7411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBphwxahRX5Fz1oeINlLgx4w1JpPjeNMJcarMwEvNByzZz9GDDu7qV7XM82BXamxhP+LYfaRtViszOgPh+eVrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7858
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTA3LTMxIGF0IDEyOjE5ICswOTAwLCBBa2lyYSBZb2tvc2F3YSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBEYWlseSBsaW51eC1uZXh0IGRvY3VtZW50YXRpb24gYnVpbGQgYXQgaHR0
cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9uZXh0Lw0KPiBoYXMgc3RvcHBlZCB3b3JraW5n
IHNpbmNlIEp1bHkgMjMuDQo+IA0KPiBJbiBteSBiaXNlY3Rpb24gdXNpbmcgYSBkZWJpYW4gYm9v
a3dvcm0gY29udGFpbmVyIChweXRob24gMy4xMS4yICsNCj4gc3BoaW54IDUuMy4wKSwgdGhpcyBw
YXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCBkNzc1ODM4NGNjYjQNCj4gKCJzY3JpcHRzL2tlcm5l
bC1kb2M6IFN1Z2dlc3QgcG9zc2libGUgbmFtZXMgZm9yIGV4Y2VzcyBkZXNjcmlwdGlvbnMiKSwN
Cj4gaXMgYmxhbWVkIGFzIHRoZSBmaXJzdCBiYWQgY29tbWl0LiAgUmV2ZXJ0aW5nIGl0IHJlc29s
dmVzIHRoZSBidWlsZA0KPiBlcnJvci4NCg0KWWVhaCwgbXkgZmF1bHQgOiggU3VibWl0dGVkICJz
Y3JpcHRzL2tlcm5lbC1kb2M6IEZpeCBrZG9jIGZvciBQeXRob24NCjMuOS0zLjExIiB3aXRoIGEg
YnVnZml4IGFuZCB0ZXN0ZWQgaXQgYnk6DQoNCnV2IHJ1biAtLXB5dGhvbiAzLjkgLS13aXRoIHNw
aGlueCxweXlhbWwgbWFrZSBodG1sZG9jcw0KDQo+IEVycm9yIG1lc3NhZ2UgZnJvbSAibWFrZSBo
dG1sZG9jcyIgbG9va3MgbGlrZSB0aGlzOg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gRXhjZXB0aW9uIG9jY3VycmVkOg0K
PiAgIEZpbGUgIi9saW51eC90b29scy9saWIvcHl0aG9uL2tkb2Mva2RvY19maWxlcy5weSIsIGxp
bmUgMTYsIGluIDxtb2R1bGU+DQo+ICAgICBmcm9tIGtkb2Mua2RvY19wYXJzZXIgaW1wb3J0IEtl
cm5lbERvYw0KPiAgIEZpbGUgIi9saW51eC90b29scy9saWIvcHl0aG9uL2tkb2Mva2RvY19wYXJz
ZXIucHkiLCBsaW5lIDYwNA0KPiAgICAgcmV0dXJuIGYiKGRpZCB5b3UgbWVhbiBvbmUgb2Y6ICd7
IicsICciLmpvaW4oc3VnZ2VzdGlvbnMpfScpIg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gU3ludGF4RXJyb3I6
IGYtc3RyaW5nOiBleHBlY3RpbmcgJ30nDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBJIHRoaW5rIHRoaXMgbmVlZHMgcHl0
aG9uMyAzLjEyIG9yIGJldHRlci4NCj4gDQo+IENhbiB5b3UgbWFrZSB0aGlzIHNjcmlwdCBjb21w
YXRpYmxlIHdpdGggcHl0aG9uMyAzLjksIHdoaWNoIGlzIHRoZQ0KPiBtaW5pbWFsIHZlcnNpb24g
bGlzdGVkIGluIERvY3VtZW50YXRpb24vcHJvY2Vzcy9jaGFuZ2VzLnJzdD8NCj4gDQo+IFRoYW5r
cywgQWtpcmENCg0KVGhhbmtzLCBSeXN6YXJkDQo=
