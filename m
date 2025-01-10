Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797C206F38;
	Fri, 10 Jan 2025 20:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736542101; cv=fail; b=l5g9GkCYbBpVAhj04istn9gve2NKlOFZkDCQFaWHFg+UEnEMUEh5/zJxkh6YfFmJnliqpe1E2vbV8/kyxYvGR/+djlrfzH+p+r6UVXL6zlgDYkQVdDXybKMJyP2TxEwBW7gyhpPpq2HNX3ArbKR2pqZmqH5aX8H7X+4nUiY0uG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736542101; c=relaxed/simple;
	bh=B228krlFvHmBb/IPmeV/GIpCJ5b94aQ5nONnbn4rLTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xnf/Sy+I4Zptf9bmwRb9RTo68coW0OW4BfPeSNaqIMSbZMX9PVScTC+EE1CeXVTzkuIP92uJpSA0vm1I3YTi04Z6esUCPy7/CAnQyeFFSGbHVy2ZxR5MagCbbmsKI7rEt7kPcAwO/lAGce4syiKXdel7dFVjBT4j3r+G7WQXADU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CLW4g7r3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SohZJRyd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CLW4g7r3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SohZJRyd"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AItpw5028428;
	Fri, 10 Jan 2025 20:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=HuN5hqA+B2XkqGDWmQNqakzh7RLa2IB7E0gW38IY/X4=; b=
	CLW4g7r3Sk2Y59TfHmF1JUdjnurs46tBJctDBTFQhsGakk5zmRdGCz8LMWEr9Bgd
	nwf0yyvdMCkcI6yfrLJ6xAMjkUzAB/bQBBzpO/prdoBkCEDARr2YP6zFna9vZIoN
	048SDQGXkfSz/aYatEri67RRLTats2Y5jQdQGlO2P1mGfy3jNZKDkeHKwZqTPozs
	JtCYeLU1o6BaexXA7FayTGmtdQ3y8Z3ZC1KRoGukJykQarJfT1xXELJUjoc8+XE8
	NO7GnF72Gr0fV6Dw6JQf9WV+EN4OZv3HJ/e8RqPNdWe7mHeSvIGEMUEwnsCrC52c
	Da2Di0ZrnQ24sprl4afZgA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442gy5tpqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 20:47:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AKH3Iq010908;
	Fri, 10 Jan 2025 20:47:36 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuecrmng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 20:47:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af3Y+J6e2mdBSFyxd8erKb5VcZ00XlTciVSphD40oNFn3UF0IznWO2l3eAypWeFB2KzwoFBl5a7/Zq7iphBT4e1q5LgQrwoYAB9JbVP9w8+4mrHE+MbqK/4L2YttcBnZ/4uasA6Msu9gsmkQVPwvvVByscY2uhzxjOA7CL8hkKIHoFWbO34lmWg+SZq+DUIVCqwPyF6A5bo1iEVau+1m6coOnaPW32LKOeyotbjgRtgQ61pdhxxq2ma8eG2yiAhFg0YQCE3j+Qu48fsv6FGnl2MmNdNCBzUYeyHnqZmcw7uizOmZ/fvTcvp0Jcl+9ncCXm3IZ7oonw472jJWJh6MYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuN5hqA+B2XkqGDWmQNqakzh7RLa2IB7E0gW38IY/X4=;
 b=B8DIko8MLfj54HZ/7tQthT1oJ3Ahi5sdV43RENNODaUZkZBxPvkiaOo5w4QjMSJo0KTQZopVzhFXjp5q0xISeO8jYPRpF4+VWC/k4em78cq5H2J77JuUSOm88PDJDu47TEDmdA+UPp0fvfGs8qEdIJoRWvBjtkYeSdxhKCEAmbKS3trd6oQQoC3Kv0o9dbym0TIR5isFIkdh8ma3p2J/5olzmLuSAaN5wKKkw4IdVNQPFAwkGd7RR5VhX1R9NnRU6/6hiCVAqVKecIUPdrha2Vl8iyYfy78p0i97E/dPuHK90gsAWvooXJfOPotU6UGbIrGrzcdkxoK5QZalyxN75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuN5hqA+B2XkqGDWmQNqakzh7RLa2IB7E0gW38IY/X4=;
 b=SohZJRydyezcpbpSgrt5dqDh7NOCl+cEDe7mf3KO5M40kOmdffPoi7mWlmxfxxaH4Xq+RBKkkVlpZu7TF23VEnkgAhepS9XFDx8R8wEaHJND5TvOToiELFDaYaJSoPc4+pCA0nbEHJiyAcg/UsuCMcAC4uUgEAxHlIKx0bq8ylU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV8PR10MB7966.namprd10.prod.outlook.com (2603:10b6:408:202::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 20:47:33 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 20:47:33 +0000
Date: Fri, 10 Jan 2025 15:47:28 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
        mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
        oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
        brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
        hughd@google.com, lokeshgidra@google.com, minchan@google.com,
        jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
        pasha.tatashin@soleen.com, klarasmodin@gmail.com,
        richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <5p3y2umz7yk3ymedybd3vaxz2f6rz52dzcjiihlyvx7aptxri7@yq2scgci3lyc>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
References: <20250109023025.2242447-1-surenb@google.com>
 <20250109023025.2242447-16-surenb@google.com>
 <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
 <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com>
 <ckqzumj4an54dgnrnyzkhzgvfcr35gmcq7ykfdcvudrd7dd753@cjaowcc6vz6n>
 <CAJuCfpFcn2s_gr21neLgLU990rOVMEZCADRAsXf3xUJPD0BbZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpFcn2s_gr21neLgLU990rOVMEZCADRAsXf3xUJPD0BbZQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::30) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV8PR10MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f479b8-435f-4b8d-3709-08dd31b80222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTFPZHQ0bjNJaGZ6UGU3VjM1OWhWa3o1T3gyZEwyMzB4RVNDS2VRNnNCRHVN?=
 =?utf-8?B?dWJQRkhvYU9sRmRFU09uNXFWRTJHQmlwbkdzTmRYdWUvOFI5eFllcGpsckw3?=
 =?utf-8?B?NFpyZWh6OU1VK3pJR1NSZHlHcEJVdzROVER2RElpeUVGaFRUMjk1Ly9zZkFo?=
 =?utf-8?B?Mjlsb0hzOTZZY1dmS0NJbGtuemhZNmFMYlZCMHNScXhHcGlQUzVDVjhvR1N4?=
 =?utf-8?B?NDZtRnBqZGZvUC8xand4NmhLcnB0c0lmUDBJQVJwTWlsWWtzYklpZWMyc0Nk?=
 =?utf-8?B?T0ExbmFMR0d6Qmc4SWozSWQ5Zkd2Q3FXcm1uOFl4RS9EeCtlUzljeWx6Qkto?=
 =?utf-8?B?YlBBeStvZ0NPZEwzWEZBVVNOTjJDai9EYjBOVEplT2M5UzdoRS9XUEs4VlNP?=
 =?utf-8?B?bUFmaFE3QTh0dmY0VVNoVEhhUmpKZEtmZlB6R2RrRkc1cnk5aGxkTGh3bDRU?=
 =?utf-8?B?TzQvSlJySm51RGVLT05yd3pVeGlORnZSeWIxUjJHRWxnL2NkOUc3ZExzSG5X?=
 =?utf-8?B?U1FPRjcyRXcrbzZLSERDaU1CU1RTYVFCK1JadFM5ejZ1NU9aZDlCVDh1aXBr?=
 =?utf-8?B?bHBxOTRrL2RrL21uNXgxbEdLVVVXNEUwV0tEZHI0REYzOEJ0SzNxNUczT213?=
 =?utf-8?B?eFVKUzQ0OWU2VTh0U2tyR2Mrc3dxdkpyeW5Cdmh2cDlsb20wOGdRR3BvcGNh?=
 =?utf-8?B?T295WjV4WkJSQ214YW5nczZKWC91WGxpczFsK1VTVE5GcXloa1FSSTZSa2xF?=
 =?utf-8?B?OFlnelcrZHJ3azZ2dXV3bW5oME5pdjZzdkl1OTFYV0hiRGdLOVZDZnVnaU02?=
 =?utf-8?B?d1ArMXhjN0laV3NBZXZNTW05MzE0QWVVU1hoWjQ0Rk9wSUQ4ZjhCRlN6VUxs?=
 =?utf-8?B?OVE4M3pCWUFobjk3aFZjby9JcGZMajRjV1JuajJibE0rQzFjV3lpcGRnSEtP?=
 =?utf-8?B?LzBvM3NBdHB1WlZoTFhKQy9MS3NJakZKRHN4YnZoZUltb0pTaSsvN3l2T1hF?=
 =?utf-8?B?czJtQlFOUmFJS0l6UnkyY2hyOUVRblQ5ZEpYOEZsSVI5WVF3d0hNWHFXRVZP?=
 =?utf-8?B?VjhxN1FBMXc1WFQ2c01yTFFDQVoxaFZsMGZFQWx5SUE1NVBKd3NWQytJM1o5?=
 =?utf-8?B?YWNMTWJKaUkwN3lsaENhM0IzYmtQRUkxV3lLUE95WUJORTRDbC9DOWhCenlw?=
 =?utf-8?B?TVJNWnJqOGtZN1R1dDB4SFZNaVloN2QxK2t6aGQ0KzZoTUluWFpiU3dtcEMy?=
 =?utf-8?B?K2JscFd1Mjd4TkJ5OS85QmtNZmZBTDFoQk4rbCsrQU5TZ3d1ckdLTUZtVDJL?=
 =?utf-8?B?bml5R2V4QTIzZXNta1ZhalZ5LzVuaUF5ZGkwOWVMeG5LZmJCYWkyWjBFMmhZ?=
 =?utf-8?B?UlBjWjZ6MjlkOThVN2srY0xMQkhsWEVCVEZFOXNjTk5qUnY5OFY4citQS0Zl?=
 =?utf-8?B?WnQ4RjZoVGhJYk44SnZjYUxVTVg2R1E0cEt3b1NJTHc2UjQ2UHBFSm14c2dF?=
 =?utf-8?B?QzNWSUQwaHJCV2FGKzhTR2ZkbXc2MWZSdEN2dzFSZ3dLVDl6Uy9oZ2VIeXpw?=
 =?utf-8?B?QTJudEdpanFESnpYSDI2Q3RWb1VSWHM4bE5HRkZRdERWM3JoaTRCcG12N1Zl?=
 =?utf-8?B?R2hzMWIzaFBXdTI4cnMwdTBWZUVhRHVtMllWTXRmY1h2RjM3dVROalczT3dp?=
 =?utf-8?B?aUdRTldiZ1FaeWN1Ny9xZlhLYXRCVWtTS1pSeGJVcThPaEViYUJKNG02NG12?=
 =?utf-8?B?anorQmE2a0R3NUdSdnNkbnJZeVJrTFk2aEQwNzBDSDlrQkV5OGd5WS9Gdk9u?=
 =?utf-8?B?d2NpTzA3WmhiUmZZWFlNQ2FpNWlZNXl2TWZCbU1RU3hyeEVTNmNNMy8wVHlk?=
 =?utf-8?Q?Grj/s26aSObac?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWJXNHVqTnlBTndZVCtSS0s0RHhXY2I4VTN3dThLMkdYYVhmUGsvV0ZPaWlI?=
 =?utf-8?B?MHc1UENZU0xpOXREVmN4TnJTbmNLd3FWQWVoTE5IZlpIbVVFdVAySkNWK0p1?=
 =?utf-8?B?ZlF0dUVpbEFXbFBBdVJkeXJ4MzQ3YURLbjRZdkhyZFFJU1NmdEpmc0dQLzdv?=
 =?utf-8?B?enpFVllHQ256VVhTRVAzZStBWXpxRDUwUkF2WWVRYkxDOCt0MjAvNk1pMDZB?=
 =?utf-8?B?SHlzbml4NFR3TU1pbTh6aTJhbkh1ZTRKSitVdk12TGF3a0NFMVVOdnVmbmNN?=
 =?utf-8?B?ZEZSMjJPRUJnOUo5OFkweUF3VHpRVGFXQkJVQldZWWorVEtFMll6NVVVdFJS?=
 =?utf-8?B?WDIxRXluUml6bXZHMlhxaWNORlkyVzEwV2U5am9YT1JXaDVLQTUrQ1ZmZGtK?=
 =?utf-8?B?T0ZMSU56d2ZzempNVkh1aDVyL3dwSE54aWJCSk1vU0JIQU9hcCswem5PSTFp?=
 =?utf-8?B?NjltR3JpWlFNTXBZWkVlMEhsdmEwV3ZyeU9yWFpIOHA4SnEzMkMrUEl3MnNZ?=
 =?utf-8?B?ZTFmY2tTT0d2TlRKTGtvRkI1Y0VRUEJuY0t5bkVWQ0x1QnNmQ0lPaWpBWFI0?=
 =?utf-8?B?aDlQdGFZcFBlRnRLVXNCelI4cnZMWXJRdW9yOVJ3QmhoWWFiVE9NN0phWkEx?=
 =?utf-8?B?R3JOZ1pHaHJmbDlidHZkNERGVGpnQjFiVVVaVG5TbHNaRlVTY0p2TTU4QS9x?=
 =?utf-8?B?Vk9ZaXMwakpTOWNyV21NUEhlS3I0b29GUmdyYnh0eG56NnE3Ykd5YzhHMWtx?=
 =?utf-8?B?SnZFQWJGMWpsY1lCR2FVbFZCeFBURzlabzQ3YXEvU3RGZlNyZWEyUnVOY09s?=
 =?utf-8?B?WDZIL2tFd3dDQkNEUHNyUnZFQjhaK250L0Nrc2FlTzF5c0wwTFlyQzZ3Yk5Q?=
 =?utf-8?B?cy9DR1VFRy9wdXptOTRzVDlUemprOTlWRDlhOS9vNzVjSnRqMXBraXZOcW03?=
 =?utf-8?B?bno1RHdFWkNPQVdUdlpwTEJSM1hIaFdKcnZ3SjFvTnhBV1J1NGh5ZWpYNG54?=
 =?utf-8?B?SFIwVzhweEpSbTdWenhOT3BUOHk4dEZrOXlPUE8rSHl0TEJsVG1hSW1DeHFW?=
 =?utf-8?B?RzJhVER2SlFSRmw3dGtsY25qTWxVVll5ZmNTSEpEZHJrQSt4aVpmNWViYzFs?=
 =?utf-8?B?YzRzSWxuWlZCSUpSUXovQ0lHOSsrY3NZSXZhZzhabGZOZXZZNURXajdUS0NH?=
 =?utf-8?B?RXJxUUV5TkZLaTAwMHRrVUQxQmxuUXRlOW82bktVRFdORUttNU4zMTRHbEVV?=
 =?utf-8?B?cS9jZWFSL1BLeDI0WmVhdnhKdGI4TzVNNmxHMjVjNDBHTzV3cmQ2SmxKTDNN?=
 =?utf-8?B?cWpkOE14VGx3bWhUTVJ4VmFpaG1rdDg0eHd1SzhBSUpISDhOck9xdlBDUE5E?=
 =?utf-8?B?eVF2UHc5Z0ZCRVBWbUFjcll4UWxDZUtvVmNMYnd4czgxZmtMemlPbEMxWlVO?=
 =?utf-8?B?MXMrbEFmTHlZd0VUNzZQd2xSR3RYMjJqRXVRKzlGWVREQmw5akhZU3V6NnZU?=
 =?utf-8?B?cUdRYmx4d0FUaEhjckhZT2l5ajBmUEtVTHFZWGlGaGU2TGRWelYzQkVmWGVC?=
 =?utf-8?B?cmM0c0ZTdjBia3l2MEVTSUlVMWp2bC9URDBURHF2MXhQb3UweTMxMGFmaXZq?=
 =?utf-8?B?b24rSVJMZlNVZzFaS21GbUgvUURkZUh4VDdMWTdyUWNOamFxc3N4c0JlSWpU?=
 =?utf-8?B?VnRiTWRoOGMxNGFJVjBSdXpZK2l4NmZETmpzanJoNHhTdjNTMTZnK21zM0wx?=
 =?utf-8?B?cjU5QXpwVkN1eExMczFFWDJoWW5hK2xpNTl5K3lKWkhXRXlyaXJYQUJ6Ykp0?=
 =?utf-8?B?N2hNQ3dSQkphNnNodnJBL2k4bXhoKzdicXYzUzU0a3dmQjYzY0plWGhmbzlp?=
 =?utf-8?B?anZGb0o3VXRNMXVXQkFtcE5MMjJKM2ZtTjQvN2xFdGFxRVZxWFZZYXNWNE5Y?=
 =?utf-8?B?ZUl2YlpTUkNZbGtpVFFuelRrcW5tRmJtZk8zRmEzb20zYXoyVHJQQVZPMlpD?=
 =?utf-8?B?alVnNE9EakJkNnNSYUxnYm5MUW53aHBVeHlPd3YzRmhVc1kxam5DdVROaWVC?=
 =?utf-8?B?WW43dmlzUXhLTEFJMkFWdjBCSkxVL09wbStwWXBGNDE1RGVMSm1nWjZEajZk?=
 =?utf-8?Q?4ByxTwGfCoQfFd/vTGlJfks3Z?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YtOw8bxTYT6VGG0qBxK44aVjJ96gLgQ1BM3ORiuH1Iqa3z7/LfIQQ+xqX+Tje11d/ptjL2RRgBqPYsHP7XHdt7bcqrQVRsvw3goHMf3D4nWtlIavpMjbA8RGp1/QtNusFYNpYFw9x+tmkqN4dkt5Dmy5bG6PGK2xcPL6GR2Wq+gTAvAKpZaM7QAtkp8bDjgoi3dLivmSGbs1KaHeeR0TTa9+gq9kUDKQI+mYIpzZN8VNnrKtWGl1MHmPt6oxSs+b/X/o8qjQAL/3YEzq28NS7r3bQ8syYvJIpRc82UA8DUVM17CFQhS2HiqFicc4DHCSsTf8JHE6T7fDouNqu7022119wlkPsXRHsO7aRAqv+WTzfjNrN9HPpEqn8aB5rwsdu9En+FdQtTCUSQMorBHprx0Whh+h/jnMKgc04Yv3NgmPF4HvXXuYMrZqTKlYxV0cTEzSVoNnO5kuF9mr7DSvXMWTXYu2L6ARSlag/zoMjE5MECE9E7DbAYpLnpYxZm0ld5o6cdIVMH52luYRyGr2cNAQi2cDWANpgxbJpSPN+bOpAOBm1bMZtHTUBNQRI/wTjlnzfvyyP3duE/TLSQWh7wopF6IWViuPPb0/HMFIb5Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f479b8-435f-4b8d-3709-08dd31b80222
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 20:47:33.7974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JWJFsS9MMcxZ2FatvuWqkrimmWSRFchkbZiIu33ywVyq3sPVdekpeLwcqHgXyJmaqz30rqcKGLNtDgUrTs85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_09,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=826 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501100159
X-Proofpoint-GUID: ntn7H2eEb9zyVO2IlggQfceUoP4OzZ7v
X-Proofpoint-ORIG-GUID: ntn7H2eEb9zyVO2IlggQfceUoP4OzZ7v

* Suren Baghdasaryan <surenb@google.com> [250110 15:35]:
> On Fri, Jan 10, 2025 at 11:46=E2=80=AFAM 'Liam R. Howlett' via kernel-tea=
m
>=20
> >
> >     rwsem_acquire_read(old lock)
> >     __refcount_inc_not_zero_limited() fails
>=20
> Are we looking at the same code
> (https://lore.kernel.org/all/20250109023025.2242447-12-surenb@google.com/=
)?
> The sequence should be reversed here like this:
>=20
>      if (!__refcount_inc_not_zero_limited())
>               return false;
>      rwsem_acquire_read(old lock)
>=20
> and because __refcount_inc_not_zero_limited() fails,
> rwsem_acquire_read(old lock) should never be called.
>=20

We are not, I had an older version of the patch from the 7th.

Sorry for the confusion.

Thanks,
Liam
