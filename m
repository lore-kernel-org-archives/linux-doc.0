Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58A1157472;
	Tue, 14 Jan 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866785; cv=fail; b=BFMjDE1FCGGqScWkdMy4snWH/uugIiJXjAoAqJepySzPBf2vEcrzNr4LVYaSkEBgnAYGkSNRSKfiz3YpE7UN4K4gGgUDwaaMy6hw0tPH1p3FoY1AchD5T3efeRm0ffXzISfWiufywFrAgrSPrlaTpnikd0Fx1AK9EVOz7VIBCrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866785; c=relaxed/simple;
	bh=VcHV9Zl616D+NA2UstW0kOKC9IJ+O43DnDHRK00sJ/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bs+HbobZ63T7uYN+FpF+hnY+D+dnlK89r5Muy6iKL3MV3CfGwz3rbKZ3Vmd0wT868lsJtyf39AQqL5X4Xrks2t29OzlQgSz4MBFtjeE8XM1x1Rr2TmN/kGXqWusQHxhGkeqc/LYfpFSjqWkWG1yqZAQxIsqH4GBYGurNWvahTqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N3Z7kUwu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qmmkV/pp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N3Z7kUwu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qmmkV/pp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EC0oc7009425;
	Tue, 14 Jan 2025 14:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=TCsJjIpyBpLu2zw5XbeNiDrbVKjgnrUVbjb9NSqVKPY=; b=
	N3Z7kUwuj9qELgnmUzJENtmKubIOGwVxmavYv1/VIPIDy7VaUOeZQ67s7iEWZcmT
	FoOIL0AShFbnFPbJLzx8oN33mY+PsH4QnVvmTV1JjHaW3FoN4QNVfdPL/u/GRI7K
	YD2/QFHiAEl6S9jg1wQBT7wZgVFYHh6Q9hoIqa6GzkJ3eQ+cBo//T4ZBYk9PPTlb
	TIz/8omxsC4NU+HsSLhz4OxhtiJvZBSOB2NHOUay/UMoAgQTbRXhKZGz6VgB0so6
	q01tYTDGsqHuHA2y3kXLLOMTEkymweyAxjmev25Po8HpvB94eeWKmAwYaU7DBuh5
	Y3tYePfJUS4iouwKN7bAJg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443g8sdwq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 14:59:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EEaQBx039281;
	Tue, 14 Jan 2025 14:59:11 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f387ua2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 14:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbCZv72Ek2vgybrRDlssJw8Dp4OsSXj655o106CLE6llJ1MKpbrJGiyDOhR2AmdW0v68JLUyuu6+zuatx5IRsNMt6vub3+5QPYemwRu/ikXlq9fC0/UGObZwwE5lJmKNTw30wIuvmbiBjdPVVl/R45pWLcImPt0Jq4pHluPYtCsjeaTcX71h2epa201Bca0OHF86X65Aa8zBwcPPW2exmz2icGlk3TkC6IZoCa1vUuHX0WEYcjTjpIjrAcunMvRupdBr+MDUg+Hc4XhEG0p4R48MPPxH/dIgLK1BzezDKEmp2jZzVCm4S3XnjM5clBCpKN5uuA1nRTz/DGpOlLKA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCsJjIpyBpLu2zw5XbeNiDrbVKjgnrUVbjb9NSqVKPY=;
 b=DLGft/RovbSRV3isChXfJlAZpoA3mWUhRZlSpoTwZae5fXZRcr77n3mtfS1D0JCHALNVlIAnCb43Ho7kIN+SXFhQryCnemTTaQlAHDLM9T2p+bfBYEu7BJBYGuB5K8Dwt6sx5wzx2UTlHMDswvFWE/yIAmATmny1GoAsy9qu/l9DAcQpm1L/zj329ettGGiRv92+eKyxdXLLCdHrNJjUUJcohL5gpykFJ0fkV+bdJReRRKQwXegN8Xyd37NGAUgrpeHGExWQtXCnRVNGFvtL/+QY+qvYOStTV+MKSYzAUnJfa1SjcGiK+kGNIC2uZbnNJWwgWsigt2JAiJc7RWgtZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCsJjIpyBpLu2zw5XbeNiDrbVKjgnrUVbjb9NSqVKPY=;
 b=qmmkV/ppLHLI6g0jbhrgRenxEYm4nZK64YvN9NJqxAcJaYYfGDorcV0XDwm1Q6h71CkDfViS38rz3m/iPmT91tjNl75em5b4v6UuiUzoqAARYQotZQV8OpH1gxh1zRi5UMLONw5d4vMCX/78+nQXnCixjArGFncef4ITtYDhpwQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA1PR10MB7486.namprd10.prod.outlook.com (2603:10b6:208:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 14:59:08 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 14:59:08 +0000
Date: Tue, 14 Jan 2025 09:59:03 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, peterz@infradead.org,
        willy@infradead.org, david.laight.linux@gmail.com, mhocko@suse.com,
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
Message-ID: <ajefxu3ed4oz2uomvmc7u4fj4zj2x2lvzmec7okif6stjptc6l@i6wmo4wuwgh3>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, peterz@infradead.org, willy@infradead.org, 
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
 <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
 <CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
 <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0025.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA1PR10MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b62ba5-9d45-4d1a-096f-08dd34abff5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0w1eHFjR2t4RDVCTzJ0VWwxWTJCY2F4Z2NhajB1bm9haVhJRVFURis0OU9R?=
 =?utf-8?B?bkdXdml4dG5DNlplWVJZTm91Z0IvZFpudW5neGpyQldSZjRRUytMWldCTktU?=
 =?utf-8?B?VDhRNDZ4RCsxSElrYTVkZUFmWnc1WG5hYXFCd3J6Y2dZVFZwWmFzY2tOWmZq?=
 =?utf-8?B?UnZ3WlFCSDFXMjh0QmcyRmFJb2k5NjlhUUxWdHpoK2VESjRmZTBTYjNsRkNT?=
 =?utf-8?B?Mlc0dmY5MUlKNk9lSTZrWFJWNHc1cWczdWhhenl0Mjkyc3ljc3Z1NlQzU1ZL?=
 =?utf-8?B?SVNESUdGb29IdGJHRVdIZWhkUnYzWkNqOXU4cmtFU292Y1RlcnVCRElUMHRS?=
 =?utf-8?B?OTZsbkgxMkJwQ1JxRzFUOGxqTzJLang5cHhxdmgrcEY4aUV3VW5zZDIzUk5l?=
 =?utf-8?B?R0Fjc1FxaER4MFZzRWRYUnpCMkltWWRHM2k5UFJYaC8zVkVXM1lQdXc3a2xX?=
 =?utf-8?B?QkNBNytZaDFObytsUVR5ZVEzRUZvM0xDdTQza1hDQ3ZlbzlBckVweldIZG40?=
 =?utf-8?B?d01CeXlycldRYjFsbFF1VlNKYWRQbkpmYkI5dGZTeUlaSkNrM2xKNmJqT1F6?=
 =?utf-8?B?RHBMVmNFZDRWM2dmd3hMY3drdXdUaGdkOWdWMTB2TWNIdm50cW42S0lUNitM?=
 =?utf-8?B?MWlvcDMxUGRJMHB3K1U2bDdyWVpGQm9ubjduUWNLVjdHWUVDRXJ0OGNERUFj?=
 =?utf-8?B?QnJtNXdhK08rLysrZ0RsT3pub0pGS2RwUUdnRTVtdk5SQ1pRbG13Z2grcnJU?=
 =?utf-8?B?cmJENmkvelhtVFdvMkU2SVA3UCs1RTFZMnFrQjR6Sk1EV2pHYlBKMEZCUHdw?=
 =?utf-8?B?TU8ySmlxa3JpUFRIYzFyZWZpd0hhbWh5WjFZY3RkMmZRQ2lnSDcrSXZZeGlR?=
 =?utf-8?B?YStuVUV0ajFNNmlrWkdpSEkyWjY0emwvbUNwQVRzenBRVkl1aTVTemlKelp2?=
 =?utf-8?B?MmlXSmt3ckRsUXFETUZScE11aGRHNGhNUU1YakxobHVnWU5GYnJvamgvaGpa?=
 =?utf-8?B?WTZjVXlBTlB0ZHNiZE15NFY3UGMzWExPWXpEaVBDUC90K0lSWHBMVGZrYUMz?=
 =?utf-8?B?SkJHWUMvbjJBUTlpOWpDNUlheEpmMldzSGRNL1FCZERBWHNlNGV0Z2M0bUQ3?=
 =?utf-8?B?TytobVdsTXBzMHE3ZHFZcCtsOUFwZjk2V1F4b3h3eUpuYXF1cXdIeElQUDdQ?=
 =?utf-8?B?YVZFVWFiV3ZGZ1N2UHBZN2I2eWdrVHUxb2VnR0xucDRuWmtXbE9xbzc3UG1Z?=
 =?utf-8?B?aDgwY1RMbGlwdkdSVTFRbHd3RnhvVDNYS2NDYXFGYWdRcy9rdHhDU1pPWHVp?=
 =?utf-8?B?NEVkZGlqQUxsd0dSOU8wT1MrNU5LcG1EMUwwMXpzL3ByZERiTlBpZTRDYTJs?=
 =?utf-8?B?UlVhSSs3NE0yVTFPZk53aThhbnBheWRPNjRhWERxaXE1MmxxSjFTSmtnZHV1?=
 =?utf-8?B?Zi9ZZWtFYzY3bVlJbzhLS3hFRnJ2eElXNEluK1BMdE82RTlnMmtVTjdpdjJ4?=
 =?utf-8?B?aVNHVUhtcXdvaFY5N2FQSDBLMmZGV0p1TE1RRllJMWhOM29ZYkRwaGt4bUlm?=
 =?utf-8?B?cXM2N1YyTkkwT055T3RsZlp1aXA3OVNRcjR6cnZCTkhjOC9NN0EwRDU4ZVRR?=
 =?utf-8?B?NXk2TnAxTkhtOHNkK1gxTDJwMlM3aDJxUjVLSHcxQnRpR3g0NFJzdVFMbWQ1?=
 =?utf-8?B?R1l5OXR6Sys0dW5WSXh3NFJMekdQNFVhZUoxbWNFWFU5Mi9EUEFUd3NEQ3ZK?=
 =?utf-8?B?R290Rmowb2NGc0hRUkxQRjRsZ1FzcE15UmtnbS91UlI1NUQ4ZzR2cTloNnNa?=
 =?utf-8?B?ZEtKYTdPY3k3a1l3czB5ci9zb2g5aG9admZxRUdibEp1ekVsMmJ6ZDl5a0RF?=
 =?utf-8?Q?5IrPeHsaggotY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2hXTmlkWkRKWkNFV0c2bkdzbjVHMHFvcUVPOXN2Y0s2OTBYWEk4M2FxU1N5?=
 =?utf-8?B?ckRSY2hsYnNBNk1JT0FDcWlVV1R6SGNsOWFidC9LM1U2WU9UenFaYUx0MTF5?=
 =?utf-8?B?dlV1OVZiWUhoVHhwQzgvNjVoemlDVzFRdllxUEJFTzZwZ0hyaVVMaVVmRUI2?=
 =?utf-8?B?OUFhdjUzdFYxTDRhWThkbStUcVJlMEpZSVp6WFJvdHhoWHdwQUtMZDVaM2la?=
 =?utf-8?B?c085NENEUk4zQVVRWThwdDVaNXd6TmhSWnozNGRUTkVWeEJrRmRtNmNTVEtj?=
 =?utf-8?B?cjJhdlFyYU5PMDZIeHdNMExPRGxyejR5cjNHdWxkUXl2eUtmbml0SnhRN1h1?=
 =?utf-8?B?WlR6bEJ3dG1wc21aODVyeXJEakJJcEpzMkZKbTdtNm1VeW4wcW93NXNpc2JZ?=
 =?utf-8?B?RTU0ZS81eGxBWUxJWnBLTzluS09xc3UrWkM5bEtoU0hVUEpUREp6UUZyampT?=
 =?utf-8?B?SGFKbWlGaEF2TlVQVEpmdUUrUTNiWXF3ZFdCcWNJZnJtQ1hNSFBtam5VU05C?=
 =?utf-8?B?QTdBVFVEM3BRR2ZkZVQzRjJIc1crVnVqRC9HU2tMMzFXM0ZqMXBORGVxbTFV?=
 =?utf-8?B?em1HZEhyNGdRLzFNNlNuVkFrVUQ0UERKcjA3M2UvVlduL0RKZE05TU1KaTU0?=
 =?utf-8?B?WGlDdlBWM1daQnhpWWIveG8zMGp5TTlXVVNCc24xeVVwVUg0OW5HSHBnWEp4?=
 =?utf-8?B?OFVUL2VUeTNib0IyNkRzUjZKWGZnUy95N3dlV0VzL1B6QmNmSWxqWFBTWUlq?=
 =?utf-8?B?OVYraG85UTNtZDRWUDc1SkFqRG82d1BmWG9yTmdoLzJjL1gzNWZDSzRpbmZZ?=
 =?utf-8?B?dEJNWXQ3MEVXYUVuNnBueE00dzUxZmxnajl2d1BNZEpQR0czN0ZscE5xc1Vy?=
 =?utf-8?B?eW9KdTFmSWZOZjhEb0V2cXBCeG1PSDd4YkpGbzFKVGN2ZGpKQkJwWG9kcFo2?=
 =?utf-8?B?ZkRpdTJjMWtCRm9FQWRqRXVzUGdrSFZzQnVwYVdXd2piT0ZUSkszODQ3Tnd3?=
 =?utf-8?B?Z0JFblpjb2JwSm5adVBSSVdiUlRqVi9VdDBrMUJXNnBLMnVoejd0T2R1NkZx?=
 =?utf-8?B?eG5TSGxwOWpDZWhHMnBOSFp0Y1dYbVRKMTAzazVydjdGckpwdyt6MGp6NXpI?=
 =?utf-8?B?NDBlWDQyYWJBR3RnM1JKM2FVNXNxYkZaaWhabUhhNzVZb3lRRkh0VEFYYkhQ?=
 =?utf-8?B?enJDSHpxUkQ5S2VvcERMbnV2Y2Nxd0N1dmJ4ZEJnWEpodWkrcmZ6bmxvaUhG?=
 =?utf-8?B?elVSbGFFdHF0eFk4MGFLNnBlTlNrSU5qSm14ajlCNFR2elh1V2w0bjBocmZh?=
 =?utf-8?B?eSsrQ0hwN3drbHM3YklsQkUydVEwazJ2NVlFWnRRUEl5Sm5MdER4bHNsdC9x?=
 =?utf-8?B?WWtQa3hkVms0MXdWYnpzdGhEVTF4ZFpSTTFMMHRBYnFHYXRzKzBhSUdlcnZW?=
 =?utf-8?B?QVFrTXBRd2NQUk1pVU1vWVJoTTNCald4Zmwrc3A2TFB5b3NYaE1LNGhKMDZL?=
 =?utf-8?B?YkRSZTJRbC9aM2hzUVVqNEh4RktJUlZWalZCaDhjZENRZDhPY0UyR0dZeTd0?=
 =?utf-8?B?UVUwR2x4Q29kei9tZ2FVZ0xFSHZwTU1ZM0hxRDR6dmYxYzJHRllBOFpzaUhq?=
 =?utf-8?B?TWxJMmsrbWY4STBjWGF5Znd3Zi8wMk9hRC9TRmt6Sno3VXMxR3RHWG02Qktj?=
 =?utf-8?B?eXNJTGhDOFFZUktFc21yeTB6cnZZejlNL3ZDTVVQVjhWM2wrQ2NJOUxscTFx?=
 =?utf-8?B?V1R2anJXREIvWUVUek9neG5VYkxGM3dUREtuVG9oV0lQK2FVYkhNYi9IN0ky?=
 =?utf-8?B?eGFOYkt0ZXFPYWsvYjRDenZpYTBoazV4ZGxhVDRQTDh4NWxBVzRsTUJqemF3?=
 =?utf-8?B?eVFib0FtTjZOaG51ZGx1cWNGYllDQitKRDNhWmtVaitTamhSWXVybUFtVk9P?=
 =?utf-8?B?R2VKNHFTMmFMSFkyRkhRdnBBLysvbXNTa1FLaVpUZkZNeCs2UGgzNnZiZU94?=
 =?utf-8?B?T2ZocnNtait4Nk80d1FLYVAwT3gzZG1rWUsrZ21sSGhkVThaRWVlYWNwYmhi?=
 =?utf-8?B?Q0RwRlBnOXJCME1oRjlMUFNNWFM4M00wZ2srcnRsd3FzMDl2RzFmOVV6aHBM?=
 =?utf-8?Q?ae3UmmoN3rss4ba/rhZCz0EWY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nDuKeITCcs/NI07eOa3QFHajNbDLwovi6Su3WI6neUsReSAng2t4VPBDVN22/czHzsJZwoZc4YTaCx6Okv6VLFKbOVOfj1nF7hkZVZJ6p29l4nERphRgT6e3o84XXhxVSJWBypnoP2fw44G0+moPmxROyg8mCRbO/HO0MsDf+eEC4+tuRCBXeFqbfftJ28/8/yVgNTPdfDaZip0544uUVj3/tsfirjANYZuY8qpxBc/wfxh4wmTsrJu4QN//nGkMjWU64ogzvTgBmEEbwraoGvCkPV0L7JF0kMuJkxwqMAKq/YvKM8tc4l8ZxDEDT8oEU4VwcBWVDsmPeOB2BkE2BT/uq3I0oKad86NQ3x95RMFr/EIuJJ/3ncKjgVVQIc5Bbx6H/duP7jIdwuJcRe20YLwd814Dg0cdPhaoeNXFpHlcyw+b9mTRcIqH4wBBxm8oGmY2xEXmtEfcQHdrrBiL1rajYgLjPSTtBAsJpwJpPxwe6AXLVdMjcH3VmlCnm+GBW/rpvySi2MqSU2EMFLFqotTCBsLs0bTdpM4OE5ar7uj8BsXW1+4gTgtDTUwgPOaWriVRPV4R2zH6A2M9n2wfLGAFnPPdG4mgDHHjliRM5Z8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b62ba5-9d45-4d1a-096f-08dd34abff5d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 14:59:08.7108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaG/4R6Is6TELShM+15h1hRECNx4FgFtbgMlhXNCXqK5lTQ/MszGxJTouohzFCT56eOrN88aOKPHn7gBCWfHgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7486
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_04,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501140118
X-Proofpoint-GUID: X1FOqBJ7tB6tTLsRpHRK5ZQpeNkUnhg6
X-Proofpoint-ORIG-GUID: X1FOqBJ7tB6tTLsRpHRK5ZQpeNkUnhg6

* Andrew Morton <akpm@linux-foundation.org> [250113 23:09]:
> On Mon, 13 Jan 2025 18:53:11 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>=20
> > On Mon, Jan 13, 2025 at 5:49=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > >
> > > Yes, we're at -rc7 and this series is rather in panic mode and it see=
ms
> > > unnecessarily risky so I'm inclined to set it aside for this cycle.
> > >
> > > If the series is considered super desirable and if people are confide=
nt
> > > that we can address any remaining glitches during two months of -rc
> > > then sure, we could push the envelope a bit.  But I don't believe thi=
s
> > > is the case so I'm thinking let's give ourselves another cycle to get
> > > this all sorted out?
> >=20
> > I didn't think this series was in panic mode with one real issue that
> > is not hard to address (memory ordering in
> > __refcount_inc_not_zero_limited()) but I'm obviously biased and might
> > be missing the big picture. In any case, if it makes people nervous I
> > have no objections to your plan.
>=20
> Well, I'm soliciting opinions here.  What do others think?
>=20
> And do you see much urgency with these changes?
>=20

I think it's in good shape, but more time for this change is probably
the right approach.

I don't think it's had enough testing time with the changes since v7.
The series has had significant changes, with the side effect of
invalidating some of the test time.

I really like what it does, but if Suren doesn't need it upstream for
some reason then I'd say we leave it to soak longer.

If he does need it upstream, we can deal with any fallout and fixes - it
will have minimum long term effects as it's not an LTS.

Thanks,
Liam
