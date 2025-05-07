Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FBA207A16
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612731; cv=fail; b=SAVRTPJ6d0FEZV+/2cJAxiHY2zkdUfi0XoJSodvgtVrn7qzHDqcudD8o1MUsqrxpA9QLUbKzleCGj41oTM6fTroh/RF44G8Qa4Jrlcd+EyVrwpEemFelf1Jra2v859z+JGhwqGslR5ojxZIOs+eFb3coIv0uMpHzLlY+F2QVj+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612731; c=relaxed/simple;
	bh=dBGa8SPtSxTS9P7QlDVbbLPMefftS9Tr8ubOGSmuXAI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=UX3Pbi4Z98AnXPrFyPplUDbU4eALJ4uMUNx4TcfI8oOBFJ1WtXrS+KOA+IORHy4l8Dqxyk8uAbZDJmT3m7Z/G2TLIBy/D6dtl22zaHabyEaE+GhBShI1UOPzbtVGKFyfrEKvPaBv2oKGLHZuWz696A2kSvl2DZSr06zHMqP8z6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=bOGnpgan; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=cyiLppjD reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="bOGnpgan";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="cyiLppjD"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5479N55E016290;
	Wed, 7 May 2025 03:12:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=dBGa8SPtSxTS9P7QlDVbbLPMefftS9Tr8ubOGSmuXAI=; b=
	bOGnpgankRh+mjrSm5UjqjWfCp5iZnz1CQBTD5E0lgsgZegg7LTZJA4roR1UKJen
	oOm8VfyfdGMOjqbewow4PDB5188kX5baG592Vka1NgFxs1kD6Sp02M1z7T2tIwAV
	yN9+EjJR9ZyJlbMKPxthaTYibBIYeR/XLE3qIM/BA9B+PRs5UcraSKIlqABJK8St
	hej2pOM2u+88BpljJLQJS9gj0y1cFTCo9/qpvxRziKzYl9eRpjqGavinbRCHUgyd
	1w0dpHy2qt5Iad/omaRhYDA80N5FLr5HzAl2uxb6JPcGMAo0QpzF7TPXeFwI50zU
	DYWQEq2PEhVCkp2F4oSVhA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 46dg4ej8w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 03:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igaRq/Q8LZxZIr/NWf6OWWy4iFY7cnwkrvXu4GO6o8xHTvjmfB+6AAXN5q72kFhHKebSGCu+HTJU1fPRHXPUoBKttXKE5PNz0mFk/zqVvvT27l6c9Uq2YOeVtrAkZP9kJKQCQ6vIWrIeBsVBcQd6uojEIwNMPvIgN2T90N0xt39tchhk380f9Ksa4zLOCOSrBYfVDYdxqCjTdqYxV8s0K30wQOhFWjzruBjWUANcUOk6U/m9/mTsy5ZwPkW/2FKF2O7aLqDhvI8Ezd8AoBjPveZzDNtZFtnwibCAIRZZ44+2LAV2n7pW3iyBg8/Qx+ZzcpsvnJOUllq2HQRITIUr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WegLnRr5WwC0Mhj0QW2TUbTU5OONBDzWqQ7XGEW7quE=;
 b=Q5AmTrvi8oByUL0X5i3YzW06XQjNyJqqZw7YHsm1WkzclwZQCmpml7hcDCsG82P+lR5B/Z+u/oRU7ObRXTYvZ7/1J277JBhyE1AiLr8T6kk4RvITu6vQwYlqMHbJElYbRSAKWPAgZeIqhubXCA+3yNW01K4X7WzP6iJ7wFWcVCnDW3fJuWKBILuOJOapg/0AyGeMB8ZL7JXZ8oHNfhYl3gpJNutPs1aFBVwOizTsEQ0lKzidQVcdx0nNkkA28v3BECPLISuq5IGn76ntGrF8X7+9rUjoaP5RZe2uto1sx0mlXvgXZmt3hVS6w1WqMzYGVSuZ9iAbUHVu59BuT6+fMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WegLnRr5WwC0Mhj0QW2TUbTU5OONBDzWqQ7XGEW7quE=;
 b=cyiLppjDSferQOEKb/WFiI3WHN8ZEwbY4xgLxkZnkbFwgNsdYNNsPgMpyEduzeTc/GlPQUJjRE+f8gX2jl8eTad88Mx6ohQ+gP5b4/TgyQHDZ5WPA+NGpeOGEiVGADB+h/3g+lW/TAVrcrZTuUFpxL3eGp1J4CZCwIg/2bnqkKb5Ihw7rODpCQv2uGPK2YryERseTKOXs87EXQB8aZD2qqhfl0sbzhzgnTrk1WD6SMqN7PKrXtCPr0fJwvWCBtm0g86fvrvW0rDUw48ZibQjsy5/8bKLksMQrqwbVNkD1FbSFmQxlmHwFlkBZYR2ibRLBZEyrSHIvdYxV4wFDvACCA==
Received: from CH2PR19MB4732.namprd19.prod.outlook.com (2603:10b6:610:65::12)
 by DS7PR19MB4406.namprd19.prod.outlook.com (2603:10b6:5:2c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 10:11:54 +0000
Received: from CH2PR19MB4732.namprd19.prod.outlook.com
 ([fe80::d38d:e458:db28:6882]) by CH2PR19MB4732.namprd19.prod.outlook.com
 ([fe80::d38d:e458:db28:6882%4]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 10:11:54 +0000
From: Rongrong Cao <rrcao@ambarella.com>
To: Ming Wen <mwen@ambarella.com>, Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li <longli@ambarella.com>,
        Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen <zychen@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Topic: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
Thread-Index:
 Adu5CPI/xnNgIXNHREqtI6hCoIYQBwAxQcUAAAGx1wAAAQ6JgAACKvLAASRQeqAAMU+ZoA==
Date: Wed, 7 May 2025 10:11:54 +0000
Message-ID:
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
References:
 <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
In-Reply-To:
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR19MB4732:EE_|DS7PR19MB4406:EE_
x-ms-office365-filtering-correlation-id: 56d193ca-1608-45e9-d156-08dd8d4f97a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVNpZ2kvK2p1bVd1VC9ocWhhdXpmbFphNXdDOFNtdHlNUnNXMHNUVStKSGov?=
 =?utf-8?B?L0hOWmQ1SmFtcVRpa3pxdEtGZWFKZk40UUZraEpJTmVWa1RaSVRBR2hhcmU5?=
 =?utf-8?B?YkhKcUFwTWYwQndSaWZqU0YvRjhTWS9MNkQ4OE1aUWJxK2Y1SS9hQXNwb2VT?=
 =?utf-8?B?TTJyMXphZ1ZFc08wQ1ZqSGlmMGI4WXM3a2QyN1ArWlg1QkxIK0J3MWxPODNS?=
 =?utf-8?B?VGp4eExDM3I2RGMybndKZWszaFZYekFDeXpzNmh2K2wzMXpxRmJGYW95MHVU?=
 =?utf-8?B?MHF2NGgzdmgrYnozbmRVc1dnQWlrRnZ6STFEUzN3MDU2STQwM0YwdldaMmJY?=
 =?utf-8?B?Z29ZMDRQejUzbTJlZHAxMXRqUmFoRFdzTGRHbHB2ZE1hN1ZZYnhtM3lMTktr?=
 =?utf-8?B?cHQ2NkZ0U0c5dkQ0UzN5ZVlabFdaRWZ6N09tcUhHUGVCb0hGVjlTQ1Q3UnNl?=
 =?utf-8?B?eFpzNWNSbDBZcjNqWUl3cUIwd1NmbUY3cjVHSVkwZldxWUlQRHFtV3BEaHVK?=
 =?utf-8?B?SXNrOEc2L3pZaVI0TnhNVmMxcGZDbnFSbzV4b05rTTNTbDI2bjJvRllOdVFM?=
 =?utf-8?B?U21ra2ZoSXYwT1NrWEhDalBqcnRUV2ZTZEFkU1FGSUMyQ0N3Ukl3YXkvcTA2?=
 =?utf-8?B?MEVZWkozYUlmNDNsRE5Qd2V5TEhjVXgwV1dBendtZ3VnRld6emhYMHJaS2Mx?=
 =?utf-8?B?ajFWMGdZYjlteCt2SXlFcDF5Mngva1lnbjc0U2krak5ZZE1aSlgraUJmVUVO?=
 =?utf-8?B?QXkyUmE4VTF6Smw2ZlFIN04vb2JNdDc2amdUeklQVHJNWTdsQmNOS1ZoZEpG?=
 =?utf-8?B?OVlNVjdBaVh3SDNjcTROV2dwNFBDU0V3Q0FJRDZBck1oUjV4WDVySGhSbkdR?=
 =?utf-8?B?RVJQcWpRbzFyNWR3SmNVemphd3ZRS0c5c3VRV3lINmM2clFYRm9qTlIzeDkv?=
 =?utf-8?B?LzRVcGRGWjg1OEw0NWhIaER0dFhEQmNzU01OS0haZ0pxVSt2SENQSEtjOWxU?=
 =?utf-8?B?c0VoOHRDS3JpUSt6amxHZ1lidkpBVGhtS0ZiNWFvalVnc2V6MDNtRXdEM3JG?=
 =?utf-8?B?VFlTa1dGaTFISng4amo3UCtJNTFtYXp4U2VDVDIzcGo3ZHAvbU9pYzRGNmdK?=
 =?utf-8?B?TitjbUgxRGZBZDdhSERNdkxnUVp5V1dPSUNsM3pKZHNTTk56eUZnZnZkNTMv?=
 =?utf-8?B?RXhXekdEYU94VENRWG9ETWJyN0krOVE2KzFZNmlJdnlyU0hyZkZmMXFpYmh0?=
 =?utf-8?B?cUhtbnUzYk1Vd1BteW5FclY4L1Z4OWlNT0hVUjBTWmxOUldaL1lCaHdCY2tF?=
 =?utf-8?B?Q0N1QTVIcitvRXpPd0JwRDNxczhmMFFvZnl6VXA4dnJ3WGxEbmVTbHRYUWly?=
 =?utf-8?B?RGltYlhZa0hrWVB0dmtIOFBkcWdpSmlTeXpNYVdPMDNXTUd4bEp2SlBkdlhF?=
 =?utf-8?B?aEw1bFlJNDVVYjBaN3lWY013K2RodmVEMnZyRjB3SDZoZ1c5ei9SK01ReTBL?=
 =?utf-8?B?OEFPU01NbDZkRlJleklnT1NQN3RZRFlCVWJvUFJFNk4wTHJiS3dtR3lseVBS?=
 =?utf-8?B?VEErOENtRkZDSk8wTVlRL0h5RkJ4RkJnNWgweGtxa2ZXbE9Va1JVQ0d6QVhV?=
 =?utf-8?B?MTJFZkphcDF6amVQVHcyZ1hqU0VDMHl5Ynp5N1lUcEorS2VoWTJGdEZmdmlx?=
 =?utf-8?B?WEJCMGVBS0xyUHRuVjcyYUZRbmEvVXV6U3FEMFdrOUpqQmRTNnVqYTkxbnR2?=
 =?utf-8?B?UDdReWtQMkFIUC93ZFNYd0xFbWNCMUltcVBVYXlZN3NZK1l0TVB0Nys0RjMx?=
 =?utf-8?B?dXhCbWxaUFlhTkFNd3VpNktkejN6UEVXcExNVUgvWkNDVTg0U01kUkxkZ2Yw?=
 =?utf-8?B?a0NHaUJ4cURzaWRBTmttWG1vemtZRG51SkxTbHZKdGE2czdNc2FoWWNKeHVV?=
 =?utf-8?Q?SQl6boBn8nI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR19MB4732.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0krc1EyS1dDM0hCenFtR0FWeEVvTStuZEZ5eVlJMEdsUUw5THUwTFhIK29P?=
 =?utf-8?B?MDdDWldKazhWNjFwSWtza3c1SG1ibVlDYXdLL1JQUzVWYTRLcjNJZE9yMU94?=
 =?utf-8?B?MUhoN1VuV25xcUs5RWI0dUxlbFJYbUQwZk82WExhM0xKVjJheWowWnQzVC9S?=
 =?utf-8?B?aWdNNU43OEprdU5SamcxT2N2LzBzbUJPQytHY0lYaStVSXBjT1lpV3dRSDhQ?=
 =?utf-8?B?TFB2TDJWS2JFLy9LZ3JXNVByK1UrMmNEUnFUa3Z1ZXdxU2NyQ1MwV3lIeGZB?=
 =?utf-8?B?a2JXc0ZxdkVRMzVNSHYzVlRkNWRhRndpU2J6SWpSdElaUVNicldSa2hCYWY0?=
 =?utf-8?B?cVVCS2ZoVFVHRFh1WXF2UEVrZStoWU9uOEpxcDk4TkxIT0ZzSktSWVlCMEEr?=
 =?utf-8?B?UTdPd3gyWnJHL0hmUlBSTXBBMW00Uzc5c0pBdTErWDZBTGR1TjJCblkzSWdU?=
 =?utf-8?B?ZW1jWGhjVjhTQzFWNHBSQWI0aVh3WGlEcnFTSU1rNlh2eGd4WjNuaVJlZUQw?=
 =?utf-8?B?QjkvMExiVC9SSElhK2pSeVVXOGswcjZ5WjlyM1ZyRS9sL0N3dzJLaWczMSsy?=
 =?utf-8?B?eWNZQ2diVHE3M1Y1RUhhdnpDRWpXL0UyNnVvTkEzaTEzZnZtMWxhanFIVExi?=
 =?utf-8?B?VXhVRjlIQlVvKzQxeUhCdUNhU3I3cGNYaHBOL2N3dkhsdm1UenhwU0JSVnEw?=
 =?utf-8?B?R3hsUWdqU0lCdloyTkdDNWZONVc2NTNiQXBENnBLMWJVSHphWFFtOUhqaUY5?=
 =?utf-8?B?QUF5VENzNEFyS293SjRTcERDcGVjN2c0WHBqNUloOStqWmVteWoybWQyd3VK?=
 =?utf-8?B?S2RQUVJnTk5salM3TVBCTVNFaHpnSzRUNHgwdG1waTY3MWM5b3M0c050MWx6?=
 =?utf-8?B?Q25PNWVtNWUvWGtOdHdTdnl0cnhQVHlOTC9mR2NCR2RudnplU2FpMlhEaDBT?=
 =?utf-8?B?VzlyMzhMbGJ2bHdHSXNKRnUzTXJtVXcvV3o4UzNqd294TjRlekl0T0o2L05k?=
 =?utf-8?B?WGMyYmYrUWU5aCtodHhjN2JHdWxpbm5VK2M0VXZhVFpCbDhMNmJwTVRjMWF3?=
 =?utf-8?B?R2RvNkV4MUtPV3A5VHlHQndGTkFFMFJidERZdmx3dXdVMWVRYjNvOTZkY24y?=
 =?utf-8?B?WWMwVXowa3V1NTBDVi91VXYwQXdPQjZhNURCNE1hbXcwRExEdmdzT0lNQmMy?=
 =?utf-8?B?UnJENG5xQjN3MHlQTENMZWhpZDlWYnYyeFgxOTRNU1hoTkVRQkNUekpJNXhk?=
 =?utf-8?B?MWsxamlYMzN6RVpqbmt4MTk1d2p0cXJhNmRKelZ0RjlVcW43R2hvbDN0aWZI?=
 =?utf-8?B?ZnR3ZnBidUhROUtERGMwU1c5TXhWUmg3UThpVXhmMnhLUTRrZzQ3ak53Ym11?=
 =?utf-8?B?WWFHQjhUdEdoRE9vZlQveStWNGIzbVhVWlk0QmhacE5MT1FUNGlRWEJob2FX?=
 =?utf-8?B?MGpibXRORW45cXI5NUpwRlNNU3FtKzAyOXNmR1F1MmJYZk0wZ1BPeEVXQ1Zo?=
 =?utf-8?B?OGZHd3E5U1hSeXcxc0RCbGRwVmMrMWxrRDNmckM0Y21ORXU4NURnWTE2TUF4?=
 =?utf-8?B?SllrU25wcit3bFJaTmpnUk5zcVFUY1JFNE9UNklMUkdzcmpiay9obURkVzNL?=
 =?utf-8?B?NWxNem5LQ01Md09zZE1Scmc5NkdHZEpnNTU4eWdzOHVwRVZTcTBieUxJcGlz?=
 =?utf-8?B?YWZCWTFITmtvRmdXN1ozdmsrMGQ2L3l4QkVaVW1Xb1Q3dWF6b21MTmNxVzR5?=
 =?utf-8?B?ZXFjc0g0T1o5YjhDalBFejRtdTlkby9HVlpmZWVqamM5TnBWakNoZXJPUjNT?=
 =?utf-8?B?Q1RnaWw3Nkx3bjlQSmQ4WExTN29xbC9weldxbE5LM1plc202Tnc5bjlPdGRv?=
 =?utf-8?B?NkxvcW5sbVdEcm9LaDlOU2l4OEU3blJjWTFvKzM1aTFRRTl4emNMWnhMSis1?=
 =?utf-8?B?aW4xY0pEWFZFaVllMWRlVCtmSmY2ME1idXE5eDZRa2ZuSVcxV0FUZXY4MWFj?=
 =?utf-8?B?TWdWTDdUNUN6d0hwaU9YOS8wMHZxRVRSdXlkcXRUZ3FLSG5qeTRFU1Y5Z0ho?=
 =?utf-8?B?cUdxd0RRaW9RWWhyRm5xdnowKys3NEIrQ0dGY1BPWjBrWGFhN0RRTlcvZmFL?=
 =?utf-8?Q?gkywbUp26XVTETvz73t6CsI0D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d193ca-1608-45e9-d156-08dd8d4f97a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 10:11:54.2277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wc5RwDeCUWQHprAw/jNgxegVuZIT69mfBW/QqwQub5FHri5ZDZOrts36P6cGSVCiBle5up4E7L0RdA/+RdrXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4406
X-Authority-Analysis: v=2.4 cv=SsWQ6OO0 c=1 sm=1 tr=0 ts=681b31f5 cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=dkMdDuzY2HgA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=ppJngBeKAAAA:8 a=07d9gI8wAAAA:8 a=PpaX1VbUAusiNUV2x3sA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: nKvi1_JvkX-sNjliAnFud4ge2PMjwJhJ
X-Proofpoint-ORIG-GUID: nKvi1_JvkX-sNjliAnFud4ge2PMjwJhJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NSBTYWx0ZWRfXzNr8liZJwniZ DbDNC21a4pYnTJCJBU8jBeVm4Otyy5Gh6HUx/0fz5kjWvo3/h9zStUw+7B7xp8Oj7OVM/WCqXB4 5hoOIoaE6qQl/Q35dvCvcpIa83X2pvkntpoIFlAEBPum52ZAx4H5yMfdrjgo0ZctM8NZHokF9RL
 Lb1XRE19Kiwq6Si/JARKgq+ozY0WbO/fPljpQz18zYWbKY1lWB0y3zcEZaUJoSYXy6gF5SWUVd6 UOulbm+wjqYDV5FRwg3DkFnlM4JlrRlUvKoH18RK4fHybcd4mmMVOpBKbFrnryVdj4pj/CR0uDg 3P01egjP2LQkyaUpuGOWsgH+hBCXrjsVwCvf41SEGQj8HryfsFUznTNNU2GFA2fmHj9Pcotw7W8
 ZUq5Yt2W1FBpbZ4Q5Fj1tFBQ9aOirkIsawqdCVyOSoiFYnrJfmJhfHrCOGdupghrW1YOAZlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2504070000 definitions=main-2505070095
Content-Type: text/plain; charset="utf-8"

TWluZywNClRoaXMgaXMgYSBmYWxzZSBhbGFybSwgSm9uIGFscmVhZHkgY29tbWl0dGVkIHRoZSBj
b2RlcyBpbiAyMDIxLCBidXQgdGhlIExUUyBtYWludGFpbmVyIGRpZG4ndCBtZXJnZSBpdCB0byBM
VFMgS2VybmVsIDUuMTUuDQpBbmQgaGVyZSBpcyB0aGUgcm9vdCBjYXVzZSBhbmQgcGF0Y2g6DQpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGlu
dXguZ2l0L2NvbW1pdC9Eb2N1bWVudGF0aW9uL2NvbmYucHk/aWQ9ZDY5ZGFiN2RlMjA4NzQ4ZGRm
NzkxNDNiMzlkOThkYjU1ZWVlOWI0YQ0KDQpCZXN0IFJlZ2FyZHMhDQpDUlINCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1pbmcgV2VuIDxtd2VuQGFtYmFyZWxsYS5jb20+IA0K
U2VudDogVHVlc2RheSwgTWF5IDYsIDIwMjUgMTg6NDANClRvOiBKb25hdGhhbiBDb3JiZXQgPGNv
cmJldEBsd24ubmV0PjsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZw0KQ2M6IG1jaGVoYWJAa2Vy
bmVsLm9yZzsgTG9uZyBMaSA8bG9uZ2xpQGFtYmFyZWxsYS5jb20+OyBKaWFuIFRhbmcgPGp0YW5n
QGFtYmFyZWxsYS5jb20+OyBaaGFvLVlhbmcgQ2hlbiA8enljaGVuQGFtYmFyZWxsYS5jb20+OyBS
b25ncm9uZyBDYW8gPHJyY2FvQGFtYmFyZWxsYS5jb20+DQpTdWJqZWN0OiBSRTogW0VYVF0gUmU6
IFtLZXJuZWwgNS4xNS9LZXJubGUgNi4xXSBBYm91dCBTcGhpbnggRG9jLg0KSW1wb3J0YW5jZTog
TG93DQoNCkhpIEpvbjoNCsKgDQpBbnkgdXBkYXRlPyBEaWQgeW91IGhhdmUgYSBjaGFuY2UgdG8g
Y2hlY2sgYW5kIGNvbW1lbnQgb24gYmVsb3c/DQrCoA0KQmVzdCBSZWdhcmRzIQ0KTWluZyBXZW4g
KOmXu+aYjikNClNESyBUZWFtIHwgQW1iYXJlbGxhIFNoYW5naGFpDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBNaW5nIFdlbiANClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMzAs
IDIwMjUgMTE6MTYgUE0NClRvOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgbGlu
dXgtZG9jQHZnZXIua2VybmVsLm9yZw0KQ2M6IG1jaGVoYWJAa2VybmVsLm9yZzsgTG9uZyBMaSA8
bG9uZ2xpQGFtYmFyZWxsYS5jb20+OyBKaWFuIFRhbmcgPGp0YW5nQGFtYmFyZWxsYS5jb20+OyBa
aGFvLVlhbmcgQ2hlbiA8enljaGVuQGFtYmFyZWxsYS5jb20+OyBSb25ncm9uZyBDYW8gPHJyY2Fv
QGFtYmFyZWxsYS5jb20+DQpTdWJqZWN0OiBSRTogW0VYVF0gUmU6IFtLZXJuZWwgNS4xNS9LZXJu
bGUgNi4xXSBBYm91dCBTcGhpbnggRG9jLg0KSW1wb3J0YW5jZTogTG93DQoNCkhpIEpvbjoNCsKg
DQpQZXJmZWN0ISBUaGFua3MgZm9yIHRoZSBxdWljayB0cnlpbmcuDQoNCldoZW4geW91IGJ1aWx0
IGZvciA2LjEzNCB1c2luZyBTcGhpbnggNy4zLjcsIGRpZCB5b3UgaGF2ZSBhIGNoYW5jZSB0byBj
aGVjayB0aGUgb3V0cHV0IG9mIFNwaGlueCBkb2M/IEhvdyBhYm91dCB0aGUgd2ViIEdVST8gRG9l
cyBpdCBsb29rIHdlbGwgd2l0aCB0aGUgZXhwZWN0ZWQgZGVjb3JhdGlvbj8NCkF0IG91ciBzaWRl
LCB3ZSBjYW4gYnVpbGQgdGhlIFNwaGlueCBkb2Mgc3VjY2Vzc2Z1bGx5KGFsdGhvdWdoIGFsc28g
d2l0aCBhIGxvdCBvZiB3YXJuaW5nIGxpa2UgeW91IHNhdykgaWYgdXNpbmcgU3BoaW54IDguMS4z
LiBCdXQgd2hlbiBsb29raW5nIGF0IHRoZSB3ZWIgR1VJLCBpdCBpcyBub3QgcmlnaHQuIFRoZSBk
ZWNvcmF0aW9uIGlzIG1pc3NpbmcgYW5kIHRoZSB3ZWIgbGluayBsYXlvdXQgaXMgYWxzbyBub3Qg
Z29vZC4NCiQgbGludXgtNS4xNS9Eb2N1bWVudGF0aW9uL291dHB1dC9pbmRleC5odG1sIA0KDQpJ
ZiB3ZSBzd2l0Y2ggYmFjayB0byBTcGhpbnggMi40LjQgZm9sbG93aW5nIGJlbG93IG1ldGhvZCB3
aXRoIGV4dHJhIGRlcGVuZGVuY2llcyBhZGRlZCBpbiByZXF1aXJlbWVudHMudHh0LCB3ZSBjYW4g
Z2V0IHRoZSBwZXJmZWN0IHdlYiBHVUkgZGVjb3JhdGlvbiBhbmQgbGF5b3V0Lg0KDQokIC91c3Iv
YmluL3B5dGhvbjMgLW0gdmVudiBzcGhpbnhfMi40LjQNCiQgLiBzcGhpbnhfMi40LjQvYmluL2Fj
dGl2YXRlDQokIHBpcCBpbnN0YWxsIC1yIC4vRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1l
bnRzLnR4dA0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzUwMDQ1YWZmLTkxZjktNDgw
OS1iYTNlLWI3MjJiMzI1ZDIzM0BvcmFjbGUuY29tL1QvDQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjQwMjI2MDkzODU0LjQ3ODMwLTEtbHVrYXMuYnVsd2FobkBnbWFpbC5jb20vVC8N
Cg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc3BoaW54L3JlcXVpcmVtZW50cy50eHQgYi9E
b2N1bWVudGF0aW9uL3NwaGlueC9yZXF1aXJlbWVudHMudHh0DQppbmRleCAyYzU3MzU0MWFiNzEy
Li42ZTdlZDY0MTc0N2Y3IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWly
ZW1lbnRzLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1lbnRzLnR4dA0K
QEAgLTEsNCArMSwxMCBAQA0KIyBqaW5qYTI+PTMuMSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIFNw
aGlueDw0LjANCmppbmphMjwzLjENCnNwaGlueF9ydGRfdGhlbWUNCithbGFiYXN0ZXI8MC43LjE0
DQorc3BoaW54Y29udHJpYi1hcHBsZWhlbHA9PTEuMC40DQorc3BoaW54Y29udHJpYi1kZXZoZWxw
PT0xLjAuMg0KK3NwaGlueGNvbnRyaWItaHRtbGhlbHA9PTIuMC4xDQorc3BoaW54Y29udHJpYi1x
dGhlbHA9PTEuMC4zDQorc3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWw9PTEuMS41DQpTcGhp
bng9PTIuNC40DQrCoA0KQmVzdCBSZWdhcmRzIQ0KTWluZyBXZW4gKOmXu+aYjikNClNESyBUZWFt
IHwgQW1iYXJlbGxhIFNoYW5naGFpDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+IA0KU2VudDogV2VkbmVzZGF5LCBB
cHJpbCAzMCwgMjAyNSAxMDowNiBQTQ0KVG86IE1pbmcgV2VuIDxtd2VuQGFtYmFyZWxsYS5jb20+
OyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnDQpDYzogbWNoZWhhYkBrZXJuZWwub3JnOyBMb25n
IExpIDxsb25nbGlAYW1iYXJlbGxhLmNvbT47IEppYW4gVGFuZyA8anRhbmdAYW1iYXJlbGxhLmNv
bT47IFpoYW8tWWFuZyBDaGVuIDx6eWNoZW5AYW1iYXJlbGxhLmNvbT47IFJvbmdyb25nIENhbyA8
cnJjYW9AYW1iYXJlbGxhLmNvbT4NClN1YmplY3Q6IFJFOiBbRVhUXSBSZTogW0tlcm5lbCA1LjE1
L0tlcm5sZSA2LjFdIEFib3V0IFNwaGlueCBEb2MuDQoNCk1pbmcgV2VuIDxtd2VuQGFtYmFyZWxs
YS5jb20+IHdyaXRlczoNCg0KPj4gSXQgaXMgcmVxdWlyZWQgdG8gZ28gd2l0aCBTcGhpbnggMi40
LjQsIHdoaWNoIGlzIG11Y2ggbG93ZXIgdGhhbiB0aGUNCj4+IHZlcnNpb24oOC4xLjMpIG9mIHVi
dW50dSAyMi4wNCBhbmQgMjQuMDQuDQo+IFtNaW5nXSBUbyBidWlsZCB0aGUgc3BoaW54IGRvYyBm
b3IgS2VybmVsIDUuMTUgb3IgNi4xLCBpdCBpcyByZXF1aXJlZCB0byBnbyB3aXRoIFNwaGlueCAy
LjQuNC4NCg0KV2UgcmVjb21tZW5kZWQgdGhhdCB2ZXJzaW9uIGJhY2sgdGhlbiwgbW9zdGx5IGJl
Y2F1c2UgdGhlIG5ld2VyIHZlcnNpb25zIHdlcmUgc2xvd2VyLCBidXQgaXQgaXMgYWJzb2x1dGVs
eSBub3QgcmVxdWlyZWQuDQoNCkkganVzdCBkaWQgdGhlIGJ1aWxkIGZvciA2LjEzNCB1c2luZyBT
cGhpbnggNy4zLjcuICBJdCBlbWl0cyBhIGJ1bmNoIG9mIGRlcHJlY2F0aW9uIHdhcm5pbmdzLCBi
dXQgb3RoZXJ3aXNlIHdvcmtzLg0KDQpUaGVyZSBhcmUgdmFyaW91cyBmaXhlcyBpbiBtYWlubGlu
ZSBmb3Igc29tZSBvZiB0aG9zZSB3YXJuaW5nczsgc29tZWJvZHkgY291bGQgY2VydGFpbmx5IHBp
Y2sgdGhlbSBvdXQgYW5kIGFzayBmb3Igc3RhYmxlIGJhY2twb3J0cy4gIEkgY2FuIHB1dCB0aGF0
IG9udG8gbXkgbGlzdCBvZiB0aGluZ3MgdG8gZG8sIGJ1dCB3b24ndCBnZXQgdGhlcmUgaW4gdGhl
IG5leHQgZmV3IGRheXMuDQoNClRoYW5rcywNCg0Kam9uDQoKKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgpUaGlzIGVt
YWlsIGFuZCBhdHRhY2htZW50cyBjb250YWluIEFtYmFyZWxsYSBQcm9wcmlldGFyeSBhbmQvb3Ig
Q29uZmlkZW50aWFsIEluZm9ybWF0aW9uIGFuZCBpcyBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1
c2Ugb2YgdGhlIGluZGl2aWR1YWwocykgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQuIEFueSB1bmF1
dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGRpc2Nsb3N1cmUsIGRpc3RyaWJ1dGUsIGNvcHksIG9yIHBy
aW50IGlzIHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCwg
cGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBieSByZXBseSBlbWFpbCBhbmQgZGVzdHJveSBhbGwg
Y29waWVzIG9mIHRoZSBvcmlnaW5hbCBtZXNzYWdlLiBUaGFuayB5b3UuCg==
