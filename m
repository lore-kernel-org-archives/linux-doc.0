Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0254325C802
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020855; cv=fail; b=nQ0zc2uG0cl68mlCI8LYe7e8LiCwGMlg12yWgxFbEBLhEWLEKliNs54DHiKTT9JMBxM7deDdWe0eeHvC9xdg5MacJhdjtihlUoDpKzDRzzadJ2oAgj4QQMGz5p0r3tgvPj0R5n1eDsHjvJPKLhOMkcqpbzrCrhoYjoiK8DekcZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020855; c=relaxed/simple;
	bh=SR247PXObrcIbDrc64WtMKoMui/CjnAw9TQ5PouKWNM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Lo65kooie7RwembMKqjUfTOtWAg2Fj2AN6/pcf3Umt0hVDEtWqUEB2bBnMPFji3rYXC6pkRmLT8eFLqgymlsUPsXtl2CFNGT3D7dhhKzsITyAu95OegtXJ3OD9DwVyaNz+X1MFZfOWT0RIkIIH9I9LvaSbD2K3X8bsrfj8rdbVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=MCUyoRo7; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=D2OdpOe/ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="MCUyoRo7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="D2OdpOe/"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCt45B001049;
	Wed, 30 Apr 2025 06:47:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=SR247PXObrcIbDrc64WtMKoMui/CjnAw9TQ5PouKWNM=; b=
	MCUyoRo7d4D48t/X3VKCmhYKSgBcDetl5Eght/ucSING1BIy/8DPGdxwZTmeUERB
	JP5gbe0UKUGBNVb4aD/SGuk7mQ/8+VlzTro/HwCpTGqxetH/jlKaWDXcSGMBYldU
	n9rYNYD5R5ZxAYuET1ISG1CXmAp9Y2khqfDSYSrFOJKBY8VX81xm/XOE6nOqNXOS
	k7FohHht2Xfqt07BZ13hlWmzpOMyZsl7KbuxsuBD+pyC/ajQXx7wwShlOeOszl4S
	Ei1ITM2ZA/p72fygRMaER2HmSnQdrh730Lhtl33G0B1zBtqUCLyvQrRY7XtfQJUh
	dZaQ7k6qVpzaq9GVs7jDbQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46b6tx0dcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 06:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/cRus1MfxiQ5vTopUAf2NSPC4otPOnrK+pjOnqzs0bZM4SpOCiWa6O3CRFOO28LLiuqJe0dcSXsMWhh1DL3gGWqB7y+4nk506EtYbJHKxLMiCPPG89NpBzMJuaVJk2tEYBpZzX/axeDnwnUXRgyfmeoXDNrm2jSa13VZqnWGIDkLLZoMs2+QkI9f4yIvGhEljd1O5njmv7jrQpgQo1+PPPwY9d20hDJh1OYMb4coAvQOitO244UjA0bhBsEmhmDoNSP5f/NmeQjsuppIZ2OAyj/eTyvhgKJIE6G5CGiUABlqSQB3vyLMwtn6NYexF/jBDDSSetSHngByMMSmTJWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6CBT81Ve2S4dFHF/GdjC+FIjXIK4QhxkgDxY1x2rrY=;
 b=JH9O4sUpPSRd1tgj8aG8gW5/6LZ+KpA4634bsbclS+iWcEST44lHr0x3iHcA1R/Qsl/PdemJIU0QeqCJNaJr7dpAewiqWBCpF4OV0ggFU1GLTy6a0lWhw85bOJ/+2O8PKtWnFP/A9P4BOx5/RSjPLHze0FECSdhBPE4V7DZoRwPu7QIz12luBc3SvKVJAJoWYOnBCgE/1VLFMXE37zBpEn9JaTJ5k7z20Qk8mkQk/hq38RtYzuaOifa2wXtKjDQsOm6s3KO+eyHQTdZuLm5kDA2DZ4S1kEFZcp0+fdzfdaMQFpNYL7mwHFUWNnwOmZe07lnm0Yp8Dsir4Kj7SsZDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6CBT81Ve2S4dFHF/GdjC+FIjXIK4QhxkgDxY1x2rrY=;
 b=D2OdpOe//EhjjTo+JLWzG20dzgeHlMuA+4GrUx25EmBJaJ/L9nOiEMz2Rlhne+OjOuyESJEouejmeHxeTWugaxJw8L60dLITyTQrhcz1zzFnQjVTHhvjmST2FB2AQ1R+cHN/dDNksimAUoeDl08IEErbkR+OIfgyXfH80BK4eh92a7TqJlEM9H5FpgkE3A/2wFcjma1e3+FW613jVPXQsyxqHw1MaXwjYbAnVe2FhL0r6GVB6OiQ9YWE5zFft48hLIfPlbvEwlBL3iPg7n6HaAvc0nBXca+gAq6uhA0pERKpl1cv6eAUYg7/QLSNbTDcYlwdj0I8Gpe3oDNxBCm4Zw==
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::cb1) by SA0PR19MB4636.namprd19.prod.outlook.com
 (2603:10b6:806:c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 13:47:12 +0000
Received: from IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::b5a8:7a73:b555:1e87]) by IA0PPF7478C2D3A.namprd19.prod.outlook.com
 ([fe80::b5a8:7a73:b555:1e87%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 13:47:11 +0000
From: Ming Wen <mwen@ambarella.com>
To: Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>,
        Rongrong Cao <rrcao@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index: Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wA=
Importance: low
X-Priority: 5
Date: Wed, 30 Apr 2025 13:47:11 +0000
Message-ID:
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
In-Reply-To: <87jz71lstz.fsf@trenco.lwn.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF7478C2D3A:EE_|SA0PR19MB4636:EE_
x-ms-office365-filtering-correlation-id: 3394af88-1729-4486-58e5-08dd87ed822b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Sk5wVDZMRm5aUVBuQTZaa3ZYblFoUnFZUjkyMGVwKzZMcHJRR3pLamhrSHVt?=
 =?utf-8?B?RGR3WEtiMERBR1RCV0dzUDUwYzB1REIrM21mbFlJSy92eGRjdks3ODVqem9D?=
 =?utf-8?B?K1kxOVlvM0ZYNC9lR3UvTW15L0o4VUlObWEwUDJ6d2RTVW5UdmN0RER1Tng2?=
 =?utf-8?B?WHNzckNuQ29OZmNaL2ZTR05qa1AyQUFhcUxzNzB0eitJQlJFRHB6blIzeVdZ?=
 =?utf-8?B?elcwQkRJKzNIWW1ZcDdwRWgyT3JXcDU2M0NobEpkU2NIT05HK3dGc1UxWFJa?=
 =?utf-8?B?ZHRpZjFaa1JRV1lrWmFiYnVJYk9QODQ1elh0WEFNYXBPNXpUc1BFeVFYTzNh?=
 =?utf-8?B?L2Fxcm9xYlM2YWVJUTVqSmd2ODI1RHJvNWg0UnAwQVIrUmdaelVxbWtBNG12?=
 =?utf-8?B?MWlRYzQzRmhqSGI1OE9yZzJnaEkzeWdTYzhxZjlaQ1VsUXVDNm1VUnhLRmpG?=
 =?utf-8?B?RlVDNmcybTZkYmNmaXgzd2hwTllUOUsvSmdWTThqUjdyN3dwNmF0TVlQWGk2?=
 =?utf-8?B?USs3eGJCdURtMjhqbzdHemt1a1Zub0JQb3lzaVI5L3ZhVG9BaHRqMml5enhF?=
 =?utf-8?B?RnkxN0lpRWRvcnJoRGZ0RXkrdWpmVFZaaS9rSlpNOXI3eHZMZmJabVFNZ2FY?=
 =?utf-8?B?Vk52ZzY0Q0ZWN1hCWVczdEZuL1pkMC8yK2VQdXlacEJwRzdBbzN6UVhFQklT?=
 =?utf-8?B?cGNnUjlsbkdqL2U2dWJSU0YraThPa2U1b3pMem9kQmxoSWZUSTlMWUpNZVBU?=
 =?utf-8?B?ZENNSGRRdXh4RnFTZlQ2cUJvUDY3eU15M3YvZHFXNnFnUEcvcFNUamRoblBr?=
 =?utf-8?B?ZFNzbTg0U3o4ZGJQNlI4Y1pYaEJjMHd4WHFmRkNSbGVNZlNGVzQvekJFNXJN?=
 =?utf-8?B?dVpzdVYrZ1pPRnR5YlBXQ1l3UURLL2NYYU43UDMzQlVFcmpia0V2akRDeFRm?=
 =?utf-8?B?RUVqcW1hVGN1Q0pEd2RFR1V2ZlZkKzJuZmJ6T28xTnZNOGkxL2NYenZUbTlp?=
 =?utf-8?B?TzRRSXBqcHlqOUFXdW93TCtZV1lUMElSM3dEbEx3OExQNnpoTXRCeHVwaHRv?=
 =?utf-8?B?ZWdjVFBJZGNiK2UyNHByTjFsRy9iVjlPeEVhNjhkNFhBd3ZLWHkwR0FzZ1FF?=
 =?utf-8?B?UWhMWTVRSEtObUV3ZFRGNnN5TCtPbHFyUktiWDBUQ3dNV1o4MXhCYkFlNVFj?=
 =?utf-8?B?VDFUVmlRc0dIOHQ4dW8zQWk0YmlDbmdGTlFHNnBsVThqUHhvOXVPTE82TFd1?=
 =?utf-8?B?ekcybFNUYS9NVlNTVHhLOEhpUG1pNktxS0lhN1ZSMWJpQnBVcFY0U2tFZ3Jy?=
 =?utf-8?B?Z20zSHFOV2lOQTVIYVA2dVl3WmRNMHkwTkR6a1cxVlNIWDFhdWxPVFRSMEV3?=
 =?utf-8?B?bXlrNkpqRkd0bkVDNHZsSHhkMUJoTk1pZGlPL05uWDU4NnNYNE1OVVVqR1c1?=
 =?utf-8?B?YTNKbUpSdDNwTWFMRHFaVndrMm9IYWljc2lRRWs2eGJUd01BMXlaTjRBNTZu?=
 =?utf-8?B?QWFTczZFanJ1MkFSdTdiVEtDN3pManlqN2hGZERHQ1g3SG5obW1YNnoxQkx5?=
 =?utf-8?B?VTdrVlJocEZPQlR1bDZxVmNvcVprWmRUbjA0NEVIQ2FDcTltYWxneU9kQitL?=
 =?utf-8?B?aHVkOUxRaUdwOHlNRTZuRThHSVZLUDgrUUt4KzlNanhtN0dwaUg1M0Z5VEVk?=
 =?utf-8?B?c1hYeEJaQTdUL0JXTkFJYW90cGlEeHJFTzVBeTBKZWNEVWsyV1NzVzN4NmFT?=
 =?utf-8?B?SWJtOTRIRWdFajRFNVI1cHJMd0RmQjRkN0RPVEE5NFBneWVlcnJ2U3ltaXlK?=
 =?utf-8?B?a1pwWDhuVG9CWFdVaXpLamVMOHZkbWZIUitLMG9yZUEyUFQrZEd1V0NwNzFT?=
 =?utf-8?B?TlB0TnhPaDc3elovWVN2M0xPazBpcUVtSXY1SUxhVVFpSWNsZzRybDBIZGtv?=
 =?utf-8?B?N0NpMFExUGgrSTBiTDh1UnJ4eXU1SDlMZTQ1SUFTN3hBTGdPSkFtQk90ekZR?=
 =?utf-8?Q?zhZH8Z9NhA51t9jvtvIYTluceHbdcc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF7478C2D3A.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmFwdmM3NXo1TThDRTYrb2tBak5DRGljVysxMEg0SERnTzJlelRlQ0xHd0ox?=
 =?utf-8?B?V2ExalVteTVtODkxZURpVGlJRERyekQ4MFQrUmlxeko2WE14eElDUzEvR2Fm?=
 =?utf-8?B?eW1JQTI5bDlCUGQzUDNhZjRXaFdMeDg5VWxENFFIL1hyczRQOXVTanBBOWdu?=
 =?utf-8?B?UTltY3hJSEgzMDhXZ2x1YUdPRHFGQkdWL2wxbkVDSm1oQmR6VE9vdWRzck9l?=
 =?utf-8?B?cWxjeDcvN1kybTRYbzNCQko2dkNTbTFNZlEwVE4xRk1iMXE5eHpYVVJENnBr?=
 =?utf-8?B?S2ZjUVhpT2NpZU9NSktCdXRmREF3N3BhakcxZlpMS2thYVRPMXdiLzlSckFn?=
 =?utf-8?B?bWdIY0VXc3ZtU0UzTktDZk0rSk55VlVLL2ZSQjBIWU91NHVsdjk3THFnKzdN?=
 =?utf-8?B?RGVwU1VuRUdIMDJ1ZzNmMXl0b0xDMURrb3NOL3Q3Y0RDdXB0N0lVeFpKbjZF?=
 =?utf-8?B?cVEvY0Z5TjdYNFlKRVFidmcxRndHYmEyWkgreFY3NksvU21ubmR6WWRYMi9B?=
 =?utf-8?B?bWFTVGs1QnRJQ1J6NkF1eis3RDhOcmxEYzgvemFtSmFFYmNoenF5UWhVWTRw?=
 =?utf-8?B?VitiVVVvZld4UUY4K3gzZkM4cWhyZWRKRzhGQ3NVRUN6VGo3N3RLWnRuTXd2?=
 =?utf-8?B?R04vOTdRWCtCZFc1aDgxaWFpS2grODlCY0l6ZGFjbUYvVDdRRzVGOWJaTlNl?=
 =?utf-8?B?QkZVRUhadUdLdDZwWjMwbzMxUm1aR2dxL04vTWd0elJRU0dlMGRaVUtkVVBQ?=
 =?utf-8?B?a2puMnRESnc4UDROUzkvbzA2TGRuZ3BVWlRiRTR2OWNTaS8rNjNUSHRWUHl0?=
 =?utf-8?B?RTBNQ25JQXpEMGJWQ0RydVNJMnZySk9rak1XcjB6RlI2YnlhSWloNFgrdGFa?=
 =?utf-8?B?d1hCU0h6d0xLdlNSNUlWd05sWWl0bTRQejhqWkw4K1piYm94NWoxYWtzWnRx?=
 =?utf-8?B?aFpZN3ZjUEs5QXVHYnZhL29ibmFaeFJoMmlheWRvOHlwYVh2czJURG9vNDZt?=
 =?utf-8?B?Z3NtZWlVbXNDa0k1c25LNVFBYlE0aklQK3hFNURpa1hESHNrOFJ2enpjMWhm?=
 =?utf-8?B?ck8wWVMvVFBpazZaU2xnSmp2U2VVUHlwNXVuWW1xUTRZZTJ3RFdTUnVvMVBE?=
 =?utf-8?B?VW1GQ2lPUGFOdlkyMWxiQzhkNTk3MGNOa1J6WnR4aE5GVDZueXM3eGxCQUJQ?=
 =?utf-8?B?QTFlck90QXBvK3diRk1NRFJ6Z2gwdzlvcUZhN1pjUytFYTBmVXFHdHdmcld3?=
 =?utf-8?B?V3hxaVc3SjczcDlMc0RNSzdvdEE5YVdicnNJY0o5RnFXeVd6Wm1ocUtqdWt0?=
 =?utf-8?B?SjZaM29td00yYk51dWgrSTY0S0NNY09SUlR4Z25QOUdRTkJkRVNmLzNMZW9I?=
 =?utf-8?B?QUlNMG9lMEc4MkpsR1hMcCtZb3k4SE5kak1KZzI0ckV3MWpudnpzbDVxSW4r?=
 =?utf-8?B?ZXNOc2N1N0t5SEhjOE1BaTF2OGNrUFRsNXMxL1d6MWV0RjZRQ2FnNVkyVnll?=
 =?utf-8?B?R2Rya244TnJoRDJhaWJPcU1jZ1VFbUo2bGpLbnl3ZEtGV2VlbUJSMW1kQ0tZ?=
 =?utf-8?B?dllFcUV0clF0TllqNTREN3FRajFaY3FpU0czamQzdHR0aTN2WU5OZ1ppdnVr?=
 =?utf-8?B?NFpaa05wK3lMSXdZRkhuOUVZd2wxd1hDbDBrZVc4dmU0aHRxUm8wUzZSOTgz?=
 =?utf-8?B?eE5HKzBXcDY4bHNURFh5RHFNOVI4TTFKZDRmNWlCLzZIVjU5QXVsVnpjeHZ2?=
 =?utf-8?B?NDhhNVZHOGRBM2FwU252WmgyRlRoNlF1TXFvbGFHb0NSMVppdTVPN2ltSVM2?=
 =?utf-8?B?bWJjNkZMbzMyNGVmdVdXdisxUENsdDlkaW9MQ09HVUlGOElwR1dlekZJcGcv?=
 =?utf-8?B?UlpOcGNvK3NNUDcrbmxYRzBQUUU5NW9zbzZwRU1tUXU3WGY5SHlFbDIvcndl?=
 =?utf-8?B?T0JEQU1BSUVaMHB2b3FpNkRRT1I4VXN1a0p3TUNlMVBpUExjVUtDVUVvYmlP?=
 =?utf-8?B?eFVhT1JRVlRxamZlMHhONXdYUDhwWXh4d00yWjhZRW0yTlhQZ0I4cWVzdEoy?=
 =?utf-8?B?NXc2NWV0bTljK1lSTU9zcWhaMitBYUFZbG5KS1g2OFZSQVY4OFhvdUpXdWpy?=
 =?utf-8?Q?/D+Zs01oShbKpQo3R442yu/fb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3394af88-1729-4486-58e5-08dd87ed822b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 13:47:11.5854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQtfr6LrQI45qwVIrbvsOtveS+vW0nDGSFFh6uELr/zWMRtVFiUm0tTCY3B1H2IBa+lf9mFVC07YY6F2p5KywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4636
X-Proofpoint-ORIG-GUID: dLpYmyOB1WUC8DM0YsEIl8Y0To84LkPk
X-Authority-Analysis: v=2.4 cv=JdW8rVKV c=1 sm=1 tr=0 ts=681229e5 cx=c_pps a=dbfzVNK0jQbpEhEqKt7tuQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=dkMdDuzY2HgA:10 a=07d9gI8wAAAA:8 a=ppJngBeKAAAA:8 a=VwQbUJbxAAAA:8 a=bPOcP376D--z2W7JVXAA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: dLpYmyOB1WUC8DM0YsEIl8Y0To84LkPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NyBTYWx0ZWRfX6FfF2QQWpR+E XMNsYCCJLPsx94sSGoPJWOCRv6SrSGfLo6NplZ4AFauCABDJ8+eV7Z+Ip3jqgl6smbk84WdX2f8 q36pH+UwCgntQOhe05Bl+ZqvMnidarT6wolFzMmGgCwMIPNVwATqDgAhNPButEus5ceG6bzlRBM
 W7UeGnbenlNC2EzxMB2rOSUOc4UXZzKxSX9dLrykI/8Uch9ri+bRH75Z1lCMQgjvalXTT2xs/wk 1QpvZUxxbsvDQkoKWuap3rwlB+Nf6yt/wYUCiqyTsH3S/88w0l6VRMyZbyJh0yb43tD2IfTy00o s5wGL8SAk0Vn55YogeZGvA0TeB76OwlbmHJaMimsHXrWrUAAV35zR/nO7AUAFf0Ho5qdgW/imgJ
 Ll4Gbj8wi2B6nmcdNqckpurucDco6ltTMAiIqooKYK6w6JgY9CWfvMoaIIhhsmzXnZJqRCCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300097
Content-Type: text/plain; charset="utf-8"

SGkgSm9uOg0KwqANClRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlLiBBbmQgd2VsbCBub3Rl
ZCBmb3IgeW91ciBoaWdobGlnaHRzLg0KDQo+IFdl4oCZcmUgbm93IHdvcmtpbmcgb24gTFRTIEtl
cm5lbCA1LjE1IGFuZCA2LjEuIFJlY2VudGx5LCB3ZeKAmXJlIHRyeWluZyANCj4gdG8gYnVpbGQg
dGhlaXIgU3BoaW54IERvYy4NCltNaW5nXSBBbHRob3VnaCB0aGV5IGFyZSBvbGQsIHRoZXkgYXJl
IHN0aWxsIExUUyB2ZXJzaW9ucy4g8J+Yig0KDQoNCj4gSXQgaXMgcmVxdWlyZWQgdG8gZ28gd2l0
aCBTcGhpbnggMi40LjQsIHdoaWNoIGlzIG11Y2ggbG93ZXIgdGhhbiB0aGUNCj4gdmVyc2lvbig4
LjEuMykgb2YgdWJ1bnR1IDIyLjA0IGFuZCAyNC4wNC4NCltNaW5nXSBUbyBidWlsZCB0aGUgc3Bo
aW54IGRvYyBmb3IgS2VybmVsIDUuMTUgb3IgNi4xLCBpdCBpcyByZXF1aXJlZCB0byBnbyB3aXRo
IFNwaGlueCAyLjQuNC4NCkJlbG93IGlzIHRoZSBweXRob24gcmVxdWlyZW1lbnRzLnR4dCBpbmNs
dWRlZCBpbiBLZXJuZWwgNS4xNSBhbmQgNi4xDQokIGNhdCBEb2N1bWVudGF0aW9uL3NwaGlueC9y
ZXF1aXJlbWVudHMudHh0DQojIGppbmphMj49My4xIGlzIG5vdCBjb21wYXRpYmxlIHdpdGggU3Bo
aW54PDQuMA0KamluamEyPDMuMQ0Kc3BoaW54X3J0ZF90aGVtZQ0KU3BoaW54PT0yLjQuNA0KDQoN
Cj4gQ3VycmVudCBTcGhpbnggd29ya3MgZmluZSwgYXMgZmFyIGFzIEkga25vdzsgYXJlIHRoZXJl
IHNwZWNpZmljIHByb2JsZW1zIHRoYXQgeW91IGNhbiByZXBvcnQgd2l0aCBjdXJyZW50IGtlcm5l
bHM/DQpbTWluZ10gQ291bGQgeW91IGdpdmUgYSB0cnkgYnkgYnVpbGRpbmcgdGhlIHNwaGlueCBk
b2MgZm9yIGtlcm5lbCA1LjE1IG9yIGtlcm5lbCA2LjEgdXNpbmcgdGhlIGRlZmF1bHQgdmVyc2lv
biBTcGhpbngobGlrZSA4LjEuMyApIG9uIHVidW50dSAyMi4wNCBvciAyNC4wND8NCkkgYmVsaWV2
ZSB5b3Ugd2lsbCBmaW5kIHN1cnByaXNlLiDwn5iKDQoNCg0KPiBBZ2FpbiwgdGhvc2UgYXJlIHZl
cnkgb2xkIGtlcm5lbHMsIHRoYXQgeW91IGFyZSB0cnlpbmcgdG8gbWFrZSB3b3JrIHdpdGggYSB2
ZXJ5IG9sZCB2ZXJzaW9uIG9mIFNwaGlueC4gIEknbSBub3Qgc3VyZSB3aHkgdGhvc2UgcGF0Y2hl
cyB3b3VsZCBiZSB1c2VmdWwgdG8gYW55Ym9keSBlbHNlPw0KW01pbmddIEkgZGVmaW5pdGVseSB3
YW50IHRvIHRyeSB3aXRoIHRoZSBsYXRlc3QgU3BoaW54IHRvb2wuIEJ1dCB0aGUga2VybmVsIDUu
MTUgb3IgNi4xIHJlcXVpcmVzIHVzIHRvIHVzZSAyLjQuNCwgd2hpY2ggeW91IHRoaW5rIGlzIGEg
dmVyeSBvbGQgdmVyc2lvbiBvZiBTcGhpbnguDQpXZSBhY3R1YWxseSB0cmllZCBTcGhpbnggOC4x
LjMgdG8gYnVpbGQgaXQgZm9yIGtlcm5lbCA1LjE1IG9yIDYuMS4gVGhlIG91dHB1dCBpcyBub3Qg
cmlnaHQgKG5vIHByb3BlciBkZWNvcmF0aW9uIG9uIHRoZSB3ZWIgR1VJKS4NCg0KDQo+IFRoaXMg
ZW1haWwgYW5kIGF0dGFjaG1lbnRzIGNvbnRhaW4gQW1iYXJlbGxhIFByb3ByaWV0YXJ5IGFuZC9v
ciANCj4gQ29uZmlkZW50aWFsIEluZm9ybWF0aW9uIGFuZCBpcyBpbnRlbmRlZCBzb2xlbHkgZm9y
IHRoZSB1c2Ugb2YgdGhlDQo+IGluZGl2aWR1YWwocykgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQu
IEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIA0KPiBkaXNjbG9zdXJlLCBkaXN0cmlidXRl
LCBjb3B5LCBvciBwcmludCBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCANCj4gYW4gaW50
ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWls
IGFuZCBkZXN0cm95IGFsbCBjb3BpZXMgb2YgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIFRoYW5rIHlv
dS4NCltNaW5nXSBKdXN0IGNoZWNrZWQgd2l0aCBvdXIgSVQgbWVtYmVycyB0byBnZXQgcmlkIG9m
IGl0LiBMZXQgbWUga25vdyBpZiB5b3Ugc3RpbGwgY2FuIHNlZSBpdC4NCsKgDQpCZXN0IFJlZ2Fy
ZHMhDQpNaW5nIFdlbiAo6Ze75piOKQ0KU0RLIFRlYW0gfCBBbWJhcmVsbGEgU2hhbmdoYWkNCg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSm9uYXRoYW4gQ29yYmV0IDxjb3Ji
ZXRAbHduLm5ldD4gDQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDMwLCAyMDI1IDg6NDcgUE0NClRv
OiBNaW5nIFdlbiA8bXdlbkBhbWJhcmVsbGEuY29tPjsgbGludXgtZG9jQHZnZXIua2VybmVsLm9y
Zw0KQ2M6IG1jaGVoYWJAa2VybmVsLm9yZzsgTG9uZyBMaSA8bG9uZ2xpQGFtYmFyZWxsYS5jb20+
OyBKaWFuIFRhbmcgPGp0YW5nQGFtYmFyZWxsYS5jb20+OyBaaGFvLVlhbmcgQ2hlbiA8enljaGVu
QGFtYmFyZWxsYS5jb20+OyBSb25ncm9uZyBDYW8gPHJyY2FvQGFtYmFyZWxsYS5jb20+DQpTdWJq
ZWN0OiBbRVhUXSBSZTogW0tlcm5lbCA1LjE1L0tlcm5sZSA2LjFdIEFib3V0IFNwaGlueCBEb2Mu
DQoNCk1pbmcgV2VuIDxtd2VuQGFtYmFyZWxsYS5jb20+IHdyaXRlczoNCg0KPiBEZWFyIExpbnV4
IERvY+KAmWVyczoNCj4NCj4gTmljZSB0byBlLW1lZXQgeW91ISBBbmQgdGhhbmtzIGZvciB5b3Vy
IGdyZWF0IGNvbnRyaWJ1dGlvbiB0byBMaW51eCANCj4gS2VybmVsIHdvcmxkIGFzIGFsd2F5cy4g
8J+Yig0KDQpUbyBiZWdpbiB3aXRoLCBwbGVhc2UgZG8gbm90IHNlbmQgSFRNTCBtYWlsLCBpdCB3
b24ndCBtYWtlIGl0IHRocm91Z2ggdG8gdGhlIGxpc3RzLg0KDQo+IFdl4oCZcmUgbm93IHdvcmtp
bmcgb24gTFRTIEtlcm5lbCA1LjE1IGFuZCA2LjEuIFJlY2VudGx5LCB3ZeKAmXJlIHRyeWluZyAN
Cj4gdG8gYnVpbGQgdGhlaXIgU3BoaW54IERvYy4NCg0KVGhlc2UgYXJlLCBvZiBjb3Vyc2UsIHF1
aXRlIG9sZCBrZXJuZWxzLg0KDQo+IEl0IGlzIHJlcXVpcmVkIHRvIGdvIHdpdGggU3BoaW54IDIu
NC40LCB3aGljaCBpcyBtdWNoIGxvd2VyIHRoYW4gdGhlDQo+IHZlcnNpb24oOC4xLjMpIG9mIHVi
dW50dSAyMi4wNCBhbmQgMjQuMDQuDQoNClJlcXVpcmVkIGJ5IHdobz8gIFRoYXQgaXMgYW4gYW5j
aWVudCB2ZXJzaW9uIG9mIFNwaGlueCBhdCB0aGlzIHBvaW50Lg0KDQo+IFBTOiBpZiBnb2luZyB3
aXRoIHZlcnkgbmV3IHZlcnNpb24gb2YgU3BoaW54IGxpa2UgOC4xLjMsIHRoZSBmaW5hbCANCj4g
b3V0cHV0IGlzIG5vdCByaWdodChkb2VzbuKAmXQgaGF2ZSB0aGUgcHJvcGVyIGRlY29yYXRpb24p
Lg0KDQpDdXJyZW50IFNwaGlueCB3b3JrcyBmaW5lLCBhcyBmYXIgYXMgSSBrbm93OyBhcmUgdGhl
cmUgc3BlY2lmaWMgcHJvYmxlbXMgdGhhdCB5b3UgY2FuIHJlcG9ydCB3aXRoIGN1cnJlbnQga2Vy
bmVscz8NCg0KPiBUbyB0cnkgdG8gcmVzb2x2ZSB0aGlzLCB3ZSBmb2xsb3dlZCBiZWxvdyB3YXkg
dG8gYnVpbGQga2VybmVsIFNwaGlueCANCj4gRG9jIGJ5IGhhdmluZyBTcGhpbnggdG8gc3RheSB3
aXRoIDIuNC40LiBIb3dldmVyLCBpdCB3aWxsIHJlcXVpcmUgDQo+IGV4dHJhIGRlcGVuZGVuY3kg
cGFja2FnZXMoaGlnaGxpZ2h0ZWQgYmVsb3cgaW4geWVsbG93KSBiZWZvcmUgd2UgY2FuIA0KPiBi
dWlsZCB0aGUgZG9jIHByb3Blcmx5Lg0KPg0KPiBIZXJlLCB3ZeKAmWQgbGlrZSB0byBjaGVjayB3
aXRoIHlvdXIgY29tbWVudHMgZm9yIHdoZXRoZXIgaXQgd2lsbCBiZSANCj4gZ29vZCB0byBtZXJn
ZSBpdCBpbnRvIHRoZSBtYWluIGJyYW5jaCBmb3IgS2VybmVsIDUuMTUgYW5kIDYuMS4gSWYgbm90
LCANCj4gZG8geW91IGhhdmUgYW55IGNvbmNlcm4gb24gdGhpcz8gT3IgeW91IGhhdmUgb3RoZXIg
YmV0dGVyIA0KPiBvcHRpb25zL2FkdmljZXMgZm9yIHVzIHRvIHRyeT8gVGhhbmtzIGFnYWluIGZv
ciB5b3VyIHRpbWUuDQoNCkFnYWluLCB0aG9zZSBhcmUgdmVyeSBvbGQga2VybmVscywgdGhhdCB5
b3UgYXJlIHRyeWluZyB0byBtYWtlIHdvcmsgd2l0aCBhIHZlcnkgb2xkIHZlcnNpb24gb2YgU3Bo
aW54LiAgSSdtIG5vdCBzdXJlIHdoeSB0aG9zZSBwYXRjaGVzIHdvdWxkIGJlIHVzZWZ1bCB0byBh
bnlib2R5IGVsc2U/DQoNCj4gVGhpcyBlbWFpbCBhbmQgYXR0YWNobWVudHMgY29udGFpbiBBbWJh
cmVsbGEgUHJvcHJpZXRhcnkgYW5kL29yIA0KPiBDb25maWRlbnRpYWwgSW5mb3JtYXRpb24gYW5k
IGlzIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgDQo+IGluZGl2aWR1YWwocykg
dG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQuIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIA0K
PiBkaXNjbG9zdXJlLCBkaXN0cmlidXRlLCBjb3B5LCBvciBwcmludCBpcyBwcm9oaWJpdGVkLiBJ
ZiB5b3UgYXJlIG5vdCANCj4gYW4gaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0
aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFuZCBkZXN0cm95IGFsbCBjb3BpZXMgb2YgdGhlIG9y
aWdpbmFsIG1lc3NhZ2UuIFRoYW5rIHlvdS4NCg0KVGhpcywgdG9vLCBpcyBub3QgYXBwcm9wcmlh
dGUgdG8gc2VuZCB3aXRoaW4gb3VyIGRldmVsb3BtZW50IGNvbW11bml0eS4NCg0KVGhhbmtzLA0K
DQpqb24NCg0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KVGhpcyBFWFRFUk5BTCBlbWFpbCBoYXMgYmVlbiBzY2Fu
bmVkIGJ5IFByb29mcG9pbnQgRW1haWwgUHJvdGVjdCBzZXJ2aWNlLg0KCioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
VGhpcyBlbWFpbCBhbmQgYXR0YWNobWVudHMgY29udGFpbiBBbWJhcmVsbGEgUHJvcHJpZXRhcnkg
YW5kL29yIENvbmZpZGVudGlhbCBJbmZvcm1hdGlvbiBhbmQgaXMgaW50ZW5kZWQgc29sZWx5IGZv
ciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsKHMpIHRvIHdob20gaXQgaXMgYWRkcmVzc2VkLiBB
bnkgdW5hdXRob3JpemVkIHJldmlldywgdXNlLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRlLCBjb3B5
LCBvciBwcmludCBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYnkgcmVwbHkgZW1haWwgYW5kIGRlc3Ry
b3kgYWxsIGNvcGllcyBvZiB0aGUgb3JpZ2luYWwgbWVzc2FnZS4gVGhhbmsgeW91Lgo=
