Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7D205E3F;
	Fri, 10 Jan 2025 17:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736531329; cv=fail; b=ZrLjCfMbiw1hjySirDBnR8tg82ODxJmKH5mQdBtuJSTBL0A82dg7GUP2tm6fASbAOqJz7/71R7vij/0KVJbNeQBB/8tZLcWghrdPAOcbpO69tubbkMGEvX2VqBJl/hPmlf05iDqZadVovtOisKIK7O9Du/0A035roQV3Ka21HeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736531329; c=relaxed/simple;
	bh=9stvbqKqDVGlBrW/UpRHuTxETrBFNPqg3YNlFTRKKKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sOMSpyzni9iMPZ8Jt352Loh2A4Az4eoechOt/ZFpecl6RDWtHVH+lQaeE6rMB0o3rOQWDYFgFjGg0zax+M0eSqm1Ri/rMxp52i8GN48Cknmt0X3AVD26GBpAnlEMoIEVQGCK24Byj6TceIBYD13a2JiAU1kkE5GRwK0O7Z+vUYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LoWzXK8g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vhCPihPy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LoWzXK8g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vhCPihPy"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AEOGSS016411;
	Fri, 10 Jan 2025 17:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=C+AsfRwBgi8S/mezyE
	M7qkDoCWpo7EKBsOEfjK4SWvU=; b=LoWzXK8g1WBitrrcQrqff7jZNOG/OV4Www
	yselzVRRWetqEMPB94XZNez2TLlzn1JGpVT1LtHNjtbIhP4IQU+XX1TQ5ZaEfOg5
	UJZnq0mkLmMQ2A8MHCdFBvgsmZuLyMRF7oiUtm1g+NLeJV+Boc+iSHYrYPXdb8oB
	Mba26WLtN9cY1/+0vmpqNqKRkW3mqIWeJuA1bWb5xqCCcHZWHRCusQBVyIRnhA97
	lU1LZonJKMWv5gL6dJDqJ53rUvpg6agplLZdM2ORrN82P1mSTdls70R95bsKMY0l
	i7OnuUkuIE2VM4ctptT3BhHMJ+jOVl45oFBTOEB6qQ/m8A15iUGA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442kcxa0gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 17:48:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AHGsua002837;
	Fri, 10 Jan 2025 17:47:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuecqawg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 17:47:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdWqmWgniKO5J7w+/smb865LgOPnrpMAXgFu4qpJX0luzxXkXtYoDw1lu+DtkBIQO3FXX9qCjuGD2A5itMCGPISfpVf9lUYStplqPNXr9qvk61h6tQ3iuhrKs55k0ZliOjVC2jFUgbR4fWPMyMJpDIByD27GU+IVK4z1QiBiAppKXLriEOAXemn6CEcjTliNTOoHvgdm6sPbKyXliqrdAHIjlVFQc3se/P/TsmUNz8zZzE7NOAk+UxaKimrua7//M9/1fS/2wiAzejzfXIh6m5SySST0zL+YZr7GjpbNy7nv8oEQMEe76QWd4fYMKL9BpiOkVlxIUZgDPo77C1VFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+AsfRwBgi8S/mezyEM7qkDoCWpo7EKBsOEfjK4SWvU=;
 b=PEaPbjYIS8AbbV5Fc0YWxddcDz1l9qSvr/EklB0NawMvuGpQRbDZk03GgaTmb4KmA8Je3ssiLsJ39QHjcJ/BpBTsCmYM5zyPGL4ROix/rQCVODU0heCVzvjOoIsFcIw0gRvkWfpfA7Nhbwo4f55XdCnNEOMPPtmSonFV0x/B885szRnDeVMRuItr6ULzO0tCcReynfRpNxFXlmHewO293OF5SrNZCkO6+zHTHI+cQilSW6coiMoeLvgF+JRscdKMUquHo3aBKum5C5AYWkcSOvotq7BMej485jz+95OJANhLZIx4IdEmzMOjEXhd3YQFu58FDcmG42SyfXtr7JNKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+AsfRwBgi8S/mezyEM7qkDoCWpo7EKBsOEfjK4SWvU=;
 b=vhCPihPyubGf5CF0MelNl/kuRTPlx7tWCPWuEcSKYU0hAvgy4iQLEoyGHcvq+ZzeKeKqH7dLbiFLihqz3LfcLxJ0bRUOhnd+Butm0NHv5KzBcvzt9BMswdBx07iov4u4Ar7jpoLweVCUJSpVBB+s9CHtjQgjlJ+HJcq81YI5K28=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CO1PR10MB4514.namprd10.prod.outlook.com (2603:10b6:303:9d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 17:47:56 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 17:47:56 +0000
Date: Fri, 10 Jan 2025 12:47:51 -0500
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
Message-ID: <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109023025.2242447-16-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT2PR01CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::14) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CO1PR10MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d0be41-81d5-4693-735a-08dd319eea4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FlHgzzvMjSGoJeIy67k8iWJSFKmRnz6s3dVMyqRa1Ij8lhyip+8puBL68r4F?=
 =?us-ascii?Q?9/J2EBSxyq81k0qL8CibXv5eLRBOHulOJN8PYjZ1c81lrMASb11Zvkotgjtp?=
 =?us-ascii?Q?wMebbDu7kpsliTgfnNiOWFmKe/u9kZVRdbmisw39SfOtDt1oq37fZMky5OFf?=
 =?us-ascii?Q?tu7QyjXQ3n/3zXcOqRy0hwVPRN1UyiPLD5qpepslt8lks9+EhDzPn8CJEx03?=
 =?us-ascii?Q?bJlKwAAqyKlwenYAt5eWQYAgNPKdsCSvNdPkfT+vE/rDkIXTK8WDyHKpAFPh?=
 =?us-ascii?Q?JlD+u3qa53PPbqoE1SiWNq3DZUFAAeUBqqrqbCp4OjO4scCR1/wYhReIliFm?=
 =?us-ascii?Q?9uts+WY2Asoyr8/NT839rUWrBBLHoCUM1qAnEn4pX+qCdA4k/r94Ir9lLaCE?=
 =?us-ascii?Q?m+llrIbD/jlpA/dL7qUkCtK/iSNR7v37gmD/laKtm2XhiFwifaasw2+NJYXM?=
 =?us-ascii?Q?3gVs36yjG46K1d1m4zk1RR9f6V77HGkQR43oiMc4YoGodNi2v9zQ/0CWPNMw?=
 =?us-ascii?Q?92ihb6QUCKigAObuo4mjK0q73DGpmYiv12C5N9dDF5kjJEWcku+0tDfp7lFR?=
 =?us-ascii?Q?InBnaemUdwTC4nbzcWR94pNL+4dSO7yRIeuFbi0VQAsGG/WDDXvB29aZv04Y?=
 =?us-ascii?Q?QsluPmXCNSONi2HxEZSeWTpSOz+VThl0tjnneYWV/h2k+6pmtXGqLDzi+AmZ?=
 =?us-ascii?Q?yGAakDLWmBF/Wdjzg4K/xiDtldy3hOqzu+7IRGUP43x89/ZWPoy/0DczQRez?=
 =?us-ascii?Q?l3ibN4de2S/qb+vmCyEipioVXEPtnfShPaRD4/S1AkshWobl6ja7pwiRuAsc?=
 =?us-ascii?Q?Z0lrqR/s79VLcCdkQNp/YcTj9hvwNJm0bvAkVCmT/hswoiW4UA+YpFauIfgw?=
 =?us-ascii?Q?7b1o6A7pUCp2lrcSa9QUVbrU1LkabVHf5hwhe5rso2xzj+UMyHI7/Pi8oDzP?=
 =?us-ascii?Q?tox6/hh5zWkqicmTRC7b3Ud6QauGkc1B4NbxneM26BEwLUYETCD6mvYuzQMO?=
 =?us-ascii?Q?RJ+KZpwgnCCuQIktm2HTyaY/LZ3Wd4eODoNJP6SmrpGAbTBubap+jhjD18aD?=
 =?us-ascii?Q?OLeyLKhjRxeHSew3v9QdiWi9sHTX+jOS2XEfPC+hG+oYw4p2q8cXpocLe0ec?=
 =?us-ascii?Q?JIqSWVMdvGJAph6X0SsNSUbHvuQv6V8becpDtm55mY1K9iw9/dus/j0DZ0IH?=
 =?us-ascii?Q?Du6OdOAK6JY0bdjrXrtha0/YaPGbAzmOCwclYGvNLJycgFljPZJJvq+ydDUy?=
 =?us-ascii?Q?eAaNYuS4ivWCqKPSkX202EViqXUfGoToRNr5hPypop5bID/VKQrQgIQD3XKv?=
 =?us-ascii?Q?jvgznrRW08DgYvPA9gfWU11PXQbE4njPyDfUkZ29cPUp5Kn8ShSC1SggUq/R?=
 =?us-ascii?Q?TJ2LxpySct0dRRxbKRCwG5p6DLWb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JXaF0KKpe7/ZfuoRZlj4xMNUb4mWKF0nu96KY6ajV1IqjtYL7yccdbUmcnko?=
 =?us-ascii?Q?nkMIguOCLUprU+BuUnP0jyRHUqaQ2wRxqyfSHqvDWUqQQ6UF+uETLvKLaQ+Q?=
 =?us-ascii?Q?ZEdkpeSeyouFKU5Y/lxUreTsFezbtgaTG+S6mW1BxCfmPRtakqUTJEHIZ/gF?=
 =?us-ascii?Q?IwjR9e2dwgueHy34ppNB6jVlM0yuq6oZeUNEMCtH70RnyAuNCDKB0MfHsEC2?=
 =?us-ascii?Q?DBVGJCGIF9EXMzfhxbSjw+OfyE9esV8Fkpb70+46NlOvyDFs3rgKlPLROlx1?=
 =?us-ascii?Q?kth9myW/D1B7I/yzqG/a1K7DsQezjmeyC/GWeG1IPktKYBgw2lpP17bR9jQr?=
 =?us-ascii?Q?3NyBV8ZeCQBQr6FIxLpOwG0JyhsRnik+HWzw+odZDTJD6F06gl2JLTD2izA/?=
 =?us-ascii?Q?lolQkWjI+D3cY629JwLYEckXOpgsICyA0gUP4cc51UVFpyVnP183Gky5p9AM?=
 =?us-ascii?Q?8lsQOYkmmARlg5oGcCzWoUVSQvIlMNK7ZKv7bBGTa+gEZpu7EpE6hhV1JjcZ?=
 =?us-ascii?Q?rg7WxOQHTGrnNz6U6ZMp23tCAagngVn7OsQUyXurNNwZGpDjF7J5OGeCg/hZ?=
 =?us-ascii?Q?+IOkJG8vQCWk6yxUZ7LjqgrRveBTWuxOZwDr4a9dNhYGV8JAE7fVjVG8+zVg?=
 =?us-ascii?Q?csWozuzkcuZTQVi20PIVrmnBYMoZGF970P5PEpqUFBh7MOzB9mhT/Ftvv4+l?=
 =?us-ascii?Q?JqGzzkuZtOoZmWBJd1fEDf1TgFibQBbp5UodPwkFciVBd8kV3BdJ2Q+8WWge?=
 =?us-ascii?Q?jisEqu8JxFFYF+81cahy28rYcCWqCRhSYe4m2XNmc+bu/Fv7v6Xt43Kd/9Rd?=
 =?us-ascii?Q?OIdiBbR7alL7lVZsQB5/2tzL8+4hlBEw+R0KJy7SnKdc+hbPFOFvJyH4qeLt?=
 =?us-ascii?Q?Nw89xfqYh42zfVpa+GtTzUihQeAK8mOHW5JRClZbvGxFOL8v7Xxpdy6XOjFr?=
 =?us-ascii?Q?WBWd5i2QWZansdaSifjH2orPlMlA0UsentfIKZxx/DXMBMOqoNstMgt0yEXR?=
 =?us-ascii?Q?GVW22C1q2Nrq0vj1QbtgKX5t0PJGkXQc5d2Qs0VqyKH/XGQUGdAdcuRtwXN1?=
 =?us-ascii?Q?/2l9W4Df7YoDYplnsHOVKFjGahjyDILPXQEo9PAMdk9JNITlz+4pR8VMKRVJ?=
 =?us-ascii?Q?GKihYipvK5IuAYEYh7d31V96orT4HJnHpmrzD4ktS2cwapUYWEZZRgIFUA1O?=
 =?us-ascii?Q?DaX9qNRJoiMcL7GEvL8uI0kBZcF510IvYg2eSG4LRAs5mjRg0selT5tkb9gh?=
 =?us-ascii?Q?Kl8txJCvIyaG4n3qCI3PLdJWPY49Wq97RLn0xC9/koBPMuvawABqWhodU4s5?=
 =?us-ascii?Q?YvsqBOALhs1dK124c28vJjETHnLxIaDWCdJZzaV/KhnWHwvNLyQu6j9VgCBi?=
 =?us-ascii?Q?tuIvbehroNTDTeoEfqCmN0YylJMPKeXTp0EWBJ6gwwHEP690h/wV6ZyMitMA?=
 =?us-ascii?Q?8c3uV/GsrPjOnnZOwrmaB18c8wksAts9V0kXhuUvfu842vtPqullAcLz2W2c?=
 =?us-ascii?Q?ly5JeHdop1Yz18hLV7ze/AcNYkcFaOvrvXAYeLUWOe4gcMKSi+3Fe3+IzUaU?=
 =?us-ascii?Q?dXna//ywImHbXrXtMJ1obDwHxpsvsVmu+kM1xy3H?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HMig6AabYzyVAz4Pv+0xJ5eYtd+9mZiacAcH+e0evao3BCwFPEh4G7w9X5JujzLX9HDw9EOOrzybAHES9dB/a7qGtOWDmWVG/zSSF6QIKs266n2JIQJNUiUdoHApZVb5S48+wDHmkR/yWhl17Y7zhJZK6FAVV16Ug0WeYu79emgOWSqAm6qAm9hua870/0TjJkdO558mfBSVPHmlQNYkGM7pS2uD1EzWjhLhZblJSXodGS0QfK3txdFgg6oySP/yXSdUkIFk5kdqnwYG4n7KZB/iGuhF1aatF09eJmbdkS392hIQVUL94B6YpDm2vxD5M/o7kMfGOiiLSJ1Y7R8wyuJTCSuS3rSvqi0VJ7NPfOm1D7bWOeP8t42SyKp+NWSPcdmtIyotcyHGJNBq1QESvLT69qXew1VmkVpfQPnOnp1RQFQwDk4kxtxM9FcVpR+qXASYFe+dpAHQ6bX2EPuFD8ChddRQnCh9TH1Ip5ZbtYwYxplAduHsFx5lNA+qVG59qbOF/qjSeROKaoBYpudcxqU2pgK20n4zy8W6MDtk6wiR7KAsmK5mCebWShFJ3PHaI+ZJPGJcBXEX5txC0FFvnb01QIUNTjxAQR6Itsaqa00=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d0be41-81d5-4693-735a-08dd319eea4f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 17:47:56.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAfn/dniLoms5zpK3Z9S9nF01FNbASGGFTrm5zuJFAd+bDxeP8kdMZavOX3wXilDH1suHABfu0ZsGQ/ocumaLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_08,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100138
X-Proofpoint-ORIG-GUID: f2DVC0BbkJw3Yq1e409XkNr1u2b0dnhR
X-Proofpoint-GUID: f2DVC0BbkJw3Yq1e409XkNr1u2b0dnhR

* Suren Baghdasaryan <surenb@google.com> [250108 21:31]:
> To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> object reuse before RCU grace period is over will be detected by
> lock_vma_under_rcu().
> Current checks are sufficient as long as vma is detached before it is
> freed. The only place this is not currently happening is in exit_mmap().
> Add the missing vma_mark_detached() in exit_mmap().
> Another issue which might trick lock_vma_under_rcu() during vma reuse
> is vm_area_dup(), which copies the entire content of the vma into a new
> one, overriding new vma's vm_refcnt and temporarily making it appear as
> attached. This might trick a racing lock_vma_under_rcu() to operate on
> a reused vma if it found the vma before it got reused. To prevent this
> situation, we should ensure that vm_refcnt stays at detached state (0)
> when it is copied and advances to attached state only after it is added
> into the vma tree. Introduce vma_copy() which preserves new vma's
> vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
> state with no current readers when they are freed, lock_vma_under_rcu()
> will not be able to take vm_refcnt after vma got detached even if vma
> is reused.
> Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilitate
> vm_area_struct reuse and will minimize the number of call_rcu() calls.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h               |  2 -
>  include/linux/mm_types.h         | 10 +++--
>  include/linux/slab.h             |  6 ---
>  kernel/fork.c                    | 72 ++++++++++++++++++++------------
>  mm/mmap.c                        |  3 +-
>  mm/vma.c                         | 11 ++---
>  mm/vma.h                         |  2 +-
>  tools/testing/vma/vma_internal.h |  7 +---
>  8 files changed, 59 insertions(+), 54 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1d6b1563b956..a674558e4c05 100644
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
> index 2d83d79d1899..93bfcd0c1fde 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -582,6 +582,12 @@ static inline void *folio_get_private(struct folio *folio)
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
> @@ -695,9 +701,7 @@ struct vm_area_struct {
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
> index 9d9275783cf8..770b973a099c 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>  	return vma;
>  }
>  

There exists a copy_vma() which copies the vma to a new area in the mm
in rmap.  Naming this vma_copy() is confusing :)

It might be better to just put this code in the vm_area_dup() or call it
__vm_area_dup(), or __vma_dup() ?

> +static void vma_copy(const struct vm_area_struct *src, struct vm_area_struct *dest)
> +{
> +	dest->vm_mm = src->vm_mm;
> +	dest->vm_ops = src->vm_ops;
> +	dest->vm_start = src->vm_start;
> +	dest->vm_end = src->vm_end;
> +	dest->anon_vma = src->anon_vma;
> +	dest->vm_pgoff = src->vm_pgoff;
> +	dest->vm_file = src->vm_file;
> +	dest->vm_private_data = src->vm_private_data;
> +	vm_flags_init(dest, src->vm_flags);
> +	memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> +	       sizeof(dest->vm_page_prot));
> +	/*
> +	 * src->shared.rb may be modified concurrently, but the clone
> +	 * will be reinitialized.
> +	 */
> +	data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
> +	memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> +	       sizeof(dest->vm_userfaultfd_ctx));
> +#ifdef CONFIG_ANON_VMA_NAME
> +	dest->anon_name = src->anon_name;
> +#endif
> +#ifdef CONFIG_SWAP
> +	memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> +	       sizeof(dest->swap_readahead_info));
> +#endif
> +#ifndef CONFIG_MMU
> +	dest->vm_region = src->vm_region;
> +#endif
> +#ifdef CONFIG_NUMA
> +	dest->vm_policy = src->vm_policy;
> +#endif
> +}
> +
>  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  {
>  	struct vm_area_struct *new = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
> @@ -458,11 +493,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
> -	/*
> -	 * orig->shared.rb may be modified concurrently, but the clone
> -	 * will be reinitialized.
> -	 */
> -	data_race(memcpy(new, orig, sizeof(*new)));
> +	vma_copy(orig, new);
>  	vma_lock_init(new, true);

I think this suffers from a race still?

That is, we can still race between vm_lock_seq == mm_lock_seq and the
lock acquire, where a free and reuse happens.  In the even that the
reader is caught between the sequence and lock taking, the
vma->vmlock_dep_map may not be replaced and it could see the old lock
(or zero?) and things go bad:

It could try to take vmlock_dep_map == 0 in read mode.

It can take the old lock, detect the refcnt is wrong and release the new
lock.

Thanks,
Liam
