Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED323346A8;
	Thu, 23 Jul 2026 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843191; cv=fail; b=AEXdB/+7uhHfmcmE3GdcLTz1sVTFXiXxckQdfTfosTCHnBak48tm9uab3VeggQLOM2ucLMsi+/Fccca4iZvey/nfXPUTQsFIvg8rZBm/hqpdnJAYunzCjxI7Qadoacyds0RErML89QAkNAp/H6fYtvJUM2tWtKZ5cHgQ0XX78VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843191; c=relaxed/simple;
	bh=Or3Tk9So34SVgpbla5A5v8JldN5Kdl318+kaWm6fNQk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pcn2N2LxDlsYO/spLJDQmVbwvjX9eUn4/1Six6QejQibvXYXv4LUoaMJ6hvAmasPsuSf0fmKv5HWuWVaLYDU1oNfXS0tF3oLkV4wzslJy5vR7YUcrPzfg8t9jV+y/pmy+pgbNbrefEGuN/0bohOHZLj/jspgjFJVJ8B/UJo+hzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJQS8x28; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJQS8x28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784843189; x=1816379189;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Or3Tk9So34SVgpbla5A5v8JldN5Kdl318+kaWm6fNQk=;
  b=AJQS8x28aI5LYRBePmQHX0+imhZNLvZGJH5pqyG9OqDBH/Ghg71yYlJW
   0GV34SE1ql12GAgWbElRZkXayanS6LL0ojozqRc6VjavUzYKx8zXSACuX
   tSRmFpdBqiXYTTulLaW7TTOrWx5Pzh6fxR72pX3G3xPW47xEtaWGh5UXJ
   qVKjtkDuxT7DDBjg2YvAabqrzRdRMdTlzISNOmhaPPnJfo/W7cJTqUBxD
   nc14p+4OPAzSlwgXttLA3yKVr7kaUAbZ7TybsY6tvpVSkNZM92qGr0Kxs
   dKuECFEUDI9o8egQT++3ZMdC5n1poKA4TbFQOKcCFsxI/a9tfQ1+bhhnb
   A==;
X-CSE-ConnectionGUID: KfN82/DOSOufH2MxJWH6HA==
X-CSE-MsgGUID: AzXNIll5SuWk2E0HwxYgMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95865458"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="95865458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 14:46:28 -0700
X-CSE-ConnectionGUID: Flp4LmZPQk+pwYuQ0VUF1A==
X-CSE-MsgGUID: 9D5lc2sOSaKzrcuyY50zaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="283037240"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 14:46:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 14:46:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 14:46:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 14:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCw+UdMRsdJgrpLnfDKFzgxMWHSjGISnJ/bfaDMUgXhXKgoipLTj3Z58SFhWmBi5BEWST8T64mnKeEXzitJ6H+AjzmSRBYpAnQn2C2xfnTsGwZjY/3tZ+/keIuWVsW/LaR6UN3iHGx9yF2n1V4TscqEmA12eRvv7/dgNLQFnU64uRWbMGADX/hRt6D/iIvwXCOY/g1t+J/1xldvGYpdU28/wrR+ksQHzICZ4zFsTsBrGs2ZC3vAYTyud6TZ6Gyj/eTG5KiTyhzGNyQsgXJbL6TjxjnV8Q50zslMxl63DHL9jWyo5YhHqhDHLatyqepuWXDZPMLNrJt3TIvolmmGAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qajlG9W0ZB3jb4V7c6mc/nuEIV2vQ73xMmTONqBXFYY=;
 b=OhUQOkflrpYT/mP5LOV9SeDiQslFuf0HWjftiJQBF0Ow8Ed2PUV/AMLXWz1V5znG2d57ypFqbtNbk9FFB7JHwF/lgE6WV8D+Jb2UIv65BVpo/YkPycD5rpkCrnuwcbU4uLJ+nOw7Xo/FAaSkh0GNj4DfD9NoAvdgsnI7Ob/uMvn4OiW3hqaJgJrK9e4Pd276pRkSFJu/x/HWftQA9wR1A9PEof6hf0VVzb5jOHOQe+R0Cr5VnPjNvXO5xS4kl4cCPz3+SKej1IZZN8nJqnXq1gMfr0HlSX8w/BdoDEpG4tcvzhmuNewCgXs12jeiGgW9++ard0fQn0d5jTeXggT3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 21:46:22 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 21:46:22 +0000
Message-ID: <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
Date: Thu, 23 Jul 2026 14:46:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
 <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: b95f8eb5-293d-4c34-6150-08dee903d650
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|6133799003|5023799004|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: VNAmfv330h34c5iJBhL1syakg/oslWHsd8PWSqyHVBJXXavFO4aFnnPeTM8jAvwar1eZMVTRSe3lzvLB/yXU8EAdZyFKrhSPT7y4Ktr8VF9QqLNTygF48v8K3IKqDBO3YWTAHP2Dx7Z7GOmuh7KFW4c2H2AdVLEzZVgm8QSkudbSH42dm5aC3U7qVeiPn+U+uv3zYc9tSKrJj2oP1AgspChkskUM0phjMAFxLVXVMsJUVeJevl6sj72q+B1jC8TvpHybTctZOGDQb0zCK+aWmOGcauvJRl+aTRvrpAYrDAApqMYtSpTPmqaWCmR64rz8SDM/fCnMPJ3CnA7ETQYLzko6VmefMjLuFsL7BsWukwC7MeW+XFyaro+WV4MSrSP0hhFbrRdzBBNBBTEjV2OvaU03H+GCOek0fhqRm66bEOQzLISv9mQPfygYuNo5yE6b2TDqwdBOBMi0PrzeHRf3WDZdWC84kbWSB8xDpgAKiDfojynSRqWsvkSq0vO1chjNtED3w8RXCnW5HDZ0gJIdP2LV0Pzxl0fB+BxvlSySwJil7tSjJ5WbmsttuHwJ8SKWvkiMFBuOCOd+MPtqn1W62wGUPJCJMiP4gEPTQ+EUtiPOoXw8NXhWM2CeVaqiUOvIV1xbIwosMwGoEynWqM/QSIhuYg+qXJfQDOeD4I7nwbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDQ3Smt4WnBkcklSQU55aENwV2pPazduZHFFNWkvVWp0azJubHIzUVZPRHIw?=
 =?utf-8?B?T1p6T044aHVHbitXa2hRQzZ4cnU4WlVmNXZGd3JwZEVONlozaDZKY05iTDV6?=
 =?utf-8?B?a3U4QmIrbEw3QUtzZWJBSnRpTGZzYU0vbjdRTE4zT3JGWHJxb09mS1dLT3BT?=
 =?utf-8?B?eVZyY0xQdVRmcTcyZjVWb0dkVEtzQ2tyNEdqMkdUZlZmdkJOV29zK1NhOTRx?=
 =?utf-8?B?T3hTanJ6QWhGTCt2dm1pVWpOcCtHNC9wQTZsSTVRcGpLUTVlN2hMYUtZNzI5?=
 =?utf-8?B?ZkdQYUhYN3ZLbzJZZVBWYkdGa0Z1ZDRGWG1PcG1vME5BV2VUdjFxQ0ZFcXY5?=
 =?utf-8?B?YVlaSlkyaWtMd0VTdkFNR3loSGU2Y0pHeFRyRTJpRytuSzVQckhZdVVPazBX?=
 =?utf-8?B?OGd0QXFvdTJkbTZPdkI2d29IREtNZ2NpT2t2UnRqMU5kZFdmYTY2QlZWM0tC?=
 =?utf-8?B?T0oxaEtTWDFUb1BWNnZHVzlDT2Ntdy9OaFZBWjNsU2RGYXhPekd5RHhucnVF?=
 =?utf-8?B?UkVITzhFVnp4MnlSVzRETlJOOFBDK3lDZERDUGhBOWdXUGxwM240azNmY1l6?=
 =?utf-8?B?OWJ4S01CUGYwNlkvVysrYjc3MTM1SnN1cDR6TEJxRklralByVWw0WDNIaDlQ?=
 =?utf-8?B?VXVNV0hWSkJSejlLQWFOL0Q2bld5aFhsc2RoQndVRG43RjJVRy96Z2JoTUJJ?=
 =?utf-8?B?VmVMbkpTVjgxUXlKTjRwUVJQcUE0WWZaM2Z4c1RoT2pRT3MzYmxzOHVQckFs?=
 =?utf-8?B?dW44aDNJNlROejNncmpEbElLV2lHbUZzdDJabWtSempqQjdKcDlmS2F5R2hx?=
 =?utf-8?B?dnNPWlBPRk1LN3poVnJPdWQxRnNnWkNLVm4zV2ZYQk5LUzVsSWd2SHRUaDZK?=
 =?utf-8?B?MldZSGpjbG5TN2VLOHYxd2R3Wmdyb1RqNm5YWkZZS2c2Q3RWbHJ3UnlGQTdu?=
 =?utf-8?B?YndzeGdyNjdiQm1Zb1JyRlZLVXZVaVljSElXODhkVEF5U1N5NDRtblc3bWtU?=
 =?utf-8?B?Q0gydGNYalJNNlhsaC93VlBIV1hoQ3lYeTdZcllnbkE2MUhrRFA0eWlSMlNz?=
 =?utf-8?B?VjB2RHljNHB5MWtUK2h1dnV5YjJ3NU9XVCt3SkxWL1Zac2VsZHA0dHdWRUFL?=
 =?utf-8?B?Z3FSUkpHYVFPeDZBS29kb2hLVldkQkZxczZ0aEtpSlZmblNYa1l0OGx6YXZ5?=
 =?utf-8?B?WlJjWWFIbXpXOWxRSXo1ZHlDVytYMXBTcnZEcXpLRllUWWpKMEk2b0dMVmlN?=
 =?utf-8?B?by95TUVjUlBOUC9iMjN6YkNoek5NT0R1b0JMUnFtd2xvSFpWWDZObis3a3VI?=
 =?utf-8?B?aDlCckZYVTNmcGpBaS9wckJST1VqbWRsVjBaYVdpODMzVlY5djE2WWMyZjRk?=
 =?utf-8?B?azFScWtxeS9GMkZIYjJhVmNVNkJ6UnhZMktjV0t1K0d4OERCbDF4OThMcmxL?=
 =?utf-8?B?SHUvRVpuMXRsTnVjbVpxaG9EdHU1SUI2ZU1oQW16dTVEMUVpWVA2cStDeThY?=
 =?utf-8?B?d3A0MWlPemJBK2tXbGE5c2dlMlU5RGhqQVdyZWVkNUF0UlRoWGJCbDR3YTlr?=
 =?utf-8?B?c3FkNUZOVUJnT3hwRzVPV0hoeGkwYWxjMTkxaDJ3bndONno5ZDkvRjBlRTZV?=
 =?utf-8?B?Ym9PNXVvQ2x2KzJhdUo3NENNRm8zcEJnWE9kNmJMM1A0NUhjUmlYa0dnTkdX?=
 =?utf-8?B?SDVNMmp6THF1T082U0JuTWR6ZkppN0ZjYkhQR3FVZW1MS1Z2cWI4SjNzWUp1?=
 =?utf-8?B?bGYxemlnZWZ3bG1GQ3RvOTRDeFZuU1hHdHVROHFHMTd4emdTUDBnS2NyUHp5?=
 =?utf-8?B?dVBUdXZQTmZEL0FsVGF3OGRVcXh6MEhRUkdBTWJDQ1ZKUWloT3N1TVpjOWNN?=
 =?utf-8?B?UVhmbXVvZFdJRmEydUVkZDN2MjlCV29nR3o0VHBHMTlWZmRrUnNxTVZvSWlp?=
 =?utf-8?B?d2hVRFUxNklpbDUzYVhxV01xZnlLdzRHLy9xLy9zVDRhUWxJWUsxOWFlK0FQ?=
 =?utf-8?B?RHZaOWFJTGNBSEVvLytncDN0L05BWlZySEFza2ZRS1Z1TkhJZmQvVU52NmhV?=
 =?utf-8?B?SUMzanJKRW9McmpSYmg1Vk44ZzdaVEdQMEVKZEVncFRmWUUzbDVOcXFRWFdL?=
 =?utf-8?B?V1BYVVU2ODJ3TU51WmZWMUFIS09FeTNQS0htRXNCRGZ3NUg4UzdieEtHTFZi?=
 =?utf-8?B?SkFjRnRBMHp1ZHBSTDdadmhzTExUSFFDZzhBQ0licUNPdnUyRjZPeWZsYVhJ?=
 =?utf-8?B?TlRYMkxaT2xSOWRYOUJkVklFUkM5VUE0cHRrNXIvM0pyQklxdHlkWWZMcTdC?=
 =?utf-8?B?TlpwTW9JZ1V6dTZ0TlVhVkhsdTVTKzBudDFjV3czT09aQmlCclFlWVdjck9H?=
 =?utf-8?Q?ZMRSe0BM2UNZ98U4=3D?=
X-Exchange-RoutingPolicyChecked: KOboPjSj3L/Vg4SeGG/3nZqS+IqPjc0rciGMiLA/sIakcSeK68WE3QOylXwiY1uHtSWeLNUIFRHXaqejFbBPYhlY2DnztC2C21hW+Y5uIuyVRhWJ95KEPU4uBy7ryhpETmzTs/Kz6R3VQX9SktQUkg5wZvWV5iB+sC9uFztx5e+Qgs11rktVGZv1wjTG8qatiudpzQj4J1I8LaSHFOq7uP7SedWY58g58y7s8ndHFdSDpkeCXTmLmH0AyecN2zBGENp2D8/ztwx8OKycE3Fy7N1ouOnTTAYSOMEglCnGfwRdhrQmJTPsD+tvtHh+B09BhFtxeoOI0F+c2PFEdc719A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b95f8eb5-293d-4c34-6150-08dee903d650
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 21:46:22.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RWCcJAP1zMCVudgJk4paeI59/zEjjXHz/C78Qr3GYduCMp3hSu7otgM8HKfDNg3xMqKoEFon4K2U0f/cZ+FbxdAvKrZC4b6W85MR34hF2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
X-OriginatorOrg: intel.com

Hi Babu,

On 7/23/26 11:03 AM, Babu Moger wrote:
> On 7/21/26 15:54, Reinette Chatre wrote:
>> On 7/20/26 12:15 PM, Babu Moger wrote:
>>> On 7/20/26 13:27, Reinette Chatre wrote:
>>>> On 7/20/26 10:00 AM, Babu Moger wrote:
>>>>> On 7/17/26 17:56, Reinette Chatre wrote:
>>>>>> On 7/17/26 2:13 PM, Babu Moger wrote:
>>>>>>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>>>>> hardware that supports it. However, this can cause bandwidth monitoring
>>>>>>> failures with existing userspace tools such as pqos.
>>>>>>>
>>>>>>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>>>>>>> groups by default. On systems with 32 or fewer ABMC counters, this default
>>>>>>> configuration can consume all available counters, since each group requires
>>>>>>> one counter for local MBM and another for total MBM. If additional
>>>>>>> monitoring groups are created, counter resources are exhausted and pqos
>>>>>>> tool reports memory bandwidth counters as zero for those groups.
>>>>>>
>>>>>> It is not obvious to me that this is a problem. If I understand correctly
>>>>>> there are two scenarios possible with this pqos behavior:
>>>>>>
>>>>>> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>>>>>>      - pqos can create 16 or more monitor groups
>>>>>>      - hardware still supports a limited number of counters with consequence that
>>>>>>        underlying counters reset at any time as the different monitoring groups
>>>>>>        need to be tracked.
>>>>>>      - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>>>>>>        events would return "Unavailable", sometimes reading the events return data.
>>>>>>      - *None* of the monitoring numbers returned are guaranteed to be accurate.
>>>>>>
>>>>>> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>>>>>>      - pqos can create 16 or more monitor groups
>>>>>>      - only a subset of monitoring groups have counters assigned and these counters
>>>>>>        are guaranteed to only track the monitor groups/events they are assigned to
>>>>>>      - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>>>>>>        - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>>>>>>        - monitor group/event does not have counter assigned: monitoring numbers return 0
>>>>>>
>>>>>> If my understanding is correct then the preference is to rather have wrong data than
>>>>>> see 0? This does not sound right. What am I missing?
>>>>>
>>>>>
>>>>> This hardware can monitor up to 64 RMIDs without any counter resets.
>>>>
>>>> How many RMIDs does the hardware claim to support via CPUID that ends up being shown to user
>>>> space via "num_rmids"?
>>>
>>> #cat /sys/fs/resctrl/info/L3_MON/num_rmids
>>> 4096
>>>
>>>>
>>>> I understood from original ABMC enabling that the underlying hardware counters of "default"
>>>> and "mbm_event" mode on AMD are the same. That is, in "default" mode the hardware does a
>>>> "best effort" assignment of hardware counters to events while "mbm_event" mode lets the user
>>>> control the assignment. It instead sounds like this is not the case and there are actually
>>>> two distinct underlying hardware counter mechanisms?
>>>
>>> That is correct. They are two different counters.
>>>
>>>>
>>>>
>>>>> As you know, the pqos tool creates COS1 through COS15 regardless of
>>>>> the command-line options used, resulting in a total of 16 groups
>>>>> including the default group. With ABMC enabled, this consumes all
>>>>> available ABMC counters(32 counters, 2 counters for each group).
>>>>
>>>>>
>>>>> When pqos is invoked with the -m option, it creates additional monitoring groups. For example:
>>>>>
>>>>> pqos -m all:0     -> creates 1 monitoring group
>>>>> pqos -m all:0,1   -> creates 2 monitoring groups
>>>>>
>>>>>
>>>>> Since all ABMC counters have already been allocated to the default
>>>>> set of groups, no counters remain for these additional monitoring
>>>>> groups. As a result, the monitoring commands report zero values,
>>>>> effectively making monitoring unusable.
>>>>>
>>>>> In contrast, the default monitoring mode can still support up to 48
>>>>> additional monitoring groups (64 total RMIDs minus the 16 default
>>>>> groups created by pqos).
>>>>>
>>>>> For this reason, I still believe keeping the default monitoring mode as the default is the better option.
>>>>
>>>> It is not clear to me where the "64" number comes from. Even if resctrl sets the "default"
>>>
>>> The count of 64 is known from internal information. It can also be determined by allocating monitoring counters in a loop until the hardware starts returning an "unavailable" response, which occurs after all 64 counters have been assigned. This information is not documented.
>>>
>>>> mode as default, what will happen to the scenario you describe and 49, instead of 48,
>>>> additional groups are created? From what I understand the moment the 65th group is created user will
>>>> transition from "accurate per monitor group monitoring data for all 64 monitoring groups" to "inaccurate
>>>> per monitor group monitoring data for all 65 monitoring groups" with no indication that this is happening?
>>>
>>> Yes. That is correct.
>>>
>>>>
>>>> I believe AMD supports more than 64 RMIDs and in this case there seems to be three ranges:
>>>> [supported by ABMC, depends on events but lets say RMID 0 to 16] < [RMID 17 to 64] < [RMID 65 to total number of RMIDs supported]
>>>>
>>>> Current default "mbm_event" mode uses ABMC so as you state this always results in:
>>>> - accurate counts for 16 monitor groups
>>>> - zero for all other monitor groups up to total number of RMIDs supported
>>>
>>> That is correct. With ABMC, there are 32 available counters, allowing up to 32 monitoring events to be tracked simultaneously. Since each monitoring group requires two counters—one for local MBM and one for total MBM—the system can support only 16 monitoring groups at a time.
>>>
>>>>
>>>> As I see it switching to the "default" mode would result in:
>>>> Scenario 1, 64 or fewer monitor groups are created:
>>>> - accurate counts for all monitor groups
>>>> Scenario 2, 65 or more monitor groups are created:
>>>> - inaccurate counts for all monitor groups
>>>
>>> That is true.
>>>
>>>>
>>>> I do not believe there is any way for user space to know when or if system switches from "scenario 1" to
>>>> "scenario 2" on these systems and this unpredictable behavior that results in wrong data does not
>>>> sound ideal to me.
>>>   I agree, it's not an ideal situation, but that's how it has always worked. At the moment, I'm not sure about a better alternative.
>> I see the current behavior (return accurate data when available and zero when no
>> accurate data available) as the "better alternative". Intentionally returning wrong
>> data when it can be avoided does not sound right to me.
>>
>> The changelog states:
>>     The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>     hardware that supports it. However, this can cause bandwidth monitoring
>>     failures with existing userspace tools such as pqos.
>>
>> Could another view be that mbm_event mode is the *only* reliable accurate bandwidth
>> monitoring and any other mode (AMD hardware not supporting assignable counters or
>> AMD hardware with assignable counters choosing to use "default" mode) can cause
>> bandwidth monitoring failures (with existing userspace tools such as pqos)?
> 
> Yes, that is correct. However, the bandwidth counters become
> inaccurate only when users start monitoring more than a certain
> number of groups (64 in this case). In typical deployments, users do
> not create more than 64 groups, so the counters remain accurate for
> the vast majority of use cases. We do not want to introduce

oh ... hmmm ... I have a different view of deployments since the message I
keep hearing is "we need more RMIDs".


> unnecessary complexity or inconvenience for those users.

This sounds like a request to (temporarily) change resctrl user interface to
accommodate users that create between 16 and 64 monitor groups (where 64 is
a magic number not exposed to users) at the expense of users that create between
65 (magic number + 1) and 4096 monitor groups?


> Additionally, changing the current behavior could disrupt existing
> tools and workflows, which would likely result in a significant
> increase in support requests.

resctrl should aim to maintain a consistent user interface and changes to
that interface should be done with a lot of care and with very good motivation.
Above motivation sounds vague to me. You are concerned about support
requests from users that create between 16 and 64 monitor groups but not
concerned about support requests from users that create between 65 and
4096 monitor groups?

One could instead argue that this patch would cause more support requests 
since users will start seeing unavailable and wrong data the moment they
create more than (the magic) 64 monitor groups.
 
> At the same time, we are not taking away the option for users who
> require strictly accurate measurements while monitoring a large
> number of groups. That capability remains available. We also plan to
> add more counters and enhancements over time, and it is possible
> that the mbm_event option could become the default in the future.

Similarly, the default capability remains for users that prefer to
create between 16 and 64 monitor groups and do not want to assign
counters. 

Without exposing the magic 64 resctrl needs to provide a good default
and I continue to find the accurate data the better option.

> 
> For now, however, our goal is for the default mode to remain the
> boot-time default. This avoids unexpected behavior changes and
> prevents users from being unnecessarily alarmed by issues that do
> not affect their typical usage scenarios.

At the same time this commit states that, essentially, this commit is
planned to be reverted in the future. Users cannot be expected to upgrade
their hardware when upgrading the kernel so this behavior is already planned
to be reverted on the hardware that it claims to support. Why not just
keep existing behavior?

Reinette
