Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8613A86C;
	Wed,  5 Aug 2026 00:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888167; cv=fail; b=bLhctKpHgjYUpkAOtFwy02ZaIdyy1dNn1+EeTKwek0p+oVZhLQEoJqb6i8zf8+1SMHNwE+PRoqIzzXrBqi27rfra5WUlfZXoPIQkZvTuO6y9C0PNXLVxIExt0MBlDVjxVI2/CkKaAu451NKzGgp/z8KnXM7KkV1Y32ub/Fkiv98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888167; c=relaxed/simple;
	bh=q+sV29IPe2ZP1KQNF48o9fMuE10ARkxLA2nb+wWcZz4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ncM/JTPXJKV6oEggHpTvHU/6phcswSpYNfKNY66DYAPHz/hh5nnferrg12KgtW4Dib9o0as4GrB4qc97PaIXFgTMhY99dUyXGhoWNmMX2xpUohSF1n7O+fyOdfJrm33aTwVZN559N1HAkhFSMV84jcReH1xPkLCfKrWRXeWwq00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOwQwl6n; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOwQwl6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785888165; x=1817424165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q+sV29IPe2ZP1KQNF48o9fMuE10ARkxLA2nb+wWcZz4=;
  b=SOwQwl6nFqrzIm5CrUMPa8o0KjHaO+1ibVqoBd/bEcBfqC9IZ9KXEIBu
   NNV3jhKBf/S95cRyZu97aMe2WPWBw/cN62+pseqezNwEK+UasdKNGCdZ6
   5CAxqPUHKn4IkFA/PKsurDysIs7RW1engh0qtVR9jCtJrw/FyskaUcNQF
   7war88vCkcKZmI/l4905qtGfkPpiz1rksHZ0akobE5Q2dT6egTPH4QYUH
   9pE1s790bCIGute8i9y8bKXC1GyULJYOXkjJ5M2kno/4lHibIfJ6oDiE9
   ZoqUcOpxa0AQqrY5AyANFs+TfNR3sjeYyRTp3FXtlU+mpn2hUFuIxkXXy
   Q==;
X-CSE-ConnectionGUID: P4XA7RDEQ5+zqb7+4ukuww==
X-CSE-MsgGUID: EjZ7Pa6ARIKgqa0vuKYXEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97957566"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="97957566"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 17:02:44 -0700
X-CSE-ConnectionGUID: gRpNAg+WTVid/gHFSbchmA==
X-CSE-MsgGUID: DhmAyXABRPGVvqeYiKh1Ow==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 17:02:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 17:02:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 17:02:42 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 17:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVAnX2a5dlFBH4MikhmJ/w3sNpKMDGuIhyQl/FVMPwBRqf7ZI6EMQpaY6ttZQFqJAabWpkdqQts4brXHraonjn1lVZDH+aJ+z5EUXsBxgrbM8aAsmLbPfXiaiO5Mrf06G32yHWdc1XJxzYPIxCbvsKlR0g/fi0QxyvLhgS4kyHcpakZ2Rd1PjsFKcDPWeIMcGfGRSv837/rpkcokuu5bVvhC22Om+q/wz+w8uCjtZg5jOFL2Ch0kx2eD4Qqgbmt7OUJg3YQUHNzGYdNYeaSPi/qz9anxMuuyc9DDF5tb9W2m0O4xxUM0BKcriAnE2ZIFyhUVwncGHQpvjfRKFTmzlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+sV29IPe2ZP1KQNF48o9fMuE10ARkxLA2nb+wWcZz4=;
 b=cEtNUncUFauH0IrskhCRA+wS9e48YF53eRtIPZVQTco/g1zvAuZLiTDHaJy9nwL7P4D8NgXUEfqGdJ8bHBz/gOeH5P0HRLOB+UcICqNOAN7tYiy2wbnMJsdZ8OVCWACbTM1xrI4NLyp+MnHM4yx9FBQ6GHrS4GSpR3+Cy0eHYKmDjQcNBydwR+uPZbPj/lausz3EkUXSbBBe4gmjhqTffVwBKi5L9e8lZEUJt+RHijuXhTC3OBzWIWZrEJIVQ/VmKSHQ6zgS8/Rr9V4LZh+Gj8ZKgpW0YgMM7VeU32PiTBOz3mKUSsDyl5/uryrzcZlLinIEdjgCtt89eK8Fe+agQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DM4PR11MB8201.namprd11.prod.outlook.com (2603:10b6:8:18a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 00:02:35 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 00:02:35 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>, "x86@kernel.org"
	<x86@kernel.org>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Topic: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Index: AQHdHtxAj4YGLGgJr0yKZVW5LIjWgLaDgPwAgALovgCAAA7gAIAAARAAgAABkYCAAA3vcIAAQdcAgADxugCAAK35gIABd6uAgARrUACAADCpAIAACkWAgAAD/8CAAAsFAIAAAZBA
Date: Wed, 5 Aug 2026 00:02:35 +0000
Message-ID: <SJ1PR11MB6083DBB0D7FF2B466F9CA808FCD32@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <SJ1PR11MB6083C1B9D29DF6184B50597BFCD42@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260804234048.GGanJ4gFClcqwTHHDJ@fat_crate.local>
In-Reply-To: <20260804234048.GGanJ4gFClcqwTHHDJ@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DM4PR11MB8201:EE_
x-ms-office365-filtering-correlation-id: 3e744d33-e3a8-4b78-6bbf-08def284daa8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021|10067099003;
x-microsoft-antispam-message-info: r23arPE6EVFheM9aMhLbr8iNnBiV/lMRvX+wCAIndp59RDllhRgiWuB2kKVfhBQgnyw5bHwJbOcdQbhgEfs+2DPGe9cu81NjuMYhZqklh4Vmuqt6iBU3lOUAoYDKFSuh7qyPiH09tif4tL7MWp37XiOZWRSjYvmgIrFeiPpppHaGpb2WNPRVmaRHdwCQmDo3cHNx805j6uuDvO99HMGOqqWlElMvWeHHuLDv8s7QdgwiZeRBZlnbl8kaVoYdNH/aLrb6B2U6Q4BdoTJnqtWByAox/2+aR+4KSkfQz9/hLWuDWHD7ZpVJ9qvzaI24Ax3cIYfkViVptQGTcdGs2KH0z9vOPkPIlVnR3gPLXvK9HHni1EzjLVrUf+8+fV8KovWAl96HTUDebeg9e7vWSoMGoLmB3Q8TR8vUlKQiXsYi0gz03Zi673kjnPkmdOAF+S8uf+cx4BIjPr3ZSCaTCHpNW8DlsnbWNEgZDgntABStAFxqoh/f/NuR/ExWsIYlgU1J8L/j9B4x9nHjgbOCpqwfA/WSgktwdQuXqzFIG+KmnNRXJmmwjsSadeXr46ZlKDpaf8SKGw/O5wxmBPr28fjynXDVfW7Ho3d2JQyLJOCgLDsyqcqLoHEACJ5U/iiW4C1NcYk9R1P97mPwzqszUKfQvwuqMzJ8w9EgD93Oq7JRnR0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2NjUnpHdHVEblhld2VKYzBtdG9QMnE4UFUzQXZHSk05aUR4ek93TkpOYUxw?=
 =?utf-8?B?YlVGYlJuNGNSUG01RVJ6WGRVano1NVdFKzhZVUlNQ3lKeGVseW1QblBXOEpF?=
 =?utf-8?B?N3hKcHY4U1UrT0MyOGdHYUx3cmZCc3lnVlFsYXY3MWV4ZkNueUR2TmhEMUlW?=
 =?utf-8?B?c1JXTzZkQnY2c1MyaDFvZ2xWVTNvVUh5cTcza2tWMzFRdjNYQ2szcWpiNUxv?=
 =?utf-8?B?YnpZSjZUTVR3T21Zb3dKY2tRWHhGNlJVa3hPaENmU0RZVktHQW9kL2NzREhZ?=
 =?utf-8?B?VWdWQUFCSFF1MGhJczYydUJLYitJN1poVW51SW5ONlVHbEo5cEh4NEtOQUxJ?=
 =?utf-8?B?aEt2OTVPV1hYL1pUSk1OSHl5eUFqZjlmc243aEl2NjQ1WmdRbUZLVzFoV3FU?=
 =?utf-8?B?OHlNcko3RzhMMVA2c0JNZ3ExU3REZUxLRUQ0bGt2bVdNZTg4aWlzMlEvMlpP?=
 =?utf-8?B?OWNETm45akhRTE5PSC9qaE5rRTFYLzA4bkw2TUswblFHWnNoQkhsbmpoWFlO?=
 =?utf-8?B?VHNpN0ppb0hRU0I1MjZjOVY5aWxxMUFrZlBFaU5MblNzWDlWZEhtR0wvY1hF?=
 =?utf-8?B?dWl0eE1xVkZZQlFCRTJ3N3BXUzdSdFZqUTVVcDZZL1hNSWhhblJraU5UbTJ3?=
 =?utf-8?B?VlRNdHpHbDUrSHVFdEtndVkyNFF2WDZuZHh1aFVSNUhIdGVjclFrME9hcWFq?=
 =?utf-8?B?eE4vRlRORWM3Y2I1TnVSc3dBMGw3NWFjcmJheStLZmlwaTUzenV0Qzhjd25m?=
 =?utf-8?B?VDljUmlkcmkvMDZVVGZsRjNLd1YzcmpsZ3A0cnhGQndXSllFRU5YeFA4di9J?=
 =?utf-8?B?SWRueTJ0ZFJiMUVPQ0E3YU15SFB5YURvZHN0bnBnRDBCK1J6RzV5SkE2cmt5?=
 =?utf-8?B?Ny9hK2lRVnlkRlhBdmVuWFBFYVJOWUN1RlJIR3ZaV0RnYzA3dmFudEtPNDFh?=
 =?utf-8?B?TVhTSHpycnVEbDcvNTQzVjladjduVUp1M3VhZzNpTVdDbzBIY0FQVmI2MHQ3?=
 =?utf-8?B?TEpNMzZPQ2R4dlllWVFzWDN4Z3R0eWcvTlhQVzZ2WENkZ0FOZmQvN1dpQm9j?=
 =?utf-8?B?M0ZaYkR0ak8weWxLclZ3emUzazNNOGQvYS8ycXRsc1dTQ2gyZVFDdkNBNVRW?=
 =?utf-8?B?c0hDNXd0d25RUVpPK01PY3hpN0JrSWxKdXBKOEFuaE15Nkw4amIrNUpJVisv?=
 =?utf-8?B?UE5rbzlLU1BFVnJsVEc3Q2FGeHB5U1M1alNQTVU0NlRrZE1rWmZkYm80OGM5?=
 =?utf-8?B?ZWlibDA5R0JVd3NMdVFMdEZJUVRDNHJCWVFnZlptZU5POVVXb0dwcGg4OFd3?=
 =?utf-8?B?YXBiR29McXJ3a1lnQUI3NkZRTXNxd1ZMS2x3cTRBakxVWitjRDdmK09CajFr?=
 =?utf-8?B?K1JXSHJsSGdkcGYrNDE3SEtiTXFPN1pQZzk1QnNCcDBFckFmay9NWG1FNDJC?=
 =?utf-8?B?RjhaTnhibTFJUTkwTnJtZG5idjMwNFladGYvNFUyZ28zamhqcEE1WnovT3lt?=
 =?utf-8?B?U2dMcjZvVW9NcW1aQkxUM0JWMVFJekpsdkJTTFRlcENpQ2RydEZkMkRTWjZC?=
 =?utf-8?B?M1lHMzRvaHk0M1k2anAzYjNQWGo3TjBQVmFQYytsdnZUcjlJQWcwa0Jpbkh6?=
 =?utf-8?B?ZXVWa1pkZDRTTjU3MTR1eURJaGZMTm0yaDBQSXZxVUNydk1VTSt2YldTRnFC?=
 =?utf-8?B?LzBPK0g0aWlCZjBPa1lDNWdTWEgwLytHQVNEVEdQaGljV2QxSmplZkdWV1NG?=
 =?utf-8?B?THN5YTg4ejN6aXpoVm5KbHV2bk5mU3NXamtFMERSOGVxdmtLOEhpYUFRQ0lN?=
 =?utf-8?B?QmQ5R3BCWnRST3B5NGRIM2NCYjMvREp4QW05Q1NPOXR3eDJCdVN5QTR6TU8r?=
 =?utf-8?B?SmhrUFdQSisxRGVickkzM05yL0ZyNE9TbDFjeEIrbHRMSkgvdWxNdlpuTEpP?=
 =?utf-8?B?d3VYUWY4SDU5dllzTnRUQThlVjZGM2grb0VCN2dPdWZwZjk4RnhNME9xZHNs?=
 =?utf-8?B?QXFLdTY3Z0ZoRTBJSThGaTM1aE00cUVBVzlDUnQ5NUc2TGxUOG5kQ3VLSEp6?=
 =?utf-8?B?UkZqTC9zWkVXS29xMWMxV2VxbnMwS1ZKUUM0RXhDMFhETjlwNkpNWXVlbTR5?=
 =?utf-8?B?dExIOXRhQkkrZTk3VXBMTlFCVUhIWUJCak01R2IvQWxpN2h2SkZiMU5hKzdZ?=
 =?utf-8?B?QjlSWDIzS2xFNzE2OTV5YUpVK0F1Uyt2cWdwRkFITi84NGhxZnppY2M1S3Rq?=
 =?utf-8?B?NCtxS2w2NCtMVjcxRzU4SzZCbVI2UGNOTGJsYkVDV0p0VlAzMmhWeDZoSC9q?=
 =?utf-8?Q?Py4AzilFhC+uzI8byT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: i55sAJhXOcQd/bxNF+wiHzX1LLIGDgw1FDqSJaLNOfTQp6JKmfwba7asJtM7QST3WtdbH5ZVVP/UnE9YJa7+1jRVXkI+oZLrM0afRz9zL8mXKqE935VmoApUG3zvdVf8Y8y9uiZjA0Hffd6oCKbosNMOU+j/huLNzOkTtI5rxlMxIJ9GQJlsqJKaPeso8OMWUwafIEqnJA2+GV2QGGa6bZPaKN7hzLRvamu4SKNWN+lPCRaNDG8Uzy552mDKQXXl1wIplP0zoS1ChiYz2aAjvZD8EVw4ul0HYjx5qOvzNwseHkBxCbA3trYk+iIHZ21N3I4XLMqAFipktqMe2Y5Azw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e744d33-e3a8-4b78-6bbf-08def284daa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 00:02:35.1004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nPwKPsxkEVj3nCZZs95XOoEFVeCjOLZ4Pf7U36UFEao+tdLyLC3omYwLvrVyzyTGCi6KZGwiOg6JCS3C3yL1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8201
X-OriginatorOrg: intel.com

PiA+IEludGVsIHN5c3RlbXMgaGF2ZSBjb3VudGVycyBiYWNraW5nIHVwIGV2ZXJ5IFJNSUQuIFNv
IENQVUQgbGVhZiAweEYgdGVsbHMNCj4gPiBMaW51eCBob3cgbWFueSBjYW4gYmUgdXNlZC4NCj4N
Cj4gQXJlIHlvdSBzYXlpbmcgdGhhdCB0aGVyZSBpcyBub3QgYW4gSW50ZWwgc3lzdGVtIG91dCB0
aGVyZSB3aGljaCBoYXMgbGVzcw0KPiBjb3VudGVycyB0aGFuIFJNSURzPyBJZiBzbywgdGhhdCB3
b3VsZCBleHBsYWluIHdoeSB0aGUgZXhoYXVzdGlvbiBoYXBwZW5zIG9uDQo+IEFNRCBvbmx5Lg0K
DQpXaGVuIHRhbGtpbmcgYWJvdXQgdGhlIEwzIGV2ZW50cyAoTDMgY2FjaGUgb2NjdXBhbmN5LCBt
ZW1vcnkgYmFuZHdpZHRoKSB0aGlzDQppcyBhY2N1cmF0ZS4gQWxsIFJNSURzIGhhdmUgY291bnRl
cnMgZm9yIGVhY2ggZXZlbnQgb24gZXZlcnkgcHJvZHVjdC4NCg0KQUVUIChBcHBsaWNhdGlvbiBF
bmVyZ3kgVGVsZW1ldHJ5KSBoYXMgc2VwYXJhdGUgZW51bWVyYXRpb24gZm9yIG51bWJlciBvZg0K
Uk1JRHMgc3VwcG9ydGVkICh2aWEgVlNFQyBlbnRyaWVzIGluIHRoZSBQQ0llIGRldmljZSB0aGF0
IG1haW50YWlucyB0aGUgY291bnRlcnMpLg0KQWx0aG91Z2ggdGhhdCBkZXZpY2UgaXMgb24gcGFj
a2FnZSwgdGhlIG1peCBhbmQgbWF0Y2ggYmV0d2VlbiBzdHVmZiBvbiB0aGUgcGFja2FnZQ0KYW5k
IHRoZSBDUFUgY29yZXMsIG1heSBtZWFuIG51bWJlciBvZiBBRVQgUk1JRHMgaXMgbm90IGVxdWFs
IHRvIG51bWJlciBvZg0KTDMgUk1JRHMuIElmIEFFVCBoYXMgbW9yZSwgdGhleSBhcmUgd2FzdGVk
IGFuZCBjYW4ndCBiZSB1c2VkLiBJZiBBRVQgaGFzIGxlc3MsIHRoZW4NCnJlc2N0cmwgZHJhZ3Mg
dGhlIGxpbWl0IGRvd24gdG8gbWFrZSBzdXJlIGV2ZXJ5dGhpbmcgdGhhdCB0aGUgdXNlciBzZWVz
IGluIHRoZSByZXNjdHJsDQpmaWxlIHN5c3RlbSB3aWxsIHdvcmsuDQoNClJlZ2lvbiBhd2FyZSBl
eHRlbnNpb25zIGhhdmUgc2FtZSBpc3N1ZSAob25seSBkaWZmZXJlbmNlIGlzIHRoYXQgdGhlIGVu
dW1lcmF0aW9uDQppcyB2aWEgQUNQSSBpbnN0ZWFkIG9mIFBDSWUpLg0KDQo+DQo+IC9tZSBnb2Vz
IGFuZCBsb29rcyBhdCB0aGUgU0RNOg0KPg0KPiBTbyB0aGVyZSdzIGxlYWYgMCB0aGVyZToNCj4N
Cj4gRUJYWzMxOjBdICAgICBNQVhfUk1JRCAgICAgICAgTWF4aW11bSByYW5nZSAoemVyby1iYXNl
ZCkgb2YgUk1JRCB3aXRoaW4gdGhpcw0KPiBwaHlzaWNhbCBwcm9jZXNzb3Igb2YgYWxsIHR5cGVz
Lg0KPg0KPiBJJ20gYXNzdW1pbmcgdGhhdCBtZWFucyB5b3UgaGF2ZSBzbyBtYW55IFJNSURzIGFu
ZCBhbGwgb2YgdGhlbSBhcmUgYmFja2VkIGJ5DQo+IGNvdW50ZXJzLg0KDQpZZXMuDQoNCj4NCj4g
QW5kIGlmIHdlIGxvb2sgYXQgb25lIGV4YW1wbGUgaWYgRW1lcmFsZCBSYXBpZHM6DQo+DQo+IENQ
VUlEIDAwMDAwMDBGOiAwMDAwMDAwMC0wMDAwMDA3Ri0wMDAwMDAwMC0wMDAwMDAwMiBbU0wgMDBd
DQo+IENQVUlEIDAwMDAwMDBGOiAwMDAwMDAwOC0wMDAwODAwMC0wMDAwMDA3Ri0wMDAwMDAwNyBb
U0wgMDFdDQo+DQo+IGh0dHBzOi8vaW5zdGxhdHg2NC5naXRodWIuaW8vSW5zdExhdHg2NC9HZW51
aW5lSW50ZWwvR2VudWluZUludGVsMDBDMDZGMl9FbWVyYWxkUmFwaWRzXzAyX0NQVUlELnR4dA0K
Pg0KPiBUaGF0IDB4N2YgdGhlcmUgbWVhbnMgMTI4IGNvdW50ZXJzIGZvciAxMjggUk1JRHMgc28g
dGhlcmUgY2Fubm90IGJlIGFueQ0KPiBleGhhdXN0aW9uLg0KDQpUZWNobmljYWxseSB0d28gdmFs
dWVzIG9mIGludGVyZXN0LiBDUFVJRCgweEYsMCkuRUJYIGdpdmVzIHRoZSBtYXggdmFsdWUgb2Yg
Uk1JRCBmb3IgYW55DQptb25pdG9yaW5nIGZlYXR1cmUuIENQVUlEKDB4RixuKS5FQ1ggZ2l2ZXMg
dGhlIG1heCB2YWx1ZSBmb3IgdGhlIGZlYXR1cmUgaW4gc3VibGVhZiAibiINCih0aG91Z2ggd2Un
dmUgb25seSBldmVyIGltcGxlbWVudGVkIHN1YmxlYWYgMSBmb3IgdGhlIEwzIG9jY3VwYW5jeSBh
bmQgbWVtb3J5IGJhbmR3aWR0aA0KZmVhdHVyZXMgLi4uIHNvIHRoZSB0d28gdmFsdWVzIGhhdmUg
YmVlbiB0aGUgc2FtZSBzbyBmYXIpDQo+DQo+IEFtIEkgY2xvc2U/DQoNCllvdSBhcmUgYWxsIHRo
ZSB3YXkgdGhlcmUgOi0pDQoNCi1Ub255DQo=
