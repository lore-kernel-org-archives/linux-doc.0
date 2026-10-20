Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.74.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499922;
	b=t/wclEYfwRtHS8Z1JmkkOT4ODBbRyywNC2QA0AJiRWoyhKJ8bAphq4RkRowUSDJERsbF
	 GlJFnL7ySVCrWg91oFeA+cRXQKjIrvNfCtQuPx7IItCCdqRO6EeLdZEgPwPcYynty4qk7
	 sgsN/reA0YNGE1ePfk9kOw5z560Hje7qlsZveUe9FRWV9yX+sC+S+yRIwxiBw8BSEYjVh
	 dslcH8rOOTQk0Rf55LmZws64ZPiQZEFjs2AfcnkRgH0GLUtrgeJLbD+cybjc2KuyhaurS
	 Zh4A1YIpwRH9ldkshyo2ZpwlANDgR/Wd4yS1a7JTHKQPtFOr2s2vcsx12Y9tWRNkK8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499922;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=akACAvijgLhBP2eeze8El/6gwOGre636Dl5rPf9ee94=;
	b=dRc7farmP9VN6J0190klITwO/eXH2GrRWlbQfV8aabwgoD1KV0qN0r2UYOvIApq8n2cv
	 h9vTvO3czHNKLmb6/li0L//VnWjnJQjnV52rHL1ZvCrthzy9apDIKjaov1oComTMFzWb0
	 8tdpEJhMO+CKlOBRa1Q2OIICUePCZVAo0LrF/K5G7hHRGpNn57kLEGzpowAn0HlHOQi0K
	 ozaRMxfxyHjtaEPivvQOFTbGlou6u2WVkHZ79lba3lW+74nnAEElgfNVg4c1JAU6K2x6J
	 vIUBefq8zrDPZzsKt95js5C2ChfrEr6C8JzvWxWVxiVoSsZB40/exV7Lo/big2il9Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b="CHN/h1IV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.74.75
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013075.outbound.protection.outlook.com [52.103.74.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03A5606A326
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A03A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CHN/h1IV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHOrIXtb9FwN+WnJo9jGh7NAyxM53JYUt/2Ymn4RZoVqrfQLHyQ21PX0vK3vkFvH+JJG8pZU/K1Jtt9uG2gjDPjtsGode19sZrfRZQ8LGiBYQxrlqCmqmJMNhx3lAxMtUNKjqEy2SNQ7DadrboE92zlVvg61NPdjGzr1mWasTrdGwSIqpC3i7k2utBJyk1DZPPH/cKXKHDvUGRkK2205y8NJ8hlRBNDIgVPo/iuUPOYe8JyQkpTXt1Q512DtZ7PcpMYSykYxJYrUOVvdTPyg0KpcoT8UFSKq+8DGJovhCC+XwkhKSDDPGFXxCeIyli4BD0PsONXkoQM12NSO3vqgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akACAvijgLhBP2eeze8El/6gwOGre636Dl5rPf9ee94=;
 b=joNYlgq9GSnIP0DnDfshA4KilFGhugDmuptwaTnLcR4Df4olzve2jUzj+9tpAwswWVZ4lQvI+IAltYs62ga97Lr+2ZjPsI5r9b5UJZTrWgJxFmpYUl8Q80V+Lthqa7QhPb/bngis1fw48xDAIK7FUG4L1mqZZ97qEuywxLV5AnE75ayYRmVzChVxnmc1CtyCO8SrbUvC+TPKU92edzm/ub96QwqHxpBC0Zq6eTCAMb3NLhj5OC2fsfk9PM15/LhreB1LyYJZA/rMycVz9bBwScx6VVurhE/bdBTze5zn1T5OimyzsFrbAeNsr7LSJS9X2M+2vdyX0b62mRaf4JrsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akACAvijgLhBP2eeze8El/6gwOGre636Dl5rPf9ee94=;
 b=CHN/h1IVahub1jqQUPXGmF8XvRKQeyquCKNd4ryuBRrkltiTldQz6fxz7QJnwrx4/TdL1wb++niKL1qbwBRJmOS9/K+EuQz7KAuelmi/IySi6W/XnjBM/qIwEc0DAAjyF2V9sgzOSIbZnYO7dbqJhFsS+dCUleZy44JFQ38L2gLKv8cMly73BWPorpXVKsRou74rjywX1+LNoLiB6Ipz4vGuqJ55isjcLl28t5omgiaYRWATX+eE7uJvlxmPa3en18AzRPqNUw+iIo+RFge2FfTl5W5nzBH1aJlZmvuvrRCoQ6+PUrrn8aqtwtnA5hiPoAhFoyR20Qiy2NsEVUEo3Q==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by JH0PR04MB8066.apcprd04.prod.outlook.com
 (2603:1096:990:9e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 12:38:38 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 12:38:37 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: [PATCH v3 1/5] docs/zh_CN: add fault-injection index Chinese
  translation
Thread-Topic: [PATCH v3 1/5] docs/zh_CN: add fault-injection index Chinese
  translation
Thread-Index: AQHdYI/thsoaWFtLIUqG3XLRbOsRGA==
Date: Tue, 20 Oct 2026 12:38:37 +0000
Message-ID:
 <SI2PPFCA6543649F0FF8DBE446FB0A784F6DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
References:
 <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
In-Reply-To:
 <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|JH0PR04MB8066:EE_
x-ms-office365-filtering-correlation-id: 1bcaa7b9-ce9d-4a99-1fd5-08df2ea7100e
x-microsoft-antispam:
 BCL:0;ARA:14566002|2604031031799003|31061999003|5040399003|36102599003|51005399006|22091999003|24121999003|15080799012|15030799006|19110799012|8060799015|8062599012|20061999003|40105399003|30101999006|26121999007|3430499035|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?gb2312?B?Tkg2UmdyNVV2WUdiNkNoL2VsNGlZWW5LYXZuMzlDYW4yR3QyTE1nR3B5M09Z?=
 =?gb2312?B?cWJkNHl1ZlFWZkZMZm1vTjV6SkR3bWpldy9ZbUdueGJhL0VUZEpBelRiejU1?=
 =?gb2312?B?QlVucnBJaVpYTG5sVDJkREJDV0t6ZTdoeERIUytqTG1qV0tsSVNvTXEzakFR?=
 =?gb2312?B?TEpvM0Fza283TlZWNGVZMld1YlJJRzArUGM4VXI4VXJTaHB5YkdxRlNDWWc1?=
 =?gb2312?B?L2lHSVh3bVJQQXR6K1N6Y3JoMytITEFoZkdOUUpzSHB0OGZMLytuOG0wWFIz?=
 =?gb2312?B?K3NWaVFWZTVxTE5wbndpeWlxWUllNWNSVGN0Uk5pN0oyditTWnhQckVKZWR6?=
 =?gb2312?B?S3pDTlUrWldOQkVlWWVLSE0rZ2J3M3F4d1VTYy9CbGdJc01vb203T3ZHUWNy?=
 =?gb2312?B?L2JwbWZWNzA1TXR6aVhjSlVsSWswT1NteExKaHJkMHloYnVrWGVyMW9sRERy?=
 =?gb2312?B?QVdwTDlOUERmY29iM0haeldrWWtUbjJiNFZDTktLcFBDWWErRzY1aUc5Mlhk?=
 =?gb2312?B?b21PU2lsc01QU0pkN1pKQTdVckZDek1FeklHNW1CK1o1RndjRFpVY2lXTG9Z?=
 =?gb2312?B?NTNwbkh3RXZSWkVsSlpBY28xcHBUT0FWdERyNGp6NS9UNWNZRFdCbXhTbkI4?=
 =?gb2312?B?ZVY1N1lWeEhLc012MGRpWEwvQzBmLzEzYjRpYmp0UHlEYzBFd2lTc2wwVlJm?=
 =?gb2312?B?c0JOeWJoUlRBV29rdXF1S1JuWG0yU0ZlejVsZ2NyOXZjeVo1b3lhWWdCbnRy?=
 =?gb2312?B?Q3lqc04xNVlpRzBzR3JMUHVyeTFRR082Z092d2RCT1lJN3RkYURXemFhRVZy?=
 =?gb2312?B?RVVISm9ZYzZxVEdPbks0OXd0MXVtZG0wZlkvM3RVRXpreGlacEpxSjNydXhP?=
 =?gb2312?B?S3VWdWpKR3Fod0Q1YnNjVGpST0o0aUZGZlEvVXRyODhWZFIrZDhpSjhleFNz?=
 =?gb2312?B?TUVLY2NtNXJJcDF5YmpWSlI3NkNUNjkzU2hGUTl3czBZc2RHaTF3cVdyaFQ0?=
 =?gb2312?B?Q2pvbXRkeUtkeS9NUlZnYkpwOGptUU11VXk2QllvUkRUTE04NVRLNmFEamtO?=
 =?gb2312?B?VWtMM0t4NVlDVm5nakY0Mjh5aElYK29MUXlCNmFLdEhlOW9POG1GTTJRM1kx?=
 =?gb2312?B?Q0kzNldXWTB3TGpZeHY4Vk4rdlRYMk1MOWh5OHljbGNvWDZXSWF1S2RxOCtY?=
 =?gb2312?B?OXVub2lnSzRLVVNDZThObWZkZmcyQkxoSGdtc1hLMDFnOXphcHRZalRraURo?=
 =?gb2312?B?cDJVdzBNRi92RVpwUTkvb2dPK2xNeUNubVNqNmptdjdOZFNadFJhcDZtSVdj?=
 =?gb2312?B?TEgvS3VHbU5HUlloSVA1cW9Ybk5STHBXdXhjVWdvYStWazZaa1lGV21CL2FO?=
 =?gb2312?B?djY1cXRjWjJMTTdhTmIwYmRNeS84ODI0dWU4Kzg1MU5CN2hCNks1QVJJT1Fp?=
 =?gb2312?B?TS96bVQ4dEd5SWpIQ1ZtYzJFUkJRVDJReXpGWEVEaXJNZ0M2UXRHZENPUCtQ?=
 =?gb2312?B?R0VRVURNOW1aTU1MaUNTWDU2RlQzb2NuQmRFNmY4d29zSUwvdzk2MXRVb2ZM?=
 =?gb2312?Q?L6Na6xBRD+tPY/Ysul4U/ax6o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Q0tDSFpCTWZ1WGN1L1pwQlp0TUVTWmt4czhPbVozWFhXVXZ3TnJRZzhQeHJa?=
 =?gb2312?B?NG93TlJ6MlVyVDFXVUNRcXRNcllUaWZySFhiVjQ2NTlMblA3c1c0aXdNNjBE?=
 =?gb2312?B?cEpxbVVuWjl4MlFTTjhINnNSNXhReUozdDBkaC9OZSt6ejRsZXRNVWRsaVJo?=
 =?gb2312?B?ODRGWCtoT3JwMmpoT3AwOWU1VjRmZzBqWTcwd1NIeHp3NzRTbU8zTkRqNVRx?=
 =?gb2312?B?RjlOdStBVGZTdFBJSkRLdWNRTFF0SXFSYWhFOE50bkFFRXphWWJXeTl4MXBn?=
 =?gb2312?B?NDBWTHNKRjBUNkQ2TXpGNnBQMmJlZ2hVK1RzK2lHZG84dGxnSEsvUEhuMllF?=
 =?gb2312?B?Smk0VlNXNXlQRS9LZDJuVE9TZFROcTM4bEVqVVJRSmJ1azE0N1h5UTlJMGJU?=
 =?gb2312?B?VHJtNE9sYTJtVEFHcXNpUDU5Nm1WakovQ3pVWUtjNElMY2JQMzIvSzVsWEc4?=
 =?gb2312?B?cGFKKzZQb0xmRjVrOWNzVTFyZFNsNXI0Qjd1RHNhbU9qSFZQMDUyZ0U3N1Ji?=
 =?gb2312?B?TW55Q1R5Z3VsMkJhRDByRTRUb1VyQlN1Q2lQREFaa2VWVGZXYnBYcVdqQTlY?=
 =?gb2312?B?aDVvZkFRTVdiZ1NjTk4yV3pkZHdYRnNYdDZVR2tYRU5sK2FwaUJsSGRDU3dn?=
 =?gb2312?B?MFYwQ0FUSkFudThxTFdqZ1R3STF5c3FNMXVzYVlPRXlqWVNLdzFsWjBoWnFC?=
 =?gb2312?B?Z3RwbzZyU0VHa3pQV1FxSDNKa08wd3NrMCttZ09XTnN6dXpnaUx6OVZ2SkFn?=
 =?gb2312?B?MVJLQVVzZE5pVEtEcHlBQ2JvbVBNUTFKNlV6MXphV3BUU2g1RFVSNTkyVlRa?=
 =?gb2312?B?aVpzeHM3UFZNek5kMVlRdjRpblhLcmJqTEQwY2NVazZNVFVEOVFrRnJmNlNr?=
 =?gb2312?B?aGZ0SDNieXo3THg3c3BmcnFLTlM4eDFFZGQyUkloU244NDl2ZzZZVnp1eEVL?=
 =?gb2312?B?eG81WUppVkFFaGUwVkxFZG4yVHdabk9OTWpWM2ZvSENkYnM4MWZhV3A2elY5?=
 =?gb2312?B?ekpZRWJGNmVRUndObTRuZlk0Uy93NnNuNTY2ZW1FaHhTcnBsRTAyeDdGMFJH?=
 =?gb2312?B?Qk1RS0hXS2hpRWlTL2dFU2lzaHNRbTdjdmtZOHV2T2VVSVZzTmM5d1k4VHgx?=
 =?gb2312?B?dHZmc1Bld01YTVRTVk52UjRwNUZPdng3c3dxVEpUVFhWVE82WG1FbEFtS1Zk?=
 =?gb2312?B?OHZtRmNQM3B6MFFwNVM3VjY0SU5jR3RBRncra3paZUV0N2UzMWNFWTdCMlQ3?=
 =?gb2312?B?enlnMmR2Nms1RjFiQkc5Q3p0eW9ra2xBZXNJa2kyQlQ0dmlzMDFQSi9MSXcy?=
 =?gb2312?B?WHFSa1RGYjh3c2R2VDZ2UGJkSmlFc2NSaTVadXhCemtxcUJyRWh0OUc0bi9G?=
 =?gb2312?B?d1hPSnlieitDRGFTaEhUNVloenFSMlpBVVBGMkJsM2laY3JwOFRobkE0Rnhp?=
 =?gb2312?B?QkRsMk56c3MxZERGS0F5MW9Ra3hXRm9zeUwyY1VtWENUc1Q3c2hYRUxicWtX?=
 =?gb2312?B?Z3JjZTRpNCthenJYcVRGek9kelVpQW1EaGZnbXRPd1ZTQWFzcnVRWEF0d3ll?=
 =?gb2312?B?VXVYaHlFV0VvUklmNXhFODRydGVncWNCYWJNV1R4WG9PVW1jSHVhVHZ4WVFo?=
 =?gb2312?B?MEsrV1Q0R0tlWExXcDIzTXdGZzgvYWtMZGNFVHZuMTNvTHVTREdwTWt3RlIw?=
 =?gb2312?B?ZVNjaXVqQ1RnejZjQTQzZlRXVGpxalBMcllJNi9hZHo0L1RmUCtkc1pQODcv?=
 =?gb2312?B?UVJ3REUvNmZzYlJHcVkrcFdIaVI4QytiZkRZblpjN2FRYjMyVUppVVIvc1ls?=
 =?gb2312?B?K3BWNXZkZGpEc25RQWRZV3hKcWVUUTRBNTEyRG5KbDR2STVXdFh0ZlF1SFJN?=
 =?gb2312?B?anVkZDI4R3pJdVdTeWZFaVc0MFBJSWxURHJKZXZZdVhyYWo3aWhYU1BTWUdx?=
 =?gb2312?Q?7HydIkq1cKM=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PPFCA6543649.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcaa7b9-ce9d-4a99-1fd5-08df2ea7100e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 12:38:37.3067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8066

RnJvbTogWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KRGF0ZTogU2F0LCAxNyBPY3Qg
MjAyNiAxOTo1MDoyNyArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjMgMS81XSBkb2NzL3poX0NOOiBh
ZGQgZmF1bHQtaW5qZWN0aW9uIGluZGV4IENoaW5lc2UKIHRyYW5zbGF0aW9uCgpUcmFuc2xhdGUg
RG9jdW1lbnRhdGlvbi9mYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0IGludG8gQ2hpbmVzZS4KClVw
ZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgYTU5MmEzNmU0OTM3CigiRG9jdW1l
bnRhdGlvbjogdXNlIGEgc291cmNlLXJlYWQgZXh0ZW5zaW9uIGZvciB0aGUgaW5kZXggbGluayBi
b2lsZXJwbGF0ZSIpCgpTaWduZWQtb2ZmLWJ5OiBZaWt1biBXZWkgPHdwZXRlcllZQG91dGxvb2su
Y29tPgotLS0KIC4uLi96aF9DTi9mYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0ICAgICAgICAgICB8
IDIwICsrKysrKysrKysrKysrKysrKysKIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2luZGV4LnJzdCAgICB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0CgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQtaW5qZWN0aW9uL2luZGV4LnJzdCBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4xYjNjMGM4ZTVlYmIKLS0t
IC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1p
bmplY3Rpb24vaW5kZXgucnN0CkBAIC0wLDAgKzEsMjAgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCisuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QKKwor
Ok9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QKKworOret
0us6CisKKyBZaWt1biBXZWkgPHdwZXRlcllZQG91dGxvb2suY29tPgorCis9PT09PT09PQorucrV
z9eiyOsKKz09PT09PT09CisKKy4uIHRvY3RyZWU6OgorICAgIDptYXhkZXB0aDogMQorCisgICAg
ZmF1bHQtaW5qZWN0aW9uCisgICAgbm90aWZpZXItZXJyb3ItaW5qZWN0CisgICAgbnZtZS1mYXVs
dC1pbmplY3Rpb24KKyAgICBwcm92b2tlLWNyYXNoZXMKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2luZGV4LnJzdAppbmRleCBiMDhjMDlkOGU5NmUuLjA3NWZlMTVmMDZmYiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0CisrKyBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdApAQCAtNzQsMTIgKzc0
LDEyIEBACiAgICBkZXYtdG9vbHMvaW5kZXgKICAgIGRldi10b29scy90ZXN0aW5nLW92ZXJ2aWV3
CiAgICBrZXJuZWwtaGFja2luZy9pbmRleAorICAgZmF1bHQtaW5qZWN0aW9uL2luZGV4CiAgICBy
dXN0L2luZGV4CiAKIFRPRE9MaXN0OgogCiAqIHRyYWNlL2luZGV4Ci0qIGZhdWx0LWluamVjdGlv
bi9pbmRleAogKiBsaXZlcGF0Y2gvaW5kZXgKIAogw+bP8tPDu6e1xM7EtbUKLS0gCjIuNDMuMA==
