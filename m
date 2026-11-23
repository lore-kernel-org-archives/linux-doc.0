Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476574;
	b=MbapFLbWqw0Lj8wafbgDicx0hTF1DLaZHazrFCRo8YE6cIvzpTUCTMnJufDNL/cPGEze
	 V89rJSpYgg7PUznaCPoBz4zqnb12SyIpu0XYL2TVHEtTV4kIlmY5UU5mJhlsqVt2/Ssur
	 xAgFwTkakao5MLCTY4AAjLlG62A/vTFmZufwvBUZD2OeyYXkkMnqCtlH6VosbcZBki4Vw
	 Fa25E+yQG0wi19omy4MknNsuTQKrYZzKq7vkP7IWRP+/yZE7wATOrMoyeJTZya3IjYbku
	 ZZvq6q0+OoLrAmi78wBLms1zzCkyvQyel1IrJ5Y1dt5Ldbc3SCqJCtSOWL1TGOEmflQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476574;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=qfT1JTEsvt+cv31zz4dgTEKdPON9nHhE8EVSV1IOvgc=;
	b=j7Benb8SHAk239NGFL1tugWbT1FwUnJr4CiKxfJtbLe7SSM9rMqe4JxaCQpy926t/5aA
	 d7prciNr+93D5H5N677dk+12kKOFsyjUuxojOVtBDEeUpxtPQ1gG2jMXs48wqcBT3FrlT
	 kPe9UU9tuBchdJtgk1UDQLLPpeiI9GEU1UTHdEnr8xFDvnspvNZjFLUYkVJ5I4MtrZ/9i
	 mOVSCnBvoGYpfYk4pLMMSEh1l2+dn/dNFNy8Cl4NGP+1T+BZExPCDLb67G3CEFJy/WJeB
	 SQCZivagoiyTq23thyBE0fszUeXVAWQRYtEqfnmAxpeOuUmEK6J0fbqPkwKlrT0h73w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BxQu+2V+;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AsuXMxVQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32947606A322;
	Mon, 23 Nov 2026 23:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32947606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BxQu+2V+;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AsuXMxVQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795476574; x=1827012574;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PuJXQrQvpg4Oxzd/rpYoIH4wqKRS83Nbt6AgZQM3JWQ=;
  b=BxQu+2V+C5n7Cd7SQVScWccnwkaqKl70ztMaoDGSSH36heFnGMs4NlLF
   4yvVkenrvriKvO+TnM2sj6P035aWS3Ut9IkZhA9m1hd5zhvYQkfSqLp5x
   /mcxh8cuiewmDbPkiqB2NThEM69URqL3E+U/08gmf2yf401ViB6iWIofm
   zAydtJBOHIJQNjKZ6qrztNvqfBqXQAYXCsWGuFCBhtfUnbvfzIhjlzbZZ
   K89OQFIJZJHrUjzTA+C87vy7KAjY3znL36BafIAVgpsviEUO4eh/Cmtgw
   PohmEEZpoplm97keqJOBqASrNd48Uf/EVcdT1j8UWUdKxfL1SnBjSKwd8
   Q==;
X-CSE-ConnectionGUID: Rkla2yHAQtSTZWxyk1zO0Q==
X-CSE-MsgGUID: QrZJn6gLRj+lI7k+JTPG8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4193922"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4193922"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:29:33 -0800
X-CSE-ConnectionGUID: Xrhj1iv6Qe6tgBg8G6d/bA==
X-CSE-MsgGUID: nHh7MpViT2GdQpV8G3lZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13406485"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:29:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 15:29:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 15:29:32 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 15:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaP6IGdXiCn/AHZ/mMK4sz9pI9xB18YVzoKFIM77OCoL6w6sdv+ekTkAuPEJPLn9ymZmOgqv9U4sxutP36ttt6BbWHrlgkzW/PFPIDxx0WmDJCNcYF5wU5ZHw5RMbszcGd6uOm4OOsTX0kcB5PLUSfOA/dZTrSz+XSvv97smaiqWf3xf8dCJ1eX00MhH+PkW9xftFQv7eGdNZUwhB1dUE9NyOz33mxxlmfcgkBasNBUEdPo3XrojRtNS2jsF8mr/7mdszK8pHxyjDDwgVoCQ98YN5GY/hpijJ3Hhy0GT2YkskrJMRS5NLBzbH6GwTrM/cPl/xCkm09I7wRX5zYt2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfT1JTEsvt+cv31zz4dgTEKdPON9nHhE8EVSV1IOvgc=;
 b=lYEHjntiJzSR8u4S0lO07jFNRP2s81mQUp8w7V5fyztSmwqGmwnslN9LsOMLFZR5BkBbVwWtQcU8kkiT/1GJST6tAKNI4cuxaezlOzV7P+Zx4sPwncRupFg+Ky7Ttaj5OK9FBtCSy8yMKz20oHioCkknudmshLpStqSAb0iW2Vwrj6s161Sr6+q5SYgjsK899elLpHPuHj0nGBcJyaJ9PC/Y4wSONHJcoiG/pb7VLkrpWer/NVjoonxGcwu+Ub82fiWy2TWI+Mupdk7+MAOW5kkFxOEx5qMyHtTM/CkrBN9zfnn8dgQG+uAAqJq9ccgx8SlI8HNhEIeH1DO/Uq5ewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfT1JTEsvt+cv31zz4dgTEKdPON9nHhE8EVSV1IOvgc=;
 b=AsuXMxVQRL5LfIhTQ0L/nT0OqeGGgs6FImSFx0X/QaOhg5bIyJwjxc2dLwb9ILSngLWunS9e3BflTWVBsd7U6ytHRX+8D0F/FgRLVLHvK+7CZ/gD8ZixoCKxrNeeZSZ14YOcefwp2VCs7PQOQqkZqfK/AhMP1qKpiJJtbgp8JIc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CHBPR11MB205345.namprd11.prod.outlook.com (2603:10b6:610:407::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:29:26 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Mon, 23 Nov 2026
 23:29:26 +0000
Message-ID: <68bea280-a08e-4874-8b08-ae1bb25e8e5e@intel.com>
Date: Mon, 23 Nov 2026 15:29:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] fs/resctrl: Stop the limbo handler while resctrl
 is unmounted
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <gshan@redhat.com>,
	<ben.horgan@arm.com>, <jic23@kernel.org>, <fenghuay@nvidia.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-5-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261119094858.813874-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CHBPR11MB205345:EE_
X-MS-Office365-Filtering-Correlation-Id: e89a50a2-b04c-4ac2-3476-08df49b99cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|261026140227099003|261102123227099003|261026121527099003|261022105027099003|261028144727099003|921020|261021121427099003|11063799006|5023799004|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: R23EU26ubPCcTJgC+Uy2xWJ1d7NafhLOBp3Ecz5IStPsRfzR7lv/a/mrFctjWvp1Xy9PZDvcXy9ZYyBniDI1tWwmf/Kl6NXopS9JywgQP3rlx+O8M74fSoZFnorQYaQWGdChvzw1w5dev5I2N60O5LMo2pOqKRHjmr8GzXMlmEaGY2ZcJUM4lgSM5wmrEQFzt7a5gCMJy4DeMn0L+najGY2vZxCNUp46RvKQpYVQyFaimWmNKHSIIY7WRggSF6Xkn9lqjNrSC2qtLMsu3FN33JBRGfd6QluuEcOIXEPe+/Gu5OIY20xGqKu5Ktt1d8k8FprR2Z+cUyKYTxourEElPCMao1D3WFFJ1szw1IUFXfFMVoV0aD6itJ8kjAkOAmFp+jEyc9inJ6qUlSbSSX1Su12ho++ljFfXmeHlYWAsB/DtdVQl1TvPFZ302Invo84CYftz1eUvX5Hhl/eAZ6jwMWTwX5x3cpoU9tg02+7JwABcfBXrL71pXyj/+RL61DR7VNkLtXVhsNu+OHP1hW0CVjvLC+CuBUv1oR+48psIPktRk2ImaRCV8r2SBNRRPNuZnwJV3qLPQRioSLF54TmopfEwdCB0BoQAknz8C27bl/yvKYXamHRTpAYPAwKsmeIybyoedTz8hRf7QBE5rkXJNZK/gJ2S08unwBMDVTlhpKd7AUu5pN7sRvnM8oE/a9Z6o4/Abw81pJGfFc/DorTFwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(261026140227099003)(261102123227099003)(261026121527099003)(261022105027099003)(261028144727099003)(921020)(261021121427099003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L21zNFFTc3pWaUg1alV3STBmREx1aU42ZWFxMi9KcU0xWU8xb3M5N25rZTN5?=
 =?utf-8?B?elY5RHdqU24wQmdtMVBWVzMvSDJDT2JPVXpTSnU1Y0xyMWFrUkd5MXFTNmlu?=
 =?utf-8?B?eW5JWW52bkxteVNMUnBENHluMU5RbmxFVGQ0Skx6azNGbVFIUnR0T1U4c2U0?=
 =?utf-8?B?bC9ha3pteWZhWTdqTnZTUTZPYkdSUzhBNW95eHVSWTNxSEI1SEJYRC9WSXhT?=
 =?utf-8?B?SnZGbDZqZXlPRVZYbFJiY29QWlhhL0ZKSDZSNVJIN3R1TTdEMW9DRldTVTRs?=
 =?utf-8?B?b0kzRGtUbDhUUE9kYVliYjJxWnFTYmFpTVdsRmsySTJwY1NuckNiZ285dzI0?=
 =?utf-8?B?Z21OaUlNRFdpNk50bFY3akhIY1RSb2RFYWRncW9uUXVKS1lLMmxSMVhKWXBU?=
 =?utf-8?B?SWRHWW03UHZoc1RiVVErbDQvZ055ekFtdDJYT1ZxUHVsdlBXMEF6anFqVnow?=
 =?utf-8?B?WlJEb25uUlBxN0xUZkg2WVQ0Z0FJczJVNklsdEFBaWNTQmNNWlFmaHg4VE9l?=
 =?utf-8?B?OFVLTjBRc2FBd3VWTmpHRWZsVnd4VENRSVIrbmo3RnkzMlNpV1ZzNHRjMVVi?=
 =?utf-8?B?QjJTSjhCYzhYekdXZkxEelhaRFhkb2JjV2k5MmVrK0hMSzV3OWVuY3IrUHdM?=
 =?utf-8?B?UllxMWhUWnJoYmdjZlV3cDdYY21CeDVrTGpscGh2MU1nT3NyNUFldVV0VjEv?=
 =?utf-8?B?cEdKbU1JUlc2a3lyUzJyU1M0MUNwL1dra0IwZUd3Ym9yd3AvMWJXRkZ3VEFM?=
 =?utf-8?B?V2lxaTJmSjEzU01idjlUSnBmQzFWdkg3aTZaNFB3dEFRSm5POU5OTjFGd0ww?=
 =?utf-8?B?OWtFN2toVXlrdGdjL3dUNGhiU2g3TllOQlVOOFJNdjU0dTNRWjB6WWJjOUw5?=
 =?utf-8?B?TDM2SHdMTlIrMmJRSkcvcWdFbWNlYTZBRE54QWZPbGcwQ21CWDB4S0Q0Risw?=
 =?utf-8?B?TC94Y094SjQvZzZSeTdNQW9zQzgyYnpLa1BjQkJJNXNwb1N1Sk5oWjlLRmtO?=
 =?utf-8?B?SXJuSVpyQ1NUcE5PYkFYODJ0RjMyV0hubHJUcWpMemNVTDMyOGkwZVJBQmdv?=
 =?utf-8?B?RWI4OHdhWXZGd0J4dDV6WWJSMEMzYjVaNkJraTZLL1YySnlLd3JUeWg1bXh6?=
 =?utf-8?B?ZnB6UHpLUmVVcldYRHRIK2JLUHkzTks3TlltR3BlRmV0YUdMUEIyT2VONnh4?=
 =?utf-8?B?SEJpdHpHOGRVS3ZLNHhKbG5ZdUFSYlBwOER4elE2YUlFcGZiRXprd3JSeVkw?=
 =?utf-8?B?OHR2RHJaZ2p6YmZpTFl1ZEJJcGhqQ1FLQWpiOFErMFhuNWYvc3ZrcFhNZlMy?=
 =?utf-8?B?UmE5TWdWZjBIcFo1Z0VOdmhXSENoQ0lGRjg5dmwrMGo4S0dCckxaQnV1aGhs?=
 =?utf-8?B?WFhrK2lPQzdDVlFlbFdBand3a2ZDNXpaODM3K2VUQXUyZEQ3SGh0eFl2Uit4?=
 =?utf-8?B?QnM2eG9JWG5oSTVUMTJwelB6Q0RZR3FPSDJKT1ppblh6WmZDRXRzc1pqNU1L?=
 =?utf-8?B?N3RMN04vek1iczB6RWRmazdqbC9YcGlJaWNwRTQzaEJmQ3VaUDlkU2JCR2dC?=
 =?utf-8?B?YWJ1Y09QUnFpQnpFWUtoOFIwbDB1WmV1c1BINElMQ3VITWJSaG1VTkI4WWtq?=
 =?utf-8?B?TFFMRXVqMWlvNXpDc0lzOENhNVRvcHJ1U0hQM1E0N05iRWVUeHRpSzlibENa?=
 =?utf-8?B?U25OMlJucGlIRXdBZ082dDZiRkJZd3hQTUNsRTVWYloxUysyeVZsRm9QS3U3?=
 =?utf-8?B?ZjlENVRKL3FmRFFVeUZCZzJyQTlocmxBbVAxdjFsZXl1WXV5OC8yWThWSXZq?=
 =?utf-8?B?Q0Y0UGEwdmR4aktNam44TFFiR2hNd1JZMXRvc1M4WlVkOERlb2ZheDR2UkZC?=
 =?utf-8?B?WEpJeVVPL0wwdkJ0bWZNSjBiNUg2UHQ3NUhuU2phWVNJMmNEbkRacUtVM2dq?=
 =?utf-8?B?YVoxOVRpSEJJUVd4VXhzZldud09SbnhWdkRRYStCNUVCSjBVNFNNMmVoa0x3?=
 =?utf-8?B?NVN2YjZpazJYaGhKRU5aQ3RuYm1SeE81dHNTTjd6L3N2Q2dQWTFVSGJwVHlS?=
 =?utf-8?B?TWlsMDNTOGtRZm5YUWtPajJpZHgrS29nTm9DbTFIMW94TlRnc3IrOW9YQ282?=
 =?utf-8?B?WDJ4M3J1dDZrWlAwa3N0WHRxQ2liN0swckZSdENpV0JTc3NjVlFNNmoxMktR?=
 =?utf-8?B?Z3g5L2ErUnQ5dEVxK2liYWFLMW9QN2Q4L0lhTENhc1R2dHRGRjQyc3BESUlu?=
 =?utf-8?B?RHE1M2Fjd3JmcjVhUG9BNHkvbWpaNnpSbTFZcmpZeGpuZFRDZlZzbzZoMTNV?=
 =?utf-8?B?bGM2cExpRi9zeEYraTBINVJLY1QzeXhNZ1ZjSGJwUDd5VmJFSllkT3FTRTkx?=
 =?utf-8?Q?sBsWOR7cYA39kDKA=3D?=
X-Exchange-RoutingPolicyChecked: QLhIs5Yku6etGYbn/bFd53ys0aEnLZc45iVAMUql68brCzoDs2jpX1Nyr9gDJogN+ykeTe9YkL/W20Q6oIodXtzgZ+TAlVHAreADWuhwHHEqYBijSMq7BzZlaWBD6K3utnmd1Fyfk2hg8RKLVZTzQl04WGvuji0QE84xUhS7/Ak7umVX7FPR763lI2Im3SUNz9TRc3BlhB895cm7Dg6PW5GnK6aR8a4niJbpT8EBgCWqB2DxVF4l4PgfzoTwULw7rOlvH+mbUim3aZeD4Mtp4zLmz9WVZN1ln6ga1mOgWnDrshNWtOU3aO2MNxk34XIPry6f7Gd8X1pF4oIP8240pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e89a50a2-b04c-4ac2-3476-08df49b99cb9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:29:25.9616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NfrysmNrhtoJZ3310Scv6yZ32lkqH9TbyPoJXmw5VdONYfYwcSj7uBnqY243Yy2E6Au0Q7e+nMq8aS9z6irrjj8e61Viz71yCDJ9JARKl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR11MB205345
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/19/26 1:48 AM, Jinjie Ruan wrote:
> A monitoring group's RMID is not returned to the free list when the
> group is removed. It stays in limbo until the cache occupancy still
> counted against it has dropped low enough for the RMID to be reused,
> which the limbo handler checks once a second.
> 
> The limbo handler keeps running after resctrl is unmounted, where there
> is nothing for it to achieve. An RMID is only allocated when a group is
> created, which needs resctrl to be mounted, so no RMID the limbo handler
> returns to the free list can be used before the next mount, and that
> mount can check them itself. The MBM overflow handler already stops for
> this reason once resctrl_mounted is cleared.
> 
> Reading the RMIDs in limbo while resctrl is unmounted is not safe on
> every architecture. On MPAM the counter of an RMID is selected by the
> CLOSID that owns it, and the CLOSID depends on the CDP state. Unmount
> clears the CDP state, so the limbo handler that keeps running reads the
> RMIDs freed under CDP through the CLOSIDs of the cleared state.
> 
> Stop the limbo handler while resctrl is unmounted, as the overflow
> handler does, and restart it after a mount on every domain that still
> has RMIDs in limbo. The worker can stay queued across the unmount, so
> cancel it before queuing it again.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org>
> ---

Thank you.

With line break issue pointed out by Ben fixed:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

