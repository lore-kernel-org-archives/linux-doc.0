Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500816;
	b=D9zsQ+/YnL2MyCPXhPT0R2+BB5XDxnPm6f26zzHvEBM6G5cuYFYHpzyh6Q4qbLC2ZYHx
	 EJOcKJXsX1iHSmLsp0xToeUaMMmvXt1eEE7AE6Wd+OekorZdTkgd58NxCqursIbvqb6VT
	 +50lbvI5JKC/ZRGkFwU3kyvW3/sQh4FREDB/TeFZeqoc4qbo/NwMQ3O75gQblA63oBhTV
	 sLVMmnZbADwwhpPsjVNsomhiaCjB8daH3ykw08isRZCCkK52W9i4MhHcAsr0v8a99V0/h
	 9O6E9jHHyjFW6z4BNe6+61ydFLcznyqPllG8YTF0OKNAaCR2NMRSLNx6w5L3I8jxcPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500816;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
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
	bh=WjmGRL3prV/o71my8GGEAf73aXO4OHZz6HoP2T1WYdo=;
	b=avgxZcjdYXWEpi+vn3L9nK82M148uyCQE5Dso9WvpWxboyZ3L5gOG6QqESO5CNjWkjsn
	 xHuTUeeXwntUv3hXLqGW3XHYeUzeCpVJuMhphrr/gZSUnFEKlhPlb6G3IQzPMHmj8msJR
	 A+6J6fQ4a6cxUtRd82rAovcR1KQk68RHsLBr8evVDxOi5yZGQ7ECd974pzu4+AmcdkHB8
	 YgfjX6hIvSkijo1bgjxSCnD7KZdLM37snUxKxbeb7XnN8Uc59oqwmc/LbFrOpU8O1+ZZl
	 a/6Pww0CcvZZ6zmxgP3hsOkcC6y+9tX5EA18NGAnoTjlrIO667CijFeD5kdW0e+WRRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=sd6UvsQU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.56
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012056.outbound.protection.outlook.com [52.103.66.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8F9606A31B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B8F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=sd6UvsQU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqzUHeXIhc3G3U/tRkN246a16VUFwwmoozuWoxDUoiYqYvhYlZt3E49/7xh6oEqwnx51EEQ0JyJFXkRnIJrdD6S7kA4lBuPtMYFHOCJIXnjFbMyrtQrQQsMyI6Tne9yW0XksAjoozmrFGc4JDCnKSm9yQ/yCqcOdzpdYIOVV0zaWudTQMTsfMHyla1FqE18sBBiI8DmpMgWO64mlPN4D4vAEnxvMhD3RE6RnkX4AFXu0XR4Dc9WlUh0iibZbVovy8yIGjl6iJEnGy3QthHjOyLPOK1i0QauPKh/K7cAaFQodnjiZgIukqwrJZ//OQBpOxtL/aYaCCs+W3Gflpz7GMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjmGRL3prV/o71my8GGEAf73aXO4OHZz6HoP2T1WYdo=;
 b=mW25UoQj+rzBF2dZPjMbywwjTuZ1I63OQ43SVC93C9rszOCvJmdbjsJcewGwTq12UO6YXhdUA6w0ZsgHkEgDTzeuMdpzKp3ZNyFSUdpFqaLa1KkZejkTWeO95udmg9MA/Z1v7jCbc2DAZCPt9U/a5OMfsdOOXjBK+tmK82HQfuEKtK1zfth+4P4eZJGx7vXE1Du/LIPjSw6jhLifieSuETRB4sC9P22HROg+41bg13iAQGmbKHWD1syDUMraV6qh2KDtT9QSTGvNfdauffv5Ju2xBceWdI5nijzD4bASMGN4wIoQLo1gk5t7Mn9gFXexfzW5fi/J4nqN0nXoXjmlmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjmGRL3prV/o71my8GGEAf73aXO4OHZz6HoP2T1WYdo=;
 b=sd6UvsQUo6ao9XtpATOnosiyEu1sRfJEciZzW8EEYepKzuLZlWcjVZdQA5QtxXB9MMs0MPTsiVHL4Fuwp8gK5VV+jTbaDIgVYvcgpaEPodWj0LC35IqNH0KkwqJrYhHfn65WIyLTpoNaQw01UHL+x5HnLrs/8x86xc85cpaiODw8gpC6+OgGFp4BxwlPVg3C5fLWdj7M7/dG3z3knFdMozvu9uroitkeKiiZ5yAlAopfo6wx88M+3pYgdeqBw1cWm/dWdj7mI6YOdJYq4/quBUaxazkqgtbd/TwH9DErKzEanhNVFo2EsybNUw3B9Lhi8hv4s4ckFtJYeNJe1pDI1w==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by JH0PR04MB7942.apcprd04.prod.outlook.com
 (2603:1096:990:98::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 12:53:32 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 12:53:30 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: [PATCH v3 5/5] docs/zh_CN: add provoke-crashes Chinese translation
Thread-Topic: [PATCH v3 5/5] docs/zh_CN: add provoke-crashes Chinese
 translation
Thread-Index: AQHdYJIBh3LdYlWrVEG2W4rBB4WfpA==
Date: Tue, 20 Oct 2026 12:53:30 +0000
Message-ID:
 <SI2PPFCA6543649A7691ED98CCA834F909ADD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
References:
 <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <SI2PPFCA6543649062BF777ADE821559142DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
In-Reply-To:
 <SI2PPFCA6543649062BF777ADE821559142DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|JH0PR04MB7942:EE_
x-ms-office365-filtering-correlation-id: 0cfc628f-8318-4631-541f-08df2ea9245a
x-ms-exchange-slblob-mailprops:
 P1EfU6pZOd/ur0QDa6YmBjuOVf78JKonXwWXvI5/KrS+N/AYcGh6MuecCNBHOvduuwqVa8jo0k7yj+2CIN8e/PUhLhWZB/rj+/n1jsAR8qYgKNkiV3xNEIFJcdB+LsMmoDN6lEMXlOLM5DFLGNRfw/oPO1EXnZEdasUEPcJpLwITIJOsnA7PEoDqrqHDzmHCnAWbUDOwt5vjHkVvzrs6F9S/2I7Tg15NMlxHALQxwO0zatgQ7rY593dvRWatGhhn/5zmSN2QMa18V5zs9zNr8jC2ETpdHu3CM6S6mbiVnEiRHjjh9ipYMplxki8UuZ7V1l8VEGCeBNAQzOGCJaxYLhZBEWadcPTs0QxPb055WM21JFxj1wSnhZ9AgPjVRg2L8dK84fivhuMrLJr7ejIwHszG7IzMKIbkfGQqUY3SHuW85LX2fyMBB+ErTP37MoZIdh0RQyg8t/PaxKBZtnu83rpe+k5yxs4n/59775cFxE/Y0rXE272gaBFAGKCTQKmIvzznjjCiJoVQQYNKi+VuvZlAcpzCU56t+vv0qSBDSYfIkPomXZ1+3cfNTEfYdIwha5bhYESnm2dvFnMe/WRHF4oCytImZtHLAXt6LcYCoduaL8fTQJnjwADf+PajEwI0CWbqhQdzUz5U+1s1CftBp8zL9Td95TRwPE+jU/E17YvqFSdIyJioDX15EGTfAuJ9wIaXMi8tq4DIbf2eVTmtYL8of08mpNlvZWy3cOvRQK5/RgXOWtRQQUgYMNsCRpRe5WP5HqHCmSd3Km6jVYxwvSH9u3AFqRiH94DqH6o+7Znk+Ufm03MU7A==
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|8060799015|8062599012|31061999003|2604031031799003|51005399006|5040399003|15030799006|15080799012|22091999003|36102599003|24121999003|40105399003|30101999006|26121999007|3430499035|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?gb2312?B?cFMwNEJBTWJpekpISHBhaG4yTnIzam1oNC9MekhwKzVMUFlCN1puYTZRM1Vj?=
 =?gb2312?B?NnVxbVFYOVlBcjVtelc1enZLTExHVGl5bkpHSG5HQTM4SGkxOHdpSk1IKy9E?=
 =?gb2312?B?MVJlTllIZ2FJRHFJVFhsSURwSnV1NWZTTk9IZkQzRzNOT3ZrdWtJajdPRDRp?=
 =?gb2312?B?YmVLUmMweUUvTWJqWFEzc1krUXZoTXlHaHdreGVyNEZpTFhiSHo0dEpWT2lW?=
 =?gb2312?B?UFk0Z3RMNjUyUnJqZm96dndEbzRqa0ZVZ0pSOTVtQWdrU0Y5RmE1K0RSbGp5?=
 =?gb2312?B?d3BQaHlsaFFmamZSSitaVitwTkZDeTBORXZoNkg0RHpERGI3Mm1HSU9MM1V4?=
 =?gb2312?B?bDIwbW1ldHZPVTBCK3B4WTNicHJjMlJUL0VwcFJEOTlXU2Q1TnN5dWIxYkk5?=
 =?gb2312?B?bVBkN2xmTURYOGJPUUtuYUJKN2JtY3ZKZGFEeW40QWtpUkRtNGdraWFWYWVk?=
 =?gb2312?B?TEQ4MDNFYWFWb0JVWTJ5WXFac0hhYVRiM0VkRElOQmxWejZuV1hycEYrdTA0?=
 =?gb2312?B?bFc4UUdsZm0wY0RjT0RJb0NlL1doY20vUUoxNEx6MHF5WXBxcFArbm95OEU2?=
 =?gb2312?B?WHJuVUJVVGV6Sno2MHlpTHFuV21STHBWZHNTbnQ1ZmFTUjdpUGVmcTdjNlc3?=
 =?gb2312?B?RkVMbm9kNHQ3M1BqclFKQjRMOXRUZFZqWG1TNnhTaXU0M0d5dE55bk93Vlg3?=
 =?gb2312?B?S2w3cDZhdlpYU3lmQUk5cjNXTzA3dTU3WXd2Q2tneWo3WTJ4bEswYW5ZYVB6?=
 =?gb2312?B?ZzhzK3JrNCtBM2xINy9MNjVqc1V6dWNFLzJyTkh1KzlHNWs1Yk1sWWIrVkhY?=
 =?gb2312?B?ZXRFWm1jaytsRjNWRjlHU2JaQ05RcnBkdDNidy9sTjdaajFEc2s5WndEc1R3?=
 =?gb2312?B?Zi9OZ2tBVEQxRi9qT3BlUXhDR1Y4WjhWRU5ubWxXYW1pRkFEM3FUcE5id1JM?=
 =?gb2312?B?SlNsQUFqUVU5V1Q5SkY0bmhiQmNxN3FHQjNCajVOc1M2MGhoWHRpVzdMUGlz?=
 =?gb2312?B?MWVpUFJXVTRyaThYSGIvdXRTMlFwWUtDVXBlNkZtUkN6S3AxbXlLNGdqaFhi?=
 =?gb2312?B?NG8wSFpBRnpXd2JMZFFocFh5VHRIdE9NMkZJVUl2aWIvd1MzWW5xbHU2OEVz?=
 =?gb2312?B?TXk5VzVZb2ZQNHRrZERwTklaTkRwZnFDUWVJcDU5U2t4SmhRNGZpUXkzUU8r?=
 =?gb2312?B?N0hYeDcya0o3NEZFWkNwZ0xUMm9KaEkzVFRoaHF3Z3Jlc3psaHg0SkJJNGdX?=
 =?gb2312?B?STVxeTBJTzJSb1dTSHFBWWFzSlllVlVKT2tvRVV0SXpLZVVDQjVnL2NMUklS?=
 =?gb2312?B?MGdUa2UwUzhveGlxNTFzNEtiVEs4alRLQ2t2aGJXQi9QUjk4VWMvOEpBeEUx?=
 =?gb2312?B?Nmt1enpTYjBDZHdPZWg2SEVZRzhmU2h1dzNqbGtnSkVxZ05kSEVjTGszRjlm?=
 =?gb2312?B?SU1MYnNuMU4rVHB5aFFjZ05RSFNpdzEyUGJpSnR3eGJBdmpmQ3VUQ2FyYy9E?=
 =?gb2312?B?dDBBTjhLUzVqS0F3RzdlcStuQWQ0WXZWOEJrSmdielJidHA5SXVkTVhUdmd1?=
 =?gb2312?B?cG95QT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?OWRGN04yYXFFVElJeHJqS0hmUEp5QkZScDcrMUw2dlBZeFd3K01POXJyS1RP?=
 =?gb2312?B?WlAxUWJpYTFMLzBEV2ZxZGwvb3o4Si8zcDFyMVpaWGZuTGxPc1cyeVIyYXBI?=
 =?gb2312?B?RGdRQXNINUVMcGRVK1l2alRTL0VVcnRKczV5TC82VHRLOG5YQktTaE1FRVZ5?=
 =?gb2312?B?SEFpZmJsUkJVUGo1UWl5M1BQSjNzS01oem5YWkZYbStpbStVWkk4dVptTWxw?=
 =?gb2312?B?R3U3aStkSnVLZWhZakk4ZFBCaGlJTW9xN3lHSFNpTjEzUXhab3NSSG1xMjZl?=
 =?gb2312?B?UUdGT201cFozMnBLRFRhdVp0VUpvZHNWWXdCd3MvUkI2VUZkSG01TnRMUzdN?=
 =?gb2312?B?TUNxNTU2cFlENFYrSjhJT0JoTVdidEZlaUNtd1ZpcXpVQ1dkNkhlY25BdWoy?=
 =?gb2312?B?K3dwenhvVFIyNThXb24rTnZSbGV5WFRHYlp4ZFFXY3VvZDBSQnhPbzJwNWNM?=
 =?gb2312?B?d002MmwwOUdBa0RyQlF5aUVSUi9kVnpZMzIvalBPWUk4YTF6Y0NOVnlPUXBC?=
 =?gb2312?B?TXFZSDBiYVAyZE9ZbE1kY1ArZDNzSDdmTjNDaytSbzRuVlNSOVNSRXdDUG93?=
 =?gb2312?B?TXdPZTZQdGxoeEgrVE5HQmgzZXpKc1o0TkNZdnZsT3F2WkkrOUpNckVWUUJN?=
 =?gb2312?B?WHdQMjVodGVxd3NjaTFzY1VLZUtoK0gxSGFvYVdDejE1aW1VblNqcE1qcUdu?=
 =?gb2312?B?cEM0Q1NDTGMxNHBaWXBNbHA3eUlKcUs0QXVlYlh4YXRzWG5NNkFYdkpNa2cx?=
 =?gb2312?B?K2k3Zm5vUGt6Rmw3QzVReTRWbzFXQmo5aklFTHRUV0p5Rkp2cHdaK2RmMmJD?=
 =?gb2312?B?ajE5YmpWQTZVN0puZVMrTkxDQ24vcjVvMW9Jd3JUMy9OTEYxelpWem1wNzdH?=
 =?gb2312?B?Nkt0RUkyaVowbnluemVKcDc0SkxBZjFWY3c0MEpsZnA1QTAvS29sWS9SZldW?=
 =?gb2312?B?SUF0TmlPVEtwNjBLM3FuMUVld2Z6L3ZjK29SOXY2OFgrb0wrTDFUL0F4MkVj?=
 =?gb2312?B?S3BPZ1lib0wvZEZYZDdRRGZ2YXkvMEhPNTJGWTJtVmIzbjd4TWhiL0NSV3h1?=
 =?gb2312?B?VG5DMkNJKzQ5aFc0andrbXFCcUxNOVZ6N2RSNTJTVXBueTM1YjYrUktuRzNx?=
 =?gb2312?B?V3pxdm9Gek00WDl0cm9xVFE0b0MwcGJYc1RwYWhlQ25qcWtyblNyejYxQTdh?=
 =?gb2312?B?Qy9td0dRbjY5N29UUjlIeTJXZ1R5RTRDT3pUR3hueGRPSkVFRWNSK3BnTUE2?=
 =?gb2312?B?bmhzWWpLdTlVYVJ6YlVYRXN6M2NWRE4yMVo1THcrdUlpWDk0RVd4elloVXJH?=
 =?gb2312?B?Q3BXdUdPTU94T05NaWt5WTV2TFdKSmg5Ym9ibHcvQ25wa2xMVEZKQjZQdCtr?=
 =?gb2312?B?VWVqb0J2Y3A5YlFEY3Y2eExmYzc4WGhRamg3eSt6cHVLSmU1bzhRa3VZVnQ3?=
 =?gb2312?B?WDUxWmRJb09Ea0tJOTNSZTVPajBNVUtQOXBudjZQTEk2NExXbEVCR3UwYUFy?=
 =?gb2312?B?K2Y5Rjhib2JweGpqMzJBdnUyUEtYdEJBQThBZzVZaFBlVVk2THlEMTVLY3pq?=
 =?gb2312?B?LzkyVTFaOWJwaldGaVBtTDh2dnVUNTMyWm9qWkFEdW9NWjFGaWdQc2hvcXBy?=
 =?gb2312?B?Tmd3SGVmZmxxMFEzU243ZTdIS3M0bXNEd1ZvSThUbHROU3BzdGt1TElDV05R?=
 =?gb2312?B?dWxySlYvM0ovUE9Mdy95bFBpcTNiUGYvcWR6Sk05dTlsMEE5bWN0L2U4ZW0x?=
 =?gb2312?B?TkNvQWdVeUhGZVU1SjJ4NTJvYStBRUx1U2hvWG9vdktScklZUUtMcENRZGRu?=
 =?gb2312?B?R2c4T0hza2pzTG5uMEhaSC9Qa3BNSm9kdVcrdnJHY1dGNUIzQnZFYVZvUW5M?=
 =?gb2312?B?YmtXSTZSSEJBYUZEYUdFZkZMc1RTYTFsY3ZWbWFISkFoNzhlUjQvajNsdVpX?=
 =?gb2312?Q?MMKZ7CN9XkU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfc628f-8318-4631-541f-08df2ea9245a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 12:53:30.3603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7942

RnJvbTogWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KRGF0ZTogU2F0LCAxNyBPY3Qg
MjAyNiAxOTo1MDoyOCArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjMgNS81XSBkb2NzL3poX0NOOiBh
ZGQgcHJvdm9rZS1jcmFzaGVzIENoaW5lc2UgdHJhbnNsYXRpb24KClRyYW5zbGF0ZSBEb2N1bWVu
dGF0aW9uL2ZhdWx0LWluamVjdGlvbi9wcm92b2tlLWNyYXNoZXMucnN0IGludG8gQ2hpbmVzZS4K
ClVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgYjI5MGRmMDY4MTE4CigibGtk
dG06IHJlcGxhY2UgbGxfcndfYmxvY2sgd2l0aCBzdWJtaXRfYmgiKQoKU2lnbmVkLW9mZi1ieTog
WWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KLS0tCiAuLi4vemhfQ04vZmF1bHQtaW5q
ZWN0aW9uL3Byb3Zva2UtY3Jhc2hlcy5yc3QgfCA2MiArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9wcm92b2tlLWNyYXNoZXMu
cnN0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQt
aW5qZWN0aW9uL3Byb3Zva2UtY3Jhc2hlcy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9mYXVsdC1pbmplY3Rpb24vcHJvdm9rZS1jcmFzaGVzLnJzdApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjIwYzVmOWI2ZWYzYgotLS0gL2Rldi9udWxsCisr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9wcm92
b2tlLWNyYXNoZXMucnN0CkBAIC0wLDAgKzEsNjIgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCisuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QKKworOk9y
aWdpbmFsOiBEb2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbi9wcm92b2tlLWNyYXNoZXMucnN0
CisKKzq3rdLrOgorCisgWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KKworPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KK8q508MgTGludXggxNq6y9eq
tKKy4srUxKO/6aOoTEtEVE2jqbSlt6KxwMCjCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQorCitsa2R0bSDEo7/pzOG5qcHL0ru49r3Tv9qjrL/J0tTU2tSktqjS
5bXEtPrC68671sPIxcLSCiujqM2os6O74bHAwKOjqcTausujrNLUxsC5wMTausu21NLss6O0psDt
tcS/yb+/0NSjrLKiCiuy4srUyrnTw7K7zazXqrSiveK+9re9sLi78bXDtcSxwMCj16q0oqGjuMPE
o7/pyrnTwworS1BST0JFILbUtKW3os671sO9+NDQsuXXrqOstavSsr/J0tTNqLn9IGRlYnVnZnMg
1NoKK7K71qez1iBLUFJPQkUgtcTH6b/2z8LWsb3TtKW3osTausuhoworCivE+r/J0tTU2rLlyOvE
o7/pyrHNqLn9xKO/6bLOyv2jrLvyzai5/SBkZWJ1Z2ZzIL3Tv9qjrAorwLTRodTxtKW3os671sOj
qKGwscDAo7Xjw/uzxqGxo6m6zbLZ1/fA4NDNCiujqKGwscDAo7XjwODQzaGxo6mhoworCivTw7eo
OjoKKworCWluc21vZCBsa2R0bS5rbyBbcmVjdXJfY291bnQ9ez4wfV0gY3BvaW50X25hbWU9PD4g
Y3BvaW50X3R5cGU9PD4KKwkJCVtjcG9pbnRfY291bnQ9ez4wfV0KKworcmVjdXJfY291bnQKKwnV
u9Lns/ay4srUtcS13bnpvLax8KGjxKzIz8fpv/bPwqOsy/y4+b7dxNq6y8Xk1sMKKwm2r8ysvMbL
46OsxL+x6srHuNW6w9fj0tS6xL6hxNq6y9W7oaO4w9a1v8nS1NTaCisJL3N5cy9tb2R1bGUvbGtk
dG0vcGFyYW1ldGVycy9yZWN1cl9jb3VudCDW0L+0tb2howorCitjcG9pbnRfbmFtZQorCdTaxNq6
y9bQtKW3orLZ1/e1xM671sOho8v8v8nS1MrHCisJSU5UX0hBUkRXQVJFX0VOVFJZoaJJTlRfSFdf
SVJRX0VOoaJJTlRfVEFTS0xFVF9FTlRSWaGiCisJRlNfU1VCTUlUX0JIoaJNRU1fU1dBUE9VVKGi
VElNRVJBRESholNDU0lfUVVFVUVfUlEKKwm78iBESVJFQ1Qg1q7Su6GjCisKK2Nwb2ludF90eXBl
CisJse3KvsP81tCxwMCjtePKsdKq1rTQ0LXEstnX96Gj1eLA4LLZ1/fT0LrctuCjrAorCdfuusPW
sb3TtNMgZGVidWdmcyCy6dGvoaPSu9Cps6O8+7XEstnX98rHIFBBTklDoaIKKwlCVUehokVYQ0VQ
VElPTqGiTE9PUCC6zSBPVkVSRkxPV6GjzerV+8HQse3H67LOvPsKKwkvc3lzL2tlcm5lbC9kZWJ1
Zy9wcm92b2tlLWNyYXNoL0RJUkVDVCC1xMTayN2howorCitjcG9pbnRfY291bnQKKwmx7cq+1Nq0
pbeistnX99aux7CxwMCjtePSqrG7w/zW0LXEtM7K/aGjxKzIz9a1CisJzqogMTCjqERJUkVDVCCz
/c3io6zL/NfcysfBory0tKW3oqOpoaMKKworxPrSsr/J0tTNqLn9udLU2CBkZWJ1Z2ZzILKiz/IK
KzxkZWJ1Z2ZzPi9wcm92b2tlLWNyYXNoLzxjcmFzaHBvaW50PiDQtMjrwODQzcC009W3ogoryqew
3KGjwP3I5zo6CisKKyAgbW91bnQgLXQgZGVidWdmcyBkZWJ1Z2ZzIC9zeXMva2VybmVsL2RlYnVn
CisgIGVjaG8gRVhDRVBUSU9OID4gL3N5cy9rZXJuZWwvZGVidWcvcHJvdm9rZS1jcmFzaC9JTlRf
SEFSRFdBUkVfRU5UUlkKKworzNjK4s7EvP4gYERJUkVDVGAgvavWsb3T09W3orLZ1/ejrLb4zt7Q
6CBLUFJPQkUgsuXXrqGjCiu1scSjv+nOqrK71qez1iBLUFJPQkUgtcTE2rrLubm9qMqxo6zV4srH
zqjSu7/J08O1xAorxKPKvTo6CisKKyAgIyDT68bkyMMgQlVHIMmxy8DE+rXEIHNoZWxso6yyu8jn
yMPL/Mmxy8AgImNhdCKjugorICBjYXQgPChlY2hvIFdSSVRFX1JPKSA+L3N5cy9rZXJuZWwvZGVi
dWcvcHJvdm9rZS1jcmFzaC9ESVJFQ1QKLS0gCjIuNDMuMA==
