Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160CA1FDA6B;
	Mon, 13 Jan 2025 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736769605; cv=fail; b=Z2QWjUd4bFlS4yitf+OvyEQIh1Xs9ccplXAMJfebDvrB+Zf+mAq+aR9je552jXtaOmafQkn/i7tGbC2z3+Lle2s3QMMNEDMV2gjaUN6uQZzlyQpnZYWPafljmzfj/CMJYTzfcIixfuDbayPTt9rq/pzEkI6FhFwk8xWHKlTfIpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736769605; c=relaxed/simple;
	bh=A8Uyyx958lBmykYHiw74k+xqlgSMFgjf/i5pzVrlHeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i8i6mT8QbzxV1TAbz1THeSjH/efka78GV+kGUIiIu7QUxT63UG4OCk8N3zufw+rVpfbsUF5Hdru+fQhA/Enra05PlCqRLHBqaznwHoQ47oLOA2LVWgD+FAbxxV0gYbGxzkWDAoQWIqBvnk3hOiW0aaFnQKK+Rl3q0UBYuwJdLpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WHAHmcHY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EQ6JVSCo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WHAHmcHY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EQ6JVSCo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBBhWO020400;
	Mon, 13 Jan 2025 11:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vHC5SSbtxHbXl4VNSZ
	fRHs7kPA4L69SKAio2Yh145kU=; b=WHAHmcHYFKxafCav0PMSHua3xzW4JZtYF/
	Ei6LdLuiXI3Oi6XeWbx3kqz4geRue1KyEM0zEo9hxv55tDPvchq4LwfGSdATieSV
	4CzMCFNRTwYu5byP9QP6j4ddGSXhQolKt4Jid24WiDeenOyoFYHEsBoyn7bGyGPs
	8OmeuLxwAA5GRI4VlHL8qawqUkuU1/ksg702zekpzwbEjVpfLZRnewzFz1ANJ+l8
	I11QaJ2xluZEp0eB022hTIIWjanhCsgNxe94Z4i76uH4QL7UsRa/tuxXH2Jcn2Ia
	sDUlFOC5IuCcCjyRl3yCK+ixzxCEKSWtTKyW30++pxz+RfHRv6jQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443g8sbf3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 11:58:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DAvKkk037226;
	Mon, 13 Jan 2025 11:58:35 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f37d46h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 11:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+TZHn/hUHw/9lSB97/+NuoOKV9ucv8BgiKO1YkU68OCb1ILGi5qLgXkCb+EPhkMZFV6Sw6ib1HYy5ROXEg/C3kOWkwzST5UNQ4zJIB85OJN4kVT6yuDemGguCVNYLJwn90biPbnkVesTfv15Vj43ZOY5HuwDdyAvTTne0CL3X2q/B1JqxBCNiBMMgj5In20xC2TOF6o5mMvC01sCswwJ3YNPxqqCmx2zKwAb5P6cFHWqverK/f7D+FWnBY1i9pUHi/MnX3iIuUW1ttSwm8dyGet6N1VhlrBaX9h2yD+ih/K4t1pPVHaH76wyNZUH5Bm3H8Y1McUWdbsJdnIKuGujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHC5SSbtxHbXl4VNSZfRHs7kPA4L69SKAio2Yh145kU=;
 b=ruTto7tDNnSjG4oRlNQaZRIeJfS2Vi29bJXF+c/QktsEYTdk+rx81qw9e73IJSDSZPnNxc9sXOfNAmxfyTNxAbA6Sj4QB5AtWFLyFwgHwEkTg17f4uImk/JkI8w+kEaUPmgpuFc/daGE7rDtTjH1w4esyvui2j41OxqyYTsEBCihitrYUWq5NRunLJ4yyQXI+R+3EwPiw3N1+NBOeIYcIZMYmXs6sDIDXbsJ2minsa4xyk68eR/Yvzqu0voQmeDP5dibtdfuVKlS8I6uyJgIsggugctft2vtEtCXtffZdbZ1JTkUaq3AksF7AvUAlXbqQOnRzdQiujlPolR5e0zZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHC5SSbtxHbXl4VNSZfRHs7kPA4L69SKAio2Yh145kU=;
 b=EQ6JVSCoB8NJ5knwZz/XmTys8a/7j7oEzu8cQhHQB4v8207IP6HH5x7Kk5s73DAviEObyt2uYQFfCHtKpbEbDh26OC33w3W4BCYf+yx8Y0D9SW98lLAkxnvrvthjUYPTlC63g+PCLVzv000V2UVjuAJihOrreM2iGeBn0g/76+0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM4PR10MB5917.namprd10.prod.outlook.com (2603:10b6:8:b1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Mon, 13 Jan 2025 11:58:28 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:58:28 +0000
Date: Mon, 13 Jan 2025 11:58:20 +0000
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
Message-ID: <6e9329ba-8dad-423f-9741-e5447f85659f@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-5-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-5-surenb@google.com>
X-ClientProxiedBy: LO4P123CA0614.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::15) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM4PR10MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 1778ec4d-9071-439f-3d67-08dd33c99727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sqh2v06n8o/iSeWwwNH5IRvW7bjRhN28I5e8cC8qUfVOpPs569GQBJyO8kHu?=
 =?us-ascii?Q?mR97ORQc362vQBQVfi7BeTc6CUiROY6PiossHIuyFjLTOvb8DDaVkOXVuK5m?=
 =?us-ascii?Q?de/lz1SpndjyRelol6LpKQz8u/miQvhiot9IrW/Th6bYcac7Il/sNszqT9i+?=
 =?us-ascii?Q?joRMgyWsBYpWVeH71tlDrVtEzRbIUhTQDmBnh92bwQuU/NGbxh4QqbjCLJgW?=
 =?us-ascii?Q?cWt4ajjfeOFAvKLDan4n8hfvAk3LOYhaHKYhy3cqVeVI/9oYFAdZ0XNXp48x?=
 =?us-ascii?Q?evwnXTzobV+Rf/FxX1bUVZrczv7W4Qo3KsR409gqew1YIv6mqXZAg8mWKq90?=
 =?us-ascii?Q?Ic5s0Xqd/EhutwHrsVvzgUFYuOfSLnyi1PFcYDNH/lLvkXfel11+U9tpqH5e?=
 =?us-ascii?Q?OLI/RdBef+xfls/M3XsjiAWiAOhPmYik8jtQ/hjPMVjkVrREyzhrY4XKc2DK?=
 =?us-ascii?Q?HaEVLVSeLfzAt661E0CfNN/jAtBE+dIiRvnEE6YkdOx4gibCOFL8aHOJ2UZJ?=
 =?us-ascii?Q?w2+vJh/lkxvbbGqjs1rwF5lNn2atOv895cE6UkxxiDUojv5w0K/Aj92NWKEf?=
 =?us-ascii?Q?IN6jE1SHTwYxqbxVqLlvTxcqqhclaf+n5g3giNzyYzexcrL8Vo2nLq1tP+t6?=
 =?us-ascii?Q?nXFTOEc8Sq/R9iB5GYmE/f9fReBhXaBA91slinXVvlzcFCUAIXXjXTC6ZctU?=
 =?us-ascii?Q?SQyxOvt4Ezn3Fo9Wcz3LYVgLmbXSfTaqsdSJEa0ogWDad4ZpsGWjvMIGH8m2?=
 =?us-ascii?Q?LzZCFkr15W84E7gB8gG99RUqZ6AviWUMWauFq6KclwUMNJTfZ+XnDpsCWLfc?=
 =?us-ascii?Q?WHg45ISE9uKIjlwp2iLziWrK2/BvjL8ZZuZiifnnXycM+rXwNusDSH9IEvER?=
 =?us-ascii?Q?KVF5EmVn5gfnlPjJ1c+ow33iIhDc3PN257gsXsP2wsqPHOxlQDkdX81Lm4R+?=
 =?us-ascii?Q?j3ILxAyiNqZGfzjwUuCoofEvgwP6952Ccil8ETL3rOjy9LFLiGPpVcWiQQA4?=
 =?us-ascii?Q?Zw/djEBvAz+PhtrTDOF0/pLpJm6Yk4qiKIEeNTFZYCz97kw6bjb7akOXnWr7?=
 =?us-ascii?Q?ilkNG0LvonDVhZ30eD6IrOmpmVRFoRmDpxPzDRKGn78htbibZu1KBoXEl5Eh?=
 =?us-ascii?Q?RGmlXe9dDp5fVT9Q5fGJxKwgEOhjrqws7p2YeGIx8fkSm6ml6m4spt+Ozki1?=
 =?us-ascii?Q?AkpsKFH3isR+lbb22CQhapy212FjpmFAMAoSt1k4eOTUTKmx3l7Z3ZpuKIJy?=
 =?us-ascii?Q?esEw2x/XrUQVtojHOBkLRcvG/CiUMD6lFO40clsuWggk+ALFI1u9fLBTxuo7?=
 =?us-ascii?Q?MFLR8zEZ0Onf9TaLZny5NvUOVzfKfVZdnwsoUxiJGnYqnAxXTKhBDSqgKcxB?=
 =?us-ascii?Q?PiaajBQqlv2VkFTt0WN7vlIPAtX7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x9GgA8+icCrkeSnObz2G5+3UKtMUMfLdBp6Ru3QddPmtFs4NR05yXdw87MH6?=
 =?us-ascii?Q?7ZEsV84nnjDT0bUlTlFTzNVIhsQCFVgufCHj2hMUf0fklQSyu+LB2saRtJeo?=
 =?us-ascii?Q?em71ANMGiY3OS39Riuom0HBPOxDqYUQ7uuBKWoXXs3bqf47To85QyARtn9/x?=
 =?us-ascii?Q?N9zcwgJnmzpN6QTXFA27dItmWtLWaU3AbmuusFDOLR4hvmyTb4ry/AYrCzC6?=
 =?us-ascii?Q?8JJA4F0LUKu8FHIAltP+gIT9SmQCl0t1nKx4iSW+aHFwlYjt/GtB43x2R/fc?=
 =?us-ascii?Q?hOfNnAFnzVFdntP+PnsyZJDwmNjg03AojkCC2Wvhz7KvuUhtv58MCqWbNGiy?=
 =?us-ascii?Q?/op9Y6Jejd0DdxUiRIpN8Xt6Kst0wDdQBVKWTztpANE4FVQHYMB5JVck1lTR?=
 =?us-ascii?Q?Awe+yTXpSd4qrKMvMipzIq2C+9DQcuTgWkGibrfrmW+2TVu3bzhY1O0upiul?=
 =?us-ascii?Q?v6IAcpleoa25p++WHq18k5IrwaB2ofwKR3RdsgqfELBkWXB191PZeIw2eCk4?=
 =?us-ascii?Q?ZH5nf7y5tuATbKGXkGqUudaSwNbShIAzWZylJQLypKVybIaEaIhjeBnL+OFn?=
 =?us-ascii?Q?0gwxqzAgqhBA4QXtUeV3DKZPbncNqnDzNJ/j9GPCxVZWnQejo0ag/q4sAJw2?=
 =?us-ascii?Q?sXdspCTvzXRxlcjBUIGMMLu+9/++AHwsxGO9qDf3fgkfBIVrVXVHs3+bkO2j?=
 =?us-ascii?Q?igTgHDW4EsIXx67ixsk6gU/QI4nhT7WkA0ayzPCXcFB5ZmBVZG0kxdtCc9HE?=
 =?us-ascii?Q?O0h7PeN6eN1VKCSPVRcxbapTao5JX358NXPjSb09FRujVrm/LJ+wOVq5ohG4?=
 =?us-ascii?Q?WLkfNQHwfrPvuoOyj/pjRTJszXhGcDlFzE55BTBGgRutXCaUrrq5PotJAXov?=
 =?us-ascii?Q?AtUVZ9T1ovK6oaPKoshN8jOMnK08p1usYmRBeLbEFLaXgx19uSsnmFn2uaKQ?=
 =?us-ascii?Q?XvKEfV5l6KEOlm5mMw5KoDmJ1QJ3PLEif5Fe3XJg9HonfmR/NBdIgI5towS0?=
 =?us-ascii?Q?FuVwK1ppCZnFgKUsao7Y0hUzdOSqS41rZKT9xgR+Zoz+hL59g8HsWc+IBikD?=
 =?us-ascii?Q?9ttXLKksO3hT/yVyispREtubHZbtpC6ThFx2iLYnMnH/6YXCjKWgHQX/O6aD?=
 =?us-ascii?Q?ZYLCtPKVA8EgeFm6wrMeT9Ko9GAd9gfFnd3OKIUjX8JAzOYRUvjqziHXhcuK?=
 =?us-ascii?Q?O0JEmyEL8TyIu6bBV3+VbjOnNSNM5XS52pBVbAnG53q1Nmm77FYCa5gHRdML?=
 =?us-ascii?Q?Xo1fOfsD3tJc1xXneQODI/FrXZzFLDJgR3xBIev4zSQtSlTUXmWoaf6vDCti?=
 =?us-ascii?Q?FH1LQmFLHNMkq4c5eYyy8KV9OLgkiGtKnMTfPIwldaMKf1cCq4TrY5Gm93PY?=
 =?us-ascii?Q?vGwugntxtnL55JLhMAgMWDEvmON5hpRMEcv0GVxBlCl2bJ02DhP2O9V5uoRp?=
 =?us-ascii?Q?9chHNRl10KbxWFKyCCVGA6gRGmtEKGENcFttPWOAeIzVzU1DuKGGrlu+4iMD?=
 =?us-ascii?Q?EtiGWmunb0RAvO/MaJhJfznPf1crTtRQZXsFvtU2IbJvipkwplG2ZHhX3Nrm?=
 =?us-ascii?Q?7yhCckaPfD2VOs1knM+vq5w+svSRUppCYdus7c/VMAQpbGfZ5kIWsL5eCsMN?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OGqbAcokIoyYAT/HXRndo4ZKRZtSNvZVYfieurk/GbqG07oT3D21gt0Cv3/HDD8VJEFsGDtGYDXR2g/K0MR62wGDmpOIIkNguaAfZZhmqkBTqBmFC97L1+ZK4IRA+2hzGV6/8b73wu5MKh62NTHvlzqsdsPMOuGHQ6gp5Uv1r2U/+DLhlEUM5ITLX2yNbhRueHoQzhwP+B74nzbcXuRwV2R3xq+e2tFvRTFo6fEsgy6iov4Q2nUCdnuSXHB6qQBOPH00U4pe1P6VV3+dePcAhddt+qO1waQxz1x1Bjk0gPGIp/7fOPa28HJaunnZRM0tMFRiplHddL/4bnHTbe7hEW30nuGDyoAe3qncqMTy1aB3XBpiEvfLtIrT0d1GUwVHpjFCcXuN+roLTGZOU/TdwK3t9bHKChd/YzTTn3PlkALQkUqENkOYCg9XfmqeQHumuNgylDmCi44y9FDlAyr7H0LSrqeCz5yIDxqk1grEKRP9GYGMwYdZTeLe0s8/k3CSaaJwBYebEa9PQpb2oGvjsQl2yxN7BRdewvsHT78Ud9q0xpU0RpnzTMym2ubDor6uVcyc1t3e04cv3QCOV96IBn9hvARPkYimGRfEp2GyuPQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1778ec4d-9071-439f-3d67-08dd33c99727
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 11:58:27.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcGHq2jcNnR/4NYW6Afchs4nzSquYo6clqKENElqBTqYe5fg3t5LivQM1THfnTCy78XOOWvUGQXu/Z7dzj2XOYw97bDDMHA7fk1a448rD1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_04,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130101
X-Proofpoint-GUID: QsWBoECuu_tKJAgHgRE_ZGyFntAkYcaq
X-Proofpoint-ORIG-GUID: QsWBoECuu_tKJAgHgRE_ZGyFntAkYcaq

On Fri, Jan 10, 2025 at 08:25:51PM -0800, Suren Baghdasaryan wrote:
> vma_iter_store() functions can be used both when adding a new vma and
> when updating an existing one. However for existing ones we do not need
> to mark them attached as they are already marked that way. Introduce
> vma_iter_store_attached() to be used with already attached vmas.

OK I guess the intent of this is to reinstate the previously existing
asserts, only explicitly checking those places where we attach.

I'm a little concerned that by doing this, somebody might simply invoke
this function without realising the implications.

Can we have something functional like

vma_iter_store_new() and vma_iter_store_overwrite()

?

I don't like us just leaving vma_iter_store() quietly making an assumption
that a caller doesn't necessarily realise.

Also it's more greppable this way.

I had a look through callers and it does seem you've snagged them all
correctly.

>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  include/linux/mm.h | 12 ++++++++++++
>  mm/vma.c           |  8 ++++----
>  mm/vma.h           | 11 +++++++++--
>  3 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 2b322871da87..2f805f1a0176 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
>  		vma_assert_write_locked(vma);
>  }
>
> +static inline void vma_assert_attached(struct vm_area_struct *vma)
> +{
> +	VM_BUG_ON_VMA(vma->detached, vma);
> +}
> +
> +static inline void vma_assert_detached(struct vm_area_struct *vma)
> +{
> +	VM_BUG_ON_VMA(!vma->detached, vma);
> +}
> +
>  static inline void vma_mark_attached(struct vm_area_struct *vma)
>  {
>  	vma->detached = false;
> @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
>  static inline void vma_start_write(struct vm_area_struct *vma) {}
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  		{ mmap_assert_write_locked(vma->vm_mm); }
> +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
>  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
>  static inline void vma_mark_detached(struct vm_area_struct *vma) {}
>
> diff --git a/mm/vma.c b/mm/vma.c
> index d603494e69d7..b9cf552e120c 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *vmg,
>  	vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
>
>  	if (expanded)
> -		vma_iter_store(vmg->vmi, vmg->vma);
> +		vma_iter_store_attached(vmg->vmi, vmg->vma);
>
>  	if (adj_start) {
>  		adjust->vm_start += adj_start;
>  		adjust->vm_pgoff += PHYS_PFN(adj_start);
>  		if (adj_start < 0) {
>  			WARN_ON(expanded);
> -			vma_iter_store(vmg->vmi, adjust);
> +			vma_iter_store_attached(vmg->vmi, adjust);
>  		}
>  	}

I kind of feel this whole function (that yes, I added :>) though derived
from existing logic) needs rework, as it's necessarily rather confusing.

But hey, that's on me :)

But this does look right... OK see this as a note-to-self...

>
> @@ -2845,7 +2845,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
>  				anon_vma_interval_tree_pre_update_vma(vma);
>  				vma->vm_end = address;
>  				/* Overwrite old entry in mtree. */
> -				vma_iter_store(&vmi, vma);
> +				vma_iter_store_attached(&vmi, vma);
>  				anon_vma_interval_tree_post_update_vma(vma);
>
>  				perf_event_mmap(vma);
> @@ -2925,7 +2925,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>  				vma->vm_start = address;
>  				vma->vm_pgoff -= grow;
>  				/* Overwrite old entry in mtree. */
> -				vma_iter_store(&vmi, vma);
> +				vma_iter_store_attached(&vmi, vma);
>  				anon_vma_interval_tree_post_update_vma(vma);
>
>  				perf_event_mmap(vma);
> diff --git a/mm/vma.h b/mm/vma.h
> index 2a2668de8d2c..63dd38d5230c 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -365,9 +365,10 @@ static inline struct vm_area_struct *vma_iter_load(struct vma_iterator *vmi)
>  }
>
>  /* Store a VMA with preallocated memory */
> -static inline void vma_iter_store(struct vma_iterator *vmi,
> -				  struct vm_area_struct *vma)
> +static inline void vma_iter_store_attached(struct vma_iterator *vmi,
> +					   struct vm_area_struct *vma)
>  {
> +	vma_assert_attached(vma);
>
>  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
>  	if (MAS_WARN_ON(&vmi->mas, vmi->mas.status != ma_start &&
> @@ -390,7 +391,13 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
>
>  	__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
>  	mas_store_prealloc(&vmi->mas, vma);
> +}
> +
> +static inline void vma_iter_store(struct vma_iterator *vmi,
> +				  struct vm_area_struct *vma)
> +{
>  	vma_mark_attached(vma);
> +	vma_iter_store_attached(vmi, vma);
>  }
>

See comment at top, and we need some comments here to explain why we're
going to pains to do this.

What about mm/nommu.c? I guess these cases are always new VMAs.

We probably definitely need to check this series in a nommu setup, have you
done this? As I can see this breaking things. Then again I suppose you'd
have expected bots to moan by now...

>  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
