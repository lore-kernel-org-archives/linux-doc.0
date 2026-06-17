Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC271E0B9C;
	Wed, 17 Jun 2026 04:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781670909; cv=fail; b=GdaN41rT21SAbxS9s4agJvAHmi3MpdM2JmpgxeWsLBWUVaR4/ou/iR3L8PN5MSj4koBRa2u7jSVzOUJ4zbUJ1ylucqVbgeyFg6G7GK4E5Mio6NQWYHRfjq93F2y1WnfzcGutO3AOAGpdieIIl3IzVtwC8vDBu3JQIbL/K7S7bS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781670909; c=relaxed/simple;
	bh=R8urKkmJ/6N6ulNYGIFU5fMf5XyecKavDngCAbHwwTE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rvVIi7uErCKXJyDsdXw8ZkAtpMUdHhM+ybF2EHfcFjtPCLN/Q1CUiQk6ytH/7Z6OOPVAQ09lOJcyzC+imAUkJpy0Tt02aP5yWr+VKhbVLKpFbmKKmr+JDLW6jW6rI+8Q4pmpsH+66ZjBlt6W3nLPjz0qYXvagHLyI+Xs4EM/tvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jn/HaGCL; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jn/HaGCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781670908; x=1813206908;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R8urKkmJ/6N6ulNYGIFU5fMf5XyecKavDngCAbHwwTE=;
  b=jn/HaGCLWj6ZRhjyOfWmIGnXXoPaULxsTuO3HH4h5VuTIwljwH55U3aJ
   ZBjfPcxYeR8XUp6Ur4dQn8MtZHbEv5fMzoGhn/RihP7wAXmcEFNVsMkww
   JXNk9t5C7Ht/aoaZvptcdDnRHjZqz2yOAd8XGBMmhsr3AYu0bErAT9Zlk
   7ti+21ezLoOJ+GXLmZTUIbzcRssb7x7VcSpN5n9tkDIFmtRig+bpD61sk
   ugGl0Xeff7WjqV/kJivAiY3PgjgZ3BEODPmxW45Se2AB3f69tUXFWEDp1
   npKUgnaUtLTiB0AKiqhQBIs7CoDOYUaA+NPz9+14Hd84IJlyrxakXHX8z
   g==;
X-CSE-ConnectionGUID: ZklHj2FPQu+6vX+Q+haV7g==
X-CSE-MsgGUID: xWTK4a0QT3iIZjDoqTmvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82464634"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82464634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 21:35:07 -0700
X-CSE-ConnectionGUID: OTAv49XhRAOjRHPH/iJQ/g==
X-CSE-MsgGUID: qZHGpPBESViPZQEJs23AcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="272027180"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 21:35:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:35:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 21:35:05 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJSAEdaOybQ4yI9342CDfzrBkY+B3bOBLA48pbnrCWf8/nNxp4lC0UlZdWHvCvyZHJhxiCfO9YPAU1PZ5XIHbzg4ZPA2Kg6D0zMPKTuKmlDOnHhoNsLnTOYLW6/r+YOzU5CXfRcLfFXzudOhKN/eAz3DzVdcA9BIj2v0KrRgLOp/LvBCmerFrQw7bRGOqAGibtMWOahSxazXqYRqV48JmoFGy9ZVF4Z6sSFG5ZOAiyeQO/19/sShIuG4OIArXZLrm/so4EEyKsjx9GlVH/CNNAVN5mMx4qLeauR2KUMxpQPjiDYxhJB6sY/hB8u0XCjwylVBOzAQIt3eHvKImcCxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EG+UYEOwzqk0puQb8lLB0M16FCDArclaY00KEKxA9BM=;
 b=OHASQpD5P6IMdV9Q/+PZldDeDzvaWxwov3iHpNsGXYto5fvnZqXqIEW5iwXB37m2O++aDLAiTReojn7/G9TNwq7jpHpqxkLpHB/Fm3lhVNd9s6xGtT/6B+PLfAQ1sqmzCnq7X7LFjn+w9AJnHcZ2iIJEkkfViVLpafpL2r5vZ6gqoRbpmLlcPytQSWsl2wJ44SJRopCGuz/bl87MA0V8IsdwNyFCiyhw6RGG+bZ/5VT2d8I1FQlHVMlk9BR8CXPoCuVVEPEORydRNHU25v+eA2DvIlZBuhOqC38wY34b4J2rnh0fkBEuL6w5+mptLjw9kCc+4qCWGAQtnDEhNVRjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MW6PR11MB8337.namprd11.prod.outlook.com (2603:10b6:303:248::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 04:35:01 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Wed, 17 Jun 2026
 04:34:59 +0000
Message-ID: <2ba92dec-47ea-404e-8dc9-197a846bdb2d@intel.com>
Date: Tue, 16 Jun 2026 21:34:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <4abf97e7-5ef7-4640-b182-83e8bd5bb418@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0384.namprd04.prod.outlook.com
 (2603:10b6:303:81::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MW6PR11MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9f2d3d-c559-4b84-1686-08decc29ca82
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|5023799004|56012099006|11063799006|22082099003|18002099003|18092099006|3023799007|4143699003|921020;
X-Microsoft-Antispam-Message-Info: 01B6033RdaxyWud70LLZ2XRm2SKQlcWH8NOPBk2obW7ZnqR5q/xJ6aMjRrJ16QIAC6RY5xY2pvpkI1VSe3RneSeugrfJTZYywSI6WCrntb0m3M7zyd8P/HjB2g+WyZ2zhQjpBoed9ovfxQyogoTTBB8xLtrJWblReIYfGmPdQFjPr1z02tT21pzOt2Uc8aXjtrxKJjE0b7FQ3UjU+K4H1KaFQgCdUX4tGTjBMQ6FTYQPQgNkyTYdGG1DYiB6AOznFEqYCh6eENaZeOH7tzmd5mIokyG6XrIOf63oVbAEKL9ufy+9JMHT/btsLhlpPPvSLDfobEXr4z/EQapw+m9ZQV2kT55Ju3qswGnkBG9Apj8FRSU/380oUfRsEMJP4SOYnjXb8z2FVQ6qPlToVTesFO3pir6WatZg3WMf9jC/bi8pkyTLx0D5KcgvvgkAoGMO26PPlun4mjTL7Xn5Z9/eTZamrkJCVt47N4/h9AR51mRUnsdqUfGFVXv9BicdXldfKd2l7Ad4dt1teXwmcicm+7uTD6JiXu/kfXQyJnWyDiiq7VacHr1z8tFf+j1TELiYPAVDXe7JIXPfrs1IE7vYaY0KyRwFYmbEDbD8SP2twAxlrupi6fhpJZTB9yM21wPsQA/mBG2bOvZgfum7uuJS8p5Y1YTvL9c4Huwt4qjm8NrcKw7ks0hsI7sg1MpNYix+WHgGxOmQX1aVqRD8aSO04WkuQ41QGUWUDZZIx9PRh4RUUQBy8nPwxWjn8UodMo6j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(5023799004)(56012099006)(11063799006)(22082099003)(18002099003)(18092099006)(3023799007)(4143699003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWU5VTlpeG9rd3JPcE1IUjZzN3JXMDhFaGNQSS9PSDZBNWhocnJ2WkdkWGp3?=
 =?utf-8?B?ZEt6d0FFZmdqQzZqZy9xazJhNXZVZU0yZGwwRmFHTTRlcUxqbnFzODFrQzN4?=
 =?utf-8?B?UFdXTHZ4SlkzSkdSQUFWNVJ0TG1TMVRxMlJXeWwrajRYUVRmNzVEY1d2MHhB?=
 =?utf-8?B?cVlKUUZScHVKR3RvbjIyNXJTTWEybDJsTWI5QnNVOWh4bUN3WTBoVHkwNjBG?=
 =?utf-8?B?a0tZcS8wbzdaVGpPbXNNbFBHRFpWOGVaenF1UUVSVEVIQkdDc0QxbXZGd1F3?=
 =?utf-8?B?eWt0YnF3MFkvQjNwbW5qWWd0VkExSXN6VEF1SENuRXhpOUpMbWhVUFhnZEor?=
 =?utf-8?B?OEpUSEo0bEZYTnpCMXpGQnZlM1Y4RENaNlRTT1N6ZHlMV1c1YVhjTnFpS3pZ?=
 =?utf-8?B?cjhvdnhTcG9XNUpwMXlEUTBXQzV6N2RCQ3JuVFVqUCt3bEpVakl5bjU0SFRP?=
 =?utf-8?B?ZkFlQzB0NWdEN1dsVkZGS2tEMGUxeUNjbXU2eHJNaHRubUVFMTNCT1FVMGgy?=
 =?utf-8?B?azMwOEt2eklJYUNrWXhLcUhhVWRuNmhrblVNZVdqaDdDcmxnNFhGMmlDWXVz?=
 =?utf-8?B?cTlUNERHbWtGaUhCWU1yL3U4WnNNNS9Ebk5QZ2hFVWswVFlSNVN2dGc0UUgy?=
 =?utf-8?B?ZXVON3E5ZHNMNGoxQWxqSmZLSU42R2xlcTFXcW41RGtWVDU5Mit3OUtQSTky?=
 =?utf-8?B?eGVIYTRRSzhYUmV5d2U2NDMzdEpIS3BkaUFudGRidm5nOGpsczNzRUQ2R1ow?=
 =?utf-8?B?bWV3V2RZS3NMbzBrQ0w4QklGbFpTT1FLbXNiV2JCaTFPZ3dqT0VHMFdoalJi?=
 =?utf-8?B?RkI1aVM0SnpxMXdsWThBRGJaSFNCZCtXRThXZ3lqb3ppUzYzeVA4bzlLSDJ1?=
 =?utf-8?B?cVc1Q3ZxdTR1Z3UrZGFXRktuTWl6OWM0L2JXTk5ScFdpeHpWWU4yRVNoOGdN?=
 =?utf-8?B?VDVUd2dBY3Avdm1UV000bEVwcG92VXJ5a3dLcnU0c1dDZTdWRS9lYm9iVVR4?=
 =?utf-8?B?UFZKM3ZjL1I3WjNtYVJid2JGUmhXTTZONGl3c3lOUDlyTnpVU3BlTUFJUU1o?=
 =?utf-8?B?Wit3Tk1LcU9CdEx0TzIxeWRZZVRleWswWXVvVWozZGVjNmRlQkxkVFNOVVVp?=
 =?utf-8?B?d3BFdW5nRnFIUmFEbW0ySTQvWUZqbHIwZUorTzg0ejFPck9Qemw0YWFFWC9G?=
 =?utf-8?B?My9UTCt5eTB4YUVEZllRZEYvaDFoVDhMelQwOVJkT2pidDhCZGVOMVVrTmRy?=
 =?utf-8?B?eFZFRVNhVmhCY0hQRGdTK2ZqZ0FPVFdtN3BOUVBwYm9MSk5WR1NtNHlZd3Vr?=
 =?utf-8?B?a3Jyd0dOaElaWFJVdm4zMFlMSU5ET3VlRDlqMzM0M0ZPWCtnTDZvNWtWeGdG?=
 =?utf-8?B?ZzFsd0NnL1dOSWY2OUhvTGJtVk5ERDRuYlJ2dDk3Yy9oZThZSy9rK0VlQ0Vq?=
 =?utf-8?B?MnNtSGZBWkdkc2o1SlVPRVFsL0JkNUZtdnluQUdkcjJ3Qk9yc3RLeEZlRFRh?=
 =?utf-8?B?K3ZqZlpaemJyWDN2UFRoa1lERUsvU2VEcDFGL3lyUUtSeUR3YzNQbXJRU2Iw?=
 =?utf-8?B?UFNwQzlzSGF2VTlNMGRsa3VSaTJ2bjJ4QXN6TnQvd0ExUk5MbTRzdUdvOHBk?=
 =?utf-8?B?VHRlcENQbzhVcmtUTXVMV0VzbTZuUGpWTFBHVFpBYnNUZW00aXk3R3gyY1M1?=
 =?utf-8?B?S2RUUk83NEY3YVpINnUxMG1BKzdxZFBhQXcyY1FJbDd4bEtVRlp6WU5XM3Fz?=
 =?utf-8?B?ZldhNGFhRm9lMld4YXY3MmdlU05DbHNKamVxcEtSd0RnMWNOWStQTWxNekNo?=
 =?utf-8?B?YWFCVjM5K2ltZ0pjb3ZOU2dLVDVYKyt6ZGc2dFdpVDNlTlF6VHR4SjlRZGFw?=
 =?utf-8?B?ZmdOWGxGbDZLWHhDU3FjazdOVEJhcEo4b3NZSWVFUUdXdDQ1K3pMNHIxKzE4?=
 =?utf-8?B?NDRWMEpVZDFwaElIMkFpZDNkbG8wZkxBbTlNeEdEV0dYQThOeml6aTFDZUE5?=
 =?utf-8?B?Y0tJSE5jZi9HU0p4b0hvQXZabms0VlFmeVdIVTFhbVdkWGhCY0F0bTNMSDVZ?=
 =?utf-8?B?cTRxMHhRTzlXTFpDRUhUSjRwcmxpbm9OWTZFWlQvUmpVdUQvY2k1MXd0N1Vx?=
 =?utf-8?B?L2FIVEZBWktkSFUraXVtMFA1TVBieUJYMDJrQVZ3K3BHLzhhNGFwQ3lyUWF1?=
 =?utf-8?B?YndPS0FVZHRsSS9EQlVCTTFKaXJUME80M212T096b2oxdFFUMzRIZXVnZzNF?=
 =?utf-8?B?U1h2MmpjODJzb2V5QUdaVHhtcmg1MWVkZHFQcEdBV2JublBrbWhJRWswbU01?=
 =?utf-8?B?cFdIblhaODRxNGhnNG03WU1tRDdLU0IwdTF2TFJXYndzWWtyblZsM3F6RlBN?=
 =?utf-8?Q?SENuHa9InTcN9i74=3D?=
X-Exchange-RoutingPolicyChecked: Z6R+HAQnrUAxvJ1FGpc00UGkcdrzsmrYwqiT+5jGxg7A8oxYF/b0kNcBYH3PpchYUaqiSuYkfW4ron6Bsc3B6GjJiSVwd8xJ9E8Vy/Q7sQ0VEjCZJExVsoms5AcI+RaJNAJUWEUO0HLlIKfmyxrfBaH2xSkBU0COo3vCro+X2jZKOyhGisyLn2agjiqLjNUB61s2D1YpbxGWGufVeWmY53hZWIwwa1jmmnvscx0QeRSLJ9OpKPupy7fO2mqtAxnG8eki/7jdsDu+ZXFV12o9Ntto8Zn0XWM3ipdgxHy8wNMWCCc1VvQwF6ku+y65MLZnNyJOfVmmM3hK+YKIbFpiiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f2d3d-c559-4b84-1686-08decc29ca82
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:34:59.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lR6VowJsiSHHU9JAeSPC3vpAxXj5HTB2GIJ8P+S6PIv203DMhjI5uASii3KRbcHiTyzuL9377BUUw626VenW//dVQOKUvZG/IITKdxIaHL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
X-OriginatorOrg: intel.com

Hi Babu,

On 6/12/26 8:37 AM, Moger, Babu wrote:
> 
> 
> On 6/11/2026 4:53 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/30/26 4:24 PM, Babu Moger wrote:
>>> Design
>>> ======
>>>
>>> A new sysfs file, info/kernel_mode, holds a single global policy that
>>> selects what kernel work is steered and which rdtgroup it is steered
>>
>> How should "selects *what* kernel work is steered" be interpreted? Do these
>> modes not all apply to *all* kernel work?
> 
> How about?
> 
> A new sysfs file, info/kernel_mode, holds a single global policy for
> kernel contexts and the rdtgroup associated with the policy.

What does "kernel contexts" mean here? 
Also, since rdtgroup refers more to "struct rdtgroup" that is internal to resctrl
I would suggest "resource group" be used instead. 
Consider, for example (this is just something to get started, please do not just
copy&paste):

   A new resctrl file, info/kernel_mode, holds the global policy for
   resource allocation and monitoring of kernel work and the resource group
   (when applicable) associated with the policy.


>>> to.  Reads describe the supported modes and the currently-active
>>> binding; writes change the policy or rebind to a different group.
>>> Look at the thread below for design discussion.
>>> https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/
>>>
>>
>> ...
>>
>>> Examples
>>> ========
>>>
>>> (See Documentation/filesystems/resctrl.rst, "kernel_mode" and
>>> "kmode_cpus" sections, for the full UAPI.)
>>>
>>>    # Mount resctrl
>>>    # mount -t resctrl resctrl /sys/fs/resctrl
>>>    # cd /sys/fs/resctrl
>>>
>>>    # Read the supported modes.  The active mode is bracketed and reports
>>>    # the bound "<ctrl>/<mon>/" group; other supported modes report
>>>    # ":group=none" because nothing is bound to them.
>>>    # cat info/kernel_mode
>>>    [inherit_ctrl_and_mon:group=//]
>>
>> This is unexpected since associating a group to this mode implies that this
>> group is used to manage allocations and monitoring of kernel work but this
>> is not true, right? From what I understand there should be no group associated with
>> this default "inherit_ctrl_and_mon" mode.
> 
> The default mode is "inherit_ctrl_and_mon", where both user mode and kernel mode share the same CLOSID and RMID. This is current mode (without this series).
> 
> I thought we are going to set the default mode with the default group when system boots up. No?

As I have it, the end of our discussion on this topic is at:
https://lore.kernel.org/lkml/6709398b-269d-47b5-9b41-084f410bb1a6@amd.com/

Based on that discussion there is no resource group associated with the default
inherit_ctrl_and_mon.
I find the above output confusing to user space since adding the default group as the only
group to this mode implies that kernel work inherits resource allocation and monitoring
from the default group but that is not correct.

Your answer seems to refer to other discussions about what group should be used for
a mode when switching to a new mode and user space has not set the resource group. If not,
could you please point me to which discussion you are referring to?

> 
> 
>>
>>>    global_assign_ctrl_inherit_mon_per_cpu:group=none
>>>    global_assign_ctrl_assign_mon_per_cpu:group=none
>>
>> nit: "none" does not reflect state as clearly as "unset"/"uninitialized"/"NA"
> 
> Lets go with "uninitialized".

ok

...
>>>    # echo 0-3 > ctrl1/kmode_cpus_list
>>>    # cat ctrl1/kmode_cpus
>>>    f
>>>    # cat ctrl1/kmode_cpus_list
>>>    0-3
>>>
>>>    # Empty masks are rejected; use info/kernel_mode to reset to
>>>    # "every online CPU".
>>>    # echo "" > ctrl1/kmode_cpus_list
>>>    bash: echo: write error: Invalid argument
>>>    # cat info/last_cmd_status
>>>    Empty mask not allowed; use info/kernel_mode to unbind
>>
>> Why are empty masks rejected/not allowed?
> 
> No specific reason.
> 
> When the mode is switched, we discussed earlier to globally apply the mode to all the online CPUs.

Right. I did not see this being done in this implementation though. As I mentioned in
my response to patch #8 it appears that it uses old data from the resource
group's kmode_cpu_mask. I do think that applying it to all the online CPUs
matches the intention and would make the code much simpler.

> 
> At this point reading "kmode_cpus_list" will still report empty.

I do not think resctrl should do this. This is not accurate and conflicts with the
existing cpus resctrl files. It should be simple to just present the actual and
accurate data to user space, especially after incorporating Qinyun Tan's contributions.

> 
> Users can change it to selectively apply the mode by writing to "kmode_cpus_list".
> 
> I was not sure what was the action when empty masks are written.
> 
> Should the empty mask apply the mode to all the online CPUs?

Users are used to being able to use an empty write to remove all CPUs from a
resource group. It thus seems intuitive that an empty write to the kmode_cpus file
behave similarly. Sounds like this could mean that if user space sets the
kmode to global_assign_ctrl_inherit_mon_per_cpu or global_assign_ctrl_assign_mon_per_cpu
and then writes an empty mask to kmode_cpus then it would essentially be setting
inherit_ctrl_and_mon mode? This still seems ok since if disabling one of the "global"
modes on a CPU results in that CPU inheriting from PQR_ASSOC then it seems
reasonable to extend to when that mode is disabled for all CPUs.

>>>    # Disable kernel-mode steering (back to inherit, default group).
>>
>> This sounds like kernel work is steered to default group which I
>> do not think is accurate for the "inherit_ctrl_and_mon" mode.
> 
> How about ?
> 
> Drop the kernel-mode binding and restore inherit_ctrl_and_mon on the default group.

No. There is no "inherit_ctrl_and_mon on the default group". There is nothing special
about the default group when it comes to inherit_ctrl_and_mon mode ... or am I missing
something?
This could be something like: "Activate inherit_ctrl_and_mon mode to let
kernel work inherit the resource allocation and monitoring from the user space task."
(and drop the default group from the output associated with inherit_ctrl_and_mon)

Reinette


