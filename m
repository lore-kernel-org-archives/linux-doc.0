Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9F28373
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649216; cv=fail; b=MbFlZbyIa4Emeo9YZak10LwrViWInxCtdV1D9kFvQVNb/mO0fgwthrxgRnDwcmV8ukjElKRmYVcBE7Xv0D8Bp9viFbkxCOa0pYbDDOfL8FOmAFzhxUlAgsFna+cNhcOgFGGr8b9IAPCC3VDqmXlIn4/vjk210qB+QQOZwbgGslA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649216; c=relaxed/simple;
	bh=M5O6sBXSlP1KejJriflj0sgdxB3R5yFU1OIDdd5yNqw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=WKZ7o6uz39iaNmI7/yoBZjD55gdQOR4LHEADAAVGfSgIjV9MsmJoJ3pXhrzqawvkJcS2R4IYtZXSXN30D5L4NA9FTpZ6T+M6fwv0mjcIUevCoENevRMoEuWqxOdkDVTLGxX2C/i4Bfsai9AUkhk2mWOYcuc624jZn3ZFe3bsyiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=LTz/Dry9; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=T2yxY/8x reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="LTz/Dry9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="T2yxY/8x"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547K9sAe011925;
	Wed, 7 May 2025 13:19:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=M5O6sBXSlP1KejJriflj0sgdxB3R5yFU1OIDdd5yNqw=; b=
	LTz/Dry9PRREEu10O/4kzza9QKppFt2HFtFkcEyBT0g8g2bIDArfuJilaVl3AmR0
	aAczBTxigtSepmK7dXUSg0hf6GXnXrOh19oXyUJaWD0vS4afC/sE8I9gkMYKdtpw
	MzNseCN5QBupLXBOg6T8uDw7AuqdAhIw4k84X83qpJ+KlbxDT8hbO5maEVSfZO4G
	wYCBwH7HshyiR2duPh09jNovFvQdoDq2QFL+kC9NiXbFukeRIWQ7TssHr+gEUVQj
	wtzNXjNjCfzbXpyux7Gf0ONIWTXXrlEVe1G5qcDNu7OYkbCo3dM3sVETtv5f94w2
	Ik4mBqwDShj8HGOQTibaCA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46dg4ejnm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 13:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncs4q1HtfTCY+PnHOOTU6/oFraIqHBbVrAiyFb3CoR+ybKGmAuUPJQh430w6LsL7P+BYaZzk15noaMdwlYO5AuFJyOtIXQshSXuWCB/XyJsdIe6SOrOWzDlJ+mbu5++z/80pDkW6/r7PMp+tUFcfXbkBF3q+bIp+iGeigR6r7GXY/hggTO7D85s1SrTTJfr2AxpufcW2q1oejmv4aBqUW37MIBKnTFpgMVAzO0kDrCw5LBvaZouhssB6iXVtnQHYJ3IALbrST2ejxYc7g4cHP8/frLsJTx8RSIR+Uv1CUg0X7CZPIwCccrwECWGRet69I7wYFTdclfttgS+S2jRekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ApTzvbpLm2SSMhWhAwWBb3T4s95Pz9/XU1HJQVESDI=;
 b=kEe0yH4qi0aIQwvi/iYw7LqSM27dA1wpTJ9XrqihvsD3NWazCEqAlOtAfalXhyjm5ySTEKujhTdcjPtOZDgIuuW1xLOwZH3OOAfhj2IvX8iKkVopSwRyaX8Rnh8p4X2yzVaFm9mdQnWgh6NDYkClhsu62Jsf2RmDTFp3h4nauJNQS0i9HZIZJubSBK4AH8y9n6P0jrfPVhGxVeotkQv8WHB5NPsChtJw/ZJ6DAV0Al9JCG3h1hZ4WBPz9oQev/wCo8v2KcseertquqAam3Miz0OjlHuGLzDIJIZwhuFvAi6yvtLZQ0erzCQkdR38iXsbRp3u1LvM2gl4qskJ0CLrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ApTzvbpLm2SSMhWhAwWBb3T4s95Pz9/XU1HJQVESDI=;
 b=T2yxY/8xr8I6ZxGLRtMWbPNE76SdrwikFnH9SaeJJlCL9o1LqEli3DuH4oA6jU2/hcHorcLpqxv3C6KVtpgRwZ3jOR6ORqrvs42Jy3TPp34O4Bo/nfHFTVzHzwnOT/WJ29SCgR6hfmWWiN5tOJKrIjqUfLjzv1L7WeDAs1YujCciBWUidb8u9aXQiAHZwuS5PjYcIUUaZfb8vptRssyDOnrRYm+WHT7+L4CfAhMLV1wmzzKF1GDKeoi1fn99yz4k8t49IaS/MgYMnUP++jNZ7ero4J30EC7bSD4qE8jGzeFg1MCqPg2gKVyjP9kAzHPTit8jCwMfz/MWOachl+AtGA==
Received: from CH2PR19MB4732.namprd19.prod.outlook.com (2603:10b6:610:65::12)
 by MN2PR19MB4077.namprd19.prod.outlook.com (2603:10b6:208:1e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 20:19:50 +0000
Received: from CH2PR19MB4732.namprd19.prod.outlook.com
 ([fe80::d38d:e458:db28:6882]) by CH2PR19MB4732.namprd19.prod.outlook.com
 ([fe80::d38d:e458:db28:6882%4]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:19:50 +0000
From: Rongrong Cao <rrcao@ambarella.com>
To: Jonathan Corbet <corbet@lwn.net>, Ming Wen <mwen@ambarella.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index:
 Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wAAAQ6JgAACKvLAASRQeqAAMU+ZoAAFtwHQAA8FsYAAAF3zIA==
Date: Wed, 7 May 2025 20:19:50 +0000
Message-ID:
 <CH2PR19MB473285B0B57F2A287434011EA188A@CH2PR19MB4732.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87v7qctcha.fsf@trenco.lwn.net>
In-Reply-To: <87v7qctcha.fsf@trenco.lwn.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR19MB4732:EE_|MN2PR19MB4077:EE_
x-ms-office365-filtering-correlation-id: 09278cfb-4aac-4dfd-619f-08dd8da4855e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Slg4cGVVUDQ0dGFmYlY2OFBVZmtZemwrTEZBbk9sYk5jWmRrWm1LMlZPSmEr?=
 =?utf-8?B?VWwvSlp1SS9SMW1VVHRwZkdyU3htcDZuTnViUnArdmVmaXhLWFAxZ09vVnFn?=
 =?utf-8?B?K3RqRG9iazFDS1luOWtPTWhHQmtGTzUwZ2tCS1lyL0NmcnFEclZsMWZNbWZ3?=
 =?utf-8?B?MFBkd1NHNGlobHBBaGhGbmJKeEoxQUNydnFzSkJwSGJCRzBMM09kQjFtOFJR?=
 =?utf-8?B?a2dBc0J6U0tBTVR1ZFlLY2N2d2RaZ0JhdURFS0pnNHAzUzBSOW5kMndUZ1o2?=
 =?utf-8?B?MUFTYlAydXhOU0lKVVBNVjA1TTlWQ25HR3czaFNzK3pHTWFKM0hTQ1ZMaSs2?=
 =?utf-8?B?RmZpK1g0NGovODVHdnYzUHp1LzVNdnFjNFlFbHlJRkIvUTcwOWVGM2g5U2lH?=
 =?utf-8?B?aElYVjdGNXEvSXJNT0FBUVRxeHp6YmpxME9YdkNDYmZIcVBTL1V6b0UwQ3Bx?=
 =?utf-8?B?QmVXVWVNTG0vZCtSK095Qkt2ZU1JYXNKdnozN0pvMzkxSm9NUWpKbit3Wk45?=
 =?utf-8?B?a2J1NGlxNkxoYlQwOGFwQlpQMXhmY3FOTEM3bzZzdHJqdFRqTmlNWUFuT3lV?=
 =?utf-8?B?QmRaYjZXVng0OEg0amZ4aFhMWlI4aXg5TG1PSTArU2srYjJ3eHVaSVp3dFlM?=
 =?utf-8?B?WGNTKzZDTUR0NVVOclNZVUNjSmd6NDFFWStpZ09JbDBtYmRscm1NaUVnT0JC?=
 =?utf-8?B?Tlo3S0l5R3N2bmtVc3FCOGlFd3hvMkNFOG41dnQrbHd1T1lZRFh6M2lsK0hr?=
 =?utf-8?B?N3cyYVJlYWh2SkJtenpScnZQWUpZQldQZldIaVQ5dFk2cis4SHBjNGs5eVRF?=
 =?utf-8?B?bXZ2ekJ1WmtWNDc5emZWU2Q0UXZ1WHdsd3c5b21mRUhycFZzWnl5bzJPQStO?=
 =?utf-8?B?bjhhL1p0ZUNrTGNKeFVhdVJaVVFISFRVbFFyYWVPdnhkZytRcE1CanRRdjMr?=
 =?utf-8?B?UlEyZzU3V054TGxZL2hkYWtRbS9aeHR1RlVsLzBqb0ZUZ2ZsQ3BzMmN4Z0or?=
 =?utf-8?B?MzBnSVBXVlhVUkdMMWtETmlOV2xzYnJ6blRyazcxbC9XdVNPbHpjSC9xcnZx?=
 =?utf-8?B?dlFlRUwyK3JnMm5WN0p2ejdPUmc4VlhoeVBxVFd5cnRDY1FRM0kvMzNBZFlx?=
 =?utf-8?B?ZU16WkUySWw1eDhxUlMycU5ORjJ1Q0tQcEFqOUtRMlNNTmYyZnA4NStHWmtn?=
 =?utf-8?B?RHhXMktJOTN5U2k5S0ZNQTRlMU16N25jRHhKQU9YTGg3cjdKZ0szbVlzNnNx?=
 =?utf-8?B?RmhIb0RadVp6alRma3oraHlhanZnV2VaSnNYenI3bitHL0NkRW1RcWxwN0dG?=
 =?utf-8?B?WEo3bENtRC9tNC8zSGJzMFJvYmY3T1lJQW1rMFZ4RU5xUjJaci9reDI4VEIr?=
 =?utf-8?B?RW1neU9OTENBUHVWOWxuWU9TUFgxenhFakUyUGlpRXJVcksxbWFhRmZvRnhP?=
 =?utf-8?B?RjFYUXcvMktod0JveU03TjM3SVdWN2NuNXZzTkQ2dFJSaktyMjMwQ3dQeFM2?=
 =?utf-8?B?UWZHK2xvL2IrcENNOTNzb0U1V0FWU0RnNG5SalAwZDRMTHJQL0FveWNscVlB?=
 =?utf-8?B?cVdVN0NNeU1mMnRhLy9qQmE1WmFDY1VFcTZXTGdkUHNIVElyOCtOK2VXVUlJ?=
 =?utf-8?B?MmtRcXBZbGhjWjUrYzAzVmdWYVVQdlJndFlCYUJ0eDNRWXZ3U2sxMlBoT1Ir?=
 =?utf-8?B?dGRnbHVzSEl3Q0w3ckd6bjBRWVpnSVltT2VGbk90anhRUWI4UjhuTXZlU3gw?=
 =?utf-8?B?RElNemFjV2wxdXo4cVZqZ3g3OFk3NjBVMEVMWGJxd1NzanFlblZMc2JDNk50?=
 =?utf-8?B?Z0pucWVpSHIwSTZVQ0RkZThVWUMvLzgybUhGUWF0dTdqWkRXbDlhOUVEMmhR?=
 =?utf-8?B?VUhxd1dvRStwSWM5V1dvSkxFQnFxNzV4OTlrYU9CTHpDZ3NPWldDS3Y5SjFS?=
 =?utf-8?B?bWg3c3gvT1Z0OVRvTzFNUStCMFViaU9KK3BJMWk3VmpBNFQ1WUtGSXNRZk5I?=
 =?utf-8?Q?O4xlKwZ8x33aTrGOQ3j9cn+Ybnw2no=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR19MB4732.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YkpZMjg2eFhDSU0yemxzMlVpTFYzYnp1OXYxcUhjeENxaUx6WEc1Tms0bW5Q?=
 =?utf-8?B?b0tuc1dKcXhjeFhmL3Frdi9za3g5eXNvdG5QaEVwUXFRQXNxZzNuT0puT3lo?=
 =?utf-8?B?d1R6V0VCcXlPYmVwbkhlY0d2WVFkdytRVjBudjRyRHYrZWh5Z2s1S0xHMURZ?=
 =?utf-8?B?MEZFbTVieUMybjhyVEhLc1pXOHlmSDZsUGFaYkM4cnQ5S0lLdVhPd0JRSUF0?=
 =?utf-8?B?YlNnY2IvZHdzZG0rQkR1TS85eEJlYVg4L2Nrak1ldmdDNUIxcEF3RTNEQUUw?=
 =?utf-8?B?VUYvMVF3NHJUdG1iZ25XNitSanR0VjgyVlMyeVRTVk1PZ054VEJXck14VUtv?=
 =?utf-8?B?VEVpeWkyUS9ETmRaOThtUWM4dVJnNS90UG9vQmpIWjNtNjRYVGlmMGprOFov?=
 =?utf-8?B?RVhCQW9JUVE0RVc4RXJtNnBydXgvWjZGTnoybmExaWFGSDR3YkVHR1F1Qm82?=
 =?utf-8?B?V1I1bVNvdWg5Y0d4Qyt5KzNSbEwrOFIzZDBWS2VvNFhCeEF6MlllSUFNN2Nv?=
 =?utf-8?B?UDlLS21XQWg2WU9MRTEzK1laeU1RNlkxRVZkRHdKczZQbnkyUXFSSWIzVnRt?=
 =?utf-8?B?RG45bDNnbExLYWYremg2WGd1QXVlRWFVa3dTSG9Sakg2YWNBNThoZkZ3emFy?=
 =?utf-8?B?ZFdpQmRjL0hjKzZ2NVRXRGpRUXFXM3VlNmVvM00xbHJHSC9NOWluc0p6TWxY?=
 =?utf-8?B?SDEwZmtJWnB6RFFaWFRxeFFta2R2d1libXNjUC9BaUdtWHRVbURQcWtvd0Uw?=
 =?utf-8?B?dDJhR243UE5GTWNEdmFNNys4MHNHZHRWakJWVjhpd2gzc0NLdmY4b0lpSllX?=
 =?utf-8?B?clBhbGY0NFc5UHNZdDBjZStkSGh1MkFOcVArQjQzOThCeUVpeWQ4a0hvK1Mx?=
 =?utf-8?B?N005aWc1dGNuakQ2Qm5qYnJZNnV1VkZTSWhjcmVJM1RYUDNoeDZuS1NtMXJM?=
 =?utf-8?B?TXFlU3U0T0MvZG0xZnM4c3B2SjRtMm5hdlo2L1ByNCs5Y3lhYUExcGl4TUlJ?=
 =?utf-8?B?YnpqYzROUGZUNC9WUzBJYTR1SWVBTTVrdzdscDZ4RU5ydUVoVC9wbUtBN1BI?=
 =?utf-8?B?NnhVUEZiRHo3SzRORytjS284RXg5M0NES2Z6ZnJOWWUvMHVxNEFrOS9zTzFj?=
 =?utf-8?B?ek4zV3FRQUZxNHFNYUhEUzBMVTRIek9jL1VvNzFpcWJGVmFMOU9QSkN3Y1Bk?=
 =?utf-8?B?RnlZVU4zc2JvWFZ3Qm9ZTDdGbk9NT2loaWRjOG9FbjVBRFR5WUROaWNkS3py?=
 =?utf-8?B?MXZZdHNHRmxheXhaUG9BV0c0ZXFZdnFqbll3SzlSMnBPNFI2a3d4U1kvbnlm?=
 =?utf-8?B?VkZkM0lsK1JLSEJLNkc3eW40NHFVWllsY24vdzZ3blVRU1pnbGEySnFkL1NB?=
 =?utf-8?B?U3ZrSVhUOTR2Wk05bGhwRmFZTWxCZWh6R250SzVqelpFcXFsdDVXOUpJeTFD?=
 =?utf-8?B?UDJyTkk0UlBHcXYyYk0zRkg4TXEvSzN6eWR6T0hPUHF2SWpvclVYcGR0WnN4?=
 =?utf-8?B?aHpCeGJYOGt0RDZCS1o0UHBUU05rT2VrQTk3Q3A3c0RSb0FoNlVYSll6c2RE?=
 =?utf-8?B?dGhTQW5wcm5TUi9UZUlFMmFmRGlreE1Lc3dmdk9RT1RrWDRCbEhIN0tLM0tw?=
 =?utf-8?B?b1YrNm1KL1Fic2dndVZEbHRETzVwNVpDUU85dVNSMXFyUjRZUlBVeVZUU0M4?=
 =?utf-8?B?R25oeVJudHNSeFpNeEE2Y3R0UlE4SWJiWlB3QVBTdCtYblFnandMeGd4Ums2?=
 =?utf-8?B?c1F6aytlWTIrY3B5bW5pQU9EOSs4WW5EbXcyMVY4SU1LSWYzVGE4MDUyMkNG?=
 =?utf-8?B?ZVdyREVxRWg1ckZneHF5eU4vcEU1Zm1tc2NSMzlYdlE3QW5PcXJNRXhDVGcx?=
 =?utf-8?B?U2s0Z0JXU3c1aWp1d21iSzBEbnJzTVBTWHorUmpoSWtjRkZhRzF3MzBSdDNi?=
 =?utf-8?B?SzNOeHBEUUhzYS9reVk3Wk03dElJR0tVb3RiQVJqcnZuaU9Da1AvY1hvSnhO?=
 =?utf-8?B?R1pyQW1FTlJabkVLR2hjODcrNEVaZExRem1PNEZTN0hZa1hKWlJCZ2JiV1E0?=
 =?utf-8?B?TVNJL0FrRDlvU0xSMDR2SDBGcG1JUHRLdy9aVHFxakxyK3lYM3dieUVqOWow?=
 =?utf-8?B?bjFkSEUzejhXMVRGNnJ5cmk5cXVKdXVsRFlHMDVBYmFmZ040RlhmVk5uQ0VB?=
 =?utf-8?Q?AkX2Q+WqXzHiVzaj1FIv2UA=3D?=
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ambarella.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR19MB4732.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09278cfb-4aac-4dfd-619f-08dd8da4855e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:19:50.8157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNp34NcH1OZomcimP11h9XnPD8IRH4lRvLYmsdI26PdXoh3U1JCIltfi9e2tJ/oTl2CO8PigjjeRlYotHqGFDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4077
X-Authority-Analysis: v=2.4 cv=SsWQ6OO0 c=1 sm=1 tr=0 ts=681bc06f cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=dkMdDuzY2HgA:10 a=07d9gI8wAAAA:8 a=ppJngBeKAAAA:8 a=VwQbUJbxAAAA:8 a=9DlbS4gFnpfa1lrHZ1wA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: cuxVFdPS_Nlcv9RGy7vnQhmgYAJkvqex
X-Proofpoint-ORIG-GUID: cuxVFdPS_Nlcv9RGy7vnQhmgYAJkvqex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE4NSBTYWx0ZWRfX4gm4mYZaLP6l OYiJB8XOZ1YdDdG/dtu3RlnDO2pCgCGIyjx0qMUowky0M6JKlJ/xBZIQiLDTTjbreLV2grGQzI4 0RntIXrj8WwlwNa6Wfn3qPBWFTXREX5P52b34qV5Tm7gqw0ITBie0jWzbnp6rcyRt9w7oS4ApPh
 FjR2f+wwIpTwz4KqCKvzFngBq1I3AFTo5eRzXVksR0aDdtlJXneWD76PlPEsr8DO0DauRzHE9bm 82LJfd5UmQVmdM6Xii+gWhH/ibicfPQ5DKHPXHvgT4MefZ77VvBdJihX+ExRiPkYMyx7LtFrLap lvXXll8hEugWo2Vc9tdGXYfL2PAljNyRODQ+Oaxh6UeGqFziYr0I6M7esoDm/waCptMUH8xBgRf
 Rez5RJL4RaBpxGlRru1M2hLaaUZmS2QvUrN7I6HaUI0O9CpKUUeC8w2iHgdRvcK6/94T3CS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_06,2025-05-07_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=549 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2504070000 definitions=main-2505070185
Content-Type: text/plain; charset="utf-8"

TGludXMgc2FpZCwgJ1Nob3cgbWUgdGhlIGNvZGUuJyBUaGUgYWN0dWFsIG1lYW5pbmcgaXMgdGhh
dCBlbmdpbmVlcnMgd2lsbCB0cmFjayB0aGUgaXNzdWUgZnJvbSB0aGUgc291cmNlIGNvZGUgcmF0
aGVyIHRoYW4gZnJvbSB0aGUgZG9jdW1lbnRhdGlvbiwgYW5kIHRoYXQncyB0aGUgcmVhc29uIHdo
eSBub2JvZHkgY29tcGxhaW5zIGFib3V0IHRoZSBkb2N1bWVudGF0aW9uIGlzc3VlLg0KDQpUaGFu
a3MhDQpCZXN0IFJlZ2FyZHMhDQpDUlINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+IA0KU2VudDogMjAyNeW5tDXmnIg4
5pelIDQ6MDMNClRvOiBNaW5nIFdlbiA8bXdlbkBhbWJhcmVsbGEuY29tPjsgUm9uZ3JvbmcgQ2Fv
IDxycmNhb0BhbWJhcmVsbGEuY29tPjsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZw0KQ2M6IG1j
aGVoYWJAa2VybmVsLm9yZzsgTG9uZyBMaSA8bG9uZ2xpQGFtYmFyZWxsYS5jb20+OyBKaWFuIFRh
bmcgPGp0YW5nQGFtYmFyZWxsYS5jb20+OyBaaGFvLVlhbmcgQ2hlbiA8enljaGVuQGFtYmFyZWxs
YS5jb20+DQpTdWJqZWN0OiBSRTogW0VYVF0gUmU6IFtLZXJuZWwgNS4xNS9LZXJubGUgNi4xXSBB
Ym91dCBTcGhpbnggRG9jLg0KDQpNaW5nIFdlbiA8bXdlbkBhbWJhcmVsbGEuY29tPiB3cml0ZXM6
DQoNCj4gSGkgUm9uZ3Jvbmc6DQo+IMKgDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4gR29vZCB0
byBrbm93IQ0KPiBBcyB0aGUgbmV4dCwgSm9uIG1heSBoZWxwIHRvIGNoZWNrIGEgYml0IHdoeSB0
aGlzIGNoYW5nZWxpc3QgaXMgbWlzc2VkIA0KPiB0byBiZSBtZXJnZWQgaW50byBMVFMgS2VybmVs
IDUuMTUgYW5kIGV2ZW4gTFRTIEtlcm5lbCA2LjEuIEl0IHNob3VsZCANCj4gZGVmaW5pdGVseSBi
ZSBuZWVkZWQu8J+Yig0KDQpUaGUgc3RhYmxlIG1haW50YWluZXJzIG5lZWQgdG8gYmUgdG9sZCB0
byBhcHBseSBhIHBhdGNoIGxpa2UgdGhpcywgYW5kIG5vYm9keSBkaWQgdGhhdC4gIEkgd2lsbCB0
cnkgdG8gaGF2ZSBhIGxvb2sgaW4gdGhlIG5lYXIgZnV0dXJlIHRvIGRlY2lkZSB3aGV0aGVyIHRo
YXQgc2hvdWxkIGJlIGRvbmUgaW4gdGhpcyBjYXNlLi4uc29ycnksIEknbSBvbiB0aGUgcm9hZCwg
YW5kIGhhdmUgYSBmZXcgYmFsbHMgdG8ganVnZ2xlIGF0IHRoZSBtb21lbnQuDQoNCmpvbg0KCioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioKVGhpcyBlbWFpbCBhbmQgYXR0YWNobWVudHMgY29udGFpbiBBbWJhcmVsbGEg
UHJvcHJpZXRhcnkgYW5kL29yIENvbmZpZGVudGlhbCBJbmZvcm1hdGlvbiBhbmQgaXMgaW50ZW5k
ZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsKHMpIHRvIHdob20gaXQgaXMg
YWRkcmVzc2VkLiBBbnkgdW5hdXRob3JpemVkIHJldmlldywgdXNlLCBkaXNjbG9zdXJlLCBkaXN0
cmlidXRlLCBjb3B5LCBvciBwcmludCBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYnkgcmVwbHkgZW1h
aWwgYW5kIGRlc3Ryb3kgYWxsIGNvcGllcyBvZiB0aGUgb3JpZ2luYWwgbWVzc2FnZS4gVGhhbmsg
eW91Lgo=
