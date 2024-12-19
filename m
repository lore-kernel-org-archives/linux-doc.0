Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142021853;
	Thu, 19 Dec 2024 23:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734651150; cv=fail; b=sqlMuc9sPgV2U62BpnIJhulcazupvsm9VXYhks4md60o2JfOTXqRBAtVnvF5j8DZsG5w9wNcCUuoukBmATXoaqSvW+GAk5wZAL9EFrTVO1BwzDBERt73/YDdgAkIz27Ksil5abRNKBT+n0jf5/W8jGjEjV3k7j+bhfIzCqb7plI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734651150; c=relaxed/simple;
	bh=UxndWMheQs/UOedXBdjdh7y0KUDY7QlXkTLhRTEZK1I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XybIpj51ea2tHXv3DfluMfeyKkl5LqWlNbk/JZ03NgwyGjya+qB9LLFKQJ7e0B2Osk26mHoo+4/WCFumZpq/wfznUBXtedO9pTUjUx5K2xCiAjWkhCokRzUyFPMRxIVHOtddGBDcCYPYoZVRodR2YSvqfqi6+TY9RuQp0MdJKNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7eQBEgh; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7eQBEgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734651149; x=1766187149;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UxndWMheQs/UOedXBdjdh7y0KUDY7QlXkTLhRTEZK1I=;
  b=G7eQBEghSlo7Fe0PfgOvJhz++BEV4LAbQQXgf56ClIYuQmlddEk80AvU
   gPH6U0S2+ie4YuiQzFdpJTIibMY8iuE1qFJ4d3LKYKG+eXy9+KvsMITpB
   gu4l0F5O7bqrZW+ADDWvCl3jhBZoja7pnQr6wDra9QqxnPx+5kGytNpaE
   VFh1h1Wd39/soKnb/ilVRHquNt8i3r8nzm8lurXLtktPN5gHe/2Z9DZ54
   bIoWEdZDWd0vwG4VbE8BW2pA8ZFmidNCTgDOeP8u5fekNUJIAOmUrEpCS
   +BIID0ab/S6slJ3jw0mo9Xp1iEJ38KTZeXGswYGcmRmSEyKTGqIx9WcTw
   A==;
X-CSE-ConnectionGUID: O/sPV+65RCait1wHHofMLA==
X-CSE-MsgGUID: fSyf5pj8RkKIy5yKqh1k6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34516441"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="34516441"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 15:32:28 -0800
X-CSE-ConnectionGUID: pO4oON/aRXC0D2N5Kak8GQ==
X-CSE-MsgGUID: rBHIK4j5SemfCwuOnbLM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121623462"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 15:32:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 15:32:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 15:32:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 15:32:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0gIFyePxWvAWXn2m2Ppzv/coHmii0ZB2bzLVTdzswrH5OFF/9E0soUmMUOKMxTs/5elCxpy2Gbw5FtLYNg0GD00bUkLeHWL1N6DV8GbfKOyM6MwEgpsmqKuxpgIHRUcfJQ7xemz7NssmVlj5yJ9LPso43z5tZXpKPnTro1zw5jMxCZH3BZZqLi7gAZpb59w3rER51vgMEBufF2bUFGttv1VvGS6aKhFb9zU2ucvAwgkoZBfMOh7u4UFxotfk8gwoYgBWJ/EhXMyA+COityM+K+6cAdRR/H1e5w1vFSLWoK6BDUS4ZTCTUdLBG0NZ7oGdH/upCSbBryQRgYmaZTp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma4dLuhvhQt90KNXeJSv5+W9aaf3WqgKazE8pjeZz/k=;
 b=GrC6BzW/vhfkrBrnSOHuzTTJOCghqwMbgnhEUF+/3zmP3Kw7tj7VE48LgXDDX0YKgR3ecF5VxyPANG/Ly/yWLdT3bFSZozdnM2BtMM1PFQQtfh/P0mD2RV/HsatQnGswOdd5l5BEsxnXASyaNv7fy7/O1Fsm/JSU0SKIVQePrTBfDpo94WFcHl4BWaSUO6zvhMJbKRhUrbnScsTis2NRgqI7/9xfovAerJ6up68/SRKhv1vV9sn+KpPcMPqsER/KwrS/X7ujK/5LWtTnJEXiTH3mMhbT760/j+fV3opmRlMzIcuQk/EIEX3MJ2BkXkLAxtEt6vLKjjs/QGoXvOUV1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 23:32:19 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 23:32:19 +0000
Message-ID: <e636c720-5651-410d-8efc-468ecf6e6aa9@intel.com>
Date: Thu, 19 Dec 2024 15:32:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/24] x86/resctrl: Add the interface to unassign a
 counter
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
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
 <0619fcb4307f6d20d214980f61421825c67a969d.1734034524.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <0619fcb4307f6d20d214980f61421825c67a969d.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:303:b5::22) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc3f4f8-dcf3-40ea-b1be-08dd20856136
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZWM3Y2MDhkVDlVbFZqb2VhNjJGTjQvYkJJR0VpVEZ5Y1dydWVBUjN6eVE3?=
 =?utf-8?B?SG91a25MT05rTjJwYzU4VVJ2NkdvZVdia2tuVHpnTmdKZlJvV3JVUFhKcVdQ?=
 =?utf-8?B?U2V5Wmw0aFhGRHg4bGhLdVFSandOdlJVTVllenZMeWZBTmVkd0JEZW9vLzRZ?=
 =?utf-8?B?eUlucm05eUxzNk1qTmFaTWZ5TG5wUVdyYlUrbUhQd0haNzZjcHMwSWZUS2hx?=
 =?utf-8?B?Q2djNzkvWnFGdytRQS9WT3luQmtJaVEydXV6WldlODducFhUQ2g2YTRtU2Fv?=
 =?utf-8?B?cG0wOGNqT2R1TEtYU1E3UVJHOUQwWUR3UDBSTFZlVjcvdEFhQnd6eGNweVJW?=
 =?utf-8?B?RkJVcG4xQXJjU3lLdjdvQzM1REppemVVeHBtT3o3dTVmL1pRdGl1UC9TNVh4?=
 =?utf-8?B?Q1l0MVZBZzBaVmNKb2tVNWk1S3ljVHMrUTRSTkZwSnAyZ0hnMTM2bTJ6Y281?=
 =?utf-8?B?ZTVNZ3ZQb1NaVVM3YXFLZUphcVB2d1pmVlk0QUNxSzQxL2xVZUpYcGF1SVhD?=
 =?utf-8?B?ZGZYR1Rod2lCRHhtM1hiV0phM3RlZUdUUG1KajhQUUNONTVRTlNJQVlsallr?=
 =?utf-8?B?NWlGRm4vL3IyZUwwcURYeTRUaXNZbXhDS0ozSUpZTjdPcXpyNWN6TFFNN1N6?=
 =?utf-8?B?Y0Y1MSthcjh5RDNGYmVaT3JQcEN0YTgyaWt0MmtOQ2UyUlFnZm9iNDNVNjRL?=
 =?utf-8?B?RXIzTkhEMXVVdGZ2dExVNFRKSkVaQ1diOStBVUJWQStsNWs3bDZNWVNnNnJo?=
 =?utf-8?B?dHpyeW8xZkhNQVdCU044WjhQd3dPenZMT2o4ci84Y29jdWVEaWRNSVNIYnpI?=
 =?utf-8?B?ckdLdGJXM3BxTXd1L0VueTY3R2RRa21UVkZNTjNrTExJU2M5ckROQktxdFc4?=
 =?utf-8?B?OUlBcVdTQy9CN1l0REJvbXVWeUhXUTdOcVU5ZEQyMzc0S0FxQk5lY0s5L2tF?=
 =?utf-8?B?KzJ0c2tlVnh0VW9oM3hHekg1aFpXRHpvUGF6Nm1aUnNLaTRIZmcvUUorNUUx?=
 =?utf-8?B?ckdqOHBvQUtnSXM4SzExVWtjMHJ5ekJmcFlFTE8xakNmeFU4cTFaVXIyVXYy?=
 =?utf-8?B?TUJ5YWIvcC92MzFTU2ptRmlIOHNGVkp2VytkdHNRT0tiU2k0MFdpOWxITFJT?=
 =?utf-8?B?UWE1UWZIcXQ0VS9JajY0ZDBvVjNnQm15c3RCVksrZWt0NkdLSVNFWG01cUli?=
 =?utf-8?B?RzRHZS92QkUwVUoxbGhjTFFJdnNlRUxhaUEySFUySWh1MEIvUGZ5cFpnZjRL?=
 =?utf-8?B?MHRwaVJFUVduc1owK1ZPV2FtdW94eENLSUhwc0c2VjVRS3NFZGFVTW1EWTR4?=
 =?utf-8?B?Q2JjUnZyelFNZW9oMkZLM2crRDZsMEFRaXdCdFF5M0ZVVlFaOU4rZmVyejRZ?=
 =?utf-8?B?OEczRHowWGZsUWVZTVppa3VpZDB5REl5UE1CTkgrY1ZReTdwemkwV1MrRGp3?=
 =?utf-8?B?UUYyMC96NUx6YkMvbHR1TFVCMkd1b0trK3RSaFQwUThqMTdybnJHaW45dkt4?=
 =?utf-8?B?UkhhSHBSKzladUpyRm8veW93bGFTMkkraVVNZ3FjYjdTK0gvVUQ0RFFsMjNY?=
 =?utf-8?B?L1lnclZldCtuR3RMT0t0aENsRUhRRmxVNSsxV29aRXhIeVA1V0lkVEx3N0pv?=
 =?utf-8?B?Sm5NUDRyV2lwSXZUdHpOUDExWExUYjRZVzNCUzNKdXBCcSs5dE0wcUk5dnVR?=
 =?utf-8?B?dlJGUGUwdElMaVFoaUhwTjdPZXlrQVUwemRDWUg2YkU0dlAxdEV0RVJkdXJ4?=
 =?utf-8?B?bTk2ODlOc0tZR3NuY1lUbCtWVHdHcEsxWG1yUDhzN1dHMzcvYzdzVWZMcWV3?=
 =?utf-8?B?V2xyUS9VcnVCdjV4WHhQbFRzWnkwRWZVa2d2elorYnB4MDlKcElRaUxJbEYy?=
 =?utf-8?Q?vRK4Ejz5YnxC/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWx6MHZOSmxGRzhXeHZPWkdVdUhNTjdlMExTRUVGeUdvc1JxS2pyZm1uUFFz?=
 =?utf-8?B?RUx5UmwrRksyUWJGdmJuTGVvdXRSMFpkLzhWdTRyMXo2T0tsRGFTZkR1dkFD?=
 =?utf-8?B?N2lxY3FDbXZyb1E5YXpoeXJxOG5OYkJwcjFtVW5tTDZDVEZEZklvMlgvNkxR?=
 =?utf-8?B?Sm5tZHJ0QTRQRjJqU01XM21oMGp5QnVDUW1jSnIyRDY4QStrSGZKODArYU1C?=
 =?utf-8?B?NGhNWjJoVHpNcjlFQXBjQWNsaGNuTWJhOE1vRlJ5MHF5QzB4V0RqeWFMeHRD?=
 =?utf-8?B?dis2c2VIWjNCVWxXZlJPZmJyYitqaG1uS3B0cmQxVTByYTlrUEVOaGlSdzA5?=
 =?utf-8?B?eENvOWJsdi9IajlScjhCWmtscnV3dDlUeGRtTXZKak5MeGRiclJqTGppQkJt?=
 =?utf-8?B?T0NSREJLaWtNeVpuTnpteGNhVng0dVJLcjhhcVlkQWs1ZUpkeVlXazlINGE0?=
 =?utf-8?B?SnRNRTRRYXl4U1lRdkxKakhvb3dmMWtmenU0OFpCaXRML0NUUWpsM1RVRmp6?=
 =?utf-8?B?cUF2K0lJNGx0NkNjOFFVU2htTjZzR3VxWiswMGYxSGFxZ0Y2cGRIZjJJcWtI?=
 =?utf-8?B?L3dqcHFwWGJXV3hETU92ODNRanZSdGRYRTZvNWpHMnZEek9CQWNJWE1jeTRU?=
 =?utf-8?B?QkFOM1d2VnpLNkgxQVZIcDZhVTlrdGJtNVprdStsZ2pOYklHSGN4Um42TnpE?=
 =?utf-8?B?eHB2bFBFVDQzTlBMa1lYUjRVblVUeU9mVk8rOVNUemRlS0JWQlR3WXFNNEdu?=
 =?utf-8?B?Y3dGcnB3ekxKczlTb2MyUkxjSXRzTDEwVk9lZGRSdVpCSm1IOHA2ZE12UnRx?=
 =?utf-8?B?MHRNbFh5S1ovMXViU3RDMURTY3d5b2gycXNwdVRydVRDbWoyZkR4L0VXRUdW?=
 =?utf-8?B?VW5FWVN0UnpidUhWTVRuU1hnYmR0QUhBbDJpc2xKVms2NGZ6ZUVkTlduU3di?=
 =?utf-8?B?cDgxWEdRaGdMcjRYdHpGYmo1cy93VzBHUk9lR01GeDJST0hHdmZvdndUeUFv?=
 =?utf-8?B?Uy81ZHFPSUxhNGxmUE9KVnpMQjFLdjhrYXo4VVNDVFYyay9RdjdkaE83cUJk?=
 =?utf-8?B?OERLRXo2UlpCQlBYaFh2UEpoOWg2R3FNQXhQQ01ZVHhGQ2Z5bjQrY3BJZHNh?=
 =?utf-8?B?YzdQMTRWTG1aQklRSUROYy9xNWNndm5sKzdDS1VsT2dpbjkvbWlXRytDRzk4?=
 =?utf-8?B?VnhGbGxVOHlyVTB2eHZjcXAzWnNSZzZCaUZ5aVIwb3dMWXJhTGVUcXFveUhp?=
 =?utf-8?B?ZXU1RHQxZEcwQjBwN09EakZlUXdERC8wYmxNbnBNMENraUdMbkRYT2t2T2pW?=
 =?utf-8?B?NWdua0ptNXV0Z08yaVB1UXo0WXJYUEZFTTRISEgrS3A0dmpxckN1ZUJUKzhP?=
 =?utf-8?B?ekhVY1VabmNXZG5nWStsdXNXQUhBN2hjd3FIdjZMZWdqbjN1dXJzR21WeXZH?=
 =?utf-8?B?OHV4SEoxRmhXQTNIMmdVbTQyQWtFMzBhVWFRZFNiSzlZQVdUcjhaZlo3SHlN?=
 =?utf-8?B?S3VmdGNPMWxyN09VVCtXVmlHd2lJK3JtNms1Q0UzWlRpcjZtWDhvRGhLTGYz?=
 =?utf-8?B?MC91OVVBRVV3V1Biek9ZYUtZSmlqNlhIQXBZRVo2ZlMvOGpUYkE5blRLdEds?=
 =?utf-8?B?OUJPdGNYbzNDK1h4QmlHOWo1RzFVMDFVWUVHaEhHT1RkWEFxaFpubzQ3TjNO?=
 =?utf-8?B?NDYwQ2RRaStxVEJvYUQxMHlpZkxkTHV3emd2ZWV2L0pLS0FXZmhEUXo2SG1q?=
 =?utf-8?B?bEdUREdMTlV3cW1xZEpFczVEQmtCRnR6MlZGWUZHZDRBYzI4S00zZm9Ob25S?=
 =?utf-8?B?NEdnVjdmTkF4cGRyMDZoQmh4TzVPQVlnU21NTFl6aVpYOHJsOEdud200QzAz?=
 =?utf-8?B?Nzk4SWc3NFc5dDYzUTJoek14UEswSVYvNE9RR1hUei9weGw5WFZ6cnpKcEpH?=
 =?utf-8?B?ZjRMRi9qMTNqTWNEazJoUTVWS2tJWHoyRDVQdUNKTFpabUdmM0NYMmNWZUYy?=
 =?utf-8?B?R3dsUVdzZndueUVnWnBnTVBPeW9GLzQwRG5OZXc5VHdEK2FmaTFPZUhOQis0?=
 =?utf-8?B?YUh5NVhMdFBwb1dxZ1luSVBtOXpSalVRRFRDczFWbUNWc1JKdWF4RXZCS1hI?=
 =?utf-8?B?TElWV2JFSmhYeEkyZXhnWDBVdTQzdkNjK1JoU0FhckdvQW9KTHVTTjhZWXkv?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc3f4f8-dcf3-40ea-b1be-08dd20856136
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:32:19.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuLBOt321nkwzw7Kp+YcKymJCU3Zct6TpiDEo+fGBAy/jzRLN9Zo32IWfuTcQO0ehYc5MKAUs+Ulz76VxDtDn9BqtsGBE/5m5KWTmb18KWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7733
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> The mbm_cntr_assign mode provides a limited number of hardware counters
> that can be assigned to an RMID, event pair to monitor bandwidth while
> assigned. If all counters are in use, the kernel will show an error
> message: "Out of MBM assignable counters" when a new assignment is
> requested. To make space for a new assignment, users must unassign an
> already assigned counter.
> 
> Introduce an interface that allows for the unassignment of counter IDs
> from the domain.

Subject and changelog claims this introduces an interface, there is no new
resctrl interface introduced here. Can this be more specific?

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> ---
>  arch/x86/kernel/cpu/resctrl/internal.h |  2 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 52 ++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 70d2577fc377..f858098dbe4b 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -706,6 +706,8 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>  			     u32 cntr_id, bool assign);
>  int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>  			       struct rdt_mon_domain *d, enum resctrl_event_id evtid);
> +int rdtgroup_unassign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
> +				 struct rdt_mon_domain *d, enum resctrl_event_id evtid);

(please use consistent parameter ordering)

>  struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
>  				u32 rmid, enum resctrl_event_id evtid);
>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 1c8694a68cf4..a71a8389b649 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1990,6 +1990,20 @@ static void mbm_cntr_free(struct rdt_resource *r, struct rdt_mon_domain *d,
>  	}
>  }
>  
> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> +			return cntr_id;
> +	}
> +
> +	return -EINVAL;

This could be -ENOENT?

> +}

mbm_cntr_get() seems to be essentially a duplicate of mbm_cntr_assigned() that returns
actual counter ID instrad of true/false. Could only one be used?

> +
>  /*
>   * Assign a hardware counter to event @evtid of group @rdtgrp.
>   * Counter will be assigned to all the domains if rdt_mon_domain is NULL
> @@ -2037,6 +2051,44 @@ int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>  	return ret;
>  }
>  
> +/*
> + * Unassign a hardware counter associated with @evtid from the domain and
> + * the group. Unassign the counters from all the domains if rdt_mon_domain
> + * is NULL else unassign from the specific domain.

(same comment as previous patch about consistency in referring to function
parameters)

> + */
> +int rdtgroup_unassign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
> +				 struct rdt_mon_domain *d, enum resctrl_event_id evtid)
> +{
> +	int cntr_id, ret = 0;
> +
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			if (!mbm_cntr_assigned(r, d, rdtgrp, evtid))
> +				continue;
> +
> +			cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +

It seems unnecessary to loop over array twice here. mbm_cntr_assigned() seems
unnecessary. Return value of mbm_cntr_get() can be used to determine if it
is assigned or not?

> +			ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
> +						  rdtgrp->closid, cntr_id, false);
> +			if (!ret)
> +				mbm_cntr_free(r, d, rdtgrp, evtid);

... and by providing cntr_id to mbm_cntr_free() another unnecessary loop can be avoided.

> +		}
> +	} else {
> +		if (!mbm_cntr_assigned(r, d, rdtgrp, evtid))
> +			goto out_done_unassign;
> +
> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +
> +		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
> +					  rdtgrp->closid, cntr_id, false);
> +		if (!ret)
> +			mbm_cntr_free(r, d, rdtgrp, evtid);
> +	}
> +
> +out_done_unassign:
> +	return ret;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{

Reinette
