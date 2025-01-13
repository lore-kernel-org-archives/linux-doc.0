Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE83A8D0;
	Mon, 13 Jan 2025 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786147; cv=fail; b=SE22U9cBmraFS5opPxk6lSNAUZycua8v2iK8Bx7Zp4Vk+txU7f9hSLqJxvpIZB4zk367DQ7e/fDe8JSDTNWMVkaAwr6t1zhGOZUAZIVFl+wEKP1bDhHA8zhN92EyrcksIaIBauP933c7P59TB8y4Nc4MqiQwd0rsBt6r8U7eVzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786147; c=relaxed/simple;
	bh=NhWJNqDxxmWWg49YuqeaI4q+7A8rxESj1Av87G4ysAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AiN5O8dVDlQcLzrt25MGfFbB/zIYeGXOTWILIQTOfQcNIpDf+vMTJ7/hI1GzfAFlrEdZ2jx0DgCPct/FVmbT3i5ol25ewiUjppwtPEDAbKw1kUuF8+WfzncJmW4fcfdsWp16SqKqcqvx0F7qm0pc39BjOlUSTgXkbl4FZi9iH3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mWWyKge2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=se7iWUJw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mWWyKge2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="se7iWUJw"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGXv1I014210;
	Mon, 13 Jan 2025 16:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WYote8DDBbMQ7FfgrV
	11++ra+g/TYTV9QmRCS5yKshA=; b=mWWyKge2lEWAiOfO5Ub1Ct/MESMlumYoSn
	GQCvwGPhxruNLxILf4BJQXRpK9iT2TW0af815PPkMAzywOJSwSvx12apdLPjPdI1
	b4eBi7BpI7xlMbCF7uXjz7DqVRtvaVVvC/ZHZbbabTupcjPLMI7b4pXelYHh3CYN
	YKnANxB1SBYo3/bofxQzwMI705Ju0s3FUkEN3bRX5PG/mBgNzceP7ku6zfB/2RmY
	sJEV04u59xcP5MQTm9OCILX9CBv6BsRTISUf4itw3SzuGbQQ7qVpENTypD/ySf+R
	ZH1cz4U1Brgrejvdm6QyQVitR06CdknlRpJyY62KHgK8nYnxOIlw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gh8uvjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:35:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGTwg8020265;
	Mon, 13 Jan 2025 16:35:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3dfajm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl3rYzV/zZSBOs9g7p+wd0mN0/+er1YhIKxrBLiDu2+1g4NFnCwu2DFRJJQ2jHpuNi3V88fDrHgqDQJHa/eq7mWxFIXnrDO6LsKjknmXfZAyYOYwC8UKdz8Jys4S2SkDlVjVFCPtEm8JSE66MfoKmMiUO+YVp8xMtFouzONRIi+yqLey8mXENSe0XHmKxLGzW5lEGiks+YXVMcfSmnj/uBrypGEIDGSHc7wvPtMvrnmZ2kEker/jDT1rOPJ23drhX1gZY7yDnybEkB7hQWuQ/6Mlm09HyNE6jD1VJBHVMFlxULrwAFnMAgG8rEGeLCz0XHXsAhjSWPihNLvFBgLAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYote8DDBbMQ7FfgrV11++ra+g/TYTV9QmRCS5yKshA=;
 b=XO1FJXIkb6P5o04M4bJP0wM8B7ONQ6nuaQXoUMMZeo/4wD9vcIgGjk7fPrBilV8vRrec3wJ4vhjkUFwhF30NRFYwVn6+7eMJqnvHQ3agtOpgG+AQVRzjo/mf7Hn/dpoWUW3//1Ol2e2VnOsoUjfMTvbTYYJ7t89DvzZflSyQerMs9T+GNYDXv1Wygmn7D0/xqf72gVK82MTSxKjXQdpbGVHbAd7ATcMULOjBCO+zSGlxxLM+/ltsMBXxjK4PycQ1tr0t7wMYo/1h81izqu9KoDALQVy4lf3up/+2hZS/+Eghb2iFK9o/asfcFRtTeVaxxLpgOfw9NcNxl5rXB08UQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYote8DDBbMQ7FfgrV11++ra+g/TYTV9QmRCS5yKshA=;
 b=se7iWUJwsX0e+gDW8Nxd71wbUKhk/kVf+IzOJ7ISVe5EK6yXnX1JvKchZL3ojjtWnkdarW1na5xHRYpDy3kZfWiwTkVaIjmphlQht6eZKSvTz/R4SWnRUD76c2WzPuSWcuhxmlgis98pKKUYjpW5t/QKItn9iBV+GmH8sjeD8FU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW4PR10MB5812.namprd10.prod.outlook.com (2603:10b6:303:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 16:35:09 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:35:09 +0000
Date: Mon, 13 Jan 2025 11:35:04 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
        peterz@infradead.org, willy@infradead.org,
        david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
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
Subject: Re: [PATCH v9 13/17] mm/debug: print vm_refcnt state when dumping
 the vma
Message-ID: <frtb77uu5k6low4zub25h4eqkg5jm4rnul3ncrlniwjrgh7vbb@szwcka2qivp7>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-14-surenb@google.com>
 <60b60b02-5dbf-4bb0-8301-0e2f511bbc7f@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60b60b02-5dbf-4bb0-8301-0e2f511bbc7f@lucifer.local>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::21) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW4PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fba4768-d5ce-479d-36d3-08dd33f03ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iDY1agfmIZOSu1CUCXVVVak5wxRCo6lduk/1I4fJLYBUzoGhU9aPJSwTHXrB?=
 =?us-ascii?Q?kjY0MC10UJxbhY2f16sKHf6Te7uIk5d/YZdx0RDBVpapeD7bLSSIDuOe3AZv?=
 =?us-ascii?Q?kTxxLHEDZwYmpbnsefQD2FIc2tbt6SnWtUcUM1MIzmhOTtcdrKyp4QzGsZ+E?=
 =?us-ascii?Q?7FQNTuvvPSO+VaMxWQowWmCR7w6qX5AEVcI3Btl3m3EpXwLWvpInXQkk6ho3?=
 =?us-ascii?Q?DnXVHeA9vN5mpm513iPcOPgeulyNXFml7+UVnCQUZQPxQksprpg1JzjQ0wzY?=
 =?us-ascii?Q?D5ubf3aejc0njECumcIvQ/Jrj2Dl7fbk5omaR3eP7iTqdSFd2Srj5IEwczeE?=
 =?us-ascii?Q?eac9JEgtB/Tfa1t3kHaJt+x4/JVIhJqfkE6Vv8bJuvFCSXBEmR1kyJ2OxiiL?=
 =?us-ascii?Q?bSpx15OlsmZl9ee4PenQ/cFGEgsAoa+D6J6Aixgmf8yHrwwusSo7W8XceAX3?=
 =?us-ascii?Q?LAI5c/t5yjI0MgLpV/vkaJQSLJpgi/j6/7YMTDeq587gqsYGdYz3T5FBeD+y?=
 =?us-ascii?Q?9kkMno3SJPI3VBMFTmRxZBHcikHPKjqMjGGD3KynaJTRM0y8Uk+9G1OVOxne?=
 =?us-ascii?Q?hoe5UlOoXH/szPypEkge4yVLN9rl8fcqFe5fwwMULgvjixPlWeARbt1SiAqb?=
 =?us-ascii?Q?eU/KvuYXPtJCBRbjOrrIuowj0mIYcurOGABxx/eQgitvI6Ep0LYxv5HOtTr9?=
 =?us-ascii?Q?fg0gttDIq3Wo4Xg5BnCm6SThn4kOR96YYFlvzKkslTTPNEngoD0s8eGWliS3?=
 =?us-ascii?Q?SXRFkUOTqBAn5wzX38Maxjm4Fxg8ab8mdNt/cxBhryWsuMNmu5uLRuGeN3Uo?=
 =?us-ascii?Q?vU6ZmayaNFN4hbaVp0Yme6Cn36KCydWECGq4hECqfe1GM7eI6BYnQUd7eMyJ?=
 =?us-ascii?Q?DSTPm4ar7WvNku6GZmZWqh51jU8MqlnkTtNKYKG7dWKgOlxpGXEa5bzxCUeq?=
 =?us-ascii?Q?E9IwgI7g/X+bFdO3uyLn2dVjYFcWFWN4wievhhdbHDnxwKpzVct260ConLyK?=
 =?us-ascii?Q?oa5a9bC6EgVtcnoaNQnpU4e8I09KEm70x3wsH9m4XMI700hZ82jOYcyRE1Rw?=
 =?us-ascii?Q?LZHJvDvLoKAp0nUytOzS+4V0Q4xSKF+m5v4elCi3f18GfeNaufF2CS5vxCjf?=
 =?us-ascii?Q?8cA96yiQhhG1bONLJN7s3GbN7PT0yDIjg50qKEYPWrwNu1v+FLN7UocVhnlh?=
 =?us-ascii?Q?SyQdSibWGiUhS4a3xVOXuMh40DORDQjfnigQHOlN9tQydiV7VattnviGDR0k?=
 =?us-ascii?Q?q3Qf3qxBusPz+KMpvQeGuliIKJfFNup3PON2+gMDSI5ufh9GKW6mBXzZl8Dy?=
 =?us-ascii?Q?Mvdzyln+TdYJPCY7dN18qScoI33gRdE1E6tBNfFCuJ42eu/MLMNv5lKz2FHH?=
 =?us-ascii?Q?ErT+ugMsGcFUL5Pc/eZx8XnDQjuu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hMzeeJcqxs0xhTOuGoPLxeu0l72rtKIDNYjpcmPJIx8eBkp8upMsTJgKOtxH?=
 =?us-ascii?Q?gOCVyf2z3RjkX6CrLI8ohpGkLB75Ff08ulkFtCZi9QusJLLKTE8tnfWIk6j8?=
 =?us-ascii?Q?ntwAcXejZeRVDCXvMpEtuE/cf1RNeZrpeJXWUFP1oH5qfPg9z9B+2XVnj7Mv?=
 =?us-ascii?Q?lOuyOxCtY6WKBiecvFHz5J68N48X6oFMqLem/LiID4fDsFrULfv8NxmJgayN?=
 =?us-ascii?Q?jbmDhSEKXumXy9zweydCk/fxMGAOPHeWaIeZtFMoCRoG8xnEMrguLiCsgKQ/?=
 =?us-ascii?Q?CmYAFDnBWMQZYl72yWYmyq1fGmc6RdesfGQ0HQ1Uq9HLSbGdb84jl0mj8UUP?=
 =?us-ascii?Q?HjZMJsxobKrgNYOBZ166wc+WWWaiU5vJD8zyKLRf1ZspqyvQ2BcPuK63V6jd?=
 =?us-ascii?Q?oj5LNcnlRgksb+geaef7PUzJCG88Ua6ZEqogJtI3gztkXzPy3BWJsS0YFpFd?=
 =?us-ascii?Q?6nIDPrPTMvmfbBAg6VN14n0vfNzGMBRlgix+qn3MpnnkV/Nsnnwq2HjqNDiO?=
 =?us-ascii?Q?cDmipee/vaZ4S6QizyZoISXaIflais5fzpxzgiZEdk9oecMBjhQL0JKgnomH?=
 =?us-ascii?Q?CYeXP+7zWjjt5LgcRBo0GFa2U6HbTyaHKadX0uv1QDOs4Fv69s5NyqO0LLKK?=
 =?us-ascii?Q?/6uUOi79BXmsWAiAnqYfmHk+CT7mLLKDKUSb+F/rb7/plusOvMUKze0e0w9W?=
 =?us-ascii?Q?ivLUQ78G/UDUOpX4gQiemawQWrbli2opywEY9Kl7k9VGKuvuOmXE7+cLnJNX?=
 =?us-ascii?Q?BFpxu8oYoradPdiq+lZe58gwjN4OZ9BrpGn3Qgpk6IXPz++BjQ7X5bTkWRid?=
 =?us-ascii?Q?KCfZCQDE74yON1F6H9dZuLyTSBNSYrxbEiUZAPF1vPpPD3pxXK7LMTYYl/qL?=
 =?us-ascii?Q?r/lQrVq4UolusXJLGKhpyL8rhAng8Hv4VgVH24hOccv40XimlpuqhI4dav24?=
 =?us-ascii?Q?tGGuvZMvg/FPshsEVAIWR6bEOKHldFL9NJb5lCNKUJweSs86IEdgs4roeYxp?=
 =?us-ascii?Q?deRHZunmCs5v6qDCkRXEReoAhTnATx+uVlC6ayw2BpgeIU5RQv7P+y8cHBwa?=
 =?us-ascii?Q?OhOtsWzh9mU/FvKt0mh1UbXtlcqRayHRwv47djaImNL+7g+r0MZDkyfxEzO9?=
 =?us-ascii?Q?zDQYcRQaOC7SJUCoQO0TjRCxeJujYmYMpXxAw9IL2RBzrgN1M41x+PuUogqY?=
 =?us-ascii?Q?zVRv7wL0gjtNqVAksIVm0/3p6bX35tK8+0QJ6JNmGduJ444r2ZPRrkJEHQaZ?=
 =?us-ascii?Q?0J/aWz/c70gcuWB6I1om41wHIElfDGsv3Hk6A7Os6MoGmsFGE+JfwJ++An7e?=
 =?us-ascii?Q?zTy4hEee8b4+CTThETOEsFFhP3E3rb5hXvLNcnYlU4OVopsGgq3oL5VDcBdF?=
 =?us-ascii?Q?qNsNWENpB4clGZ4IX2DbuYXKAfVZC57i7uNyQzO8pwt00v16Dkhpyeaoz7YK?=
 =?us-ascii?Q?RAtwEViH0Mg1GTgBPhEnJKjWXra2mZaSjJrZp7LjRMyUJ490jzPbU5moh12d?=
 =?us-ascii?Q?qu0tjyo1OCGSkQ0/C18/e6vFdZCsXo0KPnJ15grXx/4nfPn0MYz59E0XUuHf?=
 =?us-ascii?Q?RzMdPEVFWySdONJpUQeftS+Hts8Z00FSvWrlbLGb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	89ZpjnyAmaUXXJaF2/SNnO+sJUzrBDkrNqb5UFfl7Vk8sWHONleJ2MNas+FOmDAl3o14bFVRrvjdGYT2QQPaHnMIHj8IVqYXiviCeT4QnWYxQUtScS0pFC3kOB/BAJjWOjHpNfCIzcBK2nOXYPOEcm9WcXNDuBYm7JO/nqBALnJdGHYKSiFvJcT0D/ef2v6/qSyaalkg2hTQPf0BzOYtvbc/2Cgbe72SKpcWaXqF3fNz+RbXdn73/mlLA7Xsfvf5sMJqrwYpPHc924SfKmPr6hTJw9I0XhvM1ptC2yp11wvIkIHxK/nHM+k4IN0jV/DBvI1HB+E3rKnCdPyuZ1rLVtkre2hBHhrJNQ3VLLNq8Alz7E1CtkLBTIt/LCH4NnVgRHjaaCocmBdGpBZGX0kqG8Y0NToKI1oNJaqfc2IY0DkI37aFGHwMcFVw+zkWjh4raILreSb8Xcpmh2bA/nSLavXPa/mQb6bbmJNwub613Wc2m9OSez6UJp28i2GHDRL1BFzKUxozecNrNrJcCTNBXoIIBOIG0jD8gNYEsB14eQ4eQ3eklC2CQSDI7Jz9Vvj4eHs7jBYh7eTDRYtLDtlQeAmlWsflTZbfbHHhF+StfDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fba4768-d5ce-479d-36d3-08dd33f03ec2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:35:09.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ul9kDMuQ2FveAoWXYNVI+lY09Q33Dl+rIdy+iaiCJOLdTrnywvJyJ/DcAnI98AYpsN6j3hBzh2bCm11gSINm8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5812
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130135
X-Proofpoint-GUID: MY8dU7PMwbqQSjlaE-bCJ-m1nW2l1shc
X-Proofpoint-ORIG-GUID: MY8dU7PMwbqQSjlaE-bCJ-m1nW2l1shc

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250113 11:21]:
> On Fri, Jan 10, 2025 at 08:26:00PM -0800, Suren Baghdasaryan wrote:
> > vm_refcnt encodes a number of useful states:
> > - whether vma is attached or detached
> > - the number of current vma readers
> > - presence of a vma writer
> > Let's include it in the vma dump.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> >  mm/debug.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/mm/debug.c b/mm/debug.c
> > index 8d2acf432385..325d7bf22038 100644
> > --- a/mm/debug.c
> > +++ b/mm/debug.c
> > @@ -178,6 +178,17 @@ EXPORT_SYMBOL(dump_page);
> >
> >  void dump_vma(const struct vm_area_struct *vma)
> >  {
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +	pr_emerg("vma %px start %px end %px mm %px\n"
> > +		"prot %lx anon_vma %px vm_ops %px\n"
> > +		"pgoff %lx file %px private_data %px\n"
> > +		"flags: %#lx(%pGv) refcnt %x\n",
> > +		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
> > +		(unsigned long)pgprot_val(vma->vm_page_prot),
> > +		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > +		vma->vm_file, vma->vm_private_data,
> > +		vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
> > +#else
> >  	pr_emerg("vma %px start %px end %px mm %px\n"
> >  		"prot %lx anon_vma %px vm_ops %px\n"
> >  		"pgoff %lx file %px private_data %px\n"
> > @@ -187,6 +198,7 @@ void dump_vma(const struct vm_area_struct *vma)
> >  		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> >  		vma->vm_file, vma->vm_private_data,
> >  		vma->vm_flags, &vma->vm_flags);
> > +#endif
> >  }
> 
> This is pretty horribly duplicative and not in line with how this kind of
> thing is done in the rest of the file. You're just adding one entry, so why
> not:
> 
> void dump_vma(const struct vm_area_struct *vma)
> {
> 	pr_emerg("vma %px start %px end %px mm %px\n"
> 		"prot %lx anon_vma %px vm_ops %px\n"
> 		"pgoff %lx file %px private_data %px\n"
> #ifdef CONFIG_PER_VMA_LOCK
> 		"refcnt %x\n"
> #endif
> 		"flags: %#lx(%pGv)\n",
> 		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
> 		(unsigned long)pgprot_val(vma->vm_page_prot),
> 		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> 		vma->vm_file, vma->vm_private_data,
> 		vma->vm_flags,
> #ifdef CONFIG_PER_VMA_LOCK
> 		refcount_read(&vma->vm_refcnt),
> #endif
> 		&vma->vm_flags);
> }

right, I had an issue with this as well.

Another option would be:

 	pr_emerg("vma %px start %px end %px mm %px\n"
 		"prot %lx anon_vma %px vm_ops %px\n"
 		"pgoff %lx file %px private_data %px\n",
		<big mess here>);
	dump_vma_refcnt();
	pr_emerg("flags:...", vma_vm_flags);


Then dump_vma_refcnt() either dumps the refcnt or does nothing,
depending on the config option.

Either way is good with me.  Lorenzo's suggestion is in line with the
file and it's clear as to why the refcnt might be missing, but I don't
really see this being an issue in practice.

Thanks,
Liam

