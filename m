Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E212286AD;
	Thu, 25 Apr 2024 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714055775; cv=fail; b=c1mIcuWshJYYRQ6VWLMhl4vknvpSh0pO/PIiPAiawRhMq2mMxzuPpN8pmi/znycAB0zMj3XwxgiStU2iVtSunJvo8R3ZPVIuKSjFNcgHwq+T64SsjzORTTLK18J1ZkvEFq3h5RqgRXzpCWSdbPs67AVtSlGY49gzF9O1g1CKamI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714055775; c=relaxed/simple;
	bh=fSy+UAwquqJgL8PohKUpcMhY0xFiFUEkJ4djo9GufJI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LOdwrSqWj7A/OfNiEvjet4Aqke9/NHB7Hev0AmiK4nXtpjaKLPRWozoutruiLo8BhQIxkxhlkAZDSylYdkXT7feZFRdaBNUaLJcDqZg4dR2rOJE5qGeNNPdXwXFLPk99QyW6Qh0Yn6PPrQEdOEqQMRNMvMDmv16MN2IGePmeyGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YkoAP8nn; arc=fail smtp.client-ip=40.107.237.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YkoAP8nn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NolCPlIdjRIJi9IFbrRn1fJDiGwzdorQhmQ2709ml51AR8WWPrBAFjtTTM4p+0dRkVpXj//hpSufnIrrfnhSGwDVx/mdaZfohU1f1Mxv9iNujRxubZq/zVCWzYoxR5Wm81ZHNIir/XE49/gSEgy91f1ZiLXncvbzFO9fILF8Vu5bYZm+QrRWvoFbxxr7hkvBF/6bGL7FcQHvAV8pfUIDaTC4U2FONssaWuH1WoE12A/G01zmPCP8wq6tGvjcj7OGNbt56ARyTS5eAgkCyNUgzqDUgTKZCkG0y5hd6Tsgl3fP1oHpke/EsGGzdY6f2yQHb9I9/MAn1n/Zw20knCukNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+4Cp+qEDRr+p5kai39KLIRRb2LteVCSzWgE81WZH6U=;
 b=fDEDDHzGNrgM8ZY1SVMtu1jqC9Z/4fdSxPEoFsd/4mlWKWil8etdORG7b3JmqlR8VEHXXUa7KK8a66qkjggwHYchW3up9MRGJV6N48YYJkhAYTk/9goGKQjOL54SaAnW5Fmz2TmTfGNJyjV2FZ+Qp7IKrDgpCGGgvpYfyQMVSV8utZIffCPY5B8CSbBHM/P26upNbEkzO3soCmkfpHBA5caiI9F4Dvaz2mGGUspXyq8UqKDG7sCEKXhO2DZsVkPWcHDtroZ5AKBZncfmSyuCs+t4LCk/ITEO7HQa37OkMvts7TqBbOH2FJAyDUaSRur7Yrki1uPp6QepWMykYaZq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+4Cp+qEDRr+p5kai39KLIRRb2LteVCSzWgE81WZH6U=;
 b=YkoAP8nn3a8ce/de9vNA6lhHjVpfpn5vv/gO+5i+eAJGTT/P1TAtSKMGziXiWlbEyfo4ZSZ6MTTlbYB/N4Y+R2wYfpFvJpne4SLk12oq1XjMO8vFphHVpkiqPoxP/5tQ6iHpwEXQBdX9Ss2HoidgT9sClBq2smgUHKjkdckR/G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 14:36:10 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a%4]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 14:36:09 +0000
Message-ID: <e47385b9-cbab-465e-8c8d-3bbad57415aa@amd.com>
Date: Thu, 25 Apr 2024 09:36:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Feedback on my development setup
Content-Language: en-US
To: Josh Marshall <joshua.r.marshall.1991@gmail.com>
Cc: ngn <ngn@ngn.tf>, linux-newbie@vger.kernel.org,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, pranjal.singh4370@gmail.com,
 "bilbao@vt.edu" <bilbao@vt.edu>
References: <CAFkJGRc824vYEufG=6ZVPAW2iVpd0NDThJadZVrUk_ZND_qJag@mail.gmail.com>
 <Zh6Xbqijp8rRGo1H@archbtw>
 <CAFkJGRe+UpNPSnSL623o6G+NCkK_uGPx-NCNLQx0vSGpMo98eg@mail.gmail.com>
 <CAPzh0z8RySn429XYQHoP_c9UA+pb6SLHGhH40vQDhc3P2xiysQ@mail.gmail.com>
 <CAFkJGRfK=1f8tfWO8G0v8SOmCwCgK7P5y7g2My47VG6Obb1DNw@mail.gmail.com>
 <ZiE9ydgMtpKOBLDk@archbtw>
 <CAFkJGRddGHK0j4CcQUoRKiD3afniLY=rRV5npY5wpauqqY0XZg@mail.gmail.com>
 <CAFkJGRdFuMoO4_mR-cR1NWjKQJnopN0v1R11-jSnLn+FKcOCdg@mail.gmail.com>
 <CAFkJGRcg+ThJ-xUve0=WorChW=-6PreLHXeM8YwtwzwpkHTu8g@mail.gmail.com>
 <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw>
 <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
 <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
 <CAFkJGRe7DVpcr+VKouTYzBK5r905W4xmxphU11AA6uB8Oj5FJQ@mail.gmail.com>
 <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com>
From: "Bilbao, Carlos" <carlos.bilbao@amd.com>
In-Reply-To: <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:806:125::22) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cc78de-7048-4460-4eae-08dc65350c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTJDbVBFaDRsL3NyR1VtWlFwY0JQNTJURmNxRWdMU25WTmpNYXpVcnk5anVG?=
 =?utf-8?B?M3Y4VTJidUpQbE16MjBYQ0I1YjNXTVdrcU1VUm1ibjdvSnk5TUlkaFZrZ2w2?=
 =?utf-8?B?WWlQNmhaQ2FhdkRBVVIvanY5eXZQbis4b3E2SXFzTjZqcFV0TCtiNTBweE9s?=
 =?utf-8?B?NEVIYkd0SzFGL3Y5SVdxeld3K2IzVHlPV3pHYnhkSnR1NzlKZXlzRDd3ZmVB?=
 =?utf-8?B?TGxvbmh1K3lGbWUvMFFtN2J1eExDZG43bzZCeUhON0NFa3BSTlpVUHdOemNU?=
 =?utf-8?B?YXZCZGE1SDdQd004SHhUWEFTeFNBOEl4ZnZ5NVppeWphNkVtRDlOU2N5cjNi?=
 =?utf-8?B?VCtBYzJpRkxQRndudlVwa0hiTDFZM3ZJSjVKRWlIc2pBQ0lTVWUvUFZqdVU5?=
 =?utf-8?B?SEltZEZoME44VlVCUlR1SzgyR2VxcEIwY3I5RWxHS00vYVMwaHBHR0I5S1k4?=
 =?utf-8?B?OVlPL0tjMlBzVEZ0NUR2TkpXR3lHeE51STEyOTFkZEhjQkpET1piWlcvVEU0?=
 =?utf-8?B?cmNNWWRpMFpxRDFNcGd1UlBoUlhMODNDQ3pMM21hWEM3Ti9SSzFnSHZsZzJn?=
 =?utf-8?B?K01uRU81blBPWitrK3Fnc3JoQ2pvaWNLVHcvbGM4dFc4QUJLY3pvNEZIMEJD?=
 =?utf-8?B?cVg4WXNRQ1NZVGR2U1V0ZXdwVm5nR3ZWRUN6U241cXlYc2VRSUord29STjJC?=
 =?utf-8?B?VUd6WUZMdjVRM3RXU3VjRW1LRmZiY014bW01NUVCYlZzVHdoZjU3bW1iSmtT?=
 =?utf-8?B?N1N4Y3IwblBGZ0pjRlpDZEJVRkxYYkNyN1pSWHh2REdJQkRLcnBzeG8vaENo?=
 =?utf-8?B?Zmo3cG9QblZOblg4aytqS0wrampqUEpvUUVkRjAyZklCdXZ5eU5lYU8zZktm?=
 =?utf-8?B?bHZhRDNwa3lEY2RGVDRiQ3lIUUFnT1U4SGU2eFBqZzh2U1Bxa2krZnFsR3BP?=
 =?utf-8?B?UzFUb2Z6a1Vla2dXaHJXWjFFUDByUjVRZFRGVE5DanQzYkovSHljMXRRbmhy?=
 =?utf-8?B?d1R4c2hlblZZMmtOT0xYMElhbmpoalltYnFsWVdFL1Z6bHp2SmR0RzdQTks3?=
 =?utf-8?B?amQzbDFXcWlwdUN6VG5BMzhEUHQ3bzN1TUl4MElNbVpHUWxNcDhxMlYxZ1Ur?=
 =?utf-8?B?MHhpZU5yNm90WStEbFZPYzc4eHVFR1Z2V1NvWHFuWlMzdDZ5QWVhWURKYTQ0?=
 =?utf-8?B?dnYwYUordnprMjVqRGx2TUg2cVdRYXZBSjBUb21uYlMvTnZxS24rbWlVaE1R?=
 =?utf-8?B?NHk1RGtIWHBpZktBSnRLS0VWR2JUT0swcXJzYW9KQjNwUnBrMFBvYXhBUE1R?=
 =?utf-8?B?U2ROQzFidm9VNktjRXFoYzFsVFdJTEJIS1ZmNWpoZUZpVGNZcFRQellxVVpq?=
 =?utf-8?B?RHQ2VVUyVm92SklWV3IvbUtTdGJ1S2JlbUMyblBKckJrcnU2SmNZNnU2aXZC?=
 =?utf-8?B?eWVmUFk4T25TZXl6Sld6N3NZWDFPdXU3UEpwdDVPUm01Qk5xMHd3a0wzSzRY?=
 =?utf-8?B?OEJJNldpY3VyN3hNSEIydGQ4ZHJmKzBOdVNPaTlZdlNDRVdSQmVjYUJ3Vjlw?=
 =?utf-8?B?SVFFQlFYcHBCZjZ5WUpEWlQ2U3A0RDJXdEE2Q0tVbDVhL3BybEZTS29kc3Rq?=
 =?utf-8?Q?9Sqezew47NjNfHYKt7yxPwGo6y6YNjdmKvHEPO+IvnyE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2ZvV05NaGk2VEowOGhxOFFXb0Q2dFVqVkRRTTZSWnVweXNLVFQ0aVlYQkxN?=
 =?utf-8?B?cUlCMlNmNGc2eHozRjd3WXl5eEN1WWhhVlVjQm1MNDNMUWZUVmtnWnFHMVBp?=
 =?utf-8?B?NlBHN1IyNjNDVUFXQmZBdE01bkdKZU93OHU3T1RvaE5lK2FoaE1RejliRU1a?=
 =?utf-8?B?V3grTDFtR2ExaUpNUTk5OGQ1YUZtU3d5N2FoNHZHZlo5UEIrVlZNb0hROUVL?=
 =?utf-8?B?dXVuT04raTNRSnJJMG9jVW5tRDJ2NWpiQWVILysvR3hIbERaeTFtR2hYaExr?=
 =?utf-8?B?UGpiUlIrY3BsYU5MOWdSOFhpWUF0b3NPbHRBK2lFNUtWQTdMZnZMNVR6RkVJ?=
 =?utf-8?B?WXRqSjUvOUlqN0ZOQUhXam02NWd6ZDY2alpRNDBPb0JtdzEzb3pva01acHpM?=
 =?utf-8?B?ajYzKzdQWlI4UDlDeTNva2JuTkxwSW9EMEhROUd5dWxiMFliamhsU0dDWno4?=
 =?utf-8?B?cTNXM1ZsYjFOd1RNRlg3aWtzZWtaR0xpS3hmT1l5NVlaem1HZ2dIUXFheUZi?=
 =?utf-8?B?RTJ6Q2xKcnpXbE5nejdITG9nTDc3cWdpR29oMi9xVVZ2dkxMb3NmTTFPNCsx?=
 =?utf-8?B?NFVjMkplOC9YRkxZOElOUzY0eEFleldnRE9vZW0ycGg1eEJmeXNUbkh5emhY?=
 =?utf-8?B?WDhOemF6Tlp3K1hSVHk2NTl4MGhTUWx1R0F5NnFUbElEbFY5VzBrNTlSQnJ4?=
 =?utf-8?B?ZUN4b3RCN09aaXhCVThrZE53d2h4VXVLenZpTGVSbUNQOTFDaHNUenZ6N2Nx?=
 =?utf-8?B?Q2Z2enkxbFFncmlPcStINTZKdC9PdzdSSnRpNlRoZlJiUHphMHZqRlRrYUpR?=
 =?utf-8?B?WXMzRHE4MmNPL2tSMkR4UW5KcE9yL3BHU2xNMzZITUdtZlV2b1JrRUhta2ox?=
 =?utf-8?B?YS9lTzd1dHlqbXZDMWNtSzNObFpHMjZoUnIxSWV3aTZLcndNOElEck9QYmo1?=
 =?utf-8?B?VU5PcUkrMXlmb1Q2eDlrelpoRjI0eThwa05OamMrQ3RLNjZhMm5OM0xIb1hq?=
 =?utf-8?B?UFl2RXo4aThaT1FaV1lnRU5YNjZKS29TdUxWOHFVK3hXTzF1RmZaZnpLejRq?=
 =?utf-8?B?VU5kcE9wWGM4VXAzSCticENycUQ5L2NOdFJUelRmVXZ0eHRmcnpnUndScWZZ?=
 =?utf-8?B?UkZFUGVEaUxtcmZSYWVkeXlPeUJTZ3NiNFhBcG5BOVcvajl0Uy9qS0pkNElL?=
 =?utf-8?B?LzBXM0VlK1RoOE5aWXExSGdNZlhhWC96cGFiQlFBVVRGZ2w0Q2tJRGorTzdv?=
 =?utf-8?B?SG5rcUEySnpiQm03VUN0MmNqQWs1aWR0UUxaaUV5UnNXdkNhbW12UjZLTjIx?=
 =?utf-8?B?RU4wR1FxeWkySi9IdlFXbFVtTm1SY1pVYzVtelpUYnl5d2FTTWI4L0FPNnpB?=
 =?utf-8?B?NjVRbFBBMTU0dUVvWHBuYjBUZXZWRC91V1FxdTVLMitsUGdMcDdCZXF0cU5w?=
 =?utf-8?B?T1dWZS9NdnFuUXBJQ1pTSTdoOEJLYS9DVHZEb3k0dTN6WjhhU2FxeFJ0aWpv?=
 =?utf-8?B?THBGT0luZmVTUVpKTjNtbk1RUExzcVB5ZTNKY1NqZzNzbHpibDMzV1YzNWZs?=
 =?utf-8?B?bjV2QTIwcE5Ldzc1RmVkV2IvbGsyT3BsS3Y1RGlXK20wdzdGcCtEWitmOUxl?=
 =?utf-8?B?NWRabDN3N0gvWHlpS2dDTENHd2dwMEdSTzVYVmxpNjB4QjdLMkRScURNd1Fr?=
 =?utf-8?B?ZXBlV3BjY0pZdzhleWRXWUlQbDdIUFJzZWdyYVBrQU84Sm9GanJVZVhJZHVK?=
 =?utf-8?B?Yi9tQzBPTHlkMU9LUXJCTjQzTStjSS8xWmFyWEdyR3BMdllCK0gzd09HWnpN?=
 =?utf-8?B?NzdNY2hjOStXZnZVK1hSZ1pEdTFybTBtaE0rZlpoNzNTblJ4djc0aVppR2dt?=
 =?utf-8?B?NFJXNDVxdWJCVk00WnZGaXcwVGFoUzNkbnJ5Ymk2R1V5ZVA5S2g1UFROemI4?=
 =?utf-8?B?YXlzckNZcnQwR3NoelJTcWJka2w4WFFydXVtR2xTT1UyTVBGVnBSS04wUm5G?=
 =?utf-8?B?dXVYTStOTlhzSnA5bXhtN3duM1lwbTFhM3NtUkFXK2Y0YXJkeE5HOHBTeXdF?=
 =?utf-8?B?Mk0wQzdYZXllb0hhZ1B4SXY1Y0J4ZDk3bEc5eWcrcGZQaExpcGN1K0pKWFhX?=
 =?utf-8?Q?yU+7IISJHXFL1LGJPeD5ZnRYt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cc78de-7048-4460-4eae-08dc65350c2d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 14:36:09.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoRcdv68wIL6ifKCqPlQoyo80g4PaBzq1JPaxYUonJu5rSsY5WTpQLGagyfrWONuwcvfZJFpCbmu5J3Hnk3rcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627

Hello Josh,

On 4/25/2024 12:37 AM, Josh Marshall wrote:
> Hello everyone,
> 
> Last draft before I send in a patch.  Big change is an added preamble
> to set tone and intent.  Also some stuff up top setting forth the
> structure of the document.  Carlos, I tried figuring out what you
> meant by troubles with KVM, but all that boiled down to was scant
> documentation on use cases people rarely venture into.  I think that
> is a different document from what I am trying to write, although I
> might now be qualified to write it.  Pranjal, sorry man, more words :)
> 

Exactly. Since you found the KVM documentation to be lacking in detail,
that's an excellent opportunity to expand upon it. That's what I was
suggesting: improving the documentation for these niche cases adds value
and could be included in your potential patch.

Before I talk about specifics of the document, have you thought about where
this text belongs in the broader kernel documentation? It's an important
part of your potential patch. I suggested incorporating it into 'A Guide to
the Kernel Development Process.' Have you had a chance to consider that?

> https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-workspace/-/blob/main/Linux%20basic%20dev%20setup.rst?ref_type=heads
> 

It's difficult for us to discuss the details of your draft like this. It
would be more better if you paste the text directly into the email, and I
can provide inline responses. I'll paste the parts I need.

"
[...]
This document has been viewed through many perspectives from many reviewers,
each wanting a conflicting adaptation. [...]
"

Really? According to your GitLab history, the commit "Draft 1 complete and
ready for the first round of peer reviews!" was 2 days ago. What am I
missing?

"
[...]
`NOTE: On some distributions, kernels (/boot/vmlinuz\*) lack global read
permissions. Administrator permissions are required to make the kernel chosen by
``guestmount`` to be readable. There is debate about the effectiveness of this
security decision. On some distributions like  Ubuntu, this will cause a
problem. In the context of changing a one-off system, having this file globally
read-only is considered safe.`
[...]
"

Please specify the distro you used to prepare this doc.

"
[...]
.. code:: bash

   mkdir -p "$HOME/Documents/linux-workspace/kernel-dev"
   cd "$HOME/Documents/linux-workspace/kernel-dev"
   export LINUX_REPO_PATH="$(pwd)/linux"
[...]
"

Please explain to the reader what these commands are doing and continue to
do so for subsequent commands, as you've already done in some cases.

"
[...]
.. code:: bash

   make -j
[...]
"

s/-j/-j (num cores)

"
[...]
Citations
---------

-  https://github.com/archlinux/arch-boxes
[...]
"

Citations should be numbered and cited in the text where appropriate.

> On Tue, Apr 23, 2024 at 1:43 PM Josh Marshall
> <joshua.r.marshall.1991@gmail.com> wrote:
>>
>> Hello Carlos,
>>
>> My intention right now is still to gather feedback on the draft!
>> Everything, including if it should be sliced and diced into other
>> places, is up for consideration.  The final intent is a patch into the
>> central doc tree and not remote documentation.  I'll wait longer to
>> gather more input before replying to particular points.
>>
>> On Tue, Apr 23, 2024 at 12:40 PM Bilbao, Carlos <carlos.bilbao@amd.com> wrote:
>>>
>>> Hello Josh,
>>>
>>> On 4/23/2024 10:34 AM, Josh Marshall wrote:
>>>> I have a draft document which I would like broader review on, which
>>>> currently lives here:
>>>> https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-workspace.
>>>> This document is to ease the setup of Kernel Development.  I intend to
>>>> send this in as a patch to the mainline doc tree once it gets by a
>>>> suitable number of reviewers.
>>>
>>> It's great that you're interested in improving the documentation. I've CCed
>>> linux-doc list for visibility.
>>>
>>> However, please note that we already have existing documentation, and it
>>> might be better to extend what's already there rather than creating
>>> something entirely new. You can refer to:
>>>
>>> https://www.kernel.org/doc/html/latest/process/development-process.html
>>>
>>> If you still feel the need to start a new document and host it remotely, I
>>> suggest updating:
>>>
>>> https://www.kernel.org/doc/html/v6.1/process/kernel-docs.html
>>>
>>> If I may offer a suggestion, focusing on documenting the challenges you've
>>> encountered with KVM, etc., could be more valuable that trying to cover
>>> everything.
>>>
>>>>
>>>> On Fri, Apr 19, 2024 at 12:15 PM ngn <ngn@ngn.tf> wrote:
>>>>>
>>>>> On Thu, Apr 18, 2024 at 05:40:20PM -0400, Josh Marshall wrote:
>>>>>> Looks like breakpoints aren't working?  https://paste.debian.net/1314501/
>>>>>>
>>>>>
>>>>> This maybe caused by Kernel Address Space Randomization (KASLR), try
>>>>> disabling it by adding nokaslr option to the boot options.
>>>
>>> Thanks,
>>> Carlos

Thanks,
Carlos
