Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.102
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244127;
	b=n5B1L+63WglVP7VxeSvn5ZeFE3Ib+89VVCUG992zINfb1h+gIvi8RRxb5lDYK9R1CQtJ
	 wjidYE3W3VqA0pA1Bp9wUUi4j38uSBLHVYL+FW1Xb3K0uPZ4E31nGNVjn+lS4/ZXTnqET
	 BUh5fZjp7ylmz0+DRl+3NLfIPm/LVjCAgeyy2w69HxOCnGmxHy93nlum8kq/KthyqZMuc
	 jpvceb0g79IT+7RnbSq09Mrn5Db6fz+cd02PnXpBu8sluuNag9isupZ/nsntZf6r3hqee
	 ScypjRgpF8lg3xxNfIFTzcd58tYC1ty+Z6giSnv88jw0rcVZJcCXvMnCCvwaDokDg1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244127;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ahSrI7G5Ko+8f5Yqa0SCzPZdNgQGJoIJIwJ/uiSLwaY=;
	b=fOcbCwFkG1Sny5x3ze4pg+9Y1Nj0NoMHBWeXCnOIIaQIZbDnuyTJe/oPBtiH4oCGpxVl
	 tTXZV4b3WBJoBjsH/tOPDuWgAksviin+/pFmlREdzCnlbpSm+GOl6K25BndRTXYvgI3Si
	 wRENfS0kiT4qkRf/o3/dd7za4MaVMgGw+mue06pPi/b8lu0zlJ7fctKOGaMHwmo5okzuO
	 jlguTqQ1igw4n54dJfpkKv2VoS9r0k7F53RTgrp1rR1+EckT7fAtTjWPupwvWyREwFVa9
	 dMCg54q6APWIflhpXnubdZXfLgf34hNZE+3j7ypGUbHMPoSAyb+8JuCap5CqvBT7gEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=processmission.com;
	spf=pass smtp.mailfrom=processmission.com;
	dkim=pass header.d=processmission.com header.i=@processmission.com header.a=rsa-sha256 header.s=selector1 header.b=GoeesuAR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.102
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022102.outbound.protection.outlook.com [52.101.126.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF9606A330;
	Sat, 21 Nov 2026 06:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EEF9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=processmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=processmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=processmission.com header.i=@processmission.com header.a=rsa-sha256 header.s=selector1 header.b=GoeesuAR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jp5O9+8KgzXpflI1C39THUyD93njYtRa9Xx4ucdvVvvWscrTNoY3Z1EQefSMdBUV9OfXnuwhrhiywAz3J0NSDMDP76ebfaMCRUnL+9RKzaC5C6/2QhZwC2diHu2FG+nJcuNH3zg5eiQGPCV2HWKM7DHjnY6O9RMqGARsFm+xZMps0/8MFh2JzyRzWX2JZPUcQJb9Hp0phpGW7qNd/EOAskOMm3yRYUPbGBWxaD72fqR0tnfWqrwgtigP7M+nqssXYpgxMd0iDHcTAjsqBeZdd0kWH9lfNXYfda9RMbXa1VKMfYQmVQLmb9stF9TbO5Wm5yfikdMHXuKbgKwV+qph7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahSrI7G5Ko+8f5Yqa0SCzPZdNgQGJoIJIwJ/uiSLwaY=;
 b=vRbcsfk+owquSPENUKpTapvF+8ZIJajVFjSnECmXY0hNovc8VPNld0Qh3mOmFqy+rcEJ1LNYtRq7Up6NjYWp6lWtmA43EZ8Zk6q7Iuk4blm852brCiWgNWdQsDR8FJXcF1aX8VlVXegrid1eesRUAiLuyMaOhx57H3Wm3pVt3FfFZ3ZjfedKcX0/4mJqTgpElgIFDm0DcYFyLdndgmQSiC5Ns5hWpmXlP+zEc/YsGzGL9ZYsdU6H3nK+0jehXjfk70b/e7VL8l4XLufCr+FJFoVUL7XRpV6vvF1QYKXXFP90OIAca7tY2SotjFElOx0WhVYhLLbsX2h3u82ksHTmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=processmission.com; dmarc=pass action=none
 header.from=processmission.com; dkim=pass header.d=processmission.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=processmission.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahSrI7G5Ko+8f5Yqa0SCzPZdNgQGJoIJIwJ/uiSLwaY=;
 b=GoeesuAR202pA1OBMpgOA40PgGXGU7Unelk0iUmSuTvfrwgp7ZF34bx+GqqvYxEDQm8020Nyc4AFuxCuFB98XYhsLyv9bfDg94yzVttQGjtSubOuepGg/ciDuHY9ypRxMypqAgkNkgR+LR+SMn/I5hWmr4j0cZzex4i5iOBSEoW91ekjRB3HB/HPPK8Sno1dSdZIE+zRseF2igIaiXLIIdstDUvXfHvlH1LjXayNk+5gqZKrvg7r2JJNrgRihAdcFj1PGiBQxRJ4eDpbjg7QVQ72zkU+khlYPfRa/c6WCHWVVCNSixOplnbdfxgE+1HnfVtd/5WqasRXue/NbeIqFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=processmission.com;
Received: from KUXPR02MB9336.apcprd02.prod.outlook.com (2603:1096:d10:a3::10)
 by SEZPR02MB6133.apcprd02.prod.outlook.com (2603:1096:101:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 06:55:23 +0000
Received: from KUXPR02MB9336.apcprd02.prod.outlook.com
 ([fe80::1451:cb49:7950:b10d]) by KUXPR02MB9336.apcprd02.prod.outlook.com
 ([fe80::1451:cb49:7950:b10d%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 06:55:23 +0000
From: Chao Liu <chao.liu@processmission.com>
To: Zixin Wang <w1355457260@gmail.com>
Cc: Chao Liu <chao.liu@processmission.com>,
	linux-doc@vger.kernel.org,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	zenghui.yu@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Add core-api/irq managed_irq Chinese translation
Date: Sat, 21 Nov 2026 14:55:00 +0800
Message-ID: <20261121065503.68074-1-chao.liu@processmission.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120160539.103773-1-w1355457260@gmail.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:510:23d::9) To KUXPR02MB9336.apcprd02.prod.outlook.com
 (2603:1096:d10:a3::10)
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
X-MS-TrafficTypeDiagnostic: KUXPR02MB9336:EE_|SEZPR02MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: fde915ad-6521-4bd3-3d96-08df479c6a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|260925021311599003|260925021911599003|56012099006|260925022911599003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hFGUE/7WqF7LZOWaAzNjJyJ+a3GuytmUwQ6mcZSjhacGxQg9oFNsMUeYcXLjsM4zJvolpD7LvRxmWT8t15+sF48MUsOFfkzQSRUX8aF8U2i2W0YmBjib5x5Yzcv7Lp5gny7QERJlYZdN5u9HINFx1uUQNEwj5+PRu56onGersyQ/OjoSV8IztGRxndqCOhBb/Tu5OSOElk+IUdCTxJLKdYbdsb37vaZ+bSWeSb59EVDELu78Ms8o3FmQL8WLd+lxS1qYpWpuiTaODeC+In98GWWCjroVqIpaRSCCCT+CiC/ENg7mKe4xlSMxPLET8K/NFmbNhkToEJZ4hONSGnH4VfLk7xDHdubABILTSOyEXZFpiVNcex+sRvyzlr7ATGmxKMKMEUP5B56HPcZX6TKH1MAwR4FXRsbwojsoTlJe9vyn3447X+TCu22H+cF86rlsRTo0aAOP5NoTjZx4xxOlrkFvydEtzVZu3etzRNVmwwfUTLvLrKnZvzUkyIDUj1adCvsgEGxea8eoE/uCQfqvSULR9LVaW6nGkRGhIH/M1WlKQHll0edNS5z9NZonIQBHW69g97Xxa4bxyIi2EKPtpyf68YmkjSCsEme4QbhZGphcGZIH6TXefUo4fRxdzw0Xis+UqmyNUihV5LDbG5rhcXi2WbjsNgSplIJxXvtj68A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR02MB9336.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjJnUVhpbmpBekJhTjljSVptK0ZrbG53Z1hPVjVxM21nYUc1TWtKUHhCOEtE?=
 =?utf-8?B?SzR2K3pEVnNqSUo3YjhtNk1hRjZGOHNGMkYrNFYwTWJLa3p1QmliL2VMaTUv?=
 =?utf-8?B?Zy96M2NxbGtCZXBOT3F2eThJellUUFRpaWJmSzVJaVZSdlEzNEFMeFJDM3pr?=
 =?utf-8?B?TFhxNFd0UTYxSmZwUmJuL0x1UkExSmY0ZmdaeklSanl6dWNQVkhtWTJad0pz?=
 =?utf-8?B?TTc1L3FlWnhob0JFam9kL2Z1eEJ0SzZ2NlFqZGJHOEFCV3NMRU9xUE02bHpm?=
 =?utf-8?B?WWdOK0FLL0ZrcEpYKzdKQjlPUzBnSnYxK29JYktjUmVncUdhRUhTZ3RpT3Ix?=
 =?utf-8?B?d3JISjh5emo5WVAvVTgrd0JEY3UyaGNtM1ZQc2tSOWppNGdPY3FqTG5INHBT?=
 =?utf-8?B?YVcyRzhPOTlleWxZd3Y0T0lqQ2h6MUVWNjlIL0tzWVNYcGxoQkhzNi8zWmVq?=
 =?utf-8?B?YXYxdkdHQm1BYks1ekFoazdDMmEwdDl3M0EvL082SmpXeDh2Nzdzd0V1QU1w?=
 =?utf-8?B?cmtLcmkrVG5sRmFJaFFDWk54N3c0VjlOQkVHZ1NpVm1BWG1pWmdNRU5EWk9I?=
 =?utf-8?B?VTlHblViT0VpdFIxemNsUGE1Y0dUelJkTEQwQ1dYaEZnaGh3OEoxUDQvWE9n?=
 =?utf-8?B?bEx1NzNCVzFtcDFDMXB5Witmb0UxQlZRZ1g5OVUzR1V2dmJ6dGhYODY1cDZZ?=
 =?utf-8?B?OGdJeHhNaUJ0V2JneWppclRaVElIMVpxQ2tDN0gwYU9RRmx5emh4T3Y3VVNG?=
 =?utf-8?B?RlpzUSs1SzVZN3FGWStrUXhXUXlqY0dkK1Z6UnNOVTVsUVRoZTJlL0ZrZjJB?=
 =?utf-8?B?MEJHTkhkMytGekdoa0lxK3p5dlhUM3c1TzY3SC9ZM2U1eU5LSUVKU2ZFeXVt?=
 =?utf-8?B?bW9UOFQ5d1ltbS9mYmo3dGFuZ0lyMnVHb2hGekJnNmxmV3A1QjFIQ0FDZUdk?=
 =?utf-8?B?QlZUeXRVTFFMNHMvSUJzaE10Vm5iMWRPQXFrV3I3TUdkcUdNRkt1alB6Zk9F?=
 =?utf-8?B?QlZaQmtPQllKd29aMTR5WFJCMjBmT1BpNEVheERxMXM1SVVwNEcxU3JlbW1T?=
 =?utf-8?B?TEFBK3dkUmlsZ0dDR0QvNzArbWRqOTZwa1N0NnpvdkxzWjkrMWxPWExqMVBk?=
 =?utf-8?B?b0ZNN0p5VUFVa29ZN1o4QXd4UnhrVzk2RFRkVXNIclhCSTcyRDFlQ29LRVZ4?=
 =?utf-8?B?Mk9yZ0ZnclZGeTl3ZHdjQUJMcU9Ecm5NRHgra0VKY3BzVjdXc2VyZ2Yxcmtp?=
 =?utf-8?B?Q1B3eDRBK1M4K2ViTFczRW9SQ3E5Kyt4ZFRraW01Nmd0UUJWVklKcnVKeExC?=
 =?utf-8?B?T1hQYXU3R0htNkFnTUZBSlNrYm1ERThDemwrWVBmS1dzSUwzbDhOaHM4TlFQ?=
 =?utf-8?B?SlF5aU9ITUNRS0NRcGM1Rzl5YjlLM242RllnS2I2dS9ZQmJET29XL0k2K1hy?=
 =?utf-8?B?aUM3QW1jdGRYZ0NlRThtazVHTEdCSGNWUHJPMnNUeUJvSGRGeUM0aXVFUVp6?=
 =?utf-8?B?Mm0yekp5TzRzdExkbHlPdEZtWmp4TU9KNzhneFRlK09lVTBCVU41eDdrU2t5?=
 =?utf-8?B?SXV5L3FubmtXQnZGZ3NHcEo0RG83VUlUSGt5c0RFbDJRdkFYaXMzbzBYa2h5?=
 =?utf-8?B?azdzWXkyS29jNDFrWHhsaHhyNUNES0w4bWNRQ29TY2pHSEN3V0h3Y1RXTFZj?=
 =?utf-8?B?VnZlZjdqUHJlU3dFby9RSW9vbCtTaG03V2JaLy9hdjVvYWRjVTB4YVI5RU9H?=
 =?utf-8?B?cUg5LzVSYU0rejhBL2J3N3Zia1BxeDRhcnJYT0d4UGR4N2lLKzdHZGN0SUtl?=
 =?utf-8?B?Y0RNTm93TzMwc1d6SjdzeVZwcjVBK01vN0pCMVhqbndtblAyT25aTHpCWmRN?=
 =?utf-8?B?STFCc2kvU0RPSzlORjV5eVBMOU9Xc3ZyakE3a0Y0Qm9EbWk0MEpqeVhDVnkx?=
 =?utf-8?B?K1pNdlRuYmYrc2o1eUFhc1h1eC9pb0JWYTJCekU5a3MzV1JERTZEOFFTZSsx?=
 =?utf-8?B?eEptelppQnVpUlFCTGJ1QjhYMWdaREFjQWE4MzNaRzU0OGYzUWhEd0pNNllz?=
 =?utf-8?B?cGhwcDVaWnlCazhlWUJ3aVArRjQvZDRtT1Z2cUFYUEZjbDc1TGdmbk5udW1P?=
 =?utf-8?B?a0pqdnZjTFN1VmJtQ1dnaXZ4MzVMdlhFaVFKSlE1Nkl5dDNYTzQzQWtBeGpX?=
 =?utf-8?B?OVZJbkxRVWRwUmdzd1Z3alEzdlhGdWlmOGpubXN3WDMvT2lwVkZQbHhNbk1r?=
 =?utf-8?B?SUhlajFaVVY4eEtDa0RSTmIxNmFVM3UrMWcwazVUcDgzM3haSkhsTXNMaTBR?=
 =?utf-8?B?M0JUaDB4SFVwTFVMWGg0R2E2VHU0dU5WS3JzTWw4NWR3Ykl4VHlOMllrenVE?=
 =?utf-8?Q?quGzwfjl0DvL+4EE=3D?=
X-OriginatorOrg: processmission.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde915ad-6521-4bd3-3d96-08df479c6a19
X-MS-Exchange-CrossTenant-AuthSource: KUXPR02MB9336.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 06:55:23.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0544bf7-9765-4630-ab69-0b266dc2169c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz4HH1gv5g3mM5+joCK5T4IOjUGUYI1BlLukBmCy/fSzYYnRe8xxkODpqIFOU1zI5L05qF7qEz1iPHXJfRN1xrWPNmTU2uiLmVe57eu+U3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6133

On Sat, 21 Nov 2026 00:05:36 +0800 Zixin Wang <w1355457260@gmail.com> wrote:

> Translate Documentation/core-api/irq/managed_irq.rst into Chinese
> and add it to the zh_CN irq toctree.
> 
> Update the translation through commit bb6a85b4b652
> ("Documentation: Add managed interrupts")
> 
> Co-developed-by: Chao Liu <chao.liu@processmission.com>
> Signed-off-by: Chao Liu <chao.liu@processmission.com>
> Signed-off-by: Zixin Wang <w1355457260@gmail.com>
> ---
> Thanks Zenghui for the review.
> 
> v1 -> v2:
>   - Use a Co-developed-by/Signed-off-by pair for Chao Liu and keep the
Thanks for updating the tags in the commit based on Zenghui Yu's suggestion.

Thanks,
Chao
>     author's Signed-off-by last, as suggested by Zenghui Yu.
>   - Reflow the translation to use the available width more evenly.
> 
> Testing:
>   make SPHINXDIRS="translations/zh_CN" htmldocs and checkpatch.pl pass.
> 
>  .../translations/zh_CN/core-api/irq/index.rst |   1 +
>  .../zh_CN/core-api/irq/managed_irq.rst        | 107 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/index.rst b/Documentation/translations/zh_CN/core-api/irq/index.rst
> index ba6acc4..7951d69 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/index.rst
> @@ -20,3 +20,4 @@ IRQs
>     irq-affinity
>     irq-domain
>     irqflags-tracing
> +   managed_irq
> diff --git a/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> new file mode 100644
> index 0000000..b1b7918
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> @@ -0,0 +1,107 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/irq/managed_irq.rst
> +
> +:翻译:
> +
> + Zixin Wang <w1355457260@gmail.com>
> +
> +.. _cn_managed_irq.rst:
> +
> +=============================
> +亲和性托管中断（managed IRQ）
> +=============================
> +
> +IRQ core 支持按指定 CPU 亲和性管理中断。正常运行时，每个中断关联到
> +某个特定的 CPU。如果该 CPU 离线，中断会被迁移到另一个在线 CPU。
> +
> +中断向量很多时，设备可能给可用的向量空间带来压力。例如，一块带 128 个
> +I/O 队列的 NVMe 设备，在至少有 128 个 CPU 的系统中，通常每个队列请求
> +一个中断。两个这样的设备就会请求 256 个中断。在 x86 上，中断向量空间
> +出了名地少：每个 CPU 只有 256 个向量，内核还要保留其中一部分，从而进一步
> +减少可供设备中断使用的数量。实际使用中通常没有问题，因为中断分散在许多
> +CPU 上，每个 CPU 只分到少量向量。
> +
> +然而在系统挂起时，所有次级 CPU 都会离线，所有中断都被迁移到唯一保持在线
> +的那个 CPU 上。这可能会耗尽该 CPU 上可用的中断向量，从而导致挂起操作失败。
> +
> +亲和性托管（affinity-managed）中断应对了这一限制。每个中断都分配一个
> +CPU 亲和性掩码，指定该中断可以定向到的 CPU 集合。当掩码中的某个 CPU 离线
> +时，中断会移到掩码中的下一个 CPU。如果掩码中的最后一个 CPU 也离线，那么
> +该中断会被关闭。使用亲和性托管中断的驱动程序必须确保，在中断被禁用之前
> +关联的队列已处于静默（quiesced）状态，以免再产生新的中断。当亲和性掩码
> +中的某个 CPU 重新上线时，中断会被重新使能。
> +
> +实现
> +----
> +
> +设备必须提供按实例划分的中断，例如 NVMe 等存储设备的按 I/O 队列中断。
> +驱动程序使用 struct irq_affinity 按所需的亲和性设置分配中断向量。对于
> +MSI-X 设备，需要设置 PCI_IRQ_AFFINITY 标志并调用
> +pci_alloc_irq_vectors_affinity() 来完成。
> +
> +IRQ core 会根据提供的亲和性信息，尽量在整个系统上均匀分散中断。亲和性
> +掩码在这一分配阶段计算，但最终的 IRQ 分配是在调用 request_irq() 时完成的。
> +
> +隔离 CPU
> +--------
> +
> +托管中断的亲和性完全由内核处理，无法通过 /proc 接口从用户空间修改。
> +isolcpus 启动选项的 managed_irq 子参数可指定一个 CPU 掩码，托管中断会
> +尽量避开这些 CPU。这种隔离是尽力而为的：只有当自动分配的掩码中也包含
> +被避开掩码之外的在线 CPU 时才会生效。如果请求的掩码只包含隔离 CPU，
> +该设置就没有任何效果。
> +
> +被避开掩码中的 CPU 仍属于该中断的亲和性掩码。也就是说，如果所有非隔离
> +CPU 都离线、而隔离 CPU 仍在线，中断就会被分配到某个隔离 CPU 上。
> +
> +以下示例假设系统有 8 个 CPU。
> +
> +- 使用 "-device virtio-scsi-pci" 启动一个 QEMU 实例。该 MSI-X 设备会
> +  暴露 11 个中断：3 个“管理”中断和 8 个“队列”中断。驱动程序请求这 8 个
> +  队列中断，每个中断恰好亲和到一个 CPU。如果该 CPU 离线，该中断就会被
> +  关闭。
> +
> +  假设中断 48 是其中一个队列中断，那么会看到::
> +
> +    /proc/irq/48/effective_affinity_list:7
> +    /proc/irq/48/smp_affinity_list:7
> +
> +  这表明该中断只由 CPU7 服务。关闭 CPU7 并不会把中断迁移到其他 CPU::
> +
> +    /proc/irq/48/effective_affinity_list:0
> +    /proc/irq/48/smp_affinity_list:7
> +
> +  可以通过 debugfs 接口 (/sys/kernel/debug/irq/irqs/48) 验证这一点。
> +  dstate 字段会包含 IRQD_IRQ_DISABLED、IRQD_IRQ_MASKED 和
> +  IRQD_MANAGED_SHUTDOWN。
> +
> +- 使用以下参数启动 QEMU 实例：
> +  "-device virtio-scsi-pci,num_queues=2"
> +  并在内核命令行中加入：
> +  "irqaffinity=0,1 isolcpus=domain,2-7 isolcpus=managed_irq,1-3,5-7"。
> +  该 MSI-X 设备会暴露 5 个中断：3 个管理中断和 2 个队列中断。管理中断
> +  遵循 irqaffinity= 设置。队列中断分散到可用的 CPU 上::
> +
> +    /proc/irq/47/effective_affinity_list:0
> +    /proc/irq/47/smp_affinity_list:0-3
> +    /proc/irq/48/effective_affinity_list:4
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  这两个队列中断被均匀分配。中断 48 落在 CPU4 上，因为 managed_irq
> +  掩码会尽可能避开 CPU 5-7。
> +
> +  将 managed_irq 参数换成
> +  "isolcpus=managed_irq,1-3,4-5,7" 后，结果是::
> +
> +    /proc/irq/48/effective_affinity_list:6
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  此时中断 48 由 CPU6 服务，因为系统避开了 CPU 4、5 和 7。如果 CPU6
> +  离线，中断会迁移到某个“隔离”CPU::
> +
> +    /proc/irq/48/effective_affinity_list:7
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  一旦其 smp_affinity 掩码中列出的所有 CPU 都离线，该中断就会被关闭。
> -- 
> 2.54.0
> 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
