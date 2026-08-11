Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7EB2459C5;
	Tue, 11 Aug 2026 03:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418337; cv=fail; b=H+jMo307DK3aVM8WSO+7sErplfQ03setP1kFGiu6HZYuKftLSPw2gDSD3DWRLsOGcPgUTwmcgvR/6Hyxfj5EVPHL2K5CB3+FkaTefi/HhWEO/AsXTsaF0qd5cZnexkowWxJxPG9R74SARs6zmJRGtFHB5DnTMRLk2qIoJ84S9u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418337; c=relaxed/simple;
	bh=eaB5ukkxeBjWdqJJMy2a//x0xcusURJCRoC9Pq1tV5c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=um9FM18FccYlnVojuxHRcunRdiEtTS7nLQv9KgoPawCDLok+6RhuJv1SBx8DxcIwm0ySUn/+l7tZdy/n1j8LuWTFhgSF5Nl2vTgr9o5tKDgu+xExtiwFKRTjUoCkSMgqAVEEvjYMwqdBR8ms4UqMi2X2earASOYsgAQOeTimwzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxKBmRmt; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxKBmRmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786418335; x=1817954335;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eaB5ukkxeBjWdqJJMy2a//x0xcusURJCRoC9Pq1tV5c=;
  b=LxKBmRmtaHb6V4179CTs7ELdBj3zSphE5G/DCrBzWE2ze9Yqt3dpIBm8
   O+XRxMdDnV4/8NEpm0HBqGMPWuFewTaDXB5hfE1zDAuZAVznQUWtaX2Q4
   i1PB1tplQrddwAYRfwOKT4NV1AR+xJbO/5iApF6Nry+nrBSNbfm7knPyM
   e1MHaxE28hNfwy+t5/Iqja2W6ZxMFez6wBLrAkxZ0JwXx3a4quvkZn2O1
   lMImTdm6pnift/aVzSVLtOW5cggl0ExksmV/gj9ewOQnyNeeWpGfPo8Ch
   QwK16ulzzNTNL0ma70ndUpRPVpQU9ZZ4Uk2Bq5OFBMvNBYVhwl3HDlJC3
   Q==;
X-CSE-ConnectionGUID: eiaQ+WtgRreFCex/OhdjXQ==
X-CSE-MsgGUID: v5JsiYBcQ8yvw22vLsR/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86820271"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86820271"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:18:54 -0700
X-CSE-ConnectionGUID: RHRmhvVFTaKcFgc6QSdh1w==
X-CSE-MsgGUID: K+Ol1giuRwWfU/b5C6RBzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="259364228"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:18:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:18:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:18:53 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xD6GsSy84EpPIVb0+22egH4Jxo6gcMRM7WCI3hvMSXpDpJTawp0upKC0MBRboDBUzKzbkT4+sNqofsLmDXyxAaX5ERyVzWRxj4ZwHgaRVDL0pKzXAj8s/Gyarq8klXb1WIML2EMhHeczB21bAGo1tp2ZyZ3u/ZdnAawfOLLc1qv9DMPCHrZqA7GwkkzT4xFDHYOhVdG96COx6cPiEXWiIasvFoke4zZh4aOaCFtGVsL8jONCvELbCLoiIuULpGKPtxlgYODNdax8gsn/DTK6vk+3QbN+P6Wdpmuh6jKvDLbaCa7RjPfRJjofE7vFEZYQOVrVoB2dX5CnxTq6EstWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kBakuzP595YXb7/Grz+T5Rp8VegGT8HwBKQ7DjdbxM=;
 b=A7VDIxmZBlEtFLCcEI9tfVwc4XjMaz6ewUWhMK3qJpHziU5MmAD5xOQo1OiTW8ec2fWJxn/s20hjQdbwFZAh16atidKA+rfgSsy5haiY25WtCrJNhI98Qw6PY8HJW/IjjydTx//B3UUCTAoZ5VcROe/4GN6jtnWPSMAaijeR/46l0059QBorjTshVyFTKqUI/1/4GLbS+2N288WkA4ltgMkvpXAiwo/QidE5xBJoTG471yMSIm1tahtX6BF4/btNGXeZnI1suIeFXSRUOWh4oiyGLLRW6o3d4DbkoQ9izNc9gx2CT01Tn1CVzXUZh/75Nw3lY1JxruYwwwMmBZy8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:18:44 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:18:44 +0000
Message-ID: <328e237e-3d26-47c0-8167-8ffe5d765daf@intel.com>
Date: Mon, 10 Aug 2026 20:18:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 08/15] fs/resctrl: Add interface to display
 supported and active kernel-mode policy
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
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
 <c86c7a64f25171b773077ec47a20850b44f73ada.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <c86c7a64f25171b773077ec47a20850b44f73ada.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:303:2b::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4a2018-4a5e-4d9b-7b75-08def7574017
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|7416014|56012099006|11063799006|8126099003|3023799007|4143699003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: J358ZcrP3Lk9nGhyxYiNtMryEL6lk8altV70G0lf2MV+1XLC2RfRdNC2Uyfvb2e1axwbbmTjS56KEQ5jYaGmFjaYwsvPWoGN7YO9nlSYEyawjzgZTBruVJdneo1DWqiH7CxI+tvaZOcQkYqYGA6b0PMNsisa0S1zKcy4ZoiF7brJDScn1YAgpsw8mTeEEBZtlRZMl9THe/zMWYsO1UxoLq1SoM0u1gC/clD5nj9jE9tI3JDxOvaSWpm66FtRO6f6IAQpFDJ3wl64FCwSwVHQz1cdg3ji+ZkgWFfZ9mRp0UXCGLUNniK+4/Ct7aXRW3ct0oHLEZ5kzFXfSvlgEnsCCttkseaXLNGun3Ys38lowTj0q30qi6wyx9kNVS7WZHsIPry79fgMO9N/a+wy3JwiWc/3rnAOGVYi7Ss6MhP8HoLYQ24+qPmlZcXSLJdTSPPDU97rrPUSd1IUKgmBi8t9oL/VVE6CHH+GMC4vhD8bjfBZwQMeAbX3L9h3JaRQSu4iPTxqDba1xR4MYwHHDqZH/vKwDGYnJc03BYY7Q61gSBJnyyrewXaY6LiMQSt7RTnixk7onnST9ZMFKUr18eK0INJyYqexzEq2X1BQetTdU3V9vr9Law7M+NCaWHljVkc5rqsQT91NPIcu17BCBPzTV9cgPC5C+GbzkT/mhqJlWHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(7416014)(56012099006)(11063799006)(8126099003)(3023799007)(4143699003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnhSTXNXZ29ybWlGZWJwS1FPdWI0TytXK2ZpbUxuV2RaKzd3bnlFMlgvUnh5?=
 =?utf-8?B?LzFGZk9BbU9WYXYrOHNWRHF5MUNyaXl0akZ0UHd1bW44QTlkRkV1V09jVXVM?=
 =?utf-8?B?UEZhT2J6QXVqdlh1YUxJV2NKWXl1cUE5b092ZnF2MXg5ODBGejRhS0pqRFht?=
 =?utf-8?B?ZFBvL0J6dXBNQUNtSi9vdjc0YkdQNHA1R3MvMjVWdHdSYVZpb0tvYW5uM1RP?=
 =?utf-8?B?TFpGTjhXMm15Q2FIdysrK09LL2toS0RSSHRmTVdsTGFNR1IwdjdETi9COC9K?=
 =?utf-8?B?VEFpRHNYWmovM2dDbWZjOStkNXMzSTdhK0MxakpwcFdySmVUcVQ2a2M0dkR0?=
 =?utf-8?B?b0ZpMC93b1VLYU01M0hCRnQwM1ZDOUtvelJUVmU4Q0NyaDVHTG1wM0NEM0t1?=
 =?utf-8?B?ODR1cjVYWDVzSCtScTE5dnRONStGVC8wT1hHeFF4NmJobzJLRHdmOFpuTmVX?=
 =?utf-8?B?UVkxU0lkMHhMVXVTakJjZ1lwTXFSMXhFM2M1eHRPYmxwaU9wN1o1Wk9MSnVu?=
 =?utf-8?B?VVJzNml3UnB1S2N5cDd5RXpUeFpxUzJiaXlUb2xiL0QranZnZzl2RUVHUXRs?=
 =?utf-8?B?Y05keERpS3JEc1V2NFI1ckg3OWc2UEN0WU5IV0ZXYVFSZ3Q2Qzk2TWUxbXRZ?=
 =?utf-8?B?YUxUWHNWendEUFl1TWZtS25jNzAxWVd5Yi82VVdWNUpmZWtKcEVGZ3hPQzFl?=
 =?utf-8?B?Wk5lZHFQZjY4NzUvWGhnMStCZEo1ZlRxOUg3ZFJpMndLVnJnL01VdTV5WWdY?=
 =?utf-8?B?KzJQQ3hLTGlmcmdCLzJaVGVwQnlVNnc3NnZkNFZ0RTJQQkFnNDlQSlF0VWR0?=
 =?utf-8?B?V3p0ZlpLcjJaRGd4Z2NabWNpRUY1OVp3c1UrSTRCVktQMUVzZWcySjhCTDZ0?=
 =?utf-8?B?OUlNaHlEZFR4b1FQaDNJVTkxUW9UZ2wrQXNFQnkydlFRTjhLWXpSL0tUMUht?=
 =?utf-8?B?Q2t6NldNMm96Q1k1U3F1OC8vVzgrTkdtbHM0dTczalgvODBaU0ZEdy9kZ0ZR?=
 =?utf-8?B?NTBoOWhIMHJXUDBEbWwvRG4xN09kcE8vQkdKTzZsbkVROHE1QzFwRGN1UWw0?=
 =?utf-8?B?Wnd5UUFhYnhHTmJneXBSeFl4Y3lFOGpkSDJPUExBbjVKUHg0aEFyNWtKem56?=
 =?utf-8?B?REpLbjErSEhUbXVnc0x3amNZN04xczVocFczWFdxbU9vZGd6QTVvaWg5dXhB?=
 =?utf-8?B?S1Z5MGN0QWZlTE5zdDdkTEc4Y0xoc2s5ak9aRnhBRFdPVlpXbHN3OVAzd3Ir?=
 =?utf-8?B?L25LckFyT3RaY3ZDalBvWnJEZXVmMDk0U0IvMUFFZWRDZHNPQVg4MnYxUG1N?=
 =?utf-8?B?R2EyMldCaGpkRllsSXdOVEtRTi9yWUk5OW1WcEZ3ZUVMbWpiMVRwaFVOc1FS?=
 =?utf-8?B?bk8xaUU5Q0IyVXZHbEs5Ry82VEhrUjlSWHB4bW9ZSlpnbmxNUlRFeE9RRmJQ?=
 =?utf-8?B?WTMybWZqTlJjcFRvZ0N0alV4WXlESjZ4UmkySEEyZEFWc3JScm8zOUNtWUc4?=
 =?utf-8?B?RmNpK3RuVEs0N0dxZzZHQjEwVWthWWQrU3ZqUDhjSVhvV0N1b2IxUEZYUHdG?=
 =?utf-8?B?OUFEWXlNb0l1VGlnUHlYa21vbTRDUjJVdVpndkVTcHdhSUpYNzc4UE5lb0g5?=
 =?utf-8?B?NWlZZy9vM2ZTSFIzbzdQTVpkV3F1MHZSYkdtaHdNRW9wSzU2KzhrRHdadVlo?=
 =?utf-8?B?bWZubGV4enpPak1MQXlyeXpVRTNpMnczbUhUMWhEazZ4N0E5ZWQ3OUZtZWty?=
 =?utf-8?B?cVUxMzFrTk00TnNmWUEvL1RsK2prSlBtVEhSOHVMeGg1TFc1SWRNRys0clVL?=
 =?utf-8?B?NnUwb3hyT0FONDczRXNINEFKUjBqdlFHN1kyb1JCVVBHbVdsMFAyc01xTVBH?=
 =?utf-8?B?UkpRWFFZZExTeFcxakZib1BqQjN4VUZKSDhLNWp4TzRzamlsd3Y1bmNtWERF?=
 =?utf-8?B?dWpsdElGbE53aVY2WWZNdVA5ZHFHSHl4R3c0UUFqTVljWjRHWVFmUkhlcW1K?=
 =?utf-8?B?VCtxdUt6SzlZY2VtWEt4aGhyRUFxanA5eE51MWd6SmluTzFteGVwV0tPUmdw?=
 =?utf-8?B?RGJzejdrc0lySzVKam41M2FVNS9pNDhicXdZUWs2bFVSTE1qeUltSC9BWU16?=
 =?utf-8?B?eU1YZzZzSERXZW9xTk5INlVMNGF4bkVVbTM2M0RrN1gzSTJOOE5lcmpUMnYw?=
 =?utf-8?B?aHg2YUNYM09JbzByOGpyTWgvYlh4Mm45enR0b2EraFJrTUhmY093ZjI1dTVB?=
 =?utf-8?B?cE54VktWVitpN2JVdllrUHdubHd2cUYyU2xpbHZFdUwrL0I3TGt3WVM0UVUx?=
 =?utf-8?B?UFFOemhlcWFOMEZuSzVtaDFZZFh4UlhqcWtwWFhaTFBuc2RDT1VoZWgxcWZN?=
 =?utf-8?Q?p5Icab9MOK16/AGc=3D?=
X-Exchange-RoutingPolicyChecked: B8Jf7J/sv2DF1UgF8i/7g7QxGamhT8HhMoXfgL44p03AY9KEzqZubjfjDOAyEvgK6Kc5XV/stDzTCEr0mL/Y7Nz8g9vOq+8vTWK9dWUv1ffOATb8yW6L4XVEptUZOUXyoDLosnd4dzOW6a0VdH9CBc7dLvaK1QHzojyK2dDpfk/sL1WwvqjkdW5MnqdBXcDyBwuncT09pNNyJPkimeNvYWOnLp6uEhLoLsUNAk/Ihn3oKzDyKPuQtTfZwAweYOsEYPd6r2T7KTuK8oHWJX3DHFqQ3S7uiaMhYihAvKUOrJdJemq/4DHqz3A9/UUax+TWgMwkK2iYnrTEMINzHMNeMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4a2018-4a5e-4d9b-7b75-08def7574017
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:18:44.4666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /X69KuysKurgDST4jsi9oFrzyyGHAH2wxXjdyJ0X1NHbj7Cj19OM4l4tw+XHhdjzTaqVZfWrOYVjALncTrXoSfuHflRXcd9NqR8u+fdlIXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Kernel-mode resctrl policies define how kernel work is associated with
> resource allocation and monitoring relative to the user task. Generic
> resctrl tracks the supported policies, the active policy, and the resctrl
> group backing any global assignment policy. However, this information is
> not exposed to user space.
> 
> Introduce a new resctrl file, info/kernel_mode, to expose the global
> kernel-mode policy and its associated resource group (when applicable).
> This read-only sysfs file lists all supported policies, one per line, and
> highlights the active policy using square brackets.

(please rewrite with consistent terms)

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>



> +/**
> + * resctrl_kernel_mode_show() - Display supported and active kernel-mode policies
> + * @of: kernfs open file
> + * @seq: output seq_file
> + * @v: unused
> + *
> + * Displays one line per mode set in resctrl_kcfg.kmode. Bracket the active
> + * policy (resctrl_kcfg.kmode_cur).
> + *
> + * INHERIT_CTRL_AND_MON is displayed as "[inherit_ctrl_and_mon]" when active
> + * or "inherit_ctrl_and_mon" when supported but inactive, with no :group=
> + * suffix in either case.
> + *
> + * Global-assign modes append :group=. An inactive mode is emitted as
> + * "<mode>:group=uninitialized". An active mode with a bound group is emitted
> + * as "[<mode>:group=<ctrl>/<mon>/]", where <ctrl>/<mon>/ is derived from
> + * resctrl_kcfg.k_rdtgrp.
> + *
> + * Return: 0 on success, or -ENOENT on error.
> + */
> +static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
> +				    struct seq_file *seq, void *v)
> +{
> +	enum resctrl_kernel_mode mode;
> +	struct rdtgroup *rdtgrp;
> +	const char *ctrl, *mon;
> +	bool active;
> +	int ret = 0;
> +
> +	mutex_lock(&rdtgroup_mutex);

The changes to make resctrl more robust have since been merged. Please consider:
2d77f9768850 ("fs/resctrl: Prevent deadlock and use-after-free in info file handlers")

When you rebase, please use the new info_kn_lock()/info_kn_unlock() helpers.

> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
> +		if (!test_bit(mode, &resctrl_kcfg.kmode))
> +			continue;
> +
> +		active = (resctrl_kcfg.kmode_cur == mode);
> +
> +		if (mode == INHERIT_CTRL_AND_MON) {
> +			seq_printf(seq, active ? "[%s]\n" : "%s\n",
> +				   resctrl_mode_str[mode]);
> +			continue;
> +		}
> +
> +		if (!active) {
> +			seq_printf(seq, "%s:group=uninitialized\n",
> +				   resctrl_mode_str[mode]);
> +			continue;
> +		}
> +
> +		/*
> +		 * There should be a valid group when any of the global
> +		 * assign mode is active; otherwise, report an error.

This would indicate a resctrl bug, no?

> +		 */
> +		rdtgrp = resctrl_kcfg.k_rdtgrp;
> +		if (!rdtgrp) {
> +			ret = -ENOENT;
> +			goto out_unlock;

If this fails there needs to be content in last_cmd_status. Otherwise this
fails and then last_cmd_status reads "ok" or worse .. an old failure message.

> +		}
> +
> +		ctrl = "";
> +		mon = "";
> +		if (rdtgrp->type == RDTMON_GROUP) {
> +			ctrl = rdt_kn_name(rdtgrp->mon.parent->kn);
> +			mon = rdt_kn_name(rdtgrp->kn);
> +		} else {
> +			ctrl = rdt_kn_name(rdtgrp->kn);
> +		}
> +		seq_printf(seq, "[%s:group=%s/%s/]\n",
> +			   resctrl_mode_str[mode], ctrl, mon);
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&rdtgroup_mutex);
> +	return ret;
> +}
> +
>  void *rdt_kn_parent_priv(struct kernfs_node *kn)
>  {
>  	/*
> @@ -1915,6 +1999,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdt_last_cmd_status_show,
>  		.fflags		= RFTYPE_TOP_INFO,
>  	},
> +	{
> +		.name		= "kernel_mode",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_kernel_mode_show,
> +		.fflags		= RFTYPE_TOP_INFO,
> +	},
>  	{
>  		.name		= "mbm_assign_on_mkdir",
>  		.mode		= 0644,

Reinette
