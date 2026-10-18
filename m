Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012052.outbound.protection.outlook.com [52.103.43.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AAC30C157
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 02:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792288873; cv=fail; b=kfb3lI5BON1+e/tarSAI4vX1o+0kx6hDlWnBTSQoKR9JpKyFvH5+tCjKyMKnOGyxRUj8zUDd10l43lDColBifjafYKoRpT8yYoD+JZIFnrUT1nwIf7CX7QzSIz2pd5ynrYx92GiA2kyq/XcDVA7J2owtKxDpKuf+gHDh0CqUl8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792288873; c=relaxed/simple;
	bh=llipF8OMVPkjOqmJ/9EHOkSGif6fRiNSg1e3Zydo3Yc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=W25gskIFk6k9YaqGrI1++jOFvssMNJGPK5l7dqO1ooNasJF189zpJpLqnGTBFurzyB90KKE41/QQHKZnMGJM75nP6MbqwYwxWUE7fg9iWPQhD1frPD/PSCPO9iQ0bzkKTgJpJTlNk3O7kZaxJOKyyUFJ4p7IDQ8CF9m8raAls1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lWQ+jKH1; arc=fail smtp.client-ip=52.103.43.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lWQ+jKH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGUV1c5apFRnf1tbL9OrmMyX0KAH1JX+m1kqoGVZHuqb/1zkkxOb3BVkIf11drmYgryt9WgLF3GELYLFxSU2chgr7N4S1OzZjOSMkW6SaJYUO8j+HftlEGLavtFr7MOSCyv6pX1kRyocX+FZ36F4jWEgm5Fxw+exVPNUmf5YC+bHLwmXnO7dTPu1q8csLne4999kvkeOFY+diC02Ki4NG3l8Ig96ofuX5jfyIvitqVMhGDhw6k2/jHWiNlFNYOx6mF+0FzUvd0/iFAO6HcPzMOJqNOsjP+WRFQT+V2vyJSUEwbI0PYzfxv+tMzuqtzfC6HmhjPegmm68Z/cjnkDMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llipF8OMVPkjOqmJ/9EHOkSGif6fRiNSg1e3Zydo3Yc=;
 b=jR+xwLlLO9iETA4vrp9tSfkS+u3Sz8L1CPmZZI4KF8YhHVDIW5sAA8N9ZaB7dQhZWzC+vaBuDeknTbsZmTraivGgabj6FYWKL4vnoJZd9nX3xU/rFwMHPN++bmilrVyipLxmgzb9fvL7Cmcn5wbUSq+akpeVi6TgoZctr7k8jdDDIqQ0S4ClezanJaEhzYyizQblYfvdHgEJ/7RRzVdcDUXjxFsq8Mtjgm2WwyCOIFgNJxjpp92ZdtmVtetlTo2NhNeQJg9Lj7jmxR9K1l+12mgR0COcqxpjpRNgQmduIiZFdj/mVzhx3/4uBFlHE2ICHZmoWNoZU+YdXmHa6jurZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llipF8OMVPkjOqmJ/9EHOkSGif6fRiNSg1e3Zydo3Yc=;
 b=lWQ+jKH1J2HPHThFOcfgaK6juo/Db9a+GBwSYCIIE1nM+qE+0dfaihPRqe2fdVUEifTJmkYWh8j+hbAxbTtu3Dm8yhnwV9A9+PKqXiq0gE9j8KtDHkubWaJaOAA7dMlON0R3G1DkZiVxLJ7tl3u070QL+YRHEKH+jES3SrmcP7eIdWtwucD8HLV5BOlFqmltFmtecCQrdohUCyIfZkaJY+bcsG3iidS0u6eZttei0AaCMObtoxskLPDcqLb7/7dB90g/JDp9QH+E59n0zgciXtE2fXljc1ro5rG9uR9ZrVsB+KtyjSKSzd7Up0mL1z/TN8T/Z9iVy6s6kBHk5TtkEQ==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by TYSPR04MB8317.apcprd04.prod.outlook.com
 (2603:1096:405:c4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sun, 18 Oct
 2026 02:01:08 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 02:01:08 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "si.yanteng@linux.dev" <si.yanteng@linux.dev>, "dzm91@hust.edu.cn"
	<dzm91@hust.edu.cn>, "alexs@kernel.org" <alexs@kernel.org>
Subject: [PATCH v2 3/5] docs/zh_CN: add notifier-error-inject Chinese
 translation
Thread-Topic: [PATCH v2 3/5] docs/zh_CN: add notifier-error-inject Chinese
 translation
Thread-Index: AQHdXqRTnqp6sMXwFEyH0m+kvyl8lA==
Date: Sun, 18 Oct 2026 02:01:08 +0000
Message-ID:
 <SI2PPFCA65436492FCBE5D2A89F5B98E3C4DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|TYSPR04MB8317:EE_
x-ms-office365-filtering-correlation-id: 0fbdff0e-ca6d-4174-96c1-08df2cbbad2f
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|51005399006|24121999003|15080799012|22091999003|31061999003|19110799012|8062599012|8060799015|2604031031799003|4040399003|36102599003|102099032|3412199025|440099028|26121999007|3430499035|30101999006|40105399003;
x-microsoft-antispam-message-info:
 =?gb2312?B?b1lCRmRDRkd4Tlg2THRBbmxpQnlDVjBYSnhSdDgzZDVqVHJjKzMwM08xMVhw?=
 =?gb2312?B?UFVTdmUrR21sWjgzcTVURElyZ2VQRXhwSUw5QkFrZlVBcGdNb0JTcHR3dnNp?=
 =?gb2312?B?cmtGU20wcmt3NWpHRGpHRzRCZmd3YlZreHIxZWJ1ajZvc1FMaDFjUWlzWkZG?=
 =?gb2312?B?RVh5NGpWcWJHUzlXR2dpOWhvbVhYQUViTE5NOFBDSG9yRGs5U1hqOTdWNTdT?=
 =?gb2312?B?MnIxNVdMamo4aHVtbDNkN0JnaUE0QzdHMWVUS3RwLzVBcGsydGd0akFFeElW?=
 =?gb2312?B?am9lOEZCejh0L0FDcmRsOUF1REloV0Y2azB6TzNhTXdLYTkzdVNwUG0rc2da?=
 =?gb2312?B?eVRKRTYwajlJbFVvRm9ENFJ0cmJSRkFIbmZOSXZTUDlMLzAvN2hON1Z0Mjg2?=
 =?gb2312?B?aUpGaE5VY3NERlFyVWZxMks0eklnL0x3YVVQVVFsSWVnNDUvcHVRUHB6UllW?=
 =?gb2312?B?NUJVSFI4bFlORjZVTmQzUVEzT1Q0ZmpEMndWTlM3VkFBZ2laQUx3VnN0TTZ0?=
 =?gb2312?B?bHZuRk1uSEJRLzk3ZkpJNjBBckVnbnpTVHk0UTlYOXV5c05ZaU9kSmRnM2dn?=
 =?gb2312?B?c3QzaFVxenk0MlBXaEVZVlRLdXBnajNybUNwNi9vek9SaFFkWmtYQ0hzU0FV?=
 =?gb2312?B?ZmJwUGQzVjhQRHhEYURMVnB3Ui9lc0o1bzd3ZWQvYnloL012ZStIVzg5SmU2?=
 =?gb2312?B?ZWRrNFpHenpTQ3lrS2ZGTERFcW9OdmRFTWI2d3JOOEp3QUwyS0ZvZ1dUaXBQ?=
 =?gb2312?B?ZkVXbkRUZ1lvS095Z2hWUXhldjF6NmIvb0ZXNGQ5VGUzSmltMUtyb3JGaGRF?=
 =?gb2312?B?NVdFTGk2ZXc0ei9ZSWlJWS9LZFpwR282YzFFVURCSVEzVEFGZk9ydWY0dlp0?=
 =?gb2312?B?Skx0NWJQODdmeUtNdUl2TDdMSmlkYmovSkhVQnptVnpiSmlYMUVQWVRBSkMv?=
 =?gb2312?B?dGJta3NNZFdaQ0xOTmgvaWNEVnVMc01oakUxdW5vMW1veDhkcWZWR21nWXdh?=
 =?gb2312?B?dEpFUEpWRGZTVnVpNlJBOWpUVXMwNk5pUHVFU29VaDNIRUdxTlpYZGVjTlE0?=
 =?gb2312?B?Mkk0S1Z4eTAwd0Z0YXJlbTY2YXB3anF6K2wxc0lFUUhnOFZrTmNmdFZuTnB1?=
 =?gb2312?B?bERZTVZKQktLRk5rSkRpRnZ2VVpSV1A1ZklBS2w2TmxJb3VHNzdwcjgxS0xk?=
 =?gb2312?B?SzZjWlhGbmE5RUNseGpWZDRpQ000amhtOVNENURXNlNrdVJ0ZVJwR2xvWFIr?=
 =?gb2312?B?TldBQ2ZGR3c0dlZWbWx0SHRrTkQ4OGVaWGEvbkRwU1JMOGgvMWpJS0dRd1Np?=
 =?gb2312?B?RjgwODRXdzF4aWpWNzVhQUFNR1FScnZPR0NKY2Jpelh6R2s1Z0lLYXhtZURj?=
 =?gb2312?B?aFZVOXpFUGNONVNrTHk1R3BMQ2tBVEFnNFd3RGtkTnJHaXF4K2dBSzY0QUJj?=
 =?gb2312?B?K004TDVSS0pBc0Nueml4alNwMHAyVElYallITmkvV2lCZnZzd2RTQ3FQZ1FO?=
 =?gb2312?B?ZWpMUTRXdVNzM3E1bjdCUjNVeVo4elAxZzg1TDRoNkg1NDk3Z0YzTXFaUmts?=
 =?gb2312?B?V0FpZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?TUtrTFBLQUF1RWdOb3RHVXEyLzBiMFhXRHJya2dpUnlzQ1VzNzhiYVBhZlhK?=
 =?gb2312?B?QmNraTJJLzUxWk9QTHR6ZkdpTUpNcVVpeC9WTnc2MGtlelVlbFhBS3Z2R0xY?=
 =?gb2312?B?Umt1YXFpZTB3bU1BaDUvZzErQkVZUmtpdURsSWJTVHZjSzY1VWlteDVxbzky?=
 =?gb2312?B?R2VHSmZjM2Z2dnFrRTFvenBsSGtsK2p1MmNPdXUxTkg2SlRpTUNuTldGZldh?=
 =?gb2312?B?ajdFZlJFdFpwR1JHNHVLWk5DSks3OFhpTEdSTDVSTlBQckx3WThyODZSNTlt?=
 =?gb2312?B?Nk5SeVU0bWRzSzFzQ2hUMGxMWlpMblVyZ1JlMktTWEROM250QkhVY01oOFA0?=
 =?gb2312?B?Nm5hbkZkRG55bnFjRUtUeU04MWRaMjJpOVdyM0ZzSVNtbDhtZFVTV2pGeUNM?=
 =?gb2312?B?ZTdrQWRGcHIwcjJJaWJKSElHbEFic2JWUTZFeFI5Rzd4U3IzY2d5MVBBR1Bi?=
 =?gb2312?B?bTNtUXh4TS9vRE9wM1lUWVBmdFdxUFlVeUtFMnkxNS9Ed3NPYTdsSXBReTAr?=
 =?gb2312?B?V3BsSlhkTGRGQjBsR1lxdjM1L3RrMTdRU2dpS1lLaVl6NzBuUnkyR3pzamk2?=
 =?gb2312?B?eXdPOW13VlIxcGtSVzRsUlVQUHYrWW5Fa1ZEaXV2MlJoWXd2V1BhSGJMdE5P?=
 =?gb2312?B?NFpVT0ZMdjk1ZVBJRUExS0crVklETG9yWUFsUDF4TFhicm0ydkJVcGpEZENl?=
 =?gb2312?B?QTRPNi9FQllNSXVuVXJhaGw3eWpUdzkxY0lxajd3ZDBRM3h2UGRMdEp1dWpZ?=
 =?gb2312?B?d05EUDVqVUlXVG14dkhYR2Zkc25XbjAzZm9DU0p3LytZTW1xWWF3SENiSjV3?=
 =?gb2312?B?MnhhMDI2aXNvWnBmSXVrTXBta3ZFd1J5bTQxNmpzWDg3TWpTNC9xeVdiWlZi?=
 =?gb2312?B?Si9tczFKNWJYUVI5TXdTWFRhVUtjNUcrMUZWMjd3RXlhQjBKdGF4aEVETDBt?=
 =?gb2312?B?Y2Y0ZmRCT2huNUxVakZXUFNOVTQzZTIrK0JxUk9TTWphMWhoMy9GdnFxUmZi?=
 =?gb2312?B?QjRWRFo0TUJSS3hBMTFVVktzZFFVTWlpRFNwellGZTRTbTdKRlppVVdoQS9M?=
 =?gb2312?B?dHEvK2MzaDVydUNSbEZkcFVIMmVrYXRjRVFoQlN3Qll3cFhUaHdBaWpzUWx3?=
 =?gb2312?B?N0ZxbGc3dktGUUpFVWoxNmhNRU1TSmZabnlJa2dQUnkwaDdnbThPRXladUFy?=
 =?gb2312?B?dU5sUmg5Zlk5T3RRZTVINXM4eHNjbXJobjJyTExGTlo1cE0zWGdPdjhpTkRH?=
 =?gb2312?B?NUlLSXZrd0Nlem5XTjZRbGUyNmFBa3FCejhWV3NxU0JqeGZWYzVFcGNhcXVn?=
 =?gb2312?B?UFZWaW9GaWlQM1hIL1drbTVINHloTkhrTEczNlN5Qzc0dU9WYURGb2k0b1RN?=
 =?gb2312?B?MnIrYy96ZUtHRUw5KzRFK1ZTcnhsU0lDMjlHYkE3bkZoeS93eWEzQVluWVVV?=
 =?gb2312?B?amxwN2MvUEhCcitMVWNWS0lrN2Zqd29pSVNJd0NTQ1hLRTJJV3NRMERBK1dS?=
 =?gb2312?B?YXF3QkFGYzFodGRQMjRaMzIvc2trUTA0cXlSU1NBWnoyUVB6MmtIdVE3c2U2?=
 =?gb2312?B?NnhBRCs5UWFQVXZxOG05eDBJbVhwb3F1MVZKaDFUeTJwdmhXbUpOWjQ1Q3Bj?=
 =?gb2312?B?NE1rUlliOXMzOVdjcFZMVjVVY1k0Z283VVBhSXNJcGxHWFl1RmliMmNiMmND?=
 =?gb2312?B?SFNaU2dXUnhZc2d0enJoSVNvKytFNVVsWHdRaVhjbWluRUsvQStUNkJVc1Vx?=
 =?gb2312?B?bnExdWdEc3hBa09WbnEvcWthZjlLYklVVk9wWGFFQU83OGFuMzFDYkVLNDRt?=
 =?gb2312?B?SDF2YWcyQnVVektWNmlaVnNVZXVac05lNURxQytDRWZzVVVEbitIVGhXSlFJ?=
 =?gb2312?B?NEZ1RTh6UnVtcE96K1dySGVOTENjUmNocWxteDlPbkF0dWpFYWRnVkhkQjhq?=
 =?gb2312?Q?ZTJ4MXWYJe8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbdff0e-ca6d-4174-96c1-08df2cbbad2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2026 02:01:08.5593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8317

RnJvbTogWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KRGF0ZTogU2F0LCAxNyBPY3Qg
MjAyNiAxOTo1MDoyOCArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjIgMy81XSBkb2NzL3poX0NOOiBh
ZGQgbm90aWZpZXItZXJyb3ItaW5qZWN0IENoaW5lc2UgdHJhbnNsYXRpb24KClRyYW5zbGF0ZQpE
b2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbi9ub3RpZmllci1lcnJvci1pbmplY3QucnN0IGlu
dG8gQ2hpbmVzZS4KClVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgNmEyNDI0
NzEzMmRiCigiZG9jczogbm90aWZpZXItZXJyb3ItaW5qZWN0OiBDb3JyZWN0IHRlc3QncyBuYW1l
IikKClNpZ25lZC1vZmYtYnk6IFlpa3VuIFdlaSA8d3BldGVyWVlAb3V0bG9vay5jb20+Ci0tLQog
Li4uL2ZhdWx0LWluamVjdGlvbi9ub3RpZmllci1lcnJvci1pbmplY3QucnN0IHwgMTA3ICsrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQtaW5qZWN0
aW9uL25vdGlmaWVyLWVycm9yLWluamVjdC5yc3QKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rpb24vbm90aWZpZXItZXJyb3ItaW5qZWN0
LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9u
b3RpZmllci1lcnJvci1pbmplY3QucnN0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uNjMxZGUzZGFhNmZhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQtaW5qZWN0aW9uL25vdGlmaWVyLWVycm9yLWluamVjdC5y
c3QKQEAgLTAsMCArMSwxMDcgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
CisuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QKKworOk9yaWdpbmFsOiBEb2N1
bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbi9ub3RpZmllci1lcnJvci1pbmplY3QucnN0CisKKzq3
rdLrOgorCisgWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KKworPT09PT09PT09PT09
PT0KK82o1qrG97TtzvPXosjrCis9PT09PT09PT09PT09PQorCivNqNaqxve07c7z16LI68zhuanB
y8/y1ri2qLXEzajWqsb3wbS72LX316LI68jLzqq07c7ztcQKK8Tcwaaho8v8ttTT2rLiytTNqNaq
xvfBtLX308PKp7DcyrG1xLTtzvO0psDtutzT0NPDo6wKK9LyzqrV4sDgyqew3MK3vra63MnZu+Gx
u9a00NCho9PQ0tTPwsTausvEo7/pv8nTw9PasuLK1M/g06a1xM2o1qrG96GjCisKKyAqIFBNIM2o
1qrG9worICogxNq05sjIsuWwzs2o1qrG9worICogcG93ZXJwYyBwU2VyaWVzINbYxeTWw82o1qrG
9worICogzfjC58nosbjNqNaqxvcKKworUE0gzajWqsb3tO3O89eiyOvEo7/pCistLS0tLS0tLS0t
LS0tLS0tLS0tLS0KK7jDuabE3M2ouf0gZGVidWdmcyC907/av9jWxgorCisgIC9zeXMva2VybmVs
L2RlYnVnL25vdGlmaWVyLWVycm9yLWluamVjdC9wbS9hY3Rpb25zLzxub3RpZmllciBldmVudD4v
ZXJyb3IKKworv8nS1LG7yejWw86qyqew3LXEIFBNIM2o1qrG98rCvP7T0KO6CisKKyAqIFBNX0hJ
QkVSTkFUSU9OX1BSRVBBUkUKKyAqIFBNX1NVU1BFTkRfUFJFUEFSRQorICogUE1fUkVTVE9SRV9Q
UkVQQVJFCisKK8q+wP2juteiyOsgUE0gudLG8LTtzvOjqC0xMiA9IC1FTk9NRU2jqTo6CisKKwkj
IGNkIC9zeXMva2VybmVsL2RlYnVnL25vdGlmaWVyLWVycm9yLWluamVjdC9wbS8KKwkjIGVjaG8g
LTEyID4gYWN0aW9ucy9QTV9TVVNQRU5EX1BSRVBBUkUvZXJyb3IKKwkjIGVjaG8gbWVtID4gL3N5
cy9wb3dlci9zdGF0ZQorCWJhc2g6IGVjaG86IHdyaXRlIGVycm9yOiBDYW5ub3QgYWxsb2NhdGUg
bWVtb3J5CisKK8TatObIyLLlsM7NqNaqxve07c7z16LI68Sjv+kKKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KK7jDuabE3M2ouf0gZGVidWdmcyC907/av9jWxgorCisgIC9zeXMva2VybmVs
L2RlYnVnL25vdGlmaWVyLWVycm9yLWluamVjdC9tZW1vcnkvYWN0aW9ucy88bm90aWZpZXIgZXZl
bnQ+L2Vycm9yCisKK7/J0tSxu8no1sPOqsqnsNy1xMTatObNqNaqxvfKwrz+09CjugorCisgKiBN
RU1fR09JTkdfT05MSU5FCisgKiBNRU1fR09JTkdfT0ZGTElORQorCivKvsD9o7rXosjrxNq05sjI
suWwzsDrz9+07c7zo6gtMTIgPT0gLUVOT01FTaOpOjoKKworCSMgY2QgL3N5cy9rZXJuZWwvZGVi
dWcvbm90aWZpZXItZXJyb3ItaW5qZWN0L21lbW9yeQorCSMgZWNobyAtMTIgPiBhY3Rpb25zL01F
TV9HT0lOR19PRkZMSU5FL2Vycm9yCisJIyBlY2hvIG9mZmxpbmUgPiAvc3lzL2RldmljZXMvc3lz
dGVtL21lbW9yeS9tZW1vcnlYWFgvc3RhdGUKKwliYXNoOiBlY2hvOiB3cml0ZSBlcnJvcjogQ2Fu
bm90IGFsbG9jYXRlIG1lbW9yeQorCitwb3dlcnBjIHBTZXJpZXMg1tjF5NbDzajWqsb3tO3O89ei
yOvEo7/pCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiu4w7mmxNzN
qLn9IGRlYnVnZnMgvdO/2r/Y1sYKKworICAvc3lzL2tlcm5lbC9kZWJ1Zy9ub3RpZmllci1lcnJv
ci1pbmplY3QvcFNlcmllcy1yZWNvbmZpZy9hY3Rpb25zLzxub3RpZmllciBldmVudD4vZXJyb3IK
Kworv8nS1LG7yejWw86qyqew3LXEIHBTZXJpZXMg1tjF5NbDzajWqsb3ysK8/tPQo7oKKworICog
UFNFUklFU19SRUNPTkZJR19BREQKKyAqIFBTRVJJRVNfUkVDT05GSUdfUkVNT1ZFCisgKiBQU0VS
SUVTX0RSQ09ORl9NRU1fQURECisgKiBQU0VSSUVTX0RSQ09ORl9NRU1fUkVNT1ZFCisKK834wufJ
6LG4zajWqsb3tO3O89eiyOvEo7/pCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoruMO5psTc
zai5/SBkZWJ1Z2ZzIL3Tv9q/2NbGCisKKyAgL3N5cy9rZXJuZWwvZGVidWcvbm90aWZpZXItZXJy
b3ItaW5qZWN0L25ldGRldi9hY3Rpb25zLzxub3RpZmllciBldmVudD4vZXJyb3IKKworv8nS1LG7
yejWw86qyqew3LXEyeixuM2o1qrG98rCvP7T0KO6CisKKyAqIE5FVERFVl9SRUdJU1RFUgorICog
TkVUREVWX0NIQU5HRU1UVQorICogTkVUREVWX0NIQU5HRU5BTUUKKyAqIE5FVERFVl9QUkVfVVAK
KyAqIE5FVERFVl9QUkVfVFlQRV9DSEFOR0UKKyAqIE5FVERFVl9QT1NUX0lOSVQKKyAqIE5FVERF
Vl9QUkVDSEFOR0VNVFUKKyAqIE5FVERFVl9QUkVDSEFOR0VVUFBFUgorICogTkVUREVWX0NIQU5H
RVVQUEVSCisKK8q+wP2juteiyOvN+MLnyeixuCBNVFUg0N64xLTtzvOjqC0yMiA9PSAtRUlOVkFM
o6k6OgorCisJIyBjZCAvc3lzL2tlcm5lbC9kZWJ1Zy9ub3RpZmllci1lcnJvci1pbmplY3QvbmV0
ZGV2CisJIyBlY2hvIC0yMiA+IGFjdGlvbnMvTkVUREVWX0NIQU5HRU1UVS9lcnJvcgorCSMgaXAg
bGluayBzZXQgZXRoMCBtdHUgMTAyNAorCVJUTkVUTElOSyBhbnN3ZXJzOiBJbnZhbGlkIGFyZ3Vt
ZW50CisKK7j8tuDTw7eoyr7A/QorLS0tLS0tLS0tLS0tCivT0NK70KkgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMg1tC1xLLiytTKudPDwcvNqNaqxvcKK7TtzvPXosjruabE3MC0suLK1CBDUFUgus3E
2rTmzajWqsb3oaMKKworICogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvY3B1LWhvdHBsdWcvY3B1
LW9uLW9mZi10ZXN0LnNoCisgKiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tZW1vcnktaG90cGx1
Zy9tZW0tb24tb2ZmLXRlc3Quc2gKKwor1eLQqb3Fsb7K18/IvfjQ0LzytaW1xMnPz9+6zc/Cz9+y
4srUo6zIu7rz1NrNqNaqxvcKK7TtzvPXosjrxKO/6b/J08PKsb340NC5ytXP16LI67LiytShowot
LQoyLjQzLjA=
