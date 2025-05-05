Received: from mx0b-0066f901.pphosted.com (mx0b-0066f901.pphosted.com [205.220.172.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C425A2C6
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.172.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457810; cv=fail; b=HgKjXKwq7ps2qu9QUxVvX8Zg9P+zJ+mYmrhsqzFFeZRc3QjL5FKTcF0dUPnTsv1+pVc/TLTG3GlKh1xMcxEee0nqkluHcCMe+Ig6HWleiSslGrw/8DVbWTaeUPa9kKm375tk5oHF9BBPKXMGmBSyEOB1tdtXcW4o23WIpfip/hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457810; c=relaxed/simple;
	bh=hLIBvact8t8RGzeFlq5g6A1PzFJ1k7+wglMxX1CAnnY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Mnupq0exHG2I9bX968cn4tuhxL2i2XRFiqSf5pS8p4+Z3Bfl+Ubq2h/TxPuf6FH4eakh0ZjR01b6LWZsR6L/JKLGAAyve9miGFgSpJJXcuTt1/Z9RD7N0AJkiANzjGpFoVpu85zVhM8zMtaa94wgn1LEgdfFyUpqDKe/4DaF0JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kyndryl.com; spf=pass smtp.mailfrom=kyndryl.com; dkim=pass (2048-bit key) header.d=kyndryl.com header.i=@kyndryl.com header.b=kUL789Eh; arc=fail smtp.client-ip=205.220.172.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kyndryl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kyndryl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kyndryl.com header.i=@kyndryl.com header.b="kUL789Eh"
Received: from pps.filterd (m0268695.ppops.net [127.0.0.1])
	by mx0b-0066f901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545EpZwY016547
	for <linux-doc@vger.kernel.org>; Mon, 5 May 2025 14:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyndryl.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=hLIBvact8t8RGzeFlq5g6A1PzFJ1
	k7+wglMxX1CAnnY=; b=kUL789EhjAjUFRUSJbKskkyMoN3dcqC0zk+6EZlFDVXo
	jKYC9s7IRoRP6eC1OY/vkuM6ti6ovLBosA+6lY0Zlrsx6mxrVMCbbCeQYhqQIVwW
	6Zv/vTWlsflvBKPypqRkS9vKlWWl8xvF3bwjvFEHYuts+H1FXsNsavZVwRlskwtV
	cyzDRWN5LtkcFE7enwx/n8EQahQFt8X1Z5n1RFGOXUSOnTCvR69EmQBc0U0DIEvj
	KxPvVYNVORs1MFwVlRw01AFi+wtRpQxsg8Ca+ImDZrEa4g/0f71PaXKvNxNoQ8Jr
	i1T0cB+K1oBUaECxa0I6Qc/snUfCA7qz0szTo3ZL2Q==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0b-0066f901.pphosted.com (PPS) with ESMTPS id 46ey0a0h1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 14:53:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM5s483/X6jT1Ua9a1s7KPzvrkDzqW4JTQBRD52gwIo7LsGqdc9BASGPwp21UJzkc1DTKH9TDfYMZEI6Dcmol4s5Rptu2ZA/MiIU9eNr4rumNCKiWFamaZqon/mtKFqkf0JhD9/b85QdXh1/cEozWNR+06/O2h1JmqSA3iPTJZYH2B4uYHILQBF7/EIrTQu1BGhcQIi++xrMHjMMpZNeXtsgblbUDX+OCz9I+9mvRg/uPfeYDOsF5fS1B2I/su3fUzzWkTwcZM6t5NVQFuX7C/p26kNpUaE+lG39ppdiTsVhrWVjERQkk/O6P2bbhemZcomilxW7/9EdCeK7h//rOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLIBvact8t8RGzeFlq5g6A1PzFJ1k7+wglMxX1CAnnY=;
 b=Gpb/6967gWYP9rTJxMjbWNQ8emkciG5jw7JtWDNUJjiVfVIvi6Z2dFILr100PF3iKhrAQ/613RCedD7BRARtfIpCQ4N3ofF5jfaJD+tHCvelwyjFLq+2N5rjDe/IHclLOF3mh5jfBUJgsrARtQtVEfQP5sEHDyAErYkefVPT/3tP3W0D+9QBxhHZhRhpCUEK63RU50CfQ3x6Vo4fwaQ5exU7e93NWaC+xfc8BU6J+SD4was7iotTu8M60JAdrUZjlVflalTcEvV6xpPlWPk/5rfbJoHqYKIhqpC/xvgk/K0dKqvrXACOw0KMvxbYF9/CCaU/3nO4KkTNp/SxQ2dIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kyndryl.com; dmarc=pass action=none header.from=kyndryl.com;
 dkim=pass header.d=kyndryl.com; arc=none
Received: from BYAPR14MB2967.namprd14.prod.outlook.com (2603:10b6:a03:152::20)
 by IA0PR14MB6210.namprd14.prod.outlook.com (2603:10b6:208:440::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Mon, 5 May
 2025 14:53:39 +0000
Received: from BYAPR14MB2967.namprd14.prod.outlook.com
 ([fe80::2119:f981:7d9a:5244]) by BYAPR14MB2967.namprd14.prod.outlook.com
 ([fe80::2119:f981:7d9a:5244%4]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 14:53:39 +0000
From: SCOTT FIELDS <Scott.Fields@kyndryl.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Question on accessing user_struct current active processes for UID
 from user space
Thread-Topic: Question on accessing user_struct current active processes for
 UID from user space
Thread-Index: AQHbvczg/XrUH/lXmEm9NhzKyxYvwA==
Date: Mon, 5 May 2025 14:53:39 +0000
Message-ID:
 <BYAPR14MB2967BB4CE9821F85A39819D78A8E2@BYAPR14MB2967.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR14MB2967:EE_|IA0PR14MB6210:EE_
x-ms-office365-filtering-correlation-id: a0af6f5c-bc02-4882-6feb-08dd8be49f2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sXSKAyBqahicQyvwO1lDhxtEWpRizI0gLsddxyuCoBCwBbh4Ok+OKwdAdq?=
 =?iso-8859-1?Q?I2+6nYOaIV1eiRWjBtZ3XJSHCKq7wpE4z0e3J5jhlPqQ1VavrSKFugVyh/?=
 =?iso-8859-1?Q?8X6WL4c/Cj3fW3Ms9pIuvP6KrbsPV8PzczYluXZyEEUE2Jnm9zl/61+U0Z?=
 =?iso-8859-1?Q?MMqJ10THxEKKWURwUKroUs/apvMadc2TQbWET8moTMYwOx/4V2Wp4z9QFN?=
 =?iso-8859-1?Q?+P4C13s8YlaDKQJ4d5XE2BxLlBFjUoeCDQmbdc+Ijr7fvAz5W9E3BwP+KB?=
 =?iso-8859-1?Q?26h6qhPetSln5QXPp35iKiRJCJWcvgYhgO9N3ObJuG7bUmDg7mdh5dEBCR?=
 =?iso-8859-1?Q?c88HEk0wMZi7QriU1+GnrqaalcVZya1RPgQGTdD/FUfW1xXbADF0i5N6Ki?=
 =?iso-8859-1?Q?bKvMDacL+okHgjDHlClroEw+g8ENKGJsutEbuzY5NCoucDsGDr5AfyqIGO?=
 =?iso-8859-1?Q?f4XuFGcJx59+YzmyxqwifHSbnsf7akBNFd/zYJEA7xamoD2hZxA/07J18N?=
 =?iso-8859-1?Q?MEFkAsQ/CaDPyT6lxm1mqbWb3w7908Cewf+cBfAQY4G8ax6EiLGVgPR6pG?=
 =?iso-8859-1?Q?FYAXAccDK4LjrE3JFzlbWol1HrfFs70sR6+LGlmX5NWnihGFZ00ZulF3FO?=
 =?iso-8859-1?Q?wDcsj1VIDwVYolZIUhmIfsbwszefpdQPUiDqwgA5FiHxRjyGUrxGTgVW3J?=
 =?iso-8859-1?Q?vvwFdz5YkD2W/xk/Prj0uYHWpXgGOBbQo8QqCLqPLkw00yW6la2HNindZM?=
 =?iso-8859-1?Q?BkofdZV8obhrWi4hat9XJSEsIEyyfQZJIDbuyZqcNRUlSHvwJiUzg1j2oX?=
 =?iso-8859-1?Q?gOliX48jUiXldfBLwVJlrvvDCEPuHcQNxIaZNWnVFP6AEZRfxSK0kfDBqI?=
 =?iso-8859-1?Q?tcm/nYcfpk7Zk9DRvqXMz+hgmWTZrYi8jDXB3zm9M+5ju92nUfRgi8x2l6?=
 =?iso-8859-1?Q?r23toButrZMI2neGsTdYyRO+tfvxAtQsiQ54nvI9dd9LI0XZSpvISPp4hb?=
 =?iso-8859-1?Q?yvewgtFt3/BYYSr+oa7oiCjRglGySUJAOjGgxmn79RI4U/kC4EU7hy/heH?=
 =?iso-8859-1?Q?sn710tOiHN516Cq2YNtiE58LyC6Ey2RR8kk0WIgC5WmEE37gq7GfV9FF17?=
 =?iso-8859-1?Q?6pcx7gRo9Q/6T9CqBDFuEYCYHc77lldFpQRw/GbVXXOGXkfMjZ9buCiu0/?=
 =?iso-8859-1?Q?DN0r7JeIbKb+7wuBcdIIvhBfhlZ1+1As93Akv7R5Yr5TxPcwYWVp+Z2HqZ?=
 =?iso-8859-1?Q?ZIun2FDDPzIRLfDDHHxifjjmZsn2UL3d+HW+BsSTduPcAkiyH6d7fN8io6?=
 =?iso-8859-1?Q?XCnHS1nPm/wunRQ7bBJC8Oih2FgI0utdy8zgjHAEIf913EjJS+tOm2+4xQ?=
 =?iso-8859-1?Q?GPHtgAeJjbc10/QWAlg9OtIEDn8bC27r9hIIH77Ally7wEfMd0vieEDcaX?=
 =?iso-8859-1?Q?BtMsyoGWhce+8DvLlJaOetKD6++O4OtC0Obl3IrvxtzYrykTtMxlxeATb2?=
 =?iso-8859-1?Q?kEftPOvUsZhKYCHn+nx06fggRVoFudJbvj8aW+v6yKqQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR14MB2967.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TmGwI+EjCfbMAxa00BOwFS9jQcCVoWbgKdfRR6BS3EcNhkpdv+rtHByg8w?=
 =?iso-8859-1?Q?5OHrxrymeHFZdb30TWSpHIWiS+1C0oR+Hre3b73NZWE2z117HUGayMbCwa?=
 =?iso-8859-1?Q?caYrJr5jL642aCxUkMRZxRYaizrYiUnI9Arw5/GZ1tZFSzu5hnW8XOJF1D?=
 =?iso-8859-1?Q?iJulftBoondkdLxpHlhoSlZbNyIb/TbucszG9YqVXMmO4Za75hPvSLLH2B?=
 =?iso-8859-1?Q?hm4wzHEqEdJ3hQboMqCyegj2LPMIV5iS4GsnGNYCLQp507l9PABs8X9os9?=
 =?iso-8859-1?Q?bTmz6hHgu9XX8yyO0XDPxinaPAu+Bq/g6XmBBtDoS0WgPEHinlkP2o+WCz?=
 =?iso-8859-1?Q?0S6b5p0eA5W9r1W/NZCrultQ4JzYKsFkXXedaAcmXvZKZvo8VJcNojfDgs?=
 =?iso-8859-1?Q?xfchVkYPHoCguNusms4dJs51BX40E6+cEkbWdNIlaYN8w7u5A0JOP7PSTm?=
 =?iso-8859-1?Q?5agartVT6n/XSOXD4fgOzmHYgcNnEtuzV2ccnMvkmmIXvx/WBJUI52MRyo?=
 =?iso-8859-1?Q?P6aNiWwwAxuS7BedokKnj1+Jgr39tqJS6PQ99fGcR7F/elLSV3P/OqayyI?=
 =?iso-8859-1?Q?yLaAzpGKxIaXyIJ2o8VEtfj95cGp07uiBSet+aDS2wTssjJrxfxKknVWHz?=
 =?iso-8859-1?Q?Tj3f6rglGuEh+gR/yTsGbMhXamLas37Bul/ODld1yrpQDIfN5NBD4lL7k5?=
 =?iso-8859-1?Q?rq3YxHgdIzeQXOUO8U3G8PYjrqZCDyqd+d/+R0KC+h4k6BXjUdfKg/7zH0?=
 =?iso-8859-1?Q?JVCn235UB4gUJgKRMZMFfwL4GalnMyy7DJEeYeiT4psteZFTGFGkxKCSny?=
 =?iso-8859-1?Q?cYnrbyCmsByeZDznfpIqvy3q9CRScmNXND8DbKXFe6tZCXwZOukN4ETdEJ?=
 =?iso-8859-1?Q?vsKzhLnwg5TgWV2xcA8JpoPRJxf/Tpe/BO5K3WtHc5otAH9NCOYi/UVQSD?=
 =?iso-8859-1?Q?C0j9y4vomZpAQYIHTkKlUpTt1GSkUQLEdXx/LKiFhB/E0JfOLvIZBGQifv?=
 =?iso-8859-1?Q?1l07cb+ljI+z+N/A90QMyI7DlZdEO3pgUSvhX/KmlZOd1F8RXpGTdrdOzv?=
 =?iso-8859-1?Q?Q0d1z/jC4diDPSyBg8AfWpTCbTOpMnV7pbzAzFFzEG5KtoOP9fAMqbuD+q?=
 =?iso-8859-1?Q?987Xcnb2vAJ5hS+2i13bByhDEN/jtp2af7RSZuoEzNAE5Cr9Cpsl53bRkB?=
 =?iso-8859-1?Q?juQm4omL3J5ciknbjoo8AWSM4V8PPpNFEy2k5ZjVO7D1Ju6tBe/+0zcHhl?=
 =?iso-8859-1?Q?qwnNKIpZ75oh5/W6U3hIKFv34OtzrvIznxhi1l2PEeDBqUPOBUOkpTsVil?=
 =?iso-8859-1?Q?xXc3GfpjZ1xezCb9Ttr4lrOud+YukUt7w5xVuDyi3Kj3gBTNwsDx57AGyB?=
 =?iso-8859-1?Q?mxwaHoyTD9IbO10Z1roX9/+wxsdp1mRM3Ab6FTXTyJhJMM/8l9+WVaBPSQ?=
 =?iso-8859-1?Q?/hTyEot84blP/bSSEoUFgG6o7N3Q3SCqCXf323SNCerPp+chP+7OfOYCqe?=
 =?iso-8859-1?Q?Ju7mO8F7dz4MB58YoTjmNfOpxlbEIiTq0QNgzelIwInbgDTQMPQct0vA9p?=
 =?iso-8859-1?Q?0i1TTG2vqJHtGjWMMADqIxOe2yygP4xbzSNh0oXCbWQJl5ICoc7n+PrEQu?=
 =?iso-8859-1?Q?h0igH3LQYEySz4Mn7QS7oPAqHvddv2cw0u?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kyndryl.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR14MB2967.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0af6f5c-bc02-4882-6feb-08dd8be49f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 14:53:39.5207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f260df36-bc43-424c-8f44-c85226657b01
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFu1Q6OHcPbTwkLcz+B9ETAOyY2bXC0NlfntPc1rfbKjz3V0Fva/jzRCgMZzj7qjVu+Koqcs47TS8NEkKgiy4WXUoDF9V4jQtSNVSSOyilg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR14MB6210
X-Proofpoint-GUID: rfHcGWDcmradgsZRNB-7RkXzNlIEv3LW
X-Authority-Analysis: v=2.4 cv=d9z1yQjE c=1 sm=1 tr=0 ts=6818d0f7 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=r421AFaqbplE1Gok9UQA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: rfHcGWDcmradgsZRNB-7RkXzNlIEv3LW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE0MyBTYWx0ZWRfX1m9Tdsc4FD9M 0MZ1ZEjib0W39ZQMlIoA+2VbyPpHOMG5+pMaT0DHog1Vno8/dcya5PeJc0pTOOyKHXxK3lVHLUC C2Wb6UX0eFTGVqTNOOIf6b/QuCbeYHjj6ns8cVDnXMwtrB/AqV2BBVaDWzNQa78HhOuvCU7BZSo
 9fXP5Ctjpyu8EfiGASkW7cNxnFtW0ReUlEYCjHbhZhJXw4hqtGUxfDWA5uPOoFn8N4gdNeug5j6 i0Li9UYvPvUv6UZpO2CJgPWjx69Rwq76pLoEoDF5bJRBxEUUHMSlP6afD3k5SC+OxJo5WTlcsFK oM2J8ifKVbKXl9LHOcYBg2pFlwdkm+tm1JOmvKsQI3J65JTa6nvgGFXHxGAHKHzQu7ScnNjaPb+
 HBTEGM+7Bx/Su+yPYoRoy7Ie2QG8YCVy8safqsVID+LQKRHX38EiSx/PrK30eFuOaGYlO4GZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1011 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=866 priorityscore=1501
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050143

If this needs to be submitted in a another mailing list, please let me know=
.=0A=
=0A=
I'm not finding any kernel documentation that provides if a mechanism exist=
 for getting the current number of active processes for a given user as pro=
vided by the user_struct to user space (namely an entry in /proc or /sys).=
=0A=
=0A=
Neither do I see any kernel function for getting this information.=0A=
=0A=
Is there a supported (and easy) method to get this, other than counting all=
 the current threads for a given user (which can be time consuming on some =
systems if there are thousands of processes)=0A=
=0A=
Scott Fields=0A=
Kyndryl=0A=
