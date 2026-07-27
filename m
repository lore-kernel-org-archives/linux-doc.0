Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2042464C;
	Mon, 27 Jul 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175940; cv=fail; b=WaIQysSYEW3g++3HGXqULvMcCme8zvWcBAmv5D00OXjMH3d2W3iDnPTivxyBwOUDvwkYofNYY6ududzmC6jEwLurWXS2OCAEMTDu4ouU7ocQGIcCwpnNip2uiSWDM12Yq9ukouie2auOhaa5YMALQ/lzS/ccjTQv+szLVg6EwUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175940; c=relaxed/simple;
	bh=dKXpm5TNHLjUU/1dP8dONw8ivFNc6TCvVxd8NufkUt0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rrye8/eELfXo7DMbj+xX7VciWvahczOI9Rq6QuvTpAgPUbE88lHZ121vPC65rukZpzmKHD1ni6U4KQwTFXQcmO93HJYDDOYkRqdkc4aHV3fH2IARVgtSYc+iJYQQiUU6Bc24a4olEAleu6cwltE2t7SCzOV0dP6kP/0E3ZLxxZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idd6N6Bs; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idd6N6Bs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785175939; x=1816711939;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dKXpm5TNHLjUU/1dP8dONw8ivFNc6TCvVxd8NufkUt0=;
  b=idd6N6BszMy5Y2cTy7Yugo/L/aaYTGTkT4GwAH6VsbAmivCTnZ1afD2s
   eGgM+N1EDqDVeabgD0SdnLOUIpXHxlbi5lu6/gzjQJHqvVVu/70Aoh3N6
   auL575P2ofDoO0+rV+9xiaXzJbd+akzWKCnMZXMupD0eyzcOdPEFwM2+e
   cSu4LGjSD+T25tJT2DZfZc/cDEXHhHBeluWwQZ/HEcUCDHAMVl+MKuRWr
   6Xr9VY+haTS6+WDM0DELwblVHPzuX2CL86DksJ2OB9c6SYsoEZkegdW9s
   3Rocqm9B8vmumR54XYlzIWnHIieztgUzSGX72SunQpJK4Uj5O4c7/mrOf
   A==;
X-CSE-ConnectionGUID: TDFnGpWyRfuDA3Dy8IuO7A==
X-CSE-MsgGUID: DDZ8gHOrRDC2z6a2Lq9Kxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="97262410"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="97262410"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:12:18 -0700
X-CSE-ConnectionGUID: 3FzraVD8RwC47U1JjWRQDw==
X-CSE-MsgGUID: dBk0Lu8vTaioLOY6HTXhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="256119864"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:12:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 11:12:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 11:12:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 11:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMkKEcQTGYN7SQt9gyd/zAswUyPooYXwFbOlmhSp7/T2N2i+sdJ3XxrRq7zKzEPwG3JW1Sf0mklMXLCQA9whsrdy1dwlbv+ZhU3vuzQtwUQ4MoqksrVjH66Ywk88YMSOL11Wr4gJr/zkR7d+uNxkYESV2XcbeUWYedB8sAXedSBYwyqn+GGaIM9lf7z3BY+k5i9EUc9sLG8VisDD0iTOt3kIgJQSwAdpn7tR2Y8XVHTGmxzBEGk79/K+Pof4pWOXMr2jkiUb7H3bmNV2R9OPtjQnFce0eK+MifANRa76Qe2WYeXZUDklGOY3QiGIqwpoIXj5WWDj97N0huf1Ra1z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2g+vclpcjEYf8WILwdCw6hxEaHLzPIO7D+GqY9zOt8=;
 b=FnVFULwTlBZSm99RRANMvA6ReLo0hd/PHp1XhyertTP0wUBy7xWy0XxphIMBmCFL5KnZvJzZFFnoj1yaYGl+yvSsDEe0z5U14L6kdB6CO1OqdRT4dDdsnsyHYop9oa+BZ7KwIM6v+o/UeW9/rmuECIG6qFmkv9a0jQpgazx61dFjgb1K/iQhypboCLtc8at1GMpmb37uMRs7MIGFr2+IvhiRROfQWIomou7yQFjsL0mqt/kEnyQhCxaqKTgNOXARGdOY+K7jMAmnXg742uef10u+zEny+WUixO28BKHTngsok9Kj4+SFgLinP0wjB7fHsUvYYO0SJo5aMCOw7WanCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB8941.namprd11.prod.outlook.com (2603:10b6:208:55d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 18:12:12 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 18:12:12 +0000
Message-ID: <d2c4e17c-2aa3-43a6-980f-ab4bac769852@intel.com>
Date: Mon, 27 Jul 2026 11:12:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
CC: "Moger, Babu" <bmoger@amd.com>, <tony.luck@intel.com>, <x86@kernel.org>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
 <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
 <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
 <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
 <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: f12567d9-6906-4297-a6bb-08deec0a94d4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|13003099007|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006|5023799004|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 5qIR8hYqjivW/6i+P9m/0NNPkqShmrTV4Mpy6CZzTtMO99sbk+HVqFvPUMwHijgoanJRaJyGFZHMfK41wm3VrWiu719CNwNSKDyXTnoJafL9l1oFkPEQHjY02tiDehwYrKdStv02/3TrEbbrtlGv+IIaa8E6TVYb5zve8+eZ342xkLZALGOiWts3RqHdsh/Dnb4j2yANw8ADTpHFe6B3rhKp221q9+GN9shVxAzYwEWTux1Y+0n044mkcOYHtHz3ngRXhyS08TLxRKQnFOi00vnHalq8IEoBVLw0h4gScX2EWtC/Zk8/ij/TEcq8tDx25DWWLwCYF0NhMe7NEa+CnMfhk45iAU1HNzzyzST+TWcTMvB/FVAI0i8bDaAfUtIr1lGHn1ZaUQ33t+RhEXps3akusB07ayFp1FlbcCyW0hbgXF0iL6jErtrNnGz3pii2WEB+IeDAPWBnVuZSeRG4ZDX/Bz2mGqZJicy8dAKfzOhquXKct/G3+ls5JZNr3ySHig3TNiWY0SQpknMsBPvvRX93qQ2wbzIKrjBvG3D7EF2BcrKBxgSiVqtBS5yvxT3dKKUAuOW8c5+IgdJua4Xg2AnAcRvn70WuFNODckH1Le8GWt92cfpxJt4mXPI4txr5g69BkMCqeU7Qa4VDkqIMsm00BflizmfLGib2NKbg4B0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(13003099007)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJMS2ZlZWtOclNVL0hrbDIyb1dQdW0vUkU5c3gzZzF6SGxGcmRNeTlwdW9u?=
 =?utf-8?B?ZFE4bkV0enVwSXE5RSt5Z3o5aU1Zbm9obHpLWW80OXFRNGdiMzRhcWdrOUU0?=
 =?utf-8?B?U2h4VUtJc3o3WC9MU2dHVFV4KzdDYUhkZXg3Zm5vc1FaT0hwby9sd0VWNDc5?=
 =?utf-8?B?TmsyYUkyd3FtUjN2MzhYY1hSenhraG5zb2IvdFQ4MDZ4YWREY25EKzJsbmlz?=
 =?utf-8?B?aG9mc2hHZDdZOGc1aGJKVXdyR2liVkRpUW5XNUtTTUpIdVUyZXZlU2ZIT1RM?=
 =?utf-8?B?YTFQL0c0SWlVaXJ4Z0lrTXk5Q1Z6M0p0Tm9MTEUvb3JqakhLQ0dpY09sVmda?=
 =?utf-8?B?Q2o5R1RabTlqV1hDdWp1dDBBOXRwOUxxZzlhSVgwYlIzSVlBRVBaYUxhS2x1?=
 =?utf-8?B?ZzdEd01tTDBjdFFjb2hQeXJoRG5rN3RacDVUNVRvQ0xIVmpjMGVEd3cyT0Ir?=
 =?utf-8?B?cTIyQytVam83dGRzeG9iMjVtc3g1WlI3RFE0Q0hSNVhEaUVWMVF4TGxHZk5R?=
 =?utf-8?B?aEs3bzhWMHdIS0ppQjFQM3BmYzhWRXNMV0JYZ1Vid2Y3OEM0N0dYbS82cnRp?=
 =?utf-8?B?ME8zT2FXZTFpUWFsTmcwOVI4dGJaTWNHV291T05Va3Z6UVlkc3lpZ2g2a1ZG?=
 =?utf-8?B?QWltY1Z0OUJtT1BQRURhbmN0Q2VqaUgxNU41OU15cjhaMnlQaGJlekVmVFVC?=
 =?utf-8?B?QXZGRjZkRFErQzE0eGc3OGhWbDBXWWxOeS9ndFYrRDZ1N2RRR2paeFBKSXFy?=
 =?utf-8?B?UUNXLzExQkh3NDdINHV6WGZGNS9uVjVNZDgxYlpvV0hSUWYwTVZpY0p1cGxD?=
 =?utf-8?B?T3VkVUNrRUdVWVR4c0Rjd3BvWFBNSWpjS2l2RmtXWFQ2dFJQR2RaSVZsTE9X?=
 =?utf-8?B?TU1XL2R6U1dzVWt4MFdXV2UrbDl1Sm9lMlZEcGtpSFh0VWhEMTRabWNTK1A3?=
 =?utf-8?B?ejlnNW1IRCsxaHVMWUY2eVFONkVNanh3RlVCeVcremM3bjhrS2NHaC9IaEhU?=
 =?utf-8?B?b2tLWW05TUI4S0xwRHFGZkRTek4vMkFKNXhpWWJsMDVtaWVDRDlXMkZGNUlZ?=
 =?utf-8?B?M0xWZytTTDdsbHBzNXVSOUttbG5FeGFoU1dtT2Y0cFB3UFhSSG1uS25OMmdW?=
 =?utf-8?B?dG8xMHNRTzkrN1lSb0tIWlp4NndzU1pUN1MvVDVHdG0xdmNKMGRqL1cxcklv?=
 =?utf-8?B?Q1BZZVorNEFrcXRzS05nOSsrRHlwdWF0dFd4WGE1NXlGdWFXcnlRY1FUbkNZ?=
 =?utf-8?B?WDlWS0tWVlpOSVNndUdZN0QxUG1CRWFhN2VRUmJrT1ZQc0huSzJNUmxWQXdy?=
 =?utf-8?B?cFY1bEkxOW1XYUlkazBKZXN0YXJISXJiZHh4blM1MC85bzNjclFoemQ2QjVX?=
 =?utf-8?B?bE93QTJzSGFObnlwQlkvSkpFcjFFWGQ3VURqb1E2NHBXemk2MHFVSGQ4SkxB?=
 =?utf-8?B?bG01ZEFJbDE1VFR6d2JVemNrVXJGbzJBaVlyT3FCMVA0aUlWdEFZaDU3bVdW?=
 =?utf-8?B?QkdyZUc1YnpHQTZ2b1kvTzAyaHdFejdHSi9oVTF2cFo2dEI5SG9OSmVPbCtI?=
 =?utf-8?B?T1ZZalVMbVlGODA1Z1NzMmtBdkhTL052bDBNOUN2MlRab0FtYVc0c1JiQlNF?=
 =?utf-8?B?bUI4Ujc5ZFlmRHc2eTVNb2lnOFJOclZtMEZvdU1lakkzM25YeDgxbnZrN0I3?=
 =?utf-8?B?NTEySmNNVW9URDlMZGNQdUVTdmh3dlNMd0F1byt6OU9hWDBwQTk3dTJ2eEFT?=
 =?utf-8?B?TlR6bmlpeXdraGJJdDN3ZmltU3ZTT0ZaMjlhWW5HZ0I1ZlFBWkZKUjU3SDIz?=
 =?utf-8?B?WERoSWRrdkd3ZXJMK1RTdnJLaVRRTnFXbElPR0tON0VKSjdFZ1pNZWJDeHpw?=
 =?utf-8?B?RmVxeUxnTjRqNmEzQXpQL2xYV213eldBbWk0cE5JU2RMZFpHZXdveERNaGRl?=
 =?utf-8?B?b3F5NDNBZmxtUks1eHAyNktGWkZveVpzU20xeE1kZ3ZWR01LVzN2dEJ2cE5w?=
 =?utf-8?B?RGlYVVlKUDZOU0l6VjEweUY2eFdTa1RDRnNsb3l5OVgxREZSOUJmbjRPTEZ2?=
 =?utf-8?B?bEZyNGhoVU5zOVFaUzNJbW1abTRub2FyZnhCODgwL3hiNlFHMGxVNWl2YmpI?=
 =?utf-8?B?a0ZLSVUvZjlJVlNpYlYvZWRmZ2w5cU5jbTIvNmVDL0x2N25pRVMrNDlwbktt?=
 =?utf-8?B?NHFRbnlzLzcrc3BaNEhKKzZ3TWx4T2NjcDRHekduTXk4b1B0Y1B0SGd1aXh1?=
 =?utf-8?B?SWJFMVNGdG1rU2FxbFI5aC9yRDVFT1J3bS9XZUF0ZExaczMvZ0dGWXlXejd1?=
 =?utf-8?B?K0k5Z3R2QXJldk5PTHk2YUh3azFndE1ybzhYQ3B4MmNRY3pPYmliWkhia2JC?=
 =?utf-8?Q?j8yewvNkIFo0o8Ak=3D?=
X-Exchange-RoutingPolicyChecked: ERjsgc2qKMPsQ8l3iiE4IkfXIaTiJuNm+e0z3wyuArriBFYQbkoM9NE7c1zJWXZbo+XpSXi4X1eN1gLyLMgREAWDPApLUTZfjOq5ey/2cbVsimFnYWWJN5rNVRu6oSbr6+2AfPtC9imeOkvRRHrm/DCZNcYk7v/r6GLw6DXmXYtuz8DatAJIAd3QURoasHeJYq3Xqbp+QupEM04SyDrJlliDOGsewLRpiFbawqsIWF1f8qAf6ImdBYIv661ByMduEJPKOiZhYAXyU+Z5HC3UXnsPXKJEaTF7ZBE9OiTE5G8oOpnJVdYaxLd6yHECwoXYIqoNVuA4bicaPE1b2ILD/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f12567d9-6906-4297-a6bb-08deec0a94d4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 18:12:12.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3GvPfCu6jW1kS0TOf2PDin1gKkO2HDxFdQqFiStnMx1eUI8c0tD5MiAexD6mfHTyGMa+EiVrnkkgOLKgGVQ0hjErqgxYZ5LVKaNkkR/K8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8941
X-OriginatorOrg: intel.com

Hi Babu,

On 7/27/26 10:24 AM, Babu Moger wrote:
> On 7/27/26 10:25, Reinette Chatre wrote:
>> On 7/27/26 7:05 AM, Borislav Petkov wrote:
>>> On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
>>>> One clarification here is that as I understand there has not yet been
>>>> an actual user complaint. At least not that the pqos utility mentioned in
>>>> this thread is aware of. Instead I struggle with the speculation about possible
>>>> user complaints with different interpretations on how this change could be
>>>> perceived by users.
>>>
>>> Sure, but don't you think that it is enough that we know about it?
>>
>> Only if we are sure that we have the complete picture. I do not believe we do, yet.
> 
> We already have an issue open for this, and it is fairly
> straightforward to reproduce. Please let me know if there is
> anything specific you would like me to try.

Just to be clear, when you refer to issue it means that pqos is returning zero for
unassigned counters?

Is this issue public? I am not seeing any related issues in
https://github.com/intel/intel-cmt-cat/issues

>  >
>> I connected with the friendly pqos folks on this issue. They subsequently did an audit of
>> the tool to understand how it may behave under the different scenarios. They found that
>> the tool currently parses text return values ("Unavailable", "Unassigned") as zero.
>> This could cause incorrect behavior. (more below)
>>
>>>
>>> I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.
>>>
>>> And is the
>>>
>>>    pqos -m all:[0-191]
>>>
>>> invocation not something people would usually run?
>>
>> ABMC enabled (mode claimed to be incompatible with pqos)
>> --------------------------------------------------------
>> This example is from Babu's email that highlights that when ABMC is enabled this returns
>> zero as bandwidth from pqos perspective. This matches the pqos audit that found with text return
>> states, like the "Unassigned" happening underneath the output above, the return value is zero. When
>> the counters are not assigned then the events will always return "Unassigned" (until reassigned)
>> so having it return zero all the time may not cause issues. Once reassigned the event value
>> will always return a valid value (no text return values).
>>
>> ABMC disabled (mode claimed to be compatible with pqos)
>> -------------------------------------------------------
>> Without ABMC there are scenarios when events may return "Unavailable". These scenarios vary
>> based on how many monitor groups are created and the workloads run. I am not able to test this
>> but when I attempt to combine what I know about AMD bandwidth monitoring with the results from
>> the pqos audit I am concerned that there may be a problem.
>>
>> Consider a scenario where an event may return "Unavailable", for example:
>>
>> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
>>
>> pqos will see:
>> A, 0, B, 0, ...
>>
>> The "pqos -m" usage attempts to determine the bandwidth rate and, for example, when going from
>> "A" to "0" it will be considered counter wraparound that would appear as a very large and
>> wrong bandwidth number.
> 
> Yes. Agree.  This is known issue.

Has this been reported? I do not recognize it in https://github.com/intel/intel-cmt-cat/issues
and the pqos folks I spoke with was not aware of this behavior.

>> Question to Babu
>> ----------------
>> Do you perhaps have a test/workloads that, under "default" counter assignment mode, can create
>> many monitor groups (more than 64) and cause "Unavailable" to be returned frequently? Would it
>> be possible to put pqos through its paces in this environment?
> 
> Yes, I tried to reproduce the "Unavailable" issue with the pqos tool.
> 
> So far, I have not been able to observe the issue. I created 64
> monitoring groups, ran MLC, and simultaneously executed pqos.

If I understand correctly 64 monitor groups will still have enough underlying hardware counters
and always return event counts, never return "Unavailable". It is when the number of
monitor groups are 65 or more that the hardware counters will start to be re-assigned, no?

Even so, I do not know if 65 would easily trigger the issue ... sounds like it is possible to create
many more (4096) monitor groups on these systems so there appears to be some room to make it easier to
create scenario where "Unavailable" is returned.

On a higher level: could you please run the test that can expose pqos to environment where it will
encounter "Unavailable" and observe how that is handled?

> 
> The issue has not reproduced in any of my tests so far.

I'm confused. It reads like the issue that you mention earlier is a known issue cannot be
reproduced.

> This might require specific test scenario to recreate.

Right. 

>> Of course, "AMBC disabled" scenario also includes AMD systems before ABMC was introduced. I do
>> not know why the issue with "Unavailable" handling (text returns in general) has not been reported
>> until now. I assume the pqos team may do most testing on Intel systems that do not return text.
>>...

>>>> The patch notes mention that this change is planned to be reverted at some
>>>> point in the future and I have not heard of any changes to this plan.
>>>
>>> Where does it say that? I don't see that aspect.
>>
>> For convenience, copy of patch notes from original commit [1] is below:
>>
>>     There are plans to enable "mbm_event" by default once additional counters
>>     are available. For now, keep the default mode to maintain compatibility
>>     with existing tools.
> 
> 
> I added the text below in the comments section (after ---).
> 
> On second thought, that was probably my mistake, and I don't think I
> should have added it. I also don't see this happening anytime soon.

ok.

> 
> Considering all of this, I believe it would make sense to make the
> "default" mode the preferred mode.
The original problem statement is that pqos is not able to handle "Unassigned" return values
that will be encountered when "assignable counter mode" is enabled.

The request is to disable "assignable counter mode" by default to address the problem
when handling "Unassigned" counters.

Disabling "assignable counter mode" will under certain circumstances cause "Unavailable" to
be returned on event read.

At this time there seems to be a mismatch in understanding how pqos can handle
"Unavailable" return values. For me to sign off on this patch I would like to fully understand
the risk doing so. Could you please confirm from your side that pqos can handle all scenarios of
the mode that you request to be the default mode?

Reinette


