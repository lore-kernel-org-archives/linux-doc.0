Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5D9161328;
	Mon, 23 Dec 2024 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734989922; cv=fail; b=W06o5BSfq8YLXoLxeSSVpgLYV3e7+IJhV42LcRGehbaFM/fEA4R1D+uL75dos73h6K31czT8Trjfi1MEzkcoxaNT+JhLwouqKyI24o4jhSzOL17DsiHxC5UW4k8F0APqSHzElkoBKaZyqNodikT54E3rqPpgxwwz8EgTF4T7jbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734989922; c=relaxed/simple;
	bh=H98B8oNtAIJRSvHp5rHOizUbjbBfdSd214NY5t5PJ2g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IR+PXhzZxQy7P+h+k99ZBZsB37oCzypX7+OGbpgedTXQ3bvah0VgxYVxbaHO2BeDvCIE/VlSPrHQeNABCXsFgqGVzXWF+q5BvTlGBsyyeKDn7cK+yeVSAzFlg01vPoYcPK+oAlh4MknqTwY9WFUO9dEDyzHvdwPADcSMv/BiDsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPxsNKPa; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPxsNKPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734989919; x=1766525919;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H98B8oNtAIJRSvHp5rHOizUbjbBfdSd214NY5t5PJ2g=;
  b=HPxsNKPawkI4fHp11IShAhzfejDZzH3+Jh8culZP81ZQGwbX6fmilUfM
   eGw5WWOhjyAwQXvWgUnev4MUBv3ewuDFiTuZZCxLkyWVrzzwaOBkgfFfU
   oEFTvpzqJtQzOrYWlfGRQ3icVoh8F+xGH/a957i5ZVUuxfOGg6aeh5vq8
   Smn97SLphfTKmzscT5UcV9nop/cCc0stnHgIFrXMrNKFf61GyYihJrB7r
   Ec1TNw02vWGn6Lj3di7giFju/DTeK7t3JOKxA0a1CtU5KVvVdd2x/2MfH
   XELTgNj+8INouURCLOTCmGM2QwQb2UR+7p5EhyfvV3MHKZ6ht3I06Jyyk
   Q==;
X-CSE-ConnectionGUID: E7xnHrq6ST+evICZYoJmcQ==
X-CSE-MsgGUID: mu/QqyUnShmmuVb26Iw05g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35620244"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35620244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 13:38:38 -0800
X-CSE-ConnectionGUID: dlaOnvJCTnOYXqqv9f9Y/w==
X-CSE-MsgGUID: Cw1OO1BHQV+6/8NVq2rmcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="99165589"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 13:38:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 13:38:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 13:38:38 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 13:38:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fi81k+JMYg3bRXgOcU5A7XenikkDRafp0567FZZeTAuYNX8+J8F8OOu0HUFcFAVY1UEeR7cO7TYiQSuusIVL88gUr/d5z2QpHDky9oUnZgf+v5YajSkCNi5+wnuq74itRWtBT24DFdTSt+jUcPeXvn/1O2Sq+kefwRNRoiBiE18PbSdnGyuHISYRC/xaAxEEd020g+Y48DLKQshXRk0wRG7inCsw3lIX095x43IiYp6n4GWjpE1CLC7HAzb0Wu6L2fzF417XDBtJ4QbnoDa5TAiD0iUTtnvpYKoISb5Ny8jklHOcuZKxfsnudiaz66uie9zt6hcWK+cv5zJ22S2zNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1WB7nMsXR4NJTyRqZyBmzBKQjQ+WZWpX/jwvDmOiOM=;
 b=sS8GPyVCoFGzjkQS4H3ib7wCZ2yJJ3GhiJrNapH8TbFf+JN+Ye1f1XvzrKhoGWJ5350GJqKzsMicsXA054Ap00QHZgzo2uvnC5HWokLb/PTu4V2ui0cCb4p2KLi8w26KSR9Pbjns8it79g/EFvf0Sj8upBZr+NNfPfVp2QwUMiVtCEoKQZmkdkb31T2SEPpWbP1YGSl8u06jtgDuQkI3WbryTQVzm9MafGo1T8mrMR04Z0TsJH+eJjQ+u5vNgLteF1qsnt5zoFZF/Fb0q9MC6xFi5OoEgOUguhXGkXD+UHsZwUAInjd4K5iEiJDi7zpeAhl3fq+suiEe5E1EDB8zoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 21:37:58 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 21:37:58 +0000
Message-ID: <6f7064af-0680-4b5d-9165-1687137eaba9@intel.com>
Date: Mon, 23 Dec 2024 13:37:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
To: Babu Moger <babu.moger@amd.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
References: <cover.1734556832.git.babu.moger@amd.com>
 <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|PH7PR11MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5fafb6-1796-4cdc-1437-08dd239a1178
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU81aGttTG9WSzR5a21Ca1crVHUzNU1rZWJGUThreWpIQ2dnVkwwb0t1N2M0?=
 =?utf-8?B?bXQxSklFMG9GR3IyVjVhZlVLdXUxYjJpL3A3Sk9KRFVhZUl2dGluM2duVkdC?=
 =?utf-8?B?VUN6K2dsN1dFVWdvTFMzNkFJWkVNN2RrTW1DV0wwdG9iNTdEMmFCUXYzN0ZB?=
 =?utf-8?B?TkVDMC9aOWMyb2pjSXFzdkpja3czZWxtNHVRUFBEOGlSc1V4YzlCUVR1S3hO?=
 =?utf-8?B?TnhmcktkYmlFbnhNeXJoMGlOVUlqL3M5ZGdKNkw5NVlWOW1sbkRZL3hPWnA0?=
 =?utf-8?B?MzQ1YnRhWUczNTlUVlJrMGQyWlVrc3diYXNzYXkydk1oSkFZbExGblhraExp?=
 =?utf-8?B?TG45T1FEQTdsOFA4VzQwOUFwTGhxNzM3RUJWdUpMZk5kay9aYzZna2p6bVp1?=
 =?utf-8?B?U2hTMWZZNFFYSk93R293OGVxN0FwUGVFdFBNTnIxa2xFYldHc0NnSy9QNkdD?=
 =?utf-8?B?aWJMNy82dU9Tb1FHWUllQmh0SG5KNk9ETGEvMFcrcWlvSjYxSGdBV25FL2k2?=
 =?utf-8?B?V0RaMUhIR1JEb01qU211Y0w3WFNkbUxIZXl6bExZcnhNeE9heFJGQUNzNTFv?=
 =?utf-8?B?a0o0ZXB6UW9odzJ5RW9NYWYvODBUSmVYVjN0NDN3YkxsZ3FtWGVscVVQZ01E?=
 =?utf-8?B?UUpmSnhpVjZwT0xFVHpyMGc4RmZSSGtrVW1kanBnbkhacmVWUjA1QXJlQzk2?=
 =?utf-8?B?cXpWTWVsNm9OU3J5MjVsQm5jd3RCd1dlMnVoQXFzY1Q2YjgxYzFKUk53Smg5?=
 =?utf-8?B?VmxuVzlVUW15WEI1YTZVTC82Ty9GbStaMjZiQTBUTnFQSWw2Uzlqa1lGYjgz?=
 =?utf-8?B?WlBQUFhrd1h1b3A5dURJek1FV2ZJVjdyRnZtZGFqaC9sSGtmQVJPc1cxK1l0?=
 =?utf-8?B?d043QkIvQ3lmRFU5SkIwSlhwekgrU0JISFBHb0dDcWdOSFpSaCtnbTVvQVdp?=
 =?utf-8?B?cDRKdkNqVlMrNkNtTXB0eXBSVE4xV0lIMmc0Vk90ZVVYQ29tUjNFYk9jYm10?=
 =?utf-8?B?MUNxS3Ivb1o3TU1HSjZCdGp6c1k2TFZXSzFpWGV4bG0yLzRBckI5WERIcTJD?=
 =?utf-8?B?NDdkUE1ES2UzS29FbDVRTHpUcDJNZ2k3Tjd1VGlrNE9IZ25MYk41UHp2dEZt?=
 =?utf-8?B?Vjd2NWx4VGsyeGRkQ0d2b0diS1lXUFYydnhvbDhPMHNmR1hxUTJaWHVJNlpZ?=
 =?utf-8?B?dkp6anR4OGJZK0s4ZzZKUlY2ajlNWTh0R2pIak92UktjN2luMFpSSGtiQVdp?=
 =?utf-8?B?SlVTTEQvOTJyTXk5ZEVIRUZic2w1eWpyUjA3aFVaUFd5OERLNm5xOVdEeDlQ?=
 =?utf-8?B?a1BRZWZhZWcvRXZIa2Q2cUtHcWcxWWptaVNxNW9valpjN0RFUkxwdDZIY3kz?=
 =?utf-8?B?Qmp1aE9hUEFGeU10UFBxVStwbmFQRm9KRzBMOFh3cXEydzJMOUxCYUFla0Nn?=
 =?utf-8?B?YzgrRm1DV21WeFNOQ09xZVJzWUcvUnh4V3c2cTB4MGVKVkJOYWFiSnk3OXRs?=
 =?utf-8?B?aHl5MURYSWhlQlpaVEVzOEdZSGE0RVhtM3pJQUVJZ3lTdE84RHdaZVlhMmxq?=
 =?utf-8?B?ODg1QjZyV0VOb0hGbWczQ2Y1L1F5TWpRNVRPVFI5aXd0VkpmWERnaklpVmhH?=
 =?utf-8?B?MGM1L2Y1T2VPbmVPdm1Ya3NpRG14czJlQUNXdGM1dWZJbm5uRDlBRTRncEFx?=
 =?utf-8?B?YTRISisxNHFRaXo2MWRkYmE4RDh3NFAyazl6cXg2dW84THFGeFNpdFZzSm1J?=
 =?utf-8?B?cjExSTMzcmN2Z3lXaHN5RzdSbjFxajVqY0FrTk0reC9ERnJabTg5bnRqSWpW?=
 =?utf-8?B?eDJPRW5Bd2FGSmtDckJkVEhsUnBZT1J0RElpREo3bDM5VHErUEJoYkcvSlZV?=
 =?utf-8?Q?3El5IvYl7n3lk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFBubHVyNC9LaGVUTld3dXJvVFkwZ2lyZTJyVCszQzNDeVlXaXNkdFlFb0lH?=
 =?utf-8?B?OGhBSnUxUGZNVnR0QVp4UXQ2YzFsUXlxc0NDekxia3BXQk8rKzJoa3ZhOU1r?=
 =?utf-8?B?OUJYNWIxVHlOOE1GdFZ6UEdnQkdTZUljV3dtKytzSkgvM0Y3MjZxbG1MeXM3?=
 =?utf-8?B?MlA0am1WaWdRZE44aWtUYnhvTnZZWElRcTJRLzVuYnFTWmExSFpFRGpQMXVP?=
 =?utf-8?B?K1VKSDdhb2sxdVRzaU5QNDlBZlB4UUMySnVEWG1qWCsxZ1RacTFkNkFGOHVT?=
 =?utf-8?B?b2t0NkdFY1l4S2d5SXJHMWtleEl0cG14Si9aZjhyRFV4STVUNmNVdWhqa0sz?=
 =?utf-8?B?L1ZKR3FvRmlwZUdkalR3YmxjUDAvUFBxaWNVdFVFMGdhZVIrM2F3ZkVZNFNq?=
 =?utf-8?B?OTRJZUZ1K0ZaV2tmQ0VhME5scFl6VkhNWjJDWG5oR08yeUo3blJWMGJFaklT?=
 =?utf-8?B?RkcxdVpqTlZ3eGFnUXU5SlhZdzA1dGZiRUFVRFI5cVIxZ2EzOWdRRUVTbDZS?=
 =?utf-8?B?cGFJQlRnTDEwcTl3K29UUnJvSlM1SnNNNHFZK2lYeEQ4MVBnbDdySnFNbkt4?=
 =?utf-8?B?Z3RiMUpZYkpSVWIrRndxREhkOHBKOE1zSnIwTmpnU1lXZU9nOWpDOWw3K1dH?=
 =?utf-8?B?cE0rV29jaWE3QjNPaXdhYzJzMDdOd3piYVUxMGZBSUxXdnQ0YVBjd01hYzFE?=
 =?utf-8?B?L2lvZWc0YUZJRWZtWmtZcUpQNzVkbks1R1VCdm9lbTk2elJQcjl5VnVTSVpp?=
 =?utf-8?B?QUk4elVROGhFVXpCUVlEM1ZId0g5aEE2ZnRoR0VzNzFBVDZuUnNmbWJKYm5X?=
 =?utf-8?B?YitPV3RJdytNSlJob09jd2MvS1NucjdtUVFoRzRKMlErdU1BWUxYWWxnOVFW?=
 =?utf-8?B?Uk1ORlVXak1xV0I1NzNxRnVFOVFZNS9pejVwMUFpakc4eFJKbE1DcHA5SkFJ?=
 =?utf-8?B?TjJ6TzZNRitoa0EyNi9uSmtBWm1teFNQUEtrM2s4UXB4QTQ4NFZwUkM2RGIw?=
 =?utf-8?B?Z25XZ1ZublJXTzN3c2ZKSG5WcEJyVlQ5cS96bjVTMytsaGVmWFZqbnRLbjlq?=
 =?utf-8?B?aWV0VFo0cFZvZTJLNVlWK3E4RUEwRklUS2s4aDFZTE9kb3hYN0UrTjZkaVh6?=
 =?utf-8?B?ZFY3NzdxRTV5QkY2R21pd09DWGY5eDVoaVFQci9GQ094OWxjNlZWVHJSanpY?=
 =?utf-8?B?Uk5YUllzZS94SkJ4RGNHWGRPdjJuZmxqVWNqZUNGUjFlNjM0d1hhZWJ0MElx?=
 =?utf-8?B?b3ZJZy83Z25HeWN2Q09NMGNiME9tVWhrQy9PSTE5SXAvYUpreXR4R3V2eEdG?=
 =?utf-8?B?VFFDQ003ZFVzeGRwd3luajdVbzNacHpGeEJSSkpCYU8wMGVQOUxmamdBaEZL?=
 =?utf-8?B?bmNQek1BbkFydWkxYm1qQXFDOGVGbXBLZFgxd1FQNWs3cGlzbXpxZ1pKNUdN?=
 =?utf-8?B?UlNINUhNdHZEcHVlcng2QnZETmZDMHlBbkFYK0hMbDdSWUZ0UllOR3ZrSGR2?=
 =?utf-8?B?SGgwOCtYNVgweXF5TFFKWTFyTlVIeG44Tll2aklScHkvRkUrUDFCclArTjds?=
 =?utf-8?B?ajA1VS9iT1lORjF2M1JBanVocDBkRUlrRlRDdEc4VWx5aUNQMnBPOGtnSzdi?=
 =?utf-8?B?MUhaSDZJYVJuUHA2bkNRZ0ppQk1wYnBjVnhhUWZlWlFGcUp0TTlxclJWaHpU?=
 =?utf-8?B?V0Z1OCtiU2NsUG5HRkU1dks2cUNNWTA2MGkrSmpjMjNvQ0o2b09DTHJiMjFE?=
 =?utf-8?B?RmxTaVFKZFpDOGlXbk9VcVRDdXQxTnlzRjlCeUpkSzZuYUk0Z1lFRkNvVXdi?=
 =?utf-8?B?Q0F2TXdOMmNqNHhqM3dMRjBBYm9mMEtDZWJnRFI5bjlKU1Z6SG1uN1g0aEtq?=
 =?utf-8?B?YjZFbXVDckMvOEtONkN6Yjhsa0pFYUo0YzRySVczWlRKdmxvU2NSMUUzanNw?=
 =?utf-8?B?bVJkUExvc0Noak9tY1UzcGxiRTFYckxmbDNWWGtHM3dYVTgyTDJDVjVwMldk?=
 =?utf-8?B?RGQ4N0tGcEVTaWdDY0NQeXE1Z2dXMlhOU2o1YURsN2FWU0drVVNvSkUrakFT?=
 =?utf-8?B?UitJTkVRVnZqelQyZ2tZelhKZGlkWHd6WGQ2Wk1YMzRJRXA4cEI3aXoxbGJ6?=
 =?utf-8?B?TXpjUC82cEJud2RUYzJYT1lBOWZqVjNHTG5WNjNLbTZyYTRpRDJMTGk5Witj?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5fafb6-1796-4cdc-1437-08dd239a1178
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 21:37:58.2656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0aVFJ/PgA1vM0R19KgLFcpFmZB+cbHjNjXkI67ZpMNAkSZ0XcylKThfA1KeIQcR5WOI3/ItY/7B0ZtbcOTUqOOjUDecGj3XYVjWAYang00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
X-OriginatorOrg: intel.com

Hi Babu,

On 12/18/24 1:38 PM, Babu Moger wrote:
> The io_alloc feature in resctrl enables system software to configure
> the portion of the L3 cache allocated for I/O traffic.
> 

Above is about resctrl feature.

> Smart Data Cache Injection (SDCI) is a mechanism that allows direct
> insertion of data from I/O devices into the L3 cache. By caching I/O
> data directly in the L3 cache, instead of writing it to DRAM first,
> SDCI reduces DRAM bandwidth usage and lowers latency for the processor
> consuming the I/O data.
> 
> When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
> partitions identified by the highest-supported L3_MASK_n register as
> reported by CPUID Fn0000_0010_EDX_x1.MAX_COS. For example, if MAX_COS=15,
> SDCI lines will be allocated into the L3 cache partitions determined by
> the bitmask in the L3_MASK_15 register.

Above is about AMD feature.

> 
> Introduce interface to enable/disable "io_alloc" feature on user input.

Back to resctrl feature.

Please do not jump from resctrl to AMD feature in a way that makes it seem that
they are interchangeable. To help with this you could use similar style as in
ABMC where the text flows like:

	<resctrl feature description>.

	On AMD <resctrl feature> is backed by <AMD feature> that <AMD feature details>.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v2: Renamed the feature to "io_alloc".
>     Added generic texts for the feature in commit log and resctrl.rst doc.
>     Added resctrl_io_alloc_init_cat() to initialize io_alloc to default
>     values when enabled.
>     Fixed io_alloc show functinality to display only on L3 resource.
> ---
>  Documentation/arch/x86/resctrl.rst     |  27 ++++++
>  arch/x86/kernel/cpu/resctrl/core.c     |   2 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 118 +++++++++++++++++++++++++
>  3 files changed, 147 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 6768fc1fad16..52679175ee14 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -135,6 +135,33 @@ related to allocation:
>  			"1":
>  			      Non-contiguous 1s value in CBM is supported.
>  
> +"io_alloc":
> +		The "io_alloc" feature in resctrl enables system software to
> +		configure the portion of the L3 cache allocated for I/O traffic.
> +
> +		Smart Data Cache Injection (SDCI) is a mechanism that allows
> +		direct insertion of data from I/O devices into the L3 cache.
> +		By caching I/O data directly in the L3 cache, instead of writing
> +		it to DRAM first, SDCI reduces DRAM bandwidth usage and lowers
> +		latency for the processor consuming the I/O data.
> +
> +		When enabled the feature forces all SDCI lines to be placed
> +		into the L3 cache partitions identified by the highest-supported
> +		CLOSID (num_closids-1). This CLOSID will not be available to the
> +		resctrl group.

Same comment as V1. The above two paragraphs cannot be guaranteed to be
specific to the "io_alloc" feature ... it is only specific to SDCIAE. 

> +
> +			"0":
> +			    I/O device L3 cache control is not enabled.
> +			"1":
> +			    I/O device L3 cache control is enabled, allowing users
> +			    to manage the portions of the L3 cache allocated for
> +			    the I/O device.
> +
> +		Feature can be enabled/disabled by writing to the interface.
> +		Example::
> +
> +			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc

Similar to comment of V1 there is no information about what user can
expect when enabling this. For example, if this fails then one cause may
be that a resource group already owns that CLOSID and that removing that resource
group would make it possible to enable this feature. Even so, user space does not
know about CLOSIDs, only resource groups, making it difficult to correct without
more help. 

> +
>  Memory bandwidth(MB) subdirectory contains the following files
>  with respect to allocation:
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 39e110033d96..066a7997eaf1 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -309,6 +309,8 @@ static void rdt_get_cdp_config(int level)
>  static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
>  {
>  	r->cache.io_alloc_capable = true;
> +	resctrl_file_fflags_init("io_alloc",
> +				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>  }
>  
>  static void rdt_get_cdp_l3_config(void)
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 398f241b65d5..e30731ce9335 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -62,6 +62,7 @@ static char last_cmd_status_buf[512];
>  
>  static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
>  static void rdtgroup_destroy_root(void);
> +static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
>  
>  struct dentry *debugfs_resctrl;
>  
> @@ -180,6 +181,25 @@ void closid_free(int closid)
>  	__set_bit(closid, &closid_free_map);
>  }
>  
> +/*
> + * io_alloc (SDCIAE) feature uses max CLOSID to route the SDCI traffic.

Please do not use io_alloc and SDCIAE interchangeably.

> + * Get the max CLOSID number
> + */
> +static u32 resctrl_io_alloc_closid_get(struct rdt_resource *r)
> +{
> +	return resctrl_arch_get_num_closid(r) - 1;
> +}
> +
> +static int resctrl_io_alloc_closid_alloc(struct rdt_resource *r)
> +{
> +	u32 io_alloc_closid = resctrl_io_alloc_closid_get(r);
> +
> +	if (__test_and_clear_bit(io_alloc_closid, &closid_free_map))
> +		return io_alloc_closid;
> +	else
> +		return -ENOSPC;
> +}

This does not look right. The way resctrl manages CLOSID is to use the
*minimum* of all CLOSID supported across all resources. It may thus be possible
for the L3 resource to support more CLOSID than other resources causing
the closid_free_map to be sized to a value smaller than the L3 max CLOSID.
The bit being tested/cleared here may thus exceed what is in the bitmap.

Also, during V1 we discussed how CDP was not handled and I am not able to
see where/if it is handled in this version.

> +
>  /**
>   * closid_allocated - test if provided closid is in use
>   * @closid: closid to be tested
> @@ -1832,6 +1852,97 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>  	return 0;
>  }
>  
> +static int resctrl_io_alloc_show(struct kernfs_open_file *of,
> +				 struct seq_file *seq, void *v)
> +{
> +	struct resctrl_schema *s = of->kn->parent->priv;
> +	struct rdt_resource *r = s->res;
> +
> +	seq_printf(seq, "%x\n", resctrl_arch_get_io_alloc_enabled(r->rid));
> +	return 0;
> +}
> +
> +/*
> + * Initialize the io_alloc feature default when enabled

It is not clear what this comment describes.

> + */
> +static int resctrl_io_alloc_init_cat(struct rdt_resource *r, u32 closid)
> +{
> +	struct resctrl_schema *s;
> +	int ret = 0;
> +
> +	rdt_staged_configs_clear();
> +
> +	list_for_each_entry(s, &resctrl_schema_all, list) {
> +		r = s->res;
> +		if (r->rid == RDT_RESOURCE_L3) {

It looks like the function ignores the resource provided to it via function
parameter and instead uses internal hardcode of which resource to act on?

> +			ret = rdtgroup_init_cat(s, closid);
> +			if (ret < 0)
> +				goto out_init_cat;
> +
> +			ret = resctrl_arch_update_domains(r, closid);
> +			if (ret < 0)
> +				goto out_init_cat;
> +		}
> +	}
> +
> +out_init_cat:
> +	if (ret)
> +		rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
> +
> +	rdt_staged_configs_clear();
> +	return ret;
> +}
> +
> +static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
> +				      size_t nbytes, loff_t off)
> +{
> +	struct resctrl_schema *s = of->kn->parent->priv;
> +	struct rdt_resource *r = s->res;
> +	u32 io_alloc_closid;
> +	bool enable;
> +	int ret;
> +
> +	if (!r->cache.io_alloc_capable)
> +		return -EINVAL;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
> +
> +	if (resctrl_arch_get_io_alloc_enabled(r->rid) != enable) {
> +		if (enable) {
> +			ret = resctrl_io_alloc_closid_alloc(r);
> +			if (ret < 0) {
> +				rdt_last_cmd_puts("io_alloc CLOSID is not available\n");

Can this be more useful to the user? The user does not know what the CLOSID is nor
what can be remedied to fix this. What if the message instead contains the name of
the resource group to which the CLOSID is assigned so that user knows which resource
group could be removed to be able to enable io_alloc?

> +				goto out_io_alloc;
> +			}
> +			ret = resctrl_io_alloc_init_cat(r, io_alloc_closid);
> +			if (ret) {
> +				closid_free(io_alloc_closid);

Could you please make a resctrl_io_alloc_closid_free() that is symmetrical to
resctrl_io_alloc_closid_alloc()?

> +				goto out_io_alloc;
> +			}
> +
> +		} else {
> +			closid_free(io_alloc_closid);
> +		}
> +
> +		ret = resctrl_arch_io_alloc_enable(r, enable);
> +	}
> +
> +out_io_alloc:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -1984,6 +2095,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdtgroup_schemata_show,
>  		.fflags		= RFTYPE_CTRL_BASE,
>  	},
> +	{
> +		.name		= "io_alloc",
> +		.mode		= 0644,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_io_alloc_show,
> +		.write		= resctrl_io_alloc_write,
> +	},
>  	{
>  		.name		= "mba_MBps_event",
>  		.mode		= 0644,

Reinette
