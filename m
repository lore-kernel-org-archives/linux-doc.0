Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012053.outbound.protection.outlook.com [52.103.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66EE46DFEB
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792240894; cv=fail; b=MQ9f9luSO0Nmhz9PoOYAUsdH5leD+py+qEZgo7OvFKVFREgXiaSzJgyYmo1REp/gnN4l4TwqUMeqd7q5arR7LqJNI0zukD3Z0WkTAncJFLsdhhKmBQ9qBFFEyBFdoLRQr+rnqSFBiSxPdjgTBbeAxzILSQu/MTF1mc5R4j6yfO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792240894; c=relaxed/simple;
	bh=lKP6J2t5X5hqfPxPvX5uJxR3lgN2IQlbGqNcgw2K8II=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WjbdJBrKho991ghR7yIp+krMZkfW+Jj8d9OoaQHJcn+RT6Rlr2U2wMPtP5NLevFpzxUkvBGDvJL5Jzybpvyq58CmtxGCkhP6awWC4JvkcRDgu3fpAl+h6aB8QljMAizSQl0b3WnrSYNGp5XCt3PhOE9ikEewCIWdIkki7UbipcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=I8kz+27T; arc=fail smtp.client-ip=52.103.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="I8kz+27T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAcIYN+l8QiPskYeJygRqPR1nORoVfHC/GSKqmy7AgU4Bo2ionfoFj/WAQqbq0JGC948qE/Jq6dMpGgzO94IU0koMjYM2Fwi2k9KVbyZojdcORjvf4NdnHSw/B5eSJPdFKBJVA9ddku3v1ir2rXkU/UbjtG0GXYAp1CJo5YM6PUOQEKkQzckqNYUus4LwokBiBSnOvOFNIGmcxVrKw1IOC8ZiVFd8gSPTQQyfXdmlNUpMyP71EbZQyav3CmPcOHyQDj2isb57SwfmG5x2GsrUsHLCExC2Vs3E8nOnZj5PHDIbx4Kd1bNF4WaQEsxVBW0D7Q0rULv8fRuVr6Pc1zyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKP6J2t5X5hqfPxPvX5uJxR3lgN2IQlbGqNcgw2K8II=;
 b=jKlddeM328GgFkSVp+Vbw27WdgcodNzAjHvbMAwtaRyXEOTd68vhD1Su+bXeWE/xrt3gCtsUZ5INphgN9f2L4pIuuoIuUKpwn9EVbDNF+ctlhjJ0rk+2rZ1UXQIHc0ERQNgpeyUmHuiCA+afzQeAIZ8N/K5fPUfBgmQGB9Ychr6Y48PWRuY4WiVxTNcsyWcDkYYILe+2fg5qhKu8ZsZlVNJ3rWg1gPgUR64ftnWJqNSG4zIZWZGcRKucHVlXQGZYt/oMgR1Nr5UdADWGbehgTgcQp37ejpu1g65xrYvOAvIVRjkutbKMIld8NjeFZBa2PNxeYE27sVbRpDy7mMuAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKP6J2t5X5hqfPxPvX5uJxR3lgN2IQlbGqNcgw2K8II=;
 b=I8kz+27T3CbAsJF92XsgZ8WFY1EY8DIEDz5Yy+KJs/KDKtG/EVXkDGcd6ZgADtUvzXTQjdiXq7xrcfqaqO+zmwP87PmFcV00Ztxf5rHUTR0p6uxnYAReEB+kerJYLRV3qBIthYNoLhxkQgPLcsJ3nIyCjfftHvWZ7gb4VMa1tAYZiF8oevnZFIbFz+2tA3UEcStWFGLgkKN5PE8w/HMZBP8lQtpCvxfSARpETfWK2Giql85AS/R1B/MBLbQgv/5xurBrb+0jirLpXuvPk7sxpC035qjxAVHs8RUIT3OltnKwf+VGYbYr3zbk5/vgZ17TRgKwFZKW5eSSca12KLjpMA==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by SEYPR04MB6433.apcprd04.prod.outlook.com
 (2603:1096:101:c2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 12:41:29 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 12:41:29 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: [PATCH 0/5] docs/zh_CN: add fault-injection Chinese translations
Thread-Topic: [PATCH 0/5] docs/zh_CN: add fault-injection Chinese translations
Thread-Index: AQHdXjN3ZR0rE35toEi7gyuDKnzHpw==
Date: Sat, 17 Oct 2026 12:41:28 +0000
Message-ID:
 <SI2PPFCA6543649B0752EFCF53C275A02E9DD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|SEYPR04MB6433:EE_
x-ms-office365-filtering-correlation-id: 3bca5470-2ac1-4950-2639-08df2c4bf70a
x-ms-exchange-slblob-mailprops:
 JXe7TI5Vt+wYF1Du72KGLTOOts9Bq9cVDMNLdjmREhD8HNLTiqGSFtU5n2s6kzVqptxIZu6SYNfrl4mfdyYOcBRT2Z1J69i8NyzBlfS1to6WRl6C0UNHc4DuD4FourQZE0+n5xA2GOjwkJGpdMtJQV9ZPlNJsGCr2v6Zluyhlq1BZY8u9nkGW60YZBUi4Xz0A+/sPwYuSTHqcmhr4WXLrYoAfS7xOVgTleQAptFvPpxz5jzAln3620kYDwktWFSxm9DhpkN5Q43B3gQj9GC8plcMFFj2exiZdrPMWnTdxNJhrrQ/In6jWogDovzGA7R+7fRc9rdv/FVDJ2am9a/7vU6Y2Ws2uE3pHRYkEhkQr4NpcBCHMi5icREryMkPXsWFUI8SncTJHpj1jZq9T6XECExdBL1vBz2Wk+E+cIjSbJtSUvNpYzjZSWVLiH/94BGYWEtNZ10O0wEoWGGLSIShTvkpH7lKcUqG/ca2vqEFrGo+eq5wbVs581L7U0zHVQ25zIDNn2EGlfxWdgSp38pOy33zx4NB7Irc74RN2D+JEv06EOWV95otUgSOvC73UJWHM6+kMKaWBTuKUWR7l74xz53iDsG/IZ2Z7qX6svF7zc1WQXyRW98rC+ai6psF/v/iHyybGZsWmjSuvKmYf9L/jOCiGfluhqMIY0idyaYBBPmjMJX8tlfQt313O2zX4GQ1GKGUWaWeebRGa3sWS0h0KD9Q+BkxUSkDkva5Lm3aMHw=
x-microsoft-antispam:
 BCL:0;ARA:14566002|20031999006|36102599003|24071999003|8062599012|8060799015|19110799012|6140399003|4140399003|31061999003|22091999003|24121999003|15030799006|15080799012|2604031031799003|39105399006|40105399003|20061999003|30101999006|26121999007|3430499035|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?gb2312?B?d2NmYzU3QjNhNUhya0RRSW9MRmhaUU11SmlURkpIbzJyOVM2NHJMT1drTkNV?=
 =?gb2312?B?ekJackVDNVpteFFaL0Rjd3NYZUFiWkozcDBjMnNjZm5uS2gzWFUydVRWSHZV?=
 =?gb2312?B?aVdPWFkzUnFMRk91K3pFRGdrQ0w1MkNWREZ0cWxoZVR6RFpEbzU4T21lRWpn?=
 =?gb2312?B?L1VVOUFxNEJuelh2Y3JERUtXbkprRXhKS2RvT1hEQW5pUUVyRk9SUW5aV2p3?=
 =?gb2312?B?NVpSVytzRThLRnZKeVNrMEhsSWRFR0VpL09rQ1lzK2R2a3lXTW1hU1FOYW5i?=
 =?gb2312?B?RmltY0I0eWdDQmdiOXltL2tZeDVVcUVydTJUWEVxZTZWcm5XR1VjUllQdkJB?=
 =?gb2312?B?YXo0VzRsMDlLSlZ3NTJRMEtXUTdOTW0ybHhuZy95K0xqcmRTcjBZOFdneExR?=
 =?gb2312?B?UWRVamljU3Y4SXJFRlVnUnZjcGRxaEJKbTM4Mkt0NU5GM0pnS1FLT2ZMMmhz?=
 =?gb2312?B?aTV5UzlZQXNqTEErTjdocVF1NE5LL2tQNG1ZTUlGVXBkVkpGa0hxSEk2MEpI?=
 =?gb2312?B?Zks0Nnl2cGdLQXBPTjY3YnVObUtKNjRLdHNlVm02dlQxdi9vaDhzVFE5eUl0?=
 =?gb2312?B?Rk5RbDZIdGhHeG43Q1FYMWRESFhzaVNnOG0rODRsRHhBQlF3dUV6eTV6MlY0?=
 =?gb2312?B?b0x5NnpXQ010SkpjRjNIaFFUN3l3aDNGTXNhTnVjWTltZmNQdmRScFNjOWxu?=
 =?gb2312?B?NThqc3RrWUZ0K0I3RDFsOGlpVmFyYjFGeUJrdm9YdUdXSHZ6WTRrU0xiaWYz?=
 =?gb2312?B?VTVlckV2a2RuU2JXKzh1TXlWQlBFVUxoVmRLeXFHUkMxSHRkeTNOM2gzS2pu?=
 =?gb2312?B?MXR6SGlPSm5TSVBoSnIwdnh2THRGeit6SkdhNUhCMFQ5c0hSbFRIVTlPQlRZ?=
 =?gb2312?B?NjRzaEtLbm9BQko0YTBOM01nZzBUVXAzZlNlNHhPUE1vbFdRY1IvdUIxT1U1?=
 =?gb2312?B?N2FlTEZHN2ZLRlc2ZHhkOEJsQ1FwWnFQTElUMnE4a20vaXRXN1hCZk41NmtW?=
 =?gb2312?B?S3Nob2tTMXdXSmxNU2lvb1RNVkZEZGVmR29YNHFXYnM4MWVKR081WElTM2l3?=
 =?gb2312?B?ajRLOXBpa25NeW1LaDJNRVNPaVAwQ25EdDlXSlAzcDQxT2sva2N0K211K0E0?=
 =?gb2312?B?ZzN2OGkrd1cvK0JrQUNCclo3S2NqdHJTZUtlakd0NFg5aVAwUHROL211M3NJ?=
 =?gb2312?B?dVUwTmxyT1hFSk9rbXYvMkR1VTNwU2huSmpKQWpxZ1hudWxZeDlxMFFEN0tz?=
 =?gb2312?B?a1hGSk1IUE9qSTF0MGhPREp5NXo4SGNxL0V0UFVURzk5VWRoZnM2K0xFNGpJ?=
 =?gb2312?B?MzI3YW12N1RoNEtjaVlwSVVYTUVIcVNUSGxEZzVZeDRwSXM2ekZzeXdBZWEz?=
 =?gb2312?B?REpkZlN6VFhYTUQ1UXEyV3ZqR3J1TkorWFMzQWtZNEdpblJ0eVc1YUg4cHJn?=
 =?gb2312?B?WXBiSWVtSHNKSlpkcXFpWk5XdXFQYjg1bmxzWnB3aVAzZ1FERWdReXJBWGVT?=
 =?gb2312?B?bkR3eGNyRmxLb0VvT3p4RFRpdDkvMXFkenlBSzdVUC9oZXBjdllTTEdUWjhy?=
 =?gb2312?B?ZGtGcWx0N2dkMnp3OG05aU9Wem94d2VZSVYwL1E1ZlBPSDlYUm9jeHJRTWFJ?=
 =?gb2312?Q?WV8HtVFFIZTmND3WiXmvfIQvyEf6ujYCKJb6ocFBbP+o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?VCs2WXdscGN0YTN4a3k1M2QyZ1ZycHI5dXltZkdwSEZSd3A2TnpZWS9haUNW?=
 =?gb2312?B?K1NVb1Nuc3QydER3YklrYXFlbm1kWUFTNnBQeEhjTDVESTAvQWgyMUFaWDRD?=
 =?gb2312?B?dEZ1UzY5WW9UMHdhdHVzQ1MzY28vdXQyRkl0TkZMbk1Ib212NHFURWM0Yndv?=
 =?gb2312?B?WTF6SFBDZzVtNVBVQ2ZodzZ4anYxRHFWUlVHb0UwWk5wUFRRODRZVlpka0xw?=
 =?gb2312?B?UnA5VVJaeDdDcUJiWm9sNFBlLzQ5RHJreGxmQ2ZoU0tEZ2YrV1MwMWdmbmIw?=
 =?gb2312?B?QWY2WlVVZk5NYk5ocTZlUWNDdkRuaHFwYjJHbUU1UnNZcWtjbFJBWkZ3YTFr?=
 =?gb2312?B?c243Y3U3Sk9mTExhNkNZbGdaU0VVSXl6Yy9NSDRwQ2xQc0U1Nyt4OUhoNkM4?=
 =?gb2312?B?eVZNeGQ4VHpBemZxUkQrUk05TENaS3RsczNiaGkrYmI0WmZPMGFWd3M1bmky?=
 =?gb2312?B?ekkyS1JIdHNEMUJyZnFIWVlyR3cwVHJ0MVZ1RUFjWHRiRHRPYmo4dUVrUjNp?=
 =?gb2312?B?N2JZUHlqam5sVWFDZU9ub0cxbStjVnRBeFp5N2hxN2g3aFI5ZW5RVngxeFVP?=
 =?gb2312?B?dzQ0WEVKMHhFSHhoekN6L3EvQ0xoNzJlbW5WN3lWZWdZak1oSXd3NlJGTzFt?=
 =?gb2312?B?RlVNUU1wNlRWVyswN0RYWm1GK3JMZVRnSHlKVnliSkFPV2wyVzY0QlRMUFNp?=
 =?gb2312?B?SysrMkJrcFhIRHUveUQ2WW9qeDNINFUzeWlBZjRZaTdtcW02ak9vaURPSkpE?=
 =?gb2312?B?UGxVS29ISWlwY1VMbk96OVcwbUZpV0VXVys3ZDBxV0JacDJNdFJpWnJJdTBk?=
 =?gb2312?B?bzdJek5wRlVkZkpHY3NrY0VpV2tpd2pHOTZ3WFBNeksrc1NocUZxR1Z6cHlD?=
 =?gb2312?B?NTZFME9RU0k4WmtLREQ4RnB3WHUxdEtJNkxjeDlhOUM5amhoQXU1RWpMSWdJ?=
 =?gb2312?B?Mmh1b0cwQ0xrSjBXL0tISlFMNXNpYXNQWmdTbG5HMDE0cUNyRGhxRi81OFlX?=
 =?gb2312?B?QmpLK1pTQm1xQ00vWjg5WTlkd3FkRGhoZ1lNemM1bkUrVVR1RWxvZXc3YS95?=
 =?gb2312?B?STY2UUZHVk14YWpFRG84a1ZRK2wrVUR3dk5ETzBIa1diSGE2MjE2YS9hM1A5?=
 =?gb2312?B?aXdBY2xKODZVK2dPdkxJL3lnNmxHWDhjano5RnhRU1BxbndTYVlBbmp2OERP?=
 =?gb2312?B?a2xhNGlmdXdodEVqWUlEWXFZQUZTSFBzdFhYaDVkbTkzdDVJd0lrUWUrVUlM?=
 =?gb2312?B?c2lpZnZidTVoVXl0czNXMmwwaEExU0V3TlJsdjVBVzdjWGIxTWJlYWJBcEI5?=
 =?gb2312?B?Wm8vTm9OTHBuL2dMUmhrYk9NUTFnNnkwTnF1bUFBcUREVDlZUkdMZzVXVG1n?=
 =?gb2312?B?QjJ5N280YkFPS3R1NlBTZGlrYXhjSTlRYnJ4SGVKWEt0cWVvN0dod1RnZTMz?=
 =?gb2312?B?T2F1OGtka2I2VzFkaG43UGxZVzdRU05oWGJuSGRWc2FWMHR3MDZIRnlxNThk?=
 =?gb2312?B?MkdJWHFMUXhWVDV3SXd4R1dnR3BHbTRoVXhtRDVpcXpmbFNJRU9JWGRRM1ZW?=
 =?gb2312?B?eDlKT2NpMTJlczBTQXlEb1VkcCtPS3dxU1BNSWtmZ3YwRE1zeUVZRDVTOWVR?=
 =?gb2312?B?cDBsTThtZ29MaWUyZmFJNEtteEdmQ3Fvc1I1UWpCRit0SXV6enp1MXZiaFZF?=
 =?gb2312?B?Q3BiVzMzWVlXRSs1djAwWXNuT3hQZWQ0WlB6VzE2bVQ1THBYenRFWGYyM2k1?=
 =?gb2312?B?cXNKaHptVnVucVZ6QVJNWUc2TlUxTzYrUDVSaTcrM0ZMN0FDbitVQ3NNRzZN?=
 =?gb2312?B?UzhCMUFWYWR6UHVkeFVxN2VtME1sZGdzQ3VsMnJEZFExWXN4NGJiUjgyNkFK?=
 =?gb2312?B?RHJ5TWloWE41SzR1V3ZnNWNQN0ZXZXVyU2VLdzRPT3NaZ0JjczZIVFJTSHd2?=
 =?gb2312?Q?jZPlkCzBZ9k=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bca5470-2ac1-4950-2639-08df2c4bf70a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2026 12:41:28.8676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6433

VGhlIGZhdWx0LWluamVjdGlvbiBkb2N1bWVudGF0aW9uIGhhcyBiZWVuIG9uIHRoZSBUT0RPIGxp
c3Qgb2YgdGhlCkNoaW5lc2UgZG9jdW1lbnRhdGlvbiBpbmRleCBmb3IgYSBsb25nIHRpbWUuIFRo
aXMgc2VyaWVzIHRyYW5zbGF0ZXMKdGhlIHdob2xlIGZhdWx0LWluamVjdGlvbiBkaXJlY3Rvcnkg
aW50byBDaGluZXNlOgoKLSBmYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0Ci0gZmF1bHQtaW5qZWN0
aW9uL2ZhdWx0LWluamVjdGlvbi5yc3QKLSBmYXVsdC1pbmplY3Rpb24vbm90aWZpZXItZXJyb3It
aW5qZWN0LnJzdAotIGZhdWx0LWluamVjdGlvbi9udm1lLWZhdWx0LWluamVjdGlvbi5yc3QKLSBm
YXVsdC1pbmplY3Rpb24vcHJvdm9rZS1jcmFzaGVzLnJzdAoKVGhlIGZpcnN0IHBhdGNoIGFsc28g
cmVmZXJlbmNlcyB0aGUgbmV3IGluZGV4IGluIHRoZSB0b3AtbGV2ZWwKQ2hpbmVzZSBpbmRleCBh
bmQgZHJvcHMgdGhlIGNvcnJlc3BvbmRpbmcgVE9ETyBsaXN0IGVudHJ5LgoKQWxsIHRyYW5zbGF0
aW9ucyBmb2xsb3cgdGhlIENoaW5lc2UgdHJhbnNsYXRpb24gc3BlY2lmaWNhdGlvbiBpbgpEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8ucnN0LCBhbmQgdGhlIGNvbW1hbmQg
bGluZXMKYW5kIG91dHB1dHMgaW4gdGhlIGV4YW1wbGVzIGFyZSBrZXB0IHZlcmJhdGltLgo=
