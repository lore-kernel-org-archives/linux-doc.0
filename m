Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B617333D
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734678655; cv=fail; b=f3on43UJ1DO3L9oALxTUN7kEIVI+msVDXTIZCgOaZGzEqWniadEdhBNgPxoVgK+PYrqw3ImpQWGcRTLgFI8Op9yL5Nh5qWVxEaJbExDH4HDEt9LBjhJA7Kem7wXeGgBR3CWj99+zTZJzEzQg1FGAwMxwxl3A4tWEsRqYuE5PPus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734678655; c=relaxed/simple;
	bh=r3lSXieyvvVsdCno3+G2Nrpp10ByJhI9AS1bZ2hdbiM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g2gxdSougLoZ7UdIdcMjRVA/Iss9BhpyP6hWa7Bkvn8jcQh8dX7b5/tI/JH4QUePMG0BHGmpp1SQ+tiIxgUTEmfIs4NhyCWZRITkPRhifmKL4yPRZkc4VN2GcJ6MbcPFtLjFYWx4Awrnxr/IvWHwNJ8TNm0ve81VoQQlQyJvkhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jw8wXoHg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hd6rSgca; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jw8wXoHg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hd6rSgca"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK3ugvY003330;
	Fri, 20 Dec 2024 07:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=E3F1rArkGUcvK4fGFf1F8BEhOtg5jz1yo+bE20gEDVE=; b=
	jw8wXoHgmhrqxTKHsVZwM8dSX8fxdqafYlz0yHdpXYxZnZtMV317F46yehCZ4Zw9
	XReBHuiKgdLF9cNuSe20Z3SnypG+IouYxyd7pFS7QfYIuPWYSTUIKEC/yWmCX2sk
	1PysgsAy7s3/Vx6GLncKgJp+dLH42ulCJKI3o6JmmdRZCCDLGGs15r4AVbLMcXFC
	ghcuyppkafJJMd3LrEq6TAcJyPeNwtIR+pCHW7Tsbexeo5Cw5WuLUnUZWcMYC80r
	Dt5QJcBlzinI03/3PGqIdMBPRJ02LJOZ45TPbL/LXkQw1vpSAyFIBUxboYv/BPIj
	Yo9a/zwjWj7n4+73q2ZOlg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0m0cumr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 07:10:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK4h62h035729;
	Fri, 20 Dec 2024 07:10:44 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fc5x13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 07:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ih7YMtRGyo6agy1AZB6plD2XLbbzZr9/yyNCN75kvTt4OXjIRrUAdeYACS39sL9j7pp++uke2C2gSaGnQO9VvDpU887Bip1Y8fZ9EPXtLUr9F0KNzTAe3lO+f3Rx5BfYEYO2JiZxnOKuIKvtEmvvzHAnR1DiD221m2KTldc2Yb1bboHwcqZZcUCiCrX1ShBlbhCWL8OwwfpVmnTynaqz4LTwaHZGEMb1YySrotCbF72MlfBxgA4ArAAasV+6J0ZDbWne5y89QIC6Y45SKb2H+mthFJW+vx6L1kEzWoRluCc/nDWsmyYxzB36DmgID/dg3+XiTL8Yese8cFtQ/3UOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3F1rArkGUcvK4fGFf1F8BEhOtg5jz1yo+bE20gEDVE=;
 b=FB2EMdMIV5+SFRKWJJwWuCMsxMsr6THbnn8pUUS3gFdkUcttMcRLl2t1RIn4q0Tba/DpVswezIxrrVckWWMpOJvKRLoh3DVAWcuuXgX8B8XJztzsc4rTXopjIVsgb0mAyCYijUXWhixXIjoJbFTAP6cFyos2vd9CBDFj9Ls0ONQhJ3l06GPanmhppjP7JhpfUs56en7f9fkJ57c34XfXd5Iluheh5/uP741J+D4OLJaV1Wi2qGE2RxbXKBwaq9+PVwVEk1+J6e+EWtBsMmHyYa3L4GZMlZ+f5+BEK6/811JJP6NgCLHEyjNdFyRhr4w2eRWwxytd4Ylwu8OTU80WKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3F1rArkGUcvK4fGFf1F8BEhOtg5jz1yo+bE20gEDVE=;
 b=hd6rSgcaw7V5/hh8+liB29TyVFTkvCb90tISe06CCi+XjUd/TudmOule5cs9mpViRq5fDWdVoosXVyCxKVw+RcmoXOYb7o1Pdep8sg7MXEemQFGQVcpgemZqiRVIqcHl+5Xr1cOcahj98nJT/mIkOd9pxakSriXyVC7GwpJTrGo=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by IA0PR10MB7623.namprd10.prod.outlook.com (2603:10b6:208:493::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Fri, 20 Dec
 2024 07:10:42 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 07:10:42 +0000
Message-ID: <31a0a954-7d45-4ec1-ad55-50a788ddcbeb@oracle.com>
Date: Fri, 20 Dec 2024 08:10:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in kernel-doc ("-" misinterpretation)
To: Randy Dunlap <rdunlap@infradead.org>,
        John Ousterhout <ouster@cs.stanford.edu>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
References: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
 <78b837e5-5fdf-47b3-8f83-824777ba0569@infradead.org>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <78b837e5-5fdf-47b3-8f83-824777ba0569@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To DM8PR10MB5430.namprd10.prod.outlook.com
 (2603:10b6:8:24::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|IA0PR10MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 602f96d9-09fe-471b-52fc-08dd20c569da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmExL1VLU0I4bWxmMUtVL2VBQy9pU1pNcE1PcG1SQllybTl2VnBLOG5UQThw?=
 =?utf-8?B?WXJVSUppbHBxRjFPUXdOZXE0RnZ6WkVpTCtlK3lNNHY4NFV4UHpURUw1cGc0?=
 =?utf-8?B?TzNCNVBKZEQvQ1ljYnRSL29xWkVpUlIrVllCNHdSdnk1RWovelJpdDQ2NzJL?=
 =?utf-8?B?OUlQVm5CTGhpbkZyREc0R2hOTVlBTVROVHI2bjBGcWorSkV6bUZzQVBmNDk1?=
 =?utf-8?B?ZmZ1WE0vamJUSnI0U2h3VC9XdVU4ZlJSczEydkxzOFNmOEhVdDRKTVpSaCs5?=
 =?utf-8?B?TXR6aHJKWVh1bGVOem5CVmJBdU84RTFvMmUrRjRPMlpiekJ6dlY1QUh4eHVj?=
 =?utf-8?B?SzRUZlpTcXdud1drWExha2llQkZOQkV6NTl4R0F6S2RhRmMvUHA2TFVwVy9Q?=
 =?utf-8?B?aTBmOGNUM3RnRndCYkJ0Y0huWk9hbWs3Q2E5NTVDNlRkWE84RnFJeGdaYktv?=
 =?utf-8?B?dlEyMDlycmFrZnBMQy9TUHNDYUF0dXpWWlRUcWo4ZUJKTVdBVFdVWHl3alJN?=
 =?utf-8?B?WjNuVDU2Q1FDUW02ak9ZanRMejdNMWdGcm1KWW1RUGY5ZWVkaXhCdnBpTWJ5?=
 =?utf-8?B?Kzc5M2c0VUNzUnVZU0Z0alFScEFZN0ZKRS9GMVFnL25kT20vWGw0YTgrd25s?=
 =?utf-8?B?V1FLRGZNUk51aEFvQ3BnS3RBNytMQ0pmb3lDRmZpMHJtd05mbzFXVXJZMmlp?=
 =?utf-8?B?N0E4UkNvQm9xbDRhbFRKQmlQR3grWFlCblRNeDFEV1dLQlFBQ2svd2tmWmdM?=
 =?utf-8?B?Nmhud2FheWFDZ2dlWnFSVENhWE1QZkthUGh1Qm1mVk95NVpueVlzaSt5RHZO?=
 =?utf-8?B?dnJEYWxQdktjaU1ZL1RvZkk2WHRhRSswWXEzNVhYZDh0UjZaSWJnNUQ2azI4?=
 =?utf-8?B?MGJjdFNSWHUvRnZUNEJLZUdlT2x4Ym0rTCtsVnRLVS9xYytZZ3lFSS9EVG1Y?=
 =?utf-8?B?cHRKLzhaT01iOHFpS3pzVHBzSjVtcFFvUllUZmtwVTlCWk5QZkRKTXBhU0hM?=
 =?utf-8?B?Mnc2V2c5NkdleVlQVkxMWVlzZjhsQ1JwTnB1OVE5SlErOE5LL2xmck4rNDZO?=
 =?utf-8?B?R0g5cXdxZFlNQnVJcXBNQ0hMRm9WRld6YkFPZCtyZmtGVnBwSUo0OStuUk56?=
 =?utf-8?B?UlpyOTIzQi9WV0h3bS84MEJRQ3F1UElydGk4SjJvRnlVbDQvSzlrMEViMnFL?=
 =?utf-8?B?N0VDME1aenNXZjJkdkVVTEpyRUVPRTh5dFZiajdhVVRMU2RRZmUwUy83VG04?=
 =?utf-8?B?eDh1WWx4RUE4eXZRb29qK0R0T0t5Z21OeUxUZEw4VG5NRmZjMzNpTE01R2di?=
 =?utf-8?B?MDdobXR1a2RpWFVNNkpTQlRKNDRNNE1TTlFPZ2pYSDVTR1NZeXB6ZnpmaVdl?=
 =?utf-8?B?VzNlUXNLY0xQSk1GUjJLV1VzY2g3SlZOdkF3bnlkKy9veEl1RjRxZmpuSklr?=
 =?utf-8?B?TzRCLzQvWXZhaDVuK284MFhhNFd0UkNNZ0pEVHpxYUt0aEFid3dzN2xUSE5y?=
 =?utf-8?B?dEdMa3NQMVdjVlBQV2l6YUpyT2Yvc2pmc0R3SmxpbXlyYzJaSWRRcEM5Vm8z?=
 =?utf-8?B?QURMOFN3bGpNdmEvN3VYbUw5WGNTUk9qZ21tQkRaYU0yL0FXYnIxNFpJa2FE?=
 =?utf-8?B?Vmg4RmV5Y3g0Ymx1cnFtaEk0WGRqdUNOVG85ZC9TZHc2dlptcVkrZGRqLzVD?=
 =?utf-8?B?ZXJHUDVoVmFyNnpwWDNKZ2JOdGUzU3BtY3MycXVySHRUZ3BTMVFtNXdEUlFp?=
 =?utf-8?B?N2F1ZVdmczdoUTI3YzhTYnVGeFFpVzlaWGZGY2tuSEJVUUwzdTZQaXY0SURa?=
 =?utf-8?B?Q0NUQlpNVHZDaVlsNGRxK3JSekdNOUJGcW5MRGVyNFAxbFFvaTRaa2ZaRlVy?=
 =?utf-8?Q?3N7FGwOh7w9Ee?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0pyK0F1R1Y5cExRcy9aU0RoVDUveHYxMHp0SmR4OUpqdGFxRkk1dTFSMm80?=
 =?utf-8?B?Z3JvNEhQZGNPdmJWVFhZL2VkZFFVU0QveU9UOVJpZk8xbjNtVGNPbE5BN2lr?=
 =?utf-8?B?OUZUYlladGIwVVYrSjZnb0FWbTVrNm9tb09HcVhWMWplZDZ6OUtKcWhVZ2dM?=
 =?utf-8?B?QVJHL1lnYitTc2o3dGExVDlIY05Xb1lFVjgvWU9ZVTZQUCt4SVdHaCsrb3lz?=
 =?utf-8?B?c05VbU9ONTJWQmhsWnZhU0ZLdTBVY21SbnRmaGhvcmdaMGlEZXRJK0lZK01C?=
 =?utf-8?B?bjRQaStWUURXZmVLREc5dGl0M2RsWG4vcjhhbm5nbm9OQ3NyalRxMjE5UlND?=
 =?utf-8?B?Z09LbCszVSs2aXV3ZEpEL3orbW5MbWx3YUJXZmIzRjBqRHBpc1NvYmdRRTFo?=
 =?utf-8?B?QlZOck1hZnpBeW9sc3c5RUpzS2lKR1BicVp0UG9Wc0hyT1VSTFVMK1pvWmVi?=
 =?utf-8?B?RmNEeUExeTE4azZ5LzdjZXZsVU43anBxYktnNmdvT1B0ZEEydS9IcHhaOU9j?=
 =?utf-8?B?QTVDS2hvUExLbTRicFNrVmJRRjVwdFlxYzlOSDJLYVpPQStrSlNEdGFBUTI3?=
 =?utf-8?B?RlN6V1Z4em4yei93V3RNVVF2UjFHREhsTUhTMksrNmUvaFNCSkhIMXJVaFBy?=
 =?utf-8?B?WmtHYWtwZkRBQ1JpTXlDMGJRQ2twbEUwd3V5dGRwR1RSWnN6NFVJQmlDWTI0?=
 =?utf-8?B?U2RyYlBYTnBEVFpXUTdObWRPQkk0VXhNQlFOLytJK01aWVpXdDNndXU1cHZZ?=
 =?utf-8?B?Mm1kcVpXMVpBZHk4cXliWTNyd2ZZZWpuNGd3RW1KdFZvQUladFFIalc4MG5E?=
 =?utf-8?B?eEtsaGNsZmNHUUhwcjhhZXczdjFlR0k3NFh1WXNmaERTcG1FNmhuYTRnQXZC?=
 =?utf-8?B?TzZsQjkvL0tBYkZUZEI5VWhRaldMeVlPdk5seGxHTisrd2l1aUhLY3h3cm9v?=
 =?utf-8?B?QTVMcnZ3YTRtUjNrY3Y2Z3NoOEVIazl6VjZzNDZyTERlQXd0SUJCN3FhZ2FH?=
 =?utf-8?B?T0pRaG5RTEdrUEtGbDNRdm9aRnZPYklYbVZNVHZlMVlRNVdmNWM0cUs5YkVm?=
 =?utf-8?B?YmJjcHBOZDN3QWo3b0FPNTd3TXlqdWtLdjVISW9jRTBaY2FndHI0OFI2VFFI?=
 =?utf-8?B?ZzJER2hRMktyU2QrWTV2bjd2QUp1MVE5TGN3WlptUWt3YnNzcXFnZDlBRGxY?=
 =?utf-8?B?QmFHS1pYc1pvK3BHcWhFNkZMbmhzRHYxSTlYeXR3OFZFTkxQNkRMN09SOHB6?=
 =?utf-8?B?U1VMU0lrUkZiaDZTK3luVXNmZXMrMFRiNEZIR1lIQndqV2phUnd1WkJUcnBZ?=
 =?utf-8?B?Rmh3Nk92U1UrbVdRRkd3RGt3Nk9TOGx1S0ltU2dad2NwV3pYZnliOXkwNGVw?=
 =?utf-8?B?SHJBQy94dVd2eFlySUN6V0s0MTFwOWtyOGI2Y2EyajZZUXFVUXUvczIxdWU3?=
 =?utf-8?B?N1JqYlpENnYxTzFvay9mNUlldFR6V2tFQ3ozaFNKdmhIWkNUWVJGbkF5YjUx?=
 =?utf-8?B?TnQ2b3FuN2NidW44T29USTV5dEJsODk0Q3ZnUW9mY0YxT0k2YnAvc2hhcCsv?=
 =?utf-8?B?cFNVMGhPcG4vMjV5ZDg0YUlIT0Q0dGNyR0FwYThXeVFFV01IUnhJODBYV0J4?=
 =?utf-8?B?NWx6M245RWk0bit0ZGV5ZjgxL0pIUmlmQWJuRlZTZUNZQkl5QWg1S1dMbXcz?=
 =?utf-8?B?VXg5bUJnMml4dEZTWmZVTmdaNmxaTVdlcmYwcTRGb2dFMzJ5bjMzUmpOMzRH?=
 =?utf-8?B?SkJrb3VhUU5TZDdhV2JBREhBNmpzTWt0cTF0bDJPM1NJMzdwc1lHSmdjaHd3?=
 =?utf-8?B?WXhBMk5Bb0hiNEYvZVY2dldyRktxNFhwcWFxOFAxSlJoZ3JhNWU0Zkd1ZmVY?=
 =?utf-8?B?VjJYb3NnL0s2SlhGbTFyK1dFd25mQmhhNkZISENmb0I2blo0M0xtWGEzYmFE?=
 =?utf-8?B?bUZ4d2lvQ3JJRHZINGI4RVcvM3pqa0Nxa3VONlBocWs4ZlllaDJuVkNtUXZs?=
 =?utf-8?B?U2tLNVcvcStScEdrdk43NmxnZjJ1TVlxOU5BbjdBMlVDOW04dC9seEQ4cU5k?=
 =?utf-8?B?MFVPZXJScDczVDNXTVBiVW5kT08reGt2WndEQmgybE03VTRHYUVhTVpqU2ph?=
 =?utf-8?B?VFZvVUJJV1Nma1ZFSzVOWkJVVnpJdm5nUVZUK0VkNGUzQ0hHZ1VnOWkwMkpY?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A57X4T73udnJxb68Ub8v5TXTASblZOnh0uO9c3B8mLR35WaXeLSW+t0W2Ljem7u3tKhm8t9Iv02pu+mr73WkGHY8pI/0pVi3O6vN1fsnzNHr8hVJSGm7Oqs0QK06gXRcWh9VWDuUIS9VNaF/O/5S0EafEzY0PqUEfrQy2TC+XAl5QHkWyMdk6z/F6t0a66Tifw9h5zhC0gE+vAGYAjXISNh2kMUEzUttcR7zSHki1egD3/k/thBWhMgp/eEIfHu2oGq2Ae0rq6WH6LtGlzmerCOHIR1OgQCbdO789m0PwvCYEjoSGmcVTt0iwezGh7LHIgphroVvCQmn4zk8fYMSvYV3gp6M00n7MgW7/bsuEBa2BtR5mofJZvTlis/cFqJTbTQpmrfGWEoz5JdMx6OlAvHGQrvHT8j/+NH11ovlYnW7C5cbh1g7Xx8axvhwQO3zIg4mDuwSKSQPz0r7pT6G7rz4XA80ssKz+mv3V55nor1Se5eLeHZhJe8DEbjerDNJ8qUjRag8AWVrPq+MNQs40rYZZMnSA8NlQYFcasJa+EtvGGAgNxoGhsB0uAugry6IzDKpREodEEAXTV4SFAa89rpkJCO5qJCF1hYaVa79pyk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602f96d9-09fe-471b-52fc-08dd20c569da
X-MS-Exchange-CrossTenant-AuthSource: DM8PR10MB5430.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 07:10:42.4058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGb/kT7gHuHl4rh2jbWuRZ5Pmxd8+KYToi9WvTRzPfxzJzRRCiZiD0OHW/+KzAOrTeCW20gyHgbzJAjEHmit3L489sKuEyuy6NJPpq7Po5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7623
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_03,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200058
X-Proofpoint-GUID: RxzN8XK5Qnnr63--3m2hyYHQo4-0CpMf
X-Proofpoint-ORIG-GUID: RxzN8XK5Qnnr63--3m2hyYHQo4-0CpMf


On 20/12/2024 06:02, Randy Dunlap wrote:
> On 12/19/24 10:37 AM, John Ousterhout wrote:
>> kernel-doc gets confused by code like the following:
>>
>> /**
>>   * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
>>   * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
>>   * for well-defined server ports. The remaining ports are used for client
>>   * ports; these are allocated automatically by Homa. Port 0 is reserved.
>>   */
>> #define HOMA_MIN_DEFAULT_PORT 0x8000
>>
>> It seems to use the last "-" on the line (the one in "16-bit") rather
>> than the first one, so it produces the following false error message:
>>
>> homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
>> The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead
>>
>> There are similar problems if there is a ":" later on the line.
> 
> 
> @Vegard, can you look at this, please?
> I have already looked but didn't arrive at a solution.
> 
> 
> It appears to be these lines in process_name() that are confusing the function name
> and following description:
> 
>          # Look for foo() or static void foo() - description; or misspelt
>          # identifier
>          elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
>              /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
>              $identifier = $1;
> 
> Thanks.

Hi,

Is it just a matter of making that capture group less greedy?

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f66070176ba31..ba9bc8760ff82 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2085,7 +2085,7 @@ sub process_name($$) {
          # Look for foo() or static void foo() - description; or misspelt
          # identifier
          elsif 
(/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
-            /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
+            /^$decl_start$fn_type?(\w+.*?)$parenthesis?\s*$decl_end$/) {
              $identifier = $1;
              $decl_type = 'function';
              $identifier =~ s/^define\s+//;

We could also use [^-:]* instead of .* I guess.


Vegard
