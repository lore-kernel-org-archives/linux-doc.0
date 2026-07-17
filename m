Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A923B71AE;
	Fri, 17 Jul 2026 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294242; cv=fail; b=R+IG91tHyHKn65eCC9HI6Djxum4uM03qN2fNxk6jPsR6A4R11fo1mSJ6WaDfiMd5gfHch+N9wppKGXaI7p23JQgODrZOf/vJPBKqhHWS1luAIzvjfGlfQ7a5weyD6MMgORDgkDjiA0pAtow+PPBVheYyaE0BuW/e8QMVzXxFxQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294242; c=relaxed/simple;
	bh=bjcOlOAXAgOF6kevxHSBC/1Y97zqAyTrGKRSUY2IV4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uL4feDTA7svc/lIQaIm2td7k3rsMN3l1tqTHXDq7MibHuJVzV4UrhvoWl9Jm10xwWvrZeljfroOx/2Mzs741J4IKLV4JrwcO6IPz3IVAd2ILl9MG3rKA/X1ecc/hbYPPsEGCfNwT0aIqGodpu/WOUQElheZPlY3zY7K8bW/h/Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYAQ9Qix; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYAQ9Qix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784294241; x=1815830241;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bjcOlOAXAgOF6kevxHSBC/1Y97zqAyTrGKRSUY2IV4w=;
  b=nYAQ9QixLsLEC8r1Eekln7rmvwONZb93nCz8Bez2NpAbU9ui2gXK7aPt
   yveUIARvD6TKpB2zRs594RE6L86vn6+mT8GGbS9krWzMuQDNCP75z8c/P
   sOUIvfXpyYL0tr3Js1TNG8kUaKirmi2MRqCyHJQp7hfiXcecksijvtQVf
   +SgeyO06lxV/aZiHzvrOJfL3gvoT4gjiSjluUIvCvRo3eeuJa9Yl9nnHJ
   XfCPMULbWNlWlgbHtThruRwIKKnzHO9/Dr1egpW8/t4q3x31HEUfopp+W
   jh34MiNVRi+DOigdX09slNHuTWujBhtuIcBZx3GDjqHM+dXy8/weMBE2s
   w==;
X-CSE-ConnectionGUID: Nko+gtnWQeiNslZ7/vlWkQ==
X-CSE-MsgGUID: Wkk3AOPAR5eRUNJvJWoE9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84742508"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84742508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 06:17:20 -0700
X-CSE-ConnectionGUID: Qp98fmZNRQm6UL94El1E9Q==
X-CSE-MsgGUID: DRmxh0qLRneUX5InrpAhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="255023792"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 06:17:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 06:17:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 17 Jul 2026 06:17:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 06:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI/1Hh+w59CKg1uN77nFlHiVw83ELT7m8TzEX/bO7LEGrJWotGGyDt6K0TGFUg+exGQU1y0uM3lbr7SnKSMwHlBIrfBg+wJia5wTuDdCij1+FBH3wvC+fA8tXu5YNL0ZgDlkIKrswcYEf0LOh9Q4xc5J+B4u2zSTFn//VlWtl5KvkkeGpNVNeGELgq7UNNHjJgpPYlsGGN7NYcRDoNi0+lJMTfVepnQ9Yov8hJtJmmN8G2sgcu0aNRcftF3KfLuFMzdXLZV9WLR/muuM7St+/qG+bdhdU+nJnELbLGdZBVO3AJFM+ryC/fYdj1yKS/YC6IHnslUv6IFPscJroWQCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjcOlOAXAgOF6kevxHSBC/1Y97zqAyTrGKRSUY2IV4w=;
 b=P9EMZ/95KTs4gf4W0RO9BG166MPXC18n4Wyf9Dym3heuSrDB8yzojjE04CLi2Fqcnj0iNQa9vpGmflbUp4XD1nRQ0aXCgIl2F3YaIn913WzKPsZoumT/rcyeRK99H52PU6v3dSmEboMKjC4T++7heT8PFlcep+Rs4KcYLoQ7Fx23HjHc+GbrRMIC13UarxrKYCZdUJqmODAXeTpiFtJtdIL3oqkUcKkuTPoAxE6+fk2VYmDi/RSYFpgEJEsIYwZ711kzPpg5uSP71F3gOYdPd9IHSgS5a938E1kLIDMjgCDKnOYaRYnU4DE8q9q+CrrmBA7gOpioOE3Mwv5OT30sQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:17:17 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:17:17 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Topic: [PATCH v2] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Index: AQHdFFd58x7972K+d0SSg9RPKAYqBbZukP4AgAAIwoCAAxq9AA==
Date: Fri, 17 Jul 2026 13:17:17 +0000
Message-ID: <c1a669659542fe19420a2d8b9b32742fc09dc7a7.camel@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
		<20260715111726.394565-1-ryszard.knop@intel.com>
		<20260715144243.60686000@localhost>
		<80ccd6405e31b1200a391b2755780b7676597c74.camel@intel.com>
	 <20260715155247.3b9fb363@localhost>
In-Reply-To: <20260715155247.3b9fb363@localhost>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|MN0PR11MB5964:EE_
x-ms-office365-filtering-correlation-id: 9d12c116-774d-4181-0192-08dee405b9d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info: +QSWihRccjlCdUy0x8m+i8FdusOIoFpzcYk8bmvyn8l3m37/JMwvWjbdizRpXFdY5GmXDcvSCSm4BcwcBg21maT5wchlCxBE/1BM3/r9Bv2zSCiAbXEVs0zZoFET13ZPNVUQaSGJtpcc9ecBGQk6W9hhQUNwuQCsZvLgsVlxT7wd6YOXBYjyMdngGNRw6dgRF39f3xsh0m9b8xAZAzbilErtYP18flc9PssUqB7pFztuhZAmvTlprQ4lGcFjYy8RQZWwhXITJfGLwO3+I4oIEgU91N8hbejnLqYcdpax6b9IR0cSlZx2Zi0phF4+d/payCZ3RI+fSqImVXuLbh+x1X/UCAI937XhsT2CIG4IKyVWLg2as5R42UMSnIXPX9pBOBB8h7mXBt3AN4cf0qxI0FrPXgNEegPo4fZ0cgWMCSMwqNX/ozywF3U1ZPqH3pT8bWxMIOQYs1UXX8DPznq1x4S5flXVHuvSKxoSGtW0JfUxw5yTbQBH3zBIT7KapgWErFMmAw3VPcaTEBkv41HxSathvT5YnK0dUtfOeebCFLk7fouct9bRGWgiBxZwNyjDFo4gLFiYqrdxBVU0jPtOuDpNlcArkALngMI5sopGilgizgVj8yYyDI4yJuKo7bM26ZtTeFHlOh/0r7OlusjsECzMJ4RaY2Sbe/mIMgOLFg4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5663.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU5mVEN5ME85OTV3dTdsOW10TjhtNnhmY0V4QzVlcUl3R3pwVDRMYWhhVmZS?=
 =?utf-8?B?UDJYbStabXE4dG01Y0x0Nko3MFoxa1JzbkVIREZQLzZXY0FsWTdvb0I1dzVv?=
 =?utf-8?B?L0N0UkhrMUtmcU9VVWZHMVZ4L3hiSXFxQlE5M3dqbWJDbm1nU3g0UnJHZU5y?=
 =?utf-8?B?eWFsUURDTU1PVlBxMUxKelM3NzNwWGlYTFIrS2hRbUVhK3RLOHJBSUJQUEJ3?=
 =?utf-8?B?WWtWRFMzdFJVTzNHQmN6YktVblJ0QWJXczV6a0s3eGtmZlNyNjN0ZkM1bkNI?=
 =?utf-8?B?QTg2citER3Z5MEhJbTEzMnVEcHpYY0JQRlJhYlJxeXNGRytEOGpXZkl4MGE2?=
 =?utf-8?B?VVp5UUhkcFVWcHluZzlUelY2ZENFK0JGaUdDeW9jV0JQZGp2VlRacmpDUnFV?=
 =?utf-8?B?R04rS2Y4QXF4SEtPY2hiOUFVZFVMRDRrNjFWV0c2amh5OWpJNjdPMytuQ1dQ?=
 =?utf-8?B?emVSem85aVVGOW81anA2MGg4NUdTbEF5U21oN1pXeDVDKzlFSW5LQ29kbmQ1?=
 =?utf-8?B?T0t5YkJ1WWZDRTVsZU51ak8zNXJVNUxsUHd4WS92OXg3NExLaDl3alROK0N2?=
 =?utf-8?B?cytQcFBUMEhiMEY3dEQvZEFsNjZYZGljQmlIT1VERURtKzB5ZS9wK0lsTm05?=
 =?utf-8?B?S2FoOFJ1amVVWmtCTzBCc3RkdnluWlZJKzRYc25jOG5ETkpFaVFpbU14ZE9t?=
 =?utf-8?B?cFlZTElqbUtDYXcvNUM3RmUvWXE2MUlYWXJPVnRuOG9Ta2ZzbTBUdTBxbDU2?=
 =?utf-8?B?QmRzWGU2TXU5aU1tTXRaOHh2MmJrK29zclIzSkwrcHNFZXhaamNONjB1WVly?=
 =?utf-8?B?Lzl4TWw2UFJZbFpBZHNtZVhReERIb0pDMWlTVGI0a2ZlWDVIN3NMdE90eWZx?=
 =?utf-8?B?eWkrLzFzaWh6N05nVkoxalh1UFdOelBQdEkxbmtNaFVKRjRybEpUNnR4S0Zo?=
 =?utf-8?B?QXYweXFWRkJUdm80QnFzR2pvL0VaazU5NHlZVDZMMFlGZUEvbGhOcWk5VGE3?=
 =?utf-8?B?aWpxdVZkckFKaDhKcnY2MGJ2N1MwTHhuM1MxYmdHc0krUDRpdldiWERLVDJ6?=
 =?utf-8?B?N2xDRFYyU29VbTVUODh5WlZnK1ZINXh1WVRBaVlZc2xZL1lCYnVTVi8rTXJi?=
 =?utf-8?B?L0tvVlpYNzJZRWF4MmZ1N2QvOE9SUVdrZlAvd3M3aXpYY2txdm5mMEJ3Ky9G?=
 =?utf-8?B?NFFoQ05pMjIvSWVJSUMwcHFleUJWaUV2b3k2YnUwNUFwUmd0S1RRQVVFbmxv?=
 =?utf-8?B?T3pPWVFRWjBxRTBJUmhacWdpREpZMFAxcjYwejVESnNXTzVLUDY5ZWhHSWs0?=
 =?utf-8?B?Nm5HR0VTSlVLS1cyQnJsV1BsbGhWOU1qc1hHb2NsbkJiYTkrN3pNRWkwRElu?=
 =?utf-8?B?dXozbWlEQTcvL0srSEpteXRlVnM4em84UWVxUWgvYXh6VW9FQjFHUHk4eEJJ?=
 =?utf-8?B?MUFzLzAvZEFrT3MyTEdiK3FTYUxFb1EzY21sTVkvM1dqVm83bGUwaHNEcWEy?=
 =?utf-8?B?Vm1SRlIrZWw1djVILzJRUmxUNWYrM0grOU1TZGs4Y0QzWU9KMVdEYmw4OURs?=
 =?utf-8?B?Ri93cDZSOFR1TE1QNFdqWXBDS1dzU25Hcm8zaUxNVDNIL2ZpemFNNTdKN0Ra?=
 =?utf-8?B?VEovQkRVWC81U2kvVlNoblg1RnNZYmJzY25kTHp1am0yMFpMeGRmQzFOeVFu?=
 =?utf-8?B?bmZQMEdxYVdjNzZPNDhTTW45TGdVZHVDbUVKem1XclhIOHR0QmJvZnYxM3dO?=
 =?utf-8?B?WEQxSVdCRWszK0MrZzVwSVoxbkxpc3VCSXBoZ3JIdHZMQXl4Z2s1SFdQT3ZZ?=
 =?utf-8?B?L2p3NklXNS9IdWhNcnlTeDNKQjA1QzJxVy9ibmFJRkJ4eHNIWkt4Qm95cThD?=
 =?utf-8?B?ODJIaU9lUnh5Nm10cGRINmV4WXNudmpocDgyUnNiNUZqbjZrck90ckdROEhX?=
 =?utf-8?B?eGJGVlVTZzg2VnNXZDRQTVg2dk5NMmd6TVM3b2dUNElqaXpoaGcyaUw1TDlP?=
 =?utf-8?B?QmMrVGdNeG11WExFdTN1QXRvS1FNS3dnaUx1a1ZwakZsNSsyTmtiNmRBT2lm?=
 =?utf-8?B?K25mM1BZalJOdHRxRElTUWF2T290eThKcHlObmFqZW1rTHRMTjF3NHV4cTdW?=
 =?utf-8?B?YlU2YVFsNDUxazlhU1ZwTzNSc3FXTFhaWVJQcVJUK05lbXpDdTVMYVRxZ1I2?=
 =?utf-8?B?emU4d1JHU2tBZm1DUGUxTTN2R2laRVJYcC83bnJqZFJIbis1YUlOdFBBV0xO?=
 =?utf-8?B?aWZKdE5xTkJDek1JMUtpQ1U2SkVKTTdQYlR5K2UxNnBYdUgrQlIyTVNNdVN0?=
 =?utf-8?B?QXpJKzJpY01Calh1MVk0Y0JSMi9MU2p2R2ttcTFXNFBLdGMrdkRXenBZdU5j?=
 =?utf-8?Q?riHmvPyZ/J2RycyQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC03F6E332BFED4BAA3F22BE46D5355E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GpRYgWOP4iv32D/7JNpR6SIlEeej4wBOpBSTDCkQBsot+Z89VBw4blEVoBqqBilHJITcEGcapJuXL55m6KV00K6bcpup5pNOedzfqF8QknPoNtKvZt0tNkeID4xvBf0KKNq1GSxPyYhcpq7XhOuRAl0YFmleGoXwt8bQvW+299h0pOK2zD43dISL7vWD01gWOy6Fc4ra05HoBdHSPzINKyJHbf57Z71RtcWnbVN+1D3Af1TMNYmN0NLEBnJ5U0+K/aUxvZAkU26oqSQeSIjpT148cd5TqSWdEU041A64GxULAGbdZluaplZU3/g5CA6BQwAlMd7dvxG1iEnAXeOzJQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d12c116-774d-4181-0192-08dee405b9d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 13:17:17.6988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSPEEUObLWCe4rgze1qJtIQaM6Hg+MqPWK3BuXMYM67bK3DNixlyU2+7P5rHWrXm/VGNwLG5XQi+noCmEo0lpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTA3LTE1IGF0IDE1OjUyICswMjAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
d3JvdGU6DQo+IE9uIFdlZCwgMTUgSnVsIDIwMjYgMTM6MjE6MjcgKzAwMDANCj4gIktub3AsIFJ5
c3phcmQiIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+ID4gT24gV2VkLCAy
MDI2LTA3LTE1IGF0IDE0OjQyICswMjAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6DQo+
ID4gPiBPbiBXZWQsIDE1IEp1bCAyMDI2IDEzOjE3OjI2ICswMjAwDQo+ID4gPiBSeXN6YXJkIEtu
b3AgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gICANCj4gPiA+ID4gU2lu
Y2UgY2hlY2tfc2VjdGlvbnMoKSBub3cgd2FybnMgaWYgYSBkb2N1bWVudGF0aW9uIHRhZyBtZW1i
ZXIgbmFtZSBpcw0KPiA+ID4gPiB0aGUgc2FtZSBhcyBkZWZpbmVkIGluIHRoZSBzdHJ1Y3QsIHdl
IGNhbiBzdWdnZXN0IG5hbWVzIHRoZSBjaGVja2VyDQo+ID4gPiA+IGtub3dzLCBzbyB0aGF0IGl0
J3MgbW9yZSBvYnZpb3VzIGhvdyB0byBkZWFsIHdpdGggdGhlIHdhcm5pbmcuDQo+ID4gPiA+IA0K
PiA+ID4gPiB2MiAocmR1bmxhcCk6DQo+ID4gPiA+IC0gU3RyaXAgd2hpdGVzcGFjZSBmcm9tIHdh
cm5pbmdzLCBuaWNlciB3aGVuIHRoZSBoaW50IGlzIGVtcHR5DQo+ID4gPiA+IA0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiAgdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5IHwg
MTMgKysrKysrKysrKystLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5IGIvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tk
b2NfcGFyc2VyLnB5DQo+ID4gPiA+IGluZGV4IDJkZWRkYTIxNWMyMi4uYTIyYzNlMzE4MmYwIDEw
MDY0NA0KPiA+ID4gPiAtLS0gYS90b29scy9saWIvcHl0aG9uL2tkb2Mva2RvY19wYXJzZXIucHkN
Cj4gPiA+ID4gKysrIGIvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5DQo+ID4g
PiA+IEBAIC01NTgsNiArNTU4LDEzIEBAIGNsYXNzIEtlcm5lbERvYzoNCj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgIHNlbGYucHVzaF9wYXJhbWV0ZXIobG4sIGRlY2xfdHlwZSwgcGFy
YW0sIGR0eXBlLA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBhcmcsIGRlY2xhcmF0aW9uX25hbWUpDQo+ID4gPiA+ICANCj4gPiA+ID4gKyAgICBk
ZWYgZ2V0X3N1Z2dlc3Rpb25zX2hpbnQoc2VsZiwgZGVjbF9uYW1lLCBwb3NzaWJsZV9uYW1lcyk6
DQo+ID4gPiA+ICsgICAgICAgIHN1Z2dlc3Rpb25zID0gc2V0KG5hbWUgZm9yIG5hbWUgaW4gcG9z
c2libGVfbmFtZXMgaWYgZGVjbF9uYW1lIGluIG5hbWUpDQo+ID4gPiA+ICsgICAgICAgIGlmIG5v
dCBzdWdnZXN0aW9uczoNCj4gPiA+ID4gKyAgICAgICAgICAgIHJldHVybiAiIg0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsgICAgICAgIHJldHVybiBmIihkaWQgeW91IG1lYW4gb25lIG9mOiAneyInLCAn
Ii5qb2luKHN1Z2dlc3Rpb25zKX0nKSINCj4gPiA+ID4gKyAgDQo+ID4gPiANCj4gPiA+IFRoZXJl
IGlzIGEgYmV0dGVyIHdheSB0byBwcm9wb3NlIHN1Z2dlc3Rpb25zLiBTZWU6DQo+ID4gPiAJRG9j
dW1lbnRhdGlvbi9zcGhpbngva2VybmVsX2luY2x1ZGUucHkNCj4gPiA+IA0KPiA+ID4gRS5nLiB1
c2Ugc29tZXRoaW5nIGxpa2U6DQo+ID4gPiANCj4gPiA+IAlmcm9tIGRpZmZsaWIgaW1wb3J0IGdl
dF9jbG9zZV9tYXRjaGVzDQo+ID4gPiANCj4gPiA+IAltYXRjaGVzID0gZ2V0X2Nsb3NlX21hdGNo
ZXMoZGVjbF9uYW1lLCBwb3NzaWJsZV9uYW1lcykNCj4gPiA+IA0KPiA+ID4gU2VlOiBodHRwczov
L2RvY3MucHl0aG9uLm9yZy8zL2xpYnJhcnkvZGlmZmxpYi5odG1sI2RpZmZsaWIuZ2V0X2Nsb3Nl
X21hdGNoZXMNCj4gPiA+IA0KPiA+ID4gSWYgdGhlIHByb2JsZW0gaXMgZHVlIHRvIGEgdHlwbywg
dGhpcyB3aWxsIGxpa2VseSByZXR1cm4gdGhlDQo+ID4gPiByaWdodCBuYW1lLiAgDQo+ID4gDQo+
ID4gVGhlIGNoZWNrcyBoZXJlIHNwZWNpZmljYWxseSB3ZXJlIGFkZGVkIHRvIGRlYWwgd2l0aCBz
aXR1YXRpb25zIGxpa2UNCj4gPiBbMV0gd2hpY2ggYm9pbHMgZG93biB0bzoNCj4gPiANCj4gPiBz
dHJ1Y3Qgew0KPiA+ICAgICAvKiogQGZsYWdzOiBnb29kIGRlc2NyaXB0aW9uICovDQo+ID4gICAg
IGludCBmbGFnczsNCj4gPiANCj4gPiAgICAgLyoqIEBzdWJzdHJ1Y3Q6IGFsc28gZ29vZCAqLw0K
PiA+ICAgICBzdHJ1Y3Qgew0KPiA+ICAgICAgICAgLyoqIEBtb2RlOiBiYWQsIHdyb25nLCBubyBn
b29kICovDQo+ID4gICAgICAgICBpbnQgbW9kZTsNCj4gPiAgICAgfSBzdWJzdHJ1Y3Q7DQo+ID4g
fSBiaWdfYmxvY2tfb19kYXRhOw0KPiA+IA0KPiA+IFRoZSBkb2NzIHNob3VsZCBzYXkgIkBzdWJz
dHJ1Y3QubW9kZSIgaW5zdGVhZCBvZiBqdXN0ICJAbW9kZSIsIHNvIHRoaXMNCj4gPiBpcyBkaXN0
YW50IGVub3VnaCBmcm9tIHRoZSBhY3R1YWwgaW5wdXQgdGhhdCBkaWZmbGliIHdvdWxkIG5vdCBz
dWdnZXN0DQo+ID4gaXQuIA0KPiANCj4gT2ssIGJ1dCB0aGVyZSBzaG91bGQgYmUgY2FzZXMgbGlr
ZSwgaW5zdGVhZCBvZiAibW9kZSIsIHNvbWVvbmUgd3JpdGVzDQo+IGZvciBpbnN0YW5jZSAibW9k
ZXMiLg0KPiANCj4gPiBJIGNvdWxkIG1lcmdlIHN1Z2dlc3Rpb25zIGZyb20gYm90aCBkaWZmbGli
IGFuZCB0aGUgcGxhaW4gc3Vic3RyaW5nDQo+ID4gY29tcGFyaXNvbiBpZiB5b3UnZCBsaWtlIG1l
IHRvPw0KPiANCj4gTWFrZXMgc2Vuc2UgdG8gbWUuIEp1c3QgZW5zdXJlIHRoYXQgdGhleSBhcmVu
J3QgZHVwbGljYXRlZC4NCg0KU3VibWl0dGVkIHYzIHdpdGggc2xpZ2h0bHkgbW9yZSBjb21wbGV4
IHN1Z2dlc3Rpb25zIHNldCB1cCBsaWtlIHRoaXM6DQoNCi0gRmlyc3QsIHdlIHN1Z2dlc3QgbmVz
dGVkIHN0cnVjdCBuYW1lcy4gRm9yICJzdWJzdHJ1Y3QubWVtYmVyIiwgd2UNCmNvbXBhcmUgdGhl
IGtkb2MgZGVjbGFyYXRpb24gbmFtZSB3aXRoICJtZW1iZXIiIGFmdGVyIHRoZSBsYXN0IGRvdC4N
CkV4YWN0IG1hdGNoZXMgZ28gZmlyc3QsIHRoZW4gc3Vic3RyaW5ncywgdGhlbiB0aGUgZGlmZmxp
YiBzdWdnZXN0aW9uDQooc28gdGhhdCAnZmxnYXMnIHN0aWxsIG1hdGNoZXMgJ3N1YnN0cnVjdC5m
bGFncycpLg0KLSBUaGVuIHdlIGNvbXBhcmUgZGVjbCBuYW1lIG9uIHRoZSBmdWxsIGtub3duIHBv
c3NpYmxlIG1lbWJlciBuYW1lLA0KZmlyc3Qgd2l0aCBzdWJzdHJpbmdzIGFuZCB0aGVuIHdpdGgg
ZGlmZmxpYiBhZ2Fpbi4NCi0gQWxsIHRoYXQgZ2V0cyBkZWR1cGxpY2F0ZWQgYW5kIG1lcmdlZCBp
biB0aGUgb3JkZXIgbGlzdGVkIGFib3ZlLg0KDQpMaW5rIHRvIHYzOg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtZG9jLzIwMjYwNzE3MTI1NzUzLjYzNDU1MC0xLXJ5c3phcmQua25vcEBp
bnRlbC5jb20vDQoNCj4gDQo+ID4gDQo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC83MzQzMDcvP3Nlcmllcz0xNjg5MDUmcmV2PTENCj4gPiANCj4gPiA+IA0K
PiA+ID4gUmVnYXJkcywNCj4gPiA+IE1hdXJvICANCj4gPiANCj4gPiBUaGFua3MsIFJ5c3phcmQN
Cj4gDQoNClRoYW5rcywgUnlzemFyZA0K
