Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AD20459B;
	Mon, 13 Jan 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779626; cv=fail; b=VcWH6JUZe5xVuD/e2uu61AiaTU/TRShCA0WYy2c47bagB3QefbiogtHN7YfcvR9OQIwY04Q/dfyA0k5Cij/LgtZlx01shkudLt5WB2BCCYZ58Ihh89IZjOar9GaCFbc/KeL4SizYLL5tu65VLdj3z53kInMt40tg9Gcle8jcQIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779626; c=relaxed/simple;
	bh=YlsonTGr78mv+sWZfHukHHjvAs01oKIyE1109SS2lfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FdMXBU5kd7/lNvPyGOaLD6S+d265//u0mF7tkGrlO2IrRDfJOCZXI8FrOu6Zq4ZoNqtZTgETnkpGfBZT3i2p3Xka/5mFiVNR/Q9rDl0Pnfb9Rx1JlzgigULyjfDOci25n+X2naoBLT2b0FY+5JazDFnO1lDM3nkEnrFqsjE3uVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PgjShYNe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T/L4lL+J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PgjShYNe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T/L4lL+J"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDi310011788;
	Mon, 13 Jan 2025 14:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Zh80y8Y+FY/ZF1oLRz
	ikr/bQYI42iBh3CYSYv+XyITA=; b=PgjShYNeIrW4+JhzUfPFXqP+ryKTeSw4WB
	hrAJOi93VWZ1ue2xJGSaRH/kxUUFmqdi775sWyKgaouQhdWa5pBS00unOMV12j/+
	q2o+dZisDSK5toe7z0XxDCw962gEM7Ux3lfmEnfngbnmdYLxi+cYb00C0C+gHcSJ
	ueuRSis/p85DV81po10+cbWxNwarvJe1NDcXnKv2LUrWItT1jiQJFSGrQIyaWinz
	YuYkKiYH1532AUJ7R51HKFwYOPLQGfUbgsnPYcoHggeYUk/Jr1ZtnehGmwNkXkHn
	jouUJdOjTQItilE++B6cxj8aio41i/Nl2IS2lT2pmFJvGpLkXnuQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443h6sun1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 14:46:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DD0A7Y034910;
	Mon, 13 Jan 2025 14:46:28 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f372gur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 14:46:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RD/P3jXOLIvdEbNpwPUbkloXWyyRwg8qwfBl0i7w/YX3yphKr3VYURO5eo4A8vx5QVrQBAkKPISGkAG4+PsaQWA+heVbUGQgh3torD+PRlyyGbG9+6Qtx+YBejvjKn72Ck3cyDQ3Qoi7fIOQvr8EKcsfmL9Azr9xE2QDsxyxETpBHBqYPc9cGM807BZSxNTkqHLBL3zUyMehZE09/sY0ICYGuLs2+QoPNr8lRzyHQJnIASlu3Sp7l5gwOz6vkYuCXzOgOoyTG+Jm/3RsYJQZhh071qWCoiawOy/KPpwcNiPIQZURqWSTC+jjE8o6NDEcu5izHwu3kyqxALgzlhArGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh80y8Y+FY/ZF1oLRzikr/bQYI42iBh3CYSYv+XyITA=;
 b=pOYwWoh0M9YJcBIQHmp6t3nhJ1mvwlJ1G1xyfIC89JIuTE/3/6nUWFthAkD4d5YAjDOoz4mo+Y+CDU2eTAskaggRaUYPnm8K/+dgN3N+B8jd3bpYG7W+JQ50WqJVWXrVwKjV5/gfSAsBwzZ34PsGJZmiYGNHXn2x6ynniKEpFWp4ZjGqr/skxFqJoxoyZ+cK7e3Bjcl7PGLmM/0eBnmnDzOCuaeoh2YFVxhywuTM+yzZwFvrCIYU1NZ8tkw2jAPOzHGDEy+VplveliJr7A2gcszJAy09X8gK5GMkXcIEJ4Q4/p0FYOyBPDNu4hkidFH5IzZHj8czz32BK3xc+TUsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh80y8Y+FY/ZF1oLRzikr/bQYI42iBh3CYSYv+XyITA=;
 b=T/L4lL+JEqW17ZmzHnbxLD1BjfqtC7Hv5R0HWw5EpqTEZvH79s9RwzfQE8IQBAs3hi4VPyrAKUT3heWBen8hICQyxZAUwiay08my4fpVwH3V/1dap8eDhsGSMcDWu8g+LWoydsER7CoLJ2Vw8r71pAPGmLC0h0PNyD3NAh2UUUo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6996.namprd10.prod.outlook.com (2603:10b6:8:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:46:25 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:46:25 +0000
Date: Mon, 13 Jan 2025 14:46:22 +0000
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
Subject: Re: [PATCH v9 06/17] types: move struct rcuwait into types.h
Message-ID: <4032068e-7965-4df3-bf3c-d3976be083c2@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-7-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-7-surenb@google.com>
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 807be181-9c3f-4608-f949-08dd33e10ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q6XEGwMMujKAJdl0t+cwmgoOi/vF2Fjwk8Y73o8etjklSAQ7M8JKz+J2+O9g?=
 =?us-ascii?Q?fMZN8II6z+aRw2idqM/9oEUU49jOCL4Zj6pzDI2VURvTN1RU0xfW340i/B1i?=
 =?us-ascii?Q?XbrqY65ia5T6TN2ozITPs9GYbbHg+SiUOn/fpu/ysbEt6CdBDhiaG1DFblyX?=
 =?us-ascii?Q?q9a7bM+F3B0XO1FygJMeb4hzqgfswm1IZTwgYOsZAFCrpaowO1eB1UKSOu7a?=
 =?us-ascii?Q?mBYwm76bNE4gcQ/PSlrmZz/flIXsI1gYUqaMWQIyVgid82jPpk22cdcge4vK?=
 =?us-ascii?Q?ZxEVajXLqtsFKkLrp19a57r/2HhNDdgBIuP6HTudj6XpsjXc29h4wr9NDvxW?=
 =?us-ascii?Q?DFvswRToNI60odahDoo4GEHchrs8kHNrh7pVpI1hSxnNI+IEf2yjUVxfQImG?=
 =?us-ascii?Q?M6Gfk4I1uR3MIr3Vfof8rMbbDQVM4HMMJ0zK1xkzXmieMwd+trjALLpt8y+O?=
 =?us-ascii?Q?ebVQ0fbS1NiLX1Fhg7W2JqfukpEe5la2EzpXa4Q6iK2kK3qkjoaUHxr/qefN?=
 =?us-ascii?Q?FkI0ftuV98LBLZNuibuYHul934Y6ruB+GfAEYRMAV2Trznhgzyze41UVZiN5?=
 =?us-ascii?Q?vP37jizQNwI48uhnwaMPDIne32Zl4SrjHMadAyWMX59lrvE6qbgaUbUZJ6/5?=
 =?us-ascii?Q?0ukDZA9rvo18ezz2zMvoaIXOmKjgI0U/gSxq26GFTYJv1qw/GjTytsR1ig92?=
 =?us-ascii?Q?Yo5zZDB37E77hY6deb73MeyzuayvsoJrmLdPSP2dLJlj1yImd7im/ximPeex?=
 =?us-ascii?Q?lVtdLmgWznDOKUtuwd8PN7phBWqYM6BaReJEw4iH4egSj4clbeE1CrZcWpAU?=
 =?us-ascii?Q?9qwnyR2MsqcIGsrCHIj1gi5Eb7JtbvQViah5uBs/xApeze1Nt+xDb9/a7SxU?=
 =?us-ascii?Q?OrK1juUNeihracDvOHd5XtYuFpdNWsJ/Cl3fH/U4y7o4Koi/R2GTT8MaC3RT?=
 =?us-ascii?Q?d36PF7hmAu2erADPwR9TyEIGGlWG4pU9XLq85B/ON4M40SCadU/9BTeqgjYe?=
 =?us-ascii?Q?RxxXmkjpBwM8dXZ0KepbbGnggA/uqzeHiwySuqUfRnRPLJnccKYcCBn0aizq?=
 =?us-ascii?Q?2KwZjUJZ2fTAMdOfpv0Vw+iIN/4zLI+Lme4uX/QBw308uTYtjE7cz8oJ5LB1?=
 =?us-ascii?Q?lyYhNkVzIdhHyi8VpVfQwJYR7SldjPv4/fpLZP+PsB2KItagzHVcJqxuXGHY?=
 =?us-ascii?Q?L8oHXLZbFdRgzyqs2b09Y1qoXmSm7P2Gu9Y4mwBNIEczYW0eaezsbXVXvsTA?=
 =?us-ascii?Q?hLwMcrUTJYEeCvrHNc/87JnpelSD1Ph5NGbUWAPMJqswUBxB/4BaP57fNRHP?=
 =?us-ascii?Q?NrQUu2R2XVT7fXDyX7TdYoAAZEfhUZkQbeB40jmZsG4Xtj8L8TD99LWWSvT6?=
 =?us-ascii?Q?DNjtTiXIG8cd1xFJuqCDkw1p05+G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5uyIhsH1lWtxi5o/+hMexDeNfuAF4lbxKd3MUA80diZs1mKXZm0luap68Xt1?=
 =?us-ascii?Q?F1/T6NXkTVPglFwxfZAyIhQ63pWGmPXxOR5h8gnMyUD5BG+bMInv7k95T9ok?=
 =?us-ascii?Q?eEORmyCdXupDnQb89DRXdKBO3qSsWmby2GdE3lz8qpv5+1G4+wgvrz0ZqeJp?=
 =?us-ascii?Q?7VHXMNlahuPtjKLkG1tVHC6FtG8y5H6/rCkZhMwqpujWffKYhZ1/yZ58/qh5?=
 =?us-ascii?Q?uhcNkLQfUBIl8FX5jY6xzhx65YQPJhbIrAcIncmHdDw0q99a4hCo0VZuDfOE?=
 =?us-ascii?Q?IJab7W3GMJMDxeswEH917a2PaBQVjAVjuDwY1LiN2Nnc1m2Q3lHPGfx4T7YC?=
 =?us-ascii?Q?d1G+RiESE7Jx7v+gS/s+9ceOJMkWHE1f2wudnrhCL/9ce0HXo3x0tkSFQnrE?=
 =?us-ascii?Q?tZ1X+unM/WrGUplu4HEGGK8GsaH/3XXU2KOAHSIqw0jK35kahmypXo2gbmNh?=
 =?us-ascii?Q?ONFKHbp/1S0yoLw2SwCnc/dvhgAD3piCjafOyaoqYn/YfwmA9GjbvKWqIUTP?=
 =?us-ascii?Q?iES4LSvl61wpkUEnFzAuHl520gjcjKkuyQgntqq5NvKzNx+xvmAlirJ0LIRq?=
 =?us-ascii?Q?+b6Sl73yMyeeTOoVzD3zCyJ5hJ5bwchn+MomJptzUDChiA4iJ9fzDlJVKUop?=
 =?us-ascii?Q?i2gfMdgSFH3usobzLgK1FOopV1HVDYr4hf0QtHUSmBbIRBDY4P/xWJaT9RId?=
 =?us-ascii?Q?5KumzqinS+1uFlgw05zkLUTenihJX3bQ+B7Tj/iVJr16R+7wWdRdvzocKyxs?=
 =?us-ascii?Q?Dy+JwyLtDBm548rWVBTXOlWUCaPM7cSLuERS5XrLYdrXMygrorWvBX/+xqUr?=
 =?us-ascii?Q?dPgqjpQKm8uUqbpC89PjjMejj/4mnsCedHMAXtdNDms4f2yqscjnAoK3DpdB?=
 =?us-ascii?Q?DVqM2FXHT5QnBT3F4z+88LF+vl3MyX46Ol4sVr/k+dvBPy2BvXNmBFV1cQgQ?=
 =?us-ascii?Q?JLIE33QT7E+GVzyxEfY13gBwVwlmjUNq5Z0CuOLKDDHNnOiUwD/5gch6inVj?=
 =?us-ascii?Q?gi6eedmyDGgR5TMObp6Wdm6EuCyHagtjncOmM85dE5w12S2XQOtZYv4j4acp?=
 =?us-ascii?Q?YXfwER68eAQM/zOZcHhqRmcg09+uthYPbWodD+fYWdeGoXojH7Relg9Fajjm?=
 =?us-ascii?Q?2I4Y1u3uKSeQdnowcsc6QUk4GD4WdiKxlmy5lMqJFohpy6rBuvlk48DJDene?=
 =?us-ascii?Q?DoqIJdk8LOLrcp1iusPMkJFxDLBEFoHrlIpTHhR1+RhZuwE+RkY7VtwGh5jc?=
 =?us-ascii?Q?ZaFW4hXWr+qIQdTROU9LSKzkN5/c0gRBWjcE5ZKNnW4hcvf++DmfChOTtjcL?=
 =?us-ascii?Q?R5mLPgQhXwzGzIsnswMbFXeg1SX/lblFkDgY0K9L1QgfCqRhQeG9RFLW5BJ1?=
 =?us-ascii?Q?U3PpVqaqs3dNeKReE0D4ueihpGdkB4n1hRSqrszMDyWF9/RONf7m6s8HW3jg?=
 =?us-ascii?Q?3+kwBmL6vvRPsmtoKBcJ2ZBvI7K7LEh48yqYywRsqVfKmsVJfNjsP6Z8sjkT?=
 =?us-ascii?Q?Vqz4YYGVtvJ2k0/hI+McDkVt1VyFvEVewZnCTgU3ZKfCdjYRtLSRp47o1vQ0?=
 =?us-ascii?Q?mYc4YdeAevCzIUSQerzzuYU93piMEZpTZ9nCp+q9dFbOg7vtofF3LxcJlwLL?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MCkAxM6vjkThwocnkExa8tczah7H0PWZau3HUfUmTDDgB4VrnTPC2njNTbbDru6YjZY3dCxyfgnSw3uqbsG3l7bJcziizccyk/7eY00PNpxLbqhDs8INCkUO65yfNKDjX+a5Z1kqDKT/814owNlpaHle9n8pYl/NsWkMUUxK5yUe3FIqtGwIkQlrIeXwiuKykcMwrYWs/ydFUmIkJD2or8T+A0UlQdKXD5yrNWSO7P2qtVc4DMyAB8YW3PDb17XA3njNM84qFPKmvEkydcmx3lnkxAx6cSkO0ihxZBY9FChl2HgU1x2Qn0oz0tes9pj39voRhqAzl9UDSaQE1RAiX0xreHTY40LMwjHtITjln2ulNUo/IdVrdD7Zd4dtdHQF0dTSEn+W+xaPelZ87kFV6CEqwXe+2659ZgR3I3BZEcqErIPu0GP+B6JDX3QUYQt5d5MG2TkTg74zxHU0JwMKEptzGUIvObTD5enpDc4PWy/DYnlxtb3rxwsESoBo0A3oh8Yi/qUx0f7ElecBfCk053dp/cr6SD7dJYT8hgLH1vTxxKZ37XV73qIeCUvr7kf5A/pyi/CTTIX1eN2EKXD5S2lIIVGoElD5tqvu8VGnnp0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807be181-9c3f-4608-f949-08dd33e10ded
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:46:25.3659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWW0LmA6C8vYA9eZv6j27pJmIsPpo0kqUsEGG3WhCtI3lLJinDtA/YAKdb7gHDjtKKKCgXJrvXjL1kfi6SJkihxocuxkXQwr40o55d1OeYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6996
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130123
X-Proofpoint-GUID: dFvKHMtVmA6yPy0tu3c8lolSVGOGyQCi
X-Proofpoint-ORIG-GUID: dFvKHMtVmA6yPy0tu3c8lolSVGOGyQCi

On Fri, Jan 10, 2025 at 08:25:53PM -0800, Suren Baghdasaryan wrote:
> Move rcuwait struct definition into types.h so that rcuwait can be used
> without including rcuwait.h which includes other headers. Without this
> change mm_types.h can't use rcuwait due to a the following circular
> dependency:
>
> mm_types.h -> rcuwait.h -> signal.h -> mm_types.h

Thanks for including details of motivation for this move :)

>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Davidlohr Bueso <dave@stgolabs.net>
> Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/rcuwait.h | 13 +------------
>  include/linux/types.h   | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/rcuwait.h b/include/linux/rcuwait.h
> index 27343424225c..9ad134a04b41 100644
> --- a/include/linux/rcuwait.h
> +++ b/include/linux/rcuwait.h
> @@ -4,18 +4,7 @@
>
>  #include <linux/rcupdate.h>
>  #include <linux/sched/signal.h>
> -
> -/*
> - * rcuwait provides a way of blocking and waking up a single
> - * task in an rcu-safe manner.
> - *
> - * The only time @task is non-nil is when a user is blocked (or
> - * checking if it needs to) on a condition, and reset as soon as we
> - * know that the condition has succeeded and are awoken.
> - */
> -struct rcuwait {
> -	struct task_struct __rcu *task;
> -};
> +#include <linux/types.h>
>
>  #define __RCUWAIT_INITIALIZER(name)		\
>  	{ .task = NULL, }
> diff --git a/include/linux/types.h b/include/linux/types.h
> index 2d7b9ae8714c..f1356a9a5730 100644
> --- a/include/linux/types.h
> +++ b/include/linux/types.h
> @@ -248,5 +248,17 @@ typedef void (*swap_func_t)(void *a, void *b, int size);
>  typedef int (*cmp_r_func_t)(const void *a, const void *b, const void *priv);
>  typedef int (*cmp_func_t)(const void *a, const void *b);
>
> +/*
> + * rcuwait provides a way of blocking and waking up a single
> + * task in an rcu-safe manner.
> + *
> + * The only time @task is non-nil is when a user is blocked (or
> + * checking if it needs to) on a condition, and reset as soon as we
> + * know that the condition has succeeded and are awoken.
> + */
> +struct rcuwait {
> +	struct task_struct __rcu *task;
> +};
> +
>  #endif /*  __ASSEMBLY__ */
>  #endif /* _LINUX_TYPES_H */
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
