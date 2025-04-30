Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3225EF9C
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026148; cv=fail; b=oDbsXvQ6CVfvdfskdBAcEsU6KC3nCwYdJyFwDpTRKUf6IayGQwivzHCqiE3JnhHWZVpZCINUlyfD7Hyv9QKsbQtv/mZYpOeeheLolcWAGuVF9b7nAt7SBNn4dOcHgojDa0KWU4zUUcTLtuTAEf6hLcd83IP/YxmojwRJwAuRpJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026148; c=relaxed/simple;
	bh=fPr/5t8M/iWXf9JGhibjbUjQg8OYvXjwPKEbXow1NTE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=SuPiYrFP/4hAv+U/zfE4OfUJSHzVUhR/BoJLin9SqkHv56Zkl6uyTl6lrD/60H75U6rAa7/WnECX/H10uSjqj3McQWNEOpHV+vZL4oV23iGTVVM91U3qPIz5uJwPHTIdEpgxgEIdK3cmAnFETIrcXp+pQ0FkA2+qWgdiRQ0uujM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=L9iibCP4; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=Llcjtsvq reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="L9iibCP4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="Llcjtsvq"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UEP1Ls011421;
	Wed, 30 Apr 2025 08:15:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=fPr/5t8M/iWXf9JGhibjbUjQg8OYvXjwPKEbXow1NTE=; b=
	L9iibCP46rrmAnrFnPzAMGPdwae9aO86QbNuAxNcxrJJ/Fnm0QxHeMFt0bV+KLE9
	KlTz5iTj9mNjln9FWJw64INZrQj8AG/tWJ+w1t791zYCn7C2TMHMqSqXBj9i0F/9
	EvfHPTvFjA19Jj+P8GsIs9cjj6dYAYurVZMXFbPtH/r8xgSG3mZZhT8jc67dA6lp
	vwF2bXb2gOne/NXzMTlQ1yXVEAyUsNwBP5yu+HOK1LAiuGW7FlIZp9fdcG9OPEBQ
	t9axch+rR97b9fy1m9NX2P4+c0S1FtmxMjZEBFkVUVGN90zIrJ/mxa8HHHgH2BXD
	q9cgbildiO6Fn2XiUr0rtg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46b6tx0err-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGddtY9ox79n7fLYyVKqRrqPE7OQxyrFYKkr7SzzGJSsDi1ciG9ciqpULq9CRklhACYzWqrgXAeCIIyAMbOGeDtGluiPBrTLqB82E5t4SV5/tdXwCXBzdQb6jktCGT0E5kpvRYIWV06AsTR+lo4aZQ7q/ciTY3Ud8vkIudPovIkL2KzJX3FUay/dhLNWW6eXsbk9I/x0dFp1glwuNBkzypnKuXZvkHlniszRL/TpSKv6fF3znMkSG9ryk2GQ1x8jP5osBZLP6uHisP+UbjYFnhzEeKoPPgab0+muuEFYRUlza9ROmDP+6wUmo4UrbDwUkq9VWYOMUMStoh2AaXZMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2SqBlfO4qDFCk1LhMu2s5t2HdY+/AFICdy2g7cdehs=;
 b=AXw3KdeQ69vOosXt5Au7dlfglXXDFiZmzMLkAu/Sxgrb13bBemW0ZJeClj5wrOgNiFU+WLOIT8tvcD0cTsl8bNi9VvvtPlVlq83nODRQnDMgVSEdXsmb8+yL69h0ukIucBcBvHMxpLHdrW3+BOaY2oWl3Hqfidjl3iYqjNGHSFkqBDeQzg/nNvWgzwCutm4DnkdGSadureag4Sa7AjuJx+DJFvfKotyHflpnXw/R4F9j5rgRDh5iQveyilOzKPQoIX6576Niu7QEbCgjDPoyxo97f44em/0E4+Sldq3GbP7r2xLt7V7NDCI0ZouUCT/00OP8/sA4+llVtLxQCwQveQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2SqBlfO4qDFCk1LhMu2s5t2HdY+/AFICdy2g7cdehs=;
 b=LlcjtsvqDf09JIr9TYXIKSONWS/YXdjqmn/ES3H+SfTSufYlUkrokste0M7pjEsUQ9dw//qmgYwzz4q0vC3RavnVaBgsgDjYmnr13aGiokN9wZgHI877pRtlcty1X3Pmv2O+k1ta9kJJfNw2Ze2pt+ZML1+mwhYJZe5lnDij8NEkuatJ1/k2lAxv67bF7xb1RSfYpxDrJK6uUFb/mYpeovYfsihQmQmK8lkcFI2WuSaulRLqYn8Ad+gBIM0rGjGFbB6RC7Dy3Dyso7cd4B7VKz+FKt2W0APdIQoQlYgHjEbJH0skoe17n0hkObxyWxfA8gfRPeaYPEts5dN5X6Ud9Q==
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::cb1) by SA3PR19MB8217.namprd19.prod.outlook.com
 (2603:10b6:806:39d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 15:15:38 +0000
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::b5a8:7a73:b555:1e87]) by IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::b5a8:7a73:b555:1e87%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 15:15:38 +0000
From: Ming Wen <mwen@ambarella.com>
To: Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>,
        Rongrong Cao <rrcao@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index: Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wAAAQ6JgAACKvLA
Importance: low
X-Priority: 5
Date: Wed, 30 Apr 2025 15:15:37 +0000
Message-ID:
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
In-Reply-To: <87bjsdlp6o.fsf@trenco.lwn.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF7478C2D3A:EE_|SA3PR19MB8217:EE_
x-ms-office365-filtering-correlation-id: 43f91967-52bf-45e1-f6ed-08dd87f9dce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c05HWTdxUTdWc2xIL0JyTWZFSXhYV1NuM2FqREFuSE5qK0JicTlXd3Y3OWVB?=
 =?utf-8?B?SUNacUhzYkxENWpzcUlsanRmc21yWjVwbDAxL0xpVXVFQkNJOUhmZEx3Vy8x?=
 =?utf-8?B?VzRTNzV4eTJYODRFNVc3RjBNZEY5WGlFMVRuandGaVpLc1ZPM3JLRS9uTW5K?=
 =?utf-8?B?SERmb01NdWhybVJQMzVyL3dFTDJiYWMvVVF4eU1JSXJoLzhCaHRZcnoycS9H?=
 =?utf-8?B?Qkg5empGd3I3cjNsaVpadkVTM294c0lIaUUxMlBycDNwRitGczhGbmRwbkRR?=
 =?utf-8?B?bGlwNElUQkpsa2lZdFZYL3VyR0pPVXFEcFg3L0tsMkhJRjBvb3dEOU5BN0xO?=
 =?utf-8?B?L05NS0M0OGZDSlE4Ym9XWkQ1SlBLaGR1YWdWTkFURnRVZEZSS2szbVN0c1FO?=
 =?utf-8?B?ZDkxOVBXUlM5Y2lNRjFaV2ZGRjRNM2hQN3VFaUlOSURzUGRCTVFDRnVYeFRa?=
 =?utf-8?B?TGpqN1REc2FNL0dBU2JteTYycmJsRkg1OUZyektoU3g2OXIzbzhVRWwvc09Q?=
 =?utf-8?B?SnR0cVE5SFF6QXZnOXQ0M0dvU0FlUVFMNHM5QVNTZGd4cmY1ZVpqQzZGWmZ4?=
 =?utf-8?B?bUJycTEwYWxRcUY4d0toTW9aU2w4NEdRanRUbGlWM1JEM3VUMGw5RDNhWWFu?=
 =?utf-8?B?Y3F5elBqSGJZS1d4a3lRaXByQ0FuY2FhVVFwTFlQTVlaNVdNNDB6aG05dVBw?=
 =?utf-8?B?VzQ1bk5sNjFpYkRhdWVjQjdyVEpIVDNMbW9KWTZORm9PUXdxL29BcStLaERx?=
 =?utf-8?B?Y05QOG1aQm84TGU0Z2VFc0lhUE1XeEtram5Ncy9aTm04cWM4L2dvTUFOcitp?=
 =?utf-8?B?SUE1NDVGVjhvdG9EUHRiU25SSVhIdzFsYlpkL3d2YVN6WDRVdGJwWWs2a3FW?=
 =?utf-8?B?OE1Ibk9OSDRlVlpmeEl3K2swWXdOaFIvYitEYklNbFRLMHc4UGc5WDk1bjF5?=
 =?utf-8?B?NUJmbTV1a0laWUpJUlhpU0RidDhUOHhkcjBIcGhrNkx1elRrTlFZNjlBTDIr?=
 =?utf-8?B?UXJHanF5azVoRUV1Rk1FK2VpNllDSU04MklMSGFlVDAwUHUvM3pwNlFEVTk4?=
 =?utf-8?B?VG96Y2dHbnVJT0NCZTlxb0FIdllHcHZiSHlTbmpZQ1VtZkdmUlZ6cHpjaEhl?=
 =?utf-8?B?YktGZlkzQmdheUZxOWFTRnh3bGFQNDZHQy9qUmtON1NSWStZaWlETWl6NDdV?=
 =?utf-8?B?ZkVCSUtWQVZ6L1BvazVvWGxnTTdoNFBXRHhnZHNNeTZBWkhBVHArVHZPKzRN?=
 =?utf-8?B?ZFZPbUZHMWxHZEk2cmRiN0tDYjU5Z0JsMmlENmdOZkg5NHBocWxmWmRkYkZY?=
 =?utf-8?B?RTZNcmhiR1VvemRxSTByTS8vcmNmNHBxZitzaFZ6RmJydWpsREMva3loTkFD?=
 =?utf-8?B?cFpDS2VxMnFpWlo0MnYrOHpackpzRmRzbG1WZEd5N0gzeHZYbkhWMmliMGlv?=
 =?utf-8?B?RXhwaDk1OHJSb0JyZWlRYWxxUFExWTZRazU0alVHakVjdm5DRFMzZXNGazR1?=
 =?utf-8?B?RVJMNGk1SlhNRWdHV2pEYUtrczFOVDdhV3NUUU9IQ1AyMkZlbFRWWVk2SmZv?=
 =?utf-8?B?S0F2YmErVGpwSmxGZ2ZTaUZFUXdoaldVd1h6aTVQTEZ1MU9tL3BxZkdJVmdK?=
 =?utf-8?B?aGw0c0hkN0JmNkljNjVsYk5CWlhDRGZJelRSY0tjYm10N0VCcSszNXB2NEJ5?=
 =?utf-8?B?K2JXdUQxVkpkekRiV1FQdkVBd25TejhDbjVzQnJRaGFVL0hqM2FwV0FuQ0JK?=
 =?utf-8?B?RzhMU1BDRDFsVnM2MDNLNERwSUtNQ3VoM0ZPRnRyVXJ2ZkM1MHcrRlJQNFh3?=
 =?utf-8?B?UnFkT2wvYTgvRHpyUGJlVkpNY3d3czhheTNNZ0ppakF1OWE2MmVSeE9jd0gw?=
 =?utf-8?B?U3QrNGtWODBabHJ0VExUcFh1YmQ5ZU9yTFV1b3Z1R1FNdUM5dCtqeWZibVNj?=
 =?utf-8?Q?GbvBuxH3AdY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF7478C2D3A.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OCtTU0NMUUx4QUpNaXFmSGlZRit0RTFJTm03dnBiZERXUlpXTU84ZW1CNmtn?=
 =?utf-8?B?MkFEYXRmckNab3R2NENQVGFwWlZIK1g3eXpyYzBZV1BmZitKdVRnMUVBQ1ho?=
 =?utf-8?B?elJ3RzM2Y1NOY2FWN0lGcElraXBtYUU3N3Q4ZG9lcFJrc2tsd3JNM3ZPelJP?=
 =?utf-8?B?OUwyU2ViNU91SHpXSGpqSjhqdVdNZDB3M2tXQy9nRWt1aFNtejQwaTBLSS9j?=
 =?utf-8?B?SlJ6SFh4WklmZXQ5S1paRnIvUWxaUTdpLzc2ZGpIS0oxR3VscG9GZVZCb09y?=
 =?utf-8?B?YUpQd0FEbEtScDJ0M0JSVjBUaXVPclI0NmltQy9BRjN3OHdtYmpNd3hXS0k1?=
 =?utf-8?B?T1l3VEkzZzdSYUJLL0p1NisrY2o2bVcyaDB2VEt6SnBVeW9YRW8zNFZmOTl6?=
 =?utf-8?B?Z1ZxWHp2dkpSbnY2RnAvd1QwdFdYVWQ1YnI4TnZHV0hDNHFBSnVyWEhmNTNL?=
 =?utf-8?B?OUhEVU1rVHNIQzk2OTJrRWEzQngyU1psa1NqeEJOUWx4YWhrNS9Jd2xrcjha?=
 =?utf-8?B?cDZpL3E4VC8ra1U2NnJmUmwydzNhN29pZXo4V0lFNEo1MXNpN0p5bkpLOVF4?=
 =?utf-8?B?UjA1OVh4NStZckhJL2l5NGZkNDFiV3c0eU9mRjh0bE5SYzF0ZElrNzF2b2g3?=
 =?utf-8?B?WTFzZUxicCtnZ00rZFdtUUxCY0h2NkdzYkJQenZXZC9WeDVuODdVNldDamda?=
 =?utf-8?B?WmpEYXdPbE5oMXFkOUN4UVhseUMxUDNsaXJwM0xSYnJMUnoySlhzVnVudHBH?=
 =?utf-8?B?V3hvY24rV2hWL3lNaXZBbDlybVBtZEJ6Z3dJKzB0QlRCR05mcSs2MXREclBh?=
 =?utf-8?B?eGJ4ajVWUGNXVEl4SUpjYTBXdTdPdFczOFhweDhvTXlFSEhaQ0kzWU5IVTdx?=
 =?utf-8?B?SzRJSGVmc3pIWDF2SG9jdnhSZmRUUTFIYWdCQlFxVFk1VlAvbnpCZXcvZ2pq?=
 =?utf-8?B?U2p0bHA4bU9oejZWZXpaZTBuZHJHT1Z5MWV2T3cvQXhEWWNaRDN3OUswOFJv?=
 =?utf-8?B?eWd1ZGd3RkxXcDRHQmFGenlsYnFmRUhTbW44NHI3QlY4NXE2d3o3VlB6bXF1?=
 =?utf-8?B?VGYrM1V6Wm96YXYzK3VIR3owWHFHZnc2dUNsYUg3Mit3aTJPbC9qdndOc3Uv?=
 =?utf-8?B?bFRSRlVZTXh1L3c5ckdnWGg0dHVpbDNoZmNNN0c4SStYbDRudXJwa2srWGRl?=
 =?utf-8?B?VWRZbG4rMTM2cXZreVVZNlZWc1UyMnZxdU02UlpzY0RwY0lUTFlSa3BxWGE0?=
 =?utf-8?B?d0ZFR0tSa3Q0MklEMnptMitpQ0pac1B4bzZqRmVmSFlZL2VydTlIN0dWUlZK?=
 =?utf-8?B?Z1dlNkRBcE9LM1h1czJxR2VKdzBqazljb2JsUmdSN3pydXpBMzM5eUZCZWVm?=
 =?utf-8?B?V0dmS1FLREZBMVJqSkIwQnd0L3BWQnNZdU9ZUXZmRjRJaGE3ZG1vanJNMDRN?=
 =?utf-8?B?SFVWbVNlU3UzOFpObXhDcTErOTFYcnByL3BrUjhBOEh2N21FNDhVQU5xcGll?=
 =?utf-8?B?OHVxZlprOEZ4TDFJbGZZYWtQVlk0ai9peXlCYVFGUmthUEZDL3dySlJPZWV1?=
 =?utf-8?B?ZDI3N2VyV1R5Q1Vwb2t0RlpWUTE4R3NkbXp1Q3dVVVp0dXBoaHQwNUtFL0F6?=
 =?utf-8?B?SDlPZ3U2MndiVzJvcFJ3SHJOeitoTjBvV2ZJTTlBV212cS90Tm5ON2IzQmFk?=
 =?utf-8?B?MEtmUlc3Wk1BTFB3UytiV0NVci9jS3VSb3V1TEEzdHVsb2QvdEFHcjNyU3Bt?=
 =?utf-8?B?Z1p1c1hlUzR1RVdDWGxKRUFvTFlDOWVmSCs4VzFYQVNBVmZ5K3lOa3NRZ0JC?=
 =?utf-8?B?bVlMVkpabnNMSW5Ma2xJajM0UFJiZzlaS1NzVmxiNEhuY1RpRktmUUhPVmdm?=
 =?utf-8?B?MzU2OXlpSWl2blhvQm5WbUVpMzhRbWdkNWNJOS9kSWYxckJNaFBIQTBxNHAz?=
 =?utf-8?B?YTZ6b1RWa09hVzdDREIzdXhMUWhDdzFCOXZJd2Z6ZnZTaXIvYUI1MXZpL05T?=
 =?utf-8?B?b3ZvemtKdGxyZXpTdFZmb1l0KzdNYldCWDJ1VVJpS0FZbUxpaHJXZzhRWldZ?=
 =?utf-8?B?SHdlNlVsOWlqd0lHbU5FTi9rZ2JvSFM5YS9EZjFManFiRUl4UXhxbHdYWEJk?=
 =?utf-8?Q?CuMkqYnGWUFMJPkTWFdyEPvQD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f91967-52bf-45e1-f6ed-08dd87f9dce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 15:15:37.8830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3BTRrLB7qwwB/UIRZynLlwvr/aG2TJZi9K82E3DuJpBcLOSLcb5AspGespLLP2qI4HjAPYBUgkz66PId0VYYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB8217
X-Proofpoint-ORIG-GUID: rnhFTv6lGD63y4E5sCeJycQpu-0qVmpT
X-Authority-Analysis: v=2.4 cv=JdW8rVKV c=1 sm=1 tr=0 ts=68123e9e cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=dkMdDuzY2HgA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=07d9gI8wAAAA:8 a=ppJngBeKAAAA:8 a=1A6DehZcfdl83vInxOcA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: rnhFTv6lGD63y4E5sCeJycQpu-0qVmpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwOSBTYWx0ZWRfX1ZXsuaR19611 OsCeZ2wJzYikdErpGG2kMdFGqleycuwDoJqstAt+XzKhQqWdHbT6Pk4RxL8dsoY10/FiyVwdllU Q3JBj5NfipPLOo+ULEbtw74o/JLYm/2R1IfVlyoWvEbixAi/W5uOi0NvRHRgagx3kM7ygkbB57J
 dzHEzsfbWpZKGwJhmyOAkYDQNnxd+jDmwuW0Zie1E6+tVG/TQBaBBuwNFHKEEN1dav5O3MqKjwv PHx+DDHylnR/szECiLVNgN+8A/OUwW7iQtn1jEr5yF51vFob0Nsu5cyQPobElt24ezVRvkyv32t m50hcgNJ7pMdEDbpcb7xR86xkT/uFyMqaKHH0CB7vagQOwbTfSqUXc1P6EWBY784agta3PSVgpw
 s3xTgUZ6OWat9oPJriPNB0yNtmmRyjrcESnQQfw3BT+idqBTV4jwPLjvDfrsMQ9agi+c8asp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300109
Content-Type: text/plain; charset="utf-8"

SGkgSm9uOg0KwqANClBlcmZlY3QhIFRoYW5rcyBmb3IgdGhlIHF1aWNrIHRyeWluZy4NCg0KV2hl
biB5b3UgYnVpbHQgZm9yIDYuMTM0IHVzaW5nIFNwaGlueCA3LjMuNywgZGlkIHlvdSBoYXZlIGEg
Y2hhbmNlIHRvIGNoZWNrIHRoZSBvdXRwdXQgb2YgU3BoaW54IGRvYz8gSG93IGFib3V0IHRoZSB3
ZWIgR1VJPyBEb2VzIGl0IGxvb2sgd2VsbCB3aXRoIHRoZSBleHBlY3RlZCBkZWNvcmF0aW9uPw0K
QXQgb3VyIHNpZGUsIHdlIGNhbiBidWlsZCB0aGUgU3BoaW54IGRvYyBzdWNjZXNzZnVsbHkoYWx0
aG91Z2ggYWxzbyB3aXRoIGEgbG90IG9mIHdhcm5pbmcgbGlrZSB5b3Ugc2F3KSBpZiB1c2luZyBT
cGhpbnggOC4xLjMuIEJ1dCB3aGVuIGxvb2tpbmcgYXQgdGhlIHdlYiBHVUksIGl0IGlzIG5vdCBy
aWdodC4gVGhlIGRlY29yYXRpb24gaXMgbWlzc2luZyBhbmQgdGhlIHdlYiBsaW5rIGxheW91dCBp
cyBhbHNvIG5vdCBnb29kLg0KJCBsaW51eC01LjE1L0RvY3VtZW50YXRpb24vb3V0cHV0L2luZGV4
Lmh0bWwgDQoNCklmIHdlIHN3aXRjaCBiYWNrIHRvIFNwaGlueCAyLjQuNCBmb2xsb3dpbmcgYmVs
b3cgbWV0aG9kIHdpdGggZXh0cmEgZGVwZW5kZW5jaWVzIGFkZGVkIGluIHJlcXVpcmVtZW50cy50
eHQsIHdlIGNhbiBnZXQgdGhlIHBlcmZlY3Qgd2ViIEdVSSBkZWNvcmF0aW9uIGFuZCBsYXlvdXQu
DQoNCiQgL3Vzci9iaW4vcHl0aG9uMyAtbSB2ZW52IHNwaGlueF8yLjQuNA0KJCAuIHNwaGlueF8y
LjQuNC9iaW4vYWN0aXZhdGUNCiQgcGlwIGluc3RhbGwgLXIgLi9Eb2N1bWVudGF0aW9uL3NwaGlu
eC9yZXF1aXJlbWVudHMudHh0DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNTAwNDVh
ZmYtOTFmOS00ODA5LWJhM2UtYjcyMmIzMjVkMjMzQG9yYWNsZS5jb20vVC8NCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAyMjYwOTM4NTQuNDc4MzAtMS1sdWthcy5idWx3YWhuQGdt
YWlsLmNvbS9ULw0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1l
bnRzLnR4dCBiL0RvY3VtZW50YXRpb24vc3BoaW54L3JlcXVpcmVtZW50cy50eHQNCmluZGV4IDJj
NTczNTQxYWI3MTIuLjZlN2VkNjQxNzQ3ZjcgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL3Nw
aGlueC9yZXF1aXJlbWVudHMudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL3NwaGlueC9yZXF1aXJl
bWVudHMudHh0DQpAQCAtMSw0ICsxLDEwIEBADQojIGppbmphMj49My4xIGlzIG5vdCBjb21wYXRp
YmxlIHdpdGggU3BoaW54PDQuMA0KamluamEyPDMuMQ0Kc3BoaW54X3J0ZF90aGVtZQ0KK2FsYWJh
c3RlcjwwLjcuMTQNCitzcGhpbnhjb250cmliLWFwcGxlaGVscD09MS4wLjQNCitzcGhpbnhjb250
cmliLWRldmhlbHA9PTEuMC4yDQorc3BoaW54Y29udHJpYi1odG1saGVscD09Mi4wLjENCitzcGhp
bnhjb250cmliLXF0aGVscD09MS4wLjMNCitzcGhpbnhjb250cmliLXNlcmlhbGl6aW5naHRtbD09
MS4xLjUNClNwaGlueD09Mi40LjQNCsKgDQpCZXN0IFJlZ2FyZHMhDQpNaW5nIFdlbiAo6Ze75piO
KQ0KU0RLIFRlYW0gfCBBbWJhcmVsbGEgU2hhbmdoYWkNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4gDQpTZW50OiBX
ZWRuZXNkYXksIEFwcmlsIDMwLCAyMDI1IDEwOjA2IFBNDQpUbzogTWluZyBXZW4gPG13ZW5AYW1i
YXJlbGxhLmNvbT47IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCkNjOiBtY2hlaGFiQGtlcm5l
bC5vcmc7IExvbmcgTGkgPGxvbmdsaUBhbWJhcmVsbGEuY29tPjsgSmlhbiBUYW5nIDxqdGFuZ0Bh
bWJhcmVsbGEuY29tPjsgWmhhby1ZYW5nIENoZW4gPHp5Y2hlbkBhbWJhcmVsbGEuY29tPjsgUm9u
Z3JvbmcgQ2FvIDxycmNhb0BhbWJhcmVsbGEuY29tPg0KU3ViamVjdDogUkU6IFtFWFRdIFJlOiBb
S2VybmVsIDUuMTUvS2VybmxlIDYuMV0gQWJvdXQgU3BoaW54IERvYy4NCg0KTWluZyBXZW4gPG13
ZW5AYW1iYXJlbGxhLmNvbT4gd3JpdGVzOg0KDQo+PiBJdCBpcyByZXF1aXJlZCB0byBnbyB3aXRo
IFNwaGlueCAyLjQuNCwgd2hpY2ggaXMgbXVjaCBsb3dlciB0aGFuIHRoZQ0KPj4gdmVyc2lvbig4
LjEuMykgb2YgdWJ1bnR1IDIyLjA0IGFuZCAyNC4wNC4NCj4gW01pbmddIFRvIGJ1aWxkIHRoZSBz
cGhpbnggZG9jIGZvciBLZXJuZWwgNS4xNSBvciA2LjEsIGl0IGlzIHJlcXVpcmVkIHRvIGdvIHdp
dGggU3BoaW54IDIuNC40Lg0KDQpXZSByZWNvbW1lbmRlZCB0aGF0IHZlcnNpb24gYmFjayB0aGVu
LCBtb3N0bHkgYmVjYXVzZSB0aGUgbmV3ZXIgdmVyc2lvbnMgd2VyZSBzbG93ZXIsIGJ1dCBpdCBp
cyBhYnNvbHV0ZWx5IG5vdCByZXF1aXJlZC4NCg0KSSBqdXN0IGRpZCB0aGUgYnVpbGQgZm9yIDYu
MTM0IHVzaW5nIFNwaGlueCA3LjMuNy4gIEl0IGVtaXRzIGEgYnVuY2ggb2YgZGVwcmVjYXRpb24g
d2FybmluZ3MsIGJ1dCBvdGhlcndpc2Ugd29ya3MuDQoNClRoZXJlIGFyZSB2YXJpb3VzIGZpeGVz
IGluIG1haW5saW5lIGZvciBzb21lIG9mIHRob3NlIHdhcm5pbmdzOyBzb21lYm9keSBjb3VsZCBj
ZXJ0YWlubHkgcGljayB0aGVtIG91dCBhbmQgYXNrIGZvciBzdGFibGUgYmFja3BvcnRzLiAgSSBj
YW4gcHV0IHRoYXQgb250byBteSBsaXN0IG9mIHRoaW5ncyB0byBkbywgYnV0IHdvbid0IGdldCB0
aGVyZSBpbiB0aGUgbmV4dCBmZXcgZGF5cy4NCg0KVGhhbmtzLA0KDQpqb24NCgoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqClRoaXMgZW1haWwgYW5kIGF0dGFjaG1lbnRzIGNvbnRhaW4gQW1iYXJlbGxhIFByb3ByaWV0
YXJ5IGFuZC9vciBDb25maWRlbnRpYWwgSW5mb3JtYXRpb24gYW5kIGlzIGludGVuZGVkIHNvbGVs
eSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbChzKSB0byB3aG9tIGl0IGlzIGFkZHJlc3Nl
ZC4gQW55IHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgZGlzY2xvc3VyZSwgZGlzdHJpYnV0ZSwg
Y29weSwgb3IgcHJpbnQgaXMgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFuZCBk
ZXN0cm95IGFsbCBjb3BpZXMgb2YgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIFRoYW5rIHlvdS4K
