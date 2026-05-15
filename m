Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B13FF1D8;
	Fri, 15 May 2026 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862936; cv=fail; b=NgpRzfDn1JxcUCadYhPorUHj+OVkd+zROpYnLja5RDh/4GbW3J0VsXFqJYTCZcaYM0pQLyAQQJroCT0wkUX3pGe5GVal3K9ewUL9iw0MOOHt/Bo3+k2aLyTPY3/BRKqwPUZQh0Q239+n7WD5Xv3JFiLNzctqhUiMczKOKANbJts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862936; c=relaxed/simple;
	bh=QibKg2L+rZ+CEYl7+AVPx2YCvVBQrWjP8Q+sMFKYt3U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RwBEVIbqsGHQARZ+jXTWFbG24esHnD0YPD9PirExsJZrRMzn6uh8EPqLYDnjie3l0XgOKM8Vu42njTBawl9HFC1U9aKw6fcwhBLA081tc7O/i52gycUyrUeMM72zTa2AuDu+7SGFAY5JjE6dtPD65lh58PcKobOqSUYyRsfN2eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCv0k/bD; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCv0k/bD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862934; x=1810398934;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QibKg2L+rZ+CEYl7+AVPx2YCvVBQrWjP8Q+sMFKYt3U=;
  b=SCv0k/bDhp41t2+n3ClJ9huWNK7b4XAQ6JWrKF0MdKhr3YfrjUP44myu
   IPInl5pVgbkA6jaaUryXiWZcpzcY9dQl3BGC4Rvjzu1PSAnC0MKlqQWlv
   3fm/dUYJoQQBRuFdeWIow8ZflkG0iZEhR11Q+VFSaaBseX5pXwmugqfsW
   TAhNQQThMK08s3j1j+Bz844WAF9XvXFv/f+ch0yoDEhqwMlMi6vFzbcm2
   12WO6CD7U4/JMY1GiKrt3X6MaW+9zxCKAtfzPWbYRtyZGnWNGZxAGs6hm
   6+Jsz8Tc4UpnG69/GkiiBs1SgoXbkTurwHdtZ0MvPIBQb1LE78RTLRt9T
   Q==;
X-CSE-ConnectionGUID: HcaKGJDdSKWkxtQ3KOeptw==
X-CSE-MsgGUID: gdSLnz8WQYeuzWCM4dc9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="91206638"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="91206638"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:35:33 -0700
X-CSE-ConnectionGUID: Ys+UWimsQoas2NxpMWkkvw==
X-CSE-MsgGUID: VTYFt0qTROybT0KkDSn5dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="232336269"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:35:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 09:35:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 09:35:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 09:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBWDNhMINfn3b7YXnE1eE9UNv/rmoBj53RMScccri5mq8jmtOYQ8+P3AUHzVgmGS1gEhnuI6Z9pQcw13EHTlkOw7fKgwKGwC1TYd4wjlL+WvT8i04pHg7br38B+nYrv9XLwZCeg/P1N0dVLxGUtFpPxJ/xXP6RiGEjwtQXPAO0J9Yk1ukDDdzzaa5gkZlMsP7zpgh0dJ+MxHjZOS/NkcN+2E55NyKt6edNvcUOfwPg9KyOPT0/JZKr5mj44SHTWbbosud7aomzTy8ufs5lbyf7K3RDHrVcH8JKe6PJ0TFmkVH9ExwJ0GP4r/NM9OnsiRHkN5bI7iFDv2wIxROXhhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtozhwmppTXoxLAzeIXE1foeVIdwrkfR5EMxCC6n2rs=;
 b=SC7LShKxqj856E0M0ByPyhcq/xGUIVwQbn719WEB0WycESz+OmwATmtx0yKmvfttQdETqsMkxyHLFqs+d7PdwIqTE6OYICJWTDoUXo3ecVl7AyWOvHcmko4ibi8vr0tRJ5WSN969Ph3xBQ1uOBvDRlCvPd2DzUfSM7GRxkQU9xcbXePxFHnaZlvhjr8/OJGVLYiY9oJGa2hNCmRVJiAR+i40dckFixq27H4+JdeMLE9AbXCD7ymSyhrIXi9gt1bh4sMEaR/nxhFhcwQoQgwWlbWoXDDVXcb/1LmdtE8g48H528tmzT4bWQrIz0RGhZ1pobXlQekrC2WL+z06hnkxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 16:35:27 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.20.9891.021; Fri, 15 May 2026
 16:35:26 +0000
Message-ID: <f92d0db9-1d6d-43fe-8a8d-893aee75b389@intel.com>
Date: Fri, 15 May 2026 09:35:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x86/resctrl: Support for AMD Global (Slow) Memory
 Bandwidth Allocation
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<elver@google.com>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <seanjc@google.com>,
	<pawan.kumar.gupta@linux.intel.com>, <nikunj@amd.com>,
	<yazen.ghannam@amd.com>, <peterz@infradead.org>, <chang.seok.bae@intel.com>,
	<kim.phillips@amd.com>, <thomas.lendacky@amd.com>, <naveen@kernel.org>,
	<elena.reshetova@intel.com>, <xin@zytor.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>,
	<peternewman@google.com>
References: <cover.1776980182.git.babu.moger@amd.com>
 <cb8272dc-4419-45a9-8cb4-110c803e62ee@intel.com>
 <797e863c-211b-46b8-b404-de53f8453527@amd.com>
 <8939476b-1e1b-4aed-88a3-5b8764a63030@intel.com>
 <3bc59b3e-4506-4489-a424-6e7f91232af1@amd.com>
 <67782399-2d96-4207-8ee6-815bd0c4104b@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <67782399-2d96-4207-8ee6-815bd0c4104b@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA2PR11MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: a2069efc-667d-4b7b-4e77-08deb29ff7a1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|11063799003|56012099003|18002099003|22082099003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info: 5pdiaFpxVYaHoAsHl3WgK14m8HJjRdNev/8i6HH0QVEoSzGblemwROh2lVkbRxPO3qhzxP9L4b8tr3MZTSCHa5nWaptBUad8xL7bsj5VfEEuC3FEKq0SmB/RWr2myQB+gIsL8aaOdT2Gh0RYKsNiDii8JQAOAGlAxoWQFlNGaSeQ6DDAeudmJ1fBrzE0EanxfE+KL82CAotlWd9Iq2WBOH9fuNPtKV84M0+RHvd2yH5BrT/jNLaC27IMxD26KC/4yHpnYC8nC+y1Jmzl1pVLDMD5LgKcyBmE0UUug976lV7+eybQB2z4rWdqUQCMX5AQni8sk3RPaCKSpfUOGdyGo5p3axiMDZG4gDp+S/+hCIF/Pw5xOJSiPAIcG6I1CQP7Wxhymf/TF496/690hFfOiJJn/URo1CDELIawSemGUQOyop3nH4kGXu9DW50l+HlUZN1jAFSTvMr5v4RdEiYVwhBeVLaKEfeXYoqT9dIFwj/DAFjE2XLjS6spEMYXCIfouP1SC7cj4J873r+iznu2PmAuiKI3HzCCmTwR4E2X51MOLbQPBCqD2J3szTBODweoza7qf7tkyKZQ8ce++Gk5ljg0nAzMiIpj6tLGsqoNY79S9dnHJdyu8mlDvwsOCFsuV5Lise2hD8d3jtsnHi7Rh2aWYg57wfmvfnUhB2AYDt0cDKjzQL8pzEK4BgvFzIskJSmMXCgjVECju6Qpam3/hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(11063799003)(56012099003)(18002099003)(22082099003)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGZyMCs4MFpmb0t3MURzVHVwdnd5dGZIL3g3S0hqQk1HeWVVM2EvUTdSazRv?=
 =?utf-8?B?OUtKSVArUzdDUVdCQisyNWpSdzBsWWNLeXNtY3JIQjBHdnVibHQyeTNsdmlh?=
 =?utf-8?B?ZWNNc0lqQzl2d3MzaDBiSzFsQXZ5Zm5yQ1hvVCswdUZQZVlrZCtlYkkyVmtN?=
 =?utf-8?B?d2tLMXkzOVA0YklIRDFQcjV5NEl1N2loSXd5QlJEV3VDSHVzM2hWV0lPNnR0?=
 =?utf-8?B?aExsaXZaZ2J4V3Uvc2lXSXVOUXUzdjJvQkIzZG4vZTNHOUFENHk4QVdaOVdh?=
 =?utf-8?B?VEIraGRPek1sakNLR1ZqWWQyUWNjZ29EcTE3SDF6aXBmN296OHk0TDdjaUdm?=
 =?utf-8?B?bWhadFVPV0ZkMzEzOEo2a1lGbitocjFSZ3NnOXpwaHdoOWl4Y1VETFZrdjlV?=
 =?utf-8?B?TTgweU1KWGxvZGU5a0tCTzY1ek1ueWhIb2JiaHBaR21RZnVQdHRGQUVPVmFC?=
 =?utf-8?B?NEgrSEhUekExRUJCVDZGNExEalBJdTY5MEJvT05yT05TVVhCRGpWZEpuNTUx?=
 =?utf-8?B?eU9yaGgxU3RxcjdwbFNwaUl3ZHlVNUd1eWZIaXJQT2V4Y2VYVXh6T0pSUWR2?=
 =?utf-8?B?UEgxeGtNUFpEV0lZWFEwUCttWHhnbHNnSDRKTDl2SHFWRjJZUEYzVjBHUVdI?=
 =?utf-8?B?RlllQ3ZjWkhJTk94N0RvNWZVcmpFN3FZdzIrVXJ4aC81Y29uQ01pc0NxdXVj?=
 =?utf-8?B?WmR5Rk5uZUw5Y0NvYUZLOUl3VXp4cDAvQTFrTTFVdkdaZmRhWWpUMXluRnZJ?=
 =?utf-8?B?SmRnQzJzY1ZKSzRhTnJTRTBkZUdxbVJQWWJPdzdIakN6clpndVZVZm1GNnoy?=
 =?utf-8?B?SVgvbHZza2Fvd0daTlA1MmFJRktTWXRjN2gxdXliODA0SEdrcjhDbXBRTmVQ?=
 =?utf-8?B?V1dPWVFnOTlFY3VyaVJ2RDBDQW5DYTdnVEloUUZ2WXdXc0FVdmNPUDYyWjFB?=
 =?utf-8?B?Um1Yb2FmcHJ6bnFWMXJVT2dPU3pLdlN4YThEMDU0QWw4NWVvZTVsSitQeWVY?=
 =?utf-8?B?ZUZiTUdGa29kTE9ZbjMrUnpIRVNsdnhwYk80V0t2Y0NrTVdhYkcxVGtVSzdy?=
 =?utf-8?B?V3JNY1g4Q0s4SFVuQUxFeHAxMHFtazhlWjhwem9jM0syUkJYTEJNdERaZGFy?=
 =?utf-8?B?M0dTWmg1VXdaYXNNM2RrcUlhcnRGeDhkaVlJSXNLOTBsWGdRUGpVcytNQjgv?=
 =?utf-8?B?aVdhcEF0R09qaHVyU2xjaUI4S0R5OTdkOUVtRXhFREVLR01VZDFIVXJHbHZw?=
 =?utf-8?B?anp1OUJNUW9jekVJVTRBcE0xUDcxa1I2TlBpck5ndzRVUFZjakRiUGVrb0xu?=
 =?utf-8?B?aS9IR1BObHIvQTZ3cmdCUkVtN0tndjMrSXpOMjc5a2FzOEhSai9HdHYyNk9N?=
 =?utf-8?B?Q1Q5YjEvQlZXYmkvYVdqcXhtbU05cmVVdWlYaG9PZnNtTGJJeGo2dVpHV3B3?=
 =?utf-8?B?dFBWZzFDOE10SXVBWDlway81YjBjVTZyQ2VnVHNIM2Y4V3ZRN0hpaGpWNXd2?=
 =?utf-8?B?dGxBUUVOZzJPY0padlNQYXZnWDhvUnZlWGYwQklxajNQaWJoVHNUQ2lrR3hU?=
 =?utf-8?B?SlM1aWVSTFNpdjZBNnFhVktDTnNHMWczNERwTENqQkh2VDdXQkZlQjQxbGpQ?=
 =?utf-8?B?L2lZMG5HYWw0bUZkMFRVd3NXSkpQbmszR0JlWGZVOTZsMnMzMzl1SWlBVFFy?=
 =?utf-8?B?U0FEUHZGZFJhRi9GVjBlZjJjdFZCczI2RWQvYVRjQWVxQytpZ0QrZVR6dHVE?=
 =?utf-8?B?cjVQc3FES1RkLzFBQlByQTlpejlkbitvL0JKV2J2K1cvc2U2YkZsOE5EeDFh?=
 =?utf-8?B?KzgvV3dpbFZTWTFTVjM3OVdQVXJDSWJsenA0Qmh5K0g0WlRNazhxc2tiWS9Q?=
 =?utf-8?B?TWRJd0xDRDM5OURKc05XZk1kQ3JwVmNGOERJU1l0cWFxNDRYMlErcnhQMEg5?=
 =?utf-8?B?OGsyWjVqVzYydFcybVpYdkt0bUN3dkd6MzIwRitMZWV5aGpQditVemhwQmp3?=
 =?utf-8?B?VDZZYU5oa2tyb21scnJsVkViVWV5d2U4d2h4bDVGaTZUMmdyejJnZ3paODFw?=
 =?utf-8?B?c1ZhdHRja3hVMm1CQVBxTTRpZ2g2VENKUTVpcTZxcHJheXpneDdZUlRPUlU5?=
 =?utf-8?B?QnRxTWR4TE5mLzNMd3dPZjdJVnZsdGlKMElQZ3RRMExOcXhVVnE4ZXRpUWFY?=
 =?utf-8?B?aUlEaWFNeEdRVGhuZlZGKzBxVXk3ZTYrZWhTWGI2YzFLM1ZWOE95QVJuK1Ay?=
 =?utf-8?B?TnlYRXYwb0FJYndJWkUyMUpSSEJsZUJsY0dFV1hCdmJzbzJ6aFptZk5penA5?=
 =?utf-8?B?UHROSjNwQ0IzWko2R2k5NGQ5a3k4OGQ2dHlERGxMYXRObEYrYjl5SXFPSVlK?=
 =?utf-8?Q?KpLqPz2SS2YeC5cI=3D?=
X-Exchange-RoutingPolicyChecked: kgNVyHsxVY4onAPdPGxp40nZvMlkdN9rVNx5zDg3HbfndrxFxbwHkFCScOZvXS37/eUXGI2+Ir24N0T/uStGM9TzAeeTC6rV0WO0zMwpFdQR08ie1gNb6bU2vRE4QZKX1Q5uA66y+Wq8zkAQQOSs5BxwBD7pzOTQy8CKt1wg5wxZR8nAp/UFBDZfMRnFFgzrrOo0x9KTrzc3pmtj6FbMtbj6qeYhZgFWQwPGy+HcmV1xLtumQqhkxo3176FUIASI/w1r6RxM0kZj6J6v3LWlV//lNl3+dX76FH7u4rnYP7Jf2wPXfAmnBlOVKxW/XXR8zv7DKbJr+2M2LBKQhWTVcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2069efc-667d-4b7b-4e77-08deb29ff7a1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:35:25.9996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBG9GY3fTspOCvSgdOyU+xAAkgILmbJGgBrNKre6q0t6M4L5CF0iDea2lXB7m0O0h/7WGkYgBbTIbQNq4zB3euYXgUHrPKNzjcaHXx4etJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/26 8:31 AM, Moger, Babu wrote:
> On 5/1/2026 9:38 AM, Moger, Babu wrote:
>> On 4/30/2026 6:40 PM, Reinette Chatre wrote:

>>>>> Since there are so many dependencies on the new schema format support I am prioritizing this
>>>>> and created a PoC that I am currently refining and hope to share soon. We can collaborate on this
>>>>> to ensure that it provides a good foundation for the GMBA and GSMBA support.

Above is comment from me indicating plans to share the PoC and goal to have it provide a foundation
for GMBA and GSMBA.

>>>>
>>>> That is good to know. Let me know when you are ready.
>>>>
>>>> Could you please share which parts of the feature (e.g., Part 1, Part 2, etc.) you are planning to cover in your PoC?
>>>
>>> All three parts mentioned in https://lore.kernel.org/lkml/06a237bd- c370-4d3f-99de-124e8c50e711@intel.com/
>>>
>>> This does not address all the features discussed, for example it does not support emulated controls,
>>> but I hope it is enough of a foundation to build on.
>>
>> Please share your code when you are ready. I can build GMB and GSMBA on top of your patches. Hopefully, I can reuse some of the code from this series.
> 
> I didn’t see your acknowledgment on my previous note, so I wanted to follow up to ensure we’re aligned.

I did not think a response was necessary since it essentially rephrased my earlier comment and did not contain
a question.
 
> Just to confirm—are you planning to share your PoC?

Yes. The fixes needed in existing resctrl code are taking higher priority though.

> 
> My understanding is that I would build GMB/GSMBA on top of your patches. Please let me know if that’s correct.

That is my understanding also.

> 
> There’s no urgency on the patches at this point; I mainly wanted to get some clarity on the plan.
Reinette
