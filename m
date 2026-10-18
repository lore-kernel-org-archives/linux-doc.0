Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012055.outbound.protection.outlook.com [52.103.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF44CF473
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289457; cv=fail; b=cK79vZ8JmAL20BDDN1atRp1dpNRWSxcm7TUEefRagw54DM+DK1IPaGasHSG9ZLqgKHggcXY/2+QTzWp1rlVfDdRefAQsHP8HanJwTcQUwXm87DKNMeI7Jf2hog0yO5qmuy/fb/St5P7WeUo2m4UZgvZQHlvIFN1uNHzMb9bk8sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289457; c=relaxed/simple;
	bh=bvJD9c1kcxJ4Q3I5RsutddzyN6Yjzfn6lVwfKw+bEc4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cwl+2er8yjgTZaynJ3T0gfLXtnOZsTCPHpzfezBkQgx+eVXYgyiFp2w5uEQW5b6Widu4cVRU0asN03vAXkdfbXlY0cVKNcpLdM9cGmQvgufB1s75GrcN6e7aReblJqFF0UOJV2zQ1ZMAtwmwsefarIjWn9ePCmDCN0XB43q4yKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iET+KWP/; arc=fail smtp.client-ip=52.103.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iET+KWP/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQqSXIqXOaojl8jOSt/axYkeenZWb/G/RIMsIlHzW4INT+xHSPdvnEmVkb6HdmyDkGL79a+qwHj2TeZaJfcNeq84J4LOl1bHxj9tAJ0/kM9W5Dp0KQO44uCt7Bt4CmAxYQsVfoqglQTGkI7EBjh0cxr6t2JYrR7zLW/iRNUyvFZWIpSLyGNyte23KKXkMEy3/zMY7EEEJAhk7nmD41CL02//jjvubFhszeNTFjscgBUgBnITkJyJvmuONo2F4Vkd7DnrpToeJ7LuvWC5h6o2oT839G4bK80qOb0+bbomhJOE8Bvrfa0+nZ9GVU3G00WvWFR6+rArMJJWQyPHuwwuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvJD9c1kcxJ4Q3I5RsutddzyN6Yjzfn6lVwfKw+bEc4=;
 b=TWmHH9LLy2epcg0GPSIfze+7iYAKpS7ZafQrz+lnbxXYQ0HTWKk1mNetQEbBnz8xa1HNH99ODJYYT2pEWWDb84tqxcVUDGA1ltSuRVV2scLe/aTYGDYcdmK9rzyTcL/BIyXX7EyXoDjrMQeK8llu+kZOio9QS8VsPtDZqpkd9EybkQ3nONJwoM1FUoHACWP3UAgHYZ2yBt4o1ms0KZaT8L0ji1e/zManvaJdnI4K6iCGO42waB2FHBaw/HGX3oq2gvW6w3PnXGCgleBzNJ8u8/d37vnX6ItJ860gQXVHO2dx8YHzFiRM8TXdt1IYr/OzvIN0ujcZeuX7yfECuO5LGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvJD9c1kcxJ4Q3I5RsutddzyN6Yjzfn6lVwfKw+bEc4=;
 b=iET+KWP/RWZVacu08sIucNwNjI8Ov8FTn2OvhO3vjm81n9xCp/PH6rdIEmSZ7QPaXw11H/EzejXpwuRoTXurwOIflZ96nT4j4E4QXL6qLIlNG/Ngy3L7CN4PXbwqc2JU1ySkWo3h9kbEOmHrX6HXUwolThZ6YK1koGZDk3/JVsi/xMtkPQYU3gwinyCfYrTGV4B51YtJMXk+i+j3JIk4OmIf1eRmSUj7NTnMz/yGAWCNRTZo6zRFGzS7AJcAHnmvBoQaci6WuzY0sD428B5gvEkCawPmUqYCTX6HDQe81LDK7NR1CXpyt2uY7JA/x9not+paRfR4E1PZuGZH7v/hrA==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by JH0PR04MB7309.apcprd04.prod.outlook.com
 (2603:1096:990:3c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sun, 18 Oct
 2026 02:10:52 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 02:10:52 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHYyIDAvNV0gZG9jcy96aF9DTjogYWRkIGZhdWx0LWlu?=
 =?gb2312?Q?jection_Chinese_translations?=
Thread-Topic: [PATCH v2 0/5] docs/zh_CN: add fault-injection Chinese
 translations
Thread-Index: AQHdXp9wp6Yk9TF5A0iu6u9jUIGaubcCjk9F
Date: Sun, 18 Oct 2026 02:10:52 +0000
Message-ID:
 <SI2PPFCA6543649026B29FF8D47801DCE66DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
References:
 <SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
In-Reply-To:
 <SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|JH0PR04MB7309:EE_
x-ms-office365-filtering-correlation-id: 2ccc70b7-c851-43e4-e334-08df2cbd0916
x-ms-exchange-slblob-mailprops:
 30ekHghIwFoGqEgxaY/OAvK55SjXyV7lJ9unuPGZCAwDAQghnoaJl0+0vU1umTm46cc8OEXC0KLD3P1CDo7UVfSeqf/NyRlhEjHkzWHAiAUZD3wTGT4Pdkhig7iC/mI6DDsgXunoenaWpjACxfue6g6wSwVkU/EeNSF9tS+RfSzkQ8xBw90eerATf518yVJ7T0Uuvcf+jSEGvaTyR50gm893FICb+HOgqZIzO3ckeQ0xLc4Y0Iqv5vbfgxCPUvWxNYSlBB53LomgbZNji7Eq6hjz7msEd/y47xbc4zdZiJbAFOIYZ8S1RsinP/IQtdbCiRxZeORh8EQjR4L0rrthqO6aRL47rySmI/3pM5PHJ4wbDQOcBsgfqIalgt3PoGR/VIU94wMNWqeyQT2UiubQtaAEwYieDb5O4CR1ccBKlU1BJABD8R8igNo7HaroP4gE/lFh7W3H3fc/VZemfnVifLRuP+w9SI0Xt7jNGX6UmXUhVG6RSRMP9wNE0mwmtjRxjNwbKEM75VVB67n7JTM0ZkdJA+IsZSFkoYo7O+1uDmvYW0i+lOvO+GhUXwCuV4ZKrE6BRX3wOrxgtVKwx/6R6V+wOhxxrpTsN0DDPNwdI4GZ1fhbJZsEOPMxUwatPo1t2aGkTMeBiWTr+etLJM++7pFwkPcd+ApKeu2/nV9Aw9RyzAsSGXZkHBPfpydlE476CdHmLGu/QxpGSzocaxy7nwcCvn6+qYypEry1Lybib6CzCDp15rJ5IkMXNSEiYSCa
x-microsoft-antispam:
 BCL:0;ARA:14566002|22091999003|24121999003|51005399006|15030799006|15080799012|31061999003|8062599012|8060799015|19110799012|36102599003|2604031031799003|4040399003|102099032|440099028|3412199025|20061999003|40105399003|26121999007|3430499035;
x-microsoft-antispam-message-info:
 =?gb2312?B?M0piQzFuN2ZSdXVHMjJPOXNSalRTd2x0Q2xUTTlEQXZ1c0kxZmNRNFREMGJv?=
 =?gb2312?B?OCt3RHhGK05lS1MyNllXeFN2dUJrMVlBQ0xWbXQrK2Q3bzViMFlZL091bDgv?=
 =?gb2312?B?d1BUVS9tRVpHWFlwbDY4T0h0ZEFocnM3dFJTaTN6cHdSZVpjUTNzNGNRTGlO?=
 =?gb2312?B?K215TzMvVFNxSkhTRHZaMWxtRUltakVEOFI1bnRzMUxjVXRxa1FuMG5uUS9j?=
 =?gb2312?B?bmdBdXZmM1VhcVJuY0tHbzZYTlFEVy8yaE5MMjdtdG5PczBHMVU0Z3ZZRzNM?=
 =?gb2312?B?Q3c1dFM0b2NtRlE3UTJ6dXF1dExnS1BSYW9PTzlrT1BmRDlIazgzNWZwR2pR?=
 =?gb2312?B?NE9qS2ZVWGxNc1dmVlJoYUlXTkV5N0pjL3FYb0ZnMGNET0hPQ01ka1ZFV0dy?=
 =?gb2312?B?bDRjSVVaV1l4VTMrOTdQazVQMkI2RFRJRFpZbldVV2R2YmFnTjloR2RlYUpU?=
 =?gb2312?B?MVkxT1k1SFkwVXVHRzNLRTZoTTRabmNnaUNTejJ3S1dZenRBK0dFYlZyOEZ5?=
 =?gb2312?B?WGdzajRHa0JQdmdDWU5YbFNhdTR4OHVnWHNOVk1qV3ZyMmtDSTBTRE02QndS?=
 =?gb2312?B?VDN2UkIrZFdQSGdHQnBSQjJpeTQ1dXRVbSswNjUwcFRWd2RpcXdPUXppZ1JG?=
 =?gb2312?B?dUdRVGU2c21GWkIycEliTmgyM2tvOEF5Y21uak9iUHJUdk52Y1JPeXAycjVN?=
 =?gb2312?B?MS84dFdXbHF6cWZsU1JoZGJEbjZ6UUFucUVRZlV3dXA2YkhBRG9ZLzZtR1FG?=
 =?gb2312?B?dCs1NHFibDArUnJ1TFhKeGdtN2N0dVpCUm0yTmtJNUZrY053MGwySWpkeG9k?=
 =?gb2312?B?czVyWTNNUTdpMHpWYzRLZFkxOUFKNnhYb1JQWWRVQm1SdW1BRjJvcEhybkxY?=
 =?gb2312?B?clRkN1ZYdFY3ckF1NmJJUzZpVllBYWtwb1NvZDdwRjZvUFROemVhamd4UnBF?=
 =?gb2312?B?RzY1NFVDRlhKa1dXWGdZL0UvVCtVRlN2WHdHaUFvMXpnV0hpejhvaGVBTktj?=
 =?gb2312?B?QjliZTRna3JHd3llMHpZK2ZaT2kyaVJmVkppczN5RTV5d2Y5L2x3Vi8yN0xP?=
 =?gb2312?B?V0RQRGdqejhjSEJ5ZS9SNlNXS2xESkpjT3NCZkN6M2JoLzA0MGZoVlZCZUdF?=
 =?gb2312?B?OUgvdkdMRWs3eGtIK0p6WFkxR1JVYjhBTFZkd3dQREllMjgyRzBKd3R2ZnQ3?=
 =?gb2312?B?TDgweS9vcnFlQm1hMFg3bUxrSUlIdjUxUmIxdU5HNDB2QmVxRWVYbjMwZFRV?=
 =?gb2312?B?RkhWekZKYWRFQkMyR2pHczJHQkFQRXRvRURHa3E3aVBwbzRENGRTeHFudnIv?=
 =?gb2312?B?ckN0MktJVVlOVUhSRzN6UUlOZDNJODI2bzU5cUdMbmxUaytwRUkvRXlpRVhl?=
 =?gb2312?B?bGtqMlZKMTBtbVY0WFQ1RVB3cDJkSGxzMHNDdmVaRUFjbkgvVWRZMXU3S1ZW?=
 =?gb2312?B?TVBEL1NVblcxSGFmcFZvMmlmN2M2bUc2dm9mMUtYTGFidEc5OG0rdW9ibDdZ?=
 =?gb2312?B?ejhjWE5ucXFxN1JKUmFVUG9oZ2hvZkswWXJza2xXdHpWcExMWlU4d3VNWjFw?=
 =?gb2312?B?TW0zdz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QUMyZjBXUVBvdHNSaXhUTmExVUNxWjN6WGFGanNnWmJjUVhWV3lMNURVdkx4?=
 =?gb2312?B?ZGxJY05UM2hFblNUaXd3cWpUN0tVYmp2Q0gyb0VuanpJeHVXRUs3dGkyeENy?=
 =?gb2312?B?VVUvVUpoeXhwN0ZWVUZJRW1nNEszL00rN3l1d1JiTzJRcGV0ME4vSGc0RWdF?=
 =?gb2312?B?aHY0LzFvNktraTFnM1RTRU1lNFJSZDh5MXVQeXdlSDF6RXF5VXVWVEd2elFM?=
 =?gb2312?B?NmZiZG5DYXZxQmxJS1FZSURZWUN4T3pqS0ViOXgwdlJtL3FwTnNSQmE3YWFo?=
 =?gb2312?B?UzNQVXMvQjU0SEFrOEdtSEpLcUxDbWphbjNzNXBEeThDZzJ4NDVQbk1Dempm?=
 =?gb2312?B?QnZpdUVkbDFVaEh1MkxwYnlXS3dzdkpEcE12cXBEYk90UE51UzR3Qzg3djBV?=
 =?gb2312?B?cEdBK0tpYVVnNnR2QlFOOGN5L0pvMmFFanFSYWdJLy9COG5IQnlzM0w4TlN2?=
 =?gb2312?B?VXJVbnJaMlRGMUF0dFp2QUpqdHRxOWJmb0E4M09Bc3VsZlNSeVNUSHpnTlZ2?=
 =?gb2312?B?RjcybHpjeVdaNmYvSGloNnR0Uk9UTVZkbXZjOTkyRUhGaG44UjB4YVZ2ZXRr?=
 =?gb2312?B?b01kNnFLR1lWeVc1S01CZWZ6b0JQK1RHT3I3SEorNTUvRHFhNWZrRDdjRFls?=
 =?gb2312?B?THlxL0FJS291a2xsdUJUNERwY1I4ZDl1bVpaNnFuK0tQWTA1a1pHUFFHSGlj?=
 =?gb2312?B?Q1lrbXBoWmprc3ZxOEpKK0U2cGN6K1RiK2J3TEFJbXB1ODFNaDdkM1F3ZWVH?=
 =?gb2312?B?bTFBYWRTK0dWYUg2TXVOQnNWSHRBMkNhVkdNOHhXbW5IM1JRZEZ0NGJyS1pD?=
 =?gb2312?B?REtsQ3U1aWJ6b3RMbmtVMGpYbEk0ZXVyTFZWY2RlbW4yZ3BONHNveGpZNEEx?=
 =?gb2312?B?V21WY0NhdVZGZGMvd2ZkMTlOR2JxSVlPL3hnd3JkRm9VRzUzMjJoU2RVNElN?=
 =?gb2312?B?eEFpSWlTdFNUbDd6SGp6Y2JtbGd4REJodUE0c2s3ZEdSMkM0VWk1OVJqNU5a?=
 =?gb2312?B?MjdKOTlwTU1iUGxUbDNTK0h3OG1aU1VCT2lEOEplcC9naEQvWjJGRDhvUVlX?=
 =?gb2312?B?QmxuT1djQ05QRDJVK3ZseWdlcS9LYkVRMDBqc25EVmhlVGc4RTFhV3ZqZnBa?=
 =?gb2312?B?U2NSUjYxbTc2cWJLL1NaVmNkWXlrMmI5cTA2b0hQTW1aeWJvSWwzVmNsR2pk?=
 =?gb2312?B?UTVwanM0YnltTTB4bHcwK2JaVWduSmtzYTdxWHJQOFpzbk1Cb0pGQXErU3c3?=
 =?gb2312?B?dS9mc0V2V3pFcjVQYmZHbW9KL0tXZHdxNTkzUVN5N3l0ZHYwdEtlUlY2UXh6?=
 =?gb2312?B?aytYUitmN1JZaHd1Y2Y5cjBCYzAxdmlCdU9SazhGQitNTnNmSFU0SythRUFs?=
 =?gb2312?B?bWJycWRZenRjMkkxc0U1N25hRFBtd2dPeUM2cUExQ0FFRW12TmxJOUYxUk1W?=
 =?gb2312?B?QWhoSG5WYVF5ZHhZenp1ejJ5bGo3TmpUQmVscTRRYUJlcUpTUkg0eW5VZm9s?=
 =?gb2312?B?UXo3TTBheDNnV1ozSXF5alJYOWp5VlRDNVIxR0s3TFVQZVBsMHZFN2x6M3My?=
 =?gb2312?B?UXppMldrd3pLc2dLbmZZcFdKS2YzWXo2MEZLNmJUT2MzTjFybjh0dG5QbGVY?=
 =?gb2312?B?endveDlOZFZ0U3F5KzEzVXl0K1A0M1VueStGdmgxWjRjTk5NOW9vRE1lUDhE?=
 =?gb2312?B?MVhDRVRJZXdSOG42VGlxem5OWUZuUXhib3dJS2RPRzBPSzV1YXBvWm1xcTFO?=
 =?gb2312?B?cWthVDd6NXpkaEYzcTlJUDNRTm01TUgzSkt5RlNnNjdJU1pRT2hvSnVwUE9o?=
 =?gb2312?B?YjNNbWFmbUhRRzVoMFExdGkzZWROckRqNzBIWEVOVS9xWU9DQjZqZmRoMmdp?=
 =?gb2312?B?dXBQb0VDZEd6Vkd0RWlaSmNVa0cyRlNPeEtXUFA1S0ZkVXk4VDdFd1YvUEpm?=
 =?gb2312?Q?kb8v760aFgU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccc70b7-c851-43e4-e334-08df2cbd0916
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2026 02:10:52.2780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7309

SGkgQWxleCBhbmQgYWxsLAoKQSBxdWljayBub3RlIG9uIHRoZSBzdWJtaXNzaW9uIGZvcm1hdDog
bXkgZW1haWwgcHJvdmlkZXIgKG91dGxvb2suY29tKQpoYXMgU01UUC9JTUFQIGNsaWVudCBhdXRo
ZW50aWNhdGlvbiBkaXNhYmxlZCwgc28gSSBjYW4gb25seSBzZW5kIG1haWwKdGhyb3VnaCB0aGUg
d2VibWFpbCBpbnRlcmZhY2UsIGFuZCBjaGFuZ2luZyB0aGUgc3ViamVjdCBsaW5lIG9mIGEKcmVw
bHkgZGV0YWNoZXMgaXQgZnJvbSB0aGUgb3JpZ2luYWwgdGhyZWFkLiBBcyBhIHJlc3VsdCwgdGhl
IHBhdGNoZXMKaW4gdGhpcyBzZXJpZXMgYXBwZWFyIGFzIHNlcGFyYXRlIGVtYWlscyBpbnN0ZWFk
IG9mIGEgc2luZ2xlIHRocmVhZC4KClRoZSBwYXRjaGVzIGFyZSBudW1iZXJlZCBbUEFUQ0ggdjIg
MS81XSB0aHJvdWdoIFtQQVRDSCB2MiA1LzVdIGFuZApzaG91bGQgYmUgYXBwbGllZCBpbiB0aGF0
IG9yZGVyIG9uIHRvcCBvZiB0aGUgZG9jcy1uZXh0IHRyZWUuIElmIHlvdQp3b3VsZCBwcmVmZXIg
YSBkaWZmZXJlbnQgZm9ybWF0LCBwbGVhc2UgbGV0IG1lIGtub3cgYW5kIEkgd2lsbApyZXNlbmQu
CgpTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UsIGFuZCB0aGFua3MgZm9yIHlvdXIgd29yayBv
biB0aGUgQ2hpbmVzZQpkb2N1bWVudGF0aW9uLgoKWWlrdW4gV2VpCg==
