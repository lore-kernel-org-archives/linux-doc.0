Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5252C0261;
	Tue, 16 Jun 2026 23:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653344; cv=fail; b=GTyD6gm4IeiIrlDY9ZcHbsfHtG4M0EeX3H0Wv3THBr41DSTFUlO/6xbTayuiqSGYtpCXOHcquZWQky3IESwa+HJ5REej7v2MoxO5u20kwLGAdJZ0HL3XKhyl5RngETMGM7AMu0smvfTw7GHbqLgib793UGHREXGueFudjRP7XhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653344; c=relaxed/simple;
	bh=MVEPMH0tWL2BsHY9BnBkD1KF6XHbRK3iUvtVmdNEOfY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U9aB7i7bdRVhRDLSRn51eNA3L14P8pP1UE8H/zkLQPTzXuPwML1OM0INQw/YmuQpxWqhT+9yLOx++2MzwHtgVC+gnESAlkU3N8ONoTFQknFwSOOJ3c6bMVVPRbwT1JZ1Bk8RdKQ3zuHJfs490AT4AcC+Et6+PpQMQ7EXvLUgN7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeFPhkQn; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeFPhkQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781653343; x=1813189343;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MVEPMH0tWL2BsHY9BnBkD1KF6XHbRK3iUvtVmdNEOfY=;
  b=aeFPhkQn+ncoeaJk9A59pUyQ1aJZOzMKE+ZEj93HIllcCb/wuxUSf4jc
   01Bk/VhxjLb2/NPMwmGVBKauzLWCkzwD3wftLn8YyhAAqaunwlNHa67ZT
   nX/WsSUNKz2J2XqGdgwJKK4vt2S/2pcvhAAumFYAaNPg77x7fUNCHMKp2
   m4jzbho0GrmuqTLs4yZWrfaV6Ho6SE9VpWeTj2BAJfIHbgUOuBD2d0XI/
   cMGyIm1VSJPinoNVYMYrv1x/iM8TewGS2W2FUmRTh//OX6gBimIklX2Fu
   CqGVH49C05VLsP07X1nTF9CRxwPFZR4/BoPFfSpSNbZUJXq4zG/22H6Jd
   Q==;
X-CSE-ConnectionGUID: ecr/JvUTSCaeRNONLvO2BQ==
X-CSE-MsgGUID: EZVCwRY3SzyyK7se2Eu0Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82519123"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82519123"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:42:22 -0700
X-CSE-ConnectionGUID: iCo6U7MOQRqli46QyBdW/A==
X-CSE-MsgGUID: SJIH8u7KTpGUh7i2xG5EUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252226750"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:42:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:42:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:42:21 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3NrjfpNtMcJ4WbKEAPQrhHxGVbJQY6m3fv21YeEHl7MFK6JYhYyqXrC/aB8piRjk7tKDkzPnFMbRta15hFjizgfa5L9fqMYQAyyJyuwO8tjwLqqcA9w+SY4fo0kgFvlMGk3ZnLjeZcQNJTdGkxZHENf/JDv2riAyWkdO4yeGOmBUzN95XUkD++xoE7Ptco9CQFeK4eFwq+wxegXJhVRtUudu2z3eLVZuaRy3lzGm6yTDTAWlRLf71/jYHoR1UUEYtz2tDGbrA+dfBQNL0z4laFncq3Gr9/wl3QOEMWxyF3TP+oDNFA9U8dBgUF++YvHUyAwm/fvPAgRnitj4aJzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOfebumjZuNSjYE2E2d20udeJQIntAIfRurkvKB799I=;
 b=YhQLlMSlhdlZ5EhSpH/aYwmkWihX9VnkuluPH4Rwrfwhl76ebN9XI6lCQMsXYs0W3iGaPspSw3IZU7MdlSfWf8E9l7y885BYceAu+ULF6wmwIp950E+CpEW6W2ZT5uabRjvzinviKKkD7f2HykR+bb0Etj4pFv+2NPkF2mdWYSHka6a57+dsNJBvSgR/WAk9Xly5V1iLANpfptk5mZ4C/odoB1gr4TtxbS1VnFJySulgJUM732yngRjdIsLEB/YqU5JiVHC9x4EMPuEdpG6lUj4WFq1Nd3FDyanizR385FX1nEe3NMacjlQ1BvhSYumnI2mxQp7uydDpEDClSpn2OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:42:16 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Tue, 16 Jun 2026
 23:42:15 +0000
Message-ID: <57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com>
Date: Tue, 16 Jun 2026 16:42:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] fs/resctrl: Make info/kernel_mode writable and
 identify the bound group
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
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <768d4b603542f3202ece4294c808dbbf1a8e3008.1777591497.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <768d4b603542f3202ece4294c808dbbf1a8e3008.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0297.namprd04.prod.outlook.com
 (2603:10b6:303:89::32) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFBC9025319:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e0f8c7-0912-403e-cb97-08decc00e5a0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|6133799003|56012099006|3023799007|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sX6O0qd4SNlKFPWOmatYyE5qpN9bN6Of4ZG1GDJH7exTHpWFLp9LgXFf0Y850mw9cc6At532JJaN1Ycn/gHvyLGIlnkFy0lkDYH+mZ41wdM9nZUCy1BVn20CxxNp2fLJf7FU3k9itt7PLGBNLfvWtKREK9PYcK8wUv6QmbGQ1guQ57NlaqK1cdtnuzPrh9o6xR5mf+QlXw5asanF8kpv3aRRyt6wyASrQg3RH2HGJRJbjrc8pm5zGRNrM2LTg6f/Hcar9mf+Jqi5ZE9CZdUYCTBFTxzfokQT9wN9ygVbo6Mz+iESdJEXkOufg4R/7JWzUxk46p36z2+Z+JfwTIY7HoUFmP4j1G+4roycAPD7zXKJa0lloN6DtkCrV5Eu6vwXtHljaKMr8meSr/3cX+9wnRAuouFkTJ8OkuORRt5MFqPLAn5T3DVzw8NrPXD3nZIPGkXad+OaiBOUDCKu1q5pRA0lzb2i6ZpukG8xC6Gah9V8xXLLDIyyVBMU8ovKtS9MbLDBHrQrVNU07vQsknpq+94Y9e6H4pxV2R3b/6ivKKUqOoNiArLWCgBx7wtM/8E8WH2Pjga/9f5xLIS7l14Cmp5sFGOoivYUr0qW8uZGLi8S5cuw6Prm4sd9oItt4+fgqaNKzQfhzx/b/UvTbA8CydR+kS6YcHDaFEtHYhk535jLdgiUCsliE9SJVCeiVKuq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(56012099006)(3023799007)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFRsVU1rWTN6dkI2cEdUZlZNRkNmbVo5OFhqTkcvTjRLc09WRzNiNHBKVGpX?=
 =?utf-8?B?d2g0b2o4dllLZzVWWXhxVnU4NEF5T3N4K1ZnUjIxbUVodjcxM21yOU5kVmpI?=
 =?utf-8?B?MWVZOTFoZ3lEaENtZ2Jxck1TTXlWZGlLOEM1cEZIZzh1bnhCd1JtczRINjlQ?=
 =?utf-8?B?OVVqRC9WR2llZGxlQUdsZHJNTmJOazBUb25xQWU3M1NpSTR6anFPQSs3VTJl?=
 =?utf-8?B?Mm1WSk0ra3pFZkQzOHVERUswcVJ2NDNtdlFDUjl2UVVZZndsWDlraTlBejRL?=
 =?utf-8?B?QUk0K2Q1STQ5OFdNMjhkUnN5WDBlMTJQWHlleHJSbGxVSnBaRG9ER0dYdUpL?=
 =?utf-8?B?UEJocVhucWZFdHRmUUsvUFZvOEh0anF4S3M2SUJ3TVNrSlNSVjlWdHZKMXMw?=
 =?utf-8?B?a0gzTDU1aTdReWo1OUMvM0k5QjM4TnJYeCt4clA3d251WXJxNS9IWVVZWFJj?=
 =?utf-8?B?a0NZL09lbThjU1hVMUlhYWN6NXlvc284dCtnb0JGUmZqS0t3TCtJdWZMaFY2?=
 =?utf-8?B?cGpiTGN3OXQ1OFUrSzUzOW1qQUNHUjkzRFA1WlRlUVplbFRqbk1rTHhLSlVM?=
 =?utf-8?B?ZE9pM05WemxXc3Avc0hGek5CNklzQ09pRURuZGN2RG03cGtwSk9td1grRkVq?=
 =?utf-8?B?OSt2c0RCajgvR3l0WHNaa1VOTjl0c05zNGcrcGlpRWk3Ri8yOFdyMlZHRFBI?=
 =?utf-8?B?ZGJqTTJvRnVSTVBLa1ZwK1YxWmNQSDJJVHN2ZTVuanczSGJKdVBxVWRrMnlF?=
 =?utf-8?B?dHRxTG5ZSjEwa3RqU2U0ZHU2clc4RTdiYUhPS0hyaXB1a2d5Vk9WcStWR05z?=
 =?utf-8?B?TUExQ09La3NIMmhWS2IrUkp6UEVwc3QwM2dBLy85Zk5uVDJ2STNiczY2RkhJ?=
 =?utf-8?B?ays2NkVxY3JqellQd1h2NmNDdjBjcDVJVGdidS9kS0dzTVhERmlXSzhjU2F1?=
 =?utf-8?B?SVNrNWNmNjRqWTZ5bGFreFpQWW12dy9ncDRxc0d4Z1hpckFicHBydkd3clFR?=
 =?utf-8?B?a2VrUkVNTHlVb0RSRlowd2FrYS94ZFJyQW5JajBEMTJKWEFZbDhqNFh5bm9U?=
 =?utf-8?B?U0Fub2QyQVIyaDJSdEVVcHVuTkJGeUlmMTNDdmhaVEZ0ME1VOElNYWRob2p3?=
 =?utf-8?B?Vk1Mc2VBWGtPK1NoOVRzSkFGSlowQzBQOUFXazZ2R3ZYNWJKT0tvbWd6aWR6?=
 =?utf-8?B?QnRjM1FCcnRrWTRBN1k5blRZekdmeHo4VTNUQy9ud1Nad1Z0R0lnb3NNcFJO?=
 =?utf-8?B?UmVUU3luUnRZYU9jZVptdUt6SUEzQkJxV1JGeGxqZ2Z4cUlOT3RacklnVkJi?=
 =?utf-8?B?OGlCM3g5Qm5rZkJEMTFnSEJOaVo2YU9Ec3pVYkY0UVZxZjZKem5HV1RVUDNq?=
 =?utf-8?B?WGYwN1VBdkZSc2I1RUVXZGRLUlJVQ0ZEZGxaUmdsYTgxeTZuVDFJTW5xVkIz?=
 =?utf-8?B?bEVRS3BFWDY3c2RlL3MyY2lQWXNsdVhxMUsrQzQ1cFBEbWRGWWhjVlAvaklX?=
 =?utf-8?B?NVNJSUxYaXJtbmFGd3FWcGFDa1M1QUUwRHQyNW4xaVY2MW1Lb21JZ2U4ZEZn?=
 =?utf-8?B?cm5wYzNoT2VtZTl1T0oxMWViMXc2c3RFY3VYZlRhS0RiZGdlczBpR3ozL090?=
 =?utf-8?B?L3F0UmpvbFZqbEpQMzE5QU13YzV4SzFGVXRNM0Y4L1NjSkVjVk5HeHdsWEhY?=
 =?utf-8?B?SDNhNHMvdGZmMXlpUitJZEhwVG9udTB6WFI0ZUkweVF4dDdPc1UxRUsrZU1p?=
 =?utf-8?B?NkhDNHRMNllQN1k3d3QrMHZMOXJ0VUxBRzdiMkNSU2RGZzRQY1hWZEFMVjlM?=
 =?utf-8?B?ZXl5LzkwU29sSG9EYnNIdFVwVEY4UnFVNTQwZXloOEVCUWh1U1dJU0RqbkxE?=
 =?utf-8?B?VDFxeGNiZmJ1QTdDNnFWdmdvaXV6bWU3UHBrYkxrNGVERkRURmRWeml4eUs4?=
 =?utf-8?B?ZUgvNzZRS1VsWVArTHc4amZ5WXhlMzNkTStMYjE3ZWN0U0pDTGFxWU5LTVpX?=
 =?utf-8?B?TDlNOE55bGMzL1BVNjRxTlpUem9uRCsvQ1lYQldSWEZHUE01c0wrMEZPZjBk?=
 =?utf-8?B?SFZ1OGxRV0FWSXhzci9FMk1GWGljOTcxdVJaRThvTVlFc25kT3RHS3BwL1JJ?=
 =?utf-8?B?K3NzMm5YL3kzelh4UUd4SXgyY25BTUFIWlJUOUpPdTcraXZwbTViZlZqZDdI?=
 =?utf-8?B?cWM3YVQ5aVYwYVBhK1EvVno5R1ZVM3BnVG5tdGxCV2tYU3dtbnkxU3dwYXRE?=
 =?utf-8?B?Q1JDSi96clpjdWpYV1VFOHpUU29RNXBYT2dBaWljeHd6dnZoanNKWE5IRHUz?=
 =?utf-8?B?UmxIU0g1ZEVLTVFUMGRxdDJVK3Nhck1YMHZwajdmcU9OU3Faa3B3TWRqSVpC?=
 =?utf-8?Q?Sa+KVtgZpKRQrNeE=3D?=
X-Exchange-RoutingPolicyChecked: K6e/kQLySRM/ADLDCk/Bn/aq9MDSbSw3v0CW8piQcs2Mu/8F4GD1nZlJkMcwJyJbl8TueqGiI+zv3C5F1djPQIGN1zstzwv+uA3eEcyNpHlmu260hyHwpr7D3Yx6Osksg8cKmJyC+UOcI8Q5a/sYawjQjdCax37wjW/5f8Ho2MHVL6JpeCajLSQyD5hEWjXh7vdZIJkvLKgpa93GapddFN5J67e3R6SO1/6kvdq95mebHDzaxxe8csSo3sIJhENAri56+I595qEJOLx4zknzAgMWrPa0Awo2AEhxhH26jppFWbsGQD+8TK802zEcfpTtaRP29LNjEGmHVv4LDGlEpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e0f8c7-0912-403e-cb97-08decc00e5a0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:42:15.9046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1xflKESFvy4laBzKDiDMlCZ7K5zCnp1llfnZR8fHNkkriojKpoufL26fW6FV3LDYzTWYqZyhei1AwzluaDEhYFV2lcbGGjkxIRSD6fpV3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> info/kernel_mode lists the kernel-mode CLOSID/RMID policies the kernel

(also here please drop the x86 specific details and consider the resctrl
fs changes to be valid from MPAM perspective also)

> supports and the one currently active, but user space has no way to
> switch policies or rebind to a different rdtgroup, and the file does
> not name the group that owns the kernel CLOSID/RMID.

This adds a new feature. No need to describe this change as a bugfix.

> 
> Make info/kernel_mode writable.  The format used by both read and
> write is one line per mode:

This sounds like multiple modes can be written to the file as long as they
are separated by newline? I do not think it should be needed to support
write of more than one mode at a time.

> 
>   inherit_ctrl_and_mon:group=none
>   [global_assign_ctrl_inherit_mon_per_cpu:group=g1//]
>   global_assign_ctrl_assign_mon_per_cpu:group=none
> 
> The active mode is wrapped in "[...]" and ":group=<ctrl>/<mon>/" names
> the bound rdtgroup ("//" for the default control group).  Inactive
> modes report ":group=none".  Documented in
> Documentation/filesystems/resctrl.rst.

Above describes the output of the file. This changelog can just focus on
what needs to be supported when user space writes to the file.

> 
> The write path strims input, strips the optional "[...]", validates

strims?

Wait, why support the brackets as input? This seems unnecessary.

> the mode against resctrl_kcfg.kmode, and resolves the optional
> ":group=" suffix via the new helper rdtgroup_by_kmode_path().  An
> omitted suffix or an INHERIT-mode write binds to the default group.
> On success, rdtgroup_config_kmode_clear() tears down the previous
> binding and rdtgroup_config_kmode() programs the new one before
> resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur are updated under
> rdtgroup_mutex.  Allocation failures in the helpers are propagated so
> the write fails atomically.

This also reads like it just describes the code.

> 
> Add struct rdtgroup fields kmode and kmode_cpu_mask to track the
> per-group binding.

Please do not just describe the code but *why* this change is needed and
what it means and how it is used.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v3: New patch to handle the changed interface file info/kernel_mode.
> ---
>  Documentation/filesystems/resctrl.rst |  51 ++++
>  fs/resctrl/internal.h                 |   6 +
>  fs/resctrl/rdtgroup.c                 | 375 +++++++++++++++++++++++++-
>  3 files changed, 431 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b003bed339fd..89fbf8b4fb2a 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -522,6 +522,57 @@ conveyed in the error returns from file operations. E.g.
>  	# cat info/last_cmd_status
>  	mask f7 has non-consecutive 1-bits
>  
> +"kernel_mode":

(dropping the documentation here since I believe earlier comments apply)

...

> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 1a9b29119f88..9435ce663f54 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -216,6 +216,10 @@ struct mongroup {
>   * @mon:			mongroup related data
>   * @mode:			mode of resource group
>   * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
> + * @kmode:			true if this group is currently bound as the kernel-mode
> + *				CLOSID/RMID owner (resctrl_kcfg.k_rdtgrp)

(drop CLOSID/RMID)

> + * @kmode_cpu_mask:		CPUs scoped for this group's kernel-mode binding;
> + *				when empty, all online CPUs are used

Why does "empty" signify "all online CPUs"? This complicates implementation and
creates different interface from existing CPUs interface of resource groups.

>   * @plr:			pseudo-locked region
>   */
>  struct rdtgroup {
> @@ -229,6 +233,8 @@ struct rdtgroup {
>  	struct mongroup			mon;
>  	enum rdtgrp_mode		mode;
>  	enum resctrl_event_id		mba_mbps_event;
> +	bool				kmode;
> +	struct cpumask			kmode_cpu_mask;
>  	struct pseudo_lock_region	*plr;
>  };
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 9cdcfa64c4a2..5383b4eb23ed 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1055,6 +1055,378 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +/**
> + * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
> + * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
> + *
> + * Derives CLOSID/RMID from @rdtgrp->type:
> + *   - RDTMON_GROUP: parent control group's CLOSID with the monitor group's RMID.

This seem unnecessary since when a monitor group is created it's closid is inherited
from it's control group?

> + *   - RDTCTRL_GROUP: the control group's own CLOSID and default RMID.
> + *
> + * Calls resctrl_arch_configure_kmode() with the kernel-mode binding enabled
> + * on the online subset of @rdtgrp->kmode_cpu_mask (or all online CPUs when
> + * that mask is empty), and disabled on the complementary online CPUs so
> + * stale enable bits from a previously bound group are cleared in the same
> + * reprogram step.  The caller (resctrl_kernel_mode_write()) is responsible
> + * for validating that the (kmode, group type) pair is permitted before
> + * invoking this helper.
> + *
> + * Context: Caller must hold rdtgroup_mutex.

Please use lockdep_assert_held(&rdtgroup_mutex) instead. See "Documenting locking requirements"
in Documentation/process/maintainer-tip.rst

> + *
> + * Return: 0 on success, -EINVAL for a pseudo-locked group, -ENOMEM if
> + * cpumask allocation fails.
> + */
> +static int rdtgroup_config_kmode(struct rdtgroup *rdtgrp)
> +{
> +	cpumask_var_t enable_mask, disable_mask;
> +	u32 closid, rmid;
> +	bool need_disable;

(needs reverse fir)

> +
> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
> +		rdt_last_cmd_puts("Resource group is pseudo-locked\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!zalloc_cpumask_var(&enable_mask, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	need_disable = !cpumask_empty(&rdtgrp->kmode_cpu_mask);

As I understand rdtgroup_config_kmode() is called when the kernel mode is switched.
Also, earlier patches made it explicit that "Default scope is all online CPUs".

It is not clear to me how kmode_cpu_mask is initialized here ... it almost seems as though
if a resource was associated with a mode at some point and received some CPU changes then
when the mode switches between some other resource groups and then back to the original
then the old cpu_mask will be used on the mode switch. Should the resource group's cpu_mask
not be re-initialized to all online CPUs? If done then all of this cpu_mask wrangling seems
unnecessary to me, just use all online CPUs?


> +	if (need_disable && !zalloc_cpumask_var(&disable_mask, GFP_KERNEL)) {
> +		free_cpumask_var(enable_mask);
> +		return -ENOMEM;
> +	}
> +
> +	if (rdtgrp->type == RDTMON_GROUP) {
> +		closid = rdtgrp->mon.parent->closid;
> +		rmid = rdtgrp->mon.rmid;
> +	} else {
> +		closid = rdtgrp->closid;
> +		rmid = rdtgrp->mon.rmid;
> +	}

Considering MON group inherits the CLOSID if its parent, can above be simplified
to just be?
	closid = rdtgrp->closid;
	rmid = rdtgrp->mon.rmid;


> +
> +	/*
> +	 * Empty kmode_cpu_mask: enable on every online CPU.  Otherwise enable
> +	 * only CPUs in the group mask and explicitly clear on other online CPUs
> +	 * so a previously bound group's enable bits don't linger.
> +	 */
> +	if (!need_disable) {
> +		cpumask_copy(enable_mask, cpu_online_mask);
> +	} else {
> +		cpumask_copy(enable_mask, &rdtgrp->kmode_cpu_mask);
> +		cpumask_andnot(disable_mask, cpu_online_mask, &rdtgrp->kmode_cpu_mask);
> +	}
> +
> +	if (!cpumask_empty(enable_mask))
> +		resctrl_arch_configure_kmode(enable_mask, closid, rmid, true);
> +
> +	if (need_disable && !cpumask_empty(disable_mask))
> +		resctrl_arch_configure_kmode(disable_mask, closid, rmid, false);
> +
> +	rdtgrp->kmode = true;
> +
> +	free_cpumask_var(enable_mask);
> +	if (need_disable)
> +		free_cpumask_var(disable_mask);
> +
> +	return 0;
> +}
> +
> +/**
> + * rdtgroup_config_kmode_clear() - Tear down the kernel-mode binding on @rdtgrp
> + * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
> + *		May be %NULL when no group is currently bound, in which case
> + *		this is a no-op.
> + * @kmode:	Kernel-mode policy currently active on @rdtgrp, as a
> + *		BIT(&enum resctrl_kernel_modes) value.  When this is
> + *		BIT(INHERIT_CTRL_AND_MON) the hardware tear-down is skipped
> + *		because no MSR was previously programmed.
> + *
> + * Disables the kernel-mode binding on the CPUs @rdtgrp covers (its
> + * @kmode_cpu_mask, or all online CPUs when that mask is empty) and resets
> + * the per-group bookkeeping (@kmode and @kmode_cpu_mask).  This is the
> + * disable counterpart of rdtgroup_config_kmode() and exists so that a write
> + * that transitions the active mode to BIT(INHERIT_CTRL_AND_MON) -- which
> + * skips rdtgroup_config_kmode() entirely -- still tears down the previously
> + * bound group instead of leaving stale enable bits behind.
> + *
> + * On allocation failure the function returns -ENOMEM and leaves both the
> + * hardware state and @rdtgrp's bookkeeping unchanged so the caller can fail
> + * the operation atomically and last_cmd_status reflects reality.
> + *
> + * Context: Caller must hold rdtgroup_mutex.
> + *
> + * Return: 0 on success (including the @rdtgrp == %NULL and INHERIT cases),
> + * -ENOMEM if cpumask allocation fails.
> + */
> +static int rdtgroup_config_kmode_clear(struct rdtgroup *rdtgrp, int kmode)
> +{
> +	cpumask_var_t disable_mask;
> +	u32 closid, rmid;
> +
> +	if (!rdtgrp)
> +		return 0;
> +
> +	if (kmode == BIT(INHERIT_CTRL_AND_MON))
> +		goto out_clear;
> +
> +	if (!zalloc_cpumask_var(&disable_mask, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	if (rdtgrp->type == RDTMON_GROUP) {
> +		closid = rdtgrp->mon.parent->closid;
> +		rmid = rdtgrp->mon.rmid;
> +	} else {
> +		closid = rdtgrp->closid;
> +		rmid = rdtgrp->mon.rmid;
> +	}

Same comment as above ... but actually, why is closid/rmid needed at all? This
function is intended to *reset* the kernel mode so needing a valid/active closid and
rmid does not look right.

> +
> +	if (cpumask_empty(&rdtgrp->kmode_cpu_mask))
> +		cpumask_copy(disable_mask, cpu_online_mask);
> +	else
> +		cpumask_copy(disable_mask, &rdtgrp->kmode_cpu_mask);

Having kmode_cpu_mask accurately reflect the online CPUs will simplify this to
not need any of this wrangling and kmode_cpu_mask can just be used directly.

> +
> +	resctrl_arch_configure_kmode(disable_mask, closid, rmid, false);
> +	free_cpumask_var(disable_mask);
> +
> +out_clear:
> +	cpumask_clear(&rdtgrp->kmode_cpu_mask);
> +	rdtgrp->kmode = false;
> +	return 0;
> +}
> +
> +/**
> + * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
> + * @ctrl_name:	Control-group name, or "" for the default control group.
> + * @mon_name:	Monitor-group name, or "" to select the control group itself.
> + *
> + * Matches the path syntax emitted by resctrl_kernel_mode_show():
> + *   "//"            - the default control group
> + *   "<ctrl>//"      - control group @ctrl_name
> + *   "/<mon>/"       - monitor group @mon_name under the default control group
> + *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
> + *
> + * Context: Caller must hold rdtgroup_mutex.

(lockdep)

> + *
> + * Return: Pointer to the matching rdtgroup, &rdtgroup_default when both
> + * names are empty (the show form "//"), or NULL if no such group exists.
> + */
> +static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
> +					       const char *mon_name)
> +{
> +	struct rdtgroup *rdtg, *parent = NULL, *crg;
> +
> +	/* Show emits "//" for the default control group; round-trip it here. */
> +	if (!*ctrl_name && !*mon_name)
> +		return &rdtgroup_default;
> +
> +	/* Control-group-only form: "<ctrl>//". */
> +	if (!*mon_name) {
> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
> +			if (rdtg->type != RDTCTRL_GROUP)
> +				continue;
> +			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name))
> +				return rdtg;
> +		}
> +		return NULL;
> +	}
> +
> +	/* Monitor-group form: locate the parent control group first. */
> +	if (!*ctrl_name) {
> +		parent = &rdtgroup_default;
> +	} else {
> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
> +			if (rdtg->type != RDTCTRL_GROUP)
> +				continue;
> +			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
> +				parent = rdtg;
> +				break;
> +			}
> +		}
> +		if (!parent)
> +			return NULL;
> +	}
> +
> +	list_for_each_entry(crg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
> +		if (!strcmp(rdt_kn_name(crg->kn), mon_name))
> +			return crg;
> +	return NULL;
> +}
> +
> +/**
> + * resctrl_kernel_mode_write() - Select kernel mode and bind group via info/kernel_mode
> + * @of:		kernfs file handle.
> + * @buf:	One line in the same format emitted by resctrl_kernel_mode_show(),
> + *		i.e. "<mode>[:group=<ctrl>/<mon>/]" with an optional surrounding
> + *		"[...]"; must end with a newline.  The ":group=<spec>" suffix is
> + *		optional -- when omitted the default control group
> + *		(&rdtgroup_default) is used.
> + * @nbytes:	Length of @buf.
> + * @off:	File offset (unused).
> + *
> + * Parses @buf, validates that <mode> is listed in resctrl_mode_str[] and is
> + * supported by the platform (resctrl_kcfg.kmode), resolves <ctrl>/<mon>/ to
> + * an existing rdtgroup (or picks &rdtgroup_default if no group was specified
> + * or if the new mode is INHERIT), clears any previous binding via
> + * rdtgroup_config_kmode_clear(), programs hardware via
> + * rdtgroup_config_kmode() when @kmode is not BIT(INHERIT_CTRL_AND_MON), and
> + * on success updates resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur.  The
> + * display-only "group=none" form produced by show for inactive modes is
> + * rejected.  Errors are reported in last_cmd_status.
> + *
> + * Return: @nbytes on success, negative errno with last_cmd_status set on error.
> + */
> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
> +					 char *buf, size_t nbytes, loff_t off)
> +{
> +	char *mode_str, *group_str, *slash;
> +	const char *ctrl_name, *mon_name;
> +	struct rdtgroup *rdtgrp;
> +	int ret = 0;
> +	size_t len;
> +	u32 kmode;
> +	int i;
> +
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +	buf[nbytes - 1] = '\0';
> +
> +	/* Tolerate surrounding whitespace before the bracket/mode parsing. */
> +	buf = strim(buf);
> +	len = strlen(buf);
> +
> +	/* Strip the optional "[...]" that show uses to mark the active line. */
> +	if (len >= 2 && buf[0] == '[' && buf[len - 1] == ']') {
> +		buf[len - 1] = '\0';
> +		buf++;
> +		len -= 2;
> +	}

I do not think the brackets should be valid input.

> +
> +	/*
> +	 * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
> +	 * and when omitted the default control group (&rdtgroup_default) is used.
> +	 */
> +	group_str = strstr(buf, ":group=");
> +	if (group_str) {
> +		*group_str = '\0';
> +		group_str += strlen(":group=");
> +	}
> +	mode_str = buf;
> +
> +	mutex_lock(&rdtgroup_mutex);
> +	rdt_last_cmd_clear();
> +
> +	for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++)
> +		if (!strcmp(mode_str, resctrl_mode_str[i]))
> +			break;
> +	if (i == RESCTRL_NUM_KERNEL_MODES) {
> +		rdt_last_cmd_puts("Unknown kernel mode\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (!(resctrl_kcfg.kmode & BIT(i))) {
> +		rdt_last_cmd_puts("Kernel mode not available\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	kmode = BIT(i);

Can kmode be of enum type to be assigned the actual enum value to avoid all these BIT(enum value) usages?

> +
> +	if (!group_str) {
> +		/* No ":group=" suffix: fall back to the default control group. */
> +		rdtgrp = &rdtgroup_default;
> +	} else if (!strcmp(group_str, "none")) {
> +		/* Display-only placeholder emitted by show; not selectable. */
> +		rdt_last_cmd_puts("Cannot bind to 'none' group\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	} else {
> +		/* Require exactly "<ctrl>/<mon>/" - two '/' with the second terminating. */

User should not be expected to provide monitor group when the monitoring is inherited.

> +		slash = strchr(group_str, '/');
> +		if (!slash) {
> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +		*slash = '\0';
> +		ctrl_name = group_str;
> +		mon_name = slash + 1;
> +		slash = strchr(mon_name, '/');
> +		if (!slash || slash[1] != '\0') {
> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +		*slash = '\0';
> +
> +		rdtgrp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
> +		if (!rdtgrp) {
> +			rdt_last_cmd_puts("Group not found\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +	}
> +
> +	/*
> +	 * INHERIT mode binds nothing; force the bound group to the default so
> +	 * round-trips with show (which prints "group=//") are stable and any
> +	 * user-supplied :group= suffix is silently normalised.
> +	 */
> +	if (kmode == BIT(INHERIT_CTRL_AND_MON))
> +		rdtgrp = &rdtgroup_default;

rdtgrp = NULL ?

> +
> +	/* No-op if the same mode is already active on the same group. */
> +	if (resctrl_kcfg.kmode_cur == kmode && resctrl_kcfg.k_rdtgrp == rdtgrp)
> +		goto out_unlock;
> +
> +	/*
> +	 * global_assign_ctrl_assign_mon_per_cpu binds one CLOSID and RMID for
> +	 * all kernel work (Documentation/filesystems/resctrl.rst uses
> +	 * "<ctrl>/<mon>/", i.e. an RDTMON_GROUP).
> +	 *
> +	 * global_assign_ctrl_inherit_mon_per_cpu assigns one CLOSID globally
> +	 * while leaving RMID inheritance to user contexts; that uses the
> +	 * control group's CLOSID slot only, i.e. an RDTCTRL_GROUP.
> +	 */
> +	if (kmode == BIT(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU) &&
> +	    rdtgrp->type != RDTMON_GROUP) {
> +		rdt_last_cmd_puts("global_assign_ctrl_assign_mon_per_cpu requires a monitor group\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +	if (kmode == BIT(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU) &&
> +	    rdtgrp->type != RDTCTRL_GROUP) {
> +		rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	/* Switching to a different group: release the old binding first. */
> +	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
> +		ret = rdtgroup_config_kmode_clear(resctrl_kcfg.k_rdtgrp,
> +						  resctrl_kcfg.kmode_cur);
> +		if (ret) {
> +			rdt_last_cmd_puts("Failed to release previous kernel-mode binding\n");
> +			goto out_unlock;
> +		}
> +	}
> +
> +	if (kmode != BIT(INHERIT_CTRL_AND_MON)) {
> +		ret = rdtgroup_config_kmode(rdtgrp);
> +		if (ret) {
> +			rdt_last_cmd_puts("Kernel mode change failed\n");

If it fails here then previous binding was released successfully but new binding failed. What is
state of system?

> +			goto out_unlock;
> +		}
> +	}
> +
> +	resctrl_kcfg.k_rdtgrp = rdtgrp;
> +	resctrl_kcfg.kmode_cur = kmode;
> +
> +out_unlock:
> +	mutex_unlock(&rdtgroup_mutex);
> +	return ret ?: nbytes;
> +}
> +
>  void *rdt_kn_parent_priv(struct kernfs_node *kn)
>  {
>  	/*
> @@ -1960,9 +2332,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "kernel_mode",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= resctrl_kernel_mode_show,
> +		.write		= resctrl_kernel_mode_write,
>  		.fflags		= RFTYPE_TOP_INFO,
>  	},
>  	{

Reinette
