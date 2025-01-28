Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C81A840A;
	Tue, 28 Jan 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073241; cv=fail; b=dJmSGFNk0obUV9RxpLIv3S2CxYVysjuho9W/CaAEjMfbiqbEiHJZX0z06AdcC/tiAXPkOUHKZZF0e7gRq6gn74yjI7RiR9zjveZjuj1DfYJE93LQ1ScoghwL2RwyJumCpLgZjEWL1S/YTU08dUE9BU0zJZZ31nAmMB6UaYKm9VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073241; c=relaxed/simple;
	bh=L4AUJcjXfHPVYRzrKVEft0yJFZR2mDh8qzE2+4aH6B8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nJmPiKgF/Mp1VcWk1GrMEayo/VPcg517rtXESMBLovro3rzu9EVrwAUyX+28Txr3kjQF1j5ih7tqIXLvuSltwSmeZpS+4m5GhGAjiUmrzgTsRGZvMFYr4WWxS5Z5GbGXBKj0gAr2se4xOy+PiFTUSeOEkeZiu+L8hSWHvyx/yDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9AjhA8w; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9AjhA8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738073240; x=1769609240;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L4AUJcjXfHPVYRzrKVEft0yJFZR2mDh8qzE2+4aH6B8=;
  b=M9AjhA8wj3SAEIpNyKxxkQ2RkkyW1HK45KJImvZM+ciRLTHE5SlsjohO
   855hf0D7Cp577Z34JkO01MQHWeKVgvCAuYZskUsYnw8YzODALt9irsJvk
   Lg/YYzXwj6lwMHbuuVLzbdg6nGcJ7KnnF697addVTbgozEUqJcRKovohR
   PcmcKSTluJKbEINYg0xG5k/vdYrH9Hm64zKnztXUXVmtErS4uNVKdlcxo
   0U9KT2LbINuGAWFNnA7W5eB/8RIRxnBfhrVdSSkOtzGAULm08QuXPgOQt
   /DkCs+DjBNtYMSxrjeNpOIOsEJ4nVHMTHRf49IGM5dezQHV1QowijEbM3
   Q==;
X-CSE-ConnectionGUID: cQ2sVOY6RbeIJziEgE7eIQ==
X-CSE-MsgGUID: 8RtQEAM1T7O42An+Wnoghg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37806683"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="37806683"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 06:07:18 -0800
X-CSE-ConnectionGUID: BBOxNIZcRm2TXVvP9Pjf7A==
X-CSE-MsgGUID: UGdgLPrQSpSa+G6RBHWWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="113749752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jan 2025 06:07:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 06:07:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 06:07:16 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 06:07:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bisYPo5MfEv4M5IcZUwre/7Gv5FPvLFxU/+y375c/4wLXB9+S6pIK2mSiVYXSD9a0L/6tJiqDvGvt8RWXtHrAhjt7R9sCtZyu+HGKSW/T1WKBy0k3oxgY5uxGDlaSoCdKtoLWBoOaMDbNVcsE55edsiu4pP6UEUcz4vHrimBolDEUGySZ71vZl7w1iUBG4u30y0CZQGg6hZmcf1J1sAHcsMrOOR5iQ0IRkXo8iykzRgorLnF5JgyW/utD0vkcxDmeTdjqcwMq4Ea8bKI6UTcJSclalhzckS4X/sGRcuifT0HWZtMSDNL5P4GZOcH0hpb6pTmPO02p0tN4DHQp3c8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4AUJcjXfHPVYRzrKVEft0yJFZR2mDh8qzE2+4aH6B8=;
 b=zGrZQ5aEWlkeTmn6aZMI4SgLuPV0F4mTcx7gixRnaQ2mTKL15ueFCzEFrVkY3oJi0ULaycsHszX2C4aNY6uMqnj8IrheCE19Rh4mSdWmtDWkJz0HAD9iN++pwZMeGKieFyTFoRpfg9osYfLPQ9v7aUrXLLCvWXKD9nVngLpYdW2G0jF/boqU/EWmTzA3P3DGMlCA8mpdctqvLvFpzKWZ5bf4N87Djr+ZYJrS6GGOFZGxf0zsPZjEWyxS3x5NidsmA3GcjtyPjiALLTzqFrq/GERq15G7ZD6n7e0CD+Tibv4AUHbpiL+vBu6x7YwGPbfGjeFfttyZZ9odXIVuTXeALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Tue, 28 Jan
 2025 14:06:58 +0000
Received: from PH7PR11MB5862.namprd11.prod.outlook.com
 ([fe80::7d59:aa70:2555:e6fd]) by PH7PR11MB5862.namprd11.prod.outlook.com
 ([fe80::7d59:aa70:2555:e6fd%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 14:06:58 +0000
From: "Mohan, Subramanian" <subramanian.mohan@intel.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "giometti@enneenne.com" <giometti@enneenne.com>, "N, Pandith"
	<pandith.n@intel.com>, "T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>,
	"Zage, David" <david.zage@intel.com>, "Chinnadurai, Srinivasan"
	<srinivasan.chinnadurai@intel.com>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>, "bagasdotme@gmail.com" <bagasdotme@gmail.com>
Subject: RE: [PATCH 1/1] pps: retrieve generator specific data from framework
Thread-Topic: [PATCH 1/1] pps: retrieve generator specific data from framework
Thread-Index: AQHbcY1WY16o5Ofd5UGScRnU0tcCq7MsOCCA
Date: Tue, 28 Jan 2025 14:06:58 +0000
Message-ID: <PH7PR11MB58628475CF6DB11BE731CC1CF7EF2@PH7PR11MB5862.namprd11.prod.outlook.com>
References: <20250128140241.46489-1-subramanian.mohan@intel.com>
In-Reply-To: <20250128140241.46489-1-subramanian.mohan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5862:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: d3298a4f-98b4-4359-44fd-08dd3fa50778
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cEowT05YTUFZN1QwT09hOWY1c2F3S1dDdm5xdmRFNHg5Uk5laEJIYStLWUMw?=
 =?utf-8?B?WWN5L1pNUVBTOFlzWnBvQmhWUDBZVUZ0dEYwbWRldmZoOU1UdzVndDdQYjVU?=
 =?utf-8?B?clJrUktpSmVZNU9sdWxQcW56Q3ZZTEFkNUphQWNnQ3dCclVuUUhaVFl5SkVh?=
 =?utf-8?B?QWdSVW1MS2cxbHdBVFI4enlvTlFSVHpoZEFDbWxaRGNDY1JONWhPZmliMHo1?=
 =?utf-8?B?K3lleXNxNXRibXVoNkxMb1dNZUxyS3psckIzRXBhSHk4VUdja1JlVjErcEwv?=
 =?utf-8?B?MXhhdWNjT0d3MmwvaUs0VCtPVzd5SmJaNWRNQ294RE1YSjdHVnlWWW43eWdX?=
 =?utf-8?B?UUJIUFZKbXMxa0NqTEZuRlVLRlF1cUkyZjEraEJCQmdUYzhWazNES0MvNDNH?=
 =?utf-8?B?ekRoN0FLSTliRU8vMUtkN3UrZkJiMk9JMkphZ043ckU4Umh2dzF2TnVJd2ov?=
 =?utf-8?B?S3p1VFQ0dXBBYUJVK2JwY2ZLdUFXTlljY0djZUFnWnVoLzgyWjI2SUIxM2Y3?=
 =?utf-8?B?RGRrUzUvdzBabHp0bHYrczIzN3hyOWVjQmNvZWJVTDV4ajExQVBXcHlvRW12?=
 =?utf-8?B?WEdBUFlGSE5KcHB4dy9nQytxU3V3TjltTFR5NVRHM0gzdGR4UVhJSDhadUdJ?=
 =?utf-8?B?OGJNR1lhR1h3SVYyUHdqUlZ1Tk4wT1VFaStjUUlqVnk5SXNieU1WQnd5aGl3?=
 =?utf-8?B?VUFJbUdwYkV6MVBwS3V1TDhpZExzNXkxRFJZSUhsYzJXTW9FYmRMNDQzOTV3?=
 =?utf-8?B?UEhQbXlHcXJZY0xBOXlDVFpsRjVPSUVkV2V2NFBTUEZYSjg2SE1uaER3T2w5?=
 =?utf-8?B?T2E5V25ucVlYUHE2SHpMZkpyVU05akNXODlQR3hkUWRyNkRDT3I2RUNsOE5t?=
 =?utf-8?B?WVZzYzBVTWY1cE9RamoxaTNTY1VFcXZwajN2UmZ0dGdJUjZVNlpkWVR2M2p6?=
 =?utf-8?B?VHBhVTZiZ3VRbkcyUU1QL0dBZm5UUGd3NTdrUFZHVlgwenVnYjhZaEJZUnd4?=
 =?utf-8?B?WDJyTmJBUUg2RUErTWRMN2taUEhWNHBGa1NheVRqYWJqUTMyNHpnUER2RStR?=
 =?utf-8?B?MkJMeDhQbG1PeGhrRWJQMUZsYlRQaXdzQ295MC9ZRkFOdndzTm9lSzVsazZm?=
 =?utf-8?B?cHY5NWtDQ3F5aG4vNnowYVFoYUprd0w2Uk5HSitGdmNUMDVQQm1XTWd4Tkxz?=
 =?utf-8?B?cFcvZi9yVFVMeVFidW1kd0Z4NUtmalpoZ1RZOW96VXhvMi9iajN6NWQ3d3di?=
 =?utf-8?B?Z0M2Q1dPLytieHVGb3pYOVp6SXlXdFJqUmlZTlhSYnB0dDRnWk5ybVMzdjNk?=
 =?utf-8?B?c2p1SWl1QUk5SUpFUXRhdG16K3ZPdWpPZ05KQUxxU1R5aUlJdnZUcWNHRmlQ?=
 =?utf-8?B?N0FWK3JoOGNHckZPamRIK3FPeUgrMUI4RUV0dWZ0RXhXQkllR0VCLzYxODMw?=
 =?utf-8?B?S0tKcExWQ05vWlFmK3NUdEEyRS9FemFYSkYzSWUrTkRWc2hhSGxBMm44eDFs?=
 =?utf-8?B?UUljTlg0SlhTYU5nNm5adU1GZkxnNzl4RDdoaXRvelZQaXprV1hacnRwSms2?=
 =?utf-8?B?NTJZc0tFTjVwNXAyMWY0Y2huUjROL29YVHRad0kvT1lZMXg1UzhQNjRtUmJY?=
 =?utf-8?B?OEozVHE4YkY0NUNvakNoRXZRRWFCOUlSaWt5YU5uQUhYWE1leGZjbis1NVA2?=
 =?utf-8?B?MXd4a1JZV0NHZCtBSERXaW9KSnBGOTlyejVXekx6Wlh1clRSbkMxdHBWQVNP?=
 =?utf-8?B?Qy9jZHZXSFFJcllmNnhTTlllQ2lqUE02cUZBUHIwNjUzOWZCQ2FldjFUWk9V?=
 =?utf-8?B?dTJMSWZabGpMNHg3RmJlVXZVbnZLUFZxT2l2N0dGNk44WVNlSkpzV1E4dzVD?=
 =?utf-8?B?a1NRd1lHY3lMWEwxaExmeGMwTVFPWkxLZ0FhTTBxVjRSUEtSQXdFbk4wMEdF?=
 =?utf-8?Q?0aAVukZVWFZQM900yF2QHRejCBf3R5JT?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5862.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkVmN3BxMmZ4WG5ZdnJrdGNHdnQ3ZzB2eWtVTVNUeUxFUkFQZUQ0NEdianBW?=
 =?utf-8?B?SUNhSWpTaGd5TUduNXJ0VlZCTm1XT2tFZjhTQ0R5R1VDdTJPOUVWZzFrb0JS?=
 =?utf-8?B?QisrenpLUFp6RC8xSHg2K0FXZHN5Tk9lU3EzcFh3ZTVIeTg5OW02YnRNb3I5?=
 =?utf-8?B?OEFIK1p0TE9JMlRJb0djSXdhbjNTMzdaY2JsNVJWZkZhLzBMaXF4UUZscTk1?=
 =?utf-8?B?c1BjNmZLbU9icHZ5K2E1ZW8wTzc3M2xwVi9DcFdYRWZ2RHpaRTh5R3UyTk13?=
 =?utf-8?B?bFh6SGk2QmRwbFpkMi9qdTZIR3lhVFRPV3Q1V0NRb3M1R28wV1U2SWZyYmln?=
 =?utf-8?B?YVdiamNjcDR4TndQSUk0eU9RbFRiUHJ4OU1VZ2h0ejVSTS92OHUrb2RqM1k3?=
 =?utf-8?B?MTB2cHFhYU5TVmN3cWlPWnpkNk9jYTRuUEhPVno3YW14ZGYvd2MrNUZEUlAv?=
 =?utf-8?B?UHAwV0JFaW11SGRmd3dqY3VWS3BIS3FQUmZHQzVoUkcyMFpOOVdBZFd3WE1C?=
 =?utf-8?B?VWI1MVJ6RGtkeUFlbThOSExkVHUxWEJwdHc1RVVQZlkraXVoTWR5UVBXKzJB?=
 =?utf-8?B?aGxkZWRkcHNhWXBqdGUvaDNmckRwSjlRZVV1OXhHeE1TWVZSOXBCS29PTVpo?=
 =?utf-8?B?cGdwWTNuZjJ1RVlLSDhRbEtKeDl3K0FPbGNhbVB3WldiWnhjTThmZDczMXRj?=
 =?utf-8?B?NXR3QXBrTUdtOWYwZWg2K0V3TUVlL0N3RFBRSGlVRy96cUpheG1wSUc0OFlP?=
 =?utf-8?B?RkJhZlRzZFJ4TzZ4VXRRdXQvcTZybmJrN0IxU3hVQitkNFF1ODA4NmZGZnBN?=
 =?utf-8?B?M2M0QWVqTjNsNDkyRG05bXV0eHM2KzNsWlR1WlRzRHc1aG9oQ0VyY0MzdFN5?=
 =?utf-8?B?VmFCeEs4Y2poNWcwQUNBcDVwY2dNNUEvWHBpR2xvTS90SzMrMmZnTHlFRlpk?=
 =?utf-8?B?QTBMUGh2R3Y4Z0pRVjhSTm55KzM2L0tEY0F3bXZZcmV5SDBucGFEZVg1MUFO?=
 =?utf-8?B?NkhHdzZWbUlSOEtROEVxOWthRmhDZTRWY05Kd1k3ci8yRVAyb1M0eU5qL2NO?=
 =?utf-8?B?Q0dtQnZQTjQrNmg4RHJveHJyTmtSZE1OVUpzdGhVa3pDWlUvemdrVGJJKytt?=
 =?utf-8?B?enNESlFvblNDQVB2QWhYc2VOcld3bmsrSGtRNEhhby9YOFFGZ0RNcDM0N2ZL?=
 =?utf-8?B?dk1tbFFuSi8vL3Yvak1IV2E2cDU5WlMvK1NRRVVyNCtodmFkVW5YbjhDc01V?=
 =?utf-8?B?UHV0N1h1dWQ2dW84eDMyazhkM2ZmN1FaK0JrcTZmUEVGZ1BZZzU2UVNHOHZE?=
 =?utf-8?B?L3VqQ3IzTVBmYnRhWTJyUEk1NS9YT2NlYU11M1NhQ1d2aUR2aGN0TUFpaXRh?=
 =?utf-8?B?d1JPRDJlNDlUL0pSV0k0YXhIbVg3Tm9qdWdMUjQrWjB4RlhROFNRWTdrNGNN?=
 =?utf-8?B?Q3JNOVNzZ1pISE03WjBoOWhNaHEvcjlxazRJNmR6ZG1LTEZtMkNxNlp1ZzFy?=
 =?utf-8?B?MnVqTTBpSlgyUW9WMVVmZDNZVEJYbWV4WFU0ZkgrM3pDbE9URXR3OWFCU3ph?=
 =?utf-8?B?emhWd1paWHZCMEgrZ3pJZTRDWnZqazF5cS9mbm5KK2NsbDRjdTAvMnQ4YWhq?=
 =?utf-8?B?L29hWi9VQTBFVWZhd2VYL2M3ZVdxaWE0NkpvZC94OGFMZVEzUUZPUFJtZ1oz?=
 =?utf-8?B?K0VpZ285QkY4b05XYmYyV0JmSWJPQVhncXp1bEhyTld4Njk4WEI3NDlJOXdQ?=
 =?utf-8?B?WHo1MzQ1Ym1kSmtrQWJzOTIrQ3Z1akM0clJKVTUxVGFlYjU0NlhHaHhkeWNP?=
 =?utf-8?B?MWJtdkwwN2pPN253SHkxd1NML3NxU3FqVU1tVnlnTElpNXIrQ3VtZHdFTDg1?=
 =?utf-8?B?QkxpczI4WUM3em1HbU4rZzNZeFRQZVNYeURHSlVxbUVZRlEvTUZ2eVFLcjNm?=
 =?utf-8?B?c3R4Z0lCbjd5U0pKdEFCWURKcnBIZnhoQTN1SjhYWW9EZndjdUw2Tkk2dng2?=
 =?utf-8?B?dWo1cW03QTBKOXJwaklLSGJXQndDRjN5bkFMSUhleTU4bURDS2d6dVZoV1ZE?=
 =?utf-8?B?MEhLS1A3YVY3cTJoTy9Fd1ZKSEF3d1lKZlY4bHU2R1lmTDA2Q3NIaTkyZGRk?=
 =?utf-8?Q?uZ5jXACdiwSmIM1LzGrdlkbJu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3298a4f-98b4-4359-44fd-08dd3fa50778
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 14:06:58.3536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +liXtl/i9x8OhqG537jEa1vszL3yZrKrBys4fmfuoU7maGBk028j5mhSlzO1pd1p5aZoSpK9ihPJ7RUKdAMmsWjaHxp0C7aGfP2kU6MrXus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-OriginatorOrg: intel.com

SGkgQWxsLCANCg0KU29ycnkgZm9yIGluY29udmVuaWVuY2UuDQpLaW5kbHkgaWdub3JlIHRoZSBW
MSBzZXJpZXMuIA0KVjIgcGF0Y2ggd2lsbCBiZSBzZW50IG91dCBhY2NvcmRpbmdseS4NCg0KVGhh
bmtzLA0KU3ViYnUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNb2hh
biwgU3VicmFtYW5pYW4gPHN1YnJhbWFuaWFuLm1vaGFuQGludGVsLmNvbT4NCj4gU2VudDogVHVl
c2RheSwgSmFudWFyeSAyOCwgMjAyNSA3OjMzIFBNDQo+IFRvOiBsaW51eC1kb2NAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENjOiBnaW9tZXR0aUBlbm5l
ZW5uZS5jb207IE4sIFBhbmRpdGggPHBhbmRpdGgubkBpbnRlbC5jb20+OyBUIFIsIFRoZWplc2gN
Cj4gUmVkZHkgPHRoZWplc2gucmVkZHkudC5yQGludGVsLmNvbT47IFphZ2UsIERhdmlkIDxkYXZp
ZC56YWdlQGludGVsLmNvbT47DQo+IENoaW5uYWR1cmFpLCBTcmluaXZhc2FuIDxzcmluaXZhc2Fu
LmNoaW5uYWR1cmFpQGludGVsLmNvbT47DQo+IHJkdW5sYXBAaW5mcmFkZWFkLm9yZzsgYmFnYXNk
b3RtZUBnbWFpbC5jb207IE1vaGFuLCBTdWJyYW1hbmlhbg0KPiA8c3VicmFtYW5pYW4ubW9oYW5A
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMS8xXSBwcHM6IHJldHJpZXZlIGdlbmVyYXRv
ciBzcGVjaWZpYyBkYXRhIGZyb20gZnJhbWV3b3JrDQo+IA0KPiBGcm9tOiBTdWJyYW1hbmlhbiBN
b2hhbiA8c3VicmFtYW5pYW4ubW9oYW5AaW50ZWwuY29tPg0KPiANCj4gV2hpbGUgYWRhcHRpbmcg
cHBzIGdlbmVyYXRvciBkcml2ZXIodGlvIGdlbmVyYXRvciBhcyBhbiBleGFtcGxlKXRvIHRoZSBu
ZXcNCj4gZ2VuZXJhdG9yIGZyYW1ld29yaywgQXMgcGFydCBvZiBkcml2ZXIgcmVnaXN0cmF0aW9u
IHRoZSBwcHNfZ2VuX2RldmljZQ0KPiBwb2ludGVyIGlzIHJldHVybmVkIGZyb20gZnJhbWV3b3Jr
LiBEdWUgdG8gd2hpY2ggdGhlcmUgaXMgZGlmZmljdWx0eSBpbiBnZXR0aW5nDQo+IGdlbmVyYXRv
ciBkcml2ZXIgZGF0YSBiYWNrIGluIGVuYWJsZSBmdW5jdGlvbi4gd2Ugd29u4oCZdCBiZSBhYmxl
IHRvIHVzZQ0KPiBjb250YWluZXJfb2YgbWFjcm8gYXMgaXQgcmVzdWx0cyBpbiBzdGF0aWMgYXNz
ZXJ0LiB3ZSBtaWdodCBlbmQgdXAgaW4gdXNpbmcgc3RhdGljDQo+IHBvaW50ZXIuIFRvIGF2b2lk
IHRoZSBzYW1lIGFuZCBnZXQgYmFjayB0aGUgZ2VuZXJhdG9yIGRyaXZlciBkYXRhIGJhY2sgd2Ug
YXJlDQo+IHByb3Bvc2luZyBnZW5lcmljIGFwcHJvYWNoIHRvIGFkZCBkcnZfcHJ2X2RhdGEgcG9p
bnRlciBpbnNpZGUgdGhlIHN0cnVjdA0KPiBwcHNfZ2VuX3NvdXJjZV9pbmZvLg0KPiANCj4gRXhh
bXBsZSBUSU8gc3RydWN0dXJlIHdyYXBwZWQgd2l0aCBwcHNfZ2VuX2RldmljZSBhbmQgdXNhZ2Uu
DQo+IA0KPiBzdHJ1Y3QgcHBzX3RpbyB7DQo+IAkvKiBGcmFtZXdvcmsgUmVsYXRlZCAqIC8NCj4g
CXN0cnVjdCBwcHNfZ2VuX3NvdXJjZV9pbmZvIHBwc190aW9fc291cmNlX2luZm8NCj4gCXN0cnVj
dCBwcHNfZ2VuX2RldmljZSAqcHBzX2dlbjsNCj4gDQo+IAkvKiBUSU8gU3BlY2lmaWMgRGF0YSAq
Lw0KPiB9Ow0KPiANCj4gc3RhdGljIGludCBwcHNfdGlvX2VuYWJsZShzdHJ1Y3QgcHBzX2dlbl9k
ZXZpY2UgKnBwc19nZW4sIGJvb2wgZW5hYmxlKSB7DQo+IA0KPiAgICAgLyogR2V0dGluZyBUSU8g
ZGF0YSBiYWNrICovDQo+ICAgICAvKiBOb3RlOiBkcnZfcHJ2X2RhdGEgd2lsbCBiZSBpbml0aWFs
aXplZCBpbiBvdXIgaW5pdCByb3V0aW5lICovDQo+ICAgICBzdHJ1Y3QgcHBzX3RpbyAqdGlvID0g
cHBzX2dlbi0+aW5mby5kcnZfcHJ2X2RhdGE7DQo+IA0KPiAgICAgLyogQWNjZXNzIHRpbyBtZW1i
ZXJzIGhlcmUgdG8gc2V0IHNvbWUgb2YgdGhlIHBhcmFtZXRlcnMgKi8NCj4gDQo+ICAgICByZXR1
cm4gMDsNCj4gfQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3VicmFtYW5pYW4gTW9oYW4gPHN1YnJh
bWFuaWFuLm1vaGFuQGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL2xpbnV4L3Bwc19nZW5f
a2VybmVsLmggfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcHBzX2dlbl9rZXJuZWwuaCBiL2luY2x1ZGUvbGlu
dXgvcHBzX2dlbl9rZXJuZWwuaA0KPiBpbmRleCAwMjJlYTBhYzQ0NDAuLjg0ODRiYjI4MjhlZiAx
MDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9wcHNfZ2VuX2tlcm5lbC5oDQo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvcHBzX2dlbl9rZXJuZWwuaA0KPiBAQCAtMzUsNiArMzUsNyBAQCBzdHJ1Y3Qg
cHBzX2dlbl9zb3VyY2VfaW5mbyB7DQo+ICAJaW50ICgqZ2V0X3RpbWUpKHN0cnVjdCBwcHNfZ2Vu
X2RldmljZSAqcHBzX2dlbiwNCj4gIAkJCQkJc3RydWN0IHRpbWVzcGVjNjQgKnRpbWUpOw0KPiAg
CWludCAoKmVuYWJsZSkoc3RydWN0IHBwc19nZW5fZGV2aWNlICpwcHNfZ2VuLCBib29sIGVuYWJs
ZSk7DQo+ICsJdm9pZCAqZHJ2X3Bydl9kYXRhOw0KPiANCj4gIC8qIHByaXZhdGU6IGludGVybmFs
IHVzZSBvbmx5ICovDQo+ICAJc3RydWN0IG1vZHVsZSAqb3duZXI7DQo+IC0tDQo+IDIuMzUuMw0K
DQo=
