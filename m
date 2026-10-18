Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012056.outbound.protection.outlook.com [52.103.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8A125AA
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 01:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792287491; cv=fail; b=oLb6ev02hQ/s4qKjtBbtItMQvASpP7HbZm99S6R3vjKLj954GXN3cNK/UrCmTRmKp9CeWRFJJYC22n+4EYGv2hJfyhp3tKbMoRmwswKb0+GaiRaMcibL2/qsTvnKCjq+HBrRN8p2BFubltqvBbw5KjlUy6bZ09DCTGK22Xz8mSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792287491; c=relaxed/simple;
	bh=3T+IKU6NeMUPpobZ/+tXDZVpP2rHd1L6Dm/4sa09bS4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wpf4dJ7C71AsoMsaaaYmicu7+ELe1sx6Z7On6zNm/0q9dL7+E6tsg6d+tizffMe9eMZrjvXMkrTSLgrXjIdO7P3o6j2SFpZcY4mwBWS+zKdWmg5mQ72HtbGXjQ1HV/cCBQpQJkcjfilOjhIY6HvOqiTYVV3ezhJrgbU7uB+xkQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZYq6bjP1; arc=fail smtp.client-ip=52.103.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZYq6bjP1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCXLpN9WQZniUIxMcrv51Rvf+udgeN4JCuNy98O3TFoPWkCa23fM9ksyNSQNlSKTk0v76xrnXUS9NrUwFyvDrw/mlPfob0p/8OY8Avdhqw49RMrqT00xdgs/PxtDa5/rpbidSpYwAlymUWaqemWs2xI9I36FSOurIQFMtgXMTXuBKzwQfJjrBphm4cLa0qJKwE451iAGjQxq/UvLqfTQIE3rsIaa1B58d+7a+UbmNzWyivAqFrqX4+/jh9iw1edfUUdJfGJ1tQqPemhR64lAL5zva0pw3ZZH7j9tKeIjF9KwatMiu/iTOhyGOgTh9dM0tLQEZv+DZeQjqWtSt3HMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T+IKU6NeMUPpobZ/+tXDZVpP2rHd1L6Dm/4sa09bS4=;
 b=I/Viy0SN671YpmE+tbzeVEtnFH7EgtiVCUVVDN0UIRJZAElcqJoGIPiCdZCoLJXFPSJlUsg9dn+q9H2JpGDL/3YQkuDn7Udv8JBZsCJBGA5SOiKq14pepYF47eOCHfZQFBKhWjPn4v8C3pZUI7vBYn4lxZyhZkiveN0Fq1Gg9hWL3wBjsFsZAytgv5alnyLRswiwHCx+z773tZy8fCCU1LFC+J/ssOYtqeG6NUCaqkdlsrHxJuoHKWeUUTOK+GnoneNCR4SPJOiRpLpNEvP3c8fHxgqSzY+ZRnzOAoLdyChBhAbJrOqEdsMq70UapPw/TEWvp2vnz6H4YAfgb2ltWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T+IKU6NeMUPpobZ/+tXDZVpP2rHd1L6Dm/4sa09bS4=;
 b=ZYq6bjP1+NSZyCQLRsXbylbJtkrXFkFWPUVhmvsx7dX5jyZMvXCe1uW+1fS603NjKuNJJLyJgzKL6mRNkAIce/v4Twzs3yTM0awUw57EQUlcvA0G4tnZ22NARBVgbYw1FTLXCqr5RpAHV+nBDdzpPX70T13Za4JnjdB2IqaHlnQr5cx/UCiZ5FOoPLlyXgBgeYjKvxnMnia4GyHxzD0oYAD0yywCjJ+10gpxdGYg55z5d5Sp9BP/l5rz9Y7iJTKKS2eE1Wd3BuzkDw1gqmeyXwAG5bD+WeDwYvC/w2Hiafvy+Mv920Jr0e1LWtskQRvsndi055Dk7qskCt6vMBKp8A==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by SI6PR04MB8221.apcprd04.prod.outlook.com
 (2603:1096:4:240::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sun, 18 Oct
 2026 01:38:05 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 01:38:05 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: [PATCH v2 1/5] docs/zh_CN: add fault-injection index Chinese
 translation
Thread-Topic: [PATCH v2 1/5] docs/zh_CN: add fault-injection index Chinese
 translation
Thread-Index: AQHdXqFSu7AZJAZ/1U2GrXay8mIcHA==
Date: Sun, 18 Oct 2026 01:38:05 +0000
Message-ID:
 <SI2PPFCA65436499D695AC6E6A1D1A2FE76DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
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
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|SI6PR04MB8221:EE_
x-ms-office365-filtering-correlation-id: 13a75675-bc91-4dba-5f63-08df2cb87493
x-ms-exchange-slblob-mailprops:
 Mga27o8vReFMpJ98Mhe2mHSRKV8H2BuVIfCuNjdg6IntSozEOiIo9Qq9chcrIxwjfc0Vr3fv70+toRoP5WVLpy1AaCYnYXcgfj1ujONREt/3vM9zG0Uvn3bdgEtzeBwlSmkI0P4TlHhqvV8ja2/CLYL09ZViuLhSkty5/FOrPRJMh38hyG3pzZxkh1SWynLpa8WmFERoyXHbu3iR6c77CtrZw6eBpXpJxdlfXCKnS1ygdsDBSeoMKfb4K1m9FNf5IMohwC5YDKzR1KUXpApcwBWOYcfJksXbr+dt/MtXnYG8BtqlH+/58EvneV7e3Hk8u5edi5b0WVPh1Kjv1xiY5PoQzh+7wSJihV7dyeRigLVpTG/i+S9+TQ2n/O2L9flsIGzLYHyv70TV930YuJEywRzf9iyFwt2KdXcWmNU/O6hXRvQB37lazwg2FmnUPLqcPH+lHxvFyJvmZPjarp9kB2KIjS7xFCMbXlSRAqqI/5yD+4PxfGz/GRcwguy5GZ0qcT/acAuI3/IC4ABjHZou1CZLfplyLt+zwwWUuhQ0AhGibuToUL3K6HgZ9+507epQIOuKiHS5gSYJ/3877hgXrIx8iu4iomgZGPsGGz+eBxSUgv6Tr2LNJBkRj4g1K8nhdUcylMKFqZEa4mwmlFG5ma1X4/h+/EyPb1SEG+b0bskF7NR0AFm2wpj1UGHNHzWxqo0G1UQB3uVl0u9Fwa2DT5lnwXTCfJX+rOshTcObEEJi3jeq+52t23R9oM1gI4GLY9jYfMbRKsfzboRjlJf2YUdZwJM4JuoUxXNsOugYD/MmxccQ5UGjmg==
x-microsoft-antispam:
 BCL:0;ARA:14566002|2604031031799003|8060799015|19110799012|15030799006|15080799012|51005399006|8062599012|36102599003|31061999003|22091999003|24121999003|4040399003|3412199025|440099028|102099032|40105399003|20061999003|26121999007|3430499035|30101999006;
x-microsoft-antispam-message-info:
 =?gb2312?B?RnJaWVNzS09iUzNjNlVPWWN4amtjVWJGb3BOM2hhbTFZR0grTnRFSVlBQXNS?=
 =?gb2312?B?UlRqSkJJdmRuSXJCbzl6ZnFrQnUzSDkrVDEwK05vMXFMZ3pFczVZK21keG9O?=
 =?gb2312?B?RVNlMStDNHNMSXcrUDI5NnRERnUrbUZWcGRaVEcxUW5KZEhtU2ZsdmtGaThQ?=
 =?gb2312?B?Y24vRzFTQ1d2NDRjR0lvNUZQSG4xaGw1bWM0Tkd0anErS2pYR0JobnVYOFo5?=
 =?gb2312?B?WFJIZlFGZmZqdk41Z3dRQmtzcTFINXdra3YyamZYL0JYSkVNc3pEdGRCNUxN?=
 =?gb2312?B?eFdHcWdMcm14Sjc2QVdscWcrVXV3S3A4WTRaSGZZOEI1VmJ5MXZqTW5KYnND?=
 =?gb2312?B?b1hJK0JETGVSQUU5MDYvYXQ3MkNNOFpjTjJ3REFNQ3dVSTM2alBVczV4dnFi?=
 =?gb2312?B?RnRjZUZkZWpYTzhsUm8xU3NoYTU4OVFKam9oU3NjUmFjQ1RaVDd4TCs5b2hV?=
 =?gb2312?B?elpQZVBjT1l1SUJkM01SNlo4czZRcDB1M2swQThQdmJIMHlZZkRDR2oxamhu?=
 =?gb2312?B?NFlJTFVsVmFWTkl3Slp5UnFkL3RCVlZLSnhHVWlnanhQaGphcDNYU04rREVz?=
 =?gb2312?B?NitWaFN6U05iaGpDNFJsbUpweGxGdmFMbnhGbXZSS0VleXU0QU14L2lrcEI2?=
 =?gb2312?B?VVRCVUlMVGVxUEJROURSYkt4bHRyN3RvZGJWb2N4bW1EVDZWWkhNZTFmRnVz?=
 =?gb2312?B?MFM3YksvVnMxbHZDeElYd1pJcnlwN3NRV1BHa1FOZFdLUTZFaDZGOW9IZEtl?=
 =?gb2312?B?Z0wxYkd0VFBsdGNwckpXeDhSZXRzeXVMQmdybnVaVHU3WjFjeVhMWVJRdm9n?=
 =?gb2312?B?WGc4ak9VOXMvTWpxa0l3Zk5MNFYyTkpUcDVJRldTQ0hHSE9ocldPWkFlblhx?=
 =?gb2312?B?Y3ZBWkZtcXU4YU94NnN1Zm11aU5RL3NadkR2M01CN1RKQmxWVEcyQ3diVEcx?=
 =?gb2312?B?cDR4SW9Hc2hMbWtoaHYvZlRhekNJRHVkY2ZiZGI1Vm13MngrdXVNQXp0b1hU?=
 =?gb2312?B?WGhxa2xpU0xMc28yYlpDdzZsdmRFcWFyVU9hQXdUenN3TzM4UVJZMFo1eDBN?=
 =?gb2312?B?QmpSSjhhYWFBcmdzTDFXRWZlbkQvRTZNb3V5R1Z5RUl4N2hPa2dXUXZJclF6?=
 =?gb2312?B?TG42YmlOd25kVDdBMmxRTVRGazhWTktYS2ZmaExlbFNGTWlJNlc1RU11TjYz?=
 =?gb2312?B?N2RQSUp0TTZ3QzlIR1lnZTNOUSsxdkFGZkNHNkQwMzkxRE1RUEp5N0FsV0ZY?=
 =?gb2312?B?TjY0MUNKWEE4anp6bjU4cFlYNDB2QU95QTVDWGQ4bkZlRmNHWDhKYldIMERj?=
 =?gb2312?B?ODArbzliT2hLaWYwQXhFUEFTMzFCd0RTNXV4V2NPVzNQMkV2NE1jdk1DbHN3?=
 =?gb2312?B?ZjNBTEl3dzkwOGN1cGdWL2dYK0xOaXBFNDRGUitqbFQzUFU3elZ4bmx3MHNi?=
 =?gb2312?B?SnYyWHJUbk5Pb2tYRXVkWnJYTm1uUkE3ZE9iNmxXbEdJU3JqcXcyaXp6K3gw?=
 =?gb2312?B?Z0xXd0Y0b1VCbDR0TXY1Vk04NUNBRlRRZXhMWHl3V1BJc3BmLzdWMzFWVElE?=
 =?gb2312?Q?1B6PxMm3vZ86sL+I1N9h0ts0w=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Y0RBajJsTU1RQTRzbHRBMmV5MXBvTzdXUzNQeVAxcHpoYk1CQWhoV1hVNE13?=
 =?gb2312?B?QVJzNm5zQVc3dVlOa0NUd2ViL3k3UEo3ZDF4YURtQkdyVktyRDRCOC9WQUE1?=
 =?gb2312?B?QXBvdG5FbnZCUjdzcWgvYjg0c3pZT3ZkSWJZZGVUekNiQTZKL3h5M2s3Vi9N?=
 =?gb2312?B?ckVkeGNUMWlncE5WT0tJTEJiUUpwQXprckNyS0ZVQVpPajRWd09FUzZ0TytF?=
 =?gb2312?B?bmpXU28zTFBvLzU1UWxwWkZBeE5kTmROWHBjYUdNRnFSNzY3NDdZQXQvYkJu?=
 =?gb2312?B?eDZpQURaeWlrbGJMYXFmNWovTi9BaWpYVW53SzYrSTZvMmZOcEhqd2JBOGVW?=
 =?gb2312?B?Z05hS3l0ZlhtaFdaQ2p2Y3VSTFFUYUh0STNyWU9zcUI0Mm1OOXdmYWZyWkNI?=
 =?gb2312?B?elBPSTRGYkxJOEdvdk1KQXphVUpOQUlscDdOVjFNeFFOekJRMThFK0JKalFT?=
 =?gb2312?B?bkw1UWZBdm8wMHUwbWVML0xaZ0FGUjUwckJxVzh3M3RrVHNkVjR5ckZyYzlj?=
 =?gb2312?B?alBVZENZclNMcFRuc3ZZVnRHNjczV2g2allpTmFYNVNaUWQ3YTlLTlFUTERL?=
 =?gb2312?B?Z21hcGdtampxRVd0N3NGN0R6dlB4bnlYOGxsRnN5TVFNcjBuWHBNWW9JdTM1?=
 =?gb2312?B?MmVxRG9xR1hEN1lTQU4xOVBhekc1bGpEM2ZCdkMvUDlLZjV4dTJ2Znd6SXQy?=
 =?gb2312?B?NWpyeE5tZzhQMjlscUVIRzFocklTV09lMHNKMW8rcGkrWmc3dE1ScU5YdDdv?=
 =?gb2312?B?MUFMd3dzUjhKM01Kcnh5RlRVbXdpdEVwZFB3cVR3MlFCU2FKaldTdkI3cmtz?=
 =?gb2312?B?UmpxSitFUHdwWUVrdzRqL1diK1l3NkdMSklaM2NuZEszdm9tYjNwaFIrNk5r?=
 =?gb2312?B?MXVWZ2R5OEwwY2hkWjM0K3JHMTMyRGo1Z0VjVExGL2FYc3FudTl1K25DMzhk?=
 =?gb2312?B?MUJ5SWVTT2tlckxKWEFobkM4WkdTeURyTWlSQXd5Vk1hTjVOMXFCODVRdTB1?=
 =?gb2312?B?NUQxZzNwS3EveWJScERJNUlQYnZLNkJ0cnJoNUx3M0lqNHFzcVhsVlRXU0Fx?=
 =?gb2312?B?R0lEcm5raDBNQ3I2bmpjMmFaT3ZnS09sZnhNdVdJbURvb0NudXVXc2Z1eGJY?=
 =?gb2312?B?OVltNFhMb3B1L0hiNkkwK3N2YTAyclhSaFYxODd3b2J5RzZUOVRmZWVxUG9s?=
 =?gb2312?B?WW5RdzV6aUxreUdqT1lHci9pcHByejdrLzhmVWhJM1ViS0VvNWpQdjFzMGRw?=
 =?gb2312?B?clpOd040T2M2SGJVdnI5cS9CNU1WdWtLOTkyYkNTNDlTRi9sN2hkMmR5Y3F6?=
 =?gb2312?B?UXVVTEg1d21aTjZUYUdaK3BvV0N1Nm5Ia3V5bzFaWWttNmZ1TEZYTWhwNmh1?=
 =?gb2312?B?RTNDYmF1MUN3djRpMnlZSTdKa1N1MnhpckE1enlseGRBdUhUSTNnVDZQSXpM?=
 =?gb2312?B?RzJSZFBTbFlhaGFOalkzWFE5bDBaMTIrcDBaaWxDa0cvQm1icFBOOFdkWmY0?=
 =?gb2312?B?R3hVNjVrQ0d2N0JjQzFhV2FTeHBJUjNjWG04cVI2VEpyWGRBczVhZ3hQOHd5?=
 =?gb2312?B?UFRta3c1QkpSaCtRQ2ROeE4ybkJxOVhlYWtucnQ1bDhaMEZ0RklMNU9xNXVz?=
 =?gb2312?B?a3hHaEt6UFJWaFduVlN6dWpTbHp5dUR3TTZ3Wm5OSTdtczZ1VG9maUhIZmMy?=
 =?gb2312?B?eU1vSEtTbGM1MzJ6enZhUmtCSVpOQ3c2akVIRTlsUmIxRjRMSXJZdzRDSVBh?=
 =?gb2312?B?Si8rU1BSSnRud0VXTi96Zzllak11cnR6Y1pBczZkSHZiSTluVlFRL2lZUXlv?=
 =?gb2312?B?MWkrQmxhdVhLVHVpVzF2VkVsQzdTRjYwOHBwRThoY3ZZMnFUNEZnQytxTC92?=
 =?gb2312?B?b2szTUt2Ny8xOVRWVDZ4SFhiMXNiTVFtdzhGNGlZMkVZR2ZtZmswdDA4d0xU?=
 =?gb2312?Q?mIhZyEYyiqo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a75675-bc91-4dba-5f63-08df2cb87493
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2026 01:38:05.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB8221

RnJvbTogWWlrdW4gV2VpIDx3cGV0ZXJZWUBvdXRsb29rLmNvbT4KRGF0ZTogU2F0LCAxNyBPY3Qg
MjAyNiAxOTo1MDoyNyArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjIgMS81XSBkb2NzL3poX0NOOiBh
ZGQgZmF1bHQtaW5qZWN0aW9uIGluZGV4IENoaW5lc2UgdHJhbnNsYXRpb24KClRyYW5zbGF0ZSBE
b2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QgaW50byBDaGluZXNlLgoKVXBk
YXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCBhNTkyYTM2ZTQ5MzcKKCJEb2N1bWVu
dGF0aW9uOiB1c2UgYSBzb3VyY2UtcmVhZCBleHRlbnNpb24gZm9yIHRoZSBpbmRleCBsaW5rIGJv
aWxlcnBsYXRlIikKClNpZ25lZC1vZmYtYnk6IFlpa3VuIFdlaSA8d3BldGVyWVlAb3V0bG9vay5j
b20+Ci0tLQogLi4uL3poX0NOL2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QgICAgICAgICAgIHwg
MjAgKysrKysrKysrKysrKysrKysrKwogRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
aW5kZXgucnN0ICAgIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9mYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0IGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQtaW5qZWN0aW9uL2luZGV4LnJzdApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjFiM2MwYzhlNWViYgotLS0g
L2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWlu
amVjdGlvbi9pbmRleC5yc3QKQEAgLTAsMCArMSwyMCBAQAorLi4gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdAorCis6
T3JpZ2luYWw6IERvY3VtZW50YXRpb24vZmF1bHQtaW5qZWN0aW9uL2luZGV4LnJzdAorCis6t63S
6zoKKworIFlpa3VuIFdlaSA8d3BldGVyWVlAb3V0bG9vay5jb20+CisKKz09PT09PT09Ciu5ytXP
16LI6worPT09PT09PT0KKworLi4gdG9jdHJlZTo6CisgICAgOm1heGRlcHRoOiAxCisKKyAgICBm
YXVsdC1pbmplY3Rpb24KKyAgICBub3RpZmllci1lcnJvci1pbmplY3QKKyAgICBudm1lLWZhdWx0
LWluamVjdGlvbgorICAgIHByb3Zva2UtY3Jhc2hlcwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vaW5kZXgucnN0CmluZGV4IGIwOGMwOWQ4ZTk2ZS4uMDc1ZmUxNWYwNmZiIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3QKKysrIGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0CkBAIC03NCwxMiArNzQs
MTIgQEAKICAgIGRldi10b29scy9pbmRleAogICAgZGV2LXRvb2xzL3Rlc3Rpbmctb3ZlcnZpZXcK
ICAgIGtlcm5lbC1oYWNraW5nL2luZGV4CisgICBmYXVsdC1pbmplY3Rpb24vaW5kZXgKICAgIHJ1
c3QvaW5kZXgKCiBUT0RPTGlzdDoKCiAqIHRyYWNlL2luZGV4Ci0qIGZhdWx0LWluamVjdGlvbi9p
bmRleAogKiBsaXZlcGF0Y2gKCiDD5s/y08O7p7XEzsS1tQotLQoyLjQzLjA=
