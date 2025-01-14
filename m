Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA8234CE1;
	Tue, 14 Jan 2025 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855141; cv=fail; b=pQbnHWc/1FaQBpjIUGwWkxs9+bGJ6lX4Xux2FOkt2lw1eBOod/5WqjixrRquZ1m7Fh7zirFwzSR0dPOCjyw1KJKsWstF8u23SDifpFV2AvtsQro2ZMcsFVfatRevLsyjydSX2fqV8njC7GYEaVjTVkb9lhwnuOBeJUkMSkDB564=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855141; c=relaxed/simple;
	bh=3/SF/etR12tif6mZXI6fHkwYumGRdTnune3tR2z+Lqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pgOIhkiwjuGZ9ISWUyZXpNEvDDOfCLa7m2HLKjVDPVZAbIlcD/oWmtxClZUynUUpJkptTvb03zZflwp3liMzgu84MJ/2d60Fk9nodWFbDk4lPnKSTnVu3e8mPgaOUM+5u5wkY0lHPfOgddE2Gtrf2pzLfC91HGp16vpp7IW+k30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XeNzq+Y+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G71/61wo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XeNzq+Y+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G71/61wo"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EBgVbp021707;
	Tue, 14 Jan 2025 11:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hURQCxxD9vZo5IA8Tp3/NhTgM3aezXl4VOzLe/iL9QE=; b=
	XeNzq+Y+k6JLfiwT+9l3n8VK8Z50VHfpJRFbgX40Spzi8lp3wsRD7KeRDFQti7nh
	CNiHmvhQ7PYIL3bR2lbqji9eyzzocZefVyIZ7lWwT2iS72aYzKOd9RIsRajEYNI/
	CpXd8CshI5Ekc1dfwdXEL5SBFFW96vLiySeC4YOMmi8tmFIQCyVQH408EI75w5Q8
	uxxckq6vfPHtG2fYDaI4EQbgI1X/ZyQGp5lwBNL4OJfQQMbXrYV/KgBRqw6tKWHI
	onolYw1BFsHNFY78ACtHNNy+COdb7h34kFuTxkVyHKffTCNz8KWGQlIzvNn9oDLN
	bpel2JB8Wvhrn90CTW76dw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y5j9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:45:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EAg9bg033248;
	Tue, 14 Jan 2025 11:45:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f382q3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+TN8g3Z/u8DV4Ss0exbxM5HYuC7bUzGF5jmjtoUOJ1LHDdl2qdqBS8A2XhdGjbOuxQhiTtT9oRyK0+FY4An3ZPr/47xFVbsu/g0DBdG8KKeHEAkZgLW+VpN/W0ptBTb6JJkGAzuRrofMPC/34B2uxACTtm2/uQkoStIYBTPJc9bkV53a/Ich4EIizccOQO7JoWqMj2iQ/EI02Lrr6fxuqfw9I7+g/TA88b41mHpSAmcJx9uuLkg7hIr4fPZfGoneeNgMRVzjNH1i4GKLpWnUVlBMsrcimwqMqT5XrO/EJIiRfcXzbSBQ5lAlCZckyGL5ROIKSU6fgGKCIKcVqcHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hURQCxxD9vZo5IA8Tp3/NhTgM3aezXl4VOzLe/iL9QE=;
 b=xSrZXJi1a7AtNbhn4XF+tsd9ExgB5gi0iuEAaTSm6VS6vJhIa+99TnmG7bLtEcvNwRFMXEofaY2ajH+070qIUAZAyWY4vSMNfBEz1EX2bRuth6S/8emmy1Ra/CRg/Y4tbhKNspn4YOsZCpLo/j6mNYRllas7F7LSCICcM6MRydWWkGLGGPpyhOthHt7fw4WvPDlauIiFlKAYBvwrOpyfNFIYOqM/HCCsI8K137xsNyyFaSas3GgEhsq6FpATsnoYGAtb0X9Uqxh+7ViLoXGgMk4G2XVBLaXTbUdoIrSGjqcK0eBMjP9624yhCoBFMZcvsjGDHGzu19VxO+4Q3s+bQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hURQCxxD9vZo5IA8Tp3/NhTgM3aezXl4VOzLe/iL9QE=;
 b=G71/61woXOAtj1QCxgV0G/mOI4YlF6lyX3eObZELgE0CougcCHJ3+1DFRZxM8y2souHV1g2t0z+YEKxpqI+7j65KkT+3l8vrFi6jUCZ/v3q2xsZkW6tH2EUjWfFB+h7YjAhnfQqiZPwHRGrRLQY7jmOwSOXA0XxPJJIArWWOnfM=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW4PR10MB6440.namprd10.prod.outlook.com (2603:10b6:303:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:45:03 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:45:03 +0000
Date: Tue, 14 Jan 2025 11:45:00 +0000
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
Subject: Re: [PATCH v9 14/17] mm: remove extra vma_numab_state_init() call
Message-ID: <3959a318-354d-4b03-bf9b-09328fe0bd88@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-15-surenb@google.com>
 <5b1d82dd-bb30-4a5a-8f3c-949be4a81c45@lucifer.local>
 <CAJuCfpFrtZnbA5Xr7iy5BT1ANkT_wqRsu_2A+sWToLV5=faxKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFrtZnbA5Xr7iy5BT1ANkT_wqRsu_2A+sWToLV5=faxKg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW4PR10MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acd82cc-b5fc-4481-33b3-08dd3490e254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnM3bjFFdklCOGV3TnpTRlloTzgzVXhBQVRBWUYzQWxkT09idk5VZGtUdTNM?=
 =?utf-8?B?SVFMa1hQUmFZckpzUG05cmN0QnMrZnZ1RE4rdU5OUDAydTE5cXRHajZNc29J?=
 =?utf-8?B?TS9POHpuN0t0S3lMNTJ5Y1Q4T3pDcWRLNmdCeE1OelVlZUlkbHR1M2FCOHpV?=
 =?utf-8?B?UTE3TEpRWkRtcVA4OHUzZ0RQc29idE54QW16c2gzb2FSaXU0Q0RPVk5hNXNM?=
 =?utf-8?B?eW1PT1YyVE9qMzBPcW5VNnFKTUUxSkliMCt6UVdDVW9LTDBEcXIzUkdrWWZS?=
 =?utf-8?B?Ry9Wakp2YUVyUE1Zd2RWOStEbXgzRUsvaFMreTFOU3JCRDA3OEtwaUNiN0l1?=
 =?utf-8?B?S284QjFpNEVHQ3hDSGhtV0EyV1o1cE1zdlk0UmV2OEpjQXZRcGh0NCtLdGh1?=
 =?utf-8?B?aWJWZnRGQTRaSlFLcGp0UDc1VTg1QTJob0hscXladTJhU1BEN3hKV3cvN2J2?=
 =?utf-8?B?SW9zYVR2aVAxRExrOC9PVnNSNDFZNHdYamJ0a0M2blBKYmRGUDhjQzMzbE5L?=
 =?utf-8?B?T0RBOU12RDNTbUxBUVYwSUVJRzdwMmdkQlJNOFpUNmlhTEVVL05WNWRsdmpN?=
 =?utf-8?B?N2RtRmplWDhWenpSSitQdkhvTGhDRTh6VVdOaEhxMEZiSDdLeGxJRFR0aXpt?=
 =?utf-8?B?RmNSbnRNUVJBS1dZMlp2R1A3UWlPN043TkROVmJmUG1pT01QQlRFUnlyVnFT?=
 =?utf-8?B?WlJDdDBBZDlrckVrOWlmaGgrWm4xWEFicDlFelBmWi8vME9qNVpFdkhFeXc2?=
 =?utf-8?B?dGJOdnRQNDJTTjFMZmkrY21QWll1NFNIS2ZrMktzQVNwUzlrNzZsSGRFZEIr?=
 =?utf-8?B?UjZaRDFOeFY4dEYxMjZQdVVGRDBDOFVhYU1JeGxubVRJS0xoQ2JWQUZSbWRF?=
 =?utf-8?B?ZVNwakprR0g5VHhCWWRGSjB3dFQ2TDQwNFRhQTE3UDdNV3UxdFl5RVoyQ01i?=
 =?utf-8?B?dWpkZ3NJNWFVMzFheTg1TWx3U05sQ3IyblJxN0l3WGR2WGlzODl3ZHpxaE9S?=
 =?utf-8?B?WnBBVkFyclZFdWR2OXVCbHhhVng4RytPQXZpNTVBUWNzZG15dUR0MVh1WVpW?=
 =?utf-8?B?djM0RFExUHBHdWFieExKUWVkYmJWaDluUS84QVJjT1ZVU0xwRHBWbzBBUVdJ?=
 =?utf-8?B?dEhFdU13WGxkTlNTcHVDWlVRRHh0MGpIZjExQ0FwUTFTUXFMcWpMcEtXQTFM?=
 =?utf-8?B?VTg0TU00ajlqZlg1b0FNZDJXWmxqcmt6M1RjS1MwM3pqNnRxZzVIblhpbkdN?=
 =?utf-8?B?N0Njd0MvWlNBN21udnMvWVJvbkhodDZ6L1AxM0RrNnMxV3pyR2J1NjVOSGlP?=
 =?utf-8?B?bFFVNlVhV0JDZjJaVFdJZ3RtNFZVb3V6eTlERGJaOUd2QmowNTZqUUZyZjlL?=
 =?utf-8?B?S0dRd0EvMGtvWHd1ZGNnTDVmZEU3cTFXT0cyZ05hdXBSUDFzajVpSzk1Qm8r?=
 =?utf-8?B?U0ZnVmsvZDdLWWxaNlV0OVp5Z09YRmkxcmt5MkN6aXFLdGxyK2hWbXZBWkY3?=
 =?utf-8?B?Mm10dlM2SHViczYrQTRNRzRFT0R6c2pGZFIyb1VBQmlOUFQzbEJIY0JBQTdr?=
 =?utf-8?B?OUk1dFVZOEphaHZTSDYvVlhvdTF4blZBRU9IUVI5QSszNHZ2b1J3R3QzeDBr?=
 =?utf-8?B?S0QxSnJCcFBOU3JMQ3laT1hONHVmQzRiaEJtdG1lS1cwU0tCa2R1UEhqTU5W?=
 =?utf-8?B?UVRJdmlCdEVna0VFMDYxNEttL3hLR1F3ZHZuVTNOckw3WkJEaTR3U1daaXJv?=
 =?utf-8?B?d09ORHdCZVVXMXRQOEJwZGN6UTZWR2NUbjdPaU0wVit5OWFOOEJldUtCTXFL?=
 =?utf-8?B?b0FiYXVmYngvRVhtVlZ2Q1JMSDJXOFVtK29uQjk1VlJLbGZjQWZWalVJSmN5?=
 =?utf-8?Q?U3VJwaUZlSJnS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alJMNzNLNHJsekJJZWNYU3VTSkpiNmUvZFNYamthRnBJaVZGeVBQc21JdXcz?=
 =?utf-8?B?YjhVKzlqcVlRUGsvaCtVSTcxZ0IvVHVYL2lxT1djNzJxOCs2NEdpTkN4NlVH?=
 =?utf-8?B?blZCWXNpZ1VuRlpteU9BOXFPOEh2dFNVL09Ec2thL1RNeklHYTBvcmo2WE5t?=
 =?utf-8?B?Y2VodWlwU1gwMFdrcUUzUTRkNDBsZEpKOTVjbFB3TjkwVXdaUjNQUjhCd1Q1?=
 =?utf-8?B?RHZtclUwOUhGQWJwK05sZDBETHMrTzM4aDNMeVlGVjRUNGM4Y3dVeWlhTmVL?=
 =?utf-8?B?VGI3NmxIaFpXNVQxYnBvRFJabDJvT3hqRG5MRHFjblJ3QjNCTlVUTHBXOHNv?=
 =?utf-8?B?dElPaG1hU2F5NXp2dUhUQTEzQm0vMXlNUDFzaTlXeXkrZ2tXZ0tKdmRoTnVk?=
 =?utf-8?B?YUpNNnAyZlVUUnNnYnJMOENtaEJHVkNWUTJhZmQxMm5KZ1RneTNQcjhQODlr?=
 =?utf-8?B?OStHK1phcXU0MWlYaFd6YzgxR3ZXTGh1ZTdyVlZONGx5d294U3pRaXQ3WTUz?=
 =?utf-8?B?TjY4cDZESVVTQjFUQ2JTRVFQek1IdXZKaFRKNEVLVjA2OTdoSGhUWmdaakJw?=
 =?utf-8?B?VENjQ0RGbW5tdmFVQUJ0M1NLbjRIeTA3bnFqMUtOSzF3VTNZY2VKUEd5a1g3?=
 =?utf-8?B?enBwL1Ezc1k3VjRuWUg0dXlqdG5vU0JpS0xrWWRaeVdmbkdzUkU0K2FQRG1y?=
 =?utf-8?B?SlJjcmFZTTVoWHlxRm5IcjYzaGp5TG0xalhhNXpnT2pyMVVnMlMxNnFJUDBC?=
 =?utf-8?B?T2MwWWVnOG41ZTNEYUtXbmxDMmZQVDBndG5wNUg5V0JuQitiRmxnVDlrRHZD?=
 =?utf-8?B?SVNTSFczc2tjQ25qdXJDeEMyVCtpb09MenlrdlpSNldVL2xTU3NNb1NBeUVO?=
 =?utf-8?B?VUN3UENMeFJqcFJTWGlybmszcDNDL2tXdTJTYlRYQXZ0cW85YXN5ZG5oVnpL?=
 =?utf-8?B?WEJ4Yk5XR05sR3U5N3drN2Nhcm5FaVJubWhUU0toSmt4bXNUeXNvMittTnlE?=
 =?utf-8?B?Y3dUN1l2aTRrUklaRFAwR25nRGdrK2k5SzdCWERtQWJrV3lsekxxOHBmQlo1?=
 =?utf-8?B?NlErWS9zNGRBU2phQTZlbjBoYS9TZjRXUUZQa09DQ2lyOTY2ZG53NWw5Rzl2?=
 =?utf-8?B?cjJZU3ZRZFF6QSs0MEdDeGUyZTVpeFJQUXNJaW9MOTBKdjRsend3UUxuS1pl?=
 =?utf-8?B?LzlCVDYxa1RhTnJTRTRUMlVBeENWcmlsZFJDWUtSY3lqY056WjJCcG9MRy8z?=
 =?utf-8?B?aEJ0OTZYanpOdlo5SkJLMUxrQWFqR0t1dEJsOHd4bkFmb1d4OEpWeTZZYXhN?=
 =?utf-8?B?QnFIdzdWNmF4S2ZNdkhjWmxneWdVUDVyaVVKampWKzRhTVpPeWVsOGNURWRG?=
 =?utf-8?B?NVl2d1d3YmhwUUR2SHlkbXk4Vzh3Q2N0czJvRFRmdWhyeUlReEg1ZWM3ek1B?=
 =?utf-8?B?dkxYQnNSaTIwUzl2OVdxbVlpME03bFNzLzhPQ05HWlQ1MTlxaWxSdGhlTlp6?=
 =?utf-8?B?QmdJR0h1RHdXTEdTL3FLVjZMS0FuZjBIcGFLbjkrMUVFcFR0VUo2TDhvdWMz?=
 =?utf-8?B?T2s3VlB4WVZGMXRrZy9OTTI0aURKQnJaYmlvWlRrdHp1V0g4TVdrbC9ud1JK?=
 =?utf-8?B?dkxocDZBa2ZuUG5KcklsQWlDRUI2QWdUN05nVjh5eW53Q0ZZWGlHakFoM3RR?=
 =?utf-8?B?d25VWmpTVzR6WncrOEp4TmN6VEQrQ2JrOTA1YUJNV1d1UWcwVytGNDJDOHA3?=
 =?utf-8?B?aGlSc0tiUUNoZHdyR1ZDZ0h5czlPNWF4MjdtNUFkbzRGS1FxTHhKZ0hndlJ6?=
 =?utf-8?B?eWxtdGdOaXBuNmdia3JFVGRTcTdXRllXd2hzZGdvNHJIRlliTTFhcjhnd0d4?=
 =?utf-8?B?NVR6ZjJkeUlpam8yQzNwVkxINEVxeTlJK1pGWGRMdVJ3dTE3TGwwaXJRZEM4?=
 =?utf-8?B?aXA5V2NKQ0ZpUmJrVnNkMWJ5eS9QTGsyWjNOYW5YdS9CK1ZLOEdyS28wdzN2?=
 =?utf-8?B?czg2cnpLalNHL1NCbFVjRWltVVBnUWNJK3ZSd2hxK1V3bllDM09KNjFUKzZ0?=
 =?utf-8?B?TVFSMFJQSWswcC9NV09taWVCY053ZmFmcGovd05pZWxld3l6VEpNM255TGZi?=
 =?utf-8?B?VDZXZXJMVnRjeVZFVE1ZV2tXTDl3cmg1b0t2dGt2cDBhRW93UDRkbWl6TVJa?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+A6Ni1KoiRDrPyevqFcAtsDutXWgt/3id8twBQ9GuQHYO30VutZ5zeY0xaHe3V3OnO0J+73+wnTgYAlmGf0B2O1YnoA20VCUb7JwK2yjj+t+FPuhCvhihiqXt6/DCzai3xRX4iCo8mTXl3wqkgdmRtalz2y8k+PReySILmKW7Hq6X0N4QMNThVyoJNk8EK/Zr2nUKjU6YfxKFkuNd8aegUt5FAljgxuXIGi5N6pjtAU3JqC+/lREXZmjWe5Qdq7D8XfuXkltywj3kQC45bR/X3j68IqEvPzZyqFgX517+NXuCB4Gu7xAjGua2YiBUZDoAF4f5hkTAZtcTWziyN0XEe/I3eVAnw+b2XNcnbyHkRNLR8MktnKKluio7pyHQrNrQdrLt8FA6zMGG8lqXHvsh+4MUx3fNErUomAk77weOce9xroPqnh+gAEvCzesGjQ0kVi7VZ6775LKRgNjGJoKC8rkJuJyeZcwk8nqQhys2yzWnXRpYXvql3sX+Kcfo/Nau5TqtvCWPX1WMeHfvEiEe6bYo+yLx6tttGRKSWL3s1RiM5qgCc6423Hy0GLBlKA/ZGssTeBQb8exC5dxswcW109ln29gijyn55IG/tk529M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acd82cc-b5fc-4481-33b3-08dd3490e254
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:45:03.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAYpZ6T/MBYTMjzii8Qjk8i+rngk6bJri5ayUBLKLydBxgBQofSsQ8xWHl75wSfU8lGFgLduxr2OXLUkZZC3jflhgOL07VDqdBncGR3QxMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140098
X-Proofpoint-ORIG-GUID: fS3IVixaMlPGUKs_xinOI8GyCUcXtast
X-Proofpoint-GUID: fS3IVixaMlPGUKs_xinOI8GyCUcXtast

On Mon, Jan 13, 2025 at 09:56:17AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 8:28 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Fri, Jan 10, 2025 at 08:26:01PM -0800, Suren Baghdasaryan wrote:
> > > vma_init() already memset's the whole vm_area_struct to 0, so there is
> > > no need to an additional vma_numab_state_init().
> >
> > Hm strangely random change :) I'm guessing this was a pre-existing thing?
>
> Yeah, I stumbled on it while working on an earlier version of this
> patchset which involved ctor usage.
>
> >
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> >
> > I mean this looks fine, so fair enough just feels a bit incongruous with
> > series. But regardless:
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > > ---
> > >  include/linux/mm.h | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index a99b11ee1f66..c8da64b114d1 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -948,7 +948,6 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
> > >       vma->vm_mm = mm;
> > >       vma->vm_ops = &vma_dummy_vm_ops;
> > >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > > -     vma_numab_state_init(vma);
> > >       vma_lock_init(vma, false);
> > >  }
> >
> > This leaves one other caller in vm_area_dup() (I _hate_ that this lives in
> > the fork code... - might very well look at churning some VMA stuff over
> > from there to an appropriate place).
> >
> > While we're here, I mean this thing seems a bit of out scope for the series
> > but if we're doing it, can we just remove vma_numab_state_init() and
> > instead edit vm_area_init_from() to #ifdef ... this like the other fields
> > now?
> >
> > I's not exactly urgent though as this stuff in the fork code is a bit of a
> > mess anyway...
>
> Yeah, let's keep the cleanup out for now. The series is already quite
> big. I included this one-line cleanup since it was uncontroversial and
> simple.

Yeah it's fine not a big deal. We can address this trivia later.

>
> >
> > >
> > > --
> > > 2.47.1.613.gc27f4b7a9f-goog
> > >
