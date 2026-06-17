Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EF833FE02;
	Wed, 17 Jun 2026 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717628; cv=fail; b=mavVIBdukORZ0pU69ZVuX2Jd6r4RQF7kDy0oMAzc3m3AnmqsIqT1joVn1wAYBxQBmFY/rpjfiYndb+7uQiSps9qk0iQXnqwVFoAjTxSRyg86xJ9aMvzFAziy34UnlhdzLaPqoGc7iEFWCrSH7SToYXOBCt+p1UdETAu/HSwcF4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717628; c=relaxed/simple;
	bh=EtTvsgfXrkTiipa9uZ78laulssYvW4u4+EjXAKaBlm4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EdJaJNZqkOJW/CUNjhzdegty9RO82Dv+sF97Q64Yfjd37unRr522oazLX9ZWqbVzeiM0G9por1Ql4aV03Wbabiqd1z/qSGzvPCh3QpjlTV5tRwRSZKrOjwbVmbxulnNFyHpUaG9e5kHU0WYZrKZwUouLKjwscW+G0KZznWefoGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFmsyYcv; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFmsyYcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781717627; x=1813253627;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EtTvsgfXrkTiipa9uZ78laulssYvW4u4+EjXAKaBlm4=;
  b=TFmsyYcvwjT4dOska1UYV32CSSG08CBvNsQfNUfZV8gEW2zuoeXYwwlD
   o0kbsjw7hsi7w4ixb23BEs5915VSnGNHTfTgr7K7144gcu11qY23pfR5W
   Zqxt+fa32thvoKmsMo3OTvztxRP62RxIzxXxXXe/l6T5kBAF3jWluSsD+
   toGsW2VsaSx5MxZ/ixSJQ4bv9upewjdmEoCwhfCsdZWzvTlhMXW3kNRz0
   3Vm8kxSVUB5ifmHtH72sr+/yQk7ThcwKfXGV7rSGzFH9Jwe14fTAElqPC
   bGIK5eNJ5D8TIY/vO/zA1JL1RC1fCYfiJprK4ggbB5dfLa2oeIztBwvgw
   w==;
X-CSE-ConnectionGUID: nWUzvvGtQUeKTwEI4kJeRQ==
X-CSE-MsgGUID: 6MZChhLSSc2k05aQCLrgjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82303930"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82303930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 10:33:47 -0700
X-CSE-ConnectionGUID: r7309kLaR6Cc1uy8lSXjFg==
X-CSE-MsgGUID: dSpO+affSle3BXFJQA2fPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="248204936"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 10:33:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:33:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 10:33:45 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:33:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKGelqpvgeNvUR6CKhkUUYcLWQe83hdF1BIzsYVJvt9WwXH7/VnHQZZpwFH59Qpi7YxQaXcWFPJGdnnp1H3E4EZ/OtE6/i67fdVIsctT1nWrTxX2qIo9L8hfhGXWd6MgadWZn+YUyh/0ZFYufuUyk1i3QrKqckjX/DP9aJEP609GMHzItOGgaHjYz3ho5fR4nkGU+ZgrdI8AbKEQZoUm5PM8u8xqdF1Hv7/+98TfKO7Y4ulGulwZ2yFvZus0Im2nZAMIu4ZrszZvwxFUUoiR2axcv1FPbwJVUMvb//96YiZMvcPqD/sQMN1c5cmJk4RqD5Onnamkxzn7+fAveRCE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/VxWxHHXm/CHX17ONjs0/+VU56rTPtY20K/yKHX5Uo=;
 b=eI1nc/cg7bdF1mUp6Q5H4oefqXhuU7E1u+UhLbZBM5Wuzx8GKA/5CsMvL4MxjTLs3JMg7ZkTI5039fkrRW8yuek5VCXqX9+aPb1KFcTTH45zUUXzwXuxyoZ5051r6Aaaqjh0eMGKbZEFD6/cs7nwPC7KKQszqNJqgbVRVl6LtXtLDfBkQ10ZxRbezFjwFN2BRNvgCaMFIpTJ5cXMNHPadUkluHJYVBenlQ22Tl00jG3dYpg9OaZHHkf065Qp7h+g2QzNN5R9vNwWESySjQJM9rLXVunkzl/sCQa2dzXYTKZ/iwyo3x5/JHmQeyqCPc9IfZ637l8ePonQk50zGeyKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 17:33:38 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Wed, 17 Jun 2026
 17:33:38 +0000
Message-ID: <413ac3d1-0377-4762-a88f-3d7bfc3a9dff@intel.com>
Date: Wed, 17 Jun 2026 10:33:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
To: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
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
 <a1dbbb1a-ef78-468a-a80c-572a85220bbe@intel.com>
 <4abf97e7-5ef7-4640-b182-83e8bd5bb418@amd.com>
 <2ba92dec-47ea-404e-8dc9-197a846bdb2d@intel.com>
 <572cb801-c52c-4e36-8365-a309e2db6106@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <572cb801-c52c-4e36-8365-a309e2db6106@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 2049d42c-efc8-4a81-8fb6-08decc9690c3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|921020|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: o0X0GJD5h0hzUmjIh+NJ6Ob79RuxPrqJRnjfu7oN44F2V8reBfnJvp2ykyZnCYdafyNgK//87JFVEAdflBf0jahEIMcJHyA17wqAAGb0yc+SMH4U3XWirZF41cwu3JHTwIX7MrnuV602zDlm/PYUpYJA05tWDbj7Z4KsGDqOv/EpGHZ/Y/0VfZhywk80vOEgZEd/84QxIwLt6xP5L7r9s+hezK3jqEnKt4zP8ZmloGZO8um7DCiaA/VsQtKk/R7HKd6J6bn7zrd3uV89/pZ6ycqkfasae80kaCnH3TNLLPdxwsYp8Sh/BJa0Qz40KFOk+Qn1f6wSO10Ac1sN+pMXp+HemmOi4NQzpwZoDVpE6SiBrTVXEBZK6jTfGYDdhgXRN/nmaeBCWzszdgJ6Uq/u2lOcjVoMg7wYz3iFy1DhVUTii104bdYQSzo1n1rJL5WKkjijqjqIZpa1VgQUd1L9SlUl5gsP39fjo2P1p6AeZWRa/Kbn8IPK1OzdqFYXImVxxDX2s10pqe7LXrRxnAz+s3KkiQ5Z5tCO31wMx8livCB7IdLnw7LtyaTa2uR/vvDvzs9ujPz49ruXCSDoCyIprrztQIFRAlfTuqguPsY5FCePNoVO3jivi3cmBvvdpUIbn8rjzOiGz7+MNOmg8HVxob8cxuWuTjY9a0rpFMtiJK6h8DgZY4p2SATzkYLZmphGZkUSg7ykJ6lZ7L5cnVrSAF5Ap3WYZE5z4w1M0SAW2LI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(921020)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3d0STZJMW0rZ3pvQ3BGWjByUGVUVUNsTXprTGs2eGM2Ulp6SElhYndyMTRo?=
 =?utf-8?B?Z0Uya09HczYyUjZDNUpDd3BsWkhFdzdvTEpzanN4KzdpaGFPd3AwU2xWV1lt?=
 =?utf-8?B?Z0VRbmVuSlJ3cmtrazJFbG9Nay9keDJpVXdnaitFQ1AvV2o0UDExZHJQRDZw?=
 =?utf-8?B?M1F4RTltaFZ2MCtNR0h6Y0Z6QWpYREFyS2MzeFJvVVR0eTlqMm9yd2Zpd0RM?=
 =?utf-8?B?aWRTZDYyWWdYcDZ6c1hXeHF4SHRYaXQvejJ5ZHFmN05nZXY0dmRYaXYzb2kw?=
 =?utf-8?B?VDNpVWIxQ1dLcVJtQ1Zsa3dJeFIxdjM4aDhaZFU0ZlZGenJjK3NpajloV3FD?=
 =?utf-8?B?WFBpSXc5TUdtaTl5VUZJM1poUEEvbzY2aWQ4SUt3NlY1OTBZTWJvTVFTaTh2?=
 =?utf-8?B?a0FjRU93QmFWK0hqUUNjeUM0WXU4aDlCdzJ4Q0xpcUl0OWFRMjJLb2lwcFhT?=
 =?utf-8?B?SkgwT0NUUnoyVEhEQ1VwSTZZM0p1bGRON2UveFJuemFFUXFxVllnS1hFQVJO?=
 =?utf-8?B?d1VxakU1Wkd0aWhCYWV1bEtaZXlUM3pDcmhFQTdwbUg2Ly9kcTlVSnRsSUxh?=
 =?utf-8?B?b20xU1F0OEZyR2Z6eklVNUFXdXBpYXNMRHk3QWRhR0RiNW9yaE80enRmcTd4?=
 =?utf-8?B?cE0zK2NiS2t3SnZEazZ4L282MWlKZHhRV3FRdlFqelNSL0d0MmhXUGVRSjRw?=
 =?utf-8?B?V09XZ1J1dUpYWXhYcitPT010ODUzaFFKSUV4dFU0a0E3T3dhQk8wSW4wU1ZP?=
 =?utf-8?B?YmxLdWlteUpoQjRSOUxJZlVpaHNlSXp2di9XbW9Ld1dvVk9QTXZHekNsOUtH?=
 =?utf-8?B?TU95SGI2c2NoRlc3dS8xQW0wMStwbXR4VG9LcURWbWVDcHkxWWFsU3ZYY0dS?=
 =?utf-8?B?Q3d4d3haOEZ0WkV6RE9EajVTcmNPWFdYei9LSTN2alkzMldLYkVDano2RUdT?=
 =?utf-8?B?aUh1Qkh3V1NDbWlRL2crOXhnR29UTnQ0SW1LdWs0OXg2VlhOeFNleGdaY1FK?=
 =?utf-8?B?dW9SUEx1N3ByUTJua1NBQ0JYNExjQ0hHOU5SeVd5K0lKYmxQWEpKbVM3NGUx?=
 =?utf-8?B?Y1lXcjE4SXRVMktwOFQ2eXRxY3N4eGFwUGc2d3pKUDV0d29CVnR0RGlxMS9F?=
 =?utf-8?B?MFRrVC94YTQ5Y3M2VnBndDdVcTFOU0lyT29VRHB2WEhDdUVJZjgybmduSXJu?=
 =?utf-8?B?aG1GMUN4ZzVDZHpGOGNDQllnQ2IxejFVWnorVFp6dEVRcXppTGttL0NBeXdH?=
 =?utf-8?B?dXhkSnJQRFR0a01rR2FVZHRWZTZZTVJVbEl1aHovT3dUTXg4a0hjRjludjBU?=
 =?utf-8?B?VHhLWC9hb2o0akJVT3hXWGk0eHRDRUZiME41UDVYc3pVclpybGdZWmR5eVd0?=
 =?utf-8?B?NGErL1dzODZHSWZxOFlUSTlGVDVjM3oxSnRaRVI2WUE0NzRxayszbTR2Yk5R?=
 =?utf-8?B?bjZ6d0lSVUxOdXVBbEJZV1hvSEdha2N4dmpNdlV0aGhsSkN3aUdsRmdHMU0w?=
 =?utf-8?B?OGJJenV5c25QTnB0dVpSOC83QnlpZ3FVcXJDMFdmWE5WMUJsaWxSME81elNG?=
 =?utf-8?B?amVNMG5oeTFUSFdPcXlHM1VoemVsWW94TnNOczY0YllTOGphRktwTXQ0OUFB?=
 =?utf-8?B?eWs1MVU4Ym1XTXEyUjEvazY0endsejJtbVNULzJEK2MwTjQ2MjByanNWaklY?=
 =?utf-8?B?K01DdHRkZW1Zb05BOXI2RVNJMGM4UXVQUUJiRmptSm8rWDVLTlp2SUhscHlY?=
 =?utf-8?B?MzN3YlFRWnd2b29FMnV3V09aVHgvV21MOUJWOTRROTFOTzVyV2tLTTM1b0Qy?=
 =?utf-8?B?S2NsRlo1QTdFcE8wVk4vSzBWUi9EaDR4cm5vTXhlR25wRkFwTHUxbFVLMDhT?=
 =?utf-8?B?aWxUa2Q1U2h1OHhnbVBGSG15V0E4TDJBNHQ3WC9IVnBGeVBqUlgvY1lDTTRE?=
 =?utf-8?B?MXNTNGppUjVDNDBNSDhOS2xubzN3cTBKR2lMbWQxVFM4ZFl6L0hIbDVtbUZ2?=
 =?utf-8?B?N2xtRUNPMjM0VktQM3VqK3o2VlN0VEo2Tjg2OWdCTDBpem9Cck1CS2VaM2RY?=
 =?utf-8?B?RVd5QXAvZkxTYXFvUUlUVkUvS0krckU0OWk4SHRXaUk2ZVc3akNvM2psSGR1?=
 =?utf-8?B?NnN5SnRHb0Ruc0R2WTZ4b2RYakt5eTQvNVF2ZURubmlDK1ljWnVVOHNpV1I0?=
 =?utf-8?B?RmxVNWNTbFFtcWlYakozRXkrWGdvUzZDV1h5NW5qYWZPT1VkaEhOZ0FuSWZk?=
 =?utf-8?B?TEhlblRFQnR2OFRqVk83eWhLaUo5SVVPUCtjMW5MMkJuWHJyK0kvZk00NFha?=
 =?utf-8?B?S1BnQ2ozZ3d0RldINmhlejdpbEJjUmZ0U0oxMFM3bGt4SzljaW1tQVR4VnZB?=
 =?utf-8?Q?Gr1NdAzbCMTU0I4A=3D?=
X-Exchange-RoutingPolicyChecked: W6p7wXmr2VTBfLeYdcR1uNHhLGEkn4YPXDu23SbzINvCSfOMIHLjGsH0AMbgeHvPGj/xuapDrfVQte8u3TenYcA3gwhT23K03ipE4bijiAYTcTwPAy/cwV00yWqQGUkQuP2vZbAAvZOhLpdAplcj26PDtT0je512RqxE0foTcDgc+Ta7dcgBjY+Il6nZBDM5W0RlyC5oqX5Mtic+tzTU9hZEjx1jLHJnD8ezSZO9uZc5RfponUjpYE9K81iAWMB3ezaRp9Bq6QGmebWuEfN4W/SPqRHvtMuUyU2jFTJfsRoiEtAfcC+/ln/iLsEnUUObbC/HPgs9gsO555hZBXUkfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2049d42c-efc8-4a81-8fb6-08decc9690c3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 17:33:38.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZkxdYXKkSpYEiJ3FeN3ktPAGRj1W+MR52sW+K7Kq6ApYm+8vN6jtFuCzl2f2XXbX4aH34zInu+TfE0BTzvRcIsrhN5Fs6IQdDxOkKabaH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
X-OriginatorOrg: intel.com

Hi Babu,

On 6/17/26 8:56 AM, Babu Moger wrote:
> 
> The display will look like this when the system boots up.
> 
> # cat info/kernel_mode
>   inherit_ctrl_and_mon:
>   global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
>   global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
> 
> There will not be any group associated with "inherit_ctrl_and_mon".
> It is only used to switch from other two modes.

Just two nitpicks (adding the "[]" to indicate effective mode and fixing the
copy&paste duplicate mode names) to confirm that I think you actually intended to
write:

# cat info/kernel_mode
  [inherit_ctrl_and_mon:]
  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized

I would like to propose that the user documentation contains something like
"the kernel mode is followed by a semi-colon separated list of properties"
This implementation does not require more than one property associated with a mode
so this does not need any code changes but adding that flexibility to the user
interface should help if some future kernel mode needs more than one property.
What do you think?

Reinette

