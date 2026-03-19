Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C412DAFCB;
	Thu, 19 Mar 2026 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946031; cv=fail; b=M/6Bfm+RPaNyTNjJJhtdcsF2cM4jN4NXAij6XpLHy74UfMegTiSToDrArg9V7Nbh4rh4W1RumqWXE20HS2IgTofO7+AXZKuDMiU9e2pIqEOXaIqi6+TinQwwpKnsIRTpJB20SfPRdhQkSkRiTCWNB7S7HWfaC6MDnzFGqWJwPXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946031; c=relaxed/simple;
	bh=piK8sc0uS96UPxqxIkbU26ukjb9pcnqMyQDqhQL/GqQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z5sGbPSivkwWwxbDRcRImf8aSI0BXVuO3F4T6FSrUbDKbR67LjcxltAT2nIUp48KmdRmgtqybCU8mNF3PXL4XZ+bEdNq0gYPxiXbj8HI75KZ+zeLwW3NglEsyykby3VCKYqETDDqGn/UBWrrnyL28a2e7+hWvWT6yNUeV4Fpl3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWFHAgjH; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWFHAgjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773946031; x=1805482031;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=piK8sc0uS96UPxqxIkbU26ukjb9pcnqMyQDqhQL/GqQ=;
  b=cWFHAgjHGKJD/OD4NoF0W60ygWsjZdOyNU1sJjJdCmTLWS/ztwT9E/vU
   hZs3BUy8KQyxCnRVSOMbqFeKTgqH8JKi1DrqEXW3dxDrlUVXc19MbPJb0
   FzsogIzhhDC2zHUQY5Yy2q2W2/8cgYmhPoXVCZmg+DxjiMxM3FkkBB/dh
   Az8kiBkNLxU/g99ZrFuwBsluyj07FahAahNuxCdz8tPTniBUy25WlyEui
   tzlf/hjedB/KUpoljHuYT+FTjLCHMi+Y2denckb5KhyYPRlRfUl/aI+G3
   LRdnxtFY0FUUG5TThUgav1zKk+1W2+QvcQM3pR1MjXmXIJaA6OhLh92i+
   g==;
X-CSE-ConnectionGUID: 21GkPTqdQ2Od5od3feU60A==
X-CSE-MsgGUID: sHg5tBU8TvWU5B28QHXvRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74939985"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74939985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 11:47:10 -0700
X-CSE-ConnectionGUID: twiDU3caRdq3neM0I3OQBQ==
X-CSE-MsgGUID: eWdNYhJARFa+qhrQC/8MaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223278495"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 11:47:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 11:47:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 11:47:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 11:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX6ReA5Rs0CEcqnCemaG/PHibFhVEYTefisyt/uTPiJVJ0LqTkVR0knTUuRBeq97WMlcDyV4Jul4DdcuCbdSMvkQG1oJVMk0W8B67JkZW6Cpiqi1V6iVRCJLv1eaFgKEFqLKqWi9WhhrCdqijIsY/8VB9UMKn+vajk7I2DnwsU2i4zDLYO+3r2qdWb34a/TDtDsCMcUmW58HN7K+zRWjDxL5xt+UWLAWsI6YUmhl7CFADDHkRwj/xcGIfbK9VQleSAnT8RVUfGve5AXLC8yPJawOAxzuwHCH6Dc4BxxuFvsF29c/EVaMmO8yvQjAGIqA9wEvwxOYzcWYo84ohkh+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCITQU5QYSOtvAur6zPlqi6B40tiirl6vlveS80ijdA=;
 b=dBGOCOLcJBSqIFDLnb8UnnH/Iutu+nTjue7Z4xCq+/9XKF0K/ooVK9gf12wAjWCXpNYvtDOIKpLbZlMrVfQgNiZ7+HV2k1xu5/jzOfq0ZO/gmQ3obSEkBX0c9dFm6PSjFkp3AZ3ppBL+FgSpSvowgKLDkfa1mUQr2thx6B+BmEZ7WoBXEuhea9inwzksrVeuGqzai8yIbxaPA6y/uuNPtRY6F+ZZKbhjihfpJWjNgVh1VeZ1ttaofg3XS6ocKVupMLpTd4OpV2AIRuGMff5sJIlWh5uSYL0EqDWZiShZ6LLsP37TR9T5YqcqWQ6bUlVu7x047Jhh6x92CrdP6Zk70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by IA0PR11MB8333.namprd11.prod.outlook.com (2603:10b6:208:491::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 18:47:01 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 18:47:01 +0000
Message-ID: <e5044e66-cdf8-4460-a0b1-5a3ff9130f3b@intel.com>
Date: Thu, 19 Mar 2026 11:46:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] x86: Enable LASS support with vsyscall=xonly mode
Content-Language: en-US
To: Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, "Andy
 Lutomirski" <luto@kernel.org>, Borislav Petkov <bp@alien8.de>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Kiryl
 Shutsemau" <kas@kernel.org>, Brendan Jackman <jackmanb@google.com>, "Sean
 Christopherson" <seanjc@google.com>, Nam Cao <namcao@linutronix.de>, "Cedric
 Xing" <cedric.xing@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tony Luck <tony.luck@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, "Maciej
 Wieczor-Retman" <m.wieczorretman@pm.me>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260309181029.398498-1-sohil.mehta@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20260309181029.398498-1-sohil.mehta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:303:8f::26) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|IA0PR11MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 18010cf9-dcd3-45e3-df2f-08de85e7e81a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: GBjfaCcOCqce/N5aDrwtpPQY2sfEUdWdAOXQUjEym6A2izIONUxyja/Sw3i02lTOlC0Fgznp3FUM/NzEa2vZqH1xu3s2OPd83kkfDR3Te2+RQYxV5nckgsb1fdoxpsbzd1GKdOPBs/gI0ktGSJDe+GjKkH2uFr3mk10i4scApitZ3OaMkBFARrL8ausmi039vo0LzM9KmO9JKr+PKalox3N+BiChqyIkzxBsnwtblwxQsw8zy3PUzebghxzs8IN1JsW/wedqy8sYZKiUxB3C/tMdGjSyiK9M9VzkStSb5QY4nJswD0teuxTqxTnExzS48MuYIQcp6PcAloZOaexHw94QB2Ibr2NkRhu+Cedmh3EfdQP0EII884SPJvHus88oKnnlGuWec2yt/LTJeD3M9Ux0m8nI45JEEtQ1pa03cOormpn3JGv4eLsWZ6+AxcaCgtzix+BkEDwYYOKtQzNitjjD6k2NFXSZWZr7RCsQ2qg052rEvDyKAVhxTINGfU2pQ3OrNBo7SbVjd0odQjwgMl8XLB4FyYAhoCJGJeugtfaf2b09JG3zvZPLLM9c+QUXhFMGi6lxdOUCiMtDKyPvhnoFzAebt1WYb9Si6MJghhgR+F3sf9+RKwY4g0JUtzGjVAh7uAiAuTzQ6m7/dYauhc8E8HqHZef5H57+jWpFcnImq6X/boXgE8Mb+goX9mDHOauZ1P7DdpMRsR3lhyzp6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmJoMTM5ZWhnU0tXN0xEZkp0NjV2TCtobXE0NnNTbVRxV3BrcTJzZTZMaTBy?=
 =?utf-8?B?emJVbCsvSXpxSkRpZzY0bFVvTXVCTUxjbFdWbkJCbkkzKy84UWNVTWh2SVlE?=
 =?utf-8?B?SC85KzFRWTZPODdjc3BWdVJMM1B4eTJXT2N2UE95NjM4R2dzc2g2SlpwRFZx?=
 =?utf-8?B?MnhBVHY0OHBRWGlhNVZvbWhvM1Jma3hkTnppam5CcHFYVmJNaHlLV0FjZFpI?=
 =?utf-8?B?QjZCOGM4cmN3dTRwbDJIUVVCSXh4L25ZbHdHQldxYnBORnBldjFqSjZzZ2Zt?=
 =?utf-8?B?UjB1STZ0UVVGT1hhWXBPSEgwcmtWeXhMcWtnaFhldFNjS2lhZXB5T0dTV2do?=
 =?utf-8?B?ZGJXN1RZbGVINEVSZW5Fc0tqV25NWHNPSjQ5b215RWg5dE5VbHNoN1Bjb0tr?=
 =?utf-8?B?STNjRzllZ3RoQVlvRW9qVUlVSGNRUlRweUhCbmtxajZ4WllUVFdMcnVzMUtB?=
 =?utf-8?B?a0NqSGk1Zll0eFEzQzEvaEdNeTJpRVJrV2U2VUdMa1podVUrRHovZHV4TDQ1?=
 =?utf-8?B?dWVFdFZwVFJyVEpJZkc2OGVrd2VKdmU2WVEraktBb1laeXBhMzVlU21sZHFh?=
 =?utf-8?B?UkVaWUhDbzJ3TEF0YTdQeHBhdDJsSUdmbGF1Yi9hOERJeEF6bzlGN2dPd05m?=
 =?utf-8?B?ZWQ5czBQdGQwRGJjRlNBTndqSUFjUTcyRGZHNUVFc1dzR0ZzOWpEb3psbi9R?=
 =?utf-8?B?UnJnKzZKSHhXUmJqbFIxdEh0NENRVXQyREppbHlHamxVbFM5MjRROWoycElU?=
 =?utf-8?B?UzlMalQxMGN6U0NocW9tRTFHQ2JKQ1JsMnFrajNEYjIzZngvbnJhSXovSStV?=
 =?utf-8?B?dGxEVEh0RzBRenRhNTA4TDFIcC9xaWZwbjBwSUF6aWhEOE40K3laRER1cFpT?=
 =?utf-8?B?YUdqUlE4eW1KcE5IRGFISjAxLytTcTVtUVFMQmVqTk1uZHRsODl0UUFzZEtB?=
 =?utf-8?B?L3ZSYWUyUXZSL3FYd0l3MjZmdHpwY3NvUzRkUGlZYU5JUEZTejBEcXliMUJ5?=
 =?utf-8?B?TWM0ZE55NGRBaGdEckNKaWhWejdyeUpVcjkxS0loQnV3Q0lJcm01eXFNSEYv?=
 =?utf-8?B?ZytiblFIMzV2aTNab1Y1b3RtMGVXa0hSTGFnU2lvWUhYMktuSWE5WmhoTzh6?=
 =?utf-8?B?Lzg4Znp1YjFlMVhFbk5NMm9EdzRuNjIrZUtTVTZIZStSZlNFcUEwdUtZMHlU?=
 =?utf-8?B?dTJtYU5zMzBLdHpYQnlCc0tLU24wbzJzaXJ5RjFLbWRnelRUNUw1NTN1eEhz?=
 =?utf-8?B?YkoxaS9FWDJ6STBRNVlodVhhSGltTUlxVWdxdDl2VHJiOTNWOWd6TEJQSFEz?=
 =?utf-8?B?T1NQUVowR1lIaklVV21Eck1KR0szTjArYmVFVjNqaXh0OW55clJ6MmticDUv?=
 =?utf-8?B?Tm5qTVd5V2UyZVFsalZXc01CL0YzSDBFeEg4QTY1a3dlSU91T3VWaThPWFZ2?=
 =?utf-8?B?TS8zYnArWUduRGVsN1ZEeVNQTmFRcmg3YUs1YTZPN0lwTTV2UzAvbUZyWmxy?=
 =?utf-8?B?d09qSDZwV1hjdm44Z0prdGdyME0vaG9XWFJzLy90d2RXRkw2TEpUTFM3VFRC?=
 =?utf-8?B?U3Y3YThlMk9USFBkenNqdHFld1dFWnhqd24wckdlTWNXRXlrVXZ2MklnOWND?=
 =?utf-8?B?SENvaVcvWHBkS3BLakR3RHF0NlRIV3lrWG1qMzY3TmVrYlRwY1JUM3Zmb2V6?=
 =?utf-8?B?VFh2Yi9nR2RtY1o4UmVweGtHZUVZUDJ3WmdXYjFjd2h1RENwbkZjQWpaWEx0?=
 =?utf-8?B?UTRsTis0ZDdzOXEvMWwvZVVFeXVWUXV5ZWZjcHRZaTNSN25UdzRFYzZIa1Ew?=
 =?utf-8?B?Szdwd2FmakhuVU1oYWJZaHZDcFB2WWVHQk5XWkV2VmhQM1hpamk2V2xReVJ1?=
 =?utf-8?B?UmEyQ253Sk1KQjVsdGxDZklYMHIza2x0K1RVZDRFSDZ1NHlRYjFjR2RMVTNZ?=
 =?utf-8?B?djZZeHl0a2VDQnpnaFlzeDhwY3NybUU2RnVPNmo4ajcxN2c3ZzNDT0dxa2VE?=
 =?utf-8?B?SkNRL3JHdHRDUVdheHV4cGRuemFjSjA5MExVUFBxY2MwR3ZLR2J3OStDbHFh?=
 =?utf-8?B?dTVDVk0xd3Z6bEFSSURaZmhaV3lmb3RzZDFpbW9sRnpNaWxPcVVQQ3VFZ1ZN?=
 =?utf-8?B?QUNEMTR5T3NRMnJ2ampMbjQzbCtvN2ZoUmkyK255djRZVVlKU2FPeTlUbWNR?=
 =?utf-8?B?NmtGZWpZY0s4VzIzUndrSG4xTjJHaHJQVTgwbk5idDlXanNGVFhSa1k2U0ds?=
 =?utf-8?B?cjFkQkFDVFY5NmdEMDdudGlRQjZTeFh5TlhTN2dvY2VvdGd6bFZSWkF5OURN?=
 =?utf-8?B?a00rQUtwMmNrZVlnVG1xN2x0Vmgxczl3bU14SkVNRFcrY2dXWlNIQT09?=
X-Exchange-RoutingPolicyChecked: pJvD9Ci6di9VIEwYGFQGBfV0Z7cuJ/NsXDU0LDUeDq75vg+wEhSkj6I19zXmDZeNEn6jUR0sjixAouXj6HGSHpzfBqofuUoypWNwtD4ZcKyfGY/9wVOdjAqagE5AP6uS5EiOYHF0QWiuRYgXCd4BioBagHs92/VPFEGfSv6Z30vslwj+Ky8X36UNlw8Sy15dBsS7JhK6TLX8pEKw3iy2L91BD84s5pQSQfCOJSry5T5bSzTFC9ynUJXs+jgLhsD/5qD23BKAIWlr1x9yPZfHN4UmJJHVXFFnMf767AmbeF5KE55FcNA5ZDetQ4iQi/b2psbERwberm3xW7KJvqMQNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18010cf9-dcd3-45e3-df2f-08de85e7e81a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:47:01.3331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+SfowssBcute5R4MKB0X+0+m0AepiFRDEP5DDXhN071uy9i5+Hl4JFIPWroHWYC27d48fn83kvnBuWEE/CM7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8333
X-OriginatorOrg: intel.com

On 3/9/2026 11:10 AM, Sohil Mehta wrote:
> Linear Address Space Separation (LASS) is currently disabled [1] when
> support for vsyscall emulation is configured. This series extends LASS
> support specifically to the default mode (vsyscall=xonly).
> 

x86 maintainers, this series seems to be ready to me. Are there any
additional changes you are looking for?

There are a couple of small vsyscall related improvements that are based
on this series. They are completely independent of LASS, so I haven't
included them here.

https://lore.kernel.org/lkml/20260305232136.224922-1-hpa@zytor.com/

https://lore.kernel.org/lkml/51f5dc8d-e130-4769-84e2-588553c7fde3@intel.com/

Please let me know if you would prefer that I include them at the end
and send out another version.

> Sohil Mehta (5):
>   x86/vsyscall: Reorganize the page fault emulation code
>   x86/traps: Consolidate user fixups in the #GP handler
>   x86/vsyscall: Restore vsyscall=xonly mode under LASS
>   x86/vsyscall: Disable LASS if vsyscall mode is set to EMULATE
>   x86/cpu: Remove LASS restriction on vsyscall emulation
> 
>  .../admin-guide/kernel-parameters.txt         |  4 +-
>  arch/x86/entry/vsyscall/vsyscall_64.c         | 91 ++++++++++++-------
>  arch/x86/include/asm/vsyscall.h               | 13 ++-
>  arch/x86/kernel/cpu/common.c                  | 15 ---
>  arch/x86/kernel/traps.c                       | 12 ++-
>  arch/x86/kernel/umip.c                        |  3 +
>  arch/x86/mm/fault.c                           |  2 +-
>  7 files changed, 79 insertions(+), 61 deletions(-)
> 
> 
> base-commit: 68400c1aaf02636a97c45ba198110b66feb270a9

