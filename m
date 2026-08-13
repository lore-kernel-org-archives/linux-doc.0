Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0DF377A8F;
	Thu, 13 Aug 2026 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636536; cv=fail; b=HKDfOnjvSXQ9SGD6fj3ZPT2Q5zHyma8jcRXhry7QC3HdCuy7u8EuY0/NsjQwWXpmVAID15k91O5FUmNwMgOkbiH/uuZXol7UnYB/8DiQUsuDJGj4b2k4u2O1TMKfOymOd8Qyu3LYMb/yg1SuVIbPVrGHwTyQYL6GwHK47bJp1aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636536; c=relaxed/simple;
	bh=y9mc0Zhbm/bQB8txmoVYb+M8GpCBPYOIxUHpSy9HHgI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ekUt+x/05YQkYtDXCjojejW7Bd/IRiiGQRsRHF7W0ZmSAaGYz5uWvgnqbJOZtbGq0tQI2aAgBvguzDyPcKDpkY0S3MEBUlgG5b2r7D5QBa8GyzztEO4kNo8RIeulMEuvhquK4YYMQ5qo287HX+G8lHyWhumjh2UbZ7gBGK3bNzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvsFmtvQ; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvsFmtvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786636532; x=1818172532;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y9mc0Zhbm/bQB8txmoVYb+M8GpCBPYOIxUHpSy9HHgI=;
  b=DvsFmtvQKdEubssjwnCEK7+stviKbiI8GHWNwXk6q4LLhSzbVkb/jnMc
   Pwz6zuPbFZ4bzumufDi2+11sTHAwv213vfaZ2pf/wMdATRU6xlsp5BPyj
   /6uHyfQfhxP7Hvsvt7hJm2P9odDqeNRrLTli+mmxeXfVNmLlyAqjjhNoa
   iV+gjjz6JrcLEaW8tzl9NnQIgeV9g1ZChNYjb08wNBw+sDSN+3ihBO/6v
   +9MiuKd/FfCk5/mTNDeulu0xg3vdtqdoqSijjUQ+TJNT8TEr5fiE8B0tQ
   oIYpJ8KV5Xp1/BBhVdWtHntWx1yqTIcyOVcOfClHuz6xz6y4fmlA/4pcD
   A==;
X-CSE-ConnectionGUID: WeRNaskzSRaS5cgUCDK9bw==
X-CSE-MsgGUID: eRkNuTnbRE+0sTZpGOWUgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74751805"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="74751805"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 08:55:28 -0700
X-CSE-ConnectionGUID: jkXRAnpwTCqRLMX+tJEFnw==
X-CSE-MsgGUID: 9auILLicTk2SQ+/4jkoY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="259724819"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 08:55:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 08:55:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 08:55:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 08:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNrmqy1KBMQ7f9Udvdq1yQAeCzX6ePwXq0OU/LvlKOm4QIkCtitYIsrXC821ufuDe49/wKKY/RTgblB4iP+TPFDOp10ceL2FCZc+llYcJoA/sH3LLDXKgYVm6Sjankq7uSmsz6byHsENNJn8k/OeZtIZlKBg9W3X4K2QD8gk9nstaej48VA+w5+Didwv6PJtPfo8ZEJfjAba2nMfRKAIJACTMojVI3YQRt/ei5O0IrtaJUWOLM1PVVTqbdMHavOzPSv+76KqnnEodJN2oyCNRx9x5j6yPr3AQ901v6UQH0oBxTUF8LD6fOSphsaYwRImaI5eFWcKYmVfy5+gQeOdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx2ZzIkThCj03e4imXqdL/o6E6aJoaZlFwfeNL5E3uU=;
 b=lWd0vSKZEO3leeJXUL5nyHKuWfIYjOBIZoxPNqKW8qa2Jtt7dRpyTj/+4ZkryiE4rpUW5kmUiB4tHmWkkvsEo00WLDX8E+cTCrnnMRzuAGpml+SD/LTXs91G0Ro/rEZahCK+pfKzXQF/7fdwjmnEIbGiW2oyY2okfZYkKZy0O+Hj1BR3Kfb/G8D8ibXyyuiK5UxSsPiszficrPIG7eqSxy1OKk1ABgUE/3egPU0Zkec4sN9hhYKHhu77VJjCgBIjeDMvH7aQ2+SHrNRpG+sKAi3iuIZTx6tsuD+Q0EzbW+Y+t4hXoFOtKyLWiPJX0GOyv3U0E2OB8JCyDnyK0oiXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 15:55:23 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 15:55:23 +0000
Message-ID: <0c4e5b4e-4846-45fb-bba9-ae4127393f0a@intel.com>
Date: Thu, 13 Aug 2026 08:55:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
To: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>
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
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
 <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
 <5fad6e01-1052-4c1f-82f5-02c650ae1ffe@amd.com>
 <e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com>
 <9a53023a-9d6f-434f-96d3-188a176a6cc2@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <9a53023a-9d6f-434f-96d3-188a176a6cc2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b79bc7d-bdd3-485f-e535-08def9534874
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|6133799003|13003099007|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: R861ce9HpESxl40HNCIfqyJzEAcTFkKEMgXZjrIb0WIC749YxK82Nc8frzCo8MXj7VHFztFtg0yOOZ1mBdGdaZEG77gp/ApWb1QsZfTqCxxLnPOiDGA/MPXulG8A+szaGp8Yv4TcGQYFebbpyPUVai3iOC4eirSQiW+/DAUyPx+zwKk+nSr8E7WeuC1yk4N66SKs1lOcz86ywp/AC5R3qUMMVAXiZQkZoBT7PEZBiL+PicIlgT5aLXZrrLRXfSXJj0S1DFEjc8b6ytc2ROgJQHfM3oWfoNLGeiDQc/KjRI5SOVqXo/2d5n3WbHiORZqYFbPdQ9cfOL+3ggw7vEIn2P19TdcOQkC/WppL9P2to+EbnElOHHi+NUpbd0mvZ9+b7J3KBgn4GIm3oVelP18ToctdtTGNBweBLMZt38HtaZaa361LPOoj9PTGsr5IGoUdUiZ45fWEaG3JlyICGnu+jgwDHPVpMN0DoOY4Rt0SbNPMm+tTlfE2Rctca8to0BUa2wyoMR0VKHSRGasDQK3OCGqNlrakM1bs+fNhWhUT0V2hLPKPDakW/0dpLED0SlC7MlNbjWGYE3Iei+0DkwfAGwyx+imSuT4fFcGxxyPvH/FGQNZekv4DXkhqDAHR3uCSlwOWvFvDNDYq+pSKkfCp55exTols11NdlR989icPV6gNnvxpn1pYQLwOgpIEQEq4zADD1/GFF1ZqBEyEqeGSfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(6133799003)(13003099007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0hXeTBCejlpMnNUclF1TzZWTWQ0RkFwMDZsb2hzQ3EzdmZHZUVsc01jdTNK?=
 =?utf-8?B?YzNjWWFEb0FDY29DUzVNNXVyS3BPVGpHb2w4THB4VU0zejdpVENDUFl2Q1I2?=
 =?utf-8?B?ako0SmVQTmY3SzBPczkvczJPcC9RaEhvR1E5eUo3RmlkaURVNGxlc293ZWZB?=
 =?utf-8?B?RTRwUUlsK1A2TXF4ZWlLRUVuelV4dDd5REtySFJQSTRrSVluZzEzUUR4ZzVE?=
 =?utf-8?B?RUhPYjFwNCtDa04xSEdrajNmMGlCd09wK1RPK285aW1xb0laZzUveWljbEl5?=
 =?utf-8?B?eUZSdkhDQ0RqNEVKY29VT3YwV240SnZHS3M1Qy85S2thVWtUWWppVDdGUity?=
 =?utf-8?B?M21TeEN5cGV6QS9NSHVJWFBLUCswTkhGN1ExeGwzaDQwRXBUNm5CblNTSVlH?=
 =?utf-8?B?RXEyTWU0bGtiMFhVWTg3VE5FbmorL2NuTmQyN1NBVUdyRTFldlgydWJYSlYr?=
 =?utf-8?B?Vnl5WlpETnJpM1c3WWlZcDViYjVtMXp4VnBVR3V0eExCbWlBNlN1QjRDdC9V?=
 =?utf-8?B?SldyaCtWZ1dZMW5FL2phU0JTWE9IM0QyT0JHZEdPcWNrN2xleHF1TFRNTTlX?=
 =?utf-8?B?RVZvUkFlcWNuZ2ZBUCtXdStKS05mSERsenFpSGNFV2hZaUxYOW9SZitZclo4?=
 =?utf-8?B?WHJSWVVTSm15a0pOZnhTQWR6U05aeEQ4cU9aS1VzQnF3ZXFLRktLRFl3aFA4?=
 =?utf-8?B?VTYya29ad1ZPWmlwMnBER1ZCZVJVMnN1cE9aQjJXRTZhTUptTzdRSzBFVFdN?=
 =?utf-8?B?WXZCMHRnTUx4cXhFaDJNWlV0RVRlbEtkQTdCMnVSNjQybHovWVJESmhSU2JZ?=
 =?utf-8?B?L004clNKMFVjbFRuVG5Qc2l2R1l1WXBHUW53R3hCeHFYQ0p0Z0RPcC8rdlhW?=
 =?utf-8?B?b2hDdWJnajRzZzZyVGNmMVNvY3pTcjNlY0xtRU1JWHBOdkJNYWJzOGJEY1Iz?=
 =?utf-8?B?amFOSmxmZ25UQ0NqSDlMNzk0ZUkrRlVXOUVydWpNeGZpWm14YysycnZtMW96?=
 =?utf-8?B?dDdGSmJHTXh1VHRBU3BwRVdKeTEwdnZLbFhmQ2xUZGNBN1NsVGpQeEhwbGQ4?=
 =?utf-8?B?QTc2UFNQR2VxQkZJWU85U0dEdFFrWEhNVi96VXMxcmowUTVHV012QXdHRDEy?=
 =?utf-8?B?VTFERlRSUFNMdlp2VjArOHRaT3ozQzJQekN0UmZUSmRlOHo2QmNJOVNMbVVY?=
 =?utf-8?B?MXQ3SkZtYmt2aE1jZjhENDMrb1dNQ08rVWR2WTZlalRidzRVaytwYlV0a05H?=
 =?utf-8?B?OUlGL3BvcWdPTWozbE5ST0ROTllMb3ZQSlUwVWNXYjRMS2poT2x0dnNLODRr?=
 =?utf-8?B?ZGhyU2pYbG1SOEFwV0NWRzY5M3JpRmFPZVlWRkNCamQ4cFVQZDJzbmloUDJN?=
 =?utf-8?B?SzZlem9paG1NcmZvMVp1ZmQ1Q3hZYlcwcHh0QmM3QXJpc0x6Qkg3TjR5THJz?=
 =?utf-8?B?QWdBcnFDcHZHTlNnOGlkbzBRODBjRm9raTFmNnZ5OVc2cm5sUlRTeWpaUHln?=
 =?utf-8?B?Z1Y3MllqeFlUMDAwSWlrZUVyMkxoY0RGMmlWTC82N09OT3hHeUIraG9qSjBC?=
 =?utf-8?B?VGJLMHFTbFBTNk5NNWZNU01aVjBaalJLblRzdys5ZjN4VC9ua2R4TlVKaHIw?=
 =?utf-8?B?QzdqbjNrNGxzNVJ5dDVSQi83NUVjQnBzUUtiQ1puSkVoalJTeFhBcUN0R2NY?=
 =?utf-8?B?ekxrTmlhei83MmJCMUk5R2duMDFabGZzTlRBRTB6NURVUHJTdnFiVFdkcnM5?=
 =?utf-8?B?b2N6WmZMN1BKMHJnenA0c3cwVUhNWGY1Zk15Qjd2ekJ0OWl6UEt3UWd5Ynov?=
 =?utf-8?B?Qmx6UVNrTEQ4YlV0WERYWTNnUU5lUXpxVVZqMkFzWjgrM0xxNTVraXRpUGRF?=
 =?utf-8?B?NmFnbTNSbHNUNGxmOG1yOCsxUHl1ZTZkaHRvbmR0dnRNWUJoZmNVZ0xiM3VK?=
 =?utf-8?B?dmprcW91Q1VEVlo1ay9HUUZrQlJJY2JUbmJZdDRWWkNmQXY5MS9NNTNBZEs2?=
 =?utf-8?B?bHF6TVhWZTY1SjNEOWRYaVRRWWJJMFhJNEZRVFh2NFd3K1hrM3FMdkc1MFFC?=
 =?utf-8?B?TW1pbldKakVvbS9pMG9WT3o1Qnh2b0VrMEJMOXBNTDBhWlo2dWYyaDlaeXJU?=
 =?utf-8?B?b3FVdGszdmg0VGtudVlxVkIyQUpncUpVKzBnRXZmR1FuQkJFeDBsdUYyelR0?=
 =?utf-8?B?MzFoZnhvWW9ZSnppdm8wMzBvUHdpdEVqYy81ejJvRzJtN29JTzJCdGpIMElC?=
 =?utf-8?B?TVF3RW5DT0N4ZWp0ZmdvYWhJOEsvQ2gyakFhV0xkTzF2TTBnRHp3azByRXND?=
 =?utf-8?B?d1p5akZRSEpjWitQMHlTWTg2MzM0NHArV0k3bXZmQkJkR3F2U1hYMUh5T3Rn?=
 =?utf-8?Q?6ihmyjfj8G3Z9zQk=3D?=
X-Exchange-RoutingPolicyChecked: PomksVTxO2SZe9OQp0/nM+e7HhYeVFdDbuf69kT/2BQ6OhgZiGiMEZ5W9Hpwiz6EWZ6nrXGfpldWj99ql4TSJxf1/I88I/lxcaN2fsC4+vWHsiegNZQzGs8zCv2Ul+4ce1Vv3Z+Art9G0cd2H3KZRhrqNmoanuzx7E1ylNKcwYIg3ZVsM9T00vXJfgPpBcvscXNWU1H/WjFNzkAqFuc9i/OMvvtT6Y6c5woveRG6A6offshYSV2g9OamUFE36p5EALPj4PGRGFDjg+XNYJGhmP49yO2oBQmTj/kq3xJjSwXRGfhOKMQDYEgEFyMfUPaTS0FjYuwWHAN/Vv/T9++qqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b79bc7d-bdd3-485f-e535-08def9534874
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:55:22.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7nVvt9koh2fnw0ojgkm52TP5nHX+a7JJKATbuQeL5mHiK8y9hOrLXcuZtcLXGqg141DIev3EKLSbxNJPtbTRCkjNKHL9OlkZuT02Y5EDC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
X-OriginatorOrg: intel.com

Hi Babu,

On 8/13/26 8:17 AM, Babu Moger wrote:
> On 8/12/26 18:28, Reinette Chatre wrote:

>> Please always keep in mind all the requirements and use cases we learned about
>> during and after RFC v1 of this work.
>>
>> For example, we already know that "per group" assignment is something resctrl
>> needs to be ready for. Consider the example in
>> https://lore.kernel.org/lkml/aYyxAPdTFejzsE42@e134344.arm.com/
>>
>> There may even be "per task" assignment in the future.
> 
> Yes. That is correct.
> 
>>
>> Constraining this feature to PLZA will make it harder to enable the capabilities
>> that we know resctrl need to support in the future.
>>
>> This is how we originally landed on the "global" assignment distinction
>> (https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/)
>> "global assignment" should be kept or replaced with a solution that continues to
>> prepare resctrl for these other capabilities.
> 
> Yes. Makes sense.
> 
>>
>> I am not able to see how resctrl could support "per group" assignment with the
>> interface you propose above. If I am missing this, please highlight the solution.
>>
>> resctrl may need to explicitly split kernel mode from kernel mode properties. For
>> example, below shows an "assign_global_enable_per_cpu" as the kernel mode, now with three
>> properties:
>> - "ctrl" - could be "assign" or "inherit"
>> - "mon" - could be "assign" or "inherit"
>> - "group" - required if "ctrl" or "mon" is set to "assign"
> 
> ok.
> 
> 
>>
>>     # cat info/kernel_mode
>>     [inherit]
>>     assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=uninitialized
> 
> Shouldn't this be like below when default is inherit?
> 
> # cat info/kernel_mode
> [inherit]
> assign_global_enable_per_cpu
> 

I think it will be useful to let the interface:
 (a) show to user space which properties are available for each supported mode, and
 (b) show user space what the default value of those properties will be if they
     are not set when the associated mode is enabled.

To (b), since the default resource group is used as default when the group
is not provided it may be better to use "//" (or just "/", depending on system
supporting just one of allocation or monitoring) instead of "uninitialized".

> 
> When the default changes to assign_global_enable_per_cpu:
> 
> # cat info/kernel_mode
> inherit [assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl_mon1//]
> 
> Display the second mode with properties only when group is associated with it?

Please consider this from user space side. The user needs to enable the mode.
How will the user know which properties are available and what the defaults are?

> 
> # cat info/kernel_mode
> inherit
> [assign_global_enable_per_cpu:mon=assign;group=ctrl1/mon1/]
> 
> 
>>
>> When resctrl needs to support "per-group" assignment "kernel_mode" could contain
>> below with supporting documentation noting which per-resource group files will
>> appear when "assign_per_group" is selected that user space can use to manage
>> the assignments.
>>
>>     # cat info/kernel_mode
>>     [inherit]
>>     assign_per_group
>>
> 
> I know it is future. What could be difference between assign_global_enable_per_cpu and assign_per_group?
> 
Please see https://lore.kernel.org/lkml/aYyxAPdTFejzsE42@e134344.arm.com/ 

Essentially, in the "assign_per_group" mode the user space resource allocation and monitoring
dictates what kernel mode resource allocation and monitoring to use. This cannot support the use
case where user wants to monitor all user space and kernel work together in the same monitoring group
though, but that is a difficult use case for MPAM anyway and this can be solved by summing monitoring
data of user space and kernel groups.

Reinette


