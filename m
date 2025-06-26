Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1B1FFC41
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947656; cv=fail; b=B8TJveINSgbwLs/aZ8x/CIJffZgsEWZDygY2N93cuK09pc0BKlkwnJ1dnXCpHXUuTX+K4y01AXX0Ov6iZfhyLyfSPRz4kAloyeKJNlkMlPW2Ux1hIcZzueZ65Ar4U/dm8rHBYA0+XTFhHbGqghLF64PLSKRyvh5fwL8VgGL4cMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947656; c=relaxed/simple;
	bh=IVnfkjymnTDodc43cM1bEIu6iyQ/uDRk+jRMX80T5bQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=liJXQIYmuNyIiG5QaiKyhBR5A6ZP6a0GrAPDWx3QxUqZRPAxBBINhSj1+C14vYQ+NQ8ZZUzFcCvRs23fyUpFFq0iKckIOhu9QU1jJbQJJgXikeVBS4EVNuuOOHktlBrnT6HrnXWNj6JZcUSilOQJItxV4IBexA51iesSjPoYTmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cCjzDRoG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W/bvX4qe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cCjzDRoG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W/bvX4qe"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCaWo1027610;
	Thu, 26 Jun 2025 14:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IVnfkjymnTDodc43cM1bEIu6iyQ/uDRk+jRMX80T5bQ=; b=
	cCjzDRoGS3mc3rIz7m4C5Br1b2ZD/wW2PKNqNb7Kqy1k87bz1s6pVANb1XISKpCL
	NIsijcxKuCvI9WtqMISg7VKdPRgOrZ+s/6lyzmtHr6W4c991RnaacpkmTwr8RWco
	gCI3v0GhVjBKE39ZU8E2CRoteanqYcmPG/hxSXZ06n29tIzCHxJMOj80PGXP7iD2
	aYe9w74xajQxMfcDmWOruTxDXhrtjG+lXGOpAd+Qp+qRFPwu8qutNN6kOSmFC38m
	CX6GU2yu9brCcsAzA+7zjNspjzySx61G5G/Pj/bqDoMXl/eUSYSRJAfaZrkVORm/
	z1Qd8C5y6ZZbOJg0/goepA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumrwks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 14:20:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55QEK82u002502;
	Thu, 26 Jun 2025 14:20:51 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq6jhpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 14:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqbVV017yS2SYwHelmja/aMTEiDzxxt944RwxLZJJBfuJ3JnKArckkPInmu1uBHyXwZJWnOZCQ+cXI7h84Uww4cmqzkZg/StSKlygKkUxivy4xqsZPjLINELyNfAqevxfBe8MnIMzPSr4LwBBKloAhD8E03J0iPlutoNqtD3qEGOM9JZ77UnEmK6Xxkvdk2J2PnytRZl6P5b4Rqa9HyacFHZYKGtnBpTmTpwGLpVGUTJRMTUrnb6GA6tg422Kv/Q6qYUeKKYQ1e23YBdXvCWj2xxWLu+l3odHuk0+3jpRmVRpXdehTvis1n3hnod3/ArFMEE6aXlJWLp2qgp+3HkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVnfkjymnTDodc43cM1bEIu6iyQ/uDRk+jRMX80T5bQ=;
 b=noqOi4eT7CQ/IwYFudORfTE4w8T1MJ345w3qc8ZOOCXSGoXg8M/KQRRhNzSjSjt4NTYVfEWl0h5GM0dRBwKlKnn8Rit1ILOS6FuLBMygszSYzJGEAKPKUNyirT21tp4JP5NX1dL4BcvLC3XKKjpLEqMDSsOorkYZ/FHrKom6Md1m0wXF99LfxEMouYLjFynGWI+HxDKNbApsJgT1R/6lbB9G8jrzVfeOZKtqkWVvMnosnIjAwiMVw96aj8MltuWGpO5xB4NeG646unN83V1tKL8wXnQ/s5NoUqeIyL1TJD7UTMObao6rM3nUFTq/v8BX/aLP21IAtXxpmVaky93jXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVnfkjymnTDodc43cM1bEIu6iyQ/uDRk+jRMX80T5bQ=;
 b=W/bvX4qeeYtMz/0PM8qrADoda4wclO8ybOXzEQ16QxR5LtAMNmWlWv//1VyymVvq1wnfrMFPENpnKXeU02WPOcfjRgdMcyvNnJB9BM0325Q08nO7kbcgYFXOtZE9DYh/ZRANNZKIXbu+WsNgzj/0U7gAS7KsbirZZjk8/ViCCvY=
Received: from CY8PR10MB6826.namprd10.prod.outlook.com (2603:10b6:930:9d::13)
 by PH0PR10MB4599.namprd10.prod.outlook.com (2603:10b6:510:39::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 14:20:47 +0000
Received: from CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::f9d3:19ef:4ce8:4d63]) by CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::f9d3:19ef:4ce8:4d63%2]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 14:20:47 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Akira Yokosawa <akiyks@gmail.com>
CC: "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/1] docs/memory-barriers.txt: Add wait_event_cmd() and
 wait_event_exclusive_cmd()
Thread-Topic: [PATCH 1/1] docs/memory-barriers.txt: Add wait_event_cmd() and
 wait_event_exclusive_cmd()
Thread-Index: AQHb5qSd7jWJP+U5SkeFhyiY+Sp4c7QVfa4A
Date: Thu, 26 Jun 2025 14:20:47 +0000
Message-ID: <434225A3-9CA9-4AD0-8C4B-E7417E87CCED@oracle.com>
References: <20250626123022.1525131-1-haakon.bugge@oracle.com>
 <902c167c-bb6c-4d3b-a720-011d19d4176a@gmail.com>
In-Reply-To: <902c167c-bb6c-4d3b-a720-011d19d4176a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6826:EE_|PH0PR10MB4599:EE_
x-ms-office365-filtering-correlation-id: dadf82c0-acda-4da4-81f5-08ddb4bca518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVlrdFl2ZVp3dGkyY2NidHI5ZjZoZDVpTGpKMSs1MFUxVWpDWE1PSjVSb1NZ?=
 =?utf-8?B?VG4rRjdqZFRpYWJSbTQxMGJaVnlYMEdtc1dpNVBOckVPL21tN1NaS3R4Z2Rk?=
 =?utf-8?B?ZkFjeUMzMER2bHVGK3IxTmd5RXVaQlFKUlFXbGFQR3FScDdMSnpEcjdmM0Er?=
 =?utf-8?B?ODU5WUdCOEZ3TE5telY4cFRHczc2SjQzMXQrVmdPK285ckdBblpHcExwMWZq?=
 =?utf-8?B?UjBaV1hyM09PY01NUmtKK0RXRGZOQmNyQUhuQ2VTbDh4cFo1VzAzcExnZTJL?=
 =?utf-8?B?TUhCL09hYlZ5NmJSWWFMK0FWK2xqaDJSdVZucUxNNzJ1L2NVK1cxWHk5SXNp?=
 =?utf-8?B?QjBtendYSUZaK2w1RGJEbkR2TmQyK0MvWEFSYWhpL3h2RmVkU3czbHZIMlpB?=
 =?utf-8?B?MzBGRUw5VkFrU1g5Y2oxNzd0cGFyMG0zSjMyL0Z4VS9oYTVTZHFRUXRXMDdo?=
 =?utf-8?B?d3MzQ1U5TDh5MWc3cEVhVTN4Tm1pVUNZNUI2T1BPNEFGY2ZuNTdaQ21mMUVz?=
 =?utf-8?B?TUVhanVhU0QxeXgxOG1qd0FXVWdzVmZsQXI5ZTM2RkZ6VWZIK3RBSnY3Wmd2?=
 =?utf-8?B?eGkwSlZKbE1UQWRNUzI2U3Vyenp6Y2dZdkhKSC9VYjJqZjl6YTByL2lua3RI?=
 =?utf-8?B?YWU5bDdmSHA4TmhVUDdoOTdZOHdoVXhiWEpPSlVFbEtQMDZxbjhzeUdsdzhF?=
 =?utf-8?B?U1BWcDcyUjdFV3dWZWl3NDN3Ylc2WnQvSTBMTjc5RklLeEVMZnNKVGtUemlR?=
 =?utf-8?B?SWtYVGphK09Bd0xJL0NUZWkxT3VRcFdrb2wrN0J0cUM2Q0kxNUc5cjhmWGxB?=
 =?utf-8?B?Y2ZFeSt3NWhWdjBwSm1XMTJJZHJFYU9mZExmNnN0cmUrWS84eUdtU1Npbkc4?=
 =?utf-8?B?NDhsRjVYc3JOQit3YkZlQ2NYaVRYSCtnZkJFRkZnS253TXJlK3YwUmUzZzZ1?=
 =?utf-8?B?bGxCVm9LWndpTWxEUDNleWt3ejYvdU9lYnJjcHdZNGdTM3REQ1d3dXhIMWFI?=
 =?utf-8?B?MCtENEMxTkxuTnZvWERxdzA1RWtDV2MxaGpmVWtyNHNCd29hV2tjOXBjcmtC?=
 =?utf-8?B?RzE0andMOXVIbEhYbUJ0aHRqMkUrOFZZUTkrREtZRmk4TXlCcWlJK2g2WXhr?=
 =?utf-8?B?U0pVSE8rRm8xaWVFMzZ5bUJ4RUk5V1RMSG9LTkFNR3hUZURDb0ZuVXB3VE5t?=
 =?utf-8?B?MVVBbm5yM3Zvd2N3YURDU0J1ZDVPcHNxbi9Dc0FRbVJXL2xCQytoV3BrcGxh?=
 =?utf-8?B?ZDUrclFhYTg3aXB3YzdqeTYrM3J5bUJ1OTNBM25ON2F1R3RjQ0NITUNCVXlU?=
 =?utf-8?B?T2JLQ01BMFlGV1ovRlFpWXpvWEhmQTJTajdvN0NhSkF5d2JoWUVTOTZMUWQ3?=
 =?utf-8?B?SWhMWU81NjhVYkVLKzQ2ejFGTDNWWjRwWFZ0UXFZNGlVSnpzbTFiTUpKOGNW?=
 =?utf-8?B?S2g5VW41VlYwRWVrWUlLZy9CdWF2c0VPNG5IOS9rSHFJZjZ4OWlSbmdiUmRO?=
 =?utf-8?B?d1Ixek9hUk1VekZPaVRkdTNIZnFmNi84Y3JYVGNmYkh4cjQ5QmZmOTZxMDlM?=
 =?utf-8?B?MG1EY2hJRGx4Y2o2SDhNYU9FM3pvbnlqZVRRSTU3R2xpbk5XVG8rRGptbWJG?=
 =?utf-8?B?ZUFTaFZuTjBWaW1CNitWYkdodmx6ZExLQ2FuZTFYdFdiaHJVbTBkejVmTkhy?=
 =?utf-8?B?ZnN6RVRjdmVjSDBFR0t2MDhZeWNEV2hPVHN0d1pwWUZuOVY3dURhVlF5ZTM1?=
 =?utf-8?B?TTRGdE9YTEtxV3cwZzVHOWtnSjNnOWhsdTU5amNOZ2FLeHNxb25HbEhnRzJ2?=
 =?utf-8?B?ZlFzZkI3UHh2TFkvMHVHcWJxaFJ6Q3NPVXBLbzgwZW9QUmRCK2RuL1ZLVmZP?=
 =?utf-8?B?cE1WU1FpWVFhUHRqeEJqZWZrTk03b2ZwN0Q4cU52Tm9oT0VzRHY2clJDQ0gr?=
 =?utf-8?B?dkZ6L3RhcmNSRTRjcHJDeU9XbDRTOXJPaGNNS3dvQy9lUDBwOHlpNUVSd3d0?=
 =?utf-8?B?T0x0SUhpbmZnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6826.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3JwZkxpbnVISTVsNjdHVThycXFQaldnR1Q1VnkrY1NYa1RGRFY0STM5eW15?=
 =?utf-8?B?ZU93aXJodkRJQTFpV3NZU0tnUjJxNVcwdGsrNG9vWU1yVDhTYUlYQndXTng4?=
 =?utf-8?B?NU1qdlQ0c1Nrb05HSmpyaWcxYkI0QnVwMkRDbEhUQzJZdlBSVS9sanNVU2Jn?=
 =?utf-8?B?UHJVUEcwVEFSaXNhUkpKSWt2VEd6VDlCOU5WOCs2ZDdNMExJVG9JVGs0aHpO?=
 =?utf-8?B?QU5iZ1lrRWVqbDlsS1lLUTA2d05OSlNkRHFmdlZUdCtrbzNCRlhIYlVaL0lC?=
 =?utf-8?B?NmdnMFFuWFdldnAvT1NvZEZ5NGFUZnBHVGZWU05TSW54RjFKajhDT3VBWFBy?=
 =?utf-8?B?SG9idFRtMjdIWTZVT0ZZaENMeTN4TndDM2xmZmVNMDdDbktJaXI0RUo4Q0NF?=
 =?utf-8?B?WlhOdTNxc04wYk00Y05pU1hwZEtrQ0ZjeldXK0NKSXdkVWR5dk5WSUxNa3cy?=
 =?utf-8?B?cUlqMUJQbkJqUmxQOXhwNFVOWDZoUThOallRZ3h1WGpsVDlmYVFUSE92WlY0?=
 =?utf-8?B?d29MN2JFaDgwM1JmQ09kV3RIdmVTbDQzZVYzdERsc0xmZnVkajk1aTVWSFNP?=
 =?utf-8?B?NVJOclBEVEpTbEZ1TTFJRFNENjdTeG14ZDZXd09yYzNtNURuMUxXNCtBNUE0?=
 =?utf-8?B?Y3E4c2ZNVFdLbk9uY1VMa0hXOHlQOU56VE5zSllUeVJRaHN4d2hnTU9UUFlz?=
 =?utf-8?B?RTJSVm5IbXlZd1lPc2dVaXBMeHBkZjErM3cyYStYcDd5THZVcWNyRHJwbUlB?=
 =?utf-8?B?aFg5eW9WK0wxM2NrVnN5WWtyMVhtM3FWZU5Fenp1d3VGb3NUSkszNVBheHQ3?=
 =?utf-8?B?d0dMS1dWdnIxUFR3L041UUJ0Vmxxc2Y1MzZObUEwY1ZVQktDZDBuREluM3FW?=
 =?utf-8?B?TUJYa3M5QSs2eXl4djNSTFlNaStvRVJzd2xDMXk3d1Q3RVNtZlVGWUhDV085?=
 =?utf-8?B?MHFueVlEbTdJM2ZhVHJwbEgzTUZEdElsK3ZKTytsbFBRQjNyR0pMeDRrd1di?=
 =?utf-8?B?SUZyOXFKOW5xNDFNaTFSQkdQVjRUelc2djc4bTBISVZlczc2QlpiUHFuT2VC?=
 =?utf-8?B?ZDUyQUdIVzJhU0Y5SXIvTXpsMFg1MEI5R1EyTGtsclFLSmQyK2JXbWI1UXN5?=
 =?utf-8?B?NUFqN3dIZE1NVUcrWTU2VForMW4xRWFJd1hqQ0p2SlJ3SnpoWWpoYkt1a1l2?=
 =?utf-8?B?VFJSUW5uY1U3WVR5dlF0RCtoUUFidmxKTjVNUy9PL1RQeVROMmduSVhMV2sv?=
 =?utf-8?B?aWFqekVsZHcvY0hzbGlWSEY4RnNlUzJPNTBQUEw3aWNBUnVjNDN3OUNWcUtw?=
 =?utf-8?B?Zzh6TjM4MmNxQUszNm1GZTVqTGNDNDNzZE5hL3ZEeHB5YnZrNEVRNHF6WGFU?=
 =?utf-8?B?Ui9ZeDFkMEovdTk1ZkNpNUZMRXIvTjlVQTVlY0hKZWRHRXpTajBqaGdKVks0?=
 =?utf-8?B?OXg1ZmtwQXlmdXBkRVpMajZrUEkxbS9yYWhWWGpTYzh6Vkd0TG9qT0JpdXlR?=
 =?utf-8?B?c0x3aTVjSjFRSTJzTnhuQWk4cVE5RmhwVS9yNHdhMkI2T0E0SWNKeDZQTHBk?=
 =?utf-8?B?Rm5CNHplY1lPU3Z1bm1IUk8ybzgxTWM5ZGcrNEY5VmQ1YSt3RHFjZzRHK1R1?=
 =?utf-8?B?K0grb1VhcTNsSHVESm0rOVdJUWJKSW52WTYyQ2ZlL1BDbWdZakd3UE1iVXF3?=
 =?utf-8?B?MzdKRUwrY1lTMVhhK0p6SSt2S1JFcm9qVi9xdmprYVdtaFBUWGlFZy9FRTdr?=
 =?utf-8?B?R09RVlpFajB2T3R6c0I5bGRKT3A1T3VrZDd0RVBQcmh5SHp5V01UdnFCYVEz?=
 =?utf-8?B?eXZZMVYxaTNmOE1hUzUyb3M1d0RZR2ZhUjBLNEpRUTFLQ1g2eXgveUpmM2o1?=
 =?utf-8?B?OUhuNnRJWnBSbCs0Snp4NExwWEgzb2hyM3dkaGRmNVpDMFpHNFA4bGg1S0ZO?=
 =?utf-8?B?NWVyNDR4bWd4bzMxNWpKNGRPZG9HbSs5M1p4K0cyQkdSK1hqQndlU0Jtb0dj?=
 =?utf-8?B?SzNsS2NoUncvVTlMM3U5RjlJYm9DVDUrRXpERDRKbmxjaWI5VWE1alI0aGI0?=
 =?utf-8?B?cDZ5VWIyRk9KcFA1MXh1YUo0Q05IV2tRRFBDWFQ2bUsyZmRSWlpteFQ3a3d1?=
 =?utf-8?B?NU5UT0R4bWhIUWEwTXlYNHl2Q0ppSTJuVk92c0FWWWxJM2c0dkV2YkhjNW1l?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFC74159F990314C8B99A23ACBF4EAE8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KQiJ5k7t6sQ35OL9q4aDZmdU9oIqQ4tQdf90V0ClT8/vQiY74Y0jrrmSgf+jKDN9P+9EWu/gOQdQVC6Qy6C69ZtXuuetqmST3PuvwicXTuu6goyO/N4dbvdj9wy+Y90tXs+D+bfQKrv1Ed0NunRzM8V+I7jo+uZyAZ9NNmr+S/kP1WswU37Pw9rkE+QeHkk/wKjX3Ok6A0QxyTznbzfIhHpZLlT3nfgaOYYSCYRLTcZ6qkko/GbPArTv18++2u7llv8lJY3sce5LWWGLD5zhdim48kNNJ2/yBehNprqzKU9/8KxZq7p4ADqDOQ82jmb0hyKSItUeZ8wFhGBd7IYcRAhf1dVXm/Lln7nL22QIokEILkffsdViaJqYmdd3UsvuaYZfsji/pPQztpRUlS3/7+jIX51sOs5e+YC6HtoIfz/r95kplBLY/sEtKtJn8WV4vKeR51JhqMkQ/2K0fbsfAkgLY3nsTJ7rTiVvRYoXgPdFwDFF2PoNaByVypv2V/jamrc/o4JENZdzGYLOvTDwIhrORBRuDit22MgmBuVl84BZf7tkqxPC+sehK7mHnKq/CZ4iHbYQ1zn953SDzptGG8HebUc4z5O9YgyuhXxxFFE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6826.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dadf82c0-acda-4da4-81f5-08ddb4bca518
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 14:20:47.2624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ooi8FOQReA9KF3ZYzpCa0ugmT0a0wawBuGMDhmmSZEO6MZtM5jjIZYceZ+9MMWx7ocuR++XbjxBbUQzSAbUkRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4599
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506260121
X-Proofpoint-ORIG-GUID: ieabPA4uT83fPyfGH3v1fIKoedBWBf6Q
X-Proofpoint-GUID: ieabPA4uT83fPyfGH3v1fIKoedBWBf6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMSBTYWx0ZWRfX7LyhLKCZxQtR xmuO4pVBCLFRa6PSHMgyZUUQxTAcn/fr/3wWtUsdBeolSUAYG0wu2VFjUkDogxv/UAaxywy+CSv MosInMK6f8DlsFRBqT9jQEFnw3OSkQErCp0BTDCU6evCts74lmlheeodeVxvjaTMEODy59SGDjO
 6tB5kt0eDiB9WgfXv7YNNqDkdg714soxlIcbXHMMVR4JSp5PW6/E9eS7hx41hTs69X243Mk1BaL hPSELjlIpnSESooMmdn/v9ZfAqobCecJvqAooZt3/msKeAsClSwLH4qiQeFTbCgHB9I0YLSmkGu lZM/Sb1U+CZvxcAfsAbZhl2XrqqD903TWTdO6hooTdfdpyHvoKg1QmrNw138hnpR7ADzI0AgdnP
 4Y+QwhzmZ1LwSCBY8k8o+hDX9ss6y3NLXEJSRpMYCS7EaenE2zPLG9ygkoxRY4DABpld4ESF
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685d5744 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=SeGwa_nAbCxWkPq68tIA:9 a=QEXdDO2ut3YA:10

DQoNCj4gT24gMjYgSnVuIDIwMjUsIGF0IDE2OjE0LCBBa2lyYSBZb2tvc2F3YSA8YWtpeWtzQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gDQo+IE9uIFRodSwgMjYgSnVuIDIwMjUg
MTQ6MzA6MjIgKzAyMDAsIEjDpWtvbiBCdWdnZSB3cm90ZToNCj4+IEFkZCBzYWlkIGZ1bmN0aW9u
cyB0byB0aGUgZG9jdW1lbnRhdGlvbiBhbmQgcmVsYXRlIHRoZW0gdG8gdXNlcnNwYWNlJ3MNCj4+
IHB0aHJlYWRfY29uZF93YWl0KCkuIFRoZSBsYXR0ZXIgYmVjYXVzZSB3aGVuIHNlYXJjaGluZyBm
b3INCj4+IGZ1bmN0aW9uYWxpdHkgY29tcGFyYWJsZSB0byBwdGhyZWFkX2NvbmRfd2FpdCgpLCBp
dCBpcyB2ZXJ5IGhhcmQgdG8NCj4+IGZpbmQgd2FpdF9ldmVudF9jbWQoKS4NCj4+IA0KPj4gU2ln
bmVkLW9mZi1ieTogSMOla29uIEJ1Z2dlIDxoYWFrb24uYnVnZ2VAb3JhY2xlLmNvbT4NCj4+IC0t
LQ0KPj4gRG9jdW1lbnRhdGlvbi9tZW1vcnktYmFycmllcnMudHh0IHwgMTEgKysrKysrKysrKysN
Cj4+IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+IFsuLi5dDQo+IA0KPiBUaGlz
IGRvY3VtZW50IGJlbG9uZ3MgdG8gdGhlICJMSU5VWCBLRVJORUwgTUVNT1JZIENPTlNJU1RFTkNZ
IChMS01NKSINCj4gc3Vic3lzdGVtLg0KPiANCj4gUGxlYXNlIHJlc2VuZCB0aGlzIHRvIHN1aXRh
YmxlIHBlb3BsZSBhbmQgbGlzdHMgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsDQo+IHdvdWxk
IHN1Z2dlc3QuDQoNClRoYW5rcyBmb3IgdGhlIGlucHV0IEFraXJhLiBJIGRlY2lkZWQgdG8gcmVk
dWNlIHRoZSBub2lzZSBoZXJlIHNpbmNlIHRoaXMgY29tbWl0IGRvZXNuJ3QgcmVhbGx5IGRpc2N1
c3MgdGhlIG1lbW9yeSBtb2RlbCBwZXIgc2UuIA0KDQpCdXQsIGlmIGl0IGlzIHRoZSByaWdodCBl
dGlxdWV0dGUsIEkgd2lsbCByZXNlbmQuDQoNCg0KVGh4cywgSMOla29uDQoNCg==
