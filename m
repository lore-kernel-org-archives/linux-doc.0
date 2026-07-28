Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D02476CFC;
	Tue, 28 Jul 2026 21:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275935; cv=fail; b=mZMjGKXDRmKqVYsN0RZ6R4nxqBJ2mwe/Y09b/kOro0WrqsRwcphzqzZIe+zKOWxOEYpKVW48leXVJ8fXaGuuRitYpVihXqpKXCII6S2XOnjLYGb9zJ9QrEt+A+5tr3/v9118Z7SglUjVAO0NtXtyMTHp7UvRRGGi7j37Q/IJAXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275935; c=relaxed/simple;
	bh=OBQY8A5zqW99eEh5St7oRhVl5thiYipmrZLv7A4f8g8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pb8i5DB0pQ0MvU+axsQo2tq/BlQXW4S8U0eQ1JM+/4YZf/Dxg6zQMJJdi9onZpQV5B7p9cHR9qx0NGDhb5jJJI8yoqYYMJ0g92dAu2p/obKYhsA6+InaEuvG93G9Z0/fs2CxLKTMuiXEA6TETRxDXT5d2AFonuO4DvGeMvXuzsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K276iwtR; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K276iwtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785275932; x=1816811932;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OBQY8A5zqW99eEh5St7oRhVl5thiYipmrZLv7A4f8g8=;
  b=K276iwtRmYM23XPIDhAwLcv/QKv1jtozVeA5a8xoE/UW64qqDOE2J11P
   xVxAi78kBjWegoTglT3WZPLWdfjFZfkmJU5k+jsgyYUe81OwMd2ugmPvt
   H7fTiMSIl+mK7IOSuPn7K7/YgUty0rafXoJ616lpDRNy/Zpba/f7CPXfj
   cNUS/p8TM1NJuW7GTztgjL733mMRSbpzIV05RgDoURsg0NOra8DvsHZ6D
   iBgR/6hEzQ2WZWNHiOrGPWgilR9vFBaorGE5BveLBwXO9Uw7L5gvgdi48
   HwTTcG6MOMcctNLbLMtT2PGcVeB0o2uaTWCs42uR5/y91RNeaO0i5KvUp
   w==;
X-CSE-ConnectionGUID: O3otUw8eT/GoFZ1Z5NsQaQ==
X-CSE-MsgGUID: 56bKvUwzSjOHfMS7T4+Igg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89696641"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="89696641"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 14:58:48 -0700
X-CSE-ConnectionGUID: QAWaTL2UQnC6Z900nyAWSg==
X-CSE-MsgGUID: vDH3jfaxRxmNcO6bLPMMCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="261782532"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 14:58:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 14:58:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 14:58:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 14:58:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXl8FIrew9IfoZRTOpszO/Or8v0E7ArfahaS7otTHqNxhPjusAAhBGE+OchrBglPCJh7XszcOoD85GonHQ0e9LWzNPEAi9Pv5RYlICpP0Dt0gEV5yEzcVO8q/6QhlV1wB3schZFIgIhdhC4aYF2+IsoiZwxGDAebySaRp0E/wrEJl1hyX0EAfECm+ys3d0X2dLCa94YbMptzRXKvPJKMW0sLmZZuSlK1LpFfJDTtnJECXFwODRRhWVZbPclsi2c5eqbUAduRAGJUEWJYpTTHix6CLjuGm2KHj2HzYgeW2TxEgJ2U05rYlvNPyKJCydxodnZydfldMv19fl417PRRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npQl8I7OONb6hNO2g+xlrHg4IifudDacHLZj+4EjtCo=;
 b=cPevQes1tuTRJ2JcsnCeuMiWksCjH7Xehzjsk54n50sAXxFHz+iFhaGeNcTak6w8SQz6HbZMbpVFDGsYI5ECcZ7h6gpQqfmaKN9JmQ4gcC15ulRyvAQ9K7wYQ6ocNTyuy24zMy5yUzstb9yygfqrnbZvY1WqQpM/yBEPT9fH1j0lzq4FvTNDoloQvPW4hRbQgD7IDEUCgJIFfL2pQ+Ag1lXJgIk687ecMOeKfa9/3dW3TQ/tWYZFDShWdiet90QNUFlgktS/75X+pBhi49p6Id1xmK5FQL7OJbONC3ubUXJDv5aAZm6CBSuUHDRFgWPVE5yLAcViQTQx0Lmo4B8YSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 21:58:39 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 21:58:38 +0000
Message-ID: <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
Date: Tue, 28 Jul 2026 14:58:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Babu Moger <babu.moger@amd.com>, "Luck, Tony" <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
CC: "x86@kernel.org" <x86@kernel.org>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Eranian, Stephane"
	<eranian@google.com>, "peternewman@google.com" <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:303:b9::17) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BL1PR11MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 352e2742-1747-4cc0-3b97-08deecf360f4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ygWLwAxByfqXAy0AAQ7WXXrQpkrvyDeAOmSTMfA4/YV5i8M7EcpdPSXKc8NE3OiScl6C4mh9pVkj4HxDujJ+KZukYLHO0Hz5PF9+Qk2JUaAn46CKW06A9+tDayc0hjN+ZHmdsrBArGjPZB1fo9zNpwJMJS9XxT4YqjYZfcAap2OSv9qNzRYjnyW1W5X0MEBIRrOjB647VXV/WrDKZ1TGA7MpWe3JSSZTrcgWZQLRsM23fnX5ODL1+o5S2oq/nAWfM9twpywFQmjk+6cXB1EwkfWfBQ9ub4pno2VSlyl9a7BOagPDQmP4XiNEmGev8N0CjOtXeNDFM8+u4V0VroSEnkB8aOmqZQMU5PFqPoVhIf2nTNXWJqACbTIw0yXRx55yJlgraaozqXwj/jQvFdNoyioa3H8xBxoDVXeA23Cei/yR82Wq/fjdr7BiynVSxydcbSXXl+lav2HHUS6luwhu0MBFYvP/Pk3UnOcMvhSKLPaqP0rF8b+mSGqetTP07jWzFy3sxmR/dT2fOch+rThruxvFK4U0TYMJpm2TLciSK7wzyF0lFjmt0Fxg8Jp7WIVUAwL0ypRMI/XLwyhib+4Hltx2HMHhsdAlut4NLlkcG9mbDVyVHTJHVe9hF1dbJioj0OZlHWeyyjAylb3oq+cJzV0C2ehNN6bS8W+4jqAAI2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjQ0SFIzdEZ4b0E2am1Cc2RyZkVJTWc5NnArT3BUMXo2dU55Qjkrdys0cUx3?=
 =?utf-8?B?TWhhV3pxYVB5bDRuOXM0VXc4eXVGb1oxNjdYSmprR3hISEJjNUFjdUd6Uld2?=
 =?utf-8?B?VHBIK01weDRJQmluWURSWWdlOWZaRHVsQ0hxeDAvMTJXb2QzcW5GNk12Rk9D?=
 =?utf-8?B?OURtZ3hqRy9IeFhpRFY3a3A2WERpc0hSS2ZycERMV0pXcEU3WUNyR1lGZDgz?=
 =?utf-8?B?cFNOYUx0S1Uva21KUy9TTk5zZm9HNXkxL2VtanhxSE1BbnVYZGFPeE9IS21C?=
 =?utf-8?B?UW5FWlMzNU5iSGZJYXVpbEo2TTdSWmdaUm9pSmpmNFVLSmpVQlU3Mmk5R1Bx?=
 =?utf-8?B?c3M0WHJvSDYrM2VvRzFKWlE3L1lrRCtINUdwbElzQ2VSN3Z1emVnRmFyVkVo?=
 =?utf-8?B?NjNxdnlSQjhWalduNDVzT0RKczQ4M3l3M3VMM2FBd3l1OTRPQXZjOFBrSXZo?=
 =?utf-8?B?clVob0hYN2I5emRBWmliTEE1THR2OVd4TkM4QVZiZjlSYXBJbGxrOWRrRjRE?=
 =?utf-8?B?OTBMRVJ1UzAydzByV2FYMkVWTFFaTzNhM09aYnJiTE5LOHpzQkpQMkU5eERS?=
 =?utf-8?B?YkpYQkhvVWkvZlVLYU5ZNUZvL0YwcUdFclFvTFhOcWtVWXRhYU4xTjdoU3Rv?=
 =?utf-8?B?SFArRjZSRlI0bGp0bXJna2Rxc21MajdPOVFoTkUraG45cERRdHB5UTBGQ290?=
 =?utf-8?B?bGx4a2kzZGhBcTB2d0J4REcxMVNsY3Q4bExJVzFXZkdhRmR1enNZSXpNUGhS?=
 =?utf-8?B?ZXd5M251K0w2WlBzUTA2eFhrT1FMK1lYR1VqUHl2MnY1TTNUR2lFYXpzdkZP?=
 =?utf-8?B?cG5EUm8xL21lYnlSRDhSSnRpczQvUU5zR0lueDRDUG04ZjVxd1NnZy9NNnN4?=
 =?utf-8?B?QlFqTGkrTUJWcFBCZHUrWHl1S2FMQTZkVWpqTnFBNnZRZkZOR0FCZzQ5NzNa?=
 =?utf-8?B?K2FEMEwwOWVOSmN5c3pjMCtZVE5pU2g0VTc3R2EvWllMUHpZZkFFUWFKZFhw?=
 =?utf-8?B?VjlDbTF4WXE2a0NWb2JvWG5temZmZWVKc2NUamhFT1NvNjdKclpwQWJUYVd1?=
 =?utf-8?B?UE8vUXpEZG9CbW5kNndwckU0cDRFbDZ4K2pTdjJ5amFMMzV2R25QampRODVX?=
 =?utf-8?B?OVRGSGRFeUU3V2RyREh2TmlCOWhWblZ4NGRsczJTblZsUzZxWUR1ODFUWmo3?=
 =?utf-8?B?NkNQNis4V1hSbktMa25hZmViVDJZaCtYUk1qbW1xbUtFM29VeGNmY1NVUGZD?=
 =?utf-8?B?d3YxcGhhTG5WUXBPZjFicUVQaVFNSWVmcVNpanBrMUJGK1k0cEhTYUxobjFW?=
 =?utf-8?B?WDNRYzdPQnA2d3h1N2t2YnN5UTRSeGFoVGdiVy9aR1hQdzRxSnVRT3RjWVZT?=
 =?utf-8?B?Uk9TenJBdklqSUNXODE1Wmh1akpvSTNVZ2YweXRjQ2lWSERhVVdmT29wVm1V?=
 =?utf-8?B?YXUyYzVvbXc4bEI0NFJnYU9xRU9ObFBLRHR5dFlFcVE5RVZOenAwQVorblUr?=
 =?utf-8?B?aEx3V01rTG5xMHEwYUVwb1JQcDJQWHFYbWk5bU1EcHpmUlAzZTBiZnR1R0lO?=
 =?utf-8?B?WHVDL2FzS3JxTXhrRnlxb1ZyVGNibWc0UHhaTTBIampSSSszajJidkF1VWdx?=
 =?utf-8?B?OHVBTXpSWmIvQmNKdDg5R1NDZnFNNHA3VmRjWjNpM2JGQWczWEFQS2x6YVk4?=
 =?utf-8?B?eit2YXF1WThNYWY3NlIwTUNocDg0aW9lQ2VZQmh3ZG9DN1BLMXNVRTV0SGg4?=
 =?utf-8?B?TjRCR0szbWpPeXhuYStaUXVuaFhaTGN2UkJkckFiQUpsSjVNL1haUlphRkdF?=
 =?utf-8?B?OTZQYUkxb2pxd3hDUVowNXc2T2FqVWcwZ0VVdG5KalJjT1JzaEZVVXFyQnUy?=
 =?utf-8?B?OXFQc05mYktuVHVlRm14aXpxZEhNM3A2QjhtRFVUa3Q0TG5jRFJEdTJXaHcr?=
 =?utf-8?B?TTRyM1F6M0xGUVBIdzhiWm1KSDhXbnZDODFQUkJhRTBYRDhrOGJDUHBCeFVE?=
 =?utf-8?B?NzlUQWN5RFQvcmxNR0UwM0hxWUtzTndBclVYbjJNU3BSZmhmRWRkMk9tUWRj?=
 =?utf-8?B?VmpQQ1JHOVBLbTZZRWFXVDhkYldCMVpJdnNtUDcyUWZ1NXZ6bnQ2Z0tlK3lL?=
 =?utf-8?B?U3RnLzZxRVJ3ZDBDTXhYbCtqNCtXaUxzTmduenB3Y3d0bGswTlEveWdwZGZv?=
 =?utf-8?B?cXRZblVOWGtmRzFqT1dGZGdyQ3BqUU4yaWd5SjBYb0EzRGlZRk1JMFJpR2x3?=
 =?utf-8?B?K3UyYklKRVQvZ3RnMTVaU0hsRUJrUVJ0MWVvZkZPNVdxZnZlZXlnKzRONGhF?=
 =?utf-8?B?Z3VUTVJ5Y0N0Q2ZWdkx1Um5aQy9yMWc4dG5kWkZJSEt5bytBNEYrWUlXZCtR?=
 =?utf-8?Q?KlhkRgmqE8aRnyto=3D?=
X-Exchange-RoutingPolicyChecked: ldz+7ldvsg4zfNA4J8EcVDPMEeUxuhDAgZShnI2Hrbvr4DwTLH+aX3isd5DxRfliTAUN3014Bk8XD8DOn1GOFCFZhLzoaCflGCUm0GuH/nSIjiUwrKCdU7Y16++G1OpHqa5wVQ5DuR3TpZ45qh6ILy5cm6+5Zng/tZDZpSYVpyTq+FbqIpvc8ygJOHJvGBNzrDZv8vz6aWP7rKFQQ/wCWj/pYHX3YWbx/TrKbgq/KiGXkjGwFcp5NYZaDuTSzRx9a/HWQ5BqaDVhT//2dyLCL2U4ybdHYXT5JOw78la8ECFi6oymw2HhUFM95fV2h4LAGQFfl2dr8oUgxb/Lti/u4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 352e2742-1747-4cc0-3b97-08deecf360f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 21:58:38.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXVZgE35rjyLYyfYShfrBoeAkUCghiObN7mms+CdLMVjRWGQpYVN2I/llXUBi9LvndSfgb+8ts1dZmOiuBWaTYsJy9HpOMOFZ8iW5NRyo1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
X-OriginatorOrg: intel.com

Hi Babu,

On 7/28/26 1:43 PM, Babu Moger wrote:
> Hi Tony,
> 
> On 7/28/26 15:24, Luck, Tony wrote:
>>>> 1) Does it start over from zero?
>>>>      Seems a sane option.
>>>> 2) Or does the monitor group see whatever the counter was at
>>>> when being used by some other group?
>>>>      Seems less sane.
>>>
>>> As per this code, it should start over from 0.
>>>
>>>    } else if (ret == -EINVAL) {
>>>                   am = get_arch_mbm_state(hw_dom, rmid, eventid);
>>>                   if (am)
>>>                           am->prev_msr = 0;
>>>           }
>>
>> Nope. If you want the value reported to the user to start over from zero,
>> then prev_msr should be set to the current value of the counter. That
>> would make the next read start from zero.
>>
> When an RMID is reallocated, the hardware detects the state
> transition and the first read returns "Unavailable". At that point,
> the counter is reset and begins counting again from 0. This is the
> expected behavior on AMD systems. Therefore, setting prev_msr to 0
> is the correct behavior.

I believe Tony was curious how this looks from the user's perspective.

From what I understand it is neither of the presented options but instead:

3) Internal cache of hardware counter (prev_msr) is reset when resctrl discovers
   that the underlying counter has been re-assigned.
   There is a separate software maintained cumulative count to which the
   hardware counter value is added as the event is tracked. This cumulative
   count is the value returned to the user.
   The user thus always sees that the event count increase and it is
   guaranteed to only increase based on a portion of memory bandwidth
   consumed by the RMID/event being tracked.
   The returned (cumulative) count will not be accurate if the underlying
   counter was re-assigned. The user does not have insight into how long the
   underlying counter(s) was assigned to the event being counted.

Reinette
