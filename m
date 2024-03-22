Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2174.outbound.protection.outlook.com [40.92.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20459B5F
	for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.63.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711129530; cv=fail; b=r0S48cQOEowbQbWJ6TwcXHtYDANySYxMiKIQRk3+Zq46cgIXSVw7NrxEeiOEFHXgUsX/9OPZK65z5WrGtKTMRkkYw8dEyfEtaftBECbVl6VhHA3PlBeHwh3MKENTS1EPntTT3Q5h4CJ1SOr1KQn0+E9GB18OdMgSK6wZUoMCmEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711129530; c=relaxed/simple;
	bh=DJE6SgIFOYmznfUYyTjEfwPdjSoP29mlqI7BDLVllwM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hCZKuoH8kUV1LjfARffziQS/VUsHVOo+fgnuis1GYOLzRFiK56LUphw1vBF7HyihPE5ng5dxZXIDXWrT/sv/iMeYc6E+HxU0IiB12bs+woJCoBHb6N7ehr63ZMHmNMGy0EA5P0LF/I/P++Xe5AxAKyAVpAKERhFhpmLpd3AL3XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=C3B5gyiv; arc=fail smtp.client-ip=40.92.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="C3B5gyiv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGut3ja9S/NPBv8jYBfQ4r05/ibZC1TIjzPKfdlnkzosA/dq8zFuMQvvC5nVjo6DhfHKBmCTWPwprxTWeqozjZP96Dq0V33xDlJ85QZbA+NyTqhfiaFFFehbIqjBJ+kjZA7eblbRn8ksZKohd+A+hASrwj7WHJwbHooJf4yoAuYy27vZOuQvQGHJ4h+jRkwlM1CiuOAq9kNe8Jt6rMEaZt5mH6lXgKkBNRoSzILFmMWxpNAA/LStmypqHkIsrIAGv47hLKYAmTDwpJphrZ7YTsmE7rTa+NVvu80lTQfDE5oembmPvFNRbCQojqQZyzobnsYlDYI2eDbTNMOUQlnCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJE6SgIFOYmznfUYyTjEfwPdjSoP29mlqI7BDLVllwM=;
 b=Oy47ei3tgHOEqqqHT7l6eg0xejopJ6ZzVq/f4a+fEZ0acGDIUmClM5vSXnBlINX84p0QcMuY+6+uHYXN3cXTggkt9jvQNRZRKSKancqJQ8nrdDgRjubDoh6ZMbn04IBIjwbU3eVF5hqBIZzDyAmYZ93W9kMlY87pgiir1f7CXKsIGWETsVg09bMus7yUHC1K6yEcBzcCDKcp+Os5K21uNgwafOiYmmT+iks843zNt99KZsXEYBPLhZ8COiBrmVWUezAbsSJ/y9VXEmUSL6lLuEKnwqz74Ecg2bPTeuwZY+10I4GKxrdq7UukYZ2UyYQxMfQT7L5RObSzS1VwsH4S3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJE6SgIFOYmznfUYyTjEfwPdjSoP29mlqI7BDLVllwM=;
 b=C3B5gyiv6tVqop2+a78E48GreZEDIgtlsZYMzPLHIdMKqePY3QGOBN5tQ5Arsd0nE3Rr19Q55HEuEGbyvgY1w7zPkgsype7tKBf5lBVEBpAXtQ5XOP5/8JcGTYMr8Fb0wFAgCAOgTOZzeTU7ewK4aQ5ph1HF7TL6yKMcYCRu/Is3xsDIRkImTZp+7yS9OZALhl4TqNaqzb8eWilmXHdwUSFYHkgyOojlLgxZjPdJGIYmbBCBYb6G8+MWFMrtbtF2NeRTEkLRAZlenUvM6KRttXWtYJIsoo2h37+T41TJyOmZyH8DLdKtyUHiAVFIzljr667O3Jq277BI5FiQM1ANug==
Received: from SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:88::12) by
 SY5P282MB4539.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:26c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.30; Fri, 22 Mar 2024 17:45:24 +0000
Received: from SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 ([fe80::eec7:3528:ae72:1ccc]) by SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 ([fe80::eec7:3528:ae72:1ccc%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:45:24 +0000
From: Moody Liu <mooodyhunter@outlook.com>
To: Andi Kleen <ak@linux.intel.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "x86@kernel.org"
	<x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH] docs: x86_64: fix a typo in fsgs.rst
Thread-Topic: [PATCH] docs: x86_64: fix a typo in fsgs.rst
Thread-Index: AQHabn7MQ4gREm5SBUS3us9DBWcaf7EogxgAgBuxooA=
Date: Fri, 22 Mar 2024 17:45:24 +0000
Message-ID: <88c6021b-d63a-4207-87be-47ea2aa9e3f2@outlook.com>
References:
 <SYCP282MB0461A3FB2A62030F63663583D3232@SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM>
 <ZeaWJsPVhUrXwBT5@tassilo>
In-Reply-To: <ZeaWJsPVhUrXwBT5@tassilo>
Accept-Language: en-US, en-GB, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-imapappendstamp: SY5P282MB4760.AUSP282.PROD.OUTLOOK.COM
 (15.20.7430.000)
user-agent: Mozilla Thunderbird
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [hzFkyAljYcmKMsAL72q32qKhcx8CiPj6]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYCP282MB0461:EE_|SY5P282MB4539:EE_
x-ms-office365-filtering-correlation-id: 82c062f2-ea57-4502-e42c-08dc4a97da42
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hVseMvH4lb+t2uNSxNT4gEaU6W0fEoluLyJ4T5tO3UDpKmI523JGNcwLiYSjifPQt9GMlEJHSWI4t42ErHrLnBstZJlPRapCDv60z4RabsxgOGum2wkzOryHnEwWF4gXzfStSyD7c6Iod0c/WOqNaOP5NFHNm3fesB51uQFM4Lcku6BT+xk6MW0Ek2XKHD5bm9XTcYys50IaOvA3ZIMHl30MVT1Z4CE3hMQw10twU8iy7HkA8hCay1wcPBvD2eSpmrYO2C37K17Zjoz1GUFkOnfGRqCH5K1QKiEKnl8AcShsYl4CsswHNi1J+iTDwLagM2IgnEv6KnpysqgUKHz1lTBtGSrv4fak0ZHhOnO4UZ5oNZF71evFUzhMKSSYgG61njXTZVSeJEG5zfKugZYIH1sPhyvnpMBjPl9w8B4kChMYJEI1zDFGs+24GEXnOngU+IyouxhmThwq55gLKwL2586hkVHRXOl3JfjtwtWVK/R/Q+h4tyiGOwwk/t7kWKPKoDC8NsxWZ+5AeSxRdXxYbCFlHOzp1UF2SdURymtm2R6mic+KKDY0ntfI2HLcXuz+
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ziezspdZ80EK6eMrS98JglzofiTlN2GJ6kNiJI1VVzA04Zn91jx0gGACes?=
 =?iso-8859-1?Q?eJHkLrM+OWDzb7BmGNde5uK5eqiGZnCWx7ujZWd/qPOnrIK+BVkC+JRZ7u?=
 =?iso-8859-1?Q?snlSCaDIoxPwEuvTJPqJIvrErgtKGhUpt+chmhmcZCU5x6rZjhMVxytk+h?=
 =?iso-8859-1?Q?WsPHP0JncmcvEcx15uKjdGsZ+Mr8hz+W/y3UC0lPWvNnqjvcbYOoTzPFXd?=
 =?iso-8859-1?Q?mWP9RoLGoKoWVc8uJCiay+EkBGYJWhl57pgFl4JTJcrmcI0VkCgWqB9U+M?=
 =?iso-8859-1?Q?0FvTreABob8Tl8SluqFNjfZgVCszxpPZcB0bXkRhD2UrQ20vNY24S/qCSR?=
 =?iso-8859-1?Q?yQc6f7vid9alK1WiZGlmZEkpXQBsRa7s2IDsIDvtQdD32CsP9wBsmNqfAp?=
 =?iso-8859-1?Q?wRxVu3iN0Ty8Nn8uSChpnB/A4bXsgFA5TjCtjG97fjTDT1WDpvzszuCKbH?=
 =?iso-8859-1?Q?ZFi4j6usUIJ02XCgOlwMChZxNq7Oaya1Zb2ge3VlMg0b39BIGVQLA5YjHa?=
 =?iso-8859-1?Q?ZFEAx2ZxTGGAhpAfC930QCJnIw1WCsfNU1RWYrrjd0qX3KnPY2Tvdo09fh?=
 =?iso-8859-1?Q?NqO99mL5rOnlNW79ssgWONNzT+7DGQgYCpHxqeRZ1tcg7tEJFaQGskqc26?=
 =?iso-8859-1?Q?CkOoeQNZnN6x6Ig+IOuRxi5FoYCSdS9Uqgs5RCMzmdU8AstLsJanCN6i/l?=
 =?iso-8859-1?Q?Y8UH2kCFxoXsmN2GBIMcpUzVZ0mQeSysTCOe6O4rtL/iwFOnHcMOzsW4pE?=
 =?iso-8859-1?Q?jCG0ITLtqvvVhzGPkGA8rzsjgywc4VJ99BEIACWyljDd9LpXrvHWiakm/S?=
 =?iso-8859-1?Q?vvJx+bSdCd6gs3sKfFawozeVRc/HKcBTUiGeR777PDp1f9+qPmpA9rBPUj?=
 =?iso-8859-1?Q?6tvata2hXTsD2BgSb8cwYE550ovVj8UHAimkKmOxN5Ftt9ztE/ZUyjFCIU?=
 =?iso-8859-1?Q?I7x5f0LBLzoQG86AFr3NinyFPI6AULiDnVNCq6Kizh35iqeWLQdYANggef?=
 =?iso-8859-1?Q?MyNHIH4sxsja9/K+Ax+3bd6sMk3+2Y69+Ct5sSQ6KpSgjrfhjeMlz4MV3c?=
 =?iso-8859-1?Q?rp+mbp23M7qhDDnxSpo7cK8rEVesT0oKg7B5EYrIT24gjjX4cOD/MkXtt6?=
 =?iso-8859-1?Q?0hAOM+D4u/fyCxNPfRmDlQab5EhB8etG2rfeRpFl4EvRamJryM26UxlEAS?=
 =?iso-8859-1?Q?mekowsyhHLLW9ErdPZIQk7iSDCjvgRXBX/0Tm92Psb039+ZEECYcv1yvdq?=
 =?iso-8859-1?Q?ac/ONw6eseJ/ZtyXkv8EVrj4PyeJs6DQ7KUSUK8gw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID:
 <C21A469FFC63BC449793E1A23056648A@sct-15-20-4755-11-msonline-outlook-746f3.templateTenant>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c062f2-ea57-4502-e42c-08dc4a97da42
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:45:24.1579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY5P282MB4539

On 3/5/24 03:48, Andi Kleen wrote:=0A=
> On Mon, Mar 04, 2024 at 09:56:07PM +0000, Moody Liu wrote:=0A=
>> The function name should be `_readgsbase_u64`.=0A=
> Acked-by: Andi Kleen <ak@linux.intel.com>=0A=
=0A=
I'm wondering when can this tiny patch be merged.=0A=
=0A=
