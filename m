Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012053.outbound.protection.outlook.com [52.103.43.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D326FA4B
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 01:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792286946; cv=fail; b=Zd6ifavSYmhdS3u+rrk1kQA8fysj58upH45OcnsccIwDpI1YIQUBRGykc+y0UTk1SvYNmtg3ZmsSmGgL3ymhVF080cidPmz2XrGpycA81t5Mcddz0hhuG1ox5zQmlpAyGnbd7nUYTyYbp62XQ1ltTRNQuTczDvO7bVB21xHP1nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792286946; c=relaxed/simple;
	bh=5W8mQOm+O28GLWqDrPjMNiXHEA3+i4H+X2Lx+5BDk6g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UXaQY+T1HxyDBSh6utitiDiW3wyryXTHW3lYOKqfaIfJdiaoN7Dp5llNS/D+nUSqF05e8eun2jryv+dtxByxv2h+ybokk7yv6TQJ9c3M2Cx7dEZVvqRgqCWgFdDPNxcgcNMGcPjbHdO1nWJn4JXDj83JsJO8WIPQEl7Do7kz14c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pxSrDU1r; arc=fail smtp.client-ip=52.103.43.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pxSrDU1r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4GaGLEd3GAk6X5jdqdpuB3h+2UVItYXO41zKmkoOPfZkxfKr7zvwStmktd8nCYZSFQSZUjnjLnsc37mzudIPnnGYoMg7bTpw6PCjSHEVrHm/HUW+zrNeuM4bCI4wK4DYQOaAMkZaTKtsXQmDS3AAi0uevNhz3X50o/ddtoNaUpdWxHjxCxBCydsTHDhKwqlccXEG1+YRxVnOtQBY7tVLwNh1JYAZLTtCZXV8rYHP2V5kmowGcPxVJYbUDoSitO4pnANin6WvH8Ol7MVTn/bdVAMgW0qrTac8hHdfuaAG0acekaICSzJBvpazB13Xq1RO8Cn7ifOv4nwOOs+zALbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5W8mQOm+O28GLWqDrPjMNiXHEA3+i4H+X2Lx+5BDk6g=;
 b=SaW9t2p0L/boX8T2bkt3IKT82Z5P7u32gZhVZ1b01bvHKhY9XcuyT2+msFBfU6mTjiU5+PdkElVJ1RZYxi6xoAo8yLbV5JryOTK3NLwnVlMkX+4e5yYzY0Q1FoljEsdH8foJmO6xy4+RfDXP+/fzSYy46lHd7QiMUN/Bno1BcV8z4euOy1RZP4F9piL0L9hUqJSX5F+OXQQFtsB0cScqWfGJbryKWyfcRQFOM5dXzj3I+N3KKJQlDPbwJhR+XhrVXMaBMsDn7k7/H9Gj9IblGFNwy2eZFV4BfhnguBMC9LOLeRpTAMPtc0EvnQmqr4MspmtRQ2cuB05uH9Df7YKpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W8mQOm+O28GLWqDrPjMNiXHEA3+i4H+X2Lx+5BDk6g=;
 b=pxSrDU1rProp1eTBpwMUAQxQwr0T5JfkvAYM7AV8xGCWIBcD9vyvP/DFTHmJHBiEpp4eLr+ss7GJmYGmTD/egcAxKo07TtvJuQeYsVln43nwDEDL5Uw/ZaQ/roh7c46i4CDOlkvLEPWThexCnD3WPC9rqDKZprStmxfKLZ5rWFdUxhohsZnpuZ4pRqfuiyo+RtXdfuoSmGOHGcVbNMb0lx6gYqscGELK9qMf1B/YK6viFIUgjEyhTOdn13N6WpOc42wIdPDaBaBotMLe3PaaycqeH3NyHPMZMRe74N2wYkoKAqo7N06olLMABsEUm4JhNVmAz/aaAAVq30iJ2X0oNA==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by SI6PR04MB8221.apcprd04.prod.outlook.com
 (2603:1096:4:240::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sun, 18 Oct
 2026 01:29:01 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 01:29:01 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: [PATCH v2 0/5] docs/zh_CN: add fault-injection Chinese translations
Thread-Topic: [PATCH v2 0/5] docs/zh_CN: add fault-injection Chinese
 translations
Thread-Index: AQHdXp9wp6Yk9TF5A0iu6u9jUIGauQ==
Date: Sun, 18 Oct 2026 01:29:01 +0000
Message-ID:
 <SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|SI6PR04MB8221:EE_
x-ms-office365-filtering-correlation-id: 2b5bca06-1cb8-40a8-5bed-08df2cb73072
x-ms-exchange-slblob-mailprops:
 Mga27o8vReFMpJ98Mhe2mHSRKV8H2BuVIfCuNjdg6IntSozEOiIo9VeFep6kj3QLY1Fz2nledshy2wdLLuOfh1YXNzKebJc4jcd0f4+2WKR5KFicnWkNnXjTip7xc3Mv6Yh1F1umivylE+n1/GMKd6JN4W8hZ6Bj2oz+Vr053MYxjqA36Qq3iw7s1z12ecCnhzYn0pXPWZ/5aykVNeNufEGPosgJn38qVzK/AjxbmAD8ERJeCk05jWi98Jb3NAoqqHfnmTj2rFCKmrVE9XNLi0tdr8OtYCM0aKV6r4m8zLyLPpuY9Kll7u1kXu4Ie3IkTYvuez5neL7U54lUE5PxFLFbGBpZIa7J16J5aWHH0IbJed0g/7Tr734y68lV84/P7Cj5ec79fdQTlH681wAbJHW/WHyU3Nx1EHqbDUKPkInj4mVlIf8uKwO0sLGOS5pNNAI59rSkCnbtFRIZr0YAFHQWmm5MEHPBLJE+RObXCSh5N6OcvZ+aHXtYT1HOmDu6BvdoRm3yhwJCGfwORJNfYa8r8C2lttLrRfhCr0x0oMakrZect1KUoQ1M70qXSSofil/TBu7NFTQ2fXbTtWtk1PxutSo0ceptUdDX5ULT1N0UPrO4ffG+vyDbUCWND68p2u/APGXqJ5M+PzeYJuDUE6+szqfgshuB3l4nIRZERssl5/NbuwLltWszMMIshkscPYHj7kYUJ1L28a/c82v1Do+Fp2ZbdZzm4/QdEFsWOStLzKS0V09LZ7eQ/2Pb2FKsD32tNvpWcMZhqac0f63V5OmjuikASNGjBdHlj5+HQo2zwYuUeHujgg==
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|36102599003|6140399003|24121999003|22091999003|31061999003|8060799015|19110799012|15080799012|15030799006|2604031031799003|51005399006|40105399003|20061999003|30101999006|26121999007|3430499035|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?gb2312?B?V05TU2RYbDNwNUVqMmJweHE0K1BKMGJhd3llK0xlRjNpdUNLeU15alE3QkNC?=
 =?gb2312?B?eTJud2dNdHVyT2tmNTg1dDJ4NjBMa2R5aWZpM0I1YlF3T3VwVEdYNTNCNmJV?=
 =?gb2312?B?UCtzQ2VpR2pWalE4dHJJZWZJbkNDSjdid0Y5M0krSDVhWFBDd0JHcnVGQmly?=
 =?gb2312?B?elNtdzExUVBhZDVuWXh6d1dna0hKQnJ6bjJTZzEwcUdtN2RuT1YvKzJUK2tj?=
 =?gb2312?B?eGFEamE5L0ZMMDF5LzNYSkRYNEFNTThuNHV3NXh4S2xPRjAvOGRYVU1xQTNj?=
 =?gb2312?B?MVNaamNmSlRWUkNjRXVwTjRhME1GYVRKMlMydmE0RkhVa3lSc3JaVmlmYlhB?=
 =?gb2312?B?VkJZdmVPQlROUGVLVCtOaEVEME1Wdlg2OUpxdS93WjZPQk9zdExMSlVCS2x5?=
 =?gb2312?B?Z3JVcUlVUlBmVGF5cEh2REZVM21VaDdXMmdKWlBSUExDMElHWVhlSnpzWUVI?=
 =?gb2312?B?T2RnV3I4K0RHc3BDS1N4YS9NbjU0R0hFZGw3TStHWU8wczRTTHYzVXBKZjdI?=
 =?gb2312?B?V2d1L2FIczMzVnFDNmsvMGVFTlI3eHVMTlhCTHhBOUxOMmhBekVCNVZUeG9r?=
 =?gb2312?B?MDVrVFFvL3FqODFoaDEwRmJlT0lqMC8vcHVZVkJmdHlUdHlhaHlyOGE2cUJF?=
 =?gb2312?B?c1lyM0lRN1V5SlZXaXd2QzA4UjAyMTB1Z2owNWxWQ0NoZkQ1Y01uSHZKZXox?=
 =?gb2312?B?Qm9pSXVuaStKTDViSm42Y3loUkZnVVJreXkzUklhUFM1UmJsMk5DaUY2N1pK?=
 =?gb2312?B?a1pNdis4eTEzcCthS1RMOHF4UzRpcm80VEFxSzl0SmRpQ2VyaWlEeG9MRmpv?=
 =?gb2312?B?UUF6a0tzSGRTVmNRc01Ld1hrOC83YjRSKytTQmVlY1hDRytjV252L0R0ODBX?=
 =?gb2312?B?dTh3RzhsSXNaa1FlMTVxSHI2UXByaVNNWEFHakZqVnRjN2oyUjNqSXVsbWor?=
 =?gb2312?B?TGR3dXpzWU5FaXI3MW1GTDFKMmc3WmVEV1lLU0JlMytYMDBRR0VBTnVyeDIv?=
 =?gb2312?B?dSt4dUxEZUc2RGZ6Y3VJTUU1L21taW9aZDJGalRJZTg5aW9GNXRiem4vSHN1?=
 =?gb2312?B?azZpaXF4SWtVN3kwMHZyVnNiSE1tbzJmMVVNOEhSemVPcW1kZ1MwL1FnYUpC?=
 =?gb2312?B?aTBsSTRNSVI0SEZQVnNRd0JQRU5vRlM3QzVhWXZXZ0JOWGtBWGJYYkthTDdu?=
 =?gb2312?B?TnY5TzJ3NUZ6QWJldGhva0h0MDFDUmZGSkVQSnZqeVY4a3FIZis4UVZ5T2Q4?=
 =?gb2312?B?S0VNWm4yVWZWMmdsaDhtbDB0dVgySTEzZ3NsS1RDT3hQdU5EZjZKN09uNE82?=
 =?gb2312?B?SkJuaEtTcllNWE9xR0tvY0JvSGJUNFRyMUNwanhEajVQL2NvYmxuU2xyTktJ?=
 =?gb2312?B?VmtlditCWVBpSFBFL0JlRDk1UHVPcVJLN0h1c2FaYk9QNWNiSEVCamhKbjdO?=
 =?gb2312?B?eFExL1lFbys2WjNVV2h6NDhveWhCU050RWtsWTluUVZRdVFqK21ucHRNWThH?=
 =?gb2312?B?OFJlRGJJdTFZSS9QREc0OC9kYm9uSVMrYzVSWTVHbWhsNzQvVko5a2JJK3Vr?=
 =?gb2312?Q?uivOsNYFtpAdpKbHLVYV32S+w=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?akpOd3Vxb0NhK29lZ1BNekV2ZWV1K1F5SUFxdUcwbDB1NndPS05yVDhLekNQ?=
 =?gb2312?B?R3ZZNkxXbVBvTzQwbkZZMXo4b3VsQTJiRWM4TkxtdkFXbXlMMkFKVkZ2cktF?=
 =?gb2312?B?MTM1YnRBcGJUcEdBRkF4c1JPVnNrbUxqNzhjOEhRdTh1UXZUNExDblNmM21z?=
 =?gb2312?B?SUZOK0dMdzJpYXE1d2VTUysxUmdmSm5lSlVCYzlvV0dUTjNzS01zNHFHRGxw?=
 =?gb2312?B?WFMrNFRDMkJUQVU3L0tYOTRpMWR1VC9tTEROenhaSmp0Z2lnNHcxallwUWc0?=
 =?gb2312?B?UXlDaTV0ODFid290RU14Q3JiOWsvZklJYXlvQ1hDclJFMmJlQ0dPQjE5NDR6?=
 =?gb2312?B?eHIwTU1ZS0NiRnd5YkdVMDlxWUxWd0QyaXRkNFRTeFYzNW1uVnJPeU5WZUpx?=
 =?gb2312?B?WkJ2Vy9tMkdvcFpnbW9VZmlxKzJUamJ4aVI3UTRVbW9FS2RJZkJTU1R0ZUky?=
 =?gb2312?B?TUJ6QVdCQllxeDhHV2grMGdqTXFMaG0yLy9WTENwcjZDZHhYUU5vL21jU200?=
 =?gb2312?B?WnYxL1Y0Y2YwVUhTVHJ6dzU5bUJrTzFuSkJ2MlBvbHB0Z1VwVGwvK09OU1Jk?=
 =?gb2312?B?TEFrLy9PY01xRGdhSlE3SnlRTUNKZGl0MGZ5SWNTNVE2S2twM2V4SVJBYzRx?=
 =?gb2312?B?cXZoWE5VWFAzeW1UTlE3K2dZQWZDY3NCWVV6SDZYL1JqNk9DVVRUVTBjZHgr?=
 =?gb2312?B?aFNwc2pQQSsrVVgxQVJ0Zmx6WVhZbTVmK0tkd1MwOUVBNkFhV3RPWG5CcUpi?=
 =?gb2312?B?NzJiZlFBeGlWbzc3QVNJMGlRQmxUME8vOWRzMCt0NUR1K0dzM1IwcUtLcitR?=
 =?gb2312?B?MDlEd2lTV0ZmV09qUXpROHM4ZXBGK2MyQWs3VWl1WE84M0FEL3ArSWNEcDRu?=
 =?gb2312?B?VHMyMjV0U1Q2cDQ5QVNjN1B2YU9PYnJMb2VNcVRsV1JnbkJmTitMRG01Zkxo?=
 =?gb2312?B?dDRyVFMzeDM4bS8vT2RzT0xIZ0FjeDZqUnRRTUpZQjd1dHQ0MU9tV1lIT3B3?=
 =?gb2312?B?ZldvbVJEQ213WVlwWjYxQ21NK1NVV3pjUTVTVkQ3bzc5WHhwSUllcW9Cb015?=
 =?gb2312?B?K3hNMElENFJWeTZoSUk1SitKVENHVmN2ZnFZL3gzMTZZM2x2SktITnRaRDFk?=
 =?gb2312?B?T2lZakxiajF1UzRpcE56bk5hcldnSDNWemYzMnlKTjNvVjIyQWJyYWFrM2o1?=
 =?gb2312?B?dUtQdVVoR2Q1R0FnQnp5R3NVMWVUV1l0bmZ3eUViYUJMcldRY3FCMDBBaVRH?=
 =?gb2312?B?ZFVNYXRpOTVySXpkWEFuOG1Lbjk1NGNidkJydXRVNzF5OUM4VG1tcitQZ2F5?=
 =?gb2312?B?QVZaQjc0OTZ5MCtGTlpNZjhpVThxaWdoZDdOellsY3kzVkxHc0RBOUVlbmNM?=
 =?gb2312?B?SExhK3ZHTGN2Qk5kdjFMeFRKc2ttcjh1U2thc0l5TWhOVHpneGdNbHhBOXZY?=
 =?gb2312?B?aHJjamZIMUdrc29DK004QUF2bUpobEJDU3dndDBJakZid0QzMEcwbVNPZ3lC?=
 =?gb2312?B?ekthUUlGRFVpQmZ3U3g5WDF0MjhwcWMySzEzQnVxK252MlZlcStCV3NCdm5B?=
 =?gb2312?B?U255K1JnRlYxcjh2ZFBidC9lZExjZ3dwQ3BYLzl3V0dNZnpKZHM5ODBybTYw?=
 =?gb2312?B?UEhsaGFzcWRyUEszVzU0WGcvVkRzNmRhZXY5OG9yejZGSjZRT1o4NmRST1d4?=
 =?gb2312?B?NGJJbk1Hbmh2VWZDdnVyTW52a0I0SVJKZ3dFcFVHUWhNM3g1YmpHRktEa3g4?=
 =?gb2312?B?REZzWDcyT0o4cnBSQ1Q5YitySVVITEc4SXBSMDRSTmJRNGFwKzlWVXE5bDI5?=
 =?gb2312?B?MC9VQ3BEYWVQWXBHN0pKRXBvUWdKNXFvZ3UrdnRRSy82VUxreDlqOHAzOXZa?=
 =?gb2312?B?UXF0YW1RYXY2MVlBZ1UzRmxCbXh1d0NXWlBuVXpjdnNNS0N1ZVpNcWJIVVNM?=
 =?gb2312?Q?spjmJileMIE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5bca06-1cb8-40a8-5bed-08df2cb73072
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2026 01:29:01.2734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB8221

RnJvbTogWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KRGF0ZTogU2F0LCAxNyBPY3Qg
MjAyNiAxOTo1NDo0MyArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjIgMC81XSBkb2NzL3poX0NOOiBh
ZGQgZmF1bHQtaW5qZWN0aW9uIENoaW5lc2UgdHJhbnNsYXRpb25zCgpUaGUgZmF1bHQtaW5qZWN0
aW9uIGRvY3VtZW50YXRpb24gaGFzIGJlZW4gb24gdGhlIFRPRE8gbGlzdCBvZiB0aGUKQ2hpbmVz
ZSBkb2N1bWVudGF0aW9uIGluZGV4IGZvciBhIGxvbmcgdGltZS4gVGhpcyBzZXJpZXMgdHJhbnNs
YXRlcwp0aGUgd2hvbGUgZmF1bHQtaW5qZWN0aW9uIGRpcmVjdG9yeSBpbnRvIENoaW5lc2U6Cgot
IGZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QKLSBmYXVsdC1pbmplY3Rpb24vZmF1bHQtaW5qZWN0
aW9uLnJzdAotIGZhdWx0LWluamVjdGlvbi9ub3RpZmllci1lcnJvci1pbmplY3QucnN0Ci0gZmF1
bHQtaW5qZWN0aW9uL252bWUtZmF1bHQtaW5qZWN0aW9uLnJzdAotIGZhdWx0LWluamVjdGlvbi9w
cm92b2tlLWNyYXNoZXMucnN0CgpUaGUgZmlyc3QgcGF0Y2ggYWxzbyByZWZlcmVuY2VzIHRoZSBu
ZXcgaW5kZXggaW4gdGhlIHRvcC1sZXZlbApDaGluZXNlIGluZGV4IGFuZCBkcm9wcyB0aGUgY29y
cmVzcG9uZGluZyBUT0RPIGxpc3QgZW50cnkuCgpBbGwgdHJhbnNsYXRpb25zIGZvbGxvdyB0aGUg
Q2hpbmVzZSB0cmFuc2xhdGlvbiBzcGVjaWZpY2F0aW9uIGluCkRvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2hvdy10by5yc3QsIGFuZCB0aGUgY29tbWFuZCBsaW5lcwphbmQgb3V0cHV0
cyBpbiB0aGUgZXhhbXBsZXMgYXJlIGtlcHQgdmVyYmF0aW0uCgp2MS0+djI6CiAgLSBSZXN1Ym1p
dCB0aGUgc2VyaWVzIHdpdGggY2xlYW4sIHN0YW5kYWxvbmUgcGF0Y2ggZW1haWxzOyB0aGUKICAg
IGZpcnN0IHN1Ym1pc3Npb24gd2FzIHNlbnQgdGhyb3VnaCBhIHdlYm1haWwgY2xpZW50IGFuZCB0
aGUKICAgIHBhdGNoIGJvZGllcyB3ZXJlIGJyb2tlbiBieSBxdW90ZWQgdGV4dC4gVGhhbmtzIERv
bmdsaWFuZyBNdQogICAgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBObyBjaGFuZ2VzIHRvIHRoZSBw
YXRjaCBjb250ZW50cy4KCllpa3VuIFdlaSAoNSk6CiAgZG9jcy96aF9DTjogYWRkIGZhdWx0LWlu
amVjdGlvbiBpbmRleCBDaGluZXNlIHRyYW5zbGF0aW9uCiAgZG9jcy96aF9DTjogYWRkIGZhdWx0
LWluamVjdGlvbiBDaGluZXNlIHRyYW5zbGF0aW9uCiAgZG9jcy96aF9DTjogYWRkIG5vdGlmaWVy
LWVycm9yLWluamVjdCBDaGluZXNlIHRyYW5zbGF0aW9uCiAgZG9jcy96aF9DTjogYWRkIG52bWUt
ZmF1bHQtaW5qZWN0aW9uIENoaW5lc2UgdHJhbnNsYXRpb24KICBkb2NzL3poX0NOOiBhZGQgcHJv
dm9rZS1jcmFzaGVzIENoaW5lc2UgdHJhbnNsYXRpb24KCiAuLi4vemhfQ04vZmF1bHQtaW5qZWN0
aW9uL2ZhdWx0LWluamVjdGlvbi5yc3QgfCA2MjAgKysrKysrKysrKysrKysrKysrCiAuLi4vemhf
Q04vZmF1bHQtaW5qZWN0aW9uL2luZGV4LnJzdCAgICAgICAgICAgfCAgMjAgKwogLi4uL2ZhdWx0
LWluamVjdGlvbi9ub3RpZmllci1lcnJvci1pbmplY3QucnN0IHwgMTA3ICsrKwogLi4uL2ZhdWx0
LWluamVjdGlvbi9udm1lLWZhdWx0LWluamVjdGlvbi5yc3QgIHwgMTg1ICsrKysrKwogLi4uL3po
X0NOL2ZhdWx0LWluamVjdGlvbi9wcm92b2tlLWNyYXNoZXMucnN0IHwgIDYyICsrCiBEb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3QgICAgfCAgIDIgKy0KIDYgZmlsZXMg
Y2hhbmdlZCwgOTk1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rpb24vZmF1
bHQtaW5qZWN0aW9uLnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rpb24vbm90aWZp
ZXItZXJyb3ItaW5qZWN0LnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9udm1lLWZhdWx0LWluamVjdGlvbi5yc3QK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVs
dC1pbmplY3Rpb24vcHJvdm9rZS1jcmFzaGVzLnJzdAoKLS0KMi40My4w
