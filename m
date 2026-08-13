Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC4383C96;
	Thu, 13 Aug 2026 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654183; cv=fail; b=bVLDHPdbxsUBAGCaGcDx+n272bu/oUKw4kS610kqOCnDeVElj0dWTDFT6YM/kVRYIbN38czy7AGglZfa94bSTnq1/0pNSgkazNGbaqaf1H1JTsmNUy9pdXRfxox6nIF+uS4PCl8kz+RV0VDnClIuEBSTP55jzIEaS0XBqTdn5tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654183; c=relaxed/simple;
	bh=gtMhqHNmOHxQSMXH3jtNUcu54eBCBfGOlHKA1BvMvEI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eQ9GpxhZid/wYcsm7oVRLKW6F1ctmnugvM7Tm+IKI+WeMrGLimUJuqkNu4mmSBfmDbgWzP8eHCz9srDOFUusKRSic/E+IO3Cck1mYbhBbET+D50wSRlj7ZhayWxK0OmVbtgpsZojaTm2OpST5fNsOIEJ3XrT4PM6gvlbCkxVJ9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Txf9FZ/b; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Txf9FZ/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786654182; x=1818190182;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gtMhqHNmOHxQSMXH3jtNUcu54eBCBfGOlHKA1BvMvEI=;
  b=Txf9FZ/bhEmDSyEATTYw4Gk4Yu1YPyjbBpQR0FzqZRXaiYHa8rEB7FEw
   DZK78UqzmQw1xjI/sNcZb/bWZBa20RLdzr/gfFKzBqheTdKzJJfCCMrhy
   YSl0v6RFFFFDd5rSt7VuAZCHjHQ/Cd8zRDwUlUtmXlBqvHmQ8H2muUkrF
   jlVtBLjLVOznb60FeqSEUlttqZbl8G+P63Mas3GPDaXQZzmqPw++9sjb6
   w/oR0j9LMsCXlAU5mlaE4ZuC7r2RvwJS+B68zZp+OX2udahkNAhtCxTXI
   QRUrFjIxGSon2clrYyahbVyhZ/BvSscw3Z5IyWG4iuC08PJmOwCOs04Xn
   w==;
X-CSE-ConnectionGUID: 1xaFinNkQ32DR9VJlInc5w==
X-CSE-MsgGUID: uYzG9L/6Q8SJUjDynK8pUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87100747"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87100747"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:49:41 -0700
X-CSE-ConnectionGUID: LoMAQDQ9T2GTEKjAsF9HEg==
X-CSE-MsgGUID: QaZI90R8TA+9Z02dg40whQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262305324"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:49:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:49:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 13:49:40 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:49:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpTuBMDr80Anc7qojXrJseBLzHbHifiE7iGwbT0qUF6NY7gf5yPf8CY6jUFd0IjzEhml9QuwnRzgY/Fs2jpKVu8pQD2liMDyAIBsLVRhWxC9JmM+KG5oEcA7xKPWSbqTPghaIBQEUfNEMKYs5dY3p0lc9APskkquiyLaykE/a9x7C4kOn0evYedtbNENMygN1trVyc8mHrsHVpwPB1hOyMNgVHfAr5mE0/j4PYE/uLqHIG2qYRkrl2xZNdhtmYzBbDe4o7rDnqbW2cI++GiI9F9+mqs90D/J+q4OKx3Px8513d9GA61CSG50xEZVmlclcZS/vMmR55MpsC2xr3PMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ba3ctPy2Ta+pSlraApFZiEiTy4PWj9NQBvG6PNhUMl8=;
 b=iYqOOfqwxukULiIJ3mdUNvDNl52pXNApqazNzBkWCzga+1eO125emj0qKlliCkdU2BIvWz+B/i7tBFcdrkPGkhtXPNTNkf/xT8nKUQRKJyqR+hoRy/XOVdhZEBQNmP8iIJBNHoUunt5nW5USQc6X7y2T6ZQL+ePLppzMFmnSe6xCd2XNv4iWPmt+pVemMtxOs2N4IAzqGlGN1vQ7ws0H8+yiaKvRi4h2m+k6fABCT4gY2A+OqVdISenM1uYdz01JXIDnhC6+h9c2PjuyGP2HstJOLSzCl1iwWTbkBWsnCfEl/Ke1H0WEkWsiRZ+x86F1mHlNGbyxSFskIbME/+v3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LVTPR11MB9912.namprd11.prod.outlook.com (2603:10b6:408:3c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 20:49:35 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 20:49:35 +0000
Message-ID: <bc0e0864-d1e6-45e5-b24c-c073f9cb3fc1@intel.com>
Date: Thu, 13 Aug 2026 13:49:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 09/15] fs/resctrl: Introduce
 kmode_cpus/kmode_cpus_list per rdtgroup
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
 <27afa5e408453c93790e5aef61fda31355d96ec9.1783461016.git.babu.moger@amd.com>
 <13834492-22f1-4135-8c57-74052544ed17@intel.com>
 <c4311423-cafa-4b59-8e50-189fdc241de8@amd.com>
 <98568620-7e61-4d43-b72c-5866a7d3bca1@intel.com>
 <de190a51-4c4b-44db-9444-5c79f75f0887@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <de190a51-4c4b-44db-9444-5c79f75f0887@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:303:2b::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LVTPR11MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 97151d90-501d-483d-f45d-08def97c61f7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|56012099006|4143699003|11063799006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DuGn140fY1IWrjQ/SYXCbkihuzml8Hawz+0Enu2cgavNm4yQfGJ5Q++X+KCf3GX+15D8RqqeGTii/wNLz1tBkdxjFNYaP4uUr3khauJZntlxnwY8+BD7vD2lBfigyI/NKvhIMxyF+zraWftaA+WsdWRsRphWlqt2lCkaTWjBfBSIme6nHK+X2VvjhW9tdGIqMKd2J0W3c9S3ixy0zl8S2Fq5LZnhziSSDjRnf5gXTjulT7S3iYKzPYarQIX3/JwSJ9CcivMTD4cMZc+wpVX8rSn+E/t6jz/KPVZ1ZhxQwzaqu6nip1Ttfqa4qE/KetnwNHwVWUYEBJCdDv1jeVy+xfwlGsJZPZUKICEPwtmi57FFoG0X9QtNRLrZ1iYSf/M0qrSmG2M/oB7MY4uv0jKHLqJBBDRfHispqkYePVSuVlmgfJ2klcvUUsxRj4C35Zb6HZNeYe9TVH+7hAYY1xCfLlyHp5BV3piAwx8KE13x/lndz+gMpWgKftuhsNYB6bQ3tUAzSIgwBe0H4HLpsHqplpaB3zog4EgzeR8UEjR7JJw5qBjDPkVcoelQebn+88/KX1P30jlRbzK1Ahb3ic4m4kutDaUHa0HUlAjAQKIOE5f+Wi+AbJUIOs6C3hGvSu5Ct1Kk25tCwgowGr3IfwSLuQYDTYLdu6pMx3OYeyoN0cc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1QyUTBMN0pSWElkMCs2NzhVNFQ0cFBGNE5ydkVLNHMycVovVUl6TGVxMXc5?=
 =?utf-8?B?QWcxcXVWdTNzTW5RakQ3SFk3ejM1UE81eG14dDkwVTZwaERyNE5sQkhVLzIz?=
 =?utf-8?B?ZStKZzY3RUpXN3JORnZHc01oODdyYitqSy9EVWsyRjFsOXZ2Zml2SURiMTNr?=
 =?utf-8?B?U2FXWVhhWTE5NWovQndmeURKbjNicHF5S2VrR0F2YTJLTm12dVc5Y1ZyZTBp?=
 =?utf-8?B?UnZMb2huelVMRUZOYTRrRTJCSXhIc2ZvRnhQQlZ1LzZHNGJhWVVydTJDUEJX?=
 =?utf-8?B?T0J2VzBJSUZWZzhRK3FhVExwNjlQMUdaejJjOFVPZ3hzUXV3TW45ZkVuRitV?=
 =?utf-8?B?MGRWS0FIRTJSVTNVZEVmazJrL0RlNG5kZVViempQMGV4aktjVmNVMldwUFQ3?=
 =?utf-8?B?ZXhGYzNMODk0NW5tclREVHl5dFZqZTVwNnpnVk8zajRIRWdIRmE3Y0EvQnA0?=
 =?utf-8?B?OHBIOXBSTXd0Z3JyNmpWUjFVR3RmTXdnb0FNOHZnUFlSYVNmdEs5YStxVWhl?=
 =?utf-8?B?b0tMZkR4N3hrYjAyaUtoVVRDUTRYTVcvckU1THBsbEVaSklrcm1ObEpKR0hz?=
 =?utf-8?B?bjNCQTVvb3V6c3c5TFEwMzRDclVxMmNYNWc5ZFZnY0ZndnNVUy84ZkcwRmlw?=
 =?utf-8?B?dllpcGplam5tdmxTSlNaK2IzTEM5TCt6WmZiMzB6bHdCWXNDZTlTSnVHbndY?=
 =?utf-8?B?L3R3b2NnMjFBS3ZoRW9BdFRnc2JORWdnV0d6bjVoeFo4UWZ1UlY3M0xXUEc3?=
 =?utf-8?B?eGcrMitweGhYN0Y3bWhxQ3Z0aXpLWmVkMnhQZk1Say9jWHNwdmx5MlhoU2Jv?=
 =?utf-8?B?OVQxRUNnQlNUS2o3RFVpUTRrK1hrRUloM3RWQWh1N0E4Ym43WHlTb3JTVmJW?=
 =?utf-8?B?NHRuZlBiTm03Kytac0dGYTNIaTQvRXN0UFhETEFTRzdWeFUrUTJDUEc4TzA1?=
 =?utf-8?B?MXd4SkJjQVQ2R0xucGtqdzdsQmJSUTFEcmVCdGJhVmdDK2ZDT1doUDlBeUxn?=
 =?utf-8?B?bGpzcGJybnZiMCtpN0IwbSswM0p6WkhWOFpiU2hOZ2JKMnhFL21uRnJESmt4?=
 =?utf-8?B?emx6YXpzMHdvbHZQTFBFalgxWGpITm13bVpnazkvQXlSMzJqbGJkMCtGbTFu?=
 =?utf-8?B?NityU1kydU5FWmdGZTcyaXJCb1I3OXo0dG9mQ2JuS0s2TVpqN3lRSUFTQjFy?=
 =?utf-8?B?NzJNRDFjZEZudCttYWtVVW1vdVpoSURLL2ZYZjR2eTNKb1oxZ2p0c2NhTktZ?=
 =?utf-8?B?MU1YdTUrM3Z0OGhPcGxWNzA5TisvZ3VyS0E5TldGdDdDT2E2NlRJeDlZRDRF?=
 =?utf-8?B?NUc2M1c3MjRabmxiM1pPb0hMZkVMYVdHakZOc2E4U1B6aEo1RFd5cEFtSEFN?=
 =?utf-8?B?cTBJS0dCa1hWWkZsWmNzUkNCU1dxdFgwZEZxMDEvZG1ZUG5SYjJkU3h0RTNQ?=
 =?utf-8?B?K2xJNXJjSUN3Ni92ZXpkSkthdXhLM2dsdmdZWlc0RFNNWjRaQjZNTDF5V1Y5?=
 =?utf-8?B?S205WWFBUmtQNURPMGQwOEFNS1c5Zk1tSVlGdUp4VjB2VGh6QlpJVEtwNWJD?=
 =?utf-8?B?QkJOWkg0cnNWaUpiS2UwUTUxemJ4SStRd20xOWx6ZThyYzRvWEJ6a25KSUlv?=
 =?utf-8?B?ZWdzeTh1bXhxbFArUndWWEprQVRyYlBheG9HSGJCYjVLU3l3VytIU21hTFBz?=
 =?utf-8?B?ZzVjOHY3L1hmMUNLemxvdEZjMURzakRCcTlCY3FyMzU5Ri9YaTRXSGVNSDI2?=
 =?utf-8?B?UWlWOVV2Mmw0MXo1T2xqUndtUTNyeWh0K2wrdS9zSHVrVDBzOThoSVpyeWN0?=
 =?utf-8?B?bnF6cVc4dEllV0tNb25YOWFCT3JuRmZsZ25NSUNRUjB6ZGhaMy80SUMvY0tk?=
 =?utf-8?B?ZU53R0tWL0ZiWVVOTm81Sk1sOWFZWi9XR3B6L2JrV1Y4dVF5QkY3TnpqRksy?=
 =?utf-8?B?SkJ6WkJVMjh3L1REam9SUEhWYlYwKzN1ZFJoTlo3MkJNNzUxQUVvemVnMWFw?=
 =?utf-8?B?QjdkbkljOVNnMW9TL0N5QVdudGtlcHJMclI2RFZxUVBNUEhzQkxaOTRTTnFZ?=
 =?utf-8?B?QXpQSVE5cG13WHMvelB5cjh5KzBUaFhtMkJzOHVVVGk2QXoyMHVaU2VPZ2JJ?=
 =?utf-8?B?ZTlGbUJNQUdtQ1pjNXo4YXVpTHhtWEwxVGdUQzI3eUhCL3NkUmZTNEw0eEZH?=
 =?utf-8?B?SWhFS29FZXpwczIrcmdQVUpiekVvRURwSFZYV0VaYU1jbGdGSzJGeWVTeVBW?=
 =?utf-8?B?ajYrc3Y0U0UrMEM4a3RKRjlzZWpNMTY4QkhhdUJva2hPb1h1azVraE9LcTRL?=
 =?utf-8?B?RkNPQThBV013TFI2dTVmaGZWQkd6b0dLWHc3QXBuVzdlcTluNXRsS2UybzdC?=
 =?utf-8?Q?RmyDuPDWz/kuEtIk=3D?=
X-Exchange-RoutingPolicyChecked: NI6L8WrGBF7cXX6K391Z8umZMQQ1sm3/URLi8YZxP8H8SnpUTblOmo0ySPrxar/xpPtq2yqCSeqCBIkD1VFIUW8cOFeIgR9T5FamxaRznWOWOvCK42wF7e0Jho/kITQ9dw04tI18JqWUT/IskRQmbn9A9PH3HHg/qoetU+h4Ap4rnlQKyEU/SjmXE9IXUQW0pHO6QtMbql6Tkvnh9kbaq4vbEzmYibiurb2TiWQRPMnjTsJXxFjelfeqvLry1CYRHtdDm6VmNLUnih0jEXJEmEJZ6t+WZBJpgSCEmrkEWPZBGo+lhGIuEFsiFODLimL4+zr6FdxID/L9/Fev61krVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97151d90-501d-483d-f45d-08def97c61f7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:49:34.9916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1I8s5lAtDVQTkOJ1OjcaNMHyt7coj12eg4diGARSOibe51vQ7eCEHbaP5831ldRIwpvZS1BIc6JABg3xHhK5UlDwt/DlF2XnRquXzhPiC80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9912
X-OriginatorOrg: intel.com

Hi Babu,

On 8/13/26 12:27 PM, Babu Moger wrote:
> On 8/13/26 13:19, Reinette Chatre wrote:
>> On 8/13/26 10:57 AM, Babu Moger wrote:
>>> Hi Reinette,
>>>
>>> On 8/10/26 22:20, Reinette Chatre wrote:
>>>> Hi Babu,
>>>>
>>>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>>>> Kernel-mode resctrl policies allow kernel work to be associated with a
>>>>> specific rdtgroup, optionally restricted to a subset of online CPUs.
>>>>>
>>>>> While user space can query the active kernel-mode policy and its associated
>>>>> rdtgroup through info/kernel_mode, it currently lacks visibility into the
>>>>> CPU scope of that binding.
>>>>>
>>>>> Introduce read-only kmode_cpus and kmode_cpus_list files for each rdtgroup.
>>>>
>>>> I think it will be easier to follow if this is deferred to not create these
>>>> files in all resource groups by default. Instead, at the time they are
>>>> created it should be obvious that they will only be visible in resource group
>>>> associated with the active kernel mode.
>>>
>>> I am not clear on this comment. Do you mean create these files when user associates the group to kernel mode? (during rdtgroup_config_kmode)
>>
>> No. As this changelog states it creates these files in all resource groups. This
>> is a confusing thing to do at this point in the series since these files are not
>> expected to be present/visible in all resource groups, only in a resource group that
>> is assigned to the "global" kernel mode. This commit mentions nothing about this
>> usage and thus from reader perspective does not seem like the right thing to do here.
> 
> Ok. Got it. Commit message is not clear.

This is not just about the commit message being unclear. This commit adds functionality
that patches that follow undo. I find this strategy unnecessary even if the commit message
is changed to reflect this. I find having the functionality as intended from the
beginning easier to follow.

Reinette

