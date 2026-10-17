Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012048.outbound.protection.outlook.com [52.103.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D255F28
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245107; cv=fail; b=nu/lLSKIPEN3agK6GRucvtuhjud6618DYHAUztsq8KkPXVvK6eltgj3q5+ODqzacSJwR4RIEnBLkglMaB1s9rMsvFeoLGIjFu/+qB/ml90fEFD498zrZnFCAXB3H8aKkEd8BdO/0xXBW9jC2OEYNJhETjobqqAZhC582Q401xCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245107; c=relaxed/simple;
	bh=Xmhgl5ozxbpUDb3jG2AqX6XJ6NY3NojY+e+AeU/6lgw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z164gLIMlWkgnN8fvokseLsoIR7PqfgHslQr9mIjQBI1r5LxrlCwGsTqwdwdBLIDXyYPGtKH9rfrOjyPFecnEq8JfsKDzaNBzC3dVZuOaYaQs6M90EKA8uhFR02FZYfC2c1kkiwf/Q+Q21NqZYvFasiGT2oWn89n3zMI8Pf6/tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZtqOtQPE; arc=fail smtp.client-ip=52.103.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZtqOtQPE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cntw2pldSpoq9wdXurRy3VtRILtBmIDSHEO84CxVtjMESrMfUlhaVVb9SKPKIXdSICUWtFv/2IOoEEEO8bZwf9jlHTAzMmnh5YttTK4v/DrNlhjiwpRP6WJuR5bdu3dfCpR7cmqTlm6jHrHMjHAfXrMXlbUrbwLXRmf7e7WG41GdN2q+/KVLt4Kwv1Aw5yN7XCU7ZArinuGSWXECwcxbKRN5d+DauAHe3Vx91UJnHw7bGX1cn3TG5U4BsKtv1hnow5lVQsHYbBdNI33Y9wxoSFgJtyvYEu/nCT8E4AXyL9rRxBHdemu6Q/nSmBMi2gzYH8Cc1Dfqrw8csLtvM1C2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xmhgl5ozxbpUDb3jG2AqX6XJ6NY3NojY+e+AeU/6lgw=;
 b=dYhCskCLK28/Lb/GxQJtWk/tPp932KuByL83NpO7ls8k9QBJ2TIVE31L5tFk5K3CEJ7W12jnelwbjZ6P0kPRycyu5BsDMQCSg38GvEXZozgNdJFDSp5SrIebq6w92Kq/BTDmJDgVgAk/Lfu3nr+8x79lYnwPBJRKTKju4ceUHOJvPk9pB1QB6GWw+DelEIpOF9kXFCv1SuXha7DpgfoEHUOJHw2OTUDNIEwN7d8uI6DzZYZD+7QjmuqQNuGUb45uZI9mn0H+mOvBh2QlrdYDLJcAt3nLcwTaVyP9pLbaKYT9JJ5Y439GfTui047TH5sipIwausi/JPHi4V09eGdnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xmhgl5ozxbpUDb3jG2AqX6XJ6NY3NojY+e+AeU/6lgw=;
 b=ZtqOtQPEzTamDCAjLObwb0xhSK6H+PEo+KzN0zLqsJTFO4y6tFOZOxHyXqkQtA5ITmJzDDwfUAunTGiucJoaIs1Z4EOhgPKcqMV9hnp9KiIjodA3iPBev69rsulSNJX8pAX5OrOho9e2dGW/1sqJ27IdqDgtSdS85S3rYssn3MmaTbAEYOSmtA/B4TiVtAgKf/9VR/B8KzJmb0Ox1HFGWJsBFU4tazHxuoD/+YM2mLedNvizkI9HAp0lNikEm05BIgTgP9eeFYQ5ZhSXNvV7Hi4njqEJpApmOQy978eD46CkhVtgU07t6SVZP6HJ7OrIlnaQy6yxei8ir7S6RUI3pQ==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by TYZPR04MB7845.apcprd04.prod.outlook.com
 (2603:1096:405:ac::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sat, 17 Oct
 2026 13:51:43 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 13:51:43 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: Dongliang Mu <dzm91@hust.edu.cn>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIDAvNV0gZG9jcy96aF9DTjogYWRkIGZhdWx0LWluamVj?=
 =?gb2312?Q?tion_Chinese_translations?=
Thread-Topic: [PATCH 0/5] docs/zh_CN: add fault-injection Chinese translations
Thread-Index: AQHdXjN3ZR0rE35toEi7gyuDKnzHp7cBs5eAgAANN0A=
Date: Sat, 17 Oct 2026 13:51:42 +0000
Message-ID:
 <SI2PPFCA6543649FDB6EEB46F840E65F5D3DD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
References:
 <SI2PPFCA6543649B0752EFCF53C275A02E9DD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <cb697787-9479-4ddf-a8a0-fa33cb06fb32@hust.edu.cn>
In-Reply-To: <cb697787-9479-4ddf-a8a0-fa33cb06fb32@hust.edu.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|TYZPR04MB7845:EE_
x-ms-office365-filtering-correlation-id: 80985caa-4557-407d-0e57-08df2c55c6ba
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|6140399003|36102599003|12121999013|19110799012|8060799015|8062599012|2604031031799003|15080799012|15030799006|24121999003|22091999003|51005399006|40105399003|20061999003|30101999006|26121999007|3430499035|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?gb2312?B?Mk00ZWtzUjQ0OWlvY0UwanJyTlljT1pTOEl5VmhVdjZKMzJlcFljT1RPV2hn?=
 =?gb2312?B?NURiT1k3cCsyVzFmM1pzN25ORmo0MHlnK2pFRlpsMXo3TG03RXNvQytFZTc5?=
 =?gb2312?B?Nk1SYjhDOHQ3dEIvaHl2dHFGVW52ZVY3R1lBT2loODhtaGZFRFBJZi9sek1T?=
 =?gb2312?B?czJncnZZUlkySHhLcHpXK3lPOFYwR0xxenhia3gwVkRVRzJ5WUUxaGhxcDFD?=
 =?gb2312?B?Zjg4R2JKaE5ZQlBiN0w1NytaVGkyVENTT3FVSjNIQzVpaU00NDY0dWpRM1Y2?=
 =?gb2312?B?aFNLQXpQdktrWHhMeW9wczdraTNrZVZLS0txNVhrZ3k1aVdDcWQ3SElwRmkr?=
 =?gb2312?B?ZGp1Qm5DM20xeG1XU05zTDZXUUNEM2NYSkJyWFE2cm5TU0xmakVoR2syWm9a?=
 =?gb2312?B?ZDMyMVV2VHNVNlhuTWd4dmNmOTJrUjRrWE1seFVnZkZaaDlkSjc2R0lQYktq?=
 =?gb2312?B?Q25TWUMvRmQ2TFdqUzlrbzVVVEJSRFMyeU5Icld3OWdISGVFWTg0b1QzNUQx?=
 =?gb2312?B?M3BuRXZONnMxSlRibXZMWWZHOUdRWnRJRWdKT3FGOVF1WDEwalB4QlVDMUhD?=
 =?gb2312?B?UW5KcFV6SVpiWHUyRG1EbmR3ODNoVE5ZclpQclRjb09QOE1FTTVjWlQ4WWxK?=
 =?gb2312?B?dHRPZjNGNDJvQUtpL3ViU1ltOE1ndi85V0lTTW5oYmRGU3kzaGVlU1lSV1dv?=
 =?gb2312?B?VVZaRXNNTHgzcVQxWGZRZWZsbnc3ZFd1WnA0ZEZNUWt2anY2dTkzM0Z0bnl0?=
 =?gb2312?B?ejRVRElUMlVaMUNwSGdZc241U0J1VzJyYVU1ekFOREMvS2NNY0xaL1Nqcmlj?=
 =?gb2312?B?eGNtSXhwNjJBTVpXL3o4bDl4SWNpWFZVTWQ3cDVjMDFkOHlMZ1FVYmNEMGp2?=
 =?gb2312?B?eUxhTkczdGZycGlFMlBzaUVNckFxSlBDUkFIQzFUYnlHMkZad1RUS0NBaXhw?=
 =?gb2312?B?WVc3NTNIalZPa25qRG5QTWF0S0J0VFFzMERxQnQ4V3RhYlJ0ZEVoR0Zqb1FP?=
 =?gb2312?B?Zm4rU0NrVnFDeWFUZDNBMENocStzYzZKcjBxVC9PMCtCY3hpaEljRGw2dW1C?=
 =?gb2312?B?b0dHRklDekNndHBZR3E2M2svYWlkdm5iT3R4Yi9YV1pId2tvV2tMWDJzeStx?=
 =?gb2312?B?aXRZNXR4c2xLN21lNkNPa285aEtOR0xaeEh2ZjRQNm14RzZ3L0M1YUZKOHkz?=
 =?gb2312?B?MU01TndWajFNV3FUSm1mVm1qcFZiQjBCYlliMTNhYnVRQkZQMWdXQTlNcmIr?=
 =?gb2312?B?WXVxTHdaUmtVU29XOWZPYzVUWER6R3VSb2N1WW5KUmZzbFNyTCtKNmVwMmFY?=
 =?gb2312?B?alNqbEVCa0hFc21NZWN0NnRxN2p3SkFYUzlmTzd1ZlhGU3JEWTE4Wk13anlC?=
 =?gb2312?B?aWM2N2wzWWZrRjJvZ25mOU4wbE9JR015MS9BWjlOanlWQ3lZNWVBOWNGUFpt?=
 =?gb2312?B?Z0JEQzRCS2RjSEJqN0VmdFVJZjFVOVRmVzZ6ZXFSTmhVdWwvT0kvUmQxL0U2?=
 =?gb2312?B?ek9Rd1pnWjMzdDVmb3plYXBqOFpKQkp2V3E4TnlxOHlLVUV2Vm5VNWxNYkRT?=
 =?gb2312?Q?diJcpivp9EXo7eC9tB6DeS5He5yfZw2vqftkn87FQ+WTdC?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bU9PNTJiQmJGazRLNEZRbGZUaERLbVRZckVpeDV3MnUzWmhEWVhkRmNkcDQw?=
 =?gb2312?B?cm01NDJqWDN6R1pHUFhxSnU0MGxSOWVyYXNtOCtWL3NMRXBadlkxdzArSnB5?=
 =?gb2312?B?a3dPQ2hBU0ZvN00zNzUrMlNQWWFqYjZ6MEJHZFN3SzV4bXFHMlhLWUJCTHR0?=
 =?gb2312?B?bVMveTR6TWJwOFJpaWNLQUlyMlZ1NVEzRUlzbHZxWTR4UVcrZFZ3cThlaDVE?=
 =?gb2312?B?bXlmU2lWTUJ1VXhQM0hiTGl2S1lYSDhNU0JKNklUbENNNjR3bkxBbm5OdUNt?=
 =?gb2312?B?eDFub1R0VjFjTGkvUUFid3p2R21HODBhMHZCM3ZWTUNnQjdTT25EeWlFdkJF?=
 =?gb2312?B?U2lmdUZsa25aeWxCZHl3SjhuL3lLRVc2VC9wMSsybDBITDVONWd1OG1KQWpG?=
 =?gb2312?B?MVMyMEZwekNaV0R3bkNFSVNLZUJ6RmY5TGtUWTJnOGN4RzA4R3U4eXJlT0J4?=
 =?gb2312?B?WFo0UHFVTG5EK0JSdkp1Y21VZkN3TFNJVnR0UktHQnZqSlhlcmxhYjBvc29X?=
 =?gb2312?B?VVA5QkIvWGxSRzRVbmo0V3NhNWthQ1U5aThNQSs0enc1TFZhRExkbEpVelVS?=
 =?gb2312?B?bHJjbFBSUjJxZ2JES3d1TmFrVWdoVVpvdDhDeTVEUzlPMWt1ZUVoK2ZNcldk?=
 =?gb2312?B?Q2h2VlN4akNMNTlpSGh0SnFpRmRMUXROMm9vZmNGOWF3anZVYWNnOWdMaTNV?=
 =?gb2312?B?b0NTRk96L1prTTNTV0poWG0ycTNETnFhbE9UYUQzaEZXZWlOVVkvMHN2djMv?=
 =?gb2312?B?KzVnZU1NZHIxWVJBS0F6dktmNkJER05tNUk1M0p6WS9IR2Q3eW5UVk1pYnVG?=
 =?gb2312?B?Rzk5ME8xQ0UzM1pnTTZGb2VzNUlJQWZ4U21iRkdIWXU4Qk9mZFVNWmNqS0Fz?=
 =?gb2312?B?KzgzZm5HRkJwSEdGblVUYVBlcHJWTzkvOGtTWHdWNlBjTDU4ZW9yNGtBN08r?=
 =?gb2312?B?OUQrSW5oZmlEcm9XeXpPZVB3L1c1QitCQUl5T1I2eXcvdjMxTVpwTmJsLy96?=
 =?gb2312?B?Z2Zqd1FpVFEvMC9HQlF3TWpaWnNBdXU4Zk5PVUU0U0RqWTc5TnpyajhiSXBW?=
 =?gb2312?B?QTdFeXBoQWFPSlUwSHpwWDJYeFZ5K2tGSmpqbW9OaGVUV2tEU0tJaHhJS0Js?=
 =?gb2312?B?aFhYa3U0cmlOaGVObitmUjgyL3hFa24yVlNKTTJwUUw3ZlhuQkhVU2Q3SUU0?=
 =?gb2312?B?ZUsrTUJ4V2YvWnZHMWllcnJIR1JFdFRJeU5kSnhiUk9VV2tOT3BmUmNvM2JG?=
 =?gb2312?B?b3FRZVZVZElVbDNDOXlYazVqZ2lkb0szT29BdmpObGdSV0F4cWIzRTEraG5Q?=
 =?gb2312?B?OXJRdXdqRTBnL04xMlRETkxFM1dEUGlVTlBBWG4zNlpBeHN1K2szaHZKSnlG?=
 =?gb2312?B?aFFrUVBmdHlWM0JYdzVWdGhtV0U2eFoyckpzdlg4eCtOTDhXNzA5QllvNzJq?=
 =?gb2312?B?a1pUTkVmbzkvNkV2aVVmZ1RRY1U2VmlkTjR5TGxlVjZ3Szdtc3kzZ0F3bElE?=
 =?gb2312?B?UGxsaldBVzlvUXQvMHlwdUFYTk1jelAwZkVDb25rc1pycmoyZVJmYk5jNmNh?=
 =?gb2312?B?UERoZnhHQW9CVWI4bCtTbElaTTlmeWlkZENCcXduNml5eFpkblFxOW9xemZw?=
 =?gb2312?B?UlhSOXAyTlJpMXRQUUdRdjdQZHhNYkRGSFd5QjgyMy9ZUks0WktYeWxGblYy?=
 =?gb2312?B?S0NMaTZjZzBsNk5LZmtiM0RFZGt6TExXU3lyQ28xTVl3UURlZWgyWjBib1U4?=
 =?gb2312?B?S1ZNTTlVSTFXRWFQUWxRV1lUOXBxVlRvRXBCcjRIR1p2d0lRd2lYN0ZYcURw?=
 =?gb2312?B?UTI4UElmMkdRN3hkUExCTTRlNEhnV3gvTGY3eVlPekp4TVRaVGxZL082Q3Zz?=
 =?gb2312?B?elVsRlB2WS9yTzRDb2JRTXZoN08zck1BTU04OUtnUkwxcmNvY0Y1Umpuekw5?=
 =?gb2312?Q?OtEhZc61YNo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80985caa-4557-407d-0e57-08df2c55c6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2026 13:51:42.7247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7845

SGkgRG9uZ2xpYW5nLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCBhbmQgc29ycnkgZm9yIHRo
ZSBub2lzZS4NCg0KWW91IGFyZSByaWdodDogbXkgZW1haWwgcHJvdmlkZXIgKG91dGxvb2suY29t
KSBoYXMgU01UUCBjbGllbnQNCmF1dGhlbnRpY2F0aW9uIGRpc2FibGVkLCBzbyBJIGNhbiBvbmx5
IHNlbmQgbWFpbCB0aHJvdWdoIHRoZQ0Kd2VibWFpbCBpbnRlcmZhY2UsIGFuZCBteSBmaXJzdCBh
dHRlbXB0IGxlZnQgdGhlIHF1b3RlZCBjb3Zlcg0KbGV0dGVyIHRleHQgaW4gdGhlIHBhdGNoIGJv
ZGllcywgd2hpY2ggYnJva2UgdGhlIHNlcmllcy4NCg0KSSB3aWxsIHJlc3VibWl0IGFzIHYyIHdp
dGggY2xlYW4sIHN0YW5kYWxvbmUgcGF0Y2ggZW1haWxzLiBUaGUNCnBhdGNoIGNvbnRlbnRzIGFy
ZSB1bmNoYW5nZWQuDQoNCkJlc3QgcmVnYXJkcywNCllpa3VuIFdlaQ0KDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogRG9uZ2xpYW5nIE11IDxkem05
MUBodXN0LmVkdS5jbj4NCreiy83KsbzkOiAyMDI2xOoxMNTCMTfI1SAyMTowNA0KytW8/sjLOiB3
cGV0ZXJZWUBvdXRsb29rLmNvbTsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZw0Ks63LzTogYWxl
eHNAa2VybmVsLm9yZzsgc2kueWFudGVuZ0BsaW51eC5kZXYNCtb3zOI6IFJlOiBbUEFUQ0ggMC81
XSBkb2NzL3poX0NOOiBhZGQgZmF1bHQtaW5qZWN0aW9uIENoaW5lc2UgdHJhbnNsYXRpb25zDQoN
Cg0KT24gMTAvMTcvMjYgODo0MSBQTSwgd3BldGVyWVlAb3V0bG9vay5jb20gd3JvdGU6DQo+IFRo
ZSBmYXVsdC1pbmplY3Rpb24gZG9jdW1lbnRhdGlvbiBoYXMgYmVlbiBvbiB0aGUgVE9ETyBsaXN0
IG9mIHRoZQ0KPiBDaGluZXNlIGRvY3VtZW50YXRpb24gaW5kZXggZm9yIGEgbG9uZyB0aW1lLiBU
aGlzIHNlcmllcyB0cmFuc2xhdGVzDQo+IHRoZSB3aG9sZSBmYXVsdC1pbmplY3Rpb24gZGlyZWN0
b3J5IGludG8gQ2hpbmVzZToNCj4NCj4gLSBmYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0DQo+IC0g
ZmF1bHQtaW5qZWN0aW9uL2ZhdWx0LWluamVjdGlvbi5yc3QNCj4gLSBmYXVsdC1pbmplY3Rpb24v
bm90aWZpZXItZXJyb3ItaW5qZWN0LnJzdA0KPiAtIGZhdWx0LWluamVjdGlvbi9udm1lLWZhdWx0
LWluamVjdGlvbi5yc3QNCj4gLSBmYXVsdC1pbmplY3Rpb24vcHJvdm9rZS1jcmFzaGVzLnJzdA0K
Pg0KPiBUaGUgZmlyc3QgcGF0Y2ggYWxzbyByZWZlcmVuY2VzIHRoZSBuZXcgaW5kZXggaW4gdGhl
IHRvcC1sZXZlbA0KPiBDaGluZXNlIGluZGV4IGFuZCBkcm9wcyB0aGUgY29ycmVzcG9uZGluZyBU
T0RPIGxpc3QgZW50cnkuDQoNCg0KSXQgc2VlbXMgeW91ciBwYXRjaHNldCBoYXMgYSBmYXRhbCBp
c3N1ZTogYWxsIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcw0KcmVwbGllcyB0aGUgY292ZXIgbGV0dGVy
IHBhdGNoLCBwbGVhc2UgZG91YmxlIGNoZWNrIHdpdGggeW91ciBwYXRjaA0Kc3VibWlzc2lvbiBv
cGVyYXRpb24uDQoNCkRvbmdsaWFuZyBNdQ0KDQoNCj4NCj4gQWxsIHRyYW5zbGF0aW9ucyBmb2xs
b3cgdGhlIENoaW5lc2UgdHJhbnNsYXRpb24gc3BlY2lmaWNhdGlvbiBpbg0KPiBEb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8ucnN0LCBhbmQgdGhlIGNvbW1hbmQgbGluZXMN
Cj4gYW5kIG91dHB1dHMgaW4gdGhlIGV4YW1wbGVzIGFyZSBrZXB0IHZlcmJhdGltLg0KDQo=
