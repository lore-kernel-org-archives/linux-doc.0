Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0DD20F99E;
	Tue, 14 Jan 2025 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855398; cv=fail; b=IfFWdewEqdVLMUEP+J8G5ZnL8/pOHzcMRMw6M+57WeZOkZjlo3TkL6nAY7NKdGR7FjrO9L7r3SppJAtiQX3m41r0QVmHwQIeGT691zoXrHzHEEV7ro1RZpKDXo4wvuIKzKybhvjBIK94lD7IYp9FlqiKFQA5zLSxbUI9Nx95Yu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855398; c=relaxed/simple;
	bh=8hwz8ExAFd8Z47C+etCuyhpHWvNch8HmyVB6h3NcYQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c0JBb4cyEILIOyJ3F1X6vOCm+Zw75pQ95K0/bM4p0Kwzmnv9hewM3fSHJNKBw13YSn/rm1VPqsW5f1gsb/061ejb4fs0DX5l1QQxr9ti1YNSgElMLE1lCWp5F4XMXJpHmXlY2OUVHSGAEkCUrQ5OH3VePfKOvlfMQFEJQECrZMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CFnd9TIv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RxCa0ARZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CFnd9TIv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RxCa0ARZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EBg3AS021484;
	Tue, 14 Jan 2025 11:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wBLR4GRBJ5bejRTQy1PL/zoXiaElx8fMlKJZ/rZciVs=; b=
	CFnd9TIv2IJjAyWa/mUFHlGX4Qd61G/3gG4OrFWyIBQR243x3JxqYQ8CEF7UCn7a
	yRBPNpPh00BQXMlL8u1siNoAs2BRUL7c23uQXJzE1XZxZYpxwqvGuOKnK7SIdVao
	cT4KfmvO3zdzDFxXPzqcClZqKRI41HwF0evJO76nSmIFMv8o2WUnCmNJuyyUkrtr
	fmC12NE913qQ1ox6x45DcHuJAZispxwBHIWm1y5BsVvI1VyT97eqhCoNc1PfJRoE
	GLELtdYi9yah++q4WHSV5JIn7009wBj/mygYd+yyBnuYlmzHIBq9IGCSy7n1xSp+
	eEeF1hOo60uuOYA9k5x0Aw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y5je3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:49:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50E8kk8C037156;
	Tue, 14 Jan 2025 11:49:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f38k57e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:49:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olG4IFIFMXDPXPZ2IGTHt+KgDOz+sl9eYKpzqakKDkhcT8FiynJUb6cJF/swhrHEIdACZ5Ye6tITs6VqoxwbDFPm7EdAh1iCben9lu8dwZqz0OnA8WVC8/Rbc0ACc/lyKqEdXY5zAmXMOKPedAOn3sbPJP5/Gf5gDaSO3/wfplERw/l+V4BlVqC+MF6VfXei2Wj9WpabmT6o1zmeF0oedHgpyZzKBan4Qc75zHhuThT9t42lWhKgOHwKsOwBN7qjpgecfOO9s7h5pgHKLjQQ0f5EP/BdUZfAhpHmdK9Ll50siN30oRIt9jC3A0F9OFbYN1ylxHukIziuqdbZUf8tvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBLR4GRBJ5bejRTQy1PL/zoXiaElx8fMlKJZ/rZciVs=;
 b=WoF12o6a79Ee4wfp0T3ol83mheDrN0vWGkp2Z2+9XzlzE9AYJW72IvrKNEDKqMG8ixD+MR959muAdbZAUYSxAGaPyKPvcP4AX5UoIjcatTpoo3UIfxIbjC3L+LWGtQyft7qoZ+yt9Y+F2g0/BHgsrZA/BMmiWuzntbmneoLOawdWm5VZl3C3DiT7RCD3fGTbQBB5eWathTqAfSdLms0p3ambfSeUKMYYfYz1oBdRf2DdQyu0+nwhIHn2PB9v14b9IHKcO+lcIUoSBcoGfVwZNsSWigfgmrfipJDk7luHEB82MPkHKeS+IErGOBvTPcNvdpuN47MIwKjSiCCRYz72IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBLR4GRBJ5bejRTQy1PL/zoXiaElx8fMlKJZ/rZciVs=;
 b=RxCa0ARZBp0m+ZvaTdamjqn1ooh1XgEs2pKmNMN/952iVm6bUdDWOlDWBlWE9mGujWHfx5v5O9ErX+pZG+Qth3KTha8LweDjMBR9H8D9EhZ/Z32VHoxqK91Sh6tH1l7ErmlNR7AmbQ05wqEWcp9C3QwBsggupp6Gi/as3WAdjl4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW4PR10MB6440.namprd10.prod.outlook.com (2603:10b6:303:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:48:45 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:48:45 +0000
Date: Tue, 14 Jan 2025 11:48:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com,
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
Subject: Re: [PATCH v9 07/17] mm: allow
 vma_start_read_locked/vma_start_read_locked_nested to fail
Message-ID: <f602dcb3-34f7-4f04-a5e5-ec055c5e7fd4@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-8-surenb@google.com>
 <038aaebd-264a-4e64-8777-4c4015401097@lucifer.local>
 <CAJuCfpF4kqDfou6=1Vr4Gw0HJDAq_PGay3Jpypa8d2_kDsqwww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpF4kqDfou6=1Vr4Gw0HJDAq_PGay3Jpypa8d2_kDsqwww@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::12) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW4PR10MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 986f4f52-b447-48e1-3741-08dd34916664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU16RWtLdjR1YU9SM2xyZW1CUitKeGF1UjhpVXZSZjhPSGgxTjNqZFlXSEgx?=
 =?utf-8?B?WTdrbFVVeVkzSlJJbFJnL05uOVAxWnBQSmVhQzhiUCtuZ2pEUXFrQXpZaERo?=
 =?utf-8?B?LzJ1a0x1YWlOdHo0VCtGYmNoZGY1VzRqaVNVUXkxT1FZYmMzUUhlQkJ1aHkr?=
 =?utf-8?B?dE1NQU45NlNyMWNqR09aWWMwaERHM3BSWXd6TmwxZ1MzS09GZVJVdmNhdjls?=
 =?utf-8?B?QkU4bWtkZ2tuaG1xNTVnTjk5OW01elJBNklIbHMwMUx0Vmx2OXJDa3RnZmlQ?=
 =?utf-8?B?dlJwWVBZWk9IZURxL1c5VG1pTVVib3BOem0rYmt4QVhjT0J4NE92cm5QWnBp?=
 =?utf-8?B?SDhNYjBUeGdrR04yTWI4a1h2M3FXN2tTVUlPN2JDMnU3YzhYYzkvbXJTVEx6?=
 =?utf-8?B?NXk3WUZlSkRyWlN0aGF5K2IxMzFCWFc1RTFDVmhoeVBpaDFmbG44RllsTWhC?=
 =?utf-8?B?T0xYc0ZSYThiS2ZwU1M5anF3c2dJMEtCUHFxN1BPZEZNQkJDNVhicGNxNWs0?=
 =?utf-8?B?YTk3OTZXdTRHWjZmdGZ1REkvdXpsek9yS3VhMGdxdVlkRFNpSlRDSUtiR0hS?=
 =?utf-8?B?aE56T2JxcVdpUko1czFneWVvTVlzci9RNmh6dmdoT2E3bHppalNNRVNWMWdG?=
 =?utf-8?B?RkcvMXZURTBBOS9JNTl5QXpmTnVCWVg3VzAvcGF2ekxyK052Z1NrVTRobFdE?=
 =?utf-8?B?SElOeEpkSzJyQStDZEl2dkd5SUVZaGxFWEgrOTZWYkRBMmZXenM2MjF4bml5?=
 =?utf-8?B?eTBZU2xyM3NHVktpVzVnMlptWjFwWW9Bblk5YkRGc2ZYMU5SM2VGd1Z1ckV0?=
 =?utf-8?B?aHhzVEdnMSs3UC94TDBocml3Z3NJbllzVDFGblBkUk5DUkVNS1c1ZXFEWjZF?=
 =?utf-8?B?YXZ0Y3dnVWxvbDAzWTNNZDVKbW1hSGU5RXZTeVhxL3doL0NEeFZSZGM2SjJl?=
 =?utf-8?B?aXpJYko3UnZTMXUzbTNjQ045dDJZQXhpQUhiRS8ybnR2emphL1J5NG16c2F1?=
 =?utf-8?B?ZU40bFcrcTFUSDR5S3pVdzJOV2JsNnVQL1NWZ21lMFp5am9TcGxRQnQwNCtQ?=
 =?utf-8?B?b0FrZ2FVY2F5dTFjTkpqREtCNW5DU2k3UDFGbTBkcUpndCswOERnVGZMbysw?=
 =?utf-8?B?N01Yc2lHZmNCWnBmZU90ZWgzRDE2VWp3MUF2WGtvRDBvWmJqZ1ZtcXdnSXZ6?=
 =?utf-8?B?U0wyd3gxYzdYSWZXSmJQMGRUVlJaeVNQNWdJQlZMOGVHUDQvajdBY3QwM3dr?=
 =?utf-8?B?QjBQbUp2VXFvTlRodXYzcy9rL2hSUG4xY3JwZzk4V2pTdkpiMy9CaHZQUE9I?=
 =?utf-8?B?R0tqczcwOWFnMFJhVjQva3l5L1R0SklCaFBuZlJWZytmQUFIWjA3czZ0MldK?=
 =?utf-8?B?TzJjV2RpRDdUNlUxTGdDK05naTBqWThyOUxCSEhhZUZGZzRudzBNS0hPYk5E?=
 =?utf-8?B?bDVqd21GL2lnTVB1NmYvemFZOW1kcWNUaUVnWU10S1V4SEFSdWwwTE0wK0dG?=
 =?utf-8?B?MWQ3cW5qSDZiY0JZbWtlUmVXdlBvdktOeFNRWjdDUVNoaHFJeHllaXBNR2Zl?=
 =?utf-8?B?SGhYbUpaRnRsM0tvNStqVStOU1E4RFVaK05UNG5kTVVYaGt5ZzRHcEJ1Rzky?=
 =?utf-8?B?TTVNWVUzYTVHeXQxQTJiZWVqZnBESVFWOTZvNElwLzFrUjRHVGhhNGlJZlZZ?=
 =?utf-8?B?VDMwS1NEeUpXN25iMCsvY3BxeFg4MTBZQUx1ZlJqdzY4d2haaTBwUStBNENE?=
 =?utf-8?B?N1RVdTJQRVlTNm9PZUVkRjVQREZKV3dkbTduc25MVUVycmUvbDlMcHBGR0Zl?=
 =?utf-8?B?OXFXZ1ljZ250NmlqWU9iNnJtbmV4ZFd2YmtHWWFYd3NpWTF0TVpia3NoakZG?=
 =?utf-8?Q?AFYxSsH8Q7dMH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1lCNGZGWWxXVCtFd3QwSGFDRmlxazVxQ2xwVytrai9ZUmJjQ1hPbVlqSzY3?=
 =?utf-8?B?c2dHUXN0NlFsMkZxWm5IZEl5WTJEdldYa3kxRzdONHJXRW81VC8yN3FmRGht?=
 =?utf-8?B?TzMzKzZ0K1MvVUNUVmQ4U05XNDZXVFlnTmcyV2FhNUV1d2RMb0RpSWpRYUN3?=
 =?utf-8?B?Q3d1aEI5c3JLTmNmeG9ZTG1SRTBLUitmZEg4Q3YxS25Wc1pPYUx1emRPRnVp?=
 =?utf-8?B?VnJiaWhVcE1OVFBHeWtZb1Z3V1NLTk9OZDMxQlVtWnlYYlFHbDhya1FvVnJB?=
 =?utf-8?B?Y2VEOXZodjVYdDhVQmxSbFdUYUI0c2RKVVVKK2c4TGlRdUJ6RzRWblFMYW96?=
 =?utf-8?B?ZmFnTHI1MElMUzAyUGp4ZEFtQ3F0eVp1TW1VbDR4NDFoQkhnNFZaZkJMMW9K?=
 =?utf-8?B?NVU3L3lyNDJ4SVJ3RU51MS9ZN1dDeTN0NjZQcUp4dnRUOEpGbTV2REhOUFdw?=
 =?utf-8?B?V1dIaTdBRTQ0WDJaUDV1ejljT29rMXRJT0MvcHpJMm0yVkNuOThMNCtzSnhJ?=
 =?utf-8?B?WFcvNXlhbnJJaThNVm02c2dwNjVjNFY2ZnlKWUhuVDJPbVkvakdkejlJUi9o?=
 =?utf-8?B?b1cwMCtEdEUrZWprYThoOXV2ZERKT3E4SFIvOVpaRXE1NW9lT1lBcXUrSUwy?=
 =?utf-8?B?SGU5Qjg1b0hjL3pjbjJqSTNkNWVMR2o2c1RGZnZXa1RLdmZ1U3dITm9kTkhy?=
 =?utf-8?B?TU9zQVJXbW5Ja1p2azlhTytTNENZNU0vOGpuMGdDTlRybUNwS1Yya1oycTBp?=
 =?utf-8?B?c3pmVEJndHdDZkwxYVE1TTVuQTRkNy84MkRjbHg5b05USWJQbmhFSkZvQjNO?=
 =?utf-8?B?a1dKODNNKzJNa1RTVFlqVWpLOFA0L0NPUnhWQTNqeUhvbnZpbXBMTjNRbFpZ?=
 =?utf-8?B?YXh4cjg0aUJramdNcVlDZFpmMFF1dThkQTJrTVVLMnN4YS9adDFrT1VsbVNh?=
 =?utf-8?B?OCtrMXpFOWU2N0pnNzR3QzZQZ2J4cUdyOG1YekJrMjljcVlYVnlEaGlsclda?=
 =?utf-8?B?UC9abG5TbVQ2WTFnN2FneEFaYnhsZnBoRHozZ21zTGxvSFVaSi9ESi9rUFhI?=
 =?utf-8?B?eENLeTBORXJwOTU0R2YxSmpPenU0U2RId0ZVY3NFS3dtQlBGbDlqNVZVRGFQ?=
 =?utf-8?B?UnFXZ0Zlb0Q5Nzc3OTFwbnExd3VWdHZ6VWp2U0o5NWlJZXNYd1pmYW1kaXEr?=
 =?utf-8?B?cU5RbzBXWlpKVjFIMERyNGIwamNERFRzVUpiaEc5WDFqUExFNVhRQ3FLZS9k?=
 =?utf-8?B?ejZaK3lmS09ZVlBlMnBFN2d3eVdhaG1seWo2aFdrTCtNZGRtMk80dnNnMDl2?=
 =?utf-8?B?L0FDNGRhbGZ5WVdZQUpQVGRGQzlveTBJL05DMlpZMkN5NGxTV3R1eDNwZTNa?=
 =?utf-8?B?TnlUaFFUb1FPakRLL0dqTjJ4MFA3cDhuT2FFT2M5NjRFejFjbjljRXpjN3JV?=
 =?utf-8?B?STVNZ0F5RmNWSk0wT2psRGhlY3ZBRHdabWNHb1R0M04rRXNGc2tLR1ZtMVl0?=
 =?utf-8?B?Nk5nblNUbjZaOWtFcS94ajZLOWYzbzAxbzJjaVJaQTlGK2ZJNjlQY2pBNEdq?=
 =?utf-8?B?SUJKZGRkTFRzb200b0hMdkljM25lanZ2YlJOWi9wbVgrZG94Q1h6R2N6S0Fa?=
 =?utf-8?B?M3pWOUJheXpKTTVUSXFGQ1NXSnRXTlVlVkpYVG9vd0lFZ2NyNy9mdEVGaTBs?=
 =?utf-8?B?aFhNK3g2Qm4xRis5K24rdHRWaVc0TjJSOWxWalRKVjczRTFQVjZ3Z041d3p4?=
 =?utf-8?B?a3RZU1UwNDRtNGpmZVZNVlBwci95R0RQcnVmZFpwa1lWRmJtY2RuL3VhMzRr?=
 =?utf-8?B?SzlVMURnblF0WE5NN3lUQ1VaempMUk1NZTIwaG5pVE1EWnlmWjBmZG50alI5?=
 =?utf-8?B?b242bk5qRG1YL2twK0x2bGRWQkQ2dGhoY1BBR1RVMCtUclM2ZUJ4NUJlVU4r?=
 =?utf-8?B?TndXTzhWU3FUNDlUQUJyMFZNYVFCRzF1SU1IRjdkbWljTU13Vmoxa1BGMXd1?=
 =?utf-8?B?SndZYmNoOEpMRkRwVzJJekNyRE4wRUtlcEp4aEFTbFB2aVZudXVEVjFBVVhF?=
 =?utf-8?B?TkRUZWlLRTMxWkYyL1lmUDlXZmlBVEtzbFoxa2xTc2E4elhORTVQdFlwQVd5?=
 =?utf-8?B?SjVobk9mSHhOdDNOZUpIbXRGMW44SmRwTVR6S1lPbHZGZlRZbmExalg0UG05?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eRdCdZtJzXmxNiO29ca45OykSozWaVB8zEfX59sN2p50lnBjyZYjnqA52Zgjc4RWNnKsfwmzkXTRc5oo+ckqDu9ACdO7+DaNKvHYlis97txHbN8ZJLbOtn0pjctVlkfzsq17CtaAF0LhogTj+bEzgpABgIkj4mdwAPoAJ6LIIr/HYcRk5Jl/amOx11bK5OcUrJfRyBtHUeNwrhrqVVca3hKnGhqk6REZPCCbbLUUWFJwL4jzp45pQHnTxgTGVQbfBywHJfvlCxJD9/iuk8aDPUijqQ3vzQpUlyBj93ubKTMqOZm/jpTxDrONK1VLL04alB+S3aW4dVuy8QXLGXlOU4t944rKXBjew0rJSdihWtVVdf+uFwnscLAdoyKAW6YBDzYh4bNDVMP4x2d1uLSZicH6eTGG7l/QYMF6LqN/pzhWgLt9hUmuN+9FBe5tMRAgR80SsoSI5pyRaaJkbD2An4BXT6Ot7rsEEXFKP4ZYH0qOPGUgLMyss6qd0sVIsYM/9SAJy/LZA6vRIGt07ADXoa4f0qWngWy10um7YhTSAcdBIALtipMhnfXNhW7VXkrSXtx1qayjSTIoUlRuoNfVKC839Q1cI8vSflvpXnY9//Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986f4f52-b447-48e1-3741-08dd34916664
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:48:45.1852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FVExcpLT5An6bC6pUpUJbHvbV+Qo0e5r5iQqLndCZKj4ueVjgkqlx6X4pyiW+jVrA0oMnQZEP6TiMvsqRySF/0GsWvHGahoB5aZALp3WkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501140099
X-Proofpoint-ORIG-GUID: 0njIfOM21zWpklt0zR6m8XVsbdDeugrr
X-Proofpoint-GUID: 0njIfOM21zWpklt0zR6m8XVsbdDeugrr

On Mon, Jan 13, 2025 at 09:53:01AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 7:25 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Fri, Jan 10, 2025 at 08:25:54PM -0800, Suren Baghdasaryan wrote:
> > > With upcoming replacement of vm_lock with vm_refcnt, we need to handle a
> > > possibility of vma_start_read_locked/vma_start_read_locked_nested failing
> > > due to refcount overflow. Prepare for such possibility by changing these
> > > APIs and adjusting their users.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > > ---
> > >  include/linux/mm.h |  6 ++++--
> > >  mm/userfaultfd.c   | 18 +++++++++++++-----
> > >  2 files changed, 17 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 2f805f1a0176..cbb4e3dbbaed 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -747,10 +747,11 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
> > >   * not be used in such cases because it might fail due to mm_lock_seq overflow.
> > >   * This functionality is used to obtain vma read lock and drop the mmap read lock.
> > >   */
> > > -static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> > > +static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> > >  {
> > >       mmap_assert_locked(vma->vm_mm);
> > >       down_read_nested(&vma->vm_lock.lock, subclass);
> > > +     return true;
> > >  }
> > >
> > >  /*
> > > @@ -759,10 +760,11 @@ static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int
> > >   * not be used in such cases because it might fail due to mm_lock_seq overflow.
> > >   * This functionality is used to obtain vma read lock and drop the mmap read lock.
> > >   */
> > > -static inline void vma_start_read_locked(struct vm_area_struct *vma)
> > > +static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> > >  {
> > >       mmap_assert_locked(vma->vm_mm);
> > >       down_read(&vma->vm_lock.lock);
> > > +     return true;
> > >  }
> > >
> > >  static inline void vma_end_read(struct vm_area_struct *vma)
> > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > index 4527c385935b..411a663932c4 100644
> > > --- a/mm/userfaultfd.c
> > > +++ b/mm/userfaultfd.c
> > > @@ -85,7 +85,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
> > >       mmap_read_lock(mm);
> > >       vma = find_vma_and_prepare_anon(mm, address);
> > >       if (!IS_ERR(vma))
> > > -             vma_start_read_locked(vma);
> > > +             if (!vma_start_read_locked(vma))
> > > +                     vma = ERR_PTR(-EAGAIN);
> >
> > Nit but this kind of reads a bit weirdly now:
> >
> >         if (!IS_ERR(vma))
> >                 if (!vma_start_read_locked(vma))
> >                         vma = ERR_PTR(-EAGAIN);
> >
> > Wouldn't this be nicer as:
> >
> >         if (!IS_ERR(vma) && !vma_start_read_locked(vma))
> >                 vma = ERR_PTR(-EAGAIN);
> >
> > On the other hand, this embeds an action in an expression, but then it sort of
> > still looks weird.
> >
> >         if (!IS_ERR(vma)) {
> >                 bool ok = vma_start_read_locked(vma);
> >
> >                 if (!ok)
> >                         vma = ERR_PTR(-EAGAIN);
> >         }
> >
> > This makes me wonder, now yes, we are truly bikeshedding, sorry, but maybe we
> > could just have vma_start_read_locked return a VMA pointer that could be an
> > error?
> >
> > Then this becomes:
> >
> >         if (!IS_ERR(vma))
> >                 vma = vma_start_read_locked(vma);
>
> No, I think it would be wrong for vma_start_read_locked() to always
> return EAGAIN when it can't lock the vma. The error code here is
> context-dependent, so while EAGAIN is the right thing here, it might
> not work for other future users.

Ack, makes sense.

But it'd be nice to clean this up so it isn't this arrow-shaped-code
thing. I mean obviously this is subjective and sorry to bikeshed this late
in a series... but :)

Are you with:

	if (!IS_ERR(vma)) {
		bool ok = vma_start_read_locked(vma);

		if (!ok)
			vma = ERR_PTR(-EAGAIN);
	}

?

I think this reads better.

Sorry to be a pain! :)

>
> >
> > >
> > >       mmap_read_unlock(mm);
> > >       return vma;
> > > @@ -1483,10 +1484,17 @@ static int uffd_move_lock(struct mm_struct *mm,
> > >       mmap_read_lock(mm);
> > >       err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
> > >       if (!err) {
> > > -             vma_start_read_locked(*dst_vmap);
> > > -             if (*dst_vmap != *src_vmap)
> > > -                     vma_start_read_locked_nested(*src_vmap,
> > > -                                             SINGLE_DEPTH_NESTING);
> > > +             if (vma_start_read_locked(*dst_vmap)) {
> > > +                     if (*dst_vmap != *src_vmap) {
> > > +                             if (!vma_start_read_locked_nested(*src_vmap,
> > > +                                                     SINGLE_DEPTH_NESTING)) {
> > > +                                     vma_end_read(*dst_vmap);
> >
> > Hmm, why do we end read if the lock failed here but not above?
>
> We have successfully done vma_start_read_locked(dst_vmap) (we locked
> dest vma) but we failed to do vma_start_read_locked_nested(src_vmap)
> (we could not lock src vma). So we should undo the dest vma locking.
> Does that clarify the logic?

Ahh right makes sense. Maybe a quick cheeky comment to that effect here too?

>
> >
> > > +                                     err = -EAGAIN;
> > > +                             }
> > > +                     }
> > > +             } else {
> > > +                     err = -EAGAIN;
> > > +             }
> > >       }
> >
> > This whole block is really ugly now, this really needs refactoring.
> >
> > How about (on assumption the vma_end_read() is correct):
> >
> >
> >         err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
> >         if (err)
> >                 goto out;
> >
> >         if (!vma_start_read_locked(*dst_vmap)) {
> >                 err = -EAGAIN;
> >                 goto out;
> >         }
> >
> >         /* Nothing further to do. */
> >         if (*dst_vmap == *src_vmap)
> >                 goto out;
> >
> >         if (!vma_start_read_locked_nested(*src_vmap,
> >                                 SINGLE_DEPTH_NESTING)) {
> >                 vma_end_read(*dst_vmap);
> >                 err = -EAGAIN;
> >         }
> >
> > out:
> >         mmap_read_unlock(mm);
> >         return err;
> > }
>
> Ok, that looks good to me. Will change this way.
> Thanks!
>

Thanks!

> >
> > >       mmap_read_unlock(mm);
> > >       return err;
> > > --
> > > 2.47.1.613.gc27f4b7a9f-goog
> > >
