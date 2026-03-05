Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B191799F;
	Thu,  5 Mar 2026 00:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772669435; cv=fail; b=QMrtvqSGaNuA1BNYELkDyDprE6kcAYV6MD++EmeXOvgXLOX3lHU1Vc4+RBmvv6hgocHMzp59ceJLAdXBGw4EE0k7CtpF5MVt3u+VE8ga45y3EaiIFhdyNMoJSHM1D64/Q1xGloLNh4fU/r+X04yOJCCJC0HW30FxiGy9s3CuVSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772669435; c=relaxed/simple;
	bh=a+NNonWy1uTgE/Dc+ZDNq2nPdJ7H6bap5LY1OdDuRxs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eESWw34Z7zEDf+7jiQYTz+jfDS4k+N3wjZFUvGYo+ukp3RoW3GdM1F2ztYiMopDJU7DuOdEJV/QMC1+AAqcDawVCad17SSOOZ/eVzqflZBBnAVDswyR/YOzxGfjf+q4oEAXODyxlBrWXZnpIc8CtH101B2tDarUuIhXrYeQl96I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqpslXE/; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqpslXE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772669434; x=1804205434;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a+NNonWy1uTgE/Dc+ZDNq2nPdJ7H6bap5LY1OdDuRxs=;
  b=MqpslXE/cOs1G9gnWcoMkoXAH9zaeg+KDm1i5LiM2GUDfydbz7Py6Bpw
   4pzDdENEpVHuKqqQqgrJ4ysVv4Kp7Ki0KDl8wLbSORmwNOkG+jeKfs4XQ
   UcTW4dcnnI9hSa6l3C+zP82oOwYidLK3qwIMwrb4Y0C9ot8oC64/gugcf
   A9ph6f7IJpi+WoD7cTkZ8Gmylm129P7g5JVXfQDKR39Hf3smepQ+huvAc
   ldv9Fdm4NxIKQZgDYJ02WiGi2Dhbu7s4+Zl8TpUGs7EHtKx+1Aa2razu2
   hkfC4BDo4RgjhEmNLqHWhruXZEem2LPyJ77ipypfxArdctBmqgcKv1IZt
   A==;
X-CSE-ConnectionGUID: e4rqWNtKRza2Br5tl2fe/g==
X-CSE-MsgGUID: kXy+/+aeSqebJh7uhUwajg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73652203"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73652203"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 16:10:33 -0800
X-CSE-ConnectionGUID: 20URzhVQTS2KMerC2Egj7A==
X-CSE-MsgGUID: lS4vCNEJRFGJhEADf3HmZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216801157"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 16:10:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 16:10:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 16:10:32 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 16:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY/3me3anCWeIfElzKJZuwp04xvfPMGuJRVLqBIInGWw/3j0mPGu2btUkJKYDA/CnpuTaluAj7GUJzbsiSELim+pf9kKsWsU8AOdeSh7bLqkVct2J6ZoPr+M+3HqLhO7a5vZLrpUWtvjLcPva1hEETftSmboe82fBJgdMs5RvIreDjZ6cHB+59GbABod7vgZptw/MXlKbbkqrmwMqEDHQnPwdQiCfOhEYxNNMnybmBsSRWw9pNJTt5Hd/QqVDgWTb9d/KkFpc8alXfxBMbQb9UCBygx5NYH06kyqLgFeTmpWBcAiv185yvwYRRMTVKSBn6NGnnihjUyQGXngplTuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWr/dACPYAG0y5RuT1fIOWj0EiLKL89owB1oq505ClQ=;
 b=HKNC+GEfyJXPOmml8tQFYMbLAmfTzVl83g+3ZDlhwvkOMaueAdwi0kg6Ju4m7QyhGTxPSjU67jzBX4m3D1xQON4ommdKCBBjGCfN1Hef0QsnzFppGkFT1wZ6GLyaVhJDwijO91xTp0z/6WCyvBNnnBZO5Cb7N0R9T76XT0PB5euGMOnjzvgOq45U2HTHr74MoiRdx3R71SGiprDbK6YU5Ty228lfP26PI6dmgodmjhbogrjlGzaDwtPvBE4vL9liusPHDTaWx7sdvhowwRZ4Ov/AKqegk4D/0pPnCzwNw+P2XnRdkjcb22rMNeMLYFqnl6mErmFwNbDQ4GIlQGahPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB7989.namprd11.prod.outlook.com (2603:10b6:510:258::13)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Thu, 5 Mar
 2026 00:10:25 +0000
Received: from PH8PR11MB7989.namprd11.prod.outlook.com
 ([fe80::dc36:253a:2554:e475]) by PH8PR11MB7989.namprd11.prod.outlook.com
 ([fe80::dc36:253a:2554:e475%3]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 00:10:25 +0000
Message-ID: <eeec4ac0-be05-4a4e-a9c7-8716de50cfbb@intel.com>
Date: Wed, 4 Mar 2026 16:10:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/vsyscall: Add vsyscall emulation for #GP
Content-Language: en-US
To: "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Borislav Petkov <bp@alien8.de>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, "Brendan
 Jackman" <jackmanb@google.com>, Sean Christopherson <seanjc@google.com>, "Nam
 Cao" <namcao@linutronix.de>, Cedric Xing <cedric.xing@intel.com>, "Rick
 Edgecombe" <rick.p.edgecombe@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Tony Luck <tony.luck@intel.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maciej Wieczor-Retman
	<m.wieczorretman@pm.me>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260219233600.154313-1-sohil.mehta@intel.com>
 <20260219233600.154313-4-sohil.mehta@intel.com>
 <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com>
 <faf58379-36df-4535-8c17-bcfe838ae4c4@intel.com>
 <3212161f-64b2-4825-8bcc-c36201ab6589@zytor.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <3212161f-64b2-4825-8bcc-c36201ab6589@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To PH8PR11MB7989.namprd11.prod.outlook.com
 (2603:10b6:510:258::13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB7989:EE_|SJ0PR11MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: e9976bba-96e1-4533-4e45-08de7a4b9969
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 2aFSSQEco8ghhc4p8JQAnU1sUPriw3NyVNgTV7SH9sci5OE5dwi4USKyCgbvX9B92LD4mrKbi82Rvsp7fZkoLd39XceH7ZXthXXEYg5VD/k/V3yvSqJf/qrRruzTQyVHE1OFcZmd3GLmUfFE70+3y+C6QTABpoLZgda6AhZ1iBCzIR0d4cu+Pl0MkYOA0jeL5n9eROllgVNrubRPLAKCW8gmEl3TNue/gJbZUCnzmklASGyhcXqj6J5OgtoF2Rter+6oIgeFTkKfvLHQHEgu8369wXRo6IfrdvB2v/0tJ8AtS+1kxoy7iN1XIpwG3INNrcfYAvjrorXNnqzcyRCDQa9qkydBe0jd5/17XryXJBbRAdsE8XIy4/7X0lO4zQipdyOh1LEusA+lQApGVwiyYnUQG5EU4ieGsiDz3zkE4p4IcCW+TC2IytW/RAgDE87nFZ92TQPEE7FXm4abWHVq1iza/qdQXg7DRJ8u0DA4S7gXBtMMfFhOqYW3fpev5BNh4ZQJkzCIIIdQz4Za8RO3GDnnYqaVwnJX+Aeh4oLrWOlvz43FPSwOYDvNQhzhwGeuigIkGjrpcMQf0TDZ+j3VCnIYFa+VAWtyI3plehoMXyEFU2PWlCYsXK1CgAJWOQaZC2E05nZ+kvICajjFErdd9a22rb3FpCdVD37T36u2nsL8Iixxl7FNQCvNBjUqL/z8+itXHcv/PYgXidOjxhxIEgzR6LuBAny7LkjLYb9cynk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlJ1LzUzMi85L3laWW1NWkRGa3lnblZkK2RycTFzd2h6MnZ0RXNpTUFUQmJQ?=
 =?utf-8?B?SUkzbFZTTjJTSkdFWFNzWmNRU3Z0SVdnZkgwYmFaeU1MUEpkbi9RRXRzOWVi?=
 =?utf-8?B?c3VhOThnVEN6NVlXNHRZbnNVUUorN3ZVdmlKdUVtZVhiZzVlVzEvVjc1OS9M?=
 =?utf-8?B?QUFrWDVPNVJ2OVJxV20zRm9uaXkrdi9Db3RJTEVUQlN4RDRkQWNlODBJM3U4?=
 =?utf-8?B?bmtDMkFnUCszTXNGVXNTbDJjVldJSUR0TktWMkJJMXVINnY1UUpiSndTWklm?=
 =?utf-8?B?NUc3OXduSEUyb0JrREpKbU9IcXFSUXg1eVZrMjE5VWtXSW1xOHJqQUloVVVm?=
 =?utf-8?B?NmdLdUc3WFNYZHZ2SkxJaXNBQmlwZ1RmRW40U01WWGY4QkhYOFJyZTNKU1A2?=
 =?utf-8?B?UGF1RDFxVVlBYmJmMVlnNVpLNFJsYisrcm84c2lnQjA0VEZxdk11ZFVBREVv?=
 =?utf-8?B?Q2FreUhjam9UaDAvUktzZWRRa1FWWTEvRHcrSG5tRmxYcW4wcU1vQUdDSE1C?=
 =?utf-8?B?bWdrMnJEbnRIdHEvd2djLyt2Q1RMbUtnMm1ZZ2hDYlhWaWNoQUR0aXl5YXVX?=
 =?utf-8?B?Sk1LRTFsNUlwQlp5Y3FONndEc2xTOEtQTFlnTTZSaTJpVTZuTng4RnVYVzNB?=
 =?utf-8?B?blY4NGZMTCtEZC9wbGpuM2h3cmx5RlFMNlZqZ3NEakovYW8xdDN6UUJpMlFa?=
 =?utf-8?B?bmo1RUM0MEZ1a2tEZ2dwREhJQnBPQloraS82UEhYcmxpUXpSbEhTT1BqNzJ6?=
 =?utf-8?B?QURobzdzMjMxQTVvTDhxNTVvUnAvQ1lsODdwTUpDTFRjek4wcVhsdUh6VzBt?=
 =?utf-8?B?REpQK1dFa3VjSHNyRlphNjJLYTVvaGs2bjUwNGVDQktWeG4raW9kQUFpQkhv?=
 =?utf-8?B?a3lXUGVML0xHMURvVjNFemk3Z2IvRHlNMVpCT3BIc3pjR0UrUEpvc3J4bnNt?=
 =?utf-8?B?R3ZRVEdwOVc0STdYcHhyU3pLZXFtcXVhNnV2ZXJoM01lTXZmVTdOMmNNaDhU?=
 =?utf-8?B?Mk5aREhKa3JhRnVqb0gvK2ROL2R2Rm11VHZJbkdOb2lacW84dGZwbzV1eXJN?=
 =?utf-8?B?ZEV3RFBsZ2htM1dMTkhhcnMzSEkzMFg3Z3FLWHRsOW9ZMGRuWVExSUtBbm5q?=
 =?utf-8?B?Z2k1czd0YUwyUWM5elVlZXlWQTdQTFk3ZVJrbXMwbHNsNUlncVlFLzVEV3pJ?=
 =?utf-8?B?Zll1cmo5NE1kOFNPWkI4QjdtRmY0ampkdHRQaXRPYk1CNHM2ME96d3VDMGhW?=
 =?utf-8?B?OVdBMVRwZFk5N1R1NW1KckxwSDI2YlJTNzNtOVc5Ykx6cG9ZbmJSa3BUODR4?=
 =?utf-8?B?clN3L2FQWDlDeVFPeDJDM2xVYjdkb1NxeUhwVG5FVlF3dWIySU5sZ2RHVVFF?=
 =?utf-8?B?cElJbEZGMTREcEh2bEdaWFMxZ0UwZ0F4ODFER3RZVUVOSldVS2hoS3Jvejd2?=
 =?utf-8?B?bzVjVC9XaS9hcGNrM1Q1QkF3OC9oRGZoUDVZbDlldkdQOXM0cHhCTW0weEhs?=
 =?utf-8?B?M3Uxb2ptYlU2U1pCS0NRVXdhdCs0dVI2WXVocVBoVEl1QitkWTFCUURpNnIw?=
 =?utf-8?B?NWFVM1gxVXF1Ymdsa0dnNzhqREdWTWE4anF4UUtJZjFWNnVFcWVyNHNkUTJS?=
 =?utf-8?B?UGFSK0s3Mml5OHRtRUttQmVab3RrdjNmRzFyZ0pMUVpCUEd6ZzkzZk5YeFpQ?=
 =?utf-8?B?T2M5eW0rbkJETzh4TjI4WUN0TXd3WUZzUW0raFFPWU5ISUxIS3JrVWFBczRz?=
 =?utf-8?B?WWNKc2lPbUYzWldCODBJMUJvWW5OSitIdjR5aUZBcW9XaUJzaVhnS3pVbVND?=
 =?utf-8?B?Mm1ZZUl0S2krMzh3WTQ5SWhXRVUvKzFGNGFFTjFWMDU5WmJXMjZKbFBFNXY5?=
 =?utf-8?B?MkwzWUVKYU52ZlE5b1VpVVJzQStkQmpMNGFhUktTamRSMnd5SWhlS2xGdkNL?=
 =?utf-8?B?eStxbzRmajZ4ckI0b0EwVnRaWTdkMnhuNllUQURHVnpMcVlvampZdk9jOEJF?=
 =?utf-8?B?SEFsazRwSVNqS1duV0JPNjdvQ3ZuVG9UdjMwU2hzdjlmVisrbE93dFIzSTEy?=
 =?utf-8?B?VWNaWndBWURNcmdyOUwrZ2RLa1ZleElpYVJTbExwbFdWMUlwWlhESkoraXdP?=
 =?utf-8?B?Q3dqeG9xa2pMU3ZzdnJJZkJ4aVI1UzFGdTFpbmJURktPWGFTZTFUalhoOVJa?=
 =?utf-8?B?QnMvZ2R0TDlQSVlOZlBnYU5MVmEyME5pU1N6b1lvUklMT0dmYlVLRDRoenRs?=
 =?utf-8?B?aU56ZmowblF0MzU0SGNYd2c1S1p2R210WWEzN1IzODlidUNNdkN0ZHFEVytL?=
 =?utf-8?B?S2pESnF5andMWUNOK3FYTUZLbXBpQ3ZkTHl0TXZBbEF2SlhBbFBGdz09?=
X-Exchange-RoutingPolicyChecked: 0tylS6WtcsFeZ1DsmwBwwJASmGdUEjioqVCskY4z7R0MFeWXBH0VdRMlmTSU4q8X/wHSz41lotFZzoKsYvKvC9ehGu0ij1mw8Q6QfUgl1BsSj9dWv/NdQsNY3ISeHg0lPsJ2n45o6bPGJucsiPiT2RyTPCFrkHJRCudZC3ZW3/4yYQW4HTNTezTGrg6j/hbC8Ad4AsZY/4R8blz3Lucjp0jfCK2COEcai1Gviv3LEg8sb0okAwpWlwH0UqkevAJEtUEKfxkd5qu2R4WuxSpgLCPataPiNkPg0KQfnDyAHNayWh3ZBrs3FuUul9X9iTlDdkTeHvJ7IH+Xr90nYWeaIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9976bba-96e1-4533-4e45-08de7a4b9969
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 00:10:25.1326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTzm4VA0hZ7n+v7z6Yxmi8xYy0BmLwILLhQVHfQjYf0NyebOxHbeyONMgyRpFSLK0AfpAAUZyiS+xzMgKZeRfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-OriginatorOrg: intel.com

On 3/3/2026 2:35 PM, H. Peter Anvin wrote:

> Suggest making an introductory paragraph here with the background information,
> instead of mixing it into the rest of the text in a somewhat incoherent manner:
> 

I rewrote the whole thing based on your and Dave's input. I added
sections because it was getting a bit wordy.

x86/vsyscall: Restore vsyscall=xonly mode under LASS

Background
----------
The vsyscall page is located in the high/kernel part of the address
space. Prior to LASS, a vsyscall page access from userspace would always
generate a #PF. The kernel emulates the accesses in the #PF handler and
returns the appropriate values to userspace.

Vsyscall emulation has two modes of operation, specified by the
vsyscall={xonly, emulate} kernel command line option. The vsyscall page
is marked as execute-only in XONLY mode or read-execute in EMULATE mode.
XONLY mode is the default and the only one expected to be commonly used.
The EMULATE mode has been deprecated since 2022 and is considered
insecure.

With LASS, a vsyscall page access triggers a #GP instead of a #PF.
Currently, LASS is only enabled when all vsyscall modes are disabled.

LASS with XONLY mode
--------------------
Now add support for LASS specifically with XONLY vsyscall emulation. For
XONLY mode, all that is needed is the faulting RIP, which is trivially
available regardless of the type of fault. Reuse the #PF emulation code
during the #GP when the fault address points to the vsyscall page.

As multiple fault handlers will now be using the emulation code, add a
sanity check to ensure that the fault truly happened in 64-bit user
mode.

LASS with EMULATE mode
----------------------
Supporting vsyscall=emulate with LASS is much harder because the #GP
doesn't provide enough error information (such as PFEC and CR2 as in
case of a #PF). So, complex instruction decoding would be required to
emulate this mode in the #GP handler.

This isn't worth the effort as remaining users of EMULATE mode can be
reasonably assumed to be niche users, who are already trading off
security for compatibility. LASS and vsyscall=emulate will be kept
mutually exclusive for simplicity.
