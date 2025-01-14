Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24060234CFF;
	Tue, 14 Jan 2025 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854749; cv=fail; b=Dhz4nt/mNbajr7LOT0/9kkgBjd+X6/iA9RiX7PDhxKzRkxGMpTdGPYlVFZ0fcnT3NrGz+zMhO3ypl1RPdk5YB1uVj7TUpjks/NCkbNB66TnH0idqqen6FgCBWuKqBC12ADdOKPhpl5yREp8ZTUb94HNQoS5sK6i5gRIDmCXDeac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854749; c=relaxed/simple;
	bh=oz5923g5W4Ls9hUTHPbjQdrtQXR2geXaTClJA4/ox3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dd32h1yVxRBeZjGzfFeyU4gEuN2jUnl0Fx42+4FP9JUE64quumRgsK1GwsmN4ZWLjoHGLnvicDnWZRpEjPtIbsX7CFVUOmzxgXs+1wgxEWwU+dxTN+QmHVUyIXPIqgSuLMujjasmQCXzoHj7E7SA/6qspaGkzbOtWuEJ6JO53wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hiKLsjT4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GIFFJLKH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hiKLsjT4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GIFFJLKH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E1BqMd032394;
	Tue, 14 Jan 2025 11:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YhnvCSDy7mUb+Rvtk9l72e8lxAnQ/QzYRooXG3fD++o=; b=
	hiKLsjT4p3+VFNCXFWW/LRupCG14Tkmi3rmIt0Tu/CFiB3e0nsCcQOxDslT3xrdF
	KnVRqwX9n7LraOvbrfCxDJ2KEahJkuTE5Bfufuujr+/oLrmAgkZ8L4Xq1r7RYQyH
	kc0+D3XB5hjft+UrUTT2YPQvo/jjQpYaNwb7kKZq2IeZ28TeDAuncFwp2iq39+aE
	Ltl+7nv4t+af9h5o1hYGL5PsVzQZLsk96fsh4cBM6K5lS7cLhhZSoidvZY5aB/0I
	JiFbEBPRC20QEt+uNoMlhXuw8/Gxottxag19JdmEIQ6icepLBFkdPIoqQcKkLcGU
	cbtjDvQsPsV0OYH0Y7if7A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gh8wdfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:38:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50E8kk5D037156;
	Tue, 14 Jan 2025 11:38:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f38jxwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDmQqc1i3+kcEHBCuvsyXzqF4JLil+i85R2Axqrt/SUW8TZnPlazyXPfMM3AdfUYTJBKJbAm3Tzd1Z7cEnr7s9SGMsA7u+OU6nhNSFJHKj77cuPalirPKRfwW7xeU7UiAopSfSlRJ0jUL879tijobwacA2oKIyu97LI7sitg085ZD0lyok69INJ838xLIbsRe9s8rqmFEu8IRbtvKWnE7bmooeyLaAeOJIc8qUuixfiX9pSLa72Kjx+PhZiJn9TUoY8ns+4hnopFxkFaiFtssV05QmuSk8B0Is09TnnOHo8TDYoV6oLocEoNJ0i+3EIxxfILe1+9VoZdrr9uEuy0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhnvCSDy7mUb+Rvtk9l72e8lxAnQ/QzYRooXG3fD++o=;
 b=ZwtW+6Ohlo5NcdqgjsOQLGW9jtGIBsd69BS0jiE/+FUzvNu/4hQ3OIH/DfPH5AtNJ7b1psE77Rbj53O1pz19mvJ4OrMJZAl+S9ofuLrrTqoAU7d639lLU8lpLsk3s7QtGlQNjNl2CTj3bq7Nt9iZ6CDu8BM9V2Z+TceuXWR5EEFCAyB2uPGqBMNO0iSk9UMHre/SzcatSHWC6aa1UZ+seJdzLjEXMI7byiCSdfYMMFcEYvQHYZzsZjWO6TB4dzu+ZKYANwpZsxBhp6A5+whsxkpKnYrXrCqsbfkfIBDSowMOYBqx/zHgtWX3rvuCouZkCtbsqZkAmWh3TUMx40q6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhnvCSDy7mUb+Rvtk9l72e8lxAnQ/QzYRooXG3fD++o=;
 b=GIFFJLKHtR6Np6GJ8Q9HZH6EmkW08GgzkdmX/9abfXMrL4Tng41N2Mv46gfNlCt/G9e3vPNKBnwfSgwOrKgItPfksih3XtR4jd905oZJYEbdp2rYQBDxBcnsug98gG2hCmTxH4Ab72L9AOSb7/bKDPj0JjehdRvs+wxGGUGIWuA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB4493.namprd10.prod.outlook.com (2603:10b6:a03:2dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:38:08 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:38:08 +0000
Date: Tue, 14 Jan 2025 11:38:04 +0000
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
Message-ID: <5536d7ee-5f07-496f-a553-63d31915d487@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-5-surenb@google.com>
 <6e9329ba-8dad-423f-9741-e5447f85659f@lucifer.local>
 <CAJuCfpGa9YSVtT9hapQqd9r5WFTzyAALtaK6kD7CPBKk+cvgmQ@mail.gmail.com>
 <640fee1d-e76b-4aca-8975-f6bd4f3279d9@lucifer.local>
 <CAJuCfpFXwX+g0rCXAB_8s61VheOJZCBTSk1hyqrSWxqMPrE7MQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFXwX+g0rCXAB_8s61VheOJZCBTSk1hyqrSWxqMPrE7MQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0267.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e53f36-e530-4aa5-a287-08dd348feae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEcwZDNxSERabUNTeFYybXlNMHd0VnJ2SGxyejNFczVqTzUxeHAydXBUc0gz?=
 =?utf-8?B?cWovR1JaeThOOFRwbmVoaW9IRE9ldm1GTUlTMzdOWTNHWm1lMWlQbmhUMDlF?=
 =?utf-8?B?WmtkYmora2RrdDVSUlBzT0ZsSGx0dzY2VUdNOC92bmdES3BodDFaemlkSzBP?=
 =?utf-8?B?N0tjb3I4UFFsamFHS0RoQm5JQnhjbnNMekFrbVFBMGJCV0Q5amYyRGdnQWlz?=
 =?utf-8?B?cjV6Y0E2amx0ejl6ZkxKL1dBajNZWTdRSHV6MFRQQy9DTHorZUcvZi9jZ3Fp?=
 =?utf-8?B?ekgvc2Z6N00zUlNJOXZrQVFNWEtUTkhZTTc1ZlpVeXp0SktKTGVMVzIyMWt4?=
 =?utf-8?B?dzdoMDBLYVUrRVdQOEFWWU5pRFNieTN2anlicEU4TFVVVjR0eW9Yc1JneW5i?=
 =?utf-8?B?QXp1OStjY3VaWmNXWjRLWUFVcE55TVY0VE1JMG12OU5RemRHbFYxR0k1cFp5?=
 =?utf-8?B?Qlc1Q0x3NXd5eEN2Mm9pTWFXMU5wejh1OVBOZG1rSmJkZEZ0TVJWY0k0aDU5?=
 =?utf-8?B?eThnbVV1Z1JhaHJ3TzZmN3lEWUtjbzdwZ1UyWW8xQkhKaTZHZjlpaHpMYTAz?=
 =?utf-8?B?TDJscmg4MGk2cFZOd0orMUhFdUxHanhRWVNXM3dicTgrMVdEUVBLME9xS3Bw?=
 =?utf-8?B?UWNXRUp5RW1xK0x3cTZqdndHWkdPRnlzNElDUUZkOWxiTGMyQ3pOb0VMR2tl?=
 =?utf-8?B?RHpldzRBZFIzZ1BZZFBUNHdZMjc4STJTV1JpT1ZMUWpKc3k1T1VXbmZRVUtU?=
 =?utf-8?B?cFpJY2l5aVpwTzRPem1aZ0RrcUhCTDFxTWNDQzNNM3c2L0wrM2lmaXliZFJ1?=
 =?utf-8?B?TGZDRUZtYVEwVGQ2WWVwdUd4UmZrb21BVFc2d2pZWlpXNWQvOVhGenpDWm1Q?=
 =?utf-8?B?TG9tWHJaMHRYT3ZrRFVTWFhvZXB3djBBME1GU3lQTWxPNngwaW5hZWF2QWxH?=
 =?utf-8?B?TkJyTWUyby9GWmRjK0xTWWFETXVUMFpUVjVqVzNNYUdTY0FIK2pMajVTNGZ0?=
 =?utf-8?B?VmN5OG90Kzc2M0xuWkcvQ0w4R0NPaFJRUzQ2aWlVaTFyUlUxbXZKUlJ2WmlR?=
 =?utf-8?B?RSt2SUEwZEczZW1kdEVWWUlRQ2ZsajR4TmYxYnd0TTR0a05ZQVFMK1M3NUwr?=
 =?utf-8?B?QzN3NnZ2Z25OWUFFbDNtQUhLUTZ0eVBRMzhsaHZFb1JJWWhjVDNkU3N5T21V?=
 =?utf-8?B?djVmUi9WZTF3c1hzenpSdExnck9MYmp2Q2Y2TytjNVhDS3lzeFpHUyt5MlBE?=
 =?utf-8?B?ejd6c0lmL3JNc1dTMFdESFFidklEYSsvUUc4ejZlbWI1ajd0ajJGUk1HMXFI?=
 =?utf-8?B?bHBRN2FjclBkMDZIelcrVmxYREMyL2FFekNPZU9QUisrQmJ3b2ZMVjE1OGVr?=
 =?utf-8?B?R1pVVTRySTBWaUtMRnA3dWYvNnJpWFhjUDZWSzFtRmRWYkpKL2FmRUt2ODJX?=
 =?utf-8?B?Y1IxL280K1QzOWJBSFRzOXdnTzMrRkp6dDRDVkZPUDBlTXVKNTB4VWJiNmw2?=
 =?utf-8?B?ZGt6UUtxbHpJNnpnZGZWS0o4OWwxSlBDZjBHT1hZQWJKSzJLUWdvc0pMaldo?=
 =?utf-8?B?Ukk2NjZXSzYzM0pJTHVTNkREK2tGbEEwS0FPUllLZTRkYzFrUkJrODhMNnk3?=
 =?utf-8?B?bWcyc2ZoU1hmb3hHb3kzYktzS1NXTHgzMXBOQ21FTmdDRmV3VHVuVjVtOFRn?=
 =?utf-8?B?OHg1Wno2aXJ2cVUzR1RXYkZIVFZyejFrZnJpam05QW1NSkc2SXlPR3kwWExL?=
 =?utf-8?B?V2VFMzY5QzAveVRmY2E1VTBQQnZHL3FaZ0IweWQyU3ljQU5USkh0UVQ2SXll?=
 =?utf-8?B?RUJzOEh3RUdMb3pieHk4TXk4Z21wWEdneEROSi9DTkZ1ek9NL1hrbFJ3NkJI?=
 =?utf-8?Q?pU8uQSgnxS9Jf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXpjcnpkbEFoV2gxTC9jYlRqMmF1Ri9iUkNXVlpaVXk5OXV1Q0IwSmsrbG5t?=
 =?utf-8?B?RHM0RnJhNDAweWZEMk1ITDNia29uanNKTXZjb2xjOGYyQUJOalBnMFNIeDRt?=
 =?utf-8?B?MXZZbkpRdDBxRlRLSW1lNlhLMndpSkJYaVh6dk1TRkRST3lwcTQ0QVYzaGl0?=
 =?utf-8?B?VmRsdHBFN1FkNk1rR1ZlT2Q1akJXekZBRmxmSVdZNWFsYmRaVlRHT292cUVp?=
 =?utf-8?B?NGVXSHZjMlkzcHhJVWVHOUhQNGFscUpSSGJJQzJ6N3c1T3hoN3lyNkYrZVAr?=
 =?utf-8?B?dFlsTWhaYUlTdVN4eVl2S1pKMFhLS0ZVUVdmWjVyQ20zaHE2Z2thSElFSHRo?=
 =?utf-8?B?cm1rN2xPS2FVQ2hMd0gzZ0d6T0NsNUczNWNpQUtIUytMQnFab3JBZm8xWWoy?=
 =?utf-8?B?eXZkUFQ5VXBGaDNFTTRNak9Ka3FVMkhQOVMxdHRXWXM2TTFobG9QTnk5aFF2?=
 =?utf-8?B?bjFRcU9kMEpxVTVxRm4wbDMwK1Z6KzRmbklsQlFiK2NUQzN1L1o3azRiMStG?=
 =?utf-8?B?cVp6OXdNOXEveG9qdUkwNTZhVi9TU0FNN2dxVy9DbTJqOXFoaGZRNjR3VCtQ?=
 =?utf-8?B?TEZXUExXZHpaOHBOdFN4ZFJMMFRRY1NtSGZweWd2RnpTd3F0OWR3UUtmNFVo?=
 =?utf-8?B?T2szSDNZN1hmL3puNmwvRHFmaTZhYk9tSVhCek9uNjJnWnRZbDRMS1VTQklY?=
 =?utf-8?B?eXF3K1d6QnR0ZmhPbENSTUFBWm9vV01VTk52NkNEazh4RjlJdFA5WHNwUUx6?=
 =?utf-8?B?eFp4Q0F6TFZyQjEyMTRaRmU4VlV5cjRDVXV6clVUTnZEaE5sUVo0eDZZczBV?=
 =?utf-8?B?Q2JMdnVPbUxEM3Z4Y1dRVmdXKzUyc09XY0FZS0F6cStVekRaZWUvQ2lURGt4?=
 =?utf-8?B?RVlNbHRHb2lXaXk1MEFmNzkvamtiNTdKdzJ4V1llYWc0Y2xBd093OXR6VXor?=
 =?utf-8?B?TFdoczRadTJhTE91c2FtNFJJZ2o2dnFnd2ZQc1JaVE5mOTJtTkFIWmRJT3NM?=
 =?utf-8?B?RjNGeG05c0lqQWdITk9TWWlrM2Y3NXlrcExFZjIvMTg1dkJrWGVldEZnaUdZ?=
 =?utf-8?B?d01vRWViZCswRUpHNXp3S2UzaFdvOE15anVubkU0YmR5V0g0SCthVmswRmlJ?=
 =?utf-8?B?dG41VEcvTERlNjE2MEVRTUJhTUJleVpPcVpEekVZYnVoVnNmdHhZU25CNUtj?=
 =?utf-8?B?eDBaemVwZE9hNm1KQnBJdmpTMWdhVjhWS0c0WUM1TXF2ZGE2QWRURngrVTJH?=
 =?utf-8?B?Lzd4ZFBpS2Q1OTF6UER5S0M4VjRzVHFIL1BmemZZb1NUcmhjcTNlOXFiVEY1?=
 =?utf-8?B?SGRDdFptNXBtVGpkYmlJOHFTY3kyTDlMSS9HRnlFNFFXd0QzbzVOejlDaEFu?=
 =?utf-8?B?MjJBT252aHRpTE1mSWdvTS9wZlFRcWNHcFFQb3pPSUJaVkFiWXNuajV5NEx2?=
 =?utf-8?B?a2FlaXpYeGlNVFFmNTNFYlJhMWMrUFdDVXd1MElZZS9UK082ZGNuSHJ0OXoy?=
 =?utf-8?B?YWJIY1kzelo5aUFwdlpCSE5NaTYyOVB6eDlsUzZITmlpdkRVV1Ewam5kNUhD?=
 =?utf-8?B?OWdCbnlsMmpzK3BLY3pqQ3VKYVVFU0lnb28raU5Hd3RZcFhHdVJxY0s4LzBk?=
 =?utf-8?B?enl4THRWTFE1OGtEYndHTEZlWnVidFBwWG42WW9KSk1hc2tXVGVOTjhvNlRP?=
 =?utf-8?B?MnRVNGRQZnk0VXRyRDV5N2tJZkdPTE9GK000U2FyNXRYaFVyaU1hQ1ZORkIr?=
 =?utf-8?B?QnZ5SE1teUdwMVZoN2NRdnh4OGUxcGszU1ZRQ242ZU5UVkhITURpR0FIbUFa?=
 =?utf-8?B?S1pqTEpHTVRDOVFUd1JwMDFQdW5aYUNuY2ZEd2RzeGdBQmZEeUYwTXJxbWV3?=
 =?utf-8?B?UTNhL081djdtU3V5MmQ2RExSSGZrUE53WHFtSDVXUDNqdWprS0FFRjJxNkhR?=
 =?utf-8?B?T2FXaTN6ZVd1dnREaWFEbjNaM0FRWXZRY1hEeTBCMWl2c0VEZmxVWStCeWZn?=
 =?utf-8?B?SWZWQ3RMNktMcXN4TjQ0c2M2SmE3NHBtQ3lBN2tTeW5yeXE4cWpYVUsyb0dR?=
 =?utf-8?B?d3RhWmRtUlduRmx0cmp4SWQ3cEdUaUw4M0NIVHl6c2dnbTJHcG80azdRK3RP?=
 =?utf-8?B?WXRjNjVKbkp4eWg4b3dOc3djTUxVbkRNeCtVSzc2NEppL1pxTi9nT2R2VWFR?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fE6P6jceOdxYtJZcX8cS6XwBVZQbCgKCqT7SbDYREHMPz9udkxx2O3u3TF3uvz8rHax5yd8s9zfxzkSBSY6iwc2AdrmSkwCtawvV+NDZmE5G37wagTgugUovE0L8Gg5gIl4hlQaDOqHVfYHL+3VINyUqHaSnBxWkHKZRfQOTvKGz43TFteSZf81ay6uOBNrMusu5yvFFxnIoke1Wa0HeEYdZpKKYzbqMhtroMxoNj0mJcAjfPEdTTyqb8IcAxmuK5MYL02Qyivzx0dH0oJ+UAr1A0Zf8Hm4GncsSwewSRdgm3kjJYqkPWYBML+MgvZJPZ+G5byym3ytDwBuww+SgLG04W3y7hQYuKC90xL9/e24Mx9lzeplT/5A2HJJUqaLL47jcLv+RH1ziAEF1U/zUj7bsL5djSU3PKLz3rFiFyABnGwj3Nv5pdpMsrIvXX8MWhu/4fIcZFPuElR4/f4vP3Taw9dFI6Tg9qsEAILCrIGrVU0Y19kRv1ZRiv4f6ogo6d5aIBO1fG2wx5cRGjHtcxHivp8Whbv8vetRSAuuOQM5uD8PCdAnG1yUaA2MgkpHPXFXti4PcsbUmkDm8vV4Gvl2F0yIrOTQbC7wKLJLLWjM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e53f36-e530-4aa5-a287-08dd348feae5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:38:08.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7yPeqPD0Tr0eupRuKIIH6BXJ6ui+7aSTyyS1baqbmi+v7t9cR3CqxMyro5aJmk8pa1Dwbaf2wB4hUcfKOWGV/xksxik1mbhIAMEboICGic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4493
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501140097
X-Proofpoint-GUID: L7ISjqbcS95Y-lYMQWgU4hNR4mUthiIY
X-Proofpoint-ORIG-GUID: L7ISjqbcS95Y-lYMQWgU4hNR4mUthiIY

On Mon, Jan 13, 2025 at 11:09:25AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 8:48 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Mon, Jan 13, 2025 at 08:31:45AM -0800, Suren Baghdasaryan wrote:
> > > On Mon, Jan 13, 2025 at 3:58 AM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > >
> > > > On Fri, Jan 10, 2025 at 08:25:51PM -0800, Suren Baghdasaryan wrote:
> > > > > vma_iter_store() functions can be used both when adding a new vma and
> > > > > when updating an existing one. However for existing ones we do not need
> > > > > to mark them attached as they are already marked that way. Introduce
> > > > > vma_iter_store_attached() to be used with already attached vmas.
> > > >
> > > > OK I guess the intent of this is to reinstate the previously existing
> > > > asserts, only explicitly checking those places where we attach.
> > >
> > > No, the motivation is to prevern re-attaching an already attached vma
> > > or re-detaching an already detached vma for state consistency. I guess
> > > I should amend the description to make that clear.
> >
> > Sorry for noise, missed this reply.
> >
> > What I mean by this is, in a past iteration of this series I reviewed code
> > where you did this but did _not_ differentiate between cases of new VMAs
> > vs. existing, which caused an assert in your series which I reported.
> >
> > So I"m saying - now you _are_ differentiating between the two cases.
> >
> > It's certainly worth belabouring the point of exactly what it is you are
> > trying to catch here, however! :) So yes please do add a little more to
> > commit msg that'd be great, thanks!
>
> Sure. How about:
>
> With vma->detached being a separate flag, double-marking a vmas as
> attached or detached is not an issue because the flag will simply be
> overwritten with the same value. However once we fold this flag into
> the refcount later in this series, re-attaching or re-detaching a vma
> becomes an issue since these operations will be
> incrementing/decrementing a refcount. Fix the places where we
> currently re-attaching a vma during vma update and add assertions in
> vma_mark_attached()/vma_mark_detached() to catch invalid usage.

That's awesome, thanks!

>
> >
> > >
> > > >
> > > > I'm a little concerned that by doing this, somebody might simply invoke
> > > > this function without realising the implications.
> > >
> > > Well, in that case somebody should get an assertion. If
> > > vma_iter_store() is called against already attached vma, we get this
> > > assertion:
> > >
> > > vma_iter_store()
> > >   vma_mark_attached()
> > >     vma_assert_detached()
> > >
> > > If vma_iter_store_attached() is called against a detached vma, we get this one:
> > >
> > > vma_iter_store_attached()
> > >   vma_assert_attached()
> > >
> > > Does that address your concern?
> > >
> > > >
> > > > Can we have something functional like
> > > >
> > > > vma_iter_store_new() and vma_iter_store_overwrite()
> > >
> > > Ok. A bit more churn but should not be too bad.
> > >
> > > >
> > > > ?
> > > >
> > > > I don't like us just leaving vma_iter_store() quietly making an assumption
> > > > that a caller doesn't necessarily realise.
> > > >
> > > > Also it's more greppable this way.
> > > >
> > > > I had a look through callers and it does seem you've snagged them all
> > > > correctly.
> > > >
> > > > >
> > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > > > > ---
> > > > >  include/linux/mm.h | 12 ++++++++++++
> > > > >  mm/vma.c           |  8 ++++----
> > > > >  mm/vma.h           | 11 +++++++++--
> > > > >  3 files changed, 25 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > > > index 2b322871da87..2f805f1a0176 100644
> > > > > --- a/include/linux/mm.h
> > > > > +++ b/include/linux/mm.h
> > > > > @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
> > > > >               vma_assert_write_locked(vma);
> > > > >  }
> > > > >
> > > > > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> > > > > +{
> > > > > +     VM_BUG_ON_VMA(vma->detached, vma);
> > > > > +}
> > > > > +
> > > > > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> > > > > +{
> > > > > +     VM_BUG_ON_VMA(!vma->detached, vma);
> > > > > +}
> > > > > +
> > > > >  static inline void vma_mark_attached(struct vm_area_struct *vma)
> > > > >  {
> > > > >       vma->detached = false;
> > > > > @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
> > > > >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> > > > >  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > > > >               { mmap_assert_write_locked(vma->vm_mm); }
> > > > > +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> > > > > +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> > > > >  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> > > > >  static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> > > > >
> > > > > diff --git a/mm/vma.c b/mm/vma.c
> > > > > index d603494e69d7..b9cf552e120c 100644
> > > > > --- a/mm/vma.c
> > > > > +++ b/mm/vma.c
> > > > > @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *vmg,
> > > > >       vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
> > > > >
> > > > >       if (expanded)
> > > > > -             vma_iter_store(vmg->vmi, vmg->vma);
> > > > > +             vma_iter_store_attached(vmg->vmi, vmg->vma);
> > > > >
> > > > >       if (adj_start) {
> > > > >               adjust->vm_start += adj_start;
> > > > >               adjust->vm_pgoff += PHYS_PFN(adj_start);
> > > > >               if (adj_start < 0) {
> > > > >                       WARN_ON(expanded);
> > > > > -                     vma_iter_store(vmg->vmi, adjust);
> > > > > +                     vma_iter_store_attached(vmg->vmi, adjust);
> > > > >               }
> > > > >       }
> > > >
> > > > I kind of feel this whole function (that yes, I added :>) though derived
> > > > from existing logic) needs rework, as it's necessarily rather confusing.
> > > >
> > > > But hey, that's on me :)
> > > >
> > > > But this does look right... OK see this as a note-to-self...
> > > >
> > > > >
> > > > > @@ -2845,7 +2845,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
> > > > >                               anon_vma_interval_tree_pre_update_vma(vma);
> > > > >                               vma->vm_end = address;
> > > > >                               /* Overwrite old entry in mtree. */
> > > > > -                             vma_iter_store(&vmi, vma);
> > > > > +                             vma_iter_store_attached(&vmi, vma);
> > > > >                               anon_vma_interval_tree_post_update_vma(vma);
> > > > >
> > > > >                               perf_event_mmap(vma);
> > > > > @@ -2925,7 +2925,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
> > > > >                               vma->vm_start = address;
> > > > >                               vma->vm_pgoff -= grow;
> > > > >                               /* Overwrite old entry in mtree. */
> > > > > -                             vma_iter_store(&vmi, vma);
> > > > > +                             vma_iter_store_attached(&vmi, vma);
> > > > >                               anon_vma_interval_tree_post_update_vma(vma);
> > > > >
> > > > >                               perf_event_mmap(vma);
> > > > > diff --git a/mm/vma.h b/mm/vma.h
> > > > > index 2a2668de8d2c..63dd38d5230c 100644
> > > > > --- a/mm/vma.h
> > > > > +++ b/mm/vma.h
> > > > > @@ -365,9 +365,10 @@ static inline struct vm_area_struct *vma_iter_load(struct vma_iterator *vmi)
> > > > >  }
> > > > >
> > > > >  /* Store a VMA with preallocated memory */
> > > > > -static inline void vma_iter_store(struct vma_iterator *vmi,
> > > > > -                               struct vm_area_struct *vma)
> > > > > +static inline void vma_iter_store_attached(struct vma_iterator *vmi,
> > > > > +                                        struct vm_area_struct *vma)
> > > > >  {
> > > > > +     vma_assert_attached(vma);
> > > > >
> > > > >  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
> > > > >       if (MAS_WARN_ON(&vmi->mas, vmi->mas.status != ma_start &&
> > > > > @@ -390,7 +391,13 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
> > > > >
> > > > >       __mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
> > > > >       mas_store_prealloc(&vmi->mas, vma);
> > > > > +}
> > > > > +
> > > > > +static inline void vma_iter_store(struct vma_iterator *vmi,
> > > > > +                               struct vm_area_struct *vma)
> > > > > +{
> > > > >       vma_mark_attached(vma);
> > > > > +     vma_iter_store_attached(vmi, vma);
> > > > >  }
> > > > >
> > > >
> > > > See comment at top, and we need some comments here to explain why we're
> > > > going to pains to do this.
> > >
> > > Ack. I'll amend the patch description to make that clear.
> > >
> > > >
> > > > What about mm/nommu.c? I guess these cases are always new VMAs.
> > >
> > > CONFIG_PER_VMA_LOCK depends on !CONFIG_NOMMU, so for nommu case all
> > > these attach/detach functions become NOPs.
> > >
> > > >
> > > > We probably definitely need to check this series in a nommu setup, have you
> > > > done this? As I can see this breaking things. Then again I suppose you'd
> > > > have expected bots to moan by now...
> > > >
> > > > >  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> > > > > --
> > > > > 2.47.1.613.gc27f4b7a9f-goog
> > > > >
