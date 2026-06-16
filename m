Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088313F88BE;
	Tue, 16 Jun 2026 23:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652978; cv=fail; b=q48jugQnu5pkBFMXICKx62AmwMH7pfuVa4V8hcANDbVfj/uWhXRfr75hvHRMxwkSjkKTNPx7r7AbIPA2gO92joIdsDoQM2TspSKEGREJDzzB3aZWmV04xY5dIWJ0HOPGosXjFIxQOaWRIHkFyXDO2PjDrUstsrPdaV3aEDFuQtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652978; c=relaxed/simple;
	bh=PA0aWxDQtpVSppkwP6XptZDYvycW8ov+0MCzEP4/e4U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mSjoOHMKWQqnHqURktPChUa8IURMkDQN7QZrKnnM3x6yWyZO01vFPB9PKCu4K6laA9yiBExx4FdMeqJNtIozLZUyTlDi/JrtxZVkwzlGfTamLxKUpQAYHkTO3Fj827Va4zKv3Eb2TcneovHVAdK8bK5gEvtaeuVc2HFFIyBTuhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7XLdbuy; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7XLdbuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781652976; x=1813188976;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PA0aWxDQtpVSppkwP6XptZDYvycW8ov+0MCzEP4/e4U=;
  b=T7XLdbuykDEDV8UOo98Qbn0xdwc/WlET+Qvs3ULkyTiaxu3ZUVpIW59b
   r0AWJF/YmVfBP+yRQeKYQMiER2y9wju/gUQg6nO5J5+ABRlzCKG0uunER
   pMNXyABqlp7AO5CJnJ5eeMlqAnhJO5mXOEo4sopaBn8MQtJqxQGYlZ8Iq
   OXZbDSh4Rs0CdfSHZTZOnt/omNH5u7D9obifaJmBAAmKDfzRMhkDMkXYF
   TA2lytkpO2mPadCn0n7HKsxEp4HqGZF7vgNMQ4DikpIfuli74J/V72oNN
   gnV3M1+SYz51Bu0cfeuAh1Wg6XKOjlqKOOLGhKDI8oDg5JAosLk4Zhfx7
   Q==;
X-CSE-ConnectionGUID: 5a5ZmAcLT3+/+YW/z1Bklw==
X-CSE-MsgGUID: UrUqwPY6QwSDdjK6DXj0Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82517580"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82517580"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:36:15 -0700
X-CSE-ConnectionGUID: qf74XTf6Te+qgQJ2ZsbyRw==
X-CSE-MsgGUID: 0sc+SOaiSEqxk3CV4gFs7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="271622091"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:36:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:36:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:36:14 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXqeEu/7lAh7XSNXng7bexEGMSUSEsNePTrobmj7zQVlc5D/YkyOOY0Wvflety3YOZkFoslxBPrBRCUIDnrwr04pdMGhrzfpxEb8BPlsCSq1koi3eUzXe2Zvsvx+hDE4eLNjALxXMi3G/pOQJpY8cG/JyIAvSJm8CuvIu226XhaZYu336c6DKQKJvgjB0JOOtTwGO3k6B0/oj3GszXUODrfMnuFYJTZHUR6/LkDecpf/6CoAOMOHelmX1B1qZMyfx/CvSZ74+2eL0nSiy7zocRjt5nES+JRgs6ZxqGfHTAH2hIM7Z7mdTf+L4QIbhrZeZ3V11oQXbLaXNwvCrgdo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGWD4FraroWxYENDGC/Vqr3fKFEi0YEpTVyahhieK20=;
 b=hyvKAl+PzYHOyGaO93GiXqVOz94s1Lluq0id7cbAW3BjAi73j/RLd+1L5zWTAF4Ffh2TVz/NOQqAjZ7xOFv6B4fsLO6ET7lddcUBSsxUd0Yis66dqjIp9ioxYDA8Yc7tTobchDnAQRtoJsNBo1lhU9leSCcYVJsy6rJry4JmsPglaogNVSInrnHMPkJuXhJ9hSalw7kDvqTdTmS0ooz+BrHPCsbzRNC0r3UOFjXD+/jL0gdQkxLIGHb2o2Wx1cjSJqnWASJfEU6871+OXYfGRGhquJBIHX2LAy/RzXB+XT8Fymk8GCISmB/wtrLErzkHrXLgQpuPrxFBTcs/RaSYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:36:06 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Tue, 16 Jun 2026
 23:36:04 +0000
Message-ID: <ffa4f5c5-9512-41fc-9354-803a182a85cd@intel.com>
Date: Tue, 16 Jun 2026 16:36:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] fs/resctrl: Initialize the global kernel-mode
 policy at subsystem init
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <38f794ae4076a3c118e8eda08ae2bc1e69eba979.1777591497.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <38f794ae4076a3c118e8eda08ae2bc1e69eba979.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFBC9025319:EE_
X-MS-Office365-Filtering-Correlation-Id: 848398d1-d2ab-43bd-3c23-08decc00084d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nPjfB/nSKxf6qFAHCnYeFy9H+2KPqm5YfqhmbCDuWoqhqNC8vAEpaT7Em8tjq4TuT70/fWvE7BnPrjCN8srx9GSI+sc80tcWfMW33h8Xgc20Px9+c2RGdpKmXPXHoSaFlnJn9i2IzTidfcOiKOiQSF+8cHdqEegw3gz2aKWCVbuK6hlodhXrrMKDnrRhnzEomMwi9Bixwu9udmPLJY+KPK8ZhC1IbGxFWRMZw3hhd9+5/fhxe+numBXgD1Oti3yA6HdJR1t/XAHvfQ25VanZCFM4bN4vcQhgWsg0njn063XhtIs2PlW5Y2vzV+BwxtZ6lPDTufaWoVLJ+Th0/r9unNdJu0CuWHMuEVwAdWC9qXJOMScspn6r7JysuZGoiEUMRTSNCroYHTG9N0aZuFlLQ8oPAo8sSgafBGNJuqQw1VC7o0WqtLDJ1LfnVx8gIzFfP8uUgzgv8T6zQQIhB3rYnqRIWV4gFnUXUQJ03aOdBPcyYTeRE/lsC5IF0KDtgdpEFvrtxzXnCw8o9odcoSlk8AGZlQBuZUoN9358EKfhVQCLSP/0E46/BB3oeEbKjP9mgVA8MoVKSWZXJnwyy3QOC83YpcVTgbitzeqeYjBxn8cqo8LsJpBe6Etwzd8t/xvaV+eRKc6qlIdWei8Ra5jxlLekvg6QgskcWd11yp3sQLjIPNnc/4VrC8/0hOuT0+Hg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akQxWkNzdnRzOUltc2kyOVFRY09kdG5EL3FjUFpQZE9yM3JCNTFNTWRPSVhZ?=
 =?utf-8?B?SFVwTml1cERoaW9NQnRDTTUvQTYxaU9HY0drQWxseHNiL240cHZKU24vb2Z6?=
 =?utf-8?B?ZmpxSGZJeXFyR1hNc0lZRk0rSk42TFBpZEl0Ty85anVIaDg5c3BMWnRNUVpO?=
 =?utf-8?B?VThDU3UzanQ4R04wVGNuQVM2SDlEenVPT1U5cWVFU1BrcEJlUDFNYk5WTGtV?=
 =?utf-8?B?S0xleUxMbkY5THkvbDZmVVJjdS9SZE96VWNMUk5hQWRNeVExZFhONDZISnho?=
 =?utf-8?B?YW1WQk52Y2Y1RmhjclNsTkRiN1NXWk5KckpQR3hrNjV6dmFnYTY4aEJDVUI2?=
 =?utf-8?B?SUsrTmxoaEhUNTNneHI3eCswcjkvd2krWExndTEwN2xnL0VUYXhjS0xML0d0?=
 =?utf-8?B?Z2Ixcng4WGVwSHdsb3IrTTJ1ZFZ4am5oRkJJQXpoM0JIRDd1NGV6TTVveEdB?=
 =?utf-8?B?NURoVnlCTVJ5am9BOU52UDVFbGUyelMwYldHTUpKR1FwTXo0Y0xSdkJnS08z?=
 =?utf-8?B?UkdCbXdDbFdqcko2UzdZdk1zaC9UNnZpQjU0cjJTaWx5bjJKMm41cjNBOGpW?=
 =?utf-8?B?cjYvMEk4L3BJSjNyV1RiK0dtd3l1NDFUaE5tMERsdGM3MXVaZkJGS01JN0N2?=
 =?utf-8?B?c1hnVnM3N21CSGorM3ZjOFBzeHhMbXp0Z2dXV0FpS2pDbmVqcWwrUXk1c0g3?=
 =?utf-8?B?WEJjZmZ0b1pBNzNvMENYVTgveDgzaW5JYnYrbFNaTmlHOHdXZ0QySnNWVlYz?=
 =?utf-8?B?Ymk3RmlFakxkbEFEU05jNFdoRU1qOStHMW40WXNmZUtaN2J3MjFWd2VFdlVO?=
 =?utf-8?B?SlVra1oxWUl3QURXZ3Z0T0R0aVVjYlBqV2RIVWRUZythcFdwSHRYTldXMlBU?=
 =?utf-8?B?RkZTWEkxc2FyckZhbjZWYllKeHkrK1o1NWkwK0JRQkxMVUhjekNqWXM2QWZH?=
 =?utf-8?B?VUUwcVplWVNTL2toRHUrdUVhalVaOFB3K1czRjNBVFNIRmUyd0kvWDlETUFP?=
 =?utf-8?B?UDFoVVI0MDY2RWNjZjNNUFVhMm15TDYvcTRzbklPRkdWeFJNRXJ5VWR5MHlo?=
 =?utf-8?B?NUNEeWZ5UUxHb3pBcVNSc242R2JtaEI4WkxkdFBUL0xjTXNBc2xiMFdMY3M2?=
 =?utf-8?B?czVYb2h5bzh6Ynk3d2xJYTkyRWJvTHMzblNNNWRLVENZN2xqeFA0cHNpZ25H?=
 =?utf-8?B?VUxYeWJaVUV0VGQ2M0FPbnkzOU9zUE9SRmxZWnViS25jRTlZTXVscHZLcU4w?=
 =?utf-8?B?MHdDdU93YXc3OVNzbFd1SFp1MVhXV3ErOFV0WGR0UWlQTlVKZXE2OVRxSXJO?=
 =?utf-8?B?YUxIT2RENFhtNG5pZ1UrKy90LzJHU2YzdVJnS2twTEJDUXI4WFk5Z3dHMkpL?=
 =?utf-8?B?UWtHdUZRVGF6WnU1WENBWE03STN4SG9tVC9DZzdrM1ora1ZGTGs5L0ptTzZV?=
 =?utf-8?B?Qk5CSDFjVGtPYXlSeEJ0SnUvRVR1ZVROandnbmJydDJjVXg0TTIxL0JFVmpy?=
 =?utf-8?B?K1BreEJoT1dncmpqbGJGYmcvZU9LL2dOTFdXV2JEOG1mM3JMZjBUdXd1ekFu?=
 =?utf-8?B?YWZMRDRhN0Rndk1NS0lLVThlOHE5UCtDckM3eEZKTWZrRGd1S3RZQUlNVWll?=
 =?utf-8?B?N2ZLVVFjYWhLemNZZ3BBZ0o0eHJENEJLaUkyNWE4SlUxYUhFSGYvUGxzcnBy?=
 =?utf-8?B?NzQ5aXFIQUdHaUZFNU9ydkZUWDYzLzkwd0dSMHRxdHRHM1ZyUkdFdGRIRHJa?=
 =?utf-8?B?WGo3K29pYlJGTzJvVjUwVWtDdXJPb2Z4OXM1dElMV01zbHE3VnlxUzZ5bzMw?=
 =?utf-8?B?cU5kUVpOQkcxdTdHc2Jjdmw3RmRubUE3WC90Z1kySVRoRW9SbkpYcDh4Z3Q3?=
 =?utf-8?B?cWx1YVBsSFpTOTFNQ2owck9XTGp3SHpibHZ6SmJiMHVOVDd4L2JYVXlrREVL?=
 =?utf-8?B?WkdieFZUQU5SYzdzcVA1WnRKdFBod3hkREZ3S3VObjhEc1hvelJBRmY1S2Va?=
 =?utf-8?B?Z1prb1EyWG9YTW9kMG1IdG9OMXYzN1psL1V4T0tNSmJUaE92cC9XNDR4NUx1?=
 =?utf-8?B?aWFxOHRDZitZaXltUUZ0WEZHaGJ5cnY4ZFNFM3RoY2lpd1d0NDdMZzVqQkFG?=
 =?utf-8?B?T0laZVRZamZ2b00yL2dFRVdEUnNJaVRWZzZ2Y096UHlXRW0rNlhuZDNaVGtj?=
 =?utf-8?B?NURDeFVMRFRkYkVnVU14dUlHMVhwVXU3RldkU0pRd3hQUFc5Q1FWVlBzOWhH?=
 =?utf-8?B?Z3MrSSs1UHNKdXZsMU1GQ2JhS1Uwd2FzbzNWZGxjVE1vdFFyMEVWR0w4TnBD?=
 =?utf-8?B?Y3NUaFFCSFJMT2VQV3RzSmJ4RGFyS2taWjhneEZXRHRVWnNBZFJIRklmTlNQ?=
 =?utf-8?Q?90fdQPywEEdhqc7Y=3D?=
X-Exchange-RoutingPolicyChecked: nt1z1n4LFTOJl3WPpepfVxOpQRoTnDXR0ZHCljqGGRELW5kWaa38tlhppLzpiCziQZ4f1ejRjWyy3ilNhuecq2f1RpewA3KhXw1p1A8N81Um65IIhnhXxxzh+fTSg80c9sWW4pDw1PgHIe6ECTFnCT5vKZiT+ey3I20W/PemcPT8qX6AhUmb9PCD5B7Kq0vtlu06R87n5ZivqIWBscvv8KXbbh4AVmA3vyFqL0p/kaeDykGOeEPEnafQ6MPHsS5i0qctb/KEtMnqi8pt6Sg/0/v280zGTPb8zJchUz7BbX6bdHPOsmMOyCeeCij1cZf9a2lsc/m057KTMjoWxHPIdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 848398d1-d2ab-43bd-3c23-08decc00084d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:36:04.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR0e17QrUnnfA7zBgdRjYVx5k+hh2FBcLIOFTyuf5+QJYSlF70YCIhVVAUjI94RkrfeXR8uNN0KKTYgPh6KtWGa4kySUUjbpgrqIOOPtqsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> kernel_mode feature needs to add the interface that lets user space
> choose between INHERIT_CTRL_AND_MON, GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU
> and GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU.  Both the generic resctrl
> code and the architecture layer need a single shared snapshot of the
> supported and effective policy plus the resource group that backs the
> global-assign modes; that snapshot is struct resctrl_kmode_cfg.

This does not seem to match implementation since this implementation does
not actually share struct resctrl_kmode_cfg as described above. Only 
resctrl_arch_get_kmode_support() exchanges this struct between fs and
arch and as already mentioned that usage looks unnecessary. The other
arch/fs touch points use either individual members or their properties
(like closid/rmid).

As described in response to previous patch I think this can be simplified
while also making it more robust.

> 
> Add the file-local resctrl_kcfg and a helper resctrl_kmode_init() that:
> 
>   - Adds kmode and kmode_cur with BIT(INHERIT_CTRL_AND_MON), the
>     universally supported mode and today's behaviour;
>   - points k_rdtgrp at rdtgroup_default so global-assign modes have a
>     valid backing group from boot;

If the default mode is INHERIT_CTRL_AND_MON then should the default group
not be NULL?

>   - calls resctrl_arch_get_kmode_support() so each architecture ORs
>     BIT(<mode>) into kmode for the policies its hardware supports
>     (on x86, AMD PLZA contributes the two global-assign modes).
> 
> resctrl_kmode_init() runs from resctrl_init() once the default group

resctrl_kmode_init() can be dropped after changes described in response
to previous patch. Apart from no longer being necessary I also find that
having the kernel mode fully initialized *before* the hotplug handlers run
to be simpler.

> has been set up.  No user-visible behaviour changes yet; later patches

(drop "later patches ...")

> expose kmode_cur via sysfs and act on changes.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>


Reinette
