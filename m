Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013085.outbound.protection.outlook.com [52.103.74.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E4363C40
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792241185; cv=fail; b=GKqERxvKMejRWQD2SsT5T6ilmQRSkZytEV/foT9HSzoY32r9+KRBaYETwUKPjoQqUbo1FtHCXMXaRDiQ7ItZA8ixxS098T1EfoyIMZwO3sPiLdVTaxClizvRxSzbo5asejHfD3TRDFL75KSt3+0Auxlv6dBCagksIoBmov+u83U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792241185; c=relaxed/simple;
	bh=OxJFZFBUAl9IKHffTzbaZSFvRSShRPD2uK6gopRd3FM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V1l8uUepkY+OHgCaIuBa4vQBvWuMdLyxnqWNFm9KRTlYOvedMVKs9O5ZRbs3Eo8Pq34YmCzmpDrHq7Sq4sZzSaViaTlG0pgxXh9OlouW7GctwjavHaVxJQV1gOFcsW9U7MF38hld9or8H2MHqu3kc+PxbhXt/5JoKmh/DAiHu/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ptzexsfe; arc=fail smtp.client-ip=52.103.74.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ptzexsfe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6unpn8cs+Zik4175kXgD35KBxp6GbJk3+YTZ2XqKkfXeN2jDSZUGANCekZKQaqErQQZFuLYVGGZvQCfqW4fWYX/dwtqskjk2mU6Z40hnYISC27QNRhzsoe28oBA4h+SROTOi8kBXeO/q/qefp3/yD1lAmWCjUxe7ZCBdeBoRBGoDfoduVKFgqsNEkPPK4SgTCxsV/44aBNY4aOUsICzUj/iif1IbcR1BcSX31+f1V022eB2ysR7b79y2paDdftVHvXSA4uEEtoFVyOCDTUWnxGS/NNooSbjAlMn5NMocPMM6/hxQhpMKJ8d1gYrgz9fmiJqMj+up89V3+sc+7Lr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxJFZFBUAl9IKHffTzbaZSFvRSShRPD2uK6gopRd3FM=;
 b=yCGcWQGsWCepMkVINwPRcLg8YoAfyFOtjzgBnR6UWgnvyC02XU7ZqZ27lZC25Y2g0qPJvspHxUwg9MBeiCDx6hE+FnBXqxtSZ6sJnoLFe38lvnTR8JlUDxbCXaWd3c4aSnEbo1pauuKYM8eXH+ygmSEImpoX+vN+foaxIPyjRIM+YcDXGHutxJUy5poyTRYAnEdot/AVx+TaCNs8h5csfZi32PDOygt715NdnBHh8lMkMJQBIPY+eTzOFwnVFBr2kAS/W0vkVRJ/9dZdn2Rm3ic3IvyYDammZUGcZWb3GAMpvt3uD2XGp7dwI+9pVljBEYlkwjFg4BflVqmmquDcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxJFZFBUAl9IKHffTzbaZSFvRSShRPD2uK6gopRd3FM=;
 b=PtzexsfelL0wIArOvmb956Akje/qHwRBf3Co7AubhQ5c6shynLQCRAkVAMWGbsrhAfPJk8iHuTeIytzuJ302fqNrllLKNyJkaC8DgnW5dOuaULnGtV1oH4+Jhz15SmTtVEX3o241xdgQShNzTv5Ciu9xW7NaxXq2hJom1jCYtbqULVHdTcEfrGlzB09e6Mnn54dryR9JQeI8oZi/T7shcQhJ6BmRYM8J9LbiK7iLOyw9UTAw76K9hCU6+ep1mYHOZHoADRppzWKE6LHV5upDPbO90UaBki2TugVYkcLs+Ahl79rBXCcvUWBNn2T8s/MmE2yUmXzazWZwibDP+V4CEg==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by SEYPR04MB6726.apcprd04.prod.outlook.com
 (2603:1096:101:df::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sat, 17 Oct
 2026 12:46:19 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 12:46:19 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIDAvNV0gZG9jcy96aF9DTjogYWRkIGZhdWx0LWluamVj?=
 =?gb2312?Q?tion_Chinese_translations?=
Thread-Topic: [PATCH 0/5] docs/zh_CN: add fault-injection Chinese translations
Thread-Index: AQHdXjN3ZR0rE35toEi7gyuDKnzHp7cBrYG/
Date: Sat, 17 Oct 2026 12:46:19 +0000
Message-ID:
 <SI2PPFCA65436493AF0109F3CA238B362DFDD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
References:
 <SI2PPFCA6543649B0752EFCF53C275A02E9DD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
In-Reply-To:
 <SI2PPFCA6543649B0752EFCF53C275A02E9DD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|SEYPR04MB6726:EE_
x-ms-office365-filtering-correlation-id: 6939e4bf-6861-48ea-96ef-08df2c4ca415
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|15080799012|24121999003|36102599003|22091999003|31061999003|51005399006|6140399003|19110799012|8060799015|8062599012|2604031031799003|3412199025|440099028|102099032|20061999003|40105399003|261005200801699003|26121999007|3430499035|11120399003|30101999006;
x-microsoft-antispam-message-info:
 =?gb2312?B?bE4zSCtJbnFlbHlHeDZIY29pUEZFczl0TFIrSFdKU3g5NTZCWU9HR1JxREtn?=
 =?gb2312?B?TGM1bjhFbElwSkJMRTBLWGlBZE5ZdDR0QjF6bXJiVlplaTgwSExteTQ5MXZO?=
 =?gb2312?B?T0E4c0I1NTJpaDViSWZUUG1McFZoLzZNT2VoTEY5TWJpUEJTSmxxZGZaOTZ3?=
 =?gb2312?B?T29weVhIMFVxMlZHelhKVzNiSGsxakFLMWdRMXNoZnEwYjRKWGdOa2M4a3Fy?=
 =?gb2312?B?OWpJbXJBQmhXM0tvKzFLUDJKMWk0c2syemhTTzk0b1lnNmJ2Y2pVN1BJWUJJ?=
 =?gb2312?B?RUt3bWJtN3luSDBuU0JNRXRMc3JFdXAvOExUYnljY1R4OWJUd0JJbTBXM1Zm?=
 =?gb2312?B?RVpTVUVFeFlSRmR1NDE0U3VCWTNzWmFLNmVtS1NyYnhlM1oyVHFqRUhzczlZ?=
 =?gb2312?B?MjYzYk9ibzNIMWthdThHSkNPZ0dQenV6K2FTQUVKV2RrMmt6eURFbFhNNlJr?=
 =?gb2312?B?TFFzbjYyRkFCd1I2NkdwUFhFOGJ6UGJ0dGRBbGMxRzBoRXA3T2JVNk9TSTA5?=
 =?gb2312?B?OEN2RGlwRk52eDI2YlR4WTJJZ29XL2JSNFJKN0tPaGRWM0d0NFZMRDMramx2?=
 =?gb2312?B?UmFMNUd5a2tDbndmcXl5L1IxV3dIL01teHpEUXA3VHpyeW51dkJSbjg5b0lz?=
 =?gb2312?B?WmR1T08zYzNLajRCMWdoUWlZOFZGak4xYngrWlUzemF5aUE2K3J0b3kvVlhS?=
 =?gb2312?B?cEEyY0FucEdFTkcySC9vb1lTa2VLVUdGTjdDWXh6U2R6YWJhMnNGc3pDYm9S?=
 =?gb2312?B?YW1HTElrZzBYSElKUGM1TE1MZmM4blVvUVh3R3pVbFdhVXBkVkgxbDZVTGln?=
 =?gb2312?B?V0VZeWxyVFN5aTRuTDNCMmltZGRCQmFkTVJwaFhRa0taZjdVYXRzNThWQ0I3?=
 =?gb2312?B?bm4zVXNuSXBTNXhkV3ZCOUlMWEJUSFpUSlYreHVPK2JDK05tMTY4c0JoT1Z4?=
 =?gb2312?B?eU1HQWh2c0Y2WUpRRVhWanZWbS9WUm1TU0lYSjlxUjNhY2laRmJBenB4UVQr?=
 =?gb2312?B?cTh4bzJTenlLSHl3empQTDVQSk0wK3czWVBLN3dEVFM0OUlJYWN2eHZmRENy?=
 =?gb2312?B?MUhoN2hVa2R5QzNRVEpJL3R1SEUzaHBYbXFyYXhVWkRBU0R2S1RCRVRRWTFl?=
 =?gb2312?B?eE9vdHBVc2hKSzlHVlU4ZHUvUkkwdDlmTisrS2Y5a1JjR0VUK2x3ODJldDdZ?=
 =?gb2312?B?VEc3UUY1UkFyREhjcVNCZFJOY3NBQzUyWEM0WnZzN0QvdDFxOW0xZTdwWjRW?=
 =?gb2312?B?ak9KOWtZSkR3b3hJa1Y5Sll2N0k0QWtxV0tkU05keTRhZU5wQ0g1aVVuZEQv?=
 =?gb2312?B?WTRsTHFoNkpaaTA3c3pIUFpyeE1UWkROdUpDWThNT3liWlJUcDFBV1dwbEJx?=
 =?gb2312?B?Z2lSN1MzMi9CdHd4aTZtYndFWSs1OG1JdndDd3JWWjlPNmhOdXBuUUhSSFVM?=
 =?gb2312?B?TnJjZHlZYlZpTmlHaFBzUCs1R1dPdFRiQ3ZTOUZQVnlNMkpaQjhkbHFCUWd3?=
 =?gb2312?B?YURBMzhtSkEzeVRSNENNVFNONlF6aG10a1JxOEpjVlBDQnlTOXMwbHFpS1VM?=
 =?gb2312?B?RStFSlFHRlBYNGRpRnZwY2xKaTlncGgwMXFCeUNMd25pd2VpK3RReDF4ZnAr?=
 =?gb2312?B?WklFbjg1T0lZWHd0WDUvZmZxUHpXVnc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RXg3dnlSeE95aTVxNy9hMUw5b2o0TjBscHVZRnFqTXB2RlMvOEd5VDlZd1Jp?=
 =?gb2312?B?cDlkV09xNDBRZmIzTWcyUHlaaUkvNis3SVBYV0M1UWdyQmtObitHMmZQbThk?=
 =?gb2312?B?Mktod2x6dk9nMFFIZ1BVQUZQeGtDN0ZKRDdKaFZQQ0dPazluL0hRbU1sY29o?=
 =?gb2312?B?UUluL1BzUERHRXRhdWt2S3g3RE9qdXVpTkhnaXp6THN0VFkwRTA2YjlmQlRh?=
 =?gb2312?B?N21XZFRvVEFvRC85UWs5WjRLNmxjUXlVdFVqUmZ1eGtDVXRyYWVJUS82QmpW?=
 =?gb2312?B?YmhFaE5sNWVsNm1vQm9YelpWZ1ZtWWFXcHd3ZzhHdW5yQnpLN1BXS3FuYkQ0?=
 =?gb2312?B?Q0FBc2JjLzFNQk1TNzJVdXN0S3ZkM2NNRFU2WnNlaXAyTllHVlpFUFRFZWlD?=
 =?gb2312?B?amM0V1hJTzRaM3ZkbVczNTRieFkxZmR6alhqeFVqZFpvOTlaM3gxL1FJaDgy?=
 =?gb2312?B?SHFseG8vNHFxcDB1Q3V4aWNoZDZBYW1KeEFRVldIcldqNjVDZDU1MkZaVHRB?=
 =?gb2312?B?R2VNSTd4ajc2Z3laSWVGdTBtaElYWHBCNUlxaGVyRVdsKyt1V0pRYi9hQXNu?=
 =?gb2312?B?OVhJZElpS0RpRTR1Sm94dm1VTk9CM0NXL0U4Ri9TaDNpZ2JmM2pSTm03T1NV?=
 =?gb2312?B?clBiUmlkK3pTdktZcGhJSUdjMzEyUVBCMHZoUWlsYnd6QlQzREk3NGxqay9m?=
 =?gb2312?B?UHI1VkZMblcwdzlZWDRnODRPOHd0ZGduWWxiUG9wd0FscSswZUMrVTAyRWVX?=
 =?gb2312?B?Rkp3WUVYcndZeFFvZkU5TXRlTFFrVFJDM1JtOXJNVFpFTUgxTzMybnZRR3hB?=
 =?gb2312?B?eEJpWEtJanN4NEcrdnFDZ1piOWxaVWlXV2dTNnZEeWROWmw3V2w4QWV1aXRs?=
 =?gb2312?B?MHZXRURscjNDdjIxalZLVkdlcFpRS012cS9oUVV5SGRVSmFjUWJNalVjV0Rp?=
 =?gb2312?B?UzJ6UHZZSGJ1Tk1xWVB0WnZvQ1JiME9BN3FIUnpFNk5UeW1PREpRR1ZOYStE?=
 =?gb2312?B?RVVxQml1Z0puMkZDcjV2bjhXZkpQaGtQZlZXaW5tQjB3QnQrUUNWRnJDV0Yx?=
 =?gb2312?B?WHNUWVM3bHkvQ29hSDlCMTN0WWIvZ0I3bWVybzFTSkc1ZmtuNDBNbnJSWDhj?=
 =?gb2312?B?Y25HbG91OHZwSDg4dHUwNXNzUFhkZGdSU0x1SU5ZSHJ6d09rWDNrY0hDbW12?=
 =?gb2312?B?V2lxb1UxTUJ3MmNlTDVDRHZtK2Vtd0JxRlpBcUJFcE5ReWlza2R0cWxWd2l3?=
 =?gb2312?B?UkxsMExaOW5EUUtmS3FPZHFGWjZDeFJESUwyNlA5NUkyNnBjR0MzcDFYamlk?=
 =?gb2312?B?dTExQjRSeXFtTDFYSEczck9PcTZrUHlmUkYzMnk0R2YveUt5d1lNa25DK0ZN?=
 =?gb2312?B?T0N1Tnh1aTlSM0Qxd1hIT1phUVhMemc4YW0wWGFkUjBsVjExYUwvc0JPVE1X?=
 =?gb2312?B?WEU4K1ZTSXM1L2VxVEVJampQMVpNUjV3ZUVxcmVxellIUVhhQW1FTE92a2tV?=
 =?gb2312?B?OFBwUDZnK0FBYUlvVWJoaXVacHcvWXFiS1k5YlQrRGNsaDhSZVczVXQrVXBD?=
 =?gb2312?B?Q2tlTmNzNk9oZTVJSjA3QWpGd2dRTzNwQnJzdXdIa29DUytaRS84cGdBUGds?=
 =?gb2312?B?bDZVeWF2RDY1R2NiUGhZNUd6WFkrZlN0ekpxQk0vSFd2RCtqb3lqK3VqcWk0?=
 =?gb2312?B?ZlhLS1ZlR2gwbDdTR1RrKyt1OWRCSnVybC9RaXJNUThqQnRLRHFYQ0hHQ09L?=
 =?gb2312?B?K00vQmptRDhnUU9zK0d6a3p5bGRacnREVnE4cWZOaWdWUmtQaEdTVkl2WUhl?=
 =?gb2312?B?YzR3SERsK3owRDhrNTRYZTNwZEZmcDZQZ0lxajhGeFVNU1dXM3pXWU5pWEZH?=
 =?gb2312?B?MDU0VGEzY2VCbDJKL3BFTkZMdENsZUhoSkxyaTJpQ1l5Sy9jWDRtcmxmM1E0?=
 =?gb2312?Q?R2xQ2JYZSS8=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PPFCA6543649.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6939e4bf-6861-48ea-96ef-08df2c4ca415
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2026 12:46:19.1588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6726

U3ViamVjdDogW1BBVENIIDEvNV0gZG9jcy96aF9DTjogYWRkIGZhdWx0LWluamVjdGlvbiBpbmRl
eCBDaGluZXNlIHRyYW5zbGF0aW9uCgpUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9mYXVsdC1pbmpl
Y3Rpb24vaW5kZXgucnN0IGludG8gQ2hpbmVzZS4KClVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhy
b3VnaCBjb21taXQgYTU5MmEzNmU0OTM3CigiRG9jdW1lbnRhdGlvbjogdXNlIGEgc291cmNlLXJl
YWQgZXh0ZW5zaW9uIGZvciB0aGUgaW5kZXggbGluayBib2lsZXJwbGF0ZSIpCgpTaWduZWQtb2Zm
LWJ5OiBZaWt1biBXZWkgPHdwZXRlcllZQG91dGxvb2suY29tPgotLS0KIC4uLi96aF9DTi9mYXVs
dC1pbmplY3Rpb24vaW5kZXgucnN0ICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysK
IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdCAgICB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rp
b24vaW5kZXgucnN0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vZmF1bHQtaW5qZWN0aW9uL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi4xYjNjMGM4ZTVlYmIKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0CkBAIC0w
LDAgKzEsMjAgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisuLiBpbmNs
dWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QKKworOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9u
L2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QKKworOret0us6CisKKyBZaWt1biBXZWkgPHdwZXRl
cllZQG91dGxvb2suY29tPgorCis9PT09PT09PQorucrVz9eiyOsKKz09PT09PT09CisKKy4uIHRv
Y3RyZWU6OgorICAgIDptYXhkZXB0aDogMQorCisgICAgZmF1bHQtaW5qZWN0aW9uCisgICAgbm90
aWZpZXItZXJyb3ItaW5qZWN0CisgICAgbnZtZS1mYXVsdC1pbmplY3Rpb24KKyAgICBwcm92b2tl
LWNyYXNoZXMKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2lu
ZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdAppbmRl
eCBiMDhjMDlkOGU5NmUuLjA3NWZlMTVmMDZmYiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2luZGV4LnJzdApAQCAtNzQsMTIgKzc0LDEyIEBACiAgICBkZXYtdG9vbHMvaW5k
ZXgKICAgIGRldi10b29scy90ZXN0aW5nLW92ZXJ2aWV3CiAgICBrZXJuZWwtaGFja2luZy9pbmRl
eAorICAgZmF1bHQtaW5qZWN0aW9uL2luZGV4CiAgICBydXN0L2luZGV4CiAKIFRPRE9MaXN0Ogog
CiAqIHRyYWNlL2luZGV4Ci0qIGZhdWx0LWluamVjdGlvbi9pbmRleAogKiBsaXZlcGF0Y2gvaW5k
ZXgKIAogw+bP8tPDu6e1xM7EtbUKLS0gCjIuNDMuMAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCreivP7Iyzogd3BldGVyWVlAb3V0bG9vay5jb20Kt6LLzcqxvOQ6
IDIwMjbE6jEw1MIxN8jVIDIwOjQxCsrVvP7IyzogbGludXgtZG9jQHZnZXIua2VybmVsLm9yZwqz
rcvNOiBhbGV4c0BrZXJuZWwub3JnOyBzaS55YW50ZW5nQGxpbnV4LmRldjsgZHptOTFAaHVzdC5l
ZHUuY24K1vfM4jogW1BBVENIIDAvNV0gZG9jcy96aF9DTjogYWRkIGZhdWx0LWluamVjdGlvbiBD
aGluZXNlIHRyYW5zbGF0aW9ucwoKVGhlIGZhdWx0LWluamVjdGlvbiBkb2N1bWVudGF0aW9uIGhh
cyBiZWVuIG9uIHRoZSBUT0RPIGxpc3Qgb2YgdGhlCkNoaW5lc2UgZG9jdW1lbnRhdGlvbiBpbmRl
eCBmb3IgYSBsb25nIHRpbWUuIFRoaXMgc2VyaWVzIHRyYW5zbGF0ZXMKdGhlIHdob2xlIGZhdWx0
LWluamVjdGlvbiBkaXJlY3RvcnkgaW50byBDaGluZXNlOgoKLSBmYXVsdC1pbmplY3Rpb24vaW5k
ZXgucnN0Ci0gZmF1bHQtaW5qZWN0aW9uL2ZhdWx0LWluamVjdGlvbi5yc3QKLSBmYXVsdC1pbmpl
Y3Rpb24vbm90aWZpZXItZXJyb3ItaW5qZWN0LnJzdAotIGZhdWx0LWluamVjdGlvbi9udm1lLWZh
dWx0LWluamVjdGlvbi5yc3QKLSBmYXVsdC1pbmplY3Rpb24vcHJvdm9rZS1jcmFzaGVzLnJzdAoK
VGhlIGZpcnN0IHBhdGNoIGFsc28gcmVmZXJlbmNlcyB0aGUgbmV3IGluZGV4IGluIHRoZSB0b3At
bGV2ZWwKQ2hpbmVzZSBpbmRleCBhbmQgZHJvcHMgdGhlIGNvcnJlc3BvbmRpbmcgVE9ETyBsaXN0
IGVudHJ5LgoKQWxsIHRyYW5zbGF0aW9ucyBmb2xsb3cgdGhlIENoaW5lc2UgdHJhbnNsYXRpb24g
c3BlY2lmaWNhdGlvbiBpbgpEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8u
cnN0LCBhbmQgdGhlIGNvbW1hbmQgbGluZXMKYW5kIG91dHB1dHMgaW4gdGhlIGV4YW1wbGVzIGFy
ZSBrZXB0IHZlcmJhdGltLgo=
