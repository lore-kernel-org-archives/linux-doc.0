Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713018F6D;
	Thu, 19 Dec 2024 21:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734644766; cv=fail; b=aevSwz0yfaa8c5i29alM+Z/p5J+gs0x1oL0HAzxaxPotuMsbtt3e2VLdnP9gr/2Vj6UkzIVHugLOITKC7LQdolRmckPHlGgVl365YXuyo23bhTZfbd00PS4H+kbjl4dzUaFcaXs/aq+B963ldwbVZh232cy+7UMh35Ya7C9ZnB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734644766; c=relaxed/simple;
	bh=viM1qUgOI5JIYeL7/mVyIMFdT8pFWQ+rE1nNx8sE9y8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZPCf1vKuXmNkQXkABX6clh9HApyO+K7GgX0VgJjnj8kM8ko8OQgbeqxb4qMUoomPXHDez8d4Nhtw4UomIavJte3wORdbvdRJOLNDsh/AiTHft+9mZP1//Cs39vLyy0xhEZuSixQH8F5ZOjy+aQrlUkmYs9RhUPn4P13K4UQhc+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTojQFT5; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTojQFT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734644765; x=1766180765;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=viM1qUgOI5JIYeL7/mVyIMFdT8pFWQ+rE1nNx8sE9y8=;
  b=nTojQFT51diMdLnVfB0TDkIHfSIBbFjwelp8+bHbNU5+ctgQRPExmCi+
   G9QC+7XVSf7G/LHkvx2ZC2SXUc11QYI+vblILCr/e9AD20Lc33BjHZB1L
   vC1CpEJMiJOChcAUkPnVsVn2z0Xk7VDY4tv8ytE5n0O2K2Itzkhp35gXe
   DT+Re3zZb09J7LdyEwQZDnc7/lC5rd+kwtoPUX51iddIy+F6Rs8ap6O0e
   2RTGyLsUSb9nw4urkjGW8HgS8KGwKKZTjhuc/Rwt5X4B9FvcHfqCOyUIs
   lmjA8CN1BGeS8s+es9A0j7Sxp4Z2ADmwawMiJ17h9fxOfKSVsW3VHBuEk
   Q==;
X-CSE-ConnectionGUID: GquBMQ26SWqAXsdJLfCdjw==
X-CSE-MsgGUID: 7UbOtznYS96FfQwOMzG6SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35331906"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="35331906"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:46:04 -0800
X-CSE-ConnectionGUID: RCFysOryQ2e6vBzSeI0phw==
X-CSE-MsgGUID: UZU2zASqStqJjf0IGjsoHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98118184"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 13:46:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 13:46:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 13:46:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 13:46:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O21HKKiMHs9kWXRQw9z8YHAk/uELeziIaqqTlMKif647I2YmgFgzKiW5oU91WSaoa7jCJoELPTQ/TRDI/e+8o4r2Kdt7HTt1+SlMW2xf7cjKME3dwarrlHVvvQJGIR7UTqgGhwEP6ksAcmrC7I4NIpYIrB6xFCar/CcgUYp3qDPYxIgYRbWayEVQB9zlTYB+wNkFFbu+avxsBQLq9B6bHmmeQRDoTTeYxWsXsSc9gTbvaoiqvXL5AwG//La8wAjktfUsQXnv+aVBd3W1/eA2JJUy/VFFA1HCNF7PVbS7maR9Ohk90UF9BvNjd6Mu4tXfMC0CqMG4I/RAoiT9mwKu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viM1qUgOI5JIYeL7/mVyIMFdT8pFWQ+rE1nNx8sE9y8=;
 b=JfTNI/d0zYXWbTk1RDcskxhWhj4W+SfPprLHPEzHha+HvIMsbNdd7z9FJBhY1JWhDOV8lA8EzeQTrLc9+TWXKOcsNZAGgfSmUynye2HQHAimMQsULDqR1O88oZeTZJ1mL+JfODokXkXC8TSOrS7jhChsdM5uEk4wONeqFP3lLFaiIcshc5OWiB7ahvSPmyPBv/y2qtNRRaf8h0XTLPw6W8jW0Oaoc0dRv5fNR6YHgCt3tvV3syJ9P/b3dusXyafcmY5cFmZ1JsvCB5awMWZpaDd3DYJMGqiBSaKvMC+Bn1J/1gfHppAM6UVWGQHHzL3Uai4N+k39bDxwccDl7rKgIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH0PR11MB8167.namprd11.prod.outlook.com (2603:10b6:610:192::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 21:45:55 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 21:45:55 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Moger, Babu" <bmoger@amd.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, Babu Moger <babu.moger@amd.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peternewman@google.com" <peternewman@google.com>, "Yu, Fenghua"
	<fenghua.yu@intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "thuth@redhat.com"
	<thuth@redhat.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
	"xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "Huang, Kai" <kai.huang@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "seanjc@google.com" <seanjc@google.com>, "Li, Xin3"
	<xin3.li@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>, "Eranian,
 Stephane" <eranian@google.com>
Subject: RE: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
Thread-Topic: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
Thread-Index: AQHbUZhdotO5L3NWaEeUgLf8udqFVLLt+f2AgAAYHICAAAdMAIAAAIsQ
Date: Thu, 19 Dec 2024 21:45:55 +0000
Message-ID: <SJ1PR11MB6083B85BDBD3B756574A0E32FC062@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
 <Z1tzyrUYTFR_iHuJ@agluck-desk3>
 <e43b10b7-60b0-412a-b55f-96271764faa1@amd.com>
 <SJ1PR11MB60831C44DEE7711F93C3C26CFC382@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <8cffb2ad-6645-45a4-8d05-c967c82eb111@amd.com>
 <f8073d8c-7dd0-4e8d-a196-183acef13d66@intel.com>
 <8e96f411-14ac-4d41-82b4-e3076f1c13f1@amd.com>
 <50a4371b-d7a5-48d4-bb79-b9f0f935b5db@intel.com>
 <7db76395-9bc0-4b26-942a-a354d5e3ff45@amd.com>
In-Reply-To: <7db76395-9bc0-4b26-942a-a354d5e3ff45@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH0PR11MB8167:EE_
x-ms-office365-filtering-correlation-id: 0771153a-486e-47f0-d323-08dd20768418
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M2tOQzhkWFB2WXRjMGlkMjZET1BZT2lrbEJxZUhZemt1Qi8rdWRQdGRrY3Rh?=
 =?utf-8?B?b2hGQVFxRXB6cXd3aXJiNE9tNmliNkNBWitWbVNncm9BOGNiT2JMUkF1cnoz?=
 =?utf-8?B?NXpabU9HeWcwTExEUHVJTk96WXprMGEyMDhJR0NlNU1xbmo5VmtUQ2FMWEFD?=
 =?utf-8?B?LzB1YjE5ZjJmdERCMG8xcm5Ia3BiazN1a0JaclJkVWFXSmZSZUhwZzlDSnJ6?=
 =?utf-8?B?cUFET29FdloybjF2b1pQWVEwYXZqbWNhNXpia2lOZ0FqWHlzdVZGMDQ1TTBv?=
 =?utf-8?B?dDlJcmJObjFuQnFiVlBscjIxUkxrWGVuTVFNR1Vxbng4RzJKRElnYWpnNEJz?=
 =?utf-8?B?OSttd2RPQnRxN2hWOUZzL3BKbTBLRjFYUVhZaXZGbjJnRldFTHN0K0RJazFn?=
 =?utf-8?B?U3dUSFIwenN1cEdJWXY2eGpqR1l2d1FiNHFaUGhXblFiTUlQZUlBS0J0Vnc5?=
 =?utf-8?B?ZzBtU042MEgxVEF4clZtLzhhYWlmR0tmSS9memh1ODdyNk9DZy8yTkx3SHJ2?=
 =?utf-8?B?V2pzazM2OENuNzJMMncyM0ZaQlduQkh0MGFxdDZmM3piNTlScmFwbGtvVlhC?=
 =?utf-8?B?UGJwWmVEbm5wSGUxZHBpcnZGZ21OUWhDUENiNUpqMHpFVDAzS2EwMlJUdXRM?=
 =?utf-8?B?OHRQeWl3Y2c3V1Z0YTU3VVF1bUkwNEFmMWpMQnlKdXlKYlNmOU1qZERuMVUv?=
 =?utf-8?B?eVdWSCs5TllHTDNoTzNFdy9NaE5KeFNDektpNEFPK1JUVE9nRFhFUE40Z3Rh?=
 =?utf-8?B?UkxHZ0FaMklxYW1qZ3NabjYyZFJHV3lFeCt5SjNiMXBjTmc3UDI0dFdNbEln?=
 =?utf-8?B?TEdwWWQ3K0tLcG1kUnJBVngyNEdNVWFZZVhHUVE0Y0VrWm9jZlcwUm1YZHJr?=
 =?utf-8?B?N0dlV2FHMFFXRmdNTnRMQlIzREdkR2piS2h3SjlsQm52czhrV2hjbmFVSmU3?=
 =?utf-8?B?ajdRcC83ZFdFWjViQi9WQnpvT1lxRG5Hbm1PdHlmUm9MbTVyLzJiRE1yNWJE?=
 =?utf-8?B?YjZKbHBPMWtFeXhoRGY0Y1owZTFYQW1JRk9yN09PYjhObDlzQXNmS3NzVnJv?=
 =?utf-8?B?RC9IdVQ0UmRxUEkwaW5uY295TjJPUW4xT3FvZFdaZ1MrZ2NObFFWWlFDNDRr?=
 =?utf-8?B?eGJSS2ZSa1FyeVh6YkIzckNyR3Y5eGZsTDJ6aW9QTi9Pc2tNaUwrWGFxcjVW?=
 =?utf-8?B?K3pnQkhKdHhrY05oTGN2c3J4TjNlb0VPckYvcENXTGlTbEwxY3QvSEppTDVR?=
 =?utf-8?B?b2tqMXh0aG5FRHpPc1QwdmozUzV3Y3liZUZ6REUxVTNSaW9vd1g0QVZxT0lK?=
 =?utf-8?B?NXV5UVdETklTdFlBdCtWbmxMTXU1aU9qQU9TSjd1TkJJYjZzOEZCZmwvQ2Ir?=
 =?utf-8?B?UlY4R1VoVWt5Q2p6dzNHYzBQZUxxT2dRWWFEK2VKbTFwRkIxRXJEUzNBRDl4?=
 =?utf-8?B?eVZhSVNBL2luTHB6a1p4WGhvNnY0cmxBd3hQT0FqUmFiaW80NHFiUDlBV1Rt?=
 =?utf-8?B?cmpYWmlBUXpURkw3THgyNVgzSzAyN1dVZmlvekF6K2FZOW9DZFVYVlA0WXJu?=
 =?utf-8?B?Si9mTTNrekN2NHZ1a3ViZjQwODFzQXhoTTU2N05uWXVqTmorWVlJVG96OGNF?=
 =?utf-8?B?OGlFa3UwdTlVNnVReDJnMVBxSitheGl3OUZVUEFxVC9jQ1JHZTJnWStRM1o1?=
 =?utf-8?B?VnJFSkJiWGt6dEVJRkNDdGdPeEpZQmZVVk8yOVMwUkl2NHFGMWVkNmlrZ3Vk?=
 =?utf-8?B?TGRUY1RvUmV2R21EeFVVNDIzTmpGUXVjTS9lcDZUcTVrUzljSDN1a1FJOVM3?=
 =?utf-8?B?c0VCZ2hyeTlNS09oTTVNbEd4bS8vcU5HdTRGVlVsZ1IzWWhEaHR6WVhObmxU?=
 =?utf-8?B?M3l2b09sMytJSnlmNjRCd0dBK3k1MjhoYnVJMGkvSDNOR1ptZlZ3OEFOMGxW?=
 =?utf-8?Q?C28cZKidOIDExb+Ca1S+HQGIJPW/JwM5?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3pYRGhXOFgwd0dvTGx1U0Z0NDI1SDNGbDZLbmtTVmlQakNpMmpvaFBnNkVN?=
 =?utf-8?B?SS9UcmNWYUtJVk9INHNYOGc5WTJOS1dqYlBmTVNwRTFxWFFPY0JPdUJ4ek1S?=
 =?utf-8?B?OFJVQlZOcS9EeFNQTUhMZHZFdXJZUTJvd2tuMk8zbU9NalpKdjJ5NnJad3dM?=
 =?utf-8?B?eFNYNFdLelpBcWhDcmZja3ZhK3I2WjFSbktudVJGTHFLRk9SNEdudnZ4eWN0?=
 =?utf-8?B?ZUNmTW1ZZm5qRDAvRGI1TzNJa3pRalhjY09QYnlIaG9hZXRPN0R6cVZ0OC94?=
 =?utf-8?B?UHk0emJZWTNJdGJyOStLUDcxN2RQODVzZk9BRXY0OUlNc0dGUGozOG9kUDd6?=
 =?utf-8?B?eVhWcy9xMFVYVVExekoxSU5FaEx0NTBPcDF6QllZN1B0QkYyUitsMndKaFdF?=
 =?utf-8?B?eGl1Qm96RlovdG8rcEUwRWdLZjFNWlUwYURQMEVGYThpM0hVdWoxa1N1Z2Vi?=
 =?utf-8?B?TzQreFU5WlRqYzVhRWFCN3duRDFkbVlkVmdERGRkdGlhSWtGTCsranNleHhs?=
 =?utf-8?B?MmRrcjg0OWlMTHdHdW9QUkhiUHBIcTgrR2c5TWNrVUN4K0ZoUXZPUEptTWtU?=
 =?utf-8?B?RTVmWmZLL3VPd1ZZZzU3YkZjbTBWSkVLY1ZTdEhNUk5nRTg0NTZKNDdmdk00?=
 =?utf-8?B?MSsxSGZ6NTg0YlpYTzFiZW1xWXR3S3F4K3FYc2ZWbDUwN2hXMGNjbmVvOUZy?=
 =?utf-8?B?cDk2QUNnZm9ORlB4Y3p3YVM1T3JRejBnQm5zMW5scDFRY3lOZ0ErR21IZ2pQ?=
 =?utf-8?B?MlhOVzA4amptRm1CVGNWZGtFeUFjVU1OUjVsTXVDaFRDTmxXVU05YTViNjJn?=
 =?utf-8?B?Yk91VVNDWGFzVWFTMnNDbnkzSy9QN0YzU1kyMFprSzA0QnZKTFFuWi9ua0lr?=
 =?utf-8?B?UHJWd0J6VlV6SDRFeFdhS0k3QWtBR3M1RC84aG91ellkYVN3Y1IwN3gxT3NC?=
 =?utf-8?B?UkZaKzlPT1podit4cEJ3cXJRL2dNYmhJN0RtVHIvcmNBeFpTUVhRTGl0cysz?=
 =?utf-8?B?WTRrOHc4ZEJDZUxhQnB0KzA2VVBpM1RpdDdrT0tQcStrRW9GcjhtTGNKcUR1?=
 =?utf-8?B?UmpkclRwUEJCanV3aVZxS3VSUzBtK1Iyd3IrbWFNR25ERnVEMGdmeUN1dVFj?=
 =?utf-8?B?MFdDSDhtOStUOHFJWHFVazFUUXdaRzl2cjV1UHNJR2hzcVZ4YVdrMDEwNkEw?=
 =?utf-8?B?Smo4M1h6emtVRFNJc3dPcm9WaUZFdGZRNGFrUnRZMVllSGxlb1Z4ZEI0elFI?=
 =?utf-8?B?RnVTN1Ywc0hOOXJlR002aWZBMW9XNEE5bDhYQ2p1ZmxhRU5lOGFvRUw0WGh1?=
 =?utf-8?B?ajlaRWx2VDZ6bHdXK2tEa3RmWGtXVUZOQlE0VlVzSlNZYytXNTFTSmxQUXdH?=
 =?utf-8?B?TytxcURON0hhR3ZQU2F3TW52eVBaelh1bnJIUmZGOGtMWXRVOGZjOWs0TWJO?=
 =?utf-8?B?b2U3Sm0ydVBQaVNCWUpPekw4WTdZSmkyUURMUVVRTHhvSENtUEVNWmpNVFlG?=
 =?utf-8?B?Y2V5bXdzci9aL2xESzJsRVc0U1FDZjk0Y0dPSTQwL1BvYVdJOUZnejIrdnhZ?=
 =?utf-8?B?K3VZMDF3M1NVeVE4RWY4ajZ1ZjBXdVJoYVgxc01iZ013VXJDRnVLMWYvdmJB?=
 =?utf-8?B?cnJVSXdPTkh3bUxnajNHaVRlM0lWR0U1Kzk1NklxRUNMamMxa3dCYis0YTMv?=
 =?utf-8?B?UG5lR2pKc01nKytqOHZoSHdBcGxkYmRrM0M4RU14Mngwem1haVpjUVYrb056?=
 =?utf-8?B?NUcvSm5FeDN4anFtd3N1NnA1Qmg1UTNpZHMzdUt3NTdwKzRjeGtlOERKS0R2?=
 =?utf-8?B?U0RNbFVwcWlISUVWQWg4Q2s4MXk2VmppSk5rbHNYNWZjSllQYXd2VnVUNTNv?=
 =?utf-8?B?SldMcGpUdjAwL2xZcTN6eDJvMnBHdlpTbnlwZ3BjcXFNZUZmNHRLZXhRclI2?=
 =?utf-8?B?cGk4NkpyN1NZWXlFbm5Hd2VVajdmZ1JPSDBKWkRvK0drU0ZpcXNZLzJHYjRX?=
 =?utf-8?B?dFF1bDVPc0hUSkM2dzJ1MTVpK05VWWpaVnRQcWtONlF1S0dtcmM5ZkF0NldS?=
 =?utf-8?B?Q1VwaEZqRFhvYzcxckUvWU5rUFVkTWF6RHc3TkI5SVVCQmhXU0d6emgzWjU0?=
 =?utf-8?Q?CT5krfsqnt1VfrOa37MNzIstK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0771153a-486e-47f0-d323-08dd20768418
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 21:45:55.0405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8jZDuvMqKqeuGJvFMBqVVWgzrmwhskRuqrnCb8neKCnoRK70tNOMOHqlu3hYnhNc8xtpF76J+VDdEiWADf+uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8167
X-OriginatorOrg: intel.com

PiA+Pj4+Pj4gSXQgaXMgcmlnaHQgdGhpbmcgdG8gY29udGludWUgYXNzaWdubWVudCBpZiBvbmUg
b2YgdGhlIGRvbWFpbiBpcyBvdXQgb2YNCj4gPj4+Pj4+IGNvdW50ZXJzLiBJbiB0aGF0IGNhc2Ug
aG93IGFib3V0IHdlIHNhdmUgdGhlIGVycm9yKHNheSBlcnJvcl9kb21haW4pIGFuZA0KPiA+Pj4+
Pj4gY29udGludWUuIEFuZCBmaW5hbGx5IHJldHVybiBzdWNjZXNzIGlmIGJvdGggcmV0IGFuZCBl
cnJvcl9kb21haW4gYXJlIHplcm9zLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICAgIHJldHVybiBy
ZXQgPyAgcmV0IDogZXJyb3JfZG9tYWluOg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJZiB0aGVyZSBhcmUg
bWFueSBkb21haW5zLCB0aGVuIHlvdSBtaWdodCBoYXZlIDMgc3VjY2VlZCBhbmQgNSBmYWlsLg0K
PiA+Pj4+Pg0KPiA+Pj4+PiBJIHRoaW5rIHRoZSBiZXN0IHlvdSBjYW4gZG8gaXMgcmV0dXJuIHN1
Y2Nlc3MgaWYgZXZlcnl0aGluZyBzdWNjZWVkZWQNCj4gPj4+Pj4gYW5kIGFuIGVycm9yIGlmIGFu
eSBmYWlsZWQuDQo+ID4+Pj4NCj4gPj4+PiBZZXMuIFRoZSBhYm92ZSBjaGVjayBzaG91bGQgdGFr
ZSBjYXJlIG9mIHRoaXMgY2FzZS4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IElmIEkgdW5kZXJzdGFu
ZCBjb3JyZWN0bHkgImVycm9yX2RvbWFpbiIgY2FuIGNhcHR1cmUgdGhlIElEIG9mDQo+ID4+PiBh
IHNpbmdsZSBmYWlsaW5nIGRvbWFpbi4gSWYgdGhlcmUgYXJlIG11bHRpcGxlIGZhaWxpbmcgZG9t
YWlucyBsaWtlDQo+ID4+PiBpbiBUb255J3MgZXhhbXBsZSB0aGVuICJlcnJvcl9kb21haW4iIHdp
bGwgbm90IGJlIGFjY3VyYXRlIGFuZCB0aHVzDQo+ID4+PiBjYW4gbmV2ZXIgYmUgdHJ1c3RlZC4g
SW5zdGVhZCBvZiBhIHNpbmdsZSBjaGVjayBvZiBhIGZhaWx1cmUgdXNlcg0KPiA+Pj4gc3BhY2Ug
aXMgdGhlbiBmb3JjZWQgdG8gcGFyc2UgdGhlIG1vcmUgY29tcGxleCAibWJtX2Fzc2lnbl9jb250
cm9sIg0KPiA+Pj4gZmlsZSB0byBsZWFybiB3aGF0IHN1Y2NlZWRlZCBhbmQgZmFpbGVkLg0KPiA+
Pj4NCj4gPj4+IFdvdWxkIGl0IG5vdCBiZSBzaW1wbGVyIHRvIHByb2Nlc3Mgc2VxdWVudGlhbGx5
IGFuZCB0aGVuIGZhaWwgb24NCj4gPj4+IGZpcnN0IGVycm9yIGVuY291bnRlcmVkIHdpdGggZGV0
YWlsZWQgZXJyb3IgbWVzc2FnZT8gV2l0aCB0aGF0DQo+ID4+PiB1c2VyIHNwYWNlIGNhbiBkZXRl
cm1pbmUgZXhhY3RseSB3aGljaCBwb3J0aW9uIG9mIHJlcXVlc3QNCj4gPj4+IHN1Y2NlZWRlZCBh
bmQgd2hpY2ggcG9ydGlvbiBmYWlsZWQuDQo+ID4+DQo+ID4+IE9uZSBtb3JlIG9wdGlvbiBpcyB0
byBwcmludCB0aGUgZXJyb3IgZm9yIGVhY2ggZmFpbHVyZSBhbmQgY29udGludWUuIEFuZCBmaW5h
bGx5IHJldHVybiBlcnJvci4NCg0KVGhlcmUncyBsaW1pdGVkIHNwYWNlIGFsbG9jYXRlZCBmb3Ig
dXNlIGJ5IGxhc3RfY21kXyooKSBtZXNzYWdlczoNCg0Kc3RhdGljIGNoYXIgbGFzdF9jbWRfc3Rh
dHVzX2J1Zls1MTJdOw0KDQogICAgICAgIHNlcV9idWZfaW5pdCgmbGFzdF9jbWRfc3RhdHVzLCBs
YXN0X2NtZF9zdGF0dXNfYnVmLA0KICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGxhc3RfY21k
X3N0YXR1c19idWYpKTsNCg0KSWYgeW91IGtlZXAgcGFyc2luZyBhbmQgdHJ5aW5nIHRvIGFwcGx5
IGNoYW5nZXMgZnJvbSB1c2VyIGlucHV0IHlvdSB3aWxsDQpxdWlja2x5IGhpdCB0aGF0IGxpbWl0
Lg0KDQoNCj4gPj4NCj4gPj4gIkdyb3VwIG1vbjEsIGRvbWFpbjoxIE91dCBvZiBNQk0gY291bnRl
cnMiDQo+ID4+DQo+ID4+IFdlIGhhdmUgdGhlIGVycm9yIGluZm9ybWF0aW9uIGFzIHdlbGwgYXMg
dGhlIGNvbnZlbmllbmNlIG9mIGFzc2lnbm1lbnQgb24gZG9tYWlucyB3aGVyZSBjb3VudGVycyBh
cmUgYXZhaWxhYmxlIHdoZW4gdXNlciBpcyB3b3JraW5nIHdpdGggIioiKGFsbCBkb21haW5zKS4N
Cj4gPg0KPiA+IFRoaXMgbWF5IGJlIHBvc3NpYmxlLiBQbGVhc2Uga2VlcCBpbiBtaW5kIHRoYXQg
YW55IGVycm9ycyBoYXZlIHRvIGJlDQo+ID4gZWFzaWx5IGNvbnN1bWVkIGluIGFuIGF1dG9tYXRl
ZCB3YXkgdG8gc3VwcG9ydCB0aGUgdXNlciBzcGFjZSB0b29scw0KPiA+IHRoYXQgaW50ZXJhY3Qg
d2l0aCByZXNjdHJsLiBJIGRvIG5vdCB0aGluayB3ZSBoYXZlIHRodXMgZmFyIGZvY3VzZWQNCj4g
PiBvbiB0aGUgImxhc3RfY21kX3N0YXR1cyIgYnVmZmVyIGFzIHBhcnQgb2YgdGhlIHVzZXIgc3Bh
Y2UgQUJJIHNvIHRoaXMgb3BlbnMNCj4gPiB1cCBtb3JlIGNvbnNpZGVyYXRpb25zLg0KPiA+DQo+
ID4gQXQgdGhpcyB0aW1lIHRoZSBlcnJvciBoYW5kbGluZyBvZiAiYWxsIGRvbWFpbnMiIGRvZXMg
bm90IHNlZW0gdG8gYmUNCj4gPiBjb25zaXN0ZW50IGFuZCBvYnZpb3VzIHRvIHVzZXIgc3BhY2Uu
IEZyb20gd2hhdCBJIGNhbiB0ZWxsIHRoZQ0KPiA+IGltcGxlbWVudGF0aW9uIGNvbnRpbnVlcyBv
biB0byB0aGUgbmV4dCBkb21haW4gaWYgb25lIGRvbWFpbiBpcyBvdXQNCj4gPiBvZiBjb3VudGVy
cyBidXQgaXQgZXhpdHMgaW1tZWRpYXRlbHkgaWYgYSBjb3VudGVyIGNhbm5vdCBiZSBjb25maWd1
cmVkDQo+ID4gb24gYSBwYXJ0aWN1bGFyIGRvbWFpbi4NCj4NCj4gWWVzLiBXZSBjYW4gaGFuZGxl
IGJvdGggdGhlIGVycm9ycyBpbiB0aGUgc2FtZSB3YXkuDQoNCkkgdGhpbmsgaXQgaXMgc2ltcGxl
c3QgdG8gbWFrZSB0aGUgInNhbWUgd2F5IiBiZSAiZmFpbCBvbiBmaXJzdCBlcnJvciIuDQoNCj4N
Cj4gPg0KPiA+Pg0KPiA+PiBOb3RlOiBJIHdpbGwgYmUgb3V0IG9mIG9mZmljZSBzdGFydGluZyBu
ZXh0IHdlZWsgVW50aWwgSmFuIDEwLg0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciBsZXR0aW5nIG1l
IGtub3cuIEkgYW0gY3VycmVudGx5IHJldmlld2luZyB0aGlzIHNlcmllcw0KPiA+IGFuZCB3aWxs
IHBvc3QgZmVlZGJhY2sgYnkgdG9tb3Jyb3cuDQo+DQo+IFN1cmUuIFRoYW5rcy4gSSB3aWxsIHRy
eSB0byBnZXQgdG8gc29tZSBvZiBpdCBhdCBsZWFzdC4gVGhlIHJldmlldw0KPiBjb21tZW50cyB3
aGljaCBuZWVkcyBpbnZlc3RpZ2F0aW9uIG1heSBoYXZlIHRvIHdhaXQuIExldHMgc2VlLg0KDQot
VG9ueQ0K
