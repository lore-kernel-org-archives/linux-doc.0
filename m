Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0054A143748
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749098598; cv=fail; b=px/DIue42pA2DOY3j8Z0BUY5cGkOaxLyv8enNRIuRDHsN15+Use4T+PtFv1JQubA0yOTpd+WHEIN5MnJGfmqj+4bYHsq8yTqRyaxmUnhc6B7w4IxsFMjcBehRsV3abMit4D7o/ZMCkGDsvW5X/M9IWKWXqoXsIf6U1OUOtzljIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749098598; c=relaxed/simple;
	bh=oIHRKUSgjksyPYgIoX4l4pVtiUGdMvq+7PKPDdDz9PU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=gFXQZI3MJcjFJFQRPxGPRzyEKaGwQkus7qMHl8ynIj652Fy0vm7kWOeekMtim79hLX9LaSDwyXarQBwTLfzkXaqjpryMblE7iuusb+QuEMMmJq4AwIf3RglnAj8KbXZRVoFX3n/Na3iEJX4viOZhM1DYsXXebeQhjaJEziHGhfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=cP/uDTzS; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=S2pznBMp reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="cP/uDTzS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="S2pznBMp"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5551K3uA001067;
	Wed, 4 Jun 2025 21:14:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=oIHRKUSgjksyPYgIoX4l4pVtiUGdMvq+7PKPDdDz9PU=; b=
	cP/uDTzSQBK0dwA75cMVWn9ESN922DMOxcgUk5kxsGvIX3xOi/ZOvMpw1QyJUT76
	4RogtYQU6U5DpWbHe860JfoXA5E4Bb7JhZ6U7IQ5BZbA8EENjHTv5srBF0g8xmrC
	rL04pg0CWeW4StFP+vS4vtbkB16cUKnIn8KEJnxT1t7s+52k8FhBywXjSB5dAfvH
	Vd21qHxmW+MeStyQ5bjx/Np1VKeuCSyqLbUfj5/eVXAJw4fhhbpKJR6JTk2aiQNX
	HtjcPRtZqVJC0zhvrxVXXcvT2ypqD6H1P4bI24uXtBprtp6N/hqZ75veHNVpFp8f
	t47UV7qHtyHNm/4gY9FHSA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2095.outbound.protection.outlook.com [40.107.94.95])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 471g9phv4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 21:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0UqRSy4ZpiQkVn3QGyv5Qqo1x3+HgacxK7Fhof4yCGvgXaTbQVn5melmraXyuymCWLYhZ2HQm/5gSDADEVKoe3stCq33jNM+c5CjWe5GSErgwy5/ixk8N6TMrbMS7qrKL081bKkBmRXdFYdOL9alBRPq0FxvNletRS3GkGPL9lgiwRxBLMw9n4xMWVx4KleCylath5bS0I/0WNnvIZ4hGbUsTrQk9jL9f5hfQ9iRDUK1Wy41d5vLsH+kINFujuRNKitbfh/WvQ4Ij5NATnjDkxkXlZcMXb3OtLwF0PY4tu+nOcxRL7S7V9I9aSMJ9dYcSVA3bWTkhp9MkeCVXC/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyljovGhs196omB9ilweM4sOWeGo8S/+ZvI43tWq3Xs=;
 b=f2WHsJIXEdc01M33eeENZqf5LhL5Kq44YlrqPmiMhyhY1e+HdWNTwTJd6b2KVdRNH+0aao7wEv9oUXtGkST1c93byIeqdUiHIU2L3+/hZnN07XQS9H82BiYT3R/IlgqF8bGq1f9NkMDfoMnOD4O+jiyS1ch9EasDACs517DaODDgmqY3arDMM3kipGpi0FVCRoDPnisciPTIaljINWfENpQ5PBlILK0byT3GiL1c9iw8TT3Q6KrxMUNYKVY2licfZWjcjKYuoYNI0ACu0pKbRmN37S9VOTEn3+jfet/etpGpvLiUf/8Awik9wCRZiqwNNwFbKrBx7Q1qlk1pR7I29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyljovGhs196omB9ilweM4sOWeGo8S/+ZvI43tWq3Xs=;
 b=S2pznBMpmtM8sRD7rAJrgIXFWfU2fbNwxY7B0tHbgwiQc39bnxoAhK119YIA2XImJ8hE/vMrGzyXhc0CPWnPd2qRZsU//d3d9wGi9+lh/7v5Eve16OyNejVUmGl9oVoKetQq+p4bYsebtxA2PXZCTs37mW9CogJSi69zgDa+tiCtA59zI/LCvVN9aNrmAcWAi+AIidOP1fkzKBkcc9gdcD+ZuhguAt8mVQFQ7OZ2Nndrc8T6m9hKqHJErmb6Il7mdIHCYecVL2sMn5cFddeWfZxY1e+kzDn+ndnjZnw+f5orSskalSQjKI2kYbVUDJw0jaBCj/NAx4e0J/fJPZTZVg==
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::cb1) by MN0PR19MB6144.namprd19.prod.outlook.com
 (2603:10b6:208:3cc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 04:14:45 +0000
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e]) by IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e%2]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 04:14:45 +0000
From: Ming Wen <mwen@ambarella.com>
To: Jonathan Corbet <corbet@lwn.net>, Rongrong Cao <rrcao@ambarella.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index:
 Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wAAAQ6JgAACKvLAASRQeqAAMU+ZoAAFtwHQBZDwTYAADwVUYA==
Importance: low
X-Priority: 5
Date: Thu, 5 Jun 2025 04:14:45 +0000
Message-ID:
 <IA0PPF7478C2D3A3B0FFB424A0FAD2C85B4DD6FA@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjr3i5yc.fsf@trenco.lwn.net>
In-Reply-To: <87bjr3i5yc.fsf@trenco.lwn.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF7478C2D3A:EE_|MN0PR19MB6144:EE_
x-ms-office365-filtering-correlation-id: d22efa19-1077-42c1-fd17-08dda3e78102
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXRvc0xnRnJvd28xV1VzTjd1bVh3eHN6SjQrb3J1Qy9LMHdXd2pRdkI0b3lT?=
 =?utf-8?B?ajRUWmVYUEFwWW9GT01reFcrQis4dmtldVJEVlRXekNNTWJnSkNueDB5ME5S?=
 =?utf-8?B?NVQxTS9aSVIxQlJTSjlidGp3UjFWS2FmQXo3aFlFem14djVRQnJsWDRyS3Ex?=
 =?utf-8?B?K1hHWGdEMXF5ZTZJNWhWVC9Dd2czSkdEOUFSTUNneHp3WURPbWx5UTZydC9r?=
 =?utf-8?B?Q3k2Vk91U0t5WkpYQVNkcDZwaGdxY29ob29rQ09XSVBUR2p5TWhqSkdtTFAv?=
 =?utf-8?B?ZHVvenNOcDVQVnhmU3BHdzY2NDRUeTk0ZERvOGJhUFI3Smg4OGE5QVU4VGJh?=
 =?utf-8?B?UEhRODdzRExIL09kaGZZMWMyN3RXb0FPa0gzd2thZnRDZ05VbkgyWE5UaGRt?=
 =?utf-8?B?YlFKbmc1ZVo4MHFpc0c5WmJwcXpjYzc2ZkpJRnppY3NrTDIrREg2ODQ3UzNs?=
 =?utf-8?B?RHZrR0EvZHJoN0FzWXVnV2FpeFh0VytUQ2tuZFlKSk9YZ2dtZEoxYVEzd2o5?=
 =?utf-8?B?RXNlZlk0WGY1TklRS2xWcy92c082eDlVQlhlS3l5Qkk2NHFTbTUxUDNoZ1Qv?=
 =?utf-8?B?QVM4c05IcmNHY1gwK1Mwa1VyT2tNZW1GY3JmVEhVUE9yWlVDS2hCTHZTaHlD?=
 =?utf-8?B?NlFUcjl3NWgrN3FTeEJxSmhhSlB0MTdGRm1oSG0yTEx0dVJscHYrdVFNT2d5?=
 =?utf-8?B?NmJkcHlFbHVJOE4rSDdmVzg5Slc3Y2NKMCtXZCtrS01aTlZIY3E0bXhDeGZZ?=
 =?utf-8?B?UnJWblhYdndaUmJHQUZQcmNlQnBoMHl6QmZZbDJwWERaVEg4RjF1R1ozVzUr?=
 =?utf-8?B?T1FVeTBYSXROZUQxdlJLOVh5Tk44eVR2NTB6Ym41SmRLUHNvQkE4eWpCSEQv?=
 =?utf-8?B?OXJpVy82R0N4TGZKUUR1b2ljQnQ0YjN3ZlFRTW93anhSTTc2blp1b1hiRnVF?=
 =?utf-8?B?MTZJcldrQUo5cWhxeHFYbXpJRnlLWFd6V3BVRTQxR1BxeEZTMDhQdXdOR0do?=
 =?utf-8?B?eUJrVVhsVGpxQ1U4YnVZcXFuSTJLN2UvamJOV1VHaG0yNVpDUGVhbnNzUHBQ?=
 =?utf-8?B?WE5EaXp3QXpLWUppM3JPakxQdENhb09GVjljYlZDTCtwdFFUcVBiVVVuQXE0?=
 =?utf-8?B?YU1mVUNxRmNjNThxVHhjYlVlRlkxL2ZqY1VEQmkyNER3V3ZrcnlhS0lIUEZZ?=
 =?utf-8?B?dU9HcU03RHE5WjVMRGhOcHlBK3JsYnJibXVpSERIZWJxOFgvRlZmV05NUWF1?=
 =?utf-8?B?bk5hOW44RkVMNEllWXJkNVh2T2NKaEM5SzZZU3lMSEVBZVdLYXpVelh0NXVk?=
 =?utf-8?B?SWRUMGNhVDdndm9QZFFFU2hyRFJ1OC9QeFlnckNuSzUzeDNXWjVieHI0MUZ6?=
 =?utf-8?B?V0l6SzlKN1lNbEY2Z0hOQ0o4cjExR1dOMjVpYVlkZE5IeHBKRHQ3ZlliMmVt?=
 =?utf-8?B?UnB2d1RQRi84VkpDNGl4c0xqS0FDUHRHeTdXMkpPY0Z5Rm84ZDlvQlpVNkhh?=
 =?utf-8?B?UGsyclNCUVRLYnlzblJoaTA2VDV6T1hpRTQ5KzhqZk5ZQU1YU2VCQm8yZjll?=
 =?utf-8?B?dVp2ekdBVEl4Z0ZFU0ZTUDFaUzEwLzFxZGQ3blp0S1hhYjUwdUsyS01RVFBV?=
 =?utf-8?B?d0FqVHVlcXVDTEs3SU96WHhrZHNuellyYy9ldlhUbmo3c0lBUk1kVStiNjNu?=
 =?utf-8?B?ZFMrVjBWbkZhc3JCWi9BTzVsdnQ3eXNiVTF6WWV0RURRV3hEOVpoNkRDUW54?=
 =?utf-8?B?Z1BBalYrVG9VazE4MVdRUWdGdy9nK0pYRndNN2xzb2QvOGpaVW5oc1N2KzZv?=
 =?utf-8?B?WUhXMDhCaTJFYUFTWXhTSkxnaEgxRGg0K085NzhycjdUc21GQWtXVWtOdFhv?=
 =?utf-8?B?OFh1T09xU3Q3RXNqRk9sbFVpNUNmTkVKUVpUSXRtdE5SdW5vZzNoRE9yc0ty?=
 =?utf-8?Q?8FfIFBNOOjw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF7478C2D3A.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnYvUnh5UFNBbHFXMGptSGJvY3dXTEM1SHdKM3JGWmdtVUtkNFI3VEJFekJ5?=
 =?utf-8?B?NjNWelVwTkJHRXg5NU9FVk55RnJzZ1Y0ZGs4TnlLelUvaVpHM0RjQVo1VlpH?=
 =?utf-8?B?U0RXT3dtZ0JaNFQrNUYzRFQ1UG5vVGFVRDcvdUppcnJIc0luMkQ0TTNWanhS?=
 =?utf-8?B?eFRYeVFPOGo1dUxmN3JGaWIrZ3ovMUY5N2JvV3FYUlNMV0xVZFY0cVU1c0da?=
 =?utf-8?B?SlQyb05ibVBCRkI0RkpnZXhRbk9ad3F5ckpKWFZsc3RhUit2aFBBajVTTWlp?=
 =?utf-8?B?ZGE2MEZ3SlVXMnY5bjNJaVlvNFVCYjJjUXI2VnN5WElwUkRwdHRFdkdHaGp0?=
 =?utf-8?B?WXEwb1QvZFlRWWo2RXVKRmJWZ0ZhN1N0YmwyS0ZTRzg3T1pjbjRneFZNSkVt?=
 =?utf-8?B?WWZ0TjB1bEF1d3VZQzJOQURwTWcrdDczOXU2WS9FZFdmSlA3cGVPNStLMk5O?=
 =?utf-8?B?cU1kd0tHVjBDOGRWVjNZUTNYQTdoUDJYZi9uWVhqSDkwaXN3YmZOQ2NtNEds?=
 =?utf-8?B?aUw1TU1yU2VQbXZHa0QxMC9ZV0ZuVFBEVUdQdDAycFhGR29hb0JDbE9haU41?=
 =?utf-8?B?aGlhRkFaY1d2aE5zUzdkL3U2VVU2Z0I0eWVxZXhWRzhSL0VYdWI1eXhpNzNF?=
 =?utf-8?B?NDhVbElXT2s4RUh6NFpGTjBSSGEvZEpoQmM4TVJRZC9ZZG5hcTJnSDZ5SG9o?=
 =?utf-8?B?UkdVT1ZwTW1VeEc1OGR3MTU0eXBNY00yV3prMzJVQ3Jtc3NBNGNKek1Yc1lQ?=
 =?utf-8?B?ZU1nMzlmU3lqcDJwOXRzOEhLRVhzbDFoQlZGU0Y1ZFdVbk5yblJjMmJlbEdw?=
 =?utf-8?B?eTFxV2pMb0pwQ1J4Q1JqZUFEeWhrWDVuNUVsTUFMQUlVNUNmZmZTZnR5bGhk?=
 =?utf-8?B?b244OVZwTnpMQm5TWkovY3IwTG8wOEY4NkUwdVpDRjN6c1Q5VDZCbXVIeFhI?=
 =?utf-8?B?RnE2S0N5MHZ1Qjh3TGlva2Q0VHlqMDNiYkdpaEpRcTBSRjlMdW9RcWdQK0E3?=
 =?utf-8?B?NE5sVGovZ2lMSkJPeEJ6cUMwY1NlNjRSbm9ScU96UlI5V05JNzgrajN2YnY1?=
 =?utf-8?B?MFFOYkhZVWw5R2NaMElOanJhMm5UN2dGajNXbTNwTlhDdENsSllPWWtuNkg1?=
 =?utf-8?B?UXNDYlZoT0tDZi9ja0xOVm0vTVhpNmFvUm02KzlYOEtDOTk1M0tvTjBFNWZt?=
 =?utf-8?B?L2V5OWVaeTgxd2M0bkRGcW9pK2JvOVlvTkwzU2h6aW4wY1lJLzlta29YY2tn?=
 =?utf-8?B?dFo2VVlwcmhDbTd6RElhUE13RElabUxqSldmNTU3V1RXeEIxN3NKUHNPTity?=
 =?utf-8?B?NGEwb1AyS1RxWVpESGg0MHNhN096M3JvZHd3UzZueFdkMGpMOGNwQmFLVGdG?=
 =?utf-8?B?MkpOZ08zOGk5QTdhZ3VVSmFSMmJyS0RKaG95a2hnS2V0UlBxazdhWVpIanov?=
 =?utf-8?B?VjJzaERiby9ualJYYkZsd05GRlUxZTAvTzhhTXBaNHRxSmJZNUVMcDgxTlFU?=
 =?utf-8?B?dXM3UGxlY29vMERxdnNyMkVMWDNUK3hvQ1h1eTNsbFBHalA5czRLOVZOK2ZC?=
 =?utf-8?B?Uk1ZeWNLSEhtWlFOMjFkbFJmU0NKZnhvQ1crY0NtdVU4ZDZRVmxoWSswV29h?=
 =?utf-8?B?bTIxMlBCTDZjQjRDMDJvaHFrd3oyL0o5bFl1bFhTSnBqOTVEWlRZL2U5ZnFL?=
 =?utf-8?B?bUtMa1BmYjRzdksrcmtVeXZ6bGM0d2l3RTE2ZkowTjM0Y2pEcE9GbnNORmd1?=
 =?utf-8?B?WXhxeTRHVWMyYVVCQzkrbDdrcVdLUnI1Z3ZZOUJpVk5oQlJxaFpJTk1mdTZ6?=
 =?utf-8?B?WExTQWtML2JLOE8zVW5CdVh4QVBEeUd4M2FPbzFnMW1iaXFsOUpxK1JNUXY4?=
 =?utf-8?B?QnBMSmJJb3kxSHRVeGsrUW90cGZSNzMzbEc3Z1ZkUWZmWUNsR3lPaWtaa0Z1?=
 =?utf-8?B?NXhnc2Rua0JsaXJiQTZoZDF4RGl4QUlnK0F1R3k0UXdmc2h3bXFwcGd1QXJC?=
 =?utf-8?B?U2tzcUtzZFkwcDBwR0VMZDlGSlM2R1JYZFVPaDBCN1ZWRUhRU3VzY1ptd2Rq?=
 =?utf-8?B?NlZhN25MRmdRODRpajY4emNlc1REcmF3TG1yWGlHS01keGxOYTl0c1dXR0Zw?=
 =?utf-8?Q?OsG58GP1/hOFLOsl5Psy8kGYA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d22efa19-1077-42c1-fd17-08dda3e78102
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 04:14:45.3304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwnLJTO/P9aou3bBh7XV8S65TU1NEplpNXNrpdNAkMGewi2PZ5u3ECxC9UWh/+P3zTG0kLklip4EvnVhucYLjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6144
X-Authority-Analysis: v=2.4 cv=Ts7mhCXh c=1 sm=1 tr=0 ts=684119b7 cx=c_pps a=rsLHm5W7tqJ/EC7plxtjWw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=dkMdDuzY2HgA:10 a=VwQbUJbxAAAA:8 a=uPZiAMpXAAAA:8 a=07d9gI8wAAAA:8 a=xOd6jRPJAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=ppJngBeKAAAA:8 a=5aLCJstqRKGBK1Yw8VQA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 4b0k-2lLFH8oXzpLjpwAp4d2KanyGXCG
X-Proofpoint-ORIG-GUID: 4b0k-2lLFH8oXzpLjpwAp4d2KanyGXCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAzMyBTYWx0ZWRfX9V2vIkr/QS7t m6SLBHiW/BQ1nLHoT0kWieeEn/DwE3Ms4dhPRsH7ITKgShnHIxMgkDUeRN5nf+Wc56OAqtcCuhA T6N1gvo+D87ukX9+/bDY5B7xUVUdbCY6VszEHKCGsJtYPH4uHojZVWYtJBJdVBilNZXknLUgrAR
 KaMLtgXaM/sCn1Ya6ooPLDS06kMniW1g/eqWnEwXb7T961+eMds2JQS3XHyKTHKl57Iq65j0j29 us6EtPGdTG8U+PGKV29Qiw5HNGxgGq1IBk7kCr7nyEcyr0APg53ghdAvwAgfeaMYc6sDVKTt9tI J0bCiB9ES4Hg1Qf+LW445HB+1NeuK2NedfhkAM3Qi8h40mCT7HiVJGNVpDEuol7//zGp6d67pt3
 zmZmXDh6Nc2UFMfN9rPSAWFIWLrC7sMwlm4Y2txrIdQ4/DgOvIX5yUiRYdxHtQbWKWdW+P3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050033
Content-Type: text/plain; charset="utf-8"

SGkgSm9uOg0KwqANClRoYW5rcyBmb3IgdGFraW5nIGNhcmUgb2YgdGhpcy4NCkkgZG91YmxlIGNo
ZWNrZWQgYWdhaW4gNi4xLg0KWW91J3JlIHJpZ2h0LiBZb3VyIGNvbW1pdCB3YXMgbWVyZ2VkIGFs
cmVhZHkuIEFuZCBpdCB3YXMgbGF0ZXIgb24gcmVmaW5lZCBhIGJpdCBieSAiTWF1cm8gQ2FydmFs
aG8gQ2hlaGFiICIuIEluIGhpcyBuZXcgbG9naWMsIGl0IHdpbGwgZmlsbCBodG1sX2Nzc19maWxl
cyBhdXRvbWF0aWNhbGx5IGJ5IGNoZWNraW5nIHRoZSBleGlzdGVuY2Ugb2YgcHl0aG9uIG1vZHVs
ZTogc3BoaW54X3J0ZF90aGVtZS4gV2hpbGUgaW4gb3VyIHByZXZpb3VzIHRlc3QsIHdlIGRpZG4n
dCBpbnN0YWxsIGl0IHByb3Blcmx5LiBTb3JyeSBhYm91dCB0aGlzIGZhbHNlIGFsYXJtLg0KDQpU
aGFua3MgYWdhaW4gZm9yIGFsbCB5b3VyIGNvbnRyaWJ1dGlvbnMgdG8gS2VybmVsIFNwaGlueCBE
b2MgbWFpbnRlbmFuY2UuIEl0IGlzIHJlYWxseSBoZWxwZnVsIGZvciB1cyB0byBsZWFybiBrZXJu
ZWwgdGhpbmdzLg0KDQpjb21taXQgZmNhNzIxNmJmNTNlN2YxZjRhOGRiYTZhZjM4NmQ2ZmFhNzY5
OWZkNg0KQXV0aG9yOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5l
bC5vcmc+DQpEYXRlOiAgIFR1ZSBEZWMgNyAxMDo1Mjo1OSAyMDIxICswMTAwDQoNCiAgICBkb2Nz
OiBhbGxvdyBzZWxlY3RpbmcgYSBTcGhpbnggdGhlbWUNCg0KICAgIEluc3RlYWQgb2YgaGF2aW5n
IFJURCBhcyBhbiBhbG1vc3QgbWFuZGF0b3J5IHRoZW1lLCBhbGxvdyB0aGUNCiAgICB1c2VyIHRv
IHNlbGVjdCBvdGhlciB0aGVtZXMgdmlhIERPQ1NfVEhFTUUgZW52aXJvbm1lbnQgdmFyLg0KDQog
ICAgVGhlcmUncyBhIGNhdGNoLCB0aG91Z2g6IGFzIHRoZSBjdXJyZW50IHRoZW1lIG92ZXJyaWRl
IGxvZ2ljIGlzDQogICAgZGVwZW5kZW50IG9mIHRoZSBSVEQgdGhlbWUsIHdlIG5lZWQgdG8gbW92
ZSB0aGUgY29kZSB3aGljaA0KICAgIGFkZHMgdGhlIENTUyBvdmVycmlkZXMgdG8gYmUgaW5zaWRl
IHRoZSBSVEQgdGhlbWUgbG9naWMuDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxo
byBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5lbC5vcmc+DQogICAgTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci9iZDIwYWRhYmZkNDI4ZmQzY2QwZTY5YzJjZjE0NmFhMzU0OTMyOTM2
LjE2Mzg4NzAzMjMuZ2l0Lm1jaGVoYWIraHVhd2VpQGtlcm5lbC5vcmcNCiAgICBTaWduZWQtb2Zm
LWJ5OiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pg0KDQpjb21taXQgZDY5ZGFiN2Rl
MjA4NzQ4ZGRmNzkxNDNiMzlkOThkYjU1ZWVlOWI0YQ0KQXV0aG9yOiBNYXVybyBDYXJ2YWxobyBD
aGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5lbC5vcmc+DQpEYXRlOiAgIFNhdCBOb3YgMjcgMTA6
MTQ6NDkgMjAyMSArMDEwMA0KDQogICAgZG9jczogY29uZi5weTogZml4IHN1cHBvcnQgZm9yIFJl
YWR0aGVkb2NzIHYgMS4wLjANCg0KICAgIEFzIGRlc2NyaWJlZCBhdDoNCiAgICAgICAgICAgIGh0
dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzIzMjExNjk1L21vZGlmeWluZy1jb250
ZW50LXdpZHRoLW9mLXRoZS1zcGhpbngtdGhlbWUtcmVhZC10aGUtZG9jcw0KDQogICAgc2luY2Ug
U3BoaW54IDEuOCwgdGhlIHN0YW5kYXJkIHdheSB0byBzZXR1cCBhIGN1c3RvbSB0aGVtZSBpcw0K
ICAgIHRvIHVzZSBodG1sX2Nzc19maWxlcy4gV2hpbGUgdXNpbmcgaHRtbF9jb250ZXh0IGlzIE9L
IHdpdGggUlREDQogICAgMC41LjIsIGl0IGRvZXNuJ3Qgd29yayB3aXRoIDEuMC4wLCBjYXVzaW5n
IHRoZSB0aGVtZSB0byBub3QgbG9hZCwNCiAgICBwcm9kdWNpbmcgYSB2ZXJ5IHdlaXJkIGh0bWwu
DQoNCiAgICBUZXN0ZWQgd2l0aDoNCiAgICAgICAgICAgIC0gU3BoaW54IDEuNy45ICsgc3BoaW54
LXJ0ZC10aGVtZSAwLjUuMg0KICAgICAgICAgICAgLSBTcGhpbnggMi40LjQgKyBzcGhpbngtcnRk
LXRoZW1lIDAuNS4yDQogICAgICAgICAgICAtIFNwaGlueCAyLjQuNCArIHNwaGlueC1ydGQtdGhl
bWUgMS4wLjANCiAgICAgICAgICAgIC0gU3BoaW54IDQuMy4wICsgc3BoaW54LXJ0ZC10aGVtZSAx
LjAuMA0KDQogICAgUmVwb3J0ZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5s
Pg0KICAgIFRlc3RlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+DQogICAg
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4NCiAgICBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVo
YWIraHVhd2VpQGtlcm5lbC5vcmc+DQogICAgVGVzdGVkLWJ5OiBBa2lyYSBZb2tvc2F3YSA8YWtp
eWtzQGdtYWlsLmNvbT4NCiAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzgwMDA5
ZjBkMTdlYTA4NDBkODFlN2UxNmZmZjZlNzY3NzkxOWZkZmMuMTYzODAwNDI5NC5naXQubWNoZWhh
YitodWF3ZWlAa2VybmVsLm9yZw0KwqAgICBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDb3JiZXQg
PGNvcmJldEBsd24ubmV0Pg0KDQpCZXN0IFJlZ2FyZHMhDQpNaW5nIFdlbiAo6Ze75piOKQ0KU0RL
IFRlYW0gfCBBbWJhcmVsbGEgU2hhbmdoYWkNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4gDQpTZW50OiBUaHVyc2Rh
eSwgSnVuZSA1LCAyMDI1IDQ6NTQgQU0NClRvOiBNaW5nIFdlbiA8bXdlbkBhbWJhcmVsbGEuY29t
PjsgUm9uZ3JvbmcgQ2FvIDxycmNhb0BhbWJhcmVsbGEuY29tPjsgbGludXgtZG9jQHZnZXIua2Vy
bmVsLm9yZw0KQ2M6IG1jaGVoYWJAa2VybmVsLm9yZzsgTG9uZyBMaSA8bG9uZ2xpQGFtYmFyZWxs
YS5jb20+OyBKaWFuIFRhbmcgPGp0YW5nQGFtYmFyZWxsYS5jb20+OyBaaGFvLVlhbmcgQ2hlbiA8
enljaGVuQGFtYmFyZWxsYS5jb20+DQpTdWJqZWN0OiBSRTogW0VYVF0gUmU6IFtLZXJuZWwgNS4x
NS9LZXJubGUgNi4xXSBBYm91dCBTcGhpbnggRG9jLg0KDQpNaW5nIFdlbiA8bXdlbkBhbWJhcmVs
bGEuY29tPiB3cml0ZXM6DQoNCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlLiBHb29kIHRvIGtub3ch
DQoNCj4gQXMgdGhlIG5leHQsIEpvbiBtYXkgaGVscCB0byBjaGVjayBhIGJpdCB3aHkgdGhpcyBj
aGFuZ2VsaXN0IGlzIG1pc3NlZCANCj4gdG8gYmUgbWVyZ2VkIGludG8gTFRTIEtlcm5lbCA1LjE1
IGFuZCBldmVuIExUUyBLZXJuZWwgNi4xLiBJdCBzaG91bGQgDQo+IGRlZmluaXRlbHkgYmUgbmVl
ZGVkLvCfmIoNCg0KU28gSSBoYXZlICpmaW5hbGx5KiBoYWQgYSBjaGFuY2UgdG8gdGFrZSBhIGxv
b2sgYXQgdGhpcy4gIEZvciA1LjE1LCBJIGNhbiBjZXJ0YWlubHkgYXNrIHRoYXQgY29tbWl0IGQ2
OWRhYjdkZTIwOCBiZSBiYWNrcG9ydGVkIChJJ2xsIG5vdGUgdGhhdCBhbnlib2R5IGVsc2UgY2Fu
IGRvIHRoYXQgdG9vKS4gIEJVVDogdGhhdCBjb21taXQgd2FzIGFwcGxpZWQgdG8gNS4xNiwgc28g
aWYgdGhlcmUgYXJlIHByb2JsZW1zIHdpdGggNi4xLCB0aGV5IGxpZSBlbHNld2hlcmUuICBUaGF0
IG1ha2VzIG1lIHN1c3BlY3QgdGhhdCB0aGlzIGNvbW1pdCBpc24ndCB0aGUgb25lIHdlJ3JlIGxv
b2tpbmcgZm9yPw0KDQpqb24NCgoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqClRoaXMgZW1haWwgYW5kIGF0dGFjaG1l
bnRzIGNvbnRhaW4gQW1iYXJlbGxhIFByb3ByaWV0YXJ5IGFuZC9vciBDb25maWRlbnRpYWwgSW5m
b3JtYXRpb24gYW5kIGlzIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZp
ZHVhbChzKSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZC4gQW55IHVuYXV0aG9yaXplZCByZXZpZXcs
IHVzZSwgZGlzY2xvc3VyZSwgZGlzdHJpYnV0ZSwgY29weSwgb3IgcHJpbnQgaXMgcHJvaGliaXRl
ZC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0
aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFuZCBkZXN0cm95IGFsbCBjb3BpZXMgb2YgdGhlIG9y
aWdpbmFsIG1lc3NhZ2UuIFRoYW5rIHlvdS4K
