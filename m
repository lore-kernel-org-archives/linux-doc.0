Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366925760;
	Mon, 13 Jan 2025 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736783609; cv=fail; b=aOcWyxGcdR0XWswzARPF3uCZKZFfoSFbZF5WWFKM7lsCSii/DRDC1KxZuzCjCAkF+hDiWat61kmUEjoWJ3eo5Qehf8jky/NHBxaocPG8Ptolav2t3qZDCJvZtbOPKX2Og9bUyPp3wSH0gy+96BPF61lEYUxPhPdegO92QMv4QHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736783609; c=relaxed/simple;
	bh=qnTkWC6YjvCLlTRBAm4ovBVSAU+/Pw2NOlniv6nNTEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JNZEukM8UKjZSz1g7KlqtxuHsbm+adbPPp8eGaVH/ohzfRyoTGC6Ylnu7redgsDVmR8L1l5+ofL85jQ/fIapRzClTo5+rPqg+GUS5+d93S05hc0VIxMFhNgUkO4FcuAceAw5qJLKNZ4JvScyM2X2m+iT56uxrkhHPUEYnORDFy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PfzMZims; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S3kONA0X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PfzMZims";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S3kONA0X"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFR48K025298;
	Mon, 13 Jan 2025 15:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PKJBkRR32nH4Fp5Ca+
	yAv/WLO1UccBhyghSzMud5t78=; b=PfzMZimsd5KiQl2pv6FdahHTaEAeOqekFn
	DdRv+fRi16Gv5W7TjZxqSdQrk1dwNSlP9L54FA07V6cI394lvWgpVr5ULhe15aEg
	HpgX6qG9S2OS2F2cbR57IHtJ+IyBUAQ4SfW0aoUkLzA07j5H/MlLOZcIeZDb4QgZ
	RuUFS5BIWDZgMtCUeEYOhlvf82eZD9iEBAqgGeETDeQjHGcRdsvsCrJVNKFw//J7
	p2mQF5coyfqy0jGbupCzT2UlJxN+WC2D4uyCR7fL+QZC0/SyTOeT4PNtFU2s4MqW
	Fg7kacL+0lO9rN3k5BrMFFMcN+QQSIkvyY/OG+Hl1AkuGMY5GJfg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f2buwmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 15:52:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DEGScC035016;
	Mon, 13 Jan 2025 15:52:42 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f374yab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 15:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w92ZEW9cJ1S+lZjf7+/5KSaphUcNlxorz96CroY69hsX7WwuFr2562yTs5euFqHWNk4WV0zOCEq5GXnCjFIzv1y0cQEF1XYiCIYaQzZ9J5QjxkSwnxFvoeYOU3zSg8BMFDmGbxgAx2JSyLQOCBES1nl7+9H3EH73QHwxowqJGMnES7NRPFZZ6k6xu1Y+IJcDEkm+QIvEjYD7ZBDoyi7EonylU3uAXNQV2JwUf573c82ZmmCtTnjQ8YUOu+VUG6ckF9A1n9wOx/wx9t263hAgJd8KmG3ev+ZqPzehaSycUYLSRdLahtKWayVIpESBUh2ViRg87CjOkTYUeBY4Swvf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKJBkRR32nH4Fp5Ca+yAv/WLO1UccBhyghSzMud5t78=;
 b=IZbmYnog/VUonDIcHhmTQDCaitQem+OelGSoCFhXO4i8MOw1PHu8tpROHut9gocNp0wf9I+l3oEdyK7fHIJkTePIJxcvU6Gi/OcaR3aTRcnOy6nBFcd/nVuan3iViLmaipOLeYdCU2JT6tGNJtzwVsjoo4MtUuXaKqYInrHn0Qd6e6cp2yhRwkg9L+1Rlfkwm0/1BL+yrLML/vyQpPExqQz/0oNiB1y0XAlWtPu6tQCCum+afUrfahDHRtXlq9O5wMIFxfcnCitfBJi0iDdOQiq0Ve5eNm4EWAN363LOMx/SqrPy8eIWTLEdXtVohiFtrTU8lDn2u6DQI/mb1mD7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKJBkRR32nH4Fp5Ca+yAv/WLO1UccBhyghSzMud5t78=;
 b=S3kONA0XMYpHTzAWTqpF2ptsvBekVgircTPMkpXIinmfvnWNHa7aoIi0Da7/pWB9sxpYUvL5L/JzfgKw9oWq618mAWqZ8dluO5+ZsHrBtb5oTtqBoVL3eELiwNWMAr7q2nkrXPnFeZS/G2TXc4+AdJe2p5mK96dwcZgbpqzjt/U=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB6820.namprd10.prod.outlook.com (2603:10b6:208:437::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:52:39 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 15:52:39 +0000
Date: Mon, 13 Jan 2025 15:52:35 +0000
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
Subject: Re: [PATCH v9 09/17] mm: uninline the main body of vma_start_write()
Message-ID: <1423c375-dd2f-4ba4-b2e3-97b460d6c9e6@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-10-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-10-surenb@google.com>
X-ClientProxiedBy: LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 136822c3-2a8d-432e-508a-08dd33ea4ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hhoftgHoZwpu51iAXhewkG8UOx/+47mFTpgHNd3R7lG1msdDRjGekQEXybH8?=
 =?us-ascii?Q?WJF/0zeXhnkCNm8YdkdMRdhQmIoIu74NcmixxJg7k3hrvKA2QZOey0gKYOkK?=
 =?us-ascii?Q?253EKNRPIWsqjeF7ZvNhbH68MKHlRN6hHYIW4eumVuOe2lZhBfm+C/GSHvuP?=
 =?us-ascii?Q?x7mKjPPv2DQ0HbvpvPEs0FqB8ZrBPwScKSntrQXV25gL3rMGYdl/9rB0uApF?=
 =?us-ascii?Q?aU4925fpjzvcaJblnzJNTaYpj8Wfggbs+DQyU/SVyH5pHzSvl7ONwi7Mzza5?=
 =?us-ascii?Q?slu81ZPzlqEj6BVzbaK+LNHYnubj05IFSf5c3yLhOQwNa8S1s7HbPBBMcjEb?=
 =?us-ascii?Q?ZtIj5fpHXg8bR1OqO2ao/LzYRlTwN18b1x71PiO6JH4d+1Vbnagj+Ay5DlGY?=
 =?us-ascii?Q?e5y3iks8Tdq8z/Yuvzw57e7vuInjakWzFNWYFTitAUQyjaE39Bqkc16iIXhZ?=
 =?us-ascii?Q?v4i/AZ+Z9AxWP3ICeTo78+NHAxuvZ4JcsgFDFjJ2nv/Ycs8A96EAzztkgzhy?=
 =?us-ascii?Q?ekHmbJyD3XaYE2etP2UV6uHbg+GjuiVDSwy1qlFXAROWKghA5f6tE6gqK0Nb?=
 =?us-ascii?Q?MTynHdbkIl7Yy6HCEEH1Afz8s0/vCDFGuAfglle4voNLTmu6hRhJLZSDk3TC?=
 =?us-ascii?Q?nQqufN4E/cwr9NHYNL8f6ENm9pKeUBX0hCbLh8IKoRzt04YlGFXyiApoODro?=
 =?us-ascii?Q?NrIjFNURvDoGej33UTMc9v32PvYT+E5irvTAzeNAO3tkowtHhwLh5bpnmRaB?=
 =?us-ascii?Q?VUl5zFOPhoPazNTJsAI88+GxuEOvtSTxRhwx1erMj54SGq2h5j5HZ0Ll6xd5?=
 =?us-ascii?Q?hUmqxDjZIfy9e2vsJUaOFt6jWL1YpWGfDPSdPVdDOOpR4XSnjP1k9ozjagbo?=
 =?us-ascii?Q?6eIYzIOzGLoJhOcxdctZGHFTA6ey6uawZFXA1Rq2RxaofKb+XibBM33jVYBh?=
 =?us-ascii?Q?B9iH5r5yYkSxY5N1DBF4cDCbQ7sRmX7hEBEy5aKOJ757f2T90HwLUTdtuZaq?=
 =?us-ascii?Q?hI/Z7g1sORLlUPWZ8TeQZZJDVPBMaX5LvwPcJoPeleR7Nk12xh1c0oHX6INi?=
 =?us-ascii?Q?GpSu9CFs8aEniAcZ0+D8btbYREdfpDA40dV1mT/89wH7e11R0hyIMdjTQlsf?=
 =?us-ascii?Q?RMARV6Xsr4wRqK2z+cVuUvyzj8BHzItL/aMOnJLcDVyRDhw5MiGbnWmm3NYl?=
 =?us-ascii?Q?4aaWJgHUNw4NLYXcoF5hW2L8iZ3NhRpvwUi8aEWoLCwRTcK+6YuFxlmg4s3Y?=
 =?us-ascii?Q?jWHi8vXNCRSwLB8S8Ve1621JzgWCRQCTPmvuYT9lRwUjXwbMRMNg85fD5QyZ?=
 =?us-ascii?Q?WQeK+sEVIZMdzgdlhZiNd0VVZveMHYkSPAcM1AmXfFEfQan9TyxRIBnEJbzL?=
 =?us-ascii?Q?sz3wkXUMfx4z9kJRPwcJZQIXLPm2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tKY7420n11MxziaXBJtge2ajjIBdtDcuevCqweS4j+aGMey2XmJtNtqeept9?=
 =?us-ascii?Q?nCkqa82h5sOZVg4Ffcia2gQ/+T/6/tsTnv+QcwXimm7KNbdh9mpKs6d+5QDq?=
 =?us-ascii?Q?orNxz2IRK+wIBXuPBDGPb3iRxc3DUaXPfyewf9sw/LuJWYjExeB5nF99DwZY?=
 =?us-ascii?Q?kB3o7cCtRInH98o8p1J3/Eve8FV4qdrn3XiCSck5MnuYMhgsk4CWvICBSuJI?=
 =?us-ascii?Q?64y8Nod5CPPXBG16exVpwmB2VDPAmRbSqDkwR4GLKS92l3WvYLwpDeGJSNC5?=
 =?us-ascii?Q?9Rqwnik2htchPOok0KeDZnK7LrZ7tr94lPi3RUjDWBC3oVPlApnUAwZlG/9v?=
 =?us-ascii?Q?ljBT/qHVH4SVmRy7DeAVPmh4m2ykwPKQRiu9DGPgVv7PTsQ26+78DkxggFTa?=
 =?us-ascii?Q?RlA7NJF2W99pNUgad92AyMXJz4A8Tf1RwHTCfRNLPmZcc0361I4Me6DQPRDP?=
 =?us-ascii?Q?j4q7giJuZbYIKdVatyhdef55ilsIdFIwf3rAipsLoQJVd+PdSMcP0CtlBtLm?=
 =?us-ascii?Q?eaeNRcQMIN5f5iMcb2efb1HuEGbo7KXyzZBRWNjhsS5a1PW5CtOq/gVPtuTs?=
 =?us-ascii?Q?7ugjrcG+3h9WZ54KHrqFbeckzvSaP/jJb8q7vTRDqEIDEw9iqvFCCh5OK5gb?=
 =?us-ascii?Q?taUYxBZfEcf7MHH+HUxuznWmSYy13D1WUNTIlugYSWBkDcZfhXjLmJmJU3Sb?=
 =?us-ascii?Q?qMWjKtCidmR3ROqhqg8AN22SSfNp4bpYB9ras3WhOM7l6DcYA2fnmvueghd4?=
 =?us-ascii?Q?Z+ERO29sVIgLRZXNqjdabKohEqa2qeQFD5WhBcINlqN+VuOO2bOisFVMQWLH?=
 =?us-ascii?Q?sXOBaj27k6sRipn+o5XnO6c+5FArUtbG8OcPQjhnFwtLn58H6FEmd4l9W0Qw?=
 =?us-ascii?Q?plYisG7Mr/AuwGVLHNxdCZoxZpcgP1tyBja/4wicATwavlHAXUgqxaotz4aB?=
 =?us-ascii?Q?CC2fGCYus+1ZiaLYSVec2Sq4qc/FH9EbI+LEIZOrkTIsHHsMzP1ALGl4gZvN?=
 =?us-ascii?Q?0/GinWMZRTPKo9zIOpgrX+0YY+ykBfUtnqRj48VlUAunMuiPUI6xwGF9h4UD?=
 =?us-ascii?Q?EP5wotV1GI4XYnAvzOn8b61jH9sjjgEmWtr7TB/nKRGT13pcwlQC747Xl0HR?=
 =?us-ascii?Q?8/3fwzUyt1H+IvUA40cygVoUvkfVdIg9oo1rmskXpXlThF7eXEZQlayE98Bh?=
 =?us-ascii?Q?6kxc8Qariy0G72WlrmZv7fJ3i80KuNomML5n2tOgngdzLV9a/ObcRo2jrW3l?=
 =?us-ascii?Q?bypnDSC0MJ4rkX+5Jtj6byV+0u/ghBPsrdy51NPLIEwKrEo7St5bpshkdgxB?=
 =?us-ascii?Q?XxG8Y2bezOJjY3jsu/XI7IS0+4BLF7oyVMpyas36pjSqtZSamOx+A6yb4H2x?=
 =?us-ascii?Q?bXaQzqYMrfGD2K0F7zTIlVoS6AZImD4KW/8NYcnUhlgvD6WgRp6IQHKp8wfL?=
 =?us-ascii?Q?EZ6I8wW4vPsZI0EdYrE+JU5KsimRsjnphHCdTuUvwn9vTZ/EvHcn8gNWj0wR?=
 =?us-ascii?Q?zrPk8g9850dZaRUchpmI1V40lgqv8BAhW9ItSUMiSiiB7ujrFCYKcvdRBUpW?=
 =?us-ascii?Q?AkR6oCPkE+ZUgoqqVBj4KpWLatxdYUHVhqv03iclhnebLSHBK66ESLLr/iMe?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PNlY0iY1tX1REppwj0kGyEO/2xFlj6yW16rxTlPcBh9rvapugMxYt/sncgV3skmlkQmBG7EsRAqZ2CpzZGFm/XxUAQBFaqWZa/nEzXVvffRiUx6xU7jy7xQDS9z/E9EA82osEjlBr1oo7mTcftk42sJJKtKMu/iVm7Esut42kp5q+451CeeclRIpynrLRGVs7yMc1oSriWUBIPf15V/G5w0Okr4+hDViuRrEdYrTg6iT2zOch7R+52ipU8GlaIcBNFZe2a5qIvfd2rG3abL2IINhhxw64BXAoqCXJoPo3l7UF8sxby2/fLwq8FVlwEaVcaTqguO373x8v8rO8SQVUL+UxUIEK/JFG8rkU8cxCju2UUN3LTPE/cyj6DhOf9RTJrhVYUCzZbLFXcDkQt00aIWOnLof0zYwnFMS3cOm60drD/ZNrB4XmsknFm/Vdea59v72cf18zX8xlfH+Kc9Mj9Mh088e1C7SRhAkT7YwUYUCXnJtrv2VdCdPmTSQiIYcxf/s9zQAEUHRNnly+nVm7FySieDKwah7oXDr68bhEVSM/oZ3a0uHN5VQZOsd5bOneDBcsiYmmFCJaK8gay650wBpKsBkUK7OiCZ35K223kA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136822c3-2a8d-432e-508a-08dd33ea4ec4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:52:39.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js9oel2I8Bs+p+Pbao88ZwwiH3faWld0R7U5xnjnP+WEQZT28WZWH/4YuJ0FqRR7SULyDRTFoaEyAczVcnAGsyiDjU5Jp7e+wtEC5Rqe6Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6820
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130131
X-Proofpoint-ORIG-GUID: 6BI9MMmk9Psot_1JEAsTHoC1DTgsdIZ1
X-Proofpoint-GUID: 6BI9MMmk9Psot_1JEAsTHoC1DTgsdIZ1

On Fri, Jan 10, 2025 at 08:25:56PM -0800, Suren Baghdasaryan wrote:
> vma_start_write() is used in many places and will grow in size very soon.
> It is not used in performance critical paths and uninlining it should
> limit the future code size growth.
> No functional changes.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

LGTM,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/mm.h | 12 +++---------
>  mm/memory.c        | 14 ++++++++++++++
>  2 files changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index cbb4e3dbbaed..3432756d95e6 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -787,6 +787,8 @@ static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_l
>  	return (vma->vm_lock_seq == *mm_lock_seq);
>  }
>
> +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
> +
>  /*
>   * Begin writing to a VMA.
>   * Exclude concurrent readers under the per-VMA lock until the currently
> @@ -799,15 +801,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
>  	if (__is_vma_write_locked(vma, &mm_lock_seq))
>  		return;
>
> -	down_write(&vma->vm_lock.lock);
> -	/*
> -	 * We should use WRITE_ONCE() here because we can have concurrent reads
> -	 * from the early lockless pessimistic check in vma_start_read().
> -	 * We don't really care about the correctness of that early check, but
> -	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
> -	 */
> -	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> -	up_write(&vma->vm_lock.lock);
> +	__vma_start_write(vma, mm_lock_seq);
>  }
>
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> diff --git a/mm/memory.c b/mm/memory.c
> index d0dee2282325..236fdecd44d6 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6328,6 +6328,20 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
>  #endif
>
>  #ifdef CONFIG_PER_VMA_LOCK
> +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
> +{
> +	down_write(&vma->vm_lock.lock);
> +	/*
> +	 * We should use WRITE_ONCE() here because we can have concurrent reads
> +	 * from the early lockless pessimistic check in vma_start_read().
> +	 * We don't really care about the correctness of that early check, but
> +	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
> +	 */
> +	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> +	up_write(&vma->vm_lock.lock);
> +}
> +EXPORT_SYMBOL_GPL(__vma_start_write);
> +
>  /*
>   * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
>   * stable and not isolated. If the VMA is not found or is being modified the
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
