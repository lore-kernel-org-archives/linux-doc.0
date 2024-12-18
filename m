Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BE435956;
	Wed, 18 Dec 2024 23:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564864; cv=fail; b=sRel/SzHOPFQeirq8ECOo9kiQbkkcR75fRKkNCRslSsZuCViBqQ4PvXAr7CjhXv9i9WQAM/FQqlm37a9/J8UCOx2uPNAI3n7pIwStQ9SHcAEaycXocdN96pywBOoCcP2SvPwIjR/XiKzRv25SkAf2Rayv32OUgm4VW68XiO5uCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564864; c=relaxed/simple;
	bh=0KZqZyTTWaAWxwR0jUYL89x1gjB0mR0t7Xd2Vv8LTgc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PNezHOmBd1y65ZVDyNbntDuN2ebXYbsZF5EeAiWMxsW16eQZ2HrEdFfQ5z2UMIaXWkTF3t0CM45oK3OmPkiGu4R1Vy3qWSZ8E2xgfRLpOqQ140JJ17Jr9XbonRCd5miKn//LDkIwAlG9Ghzt/JyDRozj20BkQLHuK8ivGnqEufs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXrZARmc; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXrZARmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734564862; x=1766100862;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0KZqZyTTWaAWxwR0jUYL89x1gjB0mR0t7Xd2Vv8LTgc=;
  b=gXrZARmcI41lwhf57Tnzyb20iVP/Bi6cE783WrDj6K0WuDGUMdFkpBzY
   Sw29PKbG7CGQgPxsOewGLXKhARM7AEV+70zIJe1bo6CEg8468gzvUhsFy
   AePKf7V/p/gFi0getqL+Y1gxN056vRkS3lKrTMrD/H/iz9MeqdGmIo7OR
   t3P0DjC/x1d5y+bH2M42pmYD6UGsj9ytyxjsT9sDWMPA2o34ePCv5qAYw
   4V2H+S3BdEzP+abnILWDOZ7bXaiM96+3Owhav/76PU2kQkAzt6+1Lo9Rz
   eTdZxnf3tQ+in8F95yMrCL05M2JOqCNEDWEuu/Wyr685uZX3ImEir3VDm
   w==;
X-CSE-ConnectionGUID: DdGCzmSmSSWNm5jpPWbJjg==
X-CSE-MsgGUID: Yc3JcfB0SdeuKjjGk4fQQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34951602"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="34951602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 15:34:21 -0800
X-CSE-ConnectionGUID: AZMjM//WQnaABTxTYvH6Cg==
X-CSE-MsgGUID: FiKYgjBdSoe+RJVGMA8fjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102153191"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2024 15:34:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 15:34:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 15:34:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 15:34:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNXh4MJr4f5uioTF+eurdagC+QU8RrpElJX5+M9DTJB/fXOT8mX59lW9kNKu9INvGj+PxAA4oPTl/cLgZfSuSUrgf8RrZD1UYHpvPQMjyWNumnvT170RGMh6QmtjCNTWckNTwZzQLTzYlne7EGkJ44aHbDZb1RV/lvWAryO/4XQ0qryVul0ied9YsHsFnK6rb1Df0nA2pYi3wx/sA1+WcJM5xehE+PeKYWU8bpJzExWJiZBAa3EVN0PIrshCW7L1xHzh1Ri6hCgThj5ZLoajV+O2Qee7vLbyENzUeAHxGtv7H4qyXgAXlZZm+s00pBx3opEq0S2yT8P1wyUG0vdbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUkH8lkjdgUyrsllW/kCJzgwhUKJm/4fWzbIDDdpfJY=;
 b=okMiNw3dzUWLpgyWNnEPrr9nHJpKyQbTc4BL+5tlJSdKzwEfyzhhbVuAhaLhGcZ6yVC07Y7mVLvdi5hNpKpMgU6CyF48YuMmpdAERFGMu6CkC1D7Rd6YYAR7j//a1iUcUBOZo5RD5fs1OStiMdqjqLEoSqVR1ZWa1cSDVdE/UC720UKTz56g9TiCiUSk5d/PMVkCwPmr0fnuMVzh9XYfE8CnOf5c9Pyax/yvcvT4Y2syyym72ScRjrBCrVJexJ3FK4Sn8tqhYU6+sy1X+imq3oMPX1qxdC/pQ//V5hB1hPuWksDxio4kXCKhlyqU2Z3qR+24Nnxo/H2C9i6spIHD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CY8PR11MB6938.namprd11.prod.outlook.com (2603:10b6:930:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 23:34:17 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 23:34:16 +0000
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
Subject: RE: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
Thread-Topic: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
Thread-Index: AQHbUZVFgsgWIr2vP0e0IsmHTeMxRbLspnHg
Date: Wed, 18 Dec 2024 23:34:16 +0000
Message-ID: <SJ1PR11MB6083741B72BDBD509F9BD2D3FC052@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1734556832.git.babu.moger@amd.com>
 <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
In-Reply-To: <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CY8PR11MB6938:EE_
x-ms-office365-filtering-correlation-id: 3932867d-1248-4795-3556-08dd1fbc7ca7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?apWhqlqIdWUvPwkY37SG29/c10z3T6N+WlvZ2G1Cxxt4Wxep2ep+jeU1+Kpf?=
 =?us-ascii?Q?xXY8NivB18LONr1Sn0gByBCjXNrlouW8y/uxBcwsJlKAPwLTTkDvApOAQnoE?=
 =?us-ascii?Q?tY/bnYZZQdjsj16AWeI/iwamxhXW3oewqLrNA+Lk8u10Guiv7Md0amxzNglC?=
 =?us-ascii?Q?/RGWquIz8chxU1evem2doh+SvDUOYg3wp3GnxCvDibHFlhfux7XxuDp2Lz48?=
 =?us-ascii?Q?Znec1mQtVLckk2vgMPDAd0KR8NmgUd/lqnzKcfqPWHtWfTDkDL/NsjpqjLiZ?=
 =?us-ascii?Q?+0uphMBHchvn3ztjKjmMCIQEpixFlAKzfWlwMrnm4XDDdcLBDiMjRKUbJdQl?=
 =?us-ascii?Q?+UaV1jli+79SHcd52TnHd0HeYTu/+5U6eOXiPd+q9afvAMDJKTaNMsiACY3e?=
 =?us-ascii?Q?TfCMjL+6N6GK+k2qedun11PfoRjQZqy+uz4bGgWTXEL31xk3cbil4BzaVWwj?=
 =?us-ascii?Q?28zmPBZcf0HHlEGakRliXQaZ9j8ySYignSxNc3JgS5AAwmNZMC8Ey0DEZMIY?=
 =?us-ascii?Q?e1PhpFhLn6BuJ1S/1kYkt6m9YcfVjolX13y/lzlD5Hy5Q/lubPlcqRrsMCxC?=
 =?us-ascii?Q?a3l5R7nEsgj7udfctxvIy5EoBAYwHCd/hGceTffuu3fASHYmVqOg/lF6EPdP?=
 =?us-ascii?Q?TUt+oEqWNcHLA4cTuxplPxcJs5/P2XiV4dhuXDJ7WGwV070xE+Vp5Uu3kdfi?=
 =?us-ascii?Q?O2vl5A95FkhUDD+dP3iVzMrsrvlVB7TywVlPW6PFJ6qXO8WXawyGIPgslrei?=
 =?us-ascii?Q?85fd1iQ3vrqVB2RGI9eLkSROqwa2GM45h7H/HeJcu2cb965F9NAVS1EuWRHL?=
 =?us-ascii?Q?0Bx7BUV0oTFgJSkXmPuEHqLPg5DCRJTflNTchVQg1UCsZaL7X4QteL4tsu1Q?=
 =?us-ascii?Q?Y6CJTfQyynloV5XiQbYm35HfGYfTtyEV/cj3YJe4tRlJmA9vLSrSstmo7Cby?=
 =?us-ascii?Q?ItWdVSpS3FytXF1PSgB0IfYRyyNuAnCavqAeFpMOZt1uYq3VJheBeqBWHigQ?=
 =?us-ascii?Q?BasAzeQZFNBmhuLrT4htjfH3NzbxlLHLdPUq5qZrSm/Fy/uqisVhjr0IYYRC?=
 =?us-ascii?Q?ztLcjJhwvQNY4bI1vKq88G7Rd/xZqzIsEs2DNilD/UaOeAMyrbqjzkeV7iIi?=
 =?us-ascii?Q?ZgkeHSvnu39bkSc5ETW902xjHhLhqDerGTE7o9Vj9yPgJDph2jAFJ/UAwYHx?=
 =?us-ascii?Q?6Y6uOL2W/U+FuYwTb+wA8J1BTaImEdYQhdPmarZNX83/MtcvudTQxxcHe4En?=
 =?us-ascii?Q?T3SFzoPPWfFjZ1XCI+TGn7y2JIw74kdj4wwtMiz3q6VpP2A5O5Rwuq6dlCsW?=
 =?us-ascii?Q?8M9qBNu0eEXW8tJ0ra4vnQWmXWdnUY6HVQ13yzaL6eX23oJtJm8mqeqYT6r7?=
 =?us-ascii?Q?3e+91M6r6VM49cvgGvjenDRusfFI12uwo8S4rbMRQdMcI/aoRUQsr6f4qqa8?=
 =?us-ascii?Q?LMTk63b5/cbzHEn4QwD6hyaDi4hJUV02?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sDINq3RoEHNy1hc2B7AHMF3eZo1k+3TOC9xU+wIH3P4E/22RG4JOw7o7WAAt?=
 =?us-ascii?Q?V6RsSRtim0CqGFUF2O1SJXTTK8fgUhuzsRJU5EEIYOWIDq3i/aLtRrzwofJ7?=
 =?us-ascii?Q?iVbzTUk/hMt6ScaHyvXY1HCL7j5RVuiej6R3RHs7Z/z8cdV3Bt2Qn2HuEQvw?=
 =?us-ascii?Q?8XLoS9uJvDzc/ZTThndPvlkZDO3/dvUCaAY0MePBvpO/L4N2LvObVmyI3x7n?=
 =?us-ascii?Q?6aG0UxWvtijjBW0+TiTnohMgclkOHEIoguRDFMHNPJVsZyKzDa9Xf0GHlwRW?=
 =?us-ascii?Q?YqnuXVUaJuPD7nyacprXrCqujNiUawXRV3Jk3jpp3cy6J4KoGgNPlMLGZ2Qj?=
 =?us-ascii?Q?kWX3DJyFUogVR45lULtYjPh9I8sPg7lOwQFCdnVjJbpLnuDvAra2PISP9c9U?=
 =?us-ascii?Q?EzRoNS9IZ4asN2EMlUYyLXqusaQP54w/zKRW2y0SPgD0GCOZln4VzRim6LN/?=
 =?us-ascii?Q?GcyvvUD4WCc3sQK6+aOgdmOrHGIzyxsnwweUvzZJi0PE2Fp5p+merdnJsdiR?=
 =?us-ascii?Q?SAtrQYRD6AEGLMH96mZgX8tobjkXTerXoC+RPDF/KRP6WK0w7CAjyiYXyJRr?=
 =?us-ascii?Q?oNyFYkqU5wpRbXnp1t4bpNdOeswPwd1v72Yfch8FOvocO+USsQwZo/Znkq66?=
 =?us-ascii?Q?Zyd+YxCpgcOtV6U33LiTCq942nj7qwho7YBM3g1gFtkl4Ko261psA1AzsYRB?=
 =?us-ascii?Q?WGjXakxOqoWI4ISHFPZmMCHokKZwCy+LMAo0NppoLE0RKiS2VTUFp7GrgzkU?=
 =?us-ascii?Q?wCD5Ito63lRE0eOqeQZ6XnqJtrnJgKMLJJy6I/qObgnLJXU6/HJEacGkEOWD?=
 =?us-ascii?Q?XH0rgbZ8FKS/RJumDD2GtMq7jgE9oT+raQYLJ8vj7sPfOkLoNpYN3cEGVRak?=
 =?us-ascii?Q?GJJ/H2ZTILjgcXxNko7wb1IrlX8MP5Qarq4zWy8Tgd0kinPa3ihxXUUIGujl?=
 =?us-ascii?Q?vczKZt2TyiChUuYM1pENnS/87C2UexTUozryOwUX4fEQ8tq9pvE6JpCEaD6p?=
 =?us-ascii?Q?r3OABL58eI/Ypi/oTN/nvmUFjKoyWMsJBA9VQDfdcKq3NyBmWWrDFQ/C0Fgh?=
 =?us-ascii?Q?kl/F8VncsAxAVKljusf7oCnOClmTQ52VQlakf0jbgQ82K2IYobwlrpbQKaS+?=
 =?us-ascii?Q?f5L/tJDE12vZxS+heKZVt+gxPWxBVUA1FkUT6Rr6BnSs1VjuKoshwzng/srl?=
 =?us-ascii?Q?ma2BqcsP+ZJKcBsTmjd//HJcQisovVbOoF+J5afq+mJ280OVuF3PIZGf2+on?=
 =?us-ascii?Q?nLZYiTSQXGGC0W39IqHE9WeT6Vp26Q9hXMz1MwbTfyF706HENMrA5N8i8Ujx?=
 =?us-ascii?Q?hhX8I9sDAHZAIQ/tSsn0YDXIGcwkHmsA3guZmbWQgd6dxk10Jy4cVibIGNwn?=
 =?us-ascii?Q?3V6Y6zrN/zq9TUK5zNrVw6xzeLid2xPUJTn+zhwVu7bBPW0MenEcxAHiQkp6?=
 =?us-ascii?Q?wWusGb2vFl9Q+kynAcL54fqVYdzAZYqR2jyMaP73fqMC0xywMyne9U87AP3B?=
 =?us-ascii?Q?8KEGaOYymvIMCcN/cxoJeNSSdsK+D/8k7OZtX7smBhomScDTQ2MqTCvallVB?=
 =?us-ascii?Q?219DQRmmI9bnCfLOgeNUzsQp1tMBgR6alDpLOn81?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3932867d-1248-4795-3556-08dd1fbc7ca7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 23:34:16.1840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ym/EicilfvV5Z8tZVZSyx0dMtXPLJtDfegcMSPgwQ5hThpIbrtPYwdBEEdX1+IFwcOsO4ju76RyF6TpsVRqLUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
X-OriginatorOrg: intel.com

> static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
>  {
>       r->cache.io_alloc_capable =3D true;
> +     resctrl_file_fflags_init("io_alloc",
> +                              RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>  }

I think those fflags will make this file appear in all info cache directori=
es
(L2 and L3).

Presumably you only want this file (and "io_alloc_cbm" added by next
patch) in the L3 directory.

-Tony
