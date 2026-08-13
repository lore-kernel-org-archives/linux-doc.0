Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80C36A004;
	Thu, 13 Aug 2026 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655581; cv=fail; b=aAC40GioQDmV+KWy5yWWp3NOPOUNU4Lwpztf5w54NkGRQKKw//eqmf1mHW2DlOgB+bwDg0Ji7t+yt3UDOOAPYAj7xtCd6RnCx3yUUDs/z8OVcmefWCmYbOBAhg1iV6wlJQI2QpkZ79ZEVbThOztonkIyjhoCXSpXrqnOpoH82Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655581; c=relaxed/simple;
	bh=8vW+M9JuxRlpFU9AHFz3rlJ78TvpCu67WvdRAbpG5DY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X/IjUAssaGdUJTM2UO+fsNE9j3H7BHvxQKFNIVkwqdPRTxknLjUn06u6qOAHD6LKs4XcYds+k0VzSqzmeg7bmFbWR/o0dsX9A5XBvGp5yG7sqZbC7Nlm1ry6F5RvtqBzVlAHaeE/tFIQVBwJ5G4iuRJiftsPLEtGGpxSW78cWVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bx3/A5ua; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bx3/A5ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786655579; x=1818191579;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8vW+M9JuxRlpFU9AHFz3rlJ78TvpCu67WvdRAbpG5DY=;
  b=Bx3/A5uaI6Q5GMPmPnQmw3RttPep7yZUwzoK7F5aHXMI8Rm/cLgvdqBW
   LuKHow4xpq3U7Am7Fh8G/TkrimCu1VxyO900/Bht1aPDviRK5Khq+WPkW
   snhZ6WaH4rA6+dfjU6+WHoiwWqkCPqEtNIswXF/8RdJYKa1Ip4Ya8tt49
   wcIKZJPc0QekpbNPuzYiWJinnXT/UW7joLdWuQ3ZcKzzLbhXRNErcR8X/
   7w8dozhxSGN5IbKWa5F7EZkPnJUKpxmzAdPlDl++AA5jF4Y7j2XLL9PbD
   31VW0n7vqJvm+EVaBjxGduc6jMtT8t8yFEzoNCpvTNMZIgfRopHVhzkD5
   w==;
X-CSE-ConnectionGUID: ljN/CvNGRhKxpveEpDQ1Lw==
X-CSE-MsgGUID: 7SRrT1WvT22FrcgZo/R0Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87165181"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87165181"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:12:58 -0700
X-CSE-ConnectionGUID: F8CX0nLdRjqMy5f6SQDcYg==
X-CSE-MsgGUID: 3CNxgyiKQ9yXvrgEZ2zoUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="257824978"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:12:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 14:12:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 14:12:53 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 14:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqU1mWkZS7N+7dMDAzG33qOuZogldNDHy3r0LSef2l2KPuCYAwWUS+Aiqr4bz23+j9fhW4DeZuZtO77pkZcEy+hdNLX+l7rBDKPiDWmKt3xOxms3OtXloIUmMzvIP0nY5iXxcW9eBpukKgNZUtY4ygX8lyX+HETNFJ7Jmtcn/zQLSPpBWwAYgG+FEbnNMRF2fU3AAbH8BHN1UzrlkUVibUk/S3/ignX0W20G2qAcWrv7pUoI4zJWNXi9PFKzLtDyAJWbgXfmaScVhwWRjhde7n1WA3CN0pFRqId3mbjrbYBufAzVxhEZe/idDGwHxhicgypim6b0CYaxmy+mGx8LaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+Tcuv5DvxruAa8cQYJJuJr1UKKB1Ndvx8hpmEuuJ8g=;
 b=FbX8QTWXVbOxcOgSzfCmqAtPJ2orwSCElilwVRgsu+iwtaFWmmRlNy3+1gY4oDzJWJR7kNM1i3mnVArPWKdFGY5UyY/WgJOtdfayAEx7nMDiEB6f+xrXG7g6yQE8SvOSSgAGMl6IEYpbPf1VD0FgIwysOR0KBMfdnTlc6Ca8EcK37wYUazE01U7wFn0LTvx83s6zqz0Og2LlRn9KoRSsAaQjAfmRXsqusceEYF/vzG3w1A95yiMs+JteeM6LOCZ9XUcFfpTwR9hyzRkNvPS1S3EwJUjL6Mp8HoF0iZGjBWeVB7HlSHilPgs9tzKs9bEacarV/KSy5jhV8tQQefNnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 21:12:47 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 21:12:47 +0000
Message-ID: <f5879ccb-2639-4e8f-b83b-419b953b4fb3@intel.com>
Date: Thu, 13 Aug 2026 14:12:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
To: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
References: <cover.1783461016.git.babu.moger@amd.com>
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
 <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
 <5fad6e01-1052-4c1f-82f5-02c650ae1ffe@amd.com>
 <e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com>
 <9a53023a-9d6f-434f-96d3-188a176a6cc2@amd.com>
 <0c4e5b4e-4846-45fb-bba9-ae4127393f0a@intel.com>
 <fdc8b919-bd3a-4794-bb3c-06ba3882e02f@amd.com>
 <b4606050-277c-4a3f-9630-5453fa94df10@intel.com>
 <08d27ac3-c5a8-4926-8a60-f7e24d9c1564@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <08d27ac3-c5a8-4926-8a60-f7e24d9c1564@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: c5776d1d-a35c-4c05-d9ab-08def97f9fe9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003|921020;
X-Microsoft-Antispam-Message-Info: /nLoeO+hUZHa3VCYrWqwyVelbZxwoaWJ7AREHHIg9MWZkJwFKGF75mTBLRllui1Qv7oTMUi2Muocb7Ndm5r+1jvTsZjmO+PdcTYtDbqAneWXDJ9iE6TuHjY7Iuss9p98szcXKO/D+r7i+fio560iRK8CJbWo7QNqwqfKnhjO3taYCTt01bW0jiQgRZiPtPQFJdvFNYYuiVbPpZjQ+cZfpIVoBtAImfjlkPOHeiP8h9zVZODDlsjkoe2XQuxthpRCLznefr4yVGLhwMLgWZPd6dAsZXh6qmMQIL2Y/l1zRdwxbrgujglNYw6XBpES+HS/dIN4O/GTzGbcvJgpje5bby6RuIGtq9wy9ALsSn/4iePo7Sc8ux96E+N94VbxLm8tkQKNBg+m3KuDdx4qUWZTW8Tw8cKQHFtugBIW9MMW1DPlUNdLRMD6qBBraRhsyUw95ig2goVcUak5xbU0d1fKN2l/UMgE14X+j4T5owWkxzjFVfzxGK0WFITa2gEEgyuJak1GlgOtIPYvfnhkYklS+PUb/obiypzg5untq/mlVnJyPhZ63IPPDONFDqOYI33A7LLProMZ30Dej8WySD1fkTE2gXh2Si4YHaadbJ776sSvj/1DaLDcpEixJ4uMPg8sJC+Vs07hKxAQzezPqNGWNHPK8Hdes4ylNjhG81Q3jFa1rOThUrGp81lupwkgrwolj5aFY3vNsfeQyhzUqbSDPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R25TNGcraWpFTURTS1BHU1llZlByUFdBWU1DNU5BNlJIaGp1USsrR0VjT05n?=
 =?utf-8?B?RVVyeTU3L0tEVk5rbmFQTmZyQWNJRnBUSXdlMnliY1pEZEJyZmxPUUcwMy93?=
 =?utf-8?B?cCt2cEphMzZnbWJOWmhoakNtVjl3bjM4bzUvNnc5Q2QzaGJIQTRnd2NPZlp3?=
 =?utf-8?B?eXBlTXFCWjUxRU4wYkdVU3l2TGVScCt4V3FpZDVBU1BYcW9wbHFkY1ZUYUVQ?=
 =?utf-8?B?Q3VpQ2R2djFEYUc0NDZxSU9Ka210SzBteWJjOGNrQzlNM1Zob3B5S2l6QTE1?=
 =?utf-8?B?ejlOUUQvMDBRQ3JyM1B4b1FnbUVrUDdBU2RmYVJ3N1RKNEkzMUdoRVRlUkp1?=
 =?utf-8?B?eDIvRTEvWjlSbWJlS2ZGeldvN3dlRXhwa3ZBcjhVbmJDQXdWUjRLUjZ2ZDJ1?=
 =?utf-8?B?K2kvWEZJVm16RDRlY1l4NWp5V1diMG52Q0I1Q3NBc3BWUnVFRVlMN2dTK1BR?=
 =?utf-8?B?Umo4YW81REJmcTZpdlpEK2ZEQm0rd1JvenlWRFl3Lzh0RXRaOVVWOGVLYXQr?=
 =?utf-8?B?czZOMTVoOWZaQ1JsN1o2MVpTdWF1b2R3Q3l3NTlIZEtVTEZVLytwRkw0YmE1?=
 =?utf-8?B?RytpcVVYQ1BhZEpQMnFHOVlNVVJac3hWUkpOZ0lmVU5ueVNQbnl1bUV5ODF6?=
 =?utf-8?B?YXpIakswUVNVMnRqNVBMTG1TSnhPOFpveE9ZZmpKbk9kVEJzdFFXeHQ4QUx3?=
 =?utf-8?B?QmdtODNJaXA4TExaTTlzYnRSb2h5TUFhVGg5cWF2THNrR1ZaZXc0WW8wN0Rx?=
 =?utf-8?B?c0NlUCtLRWpZc1pmN1YvUGNQRmo1d0xDQzFwQUJsSVIveWROY052dCtDWjlN?=
 =?utf-8?B?dHBjMjFGZ2VodENYYUJkQXlHMTluQnVRTXpad3hnVzZoYS9FRUVNV1Y4VGJ5?=
 =?utf-8?B?K2RwdC9JaVgyZWFEaVEwYzZTSkFWODFQZHNwRnNubFp3UU9oOSsrUnRvYXky?=
 =?utf-8?B?UEdjdEcwYitMSDlRWFp1RjMwcmtEbjVHRGhTOTU2Wk54ZmJUMUZmWS9VdG9j?=
 =?utf-8?B?OThzaVFpbFJnMEpIdUJDNkx2MTNJMDZvb0lFYk1nS1RqcDZLcnVrb0FFL3JK?=
 =?utf-8?B?RHphSElzZ0ZMOUhia3plWGNOQWQzRm9Ta3FNcTNaRzVYYmdXK3dwMkJlSW11?=
 =?utf-8?B?a3NFMFIybStBMkJRc1M2ZjRoaFZVZEJYcTZtQlB0cm12dlU1M2VxQlRJVlpS?=
 =?utf-8?B?ZVhvajhNT3VUQ2J5ekJwUytuNkJHOVdIL2N6KzZHQU9qcUNJcXUvQVdIL09Y?=
 =?utf-8?B?NGJLcjFLVmpwdmFzNWFhbTVYQ0xMYVhsbFdxUWhleEFhYnh6enozZFlRdTAr?=
 =?utf-8?B?S00rTFNKVjRIM2FPanZVcjE5Z2xrMG1zVjlTNG5WeXJxeHJYTDN2VDllU1pj?=
 =?utf-8?B?RzBxckMyUFpsc1lLN1ZqaGZOQWV2VUFBbS9Ld3dJSG9WcGF6UmpWOFVvS25P?=
 =?utf-8?B?UjI2QWVjWTV3by8vbzhpWjViT2ZRbGRjeGJYMGtJdmUrMzhaa0hOazBicUNn?=
 =?utf-8?B?WWNZTFoyT3Z1bklSOWEzZUlHTWhaRTRnYW9pbTlkMmZ5Q0VjYXFWZXlxcERQ?=
 =?utf-8?B?RE16YXJSb01WcVJOTDV2a3owR2FKM0JlQys3VkpBYmJxMkd3RWNuUnA4Tkhr?=
 =?utf-8?B?Z3VodisvWDRORmlIMk1WSTgyOTZtU1diSmJQaGJEUW4zb1lYeHZ6NURadmIv?=
 =?utf-8?B?NVVBSE9aVlZwbzc2N3JDL2wwaU5QeE5mL245WDFKZFdKaDlSRk40RENNVmJZ?=
 =?utf-8?B?dGRDTC9yOFBRdE02NGtsNmZvUVRPMTRJZGZEc0tPMW5qMEJuVXpNanBVQWFq?=
 =?utf-8?B?c2M5WnU0TU1SdEVlam5FRXFZNCtIWm1iNEpqaGJ5S2JCK1g3eTVycU9NTjVa?=
 =?utf-8?B?d1FJYXlSU0tjNEJpbTdjZmdSb2ZnTEVINFlKTDkxN1RoTHdhS2pBaGZmRVVJ?=
 =?utf-8?B?UWRjcnhTaEwyR2VWUzZMeVFmYWlFSW8wL3NTQ2dvVEpHdmJPUGpyNDVtZTRx?=
 =?utf-8?B?SXA1YWdaY0RaY29RNFh2d2ZxVjVha1lMdzRuSzhPVUJCRHlyU0czY2t5SHNP?=
 =?utf-8?B?MU5rUmwvaGhENDhvbmlPK0l4bTdFSWxFUCtneHNPenpBaDV3cFRQVFFJa0lQ?=
 =?utf-8?B?c0hPWjdkbkNMV3hRTkRFVDY3dVB0b2ZOTzJFeUg2NWpUVDQzZWx1c0xBSktN?=
 =?utf-8?B?NUEyTEZ5enRoK2hCN1RndU0wdmJ6WHZlNW1EaEh0cWlub0MxcVhaSmphU2Ur?=
 =?utf-8?B?cm5CMHdqcWluY2kyWjJ0SitySXd2RC9SakpURWZrSzdGT240Um5adU04bE93?=
 =?utf-8?B?b0t0dnp2U1o3Q250OXFVaThzSnNCNDRmbEZKNU1tNEdpMTFSTno5ZENkRlFZ?=
 =?utf-8?Q?81h/BNu2Z/Xftlss=3D?=
X-Exchange-RoutingPolicyChecked: JlV5ONJleXg3uSShRqtFdRLW2beOfD0XSGsZW/kedcUXzdwLemoXbZzonb2Fs0R8kBj1DKqB8W7GJJVFeYEL88Tu26quy4wK66VdS1bD3k9KcBaMJfYnjehEp6PDSgb54g2MWE7NhrK8IWHFr35/vKoqxp0CSKRxqHkqhpJxQqI2OopBTpH+L1qru0oZzEZpAhZPg6VMeYdlgMNdCSDj9leuLOc6qnmsskzzXmONdyeuHV4RKnXlO0MSF5VPpQHz6QhFcqhps+s+Q0sffRxWJJhFlCnH6ephu3usXkYDItAKzPXIwzPuovxQ8ZlHNzdMXjDagCRqPAK4f0dKa3RFnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5776d1d-a35c-4c05-d9ab-08def97f9fe9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 21:12:47.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1/hYdzM8PIa8eVrFDmSyFHpNXAvy1E+t6HQhXWzJINtrn2sHyhzG/Pp4RNLon+sCcPlJtYXzTWynEYCDZiPFckxCAtnUO5ahzFVA24gX7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
X-OriginatorOrg: intel.com

Hi Babu,

On 8/13/26 12:11 PM, Babu Moger wrote:
> On 8/13/26 13:18, Reinette Chatre wrote:
>> On 8/13/26 10:12 AM, Babu Moger wrote:
>>> On 8/13/26 10:55, Reinette Chatre wrote:

>>> The "inherit" is the default property if it is not explicitly set. Right?
>>
>> "property" is different from "kernel mode"
>>
>> Each "kernel mode" can have zero or more properties.
>> "inherit" is the default "kernel mode", but it could have a better/more descriptive name.
>> For example, "inherit_from_user" or ...?
> 
> Or "user_inherit_kernel" ?

nit: to me this sounds as though user space inherits from kernel.

Also keep in mind that the filename is already "kernel_mode" so any text would
be interpreted within that context so repeating "kernel" may not be necessary.


>>> # cat info/kernel_mode
>>> [inherit]
>>> assign_global_enable_per_cpu:ctrl=inherit;mon=inherit;group=uninitialized
>>>
>>>
>>> If the intention is to display all supported values for each
>>> property, then we should do so consistently for all properties. For
>>> example:
>>
>> No. The intention is not to display all supported values for properties of the
>> different kernel modes. Just display which properties are supported and what value resctrl
>> would use if the user enables that mode without providing a value for a particular
>> property. There may be properties that could have values for which it will
>> be difficult to provide all supported values.
>>
>> For example, if "kernel_mode" contains:
>>        # cat info/kernel_mode
>>        [inherit]
>>        assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
>>
>> Then user space knows that if they enable "assign_global_enable_per_cpu" kernel mode
>> without providing any properties then all kernel work will use the default resource
>> group's allocation and monitoring. If that is not what user space wants then they
>> can change the value of only the properties they need to change.
> 
> That sounds reasonable.
> 
> When the group is bound to the global mode,
> 
> # cat info/kernel_mode
>   inherit
>   [assign_global_enable_per_cpu:ctrl=assign;group=ctrl1//]
> 
Looks good to me (while ignoring the "inherit" TBD naming change).

Reinette

