Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BAC4B1E7A
	for <linux-doc@vger.kernel.org>; Thu,  8 May 2025 03:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746675852; cv=fail; b=FyHNY2fVnUhgTqPxgucV72191tw4IH5SGU6XyEfTBIIGqzDilIXGC/oqcnpye5p/A4I+r3D/2PBgiNFVLDfn1q8CR/M833LJ7sB+Y7ZeDicQjGV2yhFiGyTF7BFac7g+2DIUJIlbHc+2dZ7mGfO1y+RTZpO7uWtb2bM/kPIPI5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746675852; c=relaxed/simple;
	bh=kzQtlJ/ruypaBMMEgPuCuAYxkW0cHTgGu2uq5aDw5fg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=ibOdZ0EomZQ1c2bt8bBiP/GIpwUjaah1C5yvMAcSG4YjRvU/c8qYIP0XP4PMMckX/5+tGi56S2KLy1ou9a16yCRj4MFQ57oUyIfq75fg7AAzJ/gEsi7xTYoZRDOx1x96R2n/Mus6P7jw/RlYscym4od4HLjhjAjV5EUeQP4UreY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=Yom3wPr9; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=S8n675iw reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="Yom3wPr9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="S8n675iw"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5482jPoO005244;
	Wed, 7 May 2025 20:44:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=kzQtlJ/ruypaBMMEgPuCuAYxkW0cHTgGu2uq5aDw5fg=; b=
	Yom3wPr98J25mJRrypPhj3qXaGkWguVh9KoM7EfanwhhZC+9JvEmuYAohJ8kO1Ed
	cYYo2pfEMQlbxoM4T2+OKt0s5PCy8ihYcx43YfNjKK4mO/+RRvrr8Z3fopIoSFCn
	3bK1ez1hZ1ZKwFHXRrAW2whckcK8+aagN7322zfYT8EmS77KxXfN5pDkrpGr1tcy
	oO93Qpj/0V0rDTPcisQ9//WsBtG0MPuQllaghi1vpLm8/QjHf8fjt9uQ3ozn77g5
	XM7RhPRDyjSNy++PShIskhV8XufvkecxERyHTydxBFnNf+yQmNnz4evrcTBejSIe
	xkJzterLpN59Ixl6cciFVQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46dg4ejunb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 20:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnl54Omi0ytfabGYNPq6LF9aYeVHvfJO2xQoilzrgbyiY9GaTZ090XfzB7N+ATn0hGicZtxZTdpXCeP7ZL26e3FHaUvcug5v0VSilIu6g79Fm8e23WJSYFSNU2BFrY0Q4Y7JdQP1YT5Q17xwA9FxYFe9pmzw4/dEkBEUo69iDbZx0XpDZIRqFAPonsjhGc/vRgYxmz8UX0EjRX+Jzydip5oiVPQ9NhbSgGoTaD8oOVFEaXt8O6IGJ2O/QX0990P8nQ82gRSIZHLXKdelDPplMepqun6e5jHZVejt/OPeyNrHZwYF1lcNHw3TdKk60BBlZU3jeUQQhrE9EDV8Y6XOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0DaQQ7E0l8Cbo3xcAUDAkjd/iJCSrYSK5se48GXgnQ=;
 b=FCeusoWeeOISSxI96WYCg4+/8TphPCp1qAp/CGL0jLv+US67I07Y3DonFh6U5jwZe9nx2OESrXWEVgSxjTJMBSw+8gxOnI+HYV9imemgRRuDsgy+17aTk2KEgRrlsrj/ACdoHWilR1/t6ibSHjvm7mSpJ2rseQcnOuxuweFIMwYEol80fgatBLTi2HeT7LW4RFhn/kxjtsqPSwn9RBQfCfUuuvH2YnlRSD7NDk35YIe3YoS8vwD3Z7k3HzPWtW4E8aGrf128c9AFJwJOBFd8Tm/E8Q8O94SBBl6R9HzIv1ILqlUmF12rcTC2fTkJ4uJcPLxADiv3kMp1N9T2ourS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0DaQQ7E0l8Cbo3xcAUDAkjd/iJCSrYSK5se48GXgnQ=;
 b=S8n675iwkA4A/hkQh6dpEE2aSoot7UPfq4gRq8PU2dXaVqtW9RsA9k6+jltoW+5FqW/njn997P79y2hsBMj7qpP1Vk/XLr2Si+pxqlwg3ipqJ8+Tb2CdNgSsm2wqDbPEsWhXpvFBPCBSuHTCHJM6DVsnqNg0vXSPAs7/aLtwisTLwwMAUqUQeuFnKtmGqFxtX/7oFG9PzeKpYH38CpGk1TD/gBrHNRP3gynx3ou30uKJxdx/fvtfRQuRU8FWVa0BmouNJ43XgtaK2vNLc4K8Rl4eZHyDV8qowMyz+xk5TDeKNR8/EJg9um4WRX2DTLkkC5QSfJEdxb0uIIIWkeF4dQ==
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::cb1) by IA0PR19MB8073.namprd19.prod.outlook.com
 (2603:10b6:208:48d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 03:43:58 +0000
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e]) by IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 03:43:58 +0000
From: Ming Wen <mwen@ambarella.com>
To: Jonathan Corbet <corbet@lwn.net>, Rongrong Cao <rrcao@ambarella.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index:
 Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wAAAQ6JgAACKvLAASRQeqAAMU+ZoAAFtwHQAA8FsYAAD/yBwA==
Importance: low
X-Priority: 5
Date: Thu, 8 May 2025 03:43:58 +0000
Message-ID:
 <IA0PPF7478C2D3A61CF560B044EBB70A336DD8BA@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87v7qctcha.fsf@trenco.lwn.net>
In-Reply-To: <87v7qctcha.fsf@trenco.lwn.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF7478C2D3A:EE_|IA0PR19MB8073:EE_
x-ms-office365-filtering-correlation-id: ddee8054-59d9-4e2e-094f-08dd8de290d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VXJhUUNxWEMwdkhUUDJtUkNHNTQ5ZU5uakE1WTNucG8zaGZqRFAvOXBBbUhs?=
 =?utf-8?B?M29sb2lTQzZleFRWaHpOMU5rcnhsMGswdE9aTmplUXpYSEhnUnlENnJTMENH?=
 =?utf-8?B?N0xkRlAzYWthR2NTaDZ5ZSt2MDFmaTA4Rkc0U2gxd3ZBcVNnL20wMGNiYjdp?=
 =?utf-8?B?NXJ1UStFTTJuTjJjYjRWc0RVM3crTVdvTVBreWxDRDc3UjRkd2w5MGRXbXFB?=
 =?utf-8?B?Y0JydTRnWldKaDkvS3h4SXAxQlJmdDZ4YjIyRlJoYm1yT0Y3RXdIVW4rMURR?=
 =?utf-8?B?djRpSjQyN2czMzE5MkZBNUZhM0loL01rQ29ncW5KeEtzUC9hOFVrcUlKaFE2?=
 =?utf-8?B?VDJWVHFudk9hckpjdkRxdlhVbGJrazJRRkhqZHBoRHBjaUlxQm9uNnFycXhv?=
 =?utf-8?B?K0tEY2RxWHE1N0E0THp6ZTdUai90OVdHczNjazdHZXVCVUQ0MVVFUG9tZGpU?=
 =?utf-8?B?K2tEU0hBYURqMDg4VUZuRUNuNzg2KzRDUmIxZTZnUXhVd1d6RVVOcHVNK0tr?=
 =?utf-8?B?ZEZha0NTakQ5eEh3V0NYTkhjVG93VkZRdU1ESlNtTW02RjRxeGQxRWhjd2Y4?=
 =?utf-8?B?TGVUcjU0bUsxY1F0dUVPWURrL3VPaUxGUkxVMlR0UXVsS25VQ2MrVWxMOTFP?=
 =?utf-8?B?bGF0L1IwU08xV0JERDM3SERrOEQ4MHJSWWtKNXdwT1F1UElxRk0rZkU4bWRI?=
 =?utf-8?B?a0xBVXhDL0lOUGVoUENQVmtyeUhTMkQxcUtoY0dyOXdaOGhlckhMR0VIRloz?=
 =?utf-8?B?Zm1nbDl3ZHk0TnptWTBLSWJTYkFSSDA1VTR3K3BicmcwWEErcWxzYjZuQTda?=
 =?utf-8?B?d2JJQk5JaVpQNnhUdnJyQzFsTXZaY2xRbTVDWHFpTjB4V0VyK2FVUjdkY0hV?=
 =?utf-8?B?YjRTcCtoU045NzhSU3M2OGxDYWY1NEZCbUVHTWVzMFg4MHdmWmc3MmF2di9S?=
 =?utf-8?B?VENaVmlQU3RUMkRkekR6UXFOVTg5b3BLRmFwUjg4N3pNT1hxQlkxVU4vWkp1?=
 =?utf-8?B?ZDAzZnBWbzg2K0R2aUxCNElBdGgyNG5MVm4zWFh2emp2d3M3a2RVSGM0Z1RV?=
 =?utf-8?B?WnNRUzZqNC9WeE5wWW4vaEVzaFdKbGg2R2RWYWM3aWlYTUJsaTg0enhEOVVR?=
 =?utf-8?B?SEtHNStlbVRUcE9rbmpmMklVcUVQY2FZMHFDd1d5RVU1V0tTcUVHOGJCbENm?=
 =?utf-8?B?YzJQaVpHZDc0dHFEMHpjbXgyc3dNMlZId2hVRVZzSGxLT00wZnEyUEF4bVlR?=
 =?utf-8?B?NTZ2T2IvWGtjTytBT2krRGdhTktxN08yRVpLeTdiMzBEM0lQWjJ4TkhiMCtX?=
 =?utf-8?B?MVN4MU5NNXF6bUxESGMyTXJwWU15Ky8waDRyUER2bnUzUUlTTVpVTVJ3WlBV?=
 =?utf-8?B?Zmt3VUJwY0d3WnRuMHdhYTZEdE9iN3hyOE5zdnlpOHBJd1NBOG9ady9nVXhV?=
 =?utf-8?B?Q0xTMEhmdG43NkhyWWd5MFZHbGRtYVZOWFBXRjhoY3YzZjVzUnhSQmhnMGZR?=
 =?utf-8?B?ZWIxZWFjeUJUek0rWTdrb1Q2MnRGTmJGcWxjRE1CVGxnNExodExrZ25KVHRu?=
 =?utf-8?B?cVAxclI1NTNVbC8wZ21jSmNNTlVoOHZMc1dmc2Z2eWtGam1wY2xTZlFwK3dI?=
 =?utf-8?B?N25lZHJQakF0aFBEdWxHZUdGRWY4UlY4Z2lrSXlLTUwzZk5tSGV2OFJzVEQ1?=
 =?utf-8?B?OHpqMGEzZEM0M1lwaGwwaDNWSy95TGJ0QzcrNnVBN0l6eTg5Q3JVQmdTVmFM?=
 =?utf-8?B?RTFpQkMyZWF3RHJSL1RHTjhnZ28rVGtzYWdCc3JVU2JkQmIxNkZBVlVZRGJU?=
 =?utf-8?B?T0VDVjhFR0NBZEVETmRDVjdTbVZwK3VzR2trTlFhYlVCZ3kzaFlGN1dXSjZN?=
 =?utf-8?B?RkpWeERJQnhHUVNLMEw3U01yNFROMVEva2lpbkRGL2NEK2dZL2srTG9VOWhR?=
 =?utf-8?B?eWhHU084NE5iRGt2Nkpxays3ZTJDVE9JQlVUSWExYW5oaGMyZ2NnNU92STU4?=
 =?utf-8?Q?z4xNVVazi4VsKg/nEJZ+YbqJLeOSWU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF7478C2D3A.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzVDSWZ4dlBmZ1NiQjNXWVNhL2pTQlUzQjh3WE50TUZSM1psVThSNUpRNTF2?=
 =?utf-8?B?SHRidjVPNVp6d2xuTTlKRktBSXBmOVUraktXbzVMOHByUEhkbktzbDRDNjR1?=
 =?utf-8?B?WkdUa0wrODBsaVlXVmxhLzdkaFluN09ZeElVclNFSWZtS0dnUWlqVEZYTDJt?=
 =?utf-8?B?OThZcVRLSktFVUU5RGU3M1hTa0tLaGZETUpBdkd3UW53aHMvVWR4WGJZa2pQ?=
 =?utf-8?B?THh2ZDhhVTR4RHVDTGlMTTVVSDBpRzdtck9EUkdmY2N6cXpVNFliSWdKOENz?=
 =?utf-8?B?U2dtZmIzaXFObHJsQW1UOUV2UlhIZ1J6WHRIRFZJenhrVTFjckZaZ0h1cnM3?=
 =?utf-8?B?ODdNRVJIY25xV21uUmpQRExXU2EvQzJJeE5CbGFrKzBWZ29ZSC9rREhaNlZn?=
 =?utf-8?B?RHlHOVRMVEducW9RU1kxbE1zdGx6eTk2ZjQyVzRJeXVnZ2VESWtHRWZIbG5W?=
 =?utf-8?B?MUZIWTd1QTA0dVVUTFl6c1ZrMFNwQzd0bDV4SUlVbUVwUllEb0lUM1RLaDZq?=
 =?utf-8?B?aVM2UFZXWDJhTnNBSFg2N2FlYlVEVFhLazBXSmtLaDZxSk1VYnVlMVVsV2hD?=
 =?utf-8?B?U0ZwamhKelkxZGltSnAzcURPWi9qTW5lSThGaWtKSGh6KzE4aDVtbkF2R3kz?=
 =?utf-8?B?bXZGcVpNWEJpaDdkdERFZC9hb1NoMmI1Um80OVEwYlFCQmhIczByblkwRnlt?=
 =?utf-8?B?QjRSa1dFU1hVTzFKa0oyTVZsVzBySzViU3VVQUtLamF4bHBMalk4Q2U1UmU5?=
 =?utf-8?B?ZmZNOUpWVWlBdUR6Q1h4TlNhYlB2Mm9GRTYxWmw1b2hPRjkraXJPZVpLWXdZ?=
 =?utf-8?B?UzNKWmQ1ZWlQZmFmSE9HZHpJK3daLzlJNHZpMjFza0oyWDlhY25RQk41d21n?=
 =?utf-8?B?MU9vVEgvRm5aR2d2SEVnd29NVjFqaHd3OVp5YmhKVkZwbGxteDBpYmdBM0lN?=
 =?utf-8?B?WkFqYzd2UUd0RzFJaEdnT216TGp4R3VMT2FaWUUxWUs5ZEFaV3d4TGhTWUhx?=
 =?utf-8?B?U1Qrc3lKNHkzQnJLekVNVmVwTDZPM1ZMYVNJbm9zUDgwMG5hS2RzSXg4V2xk?=
 =?utf-8?B?UlJHNWFWRXE5dldyTUQ5YmxrbitnenVVQkJBVDV1S2NFQkRKV1BlN0cxRllE?=
 =?utf-8?B?UStLM3dPS0xaYUxzelp5RUpnMFM4Ty9XandoSy84TXRuRDhZdGp1MVF2QXB6?=
 =?utf-8?B?ZHIrbnArS0YramkyNnZwNU9sR2RLRnY3akZBUE9aRWF2UnZJZzdkR2QyRFgx?=
 =?utf-8?B?NzNkMHpEcC85c2t5VFNLWmx4NTdVVEtQZXYrVllOc0FzNTk2cDRWNEpIejk5?=
 =?utf-8?B?a2tGQU1FVDBRL0JNWVN5SEkzUHN6RUp1a01FK2c2SGpIS0x4MEVuSE9FbXdS?=
 =?utf-8?B?TzJvdXZpdmlxYVU0ejErTDFiekZJcTZ3eGZEL1U3RUd6K3lyc3hlNi9JY0tL?=
 =?utf-8?B?WWtEbUtqS0pLZFhvZHJPQVkrYnlxOCtHeGVaUGxiNXVyc09iVmo4a1AwOVYr?=
 =?utf-8?B?LzBWWGFXZlFualRMRDBNNTFFS0dXVUM2UEk5eVk0ZUJGbm52d0w4aVdjUmpW?=
 =?utf-8?B?Ukl1R0N4ZjN5R1RrZE55WlIrTEl3WVY5d1hRekQ1dU5pc0hkMm4wYUxTWG9B?=
 =?utf-8?B?YkUxc29DK3BaRHBHVEJSVGM2Zm9VZ3Z1Q0lFZG5iNldlWkFEWVdXQlNCdDZ5?=
 =?utf-8?B?STY4Qk9RbmdJZlhNd242dE02Q1VCMVJTZ2RZOVFDK2tkSnI4TXdwelpWUWd2?=
 =?utf-8?B?OGFyU0hFNVk3UTdiREozWkVBRDVkSlovMStOTUl0ejRUTjhzL3NqZU9rTWxY?=
 =?utf-8?B?S0kwOFZiN1R5R3c5RDZ2UXRYc05yWW1PaGdDRjA5VkluQ2NRb2RKQlB3VEtP?=
 =?utf-8?B?MUY1TysrcnVrYVJ5ZzFHK1BWRnU0S29Ca05lNjJ4MjdPaXlPYWJYNURhQ2tI?=
 =?utf-8?B?SFd5dHRaN1lnVHgxZXBvb1F4Ums1OWNVMTQyVnBmblp2dlB6UnZKSTVzMS9l?=
 =?utf-8?B?ajRGMmxuOHV1Uk1PR0V2SW5aL25GSCthcGNvT1JQVk83NllleTBrTnNJRWpE?=
 =?utf-8?B?MGpKUXhwY3VuWGw1TXpyOXREMUJOV1B3MnpmR0F2b0NkZGwxQkxkbTRFMVVs?=
 =?utf-8?Q?lKKQPO8+oDtxWaUymHKd2Jdzp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ddee8054-59d9-4e2e-094f-08dd8de290d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 03:43:58.8270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ucZ+treZvqumwnM1IiE5BbFJHWghOQaWA31zDFd6TeYVL2Bta9sHc1h5+ivdRI0OqFtriAWW5j8hcUgJwIqf2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB8073
X-Authority-Analysis: v=2.4 cv=SsWQ6OO0 c=1 sm=1 tr=0 ts=681c2886 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=dkMdDuzY2HgA:10 a=07d9gI8wAAAA:8 a=ppJngBeKAAAA:8 a=VwQbUJbxAAAA:8 a=9DlbS4gFnpfa1lrHZ1wA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: 95X1QNol4dT16ZZ2GZsHk5KBaOpECj9n
X-Proofpoint-ORIG-GUID: 95X1QNol4dT16ZZ2GZsHk5KBaOpECj9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAzMiBTYWx0ZWRfX8dbI4elvWL9E iwvvwK7Q66KPSmtu0jYHKAQGzZeeQyzr2dumgqC3CWMmy11t9n0ZDF3nByxoBaVdefEKyBZ2rGT bajZqcgZlDAXLghPp/zo5qL0a0HTr7liIzrQJSvykN5LZ8mL1Sf16ydHegz/VUS1nTP51iUmS14
 tZRoyTl8gMcJMmb+f2vESVPxZIgypbDnpEkWeDj+wpc2eRLL8D8vuInd4EUP28syOinHAghxSpa bhvaA5TqGTya0my7vcqC7AB47IKrGQTwVjuQ1JSXdbQor4IpEe01YhHp/MV/ELGkvXXVQKAl9t7 6e4Gs0OWZzZbElfN4yLVxj5em5jQGRdie90g7UEHNk4EPZsFEztMqoiSMr7XgsKB0dsI37KlRno
 skDr09IpNKELgTYbPR4V2RyX5o+16zmo1xR1N1KBmuTdmH8WjRxMluIDHvfJcCLOK3vJ6uBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=960 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2504070000 definitions=main-2505080032
Content-Type: text/plain; charset="utf-8"

SGkgSm9uOg0KwqANClNvdW5kcyBnb29kLiBUYWtlIHlvdXIgdGltZX5+DQpLZWVwIHVzIHBvc3Rl
ZCBpZiB5b3UgaGF2ZSBhIGNoYW5jZSB0byBtb3ZlIGFoZWFkIGEgYml0IG9uIHlvdXIgcm9hZC4g
8J+Yig0KwqANCkJlc3QgUmVnYXJkcyENCk1pbmcgV2VuICjpl7vmmI4pDQpTREsgVGVhbSB8IEFt
YmFyZWxsYSBTaGFuZ2hhaQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBK
b25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PiANClNlbnQ6IFRodXJzZGF5LCBNYXkgOCwg
MjAyNSA0OjAzIEFNDQpUbzogTWluZyBXZW4gPG13ZW5AYW1iYXJlbGxhLmNvbT47IFJvbmdyb25n
IENhbyA8cnJjYW9AYW1iYXJlbGxhLmNvbT47IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCkNj
OiBtY2hlaGFiQGtlcm5lbC5vcmc7IExvbmcgTGkgPGxvbmdsaUBhbWJhcmVsbGEuY29tPjsgSmlh
biBUYW5nIDxqdGFuZ0BhbWJhcmVsbGEuY29tPjsgWmhhby1ZYW5nIENoZW4gPHp5Y2hlbkBhbWJh
cmVsbGEuY29tPg0KU3ViamVjdDogUkU6IFtFWFRdIFJlOiBbS2VybmVsIDUuMTUvS2VybmxlIDYu
MV0gQWJvdXQgU3BoaW54IERvYy4NCg0KTWluZyBXZW4gPG13ZW5AYW1iYXJlbGxhLmNvbT4gd3Jp
dGVzOg0KDQo+IEhpIFJvbmdyb25nOg0KPiDCoA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUuIEdv
b2QgdG8ga25vdyENCj4gQXMgdGhlIG5leHQsIEpvbiBtYXkgaGVscCB0byBjaGVjayBhIGJpdCB3
aHkgdGhpcyBjaGFuZ2VsaXN0IGlzIG1pc3NlZCANCj4gdG8gYmUgbWVyZ2VkIGludG8gTFRTIEtl
cm5lbCA1LjE1IGFuZCBldmVuIExUUyBLZXJuZWwgNi4xLiBJdCBzaG91bGQgDQo+IGRlZmluaXRl
bHkgYmUgbmVlZGVkLvCfmIoNCg0KVGhlIHN0YWJsZSBtYWludGFpbmVycyBuZWVkIHRvIGJlIHRv
bGQgdG8gYXBwbHkgYSBwYXRjaCBsaWtlIHRoaXMsIGFuZCBub2JvZHkgZGlkIHRoYXQuICBJIHdp
bGwgdHJ5IHRvIGhhdmUgYSBsb29rIGluIHRoZSBuZWFyIGZ1dHVyZSB0byBkZWNpZGUgd2hldGhl
ciB0aGF0IHNob3VsZCBiZSBkb25lIGluIHRoaXMgY2FzZS4uLnNvcnJ5LCBJJ20gb24gdGhlIHJv
YWQsIGFuZCBoYXZlIGEgZmV3IGJhbGxzIHRvIGp1Z2dsZSBhdCB0aGUgbW9tZW50Lg0KDQpqb24N
CgoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqClRoaXMgZW1haWwgYW5kIGF0dGFjaG1lbnRzIGNvbnRhaW4gQW1iYXJl
bGxhIFByb3ByaWV0YXJ5IGFuZC9vciBDb25maWRlbnRpYWwgSW5mb3JtYXRpb24gYW5kIGlzIGlu
dGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbChzKSB0byB3aG9tIGl0
IGlzIGFkZHJlc3NlZC4gQW55IHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgZGlzY2xvc3VyZSwg
ZGlzdHJpYnV0ZSwgY29weSwgb3IgcHJpbnQgaXMgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5IHJlcGx5
IGVtYWlsIGFuZCBkZXN0cm95IGFsbCBjb3BpZXMgb2YgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIFRo
YW5rIHlvdS4K
