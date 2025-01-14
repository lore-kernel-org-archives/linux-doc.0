Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34AE1BDC3;
	Tue, 14 Jan 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854953; cv=fail; b=OWxDK2QrWKkPeKDuGp/hZrLfAjPkS0gsChsun0hqXOOusjOCwHV20lYqhrytdjbmtM7q4hXMfCpOTpu2iDPFkF5Vnir4CCpGVlsTdi+Ol1mqBC+jbJ64oRajZ5AXdsHsaFYN192qNqi+8lrP2Iuc1YroVfD+c7GWLwjNRfMhlmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854953; c=relaxed/simple;
	bh=l0+XHb9Vka8YkainHqaMp6V+wDHTNImCnWmL/Wp6Na0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hhiueqMWtgpbyzSUQvbf/NTCz+qsivCIC0Ih9fQZnHvuQJjim/fKbaaq3UPKV7+baDc5vqgvPmqdjayRUj0VK/vhHpxz4J/bf0uipDeb6OY2Tb4lASrUap228ZfZEa7VsU0VvX4M6kw0Ogb8VlWKwjtIaGVYeJ8LJyDy0hk757Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lOlHdHAt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tm68tAxY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lOlHdHAt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tm68tAxY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EBftop015440;
	Tue, 14 Jan 2025 11:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=eyaHxkOclhOlDmgFGuQwOkUyxg8QHkxp+/eU1h1t58s=; b=
	lOlHdHAtGViImd0obgrK9vU1zTK7a7F0iTto0iuA1Uj/pRqXoQRA/AQn+F/hn+TA
	vBiFij3IVK/wVzc183N4lMABDyOVElAeYUwnk/B1NP7FObSFgiznLsJCOPfffxS6
	SVTQG4VnNAdJKr+gggylm4r4oxrUlcrIOZBizPAQaIfz+u3ZLk7EOZpI1YQiykJ+
	P1iYIIXZu5d8QVGvPMn2GpksHgtSHQ7UI91BeWfneDC45st5acI26ZcHtATPvL6A
	MBmNr0MeqtUeD9lVdtgALz3HLe6AC8Lonl67nE2ZRpyQNGpWy71WqVLmwfYSwn9p
	syt/hA3s7bbaoASm1NEQSA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443fe2dn83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:41:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50E8nTBS039082;
	Tue, 14 Jan 2025 11:41:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f382bsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:41:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RH33DFOh1hwi6nnEZyYjiQ6CWWpbYOEvzgqDbyUlisW/pX8Tde0Q5qtpVqDBid9FNQPr9bVzrjqWkm29i9Oxv9di8kCuYwsJyRPKG+2h/8rv5i4GLRAyGN0zKqgOivg/nLKfkxkoODi8S+CazlDH3peRQ3marCv56o3wTtrT6eIsP5RyIKG+KEZMWdhodHG+2pqJCGTN89Fmefu9NoNwFVXwexDcc5DdDFJ/HOtR7QoXqPaa1UwdCzemv0Xu6mh9prb4IpiBrjphB0WUxdMR/mbtKrRQKvnvFkkBJDDxVlAwJbmqC/kzd4F9yQBNX/4pe9pNlkyvyGZozfbnqfuoog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyaHxkOclhOlDmgFGuQwOkUyxg8QHkxp+/eU1h1t58s=;
 b=XKcneE74lHaKSD1Ba1Xpwq3Ib7pfAefMtj9TvFyngFOn0Jxt84a9i0568T+y3hmoW2N2KGYiTynwaMEWVVVi7ujWoGdtStnS1d2Dxm2LkZmJmGq+vUCpgetRTiWuRqziCVmEqqsL9PAdDxbgjQiX8LSgE8acbO2GrpUx3pj+tl9N6ZwwaIg8YxkRoeFstT2x3vphwVVYHDnSiYr3heQFipOLPhkorIL5RiopjJh/fsArnMi/eytpCstQ6VC5TDrUryvV7B961bBQ2HLi6gpeS8Ao/vw3a6AZJBzKn+eOOVVcdTdRhlhFn+ycHFuMPP7ZKcYOeiedNldiJDYVt9TMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyaHxkOclhOlDmgFGuQwOkUyxg8QHkxp+/eU1h1t58s=;
 b=tm68tAxYqSs7BpINrcvjgBf05o+RRymtin/zn1HdlVui522inoH8r3eWr1bXTJIW1iX+1AaVxNToTupkInbLeJ99Dw+JJq490g5rYrLoLcFRvSAnH2uQiDYVHtAe5W+OGw72EE/m7TYA/kswrTde4tv9HKNb0HQBaz37BrHtVIA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW4PR10MB6440.namprd10.prod.outlook.com (2603:10b6:303:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:41:50 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:41:50 +0000
Date: Tue, 14 Jan 2025 11:41:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
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
Message-ID: <82bc7053-c3b6-46d7-9f32-25cde26f23e6@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-14-surenb@google.com>
 <60b60b02-5dbf-4bb0-8301-0e2f511bbc7f@lucifer.local>
 <frtb77uu5k6low4zub25h4eqkg5jm4rnul3ncrlniwjrgh7vbb@szwcka2qivp7>
 <CAJuCfpG=4b31T85Wer+s7vJF4WAO7Sd0TCXsDRzETL76AW5muA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpG=4b31T85Wer+s7vJF4WAO7Sd0TCXsDRzETL76AW5muA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0682.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::7) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW4PR10MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 5088f351-a74c-4ef3-2d8e-08dd34906ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVRRbndWVG5Fb1NIaVV6Y2VkNkVZMEdJUUYrRktmM3haZkNXdWlmbzliWHFr?=
 =?utf-8?B?OVBBZUdPTjlBYnh1TGJUMVd2TXRRY1BaZkxSL0x3REJkb0tzbmRQTll1by92?=
 =?utf-8?B?OW5YN0tQODBPUnNQWmoxaVdwS0RvZW5xdDl3emRkdGtIaExUcEdhVkl5Q2Js?=
 =?utf-8?B?WnBSUnhhb2NCeEhlMiswQTlweW9ZaTlaenhGckFzL1NlQ3Rnb25LT0ZpNzF4?=
 =?utf-8?B?YWo0aGoyUExoSy8xYng2NUs3OFh4a0tqWnZsQkRGWnRKVWZWaXBTOU5jdjV6?=
 =?utf-8?B?WDViZXUzOU5tQWZuczdVMDQzSElqanNlcE5IcmRHSkpucDFyQ1RlSFgwRjdv?=
 =?utf-8?B?aC9iZGZvbDZ1R1oxTms0MzI3SUx4MGNQUzVvVlA5OUJTMVVkVytNTU5MTEJs?=
 =?utf-8?B?MDJMejBaMmdieEtaZnhFQ1poZmRjUE9TMElZdnYrU2NjOUJWNnlSQkhWcitt?=
 =?utf-8?B?YkVwNmtMTEs5NmNsMnpuSzYramNIQjFZMldENm1jU0FhcWpmRXlNK2VxYjFO?=
 =?utf-8?B?QnlETzhuWWNLbFJxRVZKRWFZd2d0YmM0REpxL1VlcFlJMklNYmdlOXJOTDhJ?=
 =?utf-8?B?enovRk1NZC9DeEx4blB0QjU2dXJWYWRndXhwb0hTd0VnMWtIL2t2ZUp4V0Nk?=
 =?utf-8?B?T0M2dmsza04vS1dPRDBreWNBNVZIRjgvWFYwQWVSR1lscFo4MzBlN0hlc2g4?=
 =?utf-8?B?Z3JtWW1zNTVUUnpPU0RvM2FvT0I5K1lFdkdOdjFEcWxTZkFWQ1JOU1kwWTlK?=
 =?utf-8?B?VWtYa3JmSnd5Q3NnNlhsSnZuc3JranR1S2xtOFA0U0VMeXF3RThrUXNwU0gx?=
 =?utf-8?B?RmRSOGhKTGJiNTBXTkUyMHBGK280Z3BPVC9mcU5aek8zakRBaWFTaE1ua0J3?=
 =?utf-8?B?VkVKZUY1cnhtWXhJUWtHTGhFZjM2cmkvOFl6Y2JIaXZ6Ym9IMStRMk5qZzdq?=
 =?utf-8?B?L2hTN3BHb1F6Z3hzbE1FL2M2dmRCRzlGcjBiUFlCNnh3UnR3bFdXeHZpS1pQ?=
 =?utf-8?B?QzZwTGR5aUg5RS9pNXY1Nk9BRUNDVGxrZG1ILytpdy80SUpjUWNJRjBNMG9J?=
 =?utf-8?B?OUJSTFBNTFVqQXdIdmJueTRGY2ZQTklLd0NjSEl5QzBKVld3TFdLc3Z1V21H?=
 =?utf-8?B?WEdySEpuVlJ1MzJqUGlBVjBFUjRodTc0emNseGluVzA4TnhSWElvZFRuRlhF?=
 =?utf-8?B?dUxVWjY5MlQxWFFkOFdiVFF2dk1xNGxNRlVQeEpod1RwdlQwVkVWK0dHZXNW?=
 =?utf-8?B?RlNORVp2VWtUUWxHa1ArUVNJYUovWUdCbXpUV2tpSjB5dmlpRDJZU3ZHRDRz?=
 =?utf-8?B?RzdmVWtrMURzTFluOC9qUkZHdVd5SGdTSFRmZTFITVRaL0RLZjRsUW85Z3ZH?=
 =?utf-8?B?RFR1emloMGc5TC9SMFp1ZW5NMUMyRGxFTFFzTHVKTldWSWxZN01vQWlVY1dm?=
 =?utf-8?B?U1kxYlRNYU9Rc1dhbnFDbVE4ZDFOZTNCQXpsTzM4U3VOQklmdm5iYVVnVzJq?=
 =?utf-8?B?NHlvNEZCQWZJWmNieU5KUisvK3krT09JTDFnbk03cm1veXVIaXNoU2pJbmJR?=
 =?utf-8?B?TXN2dEs3YWRDMmNRRGNwcVdxckJaQ0NBdy9yU1VTcC9SRWJneUM1bDJPWlNm?=
 =?utf-8?B?L2FKUm1vbjE1VjdKS2xoN2RobjFGZ0pkQm55MUtzMUE0SEFsb3BMYkdXdUh5?=
 =?utf-8?B?RFdhU3B6Z0JhcjVmbVp4WllYYnp3VmpIVVNmVlJ4cTFQb3BWamtMVThWVWJs?=
 =?utf-8?B?R3hoa1ZVQzBhUzUwVHVVajR5ZFIwOVVpMWRLdGpkZC9GUkNaTHpHNVBaNjIw?=
 =?utf-8?B?TUJoZkdBVjEyNDIvMmhOdDBIN3RBZkFPWFdveTdlREJ4RDFxbUhETmZxRk1C?=
 =?utf-8?Q?9nkAPofo+YDoF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjdZRkhxQkZCa3RVOEtPOXlWYWVWdWIrSkxaSVdBSm5IbkVYZnhNMlNOMVpG?=
 =?utf-8?B?NXBSWHl5eW5aOC9NSm90VS9Hc3lBckdhNElpMVhBRnkwYnFzQk4rNkg4Smc2?=
 =?utf-8?B?ZGw5V3YrTDlwR2ZsYnZhSXJwZEVXVzdwZVNOSmUrbFBLUjVxZUtIQTJ4VE1U?=
 =?utf-8?B?Q2h3OWVVeG11WlcrYUh3bGdERUpPYkhCbHU1SlBHaDJUbkxuclRKa2d1QUhK?=
 =?utf-8?B?dXJuV1Y3SUlHUE5WemNYTGdkVmZyRGJhOGE1S2ZrS1lsOUh4SFZiVVVwVXo1?=
 =?utf-8?B?eG05Z3NraDVGZ25VWkxJWWpncHozN1NIa2NDbG12SEo5dzlJV1oyNDgwdko2?=
 =?utf-8?B?cHd6dHhUQml6cVkzbUcvaWhBZGZ5S2tJeE05akZXSVlndDZmVTBtd20rdEU1?=
 =?utf-8?B?eXdLb3B1c2I5OUhJSlZ4WXA1aVNzUGZmWjZCMWd6K0s4OXo0dXd5Tis0NjZo?=
 =?utf-8?B?NkEzWUlWOVcxUThxNXQ4azZTY0F2SlB4aGRSaEt3WHh2TmhhdUdYbUJOMkh5?=
 =?utf-8?B?UFM4ZHFrZW0rWHFZUHovN3BoOGNwOUJzZzVkNThMdm54aEtyZ3FXaDY1UzNo?=
 =?utf-8?B?V3RTQ0RSZXVRRXBGS3Q0dCtIVTRtV01VR216MXRkNS9ORlZkRGRDeStwcVc1?=
 =?utf-8?B?OHFTaDhkazM5dVdsa0tmZWxJRitsRUtvWWdZblorYkppWnE1c1pjOG95anNx?=
 =?utf-8?B?UzR0aUF5SWtJaHovUHBiL1NwR3VvYWtQTUw3Y0FRejd2ck5yTXhoMjdEcDhO?=
 =?utf-8?B?WlZlQ2RCN3BoUExmTHF1RjNYVDBmSVJYR3VWVW9la0lYaW9ZSS9ZOUhEOXcx?=
 =?utf-8?B?UnNQWWJlVkxOa0hxOElvcEx4RW5PbTkrUGNwVm1WbG9UdVVFdHQ5MGtrY0V2?=
 =?utf-8?B?TWg2eFlmVG90cUhLdE9PU2pxajBwdkc5alZVVG55ODlGQjRnVnpyQ3pWaUF3?=
 =?utf-8?B?aWJ3eWpaQVhrQi9hcEo4eXQxWEJ1Q3hGREFVT2tweldBZ0htL1lLeVZXTEIw?=
 =?utf-8?B?MVVYY0RQNlRSNFJuNGdZc28xTllLb2RQR1R1Vy9GZjRBdEJWZUV4MVE0TEta?=
 =?utf-8?B?ajJDM3E3UE9pT2ZtckE4NU5tTWhpOGMxS1hzVEMxN3Q0bjJiaEF0dGJOZnB6?=
 =?utf-8?B?czNWZTlwNU9TMEUrTmxjK1o1NmIxTE1Wc2ZuL0pwSGFRc0JzeUhnTi9pRzBS?=
 =?utf-8?B?UE43Nk10a1Q2MHJQcy9QUzBhQ2pUTWJTMkdzVmYxQ1p3ODFMdVU2d0NmT1pG?=
 =?utf-8?B?Ky9vOForVWc3enltZTRYRHhYVU1YbEUzallWWU5rb2VjbGxWSWlKOGRJbVpo?=
 =?utf-8?B?WXhPY1JPNFROQUIvb0hVc2wvOWxsWFQrRFptRGZkQkhzRmpkcW9jZWVjeFd2?=
 =?utf-8?B?ZlJmZzk5V0V0MktXUHRyUHNRUDVaYTBOOUs4V2UrM2p0SXQ3dC9Vd28zQWNw?=
 =?utf-8?B?SFQ3VUhPUHlkQkQ2dnJicWFRVGRVNWRtMzQ0WGhQVGxRaEhFMFBKT0RLUGRF?=
 =?utf-8?B?cDQ4alV1eCtZemZtM2JGcmRtU0cwb01OWkl1NlUrWTRHZDBlbVliVytyeHQw?=
 =?utf-8?B?WG5zWGJCMHp4Vkh3VXZPdXl3S1gxNTJEQUFuYnNJQVhScVVyTll3RTYxQ1Ax?=
 =?utf-8?B?Y1JlNWZ4NWY0OUZlVWNVYXRUdldEejA4WnJjTHpPaG1iOGdRaFJ2a0tFY29Y?=
 =?utf-8?B?cmdEbC9mSlJZdmRZdUw1RCtOd09uU3Z5bmZlamhmcm94elF3NnUraE93NFBZ?=
 =?utf-8?B?SGoydS95N2pCRG5Rd3VUYlo2MUorekFKdzB0c3lZc0lxRmpWSlZUNVpobE9J?=
 =?utf-8?B?enZPK2pPMEtpQjdWUEc3emZFcUJ5YUJEdkl0RXBYRk1YOHpoZzFXUTBRa1Rs?=
 =?utf-8?B?bVhSWWYzZGdRVXlLdWh0SWMzKzVVTVhJYUhMOVJvdGtjNUpadzFiQ21jNlhu?=
 =?utf-8?B?WHQyaFFuSFNwVEcwYWJZVGZ1NEZiTG5la2FlaTV0aG9LSzByMjNzcnNUL2Y3?=
 =?utf-8?B?bmVuZHdER0ZpdTdKeDJKaWlqbDgwSkxRT0V0L3JGRGIyTGplZU95ZHVZNFFL?=
 =?utf-8?B?amo4dUdrRDFLbXVsajViVXFJc3UrWUI5ZG9wZWVMM2FBOXk0RnFPOG53eUxU?=
 =?utf-8?B?OVQwdGZRaVkxK0kzRzB6OEZyQkRjVEFwNFNjanR6NExSOXQ0N20rUEpBQkRK?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zgEDZCN+qVVVhwfRIw9w6NcLLXOsiUAMjF605C5siLoo4/OhElW3Yc+ow7FavxfVXTSpjxvnVc30pVz7/4SpivLojt4TLZ39wvWjw5POcCu/T7yK3XRZ4jcFOkarWadP4433TSc8odLSAs4/k/PDSawl38XkVRtd+yLEeamHZQAAqDB3EZjBTrPZio3b4eSs6mr1hXdqKzBxmffxW8V5SNu0/TSspdq68/Pz7Ak/w1+TBWsRNUm7fl7MwgYSyiTEmV1m9ksLKzyLAv575p3G/TXNiW2VHT2Cx0N8Ra7ZAwzlD0r/Tq9RYyo9WOXtjbX11quuKuHCJ9Obu2ZUKTFNM/vv3vj9pnldpHMaKN2x5rs6WJ5P9wXaTzJo5FZ3Nn8vgCPoljfhMf6MDhIKADRkI2AJwx6pKwguhe854ASl9DYntBRrAc8M0tV+qxXx4+s7G6ytmBnPkgEC2l/ZonGV/gheWLUxXWzO+UUuE/6oi3PPaKIw3efgTGKH/Yj8Vz9/k536epzCiTGETHz3MfhNYFVK/2acx8cK8NxeVuCYQ4QauCeBwnMkWO0ILUR8OP+iDuFHf4b9+0/YTWFz4CriiJGYxBKF07JkmbSYwK5B3Ek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5088f351-a74c-4ef3-2d8e-08dd34906ec1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:41:50.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEbe3NApcw0cTXwpHFAmzuop9PvR+hkK5SGv7gyh0YGmx7PzQkmvd7LfpQkXIVq1RdU88ZFLn/aUJRYtwdiFerw+75rIRHkEO2vgIgoSaUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501140097
X-Proofpoint-ORIG-GUID: _Mf0LMc5v4m9nrv2fhGe0V4oocOAu2d1
X-Proofpoint-GUID: _Mf0LMc5v4m9nrv2fhGe0V4oocOAu2d1

On Mon, Jan 13, 2025 at 09:57:54AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 8:35 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> >
> > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250113 11:21]:
> > > On Fri, Jan 10, 2025 at 08:26:00PM -0800, Suren Baghdasaryan wrote:
> > > > vm_refcnt encodes a number of useful states:
> > > > - whether vma is attached or detached
> > > > - the number of current vma readers
> > > > - presence of a vma writer
> > > > Let's include it in the vma dump.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > > > ---
> > > >  mm/debug.c | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/mm/debug.c b/mm/debug.c
> > > > index 8d2acf432385..325d7bf22038 100644
> > > > --- a/mm/debug.c
> > > > +++ b/mm/debug.c
> > > > @@ -178,6 +178,17 @@ EXPORT_SYMBOL(dump_page);
> > > >
> > > >  void dump_vma(const struct vm_area_struct *vma)
> > > >  {
> > > > +#ifdef CONFIG_PER_VMA_LOCK
> > > > +   pr_emerg("vma %px start %px end %px mm %px\n"
> > > > +           "prot %lx anon_vma %px vm_ops %px\n"
> > > > +           "pgoff %lx file %px private_data %px\n"
> > > > +           "flags: %#lx(%pGv) refcnt %x\n",
> > > > +           vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
> > > > +           (unsigned long)pgprot_val(vma->vm_page_prot),
> > > > +           vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > > > +           vma->vm_file, vma->vm_private_data,
> > > > +           vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
> > > > +#else
> > > >     pr_emerg("vma %px start %px end %px mm %px\n"
> > > >             "prot %lx anon_vma %px vm_ops %px\n"
> > > >             "pgoff %lx file %px private_data %px\n"
> > > > @@ -187,6 +198,7 @@ void dump_vma(const struct vm_area_struct *vma)
> > > >             vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > > >             vma->vm_file, vma->vm_private_data,
> > > >             vma->vm_flags, &vma->vm_flags);
> > > > +#endif
> > > >  }
> > >
> > > This is pretty horribly duplicative and not in line with how this kind of
> > > thing is done in the rest of the file. You're just adding one entry, so why
> > > not:
> > >
> > > void dump_vma(const struct vm_area_struct *vma)
> > > {
> > >       pr_emerg("vma %px start %px end %px mm %px\n"
> > >               "prot %lx anon_vma %px vm_ops %px\n"
> > >               "pgoff %lx file %px private_data %px\n"
> > > #ifdef CONFIG_PER_VMA_LOCK
> > >               "refcnt %x\n"
> > > #endif
> > >               "flags: %#lx(%pGv)\n",
> > >               vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
> > >               (unsigned long)pgprot_val(vma->vm_page_prot),
> > >               vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > >               vma->vm_file, vma->vm_private_data,
> > >               vma->vm_flags,
> > > #ifdef CONFIG_PER_VMA_LOCK
> > >               refcount_read(&vma->vm_refcnt),
> > > #endif
> > >               &vma->vm_flags);
> > > }
> >
> > right, I had an issue with this as well.
> >
> > Another option would be:
> >
> >         pr_emerg("vma %px start %px end %px mm %px\n"
> >                 "prot %lx anon_vma %px vm_ops %px\n"
> >                 "pgoff %lx file %px private_data %px\n",
> >                 <big mess here>);
> >         dump_vma_refcnt();
> >         pr_emerg("flags:...", vma_vm_flags);
> >
> >
> > Then dump_vma_refcnt() either dumps the refcnt or does nothing,
> > depending on the config option.
> >
> > Either way is good with me.  Lorenzo's suggestion is in line with the
> > file and it's clear as to why the refcnt might be missing, but I don't
> > really see this being an issue in practice.
>
> Thanks for clarifying! Lorenzo's suggestion LGTM too. I'll adopt it. Thanks!
>

Cheers guys!

> >
> > Thanks,
> > Liam
> >
