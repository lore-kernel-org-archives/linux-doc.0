Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C6154BF5;
	Wed, 18 Dec 2024 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734554354; cv=fail; b=CCnW9OghDUhAKMX7a0FPXKG1y2E9KOzddEM7OhHGSvboQ5dxOFaxsMpSX0JHxpJYmTNK/1MKVg5G/TVi6VAujEQn2LvWtmedXGzyQ9J05vtPjZb8utYCB2ZNeAb6RRookmZWNZbpNz62ekRbPE3s2W07Gusg6tCq1aMchyrB4Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734554354; c=relaxed/simple;
	bh=RfI5B6TOB/03YrQL4WQ/CdIOP/9qgw5awPmwQp4CTX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uCq+q6XV3ANcoOu70yh7fsNjdWdz7U6DXKVYZcOxgnq8lqzJiwGAyBsAyf8xzr5eTrf+pQjcsJC0nDwylmr2n5vU+gFDeY6TTFg2y1ywY+cNvQ218gzviyKpHQs0WWND4Q396WqYhIBT53+5dm4Xkew4K9LIGz+evwCMcqANSOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b+ebgbVi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g2okqFqJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b+ebgbVi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g2okqFqJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIKIYhr011071;
	Wed, 18 Dec 2024 20:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qXeq2m7amPCZh+RiWSJssSaGzOARpE1Iy032Ut7E7to=; b=
	b+ebgbViKZl0eTrzrDgHlZY7+mLR0/88cPqku3fcB5PzISzk1+4XVEfkSFjHhbHN
	rMwkQli7rH6WoKSoVbHtJGP6WqSMUSmxfOAP/KZm6ui9QnYnP4apXcdzhfQwsPSB
	ZLRgwGQDK8a+G3p3MjoKL3n9UTrEXeIQ7/Dul8HlSjt2oU0S24lD9ZpAaKhMTI0K
	nDcZB922DAy7optJde1oySIXcqay/+IQdRQ2EfiOtaQOjDQylvSjoaa4gGRiER1e
	YwYsBZnhub0hgD+s1wzj27yAEJOWjaKPHOAQedGXzl7MSJDlKkGFkyaa1li1HfXD
	nBzvQ219f7J3/I7QAeSupw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0t2hhu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 20:38:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIKQQ0A035471;
	Wed, 18 Dec 2024 20:38:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fab9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 20:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Umees29+XP/lzkGzRC7KUyoW2OWu5szmRgSPDWp6t5DL7vzsbEQmGQTOX8UShzpWcwZuo1w+kEe91AkFmk8Ea7Rv3q988hZMhdaC6w+wroFYFSCW3wLgRJkUB/5nXUwfbXw8CxIx5KaDPTqLEAraxY0aKZd2dSEp6X0E39MF7hGMU/ZAqT/AGRUi8L9uPikaxgVw2jUbmAuzXqs6M+9Z0oTI0RFTtVsW+rULKqGKQPqTYLj9g5RLzSsjlrnVYjCIJCwTFVqDSZTWrh8Mim3kBWfmJ5i/3SgkF9uKdnH4bFzfFj+QzFvPa09CY4OvvYjTxQSFOPvXahK5BX5M6rm5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXeq2m7amPCZh+RiWSJssSaGzOARpE1Iy032Ut7E7to=;
 b=cmUA1TEzyAdGKS7YuNYXN4UUZsDehqzZ/eUhnaH8hk4CNnJO3tO+XcFXZnvFFx33YB2b6gUTrbGUYMC3brVIkNfJqBwzCPGMI1q0j/bXxVDkFgdxy7NzjDXiFhzUwgjrXglVoRDXQ2P8qRXxkk4fvDulnkD3B2mBLx+DUXxt+7LS+RJyLC5iaZDZeYcpXRk4VGYPBvylsAwBKo87buTREIbHyBIpy7zMG5+kDInPbsfzWWux0l+ECNyCQJ9tsoE2RumR9KChGWaZMeTNNWXjd8uDBwuFn+79qUGZoMowyZJATfZjmVIbahZr9L4H35gBObHqRm587qXtnxVNcJy55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXeq2m7amPCZh+RiWSJssSaGzOARpE1Iy032Ut7E7to=;
 b=g2okqFqJ+nGiUa9+FbJPw95YBuXgQiqdTAGNyzGISkFqR6pmodKW0mqETdFqaL8egU84TldlpWDyPah//wFfuolDByVDWgiJjL0Jj8UQKcmz4BVkmrqsrxlzkr0DByx2BngnHMiFA+g96vQ4e2cnd+Mx8qSGeQgf6MrQePCHecQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CYYPR10MB7572.namprd10.prod.outlook.com (2603:10b6:930:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 20:38:38 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 20:38:38 +0000
Date: Wed, 18 Dec 2024 15:38:29 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org,
        willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net>
 <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::28) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CYYPR10MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 78760fff-6a10-4871-8b3b-08dd1fa3f36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|4022899009|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2d1Mmd0L0NjZjZORkk4Rkh5VHZuUkt4WjZtTGd0ODNFd2xPNzJQM2RucTJj?=
 =?utf-8?B?TG5GV2cvejRKSGd6b2tDcDUreWp1VXREbWFXVUJsMndOODNJL2E3TlJqRG91?=
 =?utf-8?B?TG1tczZvRTRwZFRFODZzMTY2bHRkbTVWTlMyT1VpVTRrcU9NRXo5S05uQ2VS?=
 =?utf-8?B?M3g0TDMvckhVRFc3Mkc4NWF1VC9kMjU2cFdBZllvdHdxMERJU0tRcUVoenNs?=
 =?utf-8?B?a2RkTitxclZPRitFMDA0TWpDRDZteEJVNmlkYXcyTHdFR2RsNjhDd1gxUkNm?=
 =?utf-8?B?M1orc1JjVWF4SXJ1Y2lrYURXeUFIZjVTdHBLNG5NcjNIUEJ2OXFaZ3RUdnk4?=
 =?utf-8?B?OG13V2ZpcTU4bEcramhWWlRVRTAyY2p5ZCtHWDBhVnhEaUpuak96TW43UlNE?=
 =?utf-8?B?K0E1Q3hUTDV4WXlVdURkNnBqSDkvMHI2MDhaOHFLWThLYVJaV3RJVlFUando?=
 =?utf-8?B?SFdhQkt0K3cxenJVMEhuTVJreFQ1U2JMcjR0SHorRTdobGRvODUremNmekhl?=
 =?utf-8?B?WS85SUV0NWpxQnh5KzZGYVpmeW1US3JPYUlHQnBTZGUwWW53ckRJZ0tySmlr?=
 =?utf-8?B?YUZMYVFUM3JXZjZXK0hSUmRpRnUweThoZDhNU2pTYytJeUo3eDJiL2VBa0JG?=
 =?utf-8?B?bXlVMWNBRzdNWk51ZkE0QXlKMDFwWkdkbXlUL2Rod1E1SlM1d2ptR1JobGdN?=
 =?utf-8?B?WUo3ekM0M0Uzb1U0SWE0aXJZb0p0MmtPT0p0U1kwNkpDN3VLTFliZ0NHZDNl?=
 =?utf-8?B?N2lJZWdYaUd5M3RkRHZLdWp1OEtYTExlSXoxTmpqUnZyWDR0Mkdvb0NKZGVO?=
 =?utf-8?B?bkJ2R3VRWFlJdmlpVzZzZmpnN3RNdFl6T1hib3o3cGFZdjd3NHBwVTJheURT?=
 =?utf-8?B?QU96KzFZdDI3MWREc1doMk0xVURoUks4c1JDa0xiaFVGb0VCT3FvVlpvZEtm?=
 =?utf-8?B?Z01pRkx6UXVrdVdzS3dFbXVmSkF3TVV0cm1sTmNVUUh6MktLczNZR2tEQVZa?=
 =?utf-8?B?a0tIYmI1bDJDTW01ZWUrSHRuZjB4Q3dKTkhxWDV6azJWUzFVYkxiRU9DZ1NR?=
 =?utf-8?B?ZXArUG5YRFFqRGFnTVMvRXBxaFRUQlpja0JCeDR2c3UrcGhnKzREN1hwYzZW?=
 =?utf-8?B?T3g1bCsyL0RkSUxRVmlOYWR6SWdNcy9uN0NyTnl3c2ZVK0pHclkwSzlzYW1K?=
 =?utf-8?B?OTBUK3FEMEk5Y0xJTXYyYlhxNGplUUQ1TW5kV3NSQXZWeDYzYko4Yk5td3Rv?=
 =?utf-8?B?T1JhbS8xaDRMdkRPc3Z3Wk92ZElvcUFoUTFIRFBjNmd5UTZyN1gzMEdNbDg0?=
 =?utf-8?B?Q1pGaEtTWmYrb3dmczJkRFZ5UWdaeDdZSm0yTzJ5ZnROWUs4NVZUNGRzdHZI?=
 =?utf-8?B?TDdXM2xHZWk4ZDZrM1pycnpVYyt5NDlCNXFsbzhibWpsdHdSaFBlb0p4bDhD?=
 =?utf-8?B?ekpwK2V6T0F1UjdxUTA5VU1FMUJIRXRRb3dMdks3NmY3bGRBV2QzUWplS2N2?=
 =?utf-8?B?emUwRFF0QmpVaTRUVktVUi8zRlh5UlZrSU9BM3BpY3JCaHg4cHFEVHYyS0VP?=
 =?utf-8?B?Z24zRGs3ZzhDQVdRejU1a3VxMkFmRTg5V2tMZ0VkUHpYVm1pUlJhbWJ5cVJJ?=
 =?utf-8?B?cWJudWVvRmJJS3RNYmJ6VXVSRVRwb1Y1V01WQllpblhJV3pRckNBQjNRMjVG?=
 =?utf-8?B?S2FqQVJTemFTTW5HT1EvMzRjeEdvd3B6Q0ZxSk93clF0OVBHWlVBdUIyM29F?=
 =?utf-8?B?MUlpV2VJbXlvSXhsNzlJMXA2Szc0NTZtL2RTYm9INkxyVkxldEVkRndXb0Nj?=
 =?utf-8?B?cEdxNCs2VUdRRnhjaUNuazgzR09rc1psUkQ0NG5mZVg5YUlSS2d4QmFwNmJm?=
 =?utf-8?Q?llTi3130y1+vk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eSs4ZUF5R3g3RXBRYWNMNjFVdkZWTWE2QWtyMFYzVWhiTEIyZFRKZ0liQW51?=
 =?utf-8?B?RktFOHRrVkp2U1JwZ1lsVXpQenZzdC8rY0JBYWovZ2ZZZVFCWXZGOUkxSkFz?=
 =?utf-8?B?ejhFbU5DWU1vTnpZWi9qWWdVZWxMYjBtZ2F2TENxb2FXRFRudkpNWmQ0ekFw?=
 =?utf-8?B?Y084S3FjcDNubHRTUHEySnlXWU1ZUjV6MXdLZDM5MFMyY2ZmYXk3eVdHRENp?=
 =?utf-8?B?Q3JXcXJIM0JHS3hSNERGNDYxRmg1L04vMUo3NC9Odzdtc0luNmZuSkJyeDlh?=
 =?utf-8?B?dWdqT0Q3Q1c5RndRTUVVNzVFUUxJekJNM0N0NVl6eEVnZWo1TmozR0trYnBj?=
 =?utf-8?B?eDRtUVE1aERDYU5Va0V2SWtndHZObk5OUUdsOWRwSkY4Z2I4ZTIxTVpocmxx?=
 =?utf-8?B?Y1RhbXl0eSszQlJZRGZyR09nd2tlbVJLSDg2M25CNXdzaU1YbTdSRWs0RFhZ?=
 =?utf-8?B?NHI2c0daUWgvYmpyenBzTDdlMCsyMVhNdWZ2RGlPQVJmdFRjUlpmdUdlQnN6?=
 =?utf-8?B?REZ4TVlkMjFjZjhBZ29qMkFiQ2k1N0FVYjQwZzJvdUh0S0V5UE9aeldtUCtF?=
 =?utf-8?B?QS9yd2IwVXNqYXJEUVI2SWhwcThkbUtZOWFoVXJJTllsdkU1YnhzV1hWNXFo?=
 =?utf-8?B?SUJDcnI0Qm0wcWtTRkd6T2dPRjdTYlpSaGROQVBTNktDdEhMUGxFQTdaZkJw?=
 =?utf-8?B?Yk1lc042RnFqelFUL2Q5Vm5GdlFuaHFBTUdteG16NVdQSGJPRTRHYVZEWUx2?=
 =?utf-8?B?UlphbVVXZmdQNXZ3K1R3VjdNVW9CR2hKdHhPTFFvWWdkbUU2SHl1bFY1eCtE?=
 =?utf-8?B?RS85WUNxblU3RkV5Mk8vZXJVK2VLSkpGUENXdnBRTWFtKytrSWxoVHdlZ21y?=
 =?utf-8?B?amVRZTZlS2VpbUpBeUFWb3dhMkZWYkJNRENzMTFXVTZnNVNlYUhya2ltUkJR?=
 =?utf-8?B?d042cDl5Z2ZTcC9nTkNYUmhoQndoRW94WkNSK29hTGRZQTdQNFJRcWtPQjdh?=
 =?utf-8?B?VEVEblFNZFF0M3dXeVl0Y1lBQ3ExRXZGSVFRam9FMkJ3cjBzdmdYRVZ0OTF5?=
 =?utf-8?B?VTN3RlNONElhSDdyQktFZUxRV3NobjE1NjlTV0srMER4RVphaHVwWFcxUHNH?=
 =?utf-8?B?WUxqN0x4ckZFV2gwNjhzM2ZDdktidS94R0xiS05GVXBaMCtVUUE5SVFSZGdJ?=
 =?utf-8?B?ei9rL0gvTnA5OGhNb0dqclhxdmpBQ2hXWjF2VU9PVHdGTWpUOEk0RkV2REhY?=
 =?utf-8?B?ZC9ZSjN6V2R6dHNOSzdPTG9UMjFWWEtVSHNOanlLZ09aZU1VUkNvUEdSdzhy?=
 =?utf-8?B?N2NoSmVUSkNWYVh1QW4xTm1qREtibTdtRUg2YzBRYmFidnRpUzVnb3MzKy92?=
 =?utf-8?B?RWI1aEx1dkxxK0VidDVzNEVsTnJsZW90L25BTWNvakVybFl4OXFTTW5ha2wy?=
 =?utf-8?B?WExaTS92WElEemdiUU4yUHpUSFVlV2dXN3cvcTVxT0tFc0QyWWJhNWsxci9X?=
 =?utf-8?B?SzByQkxDZ3JPWnZtSE1DRE16UDdSRS81b0tkcDI3VWlRU09iY1lidEI0aUVJ?=
 =?utf-8?B?Ti9zYWowTHJNSzRVdEpBVndqQWFvb1VlSHVDN1hraTR2cWhzdkhoVFdMMWRk?=
 =?utf-8?B?SW41UHNBd2lLS01kV0w3bWl0Y2tvZElQSmsyOXpvalFTTkJwNm1Oa2lUSllx?=
 =?utf-8?B?QzJSZ0xHR1VxZUZmN0RlSXpiSnEvQzFUSU1JSWpEbktIVkRqRW5mbVBwSFBm?=
 =?utf-8?B?a0RDUDVkbUxrZUhlbk53Q2RzejhiakRMS1RlTVZlSk1TdHpUYmVuQWNUalNS?=
 =?utf-8?B?WmdXemNBRTBXcmp1ZlBjRjQvRTZGQytRMXFWSnROc1dnWGtZNWJCVk5xOUxR?=
 =?utf-8?B?WmhscU0zekFUejYvakZVekJtSWR5SXZQQXdFWVg4RVNTOFFCSSs5QVlkWjJK?=
 =?utf-8?B?NWJacXlDRUZzOU5UWEI4S1RxQU90NmV1d1RQci92SnBFbHZYV3hYbGlmeFJL?=
 =?utf-8?B?cExBaUJHcHBhRU5ZNXdSdkhKZUloc1Z4VXJ1MDh0aWwvaFVlVUQxOUFoMTZ0?=
 =?utf-8?B?WDVHankvM00rbVI5NE5zV1J1T1hpT1Y1QjMrbGFNeFh4NmU2UVM5L1pWSFAr?=
 =?utf-8?Q?gPqnEVpZYNfmMkf3PxfC/YjPq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QkdV69nD4rcW40mSSsSH5oWKrPANko/DznVTx3yHoGBWSVTB6GU8bd4ujCgcY0FIaPEEtNJuFrjSf3OxUND9BYpb4hCu4LSZFId2vhfOSlbxayDREZmg5v945RFbDM9lM/S8xZ7gJ3yltWaiA9/35Fup1V41IhDJi4X9AB8LaJEMkSj0NVMAoSyZqU+AxDczU0fStW7S/n4S3oxTZW1tddPaApbyRYU7jOw683oXuunOq/XF5dhWH3skXoE3Pw0Rzk3RvLlrNv1Zfq9DSK9zDQtge0vBTGJiPtO8LT7IvaogoQmuj7ZAQ/aUbfzjoJCdjumNYcbFPtmjCLeQEVO6c8HIf6at1yHbu1p01HRW+Sp4pj/sIo1YqH5ZDlMgk+zEZR17ZxHwyAxuGmXP7MUjSi029nxNPq+Oj/V5q60TVf2Inmqs0EW0dfTradrwg22LuPwC8tvS6z4+9VUREQ5a7fYVe5mo3WQyaZizr3NFRKZC15CIoYutGI3u9JjsuwAywvCAwJA3loIFxmhDwbWfRT8KD6nhYhBIbehZJQQiTfpHsIQw1WyOK9JZ/LFWoiOSf1uX4JRGWJOSFBv0gRGC1lekYcdE0HxTcbF+d9zj6LY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78760fff-6a10-4871-8b3b-08dd1fa3f36b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 20:38:38.2044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzO/mLgP/Xd2TT7+GsOSN/kPpSB+4jV3FyVPLVfHDmhFYHkILOOXzhnz9MHaOVhlH49HAYqxMix8ZOrVfBzt9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7572
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-18_07,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412180160
X-Proofpoint-ORIG-GUID: QrRPId1-xp_17lH8aVwzti75Pjvzi3Ww
X-Proofpoint-GUID: QrRPId1-xp_17lH8aVwzti75Pjvzi3Ww

* Suren Baghdasaryan <surenb@google.com> [241218 15:01]:
> On Wed, Dec 18, 2024 at 11:38=E2=80=AFAM 'Liam R. Howlett' via kernel-tea=
m
> <kernel-team@android.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [241218 14:29]:
> > > On Wed, Dec 18, 2024 at 11:07=E2=80=AFAM Suren Baghdasaryan <surenb@g=
oogle.com> wrote:
> > > >
> > > > On Wed, Dec 18, 2024 at 11:00=E2=80=AFAM 'Liam R. Howlett' via kern=
el-team
> > > > <kernel-team@android.com> wrote:
> > > > >
> > > > > * Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> > > > > > On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peterz@=
infradead.org> wrote:
> > > > > > >
> > > > > > > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan =
wrote:
> > > > > > >
> > > > > > > > > You will not. vms_complete_munmap_vmas() will call remove=
_vma() to
> > > > > > > > > remove PTEs IIRC, and if you do start_write() and detach(=
) before
> > > > > > > > > dropping mmap_lock_write, you should be good.
> > > > > > > >
> > > > > > > > Ok, I think we will have to move mmap_write_downgrade() ins=
ide
> > > > > > > > vms_complete_munmap_vmas() to be called after remove_vma().
> > > > > > > > vms_clear_ptes() is using vmas, so we can't move remove_vma=
() before
> > > > > > > > mmap_write_downgrade().
> > > > > > >
> > > > > > > Why ?!
> > > > > > >
> > > > > > > vms_clear_ptes() and remove_vma() are fine where they are -- =
there is no
> > > > > > > concurrency left at this point.
> > > > > > >
> > > > > > > Note that by doing vma_start_write() inside vms_complete_munm=
ap_vmas(),
> > > > > > > which is *after* the vmas have been unhooked from the mm, you=
 wait for
> > > > > > > any concurrent user to go away.
> > > > > > >
> > > > > > > And since they're unhooked, there can't be any new users.
> > > > > > >
> > > > > > > So you're the one and only user left, and code is fine the wa=
y it is.
> > > > > >
> > > > > > Ok, let me make sure I understand this part of your proposal. F=
rom
> > > > > > your earlier email:
> > > > > >
> > > > > > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(str=
uct
> > > > > > vma_munmap_struct *vms,
> > > > > >         struct vm_area_struct *vma;
> > > > > >         struct mm_struct *mm;
> > > > > >
> > > > > > +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> > > > > > +               vma_start_write(next);
> > > > > > +               vma_mark_detached(next, true);
> > > > > > +       }
> > > > > > +
> > > > > >         mm =3D current->mm;
> > > > > >         mm->map_count -=3D vms->vma_count;
> > > > > >         mm->locked_vm -=3D vms->locked_vm;
> > > > > >
> > > > > > This would mean:
> > > > > >
> > > > > > vms_complete_munmap_vmas
> > > > > >            vma_start_write
> > > > > >            vma_mark_detached
> > > > > >            mmap_write_downgrade
> > > > > >            vms_clear_ptes
> > > > > >            remove_vma
> > > > > >
> > > > > > And remove_vma will be just freeing the vmas. Is that correct?
> > > > > > I'm a bit confused because the original thinking was that
> > > > > > vma_mark_detached() would drop the last refcnt and if it's 0 we=
 would
> > > > > > free the vma right there. If that's still what we want to do th=
en I
> > > > > > think the above sequence should look like this:
> > > > > >
> > > > > > vms_complete_munmap_vmas
> > > > > >            vms_clear_ptes
> > > > > >            remove_vma
> > > > > >                vma_start_write
> > > > > >                vma_mark_detached
> > > > > >            mmap_write_downgrade
> > > > > >
> > > > > > because vma_start_write+vma_mark_detached should be done under =
 mmap_write_lock.
> > > > > > Please let me know which way you want to move forward.
> > > > > >
> > > > >
> > > > > Are we sure we're not causing issues with the MAP_FIXED path here=
?
> > > > >
> > > > > With the above change, we'd be freeing the PTEs before marking th=
e vmas
> > > > > as detached or vma_start_write().
> > > >
> > > > IIUC when we call vms_complete_munmap_vmas() all vmas inside
> > > > mas_detach have been already write-locked, no?
> >
> > That's the way it is today - but I thought you were moving the lock to
> > the complete stage, not adding a new one? (why add a new one otherwise?=
)
>=20
> Is my understanding correct that mas_detach is populated by
> vms_gather_munmap_vmas() only with vmas that went through
> __split_vma() (and were write-locked there)? I don't see any path that
> would add any other vma into mas_detach but maybe I'm missing
> something?

No, that is not correct.

vms_gather_munmap_vmas() calls split on the first vma, then adds all
vmas that are within the range of the munmap() call.  Potentially
splitting the last vma and adding that in the
"if (next->vm_end > vms->end)" block.

Sometimes this is a single vma that gets split twice, sometimes no
splits happen and entire vmas are unmapped, sometimes it's just one vma
that isn't split.

My observation is the common case is a single vma, but besides that we
see 3, and sometimes 7 at a time, but it could be any number of vmas and
not all of them are split.

There is a loop for_each_vma_range() that does:

vma_start_write(next);
mas_set(mas_detach, vms->mas_count++);
mas_store_gfp(mas_detach, next, GFP_KERNEL);


>=20
> >
> > >
> > > Yeah, I think we can simply do this:
> > >
> > > vms_complete_munmap_vmas
> > >            vms_clear_ptes
> > >            remove_vma
> > >                vma_mark_detached
> > >            mmap_write_downgrade
> > >
> > > If my assumption is incorrect, assertion inside vma_mark_detached()
> > > should trigger. I tried a quick test and so far nothing exploded.
> > >
> >
> > If they are write locked, then the page faults are not a concern.  Ther=
e
> > is also the rmap race that Jann found in mmap_region() [1].  This is
> > probably also fine since you are keeping the write lock in place earlie=
r
> > on in the gather stage.  Note the ptes will already be cleared by the
> > time vms_complete_munmap_vmas() is called in this case.
> >
> > [1] https://lore.kernel.org/all/CAG48ez0ZpGzxi=3D-5O_uGQ0xKXOmbjeQ0LjZs=
RJ1Qtf2X5eOr1w@mail.gmail.com/
> >
> > Thanks,
> > Liam
> >
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to kernel-team+unsubscribe@android.com.
> >
