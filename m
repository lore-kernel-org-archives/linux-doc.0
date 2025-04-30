Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E77BA4A
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 01:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975056; cv=fail; b=SAHcIWLbTdptv7nJ8l2qsehodYG4b123I/TMXj3UbGynYjvxC/jNXcalscSYf6hSVtU9QBbAFbhDZ+daA4YmkpWX/2En47EAzVO65TxgXIe7kQAu6AbWL+owwY9Z9IUapWADMHFrzJvl4wb+aTowI0rqkhiXOpSLuEDyMeWjne0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975056; c=relaxed/simple;
	bh=mA8PXIpLmnAQTWqm4AcZKz/07YS7Lb4uayIyVoi4GTg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=FsGtuyTceCr763uitED9VftX5r6Jn0iMMqdE5S8jBYpFpDN3J38GR4c0a6k0gW/h6ilGy6+iNqQ2iOmhUj8CjHscQZyHTtOiPaRiTbcVaUVc5jmoF/cJfdTDuRhOOH7QDjuWC4KFuihmoo1ezNORrnFfUTP7X43Hul+GlWKPbj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=FGnMTqox; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=He/DX1nO reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="FGnMTqox";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="He/DX1nO"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U0rhOQ017463;
	Tue, 29 Apr 2025 18:04:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=mA8PXIpLmnAQTWqm4AcZKz/07YS7Lb4uayIyVoi4GTg=; b=
	FGnMTqoxUQKLqPfGeeO5GopfzKbXpiHbOnT6uc8gw30OS2z0Kh+878EA+U2BchLZ
	YhJb/rLmi5QoGsAzYXEJSFNqARCX0EaXWujIzcLXU2Nm0rzSUsIe7PUu1YTfbLvy
	sw2+P07mNclh4/pchGxfOc/MlaD4MAD0Gqnwt3eG1fQy7WBz9ImyBcXRUAHaYOJ0
	T37Sj3VAaXMeWEBY/+KQJsdL6Nlv+yig59aLRgvf5g3xrb6oYPHafkXrEcv/23F+
	Y1BfDzNFhC26Ok5wuPL12zaGFQGiwIQUbZLzCC9Ps2stxV0vjYshbCH5Y8J1iiZ/
	J0gbqKCJiRikTXQh3Ajfjg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46b6tx02sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 18:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6DfR+LkQOVqz99t2wTEVQbN9uh/NtBFLKoVlLiYltrdPuWa0KaJrHmfhnzzZkWyRDNB/TuHDQMwdcMYN10W2GOdAMIV12sykyK9IlWscIeqUz3Npoon2xsW6+9BfmZuWBycnuPrZleoCi0b2GnSuuZznloUoueGDrJ2md5yU/12bxHKQYgdPnXANokK48K31oSciBSzFmrZsNbX39Ez/RNXXinloWhUy2KtjfigRWUm1e1YEVDIdqFSR+WnqiusDAyItzw1OkckNzdMjtCTZXZTCYUssPzMnUrnegY64bRBD1s+fmXc2MoPXzEi4moBiLLvImVwJ98T0/3CTkV6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKSIMbR8Be1k8rkJdKxjCrHKetFQ5hvthLUg7cXr/1Y=;
 b=yobcZy1wyfjTmhpGNDCp1LjP9BOJzSzn6JWBiQ5WrKE8PZThaPpPw0Bqp98nj+nWSJwtd0gAkERaZ5BWpB36Q/f+ghzLDBHjluu5O1twEeFnQx6lnJnZZcY7NhiSYlM3OsCu/So3RW17TWwr8nnyzx1F+pdu6GRkY6r5atuxAqz0MOAaXB9izlQYsmm/ugv2Qs85/rMKP8zr6qG3lmbjixFXS3Pen8pH78UzoMNOyv6YihnRLONMjNSbYB2Nb+UizJ5+p6AeVHisHc9w+2flz9QLDBr5jktKPhoUvv68jJdRd8kKLjpLPUJYky4lHRPpbeFv7o/RIMP7Gnb/NURYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKSIMbR8Be1k8rkJdKxjCrHKetFQ5hvthLUg7cXr/1Y=;
 b=He/DX1nOit9tAyJoCCOukNhhBNSxFzkwPY3DOTk+XkuQl25asLYN825jePw+SElsK3+ZQgzkUp+flB4Pkf8tJQVsAix84CIZ5AGKXzhI95VhnkhYgbSST34tUqmQ/9hPvKuKYy/LkAOglcCkxHGlypO/Vm3Qwl4EMXulIeoh4v9aJFCMoA+rhsgHQZZ5fSqmfe/ix4RhwnYoPqE19gkVCN3E6Os9g/mLr8AXlg/kDhVQdURz8rcnhNA6P4vhhVzqFk4Hl0Kp+7tmNm1aCRqYllBNw/kSR1oRtkjtqgwH+4wMoUHKsmL7VoTwQnbWyEFKN22bGHZggAPqm7nagD0wOA==
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::cb1) by PH8PR19MB6857.namprd19.prod.outlook.com
 (2603:10b6:510:1bd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:04:07 +0000
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::b5a8:7a73:b555:1e87]) by IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::b5a8:7a73:b555:1e87%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 01:04:06 +0000
From: Ming Wen <mwen@ambarella.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>, Long Li <longli@ambarella.com>,
        Jian Tang
	<jtang@ambarella.com>,
        Zhao-Yang Chen <zychen@ambarella.com>,
        Rongrong Cao
	<rrcao@ambarella.com>
Subject: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index: AQHbuWvFJWZwcp0JzUO8Fl7vHn7u7w==
Date: Wed, 30 Apr 2025 01:04:06 +0000
Message-ID:
 <IA0PPF7478C2D3AAC672B2561C5AB4A8E70DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References: <1745974429-4049-mlmmj-5496280d@vger.kernel.org>
In-Reply-To: <1745974429-4049-mlmmj-5496280d@vger.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF7478C2D3A:EE_|PH8PR19MB6857:EE_
x-ms-office365-filtering-correlation-id: 23ff9573-82bf-4b8b-3914-08dd8782e84d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZCtjV1l4enQ0T1Z5NS9KOWVWVUphanVReDZPbnI3Zkx2TTNveFJrM1phWTZW?=
 =?utf-8?B?aDBtajZrT0lscktYU2xuU3VydmVYMHVZa2tPU0ZaTXkzN3RibTFZWFdXZ29t?=
 =?utf-8?B?SU9ldFpuSGd3d0hGSDJ0QWt5L0RyanFkemNEL0V4Ti9Jb0Rwdm5TTzhWVzNx?=
 =?utf-8?B?NGFSM0lNUDMvNkRKMFRZZVBBd3ZFYUdKS0pMc2lzTEROYUk4Z3JxM2Vsd25C?=
 =?utf-8?B?TmtYNjBoVDdubGtObWJCTWJWRE9WVWtWcWdqa1dMY1dQd2c2NFRpbTBTaUNl?=
 =?utf-8?B?SzRtamFTTncvU0h2ZHFWK0srdlB4NHkzSWtDc0RCZUUrMjJRVitXYUUvdkFT?=
 =?utf-8?B?dmF1NkJlajZjOG55R2FDeDNQY29CYlUyN3JtSGJPYUpsYmtvanVlMFpCQTAv?=
 =?utf-8?B?NmJDRVdaZWdmelJ2RU8zdlYzKzU3WDFwRWVDYVZNOEZkM3FBWjBkTGl6Qy9v?=
 =?utf-8?B?NWhZQmdRZldEeEQzK1V3WW4yM2JNNU1EUnFtNEZlc29XazhxbTNlSHQ4NUFw?=
 =?utf-8?B?dWlRYmRhbGw0eklLN1BFS0xuMnd3Rld3U2Y1eWg2akVucEduTklFMXREeThP?=
 =?utf-8?B?ZHNYODM5TzJSVityV0lNblNpWjRlbXNqR2dqQjExUWRqcGtxaFNGY2R0OEZJ?=
 =?utf-8?B?MFMvY2l5RDEwYUNoZk81bThyY2dDTHAyeDZjMzM0NGxGZDQ0K2RSUDBmcjlt?=
 =?utf-8?B?eURJeit3Z2ltVHMrNGtRVndYa2FiTjR2b0FCV1lCZ1FyOXFybWpZR0JjdW9Q?=
 =?utf-8?B?UllRcTcrK3BWQlpVMjZmUElqVUUrcE8ycjJNOXpYL3JqODdwSGhHaGNkUXcr?=
 =?utf-8?B?SEVrd09rUzFBTW5pUDA1T3Z5UHdsc0dNcVdGRHM0bjhNTXVsK1Vpd3B4MTI3?=
 =?utf-8?B?ZmZVMEloTThNWFNQbEdaaWp3U0syZDc2Tm9rRWZqTUd1dUExdElrc0ZSVGIr?=
 =?utf-8?B?eE9waDFiNXpESUJUSWZDMlV3MjlXbE5ZbU03MlA4TXlnU1ZkZkMzVSt1bmZ3?=
 =?utf-8?B?RFY1TmIyWFF4d090QzFQcnZ1NVpUN1pmUW9nOC9HcHFDbW4zK2tFSXBwRGV2?=
 =?utf-8?B?OElIejVET3pKcUtLVXFjSnIrU3I3dlVGUGRmMGVjaGxqRWNueExkV25yTmlp?=
 =?utf-8?B?WEJxd2l0V3VPZjFXd25BckcyeGxFcEtGK3pMc29PRmRYYVZjYm9kcy9xaUw1?=
 =?utf-8?B?QWFaTVlxc2M5dzlRSkZlM0szckRNcVFlVmhBYXJBcVRUekh1K3RiZ25WOVVr?=
 =?utf-8?B?LzFJNDhWcktoeVFCckx1aWFXSUsraU9JME82ZUsxeXpPMkN4ZEhleEp6NGtk?=
 =?utf-8?B?bC9VZnBZTk00TGtDTHJ6Y2VObkE5L09lTkdHVTM1aDUvajZJZUI5dDUrS1FB?=
 =?utf-8?B?a2tITENRbmV4S0VPWmkxcVloWjFpRStFc0h0aTdjWXZ3L2tJNWZsbDdPK2Zl?=
 =?utf-8?B?eGh4ZVgrRC9mUFVXbVBlUk0ycUU5MmlCZ2V1ZXczUjVGelBqR3RZZjBNUDlO?=
 =?utf-8?B?cmdSRHRVSGlJYlpRck9JSGJyNEI0cWFXUnh5WFVwTnRnSlVoZTRWT0xhcmxM?=
 =?utf-8?B?S2tXd0RTYTZaK3hVNXlxa3dka0tKUFZXNTRwTSt6Q3M2ZVJmREZZME92dklV?=
 =?utf-8?B?S2d4U3pUQnFGY3NzNzR1VW1vQk4yUXM0aC8rdXp3Z2R4V1Nadkg5SXFOZ2hR?=
 =?utf-8?B?M050T3c4Z1JJZDl0T2grb0tIZnFJcm51OGdYcnpSTUNBVEx6Yi80R2o4ZDJ1?=
 =?utf-8?B?TmJmeUswMHBpaEZUTEhTT0U1aHUxdzViZkxkVVRDaGkvZWo3NDQ2QVYyV1h1?=
 =?utf-8?B?OXFhR1V4TmRlUlFnbUVSdHVPVDcxMWhPT0hhQjJUS0k3cittU0dvSXVvMHFY?=
 =?utf-8?B?Vk1YSUlTT2RjT1RHSjBZSURXVDlVUUZMbkxpK21OMHJUb1NVQit4cytoRTY3?=
 =?utf-8?Q?SYLzEUwHUnE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF7478C2D3A.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHdOa1lPQjVJMitvdnc4VmtJcGh0UU9kbjFBZEt6cjdNN01IS0FPYldEa01o?=
 =?utf-8?B?azVLU0VyWTROWHBoU2lDdkRlU2VNbmxMREw3MjV0eTBuWkZZZUpIUlNGM0Fu?=
 =?utf-8?B?VHhaY3FmTENoZ0Ivc2EzRk1yYis0a09nblFFVUxkR3ltY2VKRzd5L014Ung0?=
 =?utf-8?B?SnY4cU9ua2MzYklrMHhBbDFmNFBOVlRFTlBEWHNVV1dBRG4xaVpHdnJzaUtK?=
 =?utf-8?B?NkFGV1VmaUJZWUgxL01uc0xYblRDemhmV2ttZGl2OTYyY3VmVm1tSGxBSXhR?=
 =?utf-8?B?alRFc0FLN2NCVit1MDB0azB5RFJabkpKS2dPQkE3WjhJV29sbzUzVk5COGRS?=
 =?utf-8?B?blRrMGdFc3pSVjNOZm9zbHNDWXZzN0h3QStva3o2UEdsbHYvV3FYQ3NaRlJa?=
 =?utf-8?B?T2FNNjZ0Ly9IREljVUMrenZndi9HRTBwUlF0S1JOaElGR3ZZWTBXS2lkdGZi?=
 =?utf-8?B?TVNtcnp2UlpmV09QcW5EMTYzTDNzOUk2KzBYZjRNbzJsVkR0S2tFbFYvSjN2?=
 =?utf-8?B?RnVHU2h5TFdBYllOKzE0QWhyN0EyRlMybjlLVXdUdUo4Q2JTYTVNTUNoa0I2?=
 =?utf-8?B?K2V1bEVEaFZEV25mdnJYVkdzNE1sTkdycFoxSHhhWklOT1RWTHRaUE5XSUlB?=
 =?utf-8?B?RDlURFBIY1Jjc0UrTEx1cjNITEduRzRCd2hrVjVFNzRwODRWUHZoV3V2T2tp?=
 =?utf-8?B?NzFOTFZwQzZqUXpmQzdCNkdsU2tFQ1RRbE1XTWEzbW40SjJ2UnZuU01FNTBW?=
 =?utf-8?B?RlFUS085WkZyRFNXWk1TRzRBN2g2VCtPSUh6Sng3Z2Fkd3FpclM2VjdleDFU?=
 =?utf-8?B?TCs4SUtvU1lmM2E5MEVwTFpNZDZuaWVOb01HN1FNcmo3aGRvN0xvRVlsOFZo?=
 =?utf-8?B?TXltMms2UzhQcWxmMHBUSTV3UHdSWFBOZnY5eFhBYUxYdjcwTGJ5ZmxQV0tw?=
 =?utf-8?B?cVlNNno2UGxYWTNlZEFBUnJFenNoaU9iQklyQ1ZOMnBMNFY5d2xrUjg5V2tS?=
 =?utf-8?B?YngwdE1zOXdSRFE0VlVpRlh0NHlXVWE1U1VUQ2luMHNVM29jZm16QzVabWFR?=
 =?utf-8?B?VzFRVUtiT01URytGOFpHeEVYRFU0d1RKQ3crL0RRbExSZEtCSysvZWtRWEto?=
 =?utf-8?B?OUdWZC9BT2t3MGNHbVZFQjVPT1pVWXhvL0Y4S2E5ZG1LbDU2WFYvL0RjMmNr?=
 =?utf-8?B?ZlFmb0hDUC84Sit5MEx2a3ljY1NEYjVsR3JVWmF6Y1JNZ0E0ZUF5VkNSZHB5?=
 =?utf-8?B?bFJJaGhOMzZ5dm1nSG1qaFUxQWk3SWswNks1YWNGOTZCQVpSSkdRVG1NUjBG?=
 =?utf-8?B?NE84Rityd0lHcWxhQ3pyTGREWkF2MEhtNGdRc2JXS3NaUmI0RlJ2anJuelpM?=
 =?utf-8?B?Tjh1OXN0eEEyaGRyK2RrUEU5NGlwbDhTUTAzN1F3eHZhckNuai9NOU1LdDR0?=
 =?utf-8?B?Ukd5NmhpandxSURTYUtaN2RBc2VFTWFySDcyb1BmWFdDZU5aeUdiZ1k1QUJq?=
 =?utf-8?B?QTJXSVNzWnhSQ2p4bjJCNFBVUUtVUXBvZnFRYnh4VEJ3TnhaRElRYlBVeWtl?=
 =?utf-8?B?NDk2Qlg5U3daYWFITHFnSUJkdGRQVEVmMVZBcFNUUnVLTEs4MUdQbnpzWW5G?=
 =?utf-8?B?N0dpS29UY0gvOTFLTUhpZHdpdFBEYk9tNENKMnRzaHRqdWtmNnhKTlpVZFpS?=
 =?utf-8?B?U0IvYmlucWxPTTBsa3V5Z0F0ZDBMMGdvOXY5VmpydDhITzE2LzJ6Rk5ZYWh2?=
 =?utf-8?B?eHVWM2ttQnc2OXVIY2hiU0dSdmJCNEorRWdPS2RnR1lHMUxkYWhhZTVWN2F2?=
 =?utf-8?B?c0Nrdk9SaHk4OVJJT29QbU45MVpsRjYvTHM3SXcwY3JINVVWUG9OTklBWHJ0?=
 =?utf-8?B?TzVCVlZTcGNOVlFhenppV0FhQjR2L1JwS1JubmRUKzlFK0Fnc0srenNxRlM3?=
 =?utf-8?B?WkZzTU5ENmgvQ0RkZ3VHMS8yU3V4ZmJaYlFSeXhPU0xwT3hSMEhRR0lhSGUw?=
 =?utf-8?B?NWxJMHpmRW44N3E3VlRUM2ZqM1JjZ0FTcTRZeXY2TG9tUTZmdkhHZmw4dVox?=
 =?utf-8?B?QXVmc1hHVXNXaDV6L3k4RjNLT0d3V0d0NEt3cUhQZFVqckJZaHRNWjVUZXoy?=
 =?utf-8?Q?pho4RtaV56vBgGvjkT5lyEWrN?=
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ambarella.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF7478C2D3A.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ff9573-82bf-4b8b-3914-08dd8782e84d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 01:04:06.9191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wKTEnLnIk6wOYow8bTi0Ii6kcZdqHIirkTM3EEXP6icV+v+efXf/7kyQzeijTK+1SHt5iDVwjm8sFz2Bnxo27w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6857
X-Proofpoint-ORIG-GUID: ZIqNa1cEKgKszB0WrHTPBLudLo9QDyPE
X-Authority-Analysis: v=2.4 cv=JdW8rVKV c=1 sm=1 tr=0 ts=6811770b cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=dkMdDuzY2HgA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=MPCseJ7k8T3AYHG5fDEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZIqNa1cEKgKszB0WrHTPBLudLo9QDyPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAwNSBTYWx0ZWRfX++7YjeDv8a0y vm/gp4alzYnkaLD/S0ygwU4YBMLxYJayf9yZyhRmImQS4ORyPdL2TvsyWu/dTZX8kxP63YEXNhn EW/IF9SmH+Sd1AEVh6blaWT01jaXcELf1AltHyLvcETjxGcPGijJyWx5lAhGiGgXfp44Q4I0ypG
 +xuyA9dKbpPmWzZzOd/QoOVAZQ766afGIITGrJw70vPdhI/iGm0P+N3rHEIb1hmUaT0rVbbhfz6 yra+e9TdybpKqtAcoaN0Q/FLhZzHe/nUEbWbe61WNQ3CO/PYgrglOoVeoS56nqrpwtGHwPTm5C3 w3jGIDlM/+o3Vqx++seKUwEtSxXbj80URS7zeqzjv7mt1/bScBSEJ7+1dUY9se0gvPh2uD+ITxE
 yDuvVrumk/MY0hG1wvh4noCWH5wMeKQhhLwXnPcsD7PY9cavtg3BULioqAc3IwFY8cgWrARm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=973 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300005
Content-Type: text/plain; charset="utf-8"

RGVhciBMaW51eCBEb2PigJllcnM6DQogDQpOaWNlIHRvIGUtbWVldCB5b3UhIEFuZCB0aGFua3Mg
Zm9yIHlvdXIgZ3JlYXQgY29udHJpYnV0aW9uIHRvIExpbnV4IEtlcm5lbCB3b3JsZCBhcyBhbHdh
eXMuIPCfmIoNCg0KV2XigJlyZSBub3cgd29ya2luZyBvbiBMVFMgS2VybmVsIDUuMTUgYW5kIDYu
MS4gUmVjZW50bHksIHdl4oCZcmUgdHJ5aW5nIHRvIGJ1aWxkIHRoZWlyIFNwaGlueCBEb2MuDQpJ
dCBpcyByZXF1aXJlZCB0byBnbyB3aXRoIFNwaGlueCAyLjQuNCwgd2hpY2ggaXMgbXVjaCBsb3dl
ciB0aGFuIHRoZSB2ZXJzaW9uKDguMS4zKSBvZiB1YnVudHUgMjIuMDQgYW5kIDI0LjA0Lg0KUFM6
IGlmIGdvaW5nIHdpdGggdmVyeSBuZXcgdmVyc2lvbiBvZiBTcGhpbnggbGlrZSA4LjEuMywgdGhl
IGZpbmFsIG91dHB1dCBpcyBub3QgcmlnaHQoZG9lc27igJl0IGhhdmUgdGhlIHByb3BlciBkZWNv
cmF0aW9uKS4NCg0KJCBjYXQgRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1lbnRzLnR4dA0K
IyBqaW5qYTI+PTMuMSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIFNwaGlueDw0LjANCmppbmphMjwz
LjENCnNwaGlueF9ydGRfdGhlbWUNClNwaGlueD09Mi40LjQNCg0KVG8gdHJ5IHRvIHJlc29sdmUg
dGhpcywgd2UgZm9sbG93ZWQgYmVsb3cgd2F5IHRvIGJ1aWxkIGtlcm5lbCBTcGhpbnggRG9jIGJ5
IGhhdmluZyBTcGhpbnggdG8gc3RheSB3aXRoIDIuNC40LiBIb3dldmVyLCBpdCB3aWxsIHJlcXVp
cmUgZXh0cmEgZGVwZW5kZW5jeSBwYWNrYWdlcyhsaXN0ZWQgaW4gYmVsb3cgZGlmZikgYmVmb3Jl
IHdlIGNhbiBidWlsZCB0aGUgZG9jIHByb3Blcmx5Lg0KSGVyZSwgd2XigJlkIGxpa2UgdG8gY2hl
Y2sgd2l0aCB5b3VyIGNvbW1lbnRzIGZvciB3aGV0aGVyIGl0IHdpbGwgYmUgZ29vZCB0byBtZXJn
ZSBpdCBpbnRvIHRoZSBtYWluIGJyYW5jaCBmb3IgS2VybmVsIDUuMTUgYW5kIDYuMS4gSWYgbm90
LCBkbyB5b3UgaGF2ZSBhbnkgY29uY2VybiBvbiB0aGlzPyBPciB5b3UgaGF2ZSBvdGhlciBiZXR0
ZXIgb3B0aW9ucy9hZHZpY2VzIGZvciB1cyB0byB0cnk/IFRoYW5rcyBhZ2FpbiBmb3IgeW91ciB0
aW1lLg0KDQokIC91c3IvYmluL3B5dGhvbjMgLW0gdmVudiBzcGhpbnhfMi40LjQNCiQgLiBzcGhp
bnhfMi40LjQvYmluL2FjdGl2YXRlDQokIHBpcCBpbnN0YWxsIC1yIC4vRG9jdW1lbnRhdGlvbi9z
cGhpbngvcmVxdWlyZW1lbnRzLnR4dA0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzUw
MDQ1YWZmLTkxZjktNDgwOS1iYTNlLWI3MjJiMzI1ZDIzM0BvcmFjbGUuY29tL1QvDQpodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjI2MDkzODU0LjQ3ODMwLTEtbHVrYXMuYnVsd2Fo
bkBnbWFpbC5jb20vVC8NCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc3BoaW54L3JlcXVp
cmVtZW50cy50eHQgYi9Eb2N1bWVudGF0aW9uL3NwaGlueC9yZXF1aXJlbWVudHMudHh0DQppbmRl
eCAyYzU3MzU0MWFiNzEyLi42ZTdlZDY0MTc0N2Y3IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlv
bi9zcGhpbngvcmVxdWlyZW1lbnRzLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVx
dWlyZW1lbnRzLnR4dA0KQEAgLTEsNCArMSwxMCBAQA0KIyBqaW5qYTI+PTMuMSBpcyBub3QgY29t
cGF0aWJsZSB3aXRoIFNwaGlueDw0LjANCmppbmphMjwzLjENCnNwaGlueF9ydGRfdGhlbWUNCith
bGFiYXN0ZXI8MC43LjE0DQorc3BoaW54Y29udHJpYi1hcHBsZWhlbHA9PTEuMC40DQorc3BoaW54
Y29udHJpYi1kZXZoZWxwPT0xLjAuMg0KK3NwaGlueGNvbnRyaWItaHRtbGhlbHA9PTIuMC4xDQor
c3BoaW54Y29udHJpYi1xdGhlbHA9PTEuMC4zDQorc3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0
bWw9PTEuMS41DQpTcGhpbng9PTIuNC40DQrCoA0KQmVzdCBSZWdhcmRzIQ0KTWluZyBXZW4gKOmX
u+aYjikNCkFtYmFyZWxsYSBTaGFuZ2hhaQ0KCioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKVGhpcyBlbWFpbCBhbmQg
YXR0YWNobWVudHMgY29udGFpbiBBbWJhcmVsbGEgUHJvcHJpZXRhcnkgYW5kL29yIENvbmZpZGVu
dGlhbCBJbmZvcm1hdGlvbiBhbmQgaXMgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRo
ZSBpbmRpdmlkdWFsKHMpIHRvIHdob20gaXQgaXMgYWRkcmVzc2VkLiBBbnkgdW5hdXRob3JpemVk
IHJldmlldywgdXNlLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRlLCBjb3B5LCBvciBwcmludCBpcyBw
cm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBj
b250YWN0IHRoZSBzZW5kZXIgYnkgcmVwbHkgZW1haWwgYW5kIGRlc3Ryb3kgYWxsIGNvcGllcyBv
ZiB0aGUgb3JpZ2luYWwgbWVzc2FnZS4gVGhhbmsgeW91Lgo=
