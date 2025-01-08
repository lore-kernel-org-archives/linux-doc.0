Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A321249EB;
	Wed,  8 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348606; cv=fail; b=fbBtj3JEUI8mTGSzNeqUyvJfQK98Ji13PNHwHLQfCgvkI66bvJBFgtTg+FSxMt2fum+wmA5O7lILFkFZVXaufUaXaN1D9AYpSntRfp08/Z/LFcav06yIMvh/WSWxhMFMF/RD9NrAO34HRrhecBcLAO2LWFiAyIc0M9I/CGJzyjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348606; c=relaxed/simple;
	bh=YFpU4KZ+ivrsl4mmWfh6GhWZSwkj3KNk2zLa3TRs5zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uPaD3EfXLAxPzkt6qPuBTzBgXNSxLR5SG+03qyGU5JSemiJo6IgeA3lBwfslzMcbXhVajgYBupWIdHLgGUYNA6fDZl2ERxvQsrxn5f3A3ZARaiYVbiY4zBwbuXwp692Haemn4cQ9nM4m4tEo0Kj8GyZ1XaDxNrTe/zAIcMbMCxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lQSizxVp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pGGwVMI3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lQSizxVp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pGGwVMI3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508ENWUE015771;
	Wed, 8 Jan 2025 15:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=zv8oRe2pAr6IB0IIe2
	MmEj11pmXZOmpzix1HrneLtiI=; b=lQSizxVp6DvvoUjijAQltfZd7dFhqd+1sp
	9ka+Zjp4mb+qFCXAOZ4Dd28tmNJVv4Guib+I74V978sOVSmCbScIumxl7E3YPigU
	WvSiXfUVqyYG6tR/5C/bSWGIeKke1uvK4islIIYwEds0HAYw8nValELVe9ITjZrf
	/utIPuplEUCCa0xaXu0L6Da9B4w7ANT/Hi8G4/cDHh7UWI+HP+/+pL4vlGuwz2Wo
	rXhVdGouN6uCBpXf+jnYkSUXUts/h+1muHf39RmxfNrUS3cn1VNM9iJ6GgFBAU5q
	4IYRMCgbS6znMdxpoqrmRjWQKEdqwi1eSOolq+JIdpYhhVHrlRnA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xw1bxu3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:02:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 508Esb5X008572;
	Wed, 8 Jan 2025 15:02:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xue9pgtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:02:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6GW6dtPsSpt9xGYp7AFNloHP/KeWAhDRr0WvM+7XUT7GKpkxwndxiZ9H6awjjOuUxcItpYCIKv0Q6uVQutOslRHToCm2Auzm9YVAarhIb8sH/Xm4JvKGc+R9At1j2d1yvRzJSoLn1WssqnMso67j81aa/IR0/We4VOzYiqIk703PvN2foVwb6jZXMG2+tXLl1WZB9RAIAGqLuaVtDpnwontSUexqVJV3rnwJYY7TdI58w6vuWKXS72oRqZ0msTDIZjWsIzacOW2MiP+qm4+beB0IkQ6ScdFGF6CcMD6LTrU3aR7YHd7aCPTBS42TynlUzJ5JEtpiB60h8D6UzzMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zv8oRe2pAr6IB0IIe2MmEj11pmXZOmpzix1HrneLtiI=;
 b=jZvJEkm3nYO5n5E0SCjM/wGY/xCawKByF5AwWg+tfNpqmpfBlU23xv1Ec0br8DPUTncIBmkQoVp/JSLmxfwRwdOQ/pjq4FY9OawVV4nFW/whrt92lwReIRJHlwvKWewj2rAGbYow6ydXosKRAMIN96jJs1RJ/jS2OIJgtlQOWJoFa0pwo64WlKVts0gFphLWRLnZczHSnHEYNfQeSxjLxBgc74bu581FB6Un+IUtv6Kt0+Wv+XEenrQoXSmk8QHo9cDg+/p9ryboWiyjXruc2u5rRjLvp3TcYmPfiuZMlILvDNf07Hj3UnSwsEh4F6lz/WqihAmIw08c30wwnlzLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv8oRe2pAr6IB0IIe2MmEj11pmXZOmpzix1HrneLtiI=;
 b=pGGwVMI3vy4f18PK6xv4m7v0C+XgvayYBrVJNBDgm8ZuYunNH9uqDk3n+jFcxeaeirAcDbIpiTcAAyftdW0JzTdaZtvVoAYU/naBqetBgoDffRAFS9X8KVnAlr6AkaBcIjFGTSVOTp03XUCpP64mpmouQBOhbONeLx770AYbFLY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV8PR10MB7725.namprd10.prod.outlook.com (2603:10b6:408:1e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 15:02:52 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 15:02:52 +0000
Date: Wed, 8 Jan 2025 10:02:47 -0500
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
Subject: Re: [PATCH v7 07/17] types: move struct rcuwait into types.h
Message-ID: <ctuc5sxjmwahmjdzugrjbok5wj4i6nbqortorf4kgfmgawfaqn@rka4j3bx6d4k>
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
 <20241226170710.1159679-8-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-8-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV8PR10MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 194adeb5-1499-45a9-3a7f-08dd2ff58674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?doGve3EHaMwx1uyh6G/6B8YpU6qX+0RiTBFOa2FO6QxluMopjgx4Lwsp06Mv?=
 =?us-ascii?Q?q6OTtJpohRbWGKbbxk94WOTsrOO8MZ6V1bNSqdGJkPS3YUDixNhdY31LV0bO?=
 =?us-ascii?Q?S2LAe2nNJ/Vq8T8Uvr1dBiRrNswuiFMFXDQQg5Sg6mxjbDJZm0qUNaG6+GLY?=
 =?us-ascii?Q?ZXzKnQtebnEIINPcqJ8BXB3yl/QmxKpyFt3OZ9pz95DLA7US3InqHqnzDXUS?=
 =?us-ascii?Q?4C3f/TAWvc/Mr3DlN1e3FFcLreYyMUuRGeVNuwtYkhAI7z5OjmkD7v9iyt4s?=
 =?us-ascii?Q?2KiuOx1qbS2i966zwmQjSgLh94HkrrAHwyo8hGzDtFDV0jbCxlsz7fdfK2PY?=
 =?us-ascii?Q?rs59SpPXv9dgQbJM3Bxb+x5JiH7OULs0mVYyKquDpZAEyTG3pdez7DE4XvH8?=
 =?us-ascii?Q?98pAmkk76QO8DFpPY/4E8QO3v9zLiRohFmBZf6XH3Sb/KwJqMGs+WORaYdVo?=
 =?us-ascii?Q?4fbznS6O90AkLRKn4AE+co5e4In++sIXZWrb6VpGcJQSqJcLrQORMxGKxqsw?=
 =?us-ascii?Q?VB6Vk2zBN0piHUMH2COdzHhVffQZW2e3yKk0mvdQXP2TaD0DkXEe+iEqklAm?=
 =?us-ascii?Q?XBWxmGPIEbE/1idn+cdousIS+AlRJFn/qneLfpRLmODzqOObl/3gcYLgyYXR?=
 =?us-ascii?Q?93fcAaVEhUAbgpjN+MwFZpO/eikoKD6UZEcwli+FaArE9xPR4DogYlhLVI2d?=
 =?us-ascii?Q?ykU8CREp1l3S7bLcniv6v0hBcPrqzqvmrTV8jMdiwxQHFmeXaezNa06yaX1h?=
 =?us-ascii?Q?LLBLYYqM5hFaLRNHUJhUMcTX6WI46HkMQGzJ2uC+LR+o/GNGzpRBk2/txW5D?=
 =?us-ascii?Q?/wz182ke+atUjNeYVrNZynaZTRgJVrEITvPwULFZHh2qat4kKJ4X20k/0jyX?=
 =?us-ascii?Q?rm1LHMOFb0Ux8qnaJfDmyCzKITYhoI0rC3aT7aw6yNTpUtcHCD/MvdyXwh9W?=
 =?us-ascii?Q?Jaq+/uuhOG7oIUKlq7YiDQyHZnPqKi+h1IapvFCTQgZ4kohYJf03484WwkwO?=
 =?us-ascii?Q?zxIpYZ6yvkbsb+7bqGZDU3YB3cN0lCQUHXkS437kDuFpUDk8YemXbMb7VHci?=
 =?us-ascii?Q?QKjeSx615av8DTxQ1DWBGvBTDPC/JU4C8jqzDrVn8ei1/ma4396mXgE1o0F/?=
 =?us-ascii?Q?LcO2KoWw1J3BtAcRdQxx/OH3OP5dc0JZJGekuUZx9aO55JJ08SqJj3h6eWp5?=
 =?us-ascii?Q?6BUBduGgrMZ8j53t0KmKgzrTz33xYwc4c7wQrDKfw++6rAXci4XoEHR5FmUL?=
 =?us-ascii?Q?2K28J//sWcamOm9RQWGSxrmguQZAm4QEH+ykARsKRvx/5TcrfYDPZ9KgMf9p?=
 =?us-ascii?Q?Si0mDHSwYuDgWq0wrdxY9xf4eyUUWWi1pvCIFfkLMa0ovgicDKFgbjeLvUnd?=
 =?us-ascii?Q?jAM1G5dJAkLSkJkHkWo8khyzxwPY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AhNJ+8aTqXpva77nSwHrUFthS8Imor2mQDRVgzQxJzh/BEJQtUg1XgtcfiBU?=
 =?us-ascii?Q?1o9XPJ5r2oaMUtBVQlV+Ovqex0K4jgfN37yH2qLBOOxt4mr1JUpOD2XZAaSl?=
 =?us-ascii?Q?YxWoCxsrhaKbE9PoFK1j8HzbvDkQr4g0AhMCorarG5ahIMS+SxLqS6/LD9wq?=
 =?us-ascii?Q?+76gnLNMXFiCWNezN2L2QeYfRn8wfXq9GNMkTebkEPSZVVKkY+v8ZKqfgG3l?=
 =?us-ascii?Q?477LF6sepfGKzZC5Rm6aSavGJISCrIQJab7mvuxYf5UluSWQzTuDg53BS8VS?=
 =?us-ascii?Q?WumTL0QgbQtBfNRj7hwleTQZB1wL+2PWqdlH6rQj9KMZBZQenNM7COcyyyxg?=
 =?us-ascii?Q?G3cCun3WUDxRMpreVjzZrOgDrLXsFbqENR9gH/B8T2vc4w6N4kUvArdyx59F?=
 =?us-ascii?Q?wgQMPBs7lY2ye5VZhWgY6PW9MmEDHqGQDZ3aDbRJJHZ2CgSGr1XgBPfqPLXY?=
 =?us-ascii?Q?E6pbLaCrhLqoeeny8HODQ4J3bL6TRA79rNAqHDoTCn3z3kQbWCdoxBOS5q4b?=
 =?us-ascii?Q?ZkZd2CWX/+j55vborJQnbScuvsXkbfCdzOThJzKiBncdQNwo91/UQQ9FegM0?=
 =?us-ascii?Q?CG3+3x6wOLKFzL58+f37KFiHgdxXhbwqaheU9uzrqUttLQiMJs8VSlHWwD7b?=
 =?us-ascii?Q?6boTn5qRrmjkXwNXbY4O/jyHeoEG+WpFYQTITyfo+0/0/ld0pzo9+Hs1xu3L?=
 =?us-ascii?Q?O4FLAYC34L9u0/7l7qldXAgct4c2kSOZ5xdk5Rr6NLTU7fGKJBcBDbBdXjxd?=
 =?us-ascii?Q?3wTnIW6Rjpt0JjILgYOc5++p64uYxAF8M9b7MFAdVbV8VAfKI/osT1bWA6z5?=
 =?us-ascii?Q?ZN95rU0+K0U9/AQxXiXoZjOBcBLxJ7Lvamj9k53OOX9AsVrT00ewpH24KpI4?=
 =?us-ascii?Q?LSmdmdXOvsU+xBuZ7EMFyMnYz2tGE4syXWBOSpOfa4UvydAPrMbUZ7ZsGBbv?=
 =?us-ascii?Q?bJt8QGloQFm1LBfbbsjU9BEYT2+lCpbnWoX5Wjn7j1NEY5uUm61JSP7AevSj?=
 =?us-ascii?Q?n2p0bk+mqyh77c9Q0qpxMMsE67G+tfTCzyUUpMRxFfSvsjNkIA/sVxFiWBwc?=
 =?us-ascii?Q?k96zvW3PLgP62P1FfYYO4lZXyTadSb4Jo6P43OjxE1MasrCAKFe4TUSJYL/R?=
 =?us-ascii?Q?0NZOxVV59/s8OTF7nO/PwEes/V3ygfv83bNxYFNIXfvP3eq1foonWwLUlDQN?=
 =?us-ascii?Q?3LlULSmWml8lpzf09fi1If20o/ApHkTkcaAQUOKr8nFDbBMiExDh+RHw6zlg?=
 =?us-ascii?Q?9qZOdNugxafmKsqrXmPPdjYFFyWrHst9tnDhW+C65GCgwU7OuGZFMg63gWcY?=
 =?us-ascii?Q?3idmKUG7n3BGZckKZBDuhJEl7F67Rugm/XowvcjluF8aGyQ6LZyAhko83rZA?=
 =?us-ascii?Q?Xcu4eGQQXa9paXIZFmEOQMsmqnoZpx5qTDuff0Im5dDSQtMXCGqj19Ra1/kh?=
 =?us-ascii?Q?/pvVM0l5BM985y57a1D51KzP/VJdkJ/8Wf581kP088EKhsI4w0XRUlzIa24i?=
 =?us-ascii?Q?UFuzkRxLbZ0DqinVzr8wrRUp1ydNqlVSPeKcgDmYkDkOihuvNFfIUJrpNBmj?=
 =?us-ascii?Q?idkY7YG7qN7PRebnzC3NxtlZ2P2J4PFBYrf7HK46?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f0E3ECwL6j7VMbUTSjIKWolhTP4bTOzO5KDFBkIH/B3WQZnMr9XzaNHxulQIDNf4y2PI4c26FiaENks6w0hbJLJg6L61nGT2P/fePlPlLPgrWbYSljq9kLPnTPnqFTAGYgwcLcLlkUTaRoXMWmN3JQV6U/Gjyj5ziNCNPQ3TxHe/c4yP5mm9robFFb7EtqLEbP+mcc1OtFlvUWv7avY3sEwVXqGgfaRkTmbAeF0j8/AgCTq0ylql1hgkEnWvSKydNpD7VJ1ycS8MLqt4+Lvp5PuubZyZtyX76JPq/D5mpDJxoOdd/Ur6Z2AcbCirsqZYYyiOzKDmceu3JAqoCDs71YEXMwalSz6AJjWCWLlBPAS7QMrNTMJE4Ye0O7qqD7HhgVWNDNFY0KPe+lNLzcOTHwYEhkncicyiBtohZD36eidJmaFlzuk6wwnckHfkm3r1ovLuEh8RCEp3oXcECLp5OWRyuGxGUyJxYfVoJVOHFg+pEQ4E8099+Wo89OkW5aHajkSzs/Tfa8vEs14pexu4FYchdOZcEeyZ2oke0zIkVECYb3VCY7WmZ3vGgj0CLoUUtmYVE+BjoH7/ccqRC0161AaAKeJlgX+N3y/+xeAc3nw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194adeb5-1499-45a9-3a7f-08dd2ff58674
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 15:02:52.7304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoKPdDo80+sropg68e8p+fUAkVukVWnMWPaGsCFGlWHIjBQggSf3ZHH4AgAAmAq2lsd/zbETwc3E+yiH19D0qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7725
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501080125
X-Proofpoint-ORIG-GUID: Tw9j60Hmutwp3HLlGtqIHRFhGuh1H9ft
X-Proofpoint-GUID: Tw9j60Hmutwp3HLlGtqIHRFhGuh1H9ft

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> Move rcuwait struct definition into types.h so that rcuwait can be used
> without including rcuwait.h which includes other headers. Without this
> change mm_types.h can't use rcuwait due to a the following circular
> dependency:
> 
> mm_types.h -> rcuwait.h -> signal.h -> mm_types.h
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

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
