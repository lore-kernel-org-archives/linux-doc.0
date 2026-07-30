Received: from fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com [63.178.132.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6412E9EC7;
	Thu, 30 Jul 2026 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=63.178.132.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429365; cv=fail; b=BWQbfmH7CDcL3+AuLD1RqtRMlSnp/EPGpThO+R+6I0l2y6jeFKG3wi59pMocfVpE0lTlLvE7SEMpc7FEGhMmcJfgHSuVO7jirRY4eFe7F7NBQJNwxzymPzB+WPYaGgOXLb2ngvQFS6ZX1bTEvHa7AdJ4823oYEz3ANLcwnuF4N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429365; c=relaxed/simple;
	bh=4W2BZDyT3KGlEIAN9RAIbz7WYdraUDoxG/9HZ21yNBc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W9aervj+/0uJQyMEgPi6FJp2dOccKGS/uTvYPoJqXumt+UsAbPgTwk8OEsysrNEKRH5bCztRVSDAfLAEryPovgKSwEMXX+czYRAopj89u73cvFUBgMObIVhnS3CaEgBdc7J6bj7DXAb8ne2PYSedN4zyrJReAOqYMs8jVbzh0O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=ryRsihqS; arc=fail smtp.client-ip=63.178.132.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="ryRsihqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1785429363; x=1816965363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4W2BZDyT3KGlEIAN9RAIbz7WYdraUDoxG/9HZ21yNBc=;
  b=ryRsihqSvNLoLkhiZxQxhFnRi3Zl+ynxA9Ml8xcllL5TSkrO2jNA5Rey
   u5+JaC/BUJJzCAqew4NIdDaY01EAkBQVZZl9+y0QVZQS2boF54u2662iA
   0qxyerWMq6sD9aGM8MfzBYTDYyThP5qQWCrBmSrKfk4BDRQl2rmUrgpkk
   73AhmDC8hfBhrOskhlIiLSp7omcuTLRuBGReV59NLXUdvyEWUkxHBUBhd
   DuW6F7kotWyZ1Wf1wXbajHAJm2hyu0wA+A6xnyX7ka2wEF76YzMSrbEq1
   vLNAkGI8OT5T4nTCriskrpOjDIigerd/lgXu526A9v2KanY5cmGlcMrnF
   w==;
X-CSE-ConnectionGUID: z2/3QKO2QVuliaYrGxxiiw==
X-CSE-MsgGUID: /yM9FrtfSoaRTopQIU5cDA==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="17036013"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 16:35:45 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:26848]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.18.172:2525] with esmtp (Farcaster)
 id 73ed9f5c-7cf7-4d2f-b28b-06d80a143feb; Thu, 30 Jul 2026 16:35:45 +0000 (UTC)
X-Farcaster-Flow-ID: 73ed9f5c-7cf7-4d2f-b28b-06d80a143feb
Received: from EX19EXOEUB001.ant.amazon.com (10.252.51.80) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 16:35:44 +0000
Received: from EX19EXOEUC002.ant.amazon.com (10.252.51.145) by
 EX19EXOEUB001.ant.amazon.com (10.252.51.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 16:35:44 +0000
Received: from FR6P281CU001.outbound.protection.outlook.com (10.252.50.44) by
 EX19EXOEUC002.ant.amazon.com (10.252.51.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45
 via Frontend Transport; Thu, 30 Jul 2026 16:35:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9YssZWLYDLQK1PyL7Qklh053JA5kdheYFZuEvP4xdFKNUM0MgCiXsS2nIgTKPTaXLAoCygrmFji+FgF3L+2ZxZSInRJV6W5u9KMA/DRHlVYIvVKZ8qGklFGCOJy1GE1EKkVTIXzXM9yYOXC7U28BNdOyYA2kWU7Jgu3vb5tHQkaUWyz5mROBfFvM53a9XbMYME7O0cHCChRBGdbmLtZOK76ZbK+qlXkBQSvq6kqnrZ5W8jL1NoJloFClR39ksNvcCwFBNcDCOrD0npKOnwVHjRZ7br0lrgpD4l6AIKjQTK6TW+bA1/RdoDxcX330h9LU7UiXYATJbN98MeR9ZIjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4W2BZDyT3KGlEIAN9RAIbz7WYdraUDoxG/9HZ21yNBc=;
 b=vqWLiuujxajYb55Qx6AKQXHXFvY+y9geErOxK2y14NyAcVn3J3bQ04Vpfc6yUy8d7bupIjqCyaSUhdZ+O5PmKCnSeJC/ytdETd6Debk7709b6vydwc5Y3C/90cP3eC5Q3pseDHUKUFHiHMS3AyN4EUetAJwT+3+H1RzUWspw9SaLp6ahaZcj5uJxGhWeO73cfnUPtxrbZ4aSxlt35Os0hzphJv6lCktfBKj/D1ZUaQCGXUfpMzoQOAvzuWwYwE/JncDV4kwG5jZ2tT2qG5LPWxoK0+MNYzuTcCvfP6drNvN3Q99mHwLsjUERei5nU//IMZxUnwUhtzMvOPVgMW7gZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.de; dmarc=pass action=none header.from=amazon.de;
 dkim=pass header.d=amazon.de; arc=none
Received: from FRSP281MB6250.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e0::23)
 by FRYP281MB0062.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.15; Thu, 30 Jul 2026 16:35:42 +0000
Received: from FRSP281MB6250.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7ad:f028:e0a7:bd4b]) by FRSP281MB6250.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7ad:f028:e0a7:bd4b%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:35:42 +0000
From: "Graf (AWS), Alexander" <graf@amazon.de>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Mancini, Riccardo" <mancio@amazon.co.uk>,
	"Popescu, Diana Andreea" <diapop@amazon.co.uk>, "mknaust@amazon.com"
	<mknaust@amazon.com>
Subject: Re: [PATCH 0/8] nitro_enclaves: Support multi-NUMA CPU pools and
 per-node allocation
Thread-Topic: [PATCH 0/8] nitro_enclaves: Support multi-NUMA CPU pools and
 per-node allocation
Thread-Index: AQHdICJ21iKvUuI44EWkHw66sb1orraGNBCAgAAOloA=
Date: Thu, 30 Jul 2026 16:35:42 +0000
Message-ID: <ee807af6-3fb3-48b7-b2b3-4c5f22d51ced@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
 <421d4cb5-77ab-4d36-aa61-64d4f536cc81@app.fastmail.com>
In-Reply-To: <421d4cb5-77ab-4d36-aa61-64d4f536cc81@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRSP281MB6250:EE_|FRYP281MB0062:EE_
x-ms-office365-filtering-correlation-id: 3d398180-5be5-4f61-c8fa-08deee5898eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|4143699003|38070700021|10067099003|5023799004|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info: mHZXU4qus49Xmy7Ml0qeWl8Ao9nNBv4aDajLhvjTpoLZ96fIC8E2jRPhxMsUyyQrS9XHytFOdCmf1luSXtKFbixAKPU4+QE+mN+fgDurFcsM7x+mWLdIHI4G/63M+PGooe8Xr5I4Onrj9QvomwbjqIz/GmwPGt/uW42LW+hNXy3nepujVE7wYJZJ1AcWPm3MM54EyfpDrrxeMX8tZcpQGBl8Pl2X1pPYfYaRLt0MN8aIKjrw46cTe42rYCUBaGPr/gk76dtwy3cvxKk5P6yv7H76lgEq8PFB6M6k9qoxM2eX/TCmCJyVfGfLjf2QvbNlaybMFfhYjtMLDGglNhnbkLvk2n7+NYqQJ6TwqZ4+t/EMh/4PDXUVBmYtxUY70JSJqxguP/U7pZX38sFE00ujGDNMczIpLNaYoTyk9oSeSR2y7C3Gq/5bCLcXxKB8Qxt8kgqqnT5al1AV+2ZCIOU40CQLXrvbu5f+f8eqZRvcLY4KjXmw2qVH2U+Jy05n1+KVhqCrR5BqMSqWbOWvStxRucxXrZHaTFKlG4SFhM44SyV54rfoCYTswx9gHcO2lwRIzFj/T2s9FN0BhpslyfMme636/MY0ZN5PjKuyFro+5qkUIQZW9V5Ca+Zb1+mF3Fx2QlC80h6Uk0F4AX/vRug+iwA9Hyqm4ggR1NeQHlRoE0S+nTMaDpt5WMUSw80R2CuCCD74hAtt68oRVFP51rFWJvcBmHIjFdGU60JaIkM2nAs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRSP281MB6250.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(38070700021)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGJ6d205NWtlTllMWjY3Y3hvMyt3MG11aTVEUVVjaGFvbVRwL044cjUxRU10?=
 =?utf-8?B?ZUlSbHNTS3FJKzYvRmpUODE3Z3hnVk9MenAvc0M0RlJlNFJ5QWpaVDhDMTlh?=
 =?utf-8?B?L2o2b1B3SlRjdEtkQy9qNXZCOTVNQURPdlprSm9zMStKancwd3RRUlIwRUxF?=
 =?utf-8?B?MGZYMDJPRXFWeHppeU5QWEtLRkJlZUlJTnhLTDlTcUNQdktXamYzcUtEZXZa?=
 =?utf-8?B?M09NdGxoTkFjOGtOb01BZkxkUG52MkhuT2ZCRWJuL0tFWTY1eXFURUp1Y3Ns?=
 =?utf-8?B?dnJIeUZKSmhxR3RvcFNERWRjSDlseVNQQ1Y4eUZrdFdFSk1iT3c2bnNaOVV5?=
 =?utf-8?B?T1lSdVl6MEZ5UTJRTUdrem5uclN1VytUS0U4aVJJSDFHVHowdldMYkRXamRF?=
 =?utf-8?B?eUk2ZTJtbmpmckhQeE4rMlh2bk9nZkM4SHVjcXNKdVJsRkVUbXU2L3hTVXVk?=
 =?utf-8?B?ZjBhbm1sNUNXUFI2Um5TQUorVGg1b3paWlFpeDFvblEwK3lHdGlucGcxVTlj?=
 =?utf-8?B?WU5zeHh4NHA2R0p2Q0htUEU0OG9RQmRVNW1NaVlPVWpMWHRMQ1N5RmdneEJq?=
 =?utf-8?B?bjNOOFlhdm94TjFIbnlSNytwNXF4akgvMnc3T0J5MndmbUwrNTdDUVl6T0JV?=
 =?utf-8?B?cTlkdS9Xc2EwRzRybTF0bjJUekVlT1E5bC9uWENzTzBJdmNIRFFvZGpQV2Na?=
 =?utf-8?B?a25YRzlqb3ZsUllCc01zdDBDR2xUTmIrU0Eyc2dWdmQ5RXkyK3lxM0JBcXh0?=
 =?utf-8?B?L0c1TzB0czkvaVRCOGpkZmI2ZjRSSEpxN2lKWFgxUGJqZ1lkZkpKTnZ4QjVV?=
 =?utf-8?B?OXJ2dVoweElBREZxR3lOdUtiOEJlMFJGaGtxOEZBZWlzSUFUMHZSekF1dFRO?=
 =?utf-8?B?TllKV1lBYk96OUdQYm1UTVJQbDZzMTRSWUlWMFU4dUJwb1pIbEljRkVlUWRT?=
 =?utf-8?B?d2g1SUJFVFp1ZVhZZTB4WU9XMk5mT1pIZlhWamlGT1RkQ0xmMWs1WFBIeGFB?=
 =?utf-8?B?OXVVdzdYM2JxWlJlaGpsU2I1RUZST21xV0hlUkl4SlM2WDdXZjh2UkFMNjRn?=
 =?utf-8?B?WDVmc3hIV1VUZFA5UzBoamgyU2FWMG9hTVRQckhvakdteEdBb1hDVlB0bDEv?=
 =?utf-8?B?bDNtK1VQc1NtV05UYXVMeTJKNUJOTGVaUFEyVUV0QTd2dHZVMjdvUlVoQ2FH?=
 =?utf-8?B?WHM3TVMwOWlvaHIzdkljVnVLZ2JwUGJqL2R1MThYa1V4dDQxT3Q3WkczZHRp?=
 =?utf-8?B?MDc1WEd2MmhTQkY2MHh1Q01MNTd5N3JuR1A1WmdPMUUxY0tITEp4ZGpBMUg3?=
 =?utf-8?B?aTBQYnVuWUV5R3NHQWFJQXZ6R3ZYOU5rY0pBMlFtaWFRMjFJSnQxdFM5SGIw?=
 =?utf-8?B?SHBIZ3lsR2w4Z1VNZ2NrZXhrNXcrVklYamNKK3E2ejZWT2pRSkplRXFVT1hZ?=
 =?utf-8?B?K0szTm9ZcUdzT0tLMU5UZkR0Uy9yRGxCNTRPOHJKZ3lyakY4aXFsL0FJMVl0?=
 =?utf-8?B?OHQyU01sejMvT2xOUWFrclc3czRzN010Z21KTWh2NDNpRnJjV1hUWEZPSWpD?=
 =?utf-8?B?dFFQRWlJNlc5UEZXbTIyQjBFZ2dETnU3Um05cWhRMVRsNFV4amg1clVuTnJX?=
 =?utf-8?B?VWNZMVNibjk5eU1rWVNWNHFQdks3VEFPMEVDTUd0RmtxS0xoc3ErWDV3VjQz?=
 =?utf-8?B?bTA3WUNuQWJyVCttSVhRQVp3Qks1cFJQZGxuMUc4QnEweUJubmNXRCtXbEhQ?=
 =?utf-8?B?M2FJVTFoQlhVaEdvbEhyRlRZblNZRzdHZy9kUlFialVjck1MS3pkUkhPV0Nt?=
 =?utf-8?B?bThXT1ZtMWFCN3RyN3BkYXcrN2UvcU5SYlMvUXY3WGd1amVyQUc1VzNTRFlW?=
 =?utf-8?B?OUlyMHVVZmw3Z1NQQTM0NDNyT1p2ZUxoT3RMYUhkdll1NU1XcWVTYktKMERs?=
 =?utf-8?B?eUhHdk84L0JueSsrR0tvam9JOXR3QkFvaWZsb0o3QVJxY3Q5aXVmZ2ExNm03?=
 =?utf-8?B?M2p6bTdEVlMzWlZqV0Jsazh4QWtkVVBPMFlLMnRMQmw0NHAyMk1RbDc1dVli?=
 =?utf-8?B?T3hWVnRQUEVrNGQ1UlNwODhRRURUMmVuV3hRUW9YWnBpa1FwODM1MDJ3dUx4?=
 =?utf-8?B?Rldoa1Y1UURtbUt2TDMveUo3S2NHSU5RSnZEL0FiWURyemlGQTIvaEpCTWFp?=
 =?utf-8?B?eUtZWkp0RnkrcGxxbzBZZmcyR3M2ZDVvU0plQ1pQRjU3NERwZlZHVHNjZGFy?=
 =?utf-8?B?SkVUYno1c3NQWVhxMlBydjhKMmlTVnY0RE13aGkxdGV4L2RoWHdHQjRWclFE?=
 =?utf-8?Q?ihHL+pJPzavxRG3NSW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FC4288065176F49883AF049FD747402@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tNWVs71PTJ8XDLIVGTbl7SsNy7flQOG8ftntKGzoRd6jeij9VULqntNJZnF8FzYst2+Zm5viVd3rvmC5kKnnXH9e6YblHSsW2IJSk6ECyIeh9gAjquMMkPZjUYLWm/qS5GsVh1x+KhF4ePlw87HT85yQFk346z/jIkjQJFbFn/E/Q7F1CZmCR+nEbgRS92XJf0M6Hp5kKLGJnijIzbe88bBE6/qPGZ0SGqv7NDsePGzDqRuQ7ou4tQNQ2OTiy7433O1JjsVGC3XUCQGZyJMxoFRoZiY7FRaTJycbLgwtywvvijuFI2L1otKvKtUkwelJ5SSao1tcwSVOD/JYZQ6zJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRSP281MB6250.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d398180-5be5-4f61-c8fa-08deee5898eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 16:35:42.3143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sgHEsIdxlQWS3dH17YXuKwmnEmyFsus35jXkvWEO3XHqVLTKVL5Icyy5HUOO2PmJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB0062
X-OriginatorOrg: amazon.de

SGV5IEFybmQhDQoNCk9uIDMwLjA3LjI2IDE3OjQzLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0KPiBP
biBUaHUsIEp1bCAzMCwgMjAyNiwgYXQgMTQ6NTMsIEFsZXhhbmRlciBHcmFmIHdyb3RlOg0KPg0K
PiBIaSBBbGV4DQo+DQo+PiBJIHBpY2tlZCBhIHBlci1mZCB0YXJnZXQgb3ZlciBhIHNlY29uZCBO
RV9BRERfVkNQVSBjYXJyeWluZyB0aGUgbm9kZSBvbg0KPj4gZXZlcnkgY2FsbC4gTkVfQUREX1ZD
UFUgYWxyZWFkeSByZXBvcnRzIHRoZSBpZCBpdCBjaG9zZSwgc28gYSBWTU0NCj4+IHNwcmVhZGlu
ZyBhbiBlbmNsYXZlIG92ZXIgc2V2ZXJhbCBub2RlcyBuZWVkcyBubyBuZXcgY2FsbCwgb25seSB0
aGUNCj4+IHRhcmdldCBhbmQgdGhlIGNvdW50IGl0IGFscmVhZHkgZHJhaW5zOyB0aGUgdmFyaWFu
dCB3b3VsZCBtYWtlIHRoYXQNCj4+IHNhbWUgVk1NIGxlYXJuIGEgbmV3IGlvY3RsIGZvciBiZWhh
dmlvdXIgaXQgYWxyZWFkeSBoYXMuDQo+IEkgaGFkIHRvIHJlYWQgdGhpcyB0aHJlZSB0aW1lcyB0
byB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSB0cnlpbmcNCj4gdG8gc2F5LCBidXQgc3RpbGwgZG9u
J3Qga25vdyB3aHkgeW91IHBpY2tlZCBvbmUgb3ZlciB0aGUgb3RoZXIuDQoNCg0KVGhhbmtzIGEg
YnVuY2ggZm9yIHRha2luZyB0aGUgdGltZSB0byBkbyBzby4gVGhlIG1lc3NhZ2UgaXM6IEJvdGgg
d29yay4gDQpXZSBjYW4gZWl0aGVyIGhhdmUgc3BlY2lhbCBpb2N0bHMgcGVyIGFsbG9jYXRpb24g
KENQVSwgbWVtb3J5KSB0aGF0IGdldHMgDQphIHNwZWNpYWwgbmlkIHByb3BlcnR5IG9yIHdlIGNh
biBoYXZlIGEgZ2xvYmFsICJhbGxvY2F0ZSBmcm9tIHRoaXMgbmlkIiANCmNvb2tpZSBiZWhpbmQg
dGhlIGZkLg0KDQpJIGRvbid0IGhhdmUgYSBzdXBlciBzdHJvbmcgcHJlZmVyZW5jZSB3aGljaCB3
YXkgdG8gcGljay4gVGhlIG1haW4gcGx1cyANCnBvaW50IGZvciB0aGUgY29va2llIGlzIHRoYXQg
QUREX1ZDUFVTIGlzIGFscmVhZHkgYW4gaW9jdGwgd2hpY2ggd2UgDQp3b3VsZCBvdGhlcndpc2Ug
aGF2ZSB0byBhZGQgYSBuZXcgbmlkLWF3YXJlIHZhcmlhbnQgZm9yLg0KDQpEbyB5b3UgaGF2ZSBh
IHByZWZlcmVuY2U/DQoNCg0KPg0KPj4gSSB3cm90ZSB0aGlzIHNlcmllcyB3aXRoIGFuIEFJIGNv
ZGluZyBhc3Npc3RhbnQsIHdoaWNoIGRyYWZ0ZWQgdGhlIGNvZGUNCj4+IGFuZCB0aGUgY2hhbmdl
bG9ncywgdGhpcyBjb3ZlciBsZXR0ZXIgaW5jbHVkZWQ7IEkgcmV2aWV3ZWQgYW5kIHJld29ya2Vk
DQo+PiBhbGwgb2YgaXQgYmVmb3JlIHNlbmRpbmcsIGFuZCBlYWNoIGNvbW1pdCBjYXJyaWVzIGFu
IEFzc2lzdGVkLWJ5Og0KPj4gdHJhaWxlci4gQWxsIGVpZ2h0IGNvbW1pdHMgd2VyZSBidWlsdCBk
ZXRhY2hlZCBpbiB0aHJlZSBjb25maWd1cmF0aW9ucw0KPj4gKHg4Nl82NCBkZWZjb25maWcgd2l0
aCBDT05GSUdfTklUUk9fRU5DTEFWRVM9bSwgdGhlIHNhbWUgd2l0aA0KPj4gQ09ORklHX05VTUE9
biwgYW5kIGFsbG1vZGNvbmZpZykgZm9yIDI0IHdhcm5pbmctZnJlZSBkcml2ZXIgYnVpbGRzLCBh
bmQNCj4+IHNjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0cmljdCBpcyBjbGVhbiBvbiBhbGwgZWln
aHQuDQo+IFRoZSBwYXRjaGVzIGxvb2sgZmluZSB0byBtZSBvdmVyYWxsLCBJIG9ubHkgaGF2ZSBz
b21lIHZlcnkgbWlub3INCj4gY29tbWVudHMgb24gdGhlbS4gVGhlIGF1dG9nZW5lcmF0ZWQgY2hh
bmdlbG9ncyBzZWVtIGFjdGl2ZWx5DQo+IGNvdW50ZXJwcm9kdWN0aXZlIHRob3VnaCwgZGVzcGl0
ZSB5b3VyIGF0dGVtcHRzIHRvIHRvIHJld3JpdGUNCj4gdGhlbSBpbnRvIHNvbWV0aGluZyByZWFk
YWJsZS4gVGhpcyBzZWVtcyB0byBoYXZlIGp1c3QgbWFkZSB0aGUNCj4gc2VyaWVzIGhhcmRlciB0
byByZXZpZXcuIEluc3RlYWQgb2YgdGVsbGluZyB0aGUgcmVhZGVyIGENCj4gY29uc2lzdGVudCBz
dG9yeSBhYm91dCB3aGF0IGVhY2ggY2hhbmdlIGlzIGZvciwgdGhlIGdlbmVyYXRlZA0KPiB0ZXh0
IGhhcyB0b28gbXVjaCB1c2VsZXNzIGRldGFpbCBhYm91dCB0aGUgaW1wbGVtZW50YXRpb24uDQoN
Cg0KSSBhZ3JlZS4gQW5kIHRoYXQncyBhZnRlciBJIG1hc3NhZ2VkIGl0IG1hbnkgdGltZXMgYWxy
ZWFkeSA6KC4gTWF5YmUgaW4gDQp0aGUgbmV4dCBzZXQsIEknbGwganVzdCB3cml0ZSBpdCBteXNl
bGYgYWdhaW4gOikuIE9yIEknbGwgZmluZCBhIHdheSB0byANCmdlbmVyYXRlIGFjdHVhbGx5IHJl
YWRhYmxlIG9uZXMuDQoNCg0KQWxleA0K
