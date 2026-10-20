Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792496457;
	b=zuhKYiOwMoPLRuYtZbEE4I14QNHz/ZyoJxGTltJG4pQhl9djFZIQYbTdVNBpBSmpXay8
	 VcNHMElqBor124KpKgJiDGW+2vc3YwtA2MLSy6tKOjOC/3FQlCK9S1rv/yqqO5yZ2CVb2
	 2AZeIBT4HxebLUwXqSDjS479wmDaSGh+GWPK90MjNTqsowe8C6J+NQivsOz7H1R5JK++n
	 8vMUxC4iHHeicwCmKaiwTKZ7N/Za8FRgs00BznCJcS8LcW13emWZBd4bfOUaNluiCRZyH
	 xx83lfjOr1RMi7KhkqSk4GQyJowoHAgwEBSJtXdxPMg/34Up1x7VHOPvslNKv2U22vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496457;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=+WUBdUXnx8biZMPLu1Oo9g/Y3cnE2fEsHV93TBQZKfc=;
	b=F8j2pi3Smrh9Hj9YypYgyvLevUSUzZcUnqP/n5l/fqSX2GRP0sakwCUwapfiZYzpr0g5
	 uKUF4X6wJRVEOBPvPWPaNq3gE82FajBvgBhiNig3t6Z5Pl041tSAAkgx6/AK5woANVkrn
	 iStio2deH7MpXlv/coMi5th2Z2VQdOTI0ZinwvsS3tR1GbskacCslCOKVRpf+p+Z7WByr
	 r7xE28E9c1+cIZ/chMA/7gJe/LoOe0hHTZIaPB7zDJ2f9ouE0Sf2tnuyvbq/Ls4+3WwaM
	 dw5/xOI/uBcS6QBBA2TU25csabCg58Tc10+4m+UASjbOoGJgTrc/vNLQJBfkYhtp1uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=mfCWgouJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.61
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012061.outbound.protection.outlook.com [52.103.43.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39566606A31D
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 11:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39566606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=mfCWgouJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIEQkram9twQDX7JvzMfbsecuz2iWTYFYm3IJyWCgpkWu28ZJjjpp3lj6/sxPX2MNw71npB3COIAAFHOg9XjVncojybluxNWDRuYYMKzOTVmRCb1frImjY115LCmJMGQheqG5twe9065DJt/rZpbOD33yMDTiEj+8FBmxfZWmrS+CzgN1NHHZgEOLxXyuSaWCsTFC4jqj2Den397w9K9v98xr1cGW8l9v740DcZP0LAzY/PCbIUP7Edsht/z98uzn0hz9wX7Uy9hyMy+o22K3zyySxFNbpCoK5BySYdnERuWPnfTfBiWmXVILto5CxDoKplGednsB8boT2lbjBVgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WUBdUXnx8biZMPLu1Oo9g/Y3cnE2fEsHV93TBQZKfc=;
 b=Ca4S3al6UDGY/CWuaE8Rraggn68QAgJOu5vyayLVk6xgDc3jBrXb3vV22NdpUEEdHZXn3+5eoT4JbjdewcL5bd/ieZc9aTxc8YqmY1RQ3BW6gBa33dDpSPB4lTNDV45fQGs0dzPlP4oe1xj5eFI0TheVnnvWZ0oP7vmf6VYg/AI/oEHReos4L1GZzFwAd9N+25IkLf6DxuybvEIEJXksqaEvkAfjwfcU1L0OSWd4ipGWuogd5BkVUEyfhRoQyKvBW9lX/CfGb36QdezF8/VB6jDwL6sO9wmCE5v7bNodKj+Zd7oegF8ySy7hgnaE57Yyhz3h6JQ3LL6dS2E3pgpeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WUBdUXnx8biZMPLu1Oo9g/Y3cnE2fEsHV93TBQZKfc=;
 b=mfCWgouJP98gFi/404TdAmKkkbl3JWMt4KbbCdc8SParCU2bdusmjdXUmw9OFL9K+Nqsp5fcaImU7btj1xhYlzBAJCFOjow55K1bi/RrALRpRGfZfDQ0x3l6ykma6g4lYfSZsqkAW+1iuXlpe8o3UDn1ckR/LQxA4OlHpGScKAnxwVGKd9hRak8yf7i0DQZLD4TzqzSXPyhYo9xB3E+NkB0LfO+hQSbFl+yCgQoiKbMKZJh55Co+QV3q80+BjXsvUKzsVQpCWfjOL6KXjrb6I0b/7E21WNpbHh8U+I6kvLBBX5gwGfqERtOLILTLamG9os26kLM365qWvpwaTyma3Q==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by SI4PR04MB9308.apcprd04.prod.outlook.com
 (2603:1096:4:29b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 11:40:54 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 11:40:54 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: Weijie Yuan <kernel@wyuan.org>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject:
 =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIHYyIDAvNV0gZG9jcy96aF9DTjogYWRkIGZh?=
 =?gb2312?Q?ult-injection_Chinese_translations?=
Thread-Topic:
 =?gb2312?B?u9i4tDogW1BBVENIIHYyIDAvNV0gZG9jcy96aF9DTjogYWRkIGZhdWx0LWlu?=
 =?gb2312?Q?jection_Chinese_translations?=
Thread-Index: AQHdXp9wp6Yk9TF5A0iu6u9jUIGaubcCjk9FgADCboCAAwB/+A==
Date: Tue, 20 Oct 2026 11:40:54 +0000
Message-ID:
 <SI2PPFCA654364914AAE6CC5F7595F16487DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
References:
 <SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <SI2PPFCA6543649026B29FF8D47801DCE66DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <atTNkdCp3TUJdG5t@wyuan.org>
In-Reply-To: <atTNkdCp3TUJdG5t@wyuan.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|SI4PR04MB9308:EE_
x-ms-office365-filtering-correlation-id: 7d6b27cc-d9a1-40de-59d8-08df2e9effe1
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|15080799012|4140399003|24121999003|22091999003|36102599003|51005399006|19110799012|8062599012|8060799015|13031999006|31061999003|4040399003|2604031031799003|102099032|3412199025|440099028|20061999003|40105399003|26121999007|3430499035;
x-microsoft-antispam-message-info:
 =?gb2312?B?TVFVb0oyQ2cyTVBFTFV4aFBoeGwyRlQ3b3dKN3Jkc3hXcnA5aVFFYWpaMUx5?=
 =?gb2312?B?SlZLeUlScllCSi9CTEhReW40WXFxejBwQnN3bm82cTZ3RGRzTTZneTBkL215?=
 =?gb2312?B?eGVWMjk4YU9nLytWMExhL2FQbm1rbmFqb0ZvTXNMdWVtT1hjQ0ZPVTFQQWF5?=
 =?gb2312?B?TFo3TnNFQis2UDZETkQ0MHNrWVpyTWx0RTIwbmF2UStKM0Y4dWdBT2pYdTcw?=
 =?gb2312?B?NUNXbXh2dE9TWHFGRnAwK2ozWVltRkpJM1BqUm1sTmFtQTcvUGZ4ZFZsL2Nh?=
 =?gb2312?B?OHRoRSttY1RCcXMvd01MRnpwTU9hS2NKUFBGMTdwRVhnQy9lZVhJVmNWeVFz?=
 =?gb2312?B?dVdoT3BJQ09uVGllNFdkSmZLYnpmcW9HeFdyMVBaWkZxeDBGM2VmYVBCcWQ3?=
 =?gb2312?B?OWplWDFoWEtpUWNmWWlMbTZ4MjdQWldpVUtRRnJsOEo0dDBrak9XRkhKSXZn?=
 =?gb2312?B?RzdhcElaRWN5a2dOY2Q1bDdLS1lIRjl0TGhDR1VHWHlmcnNFd1QwK0M0blRH?=
 =?gb2312?B?OTgwdHlVbXd1S2FzOEg2OVdUbWlrN21RN3VqSXFaNkVON3oyQlRHSy83cXVn?=
 =?gb2312?B?R3VMbmJ6NnZjUERlaXNENjRjVjI3M3V6OXhPdVVMY1p0MVhwWlZ2WnVUOE1F?=
 =?gb2312?B?d1VmMnk2WGIrT28xU2djU0hMOEVXSngzLzVQbTgxYUQ5Nzl3RUpQZXJrK2J0?=
 =?gb2312?B?TUxLYjJmc3dpZmhtUE1KcjRuYklHQUlYS1dWM1M3TTRJa0t0UUtISTNRSGhS?=
 =?gb2312?B?OWw0Zi8zM0lqTFpFTDNrU3VWMnlDUitYUWJ4VS9sM1A5YXY0Ly9OdUJnWGtJ?=
 =?gb2312?B?VTBjQzh2Tkx4eHVxV0paekZSWnBwQTdBQ1VJeGUySGRiUko3a0x2TGNmcGJj?=
 =?gb2312?B?dDFJU3VsQlFja2FqUkp5ZGIvNDhZek5rWCs4RkFYOStnSTJxM1kxWGk1ei9U?=
 =?gb2312?B?SUYxeXZ1WGFsaU1XcDJPblJKODZUUmxKMnY0TWNSVFYwY3FHb1ZFZTFwREQ1?=
 =?gb2312?B?SkVKSzhBNlVWSmJtUjNiWnpBZUl4QXVrdExJbFhiVERFSGZaK0JpRURHT0hL?=
 =?gb2312?B?SlF3MkU0U2UrYXN5cXU0S254UlVzSTdISDJPT0JHUzRQRVVlSjZHSCs1V1RT?=
 =?gb2312?B?aUNzblh0S2NBdWdXZkZKSEtRRGhyQVErcHBmOHJaYU1ES3ltSjNEYmhrMFF6?=
 =?gb2312?B?bVNnOGFxazZXc3lLUjNwcnRxKzMwL0tESVIzTUFoS0I5V0R0MllOemhIN25y?=
 =?gb2312?B?aTFnK1FxREdlM09zTHZXMWRKZC9hQ2tSOFRiSFdMVG5ZYmEwbldCbFZ3Z2ow?=
 =?gb2312?B?ZVhSd1RsZVBiR0U5ODk4SFhKNEhyOS82RnB2MFR3bnBHV2RrK3IwaW44bmxi?=
 =?gb2312?B?eitVMTRnem52eVk0MWp6dWlVbFN1dU93L0p6eWZnSm8rc2xEckRyc3dwZXZr?=
 =?gb2312?B?MFhpOHg4RW9iT2FiQjJqNlRLVmpuVEZWdXd3a3JFSUNqMDVyWDZ1cWZtTTlI?=
 =?gb2312?B?QTFFb29zMkpSRWNZTDdOaFJVZnNmbjdrZEFQQVVqbDhHYWxNYWRzelkzTzRt?=
 =?gb2312?Q?0mX1JNmpdKPNcRDB9vXrw2MA4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?eXlmQWgxeGdzdnZMbUNVLzl1SXBjem05NEt5QVY3aFZRdmdXbUZhdjhDMjdV?=
 =?gb2312?B?YmZUOVh4QTdFaDZ6Mlo0MDFYRktyTjVaRlpGMHFob1FXbE14WURHK3pRMHRE?=
 =?gb2312?B?V2tyUFVXbnc0Vm4wdGwxdFJVbGhseGdKWk1kUzZ2dGdpZDFJZUkybHA3cU0y?=
 =?gb2312?B?a0ppY0RVcmtIUnVoUUFhanlzNWhUYmJBN2VkUEMraFlsZ08zbnJ1NVorQ25P?=
 =?gb2312?B?cU5ncUZWcGxjaWdwUUwzUUVzN2Q1STdIWmVSYldwVEREKzhNNUY2WHVJMUJR?=
 =?gb2312?B?UllHeUZkWUZ4Y3E5emtmcXhJVStxaFdjNndJVHdWWUUwdlE5dk9oSmJCbHBU?=
 =?gb2312?B?bkQ0b1d2TGkrTnA4ZVB3MTJFa3lpTGtOYkhwTFQ5YmFOeDY0UHRwYzBDb2h0?=
 =?gb2312?B?ZFg1YmlETGx0N2cyYTg0YzMzWG55aUZLL0FQMDdUaEFxaGZNYVN3TVQvUWhS?=
 =?gb2312?B?Yk1tOG9iMEIxVUlLTjVsRk1EUmkwdmFjVDY4SmtyZUdJdElwN2t4SlNEZnNu?=
 =?gb2312?B?cDhDZmpxaXlucDN3Qyt5WGYzaURmWHVCbUk1bFlMMnoxUWFjWTErRnJOS2Fu?=
 =?gb2312?B?cjlLeUVzc3VXaXdUaldmNGd1NmN4M3RjcmQ2N040MkdFQUtGK1lTU0xuMGhv?=
 =?gb2312?B?V2Fjbnc3T0NVRXhRYURsNnowL0sxUzU5dWppb2FlYlN0SzFUVkwwczhRZnly?=
 =?gb2312?B?YzhoaHpkcU1QVkI2MjM1TGVIR1Z3eG00SmR1Njl0enFHeEkxdmdHb0J6U1FF?=
 =?gb2312?B?bExvVXFvWmp0MDRnVlFSaW5Yakhtbk5adjVTc241QjY2Q014bVYvd3IvaFlp?=
 =?gb2312?B?R2F2aE1kdU1sTUhERlRDMEJKaTBaVkFIRXlJZnZTbzdpcFdSSmFYbkV0UmYz?=
 =?gb2312?B?YmZwcE5FT3FCOG4xdnlUVzUrTDFYSW1aSUVaMHZRZUtJTlJlV2dtM3Qxa29G?=
 =?gb2312?B?aU9uYzVnR3RHTDRZWEUwUC9IdFRlSlY5YUF5dUJjTE5HWXgzZFU5d1dsNnh6?=
 =?gb2312?B?RXVuMUsxaG9XeDFWWkJxUHNoMm12OWxDUENUZG50OGJHYkdYcU4vTEM3eFo1?=
 =?gb2312?B?Qld4QWMwQStXcTBib2FuSzJqc0FIK1dTNVphaWMzc21qTFB6aUF0ckMzbDA3?=
 =?gb2312?B?YjZOZ2txbGtsbW9pQ0MxcmQwekcvd3RyYXVDNzBRVU9iSXN3VUtLcEovQmRa?=
 =?gb2312?B?NTFkdCtiOGNnM2JZeHJKWFNITkVrZWdFSjdTQVhzYnV0YVg4RnY2UFNYODhQ?=
 =?gb2312?B?V0JDcGxBdU5yd0V4ZURZWitYdDNiT1VGRVkzUEJTNkwxVlA3RGtCZThEWTFB?=
 =?gb2312?B?T1NTZkcreUJ3YkVRMG5JelZKM0swbXZNODg0cCtGdDg3SjBvZ3J3UlA4SUdh?=
 =?gb2312?B?eW5GWTdwQ0xLZy91QjBNWjgzc1JZUzZCYUVKZlBENURhU1VvYjQxUXd2TVhR?=
 =?gb2312?B?eEdFL0NDTkpZZzRSc3pOa0p2dTJ3NElYazdzRzcxeFBkdjVYbEVRWEFnUGxa?=
 =?gb2312?B?OUU0UHZPa2NFRUJyWHZlZis3OGtSTitUbTB2cFdqWXE2WXk5UmxqaVRabmJz?=
 =?gb2312?B?dk9lekZjT3I3N0doQXpYb1djUEJxNENZT3VETlZKWnVHL0Q1ZE9WT0tGR0Vy?=
 =?gb2312?B?aE1EdWUwWkNzSFhWeGxDbi8welphMlRtMDZja0ltd2Y1RW12T2R1S3dTdFNH?=
 =?gb2312?B?NEkycTN6QmNHWFZ1b3VabGpRSGJmcFBkZGJZT3VOenJFOXdjNjlJWWtjQ0Ft?=
 =?gb2312?B?WUxveUwyaHlxOVJha3laTk54ZUM0SmFyZUxxSlZPOURLRnJ5aGVicWkzeWh0?=
 =?gb2312?B?R1lNL2c5eGNZS0M0Um9ZMXBIbGxkVGFpaHpyeHZJVVd6YkVqcW41d215VE9S?=
 =?gb2312?B?eUtzWXNOcFM5YVFqM09WcEY1aVlJbWUvckxvazhGL29xeVlQa1o2cEI4ZUxj?=
 =?gb2312?Q?FODguGM2AWo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6b27cc-d9a1-40de-59d8-08df2e9effe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 11:40:54.2317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR04MB9308

SGksCgpUaGFua3MgYSBsb3QgZm9yIHRlc3RpbmcgdGhlIHNlcmllcyB3aXRoIGI0IKGqIHRoYXQg
d2FzIHZlcnkgaGVscGZ1bC4KClRvIGNsYXJpZnkgdHdvIHBvaW50czoKCjEpIFRoZSAibWlzc2lu
ZyBbMi81XS4uWzUvNV0iIHdhcm5pbmdzIGFyZSBiZWNhdXNlIHRoZSBwYXRjaGVzIHdlcmUKICAg
c2VudCBhcyBzZXBhcmF0ZSAodW50aHJlYWRlZCkgZW1haWxzLCBzbyBiNCBjYW4gb25seSBhc3Nl
bWJsZSB0aGUKICAgZnVsbCBzZXJpZXMgd2hlbiBwb2ludGVkIGF0IHRoZSBjb3Zlci1sZXR0ZXIg
VVJMLiBJJ2xsIHJlc2VuZCB2MwogICBwcm9wZXJseSB0aHJlYWRlZCBzbyBhIHNpbmdsZSBgYjQg
c2hhemFtIDxjb3Zlci11cmw+YCBncmFicyBhbGwgNS4KCjIpIFRoZSBbMS81XSBmYWlsdXJlIGlz
IGEgcmVhbCBiYXNlLWRyaWZ0IGlzc3VlOiBJIGdlbmVyYXRlZCB0aGUgc2VyaWVzCiAgIGFnYWlu
c3QgYW4gb2xkZXIgaW5kZXgucnN0LCBhbmQgZG9jcy1tdyBoYXMgc2luY2UgY2hhbmdlZC4gVGhl
IHBhdGNoCiAgIGNvbnRlbnQgaXRzZWxmIGlzIGludGFjdCAoREtJTSBzaWduZWQsIGFuZCBbMi81
XSBhcHBsaWVkIGNsZWFubHkgb24KICAgeW91ciB0cmVlKSwgc28gaXQncyBub3QgYW4gT3V0bG9v
ayBjb3JydXB0aW9uIHByb2JsZW0uCgpJJ2xsIHJlYmFzZSBvbnRvIGRvY3MtbXcgYW5kIHJlc2Vu
ZCBhcyB2MyBzaG9ydGx5LgoKVGhhbmtzLApZaWt1bg==
