Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3E01FCF44;
	Wed, 18 Dec 2024 22:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734559283; cv=fail; b=mP5lo/N4IJ/G8gIqLqwqBygu0XKMZYWhtyB6jEazQvJ9Zh8quO8QwUptvItU+IklmS/tEkeT5z9FL86YiL/RXKzvD0scCyU7MD3H1NLek1b6lf1HSPGIZZTTcwMDxOIkzJdVamSc387cJI+D+7NqAaxHEUj2xfONZV/nGnXt7iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734559283; c=relaxed/simple;
	bh=tHTd9s4vplxXpQeGzx5z+iCDWxXFAOJLU9mQPNFjKHo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LSq7IdnFi3zZ2cchuO13D7rdoOXQuzPhjy3//ugdRv4duUUvGjmcCx1zBi8kOax/8aPsrJTJshLa+XMkNljUaeM/KOojOgRDQqgyAuwnYLJKRMg5EipSyyqORv0nlPkcZIQTh2AfdDwoMf6jpdRPl/LE4eUZXNmGGUfzC2+y2bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NN5dmDQA; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NN5dmDQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734559281; x=1766095281;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tHTd9s4vplxXpQeGzx5z+iCDWxXFAOJLU9mQPNFjKHo=;
  b=NN5dmDQAcdAsvC/MjjKENwjbzOxvzUvFe/7hTJHosIWzm1Exc3NLQZwI
   3Ah4A2jVynDWkY9Cv3tQMQP+VCL1NvLsJrXhc3uwlDlP8KyxOG1c2xHcc
   V4RZoS75Dd0K6r7tp+bkdQ+F3mbpcMTPAyBN6J58D0hwrAEfVSAEUr/DF
   aiBqPFXMTF/EWx87PpOrevfmI7XCRTj/+NDR0GnV5DepOr0I28+aDyAXL
   kz4aoB3DNP+3A6LmV+Jtoxi7nVtJ1IcwiRgPXt+ha3BblS+YsWbb7Irty
   dNMte+dh38HoGTp7CoSmT5uEqqhSxyKzF3g4Sb7+pYu2WzJ0o1klJHWV2
   A==;
X-CSE-ConnectionGUID: 4yndCY4CR9WQ8updEhhEMg==
X-CSE-MsgGUID: qo7YV798Qy614hQh3olWwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46064550"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="46064550"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 14:01:20 -0800
X-CSE-ConnectionGUID: WKMJWI2ARlapDkKs4t9ByQ==
X-CSE-MsgGUID: R5/kxXOBRBK+jB9PxXdmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98469949"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2024 14:01:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:01:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:01:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:01:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1dmS3L/gIEDcHNWGAOB+b+nC6yzG1E1B+hrwFbuhItNtj5i4gKUtlpVVuo55UuS6o6FR9Y368KTP9SJ0mjclCDhqUNevoIddAU11c2SoL1tQROKanrOsSGPr4XUfjbW0IWZIFtWo8yGOgPLPOPExmdU72imBSyS0a6yux0+H5f+qGrPC3CILbn2WIGB7VZbNXURQJj/mudk/LDS+EP3FO/wXrJdkzJ7inlZzRRe3PYUssNWH5OeQ7ART6Ga5zF6kffuFRqOGFlrHsNfeOPlc9anEjqYSEPD1Q8L5bDl56KotvTPmb87C+KWGW86meIKzXKXiUgIGZsF2yAgh1+4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64uS6FKuPbq/EDxwbIjSqUS+ptMqhegXzO/xIs2NFkk=;
 b=ZjTX/Re/uOSY+PhlHNdQ30vzEWU3k6DqXxhYIs01N5UH5tM/YI61cgZEt0Fvjuiah/79JEp8a6Juy4w4+DUGoz2ll8PQB0HQY60cn7EdWcASlvW8XWgofzKPEHkU1k7wHkv4hNZSgyjAIpCLm3aVizDD4xoxSh6EZOtp5IEMW24AUDIzkPN3wIbpCVqUZ5rheh2iFokA9GTqwKmP32N4NzZSJ5wL1uPYdGfnTLp6q7BDB8UdJKENvfXfWa2vAxH7rShXNDran7oTWBV14yE2SWytvsb9z53q0HqzBw/x31Zex3diYMGobUT/7pRqcfYpdJ9HRZuR0wiZzfbOF2O0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 22:01:16 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:01:16 +0000
Message-ID: <f8073d8c-7dd0-4e8d-a196-183acef13d66@intel.com>
Date: Wed, 18 Dec 2024 14:01:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
To: "Moger, Babu" <bmoger@amd.com>, "Luck, Tony" <tony.luck@intel.com>, "Babu
 Moger" <babu.moger@amd.com>
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
References: <cover.1734034524.git.babu.moger@amd.com>
 <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
 <Z1tzyrUYTFR_iHuJ@agluck-desk3>
 <e43b10b7-60b0-412a-b55f-96271764faa1@amd.com>
 <SJ1PR11MB60831C44DEE7711F93C3C26CFC382@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <8cffb2ad-6645-45a4-8d05-c967c82eb111@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <8cffb2ad-6645-45a4-8d05-c967c82eb111@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:302:1::43) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 68cd4f31-485a-48cf-7435-08dd1faf7ec8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1BWaUlMQWFqQWk2YmxiMUVEcXVBMG1ybEZJS2MwdEJRL0VkYVVwL3ZodXhm?=
 =?utf-8?B?M3FYeTdLV3pleWZkcHhDTTMwVzQ0MCtIRGswY0R6RkpsSGRCRlcxMndqYlJa?=
 =?utf-8?B?Q0RyQTRhWitnMEJMUzFoaTBJVENtMWgydTNlUHN1WkxKa04wSFRid3BCeWc3?=
 =?utf-8?B?eEVGMXQwKy9nNUxaRTAxWWJpOUNMODdpaHFoTm81eXZFc0xJbmNuQ2VNVEEw?=
 =?utf-8?B?OU5UazRCN2JPUm12U1BreGQxVGNrWjIrVldhcE9RZDVvaCtoVWJDcDVSQ0dt?=
 =?utf-8?B?dE12MlN0WmlVaFBucGFPby95R0E5azFZdjdYaGFyMWUyNGpTbGpqVXlDRnIv?=
 =?utf-8?B?WFdYaW1nOS9YcXdNZk5pUFRvNiswNzhBSWVHbUhzdDcxcVFIbUFEQmN5YzRj?=
 =?utf-8?B?Y1p5NElkR1YyNWlFUERlUG95ZnVsSEliUDhiVnRkZ3NzdlhJcmZWdExMSFVi?=
 =?utf-8?B?YzArRGpzR3YwU0UyZDZhQTJrTWlNOUVZeTlLZGZoUy9IWWtGTlQvWlUyWkFv?=
 =?utf-8?B?SS9iSEtIeWV1aHFCZ0xGNTlWL1pOM3Y1bXMwQ0g3M3hVRDd4aXZNSnlrVUV0?=
 =?utf-8?B?dXp6U0pEME5hZ2pidjdlOWFxZ1lBT21wUUtreVhnOU53dzdLZ3p3cjZKVTZ1?=
 =?utf-8?B?VklsNDByN3NTdmdjVFdBSktWc2lLa2dqRy9QdnFwOVkwY0FMOVpjRFBkZ2ZK?=
 =?utf-8?B?YWswamdHeGVqaEZJNlVkT0trdHlZczhsL055L0JZREJPU3FiZU55WWt0ekZM?=
 =?utf-8?B?SFR4YVpmV1lQVjh2NXJiU1FzK3RRK01xbCtBYXVabzQ1OHpyUFI4UDFqMlBv?=
 =?utf-8?B?MFVNNy9pT2tuY3JseStrZms5ekNMVGVGNjVzSzl0SG9LUGdaK2h1cTY5WnZ5?=
 =?utf-8?B?YnpKRk5XTHp2dEkzcU5CRkFiL2dFdzRIQnlxUk9DZkZZbUJSWHQ0MWVLVy82?=
 =?utf-8?B?RVM5QVlnMWdyQWZHYyswVjJNdTVoS1lXaTRIeVNPTll6K0xiZDdIazl3OG10?=
 =?utf-8?B?MFlMWjAvcGJlM1UrcmdQcWJSUkh1dkdjZFd4b0FlanZGd1oyZmxzWllZMmNH?=
 =?utf-8?B?SXBzRWVWZ0FNSm9zWlQzZmwyeWxlNlJRR1JTb1VTZmhud05iMHFIK0VVaGdP?=
 =?utf-8?B?ODZRNko2NkUySTBRWWVXU1BNUm5jWDllc3h0VmRlZEQrVFNkNGtCQkNzWHJL?=
 =?utf-8?B?bmx2eWNESVYvQTFjNFRkUWJMaGVQR2ViQThPanozYy9KdHZqWjloRTh6SjJ4?=
 =?utf-8?B?OHphcjk3RWI1ZTZTcnZMb1ROZmZHd1l3WnhjSndaK3RLY2hScUVzcktiUzA5?=
 =?utf-8?B?cUNGeENyRUpiNTFOR1lYeWdlcEcvT1VGMWZ4ZUQ0ejBDdVZxV3dRMGQxdTNL?=
 =?utf-8?B?T1pmc0s2azJNYk9aRlRlTzNFdGFPemtXQWxCN084NlRuOWZnQnIvaHM4ZFFW?=
 =?utf-8?B?bmUydDAreWg0dlBpa2wxTGRYYU9sQnpjZXV5RkxNUlY1MDQwZ1ZhdDEvclU4?=
 =?utf-8?B?NVBTVzFnOFdoMC81Q1pXdldjZ3N0cWlwN3Z4c0dPNUZnTGpIa1JpSzd1TzFv?=
 =?utf-8?B?dHpBWVA4VTh2WlFtSE1xZzhFOEpHVjJiME1XSysrNm01M1F4YVMyUFBBbUxJ?=
 =?utf-8?B?T2llY1BDL001eG43SmVqWDhzci9aZ1crVWNVRVpUZjNaS0M3RHRLZ2lqS2xT?=
 =?utf-8?B?NWRKdnhSeU05eUNUL0xQVmlIOUUvZDNYUkYvUFlPNVRmYmZQcVJsVGtDVmpV?=
 =?utf-8?B?L2gzdmpMTXFFdVJtLzV6bGQ0ZlpDSlNPVHZYVzdXakFuZ3ppa0s4L0ZmNk1X?=
 =?utf-8?B?dGN1UmZBZTFSUWNrRUlVWXRmaUdwU3crVTJOTGFQaTFidDhSME53enFsbWJu?=
 =?utf-8?Q?cNICEHodU5Gtu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3BIYkcvZ2txbFVTdjUrMHl4czlmaTE3ZHpGbzIvT0UrMENRUC8zSWR6a1or?=
 =?utf-8?B?V2NNNUxNRkRjZnVMdzd2SXFDLzVqRlNPMGZrbGQyN1gvaFlGY2lBNkE3SU93?=
 =?utf-8?B?R1F0MSswYzkzK3dWMmx2WGVYOEVIRDBKWm9MQWlETkJNUHJYdDk1eUVnTkRr?=
 =?utf-8?B?K0JIei93UVdwNVVQanpKQ0YvKy84ZncxbWR3Umx4UGJ0bkp3TW5YUE5KUkU3?=
 =?utf-8?B?akNuR2JBWWY3bkxna2dCUmI5YzJLYUhIMTNXM2UxdVY4RjdNZ1lLRHJlUjhL?=
 =?utf-8?B?amJLWlRRd3cxN0t6WXYwMkRBNGVRRnBwbmIzUmlOMnJ3Sk43aWN3UExtOVhN?=
 =?utf-8?B?dVFZNlFUYU9GZ294S1A0TjBMbnNaRXdqVU1qbjZWamhRSi9jYzRlbklkbkFs?=
 =?utf-8?B?WWQxb1YzTGxxeEZVVERLcnphc1YwK0pCR0ZGaHB1L1huWVpMdVB0UWxjV0hz?=
 =?utf-8?B?ZTlablFmamZnWS9RRy9yU1N2dHhUYjFmVm1BUHlGUE1raVplK3BENHE2SjVp?=
 =?utf-8?B?QjZDZUtZQkhNTnB6NG1HOUozdHJtSm12eEthcC9USW52S0xWWlNDdzdnbW9F?=
 =?utf-8?B?eDZhTFpIKzgyejc3RTFjS09sNjNoZHk1VGNSdDBRZnRLTTJmb2FHanVrUU5C?=
 =?utf-8?B?Vk80VTRtMzZocEVTQjVZU3FXcnBuVTF2NmJpNmhIWWo3WUwrblhVajR0Tkt3?=
 =?utf-8?B?NkxnYXV1QzhSaFdLaWpFVkVLRkZhYUplZkkzNmVDcTRQeUJlaFhNTkxUVldo?=
 =?utf-8?B?ZnFzeXVvRzZPSGUyVTFvTVcrU0RGT3VUem1zaWFRNExwaE1OUThjT2hhUkJ1?=
 =?utf-8?B?dkN1M056RjBjZ0g5aW5jM1pYbEFUWE5jdFZTNVhiYVpFcndRbTVrY0VrVUtL?=
 =?utf-8?B?TVhRMHI0T3lvL2tXc2Z4Lzh0akx3Q1RieDZRZmdYMnhRTEtwY1h5eVlhS3A1?=
 =?utf-8?B?Ky9QMWJLVHY5ZEZhMzl2dE5GMGtJbUw4Um5KcC9HdVYxVTRNWjN6d3hjSk5s?=
 =?utf-8?B?NjRBS1VHYVA0cjNITXBnMCtOOFlETlN2T3I3eTVwRldCRGxCT0R4K0laeDlk?=
 =?utf-8?B?Vlkzc09mRlMyVFNmcW40T0pBeTFOaC9wckFvc0g2amV3eE94RHpzRWZIcnZI?=
 =?utf-8?B?QlV6RkUvUy8ydk4rQy9xRktaK0ZlcFFlN1FKWS84YXo3Y3FJYVhaY1FwUjJB?=
 =?utf-8?B?bG9PM2dGSXdZWW1JeTNIUEJlaHVoOG1id1J1OTNTR0xMUHVoQzZpbUtxTDBI?=
 =?utf-8?B?d1gxcHlvbCtzYTA0aFVuVzNjQ1dPTkorRnZXazZYSTFpaStoYkFNK1JjL0pp?=
 =?utf-8?B?T1MxY3ZSL1JiUGVxOS9LSi9OZ2JteW8vbVVKaXJQbXdYMkJMeGJ1RFk1R0kv?=
 =?utf-8?B?aUJUT1QxMFVhTnI4ZHF4R0dJejRwRGtQekErSTZaeWJEeklNbjRjOGYzSXYx?=
 =?utf-8?B?ZmJ4eTA3VU92YU1WejdCcmkzakRNdGkzQVVXbFNtTHhPeHRKcEl4MHQvNDVD?=
 =?utf-8?B?NWQ0MHdvb2pEZmtadmdob0k1ZHJtUGV2cnNMTUg3a2tjakZzNzhWQTNFVGpD?=
 =?utf-8?B?NFloRHFIa2dBM2ZZcFRoNnE1d3dSUXZlcXNQWVp6dW5Fa1lhemROUTFCUUpC?=
 =?utf-8?B?R2o0cEtaSGpySEIrZy9aWnFDQnR5dy9BZ3c1S1AwbkxpMHZUY1pKaXNEUGVo?=
 =?utf-8?B?aFh0L2tlanNlaE92YmFWU0REajZuSGIwRGVlOVN4bkM3eUo4dDlGZE1aQ2lW?=
 =?utf-8?B?enkrM0Rkck5pTGlxVFFtZGRid1czNU12WTRSUGRQcS9nVTVlM0wzTExSeUh4?=
 =?utf-8?B?NG1rL29vWmFBUzhOWVpTY2pZbjZLZTBqZURKS0sxV3JsdERCNFJDUnFuODU2?=
 =?utf-8?B?bExHTnhSNlI5WnFnaUFtTVNwalB3Z0RxZlk5VzhyWjNYdFFhbVppWnFyTnFG?=
 =?utf-8?B?VTBWczZ4ZW80RmVHeEJKbU0zdldNUDFRcHpubDVhbW5NR0kzYVdhNVF1Zlcw?=
 =?utf-8?B?eGF4YW5nMW8wN3Y2UmJxUmFaMkhzZFo5VExqT1RtZDducWFrUGJuUlg1Zk1q?=
 =?utf-8?B?WHVETUNDVjJzMksvL0xrcjFlVEZ0SENBS3hJcTExVmlLUmFzOUNteEFWV1Ez?=
 =?utf-8?B?MjBKcThNS1lCcDNmbHhZckxKRlNEbS9TQ1YvbzJ2eGIxNDdzUWZqWWJxdXpo?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cd4f31-485a-48cf-7435-08dd1faf7ec8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 22:01:16.4859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMGLT6upVfxW7dCltH0yx4sBI9t32AoEDbW5T1plGBK/Oud3nuPGxFGQVJHyAl1zhdN1lSjfqWJUGEKHFABeXhlna5bhrFR71eQ9/LKHu3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
X-OriginatorOrg: intel.com



On 12/13/24 8:54 AM, Moger, Babu wrote:
> On 12/13/2024 10:24 AM, Luck, Tony wrote:
>>> It is right thing to continue assignment if one of the domain is out of
>>> counters. In that case how about we save the error(say error_domain) and
>>> continue. And finally return success if both ret and error_domain are zeros.
>>>
>>>     return ret ?  ret : error_domain:
>>
>> If there are many domains, then you might have 3 succeed and 5 fail.
>>
>> I think the best you can do is return success if everything succeeded
>> and an error if any failed.
> 
> Yes. The above check should take care of this case.
> 

If I understand correctly "error_domain" can capture the ID of 
a single failing domain. If there are multiple failing domains like
in Tony's example then "error_domain" will not be accurate and thus
can never be trusted. Instead of a single check of a failure user
space is then forced to parse the more complex "mbm_assign_control"
file to learn what succeeded and failed.

Would it not be simpler to process sequentially and then fail on
first error encountered with detailed error message? With that
user space can determine exactly which portion of request
succeeded and which portion failed. 

>>
>> You have the same issue if someone tries to update multiple things
>> with a single write to mbm_assign_control:
>>
>> # cat > mbm_assign_control << EOF
>> c1/m78/0=t;1=l;
>> c1/m79/0=t;1=l
>> c1/m80/0=t;1=l;
>> c1/m81/0=t;1=l;
>> EOF
>>
>> Those get processed in order, some may succeed, but once a domain
>> is out of counters the rest for that domain will fail.
> 
> Yes. I see the similar type of processing for schemata.
> It is processed sequentially. If one fails, it returns immediately.
> 
> ret = rdtgroup_parse_resource(resname, tok, rdtgrp);
> if (ret)
>       goto out;
> 
> I feel it is ok to keep same level of processing.
> 

resctrl also does sequential processing when, for example, the user requests
move of several tasks. resctrl returns with failure right away with error message
containing failing PID. This gives clear information to user what
portion of request succeeded without requiring user space to
do additional queries.


Reinette
