Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94561F3D20;
	Tue,  7 Jan 2025 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736275839; cv=fail; b=Rmjqv4HVo3zXA9oMVoJfSOi/h6tV6/9tzus6aMyX9tqTofUygCBjkla9XUicAYNhupR86+CGnEr6K5w7eOC7A/cg4xwfOyDhldCByrXHv7lr2v/OY3EVQ21Avp8D8mH4sVojGaNK8Zt306tTNQZ2Ssb0lVPb/IAllyg4Rni/lVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736275839; c=relaxed/simple;
	bh=N+maibTTg7m65Scd/VNPI7hbIXg087SfuTzIqZ6LZdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p8/18BSxr8y55ukScWI2nwT7drUDnOtJV7ex6tKh8bsn1QH0gCgNv7N2LieL+0N6Y/NRTeic33W0B4H9Q3Rd4LWemFJYuHHHcweFhxYhOsIY9hN9bJaa0dloYXrdtJzR9vnxcB75bTWI+OcvI1/RJKzs5XNmiY4DA4GqT/dzfsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ChowLbIQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GQuqiR5N; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ChowLbIQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GQuqiR5N"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507HMpaI004830;
	Tue, 7 Jan 2025 18:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=5ASgiAHsd1lHi7ZuFu
	UuBUbPSC5eepg1TvsFw8FOmMU=; b=ChowLbIQFOLJoUm80tOhJCP5HDOGxHAQRo
	/InlUR1NrZqqBkoxS37yGHOoFVmm03R8u0+lCU7LQx0ggRo5irg9GbpztE10l493
	Nqo7rf+XUfGbtUxun1/MLnUIsVi+LP9j+9GOW/n51V4kYzkUdFupoXryR0M2Q6x9
	JbEqOclBBGLFd11X/hKZFa0CH0UZFZahe6vsCR5Hd6zpRTPVtuAuAG65Q9Vnl2td
	6dt+qbb1HKdhO6mJTGnm8YLBRXDK7pc+UED0CthGWUl9UQ4jf7LQ9jPlrpn1Io9G
	9RPBrjk+rXwikp8NCbTclpDE43dUG1H6Tch6UrPKDXX16jGVkAHw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xw1bw754-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 18:50:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 507Id6oC011166;
	Tue, 7 Jan 2025 18:50:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xue8nh7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 18:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxNPxcODJGX8Ala8EdKGNNgc8ub09UAxRyXjDmZbsuUmDI8zx3rAejoW+XUekAgi9cD0Z3lShJVWYOEHQ/TpvvhwU293pwX+JpvC0x2Fek6knaRS9BdokGq+JmyrhePrsXQCh/wnm1iYayPWk9Co3q7x2BywfqB1tmoo/XoL/w8BLOIcs1u0C52g9cAuPruuzoR+UexEeXqoyjSnMUoRb7ld7EhCiJoC/0vMBtfrpRP8wnHOZ33/Ok4kXRC51izq8dXGacxHZ8K0WzZW5nzPAdWBJwo17IsUAmQN7bMy/l7DTjzmdb7BeWMk7xmkzhWgoEUqSM3jamyl1wCUSrW4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ASgiAHsd1lHi7ZuFuUuBUbPSC5eepg1TvsFw8FOmMU=;
 b=i1Jlz+22idHa4EmHrvSInP28eapr8EdJ/OcettFh1MLYHCfjnI4MFvy/dKJ/jwqgDo/o+UcbO4GLWPyHEveKFijKAOwZkQjd8nDB/N21dBjeDKP/BG7Yr3fp5J6qVXp86dHH0Ay8JQMUPRczExrO33/Qc42Ar6n+ifVRICwjmYrG7QH2CpbUzqPy2q5mIZ/A9VlcFxQH3vXw2BzOodGyEJ/Pu8lizb4bmms7DxEbd9Jl1vGjIm8Zv0dtkoKPhMltzxZyBK5YcG62EGNMmKNyDrYlLfmBf7B6f0KhLLB6Fdq+fFxw74sDjy7EYNZO6OS1OrdZ0xmigFvqF4eOuPFMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ASgiAHsd1lHi7ZuFuUuBUbPSC5eepg1TvsFw8FOmMU=;
 b=GQuqiR5Nyl7bxin88Ioky1ZhA7PqOM3IhaBhwoCazaW6zbHuRbv584dJK2CBmRZ+61RJWzyPdwFibg1pNz4cyojjR4eV/khJ+RIq+dqwaSDXo+ZqAmpx8qPtMByBbiPJ9Q9q5m8mz6r3IhhOM8LV/IG9Nth4LuHKat1VslRjGGE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MN6PR10MB8072.namprd10.prod.outlook.com (2603:10b6:208:4ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 18:49:57 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 18:49:57 +0000
Date: Tue, 7 Jan 2025 13:49:52 -0500
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
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] fixup for mm/debug: print vm_refcnt state when
 dumping the vma
Message-ID: <xzbyr4v4jhxjovjsbsqikapqddkwyh3sudm3dd3rvxjgcoayda@xqyebxeynnya>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	kernel test robot <lkp@intel.com>
References: <20241226200335.1250078-1-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226200335.1250078-1-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0204.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MN6PR10MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: f59df14b-72ab-4039-c10c-08dd2f4c153e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4poROI8ZTviiE7sb0RegvvtNPhzZ+/7i7q4MUfnEN4yR7APa/0c1rAuCSK81?=
 =?us-ascii?Q?U4UnggV2FAg7uA7cE0KZZNrdd/8vZZ6YcfIGDDnn0/KGrMogrlVZr8H3sl8w?=
 =?us-ascii?Q?H97NKTO7nkrjcdASPS+T20GIlyQNZH8d44FV/M4ziDx+sd4Gxv80WsUw1nsU?=
 =?us-ascii?Q?3rpEHXRVU/PERj/Mt525d3W8DWErGoi/cFZVrN3t7G7bhTUY5w/4Ocqqg7js?=
 =?us-ascii?Q?ay5x5kO04r7ihP3JNtsfXm/P9LGCKM0s60R3a48/Pmp0BIbjL19DLzpLx0U5?=
 =?us-ascii?Q?69BuhAAZ9z6AKKsOfBsSNQeK2jH64qb5fjZ/fUdYxjnEnDAjSfY6e7YjnBVA?=
 =?us-ascii?Q?x6f37jVSX7cB8XORCVOa380Z2zkjR0KvNGsPy46SPZx8wqvBHngwK2iV7oSn?=
 =?us-ascii?Q?yriPK84vHejpg1acLNQrc5tiMQEU3sFA27HCF8IIUf/+zOl+CbTw/jlGds/P?=
 =?us-ascii?Q?lmFL7K9BuCve9r/NdmTjG4J4BHTRn9RESSrDaH+eC3qdXM+HjJGlHYeQGJfc?=
 =?us-ascii?Q?QZBNoG3jKme1Vq6ab4IHbEq0N49LqbvvYOaR0lbEEeWrLQx9OeOqFBXcMLhX?=
 =?us-ascii?Q?mz0Lbm0Ls9/uZt5ftrFeYjnzgS8BIZL54russdDpOe4EZbQ6HSprhpjFSdN5?=
 =?us-ascii?Q?Rr4u6MnCSitZ3XQwPlVwYRq9//4/SPJaYzhEbLci0F12Zm5DxFjVRec7ye3H?=
 =?us-ascii?Q?9Zt5JKKNi1EomOqBH/e5hVcJrJYsyqEn9T0e54efl1ibMzhQJ3RKL4CoUllD?=
 =?us-ascii?Q?JPNZZYiJ4wJqvxdkNvOgaCaW8jtytG9VHLo3YWLqmQHGrLONhoco1ozDuI+P?=
 =?us-ascii?Q?PWfSr0BwQeIOSzQPchBSw9VwDs23LuLmXeoHCV4kBaEjm015BIvZhfjGRReD?=
 =?us-ascii?Q?en/nxTdzzQY3vI+WYdQWa6+uXnRrOTqZM6QKTRwokrZ5pLypYGlxGs8zzFQt?=
 =?us-ascii?Q?3smkkLN1ryXYszO4aG+Dy5Z3azG6vblidZuneIKxSDbD+Uz0FfX4wxEz/4XT?=
 =?us-ascii?Q?PawWfE/E/qhZo1YQvKY3WENJO8qVD3DTycLX82UtnXup74XkdJfaTxZnM8HD?=
 =?us-ascii?Q?yDM4d3tICZ7DjKMvRZgqrqW49GSe+YuM4WFkh6Sm6PX3JM6c+Fw8oXx36x7e?=
 =?us-ascii?Q?8U2in/4Q8Gqgatmu1J+7Rqvbj0rJQS4kigV+A552uLgEZJUr+csFv2MmEBUI?=
 =?us-ascii?Q?4Wnp044nTsH5VXKYVIzMWIQvy8i91iqVwplXXSBM4mnpzjmeJojavqQ227uX?=
 =?us-ascii?Q?NVZLl8YTVbXCXLGtQGa84hBC4Q0VPGAAku+p4hrmybtZiJmXEUB7AmM0DKhR?=
 =?us-ascii?Q?c0RqRlk47tjBaw+kYm2GIzx54v6gjC6i3ziEjpxmE0GemVqqdqG3Zz/w0X6K?=
 =?us-ascii?Q?/OFCX1U0V6XOXLmjuyMH69SeRURwGDJppq+MHiAtyWPCCUP+6a+mFJNEsJnk?=
 =?us-ascii?Q?8UH6c7zjeAA6yWvqX5mzztKETg+6aQrh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J/mkI08yRDRgSpLiE4eBUkqA1NA1DeBJ9412pmZRYDE2pFeDUu1ijXSDpq+0?=
 =?us-ascii?Q?X+9+tMfPSBfPZM1UMfX9WO2C94IJayC0t7L5Bi+Ue9yVfYlKvL3zlkV3Xvq9?=
 =?us-ascii?Q?fQlcHg/DsJOvdPV/dzD+46eyMJwnyrh8A09MgVlTNYkuGz0PTPgMOnM4jzYd?=
 =?us-ascii?Q?ZQANhVeYq1CwxrMNxmjpZuXfxAnlLr5UpkI7EOg6MDJF1TWNjZ8rJZDlNGjZ?=
 =?us-ascii?Q?PZj8IXZsBPaRMdim8NUpPGXcUWwWoyAA/e2mdiHt7y7eoYnOM9WoAddDte3x?=
 =?us-ascii?Q?HVZsmylNaJgtEPvYgja17b4aCGjZuvPr8UhKVEauFMx+1tLReq51u2f1kygp?=
 =?us-ascii?Q?Zfhg4ulGmV3WBIfADjEPwO7D9T5teGERI2Dkmj8jVvpXIPJrc3JTF7nFW6/n?=
 =?us-ascii?Q?NK+tr4FA3z6cfXzI9uWtfHBLx+h4liWPKqD/307SpoTUgN4VSyRcLDokwbQb?=
 =?us-ascii?Q?X34qwmhfhQfBJnPI4iXGvzSARJKKGCx3hrPdumlScLkmAARfYtVdkwe76VRE?=
 =?us-ascii?Q?avxwT9rp0dz9tRw9L4HJrYgWmAdYadPDo3LnjvcoWkw65+FlXWd/ecbMF39f?=
 =?us-ascii?Q?hG3OYjjzO+kCdDJnO7biIJ6xjEFLD+MwN8bj/FgJPU4/hwTqm72njajQ42kk?=
 =?us-ascii?Q?iqkBGmiyAjUpnfwa5U9CNKeQPgRC6YPr9sP2/VWJX76vaiqlpb4voycVV4TO?=
 =?us-ascii?Q?OIgCahmpVsvE6eO9MfkhpnRirFBejATxtej6lRtv2Fhba5um+pGFww2hAXBl?=
 =?us-ascii?Q?KEKHJb86qDRKisEhnIH/kCk1F08Gk6zOxXJbXaFyCa2qCTLZmBhaWaNVxF/Y?=
 =?us-ascii?Q?Bc15DyAdeklGTicMT2eKCLpy5ZfJ2J4zgLIgIRIPItGzdggoPvLM89Pp4JyN?=
 =?us-ascii?Q?ZhFu2CQWIv6tdyLwpWEAABOcku0qyVa8VWEeT/HlUa0o46tzpev7cCCyZgq+?=
 =?us-ascii?Q?f0mGwykz2r6NeHldNx8C9L2mhRNQz02xoRdgUg7a+H2BIQfn5S9lp7sA0fq4?=
 =?us-ascii?Q?hKxg4Bawv5x58Wbwz6J2p5TDpDrhj/Bk2iTNsJyX8CGNwaWtfqZ0IOo+GMWA?=
 =?us-ascii?Q?I5OLxKEfal6rtYDl+bCHQmmqJF5SIElRBVgVNYqEpSnsj9RIZ38gYJkQa8jL?=
 =?us-ascii?Q?AH1W+6JgYzE16bLmErFrrsXPEZ49CuUqBU6/RuSGbixFJo6z6EBK1yS62ItB?=
 =?us-ascii?Q?ucbMEGmQh5zX8mjt6CDv1ldLVsaL1TfemAUsnDeca3CoDEhwgJ8RPBoYPiqy?=
 =?us-ascii?Q?TciR/LvpxY/X2PBzMCP0DMUoUvgrz1LcGSlgzMZd35sNyQROBRti3kVtQhTs?=
 =?us-ascii?Q?LXP7jxfiHxsMZzPnhkEdhwadzyQmCTfevl+stfY3SiWFV35Rhwg89RHNdPnG?=
 =?us-ascii?Q?qvOEe2Z4Z00CufOJiuwqf4PLoz9R6v4UQ0FTYpVNTm0tdGS/sGKa8hVTBBui?=
 =?us-ascii?Q?6l6euVdWoW3VM4dKdYck5yHddwnTyyu8vdxuv5mRMy7mdOjhN9ict4yg1ETb?=
 =?us-ascii?Q?AIEZ7mS/Oru65Nl72Ltqodt7Hil1rz18u0atyPvK+avbQw6NiaHO6Jbr4sLU?=
 =?us-ascii?Q?nbr8BBGz/GgF/4LTCj5qMJlKiMLYroV8BOyeaHEG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9cd9obWvnLt8T8JyhMragewadi2gyDUv1wdY0WOvDA2cWuyJRyIMRMtOqLSnDXwGNJBAvKfx8ii+WrALfEqPf5vOoVUV5FuCarDj+qbJcOobbITyvHtRG+n2dQsbYCGJ6n64IsNrRoRZWvqw8nxLXCWoWZRmu3abCA9fOh0UXEFleczpwJIAs9hI9QnQwGsfb74SclPh1ulwjaampPIvH/i51dxqIIxUEPBOqDGxc8Cyqj1Q41OMXWOMOh/oGzDT/fAMoKhX7cyhLjLsn5xszskhgRN6UqtFT7gFeURk6SQDd5eKgGO0Iosn+mor1wVZgxkKcBAgZFGLV/NjeaS2X69/a//ETQunuQAQ3slmw5TdS9rxfz0Zc2IexX/esDn66VxJfkHETgBfmP3OkHNNTwZx6Bv7ds2uKHkV6Yl7+s0lP4EBHRRTDszGb4HXYQaqLZsw5xuxDv416mFm5GIlokIuVoWjHKyDtfZTbk5sFrJFsTnBji2VRNrfk1BzYOfjxZ99pBXLnv3ti2CFI6qfMFfYgeMsJigbvca7dhFNenNZaXmFv+HhaKPri4sSfi/Uxu4KZYmwO5878MP5Rt9J4rGPW9xDsM6UqnHlTvt+KNU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59df14b-72ab-4039-c10c-08dd2f4c153e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 18:49:57.8326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBGVB0c6xiAak/n8GcP049KEgBYf3G4agBX5fBiN/uH7n3W44RquRuW5JhaBSSKSYU18x7R7umv4TWzKiqU3Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_05,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501070154
X-Proofpoint-ORIG-GUID: qOxpcHaAEICBcyIMQIo7xpajgK7jSUnD
X-Proofpoint-GUID: qOxpcHaAEICBcyIMQIo7xpajgK7jSUnD

* Suren Baghdasaryan <surenb@google.com> [241226 15:03]:
> vma->vm_refcnt does not exist when CONFIG_PER_VMA_LOCK=n, therefore
> when CONFIG_PER_VMA_LOCK=n and CONFIG_DEBUG_VM=y we need to avoid its
> usage in dump_vma().

It might be worth having a function that decodes the information in the
vma lock and outputs a string that spells out what is going on, and
another that just outputs "not supported" or something.

This has the benefit of spelling out the state and only having one place
to update in future dump_vma() changes.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-lkp@intel.com/
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
> Fixes https://lore.kernel.org/all/20241226170710.1159679-14-surenb@google.com/
> posted over mm-unstable.
> 
>  mm/debug.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/mm/debug.c b/mm/debug.c
> index 68b3ba3cf603..9c4cbc3733b0 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -178,6 +178,7 @@ EXPORT_SYMBOL(dump_page);
>  
>  void dump_vma(const struct vm_area_struct *vma)
>  {
> +#ifdef CONFIG_PER_VMA_LOCK
>  	pr_emerg("vma %px start %px end %px mm %px\n"
>  		"prot %lx anon_vma %px vm_ops %px\n"
>  		"pgoff %lx file %px private_data %px\n"
> @@ -187,6 +188,17 @@ void dump_vma(const struct vm_area_struct *vma)
>  		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
>  		vma->vm_file, vma->vm_private_data,
>  		vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
> +#else
> +	pr_emerg("vma %px start %px end %px mm %px\n"
> +		"prot %lx anon_vma %px vm_ops %px\n"
> +		"pgoff %lx file %px private_data %px\n"
> +		"flags: %#lx(%pGv)\n",
> +		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
> +		(unsigned long)pgprot_val(vma->vm_page_prot),
> +		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> +		vma->vm_file, vma->vm_private_data,
> +		vma->vm_flags, &vma->vm_flags);
> +#endif
>  }
>  EXPORT_SYMBOL(dump_vma);
>  
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 
