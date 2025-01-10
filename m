Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748D1487CD;
	Fri, 10 Jan 2025 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736542140; cv=fail; b=VdbQhWPN+0NPJo0Da4H9ZuvUuKeMPPzemtbs6KxLSXbABD6p7i0Cn92hZQNU4VrVtFpwDpf8bIUKO03xXLoKJBVjrUqYsi1KXXGRhJs3k9V/IZcIl0+WZPMBhFXVtVXqzDYTe0CQOTxrpoIqhZMPzYlEQhsP+C1+kLAa+lRV6gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736542140; c=relaxed/simple;
	bh=ZCzMUThxQzECwQjMH9MS/oXfUKMMnWEdoNA4zWWJCyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XRvo6l8QMIs86aPVWJI2/BviYO43Oe9kGce75vBeQgkVYDrYFM3BW7as/HLzOL0Qe8oAZRy9KEDUhuYlCSNRZUg2JplT6B3nr9yv6OlSFpkO5/hRCi/b2oX5VvsN23Frj3f7j5P6b0thfmwBU2dduumCaiO7eG4ul72+GJJlTPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FyIITiCj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LzYi6Cp0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FyIITiCj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LzYi6Cp0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AItnbv028479;
	Fri, 10 Jan 2025 20:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=3LQLbHSi5cAq3fVEqGe7vBvmnSmEfC0m90+2xZPFQQs=; b=
	FyIITiCjOubimDIAoc2z/YZl3gK+RXpZnsuTqYMZPE9KYP/z0T7s1Hx4OGkthRkh
	svMyFCF2VP/3/hKPIp8mBVWB+xkMKT3VvO7xjc9SIc7qmKKZ0PyF1daCFnK+DvUA
	i82F+/PuvzRRdmeV1rfCC6XjVD3DUB6yj2skQQ8SCINV60k8dxt2g6lDeb14q+S7
	iHtkvsGpbmWlhT2NvH5mkl7s4lhaz1jtNVOiXzszPXm13l2uBwdLOIMUoyRqQQ48
	VnvsW4pHHjuv3JZhgcFHAEvzPHpijfiDPpoKFRSxXc3VuCFIA6sNw0nb6z/GUhYv
	ioXktyUjESSli2Zc/xYjtw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xw1c3paw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 20:48:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AK4pIW019903;
	Fri, 10 Jan 2025 20:48:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuek9e7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 20:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMSloIRu+eOL1lY+UT90N4LjpJ8UPZtgtMzhpqBdz1DbCEaZ0YBpi+E5iRACgImKPxrr45V9+IapUmtiPwkGuTWANqrY0duLjNejTrLjf8v+/qWDfKDFM2FWyOPs9t7qWyhyUEwmaRSoEaFyB8dh8Fa6PCcDdMMnKlPiV/0uT2oybaiYLnHIPU5e9WoZWfw83JlRgTsrmSTToAklFg7HwbqaGfU2SkVtTwoXoPvgD5G/l0islL9S+5OXTwUo70ivah6Q8KpDGVHaxJ+IVwVT3LA9WtgYaB1CMOmHwxta/ume1k9npNOpFC9cknCqMeEt0U0UmQIp3biPPgzBZPUo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LQLbHSi5cAq3fVEqGe7vBvmnSmEfC0m90+2xZPFQQs=;
 b=EHUJSDTTMHQBoZGxSzs+itpP0kEccBwOafi14zFhpdAhFZq4VzqGMTVhZwKLI6+mYPpG1uCwdDiSfqM/SAcaBXinGvc9xuRgBywRLd6uGPZzXEE7gegHdc3rdpQ6dWa8m7MSQMmhO2O0of5/LfOGxOuw7aNWQRHdauEJEp1N8M9oLMBXP1kXaSSnQ1uYEwIeMvXGC3EZougUve2NepXRbJHOwCiQVf7kQwHg2S0Kcv+D2WQn4i2ohYf6yiEF076lwBiIrCnQu6RzpljP8/L4OLgC3kQURgYagYXyU5LwCyIkFEx+PLHnSihEBa32UKr/rC+5zFSeugCVWJdjspUWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LQLbHSi5cAq3fVEqGe7vBvmnSmEfC0m90+2xZPFQQs=;
 b=LzYi6Cp0QANQxZ09cWUmrXH0n7ECH+fAqNsU7+cutHZylMWfmidejm/ysMmwPvijTkLfpx9+GSFxUyH76NkCfpZAhPIltCw3AF3XzmpO7KdrFnvzSNHSd0Y65UbOn3p2CyhyFgei4Lhh8ev0Fxn8oLd1AQgCGeCESLrxmne99fo=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV8PR10MB7966.namprd10.prod.outlook.com (2603:10b6:408:202::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 20:48:05 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 20:48:05 +0000
Date: Fri, 10 Jan 2025 15:48:00 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
        mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
        oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
        brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
        hughd@google.com, lokeshgidra@google.com, minchan@google.com,
        jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
        pasha.tatashin@soleen.com, klarasmodin@gmail.com,
        richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <ro4mgzi4tpyemia6eslj646yyblzloztzcf3g4wdxgzri5hxkt@fwwkov5h23vg>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
References: <20250109023025.2242447-1-surenb@google.com>
 <20250109023025.2242447-16-surenb@google.com>
 <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
 <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com>
 <6vdkyipj4v7kmgra7huvebbkimz2t63tx6rkbjxbavaccmlbmb@udqijfgkbgfv>
 <CAJuCfpGyraPAFpxoJ-ZRsJf9pWe3jno4_VjcbxHPthwLjc9DZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpGyraPAFpxoJ-ZRsJf9pWe3jno4_VjcbxHPthwLjc9DZw@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0174.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::18) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV8PR10MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f92aa9-306f-4857-b920-08dd31b81525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDZSaGc1MjI4SXlBVVkrbTlIUDZiNkNPY0poeEVidjYxeC9mL2psbWRXQmgr?=
 =?utf-8?B?a3FVV2NKcmxjbHNxcmR1cStkcC9STTUvK216YVZoMzJiNE9hMFVrenh0UkEx?=
 =?utf-8?B?cnVGTlBuUXpYRTk0WmpjZ2hoQ1o5NWI3QWpqZnNLeHc4T1dXTHYyUTNhK2lC?=
 =?utf-8?B?aEM0NTkxbGpacUpWb25IQWhSSjNlZ2VQeENDQVJWekNHYnVsdVBQY2R0SHRh?=
 =?utf-8?B?cHhSVlRjSml0YkJ4NkcxSVBiV2V2VG9vUGg3RlVpL1MvWnVYYjlrOHoxaUFD?=
 =?utf-8?B?QUNnOEdKUm0rRlNlWFJwUGFFc0I4TndjL0NiYzZKZ1FjTlJBT3FwYVNvUit3?=
 =?utf-8?B?cGtZcWhoWkZhMC9RcjE5NmJVcXA2KzltSDJ1eUZveVhiUGpWSFkyMis3OG1G?=
 =?utf-8?B?Z1QyRXEzUHhlNitXZ0g2U0NqTGk3Tm5wV0lFR1pTNSt6T1VrbFUxMVY0SmRP?=
 =?utf-8?B?dEZ5ZWFKNmNCRFdwK0syK3EyNlBESkhsdmtjRG5RS3dWWTFyQWF0aHFBSlN4?=
 =?utf-8?B?MFp4Zm5icHVYUWcydjg4em15bXFkemdycG4zUURLTnd3bm1pb1lEb203bldE?=
 =?utf-8?B?UjZ6dkhPNk9raE5adlk2ZFNNVXA5S3dVLytMUW1oa2t5dHN3TTZNeTFBMnRw?=
 =?utf-8?B?bW1ISnBqcVVqSERrbWtBbnpBZnI2Y0V5U1pBSjIyWElreTJ1TktTZW5DTjJB?=
 =?utf-8?B?bWxranJTbE1vcGozejRHWDR1OFlPRHpnV0krVk90dnJzS3N3dCtTa2Q3cC9G?=
 =?utf-8?B?ZmYzd3JwVEhUc2E4ZjRJWHF2UUNLMnVvek9EWEtLbDJxK2thKytWYXJ1K0Zu?=
 =?utf-8?B?Z0Q3UnFUSE1qK1k3SG84VnVESWRONFFNUGhYbTlTZmZpdWFZVzFQYXNYc1Jt?=
 =?utf-8?B?ZXhHeVFYdWtUbys3bXEvNUpnUzZWYUpBeVQySFVpY0xoNzR5MUhMbktjSjha?=
 =?utf-8?B?VkcrR01LU21rZndNbW9vaTZwL3FldVBuUkkxQXdrR3BMMkw1QmlpV3RNY0FO?=
 =?utf-8?B?S0lWTytQK05wMGdBYlQrYTd6S2NERXh5SlpxV21ReEtmcDBuT1I4U3Q4cDU4?=
 =?utf-8?B?NkZZQWQwZnRBQzNSQm5xUFRYZkhVT1NLRFlkZEVjZXJpdUZZZzQvTUFySUFa?=
 =?utf-8?B?YnVvMzlwZUNyUVJqb2IrUG9KdTJ3c3Nqc2Z0NTNyRWl6RDloOVU1aEJmeEJL?=
 =?utf-8?B?VGtTNnNWYUs2OThGeGljbERIRDhtb0p5cWU2aVFIVm1OMFlTenpuY3MwbGZP?=
 =?utf-8?B?ZmV3K2pmSFQzV01yNXdlbnZsZ2FGcDZuc1dxbHZPTTVHWGhUYkFUSXdlYlpS?=
 =?utf-8?B?Q1NIMTZIWktHZjY1WkxaMUtrNFdzdGVMa3lyam5NanVnUWxlQUlOblppZXRh?=
 =?utf-8?B?YVh6WVNacmtNU3FhZzgySWVNcmc3ZFF2YURZRnBzbzQxL0hDRXd1WlgxZFRl?=
 =?utf-8?B?YkkxWjdRVXVTVEsyZFplS1FsOHRtZHp3NWJlUnl2VTdhTUFuUXdmUUNaQ1dh?=
 =?utf-8?B?MzFZd2haZWs3YTRrcDFVN0hkL0hVRERIdVVTc2crV0FPQjVoOWg2OU1lM2lD?=
 =?utf-8?B?NVVUYnh4NGk1cUtSQ3NqMlkrMVZJUkpnT0UwdldFQ1A3azBmc1hmcnVHK3Y2?=
 =?utf-8?B?WEpuRFdYa1dFUnRjbWcwbnZlUXBsbWdrNnJzeEx1WHRtUDVOTmZ0S3g5UEJP?=
 =?utf-8?B?TmRteGRvMWVIcmRqNmxtNkkwd2pnckJZcFpvNDlRVkFUaEw1cTJ5bWhhbjJk?=
 =?utf-8?B?N3owVzlmR1pQbkJMS2dWVnpJejY4elpaT2hxSENUSlFaSUZKOHlUQnV0QmZ1?=
 =?utf-8?B?V2Vtak1vaEs2NzZ6ays3aXN5SUVVc1d5WnBTWWtHN2s5OWdySzlWdmE4UWQy?=
 =?utf-8?Q?s5ZUaJoxTQta8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDFRZCtaMnpqRzQvTDl5ckt1Z0dTY28vT3kzN1ZZME9DSFJSNGVkMUxvSW9k?=
 =?utf-8?B?VFcwdlUzZkh4dnp1bXV2SnJpcXJHb1ZkNVVqSU4vL2dPTHM1RUpwcnVLeUFX?=
 =?utf-8?B?Y0hDaXFqMFNpNlpDR1JPay81Y05vbndDMnoxS09wV3hsYi9xQmx1UEN6WVRM?=
 =?utf-8?B?ZXNUT0lJeU1tbHdVN2RqWExOcnFxWFozeWVtTU9pT3BaQkhoaFZEUU9MVGNN?=
 =?utf-8?B?SzFVNForRDVzK2NKUXYvWWVFYzJaSmozNDZOb2w4Mkl1Y0lheDNIbjFQUk93?=
 =?utf-8?B?OVplQnIzandjT0Z6eW1kTEJFU3NuWjMrVVNGeXA3RU5UMFBYSG13ZlhDSXM2?=
 =?utf-8?B?bG1NV2dYL2w5eGVWTG9wb3pDY2VtYUNmaXNLSlRyUGRuWlZEVW1TMTg4RDZF?=
 =?utf-8?B?WlpVN0dyQ01zUXJsaHNFRSt4TEZPZEJzOTZ3ci9HRkR0azZOWGN1eGF4SWdL?=
 =?utf-8?B?L0t3M3NUL2s3U0tQcEQ1Z2VDbzZEd3o1Ym5OVWV6dWxieUFjSzlWaDcyL1Qw?=
 =?utf-8?B?M2FNNHdPQ3hieVU2RjhHQ1ZzUEF5a1VUckt1Y2NnSGw4b1RyajF2bUxmUVdD?=
 =?utf-8?B?ZVZmOG1sekx6cVJ5eU9KMFZEbkVrazZWQmhxeHQyanUzaG55Mk9uc0prTkhl?=
 =?utf-8?B?OHFBWkYySTlWRGxRVWQ5ZHpyUnE4YXhNRmNaN0RUcjZpaEhvTVZ0UDBpYUVT?=
 =?utf-8?B?eFNCMjBQNkt1alFBUVljUVB3aVdyQUhLdjlYd1VYazhPNFlQSS8ycGF5Njgz?=
 =?utf-8?B?dHA1Qy9YK0xxVEdKam91N0k1dWRLTnMycGdWVVdudVRCOTBDeGhJQXptcTUw?=
 =?utf-8?B?M0dJb2VUMkZzOFdReTBqdnFhdTFwL2tpZTh2R2NJcG1FTlI5NldOWDdqWkgx?=
 =?utf-8?B?dVBLT2EvdVFrT1E1R3RyeGNjK0xTYTJTNlJobzFHL3U1R0hzMVdLZXlGcE92?=
 =?utf-8?B?ZnNmLzBHTExQWmkvUE40M2R3ZnVlSkQxZlNtNjlYbHZkZSs0eUNoZ1d2a2Qr?=
 =?utf-8?B?ZTBiTDBGVVNpMXlCaVNHOEJYdFRJblJsS2dDTmFocEEvQXl5cmFCa0RRV2Fy?=
 =?utf-8?B?MUgrTFRZeEhGZnlpSnQ5b0E0WjRBQ0JaYVh2aXQyT2Vtb2htQnlqMHlES2gx?=
 =?utf-8?B?c1FoZzNyUHF3aHJsNTBXcFRBaDNCVXYxZW1ZcURYTFFSTi8vTERjNmlTcXFL?=
 =?utf-8?B?elBPVkRGOEYyN3FOaElFN3JiUXlja0VZYnNONExacTZmdlBSK20rUWFzNVNF?=
 =?utf-8?B?SHVTc2s0d1lFSWtRalQ0MGNvUDFlcUI0NEEvSTZacngzZ096TkhxVDNmR09I?=
 =?utf-8?B?VklPcVRkY0wweWVhdlpNQ3VUZURmTkhtR3JPcFNjMlF5dDRSRnZBZW9oVHF4?=
 =?utf-8?B?MGU4VWZ5QXlKdDBLb21Ec3FmbW5veCt6KzdnQmIvckZnVXljRVNnQnUwQkpH?=
 =?utf-8?B?bU1nNEgvdnhBV3ZteU5uN0ZBSWJ1M3gzWUNqS3hzQjBJNFNaN3hBLzhUOWEr?=
 =?utf-8?B?aTNoT1hoY0I1WGVnV0RiVGFiNHNVaFptTjdINEZ6WWhTZmtsZzR5Wk5jRnM5?=
 =?utf-8?B?dEx1OEl5MDdxekIxbE5LdGtDdkt3TFl6dktISXhxMUVRQmUxRXMzbXBRN1J6?=
 =?utf-8?B?Nm5JbkVHamg0T1NxdytnblhxRkNyZGRYUzBSZys2SERyUHE3TDhtbWhhMmRX?=
 =?utf-8?B?MFQ1b3B0SXc5SFVTZE9DanFpQzRvSmpMTEwxbW5DaHZxYXdIYzhZZENwTytj?=
 =?utf-8?B?blM4NFE0YWs4bjdZN3lTYm12NGZZWUlHTFdpN1NFd2dkU1JjUEJOcWFJQjRT?=
 =?utf-8?B?bTFZUHV4UnBwTldFTWFQVTh3RkNHTDRxdEZTZGRpQVM5NEFhakJmemRKcTJO?=
 =?utf-8?B?RjVOR2ZBTGJKNjVtQ0NwQ01hcVpWYSswTFBLdTZPYWJVZ3hUMENXVzI0ZUpn?=
 =?utf-8?B?ODl0Q3NVWlkvYnlNOFZLbTB0MGFYNWdoTDQ1bXlONnJLQk5qaUZ5TWdoR1ln?=
 =?utf-8?B?cUdQc1VXMHJhVWtFdW9YRklzWGxEbVFTTFdpT0prZm9XdURsdzFDRDdBc2h6?=
 =?utf-8?B?dzRRbi9OOUUybk4xK3NvSzQ5OHk5bEgyaDk2OGtuTzE0aFpwaGxFR1RkY0JH?=
 =?utf-8?Q?AiVz12vg9yqMaCrJ1uIpN1Gax?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fUW7T4uXkrjDTk7fY4FJOChgvUIS48aM3LDCh5IUpctlfQFUC7s3fmulue8yXPKzp+30xcAtUicE1gX4sWMjHDu2R9mwOWLw6hq57rFOaa4vb3+YncMdkj0/dB37aNGmKG5iAWFe+1htbB0SZvekayuPudBttTNgyamjW+dBdq0kse96rvPlLiyLCUdzgba87t8RNY2f5Qse9d0jwWiQ8+DmGv8m/85TNODShWRPX5ZTPQbKzGMgBbX409FlvWPBdezpVDp2GRDG0IiSygCn7YN+uWFszUWyc0E3ZopTZDIMvyGk2PzqKFD6jewWk1SpP8nFj6H8XNJe1eCniS3SkxMzlSVnKk7KDcL96IcUj9ihKRDq28B2aR/bRB/ib4N+DYuE0VeAzUwgw42vt+qoNQaYUKmFObEhyjHuV9UrpEAE4MRmukaU5BuF+aMhMzSzZSk15xsWmZf+hIDJSQm7yXXJ1t0OBsXggtSZHBMM57Df4+7XWDK3borsi2002uOc+7QTAXmO77MN4/TBqVeI7qrbcxbFkqXCpGtuDhVeakWJ3IJmtzXoSp+Hp9LovTZ5m+JqlDDvr3HI/LE11DM7P/NIGfwdMa1HinCk5q7qEMs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f92aa9-306f-4857-b920-08dd31b81525
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 20:48:05.6124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpV9Ghoe4k9jr2ZfzYnDFrw8Ljv/Gcj1X4U6T2HN4r+1DfbAxIpEubGO7VN3WQoSq1akh32/MiUkdFdl35R2Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_09,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100160
X-Proofpoint-ORIG-GUID: bYAGDLfSu0x_4vd5xfQziaYKRIf2Q1Rv
X-Proofpoint-GUID: bYAGDLfSu0x_4vd5xfQziaYKRIf2Q1Rv

* Suren Baghdasaryan <surenb@google.com> [250110 15:40]:
> On Fri, Jan 10, 2025 at 11:51=E2=80=AFAM 'Liam R. Howlett' via kernel-tea=
m
> <kernel-team@android.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [250110 14:08]:
> > > On Fri, Jan 10, 2025 at 9:48=E2=80=AFAM Liam R. Howlett <Liam.Howlett=
@oracle.com> wrote:
> > > >
> > > > * Suren Baghdasaryan <surenb@google.com> [250108 21:31]:
> > > > > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure th=
at
> > > > > object reuse before RCU grace period is over will be detected by
> > > > > lock_vma_under_rcu().
> > > > > Current checks are sufficient as long as vma is detached before i=
t is
> > > > > freed. The only place this is not currently happening is in exit_=
mmap().
> > > > > Add the missing vma_mark_detached() in exit_mmap().
> > > > > Another issue which might trick lock_vma_under_rcu() during vma r=
euse
> > > > > is vm_area_dup(), which copies the entire content of the vma into=
 a new
> > > > > one, overriding new vma's vm_refcnt and temporarily making it app=
ear as
> > > > > attached. This might trick a racing lock_vma_under_rcu() to opera=
te on
> > > > > a reused vma if it found the vma before it got reused. To prevent=
 this
> > > > > situation, we should ensure that vm_refcnt stays at detached stat=
e (0)
> > > > > when it is copied and advances to attached state only after it is=
 added
> > > > > into the vma tree. Introduce vma_copy() which preserves new vma's
> > > > > vm_refcnt and use it in vm_area_dup(). Since all vmas are in deta=
ched
> > > > > state with no current readers when they are freed, lock_vma_under=
_rcu()
> > > > > will not be able to take vm_refcnt after vma got detached even if=
 vma
> > > > > is reused.
> > > > > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will faci=
litate
> > > > > vm_area_struct reuse and will minimize the number of call_rcu() c=
alls.
> > > > >
> > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > ---
> > > > >  include/linux/mm.h               |  2 -
> > > > >  include/linux/mm_types.h         | 10 +++--
> > > > >  include/linux/slab.h             |  6 ---
> > > > >  kernel/fork.c                    | 72 ++++++++++++++++++++------=
------
> > > > >  mm/mmap.c                        |  3 +-
> > > > >  mm/vma.c                         | 11 ++---
> > > > >  mm/vma.h                         |  2 +-
> > > > >  tools/testing/vma/vma_internal.h |  7 +---
> > > > >  8 files changed, 59 insertions(+), 54 deletions(-)
> > > > >
> > > > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > > > index 1d6b1563b956..a674558e4c05 100644
> > > > > --- a/include/linux/mm.h
> > > > > +++ b/include/linux/mm.h
> > > > > @@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, =
void *end_code,
> > > > >  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
> > > > >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
> > > > >  void vm_area_free(struct vm_area_struct *);
> > > > > -/* Use only if VMA has no other users */
> > > > > -void __vm_area_free(struct vm_area_struct *vma);
> > > > >
> > > > >  #ifndef CONFIG_MMU
> > > > >  extern struct rb_root nommu_region_tree;
> > > > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > > > index 2d83d79d1899..93bfcd0c1fde 100644
> > > > > --- a/include/linux/mm_types.h
> > > > > +++ b/include/linux/mm_types.h
> > > > > @@ -582,6 +582,12 @@ static inline void *folio_get_private(struct=
 folio *folio)
> > > > >
> > > > >  typedef unsigned long vm_flags_t;
> > > > >
> > > > > +/*
> > > > > + * freeptr_t represents a SLUB freelist pointer, which might be =
encoded
> > > > > + * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is e=
nabled.
> > > > > + */
> > > > > +typedef struct { unsigned long v; } freeptr_t;
> > > > > +
> > > > >  /*
> > > > >   * A region containing a mapping of a non-memory backed file und=
er NOMMU
> > > > >   * conditions.  These are held in a global tree and are pinned b=
y the VMAs that
> > > > > @@ -695,9 +701,7 @@ struct vm_area_struct {
> > > > >                       unsigned long vm_start;
> > > > >                       unsigned long vm_end;
> > > > >               };
> > > > > -#ifdef CONFIG_PER_VMA_LOCK
> > > > > -             struct rcu_head vm_rcu; /* Used for deferred freein=
g. */
> > > > > -#endif
> > > > > +             freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPES=
AFE_BY_RCU */
> > > > >       };
> > > > >
> > > > >       /*
> > > > > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > > > index 10a971c2bde3..681b685b6c4e 100644
> > > > > --- a/include/linux/slab.h
> > > > > +++ b/include/linux/slab.h
> > > > > @@ -234,12 +234,6 @@ enum _slab_flag_bits {
> > > > >  #define SLAB_NO_OBJ_EXT              __SLAB_FLAG_UNUSED
> > > > >  #endif
> > > > >
> > > > > -/*
> > > > > - * freeptr_t represents a SLUB freelist pointer, which might be =
encoded
> > > > > - * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is e=
nabled.
> > > > > - */
> > > > > -typedef struct { unsigned long v; } freeptr_t;
> > > > > -
> > > > >  /*
> > > > >   * ZERO_SIZE_PTR will be returned for zero sized kmalloc request=
s.
> > > > >   *
> > > > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > > > index 9d9275783cf8..770b973a099c 100644
> > > > > --- a/kernel/fork.c
> > > > > +++ b/kernel/fork.c
> > > > > @@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct =
mm_struct *mm)
> > > > >       return vma;
> > > > >  }
> > > > >
> > > >
> > > > There exists a copy_vma() which copies the vma to a new area in the=
 mm
> > > > in rmap.  Naming this vma_copy() is confusing :)
> > > >
> > > > It might be better to just put this code in the vm_area_dup() or ca=
ll it
> > > > __vm_area_dup(), or __vma_dup() ?
> > >
> > > Hmm. It's not really duplicating a vma but copying its content (no
> > > allocation). How about __vm_area_copy() to indicate it is copying
> > > vm_area_struct content?
> >
> >
> > Sorry, I missed this.  it's not copying all the content either.
> >
> > vm_area_init_dup() maybe?
>=20
> Ah, how about vm_area_init_from(src, dest)?
>=20

Sure, thanks.
