Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476558;
	b=Vv/qh2bfaPqQc7fEzqT9T+NYS8czajU/rnaHJRcoMVIX9GpCGZeE2WKREKJ2T6FmaDml
	 S1ose+91ECzuxldJmBz7BWYD4kDHvyJfE5D/bVGLYkwm9KGIbNDuSlhjZS2fuMb2OK+ai
	 Wyzj8QQG3F8P4VIK66nqA9cE/zR5AORBSbMjH20qzueF2Mmzpdld+ZkeoCKwyIqDNlSHV
	 5xrPv/WE7FSGiUEStzqGnu+Al9bLJims3DFuSvHWR0yKM+pKJV6bMkfwTSCvBfBCp/+mW
	 u7e1vlfeaCqfIvTbaxBR6pONAvegwXAEA5nOo+Hbxtw+cWFsl7BtHBkausuxCO0gOdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476558;
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
	bh=Wwm+GWC4CGbmVknLw1DdiQxbpHt0N+4yWmCGI5nzwDw=;
	b=yNQg/OFqgrfBwJUEHNzcFESLL2PSdlgaLCZSDJRiUqzT9rtvmizo5VcUzD2JCpea60uD
	 tXPwXWSqCV9xoRfjbVnFzTv9lPpGuM2WbAoF2uoOMmJawyBj8LP/kTUq4BvFwK9lZXyOg
	 UdexCF8I2g/MGYvGbyeHsMpqcfCVTcBOEkp4v+xiErL0GV6IRbeNZz2hNIby4aL1gT+ft
	 VJ6gaFEJoORidIj/yBnjUzI8WBj8T5ro7s///OU/N2FqG4pg08XfOsQx5OE+wIBp+6+Du
	 mMrlOmw3eARn/qOW0dDnE6R3jfTyka9pqkJRYyizTM+bk4BnFt8kfJ39pIIh/oQFqNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T2rpR4JS;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ID98JAqD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDA606A321;
	Mon, 23 Nov 2026 23:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADDA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T2rpR4JS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ID98JAqD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795476558; x=1827012558;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4v5vfIX1rJHgVAMYyH415c9vnOnbhKFT23eMwryDqNM=;
  b=T2rpR4JSCOcA/BS1ciW/j8YNsBajrQJlOjtDVPWrcRXxn0dga+gtm8i6
   i6fDkEWwiDj+FUd9SJyargnk4fScx+4SU1+ceAyktyEgu+zGICtTG1Qbw
   ts5UYGQUTm3WJ0goF0kQEr2xavpQva7JDu/XqVFY2o7XEIWhNKHWA4xBv
   o3PJi12EEZu6rlkjRumGUW9Dc3lGi17+YrVQhI9M7Ya2nd+1j0xc/D/Zg
   c6QJOl7bsUKA5jbH7Q4QAM7V1YCdbZ1dOUxqpZ4Z1rt31n7Dl+Ct8BfTS
   g8ZrW+MMNBnrMY68SPqTo01TUqF8D5noIilyrDoLmvvIwX15MfpJvX2mQ
   Q==;
X-CSE-ConnectionGUID: jRBqVyJkRk2982133gbrXQ==
X-CSE-MsgGUID: e/PKwrETRHy+ENV5T0Zs2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4193891"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4193891"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:29:17 -0800
X-CSE-ConnectionGUID: fVdt4U4aS4CRQ+HrOAP7qQ==
X-CSE-MsgGUID: gG+Dy4PARWqjcMf+5cr1xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11397332"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:29:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 15:29:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 15:29:16 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 15:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPwAqeJ6zMcd7EbDE9vFQ5OGeviDtwIt3CZLvMouaxHzPAdOEEgcaMiC7osaj3BtvI9cU0ko+HSI09OvSVKNZBlaFRCie/l86dbwf6lrIRTNlsVDJENbUTwoRdlg+s00xRYNIafhCOmJZrXOl4122P4iN4nCaI1fKOVwn1c9wjJ0ovf6R9LO2LJDLULT2T708E4XZgC12rZugc9WWBk7Tabyhkl4l0IMU09viZ8spHtpgIwNbDEIdBFfqStXj7ww9Bu5m2xuXgvL409NwnJTl+pyEy3G9i+kw0k5gkCGNzP1m4j3Er8Rp3l5wtxSjcRkn1Tpt7idkqazv0Z/OEzDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wwm+GWC4CGbmVknLw1DdiQxbpHt0N+4yWmCGI5nzwDw=;
 b=cQ9WmVD+joT/8pQW5YU21Ox9QR2H9pz+Yn7xlXNircMepiZmwDq0ye5IW9UdtX14bMLA46gg1qUKLU661JNITrmGuTPGvC0HCYusXzwCrRIk9bfyH/2kMl1mq7Jg3r3fnlrrx1BirbdIBNFBVINhwk4/ImWFYJT81wNI86HvPBTeSvQiMSpMeZcfAeVjgyfpa/EkW1XebU8dXiILH93D+eyEWJSdkdRbzkKPvh93fSyDHaiIxIc9Wk1iGbq4xNlJO0KiNgTZJTo/MWesjVZ+UTIfX8m9VA1Oi2qxZXoQZ4iBcqwwvYg49JM9R0s6DlQ0M6nzm5Z7eLdIXhqFszGz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wwm+GWC4CGbmVknLw1DdiQxbpHt0N+4yWmCGI5nzwDw=;
 b=ID98JAqD+RgyZ5GUP2uz1nqGI4RmIGGrbqgy3HWmu8ynQdeFiiRYJyzTy4dkLEcSJbpA4smYOaGu5QPI8Aab1JUzQ3MZCiqmwTvuDtVO7tZOtDBei/mxY0A+mEIgRgccMPAY9sTwLhUyIVbhaOt0Gy+SsJCgcgi/j1286UKERYo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CHBPR11MB205345.namprd11.prod.outlook.com (2603:10b6:610:407::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:29:13 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Mon, 23 Nov 2026
 23:29:13 +0000
Message-ID: <857d56b8-5920-43ec-9f0f-8c9cca1063d2@intel.com>
Date: Mon, 23 Nov 2026 15:29:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] fs/resctrl: Clear the CDP state after the cleanup
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <gshan@redhat.com>,
	<ben.horgan@arm.com>, <jic23@kernel.org>, <fenghuay@nvidia.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261119094858.813874-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:303:8e::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: de1991c1-6482-4f7a-df74-08df49b99574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|261022075727099003|261026140227099003|261102123227099003|261026121527099003|261022105027099003|261028144727099003|921020|261021121427099003|11063799006|56012099006|4143699003|10067099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XVWc5Kv0VICdXZf8EPB7bh/J/mFlxK4XB1fawTfnGZ8PJPpfM325ayoESNP7FTJyBWs+V9USlpPyz/ZYP8W1ze0LHHvZ95ViRSaHtm8F7HjqxXq/9oaCS/hw3yo7NOKcvQMvTGujC9T2XQleont2yM3qEtWqcLw4qzxVsaQFux/ERO4e8OCAxGxhUNc4La1Y3wTCzKtXsMzMrMOGiUwsHNppLj1IYmhAPpALgDSUrpWG38F3MlcR+lERvjlZvCzDxDLGZrjXVSR3S8xXmf8psQCu45ByYx85uhE5dgh3z5gd7UMhbdZpyJBfDJHTl/2xAvYXG2zHUgQ34Bdy6VQ+DPdixvuAlPPh75TFwruZpIIPDCJseXV/chXnKdKgpiEjWHpdqLzsQiNeAGeWS3FaIiwiDADpyd14nQqWk2Nmc/apdRbiq9sDKn/1oXsm+a7mmXNNPCtLOPzXvREyXw9ahZNuCqrosMdghdgwKOKDqs1Rg3ghdtSFe2ur1j7xsyi7C5e+yZi/TmolFz15kUD2D6BVeq9WTXcieM2xj4ir5aaBg/eFni8Fgv+AZ8cGyAVpAyDdYDwg25QRobXajjcqzHXxskNhKgchaU3+/0/KrpUFQZBqkOYq2lLGVGddyWjRcpaBDiujfRH5Y1E2K4NZyWuZW9noMfBXSGR26f81OvVKlFwpgpj14wQ0UAf6qKd9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(261022075727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261022105027099003)(261028144727099003)(921020)(261021121427099003)(11063799006)(56012099006)(4143699003)(10067099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWM3NUJkRVN4V2hzNW9MeXFvdGEwRW1KNzltbklqckNBRVhEQmM2SDNFa2N0?=
 =?utf-8?B?aFNycGxyM080OTd5a2psYUcyNGN1QVlxUDhBa1VlMzhwVTNuL1JTYjZsYm1B?=
 =?utf-8?B?ZzVBRG9jeDBJQnFZQ0kxVzJZaS9UUis4b3VnSjdlWXJDVlUxOWZwaDYyVTB4?=
 =?utf-8?B?M0dHcUN5c09OQlJTbEVML3FHUHNRQlVCc2dscmp0UXRpM0svcitRM0FaV3JC?=
 =?utf-8?B?dklvanVPRU4xekdNcTBxc0xaY2hpak5TVXc5cHdWQjVGNEVvSXRlNENtSHIz?=
 =?utf-8?B?RFNvbitrVmVRanBNYWtrLzRoNE9uY0R6d3hYMTc3Uk95ZmhYWVgrMWJ6aDI4?=
 =?utf-8?B?K0tPb0xSVlNmd0JzbkNjM0Z1SEQzcnNVY3o2RU1OVnNRWWt4Yncrb0wyMlh1?=
 =?utf-8?B?c1pYdjR2bTVIT2lCVDBrc1ZvYW5HZWlCbTlLZUV1a09wOVFQdkEzTjVROVhE?=
 =?utf-8?B?bjQ1eGNBT1hiRmh2Ukc4TGVIK1hKNEFJRFpaQ2pVeGtFb2hodk9iLzZLZmNU?=
 =?utf-8?B?Z3J1L2pqUFlldU5XemptdXowMjlNNFJwY3RSMndvTTU4alAwcWgrTkc2MU5o?=
 =?utf-8?B?YXQxV0h5ZjlNZTVBOGI5SjE4VFdyaDZSQ0czZjBOdkZTQzFrWEJFTmQvNG1z?=
 =?utf-8?B?M2dEZ3I3N21BS0c1aGJVTS9IYXpiVG05S2Y5Q0pSWHNsc2JsbFl6d2IwRkxt?=
 =?utf-8?B?dUJKd3pULzdtUVcwbHMzMGRobWUyV2xEeHdxQjFnd2ZIejc1TnJnNHNLd1NS?=
 =?utf-8?B?aS9sL2N0VWc2WTNyN0pUZlNnYzBicnh0MzM1MjBmZWw4elI2bGZaRzNpd3Nw?=
 =?utf-8?B?OTZyUVFVRGRqYnMzWmcvRzdkbWpmemVESG9pV2dUd29nZ09LVjgySFFlR2tC?=
 =?utf-8?B?SFl1N0lKVDVmOW9NTmdmWG1UNGF0aW9wUlRmNkVCQnVTMkNVUXpEb2JnbVVm?=
 =?utf-8?B?UzVjMkpRTFZDQ1BuTk9GWFJIbkFrN01LU2JDeDFhQ0FiczRwWEZVbUM2UFFn?=
 =?utf-8?B?ZVV5QWlLY3BGR0p1dDZENG9GQkZmVVlucldzbTF5L3pXdGlNUEx1YU04RWFm?=
 =?utf-8?B?ZXpZOVVIWHpWUi90UzVXcVQzSVdPcVU2K2VJUFpwVHNTMlVRbkd1NzhibDJX?=
 =?utf-8?B?NUFZSkFxcjdkc0w0dW0xWEx6K2FCa213QVhyMjk4TVZDcEJld3c1dlA4Q0hB?=
 =?utf-8?B?bjlKQ09HNVNSQWVodms5aHhSTmlqd1V4bnNDcnY5L1pXaWswOEtPVy9wM3NP?=
 =?utf-8?B?dmFvaGs2dklWa2xsbm5Bem5sbi9MRmZ1TzFmWTZDaXBSVFhOYm1mTVpzMVVN?=
 =?utf-8?B?WTlPZm5Xci9xcmxkaGdSYnh3SGNpRGJtai9MQ3o5SW5Tc3dMbWNjZmM1RUln?=
 =?utf-8?B?NjNhTnlCVFpheW9vdW9IRWRrRmd3dVNMczNDTGRCZFl3K3pidlR5bWhrZmZ2?=
 =?utf-8?B?VFVBMHd0WnF1QlUwSEFwNUtVQXUya21FUjlTTDFJNmVUYUIrQk1hMnpuV3kv?=
 =?utf-8?B?NzBLL2ZHWUkxZDRieVBxeEFKRFVWYVVFaVdEdkMzRzFzd3hQd2xIMUF1SEtQ?=
 =?utf-8?B?OTlQUGZPZ3ZmbWt3V1pVcjE2aHFiTmdJM1NSWFcvZFV5aXJiaGFFWVZMVklQ?=
 =?utf-8?B?SXJoY0VmM2hOQjNLN3FEM1V0U3R0MHpXWlVldE93UUFpMzBpWGVlTXhLOXl0?=
 =?utf-8?B?V3IzRFRpWmRVL2ZiTUJmd3RVV0FDNmJ5Qk4yMTJ6VDA5S1NmTFppMmRleEgx?=
 =?utf-8?B?QkZsTjBnK1E1ejdIV0YwcWxBd0gwSkJ4alF2Qk5VdGxpSml3c092SG5Qd0FH?=
 =?utf-8?B?TGFRVUFkYjAyK1dvVUZEVW5Bc2JKM3JVZm9XVHl1ejNMREYrWXNrMVl2Rm56?=
 =?utf-8?B?NzBxY2FPQTVkOExMQ05YcG5ta1dDeTgxdkJKOTd3dW9ma3JyWmlZSHBuQXAw?=
 =?utf-8?B?QnRqZ0plNHZkZDNkTTYyR2pCVzZZcUlnclhyVGdtcDF1WXN0WDFUYndQbndD?=
 =?utf-8?B?TGhXc2pXUE9ZYXU0WmtpdFF5ekhGRkJ3UHJ2WTVTdHdyQjRYTzVlNkU4MHhH?=
 =?utf-8?B?R3dWMDdWNWpsNExtbUNtOG9ENmJoZlFqWjBoOElSeFY5UUgyYldKRVFTRmdj?=
 =?utf-8?B?VVhKcG82bVVTNStqVDhkMzRBcTVSeU9IT09NbHRyV2p3VFN1a2U2bE42RDFk?=
 =?utf-8?B?eGtKb205dXlkVk5wZjZvaEJTN0lHcjJsYU5Qa2VrVXVleUx4NDUwOHFoWExB?=
 =?utf-8?B?Q09Ec2VtMWZUQVdtR2pSa2FEV3ljNjB2dGVsQ2dURzIzY2Q0SFBVUzhpbVdE?=
 =?utf-8?B?cnRWdXM3K1JsQlA0aWRScEQrN3hVb0V5M0xUTVZ1N1Q4WUpXOE9mWWlzcGtN?=
 =?utf-8?Q?Mum9ATog8o2PqMnA=3D?=
X-Exchange-RoutingPolicyChecked: e8eBtBJJGxyoN3xkngD32Qt501VA2+u7Ym5k6qPFHZyuu2+Bf28moYhs1jajB5VPNJKVdZU4zL5mCOhrNnCrJXVVmzyLBtPdZM5mby/HTTRZgrKRbB1bvdc5pi4lzpmwfj0xHqvCexzDoz8Yn59dcXut7bE7Oi2hAi9cmkcB4fDaD+dgT1XfVpK51/Rca/s7YiLN+zs6GDf+uifYof19rzddlM7DN0mFoE4SSHRaeO3roDjSPzd4nr+uXdQu6DWzc5k0zAX5H74JMtYmkCEBcEG8nZaQ1UfpsYwH/8GMHSjMm2q1/SwW+LlbIzqX6G4Huwq3HkbmAKwSxdJDXxYhOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: de1991c1-6482-4f7a-df74-08df49b99574
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:29:13.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXOBFqGe/Xhfav19EGZBfmhYkOXbnN9elNVUGoy9ZOBfq0ZCNMlBjYIkbJbLH14N7Hp0yWJxuRwQMoFYWgX8val7uB9o4V+GOUtwjsYrhtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR11MB205345
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/19/26 1:48 AM, Jinjie Ruan wrote:
> To support CDP, resctrl halves the number of CLOSIDs available to
> resource groups and gives each remaining CLOSID two hardware
> configurations instead of one, distinguished by index: 2 * CLOSID for
> data and 2 * CLOSID + 1 for code. Without CDP a CLOSID has a single
> configuration, at index CLOSID. Every architecture computes these
> indices the same way.
> 
> Unmounting clears the CDP state before it undoes what the groups were
> given, so the cleanup computes index CLOSID where the group was set up
> with 2 * CLOSID and 2 * CLOSID + 1. The group's two configurations are
> left in place and index CLOSID is cleared instead, which with CDP
> enabled is a configuration of a different CLOSID. The architecture may
> keep this state for as long as the resource exists.
> 
> Only MPAM can reach this today. Of everything the cleanup has to undo,
> MPAM addresses only the MBM counter assignment by the translated CLOSID,
> and it only began doing so when it implemented assignable counters. x86
> addresses its counters by RMID alone.
> 
> Clear the CDP state after the cleanup, so that the cleanup runs with the
> CDP state the groups were set up under.
> 
> Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org>
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


