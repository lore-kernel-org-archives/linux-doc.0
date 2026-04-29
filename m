Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770AC1ADFE4;
	Wed, 29 Apr 2026 22:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777502059; cv=fail; b=lKhLe/hxsUAaXdOrZ7F1bvbp2JLIRF2ydZ09EdvfEtgI7STGLCochTIrGXILvC14xdhCtrjjPLj02L2NMu6NtotuAT0uJPs8SaGI9IoTFIIncsbgNFcMAozubP/0aiekb+PRV+Gt7nBnlXhIJhAxQa4JbCRehvcnf6tI/iDBbbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777502059; c=relaxed/simple;
	bh=m6dk3QlBDI1U86pO69JFA+7eOxrK7F8xlrnlS6EcYZI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=acFQ1DU2x7gId43poJlG6FUuKYkrVzaCp25JqAfg3+969KuaJ6XK7jZ3Y7a9Qb7xO+lPd+y+l4imbNUFbWGb8+Yg1IoNZx2AmpSSyQWIpfTeZVX23nHbdVAvZZCnEDeViBTz0Dri6kKWParwEcL+OP4dX9joYM9YqPUFU3hgRLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akN8YwEn; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akN8YwEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777502058; x=1809038058;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m6dk3QlBDI1U86pO69JFA+7eOxrK7F8xlrnlS6EcYZI=;
  b=akN8YwEnJDiX8Xl2IBiIaHa5NJDSwMNJlKlkLMQTqm2DhbODznyJ8c2Q
   qtogff9G3nmoxldWMsnsILs1cE33H5QukID/u3mUvfotRT7JgXakKJUDd
   7Dmc5w44ryWzNKQpbr9GfYaXOCZ6ThUkZhNmF6ZinQ+UDk82grSxWSnRh
   4hKnGbSKD/gsaeEhM1veuWnDem7AYNDdWCJAJuNW1BGLpIOvO0GvqMRqU
   TUgUKh5JK4WVTpgz8kXcMQTJGlBNLwod+t5MgJ5Kce+VYXUiq94nj579G
   en/bXlCjY6llZDYmG976rfOJ3005mbH8YW/iprpmXaYiVgN+FYuHbjWwy
   Q==;
X-CSE-ConnectionGUID: c+0GWBcaRcqo3hfRiTVS6Q==
X-CSE-MsgGUID: AMDzYLhITwCutdszl5TrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78337973"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78337973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 15:34:17 -0700
X-CSE-ConnectionGUID: h/0I0jijT/+vraBlWVfMUA==
X-CSE-MsgGUID: Io4GxMGISi+U+MkUAEulsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="229802470"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 15:34:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 15:34:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 15:34:15 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 15:34:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKF/Rc226xM4kpf03hCgQ92oMPzuRqnUxcjGnM1MOtV49iVq/cSCtI4nRb4MkDOdS+bL5rsjvfgUWLMyOoyODL4B/aZ2dK1jqeI5LQVigS+FjpxyRYQKtm4HICWFVvFF8skAoZjvjIuIuvQYxToBaxdKyTwpCeQlLJ6n/WaEI0KBwGF0ib7xg4oT4up/ttwZ9t75Smkmr6Wcs/7rkK2hGfdhLxLOJsgUJ59bS8SU6c3ilmF5HL6244xzK7LKsgrXs/FPKgPwK4sqhm8OInNLV/XnbGBr0LaALj+kR+lO8PXS7eg7dpmBsDMhBa0gB9KOObJAqDoEKQt2s9xWRd4sSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sKiYh4zPpySgxXrnD9ioOfUNMveZcIi0BvVuaRvizw=;
 b=Kd9Z++W4FL4hzZyY7g+SrnckOgVJgczxdboP5vARxirAE/pJPGmicpTHlWVADiAhwEfm27xtO1HjN3lBbdRB8XuzEAimiAPp8kNww++8yu+6b1qXQw39aQeBIXgua9ZFHr6PKSE43L/nA6VmDU0M1CNyA9ki4HBybfiDZs7b+xKsCROa+3bMUPteM/+KyZep59+HtyUV3xfje/49wY5KLfcqVOuJWdIRagrRjO+bdYPKNOakrNxsN4fOjO24NyN8RiK/WDy/ReM28yLmNoNSzuxRV6MNa+ueVXE6s+LVmib0xLFXT1ekXK4B0yRwle6P/QwGkK9ytrkaXxfBYIy7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH3PPF73E424DB7.namprd11.prod.outlook.com (2603:10b6:518:1::d2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Wed, 29 Apr
 2026 22:34:11 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 22:34:11 +0000
Message-ID: <cb8272dc-4419-45a9-8cb4-110c803e62ee@intel.com>
Date: Wed, 29 Apr 2026 15:34:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x86/resctrl: Support for AMD Global (Slow) Memory
 Bandwidth Allocation
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
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
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <cover.1776980182.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH3PPF73E424DB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 86bd7909-3db7-44e1-b53d-08dea63f6f0b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003|20046099003;
X-Microsoft-Antispam-Message-Info: zu9qSMXH0aUUszrriwTGoMlRn2xGZI4+ZRR5gNJSpxB8H3XcdnUkiBqE56jZIjA9178hHZmcNi4rlBP5qmBItUBn2wn5qBfC0Z54G0rHxOHsxb2b9uq3WC293LSb6HtHoXy6HQ53w0inSYl0z8pubE3WZnyzbA1BM40pWVxxbxuvCmbAD1QeMI+VKuPJkpn0UCay9zIbfwCbg8oNe55ntQOEdu/3YRmC2zpxOrvzRBVQZF3g4NfSyAqw53m3+XbvRHzaPLiUurhCEOf9dU31bLekppxXyFx2tGD+rb67SOHR5TnFK4hjlRd7YyaO92WLrL9jpZtVyYgYLlFsmEGbxF3yR8qEHoLuzXS9Ax3/lyMnXdBqTyNmK4w4CXb7dZJ9hNtX4W7rifw0O16jJ9mIzJZXGTO4t1biZ/DX9AtBgWxieAFk5/ND1H/uW1sdJeLqjv3TraDENwdky/wUm6YTK5gz1FJyu0nyLCKhxtmMUiMiOUcxGvzPGVH1D7+Wph/KefOYSMkb8FgJp4uJTYcMAoc5ix8dA8C+7IEGA3+63SglPmfXJd7qWN+M/OuBJwB/OiLwRZEjrWfWejmP5O2kMu5IcFsQOSnR80N1kJpw1ih4ICjYOaB2luNGBlXD2knba9xkAaO/G+PAdWQlxkXkMbwC0vKr2oi1sMdtRJSXN2t81l34Fg+IU7B34HXHXwkI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNVdENFMkl4dnYyejBlNUZtdXBsTzlsa0N0V3U3YXU4RHc5RmxtdDh1eG5p?=
 =?utf-8?B?UGRrTGpIbS9EUTZFczZnSFRFOVM2MFdOdEFCZjc2SGN4bURYWW5yOTBidVNB?=
 =?utf-8?B?dk5HUjI5YkR6ODNxTnNyRFFmVDF1Q0x0cDNRVnhoOW45dndEcllpZktmUlpT?=
 =?utf-8?B?Q1dyOWJwOE8vaWpoSkM2dG00ZWQ4V21OWFZ5ZUx1NjV3R3NkZFNmOHF6bHAr?=
 =?utf-8?B?UFA5aDhqWFhOa0c5UzQ3ZVdtYVJHd1h6ZXJ0ODBobHpZNUJUeWtQWkZrdGlk?=
 =?utf-8?B?bkVLVUhiL1EyeXpqY1M2MkhjV1dyWWlubHZGTTFVNTIyL0ppQlNRVHJoMVcw?=
 =?utf-8?B?MVU1Y05TZUF4aVRhWGJDVTAvZU9pZEhmUDNqdm9pbzVIZGpHYTBDZm9nVURY?=
 =?utf-8?B?RzhHUWl4UWhsUmVPeU1XSURCS2VJZzlaUlF4R05hemtXbjlwZjFqWFFBTmNj?=
 =?utf-8?B?MTVDM0s2OVo4K3B3aExqc3BoUFdCZlA3dmg1QlRHQlVKYWs4TzhLSTBXa1Nk?=
 =?utf-8?B?MGZ4TEY3ZEFEMVhwWjBER0ptdUd1NklCTkR2blh6cXBaa0Y3UVo0WFR3Y3l1?=
 =?utf-8?B?eEdmamF0VDQ2akNBUVRTWE9HcUgrQWR1aHRERlBDbForSXZ5L1hNSnVUdWN2?=
 =?utf-8?B?dm4rS2dSd2dVd1FLbVg2cEdpNjNhRmtZamJvRURTMFZIQnFCNXdjNjBTYW8v?=
 =?utf-8?B?YnBKQks1SXdDQTlaTjlscmwzZVJQTWJZZldaeHFCcXRTcXc4bitWUitsK05T?=
 =?utf-8?B?MUh0YUttVUY2eGlTeWZ3TUJuUzl5K0VrWXdSZTVxZjJQRVB5NGRSOVc2Y01q?=
 =?utf-8?B?NGtRd3FKRk5lOTFWM3c2RWl0cUNtQTRyYVJaSlFndTRXcTg5bDFVeTBQSVp0?=
 =?utf-8?B?NFBZSTcyWndwNW93RnhUZ1NMWi9hVThCdlUreGs3aEt5QnFPUHBTcFAwL0lK?=
 =?utf-8?B?RW1kWDI4Q1RCRldlN1d0bURsbVB4OVA4eHVXYlAxbVYrdGN3UnQ1QWsrT2hZ?=
 =?utf-8?B?ZkFnZ25BZnVEcnNwSEhSS2dLejhkanZvSUJrdUZ5SE02L0poUGJMSldtcTIv?=
 =?utf-8?B?SXR3eXl5UEZrc051QWhoQmdsT0xSK1J5U0o2OVVJYU9vTkU5amV1aWVSd1V1?=
 =?utf-8?B?a0RBVWJxdkRJeHZKeEp6a05yb0k2d0VzREcxbnp3Rmc3Z05NTlFtTHFsZmEw?=
 =?utf-8?B?aW5jMTBPNHg4Nzd4dit1YlRuVTFXcUthaWN5OG8wemZEL3FvN3dZeVVLZFJk?=
 =?utf-8?B?cmlKcjk3b0VYQTNkcXJKalBzSk1OMitHenBJNWlDeEpwaDZTcWkwWk8wOFpH?=
 =?utf-8?B?dHVYcUYvSW1wY3FNcE5OWGZjRy9oN2RYMlhWdS9OWDhZNjZQZWJsUDlFSFpK?=
 =?utf-8?B?Kyt0dldNWEo0Q2c4V3FxRUJ2VzVUMnN0M0UydERjR3gyS3BqUXNxMURKY1c4?=
 =?utf-8?B?T1VIVHlYRm9wdWN4aDBrQnVKNzVjb2dseHVnUmowUWVsdEc2QjBKWjFjQVpv?=
 =?utf-8?B?dG1PUWVIc0p3UkttV3NZMGpkbkpFUFBTVVBpazl4QVFMSWZHbm9LdlAzeVVp?=
 =?utf-8?B?TWN4MG16K1NuSTcya3hObWovWGl5T0hYVHd3ZVBFczl4Tk1KeHA4SWt6YnBn?=
 =?utf-8?B?MEtRd0N0L3hFS2JxTnlhRnhxOXRKQmJsODk0MFRaUWtyVXYvTndCWVVLQm1p?=
 =?utf-8?B?RzF0U3Q0YVljemtoV3I4aU03N3ZRaUJ1OHJhU2xMRlI5aENCbVg4Q0IzeUZh?=
 =?utf-8?B?em82YjVJRDUwa2h0VDVkcVA3bkdDajJ0a1ZuNkt6bG9EblJhQmhXdzMvbWl1?=
 =?utf-8?B?eVFXSCs4bmhiMklDcFYzeXd1b092aGJtL2NoZk5IMitFM2RuREZuVEpnZ2FK?=
 =?utf-8?B?bUJWNm1zcjBvbnh6SXFzN1NCa1RhemJyWFU1dnYwemNpd0x4M3E3U214YXB6?=
 =?utf-8?B?dkVPV3FVek1Fd3MzY2t4TzYrRmpMbWplaWEvZGZiWXlKSERuN0kxNDlvYTZa?=
 =?utf-8?B?VnpuZXdBUnZybk53aUJyajJ3U2g5MWJSS0RtWk5JWlFJaUVuTnlPc29tRm1u?=
 =?utf-8?B?RmdyYmJFRnVxOUxISXFqa0JmQWpyc0JKVG9WRThOUUdmWlpweGE5SlhGZEsz?=
 =?utf-8?B?T2tJMUh0OWZMSStOQ05LTktBV2RjdUdmWE9QMS9FZ1pDSjFQL1dQRXVYVkla?=
 =?utf-8?B?dDFmWlB0ckx3Y3pxMXFQcnZsZzcvd25Wb0pQTnNxelRueEk2cmRkeWI2R3pY?=
 =?utf-8?B?NWVXbG04OTZzZ2JHMVBwNTJla1BNYWJRTXJwM0hMSlE5K2crR3lWR1pvSTVO?=
 =?utf-8?B?eU0rSFNBZ1dsMGNveHNwWUpvcE8vS1NEeC9KWlFKNklCdXl0QVprK2xrSDJD?=
 =?utf-8?Q?ZYFdzNFBDKLfmMAU=3D?=
X-Exchange-RoutingPolicyChecked: otIFCKiblmSAbTOGNTDbkydL1nkAlOyOlHww6RbMr9TmXQN5VA20B5nf9o5Fy1pYXSD9a5BpCearalHojRZmoZHkPPFRR3hnSb6LORsjUuVVdetjmFt7dHS8uYBGBRFUspNXKQYBn1NbEHAQk8fBOXAQRkeLkbidMe1VPXLY94STTsHTbtq7c3y4eAqt3eu58nVeHGuMAcJEX10dEjzPuvCuu9jGBIfZYQfu8bfurJFrMn7LI3IinhTR/oMZvoTXwUIDNAMZxf4LEnlbhr3VwN+c4G9/WWzQN2AMkBEVH+5z/KZl+KJY9z8pE2rXZjARHBbgVZMfylKcmQaLyWiQug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bd7909-3db7-44e1-b53d-08dea63f6f0b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 22:34:11.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkdvpHTyPD3Ov9NweSJIcKM1ZkHhkcbc4c2ynQRAtCyM1au4zYzCnBSsqckAwYIOCH0+OWC0ieqPm+pl55nUCi2HlXlL33GVAj46WdgH86M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF73E424DB7
X-OriginatorOrg: intel.com

Hi Babu,

On 4/23/26 6:41 PM, Babu Moger wrote:
> 
> This series adds resctrl support for two new AMD memory-bandwidth
> allocation features:
> 
>   - GMBA  - Global Memory Bandwidth Allocation (hardware name: GLBE).
>             Bounds DRAM bandwidth for groups of threads that span
>             multiple L3 QoS domains, rather than being per-L3 like MBA.
> 
>   - GSMBA - Global Slow Memory Bandwidth Allocation (hardware name:
>             GLSBE). The CXL.memory / slow-memory counterpart of GMBA,
>             analogous to how SMBA relates to MBA.
> 
> Both features share a new "NPS-node" control domain: a set of QoS (L3)
> domains grouped together and aligned to the system's NPS (Nodes Per
> Socket) BIOS configuration. Although the control domain is NPS-scoped,
> the underlying bandwidth-limit MSRs (MSR_IA32_GMBA_BW_BASE 0xc0000600,
> MSR_IA32_GSMBA_BW_BASE 0xc0000680) are instantiated per L3. Programming
> a single control domain therefore requires writing the MSR on one CPU
> per L3 that the domain spans - a new pattern for resctrl. Patches 2/8
> and 3/8 introduce that infrastructure so the new resources can reuse
> it.
> 
> The features are documented in:
> 
>   AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>   Publication # 69193 Revision 1.00, Issue Date March 2026
> 
> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
> 
> Series overview
> ---------------
> 
> Patches 1-5 to enable GMBA:
> 
>   1/8  x86,fs/resctrl: Add support for Global Bandwidth Enforcement (GLBE)
> 
>   2/8  x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS-aligned domains
>        Add a new ctrl_scope value for resctrl resources whose control
>        domain spans multiple L3s within an NPS node.
> 
>   3/8  x86/resctrl: Update control MSRs per L3 for NPS-scoped resources
>        Add resctrl_arch_update_nps(): builds a cpumask with one CPU per
>        distinct L3 in the domain, then issues rdt_ctrl_update() via
>        smp_call_function_many() on that mask. Falls back to the full
>        domain mask if the scratch masks cannot be built. Route
>        resctrl_arch_update_domains() and resctrl_arch_reset_all_ctrls()
>        through this helper when ctrl_scope == RESCTRL_NPS_NODE.
> 
>   4/8  x86,fs/resctrl: Add the resource for Global Memory Bandwidth Allocation
>        Register RDT_RESOURCE_GMBA in rdt_resources_all[] with
>        ctrl_scope=RESCTRL_NPS_NODE and schema_fmt=RANGE, add commands to
>        discover feature details.
> 
>   5/8  fs/resctrl: Add the documentation for Global Memory Bandwidth Allocation
>        Add examples in Documentation/filesystems/resctrl.rst.
> 
> Patches 6-8 to enable GSMBA in the same shape:
> 
>   6/8  x86,fs/resctrl: Add support for Global Slow Memory Bandwidth Allocation
> 
>   7/8  x86,fs/resctrl: Add the resource for Global Slow Memory Bandwidth Allocation
>        Register RDT_RESOURCE_GSMBA with ctrl_scope=RESCTRL_NPS_NODE.
> 
>   8/8  fs/resctrl: Add the documentation for Global Slow Memory Bandwidth Allocation
>        Add examples in Documentation/filesystems/resctrl.rst.
> 
> Changes since v1
> ----------------
>   - Earlier sent RFC(v1) with Global Bandwidth Enforcement (GLBE) and
>     Privilege Level Zero Association (PLZA). This series only handles
>     Global Memory Bandwidth Allocation. Both the features are sent separately.
> 
>   - Documentation
>       * Fixed grammar in the GMBA / GSMBA sections of resctrl.rst.
>       * Added examples to update GMBA and GSMBA in resctrl.rst documentation.
> 
>   - Major changes are releated to RESCTRL_NPS_NODE scope handling.
> 
>   - Commit messages
>       * Reworked the changelogs in all the patches.
> 
> Previous Revisions:
> v1 : https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/

What are your expectations from this submission? From what I can tell this ignores
v1 feedback in several ways:
- It introduces two new resources, GMBA and GSMBA, when the previous discussion agreed that
  these are not actually new resources but instead new controls for the existing MBA/SMBA resources.
- It does not mention or attempt to address dependency on new resource schema descriptions [1]
  to support user space in understanding how to interact with the new GMBA/GSMBA controls but
  instead defers that to a snippet in the documentation that user space needs to
  parse to know this control operates at multiples of 1GB/s. 

Apart from ignoring v1 feedback this new version appears to complicate user interface even more
since now it is possible for there to be a single control that may operate at different scopes but from
what I can tell there is nothing that helps user understand whether, for example, domain "0" means
the whole system or a NUMA node? 

We have discussed several times now how resctrl interface needs to be enhanced to support
this and other upcoming features from Intel, RISC-V, Arm MPAM, and NVidia. It is thus
unexpected that this submission ignores all the previous discussions. 

Since there are so many dependencies on the new schema format support I am prioritizing this
and created a PoC that I am currently refining and hope to share soon. We can collaborate on this
to ensure that it provides a good foundation for the GMBA and GSMBA support. 

Consider what I describe in [2] - even in that response I speculate that a "scope" may be needed and
this seems to be case. I believe would help this "NPS = 4" scenario. Adding "scope" to what I shared in
[2] may look like:

info/
└── MB/
    └── resource_schemata/
        ├── GMB/
        │   ├── max:4096
        │   ├── min:1
        │   ├── resolution:1
        │   ├── scale:1
        │   ├── tolerance:0
        │   ├── type:scalar linear
        │   ├── scope:NODE
        │   └── unit:GBps
        └── MB/
            ├── max:8192
            ├── min:1
            ├── resolution:8
            ├── scale:1
            ├── tolerance:0
            ├── type:scalar linear
            ├── scope:L3
            └── unit:GBps

With a "scope" property of the control user space can know what the domain ID in the
schemata file refers to. In above example the "GMB" control has "NODE" scope so user space knows
that a domain ID refers to NUMA node. If the system is "NPS = 4" then the scope could be,
for example, "SYSTEM" (for the lack of a better term) so that user space knows that "0" means
entire system. What do you think?

Also note how the other control properties helps user understand what the schemata file control
values mean. This is what I expected the GMBA/GSMBA enabling to look like ... and you seemed to
agree [3] in v1 discussion. What changed?

Reinette

[1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/
[2] https://lore.kernel.org/lkml/06a237bd-c370-4d3f-99de-124e8c50e711@intel.com/  
[3] https://lore.kernel.org/lkml/91d50431-41f3-49d7-a9e6-a3bee2de5162@amd.com/
