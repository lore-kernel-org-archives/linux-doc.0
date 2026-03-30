Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5869377543;
	Mon, 30 Mar 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887713; cv=fail; b=oSYC4g/TUNzN5F07sr32sM7lZLY8wwbf0nQTRKDu6SFif+55KfxlXl6V1e8PREXHYtYJtnjLtIzgM7GNzW7buPvysvVBjHoahOTj7U+lN2FDXuVb+fczDH3o9T2NWhw2YqxNF43YtjvbhLhoq3T0/JzQ27RYl+0LP634oXVM2cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887713; c=relaxed/simple;
	bh=eg1PZhpXP2ZXeL5f5jr4AgxI4r8HTDiE+Oml5SdoDvI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K6SxQKoLpCFiwytUO7DZ8vA7y6EWxFkFBCLbrqYGosbW7noJbfL1XUwRA1SrQNDRjhDXXKRxJJHAagMfbUj26X8LpZPdGhsJK3EdsrUmuX6Mb8vMvtH0+KmeaVxdiVFlfHfiLw9Z4G95lZzEm6SEdhhzNvoG6SrATodnw0I4myo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjIV/L6E; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjIV/L6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774887711; x=1806423711;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eg1PZhpXP2ZXeL5f5jr4AgxI4r8HTDiE+Oml5SdoDvI=;
  b=gjIV/L6EJ6FXAaqQf1gj7A6lj9zqim8nPEFwKrL5hVui+V+SQJkSt7Nl
   OVf7VCzfkDWkVuX91SHXJKyD32gJ5ZFBxPpyEGXiVrZzIKzHCIGntGwf2
   RJzCh8Yzua8V+nHAbxXwdJEIoU2aD1tXb07eSdYQwVubEUofumKqfV6g7
   5Je8PUJqGB3j39jCku6SXwzMnHPaZLUekE8nFyFodUFTA6LSRyTVQHSFY
   FJ96jEB17JxHU1K9Y7uKo7o6Tc5Aq2/wRO8KaGJ022Z2TRhIp4fFYw9O1
   jfar4dp1YVdVBMJ9/05B7Xq2m9JCjSTF0zLwPKZr5kHcp3Uf1v16RFQaL
   w==;
X-CSE-ConnectionGUID: QYtRMWFxRvWEH2oKx3HYVA==
X-CSE-MsgGUID: PvSX2eEJRhaMj7UU6XSJmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86962713"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86962713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:21:51 -0700
X-CSE-ConnectionGUID: sDdn5o3SSAOKxqxA9q5UTw==
X-CSE-MsgGUID: GGkxKu3ISPmVbnSxTUYz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="264037123"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:21:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 09:21:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 09:21:50 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 09:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHpuUIiZiIgZeYmFcXLY+ZkW2DYJYP1pUu4W4YpIcP/OpxT/2oxAILySR9e+uHNruqFHV1EMH1jT7tLo0pQ+CefrbVROy6XQsg7FVodyIZA3qEoi40ajGrpijgH1Mtppe+W8Qmq5oVb4eTj7yZcI32869/RtUOGVU2Hd7HkD8CbvYZXnNmdYUkYntqBMJ40ONcLFiHZ16Lis2ZBnwoMQBM/hfG/MTg9MOPieG5aod0gxRVhdrIldI7ER4hJvgO0K8n/xibcxdHwV/aHcErlXPyxOyG1Vw/g0folX+i5SrCw1WFxgqBfdcrw8U5rC4klaohuNU7NHFGqvtX+Rmh5eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtocalVnlsrofDM35VMWEvfTK3fTPCE7n00GaN2W2kw=;
 b=iB9W8FYRtHv8AexpmCiiP7BoJk/DviHbDoU23N9U5SgXhVbbvKQ0I7p5HDbRT7ZDcqFhid1IP91ilmaUgGrTIh65kNp4Jo+/INjzuBAtLlu4vXWgorlEA6/LSW7Cw2uW0EBqCQbhmnn8MEzKhRPj4Sd3ZmWCFWEKiL3SGf5MWrnjdLymV0priiTbBhzslaBcttPFPT3ReE0GbkRQl9UNSYJNcHvDQfYGeHHpJzyCarpNVOike6FmqKMHWODI3dB5drNkLGy+/Dg+W3rRZThX48UeyGiPTmsrgJBmdj+2kHZRTdED+nmRdIZxDXZwMEUkylEHQkP85sYbcya4/X8Tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) by
 IA4PR11MB9394.namprd11.prod.outlook.com (2603:10b6:208:563::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 30 Mar
 2026 16:21:46 +0000
Received: from DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e]) by DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 16:21:46 +0000
Message-ID: <83572d0d-049f-48d0-800e-7f2f735aa611@intel.com>
Date: Mon, 30 Mar 2026 09:21:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc tools: better handle KBUILD_VERBOSE
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Shuah
 Khan <skhan@linuxfoundation.org>
References: <7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org>
 <540ceb4a-fd54-4e95-9431-8f233252259c@intel.com>
 <20260328010955.19a90582@foz.lan>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260328010955.19a90582@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To DS0PR11MB7579.namprd11.prod.outlook.com
 (2603:10b6:8:14d::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7579:EE_|IA4PR11MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d645148-f64e-41ac-d3dc-08de8e78704b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0PMSQ7n0PQgnWzaCyePOPciljNME7Awkqh8YDHDLBTDHjL6ImbVdDnECs7lGtp6YMYand5qnzx7cerAUaqQeLPF9O1UGOkLCV1qmIod+Uvb0/60atSUHiWDreis2co2KcEd/H7p5EXkfIbxS9wCfJ5XZ6tWdoBFpix85FAz8HYF6Qzr+cZGrJggn/vjnDtPST0oe40Qd1lLUFrS4yQNAqQp2b0NVKul2zg4MaKO1TW3T+gEj8AUmBmffaveAYDCMfFKreSUclM6nbBB5rVHbY8n+FwlLpLqvZrizTb1OO5ARCIdUzzADBKMZfHTojzEE+PifdgKp/Z9SAPKYNiktpjTbd9+aVTahdqzR4Wduu1qZYXwhvRg3lClv9WEGG2isOej/UBptDQXfbO65VPGslCbabh9TyNtDoEY3UVp9Ca7tuL7UvkdogEmzOdMlYUK8nj9M75IgsCnDelrudeLoTnw9xtyt9pE+pDvmq/8Nh8wQkZUs0LkGpA9LPIToq74rKELoyVsDBk/CSoJ0fWo+X1tRnTG5dEIpM+dh8C2WFW7cqzluaft8g+dyvX26NcNc7G2wvyvv7HmSPLPmGPuUpvf+1UF0RhnDZSObIDuAWQ074FO6kGr4DYoMcXifCTCCrYlO1XEDGSTZHqKoUgOFHk465PoK7f8YyEMI+wj4sYBC55zwESblFV1sCKf9z7jkiqXfVWdek6DS4W5V8QHFo9XhDI4M9FDT5QBXqv6vZldnOostvJ9eBhVnklY9svai
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7579.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUp1TkdBUXl3Z3ZtRFdwVENTcTczM1pKT3QxZjNlQzhtejNaNC9OVzJ6NU1B?=
 =?utf-8?B?RTRrc1hMM1I2WmptSHhDR2JyUUFOM2VkR2t2djBiZjgrT0dyaUhBQmRLamZP?=
 =?utf-8?B?OUJ2dER3RU5RaDNtZUFnbDdkY2dUM2pVZndydHdCQmZtNTBMUWN0bWdWTS9G?=
 =?utf-8?B?aGc1ODVLMGRkV2pUSm5WeVZmYUJaSC8xOXVwcFErc3VQRU1RYWpCcFJ0cmJ3?=
 =?utf-8?B?QlNFcTNZelFkKy84UUpTRjJGSUVhYkthcDd5NnVjTVh6dHZCYTA4KzZQTnZX?=
 =?utf-8?B?UVFkYnp0VkprZmJHcWhUZE5tb3ZlRUQxVDgrK0xGVmx4bnJIb3NJT2U2RGcx?=
 =?utf-8?B?Y2gxU09mSi90MjRJQ3g4WnFHRnZrOUs0bVZ4VWZGSTd5N1FSc3p3ME9Nckox?=
 =?utf-8?B?Z3NucDVJb1lGNmFWaXJtRUpsQ09YTEpWRDNpSUszakRFTFZhN1JxREthRWIy?=
 =?utf-8?B?d3RjcitwYjV6TzRPVVd2OURDVjdNVnNOc09TSTg3TDlucUF5SEoyM3RHdnNz?=
 =?utf-8?B?aldpSTRzdEFvL2VEdGpJN3FuSE9saXY4QkxTbEIzVnZGRmN3YVlOTFc1SGNG?=
 =?utf-8?B?ZEFualEwUVhyWnBQU1ViUEQvOXdpTDJENkcvUTU4c0wwNlY3bFNHUU9Sc05p?=
 =?utf-8?B?K2QzZXAzR3AyS25MamJJM0hVWUdwVXMyS0NUQityaTE4YzcwT3REd09NRzRZ?=
 =?utf-8?B?VTE5Ui83YlFjbTluNU9EZE0xeEpuRXVSSUJYaWE0bG4xbUIxZmJram1mMkNu?=
 =?utf-8?B?Zi80bWRKY0tlOWVaTzVmeHh3dEFSMHp4b0R1WEZCa2hMZ3lndE5XMjQrTk9n?=
 =?utf-8?B?dHJXaEd0N1BkQ21RTHY5bXUrUnh2YUZ4WXgxVEN4bUErbTMxK1AxcXBuUlZB?=
 =?utf-8?B?Tm1mcnZLQ05WQU0xSnlTUVVlcEFWbC9tM0dEamw5NGRPTEE2aytTSTNLRG5q?=
 =?utf-8?B?S0VXQlF2MStJZHlUUHB4MVFwTWc0Rk81RFVlYjAxd0Nvc3JCT1hWMXFzK1FG?=
 =?utf-8?B?UVZka1ZBSmNzU0JMbWtkQlVDVGYvSFVZTlVxSjJWSVVhS0xBSDFVWG1ndDdk?=
 =?utf-8?B?cUV1dkRhemRaYld2Um1xVlI1M0Z5aWtZcFl6eWMwYkpSelNkUktyS2tqYklh?=
 =?utf-8?B?UUlQSUVEOEp3eTZVbThPTWppNHMrZ3FsOW9ETHptT0lXQkUya3NuOVJaQ2ky?=
 =?utf-8?B?Ni8rZ3ZHRkNSdU1FUlE1Mm9jZFA1RTJpWk5zcXdVdDliUk5JMjlBV2VMK3Ix?=
 =?utf-8?B?QmR5cXlPUm96WkVCZDlwVTFoaFlZMXlNdno5YTVNdzVnbGplalpVaWM5U3dC?=
 =?utf-8?B?NEdFRnVrVStKbVI2RGwyZWhiUHlhM3FNRkdDRVk2NU12N0MybWd4WGhOL3Jy?=
 =?utf-8?B?YTl3MUZ2NmZoZUM2NWFPelVQN3JlRmlnNU9wQkF3OGF5dWErRGJOZHRvQnRt?=
 =?utf-8?B?eGNpdjNSeWNDOXF2R3lXVUlDVms3bzlDSVlFTU9KTmUwcGxENTllY3RIejJ4?=
 =?utf-8?B?TGVOSnhvWTkxbjBVVnhiUFNVT25BbzNzVTl5Tkt4YXBUTDNLRXB0Z00xc0JW?=
 =?utf-8?B?dVNDZUhTQnFkM1d5Q04wODNmZDJpWnlCb2N2K0s2cE9RRmpxVHNsQlVQQWpR?=
 =?utf-8?B?bEpaTnR0TjZkNW1ZeWJ1dzlOcURhekY4YU1nQUhER0kxNVZyMGN3dktML1px?=
 =?utf-8?B?RktmclZDWU0yZE9yNnpUQ3lXQ0loWTBVL3pxdTdJbnNoZ2thZEVOMHlOVDhN?=
 =?utf-8?B?WnJCeHRLWTNYSGhyVExLazMvM0Vsc0FIdjg2akZIODM3ZzI4a3ZMQWxJRVBX?=
 =?utf-8?B?U3BBYTBZdDgxRWJ2ZTUydE9yVmlmUVdLQ3FwYVJHNjRZNnMweVRMUmxJMi84?=
 =?utf-8?B?eWIvNDRQMnFFQUUrM1pBRmVYaDg2RVcwRWFYRk9WWGx5TkllUDhXQ0pNVW1v?=
 =?utf-8?B?OUNsWGJ1TDd0NUJvSTM3aW03TGx0b25kdHFHQ25mNlh3ODE2RmU4ZWx5T1hD?=
 =?utf-8?B?Sjl0aDZRTnBXcWY2c0kyZ3ptV0dDZG9aM21FZmRSZUpiOE1sdG9YN0ZFbEYv?=
 =?utf-8?B?TS9NUkZhcm5uSWJRNkdVYU1DeW5JYzhVNWRxemJvbDUyL3V1Q0lYOGhRa01z?=
 =?utf-8?B?eVZQbmpFUlVsMXZ3WTFjd25WbGEwMEkrK01Qb0R0Wi9xK1RybUJXRXc5cGFB?=
 =?utf-8?B?Zy9RWHZkRUtPVFRHYnpIV1NaMDlGMzFmV1V6WEZCdWZVNzJlanU0V2dpbW05?=
 =?utf-8?B?NXpxUHkvUnVjWU8zNW4wMnZCYkR5aWtySGQzL1ZpMExBbVhnbEJxK2pYVFI2?=
 =?utf-8?B?RUhkK0RaYTNRSmRpRVRZbGs1SEpLbVhudzdQUm9rMkFYY2hPODRRZz09?=
X-Exchange-RoutingPolicyChecked: UnRoP6uos+qtApTo4XWL/Vbp+5uQWQ9X0DfxXgMvtm4Szx6srgBKYlDQruxE1cXlgT419gLa0j+kJQyoBGPLP33B+0eGwTLZyKMKal+DWlZPy7+NdqkELIOkyJUoUb3ISA+iHLfdv7lS1SlJO4jPhUnUjf/FjdfYMTJTU2/dgNXH2wGqhMUM2cB+1TMrGrM0MjoUpx0DycqYJojBr8r8dGBfJUdLwimzU/y5KxoifIt7bglI0/BUBV0lktK8NHYKoQ28TRpIN625OtubM7NO6xWyvTUrw8zq/yWpz3ap9/uMMtRn6QoOa8aFfEHrf+7tnpTCAgabpGmz+nwyLc0irA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d645148-f64e-41ac-d3dc-08de8e78704b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 16:21:46.6209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNtrbv49EWgYKJ4mtuuhlVXRlxsq1Hd8Puf120dAZkGeVIsHpZTrjO7RjnJ6d6Scy3CXq79R4zNY6Aw872dF1sRBabihbzQvUCqznvMlWGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9394
X-OriginatorOrg: intel.com

On 3/27/2026 5:09 PM, Mauro Carvalho Chehab wrote:
> On Fri, 27 Mar 2026 11:35:39 -0700
> Jacob Keller <jacob.e.keller@intel.com> wrote:
> 
>> On 3/26/2026 10:57 PM, Mauro Carvalho Chehab wrote:
>>> As reported by Jacob, there are troubles when KBUILD_VERBOSE is
>>> set at the environment.
>>>
>>> Fix it on both kernel-doc and sphinx-build-wrapper.
>>>
>>> Reported-by: Jacob Keller <jacob.e.keller@intel.com>
>>> Closes: https://lore.kernel.org/linux-doc/9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com/
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---  
>>
>> I loaded this on my system and tested the build works as expected both
>> with V=0 and when I export KBUILD_VERBOSE manually.
>>
>> Thanks for fixing this quickly!
>>
>> Tested-by: Jacob Keller <jacob.e.keller@intel.com>
>>
>>>  tools/docs/sphinx-build-wrapper     | 7 ++++++-
>>>  tools/lib/python/kdoc/kdoc_files.py | 7 ++++++-
>>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
>>> index 2c63d28f639d..1bb962202784 100755
>>> --- a/tools/docs/sphinx-build-wrapper
>>> +++ b/tools/docs/sphinx-build-wrapper
>>> @@ -238,7 +238,12 @@ class SphinxBuilder:
>>>              self.latexopts = os.environ.get("LATEXOPTS", "")
>>>  
>>>          if not verbose:
>>> -            verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
>>> +            try:
>>> +                verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
>>> +            except ValueError:
>>> +                # Handles an eventual case where verbosity is not a number
>>> +                # like KBUILD_VERBOSE=""  
>>
>> Strictly speaking I think os.environ.get() will handle the case of an
>> empty KBUILD_VERBOSE by converting to the default value (in this case 0).
> 
> It won't. See:
> 
> 	$ FOO="" python3
> 	Python 3.14.3 (main, Feb  4 2026, 00:00:00) [GCC 15.2.1 20260123 (Red Hat 15.2.1-7)] on linux
> 	Type "help", "copyright", "credits" or "license" for more information.
> 	>>> import os
> 	>>> os.environ.get("FOO", 0)
> 	''
> 
> 	$ FOO="0" python3 
> 	Python 3.14.3 (main, Feb  4 2026, 00:00:00) [GCC 15.2.1 20260123 (Red Hat 15.2.1-7)] on linux
> 	Type "help", "copyright", "credits" or "license" for more information.
> 	>>> import os
> 	>>> os.environ.get("FOO", 0)
> 	... 
> 	'0'
> 
> 	$ unset FOO; python3 
> 	Python 3.14.3 (main, Feb  4 2026, 00:00:00) [GCC 15.2.1 20260123 (Red Hat 15.2.1-7)] on linux
> 	Type "help", "copyright", "credits" or "license" for more information.
> 	>>> import os
> 	>>> os.environ.get("FOO", 0)
> 	... 
> 	0
> 
> it will only get an integer 0 if the env var (at the above example, FOO)
> is not on env.

We always export KBUILD_VERBOSE regardless of its content, so we always
have os.environ.get("KBUILD_VERBOSE", 0) returning an empty string..

but the old bool() conversion would return false as expected. I.e. prior
to the change '' was handled as false as expected. but with int() then
we *do* get a ValueError now instead.

Ok.

> 
>> The intent of the comment and code is pretty clear though, so I don't
>> know that deserves a re-roll.
> 
> I opted to add a comment there because having two conversions,
> first to int then to bool is not that obvious ;-)
> 

Yes. I was misunderstanding the intent of the comment, because I was
thinking that KBUILD_VERBOSE was unset, i.e. if you assign
KBUILD_VERBOSE= it would result in an unset value, but set and empty is
distinct from unset.

Prior to the int() conversion the bool() conversion did implicitly
handle the '' to false conversion, but now we'll get an exception first.

Thanks, and apologies for my confusion :D

> Thanks,
> Mauro

