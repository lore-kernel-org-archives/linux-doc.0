Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78A390CB2;
	Mon, 20 Jul 2026 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572056; cv=fail; b=Tm2XzlaufSSghEyhM938p9Su6U1PMcu6cz5yWXbYzqrwIbvbvLprh2hUBSZ0Hb2CP5zXv+Ho875Y7opH0hjuIJLGNz209kpwAQsGGiNwJmnhjfTPdZlRYhE4ck+3DU+GjmcQvGwxPc4svFpPj4toYvUV9zprD3ZTVHBiRryMzAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572056; c=relaxed/simple;
	bh=7MAbi/9V16rvAZUFfiKNp2uHJfqxpwn2Ao9xlu2uHG8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kfSPPInftwO51friaBz2lfDIiobObr/PoXAVQyy/FjBiwTs1Oo45urtD+hp8LbirAg3CiG7I6fOOngYO83s3CHGPAUem+qBSsTuoUSg0zn3lupuaJcBGq5rHditlqPqf+BvmqWgXXWRl6t3RTI81tGkMUz4i7XmLK2q9hy39XvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBmaCuT+; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBmaCuT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784572054; x=1816108054;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7MAbi/9V16rvAZUFfiKNp2uHJfqxpwn2Ao9xlu2uHG8=;
  b=BBmaCuT+hR9XfT4QFbZrrhEIMxoh1iyfc8/JCBi7kv4Ew6UJwIHrhJsW
   HF2Gu1nnBKIf/PUwyh3fCd0J6/+OwXytzHi6C+sG1dsc0gUfeAd9VGdZo
   vJPTObhS4cX8vY9d3hELUClkGQ5nNaMXHU1mrK1w2S6cLzUgLJLTxz44h
   r5XXMY0Dx8L6/9e0DcowYMnh6ZxTHfTzrquQ1TzjcH6Men5ddSD8XaorD
   bZje5ijJNu5JR5ydCZX52PebP0mfaIlqvZqcgVIdlnWpN/rTADSHtCOU/
   uVjKVvm7m3LJY6HPxXn7HHNST3KfYHzBkFTPRzhibMKPyvcH1pU/WBkwz
   g==;
X-CSE-ConnectionGUID: aVgp9P23QoKu4UP42w1kQQ==
X-CSE-MsgGUID: VSkRkDx8RrewdgjI+OyBXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85184823"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="85184823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 11:27:33 -0700
X-CSE-ConnectionGUID: H+qe7Oe3ScWluvPThTTukg==
X-CSE-MsgGUID: /q5eqfBnRhaBov06hgsMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="253609341"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 11:27:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 11:27:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 11:27:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 11:27:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjD0c6aLp8uI9v26eb2zmVTPBJXkbbwKsLl60FYqUdGmNYlVC0gkbr/5fkvXsYEd8V8jsVu7zW2aPvkIS0xI6ZEevdc0eccMOp+CeEml0/mOuLOTHUFRWiYTWp2UDsj6nLlrfr48dB9ksd7P1UUap3kCYwOpyqxFbaqNOq60IOJ822cGfcygtZKD3t0TmnhgwYWPyYSVtSE/c8b4rJePKR4wwvxM7nvxOPiHYso88iSwCwFZZiXYRwxpQqC9asigzHxN52CTtOadu5wqdJNvqgPt8Buxc7NH98Efh37ZlaOH2UnXyIixj8zXtGIavjc4zKtO8uER0gPC5uCgRJltEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BadjCGdxJaS1C/VHAx2nbfSH8BaqUgQYhvFdIBRKASA=;
 b=yNqQTlFA6aIHNID5ufUrQQiGDLM12f1n2UPix+frOsO4u4Vc7Bf9yIB+Gj5GkmPAzmdQ+tWdyPnWAjgs4B8WCmPcm/MvPhJDPQMjTiYegORZPEm59RggHu4cNTwWetV7t7c5VnQD8mmuJ96YVAVg0ihcvT60R8lijIRXrerIWS0FjuLDkAw/Pi1MjwKaSSQ2ozZTyt9QxdbelDXkFbWusO5BYfIauJXOGg7iNJaWo4fyBnDtaE9sm+O0XyWvlgbAvY1Zixml4aYv5w2P4uxbdFtMP0qewtsFkFucjU4WqTWgdmNC95PfFALlFKKrDmOI9Cisz4aqhZoxnvDGETwz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB6623.namprd11.prod.outlook.com (2603:10b6:a03:479::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 18:27:27 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 18:27:27 +0000
Message-ID: <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
Date: Mon, 20 Jul 2026 11:27:25 -0700
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:303:8d::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f987a79-2269-4a8f-89af-08dee68c8d5d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004|3023799007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: M4/vfDbaDGy/xD1/OWkzYP+66ybpIHkrH51zD4/GkG/uW1/glrmPMZL1UtykwAW9DnUlKT0Ih61DBHlYOGG9H6lcTXAJOEP0YxuWfs2K5WbDymu8WmCgzLStmDwtMae+3iIAVyVTkLAN9QNTLidc034xtnVEWsck4eHmQnkshLkSb3LDgxiCK4DW6jNMw6HEyPKkZSLxIl1YTCZXwJvm1AkVTlF9GMqVzTPzZ6QsuYfZ0q0X6iA53xPi5Nh6E9qJtzP0Zze4B8QkfZ1S0fWN9oBsmB+GrAKxcQqoLUbkAxcuzjBQN0T5nEOaB1wxPcJeh3G9wXiklZD3LhgOlMERNmiNl70UJqbA1CssX0PMztX0t9+/5p5/LjevpGguRz1e2dH8O6qUgpkJgANHgXrWRRXr7jcjOPRDPFj/IZs+on4yFnB9VlMw97V+hE+AchiLmDLd6X6SQM3yw7SCPv9k8iOW6h/eTr/pZ6YKPR0oEKm0PF8i39iDqLoEnTNJV48U1L/fP2B0xmdSI9+B5HtvKcCbTYlHxWDtFZWVAfejFcFAJsqQGl4rqGVTA/FztHnWNFBj6sPhFC3MlMtky/V6lHJu0+F7O14CoJFXoNp9F+5LrxAur1PZr1k4DAgJaAUpDEDcK2ot/XDPEMqjwDyf7sp00yi+teAvpQb/L1Fms7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004)(3023799007)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFE4aG5JZUp6a0JLRS9XU3o1Q0Zxc0FhUVhoM2g4TFk3dS9IOXdzK29Deldn?=
 =?utf-8?B?NVZQQ2FDb0ZsOERBM3I4dDJzVWE1OCs0NUFZeWhiYW9UYTU1VEk0RFpZd2pq?=
 =?utf-8?B?YnNNbVROYWNsYjU4NVpIL2o5TkZTaWtTTERuN0drQW1IbXQ2L2d0dXljRVRt?=
 =?utf-8?B?M1dlbmN0Vzg4VjNPMDdhVVdUUWpnWWUycTJvRVJRQWM4L2pBdEMrVUVhMG5Z?=
 =?utf-8?B?eDhBU3VYOVErM3dwQklrYUxhUGxncjJqcExpa3UwRXE0OUVmaU1HdHVXM1Rv?=
 =?utf-8?B?Z0hMcDF1WHZxRjEvMnJhUXgyUGg2aWJsdTdKaWlRNlZ6QkhLaXpHTVBzOE52?=
 =?utf-8?B?SzJNQXdZZGk4bFZjZURzSXNJNTVKc3NWWjg4QXBsUVFGMnNXVVd1aGdudUEr?=
 =?utf-8?B?MnlZSGhicWJIQVJvMWJGWDMvZHZaMEdsRWtHd0g1eTFiUkJHYVRWMWpHL0E4?=
 =?utf-8?B?blNoVUNWRUxnVi9VckV2ZUY0YVhJM0djRTNOc3BwWnlocUZvcU4rYUJleGtW?=
 =?utf-8?B?eTArNFpwb0ZUNnVvM2hTQmZqMCtFU1orN1B1QmE3bjdnYmlpRFRlZFcwTDZU?=
 =?utf-8?B?Q24zdy8zRjNQVitSV255cTNmdUp4bHc0bW40Q29uaHhmR2lyKzJ2dGRkREJL?=
 =?utf-8?B?eUY5c1ZpaGNwMzZpaVhXOXE5eUV1eTBLcUxzTlN3d3hvcklEWEt5NEVobndV?=
 =?utf-8?B?REM1eURnZlYwZTUrc1hrM3FYK3BUQnNSREttcG1wNmZGb0dPRnVoOXM5Vm5t?=
 =?utf-8?B?d05JQXlHMWZBeG52Ym5EYjl3ZEJid0NveWh4TEJXdUhBdjUvTmtYWTBXNnAw?=
 =?utf-8?B?U0trVXJYZ1NhMlpUbStKSXlJQXJDYzdXSm5YZWxYSURuQ1pYTkRWbTF2dm9L?=
 =?utf-8?B?b21kRnE2R2hBZTJHUUt6V1gwMFFlVS9lcDkxN3ZCL0VvaHMwUmluV054eVFs?=
 =?utf-8?B?cE93bkhLTGc0bWN6WVV2UzBGVC8zWnRnanpjbklqS2l2d2NqcVNyZ2lFRUJD?=
 =?utf-8?B?Ym1DSUlpRHlHTkhqaVUxakp3bDJ4aU1YSkVINGlLbTFST3pWNUN2WWlPT0ll?=
 =?utf-8?B?aU9lbUFsaUdXM0pld01sczNuYzFqNmxWb0lGSW9wa0FUcXFhb1VicWNBNUJt?=
 =?utf-8?B?akZUaEVaUnp1NmhicHNDeG9taGowU1pMQ201bXl0eTdMN3NOSVJoUkVCMWFL?=
 =?utf-8?B?NHMvNlF0bmpCTVU0VUxUeHA2cTI0cWQ5cWJBdDRyL3VBTkk5SjdiQkxBMW9p?=
 =?utf-8?B?NWVGTXdRcVJ5RmJBOVo3cW5WNGZXbDdxUnYzT3pEZFA5NkdvZ0FaaUVRZktR?=
 =?utf-8?B?Y3Q1L29vNExXUXVLYUhucWtrNVh5enQ2bkhOZ2ZBUFZyNjVyY0k0SkJHTHN4?=
 =?utf-8?B?ZWJzQ3lBaThxYkx6RmcrODV5R0RDUGlWVnZzNmJBSjYrS2wzbHhkMzRYV1A4?=
 =?utf-8?B?MDV0SXkxR2V2ZDlsWFd2MmdMZjByYTFWemlES3pZdzQ1Q3JOdnE1VVd2N2Qx?=
 =?utf-8?B?dWlxdVZvelQ1MWxlcXFiZEcwTkpCQmR3dGJOYnlwRWNJelJsanZRZjNQcDNM?=
 =?utf-8?B?WlliTzRYeCsxYU95SlZxZmVpT2F1MWxCVmYyV0JieERGS01IdENCd1puYWtV?=
 =?utf-8?B?MzJzakxRVGNXVFBsSS9QazRUUTdiU1dESmYvdHBoOGJtUHRjMnVzWm9Ia0xw?=
 =?utf-8?B?czJCUWE3clpXaDNtNnU5Vklhdit1a2xQQ3pMQWN1amRMS1hrckZGdi9LSEp3?=
 =?utf-8?B?SmM5ZWh3TEcwYUUzdytOaldJRjB5VE9Rc3BJSm9XTDRSMHFNVVZTS2V1Vmto?=
 =?utf-8?B?WlZldWFZMG5acFVrbit5VE9zWFN1a0ZVNFZmM2hqNXgyLzZhVXNoRXdpcXZU?=
 =?utf-8?B?MDZKb2pHaTJmMXZmcWxuREUxUkUyRlFPRGdRUDFEcTYzM2JGaEVFTmxSc3lB?=
 =?utf-8?B?MUxpWGFkaGNTZEZ5UkQ0VlZod0JsZXNiOWhERG9tWUVLbnp1RCt2Y296clJH?=
 =?utf-8?B?M1pyRGJ2aC9UNkc0dmRvVk5xZ0YxM1dkeUpEOVlQQS9vZS9kSGp3Wlp6b1V3?=
 =?utf-8?B?M0I5Q1J3VS83RzFrYzV6TWVERUw2anRsWSt4eE03eEwrc2VsWXZLM2M3cXRL?=
 =?utf-8?B?L0JBak5HRFFxRjZSeCtDNk5qTkk1Sm9WQWZJeGNHVE9Jb3VyRjZxM2h5L0tO?=
 =?utf-8?B?KytYWnlvVG81QlBrR0N6UnVUb3NnQy9zUG5lYk5CeTBoNTJ2RXY3QlNtMlJT?=
 =?utf-8?B?RlV0ajJxdWp3aGJZR01sTTRsc1ZoOE9WV2RnbDdSK2FTTlg2N3pqZ1l1RzQx?=
 =?utf-8?B?WEQxM2FOMzV2bjhzeG9qeGVZcy9RTEUxZDQ0eWtkemtZRk14TllObXB5TGtG?=
 =?utf-8?Q?B2BWd5uoxMISvQdQ=3D?=
X-Exchange-RoutingPolicyChecked: Q2x1pX1cXYGirwP5EPXL9SEjYYq0uVi0L0inACsFOtjFcOLUKQFthzLgg7v3X0IzeSjPY/GPPmruXlZPayN/kcz01XEm8AaBJjIr77hcmdX7+nylVXK9IqTv+YH19Cx7f73PqM4iJTtRLYxXoL0B/NHaoNlBlBKEle2T+VNTSrNPXhAX7c5XnW++CX6sL4TSqMcXnoLbD4hElC2Ysw6ldpzdTUDuNsl816D9s2G4CzaDTiVTYV90bjFt5JddzUZjmLNHrYLWq4xFJAS3Zl64fF0ePIAMLW8tj+79YxwkhfoVHTQ+2JUl34+37h3H1v40/RWj9s9REgJIEI1MaY+kRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f987a79-2269-4a8f-89af-08dee68c8d5d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 18:27:27.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8sCMOWFXd4ziBTn6UV4ZEKgE6wpwjBQ+brfIZKIHInk4eaaVOLzUlYmg8t5P5jaYaWRxkX5t4IvdHSMVXFo3eF1/HfKGiuFzldvBhrT+fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6623
X-OriginatorOrg: intel.com

Hi Babu,

On 7/20/26 10:00 AM, Babu Moger wrote:
> Hi Reinette,
> 
> Thanks for quick response.
> 
> On 7/17/26 17:56, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 7/17/26 2:13 PM, Babu Moger wrote:
>>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>> hardware that supports it. However, this can cause bandwidth monitoring
>>> failures with existing userspace tools such as pqos.
>>>
>>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>>> groups by default. On systems with 32 or fewer ABMC counters, this default
>>> configuration can consume all available counters, since each group requires
>>> one counter for local MBM and another for total MBM. If additional
>>> monitoring groups are created, counter resources are exhausted and pqos
>>> tool reports memory bandwidth counters as zero for those groups.
>>
>> It is not obvious to me that this is a problem. If I understand correctly
>> there are two scenarios possible with this pqos behavior:
>>
>> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>>    - pqos can create 16 or more monitor groups
>>    - hardware still supports a limited number of counters with consequence that
>>      underlying counters reset at any time as the different monitoring groups
>>      need to be tracked.
>>    - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>>      events would return "Unavailable", sometimes reading the events return data.
>>    - *None* of the monitoring numbers returned are guaranteed to be accurate.
>>
>> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>>    - pqos can create 16 or more monitor groups
>>    - only a subset of monitoring groups have counters assigned and these counters
>>      are guaranteed to only track the monitor groups/events they are assigned to
>>    - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>>      - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>>      - monitor group/event does not have counter assigned: monitoring numbers return 0
>>
>> If my understanding is correct then the preference is to rather have wrong data than
>> see 0? This does not sound right. What am I missing?
> 
> 
> This hardware can monitor up to 64 RMIDs without any counter resets.

How many RMIDs does the hardware claim to support via CPUID that ends up being shown to user
space via "num_rmids"?

I understood from original ABMC enabling that the underlying hardware counters of "default"
and "mbm_event" mode on AMD are the same. That is, in "default" mode the hardware does a
"best effort" assignment of hardware counters to events while "mbm_event" mode lets the user
control the assignment. It instead sounds like this is not the case and there are actually
two distinct underlying hardware counter mechanisms?


> As you know, the pqos tool creates COS1 through COS15 regardless of
> the command-line options used, resulting in a total of 16 groups
> including the default group. With ABMC enabled, this consumes all
> available ABMC counters(32 counters, 2 counters for each group).

> 
> When pqos is invoked with the -m option, it creates additional monitoring groups. For example:
> 
> pqos -m all:0     -> creates 1 monitoring group
> pqos -m all:0,1   -> creates 2 monitoring groups
> 
> 
> Since all ABMC counters have already been allocated to the default
> set of groups, no counters remain for these additional monitoring
> groups. As a result, the monitoring commands report zero values,
> effectively making monitoring unusable.
> 
> In contrast, the default monitoring mode can still support up to 48
> additional monitoring groups (64 total RMIDs minus the 16 default
> groups created by pqos).
> 
> For this reason, I still believe keeping the default monitoring mode as the default is the better option.

It is not clear to me where the "64" number comes from. Even if resctrl sets the "default"
mode as default, what will happen to the scenario you describe and 49, instead of 48,
additional groups are created? From what I understand the moment the 65th group is created user will
transition from "accurate per monitor group monitoring data for all 64 monitoring groups" to "inaccurate
per monitor group monitoring data for all 65 monitoring groups" with no indication that this is happening?

I believe AMD supports more than 64 RMIDs and in this case there seems to be three ranges:
[supported by ABMC, depends on events but lets say RMID 0 to 16] < [RMID 17 to 64] < [RMID 65 to total number of RMIDs supported]

Current default "mbm_event" mode uses ABMC so as you state this always results in:
- accurate counts for 16 monitor groups
- zero for all other monitor groups up to total number of RMIDs supported

As I see it switching to the "default" mode would result in:
Scenario 1, 64 or fewer monitor groups are created:
- accurate counts for all monitor groups
Scenario 2, 65 or more monitor groups are created:
- inaccurate counts for all monitor groups

I do not believe there is any way for user space to know when or if system switches from "scenario 1" to
"scenario 2" on these systems and this unpredictable behavior that results in wrong data does not
sound ideal to me.

Reinette

