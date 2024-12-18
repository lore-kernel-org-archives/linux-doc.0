Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7788419B5B1;
	Wed, 18 Dec 2024 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734536306; cv=fail; b=h5ezDl7Z0IRXIGZjaBjLEsmOGSOjLDBA4Hn1iCo6B8X79RkZotn+HiEvw5F5Cd2RlkY2fwWkDL66IhG7EDi//SrgbL/domNJkFjInsYte1/lPJMDNgX2JIWerZAEdeLn/MoApzKCMSiVH7irEJqZiAsA5+hiPXt3zstTrQY33xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734536306; c=relaxed/simple;
	bh=Tia5Xe8J+CDYSSYKiWrvfLqHGulPyT9X5FJnNQ2xi6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=btDh4xKaCrrF4k/blFc6BDF062DZqh1nc912S3Os+pu95YV74m2GRIdcTHHeyQYM0Euqx/sD/2rI47tEP/JclDxzCI55IfMR0pBayXVLsTI2ytKaV4D182FqOQPdNsFm/m6kJatx9GxFhShkc7mQjW4PAQ8jcyf+n8pVjIr952Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OBigPoMk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s/PKAIY1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OBigPoMk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s/PKAIY1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIElj45032377;
	Wed, 18 Dec 2024 15:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=tIcPj6EtgixtHlkP4p
	1pn2gKCANxxQy/JFSHJDF+teI=; b=OBigPoMkWwlaOV26tmBg31zTPo9gvd5ptY
	EWDElh9Z5WADM5/qjESfLt5AheuuHJg0/0SlIQvDTxzINyppLYBHBILeXV++8bnF
	D3iXk4tg2cNyaBlznRrgpQlnyxRyUSg+Fcs+Xd6NMy55atf4sMZvLqy6xNzKDmz5
	2OZ9kT1r6pbrbBWTiLx3hOgOO5YrRuxlUWukcmgYt4Fbw+Hikvo7SJ39p99FmYg8
	LQsGmYKuDQI8kxZ1y6mt8Y6gMCkm31HiL9l3R7NxZrgaYYSGaDkmgAZ9bsJiP4aU
	kCSD19MhNlV5vltEqoy6myDyrCm2dv6cOTnUVY+H7gq3ADru3bZA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5erju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 15:37:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIEiQAH006377;
	Wed, 18 Dec 2024 15:37:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0favbgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 15:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOzjK/r+8kdUKqmB8oErJZMzGNQl+E68d5N8cSgIPU/KuPSXB+v4UwsX+GvdevmXaoWLiGwOlJMPPMNM5izuP6e7abR0XNU8fUwgcrUMiWDVmWzHt34kufauURCz0TPAVk8mQA8nNMyE6a7Z0iKoWy+VL6BZrmaFJk4BOQBhzgIcZeAJLOIJclHa8ck2EH9oHTDtyQTOcaibqJb1vnSwqnS/jQKeaLGyILXCYEOjgxV36WU1fyB6W8v7Llq+iTMD+8O80r83VwW/MyCMIiOvTd1JgaDKd3BAHGcND6PgnnjPhzgNavdRrcMJNNq8FFDa+GCst0d+aEi4yhuzJwzUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIcPj6EtgixtHlkP4p1pn2gKCANxxQy/JFSHJDF+teI=;
 b=gn/6GRgA1YWEGRXHbvwi0QIFLwuOeWxaoShJulX/N+dC5DpD6ufCPoPL7Ol+RcsmrKOydMP+r1IJxOv28jkxeFqkll222xhL5XDQeztJsoyPY0ohYBtXbE/F6ZG9+hv+WT1QJ8sKUd+3R4sQbwEL89XdetheFIHtZIKPTwsL9oKAQEbklRiILvJkvrbLDJFfDptXUVLhxuBTMJ6ZfIrdqIZ8t5W42r2X0DpVqjSt4Sbr08Po/nYhFX0rdlGXD51fnMgSbntQLVjuOcbiYgKORetq12QNq/03I3vJXQbRVF28ytvqO/94fG5vOGAy9sThUzLQyKp275WQAGBSbLtfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIcPj6EtgixtHlkP4p1pn2gKCANxxQy/JFSHJDF+teI=;
 b=s/PKAIY1WZMVS1Na/4pNoHqEFOhgJLPKj0HbTpk0kGsC+omIMlMe3nkKiy+de1REQxzCrUWUIWc7oLtvg2eoUYgkdHdKsH87vbG+oiKc3MIWbQdK7R20w9GnTtxuoNsvm5yu3qsLPqifNQdyUVnyW/TW0/ZyOi9+MK3XsH3rOY4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB5551.namprd10.prod.outlook.com (2603:10b6:a03:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 15:37:29 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 15:37:29 +0000
Date: Wed, 18 Dec 2024 10:37:24 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
        willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241216192419.2970941-1-surenb@google.com>
 <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net>
 <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
 <20241218100601.GI12500@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218100601.GI12500@noisy.programming.kicks-ass.net>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::16) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa908cc-4726-494e-cae4-08dd1f79e171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pwwkoRPWmz+HFTl2qAqxhKtn90zRRW6TCjtz+/3tbP11fMAZi+v6pi2i+VGo?=
 =?us-ascii?Q?TQ3Ja6w++hKHhQ1VEEsvoGJlefwOGHjbQDQzGEIZcqNXqtZmuTCVJtzEjv9J?=
 =?us-ascii?Q?zbLHoKCqFSV+fht1YYZKi4+7GwntuKtxz8f4cHZoefn7z9k292hRYPDdLIaI?=
 =?us-ascii?Q?gNPTVUR8iHebhFH2IgiFxGYEUJRtsfdIXg5zkAWmtuKdQvLwLlwIn6bRyrfK?=
 =?us-ascii?Q?VJxZ8eZD8cJu1deARaJeYQBQPyERzREiAXlwPTJEosokAvnXf/n/x5cT3ROx?=
 =?us-ascii?Q?xW2jSZFtm7cX87QM7vIkQLWqiyOH+zA3ijS5Rj7/RBHB5BKtGW3474cmm+8G?=
 =?us-ascii?Q?whCeDw65fvatA1Iqpw8+MC1DM//O6Lq9QeClRJ9h80FGPblCQQ1fQZdtUQgT?=
 =?us-ascii?Q?QqW9KFoAS8jiVz0H97vPWzEzXgRM/nOjI3oVEXpA6cLF/pxvmkQTUYB5mzXo?=
 =?us-ascii?Q?b/BBZ6ZGl66fUE8JoFhaulQDBFS+E7uS9tjHwnHNe7IEIQ5YeHottwC+iz4A?=
 =?us-ascii?Q?oWVLs7lDylwZiDZsAgeHDJaf2gQhcGGRrVO7LepRqYlcvagwToarHCSItfa7?=
 =?us-ascii?Q?aAtEPI0eE2MJSDZESPEJaMTEaowY9ZqN/6u7HNJ3eQkqeJDpBg67M2HmRfJU?=
 =?us-ascii?Q?3i1bVbusY14XwiSPY0GHI8aJ92ssg+JISOVetRZbOBUiUS7EyRZApNr4Aj1L?=
 =?us-ascii?Q?En4gcu6usHE6Jzw/AsD3OH+3Bmu+tE7//rokF7oY9WFi1n8El8wx5ZmeWz1X?=
 =?us-ascii?Q?BT7SgleSeDORSEQmAjzXMigfWjtIDriKLcIGzU7/emFYap39HipjQrIiecJV?=
 =?us-ascii?Q?ZqQTDMd2ND7a2ON4w4Api6gmPL+TnGXrHtr0bPmKJ5jYs7hhKlwqngxlfucu?=
 =?us-ascii?Q?DDWFyp8V/1JGGOyyo48EBT/BWO3c3mItAc7/2CzWrLLZPuv4i9PKfq+1umEl?=
 =?us-ascii?Q?WD2c8KFAX1gP0kQEjABagRBoig96X1wRlxlObFjC7p2uB/vuNU9RixJvwFIx?=
 =?us-ascii?Q?p+6hW2nXGInugOj0onwWNWcYzecoja9rbNwUvaGF0L3eBqoiceK70GNS54Ul?=
 =?us-ascii?Q?XuYt7HtEUSVN/phtnvbJJf1gxI9O4TSAipEAoNYEZlvLhlxb1pTTy/556Lr4?=
 =?us-ascii?Q?SwpDUZTCy5MJ60aXJO9WFXH1A7Ia2l2uITwr3gYe1TQnEDjU9YLxvJOs61gj?=
 =?us-ascii?Q?+/z2nITrHN1uA3lxtbeOKbum0+y3b4Po6rmpp4UmC1w7V3O3UglyWUnsTiUG?=
 =?us-ascii?Q?6CPBv7cGeS8O4EoPwfEeRPH58J546bWnt1CtcMxnxymi/HyNjV+SftAbPAh7?=
 =?us-ascii?Q?o/Et7u1r6jn7WwENBm9smiUktC4PJDQYR17ZonLzSJH5dw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0tHNlBtQiQUrsvazcdJFs7GXu33YRfIR4gQRBgcNMRzpXqTdIstvKUG3HZg+?=
 =?us-ascii?Q?F+tM1qcBQyhVEvNFjqLVSOjV+Cuc3hmGv9bOP+HdiF0vnZd5VJ43XADLSooM?=
 =?us-ascii?Q?X1z3xIHyytPUTeYIpeS1D8cBeTNmxOjtaSshz0IGdq/qKMC+8TfipMu7fa3r?=
 =?us-ascii?Q?sYzEUbYc5pMLxa4qQSiinuzkw92Z9FsrbU0jD6m+B+wMVjj4Dkr5/yJv6z9M?=
 =?us-ascii?Q?Gy819DvpoE2jRwq/9mwqspFlmzvoC1YLOpu7m56fcyIjLf+SBfPqhbHbVhn0?=
 =?us-ascii?Q?c/8xZRZPlU5ti4HVePhKTr31o+d6takXCJivYziQDdTsFFhGdmpwNy8Htv1E?=
 =?us-ascii?Q?5laiU+xVVxHze0Fm+Ai7lp/TVmplcOFar2vpZGTJdxsBC/uWLRcnlzyUiEQe?=
 =?us-ascii?Q?pS+1IBYgmxABYD+wp8ZnfTVBXOAIYWwxsAFeajJ17cLuMxpjhnnz5vbHGCjn?=
 =?us-ascii?Q?jhjj7qknzOY0XXw5bS0wOSgzrZYKy3mvKJ1TLfkxNPBeTitewn5tmmSshPV4?=
 =?us-ascii?Q?Rd91akDhlJFoIYSxR0jsqpf3GRSNmN4E8Tst3fQoAswTftH1zeqmyHAZzkE7?=
 =?us-ascii?Q?kljaGNke2N0ofSbPh1sBRlV0xXaCZPyC6oyTyAPkYLBUhBy4w1adrhNKeYtb?=
 =?us-ascii?Q?98JNSvlqmZpbe/kuWI1nDXH6VXQQETKU7gXk74SN3U49ShZTWH2b+P6pb7Xl?=
 =?us-ascii?Q?h47Ph7FqeNQSmVe/MpCF8ZEV/zVRLf1K5G7O9HwhYAq8HWrY0UrzACNvE4qO?=
 =?us-ascii?Q?YoTiWa3+tzoRkRybGaBb1RndIHY9sOba1IDhxon3LELrrHWO9UpFSTBmakHv?=
 =?us-ascii?Q?MnNV4Gw8HHNZN2jOt031z3az46WLFl+JzBS7gNWShYf1ou4xalvtOkLVJVpW?=
 =?us-ascii?Q?r2qYIyLG3BHF+WfBcLT8QWcLAZV20wR4lY+QD/FwBU6I/wATFf08v1PALk7s?=
 =?us-ascii?Q?V1ROLfUIs+2n2i6OJutlP6QY0xJSlYs1rJWqR/gcaQsH+tjig4d3Xpe+unbR?=
 =?us-ascii?Q?5V/anlzw1Dz8NOkM9FJD2Eydl2AKRLnEKwykqaOb2xn3STAZSsjbxd1zHQPw?=
 =?us-ascii?Q?0zhUHVDPAQJYMAT8K6wX9VkhYSxD56FYKei3MXgy8W5d8rdjBZ6s8VcCnJY6?=
 =?us-ascii?Q?TmeykiV6N+KTwYTzISmCoBmfeUXyTphhXajeVWVrsnBxBBCKgDKBvXVeKpiD?=
 =?us-ascii?Q?eNrqbEKugagveMep5zSoceO6W8//SeNznX5JdAY3Jh2LjlcbiGcZXhhQQB6t?=
 =?us-ascii?Q?FsQ9xcLd8KLVkoZAeHozlJOGaEU1TKSEDTn822Smum069QYtGMf8E7DfG1Wz?=
 =?us-ascii?Q?QN52MHUZ0rYEv3toE0JclFumtTs0cEplaC2DUr1wd/9yrizs3jX81u5vHvxj?=
 =?us-ascii?Q?OJ8dFEyVUHbJF0WF768WzSl9S3Fo5/CBoKIpEFHGO3kBaVuvRayGyW3AvEwV?=
 =?us-ascii?Q?bmXNFCbvtHcNdu+bnNRxAx9syxJHqusplTLYxUCdunr5RILxaTOhp1N9HMAV?=
 =?us-ascii?Q?yKf/S2VFs6RyF44nGxxHSd39zSSsG33WXV8HRrtjUzbNKxVJtTN4x/iTNBB2?=
 =?us-ascii?Q?FF2+U/jtuP+TgkzVKDQEznnvKgtSJ05CaB1WsDch?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ber1fpjACBGUaEWDM8FfFASFlOHkQ+wuEuBP7cvYm1YTSDwNDLemqXrDGC5sLHS0KhJU/okadQ0Qo+j+BHCgou+KiZhhHfMF8b7cVBMfc3ZDzMBc6ef/1ZaJzMuAoQ5xsuwNmJ+XebLrZ7XoMmLacDWwi6ImJRG3xYWxmAN0iN2RCao/XsWyFX21VVuJGTu6TGgYXaqdX8pyxV3ha1KiqThuEkPRwQVloVnOy5DdlbYzclaGQlx9ZtvrXyZnl8pobY0RreFTo/OE/buT0AdXrUQlRL/Zn82Nz8mhSeivq2E/+7VOw/GsO0Hfi1VX3hpu2TAeYX7a8D5MWy28nhPUTI8AX5YAGnGOA1iR8blTbrNEv9radhDMzC8FQDi7PWbYKJwtOi40bX9DapXxXL2vbr9hUK5cHLfOt0ShFUnV1cIi5ILbMoIw/0iDzte5egWYd3hc6jUgk3RXIgg6d+66p5MeXfvqprCLVfEWctZJvCaC4OnoV2Ka+L4i1tNJIks573jmy3POVBOMJAtP5L3RgaJNSMMu/TrjgAaXtwzmOOkZrNOlA4CgZ0uWNHgnKKfQ0jS0BUWB/wEMYvFTU+qemOF7JSUZzjTQfhZyB1rj3yU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa908cc-4726-494e-cae4-08dd1f79e171
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 15:37:29.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdtnQrLkI9ShJ2ydGSjI0Yt3sNwef2/twH+MC+QJiKiWJ4D9qtPbeOEquyHL1Yk+wkwgeW+I1ux7LlVxL7PDfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5551
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-18_05,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412180121
X-Proofpoint-GUID: XbQZ9e_5tcwmk4woSmhcRlW9pyl6JgOI
X-Proofpoint-ORIG-GUID: XbQZ9e_5tcwmk4woSmhcRlW9pyl6JgOI

* Peter Zijlstra <peterz@infradead.org> [241218 05:06]:
> On Wed, Dec 18, 2024 at 10:41:04AM +0100, Peter Zijlstra wrote:
> > On Tue, Dec 17, 2024 at 08:27:46AM -0800, Suren Baghdasaryan wrote:
> > 
> > > > So I just replied there, and no, I don't think it makes sense. Just put
> > > > the kmem_cache_free() in vma_refcount_put(), to be done on 0.
> > > 
> > > That's very appealing indeed and makes things much simpler. The
> > > problem I see with that is the case when we detach a vma from the tree
> > > to isolate it, then do some cleanup and only then free it. That's done
> > > in vms_gather_munmap_vmas() here:
> > > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1240 and we
> > > even might reattach detached vmas back:
> > > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1312. IOW,
> > > detached state is not final and we can't destroy the object that
> > > reached this state. 
> > 
> > Urgh, so that's the munmap() path, but arguably when that fails, the
> > map stays in place.
> > 
> > I think this means you're marking detached too soon; you should only
> > mark detached once you reach the point of no return.
> > 
> > That said, once you've reached the point of no return; and are about to
> > go remove the page-tables, you very much want to ensure a lack of
> > concurrency.
> > 
> > So perhaps waiting for out-standing readers at this point isn't crazy.
> > 
> > Also, I'm having a very hard time reading this maple tree stuff :/
> > Afaict vms_gather_munmap_vmas() only adds the VMAs to be removed to a
> > second tree, it does not in fact unlink them from the mm yet.

Yes, that's correct.  I tried to make this clear with a gather/complete
naming like other areas of the mm.  I hope that helped.

Also, the comments for the function state that's what's going on:

 * vms_gather_munmap_vmas() - Put all VMAs within a range into a maple tree                                             
 * for removal at a later date.  Handles splitting first and last if necessary                                          
 * and marking the vmas as isolated.

... might be worth updating with new information.

> > 
> > AFAICT it's vma_iter_clear_gfp() that actually wipes the vmas from the
> > mm -- and that being able to fail is mind boggling and I suppose is what
> > gives rise to much of this insanity :/

This is also correct.  The maple tree is a b-tree variant that has
internal nodes.  When you write to it, including nulls, they are tracked
and may need to allocate.  This is a cost for rcu lookups; we will use
the same or less memory in the end but must maintain a consistent view
of the ranges.

But to put this into perspective, we get 16 nodes per 4k page, most
writes will use 1 or 3 of these from a kmem_cache, so we are talking
about a very unlikely possibility.  Except when syzbot decides to fail
random allocations.

We could preallocate for the write, but this section of the code is
GFP_KERNEL, so we don't.  Preallocation is an option to simplify the
failure path though... which is what you did below.

> > 
> > Anyway, I would expect remove_vma() to be the one that marks it detached
> > (it's already unreachable through vma_lookup() at this point) and there
> > you should wait for concurrent readers to bugger off.
> 
> Also, I think vma_start_write() in that gather look is too early, you're
> not actually going to change the VMA yet -- with obvious exception of
> the split cases.

The split needs to start the write on the vma to avoid anyone reading it
while it's being altered.

> 
> That too should probably come after you've passes all the fail/unwind
> spots.

Do you mean the split?  I'd like to move the split later as well..
tracking that is a pain and may need an extra vma for when one vma is
split twice before removing the middle part.

Actually, I think we need to allocate two (or at least one) vmas in this
case and just pass one through to unmap (written only to the mas_detach
tree?).  It would be nice to find a way to NOT need to do that even.. I
had tried to use a vma on the stack years ago, which didn't work out.

> 
> Something like so perhaps? (yeah, I know, I wrecked a bunch)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index 8e31b7e25aeb..45d43adcbb36 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm;
>  

mas_set(mas_detach, 0);

> +	mas_for_each(mas_detach, vma, ULONG_MAX) {
> +		vma_start_write(next);
> +		vma_mark_detached(next, true);
> +	}
> +
>  	mm = current->mm;
>  	mm->map_count -= vms->vma_count;
>  	mm->locked_vm -= vms->locked_vm;
> @@ -1219,9 +1224,6 @@ static void reattach_vmas(struct ma_state *mas_detach)
>  	struct vm_area_struct *vma;
>  

>  	mas_set(mas_detach, 0);
Drop the mas_set here.

> -	mas_for_each(mas_detach, vma, ULONG_MAX)
> -		vma_mark_detached(vma, false);
> -
>  	__mt_destroy(mas_detach->tree);
>  }
>  
> @@ -1289,13 +1291,11 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
>  			if (error)
>  				goto end_split_failed;
>  		}
> -		vma_start_write(next);
>  		mas_set(mas_detach, vms->vma_count++);
>  		error = mas_store_gfp(mas_detach, next, GFP_KERNEL);
>  		if (error)
>  			goto munmap_gather_failed;
>  
> -		vma_mark_detached(next, true);
>  		nrpages = vma_pages(next);
>  
>  		vms->nr_pages += nrpages;
> @@ -1431,14 +1431,17 @@ int do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	struct vma_munmap_struct vms;
>  	int error;
>  

The preallocation needs to know the range being stored to know what's
going to happen.

vma_iter_config(vmi, start, end);

> +	error = mas_preallocate(vmi->mas);

We haven't had a need to have a vma iterator preallocate for storing a
null, but we can add one for this.

> +	if (error)
> +		goto gather_failed;
> +
>  	init_vma_munmap(&vms, vmi, vma, start, end, uf, unlock);
>  	error = vms_gather_munmap_vmas(&vms, &mas_detach);
>  	if (error)
>  		goto gather_failed;
>  

Drop this stuff.
>  	error = vma_iter_clear_gfp(vmi, start, end, GFP_KERNEL);
> -	if (error)
> -		goto clear_tree_failed;
> +	VM_WARN_ON(error);

Do this instead
vma_iter_config(vmi, start, end);
vma_iter_clear(vmi);

>  
>  	/* Point of no return */
>  	vms_complete_munmap_vmas(&vms, &mas_detach);
