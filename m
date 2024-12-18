Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B631FD792;
	Wed, 18 Dec 2024 23:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564438; cv=fail; b=qAk8yZ3wLWQUrgD8hk7XKinMcLDN1Ud0PBwb0Mu6DOmnXWIbrKL6NAjz9jUHpfceXW8t/nfP00EgJF+5iKX/1111CTHbdMiY9XsEaG6HHCgL7XiXh5IAh9byH4rDSq0udWSCK13+QKlakT7GGKuxylCnuTe2YacsCuHUwQ2SGpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564438; c=relaxed/simple;
	bh=prbYlT6ou1BExP3CsP3vF6brFKoX1vim3zaG+8YrRos=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dvm7pwNAQkVfsba7lOHAJ/FtpGoni+1Fsn1rmPkLYVvqoVLl6Au7ix5xrv7cMfOb9s3qMP5XOgVJbu7cC5Fjg5UASqfRR4/WHWqW4KqrwafPbCM4wlhZAyhZ4h6l0V6+kwI17Pibq7r5du1US+FM0qL0fzyHJ5MzID5KqBfZbvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmwEjKMW; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmwEjKMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734564437; x=1766100437;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=prbYlT6ou1BExP3CsP3vF6brFKoX1vim3zaG+8YrRos=;
  b=RmwEjKMWNZFqz4D33Nqh4U/Qu8iG+KM4d7xLwvup0/7NhTAzVxPhU2lJ
   859XRMHxoGAwbYEoAQlEo5AT3Nlz7t8m7M+wwGSlc5UvwKrBtHtLT67Ux
   wy5HqUihVr7e/i8zZkEyE6ItOCQpgF7xu9in1weNkD1c8tkduliYv3/4M
   0SvcDTtXPUk/nW2a8Vr+WLJfoG6t08usNfI1u1OantPb7Vz66oquMJoaW
   A9JymIbHw9DVjWtOs5ghus2MmrEu48nq/z2pa6LMtm4vEzzsjuxrnsevz
   Lv9jsbSU3lKwenoUsaZBJZ1suUmjqmNO5SXueZ8DZN47f6yfvUCpY2wym
   g==;
X-CSE-ConnectionGUID: wxtGALOtSUmttE5zstoDZw==
X-CSE-MsgGUID: hSZYJOXdTdCJ9GYiB5eU3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46070497"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="46070497"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 15:27:16 -0800
X-CSE-ConnectionGUID: t5cvOWg9QWaXhO+r2aMUWw==
X-CSE-MsgGUID: ZIclmsimTVOopbQKiIWsFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="97903531"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2024 15:27:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 15:27:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 15:27:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 15:27:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6SwEK28pji5rRot0lMkkC73wl6g3vEUMOOdpigwx2TGXjruM8Q5cJkr/RSfRcomA8J7NWom2O0AjUs4Sz9s6Y4X5TpfXls13W7GXYLGG6Y1ZGxV6EP7wIsnHPjOYPCeFTFWSUPp1fS1IdyW7TGSa2Xp1rPlBylC6Lot4lzYoX7iB+TJXTSp5xAKfVX6zCoCCTm75t/czz91B9Je1MUghhyk0JGR7rldTJE6vH4MM6S6PJmImrXcTluDqaZMBMX4yol1oh9Ff+KQoWpy9Y3kiQ2rqM1qcNnqr4YjZ0zL+LyEOHk4vM74GKKTyruo8HuUYZWlPuRYZui2ysT45TYr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To7hpLEb+nzOLsOsegbJ9o4OPd/UX+N3sDekpzEpMkE=;
 b=anvAfXJZLLdOaakcNgh5pIO5Rv/OGzCNhWMoUpczy8Nu9GZrRFooiWx1uqyihC3+hoR0FBifLCN0kiZIS7vIjIbc1HkGu5CeOOjzbgim9fqVqlfrPVMCDgQV3ZxMP6Zi/ejTVPXxO92SRntF6ArxpUbExAEbkjIiwtdYd/QBoAJ7XkcmQdihs/3ORbKk5U8X1aUIUahkCXG+CrKUvXf6HXWd49sYQMrkFHBu0NXShTZIhlosmPlIzyEkSFiDbk6lgL9JLS530hIxURQXthUD8kS+r+5RnDADHHOqrwvgX6OiIDBJLu46CnCim7Z3aPrzhrJsBX7PSRRUMKgALay2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 23:27:11 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 23:27:11 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
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
Subject: RE: [PATCH v2 0/7] x86/resctrl : Support L3 Smart Data Cache
 Injection Allocation Enforcement (SDCIAE)
Thread-Topic: [PATCH v2 0/7] x86/resctrl : Support L3 Smart Data Cache
 Injection Allocation Enforcement (SDCIAE)
Thread-Index: AQHbUZUtboMQEmHFZUmwuHgxQkySNbLsonSg
Date: Wed, 18 Dec 2024 23:27:11 +0000
Message-ID: <SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1734556832.git.babu.moger@amd.com>
In-Reply-To: <cover.1734556832.git.babu.moger@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA1PR11MB6124:EE_
x-ms-office365-filtering-correlation-id: b42f6481-5c8b-4afe-5df5-08dd1fbb7f88
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?I37CD7h609x1NPhfeBf3bEG+lzh5OhH4A/xKL402QzxDhqVDwFHGTtMnWnbu?=
 =?us-ascii?Q?/QHGF+uyx4VlpqUC7bnpxYmAT8Fzm+AmhM+F4me1wRjvNP3BC3C3L6qrxN65?=
 =?us-ascii?Q?ZGr6FKX/uP4nDM0f6d4ywLdVEZaARGw4LfAH5P/dl/cb2CCFhxQL561NU2iU?=
 =?us-ascii?Q?kvTbKWVjGyw33ala22uyuWYYBzYrGACJTNJrFURj+ADE/dvTqS/lwr9RpmWL?=
 =?us-ascii?Q?4xopEcYVGnbbHChksEYYrmNELw1q9vMPaYXOeacXOfNdR2sSvGzAY7Xzem5e?=
 =?us-ascii?Q?KGAsuEnDrIiJiFMH6x8dMP1vBW4Bpum7aXtx9NZtkMj336pdXOSGwGvtk1Rl?=
 =?us-ascii?Q?s1hXTPcnH8hVbDDWwOg+ySZEVgPtmky06H+IhzY+/waolH07FfxOZOS8Ewi8?=
 =?us-ascii?Q?QwNr0bBEd0nBkHa2wqKYbMa+Y8afvtQiyKGqiydrd5SoihMJczV0Jhx+igZb?=
 =?us-ascii?Q?tjzT1tswLEnoaAc37dC20asvXVZHfNXa/QJpdXpXLvd6pKEcf/VPcjBRD1Q8?=
 =?us-ascii?Q?/S5aDfqYkGq5Fe9Ql0zJ0rxKwavCvNkwLYSMe+rDfj4Y7mTqDZaBehY5yyq+?=
 =?us-ascii?Q?0FlJW+h8I+QWDtFwsEF7KlLkYkjEXUgQ8eXoZpF4Q0FYtX7kAeiKPa4NgWw6?=
 =?us-ascii?Q?tt/f2JNfRnPj2Uh8MafWZA9iKi22rCdSHJimYPRWbVRCVdBt0klAHmjBFg9g?=
 =?us-ascii?Q?eXHsGEvUoInuZk0qA9HdgNB/UQGBrU1aJHzmdRFL/edfSFXIjqR7SOwGj45R?=
 =?us-ascii?Q?J1cNnHILbyu38gvXOg98elOu5KrxMnn1Cs6UQyxO6IIiRz9P9X1abJ7VOK/F?=
 =?us-ascii?Q?IhkgNikEAZWaImlwoEtzY2Qb6OvMPPBUm4hVhm+yR+Oax3C95TCYVqbnXelF?=
 =?us-ascii?Q?+8Xp76B9eSAOMNJEdNsYU/DkEbxWhj3iVm5C1sttFZgLvZDzgn/4ZW+x2p1M?=
 =?us-ascii?Q?VprITrR0L8G/tX83cFvIbj3UZDS8GkKnhXcOqzvVduWY9ZofBaGkqyf/2/PS?=
 =?us-ascii?Q?KIJjPYjgvW+sqGWc0w/Lluvd0U1jMXQ/21tgHoDk4NTQ0ET2VbisBYLXQ+kr?=
 =?us-ascii?Q?MENF0rB73PuZTfjnm1VFUP5W+kNHZx7FbJjuiDLfBNDs5D5TjN8fBwOLw4y8?=
 =?us-ascii?Q?wc4NedsYr50Ui5zFWVNAb4IzESDNKWZsLV2u7QhA08VbQFYorOyX2nBfD4sZ?=
 =?us-ascii?Q?Q96c7miVJSnnIe+GOe1y1k2ZlI3HYp3iJX6OKibBHv6nbU74oAlGn2AMd+bq?=
 =?us-ascii?Q?ZHLemQqENmtlakr9FTYCmYPcfWp0tX6xvOuNUD7igdNpv8C1vJuCYMppJ4lK?=
 =?us-ascii?Q?QASj5eaRxf+CEjW8NjH7em1erMxZn/8wbaoGZpaElYqY0tfkV6dX8JdRSbZf?=
 =?us-ascii?Q?KmGP0WlcMNdbdXhTvYe6v0PkmueAY4XvN7J+4VnnbTqEuJkjAeyw6Bj4z5l9?=
 =?us-ascii?Q?glyU+28XsK0swZ2GygmLQkgqmiS+K1FH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JjngCLh/L65hkK21m7fkjrilBzEdgbGYHCTn0C7dSQXp87aY5c5C4gk0ANZA?=
 =?us-ascii?Q?x0lswrUmFWOnttj2SWV7XmHx0j7tB4f4T29lwtPQ5IBwCylnHRjWJef+Mebg?=
 =?us-ascii?Q?5B0rYV1lRWYtP5mHaPB2VfADgfMRAdr21fpcxROVLOVzdvu+FRBK9q1iTwmd?=
 =?us-ascii?Q?m17CvDdwJ5DFT2D+PseeeRkGJdlDetxwwdJFMJl02zBt5BfVWmxnifD3p1UZ?=
 =?us-ascii?Q?00nyo1rWLmHzfp24pLSU4PZuAFHkI13XsAGVbJUfMZVfke1pTpL20k0km21A?=
 =?us-ascii?Q?9PnokfysLFRZotwMzco5nJYzX021EjoSpF1C2hAvMlzJHeDrxEiEpT4CXP4z?=
 =?us-ascii?Q?Vnbn25CpcSsbPH3IMVz7WtfN7UjJ8t27UWmhFOiErZRwjUf+YuA04E1HIUzu?=
 =?us-ascii?Q?ltBEWxq8vC402YP2nhDGAMaCARfD+DjQTKOeO/MNMt0RfSJPJ3maegNuBWh2?=
 =?us-ascii?Q?7tzCDHtw9oc6zUB4VMHEYk5lCJS6jL5QGst99NrX5evbzS+pK3kTsPuyx9LI?=
 =?us-ascii?Q?x9HfL0fHtPaCa+Nia1PkQyyGp8ocgsb+PSMH2OFT/zXBWgtqzYRZ//9CHeRF?=
 =?us-ascii?Q?3msylwKmlM3/ztjkBeFG5KxNq4O6PwqL7NGkKr5d+l9kEoSlXeuGd71hNv/9?=
 =?us-ascii?Q?W63gDd3dyPwZRUeOJ3MBDK0223+hUnkyCISFaeqUll/a+PGegHS+LOU+CXve?=
 =?us-ascii?Q?HICG72W/hLTq9BFUhkTDOB/c9OxraDokjpYBRkad9qKZ4WghtfNgTlPPxc8n?=
 =?us-ascii?Q?ZwromXn1TYjka53Kw053zgluYV8ODoWmuh8KiqHzUbGlSLOBpg3zAyF0pztt?=
 =?us-ascii?Q?pVdQit7eHT3X+5EN9jy14XB566NtuSIo5cADvfiGDy4uGJ8mKutMRweBfege?=
 =?us-ascii?Q?U716OlgOzZ8pwyIsUoaQiEomBLUmLB2ZaLv4is2U4jA9u/yCQvDRsLRAy9wt?=
 =?us-ascii?Q?BH7BuVbpKkrKh2NYOM3P5F8Li05NBC+mG/p0n4aTZTN0FkMdVRL2EMmOPlwl?=
 =?us-ascii?Q?HXDcKlejkxxSr+iVYD03AveJtbcdFzwFVEzb4zngA3XkU3O1q3LVgiD/FXJL?=
 =?us-ascii?Q?Fv3veJwvd+5lr7G2fqDCUtx6jJmAvX96DC94E2r1sTgKNzYte+6yfq/cUODM?=
 =?us-ascii?Q?Hw8z1yev+6oUL46GXYIcIlHBVkX51PzUfs3CLXLjFt+d07ez0GBKgxyIu9k2?=
 =?us-ascii?Q?oXiozKZrMPPIBB26d4Ld6u/EJdgemoSLk0qWT7mYTiLI20ZGi/Z4L3fnq3qm?=
 =?us-ascii?Q?2ATIVMGB5Md9pkCNLCCBtyYEUjsnRdSL/RDdTPCGXfpWbrq4kQzANDrGBalk?=
 =?us-ascii?Q?69XfouXcIgrlF1N5M6HDIhgncOGyM3gZUYaGX0uaJ0Ec3Ou60SB0hzBRATzU?=
 =?us-ascii?Q?mBQ4uyLKocpyfXwVg+lunaZYHxpp5bcTh7k5Qukkf6FdNUq9Ug2Eahj1y/qP?=
 =?us-ascii?Q?GjhJlGP1vGTpz0/TyC+0u/+UVYPx/Xngx1gX1aJ628s0KINp01/djSmCA7EU?=
 =?us-ascii?Q?BlZq2dEMfSUaX4NBe4R9TwSUex7WPI3sTLmLfZq6PGhffgw5oXFvKT7+kJK+?=
 =?us-ascii?Q?s5qoyJ2cyjmVh9q7onyDX+KU3VCHJADPYQopQjIR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42f6481-5c8b-4afe-5df5-08dd1fbb7f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 23:27:11.1045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fu8U8ichLkw42A2k/LMnWdA0wg4D1D06qX8/NZWg+DF+dBGDerCYK8o3Gw0ZQMOzJfJy/pxYRx9OUHHcawB+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
X-OriginatorOrg: intel.com

I don't have an AMD system, so I added a couple of hacks to the code to pre=
tend I did.
My hacks might have missed something, so the below test may not fail for yo=
u.

My test:

# echo 1 > info/L3/io_alloc
# cat info/L3/bit_usage

This gave me a console splat starting with:

[  163.801078] invalid mode for closid 14

That happened because in rdt_bit_usage_show()

                for (i =3D 0; i < closids_supported(); i++) {
                        if (!closid_allocated(i))
                                continue;
                        ctrl_val =3D resctrl_arch_get_config(r, dom, i,
                                                           s->conf_type);
                        mode =3D rdtgroup_mode_by_closid(i);

CLOSID 14 is my highest. It's supported, and allocated.

rdtgroup_mode_by_closid() searches rdt_all_groups to find
one using CLOSID 14, but there isn't one. So it returns
RDT_NUM_MODES

Maybe RDT_NUM_MODES isn't invalid in the switch()
Looks like it should be same action as RDT_MODE_SHAREABLE?

-Tony
