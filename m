Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013086.outbound.protection.outlook.com [52.103.43.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D42347C6
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 02:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289132; cv=fail; b=DqJgoUk5o3DtO58VhqEX2DBARflDf+ht70aVHCQ/Cm7dB4rQeI5Cki/6pNrQ25wjoDKmx4KrS4u1viciRGHgH63qz2QrCEj3u3mO25xt1nUUQpOMKPtuQdCVr18zKlGC8vQBD1dHU/jC+TL+amSVD1TYScSkJTVodA03Ex4QME4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289132; c=relaxed/simple;
	bh=chYdYK4ubOtappzTQf+fUF+n8FNh4RWTPM6NmU6kD+M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=neuJJJzCfx1iE+k8lKa5I3aq49ptea9j/u4IdyM2C7oODJzp39gMRMbIYaX73gfOVfUo3aehBWt+eqz/FgqwhTl/TzYtU8kGS5r0euzD5eQfc8mZ9dxTmvVCZOeup4kmSqI9JPSqOBpPA8QoC7dPmT2kpHkBw3dLAfIqRsGFK7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hIja8WHM; arc=fail smtp.client-ip=52.103.43.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hIja8WHM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k63b56pDnq5TjGRIUakVGzp8Zd0i/veyS0f8kUamK7cQKLiuhq8Zyf9aArBDqLLcThbOli5ajsgyan2ehZ7BX/q8Qs0gWDRmtKpRYkqucfHpAK1h9bnLinl4fvvS3u7ROAG6pkVHXcdohlp03oWPZHb66yK9uM3capJzwrW2SoTGs0CUH7F2DdPEGxZW5RnqPws9eFIXfJ1LNCXIwlVlId/qMwq14V5KSVGF1MIA/PBHAgQmivNuI4Y0+zWgKoI1WeSYrWXbDj/Vv9JubuZZokyDIFg7AQr6SSclOwN8ggMRjbahNQNSAtG9H7koc1cEwf8MkFdjbL1k96W4KaR7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chYdYK4ubOtappzTQf+fUF+n8FNh4RWTPM6NmU6kD+M=;
 b=AsyPvA5sV8QjCBftN/PHjUZnb4wPT8IhHVFUmSm8eScTnEaXBI8l6+9MVisVJKTyUdxq9XThrpAbB9EdVv2fxJkGaE+6G6yu/Pr6hC6XY4xLuAmjVzechPvxqfQN1POsF4CnK5PkjH4CXk7+ZsSPs1aTZQzg25DRKWz/pojtplQ7akjJnjuPZGm4HwH/fvDRZzVpGFWUrZeD733S499f1uYOMcLQybG7CKCGThmT5yGRATMdeHYMNsn+p1N53NaeawnbUKBEc8XSRLSWLrvf+GXgAC9/XKdfwgFN9cxE/UTf+UKCLDxA+uXRo2c2bofvKtJlXlMPhBa/0+PGYfclgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chYdYK4ubOtappzTQf+fUF+n8FNh4RWTPM6NmU6kD+M=;
 b=hIja8WHMprKWnqQ08VS6NmgFJjYA/MRv/w8JjJkZLQrhX87bPVTIYhD6L/Tspraz9Uf34vbsaEoxMyoC/qCAzf41ceM/yAYIy2tsLcr3uO+JMxFQ3WK/jwHc8TZ1LQoAzNCVNmRzMH4Cz0n2ZiXkyU4lEBSU+h/A77+MZZ0votWFeSFK8pFSbjNyOT30+oypy/zjOSjSgB2Zir5kn/bxwtRqReHbtmYulukg8DpU5jL3JNoGtmgKIk7EzqBjv73mqWPBZiMOigePggYywsNqRBdR1kO1wVHiwN8UTlW13Zchqta9LB4K3wpy7AGVqXXvspzHXZI+b2ZE7PWYkCdGTw==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by JH0PR04MB7309.apcprd04.prod.outlook.com
 (2603:1096:990:3c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sun, 18 Oct
 2026 02:05:27 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 02:05:27 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>, "alexs@kernel.org"
	<alexs@kernel.org>, "si.yanteng@linux.dev" <si.yanteng@linux.dev>
Subject: [PATCH v2 5/5] docs/zh_CN: add provoke-crashes Chinese translation
Thread-Topic: [PATCH v2 5/5] docs/zh_CN: add provoke-crashes Chinese
 translation
Thread-Index: AQHdXqUOHOC2MNfSsUSEuRKEaEWu8w==
Date: Sun, 18 Oct 2026 02:05:27 +0000
Message-ID:
 <SI2PPFCA654364980BF35D94946A318F310DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|JH0PR04MB7309:EE_
x-ms-office365-filtering-correlation-id: 9d5da947-553d-46f0-4cfb-08df2cbc47be
x-ms-exchange-slblob-mailprops:
 Mga27o8vReFMpJ98Mhe2mHSRKV8H2BuV+Rn0tSd0YBDE5R13eQSrpi3wQw/30AuUs+/Xr/4ppkWOdXgRla8nOcGu5mdmJcO1VQ4KY3aUaGG7hQ1BDsM4ZFajrcIy27Sx/TeDH9yfy+ZEvogIEhWLBFLF8xNGeqGbSEat4Pg2s0nf97V+fJle6SkEiqmj8SN+iqM+IxfHJ6HfI3sU4qCLNa5dJ3ShLWDOMGTmeDV06kvsWZUnjMtmu90pxu6e4siq1cuISLH29FeHp0EvVJfn4+Nof3g0n4Qql3+KpQCcWcsyrJk6McCyOh9T+2ngROqbcgdEHPGQSvYNfS4ffEAGY2oOng5dpJ4dEDbwXCB0vfi6Wi/XdMERx8JvIHngb/WI3OeldQ+lBifXYv5vmJG0FsN6qujA3zKxPWnrfYaB9wYDGZ8zfQuQqF60+OheDsS4hN4Ri3XHdTJmwnmqVp61VXmndwHjBiIGPX9gLBOX9ncIYvqwcTADVwxy7tJ3kNA8VYG/11LUnELDmXid5sHVIzk4DXAWr+fM2uRVs70vKaBmstRAWDJo1PAkb7xNJ46YGdPg5SSwZoayO6skKhRTjG/43/BBvsJ+gJK+4SPblaBSO0RGGtCWMHz9THo2sSQMPPLAk03jIaKbHISZAnvGn6OqaeSZSDrQMrI9+P8+oov1qw5cllReb69fjeXJz8Dh1fHOQciEkyNKb/J95W0Cek4+/lss8/6gE3Pxv6GWO9s/hEClkaX35FDS2gqKD0szLAnXi6zxJD78nV39hKpTOufZYDnX5o1c8x/EApiRZyp9lRrQyaRZoA==
x-microsoft-antispam:
 BCL:0;ARA:14566002|22091999003|24121999003|51005399006|15030799006|15080799012|31061999003|8062599012|8060799015|19110799012|36102599003|2604031031799003|4040399003|102099032|440099028|3412199025|40105399003|26121999007|3430499035|30101999006;
x-microsoft-antispam-message-info:
 =?gb2312?B?dDVUTVBYcVE3Qjg1eEVNcWtESlo5RnI5SlZyZWFjaWFjWFM0bVhkcEJhWVhJ?=
 =?gb2312?B?YnM5STFsbXZnTi91cTNKUDZpYU5qUWxTK2diQ09OYTVVMGtOaFIvM01SYWtM?=
 =?gb2312?B?OEV0a3I3Qk1GVjMwS21rTnJjbHFNVCtvTUlaV0dKbGptZVBIV20vRVB2cWEz?=
 =?gb2312?B?bzN5MTZNMFQzSEoxbE5zeFVUVjlxaGdacGgrMWVSRTJwQXJpWXQ4aU8wTEZu?=
 =?gb2312?B?ZldqMElXSGNicGxUaGxIcWNleGZEYlMwa3c3UHFDQ1NZRytyVmVXTVJQbVJD?=
 =?gb2312?B?WkQ5SWdEOGRmMGptWXlscFpOT0xEQ3NrMU9Fam9OMnczKzV3OGY2TlFCZm83?=
 =?gb2312?B?Z3ZlbTFLVFpXM1JzdS9FZ3YvY1FpcjJQdUNKdWNyMkYzVHR6RGNSbWVXOEFV?=
 =?gb2312?B?aFFPV1g3QzhRUEVteWlicU82a04xMTJyZ3FiUVNWRFY5cXVteGQ0WDUzQTVX?=
 =?gb2312?B?RWtoQnY1Wmkvbm1DZ0YwUlJsZG1VVmF5ZmpFSGNvN0w0dmZKQm0zODVmSDFW?=
 =?gb2312?B?NkVybHIwSGtVQWJkSzVoRUMzclhlUE4yaDhncHQxTEtmRHpPekdadGl2VjNZ?=
 =?gb2312?B?c2I0aVFrQUkwb3JuSUYxZTA5R0JxWTV6L2VHMEpuU1k3UXdzZ2Nmb1hHTWJU?=
 =?gb2312?B?Q09FN2hnanJnUjgzSndqSmxmbVBqTXFWc1d6MitrcU5GZmZUdS9HTTdpMWJR?=
 =?gb2312?B?ODJuQU1jdExPcEcxeDEwbTR4dWtLTS9zUWRCcG1ndzFsMGwzWmIwNlVHOGhF?=
 =?gb2312?B?M1NZeHRGVW9rbzE5YnhMYTNJYUl3QTNhQzJ4TmpLTGUxaHRGbnFLeHVVOHVB?=
 =?gb2312?B?d0grbEZKSkttNGZUSUJ3MGJ6a1RsYnRDT2NuNVV5VlJyZ3M5ck1PWG0zVnhp?=
 =?gb2312?B?cjVnK0F5dUNMVjYrckVvZmJ5T1doZ1V0bFNNUzYwazlHRGFzTUs5WjFieWRa?=
 =?gb2312?B?cUdadldTbWZuU2E2Q0hDNFR1cG1uQzE1RVBRMzBsbUdIckYwbkJzNmZ2QlBN?=
 =?gb2312?B?V2xSUHZmdExjSlB2Y1dHZDR6OThYY2FmT1hiOTUrTHEzSTkyWThQYjRCVUZE?=
 =?gb2312?B?NmN6TXpRRUFIcVl0UG93dHFpL3NCTXZQcjQ0S01NeTMra3RHbjBlMnZqb1N4?=
 =?gb2312?B?MmpMRW55QkUydGhuU1krQ0NGYVRhQ2IwNy8yd1BkcWl6ckdTd2I2QlZsQWRS?=
 =?gb2312?B?cFpzRUpsbmRqak82RlUxVnYvRm5RN1RzUEU5dmM3cHVDSEoyUm9OT2k4bmli?=
 =?gb2312?B?akV4eHBKZE1RWHlDRS9wclU1Tkg1NjFXMFhRajhXOGNuK05YR01XYmZBN3Mv?=
 =?gb2312?B?UTNWSzBxenFnTVFzb09rOHV6MkpyWmdGd3VhQ3BrMktZMjBMS0RROU5JcDBR?=
 =?gb2312?B?WEt3QzQ2LzYwOHN0aGNOK2hVWm4xdktqblBURnNEUS8veC82aHNDSEN2MmJ6?=
 =?gb2312?B?SmZTU1I4N2pPa01MVEZJM3QxbXorVi9tWGV6Uzhhb0ZxZThEOXdUaGxCbzBH?=
 =?gb2312?B?bUFyR1lMSll1RlEyVXJSQlRuSERSb0tPY0pKZS80c1A1Mkx1NFc2aUhkMVNn?=
 =?gb2312?B?dDNXZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?dXJnaHEvSm5vZE1LNmJlUXZRa3pBR1RCY050aUlya2xPamdLYXFQam96U0lE?=
 =?gb2312?B?b21Ed3Q5ZHBkd3VnQkxQanE1M0xVVW12SUJDSnhJdlNIczlJRU5yWnBnMCti?=
 =?gb2312?B?WkxYdm1TNlFhbzk2MnpRV29LdGxxZndGbFFkVHNkMEdXWFBvejgxQ2wydWpo?=
 =?gb2312?B?MUhJNXlkOE5hSUtEdlo4TzVvYnp2OHZ1cDNKb0hwN2dKQkJtT1hIdERNRnpI?=
 =?gb2312?B?V0JJemo3ZU9PeCttWmdXZFB4dmhyNWRsblVjZGlKRG9acUo3Q1IwK0dXV3Rt?=
 =?gb2312?B?WVd1ZHNxR2RlemZmSEdjODZ3dU51b202aDhINENQNVg5eWhoOSt1MXR0REZG?=
 =?gb2312?B?RkNFV0xTS2haeW4wbWVLSUhJWXZrVFdkT3c4LzI5TmllT2hLWXJSejBwVERB?=
 =?gb2312?B?Uy9FakhyUzhsSWYyRjdWcVRZMktFSlhWdXN1ZE9ORkhxRUhTSzlWU1FjZThw?=
 =?gb2312?B?MkRhSTJKandabDkzLzFoYytNQzM1Y3pFOVR1ZVllTWlkZTVZMHZBeCs2cWoy?=
 =?gb2312?B?M1BpcW5rNWZ1NFpDNCsySGJiVi9BTExXUG8rV2RjczJRU0tXVkk4Z2Q0eUox?=
 =?gb2312?B?RVJwcnJ1L2hKbVRPSWYySlRJMjlXaFNOUHp0cnpCVG9OazJQYXRRSjFXeUUv?=
 =?gb2312?B?eUVRcklrT1FxV2dqd3djemlJNFdwaFNVWGJ2NU1ITS84Wm1EUys4ZDNvQnEx?=
 =?gb2312?B?SkFEbGtNbFhvMnNLYkROV1Q1d0pIOEZPdEVybDlwQTFML1JERjZXTWpUMXow?=
 =?gb2312?B?R3hVWElvQ21zczRHQnkrdWlBUXpTaDJKVDl2cFpKWnk4ZGR1NHpZQklvcGhB?=
 =?gb2312?B?Zkl1a29BbHVCVE5hL0JURjZzTFVHOFRwZnJUZnNYZm5ZWjdaWWhJNGV2cGtG?=
 =?gb2312?B?aXRtYUNQRWpQTThMQVZralpJZGV6d1FJdjVleklsWStEcFBZeW9iSFdyUG5y?=
 =?gb2312?B?SE1IZFkzUnBnWmh3QkEzUlNwc3V5NTFPM1V2Tm9ReXZ6Q2lDdDZvV0lPOHRH?=
 =?gb2312?B?eFhGZG0xVEtUamNsTDJjN0lPNDJxQXhNSmhpSTNhZXVOQjM1VG5pcTFKMEly?=
 =?gb2312?B?cXA3cmFKSXhJWEFsek9QYzVFRjk1RTRRenoyODhnS3J0b3Q1bHVIbG1lc1VG?=
 =?gb2312?B?azFkaVIrSGIrK1ZSNzdzOHREWUhjeHNzaWpPMzJ3QzZxa2k1dTZvL3FLUyt4?=
 =?gb2312?B?cUZtc1B4cTB0bUNoTkRqQTRURGpUZ3dOY0RYYXZHNWYzVXNhTmo5N3RvdDBS?=
 =?gb2312?B?SWluZzZzQjJwd2JRdEFxTW9Nc0tzRWNMS01XSWQwZnY1WEdqV0RJQXUyY1Nk?=
 =?gb2312?B?V1A5OFM0YUVJRUhMaHd5STA5emVibWxPNzZuekpTRDN0eUpmSmpSSUVVSm5t?=
 =?gb2312?B?RTlvSGRpYWI5aWgrRlpXRVUrbXNKaTQwSzQxZ2JDVTNqMG4yTjh3QzBuOHEv?=
 =?gb2312?B?THNXWHY4QytabUNZNlhIOEdNd0NST3hsUEh0dVBoL3J6YU1rWlc5QUFLK0RP?=
 =?gb2312?B?cldSRkc1K1JWdXo5UDJackdYUExtcGROY0NwM2ZUWXRHM05tcjZLSU5aUXRz?=
 =?gb2312?B?emZBdU80VVo5cUxtWmRxajVwK3NSZEo2QmlmQlRIQkVEckVUa3QxUW5pRGkx?=
 =?gb2312?B?SnN4RFlxNjBrRkdWUkgwbzJSaTFrbGZzNSt3TERpd3Q3SkYrWEpWMTBHNzlu?=
 =?gb2312?B?S1A0VG1jRFcwMUVHcXJyZmdWRTZrYkc5KytwdUxxdm5nTEdNM0ZxbU1ZUk1q?=
 =?gb2312?B?QzNCSGVtSmIwbUxpUXg4VFJKSUVsUW52Sld2UzNwUXJFK0FOVmNFRUZPK3dp?=
 =?gb2312?B?VEg3WHFYaGUzSkRmZmE5Sm5vbHl0MzQ0Q0E4Z29tZ2lmYTh0TUY3U0FXRlcx?=
 =?gb2312?B?QU5WaWFDbk5LZHUyc0pyRTBycG5pVDE1VmY2UlpyNFZnWjVFa0tsR3lONVZr?=
 =?gb2312?Q?4HxZb8BSqE8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5da947-553d-46f0-4cfb-08df2cbc47be
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2026 02:05:27.8967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7309

RnJvbTogWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KRGF0ZTogU2F0LCAxNyBPY3Qg
MjAyNiAxOTo1MDoyOCArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjIgNS81XSBkb2NzL3poX0NOOiBh
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
dWcvcHJvdm9rZS1jcmFzaC9ESVJFQ1QKLS0KMi40My4w
