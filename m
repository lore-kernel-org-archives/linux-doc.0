Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8768263F31
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528010; cv=fail; b=pRy+Kf07KSCG1fx/D+vF/O08WhY120XBtJVQkCDNh+55iaxU/40nPOeQ+GZdvuwCGQzNhKgniK6AeSdoEKDmi0OcxmLEijf27GinZYPlakGWyDS+w7FOwkakZwoxgsofKPmW9QRpT47/SEkuuxyp4klT3bMahXLNesDyR0sL4sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528010; c=relaxed/simple;
	bh=PxS3Bvm35iUauoW2sb20DoZ7ULMeDO3cfHs5SYa+ijM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Z77xeyVXg0bmzDgAlE/Kweq8LZqBM16sWY7cF1puknyKP9mWxCEoOvSMArfffTsjXqmiThEumM/5xLVkhRsynzir/t+inqeDSJgF2iwZ8+2WqCdnitNcGWhqigOETGbQ7LZhyXoYPzIiOkUg/YYP6Pd9+no7S5FHMWZLkG7gC40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=eBDLg3Vx; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=FgMuhM0D reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="eBDLg3Vx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="FgMuhM0D"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546A9I0q015149;
	Tue, 6 May 2025 03:39:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=PxS3Bvm35iUauoW2sb20DoZ7ULMeDO3cfHs5SYa+ijM=; b=
	eBDLg3Vxxqq1176kMU7fGosH2Br9qDaOnMsMKN0V7JkZPqieBHXzPHQ21XQZ4kM7
	830/qyBpxrL9CTeJxYBiCeYS/B+WomuRSTTPPo10zdVoVdqES1ImogzYDP+x0AWR
	ziRC9uERtqf96Q1bCsXLKnYBszvpx9vcWIih1qYi38DytRzmDxy/7QTbdh0ZDvne
	oG5FJA7DOm091utVGBRA+tnfHBFQi40ZiPxjcUdTmlNxb8IXj87yDtxM8CBVxc2q
	gL5IHo18/i4NHZcKm2YY//QInkcjWwYOx2ouDyUSJtpxDUuFccar3FpjbucXgwyx
	EQY93JWRU3A7I6KwK/AAzA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46dg4ehhgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 03:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuAEhwcjEG6tLaYmvFwrmDvpbjp4L+kfdDxR/6MPtMZFvkjQsnf6gQNnk9T/zLOOojXO+4kN2jQ0zE8gYi/vR2mOpF+8xpMuyK6rKJG/wtYIlxPynKmdX0hk0G7ecalLnJGI3QMnugEt8hVTw/uWbYu9medNIMZipMQyxutMiH4xpK0wPAg4hCHaw8dymR7E+EfTr9yw2VP7OTwAJF1d3B8B62ZAncISOUhZguwxVcFCvhLFKXVH5zV7gA4RA9c7lC8LsySqQhhpzUGb0xjCfp3leRM9mo7uSYeBvjG7QBJPQ969EUb7PsXnP7k6fYGdHz5w0NwohmUWGFy0m9U91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQMHzs3z/zlJOVwmpS1QH/RtE8kqkENVZ4KIX+FxWq4=;
 b=sCbsu0NvD1A+P1lvsBLdz454ODeYOSSRUa83fAyWplUuhLVCoN/9t5/iyPdkYwU/PA/0CNTTpAAZUAZyRIeGt6+813Di6+BwXTFum33GCqggMmikqkAS8I3qfjHFuhUGxQ1mV9STPv3j15284I8D48AETDrokPVYjZ6EGUNuSm/VpFGKhUfhcAFBbY1eArQtwDRLAuBdnK0DlObPJK49aVjpaNg+/Ap+d7ybVI2xgMybEDT4S760dMj4V8ZGVZtEUKSByzRBp5OXsHPxMtnuaEt5iWtIuT2d/TAPe0rAmtvQM7iZJFlwFSJHt7lGVFVEcrHZg7Qn9JpJIciS7P5w2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQMHzs3z/zlJOVwmpS1QH/RtE8kqkENVZ4KIX+FxWq4=;
 b=FgMuhM0D5GEI7LivHweO4GMR5wJnkwwiHPJRVXGE2mWfXzfcIRabdRt4xvfy1wmZAUkcM54fP1FBbjOK/vx/ilGCKDTwv1kNWKVHG6AGIqBbilf553j3M+HQ4vcaD03w4h/TsyuAYhJ+X8FxPQo9+2MTAm0f+OYod20m+V30oSHMUle6vG1KmmGQblZFix3jH2O2GJcsDMsBZL6RrS5inlNh8iUU9kaWRQ58glRj6Rk53+cGXL+542xZbt1NbYUZMSuzcawKCCBV0Qp1hOPWU4d3nFxIHryToc/lIdMgBpKEdy9oClTFTelW0LD0bkqAwLtx+1B+zE1x+I6GBb4GLw==
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::cb1) by CH2PR19MB3845.namprd19.prod.outlook.com
 (2603:10b6:610:97::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 10:39:45 +0000
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e]) by IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::16c6:139e:74a9:f17e%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 10:39:45 +0000
From: Ming Wen <mwen@ambarella.com>
To: Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>,
        Rongrong Cao <rrcao@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index: Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wAAAQ6JgAACKvLAASRQeqA=
Importance: low
X-Priority: 5
Date: Tue, 6 May 2025 10:39:45 +0000
Message-ID:
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
In-Reply-To:
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF7478C2D3A:EE_|CH2PR19MB3845:EE_
x-ms-office365-filtering-correlation-id: bd1f9ed2-f665-42fc-d189-08dd8c8a5138
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0FoR3J1aE00REg2bkJmR2lGdUpwV1VobURZNnZEVlhFaUxya1d2NE1hYm51?=
 =?utf-8?B?S0xjVVR5Tmp2TjFjc2p2c1ZRWGtkUGhFcUUwMDhCNENJOEh6akdCdnhBdG9E?=
 =?utf-8?B?MEdKVlZ4ai80RkFtWi9UWXVCQTJtU1dyVFRHeVZoWmpRM3pGZlBXZlFNK1Yz?=
 =?utf-8?B?VEw0dHlhVkFJazR3cnM4NERTdEEwanZONi91cWtPOVFHOTdGcVFadk9pL2NE?=
 =?utf-8?B?clZoZGJScnJNUkgweXhUNERUTmtrS3Z3WFhVUFpsUUJPejlwTzhxNVlPV0M2?=
 =?utf-8?B?UDVIbWdpemdKN2VMdGFaOXk1OFdyUDRmVG1iVi9Uc1FMRU54RTlKV0VtR0JX?=
 =?utf-8?B?bnlBM0swWGliTDNBcnNxbks2RGx0SGc2d2ZxT1JXVzdoRkxWVFkxNXRJVS93?=
 =?utf-8?B?dVloVC81bDRUczJMVi9JdWQ4KzNiQmdweHV0bjdwcXdJWkxJV3RFUENCRDFS?=
 =?utf-8?B?Yi9aNlpqazRBa2FmSk5sRW9UYS93cGhDS2hjVm0vbDVQVjRTVHYrQzU0UUM1?=
 =?utf-8?B?azhURldWUTJHZWF3WXJ5MWhBQ21VMExuZWZkUlJZZTNEb1Rld0dUeEtBSlBo?=
 =?utf-8?B?TTRaU2lHNHBWZkZjY3lFNTJzdVpvYUtzK2M1NjNhK0loRjRQRE9qWHpMRGgx?=
 =?utf-8?B?MjQ1NTVHR3M3dW1hekllMlljSFh1QVppdUk2cWc0aU91WmNkWUEweTB2cHFK?=
 =?utf-8?B?MTdrc29tRWtXWDRRclVVY2srYU92REtPYUNZMzlobUs0a2xranNGLzNreW9I?=
 =?utf-8?B?ZCt3VndoRWxjSnM0MDdTZll5YnI3N3pkdDc0L05SSUtHT1VReEJZUXRiYk9X?=
 =?utf-8?B?NktBTkprSGFpa0l0LzMyOU1vTDVEZkl3YWlUYXk2dzUweXVNWGZkT2Y5c2RT?=
 =?utf-8?B?R2xEcXpwSFVzR05ZRnFXSDRaWGt3aUtNSmFhWjFxV3NjNDdlRGJqMUpsUTBD?=
 =?utf-8?B?WDNxWnRsc2VPcDRjUUkrZW91bHNadkcwcW03SStlRWgxdStVZ1FXenNDUFJX?=
 =?utf-8?B?UW9lUHNIejd0dW54SVpXRS8rU3B6TlR2c3czdDZqYWtldlBNblRyOGJGOXRm?=
 =?utf-8?B?THEvSXVvZkI5RzRVYmFEYXpLL0dSVDREQ3IwcFR6UlJBM1NidkdHUWZPdWQz?=
 =?utf-8?B?Yjl6akRoVlFDeVFvUkxNdXpOcUNLdkNwVytRZE9UakJ3c3FLMU5kUjRYajVF?=
 =?utf-8?B?NFQ4ekpRLzYvTDVIOUVJem04d3hWdzMycUJyb284MURJcThNL2prZjdNZE12?=
 =?utf-8?B?bkloZmZxQ0xsVmNoL01TY0Fyd3lWeUZLT0dVMmZUdXF2RVlVSjZmUEZMOERP?=
 =?utf-8?B?TFhJL0hvUFdVYXVmTWQ2TStDTWxRTmtsK1ZVdVhYd0dDWjEvZFhQSWVtUEhM?=
 =?utf-8?B?T2d5cUQybjFPUmNjM1hHWUV6NEg2RG8rYjlUNWE2dDg4dnpYYjhGd1g3OWFp?=
 =?utf-8?B?dlNkMzU3a3pZQmQzZXI2Nkh1cnZPQTlCRWxaWFdNTDJxMG9CSDdIZm12cEQr?=
 =?utf-8?B?SVdnbmp1cE5hRHZoT25oOHN3SEYyYjZJNGxHTDRteVZWUWIvZ2RZTXNnQ3JD?=
 =?utf-8?B?cmRSYTgxVzRMZ3dnTlpNY2ZTeHdYZkFjVk9NUENZYjJDMUpuOUljV0F2Qlor?=
 =?utf-8?B?T2VzcFcyS05JQTRQbGJtNkN3czBRRGNqdWFqRmZnaENwOU5ETGRrY0RVUmdm?=
 =?utf-8?B?U3R6cHB2UFRSK0FGY2ZidytyZ3hlUXdnSjhGRFQ5ZE5LN2ozdmhDb2ZtcWht?=
 =?utf-8?B?b3FDOG5WbVIxbk10ckYydkNWQzVXU2xPenRTRjd3TnR3ZE0rZUtWQUlHa1Jo?=
 =?utf-8?B?bEpYNVM0VGMwNXJzOHI2dnZsMXR1T1h2RnU3ZXNUQ05UWlZsOFYxdU9xekJU?=
 =?utf-8?B?aDZNMy9uTHdzUUtzeFgzY0t3T2xSbXF1aE0wN2FNZDAxUHRobUtDVkhCNVF0?=
 =?utf-8?Q?xygDyD5hWGA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF7478C2D3A.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T29rYmdlOW1IZzNxWkc5d1NjTndLSXdwUUhmMnU5SzN5bms5QXJkQUdDK092?=
 =?utf-8?B?QURwUDArSWxlZXFkQ2FoYU5OUW1JejdIaWY3Vm01cEJkS1lZeGFCNG9sL2pM?=
 =?utf-8?B?MjhqREpxYVcxQ1hlTERPUlJMK0V1MlVZNG5zSm1kY2EyWkJhamVBdmRlTTY0?=
 =?utf-8?B?UGJOVGlOWGFNdEFDRjc2aFhORGl0SnRzT1hMZm9iTmNhNEhpVzdKWC9CZEJH?=
 =?utf-8?B?L0pNNXFSSCswUGQ5MnlVWVZlVTZWT0grLzlGNTdZa3hDeUZxaGtPcDFsR0xr?=
 =?utf-8?B?RXllUXR3ZHBiWDIrOWprTlkvTVE0elA0ZG5kM0xjZHV0cG9JVVBISUltYy9x?=
 =?utf-8?B?STdHTnl4T2x1WS9ZdXVCSGNCYlF3UzZ4eEFoRll5alM2OVdJZWdtZDNMTWtZ?=
 =?utf-8?B?QW52REJwMlBPQmFWaUpJQjkvOU9yZlU5WFRaMnNzL0dkeHhtaFJBT1BBcEtV?=
 =?utf-8?B?dTJTdlgxc1B0L1FGak5PNVVsOE9SV0VVbWx1V0x5Q3ViYXhBUE9BVHpJRHZo?=
 =?utf-8?B?bDZ4SmVzSkNuZ2hxTFZnMlc1LzlJbXg2MUdwM1BFSWJwYTlSVEl2OUh0WnA2?=
 =?utf-8?B?VmcwNGV5UTR1Mnhoa0FzdlBGUjFhZURZU2NEN0Jrb2NBbXpjb0VDV3NZK3Nu?=
 =?utf-8?B?aEozOXowekRDMVZHSjhYYktrdVF4aFZBOXZiVnlocklBZTh4ZHliZzI3MThm?=
 =?utf-8?B?ZHpMSzNEWS9kdmxhSjBnWkdRL0E0cVZDQWJ0U2VVblVESndpUGpXTDg5TEhu?=
 =?utf-8?B?bVVsSWRQREgzd1kwZnpxaXFFVXplZDlBVFM5eEk3MlpMYURCZlJ1MjkvNTMr?=
 =?utf-8?B?by8wcXNFTENjdHlkZEIvWFUvdHZyajdGK0hVeVZOWjJweDFxeThmZ3ZZaGZR?=
 =?utf-8?B?eGh1SG5XaUpiZ2xJeTlJNW9URVZMeGI5LzJkT2Fsb3RZVlRGdmkrRmFxWGJV?=
 =?utf-8?B?Ylcxamh1Wlo0dHJzZHFrWGNXMDZ5VXYrd21WNVdZd3pkaGU0TGxnMk5OWWov?=
 =?utf-8?B?OVBUR2dKWkJYV2FrTUZ6UHBCeW82YWYvdkNVUGk1cHJsc0VRRWxuSzVRWm5G?=
 =?utf-8?B?czlSbXFWUDI1SjA3VDkwdHNsNXlTT3ZWdlVpUFptK0dQcXN5bm1Ecmp6Sllk?=
 =?utf-8?B?R0s1bnJ4NzlkR3d5T0kzaDFNOFExM3FIZURRTk9ibDZvODBhUUJtRHViNnJa?=
 =?utf-8?B?K3NmU2djU2RaSXVUcVo4WVQ3Q0MxVlhVa1J4T25qR2VKZjBPSXkzL1BaU29s?=
 =?utf-8?B?NFBKU0h5cUUvRlpUcWpWdUpwQld1cHEyTEd0b1JLMHR4bXo2YlNwV3kzaDhu?=
 =?utf-8?B?bmNyZ3QxRFB4NmNnd3FUTTUxTG4yby9Sb0RhQ2ljQTVUZXJ6TDVZN05ZREFj?=
 =?utf-8?B?OFY2Mk1odXdJNjZGSzdCT0Ixekh2RzlacW5ndktITkl5ZGdIdVdwekxnWkRk?=
 =?utf-8?B?N2k4YmNuR2RJZTd2ZVdBWDBTMnlBK0ZiOC9EL0RIT3NuNmpCSW9SQitVMkFS?=
 =?utf-8?B?dkFHelo5M1VQdW5jWnhjZ3ZBcmdsOGVUV3E2bXJhUzNDc3Q3NWg0MzF3NUx6?=
 =?utf-8?B?bytFSTIyeGFpczVSWEkwY2J6Tm14UEZOU0pvVFBWQytocCtoUTNveTZnb1RG?=
 =?utf-8?B?UkFZZFU5SFRiYlYvZkxaeWNDb2R6SXB6dlNGa0dNTUx1a1FtL09ldlBRS0c1?=
 =?utf-8?B?cDJVOEZjd0M2TmhBNW1jKzlpa0xEbFEvdVJ5S1hBcjNNTmlqNklaM2g1VkFM?=
 =?utf-8?B?d3RIOVBQWTZKSi9Sa3lhMDhFL1ljamZuaGQ4Qk5FdlVDbll0eUwwUU9qcnhB?=
 =?utf-8?B?YlVocHZiVXBianpmSVlvUHRlTXduWXhRNXdkV0duS0p3UUlPYTZqMUFyVi9W?=
 =?utf-8?B?cGd2WEI5RzV3aGZ4MTlXc3gwWkJyU0RFUTE2ck43SHRLb0NGL25jRW9pMHIz?=
 =?utf-8?B?WTA1TEV0OURwTnRWQyt0ZUFWUkpaTVFMRzB4cGU1S3FlM2JXYWhUdDlTS0pn?=
 =?utf-8?B?cllnRWVtYWZxSGJXTUYvS0pDckpUMUxJaHNWQy82alpDZFZKTE5GWWcySHdM?=
 =?utf-8?B?MUNvU2QwbzNmRDF0dXJLaXVyT2RUcHYwMXlkbzJEalYwUGJwV1ZSbFR6RzlC?=
 =?utf-8?Q?z748hdd2Js8K0mjNAclvhDdQu?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1f9ed2-f665-42fc-d189-08dd8c8a5138
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 10:39:45.2371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeaDBJMMU7LtUk5sIC0ZRANdfrkIQN1zxZMyLoiQPu4pDHwvrS1YdEwVw1KAl3mpb50fUpsGbAzstcoBSxisSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3845
X-Authority-Analysis: v=2.4 cv=SsWQ6OO0 c=1 sm=1 tr=0 ts=6819e6f7 cx=c_pps a=YTelpZo7+Gv92UPfPuytLw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=dkMdDuzY2HgA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=07d9gI8wAAAA:8 a=ppJngBeKAAAA:8 a=PpaX1VbUAusiNUV2x3sA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: 6ZzUs5hWtLCwKX-TI_2SCNggFHnhPmGk
X-Proofpoint-ORIG-GUID: 6ZzUs5hWtLCwKX-TI_2SCNggFHnhPmGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwMSBTYWx0ZWRfX8PdkN2IQqzdX O32mHddWCUb/MamCqZGZSsbofuH1O2OaTBEkxg9E0/s2ouUhgGkxonpq6nRMWkzgPRYQPWoqg2h hOle4HsWOw8hqC5BN9hNAICyR1GbsPZrHrVSzpp1QIuSU1Sin5xve/I08pg1cY8NpEVhuqDXfBO
 oXX38HSXdVQjlsz5EUspVlGzHTNXYTpqL733/lQIWLRtaWzm3Hppg9iTwECXlKUfOf1axNmSL+J GkiJvBnKgqYohkQk2CJXn4Bsb9yVFMChbIlmnMxG8o9stGiMZV7dbeoRVEJGpVSYax+olHGsxe4 xHUBPPcrQTixztxx+8TAw2GpSIf9eEYs8aVhEmpLkHFU0puY9nhvChjFqAND2eMgG+U/ghwBpcz
 2rMOtcdxL2bTLHLGDhgoYvDyIO8weL2Eo2XJGLmusCp77CI/Y9cwiWYPdnZj3Rh+b1X318a/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2504070000 definitions=main-2505060101
Content-Type: text/plain; charset="utf-8"

SGkgSm9uOg0KDQpBbnkgdXBkYXRlPyBEaWQgeW91IGhhdmUgYSBjaGFuY2UgdG8gY2hlY2sgYW5k
IGNvbW1lbnQgb24gYmVsb3c/DQoNCkJlc3QgUmVnYXJkcyENCk1pbmcgV2VuICjpl7vmmI4pDQpT
REsgVGVhbSB8IEFtYmFyZWxsYSBTaGFuZ2hhaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogTWluZyBXZW4NClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMzAsIDIwMjUgMTE6MTYg
UE0NClRvOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgbGludXgtZG9jQHZnZXIu
a2VybmVsLm9yZw0KQ2M6IG1jaGVoYWJAa2VybmVsLm9yZzsgTG9uZyBMaSA8bG9uZ2xpQGFtYmFy
ZWxsYS5jb20+OyBKaWFuIFRhbmcgPGp0YW5nQGFtYmFyZWxsYS5jb20+OyBaaGFvLVlhbmcgQ2hl
biA8enljaGVuQGFtYmFyZWxsYS5jb20+OyBSb25ncm9uZyBDYW8gPHJyY2FvQGFtYmFyZWxsYS5j
b20+DQpTdWJqZWN0OiBSRTogW0VYVF0gUmU6IFtLZXJuZWwgNS4xNS9LZXJubGUgNi4xXSBBYm91
dCBTcGhpbnggRG9jLg0KSW1wb3J0YW5jZTogTG93DQoNCkhpIEpvbjoNCg0KUGVyZmVjdCEgVGhh
bmtzIGZvciB0aGUgcXVpY2sgdHJ5aW5nLg0KDQpXaGVuIHlvdSBidWlsdCBmb3IgNi4xMzQgdXNp
bmcgU3BoaW54IDcuMy43LCBkaWQgeW91IGhhdmUgYSBjaGFuY2UgdG8gY2hlY2sgdGhlIG91dHB1
dCBvZiBTcGhpbnggZG9jPyBIb3cgYWJvdXQgdGhlIHdlYiBHVUk/IERvZXMgaXQgbG9vayB3ZWxs
IHdpdGggdGhlIGV4cGVjdGVkIGRlY29yYXRpb24/DQpBdCBvdXIgc2lkZSwgd2UgY2FuIGJ1aWxk
IHRoZSBTcGhpbnggZG9jIHN1Y2Nlc3NmdWxseShhbHRob3VnaCBhbHNvIHdpdGggYSBsb3Qgb2Yg
d2FybmluZyBsaWtlIHlvdSBzYXcpIGlmIHVzaW5nIFNwaGlueCA4LjEuMy4gQnV0IHdoZW4gbG9v
a2luZyBhdCB0aGUgd2ViIEdVSSwgaXQgaXMgbm90IHJpZ2h0LiBUaGUgZGVjb3JhdGlvbiBpcyBt
aXNzaW5nIGFuZCB0aGUgd2ViIGxpbmsgbGF5b3V0IGlzIGFsc28gbm90IGdvb2QuDQokIGxpbnV4
LTUuMTUvRG9jdW1lbnRhdGlvbi9vdXRwdXQvaW5kZXguaHRtbA0KDQpJZiB3ZSBzd2l0Y2ggYmFj
ayB0byBTcGhpbnggMi40LjQgZm9sbG93aW5nIGJlbG93IG1ldGhvZCB3aXRoIGV4dHJhIGRlcGVu
ZGVuY2llcyBhZGRlZCBpbiByZXF1aXJlbWVudHMudHh0LCB3ZSBjYW4gZ2V0IHRoZSBwZXJmZWN0
IHdlYiBHVUkgZGVjb3JhdGlvbiBhbmQgbGF5b3V0Lg0KDQokIC91c3IvYmluL3B5dGhvbjMgLW0g
dmVudiBzcGhpbnhfMi40LjQNCiQgLiBzcGhpbnhfMi40LjQvYmluL2FjdGl2YXRlDQokIHBpcCBp
bnN0YWxsIC1yIC4vRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1lbnRzLnR4dA0KDQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzUwMDQ1YWZmLTkxZjktNDgwOS1iYTNlLWI3MjJiMzI1
ZDIzM0BvcmFjbGUuY29tL1QvDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjI2
MDkzODU0LjQ3ODMwLTEtbHVrYXMuYnVsd2FobkBnbWFpbC5jb20vVC8NCg0KZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vc3BoaW54L3JlcXVpcmVtZW50cy50eHQgYi9Eb2N1bWVudGF0aW9uL3Nw
aGlueC9yZXF1aXJlbWVudHMudHh0DQppbmRleCAyYzU3MzU0MWFiNzEyLi42ZTdlZDY0MTc0N2Y3
IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1lbnRzLnR4dA0KKysr
IGIvRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1lbnRzLnR4dA0KQEAgLTEsNCArMSwxMCBA
QA0KIyBqaW5qYTI+PTMuMSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIFNwaGlueDw0LjANCmppbmph
MjwzLjENCnNwaGlueF9ydGRfdGhlbWUNCithbGFiYXN0ZXI8MC43LjE0DQorc3BoaW54Y29udHJp
Yi1hcHBsZWhlbHA9PTEuMC40DQorc3BoaW54Y29udHJpYi1kZXZoZWxwPT0xLjAuMg0KK3NwaGlu
eGNvbnRyaWItaHRtbGhlbHA9PTIuMC4xDQorc3BoaW54Y29udHJpYi1xdGhlbHA9PTEuMC4zDQor
c3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWw9PTEuMS41DQpTcGhpbng9PTIuNC40DQoNCkJl
c3QgUmVnYXJkcyENCk1pbmcgV2VuICjpl7vmmI4pDQpTREsgVGVhbSB8IEFtYmFyZWxsYSBTaGFu
Z2hhaQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKb25hdGhhbiBDb3Ji
ZXQgPGNvcmJldEBsd24ubmV0Pg0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAzMCwgMjAyNSAxMDow
NiBQTQ0KVG86IE1pbmcgV2VuIDxtd2VuQGFtYmFyZWxsYS5jb20+OyBsaW51eC1kb2NAdmdlci5r
ZXJuZWwub3JnDQpDYzogbWNoZWhhYkBrZXJuZWwub3JnOyBMb25nIExpIDxsb25nbGlAYW1iYXJl
bGxhLmNvbT47IEppYW4gVGFuZyA8anRhbmdAYW1iYXJlbGxhLmNvbT47IFpoYW8tWWFuZyBDaGVu
IDx6eWNoZW5AYW1iYXJlbGxhLmNvbT47IFJvbmdyb25nIENhbyA8cnJjYW9AYW1iYXJlbGxhLmNv
bT4NClN1YmplY3Q6IFJFOiBbRVhUXSBSZTogW0tlcm5lbCA1LjE1L0tlcm5sZSA2LjFdIEFib3V0
IFNwaGlueCBEb2MuDQoNCk1pbmcgV2VuIDxtd2VuQGFtYmFyZWxsYS5jb20+IHdyaXRlczoNCg0K
Pj4gSXQgaXMgcmVxdWlyZWQgdG8gZ28gd2l0aCBTcGhpbnggMi40LjQsIHdoaWNoIGlzIG11Y2gg
bG93ZXIgdGhhbiB0aGUNCj4+IHZlcnNpb24oOC4xLjMpIG9mIHVidW50dSAyMi4wNCBhbmQgMjQu
MDQuDQo+IFtNaW5nXSBUbyBidWlsZCB0aGUgc3BoaW54IGRvYyBmb3IgS2VybmVsIDUuMTUgb3Ig
Ni4xLCBpdCBpcyByZXF1aXJlZCB0byBnbyB3aXRoIFNwaGlueCAyLjQuNC4NCg0KV2UgcmVjb21t
ZW5kZWQgdGhhdCB2ZXJzaW9uIGJhY2sgdGhlbiwgbW9zdGx5IGJlY2F1c2UgdGhlIG5ld2VyIHZl
cnNpb25zIHdlcmUgc2xvd2VyLCBidXQgaXQgaXMgYWJzb2x1dGVseSBub3QgcmVxdWlyZWQuDQoN
CkkganVzdCBkaWQgdGhlIGJ1aWxkIGZvciA2LjEzNCB1c2luZyBTcGhpbnggNy4zLjcuICBJdCBl
bWl0cyBhIGJ1bmNoIG9mIGRlcHJlY2F0aW9uIHdhcm5pbmdzLCBidXQgb3RoZXJ3aXNlIHdvcmtz
Lg0KDQpUaGVyZSBhcmUgdmFyaW91cyBmaXhlcyBpbiBtYWlubGluZSBmb3Igc29tZSBvZiB0aG9z
ZSB3YXJuaW5nczsgc29tZWJvZHkgY291bGQgY2VydGFpbmx5IHBpY2sgdGhlbSBvdXQgYW5kIGFz
ayBmb3Igc3RhYmxlIGJhY2twb3J0cy4gIEkgY2FuIHB1dCB0aGF0IG9udG8gbXkgbGlzdCBvZiB0
aGluZ3MgdG8gZG8sIGJ1dCB3b24ndCBnZXQgdGhlcmUgaW4gdGhlIG5leHQgZmV3IGRheXMuDQoN
ClRoYW5rcywNCg0Kam9uDQoKKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgpUaGlzIGVtYWlsIGFuZCBhdHRhY2htZW50
cyBjb250YWluIEFtYmFyZWxsYSBQcm9wcmlldGFyeSBhbmQvb3IgQ29uZmlkZW50aWFsIEluZm9y
bWF0aW9uIGFuZCBpcyBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1
YWwocykgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQuIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1
c2UsIGRpc2Nsb3N1cmUsIGRpc3RyaWJ1dGUsIGNvcHksIG9yIHByaW50IGlzIHByb2hpYml0ZWQu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhl
IHNlbmRlciBieSByZXBseSBlbWFpbCBhbmQgZGVzdHJveSBhbGwgY29waWVzIG9mIHRoZSBvcmln
aW5hbCBtZXNzYWdlLiBUaGFuayB5b3UuCg==
