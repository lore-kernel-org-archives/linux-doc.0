Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481A13C8F3;
	Mon, 13 Jan 2025 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786738; cv=fail; b=KlDcOd9fdAQN9OEm7e/xivQ+qDK4G8wuLDIFJAZVj3A9b7scZVWtDUosPeNz4j3AszpMnGhUVPDGDy5YDs/I56dG0Gz7e8q0KjQRBdzHUVJXyb/c6jxNDc5gPNReZpOfj/v38XnZDBBgjOG8MEiO+jpJlZLqbtrOi60CiWD934o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786738; c=relaxed/simple;
	bh=ebKLd2e1cgx6y26qQN2jg5o4r2WMTEdRWJoiZ1/m7CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mDmvDN4pKNziScVNFil0uJVKLbfgbXyefM18Si92CGKnSczWxC0VSQmpK30fwJpYfIDX17DetPE1ym6SogvbO6FhkqXwnfDT4KcCNNioDTkc1yjsx6c97Pt8Z76ukJcbeOIsdq4VISSEMFVLU8Qudkjn1UspdJOResysMpLe09U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mruXsXxv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eX+PW2G4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mruXsXxv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eX+PW2G4"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGXpHe011156;
	Mon, 13 Jan 2025 16:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wsAV6yxpRO/giED3nmLnX/xwr7uqW++H5ll4pxgAaxc=; b=
	mruXsXxvPZMgmnowxbLWnyApfo+ngLa76SNEiCMXYnNwrsavcOAx061gp/wsiqQv
	Jyj6oJoE95d+KhvPoSms+W2mt9XVon23SSVkgXpu0O6DZ+dbY8DqSurnsylxnfM6
	Q+kvOTGIC4MDa8Gij6T0719810m7ZFGpH4yMYNOCTYM7E5VNiKQ1fDHXXzqaUrRa
	kBiXbnU82YmF4LP908sTddRmtOZcx/fqrw+Yywfro5Bbz93q1afjQibYFpAmYeNB
	K2GEKRgoX6C4F+7TaGs9+k9UG9KDHffPEvfgigvEh39kSvQXb1qxcG5rzQWTj+aR
	h1AFKjVqUWCOhgxWG3wrbw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y41bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:45:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGNnHB036260;
	Mon, 13 Jan 2025 16:45:01 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f37pgjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:45:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7d87l7ISrFmMFKfW6kiqYH3DU2CXTlNjRYTjhKPMkiZhhxDPy47LIG9cmuZ4IzC2RXA0X246Xn0UIcPuk9sHqDyCYpWtzm+av9f376kYL5e/q5bg4FGdiwr5Wv9cGeskFWMhPBMfm87bAQQS4M9VAxZBlDaYfeYUQFoo98sOgXC4DOVhRyBdcf2n3c98HLxtpHjjaiz0DOC5/2KK55UyT/KvoT0dqbc6JYsIVkdfldqE6gu6VLh16qGbsxWZYMYIjoeleUoIv+smq6JpHuXDFmcOeV15BFXPbS7omDP8E6Uj174FeCEh2L2pbgZdgZ/OcCPKAYXmdmZAcbZb3kAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsAV6yxpRO/giED3nmLnX/xwr7uqW++H5ll4pxgAaxc=;
 b=A96TKKJLGOtgLc0NhBDnvFC4gIFIV0GN13gPV/vyZOcIouEJMjmbjiDviaHckuslwdwt35C+2oPpPlPafvwlxPzQYduoOBeww1pQs3T9fzd3aCZzBV88NApgMnAdVRUNo1aBQ22RCLQh0fYdtXsvx7Ps6Mo8LGfa/RmbTjPme1axNvRMDcVpWsUGqo7FHJn3rj2/KIFucDXndSIF0gJM5rFcBwhJJRrvEn+kK3FpaaKvJs1W1jF6Xkiv+o7+e2K5DjUlK9Z/tonzJ76xoZYNzULHLWztICCpMhSZJTjHCSojnHjuIXdDelTfzPAFt8IKW0QWhN49HhJC0+8KuHBWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsAV6yxpRO/giED3nmLnX/xwr7uqW++H5ll4pxgAaxc=;
 b=eX+PW2G4DVcuBOYWh+Y7Ngx7pBhtgG2geSgEA0IIQjmdFehpwYPj7bd0xjXGVcL9gs686KaQrtWd9qBaIh7NhV75PAwcRCUxTvDKWPybSz1BgLqDl+JIREm3sjQc8YDl4O5VFRHTzWpVu+cKLlTECVw4DOtEWpFrROQIJMbKbiA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH7PR10MB7851.namprd10.prod.outlook.com (2603:10b6:510:30d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Mon, 13 Jan
 2025 16:44:59 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:44:59 +0000
Date: Mon, 13 Jan 2025 16:44:56 +0000
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
Subject: Re: [PATCH v9 04/17] mm: introduce vma_iter_store_attached() to use
 with attached vmas
Message-ID: <226c4f90-17ba-4ac7-bfb3-c27770d00b70@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-5-surenb@google.com>
 <6e9329ba-8dad-423f-9741-e5447f85659f@lucifer.local>
 <CAJuCfpGa9YSVtT9hapQqd9r5WFTzyAALtaK6kD7CPBKk+cvgmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGa9YSVtT9hapQqd9r5WFTzyAALtaK6kD7CPBKk+cvgmQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0432.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::23) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH7PR10MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: f552a99c-fb2d-4a95-7fe1-08dd33f19e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjJkeWtVNjFFOERHT3VpRjB0SURkUTlPcUVHcHdzOHBWS3dOTXRpa2lWaFc1?=
 =?utf-8?B?bXg1S3BaYnR2c3JLOFlmaitJM2cydnpBbVd2ZG5nS0hBajZGV1lJanlUbnJr?=
 =?utf-8?B?TVltVk8zSy9JdEVtVm0vMWdFMk1ma294a2EweWlxeFo0NmxWbDdGTW04UEYr?=
 =?utf-8?B?ZUZEeVB2NVlxZFVlckJTYUJzbURTcERpSncxMzlpaHR6b2Z1V0NqSG0zMlJh?=
 =?utf-8?B?cVdqTE80VUQxY2czbzRadm42TUNmZFQ0aUVpeU51WXBPM0RrNE1rVXljSWpk?=
 =?utf-8?B?WDlPLzVYaVhtY21BdlBuK0d5MnA0Rkg4QXNDTDZxQm90aVRqcDc4TmtidjBr?=
 =?utf-8?B?N3JkdkNVWkJFZkVpVnJSdTJMSFJ4Q1A4S1VqaXBJMW9DL0hRNlI4M2JTK0tq?=
 =?utf-8?B?VzhEc1pOd2ZwMWRUWnVYeThvTnVPV0dHZm9SU2Fhb1l1WkpaakhLQlR1UGxF?=
 =?utf-8?B?M2ZmUFdaSlZENklrNmpDU1E2N2dXK2w1RVRYK2ZNcGl0WGZvUVpoZTZzbzI4?=
 =?utf-8?B?T0ZlUEJBL3Z3eGhDc0srOVJDZUZvSnJ6V3VCMzVGem5ROXhVSlpyVWVZTjZr?=
 =?utf-8?B?WWZGQjNBaTlCVUp6dEh3dFNra1NNNWZrUFlqMU5tajNGN0hQK2Q2eCtJMUNM?=
 =?utf-8?B?YnNhM29RNEpyM0Rib3FoNHZ2YzJzNTB4ZTJ1eFBFYmw4NUdVWVJBcWpNcVkw?=
 =?utf-8?B?bjlhWVRqblRTUTBKOHRzNGZIencyYXIyQ0MyWVJPdjU5aEVmWFNnKytML1dL?=
 =?utf-8?B?dGhCVFZORXlneXZvWmw2U3hGZXk1R2tyNGhiSkVCZ0tYUElkTWR2SXd5Q2h2?=
 =?utf-8?B?ZW55SWlNTHl1RXNhQUdmNTE5d1VjU2p0ZDFlY3BBTUVLL0JMRnplU1o3cWFy?=
 =?utf-8?B?Q0laWG94UkNFdnA4ejJTT1FlSnNKS1JZRGFUTTE5V3M0T2tSOW1uSEZqbFJW?=
 =?utf-8?B?amZZOXVmVHkzNW1VdC9kSmhjcWROejhHVHE3cDNrRlBYb1p6b0E1eW9ockow?=
 =?utf-8?B?YzM0andyMUVNMnc0OFNFWGFUNld2SXVjaEcwSlJXNXNNWmJvR2ZQdTlTcklh?=
 =?utf-8?B?ZXlhYVpjMHRmWmpNVFdxNjZobDhtUGV2Ti96dXQxTTBZWDFkWVhlbVFLNXF0?=
 =?utf-8?B?NkV1SEtLNTY4aWxvdUc0S0xZQ1pVYkZhaWVMVGhHNXd5KzFxZ21Xc2xXc2N0?=
 =?utf-8?B?Rlh2NElnb0prT25ZR2NKQmZOUTVyQklER3FMVkdMWmJaSGRIN0grcGJ3K0p4?=
 =?utf-8?B?R25zR2wwR0FqOVgvdDk2ckxQVkpRdDZLQW1iYkxpaVlSR0FnRVVUMzkvdjdG?=
 =?utf-8?B?dTUzSjlPbWlkZWI2NnpXcTI4RUlzRU1Rb1FkWDIwSDhzbWhjbnJNeGRBaWxZ?=
 =?utf-8?B?NmNYRitCdUh4TThCRUlFWkIwZDROMkVvcFhkMlE0RG1LMTNmcW1pWG9Ga1h6?=
 =?utf-8?B?RkM0R3I5MnJEZlhLOFE4NWNCRWRCVm55RGZ2dDYralhuKzBWV2l5Nnl6YjJU?=
 =?utf-8?B?WmdIN3ZWcVlyT29mWDR2K3A3cVNIWDZnMmF4ODVXZ293c09RcnR1WDRrYk0w?=
 =?utf-8?B?dTlKRkVNRm9nTUdXTUlzS2U3OHB2c0hiTEg0YjMrZFNnOEFUK0R1OWlQTUZN?=
 =?utf-8?B?cGVoWW11WE53WE5JZVhGcXhSaHd6eTF4eVlhSmc3aTQ2cUc5QlVHVm91VU1U?=
 =?utf-8?B?cjJVVlZNWWJ6QWlGcnA2NjlRMkZXWEhZUFhEYlNKajF4V3J1cDA5aDZ4eUJt?=
 =?utf-8?B?OWd2NytwTzg0WGQvaEFmQmlERFkxcHFEWElBVk9RVTRDcEdCbmZRSFZlUTVl?=
 =?utf-8?B?Mk4yVGptdUlydFpBQU91YVdIa1R3NnJIZHovWWVZZlBtMy9oYVZmN3c5M29F?=
 =?utf-8?Q?ImZN7meylwjK/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHJKQ3BnYU45eEdEQTVhdGxSYUZtOG1oUWtEMDd0MWptRVQydjNEN3R5OFA0?=
 =?utf-8?B?ZmtnVDRlS0V3cXFZUXN5S1dNaFJqbmJDSFVaYXM4YVRhV1B3NEZnemtKWHQy?=
 =?utf-8?B?NDdTSTBBYVdvN1pSQVc3NFkyVjJleWlKb3Qwbk13NUtlQzNVMEJzKzFYUmcv?=
 =?utf-8?B?QXowUjVraVJDMUpDOS9CNEcrdXdOVSs0aHdrbWNDYVd3aE9jK2NROW50T0J2?=
 =?utf-8?B?S0VYVUE4b1hIRUF1bmRTb2VLZzloSlJldkJYaXZDSTFxMDREbmZLN3IyZUVB?=
 =?utf-8?B?a01NUjhJc1AxVGk5c3lrV3JhRjRtR3BCU1dncjZwL0ozNmhVNHBkNG95WE81?=
 =?utf-8?B?dHpGWEFNY1FrMWZaYlYzbnpmcUNEWHdpNFV1a0JhUndTOWNocHZETWxCVExk?=
 =?utf-8?B?dmtTM24zWlo3WldOaEh6TTNqdVFyMlhDa1N2L2tkbTNaL3pKWlFKREsxeU4y?=
 =?utf-8?B?TjB0aGZkUU90c1laMjVVaVNCZWtGblVBazU0bUxLcVl5c3NPVXdISVZlR05E?=
 =?utf-8?B?MHBsc3hOTjdOVHE0UFgwUjdycE9VZVFGM1V0L2hKNEwzUEtlQU1JSUZlMTg4?=
 =?utf-8?B?dDRSUitGZUxtY1VwVm1LOW5FSWVaZGRwcFR3MXN2Y1lFWHNjSTR4VUV0MGE4?=
 =?utf-8?B?MWhKbjcrK244UytSdkVEUW5nWDJENjhBVEhWczRUZ0ZtVHFBYjlRcTJrd0pm?=
 =?utf-8?B?QlBKWm5RM3dKN01zcklQcHFROGFpTmJzR0lqL0FwcjI3Q3hlRk5reXlIQzBY?=
 =?utf-8?B?SmNkV0pxb1dqSW9OeHROV0NZMXJqVTNZTCt0aU9kVXZVWmhtd1YxL256S1Zh?=
 =?utf-8?B?Sk9nKzNUeUlYQkJnTTRHQ25EUHdjelQyNXp3Z3NiSFZsaUEwUWNRaTlVc2xL?=
 =?utf-8?B?YThHQjdhbG5xTFVWNkF4WkxlelE4NGVZSWowUmJ4eU1Kclg0VmpmVWd2TmRt?=
 =?utf-8?B?Mklqb0paS3lOd0RRUHlKUm42QVpjTXQvYW9GUzNUdTUraEZVLzlkSVdWSGor?=
 =?utf-8?B?NmtRQUdxSis0THhkSkpqa2RxMDdoY2Ywa1Nnemlja3AwZ0V5NE9ER2QxVGI2?=
 =?utf-8?B?L01wRUErVEViNXA0T1RNL3M4QitweDBzZzlTcEd6VENrSmxheXdtNlVCYnNx?=
 =?utf-8?B?cUFscFJmYTFmTklGNkYxc0VocU44aFhrTXlKeUlMQ21NZlJwWEtqMHNOTk82?=
 =?utf-8?B?b213NG5ERVA2bjEreHhaT29RNTFZZGEvT2tUeFBUOFFmQzd2bS8xek9LbS9s?=
 =?utf-8?B?RlBIa05GcXhTeGJqc0RnQU5CcjhqKzRZUDk0eU1teFdVQVpvQ1htK3ByY082?=
 =?utf-8?B?dDlLdXVCSjd0cm5QbTdvamVpZlUyOU9pUldsUEMvQlkvanE0b2JMSUYwWnhI?=
 =?utf-8?B?SkN1Qm5SNGRCcmZqVkxoaUJwK0s1cGlwUGI0MFhUNXBiR1VGZ3NrL04xL3JE?=
 =?utf-8?B?Z0lsTkhHSGp1MHpUUjFvQUpqVTM4STU5K29zN1ZEOUhocUpGekRqMHBvTHRa?=
 =?utf-8?B?TDZ4ZHVOMVJna0ozUlR1VWc5aTcrZjdyZ1IvTVBMU0YrT0kycnp2K085SE5w?=
 =?utf-8?B?SkR0OUpHQ3Q4YUUzK1Q3TWR0c3pvSXE0SkVmZldjdS9oZjZhb3lqWlJMM0xl?=
 =?utf-8?B?TFJ4dzNtd3loWVBhVnBQcDF2NFZUbTFrQkttTE5EQllFTTBacnd5NjNuUGk4?=
 =?utf-8?B?aDhCMnA1VFZmSFZCK0VXQ3ZsOS9nNEFjZTRHVUsydXpYeXV4TGo5S0gzZ21s?=
 =?utf-8?B?aDdzRkR3alBnYVpJYWtON3A1SExrM3g0M2ZDZ1BZWGJLczFGNE4wV2E4U0ZX?=
 =?utf-8?B?N0VhNnhDbGU3RXJSWWxiTEpiVlI3YTg3dXU2d0xxZE5UdktrWnUvTE9tREl4?=
 =?utf-8?B?MDVsb0VKL3JmanBMaDJzbDcrZ3MycDRTWXRNQXA1dE9BZUpNVldzUmdSVGRF?=
 =?utf-8?B?VXpBMTV6cytZSG0yVzdiSndJcW5XR2t6V0FXLzFDQWY4MFI5OFdXN1pZU3Js?=
 =?utf-8?B?cUFTajFMR1VFSk11ZnphNExYbEpUaEV2TDd2NS93YjgrZmRjUzJGNTBoV2FS?=
 =?utf-8?B?VWk1ZWl2eGdkN1kxam5KcGo5RUdUWklmSkwzMlVVakNHang4anlZYW5hRzVw?=
 =?utf-8?B?SGtxN1JWOHpJV3liUUVYWVVsV2ppRWhQOXJWelM0dW5wZTEyQnQyYlgvd0gw?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PXSVRZw/bKGMiVtEmd8+pmYZIXuEW3DzZwr2lk/ShkC+h6iNgQ2YuG1saXzDfXVG9fQgEZTHAA2/zdUGhMNfrNfdHiKtVbMlOBbPGgUv84yrm2Ip3haXn/tx4JM499TeLJebM4UjvFrsj3YLvYd3W3yQKw/L+gwwpbrbvHXN98oPYrP9Z4gjmqh8elubuZgzMIhQVg1Ni31rGjOIPY+bYv+1dQE4OU+sTAaYcYJNyPuRcHCUUvq9NshdOmE7LNKuZ8An4/UBthGeP8qGusfcUZI0KtDDR2hupu7PupIjek//XfiZEQFx4ne7cj2s2VmI7Q3AWIXX3jbNK5LQBpTZufpS7l+FOTOBYX+mxq5JzCEtH0AciW2t5fz61yZYTfZaAt9MZ1hzIpeY44oFbetX/yMK1hAYv72lll9CcUeMZ0qFa01OFsOgOKWcna+AMXyKkucY5dvedErZrkJMSt9KheN/YP7DuUw/vnM87RJCP53JbIy9Mk1CXp0EgDRqf5vc92/0XynmR9WSyQwwr1aYzSMGChLAL8fGc9hmzx5K2eCFEmbcy/zngd/yvux7N8qlPLWK3IoPlbetxr34h0u/32AuREwqe0QxdHv52OFqYt8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f552a99c-fb2d-4a95-7fe1-08dd33f19e46
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:44:59.3217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYpRFwAGjeKEagh694fh++IPVoVNBvPNrfpJdWxDz/D5HVIELRPH7/ICP70YR9jG3TniyGEwasc7vMFpY7Dry45bZxr0HjWAxa1o9Nnd+oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7851
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130137
X-Proofpoint-ORIG-GUID: cw8za1me5SoXwkZidWExY210JVbOpIpA
X-Proofpoint-GUID: cw8za1me5SoXwkZidWExY210JVbOpIpA

On Mon, Jan 13, 2025 at 08:31:45AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 3:58 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Fri, Jan 10, 2025 at 08:25:51PM -0800, Suren Baghdasaryan wrote:
> > > vma_iter_store() functions can be used both when adding a new vma and
> > > when updating an existing one. However for existing ones we do not need
> > > to mark them attached as they are already marked that way. Introduce
> > > vma_iter_store_attached() to be used with already attached vmas.
> >
> > OK I guess the intent of this is to reinstate the previously existing
> > asserts, only explicitly checking those places where we attach.
>
> No, the motivation is to prevern re-attaching an already attached vma
> or re-detaching an already detached vma for state consistency. I guess
> I should amend the description to make that clear.
>
> >
> > I'm a little concerned that by doing this, somebody might simply invoke
> > this function without realising the implications.
>
> Well, in that case somebody should get an assertion. If
> vma_iter_store() is called against already attached vma, we get this
> assertion:
>
> vma_iter_store()
>   vma_mark_attached()
>     vma_assert_detached()
>
> If vma_iter_store_attached() is called against a detached vma, we get this one:
>
> vma_iter_store_attached()
>   vma_assert_attached()
>
> Does that address your concern?

Well the issue is that you might only get that assertion in some code path
that isn't immediately exercised by code the bots run :)

See my comment re: testing to 00/17 (though I absolutely accept testing
this is a giant pain).

But yes we are protected in cases where a user has CONFIG_DEBUG_VM turned
on.

I honestly wonder if we need to be stronger than that though, it's really
serious if we do this wrong isn't it? Maybe it should be a WARN_ON_ONCE()
or something?

In any case, a rename means somebody isn't going to do this by mistake.

>
> >
> > Can we have something functional like
> >
> > vma_iter_store_new() and vma_iter_store_overwrite()
>
> Ok. A bit more churn but should not be too bad.

Yeah sorry for churn (though hey - I _am_ the churn king right? ;) - but I
think in this case it's really valuable for understanding.

>
> >
> > ?
> >
> > I don't like us just leaving vma_iter_store() quietly making an assumption
> > that a caller doesn't necessarily realise.
> >
> > Also it's more greppable this way.
> >
> > I had a look through callers and it does seem you've snagged them all
> > correctly.
> >
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > > ---
> > >  include/linux/mm.h | 12 ++++++++++++
> > >  mm/vma.c           |  8 ++++----
> > >  mm/vma.h           | 11 +++++++++--
> > >  3 files changed, 25 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 2b322871da87..2f805f1a0176 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
> > >               vma_assert_write_locked(vma);
> > >  }
> > >
> > > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> > > +{
> > > +     VM_BUG_ON_VMA(vma->detached, vma);
> > > +}
> > > +
> > > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> > > +{
> > > +     VM_BUG_ON_VMA(!vma->detached, vma);
> > > +}
> > > +
> > >  static inline void vma_mark_attached(struct vm_area_struct *vma)
> > >  {
> > >       vma->detached = false;
> > > @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
> > >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> > >  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > >               { mmap_assert_write_locked(vma->vm_mm); }
> > > +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> > > +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> > >  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> > >  static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> > >
> > > diff --git a/mm/vma.c b/mm/vma.c
> > > index d603494e69d7..b9cf552e120c 100644
> > > --- a/mm/vma.c
> > > +++ b/mm/vma.c
> > > @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *vmg,
> > >       vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
> > >
> > >       if (expanded)
> > > -             vma_iter_store(vmg->vmi, vmg->vma);
> > > +             vma_iter_store_attached(vmg->vmi, vmg->vma);
> > >
> > >       if (adj_start) {
> > >               adjust->vm_start += adj_start;
> > >               adjust->vm_pgoff += PHYS_PFN(adj_start);
> > >               if (adj_start < 0) {
> > >                       WARN_ON(expanded);
> > > -                     vma_iter_store(vmg->vmi, adjust);
> > > +                     vma_iter_store_attached(vmg->vmi, adjust);
> > >               }
> > >       }
> >
> > I kind of feel this whole function (that yes, I added :>) though derived
> > from existing logic) needs rework, as it's necessarily rather confusing.
> >
> > But hey, that's on me :)
> >
> > But this does look right... OK see this as a note-to-self...
> >
> > >
> > > @@ -2845,7 +2845,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
> > >                               anon_vma_interval_tree_pre_update_vma(vma);
> > >                               vma->vm_end = address;
> > >                               /* Overwrite old entry in mtree. */
> > > -                             vma_iter_store(&vmi, vma);
> > > +                             vma_iter_store_attached(&vmi, vma);
> > >                               anon_vma_interval_tree_post_update_vma(vma);
> > >
> > >                               perf_event_mmap(vma);
> > > @@ -2925,7 +2925,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
> > >                               vma->vm_start = address;
> > >                               vma->vm_pgoff -= grow;
> > >                               /* Overwrite old entry in mtree. */
> > > -                             vma_iter_store(&vmi, vma);
> > > +                             vma_iter_store_attached(&vmi, vma);
> > >                               anon_vma_interval_tree_post_update_vma(vma);
> > >
> > >                               perf_event_mmap(vma);
> > > diff --git a/mm/vma.h b/mm/vma.h
> > > index 2a2668de8d2c..63dd38d5230c 100644
> > > --- a/mm/vma.h
> > > +++ b/mm/vma.h
> > > @@ -365,9 +365,10 @@ static inline struct vm_area_struct *vma_iter_load(struct vma_iterator *vmi)
> > >  }
> > >
> > >  /* Store a VMA with preallocated memory */
> > > -static inline void vma_iter_store(struct vma_iterator *vmi,
> > > -                               struct vm_area_struct *vma)
> > > +static inline void vma_iter_store_attached(struct vma_iterator *vmi,
> > > +                                        struct vm_area_struct *vma)
> > >  {
> > > +     vma_assert_attached(vma);
> > >
> > >  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
> > >       if (MAS_WARN_ON(&vmi->mas, vmi->mas.status != ma_start &&
> > > @@ -390,7 +391,13 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
> > >
> > >       __mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
> > >       mas_store_prealloc(&vmi->mas, vma);
> > > +}
> > > +
> > > +static inline void vma_iter_store(struct vma_iterator *vmi,
> > > +                               struct vm_area_struct *vma)
> > > +{
> > >       vma_mark_attached(vma);
> > > +     vma_iter_store_attached(vmi, vma);
> > >  }
> > >
> >
> > See comment at top, and we need some comments here to explain why we're
> > going to pains to do this.
>
> Ack. I'll amend the patch description to make that clear.

Thanks!

>
> >
> > What about mm/nommu.c? I guess these cases are always new VMAs.
>
> CONFIG_PER_VMA_LOCK depends on !CONFIG_NOMMU, so for nommu case all
> these attach/detach functions become NOPs.

Ack. OK good, I usually like to pretend nommu doesn't exist, but sometimes
have to ack that it does, now in this case I can go back to not
caring... :>)

>
> >
> > We probably definitely need to check this series in a nommu setup, have you
> > done this? As I can see this breaking things. Then again I suppose you'd
> > have expected bots to moan by now...
> >
> > >  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> > > --
> > > 2.47.1.613.gc27f4b7a9f-goog
> > >
