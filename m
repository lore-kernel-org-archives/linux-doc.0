Received: from mx0b-00622301.pphosted.com (mx0b-00622301.pphosted.com [205.220.175.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0CE21882F
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.175.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623592; cv=fail; b=t+AvvMkxvaFTft36cy+1USR8YFYqufL9pumudI3AVt0yNBt5fAue7pdk2eBs2q/ruS3aZVBabTQZOAqe7CkaM3p62nQKV3PGelfyviVC0RqPjBQJoRb74GOtEROonnIziKsQT3fQuDlTvvK3qQOwZuhFMToUIp1WXxMm92v3BhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623592; c=relaxed/simple;
	bh=7A9YlDT2prZOKI3n9KPJRRF10XYJgTsqitwqcapMoYA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=N8yWjLd+3Wu0cDK0t0hVlyI3/t2Y6SFxFn3lGq4i/IzcDqZkTWS7n3Uh6geTN5zun5RsfjTBI+iHCPyI1C+gke//ji/uZcsbSUZIB2BV4zwlqCXjjamyjvvpx/CYyijAwpnIabOtSjEXECeC/Lh4hGrzbVYZ2613Xvrqiq6fJvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=NU8X54W+; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=I6L7QKAD reason="signature verification failed"; arc=fail smtp.client-ip=205.220.175.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="NU8X54W+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="I6L7QKAD"
Received: from pps.filterd (m0241925.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547CqJlu005294;
	Wed, 7 May 2025 12:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=7A9YlDT2prZOKI3n9KPJRRF10XYJgTsqitwqcapMoYA=; b=
	NU8X54W++sIUZud9yUM0sXe5sTbL/gc4NtJVeBy/cYI2Z7Ex8e300xTkXjtrZwRq
	GRBHZQ0LMktU1bIKbGCsJ1NqBJPaBUnRgQgYne+afikRHO8Roqa8udxjJwJmDw2H
	QBDp0hia+bhJL8RlO86AA2F+pI3bftNCSwXUYDHQxX2hEgkmE8CsArhmGOj0uMU8
	bHJAXW3pdvgfdwe7BpBT6Wg4c8JkT7u2omhLMTHGMHZ0GDMEmDzkh3ao09IZtcOT
	w9n+vahelmk0EAe+KHAFsCqnwfpveARjUzUnHooIrF9DZqGUyL4PC/KtaG6xPgRR
	s3ujXkUF4UkjZBJIuUQB8A==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46dc8mtbsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 12:55:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuTY5I93wcAtBxGM5298V+ftp7zj1AS9oDt32UZ7v95ee0ewjy7kydKwYD34S12g9zu+CG8DRACqPsZkZ6GH2FCoTBinUEpcx6fZ6NOkqc55RMQvqrrEEmPkJbTbKMoJzt0Y3ldZsYjKbt0yHNonDFcwqESkojCJDvtBeNY3BFLhRNtXPYFCSCvqI9YSX/vxkTK0CbXxUiEWR8Oy6//sfmFq0h+wZ3iKeI3EJtRR0vUcJiT3obaEeQM1BXLViBX8EAlNJIqbDnIwmYoKLhkI7H8bOEs3aXSb3XO9/0lOTrUA15MLpfM5Us60mSlGWBi/tkdSylYR9cnBB4OD9afVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Z7r3AnKZkNuyBgu6mHkdX2qVDmoSLrSOMUq11DdVbk=;
 b=LJRxRXVVfj+I/a6as5xCCy+bkAA8YHy9GjQ4Ql1+ndkBVAdPXvyoAzRFZMtkAT2HXpd35x+Ab31ffcjynwk5hnYrBHWeC34T60Kaph4usqmvBCJAb9YXMbjphqU50jjS5NJl3E9UAOfg86vqOAhhPq0venGCjpjelfDYPifWjw28IUwzE4SFRsM5gfnNsXeJHNhal/CGaE9ELZzpU1JQ++jka5eT17KlrId13bYkZHQKR+K6mKSKgofhm/SAN9qrSK7yEzeTDQ+eArWdmDF0FfCQeTuU6XRknsUEvIT0aNwAlxH/CchulT7U+Dkx9rODF/fhwqW9COAZjV7BWjqhrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Z7r3AnKZkNuyBgu6mHkdX2qVDmoSLrSOMUq11DdVbk=;
 b=I6L7QKADe3ERkyxfr1SUD2HHEvsRPtLhBDBklonKfcpEXlsDesyFgi63mT5M5nCAkJ/TFVVZCLRXUzWrd8fBqu4qU9e+95I2vLDAZJud/YAiABAKLH6+nWYqbmq0mYI6oSemKw/kSB9lz3pgVuxCrVxPBulm9F7hVqrPMI146cNzxMXDrxck6D7d3XNpWkTxToKehOd7nB4lXNOs/i/v3yssVfy7HbvxGVTD/52M/L3tYU+PUK9InmJDdCqZi4LTxzh0UhEQ4e3SrcnyqMuFiylRdw4xHsA8Cz075dPeVAVI+7mY67TG63ZoOX5t1tAjXdwhXr5JOiJhU5i0wnYw/A==
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::cb1) by MN2PR19MB4080.namprd19.prod.outlook.com
 (2603:10b6:208:1e6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 12:55:37 +0000
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e]) by IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e%7]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 12:55:37 +0000
From: Ming Wen <mwen@ambarella.com>
To: Rongrong Cao <rrcao@ambarella.com>, Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index:
 Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wAAAQ6JgAACKvLAASRQeqAAMU+ZoAAFtwHQ
Importance: low
X-Priority: 5
Date: Wed, 7 May 2025 12:55:36 +0000
Message-ID:
 <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
In-Reply-To:
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF7478C2D3A:EE_|MN2PR19MB4080:EE_
x-ms-office365-filtering-correlation-id: da8d3a09-3a33-450b-ac44-08dd8d667673
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cFBUcE96S1ViUE9DZDVPbEovcjFrbTRWaUVKdk5ZVFVhUExtOGNPWjYwVitJ?=
 =?utf-8?B?QStFWUhmYzd6b1BBMmVxTVJ4ZElhNzl6Vk90c2tmQmE1SFZiYU01OEkwSjBT?=
 =?utf-8?B?d3lMS1pSRlU1UFB4RCtvblZjWklMNzV6RDRwM3JtcDlNcno4RTNTWEk5bllO?=
 =?utf-8?B?K2NQTDExSXB5cUpGelhzdkxMazRnZkxVOVp6RGRrS3FJRVlxaWFzRXk5dlo5?=
 =?utf-8?B?TS9OaTlBb1RtTHRtVmJJTTY5OGh2TzRXSlJ5WVBVMmNrbk91RDhRZ0Z2VENV?=
 =?utf-8?B?ZmJCK2wxQVhjNUVrRHU5ODYzL1Z6R3psS3liTm5rSUtqVVcwSVNsNzZkYVRh?=
 =?utf-8?B?ODVuamVha2gwVEtjcHNyaTYwTnpDYU5VdDhKSFUzaldLdGJ3QUZ4VHYxYlhv?=
 =?utf-8?B?VmIzdGZhUEwvK0k4eWIzK2F6SHNFbDF1OEZYU3M4bWNYeG1KeGdkbWx5RE1X?=
 =?utf-8?B?bU5IR2dnTnpyQ0hDcENEb25NUDlNb0drRXZtWXMyMm5acUc2QlNIc1pSRE9D?=
 =?utf-8?B?RmlVR2ladUJ5L0d1WU1BTXlUckwrTGxnT2xlRlBsVStGMWNNdUYzSmNOa2ZE?=
 =?utf-8?B?Z3B0Nk5KZ3JpRE9GUERKdmxiZVZ6WmVtbmpCK1J3NEQzaitreW15K2ZCamV4?=
 =?utf-8?B?SVBRL3dWMFN3dUdPVGlSUzVEcWw5VEhqdmJtNmtZdTZaZkFodXJ3OW9hemln?=
 =?utf-8?B?LzdnSVhtMlM2Z0R0eHBKSFJidXRJRTZ5ZTBWNHZFVVowRitGTjRicjJzd1A2?=
 =?utf-8?B?ZkxCeHAySElPSGZMNjdqS25PWE4vRi9VQllZbE1kcVdTOVhVRzBjcUFoNUZU?=
 =?utf-8?B?bWJpb2tCZ3I5N2p3aFc2WCtQc3dEU0crWFRzSlp0V2VmaGtGSjBZUTg5QllZ?=
 =?utf-8?B?OHduaHh0SzVESFZsaEJ1ZG9GZzJqUHhTZzBERFBjZS9Jdit5b253WFV6d1NT?=
 =?utf-8?B?M2JLcGp6Y3RkTjBvOG1md3A4aXg4ZCs5L3Uxdy9hNjB6Y0FJM2tiZnVxYnYr?=
 =?utf-8?B?WWtwdHNoK2xYWkNOb1RZbjh2SXQyeVRNS1R6RW1EWTh5SXl1T1BrWHhHSHd3?=
 =?utf-8?B?QVovZWRLOGFwNGF5SlZZUkdaaGFCRkl1Y3MrMU1wOXUrMGllMnJ0QWJGbVVQ?=
 =?utf-8?B?RDBrN0tLczBQY2ZLbmxwQ0cvbmVJc2NxeWlhQVcrekJDMWVPSHpPb2t2S25w?=
 =?utf-8?B?M3JvZ041WURoSjZZS3BRSFlyMzBWVHdsNGY4djZsUDIzSE9McTJCZVdaRjR5?=
 =?utf-8?B?Z05DSlFPcWRaa0JQQVpWRjFndEVWSTArc1kvZGYxallEU2xSeGNzSUN0dEds?=
 =?utf-8?B?Qzg5ZjVMbXhtcm8yNzhkRTdsWTd4MjJ3N3VDODFSM003eGlxK2ZOUjVyOWNs?=
 =?utf-8?B?bDNsRTlIQUtIQmVKKytVdXl0VHNXaEd3Ti9qK00rSVhKamRScnRzUGhkWVdD?=
 =?utf-8?B?ZUlCMHNKeUU4bytUMWI3ODRscVNtQ3FBc3diREVuTjVRNFJSeVdPd3hsSXlT?=
 =?utf-8?B?TFREc05MVFNtN1Vxd20zaHh0a3p5UlRUVzFHWWZqbnpiZ3VnMjh4ek1LRVFW?=
 =?utf-8?B?bXo1MFg4VS9POWgrNnU0OE1BdStGRDhCSWNTZDZmVmRCUko3ZHcyR3hlOElN?=
 =?utf-8?B?Z2llamtGQlVCTnFXTUhmT04xRDd4NTcwejBJcDVuUm9WRWpzNzhIaXhnUUg3?=
 =?utf-8?B?ZllJMVJHM2VLQWtsK2VZTmprMDM2T3JSN0t4a3hyUFBoSGZ2RHgzY09HZTAy?=
 =?utf-8?B?Wmg4UVh0cmFCOTlxRVRySkw4M2tQN2RpbUlkVmZzMDB3N2w0OFFWejBwcjl6?=
 =?utf-8?B?T0lvV1krVVZqZUF0bk81NmFCLzRaNVFBb3NJcWdCazhrMVFTKytwRG50ZXI2?=
 =?utf-8?B?c2U5TGs5eWdGNDlldEpLb05jZS9XMzZ5NVFzdER0SXYyZEdKQ3daVkhVQmFM?=
 =?utf-8?Q?qJ2zbSLl1Dk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF7478C2D3A.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXRTREJHdi80eUsvSjJGd2VVYkR2eFhKbzNwSElOdmJvTmU1U081bHpBZDNC?=
 =?utf-8?B?WUlHemxmK3lMNTRuNWlpaFVSU01hVUFTbWtJWERzbzhpY0lmNTk5K2l5TGE4?=
 =?utf-8?B?eElucUJ5aFNEQUd6M05EVzYyTjIrRGdhTmUySndEcVY2S0xZL2dGRmtUbHUv?=
 =?utf-8?B?RDZiSmp2VlBObWdxQ1RlSlYwaWJ1Zjd6VDZXRnVHOWxsekV2c2w4OVVGanl5?=
 =?utf-8?B?am5ZSU5UVHd1c3cvNis5ZlRmU29VblM1TTBYbHlqWGI3TzVKQXlGbFlHYTVx?=
 =?utf-8?B?TElwTkVzRFNRV0ZnZFJXVHVTT1VBR3RPOU13WUFWSnZaRjc1SHd0SzBBa1F3?=
 =?utf-8?B?TmphbGRkbVdRTXJZcVFnOGh0TjVZUHVNYVRCTnNHeU01RkJIWEZPWDNwK0Nh?=
 =?utf-8?B?RGFvMERrdkIxR3oyYktHeGk0WXBOWEdLM0ZnWEdHYlplTGxEdEV3NFhxNVNp?=
 =?utf-8?B?ckVsTE5UVFFMQ0FMQmxxcXY1b2pmU2h5eTNSR2Z1ekVON3Zaa3F2WGJ5YXV1?=
 =?utf-8?B?YytoNnRmNlJ1KytmUnNIYThscFFDdjQzcGFTTTlzVm85eFhSeXp6R1BnNUhz?=
 =?utf-8?B?dEJjYjJscFJQQTNHeXZXcjFMWHkwK3JLRWF0MjNPQnBJTUtxNy93bEVkcEJl?=
 =?utf-8?B?bjJnanMxOUtCTEhpL2hCY1IzcVJEanlDWWVEa3Z5RkkwY3Izemxtb2s0c0I3?=
 =?utf-8?B?UkYwa0tUdy9yNjFDeFcrc1dIL3NzV21KOEQvY01TbVZXSW9tbHh6NGwrRDUv?=
 =?utf-8?B?Mkdub2tpUDBDTWlWa1phcnFDRXc3VlhCTHo5OUNUQW5HSHlkM2VsUEtnZXBD?=
 =?utf-8?B?Vi9VVWFLSHI3VG80UVZnWVRISGlsNGJGc0ZyODM1VzkrVlJLRHpxdDRrQ0V3?=
 =?utf-8?B?S25HemFmYkVtSmRsZkhCaVZiczdGMDZZdkpoTUlEejE4VUhMVDNYSnpMdVQ0?=
 =?utf-8?B?R0J1OWl5UDRKUk1HdVU5MG1KdmRtMU1oQjdSMk9HazloYWNaVVlGOHJIcm1D?=
 =?utf-8?B?TEVVOTRIWHUrY0g1aG1VVER5QzBqM2cyb0ZyekdDQVd1QlU0Vk1rQ1Bmb2VV?=
 =?utf-8?B?dTc2L1hXQ0NtVVlFL0YyVFhibDlUY3hsTHlXNlg0UC9NNjhrWE4yeGdBQkp4?=
 =?utf-8?B?d0ZYazF3V3dCbEFQMmtQdU1HanZKRHhqOGpXRnh4aVpkWUZyeGhRdm1kdlpz?=
 =?utf-8?B?M3dWbmU3QlZjNEhZQVFTUXhCZHFJbW83ZWZsRUh2c1dMVWtzK3pYeERjUW92?=
 =?utf-8?B?TmMxbVl4cmZ5U3BlTTNkVm9TcGVqZDlLTTV2QXlJTDI4QXpicndhWDB2WFFG?=
 =?utf-8?B?NFZQTWhhcFlxdE9lNFlDT1FMQ3BNSktpRjA0bmg5ZDNVZ1lJcEVhNUViM3dG?=
 =?utf-8?B?dElaQTFqdmZJODVjWW95TWlKa3UyRHozWDZ2ZGRka0l5MWxKQmpWR2hBOUs5?=
 =?utf-8?B?aUFZeEhsQWtnNnhnTTBrOFQySmdxN0JIYzhENC9rNjY3QjNySTA2Z3ZWQTBG?=
 =?utf-8?B?U1dvNTV6SmFKT1I5UjVwSUxkOXZ0N01BUG1oZkJFNC9oWGo2U21CaFVZMzVh?=
 =?utf-8?B?UDhpNDYvV0FkK24vWmwyK0RWUWZrbUFQemFReC9ZZEl1QlBnRUVVUlhNdXZK?=
 =?utf-8?B?TG5PSytIRUY4M21JRVUrNXFPUEVRZk1Cd3VRc2Z1UVBRUm1PbC9adTViVTZ3?=
 =?utf-8?B?SFNUVkNwNE9HSlBKWUQ3MG4rMEZoaDBQblNVNWN1VDY0QWhwMDgyYjNraytv?=
 =?utf-8?B?em1uTUxYeUlUTStvdkVQeVE0TXFGbVVQY08rOThRWEh4ZFA5RFIwZ1JZN2tI?=
 =?utf-8?B?SENIUmdsSWJoZGVJajlISi96TnVtNUY5d2VkMmRXK21mcXpjOXVUZzJQWHBq?=
 =?utf-8?B?Ry9xaksyUjhQQUovZnRGdmVmV0FjOEZlbThhbisxdStBYmQwUGEwbDdSRm9O?=
 =?utf-8?B?c2UwcXgyR3gxRzFaMUgzNWhJaFpjVGVkSkV5U1cwSEtYUzVrY04xUTdwN3ln?=
 =?utf-8?B?cHFKUTdsckszeE1mTnR0ZVBsYnJFSnRaOC9lR3N1QWo1RW5TSGhhYXhRb3Rw?=
 =?utf-8?B?VjQvcGNOSys5dFFwdCs5ejlyVlRzWVhWQkxkaTQrZDdpbjQxbWFyeTdzMlli?=
 =?utf-8?Q?jTmy+HWYG3y4yhp2gt28+o62n?=
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ambarella.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF7478C2D3A.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8d3a09-3a33-450b-ac44-08dd8d667673
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 12:55:36.9441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZsethqgMLaWsLPQ0uIMM7st33yRZk6IXmTd2py4MapqfAMEfC7C5yBgVd3PV3OWrD9Li8kEpMGjsUVB1M+xSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4080
X-Proofpoint-GUID: FwxcNkakKG3ZEv_JkKVKM1FI99-4o9QP
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=681b584e cx=c_pps a=eKE3A02riAhCxcKrmNn0fw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=dkMdDuzY2HgA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=ppJngBeKAAAA:8 a=07d9gI8wAAAA:8 a=w4h2sF3ZDVxdDj7fLJUA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-ORIG-GUID: FwxcNkakKG3ZEv_JkKVKM1FI99-4o9QP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDEyMiBTYWx0ZWRfX+rcrNmuMfKj4 sEL2c+osvflpefYPVl7cNuX7Wl1MsPP/Q5Wpjk2ad4K+ECU4sN0kGS186XI1M4/bHp+WH/SMAOo w8HgchoaX+WSQavcWqNJ/h1BDQjWXRk7T0bGbdlEoQeQdAfDplUJmEa1Wx6FwosjrKbIbqrxpi3
 EbVvfkx9aAreWgBahKZXrX8QaYChN+Pb8cobVzPq56JV502nAqvRWWtWh/wgH/4Dw7Ni5ccjcZd 2VQ2xHnq4vCljsTFvZEpyBsILwjN+3rQxyMYGX8BqWLFQKkjMJYs2kaJ0Wrrr9DH8b93lSK74LG gCI7wtAwrtQSCc1A9zKaJtc3deO17hn7uQAkc3aaAiux+HiQc8guq7DtQSkeHiFY3tdRtv3IkD2
 r5SWilVYQnYOD+1glBzBFvL+4cpBX0PkTdvBmSstB964vlVQAJt2qmHO47IrZ01tQ1xY4yta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505070122
Content-Type: text/plain; charset="utf-8"

SGkgUm9uZ3Jvbmc6DQrCoA0KVGhhbmtzIGZvciB0aGUgdXBkYXRlLiBHb29kIHRvIGtub3chDQpB
cyB0aGUgbmV4dCwgSm9uIG1heSBoZWxwIHRvIGNoZWNrIGEgYml0IHdoeSB0aGlzIGNoYW5nZWxp
c3QgaXMgbWlzc2VkIHRvIGJlIG1lcmdlZCBpbnRvIExUUyBLZXJuZWwgNS4xNSBhbmQgZXZlbiBM
VFMgS2VybmVsIDYuMS4gSXQgc2hvdWxkIGRlZmluaXRlbHkgYmUgbmVlZGVkLvCfmIoNCsKgDQpC
ZXN0IFJlZ2FyZHMhDQpNaW5nIFdlbiAo6Ze75piOKQ0KU0RLIFRlYW0gfCBBbWJhcmVsbGEgU2hh
bmdoYWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvbmdyb25nIENhbyA8
cnJjYW9AYW1iYXJlbGxhLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1heSA3LCAyMDI1IDY6MTIg
UE0NClRvOiBNaW5nIFdlbiA8bXdlbkBhbWJhcmVsbGEuY29tPjsgSm9uYXRoYW4gQ29yYmV0IDxj
b3JiZXRAbHduLm5ldD47IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCkNjOiBtY2hlaGFiQGtl
cm5lbC5vcmc7IExvbmcgTGkgPGxvbmdsaUBhbWJhcmVsbGEuY29tPjsgSmlhbiBUYW5nIDxqdGFu
Z0BhbWJhcmVsbGEuY29tPjsgWmhhby1ZYW5nIENoZW4gPHp5Y2hlbkBhbWJhcmVsbGEuY29tPg0K
U3ViamVjdDogUkU6IFtFWFRdIFJlOiBbS2VybmVsIDUuMTUvS2VybmxlIDYuMV0gQWJvdXQgU3Bo
aW54IERvYy4NCg0KTWluZywNClRoaXMgaXMgYSBmYWxzZSBhbGFybSwgSm9uIGFscmVhZHkgY29t
bWl0dGVkIHRoZSBjb2RlcyBpbiAyMDIxLCBidXQgdGhlIExUUyBtYWludGFpbmVyIGRpZG4ndCBt
ZXJnZSBpdCB0byBMVFMgS2VybmVsIDUuMTUuDQpBbmQgaGVyZSBpcyB0aGUgcm9vdCBjYXVzZSBh
bmQgcGF0Y2g6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC9Eb2N1bWVudGF0aW9uL2NvbmYucHk/aWQ9ZDY5ZGFi
N2RlMjA4NzQ4ZGRmNzkxNDNiMzlkOThkYjU1ZWVlOWI0YQ0KDQpCZXN0IFJlZ2FyZHMhDQpDUlIN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1pbmcgV2VuIDxtd2VuQGFtYmFy
ZWxsYS5jb20+IA0KU2VudDogVHVlc2RheSwgTWF5IDYsIDIwMjUgMTg6NDANClRvOiBKb25hdGhh
biBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZw0KQ2M6
IG1jaGVoYWJAa2VybmVsLm9yZzsgTG9uZyBMaSA8bG9uZ2xpQGFtYmFyZWxsYS5jb20+OyBKaWFu
IFRhbmcgPGp0YW5nQGFtYmFyZWxsYS5jb20+OyBaaGFvLVlhbmcgQ2hlbiA8enljaGVuQGFtYmFy
ZWxsYS5jb20+OyBSb25ncm9uZyBDYW8gPHJyY2FvQGFtYmFyZWxsYS5jb20+DQpTdWJqZWN0OiBS
RTogW0VYVF0gUmU6IFtLZXJuZWwgNS4xNS9LZXJubGUgNi4xXSBBYm91dCBTcGhpbnggRG9jLg0K
SW1wb3J0YW5jZTogTG93DQoNCkhpIEpvbjoNCsKgDQpBbnkgdXBkYXRlPyBEaWQgeW91IGhhdmUg
YSBjaGFuY2UgdG8gY2hlY2sgYW5kIGNvbW1lbnQgb24gYmVsb3c/DQrCoA0KQmVzdCBSZWdhcmRz
IQ0KTWluZyBXZW4gKOmXu+aYjikNClNESyBUZWFtIHwgQW1iYXJlbGxhIFNoYW5naGFpDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNaW5nIFdlbiANClNlbnQ6IFdlZG5lc2Rh
eSwgQXByaWwgMzAsIDIwMjUgMTE6MTYgUE0NClRvOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBs
d24ubmV0PjsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZw0KQ2M6IG1jaGVoYWJAa2VybmVsLm9y
ZzsgTG9uZyBMaSA8bG9uZ2xpQGFtYmFyZWxsYS5jb20+OyBKaWFuIFRhbmcgPGp0YW5nQGFtYmFy
ZWxsYS5jb20+OyBaaGFvLVlhbmcgQ2hlbiA8enljaGVuQGFtYmFyZWxsYS5jb20+OyBSb25ncm9u
ZyBDYW8gPHJyY2FvQGFtYmFyZWxsYS5jb20+DQpTdWJqZWN0OiBSRTogW0VYVF0gUmU6IFtLZXJu
ZWwgNS4xNS9LZXJubGUgNi4xXSBBYm91dCBTcGhpbnggRG9jLg0KSW1wb3J0YW5jZTogTG93DQoN
CkhpIEpvbjoNCsKgDQpQZXJmZWN0ISBUaGFua3MgZm9yIHRoZSBxdWljayB0cnlpbmcuDQoNCldo
ZW4geW91IGJ1aWx0IGZvciA2LjEzNCB1c2luZyBTcGhpbnggNy4zLjcsIGRpZCB5b3UgaGF2ZSBh
IGNoYW5jZSB0byBjaGVjayB0aGUgb3V0cHV0IG9mIFNwaGlueCBkb2M/IEhvdyBhYm91dCB0aGUg
d2ViIEdVST8gRG9lcyBpdCBsb29rIHdlbGwgd2l0aCB0aGUgZXhwZWN0ZWQgZGVjb3JhdGlvbj8N
CkF0IG91ciBzaWRlLCB3ZSBjYW4gYnVpbGQgdGhlIFNwaGlueCBkb2Mgc3VjY2Vzc2Z1bGx5KGFs
dGhvdWdoIGFsc28gd2l0aCBhIGxvdCBvZiB3YXJuaW5nIGxpa2UgeW91IHNhdykgaWYgdXNpbmcg
U3BoaW54IDguMS4zLiBCdXQgd2hlbiBsb29raW5nIGF0IHRoZSB3ZWIgR1VJLCBpdCBpcyBub3Qg
cmlnaHQuIFRoZSBkZWNvcmF0aW9uIGlzIG1pc3NpbmcgYW5kIHRoZSB3ZWIgbGluayBsYXlvdXQg
aXMgYWxzbyBub3QgZ29vZC4NCiQgbGludXgtNS4xNS9Eb2N1bWVudGF0aW9uL291dHB1dC9pbmRl
eC5odG1sIA0KDQpJZiB3ZSBzd2l0Y2ggYmFjayB0byBTcGhpbnggMi40LjQgZm9sbG93aW5nIGJl
bG93IG1ldGhvZCB3aXRoIGV4dHJhIGRlcGVuZGVuY2llcyBhZGRlZCBpbiByZXF1aXJlbWVudHMu
dHh0LCB3ZSBjYW4gZ2V0IHRoZSBwZXJmZWN0IHdlYiBHVUkgZGVjb3JhdGlvbiBhbmQgbGF5b3V0
Lg0KDQokIC91c3IvYmluL3B5dGhvbjMgLW0gdmVudiBzcGhpbnhfMi40LjQNCiQgLiBzcGhpbnhf
Mi40LjQvYmluL2FjdGl2YXRlDQokIHBpcCBpbnN0YWxsIC1yIC4vRG9jdW1lbnRhdGlvbi9zcGhp
bngvcmVxdWlyZW1lbnRzLnR4dA0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzUwMDQ1
YWZmLTkxZjktNDgwOS1iYTNlLWI3MjJiMzI1ZDIzM0BvcmFjbGUuY29tL1QvDQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjI2MDkzODU0LjQ3ODMwLTEtbHVrYXMuYnVsd2FobkBn
bWFpbC5jb20vVC8NCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc3BoaW54L3JlcXVpcmVt
ZW50cy50eHQgYi9Eb2N1bWVudGF0aW9uL3NwaGlueC9yZXF1aXJlbWVudHMudHh0DQppbmRleCAy
YzU3MzU0MWFiNzEyLi42ZTdlZDY0MTc0N2Y3IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9z
cGhpbngvcmVxdWlyZW1lbnRzLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWly
ZW1lbnRzLnR4dA0KQEAgLTEsNCArMSwxMCBAQA0KIyBqaW5qYTI+PTMuMSBpcyBub3QgY29tcGF0
aWJsZSB3aXRoIFNwaGlueDw0LjANCmppbmphMjwzLjENCnNwaGlueF9ydGRfdGhlbWUNCithbGFi
YXN0ZXI8MC43LjE0DQorc3BoaW54Y29udHJpYi1hcHBsZWhlbHA9PTEuMC40DQorc3BoaW54Y29u
dHJpYi1kZXZoZWxwPT0xLjAuMg0KK3NwaGlueGNvbnRyaWItaHRtbGhlbHA9PTIuMC4xDQorc3Bo
aW54Y29udHJpYi1xdGhlbHA9PTEuMC4zDQorc3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWw9
PTEuMS41DQpTcGhpbng9PTIuNC40DQrCoA0KQmVzdCBSZWdhcmRzIQ0KTWluZyBXZW4gKOmXu+aY
jikNClNESyBUZWFtIHwgQW1iYXJlbGxhIFNoYW5naGFpDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+IA0KU2VudDog
V2VkbmVzZGF5LCBBcHJpbCAzMCwgMjAyNSAxMDowNiBQTQ0KVG86IE1pbmcgV2VuIDxtd2VuQGFt
YmFyZWxsYS5jb20+OyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnDQpDYzogbWNoZWhhYkBrZXJu
ZWwub3JnOyBMb25nIExpIDxsb25nbGlAYW1iYXJlbGxhLmNvbT47IEppYW4gVGFuZyA8anRhbmdA
YW1iYXJlbGxhLmNvbT47IFpoYW8tWWFuZyBDaGVuIDx6eWNoZW5AYW1iYXJlbGxhLmNvbT47IFJv
bmdyb25nIENhbyA8cnJjYW9AYW1iYXJlbGxhLmNvbT4NClN1YmplY3Q6IFJFOiBbRVhUXSBSZTog
W0tlcm5lbCA1LjE1L0tlcm5sZSA2LjFdIEFib3V0IFNwaGlueCBEb2MuDQoNCk1pbmcgV2VuIDxt
d2VuQGFtYmFyZWxsYS5jb20+IHdyaXRlczoNCg0KPj4gSXQgaXMgcmVxdWlyZWQgdG8gZ28gd2l0
aCBTcGhpbnggMi40LjQsIHdoaWNoIGlzIG11Y2ggbG93ZXIgdGhhbiB0aGUNCj4+IHZlcnNpb24o
OC4xLjMpIG9mIHVidW50dSAyMi4wNCBhbmQgMjQuMDQuDQo+IFtNaW5nXSBUbyBidWlsZCB0aGUg
c3BoaW54IGRvYyBmb3IgS2VybmVsIDUuMTUgb3IgNi4xLCBpdCBpcyByZXF1aXJlZCB0byBnbyB3
aXRoIFNwaGlueCAyLjQuNC4NCg0KV2UgcmVjb21tZW5kZWQgdGhhdCB2ZXJzaW9uIGJhY2sgdGhl
biwgbW9zdGx5IGJlY2F1c2UgdGhlIG5ld2VyIHZlcnNpb25zIHdlcmUgc2xvd2VyLCBidXQgaXQg
aXMgYWJzb2x1dGVseSBub3QgcmVxdWlyZWQuDQoNCkkganVzdCBkaWQgdGhlIGJ1aWxkIGZvciA2
LjEzNCB1c2luZyBTcGhpbnggNy4zLjcuICBJdCBlbWl0cyBhIGJ1bmNoIG9mIGRlcHJlY2F0aW9u
IHdhcm5pbmdzLCBidXQgb3RoZXJ3aXNlIHdvcmtzLg0KDQpUaGVyZSBhcmUgdmFyaW91cyBmaXhl
cyBpbiBtYWlubGluZSBmb3Igc29tZSBvZiB0aG9zZSB3YXJuaW5nczsgc29tZWJvZHkgY291bGQg
Y2VydGFpbmx5IHBpY2sgdGhlbSBvdXQgYW5kIGFzayBmb3Igc3RhYmxlIGJhY2twb3J0cy4gIEkg
Y2FuIHB1dCB0aGF0IG9udG8gbXkgbGlzdCBvZiB0aGluZ3MgdG8gZG8sIGJ1dCB3b24ndCBnZXQg
dGhlcmUgaW4gdGhlIG5leHQgZmV3IGRheXMuDQoNClRoYW5rcywNCg0Kam9uDQoKKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgpUaGlzIGVtYWlsIGFuZCBhdHRhY2htZW50cyBjb250YWluIEFtYmFyZWxsYSBQcm9wcmll
dGFyeSBhbmQvb3IgQ29uZmlkZW50aWFsIEluZm9ybWF0aW9uIGFuZCBpcyBpbnRlbmRlZCBzb2xl
bHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwocykgdG8gd2hvbSBpdCBpcyBhZGRyZXNz
ZWQuIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGRpc2Nsb3N1cmUsIGRpc3RyaWJ1dGUs
IGNvcHksIG9yIHByaW50IGlzIHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBieSByZXBseSBlbWFpbCBhbmQg
ZGVzdHJveSBhbGwgY29waWVzIG9mIHRoZSBvcmlnaW5hbCBtZXNzYWdlLiBUaGFuayB5b3UuCg==
