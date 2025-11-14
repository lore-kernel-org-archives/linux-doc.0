Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06365305E33;
	Fri, 14 Nov 2025 22:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763158681; cv=fail; b=TBdgS3ZaYcSH7OHpGAOcbMtNoRh+dE6f+e+81beUj/t38bkTs5kscOMSWKjuK9kb3nUzww7TTYxVnifD2ZZn6tL96yPS8MSKZnzHQlKiZ0oIpvIAqv0EvY4r4JjdlcsvIIaeNTmM1VouVKt8TPsA2tA5pWwzbmv+ywkjnHSqcIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763158681; c=relaxed/simple;
	bh=FS3cJkmxrcmKipYMJiYqdcw/9Nea2XbNImVl4dBmBCo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cRLjUFNw0dQMnZ0nigpJNQEXYhaWPKtCfngboUehI6ZQ+lEfAmEK4gSEuvAZA4ysViy6OLEKr9DR02rVKin2AZoRRpmGpOWhDV9q+tuUTOc5qLPQm+w6sq1pYBlCoO+ojwAG9qJfwozHMSm729q2eBa4648VtNCohkRVcVKs1tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gduz+6WP; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gduz+6WP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763158680; x=1794694680;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FS3cJkmxrcmKipYMJiYqdcw/9Nea2XbNImVl4dBmBCo=;
  b=gduz+6WPJPo1z19sp+0Wo/njEsYWUrEqgD7Q00kRaez9Lv69Ks8c/Z8b
   /GotPgjTK8YxkDQj/DJp2evDIpYfHLJ+z1PHH2znAENucfefY6NMLUYD9
   Fu5SBc7zuqVfXJGGE4YWKiK0K0nDW4Qz3/TlfUxS1Ubi28vkWr0yUGGYD
   QTHp1HUmCUVwM3t+ARY42+HhQCmJV8KZWN6aV8WaFnGsquUYBiaFFIFRo
   AZ++CXwy0aPoDcBORghuZnURKySDx6loL1jN1D5kZKeX6BEQYo724hwYy
   PvYxPT4HB/QfdbnDDPtJkYcYeTPU2xHLb3d9DTlNijlRipsKazRmwqEBF
   g==;
X-CSE-ConnectionGUID: WYkQm7vITbWSukq9ClHxUg==
X-CSE-MsgGUID: 71WX9rIiT2WeeAuFkoD2ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76723598"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="76723598"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 14:17:59 -0800
X-CSE-ConnectionGUID: U1zbQ1KrR2OOY1ii0/+i0w==
X-CSE-MsgGUID: brw/yzpwQMqaIjYjl7bmeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189700465"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 14:17:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 14:17:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 14:17:58 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 14:17:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN0EYqm5mAVa1fIW4RcubNnFumYSYvv1V5+ZB8L0ObBXkslnmKbcQqitXmLxIJvHvwOBtwur0iXvjvgxA3Q6M4N3HdwKsYLgtcGFQ2XyzYVAiSLl1NIHvY4ryOM61Ytkmjc11hgRg2N5/orQY/YHmW4SUx3IqKhcRV3c7a5rfTr5QICFTn2V7J5S0D8tzo1L/IN/WHUif8SecvMFpX0MdX4yyc0DpsldZVn5RkKCwdPBEd0QvpfS275iXqnhNroGwxAi5I/Gi7VAheN9v69tgwcYpiZwTbVMU9oymuUeS/LtYc5nXRNJQ99zbSuSwhL/kkV5ohU+v2WBeAbnxII08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL4v9BoP8X5OFZDqOYyyxcinl7DiwloENrODJ/xgNzo=;
 b=fVmlyg2SArNha/vHRSHPWYiapU8PHUuJU0z1QPggj26kvUey1UbuvYeRuF7gSyGE2xqxTApUfwGGvgn9tvHteK/T6Paz/OxgjlH68IWCzuqesYUDx8NI+BqXKsvNFvp2HXS/2p9zC6BuJ4PoSJEYF8kq+URfoJK39NN0gyroA1yF6hXPnia9ljVHKgIwWAauf9+PZOHk9f6VBHtgWZEBI1kc4xv72TSEWWRgB+PG5KA8xSIni2TT+MjOHYRIMJ2KkTUYPgk1f5U7mk5FbOyzGISCBySERC6W+i//Tq3wx9CsIzbgUQkvRPs6l4R6Jkvgo/VNB/uqf20+VW2xzZ942w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 22:17:55 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 22:17:55 +0000
Message-ID: <136d9c83-e816-4188-ae0d-322478a57a68@intel.com>
Date: Fri, 14 Nov 2025 14:17:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86,fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Dave Martin <Dave.Martin@arm.com>, <linux-kernel@vger.kernel.org>
CC: Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, "Ben
 Horgan" <ben.horgan@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Jonathan
 Corbet" <corbet@lwn.net>, <x86@kernel.org>, <linux-doc@vger.kernel.org>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20251031154225.14799-1-Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:303:b6::18) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW5PR11MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: b40fc27e-42a6-4369-88e2-08de23cba909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmFZY044T1h3NXlhcXpuSCtzRnZmMHhwTHpXUkx2dTJTdHlHamtSTlNteVpP?=
 =?utf-8?B?TDVZWUJHRmRnVXBVKzJYdEJnNEhQSndpUHpoMkYvUVNlR2t4TTNWaWdjMU41?=
 =?utf-8?B?N0FTQ1dyaHZIN1g3S05HQitTbkJudnF4ZlQwMUNWNGZRWVlYTFdZN1RPZWdE?=
 =?utf-8?B?SzBSdFpmV0RLRXd0TEY2bzJ5NUNsRC8rWSt1RExhMXJRMkpyS1NoaHlOUGNm?=
 =?utf-8?B?cjJKTURrS25qUDhTVG5vNHFUcmNBc2hVVXVwcllKWGpLdytXN2Q3WStPcjJB?=
 =?utf-8?B?TlRVb0ticmpKVVA1cHllelNqKzlXRGEyS01XR01iamMzWHF4ZkJxWWRONW9x?=
 =?utf-8?B?a1UxakZSVDJ1RE9MTnYxSG9xYVZyNVAzZnNJRnd1SDJhamZBaUtDN2g4czJE?=
 =?utf-8?B?Vm1qWmFzNWY4T0dSZmtMdWJNT3ZQbk1veGdKaG1LOVppK3lqMDV3QkMvZGNv?=
 =?utf-8?B?OFREODZmOU9yT3I2U2kxOUk4emlwMjI1Z04zTktpc2JseHFVdGRCNElzOFFn?=
 =?utf-8?B?elNoUjg4M1dGTmlyMnNjRGt4M2p0VGQzelBxa0Q5dzcvcVBlOWQ0VTNURGxi?=
 =?utf-8?B?SnZScjdNVXg0c1VMdFlPbHIvQzlIWitWMGRLbXVlbS8rMm5UL1BDOFdKMXRz?=
 =?utf-8?B?UWJIbHlqQkd0angwTUhJMzcvOFRVYXhld3RSOWdEOXlNV0RBbXJoWUtMcWdn?=
 =?utf-8?B?ZHNkUUxlVTlUOEdFUlN6QTRKWlhFYjFWSjV3c1dsWWZXV0Z6ckdwRDRyN0V1?=
 =?utf-8?B?TjdINXZjaENQNmVsaVpUdmM1dGhFZk9sVzZUckFaRTBwbnk3N2svK2VxYzdU?=
 =?utf-8?B?bUxWMSt6dFNIWUEvMXlkL1UzeW4vb09ncnFELzBxTWtSVnUvN0FTcFhHSFVC?=
 =?utf-8?B?bE9IcXl6Y3RYQmdrSXI0TGFtVjZGQ1Boei9LbUVLNXpOa1hJV3FmYUFQeEhl?=
 =?utf-8?B?TXJNTnVocjNJTjNRYU5lR1lwdW5OYzVSTnVMeWJsaTZZamN6Zzd5aDNqSXlt?=
 =?utf-8?B?eGJLYXVhWG15cjVvSnF6S01NUnNBL1BxTWM5S09CYkpmOUlsbU80NjBjclp4?=
 =?utf-8?B?aHN4VW9pTW1tR1o4R1F5S24rQVNweHBkOGllakhxSkNoTnA4bmNwZDh1L1B5?=
 =?utf-8?B?YmFBc1UzODFTVk85bGk0MFZJei9mS0VxRDEzRUo2YjloZ1VwQktiSFpWYnFT?=
 =?utf-8?B?K28rN01pSi84Qjk2Z0FoK0lDZmY3VitYUDdUV3dwMEhGNVRFemV3RXJwWXpU?=
 =?utf-8?B?N3NFVFJ6L1YxWEtJWldScTFQYnRyWFUvNWY2RzRFOTBleVVtU2EweTRPeUpO?=
 =?utf-8?B?M0tMczU2N0h4a0tGZ1hMZ1RVVmdIUlpmUUhRMVN3M0N1dFB1RG9uTlQyMEo5?=
 =?utf-8?B?N21GNTFVWVQ4cTl6dy9Kck5wZXFmdGF3ZHRVbTVzanpGSGRFTi9tNHc5dTBo?=
 =?utf-8?B?TUxETUZ5YUNhSmJ4ZWhmZXpoT0lZMjBLQWtXVndjS3JSRmsrRnVhNStmc1Jj?=
 =?utf-8?B?ZzAxK09ybytvVnduS0wxOEZ1dlBxR2w1WnZwdE0zZVN3Tkd5SWhoTGkvaFJD?=
 =?utf-8?B?Yk1KdDNpNTN2eitwUWRqMnluOG92RG91bnQyK0tpQTVtejlHdWJxKzVIVSt1?=
 =?utf-8?B?TGNuZWEvdktRSDFlSU0zRDNoM3J5NEw0RWxDNjljVGpDU1V6dE9SU2Jmd2dy?=
 =?utf-8?B?RHA5UEZBUUIyK2dGYk9HWnc1dlhWbDlOS0xPazBnZ2hXNjkrRW1VaURKNG5x?=
 =?utf-8?B?MUdmeEZNR21XYzI0MHl5VlFsM1E4eVdYcXBQbkJCbkN1ZjBrWHp6SHpNd05R?=
 =?utf-8?B?d0R4RDY5Tks4L21udDhib3kvNjJzU2RRZER5dVZzS0U1TjljVHNPUnVQMnQy?=
 =?utf-8?B?am1ldHNjT2hJV2NRQzFwVGN0Q211dzFDSW1UdWlzUE85eVU1MFFyd3V5R1F5?=
 =?utf-8?Q?COKBMaITew7SdTYuH2fursQFWLFPSp50?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHlqRmVtVHNuMjJicGpCZndHakhPMG5GbXRMRmUxWUp5RUNTN0VyNWNweTBs?=
 =?utf-8?B?MkYxbnBFYlQxYlZyUHZPNWhDTDM0VGVnSkV2TDJqTWFqTVg2aWZETEU3c2VE?=
 =?utf-8?B?dUJERUNPc1p1ZUFHMTEvKzJhTTFEOFBLTG9MdGN3TTVpN2ZRQUo0RHBxQU5J?=
 =?utf-8?B?SEI4bG41elM3ZHIrekdFeDdobGNnN1czMUVrb01SM0UwMVJ2Wmw2dWZjcjZp?=
 =?utf-8?B?SVMyZFVrWDlLNUM2VlNjMkdETUlvU0dxcVZ6QUNOYXQxZHhTN3hYQ1l3bTVO?=
 =?utf-8?B?VStRall0SlAyZXNSRGFjK2k3TUg0di9sc1JUdDI2RnZNeXZMUWRkL3pVcjVx?=
 =?utf-8?B?QlpSR0dJVFZIWWE5dnErM0V2dWp0SEc5VndFUmZzU2tjMUZDNUw0ZnU4T25B?=
 =?utf-8?B?SzJQZ3VrSGRNMmdvdkMwb21pc0NhTWZ1RXdzZlpMRjl2WC9pNHlxdnNVVTBG?=
 =?utf-8?B?MmFCa05ZQ1Y2M2FrcEN2RUhZQ3NoaS9FZGViaDNwS3FyaFp2clJuWnNTYmNR?=
 =?utf-8?B?MVFiYlBua2oyUytsOWtkVGVGNVBsTmNqa1ZuaWVpMG9CbmVSSGlkU0dZSGhP?=
 =?utf-8?B?SFIrdlhSdlJwYVNtUVV6amJDZGJXb2hHd2lydHFrMjR4SlA1ZnNJalQ0RWxv?=
 =?utf-8?B?NFM3ODZxcHl0V0tldVJERHc3OXVUYk1xRFZNaDhyMW5ualNCcVBucXJCYUpq?=
 =?utf-8?B?UDhmMldDWGpKT3JwTGZYRUhKRUh6MDdQVENWdkhYZEJ1QUxIeEJGTzlwbTFQ?=
 =?utf-8?B?MTJUbWtxMzFXbUJzZmlWNFFod3A1K3dKS1FrTGx4L2ExemFoL2NBSlBjNkQ0?=
 =?utf-8?B?SzNsdkRwWm84VEJRQWVaS1d3OEV4R0RrWmlSYzJFcDM5eGZYSTRMbU9GaWxL?=
 =?utf-8?B?VFQ2MGYwNVpuN1NqTFVIYWVnRG15VjdEMDJZQ054SjBxdjFNMm85a29mRW1H?=
 =?utf-8?B?UXJoZFhXYkhkdnorVDBzc0lqVm1YZ3UvdHAyRXYrK01pUkdlSml1UUZ1TkUz?=
 =?utf-8?B?RnJZOGVrWDIxYWtDd2o1a2c1Tm43MVVpdlZMbkhVL1hmTDIrK0lFbno3a3hn?=
 =?utf-8?B?WkRVK0Z1UEhIWFZaYWdXQUo5VSsrNk1jWXNTK0pjdHZqWTBYWDJxejRONm9E?=
 =?utf-8?B?MDJIVExINzNHclFXWUNZdTRwMmN2QVhWWWxXMVdISThNMjMxaVpHWTNVTk9o?=
 =?utf-8?B?MmRNb1YvSXcvcENwZ0FZNFZhMS9NMEVmcEhsTmtNSm9hVnNHS2R4cmpPYnhF?=
 =?utf-8?B?bjhaTy9NVy9hVWR2SmZJQTBrMWhmb3V4cXJNYmlSY2ZYLzNTRmVSQnJqanpz?=
 =?utf-8?B?djFIYUtrdW04Y1o3dWY1ampWVGZ2N2M4akZibmQ0WGxnMmt6MkhUcDkxV2g5?=
 =?utf-8?B?MlV4M0VYZnp0MGQ1U0V1UnBTMXIxQytMM0dGRDVGVDhvbWFPQWhzbEI5ZnJK?=
 =?utf-8?B?c3ZNenhYTEcvR3ZzNFErTWpiT3d4RUpuRDQ5ZXlGSkdHRXdUbmUyeGU5QXRD?=
 =?utf-8?B?ZnNzcEM5ZVhHKy8zRzJYcWR0aVZab3ZKMXQwdFM0ai9MQ3UxUnpwYVJVZ0JX?=
 =?utf-8?B?djlFVjhxYTRyWlE1Q1JPcXBtNWJzaUZZWDlvaFJmb2Z4THBQa0UrZVNhQjd3?=
 =?utf-8?B?TWxKYzVCNzdyOWpWRnpRR25LU09pSzhSSVd2azVkUHNzV2F6MnVSa2M0Y0JD?=
 =?utf-8?B?aE1xM3BuYVRwNUJRVEdEL0p6ekswTVAzdTRDdTl2UzRMMjM0dENvbENOcHBm?=
 =?utf-8?B?VTNiY3poMUFYL0N0NksrMGdZckFPVGtJYW1ZNjNYM2sySHg4YXM3ZnBZUGxm?=
 =?utf-8?B?dHFEeVF2MnpBUG5vRnd1bXZpRXdFUVJKU3luQUYyNzl4YjRhQWVKdGVRaFRN?=
 =?utf-8?B?K0hUNUd0UmtOMTVtVmNtclhOaUVmcGtuUkJzdE5wT3RKQkd2Q2h1dERTcjJT?=
 =?utf-8?B?TWtoWlB6LzdLcTZTREtnRmR5ZjlTZFhDR1lQK01iR0pwTHYveDF1bEJ2V1Zs?=
 =?utf-8?B?YzZjNG5tWUdTT1VyaU5EUnJFemRxa2lHb0RLOEJyQXg2bUYxOHRBOWVLVEFP?=
 =?utf-8?B?ZVMydjdxWEg5amNLTVF2NzI0Q2pKY05jUjd0UXBQNWRuajBNMnA5VXZaV2dj?=
 =?utf-8?B?OUJoOE5rdmxmeWd0c1dtWUpROUlBMEpYTnYwaVNBMmpCeGJ1T1A4bWxick9m?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b40fc27e-42a6-4369-88e2-08de23cba909
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 22:17:55.6223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njzS29+I2rpsGqFQ5smARikPkPC1lCYApgrxo6nRN17xtzmgersCn63UcMkIxCV7urhoG4TOJ9ZLSHOtUx5bWq3LvU3foNBbypRTAgxV5uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-OriginatorOrg: intel.com

Hi Dave,

On 10/31/25 8:41 AM, Dave Martin wrote:
> The control value parser for the MB resource currently coerces the
> memory bandwidth percentage value from userspace to be an exact
> multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
> 
> On MPAM systems, this results in somewhat worse-than-worst-case
> rounding, since the bandwidth granularity advertised to resctrl by the
> MPAM driver is in general only an approximation to the actual hardware
> granularity on these systems, and the hardware bandwidth allocation
> control value is not natively a percentage -- necessitating a further
> conversion in the resctrl_arch_update_domains() path, regardless of the
> conversion done at parse time.
> 
> Allow the arch to provide its own parse-time conversion that is
> appropriate for the hardware, and move the existing conversion to x86.
> This will avoid accumulated error from rounding the value twice on MPAM
> systems.
> 
> Clarify the documentation, but avoid overly exact promises.
> 
> Clamping to bw_min and bw_max still feels generic: leave it in the core
> code, for now.

I think they are only theoretically generic since arch sets them and resctrl
uses to enforce user input. Arch can thus theoretically set them to whatever
the u32 used to represent it allows. Of course, doing something like this makes
the interface even harder for users to use.

> 
> No functional change.
> 
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> 
> ---

...

> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b7f35b07876a..fbbcf5421346 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -144,12 +144,11 @@ with respect to allocation:
>  		user can request.
>  
>  "bandwidth_gran":
> -		The granularity in which the memory bandwidth
> -		percentage is allocated. The allocated
> -		b/w percentage is rounded off to the next
> -		control step available on the hardware. The
> -		available bandwidth control steps are:
> -		min_bandwidth + N * bandwidth_gran.
> +		The approximate granularity in which the memory bandwidth
> +		percentage is allocated. The allocated bandwidth percentage
> +		is rounded up to the next control step available on the
> +		hardware. The available hardware steps are no larger than
> +		this value.
>  
>  "delay_linear":
>  		Indicates if the delay scale is linear or
> @@ -737,8 +736,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
>  and can be looked up through "info/MB/min_bandwidth". The bandwidth
>  granularity that is allocated is also dependent on the cpu model and can
>  be looked up at "info/MB/bandwidth_gran". The available bandwidth
> -control steps are: min_bw + N * bw_gran. Intermediate values are rounded
> -to the next control step available on the hardware.
> +control steps are, approximately, min_bw + N * bw_gran.  The steps may
> +appear irregular due to rounding to an exact percentage: bw_gran is the
> +maximum interval between the percentage values corresponding to any two
> +adjacent steps in the hardware.

What can bw_gran be expected to be on Arm systems? Could existing usage be supported with
MPAM setting bw_gran to 1?

What will these control steps actually look like when the user views the schemata file
on an Arm system?

With resctrl "coercing" the user provided value before providing it to the architecture
it controls these control steps to match what the documentation states above. If resctrl
instead provides the value directly to the architecture I see nothing preventing the
architecture from ignoring resctrl's "contract" with user space documented above and
using arbitrary control steps since it also controls resctrl_arch_get_config() that is
displayed directly to user space. What guarantee is there that resctrl_arch_get_config()
will display a value that is "approximately" min_bw + N * bw_gran? This seems like opening
the door even wider for resctrl to become architecture specific ... with this change the
schemata file becomes a direct channel between user space and the arch that risks users
needing to tread carefully when switching between different architectures.

Reinette
