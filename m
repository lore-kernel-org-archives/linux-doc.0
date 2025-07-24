Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3959C20126A
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753385112; cv=fail; b=kXA8U0ABOTAe8sEQIV1OSqcv0X3TUez5WtcsatBitd4th34ot8Kh3RW+JqyG9zI0DP65yPsWKl/BGSiy+OmWyuc4JiHIqjQJYRTrjiKDpBKn5uC8j0be0SCVamhMIAcpj91HgqrPNv2ESS794F8MW+JYiCvp7eBEGXXI3dbXg4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753385112; c=relaxed/simple;
	bh=vQLQfdWH5RvKsZEVjB09LBA5v8dp/fbE9gUqDKTYhMo=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=EBheuv5oHDql8I81jcVe7yVLgUcr7eX2QMKhPCryYTvls9+7KIG8bf40Ckdud7Cj/3IF9aSWEEzieuILGQ74gHldPcSPHq5NIGSUMEfFyaYkf1RzblOjsihlAgPsSi/lxNQPUELpX4vesrJmOdCYyyWptFa/8HdhhQlhVKcFDZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=miD1C0Mq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Iv8rPQ+k; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="miD1C0Mq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Iv8rPQ+k"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGiqjr000437;
	Thu, 24 Jul 2025 19:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ctsl1vozkFrKBPn2tM
	dr2Aa5Y/kGf13aU7PBeWOLgKA=; b=miD1C0MqDoR1k+uFv/t1WIBXjiCBC1GPTr
	NIwlNbNoj/D26LBBduSfjOYcD8SFepkDfvIZLQq/eOukuITt1HMYTebRPZTkhXBm
	rMYjc3YMOFeqymWIljbyO93KyXVbreQ1MlPLCIX8Ob7IG5n+Hp5gb69a0xaFJqQv
	8BxgvNg+91dzvKvtLNgLBOJwq6wui0lDQrLs9AA5g+luh8TKX4HxrdhdERV7pomD
	KXPeq7W9ssOkem8hDjIDO1Ky2Oq+htz+urVIwQ06pSWy+5EEmGB7AR02cGnLxziH
	I1TFBDPtR4y12Hqgaxb4C/X1Zf8/e4Y/FOu5xXahke91hVpW2wEw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e2j95p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Jul 2025 19:24:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OIG7GK011418;
	Thu, 24 Jul 2025 19:24:47 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc781a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Jul 2025 19:24:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9RbHMW9YogiCR0Vh5au3pM4DdmLSjLlb1As7JFC2rHcPwDMDd8D+6PHtXWXY9ldstRLUeA5SJEgnei9yxdwpBNNHJ3luiPp87TW985CwwS3UX18uzTfTwpTOHWNKotx1nB8hkUKP9Kx/vbpRQIXFGYxNIDSmuUNi2k1vAurBO/EDf/2EMeUrK1Wxkm/hsuR63ZN3jHOi6WljLN6bsqBUeuKT+HwWXzqvW5no3OT05awEcgwHTiedjn31aIB3S4YawXnwadIZTxe4Dtc2Ft6VD3L2E+zz8h1DT0WH+7z82e+yec98q3i4sYUyTEFHVEkD/eMYYc5h7G4m2L+YbqxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ctsl1vozkFrKBPn2tMdr2Aa5Y/kGf13aU7PBeWOLgKA=;
 b=oO9Ij3yNn22xHoeWNOT4KGBbDRGntgVW/MIUBgTzunOpwlIc3Wt0Iv8Wi1Te+dKzg8eqd/y24bJ7FAe16IJ2UOHH9IDTaYyUPlwaFWegpaqQnjLaMBDJgl21gN2eF14n39shLSRdTgcUt09U2zT24bvaqlyBwYRVdWsv6l8iaXG63/gDJAE+XJPLJR4YJ5NgOLp38D9qafRhfg3yhlbWjBLzvXSusbTME+YT5CWfPMcHJ3G/00MByNC5h3+zLUKTONaFvUC9/lkZhag4tLAIhNOhrpDi8H13cSfk9r6Kty2kA8/oUFpAWx3YqyQAgIOy30XXhJ7pAmihxTnAaqYLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctsl1vozkFrKBPn2tMdr2Aa5Y/kGf13aU7PBeWOLgKA=;
 b=Iv8rPQ+k7olZVfpl+RDJfKBF8EDP8bJnThMjaKuPo5ceLj+qNhme3aab8ZIPratcY6ZnMEtVfXrH5RtYJgr33Ks8IBIe6RJmcvJ1SBbBQ5rFkF1e3GVF1wx9KD6XKHLoPc52EHDI/kK9QIuX6OOmDmGxdfL/MJlN4nGfIx+iSGM=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by LV3PR10MB8179.namprd10.prod.outlook.com (2603:10b6:408:28a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 19:24:45 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 19:24:44 +0000
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        James Bottomley
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>
Subject: Re: [PATCH] docs: filesystems: sysfs: Recommend sysfs_emit() for
 new code only
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250724153449.2433395-1-bvanassche@acm.org> (Bart Van Assche's
	message of "Thu, 24 Jul 2025 08:34:42 -0700")
Organization: Oracle Corporation
Message-ID: <yq134alv1pv.fsf@ca-mkp.ca.oracle.com>
References: <20250724153449.2433395-1-bvanassche@acm.org>
Date: Thu, 24 Jul 2025 15:24:42 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|LV3PR10MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b4a9ed-4884-46f1-1173-08ddcae7beeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iJDPE+WYtDtl3HGvccInvu7Z4Uk0BTJ9/FFILKrM6luB+jCAMLo/GMTcnopP?=
 =?us-ascii?Q?ObR7ZYFKwvzr8WtrDA7FnSQYnL4uCZXoB1XXQZ0eS5irnDRtIWru+cSnoLoV?=
 =?us-ascii?Q?bt/AjCUgTiwkkkwgwflu64oubQmsIH2QMiGIgx8XI9EK8Zluf/f0hAHcUgRO?=
 =?us-ascii?Q?RWFJrh1zhrFgzT0DslaZui9LBsMz+RVylfgquQSFWqUXUB9sf1xGBGlts6uv?=
 =?us-ascii?Q?GzV4UPYzCbuiP9hGEQ9LwAMSN4qc2Qa+zVpahU2Fa2ZqxQYz8U48/TaF7x6U?=
 =?us-ascii?Q?XbV684HQH2o9L/sVgqwsI3NRikxdtcUZjRNY4oXIViJAbVE4GRKV8CAJc42K?=
 =?us-ascii?Q?6oQ8bjTp3vciG7jPsJLLD1YVWNo27cH4SF9MK/1ZeBhZ25O4+mKHpg0hIK3v?=
 =?us-ascii?Q?05NGAC4IyNXOI6nACuR44TPc8ACMTO6wA3fTMlKSHCyVsIv4zgK4GugvMTtP?=
 =?us-ascii?Q?Bhr+ZRSk92bqpy8s+YhlgcaSHmHLfsHuG14F7INvkl6lPpMs6VKnauGXLKkq?=
 =?us-ascii?Q?xDVK3mLfYZzfbhIHL2an4Y+PAhsfHYZbMrHtPYZ3peQbRue3bbDeAoKPRSLk?=
 =?us-ascii?Q?r8QhysIxjao5leJp0ILUsXuZMKbVTKxRMtRHnwsMupwRrTkJfNC0nVjliIHY?=
 =?us-ascii?Q?3nsZzK/HHLDCAandjzdKU3r3Qg5nULqpE2V4DFLmK9rFd4aVBo/mmDzgBjPL?=
 =?us-ascii?Q?1R3+Zhy/d24Wgf5j8v5j5XOasynxUUUDGxq/gOQPZUYbRNAaj1veJof5XCa+?=
 =?us-ascii?Q?TUCjh4nz+pWw50Ja6UmjZ+aHKeoT21UKB8dYgJ1depJEDWluzfxgCMDqDWQj?=
 =?us-ascii?Q?plYIrhKLUmNuBaKKN0KM0F4H16MYe6Osy+XIsBmDGDcAzcEFrICWMjMpTJYC?=
 =?us-ascii?Q?D1viONqoMqFUD+yvggo4nGWWI8nTx+tW268edGDKNyIchgo6arJVwdCIfBrs?=
 =?us-ascii?Q?BIqBP3qQn0HfTrANUk9sN3Ag/z0QZDuqzcktLpr5goyMv8FEL/fF73Fs1IU4?=
 =?us-ascii?Q?dwVfxjFmJYCD9jgND2yh79vNpqGQ8ehdSidXfN0dm0kHGmaPHvDeLYBABcMq?=
 =?us-ascii?Q?nlGhOO/VUPToJVAjQzHxYTDGMdvk8Jb5RRaTxynF+glWFvdsSjRYd11hb4bM?=
 =?us-ascii?Q?+P5NpGD9ReXBGU2CIEE9P37pAYUC1+mAdMt50952jAJykDI91UBqONfFsWcj?=
 =?us-ascii?Q?nmwatD/EqD0ZXU5Gt28BSbRaxJP1e0GJUWnEvJVveT2HQ/OdCMS0BcKQrIVz?=
 =?us-ascii?Q?b/Gqan2R0Ede1FqZgJmZSxUexlvnde/GAZzUtGBMEGxPel7GDYgX74VHsNYN?=
 =?us-ascii?Q?9p1lqygRbDwC/Wb1+a0v9vGHkIcuUp2OnxYsCReZ/lyHWLzyKpl38gB3NmKK?=
 =?us-ascii?Q?5ofg7qCKtDM39Ia5TPjMjuRZF0fllUbGYToJtddVGzeGGzgCfBUZT0aAyPEg?=
 =?us-ascii?Q?Afj/NBapaR4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ZotZzYqNfNhAMLpleVRxURsDBX+SgvpIEox9h9+BYa8w68sQ4n44ctr469L?=
 =?us-ascii?Q?GXJIo28e247XW2C+1lSkkBVpGbkqT/iMfxtVpKneXZcTA8lFsZHueIOUTcfR?=
 =?us-ascii?Q?fBu9bBy8+PGmOrJAHsAm8PKNlro3VEPpeL2eFCzzNZk06InF4bIejsG6V/V3?=
 =?us-ascii?Q?ld2ciJBhyAmefUUim+ZI35TqYCCQ6Sl1aVHQK+me6u6mOyddnBh44wUqvlWS?=
 =?us-ascii?Q?owgOCOgIpB6Qivc4xdLwY5HX6E1Nuo4VdKFY6cOFkQlmi2tJb6h7b3XFx1eD?=
 =?us-ascii?Q?9rUZlWZi8JBuM5WkcWHp1JRhiigyAviXCCRMCMYwTxeRJdSvdcSQvvk0//S4?=
 =?us-ascii?Q?/dPzaySkIdJZQLLnVK6MdDGZqnneRx2QYrmlQDP1sx6Sg4R5l6MmUkd2NMzn?=
 =?us-ascii?Q?RZYIA1tTce2MoBLhvGyzJ5DPYEVDgcu+FfsSjM3Bo+NCHrhWd4qOD8o+ZKyy?=
 =?us-ascii?Q?qUbL3fNzlB8MAsDYoqPRSBrqwo5zmypgCOFWJoxLWz/Zx1H2tWpp9XMCO7X0?=
 =?us-ascii?Q?2HZhsfiECdd2wN4+BbESDOFAZ9mBQ5fqadUAz7ust/LOSszo2Ui452sY6PSf?=
 =?us-ascii?Q?IumZ/sY7k21ivqSqI8Ob2nM9RseoDt2mnsFXw1UeK/PGclWRdfB4v5GEfWi9?=
 =?us-ascii?Q?iWUJ2zTUaatorAGIv2H6QCPI0auK6nFVgEV6w1MOM2wJWJ7HryrdGlfZ/9wW?=
 =?us-ascii?Q?PdG+5MvzfY+xFRLFB5ZyghQmUc+H9rfiwktSMIvDC75p/dBWfdKOFZo0Bb+Z?=
 =?us-ascii?Q?Ng/Tg6ro93gEMdHFyMBJ2APQOKZn8dGMsFwWhfuVfvXVhy+TR4ceuhd9bZRO?=
 =?us-ascii?Q?9NQ4d2JObGaR9zfTysbspxiTyaCBBwo7JbanEW98A8sKAKtgw+5zCOojNaG/?=
 =?us-ascii?Q?QI7tsuSuU/uQMtAZbJGOisE1MGT1BYoXIPjO7k8yGK0N5c39ZeYXlpE+9tk+?=
 =?us-ascii?Q?hyzJ/PtFQ8u8fMF0eHgdeRWuZVqsvGHafbHS+wEnj1A6JEJXsLp3ZoGCr6Uw?=
 =?us-ascii?Q?IWAfW+Q/NijAD7ntur/c8CevvccLMrHCtblIskxY18GhV9Jw5V1Kx4BGLYMJ?=
 =?us-ascii?Q?TDfq9L9zjo+5A0o0dKgLnsYL8tj35efY4QVl4SOOprhoBcxtqcSIlf3H2Bkq?=
 =?us-ascii?Q?6quRtqOsB/K9HVdP+7vDW+T4RM646VB07T+z4fCUIkdNA2J8kHKLwYKvTSh2?=
 =?us-ascii?Q?C1YCbVqL6rEWgiF2XUnD+aj/htiI5i0lbwLO+vkOAkmbuRNQZdmIWflglGTL?=
 =?us-ascii?Q?DgkuQT0sLcRQl23tx2r0VFROkiVrsNOswCm1ZqFuSwxBenCfuCoORnhEp7nL?=
 =?us-ascii?Q?50pTTtrlgonrzwU6AJcHjGsdyf+2nt6PzPjvyAImJeM860j0067WQEUpZaPp?=
 =?us-ascii?Q?8srbA6/s0DOCRgxRZu/PyILFZVvFgXRmuiImCKWnxOPcQz7NnVWH1Ae2tCIv?=
 =?us-ascii?Q?LbJkaoCzT+QBB3zieP6isTdkX2GjboJ3fRO9oJhx+hN0BJ8iHUlowQPSxCic?=
 =?us-ascii?Q?Yo69ZCf+i67nDhO5XehPm0uTexQkWSKLPTleJ8RCtJe6ntQIWrp4wPUPY18H?=
 =?us-ascii?Q?z/7DbnZLTI0kFMQea2MpUekXffL25xFWHn1u6wVbIPIVwFevp7FcsDNx2fRh?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lEYrYipYrdYXmSGR/GNBJ2+/eMo1+PZmkARTKD7m3gVioZBE+7/F9Had3EjAZ/TCYjZuUUeZyrGffjQ+ezDJOrWmpbCPOthv3SwO4MQ3A8D2njsrtYrdKkpptWpSMbaEz/lndeMZ0Svt2y+MMRdQm29G24w5/ddNm3ow6DV/o5yfpGgqDXQUbmgNKJuZp+Ndi3luI4qW9YqTdWnAsCqO80dXiUdmd3jbN2g6j+LL5SQSLYApswjUdS/UNbxH/ZW3AhZ4bZFrRI94DlHqF6v6L1DxhjoIWjXwILbIf3WkB9qyG8yoM/kzUpaYYnyJ0ykUF+vEFdSMUCrcbbaQY/blY4DkKlCpz/9C6hiWWZLrkDUuRcZFlVUupdE1AUnBql3KTVgV9v0Csi9cf/U7UrsBhycb9Ndsb0b59gxxEmUgO8ffbhIAlaqPo5m+fRdGpNPMBtY26AX9sbfaip1KcJSnszPe2SuB3KHhf96rzb7Wx+2UrV17KcTXp9/sKZiMjlXAd600TWOwXSDK7Z5zirCDMfPnx3n1+sXCT8L6frDkNprzW4vqZRLAzxhrorZKjoJm8rlQdvo+cLEa6fcovnl6ntg+SG5LHzkjaPFCOk7LPYk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b4a9ed-4884-46f1-1173-08ddcae7beeb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 19:24:44.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBxCM799qP8nKY4R9NlDdbF4DPjYKvJTsFHi7Y/kb1qD0xXwU7egCia2Va+esAbZU6TkegIwfZJ8qzcZ5WFnutgT+q0TldOVGwzA2ix7aM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507240150
X-Authority-Analysis: v=2.4 cv=WaYMa1hX c=1 sm=1 tr=0 ts=6882888e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=feadlk6yoULXbmkzUJgA:9
X-Proofpoint-GUID: ECbKfpns3iMhxML2A0m3pFnNzgQqB7W7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE1MSBTYWx0ZWRfXyTiAzP9TTFSm
 saz04GvLdeWHI6tptSvMUf9x44WaDnXiZNINRUs4/aMWH+kTFwv00XtomRkMI2Y7RXKpQ5qe3q+
 SYrXgNCmEwlSNVj3FrpOYidvibDQQYoO7azUH2N/Q0BktEpb+lNW+Whx5QLesZ3ZLULlDtsmKsM
 qoQvFNNm/JJ6W2PdQkzFgyyeQASa9GPosie6b4y195k6g0crzjiQudcysfB/wv0B45EWDyR3/FK
 4xAXBIApfYDjFPgHQZKqgg41KacMhCHaOrS+EEYmGvpkCZCxb2fEgZS8warKRHSc+4/fTDMQ6hD
 +iDt5jDauBEmFu9jooDE9gQ+WnGLWqW9Gq6kVNTFquBblmy4dYFtC95k9VpI/j142iBjL6EyYdp
 lDBgchoA66X1vQxxSSa3WczBxL57xWZ7PzEZqmnvDAThzXFfOTwr954tfDkv98Sq4EGrleHP
X-Proofpoint-ORIG-GUID: ECbKfpns3iMhxML2A0m3pFnNzgQqB7W7


Hi Bart!

> -- show() should only use sysfs_emit() or sysfs_emit_at() when
> formatting

With my standards hat on: That's a "should", not a "shall". But I guess
the "only" makes it sound slightly less optional.

> +- New implementations of show() methods should only use sysfs_emit() or
> +  sysfs_emit_at() when formatting the value to be returned to user
>    space.

Should we make this a "shall" for new implementations?

I'm fine either way.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen
