Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE44230BE9;
	Fri, 10 Apr 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843524; cv=fail; b=puLuzb/w0+NUmFwwveka5t1VQLdXXiWlXydR92G+GAVH3sRR1jwVsrP9498SJTKoe1zDuxmgv/nrRCuh8Sb/nRZGNlYBPvg4lh7HrToVRCj2UIWI14+JPAS+3eEd0cl7ErqJuTXC9tGHgd/auCS2gF6HSl4l/rs4kTZyFaupxlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843524; c=relaxed/simple;
	bh=FQJ6cTT6bJht01VmLj5jclq+9eV3o9INaOWrI2FyiXg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sSoX0vmvUKvVom23bROw4O0rNBCprgmuzkJyoZ73Uxxu5GOV3f06A4WuMIZMH3Kr7ZnmrKAMF7zGilkhhBp2k/00x3achH4Q1nUuMfmu/gNf/sdqIWNOYOblq1Gww8Dxs183Yv3YR2gzXRNBWMOOWnIffzljQ16K645YCxteo0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IGWvxYZs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xj0J6can; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IGWvxYZs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xj0J6can"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A9137C3133335;
	Fri, 10 Apr 2026 17:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lXZGma060EGhiyfnf+H8YgVPRdZWhqNOTRM3j9VeeYE=; b=
	IGWvxYZstGjGKh9TDKdNHgBTLwEu+46n3qHo6RPbqqmSlZt0igW8FEEP/MsHipzD
	sr7WChLApdUneA20IL0k/whD+HgtdjXGDGKmpUYPtAmz96BbESgiktNIjLy0NRDl
	CqrTJPu3xpjRsknGk7HbkL8d1t9Hkz6Buk5YFWdGxtFDV3vjODIjl2QyfScHlsHe
	MkisxtFLUf17RKJuadtO6TKP9Y+habKlfliB0IAIW9H4Qf/MOfjdPXimL06Ug8Cr
	3pVL2PYKJjQ1H10T/BBQROT0/KhmFf9Z1XLrmMBZDCy5rjcyxU8cnBRJ2UcraTAE
	ubATNl+Tgjwspkt5GZgN3A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqbt29s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 17:51:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 63AGgVa2026147;
	Fri, 10 Apr 2026 17:51:31 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dcmeea3y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 17:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdoLk5TiRx2eLTHSklqrlsbfoW5mnv3ZcPoNhF5q1+SiSnPq0sCXxPQiuN2CplknJlXpIc/RIJN1Dmqo/kmY5KNsF7Gn5oKUUFsPcvdnhDUxI5I/2xJ9BzVyk584kA1ne6p2TDG8qYJUERR6FKIweK+VsD36ycQnPxesPEFfMFCbZgxMInh7AC5p+BL3MJnoinhiK+cGNrog+wZRepnXH4OZ/P5HyYq/HKePCPGhS1KLaNsNRltLNSsukEcw4ldP3BQT9Kd145wLA6o0+j9qXjE7BffHbjvLE5I887lf4024xvoIDPPl4NZQj2pXtNMTEA2ghou750RhxHybktcwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXZGma060EGhiyfnf+H8YgVPRdZWhqNOTRM3j9VeeYE=;
 b=lJoq11XeyLA12tKEyp7/kZ6TwvoF2Z1XcTLw/IPy608I3tMaUvJKAg6GbqvbpVghAVHGJjrShLKghO0r4D5mwYzr9BCz7X529WRR16aAzfgI+o2u0anjeH4Z1XK4dPgSDD+CHv3r7zXQL4u25SnGWUj3KgqAqNSKSa9gBmLJRltIIldeeOUCEL8ia6Ebp5mD2GmEQKNjALb34B/4gH0bhkerF9HqzRAz9kjjLAL0J8Q/2Y2rH7oPex8HkFl/ptVTe/z1g/zJtwUk7CMWBFxMuEbRFkv1qdJZAPxuT9GSACRJ3aF4y73Eh71Av5chtJBo1iXwlXNnf5eynL5OgCYYGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXZGma060EGhiyfnf+H8YgVPRdZWhqNOTRM3j9VeeYE=;
 b=Xj0J6canR1Rv33fJ53ISq1ZiRwiE5c4EAZ/54FQvnv8ntiDXFHk8bz/Bh7b51oVRAMNKZSDGp5PY4scXoyXLZXp3AEo1DJW8VSnEtHQZvX3rkpE8iQn45eteVNVwcqcXqaAOhHug7ZoO+fsf6Z3oFZwwq/j85AzpVJO+/KzgrmY=
Received: from DS0PR10MB7364.namprd10.prod.outlook.com (2603:10b6:8:fe::6) by
 IA0PR10MB7621.namprd10.prod.outlook.com (2603:10b6:208:484::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 17:51:26 +0000
Received: from DS0PR10MB7364.namprd10.prod.outlook.com
 ([fe80::a4df:c903:e1aa:322f]) by DS0PR10MB7364.namprd10.prod.outlook.com
 ([fe80::a4df:c903:e1aa:322f%3]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 17:51:26 +0000
Message-ID: <d8dde603-f75e-4e2e-b16d-23477e802dd9@oracle.com>
Date: Fri, 10 Apr 2026 10:51:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] hugetlb: make hugetlb_fault_mutex_hash() take
 PAGE_SIZE index
To: Usama Arif <usama.arif@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
        osalvador@suse.de, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
        vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        corbet@lwn.net, skhan@linuxfoundation.org, hughd@google.com,
        baolin.wang@linux.alibaba.com, peterx@redhat.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410112433.3248586-1-usama.arif@linux.dev>
Content-Language: en-US
From: jane.chu@oracle.com
In-Reply-To: <20260410112433.3248586-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To DS0PR10MB7364.namprd10.prod.outlook.com
 (2603:10b6:8:fe::6)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7364:EE_|IA0PR10MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: cb60f50d-b334-4a0e-32e9-08de9729c91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZQugijnLAEJgcvfliKZZPZCflSpqQD7+z/afdHWnYYJoHzFhiv/0RMHRu4XtjceGrAxD11XF0OToR47Ntgmqt7sE/oShV9C41fse3XADqNJTx4MTtr9DxG3isRQm9RSLPc1liyWZl7ErOSSglDMkOO6Yg171iu6xWg4sFISj/RMYVMA7vUVZLCVojRLbDPLaxjveF3j+ovBRIqDtAsdJZlmek2A9Xg7at1i59jbL+LE5F+lpN0kiF6a43hyWr8zsG6VxS8G9WkL+Xq67svNkkv/8/hkEBDsHOfHFgDSfFuoSd/dPj1+8MXCRx2965TKR9b54rOI6CrW7v0BPKXym2egXdkTEvLZZ8VLCBkbMuXKkLC1lghyqq/O1Q0b6ZSioPplJ9ypvsjuEuwh0mOgLA07tUvD1N9yDnoAGEF03LyCYTtdQygZU3HSvtXguQ6yShHwEpAeJqT4OYg/3wS188GlCd/jp/NMsWSQxOFgfLHbr6jr42aELI+PEBqutLfrD38fNG0rgzPPGTrbesFhsYvPVH1y5OfB/rIXu/Zc4V43Sq/ziG/miJlHyzBd/3qNJkBb0kxyEkesE2iFVlqb7PPI28mFjveTeMdREMA14thxim92iP3JOBfQaIT0wPV092mIgK3e6d/2AcURntVcRd5h5+m3KuK5Co6qssVcj7iheX+PEc4vjPV+Rp0S2ly2QCqUxQGogzyOZ6G5KG/dx2A65mkX4q3lnwRX4hyTmprs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7364.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEpjSzVjY3UrS1Jwd0hHTldQZWlpRXJIMFJIamNmdER0OW5FaHA3MlZFVTN6?=
 =?utf-8?B?Vi9RTlIrVXVwWWsvOVNLRzlISGJISEthbkdlMFBiSkEzOExvMEtZU2pERGdi?=
 =?utf-8?B?YldzZ3k2bElab3BPWEthd2lHazl2Syt5SFRtYWJlME5rODJ1L05LMldQanZF?=
 =?utf-8?B?WUY4T3FIL0c5VnRPN050STdSTmNCSFVuOWo0aklZT3dOdjBaSE4yNEdHZ1VD?=
 =?utf-8?B?NkRoMzlMbTdFNzUxdE13L0RLaExvUkNSTXhUcVZpMkplQ1NzZU5DdGoyUldB?=
 =?utf-8?B?WW9tK2tlL0RoVWIyMGJnKy8yQytxNTNoWW5Xa1NFZmtaQXR0dHovM0czNTJw?=
 =?utf-8?B?YnkvUm9XVDlXTk1GSVM2K0dMRHpyVUFPcGdLYzdKTi9ObzNNRVhZQ2x3SHlD?=
 =?utf-8?B?SnNuUXMwemFXblhPM29neE9xbWJQbTRMRkV0MmxLZWVaOVIySHVGczl0MFFh?=
 =?utf-8?B?Qm12R3VwSnd6OXlReitrMWcxeElnTlc3VnRLQVpWVStnbUhHK3l3V21KV1gv?=
 =?utf-8?B?Y21RcDhlb28zdGJUT2hJblFhZjFOdGR0dis1NUF1TWdIYW8zczA0bnZRVWUr?=
 =?utf-8?B?T01qT1RneklNZGJ2NDd6Z3FtQ05sNksrTmFDUGw4cWc0SURNNkJLKzRNeS9F?=
 =?utf-8?B?MkovR2Q4NU82KzlWWjRyM0Y1UEJEWEg0bmQ4ZFZDb0RseHBRS3FJWUZCOWZm?=
 =?utf-8?B?R29xRWNQTFJoMS9HNUp0ZjVSQ0tNdnRpNWd0R00wZXozb1FSN1ArS292Nkd0?=
 =?utf-8?B?Y3o3amg2QVdRREFFRWUvQVBUcmRlTVpkU3dSMEZQZW43UUhuQUdJNDZxVC9v?=
 =?utf-8?B?WTE5VEl3TVlEcVRYM1N1Tk9iS0ZpRUtOd3FKUU0yYWtTNjRjNjlpT2k4c1ow?=
 =?utf-8?B?U3ZpTnRWSXloV1NXWk80K2oyWHVSRS84TXJLeGgrSWVYYlZ1WjBjRU02MnFa?=
 =?utf-8?B?ZmFmczB6SmJLOTRvNnlmaTA0aUNqVjh5VEtqUkFNOFJ1dnpMUGdSeVFKcTRV?=
 =?utf-8?B?Uk5GS21XRnlGZWxyQmxCWVJGaGtFUE1VWFFJdjA2R0hVT3FzaHQyTTZFb1Jv?=
 =?utf-8?B?ajZuNSsxMUR0RCtyVkFPODN0dzZEY1FWaUVVU1NNVEJUeWtUaWRBQ1FUVnVC?=
 =?utf-8?B?ckFkNVRHN29iVWkvb3hhWTNIUVVmUzJTWTAvcEladno5SVc1T1diZzN1cVIz?=
 =?utf-8?B?K1l6MUhEQ3BMWlppeHFQQy8vLzFjc2xaMk4vVVRZblNWK3BzTHpWa1J3SmIw?=
 =?utf-8?B?cyswa2lpYkthSTZuLy9BVHdoSzIrVDMxeVNEZTBqbmVuMnNoM3J0QUY3VlVs?=
 =?utf-8?B?VzFVSDFTSlJMYXRpYlhKVk1Cd29tcHZ5MFhnNExRMUliYXBaYWp2YTgwcXBa?=
 =?utf-8?B?aHVkdCtWd1FaYzBFN3dNWStydk54aDE2dTJ2KzhPZ05CSUtUSDV2Y3Nqa1RH?=
 =?utf-8?B?VGNRdE5qNjRxVGxoZEMyRDBpMEt2VDB2OXJwalhpc0FyZEFOdkZ5aGFkZTN3?=
 =?utf-8?B?dUVYcDZHOFR4SFg4cnBEL2RHaFFMamhiUk5MZW8vVnpJNWhzZWVVbThHWHdx?=
 =?utf-8?B?MkFpV0NkSWxmclcrTmFTY3Bsb29YRnNYOGNYZnhLdVY2aUZBV2NXUDNxV1ZO?=
 =?utf-8?B?SXVOMjJ3YURWcFA1ZXFMbUxCMWs1aXlhUU5iZDgxY2ovcVFIRnNCcTY3L0hH?=
 =?utf-8?B?aE4rL2hQWVYvMUFCVHBmMStLNDdMK1hRdVZmcllEaU1CaFNNQjdLSGVqRFp3?=
 =?utf-8?B?ZEhiYlBDVStBM2ZLVTVaNElYVjdKRWpSSkxjQzlwT3VoYjVFR3ZDMnlCMTRp?=
 =?utf-8?B?a2tQQXdMaS9QVVp4SVZPWEN1cGlmakhhaWpKV3c5Z25US2F2QlhFdm1TdXlR?=
 =?utf-8?B?ZXpIZHBNOXRTMUR5cmJYZGxzc05kbmQ2QWtoVFpaL1U3YjRyYlBGU3hSejlq?=
 =?utf-8?B?a1p2MzdKNHZLamtEUXBzL0ZNak0zM1ZDODNWNTBncnRFdCtvcmhsUThvWnU1?=
 =?utf-8?B?SHFPT3VHT0M1bE5VWm1yd1RhNmJkdE81UnNiczRzUmtXMkMwSlFrVzNFcVVl?=
 =?utf-8?B?cDdmTG0vaWtJcGlBdlhLV3czNkRkbVhhOE0xaUhaZlJQcEJQMWxsejlxTWVC?=
 =?utf-8?B?RHM0MFZSOUZON2ppNmdCcko0Zzh1SzMvVE9YRHNYRkdvdnkzcmxUbnhkMWNZ?=
 =?utf-8?B?dTZ0YU1SWmhKQWRrN1ZQaisvUC83NGFrSGV6MEMvR2JBdTltUWtvWWJtVTEv?=
 =?utf-8?B?aENGci96V1FQWld5QU9xTXRab2g5UnE5TGNFYk1xUmxFUVowemtNL2VWSm9D?=
 =?utf-8?B?bG94UDN2S0FXOFd5d0MwUlpkK3c0dUdONTF3UEd2ZGx0d1NGUGl2QT09?=
X-Exchange-RoutingPolicyChecked:
	HCEBaiXJwwrrNUJPo4GTTjzEY6d5qnhZ+EJSQx+TXTQXrsNyhgrAEFS46u04ahh4s9dSCmcMdtNkoc0bzFeAmq0q5uvX3HnjGur4B+pYAzXi6AB1FJTbLiL8YXuSx6BcTowaUnN6sa669OViNBste0cLkk78rj2LQYaL6LNPb3HKj/0sf7TQND91WxExKtP+vUbxVwsUqfpTJQrmZS2qUeRV/TNYujJ0kGqzNOEbP2q0jOugvlhpuFf4YXXVb9v/fN5Ql/u788NxkfYC5ddllu+Osp1W2PPdm5IxCGipgPNT5m0gssBm+niYnK1+OPB5r7J6+TDDE2lPFJBdhiIV+g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yC3flM+rg8y7RVfFpqtXgI7itWBzFw9TFCRM0kVqc9yN+ieSNH/pyjujXMrCCE0tbshM+I+MvAclxjUx1DcP34b3oXO2sqH5LKocpLtLLl60EBQY1+OqeV/HodeJifJMyWuCHLk1pwXpUvaj91Jgwn65fZq33DfNf9Y6RXrA0EHEq+2/1rQm8Y6dHrjbEmutk2K7geSr1YXRrQFYVWtMGv7pxyfuWi9ImS8gzgaFKwtZLFZKKZnnMFh+/RgLLLvxJTfJIYbwMriwZ9fRDKASA3Q6ybRczd75nq8jYwueNeNeaZ2lGeNx15lXM5iMTNM2hbAZxAN6hX1GZ7To1Y6DwI/DRgbfDy4iLUitjr1FMHQHRs13Q3X+VOsNYPw946vSgUPcTepX/7uBhg24pk4MMA1whvBaF4ntDchecM9u482ape5kvWWBujaTcHo7S/iJ5j0cSRKdOyh3FtV83gy9/3HaHcN1FjwajbjyiN7EXn8OftVa7njEiIyeaqInt6TTOquRP/04d923drxOsE2RD6NWLz6Q6a2JnXsx+ppJn/P7fir5FvDxOmN8xGDS807KevLhUMFb0sB+d7Y8ZLl5SukYU3wsagRj/46yTP5o+l4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb60f50d-b334-4a0e-32e9-08de9729c91a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7364.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 17:51:25.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ss/wUaF8ymdUMDeybxRV6wZ/YrN2yYdDyoohjLeRywnm6NdWhZIlX7JDUGKcasnzgCU/vhijGI7mZlr5UYJ1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7621
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604100167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2NyBTYWx0ZWRfX4KkyRBKxNp/v
 nl4mRqpg1Lo5LmSu1dgEltG5YZ6vkQ83XpPwExzMYX23TzF8QSh09fXzfMQPKWL82pRbwXXJnWH
 XS1vHZMAoNaTR8E+0DbKaiiFU6ln3deX27nOppmae0V49gRL/ohXK1AJL5rRgwGBhtb67t5HDAt
 TIisDMwaCQP7vmAKHobCIpy2nSuMU926UbKzncaiICuJ+nN0zv8vt2PzUc1LbUlPn9ERdIlEfuR
 Qjp0UsGTvS8DBGlHqisbJ3qTax/CELGVfDjUoErwEIEHoK7ugYlTvYhYSl0A4w8UnzCvLWHNY40
 ED7nZWvXhGdcLSP+SybKA1K32fmxYtVsFVktSfXUtPjvqUPPMHh/aLzhfk7RfbQeZjVGSfz6WYv
 dBSEgABeCe57pG+nEeVRXLrpdzCv0oZKwyv36k5uYDlziuZ4ml7tE/Pm8odzJ8C7c5O+ORbI2TH
 KWv/0CgYlaFrYECFvVf69dSUuyDGLToF0Z0RA6P0=
X-Proofpoint-ORIG-GUID: 35gmcV88EVNN7CrYdU0g3K72PgPnqHRR
X-Proofpoint-GUID: 35gmcV88EVNN7CrYdU0g3K72PgPnqHRR
X-Authority-Analysis: v=2.4 cv=KO1qylFo c=1 sm=1 tr=0 ts=69d938a4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8
 a=CR5ZJFBvRrtXDVaeMZAA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12292



On 4/10/2026 4:24 AM, Usama Arif wrote:
> On Thu,  9 Apr 2026 17:41:54 -0600 Jane Chu <jane.chu@oracle.com> wrote:
> 
[..]

>> @@ -5664,6 +5665,10 @@ static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
>>   						  unsigned long reason)
>>   {
>>   	u32 hash;
>> +	pgoff_t index;
>> +
>> +	index = linear_page_index((const struct vm_area_struct *)vmf, vmf->address);
> 
> This is supposed to be linear_page_index(vmf->vma, vmf->address), right?
>   
> 

Indeed, sysbot also complained.
Will fix soon.

Thanks a lot!
-jane
