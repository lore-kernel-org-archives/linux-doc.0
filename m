Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCEB240221;
	Mon, 13 Jan 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784999; cv=fail; b=WbLDLC35+5frnHQdAnJbjVl7JytL41QOeaCkEPKXHphLpOACmLiexHhCWrXJF3cBRyhoYu+7O7qNFqcUQZbOxZWkbjjACha2rceBJs08gaBF2bxEe3TCMfUVaqV3/ChqRJbilOzSqLHX/1/ZesgS3h7wsr+/ywQpZ7s0xkvh7mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784999; c=relaxed/simple;
	bh=dISdpBnjk4nf+5XTWQHFgZP6lg9lSY1wsSBsRkNk1pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KLGPDyD0mk4Mfl8uBv9z/CdKC4TMf7ABQvsOw9za1y9OQ0Y2SSG42AoI0zDzD6sQyuW8M6YU2beZ8/s0wHPnH1/46wlyMCUCmdQBNw8cSWbErAhPH6QC9/gE+gfWokcijmlZbck04ijpBHVV1wZfDmZyzSiETFj8rk43R0tRTpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FBvcWDBr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q1lI+HFQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FBvcWDBr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q1lI+HFQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGBtsM007821;
	Mon, 13 Jan 2025 16:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=8+ESAspydClObreJfD
	Y/wjtER62U54FLOQLoMOsWa4o=; b=FBvcWDBr+kls8nWMDGU1rjGBU1/7BAOpLO
	r/eFST3MOyQ12q41DkFD108TkzJTqQeh4f5FXwQ4A/LQHXH49c8u83Op/2SLacEw
	QbWnCEmxDe1eamSPUDkZXt1VM0/IsqdfhPQT+EYlHGBYMw8V1+mKYquGaWNRMlL9
	IZK6lvNerZ0MR3vk8Ng2FtNWYJazR8q6fkxyHJW28hHXe77B4Rhocpp/UiFW3HLj
	jpzbMkbkgrC4UJ651+/fp1oYBCX/V5cYUDpaF2OR7ZmuzN0WWxKn/T9JPrw/4TlF
	llhJGMR77BfVAGQL9vaTYs7iOd3MLbXjOzGZHVgIaJNiTWSN4zPw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gh8uu68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:15:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DG3I5T020355;
	Mon, 13 Jan 2025 16:15:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3dek9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:15:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKcY6gxNFUEvyFvLeJXHnqV11pSON6fpJB9v7mL+yrX4ggY0+g5t5/OupyxPC4zVJaEwj4ymu7QtgQpFOAqa6CnRzEX+ELsqRd1LMbUkPWKXcDLRRK4BhRoTQFdbojIyBUjQmtKl4ICulzqWcwEx00LGwDpo2gxDQx1Q7tVGfPNedf947i+NW2ga4Ou/uqz1rBxuCut+bVigY1l2IN+dxrIet35Xnv2CfWGTH2EsEqrozRtwUYOADCv3D/z4TZotPvHGGtszmo6Ae1YUsTX4Yv2ep/N04QSJclQicKUHnv1wOqCqqb0RAobld64rjUpZT2Hi1J62xHQL8BEMJIWmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+ESAspydClObreJfDY/wjtER62U54FLOQLoMOsWa4o=;
 b=PSgbtwUskJXB3ddtbxOraFxZStcDLGnICYhBWg4ZRPlm9Qqqd176zQRQ7ytU3cZZFidP2993jkVfS3bw+J3C6dtq+/JTcIXenovt0BqumTsepKWx3/DQuSrP9HfdxTfOmJs2X4cxhes8OFXhfBsvN4+eV8+XfGmwsSlmmXJB2GK/ndA5dGvYCLWp0uOBAodNpPr2h9LsBj5zraYBDzjBhM8B66BcWdAT7LjAjnTtn9urHLMa2jjJjwxRjRN0dOOZv9nzDTrmrFQ6zq439wdij2mKRwYmOwtX7LZGz2+tsKuzyPlpc5sy4yKKfICWzch1ODhzGeC+yIEEA+fUgyuThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+ESAspydClObreJfDY/wjtER62U54FLOQLoMOsWa4o=;
 b=q1lI+HFQT532739e0CB9/PMwesqgjdEW8SSXpi4sqnFDlTJBhRszWoRoYXN276k+UYbEcHBKIvxYGrhsGDObv/eQo3qdtUCjpfru7HNAc8BJTB7h4riYIOvqJLKi06FyXHy4c93IrUrB2nxQZMBkfAyGQUIB01eCTzD4w3HSzyM=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB4816.namprd10.prod.outlook.com (2603:10b6:a03:2d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:15:51 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:15:51 +0000
Date: Mon, 13 Jan 2025 16:15:48 +0000
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
Subject: Re: [PATCH v9 12/17] mm: move lesser used vma_area_struct members
 into the last cacheline
Message-ID: <3f6fa335-9c09-4ed0-925b-82c5bf0e89be@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-13-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-13-surenb@google.com>
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB4816:EE_
X-MS-Office365-Filtering-Correlation-Id: 23be6a1a-5011-4216-dcf5-08dd33ed8c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RWhtSegoWD9jDI3Ak8TfvoUoUcaLWXxxgFMYNRqWiG6r2p1Fe8p+l+duNyS5?=
 =?us-ascii?Q?DkFRPTGwxBzwJA8qVNLVJdBTuM9cw7i/FTHbT8eTIo03QUkdV3ALoek21DSc?=
 =?us-ascii?Q?+fiNo7fEz+2jZCNzkCjKJxStd3KDIPB5txlvnRpJG/s+wOkMqj+wYh1pNE1f?=
 =?us-ascii?Q?p9gwiuP4u4SSM4qERRiSVpozBQH1Wl8LY4KrJc9Txii7SawIOw8VksJ4sGXt?=
 =?us-ascii?Q?nlHU3ELVHgV/LHR/zmo54mpj+vkdryhaki4BqiMffwj1VZDmWQ9qYlu5FE5p?=
 =?us-ascii?Q?8j3Hz5JBJe9bRea4TQ7rAfX1AWRH8TWW4FW+UpjMQxPC2YPaB/bBcX4gHoA0?=
 =?us-ascii?Q?Xejeat8mEpaRs0hs1rNj9WegD7DmXmULGeNEkExmYDRbj0MSN86sxUNOPe3O?=
 =?us-ascii?Q?lGbaP2M8Il4raz5jY79oHmTADsBVAEgVBmbUpxBILILTZf85FXuwzypv5zBe?=
 =?us-ascii?Q?EHNCGHONjH1+IiqwD+wy2JOVjssz8H8qcqeVUiSAUggNLpT8qn3pwGIZHZiM?=
 =?us-ascii?Q?vgb1OcGyUVYzR2qvXH9wvwZQdSGeTi1zokEhuklLcsD+fxQax7QDwQavmGhG?=
 =?us-ascii?Q?sNIBjX7UDHrv/hbyvg5FfMCeMS/OXJKSxhte44MW5mMUN7UYxlbwjUcpEjkn?=
 =?us-ascii?Q?7nVCnj/0yJZYmEOy8RtFv/txx29iw0nixrbT/EzPdbCui+Cr3cKbxqO0TpKo?=
 =?us-ascii?Q?6iEcCDOg1XNte7zlj935qyTxRxJO/7QLhPfok78lvJNhfQFWaXVZoCyLGX9L?=
 =?us-ascii?Q?m259wBlACvLOY9hmd7bbQiYi8ZORfaq6EKVbMR8aLjvXpcLbGpI8cqmo0890?=
 =?us-ascii?Q?1TED2YqGR4Zg6O5oQST+oc9ZMedjQV2RTGOOL633Z4vvgJuoVHRdm/aqKKmI?=
 =?us-ascii?Q?52xqTmnv9Cif3MooxW6ibR1aSc02AR7Ca3Zd3bQdoe3C/6JCfzeqdhIxXXEp?=
 =?us-ascii?Q?Zbg5qTGiPzh+CagUant743S3ijmmWfJGjnX6XOZs4jwDpxjac57yAtUuQrXb?=
 =?us-ascii?Q?rGUQ83ZhFU3EdYWnZCJgXH5FUeNJpyJVI0dMoaG3PYC+D/MfjZnwr6lz3hJw?=
 =?us-ascii?Q?Ym/l3Dm8n/tQi+GjFUJlTBKg82QoKV/4KPS6/DsBWZOIQbDxOaezaOHTkDmM?=
 =?us-ascii?Q?r79/kbSB8qyFHIPJ4Gj5cKntasnmzq3VPGjtywrwoQs+iaE0a76S+BfN04IL?=
 =?us-ascii?Q?sIU8fcJeAT6XkO4t8TrO7f9IKNN88YDyWLnDjKUSCpq8+gFe4hylIsHh9R5y?=
 =?us-ascii?Q?6RQS03Srhm/A0ylocW6I+CgWvrHSPjMUOP4zmfpufH9X6EM6mamlL7Y6jq63?=
 =?us-ascii?Q?jdAHQbNziTxvZC318KxbniWrhHLKbPQQzcioStBwY+jO5/eHsBtNl1vymP1a?=
 =?us-ascii?Q?wAtr5nn5ONX7llc14uRCSFQhZ3TH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4p/6uvbzSkIEx/wZYrK7Fz1JsnJWAxjdz4bh2ciaOliVX8Pu6L66AYlAVvjc?=
 =?us-ascii?Q?e+O3LREravpvt8HWJ72OgOJUrKpOtLjKWncvravkGFafU+OHrcmq3cyUg7zu?=
 =?us-ascii?Q?KORdJTVoNm+pjvuJBezh/FDdPOWzMchxymdmn6iw04GXAhpCiTlBs1DUhJqA?=
 =?us-ascii?Q?DagRp5NjeOu/8N401IwlIOqwIoIxVMSgjXWou+Y73S+P6F3ZMAVUCN1wQA41?=
 =?us-ascii?Q?+1+alnSQgku8fK04BIl8qG0MaQNjtvdahEESGElSNPJa6XvCDkTfp3AsB6CE?=
 =?us-ascii?Q?/YrDBganPLPALq9QLWNfY40XKvxxLMRfc6eGMYmbCkHjbOF6Im2kLl5vHdYQ?=
 =?us-ascii?Q?73ZpDQS1PBsiLEBEulFKeet8uDtT3ApcXDVpz9XIAYPwyJZGkVmGTvroKBVC?=
 =?us-ascii?Q?MzkvhpRgFfKVcYfR7Hjp/YoARkUQgnjUfzd8FN7RReHLnpv7VIQxaAHsAvzC?=
 =?us-ascii?Q?aChbrscgfMkyg+OgY0dILkS5rXLjUC7XcbC3VeW6l8xvGtMzONW1t2MD1t9I?=
 =?us-ascii?Q?MxIoBfOufDeeIGpHf2IiOWNZ1J5B70yN9rO+daPAbFZiToVVGBDp4AFo74rP?=
 =?us-ascii?Q?piGSzpP3eEzkALjHnpHfhK5OxVqxLDCUU8CjdtvBbvpv1D9FPxS+879VgiN6?=
 =?us-ascii?Q?0Zdj6j0YktCncHKGqbT8fsiVRciQf91Z+ax8fq5ZhAi9r22vdfiuEiRCw0Gj?=
 =?us-ascii?Q?UIdPd8mt2vf34YqFPdG2pBKo6tmlBltyF6+k+gRThf6BcddfjM8LYAW9qTwS?=
 =?us-ascii?Q?zbZAf3Ldq3EZCxtQbt/J2KAwVR2ipckwdhyPh8e9kiVd6WUQv8MXzjmUX0q9?=
 =?us-ascii?Q?3dAX1fTSWYRRFkooS1/TJXpgcG5NaDLmfI02SpGG8CJ65n4Euo79oFdwI4l8?=
 =?us-ascii?Q?9RcwVJhOsYOoxG23yM3L+WiNB1SFUGAWHoW2wD2bR2e4avn2J3RNeM2qePN/?=
 =?us-ascii?Q?FzNIKcXXTBdxQnlppKCdXoGUwzPqloGpveFIuduot8H8x4uaf8zz6hG6Odul?=
 =?us-ascii?Q?an5e7Bu7OTHC9iCRAG42xSII21IWvrdBh9d/RoQgRyB0cXWHFyeMaHvt+DGT?=
 =?us-ascii?Q?fwu46LpjAm0VogR6VtGH3yFLWXfn2m8wuPPDI60ZoHpD9NbQf3bDvFMkgnkV?=
 =?us-ascii?Q?OHRSMJoxVb09kHXPzk/KzT+Mezhy6oJx3yHAGtn3GLmFXsblholfLa7r4H+R?=
 =?us-ascii?Q?bTH9lwY4StDloMmF8Y6LRlP71Hnor6lmCjd/YoPOE1spsm7wMgwEpzhgq8qm?=
 =?us-ascii?Q?Xl0fevKNtNIoZ+Vja/s5IiEiPeZ3AdRUK2Vxt4ZqyPIqJgiip0r+vhGg300f?=
 =?us-ascii?Q?dUqipO1Z1qR5oasw7d7955Zw2adWxX8Abig8c81um/Rzi5it1Mfe9AmevvAo?=
 =?us-ascii?Q?FjH/I1qGTF+kv7GDp+XGaInprQ8uS2/mLat+LxsM17Bc+iK6NoqYDpwy6GdK?=
 =?us-ascii?Q?OfSH/Qq6k0/NDGUH4kZ51WX0NwrXb2EAYZDBF/4CPOOfUa/LABBbJjVLc6Pi?=
 =?us-ascii?Q?MIsdg9lbKBzvCBb52508r9M9mB0O1wOKfXa/KgEeex7XXagS3oqO/x6t0wgT?=
 =?us-ascii?Q?5m4T0sXEtIZ4K1riJbGh5UQCd/z4YVNDJRIbqnfMq6t6BQQn2JWtmGNG10Uv?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KKFdy+RNoU+x/GbnmLwlakxLOamBmKfRAE6mYgVSrxRCXIWAt9EyxkRaoBBBmIuFuI7Ii84+7H5F7omSbJv6I8QjOOp4+ag/D4oWEcJl+gULggNx6Hm0OCkjTs/miboYjagA8rC8Xb3cYleDDwaHyJz6QpIWkZAJIjuqtGDhJWjUUsx/WOY2UN+72sVbhWbMEgyahue4kFQ1RRF7AtqbNKtDxUgJU7+KaNvnStqPMJftUGtwfugdrTCsRsc1YuGuHVcjKkT8ImGyjnjH6zc7CYBwf48jtCRoTnRPXfsz5aoSynmJ7XjXVIoG5l4rpnqpDEfeW4BssbKWg92b5ZGbJ11oSNwJ56TX+ErTi1SffJh5Lvnl4zlnkP9eD+aea+ZRanrczNd+OKiEt1bpnuvtphe60P5xXytrCAdTKH2xM9IsCdxTO8/rKKH4LX3VyJcss4KuXhZ6NCdYS228YEX0cZfHlxME9RBgkhbGvSrrpGb68i04+dc80mrxiE8obP+G5dYsgN1OusRU9WuClvWpQIc5RUtBWULnxM4BY29UtSsDvQBhvRYaq4SeRTm9eKKrsIiocI+51CuTC4T06QSEbB62j3YRGkNLtsFIxr9EAG8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23be6a1a-5011-4216-dcf5-08dd33ed8c93
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:15:51.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHIClXA1Ay+1O/lPeJqf05+UdVqKUY1uGrClXA//0kDe7pXqHtjIRQVP6+z1e1hyRiIjuW3Nw5UwOBFNFiRC/H/hBjokxirYFE97rsUgfeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4816
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130134
X-Proofpoint-GUID: TFBZpqlYupxm5pFNw2dlC3RfP2tiiKRt
X-Proofpoint-ORIG-GUID: TFBZpqlYupxm5pFNw2dlC3RfP2tiiKRt

On Fri, Jan 10, 2025 at 08:25:59PM -0800, Suren Baghdasaryan wrote:
> Move several vma_area_struct members which are rarely or never used
> during page fault handling into the last cacheline to better pack
> vm_area_struct. As a result vm_area_struct will fit into 3 as opposed
> to 4 cachelines. New typical vm_area_struct layout:
>
> struct vm_area_struct {
>     union {
>         struct {
>             long unsigned int vm_start;              /*     0     8 */
>             long unsigned int vm_end;                /*     8     8 */
>         };                                           /*     0    16 */
>         freeptr_t          vm_freeptr;               /*     0     8 */
>     };                                               /*     0    16 */
>     struct mm_struct *         vm_mm;                /*    16     8 */
>     pgprot_t                   vm_page_prot;         /*    24     8 */
>     union {
>         const vm_flags_t   vm_flags;                 /*    32     8 */
>         vm_flags_t         __vm_flags;               /*    32     8 */
>     };                                               /*    32     8 */
>     unsigned int               vm_lock_seq;          /*    40     4 */
>
>     /* XXX 4 bytes hole, try to pack */
>
>     struct list_head           anon_vma_chain;       /*    48    16 */
>     /* --- cacheline 1 boundary (64 bytes) --- */
>     struct anon_vma *          anon_vma;             /*    64     8 */
>     const struct vm_operations_struct  * vm_ops;     /*    72     8 */
>     long unsigned int          vm_pgoff;             /*    80     8 */
>     struct file *              vm_file;              /*    88     8 */
>     void *                     vm_private_data;      /*    96     8 */
>     atomic_long_t              swap_readahead_info;  /*   104     8 */
>     struct mempolicy *         vm_policy;            /*   112     8 */
>     struct vma_numab_state *   numab_state;          /*   120     8 */
>     /* --- cacheline 2 boundary (128 bytes) --- */
>     refcount_t          vm_refcnt (__aligned__(64)); /*   128     4 */
>
>     /* XXX 4 bytes hole, try to pack */
>
>     struct {
>         struct rb_node     rb (__aligned__(8));      /*   136    24 */
>         long unsigned int  rb_subtree_last;          /*   160     8 */
>     } __attribute__((__aligned__(8))) shared;        /*   136    32 */
>     struct anon_vma_name *     anon_name;            /*   168     8 */
>     struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     8 */
>
>     /* size: 192, cachelines: 3, members: 18 */
>     /* sum members: 176, holes: 2, sum holes: 8 */
>     /* padding: 8 */
>     /* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
> } __attribute__((__aligned__(64)));
>
> Memory consumption per 1000 VMAs becomes 48 pages:
>
>     slabinfo after vm_area_struct changes:
>      <name>           ... <objsize> <objperslab> <pagesperslab> : ...
>      vm_area_struct   ...    192   42    2 : ...
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Looks sensible to me:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/mm_types.h | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 9228d19662c6..d902e6730654 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -725,17 +725,6 @@ struct vm_area_struct {
>  	 */
>  	unsigned int vm_lock_seq;
>  #endif
> -
> -	/*
> -	 * For areas with an address space and backing store,
> -	 * linkage into the address_space->i_mmap interval tree.
> -	 *
> -	 */
> -	struct {
> -		struct rb_node rb;
> -		unsigned long rb_subtree_last;
> -	} shared;
> -
>  	/*
>  	 * A file's MAP_PRIVATE vma can be in both i_mmap tree and anon_vma
>  	 * list, after a COW of one of the file pages.	A MAP_SHARED vma
> @@ -755,14 +744,6 @@ struct vm_area_struct {
>  	struct file * vm_file;		/* File we map to (can be NULL). */
>  	void * vm_private_data;		/* was vm_pte (shared mem) */
>
> -#ifdef CONFIG_ANON_VMA_NAME
> -	/*
> -	 * For private and shared anonymous mappings, a pointer to a null
> -	 * terminated string containing the name given to the vma, or NULL if
> -	 * unnamed. Serialized by mmap_lock. Use anon_vma_name to access.
> -	 */
> -	struct anon_vma_name *anon_name;
> -#endif
>  #ifdef CONFIG_SWAP
>  	atomic_long_t swap_readahead_info;
>  #endif
> @@ -775,7 +756,6 @@ struct vm_area_struct {
>  #ifdef CONFIG_NUMA_BALANCING
>  	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
>  #endif
> -	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
>  #ifdef CONFIG_PER_VMA_LOCK
>  	/* Unstable RCU readers are allowed to read this. */
>  	refcount_t vm_refcnt ____cacheline_aligned_in_smp;
> @@ -783,6 +763,24 @@ struct vm_area_struct {
>  	struct lockdep_map vmlock_dep_map;
>  #endif
>  #endif
> +	/*
> +	 * For areas with an address space and backing store,
> +	 * linkage into the address_space->i_mmap interval tree.
> +	 *
> +	 */
> +	struct {
> +		struct rb_node rb;
> +		unsigned long rb_subtree_last;
> +	} shared;
> +#ifdef CONFIG_ANON_VMA_NAME
> +	/*
> +	 * For private and shared anonymous mappings, a pointer to a null
> +	 * terminated string containing the name given to the vma, or NULL if
> +	 * unnamed. Serialized by mmap_lock. Use anon_vma_name to access.
> +	 */
> +	struct anon_vma_name *anon_name;
> +#endif
> +	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
>  } __randomize_layout;
>
>  #ifdef CONFIG_NUMA
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
