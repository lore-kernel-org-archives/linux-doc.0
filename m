Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608411713
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 03:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750907444; cv=fail; b=KffpRJ3ZYyXbs+2fTlY3CrTJLogOtt2n7rX3IsFHhWVmFXPO8jq5Hs21KLdVXdpiqwRK55vhxOIqMh7Ml4UDxflcE3i/FQsMu+SnbYMbpLkqNovOdCKBIMUy6LyWu9IniYpgarpwkMLt380DPl3gQytiIV3IzaW47r6CocUM53I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750907444; c=relaxed/simple;
	bh=gtoIhFuf6vlsL0CvhnCOEeSMfUktZL3showF1mvTNdk=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=KeHeHtoacFOVnC0k08esJM5/xYd+tC+8gb7I479W74ClHGqp9wxvZqKstygNmPDYWaOZyy40Z0/jLMW983K/YkxbjbF85OISIJsBpOqUwPvlM/bZfML7sp7sizf1TNhUtOwIg7AuEHzMPRUw4Pr4kC6aFb+Vx8mNcPA/RIttcbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/H1KvVU; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/H1KvVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750907443; x=1782443443;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=gtoIhFuf6vlsL0CvhnCOEeSMfUktZL3showF1mvTNdk=;
  b=l/H1KvVUDeYdNp4DY0KUJGk60/q3id90kW+M10XouZ1cf3/UTyWzrVNI
   LfZswm7615eMNl+i2YozMQTG6oBYy789OfmVtF930wwmXbZnltN2BD1xO
   wdHsDRUVmVZYVGhrtWOKj53t7sYdSAXvZMSmL6rLjnUD3BfV+uLyoch13
   MuOW0v9wvfg4y8ozKs9BlDNDc4KM5Wb103hN8WHGEHoKRK/sCh9V/yV3L
   BzILtlfufQpo8GQC5C8Ixu6+rVFvNrSYVwP7apakzkwLsZ/q2HC0AL24U
   hnFoQkGfqeYI6Nq82JXQBe9AKyvmXaqMEADkWcax40wvYncg6H+doKw91
   g==;
X-CSE-ConnectionGUID: COn9Qt9TROOTx2pvsJYtyQ==
X-CSE-MsgGUID: zQAdKs+4SVGwqI4/XjDSnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63450151"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="63450151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 20:10:43 -0700
X-CSE-ConnectionGUID: kKIe77O2RMiswRWLxVzevw==
X-CSE-MsgGUID: tdgFW8O0SBCpK9g+/aANKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="156782682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 20:10:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:10:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 20:10:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiC83Tx4TFJpHsVHfopMYEwk0ukrBlgdzypbNAiS5WWznp2I10AoDWmYB88b+WNiK3EZo/llHfr4seEhRMm4/3dZfEIlqj0RzbLVW/XxsjDVYZbYFe5SViOJcnqZKGFXkCwzgnbE0Ox7nVuIIN0q8IUxfn/PthbMf+roA3glunf4iPkQQbHGoxWgfv7KuKB/gisXQe84X+q3dBrMIAkuCIYVi9E8yOxC+fpYC1dfByJROa8v2snsuD1cOryJYX7bpv5PmbxM6P0GBuWRZgSfHyyJi9CYj53G360cPiZBgN49SInRbDlGBpD0QkoS8c5e1w3tHg598UvSHm2MFixYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWCPH7k1jp6PrDEIB5GnXpmTROcruE7pGy7gBd4zo24=;
 b=vlNRUtptYBWUyaeaBlMfCXydmcBY9DByRi0FsUPqJ5/A5PWWb+6zMw3KN927hvUxNhZZqy0fqsxj5HEKFa9cDz8xooqCphPZak5E0volWG46SqYA5NpVq9CFfnK9JLAIRHBF1sFge2MYIzEfhbleW/timN+4fpAEbnELYYPtjuzME/UGlwsrj318jdlHCw9ejBcZxUFUw1ypjsU2xB8co1gZNpFMcU9IGjb70gtq1cQ1Drtz8w9pkXCAtuyLWI6QMCh7Noj8+go2jPuG/F86mLEfk15AeNt/7DiEzgfAmipCCKVHdZBIwZEuQw40D3uP98zMk05DXyLTKsqKHnCKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 03:10:24 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 03:10:23 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 25 Jun 2025 20:10:20 -0700
To: <alison.schofield@intel.com>, Jonathan Corbet <corbet@lwn.net>,
	<linux-doc@vger.kernel.org>
CC: Alison Schofield <alison.schofield@intel.com>, Dan Williams
	<dan.j.williams@intel.com>
Message-ID: <685cba1cc427b_1608bd1001b@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <20250626024101.792073-1-alison.schofield@intel.com>
References: <20250626024101.792073-1-alison.schofield@intel.com>
Subject: Re: [PATCH] docs: ABI: make the KernelVersion field optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 300703a3-a458-4eeb-855c-08ddb45efd54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEUyVWVJbmIxVGFDVTkyaVpvTnFIZC9SdEJoRVdwb2ovdndwbG10TVYrSU9F?=
 =?utf-8?B?dkZUT05uY0lJSXdwNHl2MGY4TEFvcVpocFNlQXk0U0RLcEhqZ2UwOHZWcUV6?=
 =?utf-8?B?YWhFczcvK1lTUkVGY0FwUklzaDgrTHl6N0dNb0dlbUxMM1laVVNFSXVCNk5P?=
 =?utf-8?B?MmVQQWtwQnBmei93MGxieWRQZXUyeHAzMTN5eE9FWDVrWTZudDBMN2s0TnBV?=
 =?utf-8?B?akp2ZHN2R0U4R1AyRExzdk1tRHd2d3B5ellXL001ZVFkdXBtWFhweXp0dUU3?=
 =?utf-8?B?eXg4ZXBsbTFLUGlXRXAybWZ5MmRMMUYxT3k0NGVVWXdKN0o0eHZ3V1EyQlVY?=
 =?utf-8?B?eUhwL2NCVktiayt6MWR5S1Bta1hST3hjQlUxcmt2cnpOOE1iREZrc3p1b1Az?=
 =?utf-8?B?VlNiQk5HV1RkK0tjaGpWbTZzTERoRkQxT0RkYUdqNjFqUDdCeUY3TG1Lb3Na?=
 =?utf-8?B?MjdsZTlITjVRZlFyVUVCTk85RFdHc1JvWUdCWDVjYk5Wc2FyT3R3QktEQ0hR?=
 =?utf-8?B?L0xKb2dvUGNxd2hkQW9pMlR5VnlXamZET0dJRit4Tys0RFYvS1JGQXhTb0wx?=
 =?utf-8?B?RWNlTEczbU05VmhnOFVoNnoxZWxheEN5Q0JRekdpcytsNFZmVXhpWWxwQ0E1?=
 =?utf-8?B?UFpwYmxtMUJwYzZhVnh3T3ZPTHVPNkwyQXAwUWp6SjBxTVozdjBpQ0ZCWlZz?=
 =?utf-8?B?L0FPMCtrTHVPUW9aa3dPYklzQ0V5QlFPNXVRMHZNdEZaOExXSGt4MmptbmY0?=
 =?utf-8?B?ZkMxMnVIRzV4OWY0ZTFmMi9ncFd3TnRraGY2T3orTzJTck9salA4RlJycFVC?=
 =?utf-8?B?RmRuRWdwZk50QVFFYjJrQzVLYnN0bnhoUGNiUHRza0pEMTlFVGxodEQxS2VV?=
 =?utf-8?B?NFVNb1Nvd2RxblAxb2liRHNjOWtIemx1TFdCUnNLWWgxd29STHBBUjFSanZX?=
 =?utf-8?B?eDAzQUJTNnRub3h3R3REL0JUMXBJL093L3RUY2dKaHVWSnNRQ1o5dWFJei9T?=
 =?utf-8?B?R1VXZ2lpRFFwd0FxdGVZS3BpejlSK3k3S0ZlZUNMaWE2WjRqc3dtbnZObkh2?=
 =?utf-8?B?c0tOM1ZaWlc0ZWRlKytSR1FzZ1VRMUVXTUpyVnBJUkZDaGxzdExrSit2dVdu?=
 =?utf-8?B?RkxGdU9Bbk9jT1A1RHFsQ1k2S1Z0enphNmNoc2tucjRxVERaT2dvM1NkSURY?=
 =?utf-8?B?M0R1T05lUnBQK2MwcFJEckFoenVEb1V5WU8zQkRnci90RU11ZFIrWEt2Ty9s?=
 =?utf-8?B?K1FFc1JNSGpROTVFSG50K0VWRGs4cGFzMWdwZjRWb0ZvdXVSSm5mM0pwVVYy?=
 =?utf-8?B?RVgyQkVndyswWDVlMGpUVGN3SzQ3SXREcjZXaWhwM2ZVcy9GZDFzK3Z2QXBJ?=
 =?utf-8?B?d0hpODJFSXR2N3BYZnVhbWtONk05RHpMR1oyeUJLT1BxZjlKcnRtWHczaFlj?=
 =?utf-8?B?VWdoWnRPaVZONnREMTdLbHB3ZGJxMEVWS0hWTTZ2b2k1MGVWRUNaUm9MVUxl?=
 =?utf-8?B?emVxVkJleURtVmc0QVd3SDNpMlVZOWMzUVQ5L2pmbEEvaWtoaEdocnFLSC9B?=
 =?utf-8?B?c3VjdnkzTTJ6MWZlNDZvUUVkOWtJQmlmSG1LK1R5b1hjWk1wWlFzUXhNbXdj?=
 =?utf-8?B?NlY4dlB3cXAxeURQSlk1N3FLNVpIUVNTUVhzRFQyeGlaNTUwbnV6RmJINW1C?=
 =?utf-8?B?cFYzcmVQZnpWTmFqRFVraUxnT25yUjlDVlZ5S1A0UUtYcVY0ZkVQMTJzVXJQ?=
 =?utf-8?B?Zm9ZcEN1dG1XR3FZeXFCNzdyMldaWTBRcENNcUFLR09zMXorN0Q2Wi93Vlo4?=
 =?utf-8?B?WG1kaElLTDA1VmtzWjFSSjJNa3pGaTdTYWVOQTZTY3ZtN1c3WWhrcVJwMkN0?=
 =?utf-8?B?TTcxTFBCTStaMG8zcnF6K1BzTjBtN3RFK2tJWllidlN3NU5TY1Qwc3FwMUty?=
 =?utf-8?Q?mzs+j6ByI6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzlNWUxOT2hsd2kwRytDdGlqN0Z6ZUo3Tm1CbHNhc0psSUZ1LzUxVSs1aWl3?=
 =?utf-8?B?M0djZEdQL0lkTGJHdE5RZElmSUJ4bnQzbFp4Rk9IWTFzWUptUm5RZm0yRnBk?=
 =?utf-8?B?bkdNWVJxcU5HU0ZQbzFwZEhKNmt4RkZPNmZTMjM4dkZReHlrU2ZuRzdDVkJy?=
 =?utf-8?B?MUFZQnFsSHdQbW9YT211VUpsdDFGbUJQS1c1RWhaaEUvZEFvREZ3ZlZJQmxm?=
 =?utf-8?B?L3dFaGQrZ3U3MkFQT1hnQ0s1R0JCdnJIeEpwTEh2QUNZRDdSbW1qNDMyMWlh?=
 =?utf-8?B?RnpOUE1kLy82S0FIV0t3Y0F1N2FzZEo5N0owd1hNSHc2N0dPc25MOHdlMkJz?=
 =?utf-8?B?WUQxcWJ6Mm1uSmJOd1dQMGdXYzJ4Z0l3dFdVc1hhVXk0VG9VUStWdStxM2ky?=
 =?utf-8?B?OENyM0s4WFgyVDE5bkk5ZVV2azdOdjdqNHhxSHJBb2p1bUR5QjNjQ2VIbnNM?=
 =?utf-8?B?MERSelZSRGtwa2IrbFRUUDZvUE1hMlJ5b05iVGkvWEJLcHJCSW5Kd0RCWi8w?=
 =?utf-8?B?cVQ1WmdnelVSamh1QjZ2MWp0YWdLYWxVMUxRQ3RFOG0weVZCVUVNSm12WHdh?=
 =?utf-8?B?eS9DQnU1d3VhVHFUL0JkV1NhOXZyeTh2dDFXOWpqR0RYN1I2c2xjVFNITGpj?=
 =?utf-8?B?aHlqOGxESVZHMlpUTGJGWUlhODZCT1E1eC9qY0pSekdYeCs4K2lKSXJBNVFN?=
 =?utf-8?B?K0pPMFFlQ0toOUtxeXI0YU9kQUhncWdJWXhxeXRvK05Vcks0WEswZ3c5SFVT?=
 =?utf-8?B?TE1EYWoxbThPUFFQc09QNTJBek5nTjVQRUZrQngyTlNSQUZBbGpjV2ExdzRo?=
 =?utf-8?B?ZXRkL1hQblJSTVlZWVNFcXhqaWlFeEYzWHg2NnFZaTNyWGh5Ylg0Qy9aUEFR?=
 =?utf-8?B?QmRUWTdFOGM2c2w0aGVLOFhBc1dWMWR4MmhzNm9KeWRpQ0tlaTYvZmxUbUJ0?=
 =?utf-8?B?aUZOU2ZmZUU3ZzRaczRaUVpZSzhJSGI2NWFvaDVLcDUzUklCYm40UzZPOHBn?=
 =?utf-8?B?R21EazFVa0NtOGgwakk5SCtoQ3JyTjQ3UitITUEzc0doS2RJSHFML0JqTTAy?=
 =?utf-8?B?eXlzSk9qV1Vsd29US0VXazlhMHVmZHB5dytuNjhTVXdWVS8zT1BieG9OVnk5?=
 =?utf-8?B?V2tJZ3hReUxjcEs5N2hCN2ZiT1ZRaTd5NEUveXp1SWRFMVkreklocS8yVW96?=
 =?utf-8?B?bk1TUUJyWFJpdTVaVlJkWGxqWGpXRXB5SDNMQnZ2TzczYzBaeFhoakYxTzlI?=
 =?utf-8?B?ZVczcW5lRnlYUEJhcmlFWE5CVkIxM3BqYXdXWGRhRVBLWFAwNUd4bnUvNFo3?=
 =?utf-8?B?UFFOaVhrQlEzemJ4ekRua0h3ZmRzMm5ZOUFmVUhTMkdWYzAyYUpBUkx4aUV1?=
 =?utf-8?B?QmFlRDBsS3hrME1EekFZZW1nRTZxTHM4QXdKM253ZXYvb3ZvN25nOVFnRnRK?=
 =?utf-8?B?b25KNnRpMUZVMzFyTTFQaTJaU1dsc3VGMDZiUm5yVG1sSHUwSzMrb2Rxa211?=
 =?utf-8?B?N2toSUtzbUNkR1RKTGJaeTVmeW4ydXhXTDNXaHphVk1hVTlLQkFSSlBUeGJN?=
 =?utf-8?B?aEg3OE5hcEg0RTVjNkJSV3hjK3lkVW9CUTZqbStDK1FqL2xpMzRmMzJuaWpp?=
 =?utf-8?B?OTBrZ1F4eXhuUStGd05JTWNYZGc0TTFhMktHTWhBZ1QvNUE0clZmVTN4RS9E?=
 =?utf-8?B?aFg3cUM3K0JjbjhwZ0JlYm4zcFVONDBQVXpXR3V0THI2aVcrTVZPVjgyc3BE?=
 =?utf-8?B?Z3h2UkhTVVl6QlVLOVJIdG40QzZmS25DYTV5eE42MG5mcHFlT0hqUkZpTndJ?=
 =?utf-8?B?eEdaaGdVcUlCWUVhbmhnR3hRdFpMcGRjQTJtMUlST1ZFN0M2TXJ1b3dERWJB?=
 =?utf-8?B?aUdqZVJmQUNKTjQ3eTZoNWdyN2pldlpIOWgxQVgwM3RENEUrZWk1TjZaaWR6?=
 =?utf-8?B?a3BvWVdvdW1sN05lQkdNeEJ2cXBQU3UwcDBQdEtIMXpHN2M1L3hVYnpJb2FW?=
 =?utf-8?B?QWVTdytmVTBFc3JlcmFmN21lV0tET21LYkd0eVc0eCtTQW5TK2xWYWpiTitI?=
 =?utf-8?B?R2VvbEhqWTQzdHc4MkpKQXhsRUNnVE8rb1NwcllpemZsbHFKV2dML29jbG1a?=
 =?utf-8?B?NSttOFVFYW5meW9WMWFKOUhybkxnQk5vbzZxMExGZkVZZVcwTnlmNjBqOGNZ?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 300703a3-a458-4eeb-855c-08ddb45efd54
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:10:22.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQcuLPxZ+53CPOvxZMIiiMAAR/mmTtdTLk/ffOtkYbBuLkaQ1s/ff114W8ox/aFGSlDZDMEm4qQ1j9mGfFGfZv8JgM6o66/Z/lb9onXcXJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
X-OriginatorOrg: intel.com

alison.schofield@ wrote:
> From: Alison Schofield <alison.schofield@intel.com>
> 
> The KernelVersion field has limited practical value. Git history
> provides more accurate tracking of when features were introduced
> and target kernel versions often change during development and
> merge.
> 
> Label it optional.
> 
> Signed-off-by: Alison Schofield <alison.schofield@intel.com>

I gave this feedback as a review comment and support this.

Acked-by: Dan Williams <dan.j.williams@intel.com>

However, this document is quite old and, for example, says about
"Users:":

    "This is very important for interfaces in the 'testing' stage,"

The Users: tag only appears in 49 out of the 564 testing/ files.

Moreover, the testing/ stable/ distinction has lost meaning over time.

So, yes, marking KernelVersion: as explicitly optional is maybe an
improvement, but there are wider issues here, and leaving well enough
alone is also a reasonable outcome in that light.

> ---
> 
> Plan B is to remove the field entirely. 

I do not want to motivate a slew of "cleanup" patches removing it from
other files, so "optional" makes sense.

I think What: and Description: are mandatory, everything else is
optional and maybe note that an ABI is "stable" the moment it is in a
released kernel and a real world use case starts depending on it.

The pain of removing or renaming the stable/ and testing/ directories is
probably not worth it given the potential to break links that people
have to these Documentation files.
