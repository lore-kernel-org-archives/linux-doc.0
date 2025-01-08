Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C91FC7F1;
	Wed,  8 Jan 2025 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348159; cv=fail; b=Hnpei4Hv7OvyHOkbJ/cELXEiP9ju8YUnCm6v0fGpKYpkhsaGmdyQhgLfadU5T4KCk/LkyWLFkPfYz2TDaTkvV13txKmLh7g8C167+LsrKegHH0cQ3BC9xs2sljQ9eVBvJhwsUbw2aWVoOmEhmIFyI7A3W2T12NKBml4roOhMWdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348159; c=relaxed/simple;
	bh=OavYeMTYmy5MAVIZ/5Dmrpf+WHxfmhmGgqk28anLgz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aLoFvyGretmhkIMP2ZaP19vFTOHUsxoL+ODfUa9HYIhVB083p6Wl/EdMrt2zvs4cS/fDnFMDpe8KEYLudbEdjM4i5o1EVUQnj/LYkgQuVsdTJpHpSbn+XaKzu1WNoPYGcj3XzTjaBs1hmOS3wf28q7Fzx9nUTlID74xr67dS6mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cEb6VyUr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=alpLBRvr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cEb6VyUr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="alpLBRvr"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508ENS0C018600;
	Wed, 8 Jan 2025 14:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9NzNMKWI+IcSB1KnUH
	4/bZSWY7Cv4upXJ01cwlFwoNQ=; b=cEb6VyUrblAgvvsew88oIkGmeDAimEmy67
	lEtLBhNmKdQNW3bkhsBpH89/fVE50yYCS9L3Jtp1DffVkQvb0f1UkDQ6u6r7wzJi
	m1ETonA/CzFs4HWX5uks7P+/W+3j4eOsA+BQ3nOqwj3GdTf3sDehkUvElsXFbWHu
	kG1xwNGy3bUqheROvsrajBwuVLA2ASnEPKitO5AhGxovtMPK8kTh6YDC9VXpOXNc
	H7bq3afno2eijDTh+8YBq/9MtG9YF0xRqyg3KMj2AbviCCKYnsSvRBdTNozI8+M9
	79OxbyYMAPIMhRNkNlZQgwxGbQ9eiSBkOJCxvg6/cW3oXDI2T9pw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2f1cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 14:55:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 508DpKVX020693;
	Wed, 8 Jan 2025 14:55:15 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue9unsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 14:55:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trRjyxqHg/86kucQinGEb9F95jWrJM/T2vuFT8Uksc3iEBBzzLzWsYMlsCB2orWPPdCft1IYCCsoK4ziXZt4zVPISYjcpUWQ9ko2mvUv0pBqo53pDX6I9BrmZZiGYpCSxSrSkc8elVoawj/L11IaK1IFkj72yPp44tSd4xSrkQtiXFnwl7a6GSPyUn2L+vcb2XCQ8aLmWqjKUqoTTptuiA+506y7tKonrt+uO9R7Il6y0UPwPiJ1TB/3ZOkFranWwVmnAUDEjsT0ie9HLnbu9DyEMn5sP6KCHpOQvReTREUJAJafkr01lVTueBd0S964tmWogx0229DhLW0MG/WvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NzNMKWI+IcSB1KnUH4/bZSWY7Cv4upXJ01cwlFwoNQ=;
 b=tpn8AdJ7MqrQTQitPVK7rpCC9CosDDWlu2+b8+wEFT5qdZZ5gQEdvMGhWjWApVfHbxQpBLBOYV99OQIQq91hRlmTmeaYABbnSKqA0lGCg4LVGRBYDmqb0vGz50/bR+baLgO4XHHFzxHKAsBksrCa/y28+O1bkqGmOhs6D815c+1R/OuvanULOaQUnKVotDYbtpEvddTB1wdY/xPdtXhobMPGgSg9Xh4uaBAYwDdiP8tMCscku0riA6KNB09MvqBImyLfvjqsd/aOT1wxsjyGecYWpNF3C3UWrrCZ7l+BN6OqfGpSkyb46+tvk/Cz21pHKoAG903cJddcTttbwNGACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NzNMKWI+IcSB1KnUH4/bZSWY7Cv4upXJ01cwlFwoNQ=;
 b=alpLBRvrlX3Uhi478Vf9vUcl0FGHM0MoJpj1Gh14IAA3I1eOJdF7tLT+oqPqFy3fuZkDvQX2wq07cTG5XPK87WHph2T+4wmPXvY4XLHX0STyY0COYhfPeZPT4N67R+mckPG/dOhUJFOpaKSXyT8adNSLZlJZ8aouSJgAww+s5xY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA3PR10MB8162.namprd10.prod.outlook.com (2603:10b6:208:513::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 14:55:13 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 14:55:13 +0000
Date: Wed, 8 Jan 2025 09:55:08 -0500
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
        pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <c5lrmqdy7mivojqfehaaahdlpz6fx3qs27ithqfbljb3kan5lk@5cdssvz3uzke>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-17-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-17-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0055.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA3PR10MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4d35c6-ca7a-4e8d-766e-08dd2ff4745f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PyDpG+4Fy61t+POphlnuc8aFkhYLDoa17se+M1Dr+lhPreiwZccNSiXhRL0/?=
 =?us-ascii?Q?kbwXeV5SmwfDwHsLnU4P0uAO7wTy9pW95Yxp2Udyn8kh00s4I2E1Gyua1Byo?=
 =?us-ascii?Q?ttCDAgndF0H83VeV9mtWYmSXiZ5z24W3sm3Z4ynw56ggJc38SxxH8NF04z3d?=
 =?us-ascii?Q?nKFUMox5Im8W5VYAdngmvGOc/DmCqieTt5hzLaGfTMoHE5JGuJDtyLTFDbPS?=
 =?us-ascii?Q?QjBtHjjEgf9fj2zzUV7Do5Fk0zncypc/+Ut1dRRDr/KXHv7TaygfESXPch+V?=
 =?us-ascii?Q?kdmCHpwqPw20fLU0gxV+Iu/J/bNdYHpgvVvu3A4t3rKMdmXR7Cn6PAvUskGT?=
 =?us-ascii?Q?GDrllc019Du8fh7bjtjRq4EFAv629+dx+J4J/NaDa2YnFN6iXgkUOa5x/61h?=
 =?us-ascii?Q?s9WgW0vowAZyQ6FnLUxAPnpZo6pJ8NvodiGQ1z4qhU/geH7o4W89riTiKF8V?=
 =?us-ascii?Q?MKOG+xhuSDSAu6nX00/FrhUEZsj2OsIjiUIwjhdZOLxI0it3+cjsUyd5xLlN?=
 =?us-ascii?Q?IRYiWPAj0r7SWz7mGHj3kpGSeXUOnjjg6AkHFy5R7qxdEkfJlr23htLteWpi?=
 =?us-ascii?Q?/V/bz8O6s+QrMM5avRQleK+vSQZHgfaNYpP72ifscrvtMY8aOe66WD0DTh95?=
 =?us-ascii?Q?+i2bH/EFqlv1B5f2iP7DJFy2ei2zFjpxu1BIS3w95ovJ5m2d/SaxYE+EPT7c?=
 =?us-ascii?Q?hw3WGqaGTmGELKcKtVEJgdQjpcu7zgUiY4viVefJgICIknUw5GjCSA5z03nS?=
 =?us-ascii?Q?Pd7Y+uRp34D4s1tYcJtW3NlgByB8xleN3hsXga7jtRzbLIewu/yo5bC/eXQk?=
 =?us-ascii?Q?OS2yEl+KWoGDXG1i0HIcv4WH/Khcp0y7aOAsEBHHbeyziY73CcHEhy0Fq38m?=
 =?us-ascii?Q?0uyUgZhngJLMeCN2jtaHEu5su/+nNDyqcO50C3yBbQwYBbr7SBGwiPBiEiEf?=
 =?us-ascii?Q?5YSB30Afmvqr8uzryv1oKKZJWPllKwv3fSIJidTYkDlXqKOQH7mkLK3AeIAg?=
 =?us-ascii?Q?HWSJ3AkvNR8d+XGFbkSByVZ1jYuUsbrD9RNq2oHRyEP7DEwqg3hpUgX+0wS9?=
 =?us-ascii?Q?kjnzRvPy5BAzKzxOz1oUCXdw5IgAQrKOO76Vv7T2j8ez2bvJkQYsMN25XWTd?=
 =?us-ascii?Q?ltJxLSW5UHI11zkOUkd9CzJ58X6CMYLrEGJNT7Rp5tEsI4BdY2Cxpd4UgvxP?=
 =?us-ascii?Q?yUgrQrG8l4TRT2qDnWNh9sqE6tmV9SCQmbt+XPWLSOnINxPp37nWJ6FOS+Y7?=
 =?us-ascii?Q?tnPhl1hTvr25nmXXSIVAmxXAYuycOBSnCy1PfzdN9HbQT/M8rK5QJIx2o3YP?=
 =?us-ascii?Q?ymWErM50Nxk5VQ8EhfX/dva/UdSHZpGDyYp+1HgMnsEZ8tJRwZkXwV4hiTJt?=
 =?us-ascii?Q?6mdvwO/rKvhm+bZS/DmHImFSXIhy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9AH8z6WRDJyEvVw/ZhZqSiB09btqNaEVk3Z1seTIkpAEQDYqmX0FcreDOjxI?=
 =?us-ascii?Q?sHHRR4UDSZCfW069f8IJVX5+qbCSU0Cyy4fqR+h7AM5xCq6zFVjtxOQnL4O3?=
 =?us-ascii?Q?7UvgtUR60eGeLXSrSg9HTQoAC8/KrOW4vuKUwFFVUYv4vhgyT5/PorXl3no2?=
 =?us-ascii?Q?XhHYGlvON6c4RV5AdCPJ8LWJcH7r9TFiXChVkKIgqBD0qQIJBCMYuND81Pm8?=
 =?us-ascii?Q?nPHcYwYFmuiuIYQTpuOeJXFas0lfG4wagP4DUXh5esRXJr3u/VEsU8WKTMx8?=
 =?us-ascii?Q?zdFpOnWcZaGJsFvQYqjGrIyR75NBMeUUfeNM8qjZqK/aK3CEFLnOggl6P59J?=
 =?us-ascii?Q?XpT/s+c8Dhwr0OPs1ln9vgiGSbKo6WpQNGcth4TsDFIjoZRNpAyEpsJoHYu4?=
 =?us-ascii?Q?F7G3oUe+QDjmsFyrQxuwPuUXHwifs/PmquYMErJzT78oMAGrSqY+D8xz0nIO?=
 =?us-ascii?Q?wOOSQpSIdd6FUAWWbhv9QXREcAhyA0a4eTRs4Z9N5ijXPtsSjnhDw2FBm1pp?=
 =?us-ascii?Q?H041oOYOyx7Ttr123BFfxHnsCkw9USFvZByDg+xNuQqR2/BbC61zDTI8jj4Y?=
 =?us-ascii?Q?Rz7R6CKljK1oeh4ytl8vacFWL7cTfiIzLaoIIW4T+H867ZU7wX2iQnB9/H80?=
 =?us-ascii?Q?wSVTJ1SBb9+XIbzBavG9X4rF1EQqkd2XnDZKlz9S1Z82s8UjXMDu+kC5msoF?=
 =?us-ascii?Q?SoCbvFh5j4fvkFICbWsjpOKLP9f6NSiCA3u8EZGKSBJPEtgE+E7cREV6210J?=
 =?us-ascii?Q?VQfg+YrGwsM8xegaixdFR79XH7FDNrjOix411Z/zHpZHHvgwAJ/Uiq9rUBc1?=
 =?us-ascii?Q?wA2snZjWc3DVAk7oHEjoJPO/xRFRXyQNscUcNJgSW394QYOJ+ct/+5nVGMdR?=
 =?us-ascii?Q?EjbW6OXTttLeXlFvDh5kuRll5wQ2ekoum9ZOv1sRzkZzpdYIXjrfMGiJj7Bk?=
 =?us-ascii?Q?qoqDpHif/ejpQEzsaaj01ne83jde9UVxb3Z3t+VGFYYN7QygSERNoyk7uRZZ?=
 =?us-ascii?Q?oRXUfqEBqEpV1sCEqFtAi68bE+zv+liG+iFWCAHxcFqVYXwE3GTYiV+5mJcJ?=
 =?us-ascii?Q?YTynqNGpwrIFqwg8iWn/CXT8OjmsfiXZF5Wj131ktd5Di2gP6bL9biWRtWvY?=
 =?us-ascii?Q?wkYY3SOHQoW6bDxQ5pYrv4Wawo1c/Hlj13FBlCfjZhkFTbfxCkrixX+4suzd?=
 =?us-ascii?Q?X1LGkGDDbyvMw8KggCbJbEyjueeFmKIuQTN3vR83Uhvd1yRMWpMsyA7oyGDw?=
 =?us-ascii?Q?YMzKRRLFdpU0j5z/B4jPWina+EHnAkbwnvqN7WYTKUlyv5BAcX2tjBWS0gDz?=
 =?us-ascii?Q?ESlMZPPDlqZAMvBpiqOX3LSkJQs8fXXD/M5xj78711rcS1u/yUZzI3ss6bzU?=
 =?us-ascii?Q?vtMdFVxxnHIGb6NAHUm4ulaSib+hC9DhfjFJWet9Ucj6t78NaO0B9FaXZsum?=
 =?us-ascii?Q?TVuXRsc9S3jEImXGLtOUKtt0PhaziLHQ0CrI2yAHv6kbPmriVq8JqQDTw8tB?=
 =?us-ascii?Q?LIPdZOwdXvYUUb+qleRdhcQr4REoLhfPrxQ/wJkUfoXEeJFgYOYdt4+UGJWW?=
 =?us-ascii?Q?qUTbyrFqsKXGwPZ8ao8fCZ6vRXNpoamJk4FxDtAP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fytUhg43qRv+GkqHVIL/il/Ekz65xpDkTUvOeVgh2BRQ/w7gZUJ2vNlga3jPFJGrW6xfcWcoa5KLaviIaWEEFr0Z8qoRTs7YLDsUYkzbGc+4ug/Yok+6pKDmecfLHJ7NzQXQRbC7V4T1IQ1LW3xfGYvpbPr1lJRnd1hlAltIqycMXUR+LqxW8IudErkILfrR24wMb8W1FY3hi8mQeP9sNsAUU9K6Y2Njyu1rTC13JBtjYw3BhQ6i6dK4xjA7dTWrjE3LnsZ31XF3VYy/m/MK116DM5irO7WzrHXNVig/RgY37XFd/9TxsYkt63t3puEoO6qDJLLFiah7RNzUfyHyok62YOsAD54OpBE4MFhL1N42EVBUsNWHPvEPGIVdFGX854Ty7UQ9J34VL4I3hxU86KfHMt6UD1gT9cTZb80GB3afIqJVW0XyZt3WXCMQT42ec/p/sAPPUKOUbOe8nVimFq3rEGagTZakBRevVStPc0fh/L7Gf0CYHb10c9tnZYIiV6YIYJGc8iR/wWTDErYPZl/T/MrEFnl3hR9Dyb8uBJXV1jtmCAKAcDCeMVgNQAPOMVbIiGKt6TNGrkRC4bUjE7H80FN2TKYy2TlEgqEb8KU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4d35c6-ca7a-4e8d-766e-08dd2ff4745f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 14:55:12.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxwfrzfOgBKx1w6Hz7w1kvzwpgHAQ01ryhnC3rO7xcva96og8WVcW+los/SAn7T41VlMgicw7RimkW2jrzv1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080124
X-Proofpoint-ORIG-GUID: Da6qHeS6pliVqRIFZdmuLthXe_P2C12S
X-Proofpoint-GUID: Da6qHeS6pliVqRIFZdmuLthXe_P2C12S

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> object reuse before RCU grace period is over will be detected by
> lock_vma_under_rcu(). Current checks are sufficient as long as vma
> is detached before it is freed. Implement this guarantee by calling
> vma_ensure_detached() before vma is freed and make vm_area_cachep
> SLAB_TYPESAFE_BY_RCU. This will facilitate vm_area_struct reuse and
> will minimize the number of call_rcu() calls.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  include/linux/mm.h               |  2 --
>  include/linux/mm_types.h         | 10 +++++++---
>  include/linux/slab.h             |  6 ------
>  kernel/fork.c                    | 31 +++++++++----------------------
>  mm/mmap.c                        |  3 ++-
>  mm/vma.c                         | 10 +++-------
>  mm/vma.h                         |  2 +-
>  tools/testing/vma/vma_internal.h |  7 +------
>  8 files changed, 23 insertions(+), 48 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 56a7d70ca5bd..017d70e1d432 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, void *end_code,
>  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
>  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
>  void vm_area_free(struct vm_area_struct *);
> -/* Use only if VMA has no other users */
> -void __vm_area_free(struct vm_area_struct *vma);
>  
>  #ifndef CONFIG_MMU
>  extern struct rb_root nommu_region_tree;
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b5312421dec6..3ca4695f6d0f 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -574,6 +574,12 @@ static inline void *folio_get_private(struct folio *folio)
>  
>  typedef unsigned long vm_flags_t;
>  
> +/*
> + * freeptr_t represents a SLUB freelist pointer, which might be encoded
> + * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled.
> + */
> +typedef struct { unsigned long v; } freeptr_t;
> +
>  /*
>   * A region containing a mapping of a non-memory backed file under NOMMU
>   * conditions.  These are held in a global tree and are pinned by the VMAs that
> @@ -687,9 +693,7 @@ struct vm_area_struct {
>  			unsigned long vm_start;
>  			unsigned long vm_end;
>  		};
> -#ifdef CONFIG_PER_VMA_LOCK
> -		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
> -#endif
> +		freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAFE_BY_RCU */
>  	};
>  
>  	/*
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 10a971c2bde3..681b685b6c4e 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -234,12 +234,6 @@ enum _slab_flag_bits {
>  #define SLAB_NO_OBJ_EXT		__SLAB_FLAG_UNUSED
>  #endif
>  
> -/*
> - * freeptr_t represents a SLUB freelist pointer, which might be encoded
> - * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled.
> - */
> -typedef struct { unsigned long v; } freeptr_t;
> -
>  /*
>   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
>   *
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 7a0800d48112..da3b1ebfd282 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -471,7 +471,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	return new;
>  }
>  
> -void __vm_area_free(struct vm_area_struct *vma)
> +void vm_area_free(struct vm_area_struct *vma)
>  {
>  	/* The vma should be detached while being destroyed. */
>  	vma_assert_detached(vma);
> @@ -480,25 +480,6 @@ void __vm_area_free(struct vm_area_struct *vma)
>  	kmem_cache_free(vm_area_cachep, vma);
>  }
>  
> -#ifdef CONFIG_PER_VMA_LOCK
> -static void vm_area_free_rcu_cb(struct rcu_head *head)
> -{
> -	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
> -						  vm_rcu);
> -
> -	__vm_area_free(vma);
> -}
> -#endif
> -
> -void vm_area_free(struct vm_area_struct *vma)
> -{
> -#ifdef CONFIG_PER_VMA_LOCK
> -	call_rcu(&vma->vm_rcu, vm_area_free_rcu_cb);
> -#else
> -	__vm_area_free(vma);
> -#endif
> -}
> -
>  static void account_kernel_stack(struct task_struct *tsk, int account)
>  {
>  	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
> @@ -3144,6 +3125,11 @@ void __init mm_cache_init(void)
>  
>  void __init proc_caches_init(void)
>  {
> +	struct kmem_cache_args args = {
> +		.use_freeptr_offset = true,
> +		.freeptr_offset = offsetof(struct vm_area_struct, vm_freeptr),
> +	};
> +
>  	sighand_cachep = kmem_cache_create("sighand_cache",
>  			sizeof(struct sighand_struct), 0,
>  			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_TYPESAFE_BY_RCU|
> @@ -3160,8 +3146,9 @@ void __init proc_caches_init(void)
>  			sizeof(struct fs_struct), 0,
>  			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_ACCOUNT,
>  			NULL);
> -	vm_area_cachep = KMEM_CACHE(vm_area_struct,
> -			SLAB_HWCACHE_ALIGN|SLAB_NO_MERGE|SLAB_PANIC|
> +	vm_area_cachep = kmem_cache_create("vm_area_struct",
> +			sizeof(struct vm_area_struct), &args,
> +			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_TYPESAFE_BY_RCU|
>  			SLAB_ACCOUNT);
>  	mmap_init();
>  	nsproxy_cache_init();
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 3cc8de07411d..7fdc4207fe98 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1364,7 +1364,8 @@ void exit_mmap(struct mm_struct *mm)
>  	do {
>  		if (vma->vm_flags & VM_ACCOUNT)
>  			nr_accounted += vma_pages(vma);
> -		remove_vma(vma, /* unreachable = */ true);
> +		vma_mark_detached(vma);
> +		remove_vma(vma);
>  		count++;
>  		cond_resched();
>  		vma = vma_next(&vmi);
> diff --git a/mm/vma.c b/mm/vma.c
> index 4a3deb6f9662..e37eb384d118 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -406,18 +406,14 @@ static bool can_vma_merge_right(struct vma_merge_struct *vmg,
>  /*
>   * Close a vm structure and free it.
>   */
> -void remove_vma(struct vm_area_struct *vma, bool unreachable)
> +void remove_vma(struct vm_area_struct *vma)
>  {
>  	might_sleep();
>  	vma_close(vma);
>  	if (vma->vm_file)
>  		fput(vma->vm_file);
>  	mpol_put(vma_policy(vma));
> -	if (unreachable) {
> -		vma_mark_detached(vma);
> -		__vm_area_free(vma);
> -	} else
> -		vm_area_free(vma);
> +	vm_area_free(vma);
>  }
>  
>  /*
> @@ -1199,7 +1195,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
>  	/* Remove and clean up vmas */
>  	mas_set(mas_detach, 0);
>  	mas_for_each(mas_detach, vma, ULONG_MAX)
> -		remove_vma(vma, /* unreachable = */ false);
> +		remove_vma(vma);
>  
>  	vm_unacct_memory(vms->nr_accounted);
>  	validate_mm(mm);
> diff --git a/mm/vma.h b/mm/vma.h
> index 18c9e49b1eae..d6803626151d 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -173,7 +173,7 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
>  		  unsigned long start, size_t len, struct list_head *uf,
>  		  bool unlock);
>  
> -void remove_vma(struct vm_area_struct *vma, bool unreachable);
> +void remove_vma(struct vm_area_struct *vma);
>  
>  void unmap_region(struct ma_state *mas, struct vm_area_struct *vma,
>  		struct vm_area_struct *prev, struct vm_area_struct *next);
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index 1e8cd2f013fa..c7c580ec9a2d 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -693,14 +693,9 @@ static inline void mpol_put(struct mempolicy *)
>  {
>  }
>  
> -static inline void __vm_area_free(struct vm_area_struct *vma)
> -{
> -	free(vma);
> -}
> -
>  static inline void vm_area_free(struct vm_area_struct *vma)
>  {
> -	__vm_area_free(vma);
> +	free(vma);
>  }
>  
>  static inline void lru_add_drain(void)
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 
