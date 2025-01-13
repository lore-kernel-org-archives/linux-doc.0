Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6212045AE;
	Mon, 13 Jan 2025 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770518; cv=fail; b=GrzB7qAgdKk/+V9OY78Ojv8TdxpDIukXD6MOLZLpl4KBchV91pLOok+PyPhIgqdOLz2VUVEWmD4J1rJ0BBA4kH+EdYP+DpKQEqEvpT5TIvV3Vy5Y8ruBu2L2TgaD055Vy3OpxUf5KairnnloLoTvyDv73tXg7niv7E3UiLyz8qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770518; c=relaxed/simple;
	bh=DAYeiSNzketEutXB1ubvEg192oum5Z4rDV9/Yk/JzR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M6Mqy0XNoWGeFPckR5pso5vBvGpGTKRHtJ4c9f8qkd5Yi72b5J6U0WSOtVCiAXtVJCKVI72CI33mXV/ZWLxW2PFiBxKHu2mej+Ubxpy1JVXrNIn13L4A+x4OkJHz8mf7T0UsedmvURQXqRsPNBsg4M87czEgN3fv7ebdZeffM0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sril/q/9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eN0yz+bg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sril/q/9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eN0yz+bg"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBBhb6006845;
	Mon, 13 Jan 2025 12:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WJdozprrP7GDZKcuJH
	wpXY2g6hBCuvXZQvqFY60r25s=; b=Sril/q/9TfxNiWk9819EQKHV0jiKPtodRm
	omili4KPKgjlmZT8dZaiC77IAQcs1V8JWjYM9lUGjJVxuEgiCir0QWoWs+R4ZPMI
	jOVo6pM8bKYpiOUCCx757SOdVevVB1pFDoZGD7RdvIvPi8kVT24myvFDkhdApR15
	n44sF8C41aSLEW/xIhfG33cfaIqA4fjs9mb/3pwKDQlFC4XB/g5/d2/qxOM70GW0
	12vVYna7dXYWKHo6ZjCuuH94BQcMfaNaKPuNQib5SQtOBrgGQXjJr5LV4mrplzwP
	KqQFHkN+BJpNdEoWcaN6iY+Q6QRXFr4p8pfpz2p6z/8dF9GYoxlQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y3f4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 12:14:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DAD3ac034885;
	Mon, 13 Jan 2025 12:14:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f36wnpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 12:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfTQYSzoLm8DExV/H6VhfC9QVA6aa6BvCGUGrYsjCqUypDdXOE6+H8ZNY30CnE4Luqae0l42s50AeXfglWDC3nAMniAdPvyAdM1GZzB1m6i95Occ+Dk9st/PoJfr6K/HbhpCWqh3+dHaYINvkTx9IES/ZqWBmR+cExfV0NXdS+rNEQT0kZ2YFZ8MVQakJrn6zppivBswPqETaIbECRRIDTZOi3pXuYWSvNoKagsy5THXDSk59oouoHfnQSUj2PGH/vp2vaHxSgiH2kmUa+mhKTAkBabydtt5ytcB6t6IOdfWlr30yUCj7uLEzZrjUfIsWHwk5/V/enjdV9iUyiOGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJdozprrP7GDZKcuJHwpXY2g6hBCuvXZQvqFY60r25s=;
 b=XZx71jfIqZRTtqC67YBjDpEFP7Fg1UhsZeB7N55qOLxIZmXxUt57dmOro8xAm/OFDTBDeKtxQjnWK26WeckExGIhaINqdXIJSl+QnnwtSspYc99pBo/iV6qNz3L5LOgu5n8fgYj69Be5dJeFr01vCrL8MevY52moEmk/vaZP3pu9A8FY/XZZDcqAeepVRXNidH/r/u8+svD25NufzMWks7T48ePj7nTF1Nq4m6Zd/yEvVqDP+T3D5YSa9IIZWWCuTa0Khg4QYA8sLnhGyv4JjQhD0trxcw+NZW4YqGV1neV6g6qocl7zD9pvC4VddmuE3vOyg4WI9eqDaaOhdbUn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJdozprrP7GDZKcuJHwpXY2g6hBCuvXZQvqFY60r25s=;
 b=eN0yz+bgAL6asvauZq4E+yl/UpRU0Vdk9vZGutFeyNNYk/rdR2+n7A8km8aDgr/oUuHuNsjHTq1/a9iKPIuXQQZvCzq7/mK+QmTwF7dY5jJVnQXKrDE6xzzO7l+R6pS4j3kDzoaYgAf7BoV0T4oZl9mmpSsuDKranHBAEV2Z5w8=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 12:14:23 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 12:14:23 +0000
Date: Mon, 13 Jan 2025 12:14:19 +0000
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
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
Message-ID: <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
X-ClientProxiedBy: LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|BLAPR10MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: ec99612d-f365-4f90-0ec4-08dd33cbd082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9UM36hNNeOXWylTzVufpsokpk2aj7CjckBc/9V4GBZQpYOKTioaZcl0zuEoL?=
 =?us-ascii?Q?/O9w5i+xRnTcQzURzI7eItbZpPTDZPl18hYLyes2Zh2+trzS2AGXmUB6EIbW?=
 =?us-ascii?Q?VJuvqUwPdjfg14FRUKFmAVI3Uz3ONNyP4euW9MvuvXyFvbq1YmXw/WSpU4AR?=
 =?us-ascii?Q?JzbCGdu0xMFyhffw7kzhcswGz77LmrZNZ5Tm/6YYa03bSk+Ye5ateyXeVQQW?=
 =?us-ascii?Q?sxSibyMeBqQhe+qej88VfdxAFpewr/tdhMQbnfyebPpl5DK2Vzwvy28KsSNb?=
 =?us-ascii?Q?dVHyGw+uIC5FzfbdIJaK7NX9m30UjVg3LamDZB4lTC3l0/A6Q6a83sjcLTvl?=
 =?us-ascii?Q?eZ7hkAAtX910rR9HBt/ZSnioisd10hlc2wjkVQD/0RqvzE0AB/Nf1aBlGWmT?=
 =?us-ascii?Q?TKa8uXmIQOZyK2r6SiS7WJ6V0OwsqbVPjgqV07Xe9+HwTYcjf11OI+tYAMKx?=
 =?us-ascii?Q?wGhCNDwa4iyGXVMB9jo8m1F47x/7AkQGwBB9Z7ynlQCWK9NSbEs5CdQ+y3gG?=
 =?us-ascii?Q?GpwWXHzzWw0EfzC9Oc0+8hJUT3xIzb5qw/fW/kk3Xq0s9Rn4UPA5g3moD9bL?=
 =?us-ascii?Q?SF10Ga1K4NQn41VP4lluykN9cnvaBHN6wVtysyuUbZ4/KUPrhC3joj3X3TmV?=
 =?us-ascii?Q?hkKKEZv8V64l6HlUVPgi98MQ/OG5Y4DRZVfUN1yabP9stCJESIu99kjCHRT/?=
 =?us-ascii?Q?oWVA4BxL0ItIk1u/DUw0xFd62KgfwfxMkFamKZuX+uNzPm4sHJ4txTluS3DW?=
 =?us-ascii?Q?RFReyiE91qsrZzczpOsXU3fQRjJVQUjgADe3FdJPrE12Z/uZIQzKbApTCYsb?=
 =?us-ascii?Q?ArTt4dl0rZkrVxmaGom2rIRDrz9S+whqQoVbyvx0Atm6B3GgwHF2/8/n9COm?=
 =?us-ascii?Q?DQ48O+yMl311WwfvbCEHiAAzqX/AOorNcPLgKNcb5XWhsmkdVXM7uOvShZ51?=
 =?us-ascii?Q?W6umGngIzgPCt9ZkJZjOXT8ABoWfmZaKByl54RxdURS+VTu60oAIlCNq7ojo?=
 =?us-ascii?Q?x7Eu3TyAyklMOtd1MD79LR5Nd6MWZA65w4u1Uv/Tqj8/QGCHp+jSNwJLQV8r?=
 =?us-ascii?Q?Nrjuqodyhll9Ipp9if/2RzSXKfXqCnIVCy6yxTT/ExTo3dzZW3Kdw95VcXUT?=
 =?us-ascii?Q?qxISpSCfRiltbM3lFzK7RsRmDw9TBOk02abiosQLN8N5j6ht4XkPHcpRTqUC?=
 =?us-ascii?Q?3y3S5GqfYSkWjK1+3JQQjMc4yjTfKbVMP8fHB5oZUz0xpJz8/UMuBvM2v/Sb?=
 =?us-ascii?Q?jgC9pF7Fxxaouy6PL4zI+U2Ez2OJN+nwVAFNj1shFkuwlatdsWQDOqKj8b5k?=
 =?us-ascii?Q?qFN5MySYwD3uxv0J+WBDboVeT7mloi8FBXIU824MIeauAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/DbvgggnLRX3n4jeBVD3qYUFkYORzVdrNAbOR9nMJBB9gsGwMX0nDwdWTXK3?=
 =?us-ascii?Q?62jl0DRozJoDgnPtdABsDUjzM0oO/aft2x+6IhKlaxEixq7+sRrk9/xih03i?=
 =?us-ascii?Q?woUdqT73ja9ORYT1ufx2Yxnxp7rCdEsx9TfwHSjrdTpVXkJLAGxhS5Iq+vaq?=
 =?us-ascii?Q?GEDOV7ig5qOjvzZGJinLfab/SHrKUcZKZRpyLN8LfEK92/n4Lv8MWJiEXLXP?=
 =?us-ascii?Q?fLJrR3jca5Vkg+V0WZu26cuxzo974vnC6bDJ+HLLAQzZm3g0j6TiI+9PEcrG?=
 =?us-ascii?Q?GtMB20jIGQkcaaqKWUut8wCnwbijtxQRf/6hSIoSD3nCyM58opY+7PZb9MhU?=
 =?us-ascii?Q?+eoQq8fMbpxvj0fOefuZ1vO/4SYES9ZtjaLj3dmk5upsOeYtDERqGye8jFp0?=
 =?us-ascii?Q?3BsJ6tLWB450ApRhNtTy3N2IeQoiOikimVPR7m61IE5gKRABMh0H9YfhIYxv?=
 =?us-ascii?Q?pIJCGqh+7/vEe2a6m4xdPKNWRHsECClBcReNMty9MnD5/y/3BqzGF08uFh8R?=
 =?us-ascii?Q?p5OXNz2L8wc52N9tZylHlAY3j/q5PB0ld3bhbM3BLc+OnJroE0j4S2FawoXp?=
 =?us-ascii?Q?tiDMppEZ8m/IyP7mMvAf9cuXtZ1VEYDuHTgYo++/L9+zr1P+abLelw6rgsfu?=
 =?us-ascii?Q?T+qPAG7MnvioLAxBLyCxRdUM2iAKXirEUXzvkmNA7vCow0OT1k1MDUsrJGkQ?=
 =?us-ascii?Q?vj1U61zG6syl04oWuIrmhFvtDg4/Icys7Gj0Qblw/yhY0VwD4POyEmW2BWAb?=
 =?us-ascii?Q?w2BjDn/7NDzqiiVEZywqBSgLH/g4asMt6MTIfQMQBJR+RvQussIKk/0Iuy0q?=
 =?us-ascii?Q?66LALM4RtSCBeSschQkNkymeJFCKjyqlISrSNVwx7j+QVhTB1L8Y17nsCqoU?=
 =?us-ascii?Q?9AEI8mdI7k0cPXfFJV7zMZaR/4agB15qYBiDG62+a1DuTkVO/fSKxW4mt2op?=
 =?us-ascii?Q?tyQb2Y96SKvaTh+wdXvDS19M0bY7l0mjZBphYrjgK2i5pfPd7aSofY8NgFum?=
 =?us-ascii?Q?ZmeLfBOnGQN5rmrubRpDqvj/CNe7JxNZ2rz07sCbkc3bevgnR9l5ZN6HE2qK?=
 =?us-ascii?Q?6XP+nhcrWPXwzCKYl1Rg72y4kPPAlr4YUT65C8gB9PrjgGm5qyQ8wm1tGAbC?=
 =?us-ascii?Q?qdAMICzv7XoWBU3TRpMPUfQf9DURIiUgleg3S474CuWXvRUm9uTtXfEopUjY?=
 =?us-ascii?Q?ZlX2Jorkz5bT7D+m14XemO2GJRbXtkntZWv4dbdSFcaHMtahIJ13FeWtj5zv?=
 =?us-ascii?Q?Hcuxzv7MiuqhSwDmNXKn8JtEfs3BtlOrLLHOcBeAqcCmg5uATOh5xKKH+kkC?=
 =?us-ascii?Q?7AfA7hMHfAV64CWOdxWdGgtlssY/7M57u6KA61oc4izRc9jmlPgu+VZd0+as?=
 =?us-ascii?Q?kZKAidzz1M1reZbA6KSqnQC+7bNnonQ4DiAz01o+q+FvAIGC+v3pD+IgwpZJ?=
 =?us-ascii?Q?LvAKVqvKOXMt9BQoBvb/k5S3cRxrVy3/e3JcxdGhUqoFy/KLs63TxfidcKbs?=
 =?us-ascii?Q?5ErcS1l6SuCEua4tTJ6I4Lmjv+8/d05UrgMad93G3NlzKd7Uexwtm+M1YArV?=
 =?us-ascii?Q?REycK+t5FsxwnmGnJxu+2uZqPyTK7i6eGypooljP41YFcXu64fmg0n9a1bI5?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qhwEj9Uh8nt61VtWSFwTj5vg+JC96dgczW4aoHnGjKKwCES7KQmIiHY5hK3v0YRr1FWC4OCecZ/GJBh/ltnsPKtLRrjdcHbUCfYVPv7+8FOT7nIyQZPAlyS4cV4GLIjZgFG7jlpE/njHcyk9L42I3Hs7hVoVAwwK86+yoa8nBoZpeL/2O8zIcPdBeCZ9Edk4zpoUBlsOsmmm6u3b52pnOhZ4UoDYtSV7kk4HEMkS5mrLoHpFRbORg6CB+aM19Wj91lcC5KVmPda72Sfd5ctXMpNWIokekEpVGs+0NZQfb+i1EuMhjvNwVgospr4S8TKAP27XR3ihlSBmD3n5zmHhG5kRICVBrY5ddHvBN+0PsGApArFuKUanTT8CIgKBctNxwtus3vWNBAkN1evQpS/7zkkq4iBgpjrjW/olo4KwtqSAzRRdHBAFGtZ4nejUq7jihUIct+olrw0t5sWF3CRPFS1rqX5Wi+s68aYzv1QKFOYhUuomwitlfQBkl6eb6kEGwCQ+Zi1Rpv2lM+fZAyVDKLwynbl9YyF1bY2581HGyK4/Js75jVivxV/2d/aKDcNfQ+soNZareiZuFeAZxl9YsLUa8uTqbEt2EYyvtCE1wYg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec99612d-f365-4f90-0ec4-08dd33cbd082
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 12:14:22.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MvbLQsZhPXUbyr6yBxSibwpdUZBfYJQVRpuyLEGMvqPVSfQexEgR2w2pkzCZVWv7XJwiIQFwf4Xp4E9ug3dWRERlDcOHmlwjxiW117wGZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5009
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_04,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130103
X-Proofpoint-ORIG-GUID: rsz7AHSeGXFU22r9yp9KPRx0rwJ5MUbI
X-Proofpoint-GUID: rsz7AHSeGXFU22r9yp9KPRx0rwJ5MUbI

A nit on subject, I mean this is part of what this series does, and hey -
we have only so much text to put in here - but isn't this both
reimplementing per-VMA lock as a refcount _and_ importantly allocating VMAs
using the RCU typesafe mechanism?

Do we have to do both in one series? Can we split this out? I mean maybe
that's just churny and unnecessary, but to me this series is 'allocate VMAs
RCU safe and refcount VMA lock' or something like this. Maybe this is
nitty... but still :)

One general comment here - this is a really major change in how this stuff
works, and yet I don't see any tests anywhere in the series.

I know it's tricky to write tests for this, but the new VMA testing
environment should make it possible to test a _lot_ more than we previously
could.

However due to some (*ahem*) interesting distribution of where functions
are, most notably stuff in kernel/fork.c, I guess we can't test
_everything_ there effectively.

But I do feel like we should be able to do better than having absolutely no
testing added for this?

I think there's definitely quite a bit you could test now, at least in
asserting fundamentals in tools/testing/vma/vma.c.

This can cover at least detached state asserts in various scenarios.

But that won't cover off the really gnarly stuff here around RCU slab
allocation, and determining precisely how to test that in a sensible way is
maybe less clear.

But I'd like to see _something_ here please, this is more or less
fundamentally changing how all VMAs are allocated and to just have nothing
feels unfortunate.

I'm already nervous because we've hit issues coming up to v9 and we're not
100% sure if a recent syzkaller is related to these changes or not, I'm not
sure how much we can get assurances with tests but I'd like something.

Thanks!

On Fri, Jan 10, 2025 at 08:25:47PM -0800, Suren Baghdasaryan wrote:
> Back when per-vma locks were introduces, vm_lock was moved out of
> vm_area_struct in [1] because of the performance regression caused by
> false cacheline sharing. Recent investigation [2] revealed that the
> regressions is limited to a rather old Broadwell microarchitecture and
> even there it can be mitigated by disabling adjacent cacheline
> prefetching, see [3].
> Splitting single logical structure into multiple ones leads to more
> complicated management, extra pointer dereferences and overall less
> maintainable code. When that split-away part is a lock, it complicates
> things even further. With no performance benefits, there are no reasons
> for this split. Merging the vm_lock back into vm_area_struct also allows
> vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> This patchset:
> 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> boundary and changing the cache to be cacheline-aligned to minimize
> cacheline sharing;
> 2. changes vm_area_struct initialization to mark new vma as detached until
> it is inserted into vma tree;
> 3. replaces vm_lock and vma->detached flag with a reference counter;
> 4. regroups vm_area_struct members to fit them into 3 cachelines;
> 5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
> reuse and to minimize call_rcu() calls.
>
> Pagefault microbenchmarks show performance improvement:
> Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
> Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
> Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
> Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
> Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
> Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
> Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
> Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
> Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
> Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
> Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
> Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
> Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
> Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
> Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
> Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*
>
> Changes since v8 [4]:
> - Change subject for the cover letter, per Vlastimil Babka
> - Added Reviewed-by and Acked-by, per Vlastimil Babka
> - Added static check for no-limit case in __refcount_add_not_zero_limited,
> per David Laight
> - Fixed vma_refcount_put() to call rwsem_release() unconditionally,
> per Hillf Danton and Vlastimil Babka
> - Use a copy of vma->vm_mm in vma_refcount_put() in case vma is freed from
> under us, per Vlastimil Babka
> - Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read(),
> per Vlastimil Babka
> - Changed __vma_enter_locked() parameter to centralize refcount logic,
> per Vlastimil Babka
> - Amended description in vm_lock replacement patch explaining the effects
> of the patch on vm_area_struct size, per Vlastimil Babka
> - Added vm_area_struct member regrouping patch [5] into the series
> - Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
> - Added a comment for vm_area_struct to update vm_area_init_from() when
> adding new members, per Vlastimil Babka
> - Updated a comment about unstable src->shared.rb when copying a vma in
> vm_area_init_from(), per Vlastimil Babka
>
> [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
> [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
> [4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@google.com/
> [5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.com/
>
> Patchset applies over mm-unstable after reverting v8
> (current SHA range: 235b5129cb7b - 9e6b24c58985)
>
> Suren Baghdasaryan (17):
>   mm: introduce vma_start_read_locked{_nested} helpers
>   mm: move per-vma lock into vm_area_struct
>   mm: mark vma as detached until it's added into vma tree
>   mm: introduce vma_iter_store_attached() to use with attached vmas
>   mm: mark vmas detached upon exit
>   types: move struct rcuwait into types.h
>   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
>   mm: move mmap_init_lock() out of the header file
>   mm: uninline the main body of vma_start_write()
>   refcount: introduce __refcount_{add|inc}_not_zero_limited
>   mm: replace vm_lock and detached flag with a reference count
>   mm: move lesser used vma_area_struct members into the last cacheline
>   mm/debug: print vm_refcnt state when dumping the vma
>   mm: remove extra vma_numab_state_init() call
>   mm: prepare lock_vma_under_rcu() for vma reuse possibility
>   mm: make vma cache SLAB_TYPESAFE_BY_RCU
>   docs/mm: document latest changes to vm_lock
>
>  Documentation/mm/process_addrs.rst |  44 ++++----
>  include/linux/mm.h                 | 156 ++++++++++++++++++++++-------
>  include/linux/mm_types.h           |  75 +++++++-------
>  include/linux/mmap_lock.h          |   6 --
>  include/linux/rcuwait.h            |  13 +--
>  include/linux/refcount.h           |  24 ++++-
>  include/linux/slab.h               |   6 --
>  include/linux/types.h              |  12 +++
>  kernel/fork.c                      | 129 +++++++++++-------------
>  mm/debug.c                         |  12 +++
>  mm/init-mm.c                       |   1 +
>  mm/memory.c                        |  97 ++++++++++++++++--
>  mm/mmap.c                          |   3 +-
>  mm/userfaultfd.c                   |  32 +++---
>  mm/vma.c                           |  23 ++---
>  mm/vma.h                           |  15 ++-
>  tools/testing/vma/linux/atomic.h   |   5 +
>  tools/testing/vma/vma_internal.h   |  93 ++++++++---------
>  18 files changed, 465 insertions(+), 281 deletions(-)
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
