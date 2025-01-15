Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802D248BB5;
	Wed, 15 Jan 2025 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940926; cv=fail; b=i+rtIvcL+vIGUOPAw/kWZ1EmkPQBmBDZ+E33yzMJn6H2FpzfaouUCO85wM6nmpNB1IwV44qu3F2VLr0B8XsA/r+jipYFl322azeMgKZUzyRnDxrA2uGFYtGQFciwEoxRotfLf86X6dJZzcDvae3aEu2SG1RFXhLGEHw+EXFG8zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940926; c=relaxed/simple;
	bh=PG9pCE2Co9JOXm6lcwRcuZscVo4lnamnbsMzMZIAbqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NBVHuE2bgoAUnPm/rgmYa4cldkFacdPi6c4X6L6jG5yLsCs/j2PNQ4GlXLYilcxZHx/GQKFVe85p8UTAGDvf965ALsUApIdJPGZQ2DZkUceqfSzlOPq/b/xs0sdoFTG9KkPr61rpeK18of/tCMEdOPvstWep4VHHejbIagrlIoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aKaAv/Hu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sJsy2Gud; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aKaAv/Hu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sJsy2Gud"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F8tp5e018865;
	Wed, 15 Jan 2025 11:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hX1BmRb8O5k8PtogYDJNGMRsWGYRcVHfSL/zSmI4EJY=; b=
	aKaAv/HuHBP2YClElBRxo9T7m2J4BlaSFrFizZI7+uw02JIZY7OmqHhsKI9LO7SK
	TswsN/NB2d+HFdCm2n5zqR9YvkBhjvnnBBkhZ/KiQ1LV1Q2KQb/Fk47duv3eZTu4
	MevhkoWDI+df4yKKMmNDgHnj0/K3Qb8uefeiMsCO1wSbRKvwJKDRtIxf9Xo4dRs6
	7ZKJM+lVnNTeVCdvr21Llnuo3s40O3MOBHWQNhsy46NbDltJmdie5MQ9ns4AGy2U
	BqRiLklXA9SJXs+B0lV302DER6+v9KIEyXm1zUoMEanO0qIyfLBrqyYR72oUeDnK
	y8zLOSRBMH4O/CxwevknUQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443fe2fxfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 11:34:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50FBKwm5038719;
	Wed, 15 Jan 2025 11:34:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f39bfve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 11:34:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiXZK4eUIZ+fELe6FPiIHkbhYZNOc2IFb9SpUmr3pUhD1yADXPU33KAJhVXvKE5ehQYuDQgkM0x1LHyUs+5j9+oMMmkrjmFVXsGixkNPguCGY51gbnQNfd2PvDJwwMswvrSEzkFd9+Sc91q51Izt5gd7PgNclzwm1svvDPO1QnRaKUAsp4foXhR3oAvUSkPOgr/7aJ1JxgZe1xc8FZSm4qklSzclez+i6QuEVE2TuQ+pcANubLK+XT7F9YNUhboavb4IFmkykeF/1CzjIqAaUqsf0sGLmSAIEoVEL2dbvO/fQi6E5oL5oyVNqR3EguoIee0E5xnQqdf8TPY2GJaDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX1BmRb8O5k8PtogYDJNGMRsWGYRcVHfSL/zSmI4EJY=;
 b=P21196v3NuDJZpvXnTbKKAcBf7FXJ8g/QGNaM/qOUyNl4eAMFQRlm7quNP15Ef0GFmfMRLOAKfXOMlsY+QOofgCYplpPiYrn6hgKDSrX2J/mG34v/HS/cFeiWR54pQA+5KlBRfRosVxe5JV3ek0M7JGiZTT2mx5UYMJyrXBq8Sudbmk7Zuq35mdjCn3lV9WTCwzbVu1XKCJ6h8sK2Ick5InPbKIBCt2bHVlfczqtafNeacaHPdr88HIpnJWAoE4Yaz0ghZrcA26nwiE/298HKbZa3aQgwTYVVyDtFeBi19dgBdvBmnfiTClY449eX4qR+v71/seeF6Qkerr4cypuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX1BmRb8O5k8PtogYDJNGMRsWGYRcVHfSL/zSmI4EJY=;
 b=sJsy2GuduaZnGrheDkQGWGF5F0QrI5Iwfu/7ec++Y9QF/iH6h3HMLhDqxfHI/QYyyARuGE1QE6fi55zKQV5LOJjBRX8Ta/9K8aZfbV6+jrb7uJ7sJosDEfpl++IbKtigEvJpqAbuMd//GCVmG7rIcwfCo8ief5WxXffz2vtyhzw=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by IA0PR10MB6819.namprd10.prod.outlook.com (2603:10b6:208:438::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:34:42 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 11:34:42 +0000
Date: Wed, 15 Jan 2025 11:34:37 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>, peterz@infradead.org,
        willy@infradead.org, david.laight.linux@gmail.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
Message-ID: <f954fbec-2cec-448b-bba6-5c36c80c137a@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
 <CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
 <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org>
 <ajefxu3ed4oz2uomvmc7u4fj4zj2x2lvzmec7okif6stjptc6l@i6wmo4wuwgh3>
 <CAJuCfpHGJ9RR0tJyrLzLZEf9r=CQidoi9xJEAyHYs4Kx=1JxXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHGJ9RR0tJyrLzLZEf9r=CQidoi9xJEAyHYs4Kx=1JxXw@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::19) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|IA0PR10MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 509e9e6f-2f51-4ada-09b6-08dd35589a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|4022899009|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ym1jNk1wemh6cEFJSEtwejlMN1JXaHlhMVJ6dUdkTkNYdlpCZWpGWmZYRy9C?=
 =?utf-8?B?Zkc1aUtpMFZ5TXhqNEQrcE9mY0I2bVo4cEhoc3FEMm50Z2owZWRYWmN6bDdh?=
 =?utf-8?B?b0Q0RlhPVG9TMkN3RytpbEZOb1lsRTBXYmxscDcyNGlWNE5IS1gxbmV3aUQ1?=
 =?utf-8?B?VGhZL3dNUWJGZTc0T29xZ3BTdFk0cVhWVjkwQndtQm1FK3F6ZHVrNW40c2lW?=
 =?utf-8?B?YTJQWGtSTzBuT3hROFdVN2RhUUprTW9kZG9sR1h2OUVPdHJ1TDl5WkJQZUoy?=
 =?utf-8?B?MEtmYXpQNjZlWDRlZE5YRGdsUVZuLzU4WmRHbStvWElQYmZrMFZxQlpRQlNm?=
 =?utf-8?B?emYyUHRvUGs4d04wVGt1czNRd0E0R2JWTFBPc2ozTGxUd28zU2ppaHhSN1Iy?=
 =?utf-8?B?WnJkSUhRZU83Mk1ORUpmMGZQS3pkTWQvVWI4TWpuRlUzb3dSY2Q1ZkUwUmR4?=
 =?utf-8?B?Y1VvaFlGSW92S2x1MzBQQk1QVnFHcUI2OHJWMWk4TzAzNlBlZDF2YmFTaGZM?=
 =?utf-8?B?d2h4MmZCSzk1NHJQcTIzTWxzcHIvanhlQjhQbGNMSEZEZWI0dkdCTm1ya2FQ?=
 =?utf-8?B?V0w4RlRDQlNsaHpjdW56ais2Y2VkMWx1RWxZSUxrWlFuUlNaUEMwaHU1VjhU?=
 =?utf-8?B?SnliUERtUEk4cWhvNllJbnZZT2NKMExiN2pNWTdXRng1c09qOVE4OFMvSjA1?=
 =?utf-8?B?dnVVT29Gc2FLL1JMNWJEN1lMTjJPRzVOYkdUcy9GVkRpQ1paTy9CZmZLRVRF?=
 =?utf-8?B?MFl2SVN3L2lXb2JQMUplaVA3eklacXVuU3dOc0xZQTlLMHJZOWRxOUZ3MEgz?=
 =?utf-8?B?UDJxamNQY0orQWRVWWFrMnZHeHJHY1pzRzVtcENpZWtVa1NrTURaMjV4SHo3?=
 =?utf-8?B?QnpTMkoyUkRLNVkxQWdQRlR1UFhuUExNdnY5Uko3azl3a0c1NENneHBXVU5Y?=
 =?utf-8?B?UnUvcHQzTUxNdlNiZDNPYlFSbEFrVXJEUEI3OUI4U2ZoUWM4MXptMG1kb2x3?=
 =?utf-8?B?aXdBRVN3UHlYS2dkS2VyblJQN1lXZWZ0SkhBMFdCbU96c3NVTVE0eTdiK25J?=
 =?utf-8?B?NXpqc0FvbHcrRHZYcURWcEdlVDRmNTB3anFNU2lLNm1WM1NiYzUxblNTY3ov?=
 =?utf-8?B?OG82Y0VMNjJmL1RQRlZsZEt2cDl0QnMxY1MyWTBIZ3E2UldnK1Y4STFaVWpk?=
 =?utf-8?B?MHVOWlFnQkhCVDhETEtZSmxKS2lmM1BFY2pEb2JwNDhUc0FWZ3dBam5nUFln?=
 =?utf-8?B?dmhwVTJPOWw4dE9xdFhCdlVBQU1sVjVvOFFmVmIrRHZTT1l5RG1FN1MxL1VD?=
 =?utf-8?B?cXdHQkUrNXc2WFJ3cHFmbzlScUFHYWI0YXp2N004ZDRPdVJlUG1FRE52NUpD?=
 =?utf-8?B?NUYvK0xmOG5LeGI5TzdIbjMwZkZnS25OdzkzZDh0ZXREYmtYMW84WjlSOGQx?=
 =?utf-8?B?eWM3MTVncUliMXVZTmNjcjBWTHNBUDA4TXJVa2VqeWFLd3AvdTBSdnBGOS9w?=
 =?utf-8?B?WnNuRHVYbHgwUHFaVERucGE2ZW5JbGoxVjY1V3pGNGd3SE0xZEVycVFqcVNa?=
 =?utf-8?B?dHd3Zi9tc0xPazdBaDdzelRvYjVyMlp3Z1NCRlhxWUpHeWRuaTN6dlpxendr?=
 =?utf-8?B?MWcyMkJhMGluOXZ1c2Eya1psZXRmS1g4c1BEWWIzck9oS0RPaitjaEJqcVVT?=
 =?utf-8?B?L0VJMEJ6bXZUcUlrQ29PSm5hT0lveVNDRTJ1Tm9ZSyt3MjVJZnAzT3hDNWth?=
 =?utf-8?B?UkphV1pZMUN3MU9VS0NOTjkxdnNQV2JYb2NWY1B1VCtiZnI3ZDdDSjFpYjZB?=
 =?utf-8?B?RzduQzNiZ2RRMVA1Z2lkQmgrK2lTRzYzbDZSUEZBS1VxNHAyTHc3YUxWRkg3?=
 =?utf-8?Q?Shmi2q3KId1N4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(4022899009)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTIzbnZGcGxpRWZFenljenU0azhwY3pyV2Z4aFl2NVc0cnlsRmdTRUNKSkdM?=
 =?utf-8?B?ZUoyVk5DbnRpcVdPeGJCL2FncUdNVjVadlZ1T1VrbFk0SXpKRmZMYzFZNWpM?=
 =?utf-8?B?VGoyeVZjKzNob1kwMjB0MVM3MnNreFEwaHgxbnBYWVVHeDcyM2dFNUl3aXJX?=
 =?utf-8?B?ME5NSGp1L3d4bzQ0VnRTV01Udlg1cmZZVnBzWlhlU2FLTWdBZlQ4MUVpeGNn?=
 =?utf-8?B?Q1NMMzkycDM2RExSaUFWVGFLK215c1hYK3FtU1hsSlQxUFVWT0M4VzhoSzkz?=
 =?utf-8?B?S0dUUkM5NmZ5ZTVnalRjNVdyazhHa2MzMHFZY2FFMDhSK2E3QWU5Z25Wc1F6?=
 =?utf-8?B?bnRLWEJKM2Z2R0w0TzBhZkhDRWw4VUJ0ZDVOeTF3RExEdjUrR0FzbW9UNUM4?=
 =?utf-8?B?ZEpFNDhzQk44MjJqY3MvUnNJWEo5UUpsMzVmWDNYVEVzRm1GcS9DV2FBSm5T?=
 =?utf-8?B?UGtrYkdCS0tVbzhubXd5Z1VBT2ZhOGFETmVaZCswdW5tUWREMnQxZmNIL2R5?=
 =?utf-8?B?OWppWWtONUZudEtqcy9oZkR1REZUcVJibVpsNUlScHAwVUhGcUtOMGJWSXlt?=
 =?utf-8?B?Z1M3YUtSZUNGQUEwVUNYU0wvTVJJMEFpOXhFckl4dVNtb0lOdmdNM1c2cDFC?=
 =?utf-8?B?QnhCNGYrRlErMWE5RmFCNEdLb1pEbXI5WmFlakVMZ29DVEdZOVk3VU5jdTRP?=
 =?utf-8?B?KzhRZmd3Mk04WTZZaE9jNGVUcWhETUJLUmxZMytmRTBYbXp3SEQzcjgvV1l5?=
 =?utf-8?B?bjhmeDQrU0J3NEUvS3YxUDkvdE82Rk50aXAwYTVoeGtYWjNPcTQ2amNJMjFq?=
 =?utf-8?B?eGtKek1xaVhPSHpXYWRBT0hMSzl1Vjk1eHgwcGhXRXZIQ2dicW03aHUrWlht?=
 =?utf-8?B?aFl1M0JSb2dBNG0ycmVUVDd1akcyMDJuMGVpNTNyMEszdmIvWmFiQjBJeS9n?=
 =?utf-8?B?UkwxcEdNUlVtT3pmN2trRDc4N0s3QktoS1pLK2NXRU5JRXZTQnR4MStaUmlG?=
 =?utf-8?B?VCtSNWNibEFQWXhwYnA3aW1BZkNEbm5UVkg3SDl4VGlMNkw1d29xajBOT2xy?=
 =?utf-8?B?NGZsWFllWWRlMGN0QU9WalRqRTVCQjFuYkZnUTU0dHI1UE84NzBDMElGYXNM?=
 =?utf-8?B?R2dOc0phdkRZMHhlalQwSW1LYlIxTE8yQUt6SmRSUStvZk9TTTlocXdLZFJJ?=
 =?utf-8?B?V1ZkQ2o2WEJUdWdFOXBmalkrUUFJaHVDV01XMzcwWFJDMzdtc3lXSzR0dHMv?=
 =?utf-8?B?bU1SbzQzSWdoQWJERVZ0ZURNa3hEY1FXRE1yYU1ZODVvVHlQdjQ4Zlo1QWV2?=
 =?utf-8?B?VTgzMytHdEVnTW4zSXY0akZ0NDVyRkgxQVlVak5SN0hZdTBiTW5TSS9jdlh3?=
 =?utf-8?B?RGp2b3F4am9uclNtTGpMMmVDRTBaeHUva3d0a3IvT1gzd2REMldEeHVMdEhC?=
 =?utf-8?B?aTB2MGtsbWdHbzF6UW1CWVE3Y1NHdEVSRDc5MUZON3UyS0ZaS1pnQy85ODhC?=
 =?utf-8?B?QWs4d2pwRTY4ZTZoQjROMnR1VTBBV3hSTXlUMnlNZjlmTWpVRXpTbTRaMU40?=
 =?utf-8?B?QmtlTUoxeGpKMzFFSi9ZS09wb3lGQjJFc09UMU1jSWNiRjVKVUFxYWtjRHB2?=
 =?utf-8?B?ZnhsUjZJRk9RcENaQkd4TEJyT2RGR0huU05HazY1RG51b0VKUFdCUi9jYWdi?=
 =?utf-8?B?dWt4bys5SXB2U1Jra2oyVWNvclludENmSW9HZGFpYmJwMVhXOFl6bkVYMi9j?=
 =?utf-8?B?UHJYa0YvNGVPZm5jc3lPMjFqbFVodXRpYzJONlQ2bUJlVXFVSnpsWC9MMVlO?=
 =?utf-8?B?Q1Q0NXAvQ0kzemdNcDhlOFIzUFlFZjZRUFdjZ01JUU5STVNjYk12dHQwUDhq?=
 =?utf-8?B?RHJaSFpVZHZiNmY3QnhqNjcwNFF1Z0EvSGVJekpyczB0SnQvdFVYZUNSTHNZ?=
 =?utf-8?B?OEk4VEUxZEJGeEZyRXYraU44SEdRUVhMRUljME5XRDgxYXZSelI0aGQ5elNO?=
 =?utf-8?B?bjZncnBlelV4d3NhNFBMT014SmJ5QzZlOUkxU25Pa0FKblV1MEhBS1RndmxW?=
 =?utf-8?B?MStLVDJiUTRkNFVER2dsc2IyTDFUSkFuVFN0eWFUU05FNjRXa3l6QUliRlp3?=
 =?utf-8?B?M2FEa3FzdDJXeS9iaGVXZmRuZW8va2Rka25pREtGMmt0ekVUR2F6MFdTUVlV?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6pedVqOpftKWd7NbyGiX5DVCmDUVlD+1UHFx5xKXgnQq9J0TcA3gILFjioNGsk9jFE+R8Iq6XFV6+RfhPepiHqRmKZhESJwNjtKAmbS0BXIuO0e1dx7ja0MlyBqXO3uq1hkDufsxS5BHvMj3O5yImM2a9rXea8eWmGWEsMJuPrgOOq0JER7Sl+MVOLab9b5MxK/dW4sjP9ZdVmI3167zTiT49WNwwcJkUZJec/ZXchh1Mc4lv4stek5SFovsB9DWnBkIT4PLh5Nmb/XULrv1NMC54QLIYlQDXInC7oWKrHDDCIM0PPLeXD6vR2rI535PCC4KHEbA3eg6Ds/IQ7zojoNLmY+hg+wi2tfb0WMQaPkDSi+6z1lLBvHdoc1etSCI5vZScZzQ9Sj/2luj5cqw/VF2wtTVkOLiwVqY9gAQQMsrDfgTPaXKz+lJpUQ4QJ+4PobZY36mUbrpTPZeCOT8RNleJdGK8prkEeJVOh9RQuWyEFx42mMG4c72O5t90bSddo6ZGHa/g6iB+o7SGkl8Cg7GTotXF/Z6VuSazOM9beFXXzlBjZoF1mEKFPhARwxwOebCagOEFb4MRRq6WDLsV2Adz9E7K/IZykx0V7XLtn8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509e9e6f-2f51-4ada-09b6-08dd35589a49
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:34:42.0137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfTlV6Si9uFGrS+enVA5GLr8srbLzQfEF1F2k2slx24veR+i/RNBpNod1YGkJuwQxhIphHiSGqqlnyrl7bOrqGSxlnQ47lkxGXmMI4wA6b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6819
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501150087
X-Proofpoint-ORIG-GUID: UTtK6ARi6m8PLPN4eM1QsQwQI7gyNlug
X-Proofpoint-GUID: UTtK6ARi6m8PLPN4eM1QsQwQI7gyNlug

On Tue, Jan 14, 2025 at 07:54:48AM -0800, Suren Baghdasaryan wrote:
> On Tue, Jan 14, 2025 at 6:59 AM 'Liam R. Howlett' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > * Andrew Morton <akpm@linux-foundation.org> [250113 23:09]:
> > > On Mon, 13 Jan 2025 18:53:11 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > > On Mon, Jan 13, 2025 at 5:49 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > > > >
> > > > >
> > > > > Yes, we're at -rc7 and this series is rather in panic mode and it seems
> > > > > unnecessarily risky so I'm inclined to set it aside for this cycle.
> > > > >
> > > > > If the series is considered super desirable and if people are confident
> > > > > that we can address any remaining glitches during two months of -rc
> > > > > then sure, we could push the envelope a bit.  But I don't believe this
> > > > > is the case so I'm thinking let's give ourselves another cycle to get
> > > > > this all sorted out?
> > > >
> > > > I didn't think this series was in panic mode with one real issue that
> > > > is not hard to address (memory ordering in
> > > > __refcount_inc_not_zero_limited()) but I'm obviously biased and might
> > > > be missing the big picture. In any case, if it makes people nervous I
> > > > have no objections to your plan.
> > >
> > > Well, I'm soliciting opinions here.  What do others think?
> > >
> > > And do you see much urgency with these changes?
> > >
> >
> > I think it's in good shape, but more time for this change is probably
> > the right approach.
> >
> > I don't think it's had enough testing time with the changes since v7.
> > The series has had significant changes, with the side effect of
> > invalidating some of the test time.
> >
> > I really like what it does, but if Suren doesn't need it upstream for
> > some reason then I'd say we leave it to soak longer.
> >
> > If he does need it upstream, we can deal with any fallout and fixes - it
> > will have minimum long term effects as it's not an LTS.
>
> Thanks for voicing your opinion, folks! There is no real urgency and
> no objections from me to wait until the next cycle.
> I'll be posting v10 shortly purely for reviews while this is fresh on
> people's mind, and with the understanding that it won't be picked up
> by Andrew.
> Thanks,
> Suren.

(From my side :) Thanks, and definitely no reflection on quality and your
responsiveness has been amazing, just a reflection of the complexity of
this change.

>
> >
> > Thanks,
> > Liam
> >
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
