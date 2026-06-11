Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461233002C8;
	Thu, 11 Jun 2026 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781220197; cv=fail; b=uPqkevTZm2lM+xGYgnW2gGaSo2Bj58q7cwsGJnfETW4pEPwZjkIGCa+YofS2h/3qg2N741TOz8Dp9Rxe9HaLzRRFAh0I+xaiduXzieFui7CmCsyJDVb6hKvaJHGKQcfrlUyV+vD8Qkx3qrLZ81qpGNh8saL7foWTuEZeyGkPHZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781220197; c=relaxed/simple;
	bh=v9ZCa1A+0gIsdt/xr30V0SwZ8hrBz88B5XOkrqQBUCc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kSpoEixZ4AU7ld6E36zd8/otF5fcbYlKTV53Gwg2RTQB9Q+U/dUEqM3G88wOo7AF9yRE/8q0zTnxq3Fu0BdZk9kKGnL76abOWlvRdLb8Kvv2bTt8RGrB2HMHtlAKldMgpdPyuk5Y5JUu3HGJaSGlOMhPMGJdMx6B7V8ERIfBBRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwP818+o; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwP818+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781220195; x=1812756195;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v9ZCa1A+0gIsdt/xr30V0SwZ8hrBz88B5XOkrqQBUCc=;
  b=mwP818+oPr8Ery6LpPRhFjCzqT+VThjb6B5Gc59ctUXVK3HFHdsv1KvF
   2NginOf/2cbPWVTYYyLsiP9ASA+JJoH0XhthlS8b9xonMQQEzQUHAVESl
   8YFA07fv1E7zQCxMvIoz0XXwSly7ko1kui81WGEjZFFYSxxR5Hi3pK4+5
   Fq4vYYz56thZXYoHdUj8kQr+EMjvhucjiRIYRNw6gJr7xrBI9+yDLkkO6
   FjKBaRMHcG/ii63w9rGae6N/GRagTAzi7GYoNfGMGPuGtXi3ueehYg+Lt
   Nn2pP8m8AEqW28kixDUiZ/xktHKwC3qHnmLVtyILA4o3hEEqygN0X9syG
   Q==;
X-CSE-ConnectionGUID: l6JyPpriS2qqh68D39t6gQ==
X-CSE-MsgGUID: 6G+qIX8GSzGbRBdMxaiw4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84618942"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="84618942"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:23:14 -0700
X-CSE-ConnectionGUID: snYb5yTIRwmoAhkSfoOTlA==
X-CSE-MsgGUID: vHSxRpUFRdWS1lVHzJvm+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="242511564"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:23:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 16:23:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 16:23:13 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 16:23:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyQUXoD1ZXi1rL5VmqlJ2ccp0gwXkQeXYs77a6H7a5GsW0T7xCOqqwIT56vDCDbI/5wmuPlngMtau4+VtAlfbsKPhPKQ6OoKmmwwaiaL/iAMleGiVXLfZAtKwAgjYhM/cByQBZqNE3ZQr8MdiWCw/mbM7QQdeuj5EEbJKIskADy//MrfPc70lqMeJ/QnIsqnr9cMe5UBEB79N+jYi1y95gN0QmSx7n250I6vaz3tXPPp8nlon3Py1bPcNlkchrbTk7RUsTbqIIw3pvdLZggXGn0iR9mMdWdApG5lftQIDpDgS+yq8FAftI4NkWfPFNCkexX/A3q5Ln6+E4Ho7PhtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StvDJSM4tA4hBlCY9J9Rfi636i+xkWkI6B7UQmomANQ=;
 b=OZpvqD+MKRhkZQZk972mHRLxfo8JlmSXRB12CJXXPbVtyzYzBscg7XdNCIicgDdZtyaS9tdCAlq91f0/A01K7DoF/4bWx79zf9dwQB+Pm0fUJt3Pw4XU+yPyaEWkqOQofqKhRay6YhDAXfxoq278wDiNfkkfpwPyqKTLgDuhsoNpL7gsmivyyZvjmUpCYIKbbshpkE1wqw0U/zwPQyfCWnMPWceUclfbs/YFrVSTQgrnc63LFk8lTybG7gVy/i3sbZ7VrQq6RS7qQXnj/hh+p57/RYH4+nAXrKVDV5TULZUza3FszOLAgHr9pMm9zw4+Pt60Lbp/1OOOMv4HxwMUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV2PR11MB9539.namprd11.prod.outlook.com (2603:10b6:408:378::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 23:23:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 23:23:11 +0000
Message-ID: <081b5cd6-37a3-4aaf-862b-b41e9536bb66@intel.com>
Date: Thu, 11 Jun 2026 16:23:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] x86/resctrl: Support Privilege-Level Zero
 Association (PLZA)
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <f59c7f5404f29b2901af68d8032ee615b7f0efea.1777591496.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <f59c7f5404f29b2901af68d8032ee615b7f0efea.1777591496.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:303:8c::31) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV2PR11MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: b599d406-79bf-4c41-d513-08dec810673a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|13003099007|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: RC8YQkoc+bAy59+XyQB/2K2NNZt3n7pINgPxDkNtsR/g0FZnjWi5ntJ1XAPkYCIYfwbUzuGY9uZj6PrVIDktdx7TrU8wDiOvewy3B5Pxi+FN2x9cy5zPWsCmm6Iuoydq49Ht5g7J6m/QLyJCe4N2VtcS4pStwdNW4vb9qMP4H45zRq844scMIGFhJ9c4zFhZkClpgL9RHK9JUU1szQAVFFiDKwXvdOTw9G2lhQ27XXDVJLpqmGwMwpFdSCAOnL+iuvro1JOciccYWsI4xTzh1atnnTFIOhRqO8NkiK5Zr7h5gdGoNhMuiK4gWUGu8OMwmFXT+1n7Cfcb4GQg6RtDEU5KMuU3jlAw4+rq0J8o/2som6eQAhC7tc/ThqGhGenVmOiwMc+SfWMLZ2xwq3soSV6ObOK4O/bL2hMTHHt/ExV4bPhdIAKeFfDy1I1Kfohko2D/Gr0dfKn1PI5v4wrx3tbTcMwdO8/rQJZ6PKfaJg8PVrNi+j+IubZ1843GTaRDRmcCFi2TC358JfZ4/53X5Hdmgr+7pu3v/iEH9rqDsEJ0e44nOr/7HucSR8kWQD0GiJhyuPpBlOWVTTVFUE9QAQn+wdInI0/2IQCaPIstjLHrsUf3lgc2h1aWUzz+erRnCUParh1x+dART1DNDz4mcnLLJ3sU/oGUbbpQGvhgkDdwMeMDdNnMDzov3JFKAdVbFXz1bmW8pVzq+WElmaGFlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(13003099007)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1FaM3djQjZ1dWFyV085clBHVksyWWxoNkZOc1RkTndhUTVDZ0VGeTlubDF6?=
 =?utf-8?B?MElKZ3JsSm1IaHBvUVhoZVRZWjEwOCtKUlpiUjI5NldES2xYcG0wS2p4Wlp6?=
 =?utf-8?B?R2ZaRmRZNVc1RjVmczBQd3lyODluL0lHZzRTeVY1YUM5dUY2U3k3V0JNMHJN?=
 =?utf-8?B?aGVCMHpkQ051WjZ6NmZ0dldGQ2ZZdll5MklWRUYzb3FLM1N0akZrbEZ4R3ZP?=
 =?utf-8?B?bG5DRnpHS29meHZDZEx2VHVkSmxoa00wSjk0aWQrd2xoalVoM1RoNlVvTFpk?=
 =?utf-8?B?b0diOTlacDhvTzBTN255Q3ZzcTNDeW1IYXRhRjV6WTlRRmRvQ2Q5NHBhZnZF?=
 =?utf-8?B?ZG95cDNkZ0dNSzZJRHZpaXpqTXB1WDd0aEVXN29pVENNbDl1a2lLU3YzZDRZ?=
 =?utf-8?B?MHI4Z2MyeWQyMVFXdk5jQmFVWlo5dHlweTR5SVlEZGZQQ3VJRmVMRitvejE0?=
 =?utf-8?B?Ni9OUmNZbFlVRnQ2WWZsVzRIQ3N1SnJJQzhGQVpXSXRLbmhjQTM2RlFyaTlO?=
 =?utf-8?B?NlU3T2dMVjY2LzRmOW1NOVRLRnB1SkEyT3plbFJXQ2plYUpqTENtZzlYNU4v?=
 =?utf-8?B?QVVCZkJoRUJ2cnFobThFYTAwUVZvUmhrVW1HMmNQNzlTaFl5K1AwZTJuN2or?=
 =?utf-8?B?Z1ZyR1ZjRVFLVVB5Qm1sZTBxbHF0NGdCWEVXY1VBUEJndzh6L1Y4Y1hBeXFq?=
 =?utf-8?B?Q3BmMVF6eE5pRTY2U3FLOEN2QWE3ekNwZ3krVVVJd1YrNTRFTVR1UisxYnF6?=
 =?utf-8?B?ejBsUjlsQ2ROMll1MUxLbFMwUGEraWVLaUxrWno3U2UwVzMrT29JYlRwWEtl?=
 =?utf-8?B?NlFMelFKZWhOSGpQRDdCWWpRSTBPMXJJQ3lsR3lsT01zTzVlUHdsZUFrM1NC?=
 =?utf-8?B?NlZ2UlpnV2ljay9qcnFGR3lmVC91TlpDYzlwazUvbm1Idi8yQkpJU1RVbDIz?=
 =?utf-8?B?ejlnTjJqbW02RitUb0ZBSzNrbUE2NHNvTWRRTFNIM3FBZzdqM1BLSUw3RlBM?=
 =?utf-8?B?Y2xVYTNJR3FXQU1YZEg3OE1pUW16TDZQTkhYTHBWbEluTnFtS2VGMVJBMFZJ?=
 =?utf-8?B?QjlwLzhOVys1eS9ZUVNRYU5kTEI1ZEozcWFFM01sQ2ZZQjIyZ3BJS2RpaTEx?=
 =?utf-8?B?ME9ZWGp3cTB4TEI4NDhraGtzRDdRSDRZZjRYLzQwTmM1bXJubkY5aHQxL0Zp?=
 =?utf-8?B?V2FuMWhyTTR1VlYxY1J5aTVlRGRaWHFXQU9kaWpyUnF3R3NBRVFWcG0rYTBt?=
 =?utf-8?B?U3dGanNodkVaaG9jRXlNU2s5YlZwV0c2Rm1reHV1RExCSmdlUDlFMWIwU0dW?=
 =?utf-8?B?RzFFbGJyOFo4OHgxZVJIQUpxL1h4UHRJbjlqV2RvVTVUVE00RTl6YXc3Z0JD?=
 =?utf-8?B?RlFWMDRTenFTQXRJbzhhS3JyR1ljK2FNSFpDeVBkbGk1QzBVZ2ZZb3ExRHcr?=
 =?utf-8?B?QzdXQlk3bk1Qb3hLd1BtMXA0ZE1UQ2dmcDRvQTZrNGxhQnJkdVI2dngvRW54?=
 =?utf-8?B?bnhEa1RQY1luTGFrbGFKSXJNZjBpUlExTVFGSk5Yd0o1Y0krS29rUjNTb2xB?=
 =?utf-8?B?bkdWdllvMCtKZXpwQ21xN0liZ3JLTlBMWXZjOE42NnZvN3lkOVdKbkRDc1JN?=
 =?utf-8?B?N1hkWHpxaWZITkF1V2NsdXVlOUZqdjN4V1JHMFZRcmltLzFQTnlkRWF2UFFR?=
 =?utf-8?B?bDVvaWpMSmxMazRTL1lua3VGemtsNE9MSTkyOTFMR1VlOTkzWGxEbElZdGoy?=
 =?utf-8?B?aEUwcFcxbVRKc3FoamVRTGk0UjJjNDFma2dTYUZxMXlBQzVXVmZuOXBaYmFY?=
 =?utf-8?B?MU9idzhSc2t3RHRZS3ljVlVUbUVzVnVxMlQ4cmFzZzlaM3plaGI2b1VtVW9l?=
 =?utf-8?B?NG4vTno5bW8zMUpkSGRCeU1XQXpWazVuRlhQdFdjZC9NdWxLUytoL0l3UHpF?=
 =?utf-8?B?dUd4eXNJTkFUV3JJWkdQbFZrd1d6K2VNMlhqSytFTVBvQnk1T2Zhc25ZdmxT?=
 =?utf-8?B?ckUyNlFiL1VVa09QUFloVG4yS2tYd3FlbDRiTmpBdWxZSjdGdVVaeWNhWnBr?=
 =?utf-8?B?NTdTcWg0MzhaZTlvQ0NNQWF4bjdrTkFrMnN2aEpUS0s3Nk1qSU1vLzBpNjVw?=
 =?utf-8?B?RWNwNFg2dytRSHUwaEhZR3FxZ21ieFRxRTh2cVRaWk5wZEtXZk5VL2VzSkx0?=
 =?utf-8?B?TVdHQTBTbXUzL20xN3RuRTlTQ0g0NEk2UXNOSDkxUmhhNTdlNHNuTnBnVlkw?=
 =?utf-8?B?SksrNlgrdWJCVGtlc2NPa3V3K3N3MGNPUVJBNzFiSnhsSityMFplUzZobVl3?=
 =?utf-8?B?ZXNoTklMMjVQeWRLN05vYWFRdzh3K0U2WmczRW5uM1NhOFFBdmVKTHM4Q0s4?=
 =?utf-8?Q?uccHU6JeNfu9Iy9o=3D?=
X-Exchange-RoutingPolicyChecked: Tzv/aIi5f6CiKPmEccVNkDfgMLHQ62VXM3siEDwzFn444lIzXQ5LKhdcgMr4zJNyMdoX3Fzn4R+FDbSZWSAbS+EjSB5b8EK8PAOWLc0KvmMPjJTIkERfQB7QLLIOXh2MRtoE/86l640pr6ex+lHLqFV9KtBEUnAHyJc0jQzx7rZJ3tW/OqHh21WaMbXI7/f14D9nD7YrMsa+FnazW90WY50enXUy97wBzeduQ9ccIa0uOhgFQHBRD/ra3GWFLw3cLkkax2dN9unX8a4TrKc7Hdk6zGFh26syKPUfdQLwxIqhD8CX2OlIqzNYXht8Ii20ib2xGDq3oJewm7nyiGQMog==
X-MS-Exchange-CrossTenant-Network-Message-Id: b599d406-79bf-4c41-d513-08dec810673a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 23:23:11.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFSmL8U23TTepG3Cwg6UMGkdQs5l8yBw8xzbhoiuOnPISYXaMZ04NC/LwIbxYNzBnJbVJiuZdlvRnfYiBWf8xCLM5U6DSd7ByMioxiFGaWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9539
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> Customers have identified an issue while using the QoS resource Control

"Control" -> "control"?

> feature. If a memory bandwidth associated with a CLOSID is aggressively

"a memory bandwidth" -> "memory bandwidth"?

> throttled, and it moves into Kernel mode, the Kernel operations are also

What does "it" refer to here? From text it seems to be the "CLOSID" but that
does not sound right? Should "it" instead be something like "a task with that
CLOSID"?

"Kernel" -> "kernel"?

> aggressively throttled. This can stall forward progress and eventually
> degrade overall system performance. AMD hardware supports a feature
> Privilege-Level Zero Association (PLZA) to change the association of the
> thread as soon as it begins executing.

"change the association of the thread as soon as it begins executing." I am
not able to parse this.

> 
> Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
> and/or RMID associated with execution in Privilege-Level Zero. When enabled
> on a HW thread, when the thread enters Privilege-Level Zero, transactions

Could you please use consistent terminology throughout this series? This patch
uses "HW thread"/"thread", the next patch then switches to "logical processor",
and then by patch #4 the term seems to settle on "CPU". Could this just be
"CPU" from here and throughout series to be consistent and easier to read?

What is meant with "transactions"?  Is this just about memory transactions?
Using this term combined with earlier "memory bandwidth" related problem description
hints that this feature just impacts memory bandwidth allocation but from what
I understand this impacts all allocation (CLOSID of all resources) and monitoring.

Could "transactions" be replaced with "allocation and monitoring" and be
more accurate?

> associated with that thread will be associated with the PLZA CLOSID and/or
> RMID. Otherwise, the HW thread will be associated with the CLOSID and RMID
> identified by PQR_ASSOC.
> 
> Add PLZA support to resctrl and introduce a kernel parameter that allows
> enabling or disabling the feature at boot time.
> 
> The GLBE feature details are documented in:

"GLBE" -> "PLZA"?

> 
>   AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
>   Publication # 69193 Revision: 1.00, Issue Date: March 2026
> 
> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

Please follow same style as what you used in the assignable counter enabling where
this URL is provided via a "Link:" tag and then the text can refer to it. Specifically,
	Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [1]

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v3: Code did not change. Patch order cahnged.
>     Added documentation link.
> 
> v2: Rebased on top of the latest tip.
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  arch/x86/include/asm/cpufeatures.h              | 1 +
>  arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
>  arch/x86/kernel/cpu/scattered.c                 | 1 +

Please split changes to other subsystems and make these changes
obvious with their own subject prefix to avoid sneaking changes into
other subsystems via resctrl.

Reinette
