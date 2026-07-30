Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E13A9D9B;
	Thu, 30 Jul 2026 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444037; cv=fail; b=svqf4v0w1dc5cMo1M14yQkgTyYxZPLpQxKbOhNz9F6RT8jq69PL289ZHyaCNqjCgyel9pZtKmyZtI1e8Gh6aK7qnfSSVrTn/s5SSLUccp61uS4xsqUdGZ8rVaZDBDdyBV7dS5vpndPuaQHlaxyf6Ju7v0MbEybYhmnQAK5pZm6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444037; c=relaxed/simple;
	bh=+JauOTv9ck8z5Wx7EefOJxz+NJMajm8A1i8GU2H2b7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tOnliTqE4l1zLtfDrPy/4PwEXM3Tk6a5k+F3Sc6pCm0rbYuRVAZ4CWqMrsXKTqWF2xHyRKdYkZL6Ni2jf7HXl36Ef+KhwmHpzWM4mPjMcVUENhLbC5fYcwvSC7+99Cnsahtyz2Y/cBUjkI0Tl6XhRAiUMDkmwu7t7RBTXDPxtig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyrcWg3F; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyrcWg3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785444035; x=1816980035;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+JauOTv9ck8z5Wx7EefOJxz+NJMajm8A1i8GU2H2b7M=;
  b=cyrcWg3FqkXOSj80mY2OGuQUb3lcNs0ZRefyhTbAOH2Hnu0RZWXaYaL2
   UoRv71EFdJCOHQTo2MLRYsWZaWE6Deexmo+0J2nEryGbKdpTBsq6GmDVB
   2NbKFkklntjCB7aqXFNezHigsR18JeoGbI8sVK7FuMovYT7PEgtNjMhwk
   oPHIbxc5qmbxfd5eU+oIw5EiM+Umg9ioDFyHpiEYWwViZ2GrcAaemUOh4
   R5+kOkp60Yhyx2npRDoSHvL2C3iyh9yY1b8fnblK6Kq2Orw9XLnLRFYSI
   rV5YWg2Ptgou18iSnnH5pV96wDfaQnMrNqJSLZFT5Mx/vlC1/QwI5gwDV
   Q==;
X-CSE-ConnectionGUID: jRLBJaK9R5apbHEBgCAluQ==
X-CSE-MsgGUID: 6JEBq3f6SGKusoJHz5Cutw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96432769"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="96432769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 13:40:34 -0700
X-CSE-ConnectionGUID: oWZa4EiVQO6MugAyHWDUzw==
X-CSE-MsgGUID: IV17YaUmQ0mlteXK/OO1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257050961"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 13:40:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 13:40:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 13:40:33 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 13:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeJ5SBf9mD2cf+eR7qkOOpL7kDPmVWaqfLjafDE19Y/SnEfN50i8rSx71GFNnwkWXuVKtgdhRghXqfUoj9Y7pQ0hu2T51CQSI7QbelLDnCQ2EaAgEfpMciJspQxfifahjOi5PrUi1Am1c5CZfQLmpWxRyRgkzJqktcQ7s4AKHhot+ULXZCYGRsJLJBbrQEohgWjpTL6W6ZrkcM9hgBnWjwmUekfKUftnpqg1OKdgZOwlwnm3YWcVnRIz2m03w7a9sN4lUrlrU43amda8rzaQ642yl7Dqd5lKG6KsuB5TT+ICfp+N4WkIQwmC0PkPIjNyacvO2GWd8Xanf0xy434V0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JauOTv9ck8z5Wx7EefOJxz+NJMajm8A1i8GU2H2b7M=;
 b=gsEg+NUTd6vEAYAtn0sTwHJ5QHMxirR3ZO9k6hAKQxsjwfZpAuPEzs0tIVmKyyWZ1rClBZKaQUZ6Q2jynb0YxWuP6szU6zl5+aZxIC2x4k3NAfgF5oFS5RvszpQyRcktHmRWHX91pYxeCuoNOEx5I7OMzS7Zz9rRPgYHYe0HflXIjWhdmKNMRjrhjpn+3imJ1PcARLMBwRyzd8chUMfQwoSwzJA/yMudpTQIDpI+Pbqp3J1fTzNojq0k2YofhDl91iIbFvXX7Bs5d2EJrKX3PVqWmFcgu8oZfP9ffvzxqApsQWC3s/KwPZgcZ2R4BLvMyVlam0WzTuMHwq1evkePoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 20:40:29 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0245.009; Thu, 30 Jul 2026
 20:40:29 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
CC: "Moger, Babu" <bmoger@amd.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Topic: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Index: AQHdHtxAj4YGLGgJr0yKZVW5LIjWgLaDgPwAgALovgCAAA7gAIAAARAAgAABkYCAAA3vcA==
Date: Thu, 30 Jul 2026 20:40:29 +0000
Message-ID: <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
In-Reply-To: <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CO1PR11MB4772:EE_
x-ms-office365-filtering-correlation-id: 69cce00d-a552-4160-d3a0-08deee7acaf6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|22082099003|18002099003|38070700021|3023799007|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: 8XJD9GV5b1bHKI3Fpfz0y1sUBkmhR9bo4bESfTOvivZlQzcN+iM09NQAaJ7cbJa2KCUZPAd4mo35jR0h5iTGFn0fwfi2ahUrQpBPqvyoOpPSszycGwqBeSR2xdS1cx6qhb8CI3OgoT1eHTwuhkk8Xv5ks277ADMinG8T34bKBR+IJZN4ovTRNwEGWpgvGZw0r5pwtapFIQIM4EyXPhrAAnHPW9AY6zC50y0v+P4kuIS8vkTPZkin85oRryiJ2Wpvt3wCSsxNUsWL/abrmizSARqFeGmEB03dqXYeG8CbAbNiNuDy1lpsmIRHTivqEybWJeqAemFv7N/jMUDgvFwum+PVHiQLRFhYcqjhhvteWE3v/9E1sffh7QY8J1VkMZjcB4ttACS/iH1ln8Xk5MP5rxtlNB3oNH/rfXb+eDJLGvWv1oYkmU9xbaHeHspulK84SWC2chjgETrX7ysnzeO3dt0Ros/LxrVz7HMiqZBaUkLJ4cR8J3TkyfRCw92QQKu8Ly/xyMIDAD4sd/JFZ2P542k7ogMxeG3SNLIwLFbrAIHI/9K4UMe0VemOkIBjlT9Kj8vlUU237KrHRISIkOj8K5+Y0zLz39PFGkw+D8wPU/KYkHKjq1q7QzaNyYqwmkRp4qQXtaOUAaAd/okS8LqFr0vnun+phrHF0jLdkIBDjzcDY+2Qr3F5oTsuNKok6UdgRDC0awEoM4Xhf9V2fBDP30bVZJ2HreZt/JQw4JSzPzw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(3023799007)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFc1NGpZS0Zqc01za2FGbmhlMlhFYUQxc1lWb3JybkdNWk9PMlVGWEkxMTcr?=
 =?utf-8?B?ajRlYWZBczVXVkR4OW5JSTZNdzBHVlBpaTRoQ3AycGZjMjBNRmo0QVR1L3FQ?=
 =?utf-8?B?OHFsazhxWDFmUjc5dVBIYUtpWEtaUEVESkdVcmlMeHdxcXN1ZFJ0aFY3UzZH?=
 =?utf-8?B?elVEMWFpT0NWbDdvZHRSaWFyWEVEM2FMaVppYnpQZmRwVGwyVHcxbG81QXoz?=
 =?utf-8?B?dG9BcTBFSkxVY04xMnc0d3g5WGtNSWoxRWFyeFh4WjdQNTNQVm4zMG9Xa2pV?=
 =?utf-8?B?TUxjVEhMeG9JKzh3QWF4MjJQcFhvSmpPZ1RSWGNRZmo0L1VVdzRncDJ2M01X?=
 =?utf-8?B?SjQ1MlJhNjNFMDdSaDZZK2lOR04vQm1qUTdTeTlEZTA5U3k5Y2RleHpkSVdi?=
 =?utf-8?B?cFJTbnJxTjRnSGpXcUE5N0pQYVhsU0thbng5QVljbTc3dmhBTENlZldQS0du?=
 =?utf-8?B?NFRHMEF6a3ZlRFZnNWZBSkxRU3M5YjlJZ2VORU1oNTluZnNVdzlmTzl4MkJJ?=
 =?utf-8?B?S0dMdGE5V004YXFKM2FzMUdnZzlRdElYVmFvZU5DVTBxSWdETVhCRWxKVm1Y?=
 =?utf-8?B?aFdqZW8xNmY4TWhZNVE0dGF2bGZZKzM2S0pCV3hPT0dPZkdUMjVqakEydEEx?=
 =?utf-8?B?R2xIYXhyVnZBWE1rZlRTRlNuMlZaeXVmRmh1NzU0UWZEMVVkeU9FOVpYMG9n?=
 =?utf-8?B?a0hHVG11TkpCVUhqdUdNdlZGTTJwTUlNRjdTeGluaEhmWHVuRWN4V3pUVHBr?=
 =?utf-8?B?ZHphcTM1TlBJRjI5cW5GdUpscjh1VmF0U1R0TGlOVjI5QjFtaVpSNCtIWUlC?=
 =?utf-8?B?NnpEZWdqOE1NclJtZ2pyT2N6UGpteXNLd2JCaFB4T2hMMlhnRGJNM0FyZW5u?=
 =?utf-8?B?dFZrQTVHK0tQcWZubXpyVk9NMUlvVDN4OWtBN3I1NGdhcUxRSGtuaGErMkhM?=
 =?utf-8?B?RHRPSVJFYkdGYXp0Vml5TERRSGU3TmJNL0dVZlRpZW1OZkNBTWdNWTBRUUtu?=
 =?utf-8?B?MUdiUFE1anpNY1NUekxnY2l4TmFtRG1ZcE1wcFo4dXhneWFZM1ZIYVFWdGVE?=
 =?utf-8?B?eXhVZmFVaHJzYXpYRGp3a29aNStPTC9tR1NXQmNRbHRNb1RxWDFWOUJ0U0Vr?=
 =?utf-8?B?Z09MaDhEWkdvS0FoYU16dld1N3NYY2VwMVdSQit0NkhyMXBKa2F0TU90MjRJ?=
 =?utf-8?B?VDZHT1ZscXdBdzFuNnN3bWp0dlNIRXJ1azlvSXRCMW02dXFCZ3c1bFJFQlkv?=
 =?utf-8?B?WDdxRzdKdmpMTmdnMjVQdnM2cUU3RUF5OElEZUpvOE9iVFZYYTQ4N1ZKVXlE?=
 =?utf-8?B?aG0xRUluUmNYYmE1SEZEdGQwNGZ4MUVKVEYyb0dSck8wYm03YlpHMERXSkJh?=
 =?utf-8?B?RW5GRmtPMDFOaXpkVG5RM2dwWG9CZUxxc2tWZUJOeXNIVVlVaHVQUkxlTXFo?=
 =?utf-8?B?ZFpzYy9acEJmb0RsN2N5Ukt0SmZ1OHE0TWNocExvVmZNK2hFZEl2d0EzTVpH?=
 =?utf-8?B?RE5aMXVvc1d4RHkwcWtFWWg5YkJrZ0JXWEJTMmRiQ3ZtOFhVS0RxMkpaTjNx?=
 =?utf-8?B?d3VPdDVRSXprd0NxNGh3YUJjVHZEM01ENm14bkxXUENjVTJIc0UxbXhmQVJw?=
 =?utf-8?B?ckZlcm11cWZWMWl5UTM4QXo5Y2pBVjBJMXVxWkwyUkJFcVJFUnkxcUZudUda?=
 =?utf-8?B?cTJFdmppRjNMdFY2aHVmSVZDajZEVnhmMm1DbVphUFNTN0tmcThIOWdwa0lv?=
 =?utf-8?B?SHBFZ015TjNaUFdTWXpxTEs4L1pUdDVoQkU1UURlWjlaaUIzYzJXWnRpVlFz?=
 =?utf-8?B?dDFDZUpGMGx4dVpiclBEZHJTS0pnN2src0dnbkhRZ21lYkRKbm12UzBTYnJP?=
 =?utf-8?B?S1g4YVU1c3Q5Z2VhdkphUE9RTXoxUmI1dy9FcG5sSjFyTDZNWjFPRzJyNnZZ?=
 =?utf-8?B?THJzdWJHSGhWQk9LbkhKbktmclhNaDNuY0Flai8vckJPSVdrK2creDA5ajlZ?=
 =?utf-8?B?TloySldwWDlwbS93VjhzMEEwRDdoeGF6QTBBZk1NdTRHWFhyWGoramxnelVX?=
 =?utf-8?B?bWpWQy9nOTBOaUp4K2txSE83MWdrTS8yT1pkNmNyRVlBVk8za2FVY2FVeWRt?=
 =?utf-8?B?R3FrY3VaR05QQ2l5MkFCUFE1c3cwWHdLRHU0TUxVa1B1UGlnbXVYRHRVN2wr?=
 =?utf-8?B?TDB3RGhYZXRVK1dISUFWQjhvZWFBTEpWdVNjRW94T3pkS2F3c0NybVpwMmZY?=
 =?utf-8?B?QndBemhMTFcwOXhtMnRwdHBkMHdmT3ErcFoyM2thNjU2Mk52ZUFaRmxXTE5L?=
 =?utf-8?Q?m6SjAmxP6kVXO4y63I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pDGM1VoNtRo0fpWSFijunlE+WvlRE/i3VN1K9FQP0CPln0PQoom7v6u1g+NLVqspO/fJ2qlwTsPMVkn7ygZesgsSBBZ6tHnURL9ST8Xuk/EzZbxA+gvJJ7se2eHjcFQbyslKmoHcTZcBODV5AcE6BzEdmIKyZjwyLxuxDV/yTHbIZBdPda2hjhG7B+OUraqwYH6rlF0oFQQTHKB+cgQXK5Ab317JNvueQoxOLAsCu6P8usqx+fVTQiRYQ4hZ/3RjXWhG8ophSQmcWYgCFWE7TXUK2hMFdlr/lXBx4f6TD21TrGWeeH2EC+/890LU7myCfK+nVPp0fHTZvZPXzb0qzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cce00d-a552-4160-d3a0-08deee7acaf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 20:40:29.1159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbRHjthdVx1bM534QxQh7rl4ugjLP0qHwhe5csHS+xAlYXiGty0Jfzp1q07PqcLwACFgNsncC/wW1gsP732QcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-OriginatorOrg: intel.com

PiBJbiBlaXRoZXIgY2FzZSwgY3JlYXRpbmcgbW9yZSBtb25pdG9yaW5nIGdyb3VwcyB0aGFuIGF2
YWlsYWJsZSBjb3VudGVycyBjYW4NCj4gbGVhZCB0byBpbm5hY3VyYWNpZXMgZHVyaW5nIG1lYXN1
cmVtZW50Lg0KDQpJcyB0aGF0IG1hZ2ljICI2NCIgZW51bWVyYXRlZCBhbnl3aGVyZT8gT3IgYXJl
IHVzZXJzIGV4cGVjdGVkIHRvIGp1c3Qga25vdyBpdCBzb21laG93IChvciBmaW5kIG91dA0KdGhl
IGhhcmQgd2F5IHdoZW4gdGhleSBnZXQgb2RkIHJlc3VsdHMgd2hlbiB1c2luZyBtb3JlIHRoYW4g
NjQgUk1JRHMpLg0KDQotVG9ueQ0K
