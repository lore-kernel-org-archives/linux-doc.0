Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743A370AF5;
	Wed, 12 Aug 2026 23:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577342; cv=fail; b=i1Rpsv8zrTirTp0npv1bUbUQMoN0Ej7GU3HWK28H2TMwk7MtKIJO4YCJZN42mXhoKLVQrhaYoGX9R6MjTai1/kpUzU0u4eiyvoBRqw38kc1rBzKdFkfvRqqfl/VcSV8SQAcYoW5L8Kn5XMlEK6dRJiGVkZjJEV8VnWtGjjnJuh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577342; c=relaxed/simple;
	bh=pU4tS5uQZ7MPesER8gcT4veDzgYmlxGSR+PRGRbe11w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RI6W7nsJR1y/bOOk9nrrLmis/czL77J4QdgcRIh9FW0qqwPyfRL0T7G2N+FwIS5zE8sXfK2VyqDRofbNFIA+x0qm1gxBei68Bk7t/KpzDE0ik4qfBkEE2xQJ5dLzHdUGivVBHusfYlIzsWAkE7ZL+4UXqNIO+CVx3ecgIShD8ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYCV35lw; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYCV35lw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786577341; x=1818113341;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pU4tS5uQZ7MPesER8gcT4veDzgYmlxGSR+PRGRbe11w=;
  b=VYCV35lwENTv+b3ZOo/qAz6HZacBoLcJgR9mm+oc0Du0nQRPoRcgdFm/
   /HVHqA/NEYy86jZsKHyHpxczRAMX4HG3zJPt6QQBMVb8HoDh9n4dUMcxE
   0+rUFQl+x6ITJYmAVhT65BUIBsAYAbtyHBZRQRU8PDTRGz78aFnyuYM2u
   o3YI7z3Tzp2gZPWw1bAhwvveZQfm135a88OLrcbUAlRgKee1+EVJ5TfmL
   aHoFErn4jl/fC8YYg3kJJn/cdUUkUpAfq2oL6wDEUrnWPcbd1qXytiBdc
   F4rpitRsHp26eAIkPQOd+6inZKPR5V2N/x8PhKYj9jNgFlIm2LwkCCkkf
   Q==;
X-CSE-ConnectionGUID: 9X2ynkbsQv+AiJy1r11JyQ==
X-CSE-MsgGUID: XLt19o9HQ0WQaa00nkX7ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89668487"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="89668487"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:28:59 -0700
X-CSE-ConnectionGUID: D5k5tHtyR+Cz7rOQ5cepug==
X-CSE-MsgGUID: 2ZQcIBUVTkiEt1Upw6DlyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="264365458"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:29:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 16:28:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 16:28:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 16:28:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9Lg3Mc/oy1FkDNTNhtpsdsD7ETqpHjjGhzEnWCeH6FPCZaTXk/tI/4W1evBB7jCJ8S1TI4J6igvlHKOK/CEcEPhyIr+rokDZ13FSGzLl7HgSC5fHa9hfP5Y6pQZoB6gud3fXSXP32HC80t2jk9ZQNHkIX/ergOVUI0JzWuUopFMzgHt1vfhuyIK+6TUvlGJRqzXhQYzFK05B+F+8mFzfeKQlcIoZSAC00Ywc5/Y+ce90gjTG56wz1O6RLe4KqMsPAze1F8qKw2vurWIBfCQitvPaRLc/tWLY9ePMR8mwgw3ulSRICCGnbmQLvvdEmk054uW/i3c1vgLoaE4t3BiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrGeBxURGH0ib0/zCz8Uue9I2F6mUPjTjPl4gxpWJ1I=;
 b=apgbJg9Rwa1+edKfE45R36k+4uX6xfrHwMfojsb0fxStPcIjnQ2P8J6P2AZTsGMXHxlb25KozxlSaiiMjL3W7SlW+WSBRfzPe0G107MgZaV79rH4gQdhg6DF44aVOeOY47MD4EaGMBaZg8k5fD2ihIdCb1yDmIyfQcojPjKoW/m3MqJ27Y9VFjVN25oSU1eFlebTW34hSTwsCAQ/2prAYiScY0wnQ14coP7BOYKWHhzg0WC6oxi5ylZ2+wyJc45qub/UnuC0bUxk4f+9nFq1Awvi3JczblVuPeWkGs9jw8Knhj7QhnVl/ilgKv0HtMoK4FOPYGcYX9INWtKwjJ+8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 23:28:55 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 23:28:55 +0000
Message-ID: <e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com>
Date: Wed, 12 Aug 2026 16:28:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5fad6e01-1052-4c1f-82f5-02c650ae1ffe@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:303:b5::25) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: c281b0d2-7538-4532-270f-08def8c979ea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|921020|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: PGIXIw9Jc/OoVyaiEiBgUfQlGb73+lKBBEAL87Yh0xLIMOXVbI+yzWD1JcUnyJLieqAmcfLTMQa/jzh+/0wMHhQPNP5XpEXNsutWIvFgaSsW5yuYl/xUVRR9gto0KptZVq8nCZaR7nESuhhwYaqQdy1AW4d6g3xK90ubpoYK4CYcJHP8rU3tkwGaz3bZI8KqhZHjPsaEpZKNVs/qo+Ww1EkwLAD5YRCnhOaI2CYw/Rc6ue9XrFoPY3y46WV7w15L/rBGjbRgBwtROzUxZNa6qjXgPuSeW50g52whdOc0YTFIq6JeYZSQ4rAXuRlP3lVoEMp6RWGxRuBG+7g+IfVpedJe1vb5NDd6icZOb3NJrzs8OJdQELG1L6JYibafe10w8Lzdyuwv2e3AKNsG2HUEloOmKHakFx7rMa2bJmKDTjtExZ9nw3m3fnfJkxI3uzgZVdUL0wMbIg34EoiM7uEN6VdMwBxhLZKQ8XRJM2qU7fZ59bADvP8XM1ccRHF598qLebht9DBCWCjjopfDTGULfpYz+sA9XTwEYoiRYyrFYb5OzpFbVfRvuXLqCz1+IonsFuKYe269qotawLIWhOjc8pgMk/3dBOCHbfmNo8aZ4TSHcCA9ecZnUbl1F6lH1cmd0aKq+uyFIMlAb2syL6yCBUp7UbXPPAFqCiICJQjupZm+mvksfVzHigsmDbrDvi0ruMX09KvubiDgpw01ybftJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(921020)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmlteUN1UjIvZS8xZ0hiT3VhbVNwVG1zNVM3S05BZ2RVclZBSEZpdkhOV0Zs?=
 =?utf-8?B?TDNZd2VkTVB5UWdPUDdhR2NucVpmNW1iUTR3Yys0c3JjYTNGVCtVZmZDQWJU?=
 =?utf-8?B?N21zSW1FZVZZWWlxUW1LRS9nL1Z5YStEdCtTUlB6eXN3RmgyUzhtYWJxUHBR?=
 =?utf-8?B?YjJOZ1VMS2JxU0NLcm1jMlpTMVJDOG9rVkZIWEZ6WUY5UHhnQmRON1VISVF3?=
 =?utf-8?B?VWZ3bHRCUU95c2Zxc1JGM1ZSbXVueU1XM2FuZDNiNHVUcVlMamdVaW15V1lL?=
 =?utf-8?B?dXdKTHJ4VGd5ZmJhenEvTTVibStJVzlzMTFibHZvZlllUk1yRG5JWk41UFdJ?=
 =?utf-8?B?TzhhZHV4U1MzUHRBRlZmNExTL3p6TTZRcU10d1VBYmhTOVdPQ0xRa0EwWUpj?=
 =?utf-8?B?aTdSeHhPN2Rjd3EyMmFzeWN1MmtUYjBacDg1NU9hemtYM0h5bm5tZTIyU203?=
 =?utf-8?B?Mm1SS0krSll5SURxWGgyYjFuYU54aW42MU5UaCs3RXJnQ3RkNzNNdFN4S2U2?=
 =?utf-8?B?SS9hczIwOFMyajh6c1NKN3AvMXNVVVFuQWl0VGl3c3k0c2JrRHZmdzhnM091?=
 =?utf-8?B?RThudkRPa0FURHlDaFdEak8zazk3NEQrZTErT21tZEFZcUh0Q3NscnRSbFJ4?=
 =?utf-8?B?a1dyM3JOajcxM04zNG5Vd25IYTVLWmpJcGtWclZQQ1dBOC9VZkVkRXBRUmIw?=
 =?utf-8?B?TG5jK3h6ZnZ5NUN0ZStwdVFjb3F1a1c4TnM2dFRjZ1JxR3dFeGJVeGVTeWhJ?=
 =?utf-8?B?a2ltWExNS0kwcGFlOXp5Um54OXhhMHJGTkJWaUp5eFBaU3VwVnIrdUZZWUhZ?=
 =?utf-8?B?Z0Q3V2RDVkxhWUVKWHdCMHdHZHlBY2lha0xwMFRhMHlKUGpLMFFVbnQxMWZC?=
 =?utf-8?B?WXJaUkZMNXd4cnpiUnM0cG9NRStHZFpyZkV6WGZHZGN0amh3KzJnWDl5QWhj?=
 =?utf-8?B?bzY3NTh0UGpQQkZUajJGVG9ESTRtdU5qSE1GL2JmMzJnajEzNHhZQmxqakpG?=
 =?utf-8?B?VWM1cmdmSWkzd204azQrNTl0WHl2OVR5T0F3WEdEMXBVOHVaQmQzN3hjZjdS?=
 =?utf-8?B?eVBkSHlvbDc3N01yRWZqelJybklpckVkRTBNQmtoRUNBaFdmUnRsQXdoaGdk?=
 =?utf-8?B?clc4U1dUQXh2WmE4dUZReHdtamRTd29jekpRMUF3YVpqRXhkY0hLVjlKYzdW?=
 =?utf-8?B?RUVTM0tvcEwray9xaE5CUTNqZFFJS1c1R1F2T3h0ZWdxRnUyRTVLUE8yWEcw?=
 =?utf-8?B?ckFVUzFtZ1VzdlZvWWxCK3VnYzNJZE9wUGd1bExJb1lkeGxZOUhtYlZnV2xQ?=
 =?utf-8?B?MjBaeWFvbzlkVllQbkJoUTVoWkwzdUJ6WEhtZ2wrQXp1dXlueDAvNXJTSzRP?=
 =?utf-8?B?d3RFRUFFbFN2czZ3QjAzWUs1dHRZR1FBT0lJZ3BiT2srSFpyUU11b3pHSGUy?=
 =?utf-8?B?TUhybnRkN0phMWdlU0JwWUYyS0ZlcW83NDVXQVp1RE5Cd0xuaHhYTlBNOHFS?=
 =?utf-8?B?ZjgzZjNudVoyckIxendCamNwcHl0U0I3azA2YXg3ODJMR1RSNVQyS2xLblVJ?=
 =?utf-8?B?aEt2SURUeGUzbVNvY1kvckhiZTFDRWJnTW1YT2oxbXBWdjkwRTNwWWdaRldK?=
 =?utf-8?B?UEhrcHRxYnpKZnByNFB2UmFzejRUK29GQW92Z21mTEk4WkRUS21XRE5XSklv?=
 =?utf-8?B?aEt1VEx5VDF3QW1TZHEzcGsyanlORzZ5MXRyZURDWnl0MEU1eGpueUpkaXk3?=
 =?utf-8?B?eG15ZGQzYTJZSVo5Q0Fpb1pjK0prT2xuK0hyd2xQMHp6dVUwNVR2amRnaXNz?=
 =?utf-8?B?dUJJSWdnRVF5YWFBTFVWVzkvRVFQak55N2JyQVdHVGdMaVd6c1NhLzFYejgx?=
 =?utf-8?B?UVZyWFhsUmVDd1Bmd2JFM3lrS2ZPTGpnZ1RBdjZGZmJ2T0hSa1Zxd3BtRmlI?=
 =?utf-8?B?VXpuNkhuT1hLSW9LM0F3aTBmWFppb1VEc3RNbENpOXZacGUwdjZTeXM0UGw0?=
 =?utf-8?B?UmVzbllBQURTWmJnZG9VRDJ3WTY3dUFlUjZ4c1h3RFE4STZCUGpCVW9KaHBt?=
 =?utf-8?B?V1ROM2c4ZUE4WkJ5UEdjZTFtT3lMaEE3RWlLdDd4ZXdNb2h4Y0JwMjZkQ0dH?=
 =?utf-8?B?Zmowalk3M2hUR2NQYlZqQnV3Tm1rL09sZGtweUNPSm5XL2Y5TTl5SlNOaGZ4?=
 =?utf-8?B?TUdxUFkrRURkTWNjbVdIcm4yM1dkS254b0s5Mzl6ZkxJRHl0bWdHbThtWXN4?=
 =?utf-8?B?MWswNitlU1pkMFBwYms4TVllOWNiS25HakxNdHR1RlZtM2MzdklsMzBoaWM5?=
 =?utf-8?B?N0M0NWJYN0JWN0JmREhFL29Iczh2M0dsaHFpaVZEU2NBeldtdGJUaVI4SzB2?=
 =?utf-8?Q?rRWHJf7520pNxgEs=3D?=
X-Exchange-RoutingPolicyChecked: Xxoz445j/biokfHAQQPW+tGaUZ+3vTWupRuPQqcQcvCMF40IxSs/gWx+18txHB4oSzhE1faLrIwzwlEq3L3lve6dhwLkB6zLnhiz8lfAajjG1vP3AyY6OFFbChe68KJonS6I3+qEAN2wTQSDz97xsxY6FbswZRRAmgPKa1tXrdrbzL38YDFfvOyFRre90lczfoeQ9VQTeZXqrTp5eCRLfzVQrjILX6otamcpWTUlW9hFwDQwb5gmMCwBxfzfhQh/f0W4wCfXfPlVYMZQJp9ZbRoYJoNp/3zTcWIsxxVuuRWjO24YCFib50zRDbWD0ak66s7KsgX5Hh2+ZmaTtpHaSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c281b0d2-7538-4532-270f-08def8c979ea
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:28:55.2675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srg+UyQq6ZaORhPhs9Ujr5UZcnebI1LL+i7CQ97JpIeD35YB2UFylFc7Whb7HuqiwDo9Pgb2ZGbEow2S1NwXs1265hn6gc8OyjrubccjQ90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
X-OriginatorOrg: intel.com

Hi Babu,

On 8/12/26 12:58 PM, Moger, Babu wrote:
> On 8/10/2026 10:03 PM, Reinette Chatre wrote:
>> On 7/7/26 2:50 PM, Babu Moger wrote:

>>> can report what is active or what the platform supports.
>>>
>>> Introduce enum resctrl_kernel_mode:
>>>    - INHERIT_CTRL_AND_MON: Kernel work inherits allocation and monitoring
>>>      from the user task (current behavior).
>>
>> The issue with this "combination" mode becomes obvious in patch 7. I also
>> see that sashiko hinted at this issue but I am not able to see from your response
>> what the plan is to address this. As highlighted by patch 7 and sashiko the
>> "allocation" and "monitoring" features of a system are independent - a system
>> need not support/enable both. This should be easy to reproduce by, for example,
>> booting a system with needed rdt= options disabling allocation or monitoring
>> features.
>>
>> I think it will be unexpected to a user on an allocation-only system to
>> see interface like:
>>
>>   # cat info/kernel_mode
>>    [inherit_ctrl_and_mon]
>>    global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
>>    global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
>>
>> Should it not rather be, for example:
>>   # cat info/kernel_mode
>>    [inherit_ctrl]
>>    global_assign_ctrl_per_cpu:group=uninitialized
>>
>> Similarly the user input would not need to provide a monitor group when system
>> only supports allocation.
> 
> Ok. Yea. We need to separate control and monitor separately.
> 
> 
> How about something like this?
> 
>  # cat info/kernel_mode
>    [ctrl=inherit,mon=inherit]
>    ctrl=assign,mon=inherit:group=uninitialized
>    ctrl=assign,mon=assign:group=uninitialized
>    ctrl=inherit,mon=assign:group=uninitialized
> 
> If allocation(ctrl) is only supported.
> 
>  # cat info/kernel_mode
>    [ctrl=inherit]
>    ctrl=assign:group=uninitialized
> 
> If monitor (mon) is only supported.
> 
>  # cat info/kernel_mode
>    [mon=inherit]
>    mon=assign:group=uninitialized
> 
> 

Please always keep in mind all the requirements and use cases we learned about 
during and after RFC v1 of this work.

For example, we already know that "per group" assignment is something resctrl
needs to be ready for. Consider the example in
https://lore.kernel.org/lkml/aYyxAPdTFejzsE42@e134344.arm.com/

There may even be "per task" assignment in the future.

Constraining this feature to PLZA will make it harder to enable the capabilities
that we know resctrl need to support in the future.

This is how we originally landed on the "global" assignment distinction
(https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/)
"global assignment" should be kept or replaced with a solution that continues to
prepare resctrl for these other capabilities.

I am not able to see how resctrl could support "per group" assignment with the
interface you propose above. If I am missing this, please highlight the solution.

resctrl may need to explicitly split kernel mode from kernel mode properties. For
example, below shows an "assign_global_enable_per_cpu" as the kernel mode, now with three
properties: 
- "ctrl" - could be "assign" or "inherit"
- "mon" - could be "assign" or "inherit"
- "group" - required if "ctrl" or "mon" is set to "assign"

   # cat info/kernel_mode
   [inherit]
   assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=uninitialized

When resctrl needs to support "per-group" assignment "kernel_mode" could contain
below with supporting documentation noting which per-resource group files will
appear when "assign_per_group" is selected that user space can use to manage
the assignments.

   # cat info/kernel_mode
   [inherit]
   assign_per_group

I am not asking you to go and implement this. This was just the first idea that
came to ming that I am using to highlight that any new proposal needs to keep
previous discussions in mind.

Reinette

