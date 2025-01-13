Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FE347B4;
	Mon, 13 Jan 2025 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781977; cv=fail; b=IuvOTXDTABcw+/wGAUpevUjWVpXqwUgySthBgw5DoXpa4P084/tqCepw0XAqorq0/nMCpzfnsD4iO9/E1Xj9/3UaS0IjbfGS9lMWUCYTYFRaGb1QQAQPYGbSh/Oms/7FHhIJci6QL05RNjTZXxoxynlfJPrih9r3pP+Ymky9j14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781977; c=relaxed/simple;
	bh=vIbup8yj7rp7yzstu2NH4+Qvt9NajOubWtTL4hKCAuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N3DCyeJJkxeTGZWYOb9p/5DA35WGsYlJkYYDe+LVz+pZGvWDXn9u5okSlDm2Qt13FZiudlDOOkUg/Gz0i/NT1H2bZW7M50EBqQ9tiyZ9o2UmHaWpTgbdllGELlLLX0Ko8cyfCzobh8jydT6XEkVc9m5g1PXgalfA22K+tC76Zfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Af8Dpb+3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w2ak5uwF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Af8Dpb+3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w2ak5uwF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFO9OV014105;
	Mon, 13 Jan 2025 15:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=MKAAVeXnUHGRygdckH
	LxMtHfiKl66CD692MJRfUwO/E=; b=Af8Dpb+32q8GrGANpFwW3El609My5/KII/
	SQMTJYmKLRqFAaqme26+D+cdz2KlZ+cPW4nNeSp9W4ae7pZs/+kL/AU8CDwtQI6n
	+ToNrwafV33CSy9tQk4dAF8wg+kELiTDsm/wYggj5+PlIzrfOXzV7aIxs6MfJAjq
	gySBWRSmoSQ/8Ybpd2vk2N8OdA78EUGVCmghVIuvGbJHyNOGGQjq/OPjUKRfRDld
	2UwpvglAWqpBQyE7MoUoRp1iYJPl6WmTe5L54bEXS6sU+uVJL5yUxTS4awB9lr1K
	L36PMTgVScHF2rQJnCni/kRVHcZHi9c4IfMRKk6glzi3YY/qOfZA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gpckvyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 15:25:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDhueu040337;
	Mon, 13 Jan 2025 15:25:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f373mya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 15:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsYFtt4+nt+8JDcJtA1XwAfq2hV5drh8syApFipa89kTepVRwRofNknAlLcf0UwX2IO9ehn/4uxIAs7ky3EwDZnLo6m7xp0O4qupJHzIMDTdbmmTmVTadbFH0RdM6EI4A6Xc8IspGLRmV2ZMCtAsGNqkDpCP2ZhJlyuDBzaqiAlIthSe+vkPVGRYyZTEhsI0PDjY6F7cMOwE+iGRG2jZmxaHg5jWjJCetD0xjyU1s4J9z87LgAK5Qu62JgIZw3ldRM7xngwrP9UlWgwHW8Pft+9/l0jmRGGCC7m22wp/Y15mwoRKzOcrq/OqqN62bVb77FtiRRpPaAK6CkDCzO8L5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKAAVeXnUHGRygdckHLxMtHfiKl66CD692MJRfUwO/E=;
 b=lvG0fEt+pza+L3B9lR9xrqt2EtJEzYBScf/Tc86/hI82C7VRtfJB9NAriJPCZ4iadiUIobaekWN3udDVBhBj3ErOECbGsBRN1RC2qSLQhQ/Y4pgyeaNYYny4N+lMtSv46VPlcUvo/AV+g/A6gBLa8NXYy0M5GzgJeUYX6PaDqdD1OzDJy6BISlsC+FbkAb8Z42DPNFtyd+XYBsXFiX/R7gkh1/9gIyFQr9y9G8aN333gYWkah/pqRoRjW2WMOgon2MSzbjuJJApG4QTW1oxDRcpI0PoaMVSVKpQEIyhZr2TTPZAGdh8LquyXfMVWRvLA1/ix1ukPA1t4r4IBynsZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKAAVeXnUHGRygdckHLxMtHfiKl66CD692MJRfUwO/E=;
 b=w2ak5uwFX71JCoMS0cx2+pVyF6FE3Z4/vtnlGV1XiFeYXSa8TmMwKSAmXfZHTpNwQI03/Ne2LI6Ljluo61Il9BfTPftu0N/msDbvbkPZgj9fT94SMvwW19rMoEfM7Z9bv+B2HZ9n+kan4rWZQax/f+FcP1T+4TsCcBjApH+gRCo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:25:28 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 15:25:27 +0000
Date: Mon, 13 Jan 2025 15:25:24 +0000
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
Subject: Re: [PATCH v9 07/17] mm: allow
 vma_start_read_locked/vma_start_read_locked_nested to fail
Message-ID: <038aaebd-264a-4e64-8777-4c4015401097@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-8-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-8-surenb@google.com>
X-ClientProxiedBy: LO4P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MN2PR10MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 535e6d9d-3c12-4cc6-3797-08dd33e681e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ORhwesnunVx5VcLDPtZPy6sV9jzQq1mVZtIR9Iy8C1DyMO0iCPGXqn8YKlF/?=
 =?us-ascii?Q?ASYWKt1djg07nt0gg0koAOaJcyhqXtmbE3SMIaaMdx4F9J5NoZ0lK44YV51t?=
 =?us-ascii?Q?LX6WnQBpZTErXIpEoZdd1UAwsSAHhWRN78xkxkUhqX1cx7hL4GfMvWyTa8jB?=
 =?us-ascii?Q?XKgRaP2rQ2zcaYUVOSGT/DygZaREEQz0/kfrSUxjkOuFKD/gBDZCeiCOKo4y?=
 =?us-ascii?Q?meJgKym0yIHhGlcDGszrpFZRfMmCRJhOB4SkmnJL+348ksDXjiBEalu1j6SE?=
 =?us-ascii?Q?U8CJMRgpXBCNp/5dsGc7frZBfGSMU5DKftYtj5dCf7r6zLCQ9Ofomp9F18Gl?=
 =?us-ascii?Q?wQR7zQVTuDr3gHcYBg5rXtG8n+gSeztBrIvre2mbTKwrzn+rnCV9kMpJDsb1?=
 =?us-ascii?Q?fqnGENrX8uk/PS21S4/3K9fYzeoE4QbXYLqWZvu4SgYblPnjIi5OjAQ/Qztz?=
 =?us-ascii?Q?4pDgLRXj1O7Os98oPctP1Yti5Zdsg3KZO/zjVAjp5d8Sv//bMvUqGKMKWsGD?=
 =?us-ascii?Q?s3++YVfA0S9k7+biBR+ziFoL4LcuoDFvQR8ewOqjXCGCa2QxoXCaWCnUF1n8?=
 =?us-ascii?Q?1bS0RsyDgSoTSn/6DqHBulCeXfgf0Tfzf3wi8CGkRZrPd5CDl62nhI9h3rY4?=
 =?us-ascii?Q?V9j5w3xbnbLoJ2twWYbVeqosvU4OzVa78olNAROsMs7X0WS11lmpowLFtW7r?=
 =?us-ascii?Q?mtm8xyQGFx3SnKivpz3ohV8gMD+/BqhRcETq/0f29FFSDe6RHqJg8gQdAvdl?=
 =?us-ascii?Q?hPZwX3mM9oKAWzpr4+JPq0HnU2LmhcZGple7vstEJWXW39tko6lfLdwv9tFC?=
 =?us-ascii?Q?+ZICG4fG7E/UebivbcCp8e8W7wBFDQsiHi0imh5Za6VP3q5EBPzfGBIyecqz?=
 =?us-ascii?Q?V6ojBJ309g1SrO5yU/i2XjTwjTqaIR75yGuCFTbXVqCN0IDgHTvmRTpbCuLp?=
 =?us-ascii?Q?pUTr7lAT8FhSC39vQAwFkj09x7fV9DL4q41ZnYcCgzyUzxbpNKQTXe1o4IHv?=
 =?us-ascii?Q?f3AmRkMe07yrPsYghKpwQymsnwmGnSk0AjTDtH1tTwOUsZhVHC+Vpvc/17BU?=
 =?us-ascii?Q?/9AjwD2LhGF+8myC14lWALTEhwrG/jgPPMsvHJ88Uo6adqJUH/2RDIrB69ES?=
 =?us-ascii?Q?EO/+y/NDhyaEHgfrR73kvBrtVud3e31JWsRNLKfdxDp4w7LebmrJku1NB8kN?=
 =?us-ascii?Q?vd/+K6q292YU4WVOINbFDZ62sEFs0GkOmPfm8uv5vpt97HMqZOPKJ6ZPFAH3?=
 =?us-ascii?Q?DUwTFj9fMdj3fViv9T2visj173Qwok1pPiM3VhL2rvCuDQoEvWgQIgFbwGRN?=
 =?us-ascii?Q?jppkdWoW+ope7QAA3L9WA1YfSVIsUlBoz17ehtu65F7kbGXHNwZhTZ6tLmMK?=
 =?us-ascii?Q?udXvVFEn1qY9eUVoIBnG1qyR4GOQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OCy3HPi6tubglyEMmQFKe4p8GDG++VMow2FRkNBuR3sdZK3eNk5BqdMJIyY7?=
 =?us-ascii?Q?F+2zVJ+SGptRDtqJ9iK6VvEpijDMSHDpUugCyqkbu2CSdU3eWMeHoUYJsRQY?=
 =?us-ascii?Q?jl+BcjBq01s674E1ALKCXfhRiodvGwPcJTipTocn8b18Zcj9b/iJgulptR15?=
 =?us-ascii?Q?1ZriXQxhJnm8LclvazncRKXzU5nEY56DEsoMvWIN7TUE36niYc/bNGdDRY4q?=
 =?us-ascii?Q?0TtgfR8Lf+CN45zk4bwnVD9g62nHh3Dhh0c88muki51GmnER4uhR2axEdc4s?=
 =?us-ascii?Q?Kdc2+qUapufHxyMEIUSrZNYHyEkxxQHj6XB4myHV73uOEXGVAR/zQELoLl0n?=
 =?us-ascii?Q?g0Y9jSeC8YBonGV+Lf72Ebf0a0qz1e2qXAVPlobFWO+N/AELyy9EUEQ9AxeP?=
 =?us-ascii?Q?/YrKrpSMZFfQsV5RFQ06PtumsOGTsOtSwjeYbwxH96bgWam/2YRJ12YDE5+h?=
 =?us-ascii?Q?ppwAdb4Uh71FjvFihWQfU+SmRYLs+dSN14fDDFEh2OIZKbMuyTKaiQGIBjp5?=
 =?us-ascii?Q?yBMa62d9bIaZjADTfl9YnHKnH28oGPwFCTwspefHvBdtkN8Jv5Eof/GxfaRe?=
 =?us-ascii?Q?FmiYS3Nbdit1yyt99zEYPVqJCbMOB33Uaal678iuCahJQXJPulPEXQVRr8ON?=
 =?us-ascii?Q?IE1UDtBkFekccVkx6S6BwZ1xRtr+dWMQzyTpiT/QyCcQVnHX199ipcpFguJM?=
 =?us-ascii?Q?9KQrU7czo/QWTrBtNcENOsUhFXhVeKNj+wQFKAzgPaPk1R11v5aaHPL9arpg?=
 =?us-ascii?Q?bDjZ+WRtQ5s/OzVAe9FuycAQz2pm1jnthMNr/k7vSIUNAFfXwbTKLjaLBCyS?=
 =?us-ascii?Q?SbGwD2T+aztTjNQ0gpCMGJTDdEiJ4sUsgXFTqM2+IZ6r5iDWv7VYz0DlBvwR?=
 =?us-ascii?Q?UvZp5CrAD8DZnef8Xws5vue4HFbSThLVacL8p9rySmpLPmako6BjoI/VTV4v?=
 =?us-ascii?Q?xqlcQJsH7L4ZjXtcT2Ead1pyIR8M0K9TrU/DGvGG+eRkBoArb9peqkMorSzw?=
 =?us-ascii?Q?sc1pQB+P01uXMjx8gkkNMp3qGB73iFvSInidyw2MrEJGKs3vata9vPNroOVJ?=
 =?us-ascii?Q?ri81f82ZCEo/AiIvMPLSwP+UXktt6PxnCE75wLHHieGNFy+69jx4syowQBzd?=
 =?us-ascii?Q?3A6RNuxTcaAiOCxq27BdjpEYWmsRDdX0lUzwNPXmL7A2IGy6HhVmg2tABRkN?=
 =?us-ascii?Q?E/tnDMg5kU4FP6/+g+0CRRBFluq1WHJflqDmIy5xFUnppv3jbrVaoUJaL3tH?=
 =?us-ascii?Q?nKR+l0zWCk9w+Fu5waa6WLrqwHSikcA72GyoPmBv8/hQWoYnSwF1I0MfKNtP?=
 =?us-ascii?Q?wJZefkzNjRRB3HuMDc0khNEbWzoAGcWOOr6ecFa8xQDENznnV3NhjUFehOcl?=
 =?us-ascii?Q?2eJ33wSbAzNrBsa3f8rlxCwXzo6svkvdnwEaT2+/x6AxHBYpmLV53VPHn5wE?=
 =?us-ascii?Q?bNCuyzDKWl2C2IY9gH8EaTT9mxPjOSPii6WvHmGfyCvcc7YmdRrJ5DIRw9Kf?=
 =?us-ascii?Q?l/HH+lpuDXq9FAICEGM/oJ4a8RSLGHa0rXJbQHyPW8/veuuqE8UNjWbUAGes?=
 =?us-ascii?Q?dvZIRvu6taT0gE3EMfQa99zNhd7pmDzpL3rK9o+FpJApNmIGRI0UO3lN4g6e?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Eg2kQFC6Od8Ezgy1v2YmMAf0753oY1XklGy7hPGJAeMzMG4qL3C17vN/o5DfAqjU+J8uLF+WR4bkm0ccr/k5jbt9MwEJArd2SzC7oK6iv6/Vw7Dpdy7JyTFF6qaG23Yg2tBvpjvd+fksN45Q3p1/WCdK/AebQuxJiUjCs81+SXnGGchArZqUJiF0lxBSaMW7UBEPqVBPJD2CwrzFax5iEoMUNe6khbGRgvuB/0G83CGTCjGMO2ojAFYExG6YLsjbGAVNemVdqw92KN9bbGiSXdq1+bYoJdcqGXwQjgJj9ia816VquBHKI2OY+pD6SUGkG21aUEc5Lct73rGpEIeBKO0g6TWciGzQO/ZFpIfJLLvpfGbnwL+JT8qVSrzMB+xrwZWCx222iWryTTYuwuK/q9Coy4Ml4drLC3kbai1JtiVnZhAeC5yPNROOX4gUiX4Z1/3j77HKkkjdHKjj+IBrYRjnuETC4bSHNTCU+EROd5/1mTUX/Ii8KnGdhB1FmVRfD7wVBTdSfc856qotLu1yw6sQalKK04I6L2YNa8816Xw349oXPJfIQm9jKhEVSnPj6oEfyuRj+k2+xYY23uTE+bAd0IKONj2jjaZ5QJshyUE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535e6d9d-3c12-4cc6-3797-08dd33e681e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:25:27.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADkmos495u/EFmRdADvgB3VZYZ5gaDhfOqEjP6iLE+SKyC6/JMqJFB9G56pRTn+fCy4CDzWG9JspL3ZXCzFDpvftHhMfR8YdFlLH51umH1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130128
X-Proofpoint-GUID: 8FW8r4LYKWf6jLXB_dYd_mXn9BBLSxsc
X-Proofpoint-ORIG-GUID: 8FW8r4LYKWf6jLXB_dYd_mXn9BBLSxsc

On Fri, Jan 10, 2025 at 08:25:54PM -0800, Suren Baghdasaryan wrote:
> With upcoming replacement of vm_lock with vm_refcnt, we need to handle a
> possibility of vma_start_read_locked/vma_start_read_locked_nested failing
> due to refcount overflow. Prepare for such possibility by changing these
> APIs and adjusting their users.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> ---
>  include/linux/mm.h |  6 ++++--
>  mm/userfaultfd.c   | 18 +++++++++++++-----
>  2 files changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 2f805f1a0176..cbb4e3dbbaed 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -747,10 +747,11 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>   * not be used in such cases because it might fail due to mm_lock_seq overflow.
>   * This functionality is used to obtain vma read lock and drop the mmap read lock.
>   */
> -static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> +static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
>  {
>  	mmap_assert_locked(vma->vm_mm);
>  	down_read_nested(&vma->vm_lock.lock, subclass);
> +	return true;
>  }
>
>  /*
> @@ -759,10 +760,11 @@ static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int
>   * not be used in such cases because it might fail due to mm_lock_seq overflow.
>   * This functionality is used to obtain vma read lock and drop the mmap read lock.
>   */
> -static inline void vma_start_read_locked(struct vm_area_struct *vma)
> +static inline bool vma_start_read_locked(struct vm_area_struct *vma)
>  {
>  	mmap_assert_locked(vma->vm_mm);
>  	down_read(&vma->vm_lock.lock);
> +	return true;
>  }
>
>  static inline void vma_end_read(struct vm_area_struct *vma)
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 4527c385935b..411a663932c4 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -85,7 +85,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
>  	mmap_read_lock(mm);
>  	vma = find_vma_and_prepare_anon(mm, address);
>  	if (!IS_ERR(vma))
> -		vma_start_read_locked(vma);
> +		if (!vma_start_read_locked(vma))
> +			vma = ERR_PTR(-EAGAIN);

Nit but this kind of reads a bit weirdly now:

	if (!IS_ERR(vma))
		if (!vma_start_read_locked(vma))
			vma = ERR_PTR(-EAGAIN);

Wouldn't this be nicer as:

	if (!IS_ERR(vma) && !vma_start_read_locked(vma))
		vma = ERR_PTR(-EAGAIN);

On the other hand, this embeds an action in an expression, but then it sort of
still looks weird.

	if (!IS_ERR(vma)) {
		bool ok = vma_start_read_locked(vma);

		if (!ok)
			vma = ERR_PTR(-EAGAIN);
	}

This makes me wonder, now yes, we are truly bikeshedding, sorry, but maybe we
could just have vma_start_read_locked return a VMA pointer that could be an
error?

Then this becomes:

	if (!IS_ERR(vma))
		vma = vma_start_read_locked(vma);

>
>  	mmap_read_unlock(mm);
>  	return vma;
> @@ -1483,10 +1484,17 @@ static int uffd_move_lock(struct mm_struct *mm,
>  	mmap_read_lock(mm);
>  	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
>  	if (!err) {
> -		vma_start_read_locked(*dst_vmap);
> -		if (*dst_vmap != *src_vmap)
> -			vma_start_read_locked_nested(*src_vmap,
> -						SINGLE_DEPTH_NESTING);
> +		if (vma_start_read_locked(*dst_vmap)) {
> +			if (*dst_vmap != *src_vmap) {
> +				if (!vma_start_read_locked_nested(*src_vmap,
> +							SINGLE_DEPTH_NESTING)) {
> +					vma_end_read(*dst_vmap);

Hmm, why do we end read if the lock failed here but not above?

> +					err = -EAGAIN;
> +				}
> +			}
> +		} else {
> +			err = -EAGAIN;
> +		}
>  	}

This whole block is really ugly now, this really needs refactoring.

How about (on assumption the vma_end_read() is correct):


	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
	if (err)
		goto out;

	if (!vma_start_read_locked(*dst_vmap)) {
		err = -EAGAIN;
		goto out;
	}

	/* Nothing further to do. */
	if (*dst_vmap == *src_vmap)
		goto out;

	if (!vma_start_read_locked_nested(*src_vmap,
				SINGLE_DEPTH_NESTING)) {
		vma_end_read(*dst_vmap);
		err = -EAGAIN;
	}

out:
	mmap_read_unlock(mm);
	return err;
}

>  	mmap_read_unlock(mm);
>  	return err;
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
