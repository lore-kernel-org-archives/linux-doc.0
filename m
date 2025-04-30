Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083DB2DC768
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030968; cv=fail; b=ErOE74hGTxPDva54glSFB1EOs3wmx1YAOk5KsoUCsEeGBC1xXTIm8jPKFr3dS0OjWrS3usFst4uszeKZK4TNz0NZFfFOBsRpEVrY20CGUU9DoJnvj9tJ2WKsfxCwpOXJVRoh9VydD6rvOB8bOvaOWbeVsQSiDsAZaAnmiDgXJ70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030968; c=relaxed/simple;
	bh=6EVmgp/O0oxRfUL2HKL7lbkDyP75mkpsIYVFJPXZ3i4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sxz3eFXQVGXapsV3oGaZ+2E4xL3qivucMnj6mufdv9P0PMTDvLSBk9Aii5BSDjjoo5MDh9acs+PumL0d2S4v1lJTOLv7vPABHYFwGAZgPAd7q9EK1AH9CM3FLczQi8YhzwXH42+4zqhKoFjUou/kwobpsoQaitKeBCa6Vop3PmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eErt0xYw; arc=fail smtp.client-ip=40.107.244.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eErt0xYw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prU6Use5c+F8t7onC0Vi4bEPtDOjqZocgk/QuuOvbR3ekWj1qrRc0RXQPOTxjEEYBV6XxDtKsiLSvFy30N1LajRLm5jlRjlzRwPY6mKhqCOTeWtv+4zkFjftcjtk6O20JgdMzuiN+FWFHmCC8k/fOpCNWbaLPpaPySCZpaZu8zhBuYXqJwMGWg+x9Zb7TIPhi8katC2mzoHixRDhpn3isK2e6nMECdDYvLNjZwabcP362zDlAoh1DTGelnHvYXDfkrxSAzDSLc2hIQe9VaUWAdvTCIfd7sDIXlCeJHG89Y+kh9If2ah1h4xq9MjiszBiwvFi51WuCVxB6gcwG5YJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EVmgp/O0oxRfUL2HKL7lbkDyP75mkpsIYVFJPXZ3i4=;
 b=ffPWawzoe4zO5bXWXTV/US3UU0nXY/mifr++iGSHiaQCxfR4rRs6JKG9WZYAHec48/4INTfzzKmBTFvWIGsX8Fypl0E3QHvuqorkRYa9k9L46HKJfENKTbIpg4F77dgRfylIkgQ7oVn8wXn443nikH6bPdHBe6iLhlLFQj4009OaZDMP2W4W8F010tzq8RQ26oESf7+ch6rnDspiyTU2m9vjZ8D35IUoepjUffy53ZH821mHier8y176KW7Xvg7Y49HFLjCcN3VFh/2PA5OvtPTPBMfw0qM8Ecrjg5IrGI7o6WSN0cnw4TT2AS8nUnZmk31zJWs2TDNgjGaQrkD4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EVmgp/O0oxRfUL2HKL7lbkDyP75mkpsIYVFJPXZ3i4=;
 b=eErt0xYwlqcWWIuoRrHD+jcjj/cR27rHU7XNPemFVuvhRVIU3zk+gIFAqyZ017vQjKiLwVHCX5e28Hj36YVdks40mybknqVJoj4uQCB9kynNJwG2inem+o9jols64YtT95UjN4pBp9HHF4p9bmFD1/bG1u66pBw+vZJ6cEa+2UvjPdm33Ud5DpSr30fmENf9u9fZWxvOH+yV8KLVHGAY0283tBnCbgRwzbFR/UMoshbOra667K+64RqUNkH2pK+ssWQsBQpkiS+f/inJFteiw8w/RYylQKcb3CUDPL6p5bk9miEEk83Rx9ddOArh0qXJ2+ugJQY376gXLavxK0voJA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 16:36:04 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 16:36:04 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "viro@zeniv.linux.org.uk"
	<viro@zeniv.linux.org.uk>, "rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Thread-Topic: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Thread-Index:
 AQHbuS3WOq2ol36oCU+Gr+S7Jr/w7rO66zkAgAAKWoCAANuSgIAAdHMAgAAIiYCAABtwgA==
Date: Wed, 30 Apr 2025 16:36:04 +0000
Message-ID: <2835cafd300c0dfcd6d1c9d941f3253b08805055.camel@nvidia.com>
References: <20250429173958.3973958-1-ttabi@nvidia.com>
	 <2025042900-emblaze-enlarged-47e8@gregkh>
	 <758ad68deb989eaf8a22ac2bd96915bed77f0f4a.camel@nvidia.com>
	 <2025043059-lustfully-endurable-0efc@gregkh>
	 <49df4b2db57f1a431ee18f319325306ac5d13f32.camel@nvidia.com>
	 <2025043009-grueling-pretzel-086c@gregkh>
In-Reply-To: <2025043009-grueling-pretzel-086c@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ0PR12MB8613:EE_
x-ms-office365-filtering-correlation-id: 7e382b94-237b-4f1a-ebab-08dd880519ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3BsZWNXU0wvU3pkcjRzUnptN1EzeU1Rc2w4ZW9tMnNuYzdTdVA5SkZqbTJJ?=
 =?utf-8?B?RVkvMi80M25mOXhVZ21Hb3hrbWl1S2JLRFlCTEdOM0J3eHh6anBOeWp2bldh?=
 =?utf-8?B?dXF5MlZ3Sjg1ZXlzdG5talNXekE5MENPZEErSk9uQVVRQnhsSi9laG5iZUg0?=
 =?utf-8?B?QkU3UU1HNTdUVi8rR21Oc3NqRDhVYmUwM2xLUXVzYzVDNnNBenBYTVgwTWRn?=
 =?utf-8?B?N3VUMFRFNWtKT0ZHMFF3NGVXaldFeXJRUXcvTmEzbTU5VU1OYjFXVUdCOVR0?=
 =?utf-8?B?dHlORys2aG92WjFDNEovMnJpTWNiVUZ4SDRvaFhBMU1rQXI5Ti9KeEJHMmlU?=
 =?utf-8?B?ekd1N0Y2OFJFYzVOMjhsQ09RbCtwc3FldEZrQUJiV3RVTmNIc1N5Ylp0S0pq?=
 =?utf-8?B?R0o5UlY5T1R0Rnc4N2RkUENhOEkxVlcrUEkwMVVkQTRqUHJMODZpS2Y4VTRM?=
 =?utf-8?B?ZG1WbUlkSGpKUkYwMmtZRStucGwwNGZVSFlWbEtuU0wrVlhSY0RsMFNzNmxm?=
 =?utf-8?B?VEE4VytYTExTQnF1d0s2ME5RY2Y1R1V3ZWkwVnAvT1RlVUxXelk0MVNuVnBI?=
 =?utf-8?B?UnJLR2pOMkFWRDE1VGNsbjJRNWZzUHRYNXV3WUY2Q3ZFd1ZiMWdHV3EwUVhO?=
 =?utf-8?B?NEZqV29jNCtBMmtmemdUOUhMUEhnaEk2RFFBeVVwT215M0xKNzRTdFgwcmdq?=
 =?utf-8?B?dGUxaFdOaFN3RGZ1a2RZZUhaR1NSZ3BObEt0dXN4aWt0ckNySnNIUzlQY1B5?=
 =?utf-8?B?bEJPNjdkTGNkVHB2ODh4c0JDa3dyM2RCbm83dHhETlpxRmtNb3REd01uLzcv?=
 =?utf-8?B?a1FkbTZmS09HSnJ4aEM3SGlicENBRXlPMEhYeFpOYVFOdmYwQlJ6UFpINTgr?=
 =?utf-8?B?WERHQ2M4M2VUTDJVM1dld1dUdUJoQjI0cGNETld6ZWpST213YnJJR0RFVHNZ?=
 =?utf-8?B?WnVlQzJQNnEvd0tPQ3RCMWJqaWUwTnpWMVNOVGxQWXZaOXoyem9zSVVNdklL?=
 =?utf-8?B?OHFrTGpBaWE2S084TDNONkFZNlAxdWJ5RzA5TEFpWVZGSXJsNTZBbHNhV2VU?=
 =?utf-8?B?Y1M5VHgxeWtMaTFTcG5RQzRNRkx0LzhJLzFWK0Y1a0FXM1YyRXJNNklxcXNo?=
 =?utf-8?B?eHd0YjY2dFJKOXp5aTM5STFOd0c3bHk1ZHRRUllXTVNmc1lZaXFqYWQ0R1Yv?=
 =?utf-8?B?RHF6TGx5eVhaRkZEK2xBcUVwU3RKK08rTHBhcVNUU2RHZkxYb2cxUW8yOUtH?=
 =?utf-8?B?Y1F5Z1YrM3llczB5QjgrNlRNYVdBUWpmQUFvTXBoNlk0M2dPZVVIOXJGQ0ty?=
 =?utf-8?B?OHhBMlpFd3hWY1F5TzBqb05vWnlYVmdtY2MybFpNdVc0YUE1NysrdkV0R0xT?=
 =?utf-8?B?eUhrWlNLZ1RlZ2JQSE56TTRHQVdkSTN0SE1ZU3VjSnBqTGRRQm92ajdLTHNk?=
 =?utf-8?B?SS81QUFDOStXWUk1djArVW1EbU5oaUFIZEVHVUY4RGRuRXNOUnNJM0hZSC8x?=
 =?utf-8?B?TVVQYXVsUXExQm0yZmtkb0VTYXljRDJic3V4UmV0WjVGMVJWR2NOQ3plaFpI?=
 =?utf-8?B?TllDQ2hjSXRpT3plWVRRYTJkVTMvRFNuQ25MVWxremZZQ3NjZnFtdEVZVFJI?=
 =?utf-8?B?MkdJcG9QYkQ3bWhPVG91Z1Mwb0VTSnB0N1JuNVFEdTZOejJqcWRaREkwZm9n?=
 =?utf-8?B?SzYwREMwUEJ1TlhLaWRhdXdWRk45dFNGajlSajdXeU1qeU5YZnI2ZTJEdDN1?=
 =?utf-8?B?d0dUTGhmVzcwcWY2TmVpMXgyWlY2eXVPeGNYemRUTkhyb3plc0lncVZVQ1dl?=
 =?utf-8?B?QWZ5ZjVrbjBmaGx3N3ExVTdEcUtlMW5tYndKYU90a3czQjdKZlJheUp6cGFY?=
 =?utf-8?B?WTMwWlc4MytzZUNtbEJHTjlUV2JQSENUNXFVM0RHUFNVaktCR3lNTWxrNHo0?=
 =?utf-8?B?SEY4RDlOVXdKcmd2dEdwTTk3V1R4YnhtR2NCVytLVXJUZnp1ZmVFaExHaEd6?=
 =?utf-8?Q?lBOYtdwGX04VuyNlWV8w32WsDEL0tE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3EyQ1pDWFBGNzM2ZndYMUhoSkpVVWxGcW9FamFoNVYvVHhWeFlnTm9kUkhP?=
 =?utf-8?B?UnEyMFhlOEdROHBSTjgvaVFEbDVnSUVhSzZhVEYvdE5PekJwcnNFZE9pOUY2?=
 =?utf-8?B?cEhVMnRSS3BEcS9TOEtGdEJ3Y0ZNMzh1UWdNRm1NbVdqVWdzNGFKSXE5Q250?=
 =?utf-8?B?UERaMmdHcmJmU2tEalRXQXpjZmE0L1V3TUU1c2wzcEpPUjdoanVwL1NlYXRQ?=
 =?utf-8?B?QStPQlFaYTM2L1V5WXJTaGVvSHl4Y3FNenNSelN4WFFGdVkrbCtTdXZlTVEz?=
 =?utf-8?B?L1dkMXl5WWdid3I1L0c3bVV2OFhpY2E2UUJ2UW5ncnl5dnJHdU92VTVCRFZ6?=
 =?utf-8?B?MVhiZGVPOVcwaU5mRDNCbGIyaWRsc2ZqV3EvWnIraG1iSVlabWZYT1N1TEE4?=
 =?utf-8?B?UVVYQ1pTb3NFVHNzR0F2TGlUYXFxN3RXTTRMOGtsNUhTaW9UU25yUmlpT1hV?=
 =?utf-8?B?Y0l2dXFZNXp5SmhOUmhKR24rSUcrYWVDTnFuRXduQmVtNnN0MTdjUFRDdWhP?=
 =?utf-8?B?bm9JV1hsbGh3QVV5S2NSWVVWZkwvRHhmVVIwdXJrUjRIbGFGays2eUhtSlJG?=
 =?utf-8?B?UHAzZHRjTFpQN0tGdDdRNE1tTlF5aXZSaGFJeUFMSThMb3dRckxPS2Q5L3RU?=
 =?utf-8?B?UEJKbVU4a0tvZlhaT0tuRFdSZmFSa1hZZWk2QkJMK2JTVVFpdzJQMnJjbkIv?=
 =?utf-8?B?NUx2VFQ2bmxJVnUxM3UrZzJJYURBN1E2VjJGc3ZwY0NwVE5KWmlsdDNaK05I?=
 =?utf-8?B?d2FSSDVObHVwcS9FM203U3Mzbk9TRHlKbDNqN2xmVkdtS3grNld5M2JGSDU5?=
 =?utf-8?B?bGp0ZlVielBvdDJ5ZTR6cHU0RjNWZHhja29sU2FVK2grdEJtZi9HeDFodHND?=
 =?utf-8?B?TExyVFpibEE3ci9OaWhzS2ZnUjJaVVhndHlaTXpmZ1FyZzNNalByUjUwdmlh?=
 =?utf-8?B?SytkUHpaZjFONEg1eml0Y2w1cW9lc1R2SmUyVkpKdEdjaTM4ZmN0a1E2Ri8w?=
 =?utf-8?B?cCtvM0Y1K1I2SlBPMzVQUHRjVFFma2NsZDN5Qk5ZcXRMTlZxMk4vV1hzeTVC?=
 =?utf-8?B?STZRQTJONHZRL3FzWnVmQWNEM2dBNzNySVJDaWtWTzNDUkNYaFZMQUVyTmxo?=
 =?utf-8?B?OVFkTXQvWGt0RzJQK3hCVS9IYUNXc0YzZXhrZUNzZUpjRFczdWJURy9TNlVO?=
 =?utf-8?B?bWtCK1pmZ1dEV1p0Mzd5WWg4V2NMZGUvZU1Bb3REOU52eTlUbC9kS2pFcmFY?=
 =?utf-8?B?cWdZSGNyV1owSUg1WGd1cFdWN0x2Z09rSVdPSHIvSXRoOGo2d2k5U2x3MjB1?=
 =?utf-8?B?aG9iN0FjNUEydkN6NENWdTRrY3Y3YXloa0kvcitVSDNzNE8xUW10WExXSk1M?=
 =?utf-8?B?ZWRFSTA4SnNQd3dxWitWdzByNzNMNDU1SWJFOVpDM0xpeVQ1T0FhNGd3UW5I?=
 =?utf-8?B?Ly9TTEJKTW5uUjJrZ3F6d0xCMDdMZTB5ZnBPdjhLeHFxbi9uZzRTN2pYZDVn?=
 =?utf-8?B?V3pZbFlVbC9JVmVJYUFYRGFpbXdLU0FRTVZkTTRmM0JPaS9UM2lPa1R2ZHBy?=
 =?utf-8?B?aFZ3WHpTT1hOcDdFUndReDNoeUpVckgvY2w2TTYzalJxN25BdGkxN0UzSDhY?=
 =?utf-8?B?V2xrdGt3bnpVMHJoejZVZS9uRHl6VTZJcDdndHFtVlRLbE1PMDJ4MlJkSDR2?=
 =?utf-8?B?dnZEV25JWTBkelV5aFNKamNPZVdQS1JkN3RhRkFsTWY2bnJZOUtBdEtEVUFp?=
 =?utf-8?B?c1AwQnE3eHRCZ0MxN0dNdE01aDQxQTAyOUVWWGFLalY0bFlQQWQ2MnNPcDAx?=
 =?utf-8?B?R09zV2VZL1NCbm8zSmZZY1pLM21JS1RxRGs5eEFISHNZZTZwZU9ZcGdoWm5k?=
 =?utf-8?B?b1hmWnorRGd6b25vOGlTenRuZ2lXUUNhZkgxWiswbXdEYVcybXpxWmQwUm8w?=
 =?utf-8?B?YjBtTzNFV0VsSmw2U1J5OURjY3Q2cVF1TnllZU0zY1RYR01YYnFLUjlMUG5Q?=
 =?utf-8?B?UlJJR0VmOWZZR1FTd3Myckdta2Y5Ry91L3pSYUFpVG9BL0pOc1NQT0RKRVZs?=
 =?utf-8?B?YlJXVU0vSE5yRFQvTjFneUk5d1BTdWE1STRQZUhUVzlUa0ZvUGtmT1M3aWJm?=
 =?utf-8?Q?XzB78brfd0sWncZ+Gik2IA/+9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <325C83E5F43585488E23A413FD40CDAA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e382b94-237b-4f1a-ebab-08dd880519ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 16:36:04.3254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exJsUzkggNS50961/LnILJ/oI1HZxO8WtdU2hjUxOh7rNOPREhBbQ0wz9UkpCVnNykIuhhbzUE68+ZD3yvcNRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDE2OjU3ICswMjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gSSBkb24ndCByZWFsbHkgcmVtZW1iZXIgd2hhdCB3ZSB3ZXJlIHRhbGtp
bmcgYWJvdXQgaW4gMjAxOSBmb3IgdGhpcywgYnV0DQo+IGxvb2sgYXQgaG93IG1hbnkgb2YgZWFj
aCB0aGVyZSBhcmUgaW4gdGhlIHRyZWU6DQo+IAk0MDIJZGVidWdmc19yZW1vdmUNCj4gCTYyNwlk
ZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUNCj4gDQo+IHNvIHdlIG5lZWQgdG8gcGljayBvbmUgYW5k
IGp1c3Qgc3RpY2sgdG8gaXQuwqAgTWFqb3JpdHkgd2lucz/CoCBTaG9ydGVzdA0KPiBmdW5jdGlv
biBuYW1lIHdpbnM/wqAgTW9zdCBkZXNjcmlwdGl2ZSB3aW5zZT8NCg0KSG93IGFib3V0ICJpbnRl
bnQgb2YgdGhlIG9yaWdpbmFsIHBhdGNoIHdpbnMiPyAgSSdtIHByZXR0eSBzdXJlIHRoYXQgaWYg
bXkgcGF0Y2ggaGFkIGJlZW4gbWVyZ2VkIGluDQoyMDE5LCB0aGVzZSBudW1iZXJzIHdvdWxkIGJl
IHN3YXBwZWQuDQoNCj4gTmFtaW5nIGlzIGhhcmQuDQoNClN1cmUsIGJ1dCBpdCBqdXN0IHNlZW1z
IHByZXR0eSBjbGVhciB0aGF0IHRoaXMgaGFzIGFscmVhZHkgYmVlbiBkZWNpZGVkLCBhbmQgdGhl
IG9ubHkgbWlzdGFrZSB3YXMgaW4NCm5vdCB1cGRhdGluZyB0aGUgZG9jdW1lbnRhdGlvbiB3aGVu
IHRoYXQgZGVjaXNpb24gd2FzIG1hZGUgaW4gMjAxOS4NCg0KPiA+ID4gDQo+ID4gV2VsbCwgd291
bGRuJ3QgeW91IHRoaW5rIGl0J3MgY29uZnVzaW5nIHRvIGNhbGwgYSBmdW5jdGlvbiBuYW1lZA0K
PiA+IGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSgpIGluIG9yZGVyIHRvIHJlbW92ZSBhIHNpbmds
ZSBmaWxlPw0KPiANCj4gQXMgZGVidWdmcyBkb2Vzbid0IHJlYWxseSBjYXJlIGFib3V0IGZpbGVz
IHZzLiBkaXJlY3RvcmllcyBpdCBqdXN0DQo+IGRvZXNuJ3QgbWF0dGVyLg0KDQpXZWxsLCB0aGUg
d29yZCAicmVjdXJzaXZlIiBzaG91bGQgbWVhbiBzb21ldGhpbmcuDQoNCj4gPiBJZiB5b3Ugd2Fu
dCwgSSBjYW4gY2hhbmdlIHRoZSBkb2N1bWVudGF0aW9uIHRvIHNheSwgInBsZWFzZSB1c2UNCj4g
PiBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoKSB0byByZW1vdmUgZGlyZWN0b3JpZXMsIGFuZCBk
ZWJ1Z2ZzX3JlbW92ZSgpIHRvDQo+ID4gcmVtb3ZlIGZpbGVzIi7CoCANCj4gDQo+IExldCdzIGp1
c3QgcGljayBvbmUgYW5kIGJlIGRvbmUgd2l0aCBpdCBwbGVhc2UuwqDCoA0KDQpUaGF0J3Mgd2hh
dCBteSBwYXRjaCBkb2VzIQ0KDQo+IEVzcGVjaWFsbHkgbm93IHRoYXQgd2UNCj4gYXJlIHJldmll
d2luZyB0aGUgcnVzdCBiaW5kaW5ncyBmb3IgaXQsIGxldCdzIG5vdCBlbmQgdXAgZHVwbGljYXRp
bmcNCj4gdGhhdCBtZXNzIHRoZXJlLg0KDQpDb2luY2lkZW50YWxseSwgSSBub3RpY2VkIHRoaXMg
YmVjYXVzZSBJJ20gZG9pbmcgc29tZSBSdXN0IGRlYnVnZnMgd29yay4NCg0KPiA+IFdlIGNvdWxk
IGFsc28gbW9kaWZ5IGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSgpIHRvIGlzc3VlIGEgV0FSTiBp
ZiBpdCBpcw0KPiA+IGNhbGxlZCBvbiBhIGZpbGUuDQo+IA0KPiBOZXZlciBjYWxsIFdBUk4oKS7C
oCBJZiB5b3UgZG8sIHlvdSBqdXN0IHJlYm9vdGVkIHRoZSBib3ggYmVjYXVzZSBhIGZldw0KPiBi
aWxsaW9uIExpbnV4IG1hY2hpbmVkIGhhdmUgcGFuaWMtb24td2FybiBlbmFibGVkLg0KDQpGaW5l
LCBwcl93YXJuKCkgdGhlbi4gIEJ1dCBsaWtlIHlvdSBzYWlkLCB5b3Ugd2FudCBvbmUgb2YgdGhl
c2UgZnVuY3Rpb25zIHJlbW92ZWQsIG5vdCBlbmhhbmNlZC4NCg0KPiBTbyBJJ2xsIGRlZmVyIHRv
IHlvdSwgd2hpY2ggb25lIGRvIHlvdSB3YW50P8KgIFlvdSBvcmlnaW5hbGx5IHNhaWQNCj4gZGVi
dWdmc19yZW1vdmUoKSwgd2hpY2ggaXMgZmluZSwgYnV0IHlvdSBnZXQgdG8gc2VuZCBhIHBhdGNo
IHRvdWNoaW5nDQo+IGFsbCBvZiB0aG9zZSBmaWxlcyA6KQ0KDQpJZiB5b3UgcmVhbGx5IHdhbnQg
bWUgdG8gc2VuZCBvdXQgYSBwYXRjaCBtb2RpZnlpbmcgNjAwKyBjYWxscywgSSB3aWxsLCBidXQg
SSB0aGluayB0aGF0IHdpbGwgY2F1c2UNCm1vcmUgaGFybSB0aGFuIGdvb2QsIGFuZCBJJ2xsIGp1
c3QgbWFrZSBtb3JlIGVuZW1pZXMgdGhhbiBmcmllbmRzLiAgDQoNCkFsbCBJIHdhcyB0cnlpbmcg
dG8gZG8gd2l0aCBteSBwYXRjaCB3YXMgaGF2ZSB0aGUgZG9jdW1lbnRhdGlvbiBhbGlnbiB3aXRo
IHRoZSBjb2RlLiAgVGhpcyB3b3VsZCBiZQ0KYSBsb3ctaW1wYWN0IGZpcnN0IHN0ZXAgdG8gcmVw
bGFjaW5nIGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSB3aXRoIGRlYnVnZnNfcmVtb3ZlIGV2ZXJ5
d2hlcmUuDQoNCg==
