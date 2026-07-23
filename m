Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77BA2FD694;
	Thu, 23 Jul 2026 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770898; cv=fail; b=KyajyfA1dQKb+UD6PTp0RVEszo0xxG9cDzReZBMIcpdFEn4NWOJywOsbVFnSjfUa65+/vn+BXlMC3yeIsGzxx7QMhnziZmOk9KR9vrjs5zTwOOSBwFVOQiEvUFSXdyHr8VXXhybaqdZvZSJbn+9WKbYN5+TBH5D2tvIlEq6fGAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770898; c=relaxed/simple;
	bh=3thJ1HRTr6QysDVw71nSFokqEYsOh+OgMryiArhY34c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G3SQJdMtDAzcWTvYMOkiMFCY9beEtAgSEYMgb0WNWwWvhwlxoknnBo5UJLSjCQ7NgpBvyN3U1AT1DN/7sueE4l+i+R2x0z4QC9I8RKeezWvz5xeDl6vJciNmMZpStkxd8di1tUgQoHL7b/jowRw3vKyTZirIVnpRjF8B8F+QDQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/E9Horx; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/E9Horx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784770897; x=1816306897;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3thJ1HRTr6QysDVw71nSFokqEYsOh+OgMryiArhY34c=;
  b=K/E9HorxDfCf+r0iH/Yr7371q+XUP7gMtoSJ7TLxySxWdPABwkQ16ZuZ
   J3UP6lmQcWSdFhHD/NemBU/U1Z6K3SIMijJEKAJWQc1Y2iOHqD8l7LQbV
   b+jEgX3gaCj4NkuykEeKDY6Jnl/8/YlcsaGA1TYVqLPPqsMU8CwtExwwq
   92x+mk8/64mYjcmCuqGpq64Lhphhrjd2tLU+PpTS2ShNUhspQA/C6xhaD
   Hi/fpoIkKErg8A7H9Zp4xCO2mXXXHCf0hIUrUQSRZb0OO9zGAMSkHyg9m
   ae1HntoP8YXoNXp1+7VI1hPzA8m036VijcsiNzVAftixnLR/ejiUrk961
   Q==;
X-CSE-ConnectionGUID: qdbWvNkXRwWhHUCwiBeWvQ==
X-CSE-MsgGUID: msf8HQQ1TBiLe3FkJW6QGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96932925"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="96932925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 18:41:37 -0700
X-CSE-ConnectionGUID: LMT+nZxHRX68216R77rfRQ==
X-CSE-MsgGUID: wn+Q4dZFTuK8A4o+mSQgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="262052124"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 18:41:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 18:41:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 18:41:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 18:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aytbWQLC2Jp01CkVZPglbyjkxYjbmlGt9Z5eeQwPx7rZablVCtvLo7Tx1cob0oioapW8UFeTsuhSwq+fQ63a4bklYFrovzMyQSicDyTHjBuiGEBN0+7i68W4SKgA+bqcKsf5/tZw3iVg9fT2HRzhM7tF7u8DYGb0Hk2YBJBajMIpe38wcKcahAmT4WtCTXqqb7UjROu+2iL7abLZjMPYdtv1ujaFBecnZeMsgprAcPv/hljZEY5AG8vVUDXtQ4swU0iRKx1QWxP+1uc5Y1LMuLjEd82lK+yeS4EYQSKT8AGN5kvcveAJB+Y9IAtuahRcGfBU+qIK939OdKqvqA1U+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWXirMIKiCZjLh02P5dxQ7JkBFpLNsEuq1p4AUdX7DA=;
 b=FupPobG6jv8t4yeF2MEoRx650TaWVTB2GWAwZvcVaRGNdssv0uVnNbKJgOHP0BHAgYjRi4nzauDmZ18MHuGFjJBmSgQBPHIyaY1Z0V9x7m8GTNAqknld2R1D+sAMuPyYhJKFOj/rpJXd5qWrpe+8dFt+j9liKYIJCzG8EsAN4rq4D39uBU+2k9EOBie/epl/5QVM/EqMtupNpcEyZ1uyPOFyv1tXXxbgL+JWOHIebNfNa15NM/bTyX30M+12CW9RKLlSip5qXWJorih33JANShSNNU7bfY5lv104ENSTD9ttsyeXzYMoLg5getlRRWt6IuC/8S94FTitErRbxqm+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 01:41:31 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 01:41:31 +0000
Message-ID: <31d76eff-5f89-4936-8b6d-03eab863acce@intel.com>
Date: Wed, 22 Jul 2026 18:41:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Document the mce=print_all command line
 parameter
Content-Language: en-US
To: Shreshth Srivastava <shreshth.srivastava@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, "Jonathan
 Corbet" <corbet@lwn.net>, <x86@kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "Mike
 Rapoport" <rppt@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, "Marco
 Elver" <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"Jakub Kicinski" <kuba@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Li
 RongQing <lirongqing@baidu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Tony Luck
	<tony.luck@intel.com>
References: <20260723013730.3033-1-shreshth.srivastava@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20260723013730.3033-1-shreshth.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 4124900e-caaf-40e7-5259-08dee85b853c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: XoXbh0ZzY7WYVjq4x9CUiYB2lYTsfQgYt5Q1dWezyL69BWJbA+UUFv2LCImfHoiMJlb04CHuhR3lWuthMJS8Ah7zSrA9RrlyJev5UdGbaKGKDtYG7rdiqkYFEw1jqbgCs1WPmn3BlfULADlK+X4P4LjNSFxT+yzij5syegX7QOUY975VVzZA3zNNsF09DCr8FTbDJHG1oIHUdZC0ZNfLlgn+IL9K+kRJFHYG5k2aivrsgE7zfzy7bq0lC1RxAcNAC5zd3mmi7+Rdvq0bYfpzw34HJzpVeIP0oru1uzoYznqRwo+/TznDRamyfRKMUBNylx0MwpLrCwnz7ysLqCasIOKFHsy0xdzHerkYxNVbEYkmIMQSkN36ghphTRpUwcdrSEF0pjERi7AQp7yhERozVdNCX92XsOoFgC4fnpnFuqAhmXhOdXTnPqHaS9O2RKhkOfURhrtv2lcuPfYI91PWMvY618ZnrF1tY4+HOF1iLd6f7SEFDCLPwvU4MXLLSK+SFqyasGCCOPM1vl6WczoLLdCYqfVszUHMhuP4DHps1YS5+3t1nkvbnpHKjAcG421PT69suL7ibn8GT85OlvT8HPdwX3DlN4Uv4EMIjSCuNl7f18RrhI4RQtSehiTE9D5un4d/880GqGuNHb6vpS3UudG8/4979On4TNBC3FBvoZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWtyZU1RTEJuNnI4SVp5L3RTM01yTWFYSUVZWmttQ21FT0xXQTVGYjM1aUpm?=
 =?utf-8?B?T3NCVUtvLzI1Ym42VnVpV1ZVYUEvSnFVOUJ6Vzk4N0l5UUVGVm91WDMrSHZk?=
 =?utf-8?B?Q1VXdUpPeWdXck5NcmE3cmxMU014QzFHcENZZnU5TFRZYTYyMEhRNHpyNTFz?=
 =?utf-8?B?a250RExJRjhlaXhiazlJdDlkakc2L3JsbFpxVGxCWXdmQ2liNWZFbnVLcjJ3?=
 =?utf-8?B?SStrN215SFp4TVM3RFFzRTJoZEVtdHFrY3NaTWNWdmticmlYcGdxemZ4S2o1?=
 =?utf-8?B?Vm5WWlVPK3YxeEVqSGd1cThBbzZHaitPb2E5aVVMUXl1aDgyYmpyVnBweXI5?=
 =?utf-8?B?QTNmZk9qbnhNZ0dEM0pIWGNsbm5sRW9sVnYvMHRvOFNucnFlTnhBQnBHRHpD?=
 =?utf-8?B?Q1Z6bzM0ZVhWU1pjSmtpN1lqamc0UForaWdNUnRDSnR4TWREdTlWdmd1Nlda?=
 =?utf-8?B?NWNIWE16UWUyNWNUeXY1U0lXcDFKUExtNFFaYktiR1ppZW0zRXRrTHJlSnR0?=
 =?utf-8?B?ZWsvSHBYMmdXVyt2VXVndnU0cTJTMzNadndIS2o3d1l5ak9OU25uWGRIMjVI?=
 =?utf-8?B?M05ESG1NU0VIU1MxVlowc0NOREVPd1lMNDVldHFvdmI5cHFrc2VSV0dONitj?=
 =?utf-8?B?OFZQN2tENlBQWmlqUmFhSERHSmhReTlqa1NCeEFKc291NHVBRlhtb1FIUm1R?=
 =?utf-8?B?aXQvKzh3d1Z3MkJhRDZHQ2VYNUtBWEpJMmF6RGJNS2tOSGU4dTM0amUvKzZz?=
 =?utf-8?B?YnlHbkNZVkJ4anhrOFhraGE4bjFRSDVPWXJwQXZyS3VhNGl1dHRQOVNLN0tN?=
 =?utf-8?B?bXZuelBTVXBXV0ZyUlJCaXFYY29XVHVyRTVwNUFySFhLMnhWUHNJN3l4Y2do?=
 =?utf-8?B?UzYxdTluQ2h6ZCtCVHFHMzJ0NjFjZ1F5V0hFeVZEVkZwV2wwcFI1MFlNbVZ2?=
 =?utf-8?B?K2d5aFU1NkxrNzJBelJXTWEwMjJWdHFEaWFxSk9HeWtldXp3WHRmWm9XYWFI?=
 =?utf-8?B?cVZKL2tLQ0VxbWRkM3B3LzQ5VytDbk9qK2lteUJON2xuYm5kL1VVQzF0VHZ6?=
 =?utf-8?B?U3pIa1RDeWtDY0toc3htcVFBZjlsTEY5dFAzaHduVmV5a3BYVm1sYVcvaE95?=
 =?utf-8?B?bk13TSttbnJwd1V0azkyZ1pqSjJtK0N4WHliRUxzdlB4UVNDRDBPc0daZm4v?=
 =?utf-8?B?MmxPOTA2elNWbFRYWEkzbjRxREtwV0FrdWxTVUIxSUVSWThmU0llNVI1a1RJ?=
 =?utf-8?B?ZjExblNFamUxTG5BRUwyQkJnVDNjaUdmVUszN0pRSHd0SVVPZU8xMDZqTTZJ?=
 =?utf-8?B?MVRQL00xYUhHOW9RQUx2S1lNaCtvL2RXRUtSb0lQcmNRUnpLQTR3RktwRGdp?=
 =?utf-8?B?VFFGd3YrY0d5a2R2c1ZVNHkweG8zbXB2ajE5UFFUUWhaZkpNcmZMbzZZQW8r?=
 =?utf-8?B?cmoxMlFZWmZ6SHppWFUxNkFtTlFmT0RPS25yLzZ4RFZYUFlMeGxSUUVXTUR5?=
 =?utf-8?B?YmFsSHFJV20zaFZXY0FaQ3NkT0ZPNXZvVng5K1c3c0xIdTZ0MWM5Nks3Q3Iw?=
 =?utf-8?B?bEdsZGxkaTNtc0ExdjYyYlVxbXkySm9SS0pPMnpkQ015am9iTUl2NDFDajhw?=
 =?utf-8?B?YWN0YWFFdUIvUkNrZEJJTk9OOEs4dlhVK21NdkZMY1VndnpNazlEdHU1NzR6?=
 =?utf-8?B?ai8yVG1OaHprclNDdTVDdU90VW1KUE9TL1IvTkdibzUvUFZMc2pBOEdoWnVC?=
 =?utf-8?B?MVhqY1RiNE5GWExnN0J3aHVYZk5lQWRZdk91ZlJGTyt1dUZwbnhzYUlCd3My?=
 =?utf-8?B?dTU3ZmxoOWwxMjBOTi9EU056cmxzRmo4NllHc3hUb2VOV1hlZXNURWZKZHJD?=
 =?utf-8?B?eWZTWVp0NlllQjNuTFFFNUlIWGJPdTZtd2FETzRxTHYxeUo3OVNTQzlHUjFS?=
 =?utf-8?B?bE9ZSTFJTmJvUWNVWHZ2Z2FaTWlDQndvNVpIL3lQTWh0SkI5QjlXUnFBMFRM?=
 =?utf-8?B?YXEvNnNuVnIrdC9BWkR4WUxvVkNoT1F6QUJyOVRkNk5hcURmWHRHTVc4SXU4?=
 =?utf-8?B?S3ZQMTlsS0xoeHUvUGxZNFpmbVVwUHZsM2dUT1NJTDAvL3YwWlI3TnVPaHV0?=
 =?utf-8?B?N1JDVUhDWG1JdkpVSEVEYUhIVHI1L3N0TUhSY056cUkxbmVJS3VqTFhKSEFB?=
 =?utf-8?B?aXZES3NvcHNPRkpWRUZzaWd2K2tKUFVGMDR0dlNWT01jOGI0QmxRd2p5Uldk?=
 =?utf-8?B?MjNndmtZYTNpSi9uVXZ4b213QllJRE1JdjBMZmVFMTNNbUF4L0M2azNGSnBJ?=
 =?utf-8?B?QVJEUU85d08vQWhkVlBEd3FKMmlDclBEbkdTemNGZXROVDFoSUdJQT09?=
X-Exchange-RoutingPolicyChecked: qGg4RIVldip64wEEL/apiyz+bomxyH1lHcEzb6Qz/d4TxjsQDo6pYT07wQkGMrYYDt4uCrRhsIR8cCZ1U+7iIAoTn7UQO3kIFYWSg/bqVxl+DD6CP0AJ3YlvBYKn83tRcqYxrn5SW2UFIABn2O/CUYwB9xWoatJMTwRavAQg+GFgfL1gZbaKsvsPS/MVQWZ2hdc/Lj9I7qXosYEonJI1RZck4E3PeuFYghll2G/ROzTs0uTxOxxwYUOoVSabXar+8KMnSjwzzmp0ZUY9o/6KtH13de3JRpt+tsLgYnRJM+oQft3k9+Dh5zHLNiXzAEa//HxluPRxI0k91T25sfoq5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4124900e-caaf-40e7-5259-08dee85b853c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 01:41:30.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8xO1KiN4yskCJ+gT4Ga22RHKikOjnU52mYihkRiAOIRIJMoikhUZddNmodkLSCSWlzG2Qankeek3HMyPFCJrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
X-OriginatorOrg: intel.com

On 7/22/2026 6:37 PM, Shreshth Srivastava wrote:
> The mce=print_all command line option is supported but has never
> been documented. Add it.
> 
> Suggested-by: Sohil Mehta <sohil.mehta@intel.com>
> Signed-off-by: Shreshth Srivastava <shreshth.srivastava@intel.com>
> Acked-by: Tony Luck <tony.luck@intel.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
