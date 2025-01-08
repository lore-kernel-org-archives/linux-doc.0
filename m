Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FD23FB3B;
	Wed,  8 Jan 2025 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348524; cv=fail; b=uLVjR5f7khSsQiXfdwwPfSFBPFOLAlHJERJdROqlhkgyzGxSn1Ss3MtQMfTg3iZkQVkV41beS99McxzrVetx4AZaN6SKYJAO4+fRtSbWVIAgPcv30f38ctPXVkHkIjYfRjysEG2+ImABY8UFYdNVfY2sT3Eqq0S0oBmY/UobBKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348524; c=relaxed/simple;
	bh=j1W3hKuGUcsWjLvY8GgcgEJqyG9C2zBBDoh2VCa4aMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E35NW+2sKk5w343WTDzT8ZgPsTz8Hm52pn3xffmNjXmLK9Z1osP7F3fWDk54fN/6WNmKRZv7gHUJZ+u+1dDjMDr+m3wcdXXuqZgKDDTOw+KCTCZ0dLAZWM/BA5ztI9J3Ks2bItcVz7GmWR3onR63XDUdMv0rE5WTJE6yXPF3Ues=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J3la6xH2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OkhT536R; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J3la6xH2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OkhT536R"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508ENOEN018570;
	Wed, 8 Jan 2025 15:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=qf0m+22uYb6UpbJFTC
	rDBHovwGB8kAatybATSc+voM0=; b=J3la6xH2uwe0/VLn2wciRB5zfcjrUCTgwV
	0EeZQIQrSltwf/ZHLf1E0WGaB2nsLz9ahWOpMs9OmGwSSWQ6vgHwLpNZK+G69sYS
	e74ijdeZLrboPgoBnCQSJzDE4Egu//pg59IfoXoWdsQYVfkFlyW8DpSWUSHiiDVY
	eQxWSI6RfHizNUcLmuFEGQC2D6YqIUyiDNjagKW74HL9/O4XcMB4YLseKdIo1pHH
	w4ptKRYDUqLZlysPvDo8gAKkHAC0wLUyUPDhJWJ2RNLY1/3+c0J4SS5gStDppWUa
	VVosgmFWX2jk8TiCYXPwN2KnmytM7a4Oc4Ym9UwP9EdZDl0E0huw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2f1ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:01:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 508Dccna019903;
	Wed, 8 Jan 2025 15:01:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xueg6p7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:01:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHoQ2t23SSaLV5Juxf6pnP4ozXzN16B0dISp1aPNfXkndsrpYAJU58jbUmxhypnaWriyFpD5ai1H27bJzohm8OGw4LDM4eW2G8SAKKeY+KuGqVmmO3dIW627ptRXG1+N1DZWsXdCoMb/1d7oUPgppqbdjScN9ZAEnENhzngzi6oxDmUIbUH2K/VWUvZA92pb+9RhuyeOI3U8xn8BCMwMnIIvIg9DnothsmN9l+GFIekWcfa9Fc8RzU25eUv1pGo9HebF9yAuov9LpLrq/ec0/MJ7rwJILT30aGJ7wFcb+zYdp/k7CR5S0CnXRb0RmPfpYnHXZnCpr4VuCUWnxj+i0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf0m+22uYb6UpbJFTCrDBHovwGB8kAatybATSc+voM0=;
 b=WcIYcn4gj3t1HJJIWebvtA9wDT5Q9LyRZ4EXiEswrMzHj1G3/HfZR0uIpr7oUwy89adJh6NXaXKKnznh4gqjoyPYOhMK/iF+9dgR6C7Web3SFh6AVK7vWx+FoyFajRpdboRbgG2FHClk1X05ROqjgrScmXeZ1cPGeJdQAPF860LPTNTJnWcs5d7Rx1rNKR9pNJJpu+3GASXr1xEv6E2FQUw/zfixGpvGUGuD8eRhUruL5ZAg/23La58bjx/jrAYDGkTngcwNjKsgJD7AB2RXMFx01BGRzXOnFSVVcTrUVyOrLOuOCb/fp4L1M00bLSjanX3wlwsH0ncyL/bFUgLfzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf0m+22uYb6UpbJFTCrDBHovwGB8kAatybATSc+voM0=;
 b=OkhT536RLkAJhp6RGdHyDMrfFDLHP5sQWCjBl7rN1/SkTXwuZfIw//LeDNZX9d+CUuFiqEDMuJ+bxfusbJTVSxCFXBeSZOabI2AcN1oE6ftaxNum8+L1Q0HO+Eb1jGBwEU6JHAaLvRzQ/+KIUgMYTEXjDh2SLgGvvFfx/Wkxspo=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV8PR10MB7725.namprd10.prod.outlook.com (2603:10b6:408:1e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 15:01:23 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 15:01:23 +0000
Date: Wed, 8 Jan 2025 10:01:18 -0500
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
Subject: Re: [PATCH v7 03/17] mm: mark vma as detached until it's added into
 vma tree
Message-ID: <vagk6hufcszqzrdqfszj23acsqb3xydxadmak7alprt4lvnt3l@dfyn5jtbazjr>
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
 <20241226170710.1159679-4-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-4-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0042.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::23) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV8PR10MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d57036f-6663-47de-4d8f-08dd2ff55144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1hpV+60ZWlXNxpo6Ogsk7UXnNztZwSCE8NtMjQidY6dPPjUWtO1TjFSQI17/?=
 =?us-ascii?Q?vC0d8FTPZfARJJ29heri2psoaYwWOIsD38dDyNFWL4+a/mew4IlvYwbon2g5?=
 =?us-ascii?Q?lfCHKjK++98a61jxEjyut4Z2gmGeez3POB4N5Qw0ATxj8nQ8JfDqz2/t/f7J?=
 =?us-ascii?Q?Jt9sApHliDQ17qkAruUBhqafhmHucPiDrgbO/4XZqDcjpdztCKVV6DevuGML?=
 =?us-ascii?Q?VcROo6Qkp4PQnLnaYUn+Eq7Gtn56ptTW+fuBrvzSjUNooc3YQc6pa9aBIeYC?=
 =?us-ascii?Q?W6wtaMvZujDlljwDYXMJGKjSmSCatrvUW9oC+RWlWveXOXXOIdmOmkaCPTxX?=
 =?us-ascii?Q?/YaPlt2cAUMqkyVW81DPRODZro0nvCw9G9pX5LP5zjwCtI6P9zID++KXEE4j?=
 =?us-ascii?Q?7vmPqjdxGfrGl95w5o+ubcGXp/EmBQtn+IjVEsxD0GU1qmC5Ci7UNkBiFnyZ?=
 =?us-ascii?Q?IK6ArNkFDECG2gkhcFah1su1ddGplIW+oqlzKygOnTLO1MV5Yp8aQijW4oUt?=
 =?us-ascii?Q?1YwzlmRmY6/Kh+xkKQ8RfF3EhSxMCHVA+/NlZIVCdkOQyCoto7IItXh7FLDd?=
 =?us-ascii?Q?d8M1zR85MLxpZlWkclUIHSIsH35xaUcbbAc5UuB3y4kErNH7dFjWJ2zmOpnD?=
 =?us-ascii?Q?tBCL+0nGtRZtGbo2RXjVp1ze1AMrx5itG+xz0xRvJDmJ6pBDHFnpP+50aC7f?=
 =?us-ascii?Q?0VndoESeMf+qt2fSF+st7DFtV/L/u6l9VPp2eiSj+AqqWcSBUERDf7AwsO1K?=
 =?us-ascii?Q?590gfjtd4XKog7sQz+sCFMrzpyfADmw5XvQlPELgCCLwhfr1ysB+D/7ZOyNN?=
 =?us-ascii?Q?eRvpCrRy46BGYW4JmRIGL7BjKnAf+vViOWSNzLNGfOWciI7i6YJ6WhQpSFOj?=
 =?us-ascii?Q?bGdHCU/ce3N+0+oDAurN04+EfpTB64gzyba3vVAfLtMrVjAuKhB0QXVH4cDM?=
 =?us-ascii?Q?3zSeiGwT4Mo/yISg+8lxsuaktwBCOiRg7dwa2+lNfiTvFG2Hudna3nHRJMzA?=
 =?us-ascii?Q?yRmtjLRngmEkSWVuRKMLAGMbehi2dQ9Gppqyx5vhMUHQf1hv7oNbRf87W66T?=
 =?us-ascii?Q?T07O18i2UaGedNtFh/306rksTbvHAynfFkqLJ+QUuq7cdHOioJZYF/WPxE1Q?=
 =?us-ascii?Q?viFzpTlugfuwFrWK1A8CXC8mO2saKmONLbFJpQuNds/2O8PbUv0KKpwiHFCP?=
 =?us-ascii?Q?mCOkN1wdAYtKRm4VQdRqKON/VBoR+hBprRnRpkbe/p/E4+iczwxDZ16sqAq6?=
 =?us-ascii?Q?S2ia0fJJ7gywZGcOvQYfS6yJaVtqloQcbmv24+2048Ue38KdzKNrZQWC/eHn?=
 =?us-ascii?Q?btVl+R/fUcSkANv7EPbKtmmJN83hvJ+drVcqIyKOcgBHzNHbMMcX0YelXMYP?=
 =?us-ascii?Q?doAWIyd+kFJ64Gg5DdyBK8jOeIv3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bXmsxlJtoPFpKd8CwpLRz4i7uUgkAYv0AhlwR3k8JpTVCOLEoLz2i5UUVHer?=
 =?us-ascii?Q?Av334jV9MSntF9pj4APWugpHNy7+GuVpbQUhtTbuGaGHepGCxQ12B5QW38pO?=
 =?us-ascii?Q?+bEnu7T4srsQ+qQJg9bLKVlJS78Yjo0LYpBB5e0gc//veV7KZVQ/JATE5hp7?=
 =?us-ascii?Q?LZ2mDDZ6EBWFRAIRQI+Kbi9V0AeUKiVmzM3cqsiP8lp8nYWtUevRM5pKzjXG?=
 =?us-ascii?Q?s9EcfAjPmGRLrpFTxsk+PBPcZJgNauYCmq/NfhpxziKpp+c78CDtqv3ZQav2?=
 =?us-ascii?Q?YzBGNtWjg7Vvc1c8bK6B43mrInTC5Er/+ENCXUZoSWd9ui9vRuJhp2/MnNQG?=
 =?us-ascii?Q?bIABTZYBXftZQ6RWMckem6W1mbp4bJ/CbUhOvrHqrQY/R5zaKeYQP+06KAcw?=
 =?us-ascii?Q?k90EAwSQOXRzv7yfJzVg0LU4oEgxC7DT3YM7N5ftzYK2Wrg8cXamcB67PA+S?=
 =?us-ascii?Q?VXl/0rKnEEdiiKVgUYxDSrJrLMO5J5wUcoqOhiAyqxqNZa2E4x6axwoj1Q/V?=
 =?us-ascii?Q?yYfDgZHyXa+YUBJ36zhLZZ3nfha6HipB+TBkxZROHZqHnnqS1kl8cn/AxJVe?=
 =?us-ascii?Q?RL/6VUBxucCFy4sNwlLDZ8GTptkwrzZFVdkZTcsFBfL0zRAGmUKrREqYRWRM?=
 =?us-ascii?Q?8TW0Biw3PtGB4f1dN1XkJeT50Hf6ZCPc1IKiCU59FyAVaV2cSMOkPVSoS2T4?=
 =?us-ascii?Q?OkDr9OJUQKQQTIFWq5zjVigrOB8nnK5Qcq5+sFdIyBul34WsJpn1VlHbbr5x?=
 =?us-ascii?Q?vp64ZFJcmKz5SRdqfVQluRI6F+XLMdBQ1RscpWV2qWc+X7ohw5L6n9YASyl2?=
 =?us-ascii?Q?U4UsJAhwpXR3EGW9294HNe7hmyCA3Imy0IW3wfH8JbxCjXuACigUev8a2GNF?=
 =?us-ascii?Q?DGhNmbIXEhZc4M3Vo85cyIx91TfM8SRPjPD1QBcm+ihaIB9W36beUDAG2tTX?=
 =?us-ascii?Q?TRjcTpL8jcx8gijEv5w92Kz//en3RjDWgteKrnhy3k2+X5ELTciWlQCEbHUh?=
 =?us-ascii?Q?U/r8HSqpKawktbDeHl8QUwRdaDo5248JioVdOdSbplty6EhJMWZqDPYRBIQe?=
 =?us-ascii?Q?PJmpgglk74OLz2oVlbL1CI1/U1tdNqPKqO47CYTbaQ/cxnwETftM5Pg4Jj8d?=
 =?us-ascii?Q?lUGL24Z6zURMZGBLAVyI5qtjF58QfNIxFuyCfU3Qb8n0UdabrZGk8iMdqIkC?=
 =?us-ascii?Q?+FLSdSYQS+zxwgLiYl8SYziihsY18WheN5RmNYcemFJ3G/U9Tlpm2My5vlBs?=
 =?us-ascii?Q?6+mqUdV/AoTagatYdTL+S4zQTgwjPb/85N5nWoIKng5+megXQxjDZPRt0xSj?=
 =?us-ascii?Q?EATYHMKD7uQi4lbAvUHaRsCZ8qfPX3eiypjZIH6XMQLCbPtn8f0LeoqqiwMe?=
 =?us-ascii?Q?WicE1HoC9EBqk4J3exAD+xz7lqYdyU68ti3D1whM0SuUeK4Q89hw4VKYyRKW?=
 =?us-ascii?Q?fzZeoRQtSFHXfBEpSlirf00bDrI2wlBJnYl+giYg7cMTDQ+8hO+Xo5afkU+x?=
 =?us-ascii?Q?RunlnGeygR9q8UoFQwNWLg9kKb3s+4nXWOFOprFTvriX+Zky5ei2EZGfJNxw?=
 =?us-ascii?Q?Zl4qzm1+Bv1K1JqtaqscR0Pj/F37OXaX8hPifTth?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zYdcFBAYZT1b7lvXentwmhbyTVCmJOjIaB1GsfvvnrQze5kTwS0Ac0EOWm05ZUYN56dg04M96e+7nhAwQW72r/DY6VCXG2gdhfcoPL1XMtuhumiIQV92P7xqLrQvkyhszmXoQk3JUTrHs9Vk3fVFVQnbWMD0A7ToZYuIQ5su5yR5BIctcD/R9SmF1Qtc1aTrizZThD0zKdzSzrRX3FlBeFj+ojhz3IgAe8Azg9qet/dFasr7Ch5/E8DffczAPJs8MVZR0ML1vCDDGhPjECjuGa+mDeKodMhv6iBYyz2sjVVg6NBNYR91pJx3hNSWIjL0sO/G0NuMC3xLeEwqepK8LHCSgggguiXuByH1OJhwzyyRbIPEBTVgX0Ho/S6YovhJgDrPOMDzeNKGzmVzgCI7wYhaD4hwxEugnuu35rB4Xy3vPXeI9uDScPoUFmzZ+9Icatofv+RuU1CdThhduRPLFVllNE5JxVFA69v9o7cv7JuwVKJlcy1PzLtkc/SeYIWuCB3MqxsdZvThP1H92oBr2Sv8pl5HXG3SjcUKQl4eEwCH/NgY357St5Vl9pkCyOZiePrJQTpf98BMtnUSX+JTMHm5QSROA+V2THPATy7tJ5g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d57036f-6663-47de-4d8f-08dd2ff55144
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 15:01:23.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyFpDz72cqrlCN5Z2qPKXMcYTDHN0TB+xb6ajwqUnC0Fq/4iVgIryLU+eCUrCpsdFRbk0x84Ef0MoA2dle/XJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7725
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080125
X-Proofpoint-ORIG-GUID: Slogpf5WSxuKMKiQQf09NWWXSDnW8KDL
X-Proofpoint-GUID: Slogpf5WSxuKMKiQQf09NWWXSDnW8KDL

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> Current implementation does not set detached flag when a VMA is first
> allocated.  This does not represent the real state of the VMA, which is
> detached until it is added into mm's VMA tree.  Fix this by marking new
> VMAs as detached and resetting detached flag only after VMA is added into
> a tree.
> 
> Introduce vma_mark_attached() to make the API more readable and to
> simplify possible future cleanup when vma->vm_mm might be used to indicate
> detached vma and vma_mark_attached() will need an additional mm parameter.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  include/linux/mm.h               | 27 ++++++++++++++++++++-------
>  kernel/fork.c                    |  4 ++++
>  mm/memory.c                      |  2 +-
>  mm/vma.c                         |  6 +++---
>  mm/vma.h                         |  2 ++
>  tools/testing/vma/vma_internal.h | 17 ++++++++++++-----
>  6 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f3f92ba8f5fe..081178b0eec4 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -821,12 +821,21 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
>  		vma_assert_write_locked(vma);
>  }
>  
> -static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
> +static inline void vma_mark_attached(struct vm_area_struct *vma)
> +{
> +	vma->detached = false;
> +}
> +
> +static inline void vma_mark_detached(struct vm_area_struct *vma)
>  {
>  	/* When detaching vma should be write-locked */
> -	if (detached)
> -		vma_assert_write_locked(vma);
> -	vma->detached = detached;
> +	vma_assert_write_locked(vma);
> +	vma->detached = true;
> +}
> +
> +static inline bool is_vma_detached(struct vm_area_struct *vma)
> +{
> +	return vma->detached;
>  }
>  
>  static inline void release_fault_lock(struct vm_fault *vmf)
> @@ -857,8 +866,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
>  static inline void vma_start_write(struct vm_area_struct *vma) {}
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  		{ mmap_assert_write_locked(vma->vm_mm); }
> -static inline void vma_mark_detached(struct vm_area_struct *vma,
> -				     bool detached) {}
> +static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> +static inline void vma_mark_detached(struct vm_area_struct *vma) {}
>  
>  static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  		unsigned long address)
> @@ -891,7 +900,10 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_mm = mm;
>  	vma->vm_ops = &vma_dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> -	vma_mark_detached(vma, false);
> +#ifdef CONFIG_PER_VMA_LOCK
> +	/* vma is not locked, can't use vma_mark_detached() */
> +	vma->detached = true;
> +#endif
>  	vma_numab_state_init(vma);
>  	vma_lock_init(vma);
>  }
> @@ -1086,6 +1098,7 @@ static inline int vma_iter_bulk_store(struct vma_iterator *vmi,
>  	if (unlikely(mas_is_err(&vmi->mas)))
>  		return -ENOMEM;
>  
> +	vma_mark_attached(vma);
>  	return 0;
>  }
>  
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 40a8e615499f..f2f9e7b427ad 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -465,6 +465,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	data_race(memcpy(new, orig, sizeof(*new)));
>  	vma_lock_init(new);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
> +#ifdef CONFIG_PER_VMA_LOCK
> +	/* vma is not locked, can't use vma_mark_detached() */
> +	new->detached = true;
> +#endif
>  	vma_numab_state_init(new);
>  	dup_anon_vma_name(orig, new);
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index 2a20e3810534..d0dee2282325 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6349,7 +6349,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  		goto inval;
>  
>  	/* Check if the VMA got isolated after we found it */
> -	if (vma->detached) {
> +	if (is_vma_detached(vma)) {
>  		vma_end_read(vma);
>  		count_vm_vma_lock_event(VMA_LOCK_MISS);
>  		/* The area was replaced with another one */
> diff --git a/mm/vma.c b/mm/vma.c
> index 0caaeea899a9..476146c25283 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -327,7 +327,7 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>  
>  	if (vp->remove) {
>  again:
> -		vma_mark_detached(vp->remove, true);
> +		vma_mark_detached(vp->remove);
>  		if (vp->file) {
>  			uprobe_munmap(vp->remove, vp->remove->vm_start,
>  				      vp->remove->vm_end);
> @@ -1220,7 +1220,7 @@ static void reattach_vmas(struct ma_state *mas_detach)
>  
>  	mas_set(mas_detach, 0);
>  	mas_for_each(mas_detach, vma, ULONG_MAX)
> -		vma_mark_detached(vma, false);
> +		vma_mark_attached(vma);
>  
>  	__mt_destroy(mas_detach->tree);
>  }
> @@ -1295,7 +1295,7 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
>  		if (error)
>  			goto munmap_gather_failed;
>  
> -		vma_mark_detached(next, true);
> +		vma_mark_detached(next);
>  		nrpages = vma_pages(next);
>  
>  		vms->nr_pages += nrpages;
> diff --git a/mm/vma.h b/mm/vma.h
> index 61ed044b6145..24636a2b0acf 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -157,6 +157,7 @@ static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
>  	if (unlikely(mas_is_err(&vmi->mas)))
>  		return -ENOMEM;
>  
> +	vma_mark_attached(vma);
>  	return 0;
>  }
>  
> @@ -389,6 +390,7 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
>  
>  	__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
>  	mas_store_prealloc(&vmi->mas, vma);
> +	vma_mark_attached(vma);
>  }
>  
>  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index d19ce6fcab83..2a624f9304da 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -465,13 +465,17 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
>  	vma->vm_lock_seq = UINT_MAX;
>  }
>  
> +static inline void vma_mark_attached(struct vm_area_struct *vma)
> +{
> +	vma->detached = false;
> +}
> +
>  static inline void vma_assert_write_locked(struct vm_area_struct *);
> -static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
> +static inline void vma_mark_detached(struct vm_area_struct *vma)
>  {
>  	/* When detaching vma should be write-locked */
> -	if (detached)
> -		vma_assert_write_locked(vma);
> -	vma->detached = detached;
> +	vma_assert_write_locked(vma);
> +	vma->detached = true;
>  }
>  
>  extern const struct vm_operations_struct vma_dummy_vm_ops;
> @@ -484,7 +488,8 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_mm = mm;
>  	vma->vm_ops = &vma_dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> -	vma_mark_detached(vma, false);
> +	/* vma is not locked, can't use vma_mark_detached() */
> +	vma->detached = true;
>  	vma_lock_init(vma);
>  }
>  
> @@ -510,6 +515,8 @@ static inline struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	memcpy(new, orig, sizeof(*new));
>  	vma_lock_init(new);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
> +	/* vma is not locked, can't use vma_mark_detached() */
> +	new->detached = true;

Annoying that this is done in different locations, but that's a clean up
for another time.

>  
>  	return new;
>  }
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 
