Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCCB213E62;
	Fri, 10 Jan 2025 19:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736538737; cv=fail; b=trA+a+Mv6z83mHY6zKgBBn4WCHgAkI73C905tUT6fO77gu1GA6BlhptAT/cv1Ejk7ruPXQRU9R5hrMNk1H6r6gkg43Pv8O32HaMbR1/+dcnjAdFZ2yRIv2GZlpH3KO6PpXk/s+sTmPAKHjoiluVegJZ666cWwjtIuN6t+zpoZ2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736538737; c=relaxed/simple;
	bh=dEphzP7H6G1GPv0XquqiAld1hDARKwKOgo2UkAQ4RFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TiMGYGw/UkEaaJFXRn8O2Z07e5lHmJTT6mNvhJ+fn52hW+GLJy6raDqJ6GFOej7kybovOPMRHC944PyOKj0fGO0dceN2++BOj+/skyDGk7UisbMRy4PaKmcgk1a4quByxuxhKFWRg//xDEfgQDK5pICXRxu7LV9tKs1dCTJPKXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iMWW85+n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PDOi+ZOu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iMWW85+n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PDOi+ZOu"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AIuI6e026367;
	Fri, 10 Jan 2025 19:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=cNmWq72a2bkmkM/B8XPCFA6jxHYkHU/XNBIZQsPac44=; b=
	iMWW85+nPfZEjatBK0+3EgbBRLjIlmjn59C/A2YEvGQI8WvtDTN58ScaW8INUduF
	J4rOXgjsWJOLTKHJD4YLiYS3J4fI6EAhWrVIt7gWhNHZvE8zYq2jZehX70VMglj1
	XHopXvEcCBX58i6o9KZPVVse/3YVck1skKQkD6U211q32uJSGk3DYcciK06s8sgA
	VTICQtv9/iNIlHeysFfOQ50JKirD+3yDd5IUVODbsIMsXE79ne3A9PTAI7ZdcvyR
	YARvaX5cD9e9DdF1CeqLBk2wsmz7Anuikb4BTZCPBT87xDgzi1sgqTvBxKr10p1x
	1QN2l4kz4yAXxM4FDCjQ8g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442my621vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 19:51:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AIP5UE008534;
	Fri, 10 Jan 2025 19:51:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuecq23v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 19:51:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjH0ObU7sAEEF1Xj01kB2Tcx8TmX0ClHE+e/ehrl+ZbnKGkyggJ99AK+Phtv5IzdWFr3zJJgLC3J4JhDF4a/vaNLdUIde54VQ2kqtbCnCeMYiBPMdSWso8ivunNFPyAUWPUd5dw0CVtevcO1NuEZ4rSvDC1Ek35kkS1z2OCqadnjh+Hv+IICO0xvi7udQNCqRFF1vK3kTOi7d/N9CPvHZyJdhdC7vlALHFylRER7WpSVtF5JqDnMfbA+2Elg9zu5Vzw02lsIgThbS+hPpSNSZi5pzgGJ0pafRoiq5seHL0Y8TErDM8WrYOJ/tlgvWM78fHu1N7mAozBrsT3rE8EZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNmWq72a2bkmkM/B8XPCFA6jxHYkHU/XNBIZQsPac44=;
 b=TyJTUBu3nGspS9TUpxhCWx04pLt3kOZABvobo2M3EKcxBXbkw0uU46aXhT3IaC+onS1/Flk34CsE4KWKq1WreWb9hvHqAdYp4TlxPnNHaslfNpcQE+rmbk7Eyu2yZfd2kG25rpx4odhUXNgwVNMsPigqeaK7WFsMvxvYHXsECG5ZsNAMXoCqRJnfg2FIumu1pja8IZqij4yXCsc3PfDwloilBYjiUv5cQlt/6/CrWb4yxUnl0fZWSLxBFHYwp2JY4HSpeZvRocmk/djrGP+AhcrOkACsY9f8CjBaCQPCoccnWZ9/szwF7l3y5fKlVr1GjH9PNIRXuhVqLVNJV17sUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNmWq72a2bkmkM/B8XPCFA6jxHYkHU/XNBIZQsPac44=;
 b=PDOi+ZOudM/i5nDphybrFmInA9s//zpjZN7S6Ge4dch9IOVk3slnMVIsRix7zV6RI2mzOVS95ayzWwLLI7YiTrHkh0B7CwgwhUnPcVy2z3L0bTHT1iE/by/k+HxHNSMJl2uPn4SbDIpufoFqq4gQmT9tuYQh9xlWpI7aE4HlnaI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA1PR10MB7334.namprd10.prod.outlook.com (2603:10b6:208:3fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 19:51:20 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 19:51:19 +0000
Date: Fri, 10 Jan 2025 14:51:14 -0500
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
Message-ID: <6vdkyipj4v7kmgra7huvebbkimz2t63tx6rkbjxbavaccmlbmb@udqijfgkbgfv>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0039.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::24) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA1PR10MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: dc200845-9a7d-4e39-7ba6-08dd31b02721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3FkV21BMVBDaXVIcTZDMFY3bWJOaDVLMjhXS2J4UFVkL0tQMnh3RkswNkRn?=
 =?utf-8?B?cThNRFU4aDlxM1JJTVhCK1A4c2R0WElvaVcyRFlVajNqRUlZaWhZMmtRZVpT?=
 =?utf-8?B?STZWUnhZc2ZvNVB0aW9xYnJJdXA5VnVrK2szdkUxZFkrQWVOR25mdWdURHV4?=
 =?utf-8?B?SVJEY0lyMVZsNGV4SWhTbi9jUW1OUmVMQmkwUHhtS01aUzlKQmQ5SnRzYmt5?=
 =?utf-8?B?RWM1SGg3NzJPUEFIbnUza2szS1FybDBVOWZKNU9yZHVCc0tTSHMweXlyWmNX?=
 =?utf-8?B?K0xqWGhvbndFN200MGdubE5GZ096aGpHS0V5YjA3UjNsdENFakJvcmVRdEtS?=
 =?utf-8?B?bjQveGVrN252K2pxTG1zaUc1NXpSZ2FGUUEvMzlGRmFXdnhzcHNuUmFVay9y?=
 =?utf-8?B?cWZCMEpKYkdPbDlNZGhKMTdGZ0d6N1RUekRJYXh1VnY3VzYrRjVwaGQxRGFy?=
 =?utf-8?B?TTVYamtzOWZVQXEra1RNemc3VTZPUFJ6aklKWjVoUkMvMDJIb2dqRWVOd0RY?=
 =?utf-8?B?Z3piNXNvR0VaNkMzVzhFUHpMNGFlRW84b2piRE9FT0tyZXQ3VEJLVzhZTG1U?=
 =?utf-8?B?NlZhQ2hBaXI3aEFnc1IveEhwWmtnY3c2UkMvcDdnYjRTQlBKV0xMUkFleStB?=
 =?utf-8?B?dUFUdnBNeEtYdE5ZdGphS05BSlFBM29UeGdja09Mc1VaL0ErVWdGVkgwVEM1?=
 =?utf-8?B?M1RNZG9WdG1iTTlrTGZLK3VxdnM1N1B2TXdNSDYwNVg3ZUxuUS95b2xWWjNl?=
 =?utf-8?B?N2RwSzFtVDBwc05SVXdrUE1KanJPUmU2QWRJL2d0OHkxQjBxTG1kN2NhM0xJ?=
 =?utf-8?B?OXFWYldYWU1jd3RwNUJJYkEzRzN0bEpYN3JMUnV1a2NQZldlZFJrU0VscHZq?=
 =?utf-8?B?SmZxU2FudFNtclZkK3M0em9zOC9DUk8ybzhpcGs2Q29aMVgyblo4VlJWWmtT?=
 =?utf-8?B?VUJnc1VmZVdXNzNpZHR1d0lRaTdyVHBiaStuZS9PalFCN0lYRGQyczUvVkVq?=
 =?utf-8?B?akpFQUVKOS9MVks2c1BwamYvQXV5T1A3OEMvdldSSzNWaWtkR21kcGFrak1C?=
 =?utf-8?B?WHo4UVd6bnhqQjhOZkRpNllPanN4a2JtRW5CeVd2UCtqam1DRURPRXplczVT?=
 =?utf-8?B?dGlFM2VjU01rRElkcDNqZkxRc1Q3M3BuKzlESk5FRWkycjVNR1E5NVNGSVUx?=
 =?utf-8?B?eFFZMi9zM1pYa0JJemFYK2ZZeHY1Z05vMkdJcXFobDNhU292Y3ArbzZ5RU1x?=
 =?utf-8?B?ckN1ZEk3Um1ad25Qakl3OWtZMlpYanQ5dGcwUGRGQmJKa0lBVEJ6RlkvSWZ5?=
 =?utf-8?B?NTFGMEZYWHJDVzBKTDhPVUgzTmtXWVlXMFJXeW5vcjhNU0R0cm8yNlVaUFZM?=
 =?utf-8?B?Y05IVlIyKzRJQ0sxbitMNXNXTTZGVmJla21FMWM5UnVJK1E5NDNSclNPdkFZ?=
 =?utf-8?B?WTVpbFFMVWFpQkNTZHcwMWJQampJbE9xRWE5N1Z0ZHlrNk5lVlNjd2ZjVmp3?=
 =?utf-8?B?OFZrSVBXOEwxYnQ4UU90UTJmRjMxZDNTOFRPRWhEanJNVzRudWhscTh6Wk40?=
 =?utf-8?B?WlFLL2FudEVZR3RvajhaM3V6c1RSemV3Q3MxNmwwTWd5TmhuVHN0NjI3WXRX?=
 =?utf-8?B?ZjdudW81S0hURnlwaE5BcDhIU3J4MjVKZklPTGZxMzZSSUVWdUJEcjNYRXB4?=
 =?utf-8?B?QlpDKzJsMlhkbkxTQ1BoYTRQcUNYNkJnNUJtNXF1QUpmUldjakh0Q1JFbWkz?=
 =?utf-8?B?bkJOWVZ5SlBOWU5IQy94SGE0TDZPdFF4WGE5OGtzaU9xcVNCRnBUeE05VjZG?=
 =?utf-8?B?L0djV3QzbE02WEpiNE1OdWE0UEpsRHhSUURlTEpYT1JYc2wrU1FBVk0wVVJL?=
 =?utf-8?Q?xFZK23zKsMPwx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnRONFFPd253MzR4SngxL3JwbFBOK0syb0RYV1NxbFJBOGNIbEUwNTBjUEFp?=
 =?utf-8?B?dHZUd3plL01vVUpYSmt3dld0RkI2NEVkM0tMR1pseld3WlpjSmhlZ0hyaEd1?=
 =?utf-8?B?ZFN3KzVzUDdyUlBBdUJFazRGdk85d1g4aVg5eVdQc3JxOWNGbjdTTUEzUGl3?=
 =?utf-8?B?LzVudU5wYkltdC9BNG9iYVBFVms0T1lzU3NjRDdSV0ZiVi8zS1N4MDVhMHJY?=
 =?utf-8?B?VWZ0djdLejUzR3FIeVJ3dmxvMllSeXc5RGZPbmpyTEFmTFlBL0p1ZXhBWVFN?=
 =?utf-8?B?L3ViRzhYUEdaZ3F6b1dKQnpJSHRpL0R5MXV1SEJ6Wk1zR1lwNHRtUWtDM2Vp?=
 =?utf-8?B?MkMwVHQ0OURiZ3JwdEQwM0Qxa0piOHZaSjdWZ0wyV1NVYzhHaCttVURKamNx?=
 =?utf-8?B?UE9aWk56SjA2dXcyT3crRk8vS1ZGcVF1ZkdjV3A0REpvUjdBeVVuZThNRzYw?=
 =?utf-8?B?RDF0TUN5UnVBRlZLZXBTM0ttWU1FZzcxbGIvRE9xalFhN0NtR3ZtVmRqZmtw?=
 =?utf-8?B?S0dPUjlvMU1JM2ZnSjUyZWg5WmswN3JscGh3Q1MwN0xWU3hpVmxySDd5UTNw?=
 =?utf-8?B?WDY5U2FONC85WmxJTmpFcSswSTNiTldOTHNYeUFpV0lyY2ozT25sdGF0RmFa?=
 =?utf-8?B?d3N5N0ZXV2trR0NwZ3kvdVQremFkcDd3MDViUVJpRlJ6UVBwTnJ0SEZmbkNn?=
 =?utf-8?B?bXlFbk1LUDA1Ui83OEZKeVd2d1RYbTk4ZXBvZ0ZNNDI0RW5wcndQOVJZQnU2?=
 =?utf-8?B?L1d3Mlh1R0tLLzRSdEU4Si9zeEtCQUdWUkEzRWtlNVVaVEdKaERsYkFwRnEv?=
 =?utf-8?B?aHUwZVNDNTVyY29yNkIvZnlCOHFWdlRWK3NHSFJUd04rWms4YVVpTWZabE1w?=
 =?utf-8?B?anJaRkgxRkluTlk2WFROcnZ4ZmpQQVdhSmhveHlNVFAxemNUYzY1QXNSbGhr?=
 =?utf-8?B?M05WcFVOQVFhdWcvNDV4VmZpbEhvRjBlWGpHbENtNFpjcVVMTzNqSlhwcUNi?=
 =?utf-8?B?cFpqQ1pLR1pCSHFtUEtwbk1rN1BZcHBlYzlYcUxYWnl5SFkwWGVMNkgySFVW?=
 =?utf-8?B?M1JrN1dvN21HV2FwNEFHYkJTeWxCOHRiZGZzelRrMW5BaHlPczlKRWs3M0F2?=
 =?utf-8?B?NXZPcVR5dUt4SkRGWGFVOFFoMjlHb29RSytlTWtnUW10MWtyR251L2Z4dFhq?=
 =?utf-8?B?Yk5SY1VzNGpZQmYrcFgwWTBaQS9QS3VQcDYvTnpjZFJUZEQ3bGJWT1BGVTZw?=
 =?utf-8?B?ZmNlTldRVXNmM3VDTEVkMG1SbEU4ZFZXd2tZTGdOOXdWbzVqVWJmc09IWVVC?=
 =?utf-8?B?a053MXVBZGx5bkZjaE91Qi9UZDZJMHo4ekdLYVgzQktUaFljTnUxWWtTNWJB?=
 =?utf-8?B?R29ObE40Ni83UUtDbmRTaGtNMlNDVUVoSHFRKzd3MzhsR3hIMTdhTEJGcVR0?=
 =?utf-8?B?S1NVYiszM3RSZ0gvVHEwbUpkU2Nad1dFOVE3VFJSTkN6VU1DSmhpOHZ0eUV4?=
 =?utf-8?B?ZXY3K0ZaK1lLT2pXUGExSk13UFFXR0IrRmZwd0doYjliV200TVpCQTdHTXg3?=
 =?utf-8?B?SWt5YlpqMHM0N1NWeGgzdmlhRjFlRWg1RndyMHpEdmZsMWVvNWdRaUJCcW0w?=
 =?utf-8?B?bFRoMkRTZ0lpL1RJMERXN3dvUXNLTEJsQ1hIV0kwZUFZZ1lpdEo2T0VtcFJF?=
 =?utf-8?B?Vk5FRmIrTDVOR0hQWkhDR0RFNmk1WXZrUHhGd0t2c2kvTzR0dmZia2dDNWNR?=
 =?utf-8?B?NVluRFlXRU0veFVlSWRTN0NxcWQwQnB4NlZ3eEpKWTgyWEtLdGJRWXJzbHdl?=
 =?utf-8?B?RktEV1ZNMmVSWFhTT3lQd2R2eW5NajFsMituTk1MeEVES0s5RmJzM2pUUEtr?=
 =?utf-8?B?cnpZOENQdEhueTliZ2UyMEFrdkNGRit4OUcvYmtKcjJnK1FpdnkwTVlpc2pZ?=
 =?utf-8?B?YVRvZlRNMkc5bUszQ1oxcWthSFBZSStqcWFiVlZjMUs1R3phSUtrZmJFRmdt?=
 =?utf-8?B?MDJ3UENMb0YyQjFkcExzU2FzVi9aeXJ6OGJxSno5eHJjTExwbnJQWkpLWDVl?=
 =?utf-8?B?UU5qZy9Wdm5WRS9aOU8zc1FXQlpjditzdlU1VzY1NEo2dHkzUTBPRGIrZ3FN?=
 =?utf-8?Q?v7GuGaa2tlD4vUBikUBWzcAO0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7p6E7ZeV5afc+w99e8Jd+PmMLotSX8LpW3mF3wWo2+kZT9+TUAxGpojPWoj1H3DVGZ6C1VdgwNRo2iNO3rhPQD6XPeA2AP7Er5xpuuZqTd+GkwngT9AgJSgnhJG3G6ggf+1X+6Qa6xkyaR5sgENJwyU5c+JdhmfgvWe4NuahJ3onP5Hrb+XcphRtt2JKFYFsqmWIMTCIF25MRV6TXb2OABNZ2dpUHLhRcrdHj5mddaDj6/fhV/qv0TBY23wGWB+wWoU7nxMz3zcI/vWMIcBw1Vv+grqQv4fp4eB5GcaQfrhSrPfDVpg48Gy4Kg72j0DO/CjLdGZlv+8elWxEn+cJ9uSNisqNAJ3ZMvf7YU/jENAewTMLQE/d5lerf3EbaJ4qzatoL1P2HoZZJffOd2bVHEebo0g1tLr1OmOGQXT6sVewAJ95dCg49+wn0GURCMfeOPXZJOUiD6hcerhpEwcHfznEB57bRM8x0jcOJ/0czvVSCuxa6SrO3xes/Njg1KwlRzOVKBceZBMRwaO6BZ4w8QsaYU79lMG5SUkUjbfd0nnse1nf/5oAX2A7BTXgI9RmXVKjklJwSd5gc0nuU3tLzBFW15ZFovYxzhhK0ALDJvs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc200845-9a7d-4e39-7ba6-08dd31b02721
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 19:51:19.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: godzQopi+6n5lnQG6AuOtHnywJR9Iby0lDXCLXcEAHUutoka4jRYD+J0yE9vxbYrraRuiByDobrHQwpQVnxDVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7334
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_09,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501100152
X-Proofpoint-GUID: -04R7VyRvo45DuMDGRw5o7IAHigww3v_
X-Proofpoint-ORIG-GUID: -04R7VyRvo45DuMDGRw5o7IAHigww3v_

* Suren Baghdasaryan <surenb@google.com> [250110 14:08]:
> On Fri, Jan 10, 2025 at 9:48=E2=80=AFAM Liam R. Howlett <Liam.Howlett@ora=
cle.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [250108 21:31]:
> > > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > > object reuse before RCU grace period is over will be detected by
> > > lock_vma_under_rcu().
> > > Current checks are sufficient as long as vma is detached before it is
> > > freed. The only place this is not currently happening is in exit_mmap=
().
> > > Add the missing vma_mark_detached() in exit_mmap().
> > > Another issue which might trick lock_vma_under_rcu() during vma reuse
> > > is vm_area_dup(), which copies the entire content of the vma into a n=
ew
> > > one, overriding new vma's vm_refcnt and temporarily making it appear =
as
> > > attached. This might trick a racing lock_vma_under_rcu() to operate o=
n
> > > a reused vma if it found the vma before it got reused. To prevent thi=
s
> > > situation, we should ensure that vm_refcnt stays at detached state (0=
)
> > > when it is copied and advances to attached state only after it is add=
ed
> > > into the vma tree. Introduce vma_copy() which preserves new vma's
> > > vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
> > > state with no current readers when they are freed, lock_vma_under_rcu=
()
> > > will not be able to take vm_refcnt after vma got detached even if vma
> > > is reused.
> > > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilita=
te
> > > vm_area_struct reuse and will minimize the number of call_rcu() calls=
.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  include/linux/mm.h               |  2 -
> > >  include/linux/mm_types.h         | 10 +++--
> > >  include/linux/slab.h             |  6 ---
> > >  kernel/fork.c                    | 72 ++++++++++++++++++++----------=
--
> > >  mm/mmap.c                        |  3 +-
> > >  mm/vma.c                         | 11 ++---
> > >  mm/vma.h                         |  2 +-
> > >  tools/testing/vma/vma_internal.h |  7 +---
> > >  8 files changed, 59 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 1d6b1563b956..a674558e4c05 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, void=
 *end_code,
> > >  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
> > >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
> > >  void vm_area_free(struct vm_area_struct *);
> > > -/* Use only if VMA has no other users */
> > > -void __vm_area_free(struct vm_area_struct *vma);
> > >
> > >  #ifndef CONFIG_MMU
> > >  extern struct rb_root nommu_region_tree;
> > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > index 2d83d79d1899..93bfcd0c1fde 100644
> > > --- a/include/linux/mm_types.h
> > > +++ b/include/linux/mm_types.h
> > > @@ -582,6 +582,12 @@ static inline void *folio_get_private(struct fol=
io *folio)
> > >
> > >  typedef unsigned long vm_flags_t;
> > >
> > > +/*
> > > + * freeptr_t represents a SLUB freelist pointer, which might be enco=
ded
> > > + * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabl=
ed.
> > > + */
> > > +typedef struct { unsigned long v; } freeptr_t;
> > > +
> > >  /*
> > >   * A region containing a mapping of a non-memory backed file under N=
OMMU
> > >   * conditions.  These are held in a global tree and are pinned by th=
e VMAs that
> > > @@ -695,9 +701,7 @@ struct vm_area_struct {
> > >                       unsigned long vm_start;
> > >                       unsigned long vm_end;
> > >               };
> > > -#ifdef CONFIG_PER_VMA_LOCK
> > > -             struct rcu_head vm_rcu; /* Used for deferred freeing. *=
/
> > > -#endif
> > > +             freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAFE_=
BY_RCU */
> > >       };
> > >
> > >       /*
> > > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > index 10a971c2bde3..681b685b6c4e 100644
> > > --- a/include/linux/slab.h
> > > +++ b/include/linux/slab.h
> > > @@ -234,12 +234,6 @@ enum _slab_flag_bits {
> > >  #define SLAB_NO_OBJ_EXT              __SLAB_FLAG_UNUSED
> > >  #endif
> > >
> > > -/*
> > > - * freeptr_t represents a SLUB freelist pointer, which might be enco=
ded
> > > - * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabl=
ed.
> > > - */
> > > -typedef struct { unsigned long v; } freeptr_t;
> > > -
> > >  /*
> > >   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> > >   *
> > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 9d9275783cf8..770b973a099c 100644
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct mm_s=
truct *mm)
> > >       return vma;
> > >  }
> > >
> >
> > There exists a copy_vma() which copies the vma to a new area in the mm
> > in rmap.  Naming this vma_copy() is confusing :)
> >
> > It might be better to just put this code in the vm_area_dup() or call i=
t
> > __vm_area_dup(), or __vma_dup() ?
>=20
> Hmm. It's not really duplicating a vma but copying its content (no
> allocation). How about __vm_area_copy() to indicate it is copying
> vm_area_struct content?


Sorry, I missed this.  it's not copying all the content either.

vm_area_init_dup() maybe?

Considering the scope of the series, I'm not sure I want to have a
bike shed conversation.. But I also don't want copy_<foo> <foo>_copy
confusion in the future.
