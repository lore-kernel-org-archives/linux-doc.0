Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E8280336;
	Fri, 27 Mar 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636387; cv=fail; b=k8K1QHMMKwc/Qx99tS6PKKci5Mx1lwHFGDei3brtH8+Ny7Riu0OrcC2uys2B8mQ5QRQ21FctDTnuCjn+Zhg9MMLI3Wx802W1opMrEYMm1Id5/o4Yu2oH2SRhk6NtMhx4HsztJAjPlhq7ies3tVY9r7VSYRtMvfxmxYs8h6Dlhs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636387; c=relaxed/simple;
	bh=Lbm79QbjevAWFdZTusXv+oOrRwQ/R1wwgjGSXKal9ZA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VOG5Is/B/Wg7tRPsQYEYuTdldFv/sxbPufXpk3C5f8Kn6MVPha2U1zrbGXh+do9B/vdZDuFcRYjxfCZ1DFSi78mN+NxGgu6fVjmX8S9L4RYOpFQPXbyFCQKWet9AQpTIh4VyAS53GmGnDv4cnWA/1oH6LXlB3CYahDeBU23Qv3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsqcwX2Q; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsqcwX2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774636386; x=1806172386;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Lbm79QbjevAWFdZTusXv+oOrRwQ/R1wwgjGSXKal9ZA=;
  b=JsqcwX2Q3Pq7V7E+PEvDUll1QI5TIaPJlkawVmcbPzm96rvYUeifdOhX
   FctPQXtoCb1ilvnMIpalqQ+p4OmKUZMTfubNRqdyp5NqpCJ1Zboad9Sat
   b9daI6XoBgW9eVOaJ2BUue7gB5VoBBdUxR/XrfReBmioVoLoMTyDXiZUy
   9etnl4k7yGl1KgKgJpT7WRuZpyrfkrK6hDIpdA8flGqYT11G/hgByZIzt
   XMmaj1TxtlVtuQZwe4l+bPXD2abCwfwjRHtHZCS9l5AcRx6j5+kHj17Rk
   +NM0AMHd+piQ1PWJRF1EYK14BjEnGVmf5Rn3QmtzUY1cqzmM1Lmu6lFMN
   g==;
X-CSE-ConnectionGUID: t5LDgyEiT4yzH2ISAU/lWQ==
X-CSE-MsgGUID: tNh9/V0iStGBJK0vWzLKUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="101174919"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="101174919"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:33:04 -0700
X-CSE-ConnectionGUID: Aloo39xmRdqz+dW+paEAKw==
X-CSE-MsgGUID: 9O78KmvNRLSCAqS3xr1zVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248425775"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:33:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 11:33:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 11:33:02 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 11:33:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I074Ob7VgUDu6AJnoq+9uoNn3A44LEcrKehCIdoysnRpDcwPXlrlVnXP2cduaoV/+4LjOkg5lselXhqrH5Ygn7tgEQWI2EkpnecBgAptyb0S0IYJvVDBJnxRsC0orbp3qoaRPLhuAMe8RUCeFeKtlfx7cbHobo5yvDTu+v3r7eff4gIPHW6Lm3/gNeV5ebN47DpLstxwZXn7YyO9L5SFt7hQoC6XnyfRjf1SfYNDN3WZjOXg/c7Edk/E8fqZucOdloLU8IYLKCydZRoVwC8BK6qFU+QcO9pgqMk6tXmZ4T40RQIXHpbBgAxyHs7r07YVL41/MipVXE0Qq9bFibM+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8uuVhqLyfMTdEWyorgeYGenyGW12zf8IgpHfJ+dpF8=;
 b=Pt66jFkjYAU1fZ9B8dP6cfnHWTCLBiXyInk559CjuDiAt23kLsGofHFBkErt9Gzd2yOSgz5W23rP1IZX1pV4gD52spTITMzZv9HQrAZvpYpNvfSUAOm4Yj0cTLr3XY+WDWAEDE6RmVlq9+3acjLJbijGSeAjL/jdplTwY/PHPYwDtT6P/sADrqIrDe4Kr5aUnnQKNEbomLPYL3jWgXDfbe9hDnL1BHXLFHpJW4H/p7p3FNUcAjDfQs/aR/nw3YoqtDnVfPOkXDunU3HHjGhwmP83XxLPAWP2UprB4AjP+vaovvrWV1MuVsM8xnSxTgBK/jxg/IsYHryzI3Va6bqfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) by
 PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Fri, 27 Mar 2026 18:32:57 +0000
Received: from DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e]) by DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e%5]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 18:32:57 +0000
Message-ID: <fa80db54-daf9-4087-9e9f-289e829c0c45@intel.com>
Date: Fri, 27 Mar 2026 11:32:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: kernel-doc overly verbose with V=0
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
	<linux-doc@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com>
 <20260325125020.533f2042@localhost>
 <297f6ef2-1760-4b85-a55e-73a2f061d641@intel.com>
 <20260327071103.5569ad4f@foz.lan>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260327071103.5569ad4f@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:303:b6::12) To DS0PR11MB7579.namprd11.prod.outlook.com
 (2603:10b6:8:14d::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7579:EE_|PH8PR11MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: bffd4a74-c925-4610-5d6c-08de8c2f44ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: kVvHs5FgEKu5mPBssp3KKTIm/xqmmiHBvSJzlz394kMzjPQqoFTE2JLk69Ol64xGtS3pSFU1nkRxB3NxMCmUpZURMdK9p8zn8KVkF4trNIK4oSG6x9xh0QqrPXTFWj9+buRnjlJSh1WbHtb3R0CW83j6J6Qw125oO9Cq61WnMi/wA/171lxbsb7uZuXiPmCQtv6hvV4l2zECzCLFMHLYb/xmzV+ESjFHj1wp9WIowwpBXJ3fNuJ5YIEtZAfaHRek6XsqCUoFoeqyLJ1gw6FukBZIJxFZr6H9qlVBJGOgiSgV8OQq7f1CwJJCaCweCEN6lJv17rJAgmyZGBr+f0XotaXD0vkaQRTJ1MsRa//XoKBZ6vG8yPUTEPXFH58q5iUDhWBcf4XsxEvZoeUBhbA4Mj3wKmXByus29M/Oe7nVb7o5SMRsIkcAN1wQtRW1Lo7tNv2NU/C9Hq9Kq2OmG0mXKRTXM5S9vwo8V4Z+0aMWrisZOHUl3iiAOWqADRhQvSioiPjRikVaobV8E8XT4MDAjBHBsFqdtUyqlbXZNJ5S/lofMSncMSU3QjaH8BOq/7AYy2yApFpMxgTjtznxVZc8IY5G78YkCyH7BQRPTEqLGWgHy/peIlWa3m4WTbAm3EwKKRP1cJcZPR/cUgl1Bf4S6Um1Kaq4LXW64V6oadSf+mWewFlyGhDbKjZ/lrfH5gUc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7579.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2Q4ZW5keC9RV0lKZ2xqWkpHbkd2azZzelJUTG5LVVpqbWZ1azNET29QOXJC?=
 =?utf-8?B?Zk9UOXlBYXJtMWZGM0k4b1dKWE5xQzQrNGN4QlNqb1NaNXZFbklqY2ltUE9F?=
 =?utf-8?B?N0Y3Mno3bHE2cElTcnZqOE1oVk01T3Q2Y0JZckdiUWg4TzRadk9pMmxsMXZV?=
 =?utf-8?B?K09RQnliNXkvbUFZVEMyYkhQYU1JV01mS3BVSzFsYWp5MXZLM3ZuUnpjT1dE?=
 =?utf-8?B?MjNodUNMVmRQN1B0UXNYbUZqZDgrbkVrdXdTNk8zQjVwaEZ6T0VIUk1BMWR1?=
 =?utf-8?B?SlBkblNheTIxNmVPcDhWTkRRYmJmUjViN21CUHlJZGpFbUoxOVVsZkJiR0JV?=
 =?utf-8?B?Ti9LVVB5TU5aQW5JYzhkZWJpZHZuU1FDeGZUZG9FYTJhNzRBWVhZM09RSk1S?=
 =?utf-8?B?d3c0RjV1WEdTaERYSzV4SUU2cmF0ak0xa2Q4RGdTMFFFSnZzN3hsT2tUazZu?=
 =?utf-8?B?b1NvVEg5cWkyRFVqenBLczhrNzJvSXVXZThKOWdiR1IzQnY5eXlGOGFzUW5K?=
 =?utf-8?B?em5zQzhjVWpjR1hoVGdxSE9lcWIwZXBXWTlkM21KVStNV3Z0Tlp5enJISEE3?=
 =?utf-8?B?ZE92YlJhMzIvdmIrTXNBQkNMTW5Dc2h3ZUdjbjF3Ri9FdVNrR1E4SmpISWNt?=
 =?utf-8?B?NHNHMlRzUW4wY0hQak1KdGtqRkg3Mm43RHpyMEx2THphYjZrbFNxNWdQYWsx?=
 =?utf-8?B?YXRVRHlmcnk5ZWxLSEZaWnpUd2phMlBaaWdUSUxDUzBzaS9nMTltWXRUVk1R?=
 =?utf-8?B?c2tPRzdoeHIxeEdRRkRwb1EyZzQzL1JRT1JkSGhWK2tLakFnRlB1MlFqUmIr?=
 =?utf-8?B?WklHMlBHQjN1TGd0VHduMHB5L0FkTjRWRi85VHNiSnVxaHFKckljMFR6ek8v?=
 =?utf-8?B?OVRCL2pDaDNsMDVyN2pueG5Kd2ludUQrMWpCK2RvWkg5clVMQUx2Z0xFNC9H?=
 =?utf-8?B?NG9QQzhZWUdxZUxUZklPNjZYRGFXUWEzWitxaEdaNXJIYlRialpNRk0zU2ts?=
 =?utf-8?B?c0ZQWUd0dDd5eGxlaVFndnpuWHFuWHhLK3d6MGVHTU1QVERMTjFBRVJnLzM2?=
 =?utf-8?B?aTRIdGZEMlhDMlVZVXVVNC9VVjU4WHRpaHRvbVhnVVBDUmhIdU1Xem02VWtZ?=
 =?utf-8?B?aG5PTm80U3NsMEFZNFJlK0M1eWVUU2xjMEJaQjh3MlpxV1N5d3hXb2VjNWJV?=
 =?utf-8?B?OE85UWk5NGowNzlkMlRkWTNCM3k2bnBGK0EzS3cyQURlekZsK21wREFQQ09T?=
 =?utf-8?B?R2dIUUp0ZHdNRUlZWkFMVUk5dUlKZC9ZZ2xXWTI1V09LM1NmanhtTU81THRC?=
 =?utf-8?B?bmxRMnYxSGc3Z00yVXV5Ry9aU0xIUjllRlZxcVJIQmlSLytaWUZlazliRDRJ?=
 =?utf-8?B?UXBReVNqL01yQnE1SlRTN3ZDRUN6SUtOUmVWckFmOVBIZWx5S0p2eVhEdDZy?=
 =?utf-8?B?bTVNMHp4dEJPeTRKWm5URld5NXpZVFN5UWhOSUgvRDJCbXRCaEU4OGFBZE1p?=
 =?utf-8?B?RlI0dDRkbkp1NmlmZDhrSVZKc283MHFqVkdUZk40YzFXUkoyTlQ5MmRVamhP?=
 =?utf-8?B?Um1GcFBZN0dJcDRGMkZjYVFDSUxqMTVGY281UUhhVXV3VmxBTUJZR2dhTG9W?=
 =?utf-8?B?V2dhSG80RUdjQS80eEFBeGRWUUM0OTVrVDRZU01sVFpjcllaTTkrQm5OVEpT?=
 =?utf-8?B?ZmRMbVdtckl4eVpkWC9hNXdRRXZqK1B0cnhLTytNZ1RUdldyRnRTaER3OG0y?=
 =?utf-8?B?RExjSXZNdG9VTmpxOTFSaGlpOGlyREVWejNIdEl5RHJKQ3I4UG9NN2lOVkR1?=
 =?utf-8?B?QmVMK3REVnRtRTRCaXNqTGpqUzFOcnhyd2MzRXBpaS9va2ZYS0E0a0VWTXhs?=
 =?utf-8?B?ZWE2MzdES0ZpYTRxT0EyZWl2OFc1WmFLYUtIR3YxM2RCbEQrSUpodHBYeTNF?=
 =?utf-8?B?N1ZmcXVINDl1U0FHTisxeDREem1RTHVGY3B4QU42SWxhV0tzZkE4dUdxczNM?=
 =?utf-8?B?Z1pnRjBZdEdtdm1SbVJnWldYeU9CTUdTcE8vSHFBY1VmMnMzekhJRW5MQjJr?=
 =?utf-8?B?MWhSYmRGYnRoblFyaXphblI3cmVvTnJ4ZHN2bmlHTElDNnZJQlY5TnQ0cE5a?=
 =?utf-8?B?cDB6K2dvVWVRNHlXUWtxYXZEWHNKM21rUDA1dUxBaGtHcTZsWk1uSWI0MjFM?=
 =?utf-8?B?OHV5eURPQTU5ZjhrM3I3ZGYxL2J5clZyVDFmcW11RThTc3RyZFRUajVSeW5a?=
 =?utf-8?B?aEhROTNmZXpNc1QwSjh2UXkyZFh1V2xnZ0JoOFZXeGRHYytCeTJKZVJzd2kr?=
 =?utf-8?B?WjFOQnhVamFDek5SL2ZucDRnS24xNXN2RWNlZW5NVWR5N0F6SWNrdz09?=
X-Exchange-RoutingPolicyChecked: AYyy8cUSlu3HoPA0+RfVt3R1mSwqrmn8GenyCdTAlCBpthE9JVUKAr/eQl5xekhP57JEmFTOwZn0LVU3TkAW3Q+IAB2eBXBq5amwngbzdwOL9rY5OzlXzrY4H0o0r/eAIWdMqr3lYA/9lN9ANouESyaqDHxEgE2XaMEaK4NHAQl39uMUAQbjlVL6GeG+MHMCUGDtcJ2Ic4LBiG/o6yEotgyHnfTCCwo77IOoi5+CIe140cmzX1fbkFcDOexK6lvRO5Navx826pte5g/VwSWJ5V+o/GaPqnTcpqDdG48NNbAtC1mPd0yPSCitBbNjaFOdxg3nxArZm2d9EG8YCC2bBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bffd4a74-c925-4610-5d6c-08de8c2f44ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:32:57.8108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64qI31W3BISwItQ5j1t+67SxjO7JsXZK9gf56GzLWloXHyh7QZbmtNs6PVpTglJ232NTlIffpz3AWzkTEIUjqZv0JixIC1o/TI34qg2lCgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
X-OriginatorOrg: intel.com

On 3/26/2026 11:11 PM, Mauro Carvalho Chehab wrote:
> On Wed, 25 Mar 2026 13:42:44 -0700
> Jacob Keller <jacob.e.keller@intel.com> wrote:
> 
>> On 3/25/2026 4:50 AM, Mauro Carvalho Chehab wrote:
>>> On Tue, 24 Mar 2026 13:37:39 -0700
>>> Jacob Keller <jacob.e.keller@intel.com> wrote:
>>>   
>>>> Hi,
>>>>
>>>> I recently saw some strange behavior with the Python kernel-doc. I was
>>>> seeing the verbose info lines from the kernel-doc script, i.e.:
>>>>  
>>>>> Info: ice_ptp_hw.c:5377 Scanning doc for function ice_cgu_get_pin_freq_supp
>>>>> Info: ice_ptp_hw.c:5406 Scanning doc for function ice_cgu_get_pin_name
>>>>> Info: ice_ptp_hw.c:5441 Scanning doc for function ice_cgu_state_to_name
>>>>> Info: ice_ptp_hw.c:5463 Scanning doc for function ice_get_dpll_ref_sw_status
>>>>> Info: ice_ptp_hw.c:5505 Scanning doc for function ice_set_dpll_ref_sw_status
>>>>> Info: ice_ptp_hw.c:5544 Scanning doc for function ice_get_cgu_state
>>>>> Info: ice_ptp_hw.c:5612 Scanning doc for function ice_get_cgu_rclk_pin_info
>>>>> Info: ice_ptp_hw.c:5671 Scanning doc for function ice_cgu_get_output_pin_state_caps
>>>>> Info: ice_ptp_hw.c:5733 Scanning doc for function ice_ptp_lock
>>>>> Info: ice_ptp_hw.c:5770 Scanning doc for function ice_ptp_unlock
>>>>> Info: ice_ptp_hw.c:5782 Scanning doc for function ice_ptp_init_hw
>>>>> Info: ice_ptp_hw.c:5811 Scanning doc for function ice_ptp_write_port_cmd
>>>>> Info: ice_ptp_hw.c:5834 Scanning doc for function ice_ptp_one_port_cmd
>>>>> Info: ice_ptp_hw.c:5866 Scanning doc for function ice_ptp_port_cmd
>>>>> Info: ice_ptp_hw.c:5901 Scanning doc for function ice_ptp_tmr_cmd
>>>>> Info: ice_ptp_hw.c:5934 Scanning doc for function ice_ptp_init_time
>>>>> Info: ice_ptp_hw.c:5986 Scanning doc for function ice_ptp_write_incval
>>>>> Info: ice_ptp_hw.c:6035 Scanning doc for function ice_ptp_write_incval_locked
>>>>> Info: ice_ptp_hw.c:6056 Scanning doc for function ice_ptp_adj_clock
>>>>> Info: ice_ptp_hw.c:6107 Scanning doc for function ice_read_phy_tstamp
>>>>> Info: ice_ptp_hw.c:6134 Scanning doc for function ice_clear_phy_tstamp
>>>>> Info: ice_ptp_hw.c:6164 Scanning doc for function ice_ptp_reset_ts_memory
>>>>> Info: ice_ptp_hw.c:6183 Scanning doc for function ice_ptp_init_phc
>>>>> Info: ice_ptp_hw.c:6215 Scanning doc for function ice_get_phy_tx_tstamp_ready
>>>>> Info: ice_ptp_hw.c:6247 Scanning doc for function ice_check_phy_tx_tstamp_ready
>>>>> Info: ice_ptp_hw.c:6273 Scanning doc for function ice_ptp_config_sfd
>>>>> Info: ice_ptp_hw.c:6293 Scanning doc for function refsync_pin_id_valid    
>>>>
>>>> I didn't understand why I was seeing this as it should only be happening
>>>> if running kernel-doc in verbose mode. Then I discovered I had set
>>>> KBUILD_VERBOSE=0 in my environment.
>>>>
>>>> The python kernel-doc implementation reads this in the __init__ for
>>>> KernelFiles() on line 165:
>>>>  
>>>>>         if not verbose:
>>>>>             verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))    
>>>>
>>>> After some debugging, I realized this reads KBUILD_VERBOSE as a string,
>>>> then converts it to a boolean using python's standard rules, so "0"
>>>> becomes true, which enables the verbose output.  
>>>
>>> Looking at tools/docs/sphinx-build-wrapper, it implements verbosity
>>> by doing:
>>>
>>> 	verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
>>>
>>> which will also have the same problem as the one you detected.
>>>   
>>
>> Yep.
>>
>>> Perhaps the right fix would be to first convert to int then to bool
>>> on both places, in a way that "" will also be handled properly.
>>> Perhaps with:
>>>
>>> 	try:
>>> 	    verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
>>> 	except ValueError:
>>> 	    # Handles an eventual case where verbosity is not a number
>>> 	    # like KBUILD_VERBOSE=""
>>> 	    verbose = False  
>>>>> This is in contrast to the (now removed) kernel-doc.pl script which  
>>>> checked the value for a 1:
>>>>  
>>>>>  if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1')     
>>>> The same behavior happens if you assign V=0 on the command line or to
>>>> any other non-empty string, since when V is set on the command line it
>>>> sets KBUILD_VERBOSE.  
>>>
>>> That's funny... we did test make V=0 htmldocs / make V=1 htmldocs 
>>>   
>>
>> Strange. The Makefile does this:
>>
>> ifeq ("$(origin V)", "command line")
>>   KBUILD_VERBOSE = $(V)
>> endif
>>
>> I can see KBUILD_VERBOSE=0 from the top level Makefile, but you're right
>> it doesn't seem to trigger the environment variable..
>>
>>> It sounds that the problem is only if you explicitly set it without
>>> relying on gnu make.
>>>   
>>
>> Adding some warn prints I do see the Makefile sets KBUILD_VERBOSE=0 when
>> you do V=0.. and it has an export clause for KBUILD_VERBOSE
>>
>> Oh, it might be your particular build doesn't have W=1 so checkdoc isn't
>> being defined and thus kernel-doc isn't running?
>>
>> If I do "make W=1 V=0" I do actually see these lines:
>>
>>> Info: ../drivers/pci/pci.c:3646 Scanning doc for function pci_acs_init
>>> Info: ../drivers/pci/pci.c:3663 Scanning doc for function pci_enable_atomic_ops_to_root
>>> Info: ../drivers/pci/pci.c:3746 Scanning doc for function pci_release_region
>>> Info: ../drivers/pci/pci.c:3772 Scanning doc for function __pci_request_region
>>> Info: ../drivers/pci/pci.c:3820 Scanning doc for function pci_request_region
>>> Info: ../drivers/pci/pci.c:3841 Scanning doc for function pci_release_selected_regions
>>> Info: ../drivers/pci/pci.c:3879 Scanning doc for function pci_request_selected_regions
>>> Info: ../drivers/pci/pci.c:3894 Scanning doc for function pci_request_selected_regions_exclusive
>>> Info: ../drivers/pci/pci.c:3910 Scanning doc for function pci_release_regions
>>> Info: ../drivers/pci/pci.c:3925 Scanning doc for function pci_request_regions
>>> Info: ../drivers/pci/pci.c:3944 Scanning doc for function pci_request_regions_exclusive
>>> Info: ../drivers/pci/pci.c:4026 Scanning doc for function pci_remap_iospace
>>> Info: ../drivers/pci/pci.c:4062 Scanning doc for function pci_unmap_iospace
>>> Info: ../drivers/pci/pci.c:4097 Scanning doc for function pcibios_setup
>>> Info: ../drivers/pci/pci.c:4109 Scanning doc for function pcibios_set_master
>>> Info: ../drivers/pci/pci.c:4136 Scanning doc for function pci_set_master
>>> Info: ../drivers/pci/pci.c:4150 Scanning doc for function pci_clear_master
>>> Info: ../drivers/pci/pci.c:4160 Scanning doc for function pci_set_cacheline_size
>>> Info: ../drivers/pci/pci.c:4198 Scanning doc for function pci_set_mwi
>>> Info: ../drivers/pci/pci.c:4229 Scanning doc for function pci_try_set_mwi
>>> Info: ../drivers/pci/pci.c:4248 Scanning doc for function pci_clear_mwi
>>> Info: ../drivers/pci/pci.c:4268 Scanning doc for function pci_disable_parity
>>> Info: ../drivers/pci/pci.c:4285 Scanning doc for function pci_intx
>>> Info: ../drivers/pci/pci.c:4310 Scanning doc for function pci_wait_for_pending_transaction
>>> Info: ../drivers/pci/pci.c:4326 Scanning doc for function pcie_flr
>>> Info: ../drivers/pci/pci.c:4366 Scanning doc for function pcie_reset_flr
>>> Info: ../drivers/pci/pci.c:4443 Scanning doc for function pci_pm_reset
>>> Info: ../drivers/pci/pci.c:4497 Scanning doc for function pcie_wait_for_link_status
>>> Info: ../drivers/pci/pci.c:4527 Scanning doc for function pcie_retrain_link
>>> Info: ../drivers/pci/pci.c:4592 Scanning doc for function pcie_wait_for_link_delay
>>> Info: ../drivers/pci/pci.c:4642 Scanning doc for function pcie_wait_for_link
>>> Info: ../drivers/pci/pci.c:4679 Scanning doc for function pci_bridge_wait_for_secondary_bus
>>> Info: ../drivers/pci/pci.c:4818 Scanning doc for function pci_bridge_secondary_bus_reset
>>> Info: ../drivers/pci/pci.c:5077 Scanning doc for function __pci_reset_function_locked
>>> Info: ../drivers/pci/pci.c:5135 Scanning doc for function pci_init_reset_methods
>>> Info: ../drivers/pci/pci.c:5167 Scanning doc for function pci_reset_function
>>> Info: ../drivers/pci/pci.c:5214 Scanning doc for function pci_reset_function_locked
>>> Info: ../drivers/pci/pci.c:5252 Scanning doc for function pci_try_reset_function  
> 
> 
>>
>>>> Of course, I can remove KBUILD_VERBOSE from my environment, I'm not
>>>> entirely sure when or why I added it.
>>>>
>>>> Would think it would make sense to update the kdoc_files.py script to
>>>> check and interpret the string value the same way the perl script used
>>>> to? It seems reasonable to me that users might set "V=0" thinking that
>>>> it disables the verbosity. Other verbosity checks are based on the
>>>> string containing a 1,  
>>>
>>> kernel-doc has a set of "-W" flags to control its verbosity. Direct
>>> support for KBUILD_VERBOSE was added there just to make it bug-compatible
>>> with kernel-doc.pl when building via Makefile.
>>>   
>>
>> Right.
>>
>>> Yet, as using it via "make htmldocs" don't use "-W", IMO it makes
>>> sense to ensure that "-Wall" is enabled if V=1.
>>>   
>>
>> We enable -Wall if KBUILD_EXTRA_WARN contains a 2:
>>
>> ifeq ($(KBUILD_EXTMOD),)
>> ifneq ($(KBUILD_EXTRA_WARN),)
>>   cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none
>> $(KDOCFLAGS) \
>>         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
>>         $<
>> endif
>> endif
>>
>> If KBUILD_EXTRA_WARN has 2 we do -Wall, and if its any non-zero value we
>> enable checkdoc. KBUILD_VERBOSE is handled internally to the script so
>> not part of the Make invocation.
>>
>> So V=0 only manifests if KBUILD_EXTRA_WARN is set.
>>
>> We set KBUILD_EXTRA_WARN in top level:
>>
>> ifeq ("$(origin W)", "command line")
>>   KBUILD_EXTRA_WARN := $(W)
>> endif
>>
>> export KBUILD_EXTRA_WARN
> 
> Good point.
> 
>>
>>>> (some even use 2 for even more printing).  
>>>
>>> Documentation had support for V=2, but this was dropped on this
>>> commit:
>>> 	c0d3b83100c8 ("kbuild: do not print extra logs for V=2")
>>>   
>>
>> Looks like there's some stale leftover bits then:
>>
>> #
>> # If KBUILD_VERBOSE contains 1, the whole command is echoed.
>> # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
>> #
>> # To put more focus on warnings, be less verbose as default
>> # Use 'make V=1' to see the full commands
>> I don't have strong opinions either way.
>>
>>
>>>> I'm not entirely sure what the best implementation for python is to
>>>> avoid this misinterpretation, so I haven't drafted a proper patch yet.  
>>>
>>> Perhaps something like the patch below (untested).
>>>   
>>
>> The patch seems reasonable, though I don't know about the enabling other
>> errors, as those are controlled by W=2 right now. I don't personally
>> have objections to enabling them with V as well, but others might?
> 
> As W=2 already turns those, I opted to just apply the fix 
> for KBUILD_VERBOSE without touching -W macros:
> 
> https://lore.kernel.org/linux-doc/7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org/T/#u
> 
> 
> On a very quick test with:
> 
> 	$ make W=2 V=0 drivers/pci/
> 
> and with:
> 
> 	$ KBUILD_VERBOSE="asdf" ./scripts/kernel-doc drivers/pci/ -none
> 	$ KBUILD_VERBOSE="" ./scripts/kernel-doc drivers/pci/ -none
> 	$ KBUILD_VERBOSE="0" ./scripts/kernel-doc drivers/pci/ -none
> 	$ KBUILD_VERBOSE=0 ./scripts/kernel-doc drivers/pci/ -none
> 
> None of the above enabled verbosity.
> 
> Using either one of the above:
> 
> 	$ KBUILD_VERBOSE=1 ./scripts/kernel-doc drivers/pci/ -none
> 	$ KBUILD_VERBOSE="1" ./scripts/kernel-doc drivers/pci/ -none
> 
> made it verbose.
> 
> So, I guess this should be enough to fix the issue. Please test
> and reply to the patch if it works or not for you.
> 
> Thanks,
> Mauro

It looks good to me. I'll reply with a tested-by on the patch.

Thanks,
Jake
