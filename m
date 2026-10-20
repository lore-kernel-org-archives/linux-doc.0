Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500669;
	b=hum4thUC6hfhOyahjp3AOG3VCsgPW3Z3puJa7j3CJK3VPb1ERbmNCsLrHRgWIHv5o2iq
	 E08m1UUoxOwJqKMLwhcDsPAjk2lGy5z0rDAKsZ6PDpX6D9vAh85aUQCaXFlUDDRyXGqTw
	 BQrFRGUfgkbHdV/FH9MpCKY2hmiBZkUJxCH1p2Wwxuz3DRUB6Wt7LUEhrncrZWSZrWXqO
	 Jift7CtQjgn66De7ULvTB2pNpnaMk32WBv4t/j75kqM9S1OlkW9e+Pg0gdCqP8ZZhn1C7
	 uZioPITBwC/1e9ylZKvQCQnG72s8Nf7ID0rAlhTBTmrlz4kwzD//BJmZ43dRS6InTaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500669;
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
	bh=MPIMJssoelpQnxKoBvmzAOfJzKfxHuqfWi08r/hMWwk=;
	b=vsny8c28ibA2pUkIdPRCRSa6fMKalDAhZd/CoV6e2XNd2cUQngIBBhe5YKeY7wCttYY5
	 YJnpIufvuE/sr8TGqxvwNygtRq2Wx2RPR+YLDJK1pF5GvMo3dMoxr7qUr28tWknpUK5H3
	 GrygwXihO+XRMsYLvCPMVH+ZF7K/Z11SY+opiQ8EAx96OwjtNjYJmcisz5qMwz4MzE35h
	 DppoLsmHMOcWiWDzUCDmLvSedwkXQRzuYNYoW5oe7ABmQJSuZP5Z2nFYneb6lXaGvpnjC
	 Yo6q3V7JRoxJ7QCVUAeOAx8OPesOU6EsCpB1zhD11LEAohC9aV6yypTUwXsx6r8ETfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MHVZP0r4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.55
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012055.outbound.protection.outlook.com [52.103.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E5606A321
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MHVZP0r4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFlTI8d3SLDuC/yOW0HPzSd8GPodG5JlXGS1SldQT0dABGdW/JCqPQ9Zul8GpnzxXHNZKU/oSGoaOf3VnuaEv8og0OUbsKHCFjm5CKIlb6WeRbUs+YQDSMHmGm8IYGoPY6pBu+56bBOQPkRosw2dbdjNYYfK26vOGIQz2KqfEjVyAus+XK7hFOADAKBaGUPuZSHcrgi0gYXsouxq3f9zds8S8YF/IrcKK6/VxI1h6HQfGKFjJkH03g1CXdAP1f8AMPtAxNsbucyd4HWkvZ28ngIf76L3mOBLvjMFoAZM3DKxyb0FSRGxhzmtTitqZe71KOev98lvh+nieKvKQISRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPIMJssoelpQnxKoBvmzAOfJzKfxHuqfWi08r/hMWwk=;
 b=W1NYvGovgBzC6QhytwgWJCSHEOi7yoNmqWEv3j3F79btyz/BNw2e8TohOtB/wIUunA0jwm5/lRlOGze1aE60ajDU0wbhQk82Hti6VGs9erFy2dgVsuM/+bHmQvj1D/EsRZJeqzc5/OuKATpj3G2+khiXSREOdpsIfcyeEgWJRUlWKIcwJG/Dh5bLLTaPGGyYPPYXF10Bgmrq1VB036FChZIhT1oM63dAisMiRR9h7O29o+byLKFFICGJTEfBn/9Rd23CBhCD1QpDTrtcvLtoVkktFOx9eEHQ2SpJaQyl6CS5iu/a8Ys4OjVxOnFODI8k2ftUFv9c3GmlUIgnWW3L0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPIMJssoelpQnxKoBvmzAOfJzKfxHuqfWi08r/hMWwk=;
 b=MHVZP0r4kTZYukdKfZYjVVz9BNlcQe7/wq+GI38Mm7wIkIJPFnsbVzPU4RgYVCa1rQDJY/BT8yuet3cyt6TLoLyDEX5cf8/5rHOPGBdkJAobiJIHqBgdlTj4D3lvfJqzT6N4wB6gS9wjSoue0ItsiGsCpTzc1Sp8AS5JG0lAUxyCJ/tqlu+pcvhuG0Df450OISbvu4DUi5vUDvFFX2Qn5ZA6mmZhR9LPZGYD47Kp9Gd3Z+TcLZoG5+pmU39r7SggbNs6rnd8CcvFuBkSWAvhLh1gBXQ2CLMyfclFzyY6cXWLAdyJTZ8Erpa2SBpTWNbQq8EbqXR1biyHzoddur9TQA==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by JH0PR04MB7942.apcprd04.prod.outlook.com
 (2603:1096:990:98::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 12:51:05 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 12:51:05 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: [PATCH v3 3/5] docs/zh_CN: add notifier-error-inject Chinese
  translation
Thread-Topic: [PATCH v3 3/5] docs/zh_CN: add notifier-error-inject Chinese
  translation
Thread-Index: AQHdYJGr8l0CxRPqL0SCR1QOGOIOPw==
Date: Tue, 20 Oct 2026 12:51:05 +0000
Message-ID:
 <SI2PPFCA654364967032ED5F9CCF82679F6DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: ea83cecd-f45e-4741-42be-08df2ea8cdfb
x-ms-exchange-slblob-mailprops:
 P1EfU6pZOd/ur0QDa6YmBjuOVf78JKonXwWXvI5/KrS+N/AYcGh6Mtpx6EwxRFoI4ElymcR4J9tJFu+LM0CyFAFGoBENximAcx6wilsAbbnseotkzwBhVxSxVMq03s/N7j/OZ3m9sBeH+qTQbrXa5EHW7filyaFkWNCXGG2Gr82coZzBaPBTNI8bM8iJs84mI2ea81DzMYbyfgAN0TEqluqWNuMeTyHAjgVM7u/1BPjH4XFzxzDrGX7mpiXELatpAdxcKepKX3CxovtZK2+SH13IKyEMB9JLLOPZluFL0Yi2bR8Rpn/AIWd7p2IPcdpZpGWTOwALo5YKEiwGMG53rmp3eDcgFXJjyDKkNiOl/iLTuhEqliHEK8auNAmMbSJmvPyj42vUlpdOm/Q9FyGOB8BHfrRBGnHXfq/AdvjgyqWLWpegINBjmvy8nmhtNj2zvBIR2+iMcHY2CzwLrkWmPv9/ygDdhzSJErzcQ9W4cUnFnzE7KYweL0c/TinrFNBXEOrXcSAApr9nv1RMAU6yZVWwLxVzSvjCYPIwT0QxJ0Nz8Y0ZfS0OFEA9hWvuXJhdKIGKPFqSM+HiLJ4/AA0x1jxcESHp6/XejVUtE3fh6wXNeF1eGhLTJsJ19orZKcFHuPcN3Fd6sAmeKZh4DaOfYE/JQNK+HZ4c+5OH86iXFL5Ohc6hlxJGBScxcGPxbIiNlC8nAqftptihBtrDQaXGbU7evptIlpLwRm7d88cnRZG0MXX6QRPqo19fC1j+wryd2pyzLmCiaRm6K1/sOKdCrjxobKs1au14jU/J85mZFjeaqkDSif+FEA==
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|8060799015|8062599012|31061999003|2604031031799003|51005399006|5040399003|15030799006|15080799012|22091999003|36102599003|24121999003|40105399003|30101999006|26121999007|3430499035|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?gb2312?B?ZHJ3dk5PYjJWVWhUREZZaHk4ZUlqMUxGZ3l1cUJkdEtOb2x4b1dwNEV5WXFC?=
 =?gb2312?B?dDRkUmRxb1VFMlg2SkRUUkt5ZG5BRGpVU1NWTjN5dGlTU05XK1BVNm5iSDFF?=
 =?gb2312?B?V2Y5eUVCUkRNbFdtbzF5ckdIWVZwVktHQlBzdlBoa2J4aFdENDRaRE95UnRY?=
 =?gb2312?B?STlZMHNaVXJMQy9PRGZQVnJZbHBnblY0a1BoZ1NzUFhIbW8rWVNrNVBWTk9H?=
 =?gb2312?B?QVRuSVNuZjRUbGdhQm42TXdzOHc3cnVpUmVKTlMwVjBCRU9DM2VDSWZQWlJS?=
 =?gb2312?B?b2EyME4wSkNtUjF2Wk5PVEQ1TmZ6cG1VblR0bnoyL0NYeEt5b05SR1BUbk9s?=
 =?gb2312?B?TzVBTnltdU9LZjFCRnFMZjh6SVp2TkNLRmJVd08waGNYbkZGNkZUVjA1aUJh?=
 =?gb2312?B?ZjVMVmo0aWc1UTRNMVVGSnpnczlOMUYvTTI2SXNSeXJRY1J2ZC9EQ2lXMUJx?=
 =?gb2312?B?WDd1UXRBV2FzSU80dlp5YkJQSkFXTVBZU2tXeVp0TUlmNWxtU2Iyam9Mczk5?=
 =?gb2312?B?YW5wYk0xL2t2cmZGN1g3TE9lbEoxaFhiL1cvZTk0ekVKdjZHZkZlT3M1TCt2?=
 =?gb2312?B?eVNGYkg3cWxDY0MwSXJ3d2tCSE5BRjZydVBBNk1NUVltVlBTaEtBU1RVNzlk?=
 =?gb2312?B?Q24zOWkzYU1RdjloYnRZWkNTaXp2bkY5UDgvYUIyZVNxdG12U0ZJbjJzbWUw?=
 =?gb2312?B?WW1HSmU3U1FnRS9PVVFzOGVjZzFjY2xOT3hFVjdlU0FsdENWeDRDN3VpMldC?=
 =?gb2312?B?MUgrSllZNlhOb1AyUVVHQjEvS1dsREZoQzVQSE1PT09TSkEwMmRoTWpwSVhv?=
 =?gb2312?B?bU9vK3hxZmpmRXNGS1R0UUMzMzl5ZVpUTFA5VUQ1WUNlamIyOHBMOHdHLzRt?=
 =?gb2312?B?cUQzUFl4Qk5IckFBY2RqbFJMVXVBSlp3cCs5RUJkbW9td2hpU0MvOHRJTWI0?=
 =?gb2312?B?clNmQWtSZk5tNFR2b3M2RnNNRkJCVFpNTUhvV0cweUd2ZGZUSnU1bSt6OVJt?=
 =?gb2312?B?SWF0MlJPSTU4ZEFZb2Rlam1yYWVONS95V1hyS3JjRkNWaU43S1hkWDZRbko4?=
 =?gb2312?B?MTBaR2I3Z0NyNUVSeTRGYW1uZFFnZEY1ZnJDbER3cWNUWHJuWFZSdjNVWndq?=
 =?gb2312?B?M3dLaG9wMjBTTFdCU2p0ak1uZjFBMUdBaG5maEVxRmllNUZBWVl1OTlkb1VT?=
 =?gb2312?B?R3Z3U0Qyeit3Mjlidjh3YlNXZlJUdnFrNFE4MDZqVjA1bkRUSERXUHgyUzdF?=
 =?gb2312?B?WlhMR0ZxSCtvUGZvMGh0OGpTMGp3RkU1emlqMkZuQlRGOFFJdk5Mb0hGcmVo?=
 =?gb2312?B?TWlIUU4yQ2p5U1VmL1NET0RhWTR5RlkrMldXZ3NZNHRKaE1XemJNRXljcTVY?=
 =?gb2312?B?K2ZuajlqMmhyclgxUWRiZm5ZK0tjTVV3cUVyTUpRL0NCamZocy9HaXpKT1Vi?=
 =?gb2312?B?cXJqcG55dkVuSERtRi82c2pvZWZ6Snl3WTVqUGREK3NhN0s5WWtDOTZnL1Zh?=
 =?gb2312?B?K1llSmhZVVdYVVdaaHIxdi95d1JHSnJiZVhPOTUwNEw1LzhrM1dUWkl6dS9T?=
 =?gb2312?B?NFo1Zz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?eWdaMlVWZmlFWW92VW82S0UvQmprK0UrNllmbDJxalpJRi8yZ3Y2dC9DYmd0?=
 =?gb2312?B?a1RFc2lWZGkvcHU0QnFGaTh4MXNCOEpQOUhPK2kyalpabW1UcU0yTEgrU0xh?=
 =?gb2312?B?eStaMWw4YUlzTU1jTHNmWm5KcFhoWHpoMzhhbFdzVmJlVkZFY0pKNXdRUGNu?=
 =?gb2312?B?aTJ2VmF1bDBhc1M1QmJXcHlNWlJTNE9zZGNNc08rRkw5Z1Y0dXcvdTMvN2RZ?=
 =?gb2312?B?TUl3ckRBZ3RGVXF6bjRERDNvSU14TGhxUVNuTGJhc3FMT1RqRFZoTFVwS2Fl?=
 =?gb2312?B?QWlDUmdaZm84VXRzbUtLUjloYVpPZDZMWE1VcTNsYkZHZWNQcVZOVi96S21r?=
 =?gb2312?B?cDhNbmwrYU45c0M5M1ZPV21QZWVBMkdVQVUxU0VSTU5OS0pNU0ZOYkhIaUZn?=
 =?gb2312?B?bG9PK2YzY1czWko4YlpKa3c1UnlKWk81WnB1YjhqbndFdUJQYWZ6OHU1SVcx?=
 =?gb2312?B?OUxxdElrdFhrbElGclE2SytINHZLZVF3VUo2MHNIYzlkVGV0ZWN1ejYvUW9Y?=
 =?gb2312?B?RFpvUkpWcEtHekw4ZFRHMGkwL2ZGcVBiOHJQTVdFUEtiTlpXanhZVUNlRTB1?=
 =?gb2312?B?NTBIdGZGOFNzS2hJY1BieldyU2Q1TGVEbVU0VGVBQi9DVGx4NFJQQ0k3ckEx?=
 =?gb2312?B?bSttekl1eEIxWFdkcDROaktYR1Avb2l3NDByVUZDM2l2SmxZR0VEakRhWitm?=
 =?gb2312?B?cWZTcnFaU1JUajRIQTRwZXZPSU5NY21TU1N5YWk5MUNkanRhWERFL1FSalVC?=
 =?gb2312?B?MkdueENoZWNuUzBndTEzNWxlaUNUSVNXcnhZcjVvNmhjVmkwN3lCOWxPYnp4?=
 =?gb2312?B?c0xlTE1FR1ZNVGoyVXc5a2RlOU1uV3dmOTBrNFVYUWdXNHVpQXQ3UWVxT0ZO?=
 =?gb2312?B?c01pbklBTXlicXJNYlp2L2piVHI3bzJMVXJsT0U2bC91TmY0ZlNzSmU4aGxm?=
 =?gb2312?B?RUczak9BZlAvUEdpOGRiUzZTWjNXTEFrU1daM29lZURROE1GWnY1b21HMkxY?=
 =?gb2312?B?cWZkTFMwR2JsSS9DUTFwVWxDSjErek9ISkYrRGpXc2NDbWYwd3BnaDZEaGNG?=
 =?gb2312?B?aGswRXRBL3MvNGpmS0Y5K2NxTG0xUDRzY2FmY0dOTnFmNTJmY3c4dTBFUUQ4?=
 =?gb2312?B?SkdkTHlyb0tpREQxalhKQjY5VlBwUEh2ek5tY3VVZUtVK3lFRG9rVW4yQUQx?=
 =?gb2312?B?T29DM2hnRGw5a1FibmZoMklNZnRtbzAxYnNWUWQ0SU1EK092NUx1N2RoZXZS?=
 =?gb2312?B?ZUpuZllaTVRudnNZbWhzNC85a2R4U1VUWVlsYUxKVXVncC9EWW1iN1ZmODB0?=
 =?gb2312?B?clFEUjY4SDNtbGxFd2VyNXd4L1NjRnQ0ejBlNC9XSEllVFJkYmJjZ0dvRXdW?=
 =?gb2312?B?dVhNdU1oU0U4akxwWXQzWFFyVlhXZXFEQWZnY3FwL1dQdmlJRm0rdW5sL3RP?=
 =?gb2312?B?SGJrL0dBNUFEN1c4S05WSm1Tckw1VEFzc25kOFlTWTExQVlKSXN4RmVIbld0?=
 =?gb2312?B?c0h1QWZQYWpNVWF4RDE5QVFvMnVveFIrNklkVnVGeTBFM1loZGFDandOcWxV?=
 =?gb2312?B?aDQwZXY5dXVPZDRHcVVuVUx2WTExMkVuZlhpNC9KTWNOQU44K1gvY2lySitO?=
 =?gb2312?B?dE9DRzd4aUJnbGFUcEhub1JxL24wWm15R0hFVklQMk5zTmdFdmFzNVdScXBt?=
 =?gb2312?B?V0pLcnZsLy90NzRvbzNYSzVnZjFiVTFUUkZtSlBCRHdnTGZhRSs3ZGhTbmhX?=
 =?gb2312?B?cy9tWEtadkJlNDFDa21IZTBHNklGVVlFL0NzWmw4YWRSMVlSMHRhYzRtWS9s?=
 =?gb2312?B?UWkrdlZDQkxmKzlwWURJTmp5b2k5Y1dsUUkrRFBLZ2JpeTVHUTNzMDg1QytI?=
 =?gb2312?B?MDBQcVAxQnNnRjBtWWlSNUNad1BTS1lIT1FYbXc0a0hzemxnR09OWlNxR01K?=
 =?gb2312?Q?bYRWqjup6Ws=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ea83cecd-f45e-4741-42be-08df2ea8cdfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 12:51:05.4890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7942

RnJvbTogWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KRGF0ZTogU2F0LCAxNyBPY3Qg
MjAyNiAxOTo1MDoyOCArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjMgMy81XSBkb2NzL3poX0NOOiBh
ZGQgbm90aWZpZXItZXJyb3ItaW5qZWN0IENoaW5lc2UKIHRyYW5zbGF0aW9uCgpUcmFuc2xhdGUK
RG9jdW1lbnRhdGlvbi9mYXVsdC1pbmplY3Rpb24vbm90aWZpZXItZXJyb3ItaW5qZWN0LnJzdCBp
bnRvIENoaW5lc2UuCgpVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IDZhMjQy
NDcxMzJkYgooImRvY3M6IG5vdGlmaWVyLWVycm9yLWluamVjdDogQ29ycmVjdCB0ZXN0J3MgbmFt
ZSIpCgpTaWduZWQtb2ZmLWJ5OiBZaWt1biBXZWkgPHdwZXRlcllZQG91dGxvb2suY29tPgotLS0K
IC4uLi9mYXVsdC1pbmplY3Rpb24vbm90aWZpZXItZXJyb3ItaW5qZWN0LnJzdCB8IDEwNyArKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVj
dGlvbi9ub3RpZmllci1lcnJvci1pbmplY3QucnN0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQtaW5qZWN0aW9uL25vdGlmaWVyLWVycm9yLWluamVj
dC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rpb24v
bm90aWZpZXItZXJyb3ItaW5qZWN0LnJzdApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjYzMWRlM2RhYTZmYQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9ub3RpZmllci1lcnJvci1pbmplY3Qu
cnN0CkBAIC0wLDAgKzEsMTA3IEBACisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAorLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0CisKKzpPcmlnaW5hbDogRG9j
dW1lbnRhdGlvbi9mYXVsdC1pbmplY3Rpb24vbm90aWZpZXItZXJyb3ItaW5qZWN0LnJzdAorCis6
t63S6zoKKworIFlpa3VuIFdlaSA8d3BldGVyWVlAb3V0bG9vay5jb20+CisKKz09PT09PT09PT09
PT09CivNqNaqxve07c7z16LI6worPT09PT09PT09PT09PT0KKworzajWqsb3tO3O89eiyOvM4bmp
wcvP8ta4tqi1xM2o1qrG98G0u9i199eiyOvIy86qtO3O87XECivE3MGmoaPL/LbU09qy4srUzajW
qsb3wbS199PDyqew3MqxtcS07c7ztKbA7brc09DTw6OsCivS8s6q1eLA4MqnsNzCt762utzJ2bvh
sbvWtNDQoaPT0NLUz8LE2rrLxKO/6b/J08PT2rLiytTP4NOmtcTNqNaqxvehoworCisgKiBQTSDN
qNaqxvcKKyAqIMTatObIyLLlsM7NqNaqxvcKKyAqIHBvd2VycGMgcFNlcmllcyDW2MXk1sPNqNaq
xvcKKyAqIM34wufJ6LG4zajWqsb3CisKK1BNIM2o1qrG97TtzvPXosjrxKO/6QorLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiu4w7mmxNzNqLn9IGRlYnVnZnMgvdO/2r/Y1sYKKworICAvc3lzL2tlcm5l
bC9kZWJ1Zy9ub3RpZmllci1lcnJvci1pbmplY3QvcG0vYWN0aW9ucy88bm90aWZpZXIgZXZlbnQ+
L2Vycm9yCisKK7/J0tSxu8no1sPOqsqnsNy1xCBQTSDNqNaqxvfKwrz+09CjugorCisgKiBQTV9I
SUJFUk5BVElPTl9QUkVQQVJFCisgKiBQTV9TVVNQRU5EX1BSRVBBUkUKKyAqIFBNX1JFU1RPUkVf
UFJFUEFSRQorCivKvsD9o7rXosjrIFBNILnSxvC07c7zo6gtMTIgPSAtRU5PTUVNo6k6OgorCisJ
IyBjZCAvc3lzL2tlcm5lbC9kZWJ1Zy9ub3RpZmllci1lcnJvci1pbmplY3QvcG0vCisJIyBlY2hv
IC0xMiA+IGFjdGlvbnMvUE1fU1VTUEVORF9QUkVQQVJFL2Vycm9yCisJIyBlY2hvIG1lbSA+IC9z
eXMvcG93ZXIvc3RhdGUKKwliYXNoOiBlY2hvOiB3cml0ZSBlcnJvcjogQ2Fubm90IGFsbG9jYXRl
IG1lbW9yeQorCivE2rTmyMiy5bDOzajWqsb3tO3O89eiyOvEo7/pCistLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiu4w7mmxNzNqLn9IGRlYnVnZnMgvdO/2r/Y1sYKKworICAvc3lzL2tlcm5l
bC9kZWJ1Zy9ub3RpZmllci1lcnJvci1pbmplY3QvbWVtb3J5L2FjdGlvbnMvPG5vdGlmaWVyIGV2
ZW50Pi9lcnJvcgorCiu/ydLUsbvJ6NbDzqrKp7DctcTE2rTmzajWqsb3ysK8/tPQo7oKKworICog
TUVNX0dPSU5HX09OTElORQorICogTUVNX0dPSU5HX09GRkxJTkUKKworyr7A/aO616LI68TatObI
yLLlsM7A68/ftO3O86OoLTEyID09IC1FTk9NRU2jqTo6CisKKwkjIGNkIC9zeXMva2VybmVsL2Rl
YnVnL25vdGlmaWVyLWVycm9yLWluamVjdC9tZW1vcnkKKwkjIGVjaG8gLTEyID4gYWN0aW9ucy9N
RU1fR09JTkdfT0ZGTElORS9lcnJvcgorCSMgZWNobyBvZmZsaW5lID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9tZW1vcnkvbWVtb3J5WFhYL3N0YXRlCisJYmFzaDogZWNobzogd3JpdGUgZXJyb3I6IENh
bm5vdCBhbGxvY2F0ZSBtZW1vcnkKKworcG93ZXJwYyBwU2VyaWVzINbYxeTWw82o1qrG97TtzvPX
osjrxKO/6QorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoruMO5psTc
zai5/SBkZWJ1Z2ZzIL3Tv9q/2NbGCisKKyAgL3N5cy9rZXJuZWwvZGVidWcvbm90aWZpZXItZXJy
b3ItaW5qZWN0L3BTZXJpZXMtcmVjb25maWcvYWN0aW9ucy88bm90aWZpZXIgZXZlbnQ+L2Vycm9y
CisKK7/J0tSxu8no1sPOqsqnsNy1xCBwU2VyaWVzINbYxeTWw82o1qrG98rCvP7T0KO6CisKKyAq
IFBTRVJJRVNfUkVDT05GSUdfQURECisgKiBQU0VSSUVTX1JFQ09ORklHX1JFTU9WRQorICogUFNF
UklFU19EUkNPTkZfTUVNX0FERAorICogUFNFUklFU19EUkNPTkZfTUVNX1JFTU9WRQorCivN+MLn
yeixuM2o1qrG97TtzvPXosjrxKO/6QorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KK7jDuabE
3M2ouf0gZGVidWdmcyC907/av9jWxgorCisgIC9zeXMva2VybmVsL2RlYnVnL25vdGlmaWVyLWVy
cm9yLWluamVjdC9uZXRkZXYvYWN0aW9ucy88bm90aWZpZXIgZXZlbnQ+L2Vycm9yCisKK7/J0tSx
u8no1sPOqsqnsNy1xMnosbjNqNaqxvfKwrz+09CjugorCisgKiBORVRERVZfUkVHSVNURVIKKyAq
IE5FVERFVl9DSEFOR0VNVFUKKyAqIE5FVERFVl9DSEFOR0VOQU1FCisgKiBORVRERVZfUFJFX1VQ
CisgKiBORVRERVZfUFJFX1RZUEVfQ0hBTkdFCisgKiBORVRERVZfUE9TVF9JTklUCisgKiBORVRE
RVZfUFJFQ0hBTkdFTVRVCisgKiBORVRERVZfUFJFQ0hBTkdFVVBQRVIKKyAqIE5FVERFVl9DSEFO
R0VVUFBFUgorCivKvsD9o7rXosjrzfjC58nosbggTVRVINDeuMS07c7zo6gtMjIgPT0gLUVJTlZB
TKOpOjoKKworCSMgY2QgL3N5cy9rZXJuZWwvZGVidWcvbm90aWZpZXItZXJyb3ItaW5qZWN0L25l
dGRldgorCSMgZWNobyAtMjIgPiBhY3Rpb25zL05FVERFVl9DSEFOR0VNVFUvZXJyb3IKKwkjIGlw
IGxpbmsgc2V0IGV0aDAgbXR1IDEwMjQKKwlSVE5FVExJTksgYW5zd2VyczogSW52YWxpZCBhcmd1
bWVudAorCiu4/Lbg08O3qMq+wP0KKy0tLS0tLS0tLS0tLQor09DSu9CpIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzINbQtcSy4srUyrnTw8HLzajWqsb3Ciu07c7z16LI67mmxNzAtLLiytQgQ1BVILrN
xNq05s2o1qrG96GjCisKKyAqIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2NwdS1ob3RwbHVnL2Nw
dS1vbi1vZmYtdGVzdC5zaAorICogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbWVtb3J5LWhvdHBs
dWcvbWVtLW9uLW9mZi10ZXN0LnNoCisKK9Xi0Km9xbG+ytfPyL340NC88rWltcTJz8/fus3Pws/f
suLK1KOsyLu689TazajWqsb3Ciu07c7z16LI68Sjv+m/ydPDyrG9+NDQucrVz9eiyOuy4srUoaMK
LS0gCjIuNDMuMA==
