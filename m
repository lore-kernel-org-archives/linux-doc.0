Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A422CF30;
	Mon, 13 Jan 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736769986; cv=fail; b=PKPEt3S3QzjWczirnhZe6K4fO1Niu3tH10TyZDv4ouRA2fc5S1pclFE8QQNfidIUUfueRwvgdh2RYyxaWIXA4Dh+OHXhaL14ciHOcYY39r7ABO/H9+d5NMIgufF8hTt20tG86t3UsyYQmneMCF1vAIn9GUEBTJXr9cEPk6Z+EVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736769986; c=relaxed/simple;
	bh=sKE192Lu/O6cY9QWGw6uVYMT2Q8oEiTDAeG07aMVg0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AjIy1VolsAu43mtpxK4CLZVtQMGHSfrGdGW/1jlhFakhXQDwHrCdqUYDgELzDSJYq/6yv58wtrK2USm7sgmBNCUwoukplhl3yZHPYj7ajcbP6T9Rveqncjvs9KXTv+QfZaDknAzNQ0gpwlJA3PZHIlzwaC3ogypaE0KV7K8RsQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ND4Pk7yo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vaTIU28E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ND4Pk7yo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vaTIU28E"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBBlL0006367;
	Mon, 13 Jan 2025 12:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=A4/vYd96B8CQ3/rYCG
	JzHzuMyBG/TBggaCiPlaokv3I=; b=ND4Pk7yojp7B1DYOqizSoBvdzGky8uLNL2
	Pge91aAzbnSNqSa4saEXAFgzLf57TGs9kgdIwSSb7ZyxxJucl8hlCGkWMtlSH8O7
	tZOnjTwc/ROxKUsffBc9lVXRhzNIB4MT2JCT3MgjB0xvkzOWnqd8Vz4zL4wMscri
	EGQGsNx5EKe67ziylqrLrcSMIbHtMyZflk3HpgHImXn+RtN8wdS9XdaZtO+oR1AC
	ZmwKDo9TNAL9tMWCqYRyhrz1joyDERuJ5Ucu0E3vczWcn3D96pnEeGzDiBURgKJZ
	hoeZolrD8FvKiEjNYlHNHrR4q2ZkRu88DxyMGfPLsIfX0cXuWtUQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gh8uasx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 12:05:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50D9wgVM034807;
	Mon, 13 Jan 2025 12:05:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f36wedq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 12:05:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2iSCAiv+5KNtLrHHWoGGkyMk7l0f1YRfTuTUGTsVounInnc+v8B3G3LWwgoBltJXgV38csaoiCAfTjAl3Ak5D7LNrmPZbNUXcg3bQkbj0lpn/WfpcL0RsoQun2oat3pXv1gB4DQ6r+zGSj+WODn6DnaQbVUuGBaf/vrx1iCMQG//nFwzhSwIDYQsIKhE6bmhlYblVhvmp/0LPs36hUCbYWaVnMiT91BQDaQ334ccGm19CRXABk0d6m8fHTUWlWYKqj8egXZkhCR83s6H+0IhB+mtgwA8SZ9zBVijhTC8g2T5/IlIBlVTKHUCkHYIIFDmSS9np1x330JWNzSyHT6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4/vYd96B8CQ3/rYCGJzHzuMyBG/TBggaCiPlaokv3I=;
 b=JJTZWEw7hyJ9t+6+V+vJclwzt19Pms13t6Yz4LGCTFglxfHxPQ/fqxF69AP7TgMgz0dXDGlBxfq5w0Y+ay9VrMAiu+YE5WnbkO75HIgWvOC3HGDZFutqQxOpU9fwMoU+7Pu7R/I68vw4Mu9Rxq3XZj9xSQmLonGoAAQRf3JoqWpFGeFmWCJJ9XkIDcXZOUQhS9rfCzrDiksWbdk0zdBJDm5c2PagqMgdoxuxjhuPF8m3k2KKBCb5CYhbNLt8dJwVLmPQAk9o2PbtQ1QtnWY7Ji8XXISwbzhbgztBdFGGVHXo2m3OT3Xld5KZgYG8OaYWIUcjPKBWwfT2tsXzeKAS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4/vYd96B8CQ3/rYCGJzHzuMyBG/TBggaCiPlaokv3I=;
 b=vaTIU28Ec3dh/P5b0xCbT364Q82NtVIC0aE3jNpL6ZnkV+FIzl3ZrFkHocNsXQVhCe11j2rNlmVE6WKLBruRIpedYhdS0fGJ2chPf8bBXW6aMQE0bYDHptPx6n0nZU8zxAV6KO1KxbdMEBW3aLVth0GqrF1tz/feLylVHmGlxFQ=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM4PR10MB5917.namprd10.prod.outlook.com (2603:10b6:8:b1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Mon, 13 Jan 2025 12:05:29 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 12:05:29 +0000
Date: Mon, 13 Jan 2025 12:05:26 +0000
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
Subject: Re: [PATCH v9 05/17] mm: mark vmas detached upon exit
Message-ID: <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-6-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-6-surenb@google.com>
X-ClientProxiedBy: LO4P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM4PR10MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: ea002369-62fa-4ecd-f6b2-08dd33ca929a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TJozlz4+RS0GfZxprT61Raud6ehKknTHZJ3kjmF6bzmZZleMkdc8a2VQiT3v?=
 =?us-ascii?Q?OwvDBWjArRtpduAcN86ZnssmfwHiOa624VLzCkZNrq8Rbigc+UJRlnefYwHx?=
 =?us-ascii?Q?0p+utq6dHHpNwYviyDr/M8O3a/t9/yoLFMv6uFR/gjqW8oY6X1lGVqSbS5Rx?=
 =?us-ascii?Q?X3V1phVNZw0pKQAlriSErB5KT1AEkir8E9jtMOFttuPxa+LvM+a/0JaKu8Uu?=
 =?us-ascii?Q?Bx7Ikr6wDZl2fReDDD8hM+WSeFSiwai6tSkZxM48cHhVTVJ7dmPGRfF0tWpa?=
 =?us-ascii?Q?/kSO+OGuRkTC50OpGtSKhNu+2/z/6ivv8c0sZiEt66VMN+rBtWHtRUZKQ4ez?=
 =?us-ascii?Q?GcJgRENkeyeDlwRjRO+zdv5djTmD78u57c5GwSEcSwk3VYiecMUcA2Upqlbw?=
 =?us-ascii?Q?HJ74z3Alym5asKvX8qdF5CGvUnFhYZlfBRX+Uy4qpMXKvCG41jx9rBk2nwX6?=
 =?us-ascii?Q?UH3MzPaiLhAzXYGL0XieGSy3aWuGyyXWprhDCfnfpqmjuVAO0umWdtyvT3i/?=
 =?us-ascii?Q?jSFw67UIuRX+z+Fay+wlZiAFpVo7Oog8ZNSpffrLArOUDkfPlagBhUtU3Ydh?=
 =?us-ascii?Q?JxHio7jWgoOgowyju/eKIL13vaGJFbg632j8wJFL/f+vdURr3qei65eooXQA?=
 =?us-ascii?Q?qNUyfwDyfITOQChRwutPNdQ5czDYSaNZ1rmbYNeMYTaguTEOMiJraZgOQzzE?=
 =?us-ascii?Q?2yA/WFbnXeMW2/X2zrlYDVvzB4Km4aVXIp61NVotIhVSJwJQt/sICnm6o++h?=
 =?us-ascii?Q?TluW/tPCKWYVAh+GMRH9nJ8sGKbCsf/0AaTVgCQ4L88U7YqyVWD2kO31P8dr?=
 =?us-ascii?Q?IkwnwO5H7TW3YjSTFNgRfSvrnpB8ctfwNP0CkgEfPGPn9g2v+BgRGPhsX/JD?=
 =?us-ascii?Q?0V3YYeDAuOZktyMeBtWngcjehnjBR1fvFBKGwmlAt0zChD7tEIFSZwO8P/wN?=
 =?us-ascii?Q?Ill4KF4jcHSad+UNi8SZh6YMN/viy5qGofDZCPCMLtno8ethAlHBRUjISECh?=
 =?us-ascii?Q?pbFkP1MosfLJuQrk+IHxU8zoId2d6ha5vQr0cZC2aXzjUSKIc6SCj6citmY5?=
 =?us-ascii?Q?j+Dbzg1q7wdnbyzaylse5zW1w5mfMIjfLGOe7uAQr/t6pnc9EYZLNUanDoOM?=
 =?us-ascii?Q?TzI05U8CZejrERtPefAOKqgHB1vI7AJQcs/VSEnqsbwkKsfMYDsS9YzceflZ?=
 =?us-ascii?Q?9AivNfdBqNl8E+Pv2H2eU3CFr1bueYs1JhZ3rMifxeZAIDL5/ajWxk+kUzwl?=
 =?us-ascii?Q?eHGEnFHEtdKFb2TbEaYAjojvxJHBjrZyVTxRe2o6t9NK1vW0aX+RB51N187C?=
 =?us-ascii?Q?bL/cOgIG+NIT/C28QTsKHQTo6PkG05lfojTIqpvunzZyXx2iv4KHSPfhiG31?=
 =?us-ascii?Q?i4xtzo7PucnesPjrQAgBKn2NiYCi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N6If2rr0FVecggI9pwNLePnqgYz8PAzJQc09ZlfOR63kSmIgSEIsvTC0ex6V?=
 =?us-ascii?Q?y8kC+yQTkFdw565ag6uafeEyA1HD6tniIxKTfQk/9jYRNtSD8Tif+zwvO2gk?=
 =?us-ascii?Q?za6JibgD64noMzK97/zffRYwiEWr6Ay0ijJZotiQa++j11on4nsPuRWg8DxU?=
 =?us-ascii?Q?0+HdilLKULM1JB2zBfGB/3Mtw/bZkUu1zZQ3XuZZRRGYN4I14hj2x11/zxiB?=
 =?us-ascii?Q?bcUFxQd+kvxY7+qEARMg7qQWm0mlOgia9RgM6VcCW6Sxxdz4ZgMsc2RqLjs0?=
 =?us-ascii?Q?amxFM/5nF+kwPYZnlCl7qVD+Zp1T0gQZGipF9ZbDsTQbh0ihTPIMaUN2Mqjj?=
 =?us-ascii?Q?h5cmLFHVySUtMt6cKsCfHReTm4MAVvmibzJA3eB2O2lLKKvpBMehl1eGLlv+?=
 =?us-ascii?Q?tq0zRbi4T9rIxpiDzWQd1wzo9d9Hr9w8VZ2tI8deq5uRUq0xDMBBnLiUdbc/?=
 =?us-ascii?Q?7W7kLxGCBAukCfLo7JZKlajMcWm+QrieEzNVRIWTBB1vEU8hec+ijXBYPORr?=
 =?us-ascii?Q?NwuU2s8EekrpA0R+YzI0HHhX8hOYLp0gW6tixLMl3Y1CrVBFmQkzj013nGaN?=
 =?us-ascii?Q?NSFgOwUZIFT0hum4Zms1ayjXX1Lg91n42ShuZy8x1xKeVunau2AGWTKaf6Cq?=
 =?us-ascii?Q?q3agF+DAmEDgGQcImq8833kBWK30S+Typp+Qki7Z9z3Mmm4J9uWcul4sMgr4?=
 =?us-ascii?Q?oLObNjsV7VFI1nLqDy+sobeSnHHmDhhof9Qw9Ge5Ee6TuvaNGsaIUg8acw22?=
 =?us-ascii?Q?N7fSdeb6REY4M5r667TADNEc0iv/AFYUu9IWpofMAjXw6hmLw0VTb1Sn4HoF?=
 =?us-ascii?Q?85vjzn7BQoesvJYoLiNYp1/3y4yCHXrZCo5emNFRqNmuRWZ68yjr1zGbINWv?=
 =?us-ascii?Q?M2nNb9rdZLsktMxYlyBj8UD0D3fiiiq23EaVRZz5t+f2tlwiHx7s4rCpZd5s?=
 =?us-ascii?Q?ByrV/OMshkfRPmJFH3OklFyPi587cCVSaJp3Il/Ir2pQHRqXi/VE3kh7dF/P?=
 =?us-ascii?Q?Qi+VS+BgeZ9YO+u9Pdud2qAywvr47pztuwP/b2htduXeFibPnlrAOF71B5/e?=
 =?us-ascii?Q?imwSb8QqdZGQ/c6RLaggKOWNi6gk9PlS2kIyCgkXSUwArvjbtDYEZaz93kFn?=
 =?us-ascii?Q?E53376zXcsdndIgoMa+xnZF8v4Jx4L0crBR2Duu2++T1HacTvzdC0pO/6OXQ?=
 =?us-ascii?Q?DLf9FFVuZIv1AQevTgNtIhgm+WPoRccSCiB6Jny7XT0W9pxxP20fUCevo8PT?=
 =?us-ascii?Q?UxBAkjXrVXFJMWaltAaJQkehVuchjzPTIkWl8IvUH8YaerL4AXo1xyMP9CPY?=
 =?us-ascii?Q?GdT0Wc2Tr1I2AegVa/yPUhztSbfNfwICv0cEZaIzehuzvoF1p9jcoaN1F4Mq?=
 =?us-ascii?Q?4lcxDAkaNeTJlU2+42BiaOdvz270ic/HThrLh9jjw9Wvdizx5A5ZCTVoIBNd?=
 =?us-ascii?Q?OdIKy30u4qeuL5FXxp22pdkHrUbqds2KpUTWNrVjYCiNnb6wkj8oRCML3dQQ?=
 =?us-ascii?Q?zMQt6ObqUq2aJQI+g5NsYLqJRbHMU/CQrjJf2JdWVGcFz4xgr6EtYiBSdnud?=
 =?us-ascii?Q?V1tCKos6Z2jETrxqYi++4OPLcIdykVPAlijjsHTksSpxoDMprubQ69Y/n/lR?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YzLsjAinuYhAvvGwizLH5keRfxHrZc1+v7bI4rTujAsAAycCPWn+qjObmjOaXA5OCEKzMKAKj0Boj6OU/OBMGk9yiO6FKqjLk5/ksElgzjZKkdGh+e05w25WhcQd1TxdkCWkHh7i/6iY721duH1Ym9K+LSFarSP1MVEGPQVkLReqceYKgIcgf0F1ZAVY1IcR0znApAyGzSJIGkbCqiUG90i51Hw1FF/e7U/gwx3pB5PHMzyFE76/ySM7/Hm80ca6gNuAnNW7bOep2JoTeYWZiBOwBxDOXe51uLxkcYIup36bpSzOXy37wa+DnIOgbKW1i3MtMbb3Grgm7uJiAMCuled2i7O9c/WUUIj7rkGsaFyiHbi831npSQhLvDxH7/LjjMuES3GgYTrUzipHiwMrs9URee1bVr4zgI2fJo7RLwJgwyA4WDOZMtpRKgubeQqn6qR/CpyOKXNkRoILBBllIJmY+Glhrj72XaAxIDxtnGRjfLVy/5Q4bHkGhIP5fMXHzMXqmJrikOET4rsbxySK7kuitVDY9VucWlfSrxX9i/sqSGFLTS55xsUXfLkiyHbKfy3JM8GDYWJITXIAY4XAJDuRmwyrwImACH9COmo5cTs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea002369-62fa-4ecd-f6b2-08dd33ca929a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 12:05:29.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njdxLXjY8ZzPFT/EFHX/KAYKsJlG1eY1x89yaZBXOhFcTER2dF4AIdOnhNHNvmRGkxxPMkTlhKvrrnCRgyjd/wsqIbOt8XU+keZdLtjpfJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_04,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130101
X-Proofpoint-GUID: g-zfV4j9LvBzxPeCdFFiusN_Ohj2zskz
X-Proofpoint-ORIG-GUID: g-zfV4j9LvBzxPeCdFFiusN_Ohj2zskz

On Fri, Jan 10, 2025 at 08:25:52PM -0800, Suren Baghdasaryan wrote:
> When exit_mmap() removes vmas belonging to an exiting task, it does not
> mark them as detached since they can't be reached by other tasks and they
> will be freed shortly. Once we introduce vma reuse, all vmas will have to
> be in detached state before they are freed to ensure vma when reused is
> in a consistent state. Add missing vma_mark_detached() before freeing the
> vma.

Hmm this really makes me worry that we'll see bugs from this detached
stuff, do we make this assumption anywhere else I wonder?

>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

But regardless, prima facie, this looks fine, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/vma.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index b9cf552e120c..93ff42ac2002 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -413,10 +413,12 @@ void remove_vma(struct vm_area_struct *vma, bool unreachable)
>  	if (vma->vm_file)
>  		fput(vma->vm_file);
>  	mpol_put(vma_policy(vma));
> -	if (unreachable)
> +	if (unreachable) {
> +		vma_mark_detached(vma);
>  		__vm_area_free(vma);
> -	else
> +	} else {
>  		vm_area_free(vma);
> +	}
>  }
>
>  /*
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
