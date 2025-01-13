Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6CA229813;
	Mon, 13 Jan 2025 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788462; cv=fail; b=LFxt3rtF+UKHTw4/ad4HY1IzReZSm6gd5lkQ2J9f2xa8bW5xWvjlrb0fpXXNsgy2X9DMGx+z882+5dgMWRU7Uo/JqTNOsc1YK9suXUNoZw0AfHlO9hGyVqmSLBBnqzI0ppC20uFhDEmQ3iDy42Xpg293dAm/4lxAbuv5TlD6Bq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788462; c=relaxed/simple;
	bh=FmSoGDo35gR2hyxdbbfFAGSGNd/jJ/jie97ovUH65QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e5lHVEzw1IhCOr0AvrRSPOk677kOVpFgLHzAXWsnk56nCA1iacJBQ3jY+3RMqIxdsMctAsGcpmCw3qEyRa7WJ2XVRISMXvFp74tXI/iHenR21ecRq+B3gfzRWmdh5zcZxfT1nk1ah/WLvdl/dcyvpc9ZKjDWsB3HgvElOfaVFig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OTMWMY/W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CvZkXdah; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OTMWMY/W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CvZkXdah"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHBTKD005968;
	Mon, 13 Jan 2025 17:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=g6srTbNxWH5cQirngzTP8HfXffU3m9ENg9Jbp0p5pcE=; b=
	OTMWMY/WHQ48wVuhUlbichQi/dM16fiu9MhOe1jaLVJ3Q+1UBToRBrY1wlUU/Rko
	M4Dkj4j2LoWTtPCxR9gs3At9ctLequp+pSOJLervczgosrWC8QSauQD4ofZAMgaZ
	RAjlXo/ViuImrRk8E2/1e3RcT0kzfDJg2Acn2htoRL7EGGrBBYE5cnZ32ba+GSrG
	nDudQkKUoIH8XwxcfX74c4jo/urQkkV5Ru8pK5zGqbfa27ynrNtw+7p6BDSaFaZ8
	gXMW726gBNsNxYllz+10QF4sPJHsdpbws222mDp3Lz9g3ImRGCwZMy3Wa5rludt0
	cctRwzY2nXMk09lZEmeCLw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gpcm5t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:13:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DH87j9040337;
	Mon, 13 Jan 2025 17:13:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f377rrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:13:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9lEnnhe3rpwxDo+mTSB4VwGHA8l9KC9cKHHTrub++ZxPlrnBhldZVVv8rlpldkvt06nesvJ/zPuu5ebsKZWb/NuLYAhHA9C5zVE2ghDzDcG/8MdtPf6mrbrRvWmxUUE/B1FCL3qzydgLx/OrbGVNqif1opRVeocY9KeKqQ62ju+gaNHAnjNascHj5a/tHoscUIsXcBjenKhhnoc5NFrOINnzVWPPz7LwNR8M8FLFChp4fDQuJYxbDmVvKuPpL5mXtcWpXYENOVdwQQvZrglIW4kwUTWRnfGGnQGEkEqRwVY4kAUhx2LhVQtYn3gK+4CoBG9BfZPqNUJxj+hfH4igQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6srTbNxWH5cQirngzTP8HfXffU3m9ENg9Jbp0p5pcE=;
 b=QWdTOdaMJ1nqf/o3N51NbRL33BhuH9fL+l26Y8+r0jvEvGVLYHlzSdpB9SO3X9tiFvOtWgsLONwwWl4sjiqQLbohvCpSYg4LupOvzPS8BIdFEjpPagn47ooESI7qtsGwagpcWwDXqVT6pgyb8cp8rKQOR4uuMXJoUTSiyz9UJrNSLBh/x2yJwXRxXp4wDn9GQ2rjlliXaIHQiSV0B1hw2ZMr1fMdR5ngQ/5j9/yHEyl6AO6lcbSCpNTgEmjmvHwfFM0I0K6DisFkc4zqp6ZK6DQIBS0lWmxa2AIhu2FdBFY5bVwkq5GtT7YdkpGiXBqcnrVaW3eY1ryD3i+/ky9w9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6srTbNxWH5cQirngzTP8HfXffU3m9ENg9Jbp0p5pcE=;
 b=CvZkXdahUR/o2XC3GfK59vRnN9Orc1W4lR3Urxp5Ek5NmGWObRUIkIaIexpUaxSf1siDsqjn3/yU/CKrHcRrtoTfiTqKYar/OzVugcg7KLNrmQXy96ysXYNm8nuT+zBGOTNZQDgXQNr9l18O+WBmiEk2f3r2OZuJoJ8gX6vewKw=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB7157.namprd10.prod.outlook.com (2603:10b6:208:400::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 17:13:46 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 17:13:46 +0000
Date: Mon, 13 Jan 2025 17:13:42 +0000
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
Subject: Re: [PATCH v9 05/17] mm: mark vmas detached upon exit
Message-ID: <15720844-b970-4b37-b475-bf6e7c72113e@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-6-surenb@google.com>
 <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local>
 <CAJuCfpGJu88XgJUJ45aSPQNfUw4UuBRtGzB4HSybiP8xzyUTPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGJu88XgJUJ45aSPQNfUw4UuBRtGzB4HSybiP8xzyUTPQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0212.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fe7cec-7cdc-4616-ce5d-08dd33f5a3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3MyeWwrOEZHRzl4d2Q2QktuSGZEa09uMWJ1bjhIVndWWGkvRjRuMXRjRnhr?=
 =?utf-8?B?bFpTN3cxb1ViSUdnempGbC9pWlYwclBkSDhSVTRwWXFtNVl6U2FybnRrNXEv?=
 =?utf-8?B?OVQ1VmpTVzFqY01YZldpa0o5S1J5TXdFRndDRmUrZUJoOGdEVWFvWFprSXlT?=
 =?utf-8?B?c0dnOHJIQjdNMWlMM3RUZE5NVVEvNzVPNTRjRjRPNjAyTTdmV1B5a1A1bVpj?=
 =?utf-8?B?cmRubjhIUU9OZWpuUFFFOWgvZmtENUpWNHUwZnN3U1h0SzR5SjVrb1pXaWRv?=
 =?utf-8?B?Wjg0N0Uvdmh4aWpvSzFtODRWT3FkMWdkanNvcDc3ck8rQ2dHT3BlNkU3Tktw?=
 =?utf-8?B?bm9JbkhQaytmQ3R0eGgzWGZGT3B6YWNKczdiWHFBNVQzemJpRVdYRC90QlUy?=
 =?utf-8?B?b3dBT0tFMWkvUFBya0lhQTRIMVcyL3JHV0VXWmdTYmlxRkVPNUYvQUJEUksz?=
 =?utf-8?B?cHM2Qm1GSE1oa1FHY0tTU0ROYUp6TG1BYmkrUFdhTXlGTVVSM1FtM01xaDNI?=
 =?utf-8?B?YmlnU0NnRDl5SnJzL0tKS20yVkREejlCK3lLWGRRUnlYamtyMVdDbGtjeUQw?=
 =?utf-8?B?djZZVTgyMmRXcFN3S013WFJIcFlRN0xJTVd1cWdUSmhIY1E4WEVlOHVnQ21J?=
 =?utf-8?B?RkkrZGlvNGJXNVJMMXZUUVh1WHU5L2JSQ2pFTWsrOEs1d0p0SWpDRXM4Z1RB?=
 =?utf-8?B?WUxIUTNnUmlFT051a0tWbG5tNUo4ajgrMS9DaUU2bEpWNlhLU0MrdHdMQXA1?=
 =?utf-8?B?YTdFOHY1WW9uR0JBQjJsb3lDQUNoeWg0OTlzdHFwRnpMRXE5Qm93d0VEQzRY?=
 =?utf-8?B?cHFBSS9nUTlSOEJBaXpJbExuLzFnTmozMzlNM0ZnTTJ1SG04aC9LYnZjdXpL?=
 =?utf-8?B?UGJidGpiaEtQajNQTGNlVWxaYytTeFd4RlZtZk1OYVFseDdtajJVZW94ZGk0?=
 =?utf-8?B?aGZTMmk0ZW5tYU5lZkhqcG4valE2QlZhZW5uYmdrbTkvS2hLLzZuMzRyWW9G?=
 =?utf-8?B?WU5HdUVMVk4wcXFkUUlwc01pOHRuTDc2NTh2alNDVkJ4WUN3MWhDbUdCZ1pF?=
 =?utf-8?B?bzU4TnhINWRTVzhvV3lZdDFZRTVsZUk5TmV3c2pwK2V3VGxhQjhLUnJzS2dF?=
 =?utf-8?B?OUVKY1UxWGxmU0VFT3R5empTMzBSRWdvMzNINEdQclM3S0p6UEoveHBKeWZS?=
 =?utf-8?B?TE9YN05VK2x3M1Y1TEJWQmEvUE1IeG03cDJJQjBaejZBTHRCNFg5dUNmSFF3?=
 =?utf-8?B?MWhobGo4WnoxditNSEtSQ09lb2lLZWlBb1NjSGsrWjFFY09CeFdDamw4RTBn?=
 =?utf-8?B?TmI2SlgvdlRKSzFKUnY4cUpoV0t3ZlhQditPNGdscW52UTNySXk1V1R1WFVQ?=
 =?utf-8?B?dXZLZU9OQVFiV2xsNVRvS0R0bC9tV1NESTY4NE1qUElkWUc3OE1OUkFzNTBx?=
 =?utf-8?B?STFKVGJ5ZldzUkdFT3ptK0RtSHJFZUkwM1lNSlp6QjJOTndLUGpGWjZqVWYx?=
 =?utf-8?B?dUVNb1BmOW1jNEI1SkpERndsRXV2dnlmZWVabmJRSm9tOEZsRTdhRnRoNHY1?=
 =?utf-8?B?dVh0WjdkbUhreitsaVJnRjNWWjBvZ3ZvMzJxUUxkbGJFWVUveGFaY2ZvN3dC?=
 =?utf-8?B?QjJoNld1QmVMS0FMN0FPdXhuYW5TWFFSaDBKc1ptb1g2eVV1dXFoU3ZOVnNj?=
 =?utf-8?B?SnNhVEFjenFhWVdYT2VvY01lbC9JS05UMUVsTEJoVGdFRk9Md0U2STczQlhS?=
 =?utf-8?B?RmRPdHQvdnhwdFFWVFprWHlKRFNEdXZwM1JFOTBsek1qZ3gvVEhmUHZaWTY3?=
 =?utf-8?B?N2k3M1FpaXJXaHhac1RDa2d1aDU3b3hwTXdLTkptY2tBSlpyVnhKcUhHTGRk?=
 =?utf-8?Q?n9503d6ZXCovS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cllTT1R4NlhBK2EwT2E0R3VoN29QdG1EUXFhR1g4NURFSmw5TTJiVEM0UjJo?=
 =?utf-8?B?aEtMRXRkT3lRYWVTeURNZlNPcW5wYnE0ejhKYUphMlpvSDZRUUN6c3RKWitZ?=
 =?utf-8?B?RS9JbXhNM1VGUU9LTWlEK2ptSHNPVGhLMVpnRXErYlNMaWZYclBING94N1BC?=
 =?utf-8?B?ZE94NW1SMUxlS0JrUXVJdDFkR0Z0OE5UMGhJRmhiK3pKam5Md05BR0ZWd205?=
 =?utf-8?B?WmwvdGYwT0cvTDlBOTM2bTVxTnlIMVdWTmNVR0xHQ04zTFpVeWFNZTBvRjlk?=
 =?utf-8?B?R1hMN0VrbkFJL2JPbWhuMUc3NzBIQ0FGTDd6NkhHdFQwVGJHTHh4Rko4NWZ2?=
 =?utf-8?B?a1lROStnMDhwVU9ndGdoOXBVZ2UxdWY4aGdEcFk1TDJxeWNydkoxVnhObWFK?=
 =?utf-8?B?amM3RmhIRm5UZEhTNDFYcTJjME9CTllhT29HckVjNzcvNHd2eVI5ZlFaVzNx?=
 =?utf-8?B?eUhrL0p0MTJieHdwNE00bVRsOTF5aHpjaXFZNEV4MnVncXRYUUJ0ZFN2OU80?=
 =?utf-8?B?enpoNElLUDNYckhZTUlOZU5hcmk5UUJpN2RlVmVjQS9rS2FZT3QrYU9DcWhE?=
 =?utf-8?B?Q0h3Ylc5LytXeFU1WE9RbHFxcFcyZmp3eWdpVG1PZDNhTTFLU3AzN0hweE1t?=
 =?utf-8?B?VmE2Y3J1MFU4RzhUajZVdXlaT29IT1JyZXhkazh1UUV4S1lqNTd0cVhZMjAw?=
 =?utf-8?B?VHpjQ1FQMHcwNnhzTWxXSkZNSjd5c1drNGswQ1ZqOTM5NUZXSzlUdGdoeWo1?=
 =?utf-8?B?WCs2TnYwbmtkZ1FROWhXRHdUdlBnZC9QV2M1a2ZvVlp5MkFTV1R2Tll0eDVM?=
 =?utf-8?B?Y1NKS3pHTUJZbmJRVVk4Y1djM2dPZmRhZkVaMTlJTGpvTGNNR3lXODMzMjRQ?=
 =?utf-8?B?UkdEb0RhQ3gxMW55dWpPeUdQNDY1M1d4amlCYkRUR0VVaStLWWFub3d1NENm?=
 =?utf-8?B?QXgvcnRxcityUitXMlZzVkRKUzJvY1FId3JYN1FHVkRTNUJvNm1uZk1BeGxp?=
 =?utf-8?B?d3BnZmJaTTRLNkdQT3ZuVFlKUWpwd3B0N3F4b0x2RHgxa2xidDV0aFMzcGF3?=
 =?utf-8?B?QW4rL29zVFV4QmVNdVRzcFN5NW05OEx5YTg5WFhxRFMxQWQ4YkFwSVh6S2FK?=
 =?utf-8?B?OXlwdU5MaDRoajdHTXNIMFhueEl1N29aVFNEUGExT3JqbURpay9LTFNWdzlM?=
 =?utf-8?B?aVRLMjk2NjFUTWN5VHN1V2JZWnhMOUprbzdGZ2dtZ3hLZzJhMGdXNVpHNk4w?=
 =?utf-8?B?UERDMjFiMnMrTXJ6bW9DdmtDQUFTbllzODIvR2xoM2JsWHordEhOdlcxckhl?=
 =?utf-8?B?WkUyUWVKV2JVL1BIdFROZXd2SlhtdGFQbnJzb1IvQ0x0WFBCQ1pWTS9jUDZq?=
 =?utf-8?B?dS8wWHRrR2ZGaDRHTXBaRWV1R0xqd1FNTC83bjNLY2tUd2lpNXFqdU9ocm9a?=
 =?utf-8?B?NmNvNGZEdUF3dW1yTmlxRHppM1hablNjNWN1R2h4UXhaejc5MGZXb0k0eGNz?=
 =?utf-8?B?Y2VMVjZ0ZjIvbnRFMkM0V0FMTjZKOU5OdUN4Yzk4OFJTdC9MN1JqN2tlbzRq?=
 =?utf-8?B?VE9xWENrVmJuMERMbFdqOWgrN2JtTmt4M09UOThKbkQ0STJJM1djMG9yT3Er?=
 =?utf-8?B?VWFZcExqb3BjUUtHVUd5bHdISEUvaUpsSWp1Ui9reUtZNFF6dU1valhTTkt0?=
 =?utf-8?B?eDd0c2NDVkZEV3RkODdhbmZ4SllGY2l6cjN1WHBxWnM2YStETXUwWC9rb2pR?=
 =?utf-8?B?cThNa00ybEt0RzNrQUh2Yjh2VWdmclFxZmlpWVZhZEUvWGt0TnJGRHRTTjFQ?=
 =?utf-8?B?dTBCUWQwNThXSDVkMDFxdURmWG9wbnNHNHVFdUplNUVSd0lqV0l3bVVKSSs4?=
 =?utf-8?B?Q2Q0WGV6RW02NFVhRTMrNHV6Nlljajh1T1N1ZlRGMWR1MTlEYUtEU2VlMTk4?=
 =?utf-8?B?eDJtanBCbHVGSUFUNk83KzlzWnFybjVPMHJkcFJFUTlMYUtDVUxCMlJ2L0ZY?=
 =?utf-8?B?WnkvM1Y4NkZRdXRjZWFZV3JFM1IzL2dvVU94YjFYamZGQ2djOTV0MGE2Sita?=
 =?utf-8?B?Q01RNFVNYm0xWnEwcmoyYzdjcDhWeWNwNWxubTYrZkdLTFBPeVBDdUIyYTAz?=
 =?utf-8?B?UE9ET1kwL200ampCUGlQVzU2c3FSMjJobmt2djQ0WXVHb2VaNEJYbnJMT3Fy?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DQJ187OBGFmAbAoEC16DE1cBBy8hQzMcHt49oQE20pcp0lCUEI79KTlaNlmBlqeM2GTOoDMtxj27N4gxpILUiS1d8YrSlIlAZKSUdE/fd55KFAzqCQ8lQYhKq2qVeXSYqEoril2QbMdMk+oN6gZwTSTtt71KP/P84KHXoZ6F5ixdUYiEhhL4Pq+cCgaY7GaLEpZ/8t3v4i7k3DmGIA/9MnWiL5h4YNyMYTDYZ4caX+DpIGGDP3Ou6KgmC36jSFW2CPH/qNbD50tK9PgEGoEA1Vx1SxGm7+OoQ308qTGO6kX7K51m0f2Qi+kMQ4koma07rfr4VZV0wvUdTLtx4keA9yqM27AsH3C8mbZdffoK2hCFtK60uzR1A6rj2OURxtbKodACx5vFsBOIMhS+878Z0GLMUl42TiLFL1q6ss2DboqoQWSqxgTOIpQKJ4hKahYpVwCC2TKDlzDIUbWHVbWtgs+G5SlR8nFBDcFXKGl1rZY4hoF119nWB0SrhlWqGkANMRRUC2ZzzMzyxhA+NEBXdxwEQtHz+RIG2yEFDOJfxurAL5JMZQCZf+0tKdQfIHtEIzNobtZSHWSF372FNM4uEMHDTSJbDCna4HI0k1NPmQ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fe7cec-7cdc-4616-ce5d-08dd33f5a3a6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 17:13:46.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Msglc/msZtV6yUC6qKEhgvzAWYD7RWj4aBF9+whoWsYuiX0Gm1GsQBP0XqShvrGJk5Kpg3hGzL/gtbxrcOEoqMfWmv31apk72p7/L4IqLOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130140
X-Proofpoint-GUID: t3UnX7kbltGZw2pIhhnAbMc7sg7is4XB
X-Proofpoint-ORIG-GUID: t3UnX7kbltGZw2pIhhnAbMc7sg7is4XB

On Mon, Jan 13, 2025 at 09:02:50AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 4:05 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Fri, Jan 10, 2025 at 08:25:52PM -0800, Suren Baghdasaryan wrote:
> > > When exit_mmap() removes vmas belonging to an exiting task, it does not
> > > mark them as detached since they can't be reached by other tasks and they
> > > will be freed shortly. Once we introduce vma reuse, all vmas will have to
> > > be in detached state before they are freed to ensure vma when reused is
> > > in a consistent state. Add missing vma_mark_detached() before freeing the
> > > vma.
> >
> > Hmm this really makes me worry that we'll see bugs from this detached
> > stuff, do we make this assumption anywhere else I wonder?
>
> This is the only place which does not currently detach the vma before
> freeing it. If someone tries adding a case like that in the future,
> they will be met with vma_assert_detached() inside vm_area_free().

OK good to know!

Again, I wonder if we should make these assertions stronger as commented
elsewhere, because if we see them in production isn't that worth an actual
non-debug WARN_ON_ONCE()?

>
> >
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> >
> > But regardless, prima facie, this looks fine, so:
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > > ---
> > >  mm/vma.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/vma.c b/mm/vma.c
> > > index b9cf552e120c..93ff42ac2002 100644
> > > --- a/mm/vma.c
> > > +++ b/mm/vma.c
> > > @@ -413,10 +413,12 @@ void remove_vma(struct vm_area_struct *vma, bool unreachable)
> > >       if (vma->vm_file)
> > >               fput(vma->vm_file);
> > >       mpol_put(vma_policy(vma));
> > > -     if (unreachable)
> > > +     if (unreachable) {
> > > +             vma_mark_detached(vma);
> > >               __vm_area_free(vma);
> > > -     else
> > > +     } else {
> > >               vm_area_free(vma);
> > > +     }
> > >  }
> > >
> > >  /*
> > > --
> > > 2.47.1.613.gc27f4b7a9f-goog
> > >
