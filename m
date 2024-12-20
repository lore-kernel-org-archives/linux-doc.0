Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2F21B1AA;
	Fri, 20 Dec 2024 21:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734730933; cv=fail; b=Jy6yW+LMTAsM9hvtGPQVRzs+1pSnW/F2wbBjklBEq8/xcYyRvO+jlDJHzbkTpw5tubQ0L28yoausl2qGCNyHzk0UJLuHvJ4zswwCy7JYAcyMowI3/AM+vkWjr4tDo7koKfLa9m8Vx879pbh5y0Pe6Ts1TjMdnSs4lTFjFOusqBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734730933; c=relaxed/simple;
	bh=Hg4SE2yx2XfQus0m3T8RCCKG5SdvudDaGc7dgvzKKDI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OQgyYmKzvKA9nK5yZriUWyjfls7tRAUR4X6moqV9GcwY2Jw4iPguf3VNpdUuimaLITFrscf/kkbQE7IOJOPfq+cmB4VwxBM4sUBeML2a2uc2PpQ0nggZKwOfg8rZrzjJuG6i+K87vYukv7fN3nNk9FzzAqD5k7A6YmRnVFgu+o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z53T0OkY; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z53T0OkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734730932; x=1766266932;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Hg4SE2yx2XfQus0m3T8RCCKG5SdvudDaGc7dgvzKKDI=;
  b=Z53T0OkYN84rNcGF9CGEw1Uk5UZ7WA+LPqfYS2Y/5FS71yB4No1F8b0k
   b3QbHzk8oAXFNcEWyha8eGRjNSmgdSGt5PUGySTVmp/xYtb1uEyXK1TdQ
   +zgSL5rDkK3fiW4Tje7zWaJS6lRioaLEFJvHomdpvd6mA0mZRo17Q5jP4
   MdLAjAqwmu+octjHltTn/upoRRHux/zDKL1x6TjFnuXX+IV2Aax9+HlF1
   CW6VFNEEc4EpQw12izqfGhXTNY1xgWCHbrUMjx6ofBC9RPP1iPnE/GsiX
   iil24+GqC1BClsokhhmP2y/B+Mb/nkJIzotwySStTRLwMwnLB2Kjhyt5W
   Q==;
X-CSE-ConnectionGUID: O0F9/l5SQQ6JMQAip21RvQ==
X-CSE-MsgGUID: NLE0l4hVTseZX24RIJQHVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39225243"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="39225243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 13:42:06 -0800
X-CSE-ConnectionGUID: 1rETMxtnTz+DqjPo7g8tTA==
X-CSE-MsgGUID: W/4eXsRrSmSi2gQ+KVVXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135963129"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 13:42:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:42:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:42:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:42:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuDh6srkxx/CLWiOrDeyCv6E7Am+tVrGDrBMc9CB5sknF9hcv6P5W72fym5wPjq2O9ZK7wB5WMeg/2Q/sfpeYyYkGkbh23owEf3kuHqPH4wbrTJySONkQ0KpTZXmoAlQ8ZvZHWkkiA/QiNQ4Ll/baynqoZ6XfEgYOjTNz/w4OnN/ra4YZrl+fFwjJvNwYzjX6LiVkRUAUzsxi4R7TAQHz5MaLcNTX6Ie0kH+/mmUXoc1yMgZwiZgxddpmvxUHEqjVzK2r20nU4VFX6NjzQijfJ5/G9voT3pLePzGoW2cv7JXBiL5jgA4yE7r1byDW5Kb33XfiGlfyf/kVO7BnWjaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2H3BPU+V9F0Xkof6Um6VGHHY8I/r8OXiBEfbnlhHnc=;
 b=aaxaXbFWlwmh+Me5HJ8Su4kSz/0Ud0c0L7LXb5Nft/YJLIiiia2phmZQUvRvBVfxh1Bpdv4k8kt0mMP/GUTLy17Bj1JtNLqhDdOdCdaOUVRFUHKjOTgVSkb61N1sejK66O6jUdinBP6fzHfAtx0B+QKnAoWlces9KgOdTPlax7qAxegZ43Ye8Jmiuue58k7fX8MhzBpDv0h9Lhwgunur1TQ6S5jBzzGozznnXS2ac29icWx9Z1zydSslZ9QJTOWMAXtIMk+PYq/bvfHgJeK768Ln8BP1X3GyxiWLMmnVq0+T4Kn3ZnGus8mI1/nnIg8AlSh/STRYMKp9CFQKD68tMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Fri, 20 Dec
 2024 21:41:59 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 21:41:59 +0000
Message-ID: <92bd670e-7d06-45c7-ad3c-e52f67e53210@intel.com>
Date: Fri, 20 Dec 2024 13:41:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/24] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <9f74a647d9ff929f040c57e32e253ac824d12086.1734034524.git.babu.moger@amd.com>
 <d6bc8c3a-932c-4bb2-8bb4-b44b05baa9db@intel.com>
 <a8b7c71d-b501-4efd-8e79-db14f1704aa6@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a8b7c71d-b501-4efd-8e79-db14f1704aa6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: ce38a157-d33a-457e-5270-08dd213f21fa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eThiR0lvejV5U1gxSGVlR3hKN0JsbXdQMVg3UG04dnUveGh1SFBUT3EraVVl?=
 =?utf-8?B?NkZvU0tNVW5tUExuZ0lDZjdIMmdnb0Z4Mk0zdnNWZElpL0tBaUIwSkRQNkdr?=
 =?utf-8?B?Wmx4cEdzeE1HMmQ3RC9MYTV1Wkd1ek9Sb085bE5UcVR5ZXlaK0R2VHg5V09B?=
 =?utf-8?B?SXgrbmpzQnNFZUhNMGErNUdscjhWektPb3ZpRXlsZ3ZpSUJXUXlTdXF6cERB?=
 =?utf-8?B?NnZ6TUhMcTRNRnVmRC9oTlcxRmZrQUdGc3dHdENQNjVzN0I4bGtkd2tMREtV?=
 =?utf-8?B?QmJ6eWpiQmhmeGdVYVNqWFRGaU9Nd0JHUFhxNkVnakdkN21HRGgrV0k2cUUz?=
 =?utf-8?B?NjNjMGIvSDlCa3pWUlRabzRESFQyaUJnbnc5UGVHeElpbk1iOG4rKy8zNTJ2?=
 =?utf-8?B?NUc0Zi9QTjNCRWVLd0x5MjFqZEpYRHpjcnE2QzJYUTlMWkQ4S0I2eCt6VExV?=
 =?utf-8?B?UUk0SXk0bnhPOEU3dFVjM3JvYVh4YnpuMDFWaUFrbkhyeHZKWXpZRms5bm1B?=
 =?utf-8?B?YXBFZUdjb2dYRFM2TUhOQmh4WGNWT2Z0UTQwTVptZ1htamw4eGtDV3dHdnJt?=
 =?utf-8?B?OTNpOVYva2U1RGpUM1FSRDUvRlpxWk5BYXBLYy9zZXBNMHJsZDUwckhqNEt6?=
 =?utf-8?B?Zm91WnBLVS9CNHJwY1Z3QjlQK1RFK1FKbG9DL0h3VmVHbllsRWtTKzA5dHUw?=
 =?utf-8?B?UHNDSWdCUGRLa3R0TGQ0WHFvNnhoSUVZL0Y1YUt6VGZicGdIVDFVTlE0d01j?=
 =?utf-8?B?QjBzM1dsTEZYZ0s1R0VzYWNTNzhzeE1WellOOHlDVHFyQVI2MnByQTliTWRy?=
 =?utf-8?B?OUtpUWFZZ0RQN1FpaWdFT3dJWUg2dEo0Wks3NzU4VlhxZFNSWGMrUjlGRTU2?=
 =?utf-8?B?Vk4yY1FBdDFMN3VGTE9ZODNUWlRGMy9YQVB2RGphV1o0VndPbXRrMEVmdC9o?=
 =?utf-8?B?SFZCMzFSbi9qSkRjODQ2QzZ0MEJ5d3NaNFM2VEVVeUVzZGorK3lqcVVPYi8r?=
 =?utf-8?B?NmpwUFRMbkNVdXFHMFhzWjluWm4zKytkMWpuK3RTNkVmOUhuMHA3Rk04QTM2?=
 =?utf-8?B?U1V4ZDErR1dvTkQySmxDS1NIeFRJbUFsQ0RWZHdvRlFWaVVoOFd1U1c3aG9y?=
 =?utf-8?B?WEorR2Y1RVRzcUxjMkpEMXhXWkJ1MnQrVlRJWjlxZUx6Y2t6S1I4RWxpZnFS?=
 =?utf-8?B?cUVPb2hnNnFqYkg2SjZRZHVmTEp6S1grc3JDa3c4bG1kK2IvYks5OGNQemNY?=
 =?utf-8?B?MmNEUnB5Y043Y1NMaTJJVUp6OG5nWmIwcDJWYWNwWUdkWXlZNTF5STR5a0x2?=
 =?utf-8?B?dUtVK3NmVEZjMUszbEd2Nnp3V3ZCUG1GVXM3YlQ1aU9USWRYakpCVE04Skpt?=
 =?utf-8?B?SFIzU0s3eXI1STBEV01mSG1oWHo3SjcvWEgvZTZ0Ti9KdUlLS29GbUVHaGgr?=
 =?utf-8?B?bWZmTVVnRTBObFlCTFRVdTVEaERiWWxOZVlCWWNHQVhqLzFnWXVTVUJiVE1t?=
 =?utf-8?B?TDFROU1KVWJ6YXpPZjVKN2ZhRVBKbDZWMExMUGNqUUllOUNaOFhUblQvZ00w?=
 =?utf-8?B?SkJkWmx6WVZuRlQ3Rlg0UFBOTXhPc204R3J4cUhlSlNrc1hoQnYwVVJ2N3Zk?=
 =?utf-8?B?cGwxNTd5cDdIekV4ZDBaOTRCWFhmVFFiSjVWd2hUcTd6dU9JS1NrL3cvKzhI?=
 =?utf-8?B?T2RYVU5TdGE3NDFmWTlQNzliOFo1cjV1RzNPdVFjVFY3SUlCOFFhZTdqbnVJ?=
 =?utf-8?B?RmdudjNLOGxDbit1UFgwTVAwVmRpRWNQMGJRNHpGNGM1cWxKZGo3NTVaWUIx?=
 =?utf-8?B?T2ZTcjZIb0FTUmpzSFlXcEhYMUl4TW8wTXMwK1BkVVQyTFRiWGR3NGdPTi9s?=
 =?utf-8?B?WXVINlQ1ZHBnN2VMekJXb3FERFN4UUJaZmkwVVdPZWRMZkF1UFl2YnQ4RzM5?=
 =?utf-8?Q?s8WzfXXnlf4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEd0aldpd3hPeks5QU1tN2FEZFFnRktYQ3QrVzcyalRUdmVzUHU3d2ttNm5l?=
 =?utf-8?B?TEQ5TzFaWFo4RDI4YlRnMWdtN1lOc0pKQlRsY0xudHJoNnlFbVJSWGRZU0Za?=
 =?utf-8?B?R2MzcFZGNVVVeTBPWlFHRGpBZ0FwWGpnN0N1Yy9KeURGR1pVME5jbzJZbGZH?=
 =?utf-8?B?WUx1cm02bXpBNGVNVURkOThxNlNaNE9DQVdrNkwwNnFxMnRHQW5ueWVma2lq?=
 =?utf-8?B?YlNkeFJKT24yYjlMTVFZSWYrOGRlVUFPMjdtVEZGRXo4eU9uSStyRWxVN3VG?=
 =?utf-8?B?Skxpd2FQdjF0RXBnWmMyQzhkTGhKUFNXeklFYUlkQk9oczk3bS9MeE5HekQz?=
 =?utf-8?B?d3JOU0k1ZFd6L0xkWVZoZDBPTG03N1RQRGI3Zk1iVDYzVUd6eWxEM0hWWXM4?=
 =?utf-8?B?SXl3QWl4SHVBb0VQbTRYdWcyVzlyN2FtYi9aMmtJTXpJQXViRWlYQzMveDFa?=
 =?utf-8?B?ZUM5VkxtN3czVmx2djNkcHQwWUZhMTNhSUc4eE1sYXBvR0FJS05yTk5DQ1or?=
 =?utf-8?B?cTI3cTRxQ2wvWlUxZVFrWUdyTVRIbnF5Rk5halVISEhzaDdDUEYxaU85TTRD?=
 =?utf-8?B?TU03YXp5SHduQXl6YnI4bXlUR05rSnE4YVN1aGE1NTlRdTBXaXNrQ1V6OUIr?=
 =?utf-8?B?OGhTVzBIdHptL2t0VjlKQVMzZE85L2VzTFYxcHltNUx4V3IxZmJkazd2STd2?=
 =?utf-8?B?UWdXVktZNkpOdkkyb2RqcERyOUVHNWZIZ3dMa1Q2N0ZlMmpnUjZhR2RxSVFa?=
 =?utf-8?B?dy82bXpyeENycVBpdzltL2c2MjREMVpidGZQbUdCLzVDK0svR3piL2wxT2R3?=
 =?utf-8?B?ZTRUeERyVmdoc2U0RWhVN2czaWFEVCtkbnl0dTVoL0I1YldWQTFtTmtHdU1R?=
 =?utf-8?B?UU5Qeit0NW1ScTVFK1FJdW5NRVlETzdxRGJsWHJqMnovQlNFS0dsVFp3cE94?=
 =?utf-8?B?b0pLeTg4T0I3UW9EWUVQK2JLWjMwbHIySlhaSnFhaUk3UGUvR0tQeGdBaS9W?=
 =?utf-8?B?ZmZKQjJpYURQSlg0cEhBZWFMMkx5WFlwVDdwcWgrbXE2Wk5MVGthd1g5WXdk?=
 =?utf-8?B?Qkh1TmJKaU4xSFhYWnJkaGdKU2FaYzdReTR4a0l2TVRjMkxDSmdNZkNjSEd2?=
 =?utf-8?B?MStISjJJR0VsREFSeHZ4MXN5eGljdk45WVZFS3JKL0JPcG9lemNReGFsNDRQ?=
 =?utf-8?B?NE90V0ZDbXBuOGFyMkViQTg5d25UajYzdHU1aDdyZjdXT2JQRUdRMVpMSG9r?=
 =?utf-8?B?QjA5VTFDL2lqamJGeHdQbW44bTlvMi8xdFliQlRjcjFDYUJZSThSVmc4TWNL?=
 =?utf-8?B?Rmd5Y1pDTlBEWkNLUWR4ekxnK0hmeEJ0VHltZ2c5QmR4MVdyS2gxREJ3SUF0?=
 =?utf-8?B?SXZOVGg1ZzBPT0RTaGFZRW4rZkpPZVNvQ2FQUjdobXkvcEhDK0RJL2JSbklh?=
 =?utf-8?B?eTJwNHpaSnhYMmJ0NGVxMTFSdFc2a1RFSnJHR3RJTmpSUGltREwwdzNJOEZP?=
 =?utf-8?B?eHB6aWRRUm9sdlRXL3FOS2pUVUovMm5ZNmFXMStsaldkYTlFbGhyQjNZb1Vm?=
 =?utf-8?B?TGYwbnFUQjJLOFlNdzRJUDRmWk9Idm5xeGFac3BUZDg4T21CTFlUSktXNTky?=
 =?utf-8?B?U2dQMXVKY1dVankwWDdZZ29sdEVpZ2lKSDU1ZFN0YW5QRm5iNDVSUzRGbm9N?=
 =?utf-8?B?TjVtWUxzOE5VSkhRQ09xU2JRdWJGVDM3cFhEZDA5UzB4QjdkT3dtaFNYYVBF?=
 =?utf-8?B?SEs2dHY4ak13dDhsaGZwbStCdEVwMU9RYXBFTk02aGxrbWp4R1AzS1hiTjQ0?=
 =?utf-8?B?OWdDaG1ETUdWeHc1cXRuajgwT0pBQTNzU1p5QTlMSDNuSmo5alBVREEvSDJE?=
 =?utf-8?B?RGk1MGgyaTB4OFVnMVpFQVRyRWlFWDRoYlN0dWYzUnMvbWtQbmhyME5hTmJQ?=
 =?utf-8?B?bGI4Mm9nYlE4M01FMFZYN0lXT1lIR1ltRUFPNTFJN3NnZS91RUlwbmVCVFJF?=
 =?utf-8?B?MTlZVjNOb2Z2bXRWaHVZeUl4WCt6dGxPZStkS2IzTGlVR0NCYUFUT0VxQ3BM?=
 =?utf-8?B?UWNtcFdNT05ONHhyODVsRy9kc3hXUFVXdjh5SzFNc096a0FqRGdHODhhZjZz?=
 =?utf-8?B?S0VsL2RhalJIUHkzdGdHMTU5VWl1ZThqR2hvM1VRMzU0em1ZQUtrQm5IUFRL?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce38a157-d33a-457e-5270-08dd213f21fa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:41:59.4412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znCW7OIFjxlvSyc+qi9t0LYKDJXw+L2ZpKbzDBVM38mlTv/W30npgZoevIkwB9+0bjBBYjffacrzTnFFc9KSGLoDKuDtBIz/+63lsQ5CTo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
X-OriginatorOrg: intel.com

Hi Babu,

On 12/20/24 11:22 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 12/19/2024 5:04 PM, Reinette Chatre wrote:
>> (andipan.das@amd.com -> sandipan.das@amd.com to stop sending undeliverable emails)
> 
> Yes.
> 
>>
>> Hi Babu,
>>
>> On 12/12/24 12:15 PM, Babu Moger wrote:
>>> The ABMC feature provides an option to the user to assign a hardware
>>> counter to an RMID, event pair and monitor the bandwidth as long as it is
>>> assigned. The assigned RMID will be tracked by the hardware until the user
>>> unassigns it manually.
>>>
>>> Configure the counters by writing to the L3_QOS_ABMC_CFG MSR and specifying
>>> the counter ID, bandwidth source (RMID), and bandwidth event configuration.
>>>
>>> Provide the interface to assign the counter ids to RMID.
>>
>> Until now in this series many patches "introduced interface X" and every
>> time it was some new resctrl file that user space interacts with. This
>> changelog starts with a context about "user to assign a hardware counter"
>> and ends with "Provide the interface", but there is no new user interface
>> in this patch. Can this be more specific about what this patch does?
> 
> Yes. This should be about resctrl_arch_config_cntr(). How about this?
> 
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is assigned. The assigned RMID will be tracked by the hardware until the user unassigns it manually.
> 
> Provide the architecture specific handler to to assign/unassign the counter. Counters are configured by writing to the L3_QOS_ABMC_CFG MSR and specifying the counter ID, bandwidth source (RMID), and bandwidth event configuration.

Again just one sentence appended. The "to to" demonstrates it is another
example of something typed quickly to see if it sticks.


>>> @@ -1686,6 +1686,34 @@ unsigned int mon_event_config_index_get(u32 evtid)
>>>       }
>>>   }
>>>   +struct cntr_config {
>>> +    struct rdt_resource *r;
>>> +    struct rdt_mon_domain *d;
>>> +    enum resctrl_event_id evtid;
>>> +    u32 rmid;
>>> +    u32 closid;
>>> +    u32 cntr_id;
>>> +    u32 val;
>>> +    bool assign;
>>> +};
>>
>> I think I am missing something because it is not clear to me why this
>> new struct is needed. Why not just use union l3_qos_abmc_cfg?
> 
> New struct is needed because we need to call resctrl_arch_reset_rmid() inside IPI. It requires all these parameters.

Could you please answer my question?

>>> @@ -1869,6 +1897,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>>       return ret ?: nbytes;
>>>   }
>>>   +/*
>>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>>> + */
>>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>> +                 enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>> +                 u32 cntr_id, bool assign)
>>> +{
>>> +    struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>> +    struct cntr_config config = { 0 };
>>
>> Please see 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")
> 
> This may not apply here.
> 
> x86/resctrl: Slightly clean-up mbm_config_show()
> 
> "mon_info' is already zeroed in the list_for_each_entry() loop below. There  is no need to explicitly initialize it here. It just wastes some space and cycles.
> 
> In our case we are not doing memset again.

No, but every member is explicitly initialized instead. It may be needed if 
union l3_qos_abmc_cfg is used as I asked about earlier where it will be important
to ensure reserve bits are initialized.

Reinette
