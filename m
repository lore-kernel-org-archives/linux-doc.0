Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11601368D45;
	Tue, 11 Aug 2026 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418097; cv=fail; b=Q9u35sT3dQDE6KQ2xkcEIXPR5YZIpR/prr8sNYaWJz9QxBHoDapxr60vCgVcdiJMSmCAxoX61GyxP5YK4DFIjCUUx778EWmT631QOFfU7riGg9jzToQwWfyLowoKV8tfWPKKw1iFh+RKplLIZqABCd0halEokyxXmd/CJnZrsG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418097; c=relaxed/simple;
	bh=TzudkkWwG3GB+/EDymU4G5ruAUu/AagifjO/f2RTjK8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aDvTQ1uPCE1U5E/hArvBe/rTdiAtMC68CjG+tD7w+NENiXklWkLTyhAnLQ0G9fac5D/BcGCj3FC1GyWXMS/ofANPV8KAGMLP5+CYxDQ45DZV/X6f19zGshKwryq/o73DM0ct42KcaIjlZWPSw83FbS4ApDPcQfCjzI+h3CGoS8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnugfzKj; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnugfzKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786418095; x=1817954095;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TzudkkWwG3GB+/EDymU4G5ruAUu/AagifjO/f2RTjK8=;
  b=AnugfzKjfURiKRcuoSdjFiAAMdsFQnFB1zqoCNloI5ueo+rfWQ+QJcq1
   erJM+XCo/2pL0PNCXPG0KFcuWy4XmPQMfrzswsUrXPzGu1TENs2sfBc8d
   yNfpEahK2WGmzYMvlzFZOTgnWiTQ2vmBqfqdPybdM6bPB7bmgUExSE/Ro
   jqKabxR/QsdQHy359Fpt+4kuLUr7QGkDl7lKmvtvpCfZyIPL9QlGuu/Wo
   4GHasIBm0V8At99nUr4XVxwwKre8WVnhs12Yc1UA2PN3DcwHbl/8tUvRT
   lVi1EzIJYg5p9tGZnMwsiBMysbi90q4Z2AyD0MEEBdFoLp5AtDz7DLfOk
   Q==;
X-CSE-ConnectionGUID: 5wCYxPeoQfuFWzmDsPDCgA==
X-CSE-MsgGUID: WSDK4wSJTZSj20bkvD6m2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="89469122"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="89469122"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:14:54 -0700
X-CSE-ConnectionGUID: 02t4Vf5mT7C6gLw2JP142A==
X-CSE-MsgGUID: w6EblrWKSzmbcWDEyUt4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="256991824"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:14:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:14:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:14:52 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+82x6bModHg/RUKbSxm5sCcnyylBo6yUwCMKqD8qwn5gkTDREhuT+cbwzS5KIu6fEEI7TDCzQBvGKvaxqBu/sjq/eicjDXxTvnyRoDIfzlhcl619KJxbzAz7Dx3aS1hJZpJlY972J3V+hu660OpDuP/5eQC/dEpdvVBtXR58PVxAhs4lQtH1T46UHJ5wtpueS89RvywzGIW5EnC6Wfu0n08bl1q+HHxw5D19QlVxabDVpT7qKLj0rqxHHRcXkdmhC1PQPWRI5qV/2UDgp+VpnKw/xiZuVmKfpIGUAtzUFRL0oaKB1cJyj3pSRZR4aoMlkKJITaCSFvTgYERe1z6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLKQfpXZ6AXflPi2SNcXhqrEVUQUZZNG060CWviyaP8=;
 b=OE+SQEZwSDt2iCisH5ieOxzIsK7cO0kcA7lNwH0jV98bX7VG3qOzTc2F+3mOooqo+qJ1K48bXuMYu45CERfnPkJq8vwsHjuCXlPL2dRz7NtVTmzIVbTmGsTPYRkOJ9EN+a+7EgQqGXGGmkLJMppxuKynIrB0IK8o921rZ53tk26Rf0MRu3HUwlRkMA/PMvkGZ4OR7aFt9xwzdx/TB+YXZxh/Xt4vBRU2Hmi/00yisBAblqykncDQDeoW7xM3TH8KarBYaVtn+I/Bmi4L5MZMaq7Unrvk6j8scFvCOMEwnwwXsom2wjqO0J51EoS4wzdTvprJD2LEZoOPO8tHOm491w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:14:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:14:42 +0000
Message-ID: <0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com>
Date: Mon, 10 Aug 2026 20:14:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 05/15] x86,fs/resctrl: Introduce architecture
 hooks to program kernel-mode
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
 <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b504f09-6652-43f1-026b-08def756af88
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|11063799006|5023799004|56012099006|10067099003|6133799003|22082099003|18002099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: 7uszXxb2LjNJ1OwpTmTwGCi150PKOtIEk1bIjRQ/pQT8kwkOXPyPNFXhsp7S356KrSdvHSqd9AIlxjjAGHGcDls0+Eo9bwRLdXi0WY/A4yPx9hoBvO8QGhbFpvKX5dFZFr2ZfkqxnSHZMW6sf13KgCCoOnokKTCz/XCp6dqtx4D04k+F0JnM7rCt2lPNtWUgrTqtR/Y4E7Qm+7wp3H41m9XADxZlRC0C2Ac61tWp4ARNbsuKc67lYR9QQ2Xv/rkyX3/rCsM8nlFRezI0BOOILlAAwt8uEcK3ndN1VbbR6mGADYFvNs9KUl4F0/wTEw8Z2MwVrvfSc5nVyfDymPEOIgP14cEQ3ZGt3LwlU42AqAUqeL2aYSSqIL47d9X4wsqkKmykx100+QnGZbWiLShsYtIza40WWphkLW4OA1h4Kt79w3pTys9dpxWwx4GjfK6Blc/+ujZyREDxx5QDfS8baXdtKTxRGFHo+q2Pe2itl8P3+FwX+eMwlFZofGra3gUYJJaY2Wqz6GYse0I267OZe29XOm9QP7HT1TYOLX+xSkqTu/HtU4B5mzicb06i/WRJAsyBirG2OJDyp7zilQYDyUSTYCvdkeDgC0nc8LbPMV/PSLIsuVA7r4tB7BSy9mLaFcObTwDyYFSOTsw1sgCeYV+1h9lwVj92NFS5JnRCagI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(11063799006)(5023799004)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkJSWlJTNThmdnFOc2lGU2VZdGVyU1M4UGNQZTBJdUxUK05RWmtXajZZWFBR?=
 =?utf-8?B?NWtUYzBxb1RQTGtnQzJYL1BIU3pjSjZTNXlDQkp2dmpxdFdnRHd2VlI0a2FU?=
 =?utf-8?B?OFd2ZncxMWFqeGd5SVlGeUNwNk15RjNrL3FaZm5iWGJqTGx6cWFMemx1WGp1?=
 =?utf-8?B?SkZiYzZ1UXJSTUtweVJNbVBIbEttU3NRaEh3ajUvNHdOdHdQeDZaNVpKaUtN?=
 =?utf-8?B?Yis0VE5Db3VzbStjckIrWHdjbUJabDNJRWFNOHA2cTBTQWFWZ2N4MFdWZGxW?=
 =?utf-8?B?WHBkcUdZZ242R3VOaDJRM3JXdlg1UDlqZldSc1pqUHBZZUE4NDc2cS80MHJ3?=
 =?utf-8?B?U085NVNlOFZjWVNNakIra3F3a2tDVWt6Unh0dUhYOURDamdvR3IyK1BqS2lL?=
 =?utf-8?B?dUhmYzBKZkt3bFNmUTB2NFVQWSt5RWw1UG9paW9aYmJ6THloOXhFQ3c0dWVZ?=
 =?utf-8?B?MHpQWEdYbWY4Rm9IZmVCTkUwdUZtOUU0NHByVGZXaExFMmhWRzE1czdTNHkz?=
 =?utf-8?B?WU5zVXQvaGw5K3hmb2xrTXNmR1d5MzRGcld6VkpMQzJZVFg2eHRaUisrZUww?=
 =?utf-8?B?QzZTZzdqcm5UaElURWJEUDNORURaUWhLTU1JcnRnYXVqNXNDYmxpU3hvWnBL?=
 =?utf-8?B?WC9DeXVMTnIrc1UxZExDV0xLNXN0YVpqbTJNTmFpNWxHUFpVZHE2ODVZQ1Fu?=
 =?utf-8?B?MVNiT2lUbzBibzJEalNMQXg3UHI2ZmJKQ3pxeFErTXd5N05UT09sOGpiRlNF?=
 =?utf-8?B?Q3NHMkYzaHNEY1U0aTZrblBxTGRDSEFFM0pmUXl1VGJPRHZSWnorYytQbC8y?=
 =?utf-8?B?NS9VZTBpYXphN2UyaXBGTGVMTHROZ1dHaGVQaTZHLyt1MXU2cGhIWi9LbmdQ?=
 =?utf-8?B?MGloY3FEeitqVGkrUE9kVjRtWHNhbWtrWUpmZnVqbEF3ZnduTFF2R2JRc3RI?=
 =?utf-8?B?bHdNSWZzYVlLUTlTM0dqWU1sZlkvUXNLTENwcVJCbmdZN1lxLy95YkJ1V1pL?=
 =?utf-8?B?djl4UjZOeGFPOW1MbXRBejZ3TDF5Y1RkS0p4SXpIUVpDb1A2VmtPb1NpQUwz?=
 =?utf-8?B?amNQUXVxS1JnQWFxdzlrbFBkL0wrOFMwOHVHVG5vSXgyWTc4UzdJbUt5K0Uv?=
 =?utf-8?B?NS9peGZoV1p6dXZsSDl6c0NXWURXUUloS3k1bzBjcEJOUFZLbUJzbzRLV2RT?=
 =?utf-8?B?K1pqa3ZhcEgwNHJtSEg3R0w1OWc0ZDQ3Vi84ZGtxM0wzOU9OMXozNDdHcG8y?=
 =?utf-8?B?aXl4V1hyTTFFcmdzWFcvQXJ4Y0lLR1dOaVVkbmlOM1BZbnFTLzZhTkU5Wksx?=
 =?utf-8?B?bGx5aEtpU003RUlDUzNrT3RPUVhGSUt2VlFsNFdMOU9YRHhOTkFiOC9ndGc5?=
 =?utf-8?B?VlZhK3hUeUl5U2twVUxrZEJzb1lSU0hmRy9KVXptNmpkNVVOdnlCM1c5Y0pl?=
 =?utf-8?B?V1ZwUmpOclFjSlNndUNBcXhMVEVONGtOL2tDQjBaNmszZUFFRmUwOEpzaDcw?=
 =?utf-8?B?cFB0VlFYUWdLYVFHOVg5c3pLL1pOMm9SSUV4SEwvY3U4M0NjL0NBZlhlTEgy?=
 =?utf-8?B?dURUYWdyNzdRS1RTUlRZN0hmcmRCazhLTW1qdlRrN0ZObW9WMndiMjNUbkFz?=
 =?utf-8?B?QURObE9kODVhczh3dGpqdXhWa2NPbWpvd0c3SmcyQUIrcVFmKzkvRHN3R1lN?=
 =?utf-8?B?ck9vQURCazkyM3VVd0ZJcGJ2YThPd1NlQk9wODQwWW96SDlDd09iR0QwSVpN?=
 =?utf-8?B?NUtTUEdrSWJkYlZ4VGlKdnl6V1crclpwcStCOFFsRC9qWThjcHh0ZEFvOGs5?=
 =?utf-8?B?VnRtb3NvaGFKa0NRZ2t4elBGV2R2WGplY0IxazhJNkFSbG9IdDloRHVDOUR1?=
 =?utf-8?B?UUg0cE44NmoyMGVVWDZ3dlFNemZTaHVnamJUcFZ0elF2aVZKM2daZWZCc0Qw?=
 =?utf-8?B?TTE3S2hUU3hEZkptMkRlVzc2TlRlcGNxRVE2dGlZL3FtT2xxMllCVFNiWEhZ?=
 =?utf-8?B?SXFUQ2grWUFMdEUxc09lUDZlT1I3NUdjUXlDejVsM2xhcXo0QUtVZ29udFZt?=
 =?utf-8?B?TzQycFF5MUpxRnRLUVFtN0FnRWJSTmVLQit1SWR5eWo4cTRIc3hPelJFTUdm?=
 =?utf-8?B?NjhWREVLZDhFVnBvZjR2b3AwUFBnL3lpellabU9lVzFSWlNyRnZOL2hKL1Jv?=
 =?utf-8?B?QlV2RndxOGdVYkVqTUcyRFo3eUVXZ2YyV1h6RmlMOW96aGNyN3V6RTF4Smh6?=
 =?utf-8?B?NndNSG8rQ01rcTU2NEFCM3h2V0lya2lIV3l3cUtETVFKdjZ0WHZxejRnZm9l?=
 =?utf-8?B?c1Jna1pJZFFFOVZ5enZMVngvczQ5YnUrelQ1YU1NeVZBZXdGZlZLbkNXd3BD?=
 =?utf-8?Q?wqjAubw/BwoxaCEw=3D?=
X-Exchange-RoutingPolicyChecked: WIBtFklIyrLk+Fe3M4hZK8XFMMOgqLSQ+i4fIv0Xoc1BS7COYdAjW3Kn/rokvRAvsP9BAG6TeMeYiJWDDxdflm8wdq8o17piRtn17ZK/bf9o/zWm2FHAafLUo0qN9sDmEu3TefdFRLHC2plqantvCg3yES7jQXTcK9XyW+vf5RyPmnSr0KKzQOFZAq406m5TYP/8UnrnbB9cNChAv2nY5H7sGrJFu9LFrzX401C5CXbdNbiuWMmBI7X/ghoSQg0uK4nwHiNh1l0yJkqzu+xAijBH5fmo2DQDh26h1PmtLLGs+Z1YgAQxOxV4jTpU8K200l45mH7j36Sa0alWAjsY7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b504f09-6652-43f1-026b-08def756af88
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:14:41.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpTB8YIKSnZac8lMBFUCO532xKX/GhxcLWzYWgnJVU7RmWTWnN3lOcEbBNK2Q1NgHKuoU/yY41DUYe2lYIM/Dno8lkkyW4ktxfYVnN43Epk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Kernel-mode policies defined by enum resctrl_kernel_mode must be applied to

"Kernel-mode policies" -> "Kernel modes"?

> each affected CPU whenever a policy is selected or its scope changes.

What is an "affected CPU"?


policy -> "mode"? or rather: "whenever a policy is selected or its scope changes" ->
"whenever user space switches the kernel mode or changes which CPUs are associated
with the active kernel mode"?

> Generic resctrl therefore requires an architecture-specific interface to
> program allocation and monitoring associations in hardware across a given
> CPU mask.
> 
> Introduce a helper, resctrl_arch_configure_kmode(),  to handle kernel-mode
> programming. On x86/AMD systems, this helper programs the
> MSR_IA32_PQR_PLZA_ASSOC register on all online CPUs in the specified mask
> via on_each_cpu_mask(). Also provide a no-op stub for MPAM systems.

No need to describe the code details, please just make it high level of what
the code accomplished as opposed to describing the code self.

> 
> Generic resctrl does not invoke this hook yet; it will be used when user
> space selects a kernel-mode policy or updates the associated CPU set.

Looking ahead how this arch helper is used it really is a "one size fits all"
based on what AMD requires. Specifically, as I see it this architecture helper
is called under three very different scenarios:
- A new kernel mode is activated
- CPUs are added/removed from an active kernel mode
- A kernel mode is de-activated.

There is no way for an architecture to distinguish these three scenarios. An architecture
that, for example, needs to do some arch-specific init to support a particular mode will
not know when it should do this.

This "one size fits all" may be ok for an initial approach until we learn what other
architectures require, but the API needs to be clear on when and how architecture can
expect it to be called from resctrl fs.

Consider, for example, the API description containing text/contract like:
- If a per-cpu kernel mode is active when user space switches to a new per-cpu kernel
  mode then resctrl_arch_configure_kmode() will first be called to de-activate the
  active kernel mode on all CPUs that the kernel mode is active on.
- When user space switches to a new per-cpu kernel mode then resctrl_arch_configure_kmode() is
  called with cpu_online_mask. 
- When user space adds a CPU to an active per-cpu kernel mode ...
- When user space removes a CPU from to an active per-cpu kernel mode ...
- resctrl fs will always provide the same closid, rmid, and "assign_mon" parameters when
  activating a kernel mode, all interactions (adding/removing CPU) while the kernel mode is
  active, as well as when de-activating the kernel mode.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Added assign_mon parameter in resctrl_arch_configure_kmode() to program the RMID
>     as discussed in below.
>     https://lore.kernel.org/lkml/20260605100642.1103628-1-qinyuntan@linux.alibaba.com/
>     Changed cpumask type to "const struct cpumask *cpu_mask".
>     Added MPAM stub to avoid any linking issues when resctrl_arch_configure_kmode()
>     is called from FS layer. Thanks to Qinyun.
>     Re-wrote the changelog to be generic.
>     Updated code comments.
> 
> v3: Removed task based PLZA implementation so related changes are removed.
>     Removed handling of rmid_en as it is not required. The group type assigned
>     will be different so the monitoring part is already taken care.
>     Updated the change log with details.
>     Removed resctrl_arch_set_kmode() as arch only provides the modes supported.
>     It is FS which decided which mode to apply.
> 
> v2: Updated the commit message to include the sequence of steps to enable PLZA.
>     Added mode code comments for clarity.
>     Added kmode to functin names to be generic.
> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 36 +++++++++++++++++++++++
>  drivers/resctrl/mpam_resctrl.c            |  5 ++++
>  include/linux/resctrl.h                   | 15 ++++++++++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index b20e705606b8..025f139434f2 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -131,3 +131,39 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>  
>  	return 0;
>  }
> +
> +static void resctrl_kmode_set_one_amd(void *arg)
> +{
> +	union msr_pqr_plza_assoc *plza = arg;
> +
> +	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
> +}
> +
> +/*
> + * Program Privilege Level Zero Association (PLZA) on @cpu_mask.
> + *
> + * When @enable is true, CPL 0 allocation traffic on the targeted CPUs uses
> + * @closid from MSR_IA32_PQR_PLZA_ASSOC instead of the CLOSID from
> + * MSR_IA32_PQR_ASSOC. Monitoring is redirected to @rmid only when
> + * @assign_mon is true; otherwise kernel-mode monitoring continues to use the
> + * RMID associated with the current task.
> + *
> + * @cpu_mask:	CPUs whose PLZA MSR should be updated.
> + * @closid:	CLOSID to use for kernel-mode allocation when PLZA is enabled.
> + * @rmid:	RMID to use for kernel-mode monitoring when @assign_mon is true.
> + * @assign_mon:	Whether PLZA should provide the kernel-mode RMID.
> + * @enable:	Whether PLZA should provide the kernel-mode association.
> + */
> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid, u32 rmid,
> +				  bool assign_mon, bool enable)
> +{
> +	union msr_pqr_plza_assoc plza = { 0 };
> +
> +	plza.split.rmid = rmid;
> +	plza.split.rmid_en = assign_mon;
> +	plza.split.closid = closid;
> +	plza.split.closid_en = 1;
> +	plza.split.plza_en = enable;
> +
> +	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
> +}
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 226ff6f532fa..630b6cfc0269 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -158,6 +158,11 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
>  	return false;
>  }
>  
> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
> +				  u32 rmid, bool assign_mon, bool enable)
> +{
> +}
> +
>  void resctrl_arch_pre_mount(void)
>  {
>  }
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index c7abed51cd5f..47db34dd167e 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -734,6 +734,21 @@ enum resctrl_kernel_mode {
>  
>  #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
>  
> +/**
> + * resctrl_arch_configure_kmode() - Program kernel-mode association on CPUs
> + * @cpu_mask:	CPUs to update; the architecture applies the change on the
> + *		online subset of this mask.

Could architecture not expect cpu_mask to only contain online CPUs ?

> + * @closid:	Allocation class for kernel-mode traffic. On x86 this is the

"Allocation class" ? Care should only be taken when using "closid" outside of
kernel. Please see all the other examples of arch API in this file that uses closid.

> + *		CLOSID programmed when allocation is assigned for kernel work.
> + * @rmid:	Monitoring context for kernel-mode traffic. On x86 this is the

"Monitoring context" ? At this time it is quite clear to architectures how to do
needed mapping.

Some archs will use closid/rmid separately, others will consider them together.

> + *		RMID programmed when monitoring is assigned for kernel work.
> + * @assign_mon:	true to assign @rmid for kernel work; false to inherit

This is where the only distinction is required when considering other architectures.
Note that, from user space perspective, it is a monitoring group, potentially identified
with both closid/rmid  that is assigned, not just an rmid.
This is thus not a request to "assign @rmid for kernel work" but instead something like
"kernel work should be monitored by resource group identified by @rmid, or both @closid
and @rmid, depending on the architecture"  

> + *		monitoring from the user task.
> + * @enable:	true to enable kernel-mode association on the targeted CPUs.

"the targeted CPUs" -> CPUs in @cpu_mask? 
Please be explicit what is expected from architecture when "false" is provided.

> + */
> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid, u32 rmid,
> +				  bool assign_mon, bool enable);
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
