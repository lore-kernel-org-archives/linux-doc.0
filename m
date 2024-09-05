Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75777F10
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547853; cv=fail; b=NfaQsRJ2sz14GmO4WYnseE+jpSUtmnrcGPqW1qS/uUQdyD+IXFCYF7ck+vfRMEoiQ6PbhFseWR6HZs4friJmVwlp0CE/5+KBAtWs/5cSCRoHBYiGaI7Gk+cSdYzJKcrtOB0+X9qA8BQwVi7Ee/buHx+9NpeMRAoFdw51sz073lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547853; c=relaxed/simple;
	bh=WscI7tF5WfOcDLNotZNKW6dRCghNPkzn0g6K9Hj70o0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nVRTpgXfFCkzgdn9pvBu372dnUutVNfnSTCWO3AdtxmCaWvXhj2nOqkIkICPbdG/VBJ6cogBewOTAvMufv5ZuGA1Qg+C8J2WcSHQMcN6bYlsUgQm/ShOaovKS9jFL6bDcCo3vSsFHNOjx4ujH2Eymf240X7f7lJy18sg9SQCb1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nfQymbWg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=InACTRih; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nfQymbWg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="InACTRih"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485EfWxT030120;
	Thu, 5 Sep 2024 14:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=wkz3QDnfkI2XD7tJID50tUm8YEqQcxAMBNybuQIjFSI=; b=
	nfQymbWgNZafmSTHOtNzusJiF857irkJbClfCWrPYUWBku3nau1MbldUVLP71OzK
	UedldEXZvn/NADEvqQc6pzbjkLs+11M3PzQ5R2fhuNDs+SqkKL4l50TxPEF/ZTmt
	7Dp8jaL9HHCbGXY/4pUrBqAz7pSfmJLx44OLyBRzq0AY9f6aEyrnivlsPD/kxO2o
	kpQCz50J4xSP7FrmcRvf9A/a00G6i7c9BLJRDGf8izB3l1I4rcabzn9ejvyoFGre
	BeDZ43CcilKCHCsxPTwxPgalOhuhPS2NvYVyZhoC8Wc2AoN8h4L8wLL0z2tLPZ2o
	QonWNeyFuxYaDiT/VmjABA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41duyj6a1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Sep 2024 14:50:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 485E0Ckh018422;
	Thu, 5 Sep 2024 14:50:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmhkytf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Sep 2024 14:50:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1u9/jJkdnRjTl+JaW2WORcTUqbKqBAR3ZdBYr0lFg6OuzA0zNDaHs7bGOxjZjEhbSFBY4G8qqDnKMID7bjvG9+RSUMePt3Cg1x3o+sRg0G7Y9rvIRrWJKrzbp4iOaZl7ypB6Fbp4QmbAO3Y16iA9ol1hm5Rt1PkNbwQ6CYguJ6X7ThaYwtKwp7SGHB4WUTjEkM1s+mEkMX3Lp2cEYPj+CGe6M6p9BiOg3sfGPKHDIlL/hp8jD8PV5ifraO2RYVbovVD/7Ewrez6D+RmateAw19xnvY6gjAV67vwqgdR7/aw+3IiGG2JIDqCd1fUa5ZkFrOneXsmG2m7UWI1GiRhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkz3QDnfkI2XD7tJID50tUm8YEqQcxAMBNybuQIjFSI=;
 b=HoBwQKw29FI+3OM0uViFSnaWTuvogtjIRc79y0lJlgPCtm9voZiKexzE/rSLnPKHAeOBCJP0FxCQA7Q4xez7hZAQbpgSctbq6ZxS9fB0XbDf2wU2g6vSE8Mq7ft6dJH/kxW9ciofNW7E9sJeD1ZkTqCk/KW0tPSLPuy+cw9ihwJJN49OzObQgaf138TILhWJa1OA3AdqCwjZVVCRAvpQIgAilyV9S0gyFJ8JjB4oGH3YKwK5jsml6K44HCg7ErVbX+FyRD3HEVe/iflnC06tOLxV8amSs+XH9hO7na0r/NAagEkXGEoxbVquguJhnyI+BBGCrrOL2dB6UrHqSQN0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkz3QDnfkI2XD7tJID50tUm8YEqQcxAMBNybuQIjFSI=;
 b=InACTRihYVbiG4oTgHy5CdEytZZU2DLocxo56b+mq0H1WPWnQIyhlawLeol7RbhUl07fv5smSOukMtW91BF4P6Ejo5O92mzjZG0tZ4SXWcCE7o/sgZbiOpuShlTVvShpvxSNMkryGPJ3QkI0Vd7fgweCso5zojTkjobI4W0shS4=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CH2PR10MB4392.namprd10.prod.outlook.com (2603:10b6:610:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 5 Sep
 2024 14:50:22 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.7939.010; Thu, 5 Sep 2024
 14:50:22 +0000
Message-ID: <0ff57de0-eeb8-4d2c-a739-7a8883b7ed7a@oracle.com>
Date: Thu, 5 Sep 2024 16:50:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Build kernel docs deterministically
To: Jani Nikula <jani.nikula@linux.intel.com>, bernhard+linux-doc@lsmod.de,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <874j6uqokj.fsf@intel.com>
 <a2bda8df-b484-49e6-9e01-92e6cdf4db44@oracle.com> <87plpip51a.fsf@intel.com>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87plpip51a.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0529.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::6) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|CH2PR10MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c433ed-3fb2-416c-deda-08dccdba1140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2VRQnZuWjEza0V6TklqYUswUHBOZnliME4xbW5qSFMvczJRd2JaNXFQTURF?=
 =?utf-8?B?aDMxdC9UUzE1T0plZi9RWnhUT1p2UFBLdzlkU01JUjJFckRJU3pXTFRDVS8v?=
 =?utf-8?B?NkNNSjBicHlhRVQ0Vmtsbkl2SHhQMmNzbmJHcWFlQTFGTEpZNHNKazE2QnAz?=
 =?utf-8?B?aWx2V0Z2dTZUSjNDcXlXMkNqYjhSTTE4UEVMS0xLbnQ5eUlLYUtjVDVMcE9z?=
 =?utf-8?B?NXNRZ29NOHp1VGIxRk5QYkw3bjBDbGhKd2hnMmRmREk1M1l1eEIwTzUyNFlH?=
 =?utf-8?B?clUwdzkwMzNyR1MwY2VlMEtTUStjRjlET0dMdEk4SWVlc1hVMDhTM2pwSnk1?=
 =?utf-8?B?Ymd3Ynp0V0FNLzY0SFFpc1k0WHQ2SCtDNFdkT1pTUTlNcWRibnBSZWJEZnND?=
 =?utf-8?B?QXU4Mlk4allaY3QvT1dwa1RaR0h0UmxzVlFlMHhzQjBJNFlVd05YTm5ZdWlS?=
 =?utf-8?B?cVE1dlJ2L1k3azhYVkZDSG1JbHVDYVVqNGJ5RUgzUi83c2I4alBJMjVxWjk3?=
 =?utf-8?B?a0xNSWRnUzhQYnkxM1hBRmFXMmh5bTg1bmR2WUVLK0VkZ0VUdDQzaktsWWxw?=
 =?utf-8?B?Yk1pdEV1Y3BKU2N4dmlIMkRJS3oycmtHMDNxYjh6ZFkxM0xiRzZPK1ZydmxQ?=
 =?utf-8?B?dVM2WHBIUW4yV096bllhVkZ3UUxCRndTYnVHYk1tVzJFOUs1VHN6ZzNvdW84?=
 =?utf-8?B?eFJWa29jWXZUclptR1BOWlJpazgxUWRiRWlMK1A3emhMa1RhZzU5L1k0cnZS?=
 =?utf-8?B?UHRRVy9KSDlnZGxUYmNSNktCcUlIdHJpdlAzMVczWWZpaTJGRE5heUhOREYv?=
 =?utf-8?B?QnowTFJHTmYrUm9QbzFDcHI0M1NzOVFKRUNpOGl3Sm9hK21RWHI5WVZkd2E4?=
 =?utf-8?B?SlRvWkUzVXRxek9HMEpBUnMxTzh1TXhjcUpXTlM4VFpCN1V3REE1V0RSVTky?=
 =?utf-8?B?WExaT1JCM2lZaGpsZU4yUUF2ekluQ0g4Tnl5U3NuWDdDQTlUVU5KQkljbkty?=
 =?utf-8?B?aUFnZHUyalZkYTQ3ZzMveEo3U3QzbnRxY3FGcDFUakRySGFIQzVkUGl2TFRG?=
 =?utf-8?B?a1ZpUjRtWXRtcDQwRmgyYndTbkNNSkljMlpVeVlCWTJvYlU2dlNCN2FvbGxF?=
 =?utf-8?B?RTJtRTl1dXNMZ1hCbXNoR1lVcjNPbkNGVmFpN0pQTTJYODVUQyt5cGlONHVD?=
 =?utf-8?B?UG5JbXNSL1ptWnRKaEgvZWJ2bDZrMUc0WTJnR1FlMXQxSHdkbGRlalpPeHk0?=
 =?utf-8?B?cGFpV0d2WDNwWHdZY2ZabUFndlAwczFUazZxUWttRmNOTFZObFZMWjV1aG85?=
 =?utf-8?B?TGJycjNLaFEzZ2E2d2dJK2N5ZFc4blNMSmFTNFBwcXBTa2RSZ09wZGZvWEdq?=
 =?utf-8?B?WXo3bUEwdG5JMnEyUTJwN3BWT29wWEMyRmNINi9VckhYeEJDUFVRQTlETVBU?=
 =?utf-8?B?c0dyM1lEWkVrTzRUSmFhaXhjNUlxRXdWWWxjZEpkYXd3YmU0eHpsVXoyM3Vj?=
 =?utf-8?B?NWN2OUlHM2Z0YUZZYi9HQW5QS1QxTXp0cDBEM25xb2h0dUNZQUt2STN6Q3k2?=
 =?utf-8?B?TS9ETzdPdEhYcCs4bi9DT1dYbXErTlczQ1loVzZrZ05qY2lnalR2VUpRbXVX?=
 =?utf-8?B?LzZGa1BNUWExS3VweElkVUdLR01mRTd2N2lTOEdnWFdQRSt1RnQ2NDZ4S0FN?=
 =?utf-8?B?SmhJRTlGUXY2QnBjdFhXeEt0TTdXa1FHT21rNUIwVlhGUEtuRFBPZXFUZFlu?=
 =?utf-8?B?VTJ6Umc1T2NXd251ZVFHTFhBMFRNZzdGSElRb0Vla3lERC85aDJsSVVrTUtx?=
 =?utf-8?B?SWxXazAremdEc3Awa29vUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZheHYxYXAveWs5eWR0aWpGNWJySEhUd0VuN0x6aFE0YjBMVC92elNacTVF?=
 =?utf-8?B?elI1S2JVYnBqZXJBRVpRN2hpOGZwelpNNDdTb1BvWUJMUUVuRzhMVFF2eTVn?=
 =?utf-8?B?blNzOUY1aDBraUoyYnkwUXkrVWZWL3dqVFZ4a25OWDdCSG55VHB6NTlWZ0hI?=
 =?utf-8?B?Z3p6blMzZ3UyWXNlWkxXZWEvUzBhQk40NkZxYzJYZzBFY0MrY2tZcm15eGhn?=
 =?utf-8?B?dmJBaWVkTXEvYUU2TTNEbWpGbGpEeFRTZFhwZVE1cTRPL0hYbGlidWluS2ZX?=
 =?utf-8?B?cDRUaDZWc05rYVhyeFFSVlBpNXV3OG5TTFhwaFNqa3I3SWZLSE9od2xxTEwr?=
 =?utf-8?B?cGs5QWZQamRadHdubzlFQU9KSW5mYzFnTzFIdGZ5Z0Vrb2p6c0U1ZG5FSnoz?=
 =?utf-8?B?N2l0WUoyQTExcjB1cWVzWjVkMFdrdndvdW8yMDBhUFU3Yyt5elo4RFRvck5Z?=
 =?utf-8?B?TE14RWs5RStjd0NOcTN6MFlEMzNxei81dEhhOVlZdVc3WnJXUnVJY2o1eXB1?=
 =?utf-8?B?ditsSlV6N0R2bWJDcm1WU2hZdlhGUWcyYTJWN3oxL2UzT29FL2RJd3RCMFZZ?=
 =?utf-8?B?TkY0N25EczlmLzk0MXhMeDVBbUxXdDZLZUgxSGJtdVlqVHhSZEdCbFlNcnhZ?=
 =?utf-8?B?NndsQ2JQTnc5OGgzek1QaFQzT3ordXhRVWpnd3hoWUJ3NG9pSkdjVW1xU0VV?=
 =?utf-8?B?bFcvZUc4TjQ2aTZscG5QTlEyNHY3SnFUZDNQNFRSRCthTC9nVHVoeldoZ2hX?=
 =?utf-8?B?cCtrbmtkWm8zVEZpd1RneDdxZzJCMGtVRnlrSWY3RXY5UFZnQzRvNng0MWRR?=
 =?utf-8?B?VGhiQWhyMjNSdVhnb0hIbm94QjZ5RTEzb21QNy85N1oyNG51KyttS21GTkZx?=
 =?utf-8?B?UzZ5dFp2UGJrbDRsdXdMNE9xcEgyVWluYytIanUzOFNtZUFZVVZqTnlIaEtZ?=
 =?utf-8?B?bUw0c2sxN1NtaGZxVGZQM1lOVzlRSmhGMnRycVRZdnFtUHZqSG9uYWpPek4w?=
 =?utf-8?B?QTZ4MGRycStCdDhIRDJZUDIwc2w1N2ZrRmZQQmxhd3JIRjVrOGxUN2twc3FT?=
 =?utf-8?B?cjVpMWFkYktoSGY0NEI2Z1BzY21CNVcwdEJ5RVJaN0FFa3gwc29iYm82RXRW?=
 =?utf-8?B?YU5xYkx2Q0NIWGNVNFJ6Sk9aUlJ3d1VhLzUxenBUbVkydzltSFBhdWlCbU5B?=
 =?utf-8?B?RGdKMXozUTAwWlJnQytvMzV0WHhwRmpwSHhMNUFoVGJUS2tJYUN3RGFPNGZw?=
 =?utf-8?B?TDNSTC9HTVJ5d0t2c1RLSzJCMEZVbVNTK1E1Yi9DNnc2QXhKL3VQK3VWUW12?=
 =?utf-8?B?RG56NWJwSmIyNmRhRXFyYWJ0N3FZak9GR3JRSjJSVGI4YTQ2Y25oaXFwRkRE?=
 =?utf-8?B?VzJqSUQ2QXp4N2RWbzFtK0ZRNTZRalVNenVuVFRnZ2kxMUVyNndnS29ieTAx?=
 =?utf-8?B?UlIyWFppV1R6TG1BdDlVVWxsNlQxQmF4RGRHUFVjMlYwRzJRTjkyQXhZVFBm?=
 =?utf-8?B?RWY5RncwTFk4aEpXejFZY3M5TER6ZW04Y3ljTXNZSW80cXNIY2k1VFZRMnd2?=
 =?utf-8?B?NndIYTRsaytuWitlcE9BRFAvZzBoYjFaVjh4QktUekljMlpqWkRWb3NJREVj?=
 =?utf-8?B?VUQzS3BkSXFWUDg1bDRWZmljWUlCUzV4ejlBZ1Q4cDJncUdLS3NNY1gwd1J2?=
 =?utf-8?B?KytEdVJtU0NlTm1rWTVjK2UxOVBYdHJWaDhPUTlZckNKMm5HZjFldUxURS84?=
 =?utf-8?B?S1NNbERIVEJ3blRzZHRHQnpZU294SXkvNmNQYmN4NXh6bEVwV0xPZGRLWkJM?=
 =?utf-8?B?MWViZ3hxMHIyUDJJYzdjbzVqK3ZLdnUyYmxEQ0xOcjVnRDR5ZThmYlcyMEVJ?=
 =?utf-8?B?YW9HRWFWNkxtMitlbG5vZ1FQL1pTMEwwQmQ1YkFoaUxVUUduUUdLcUZNUW5K?=
 =?utf-8?B?M20rYUVTVHFDc3QyTkdhV1FNTE9MajgxMXZpaWhJSHpJTnB4allOMmYxSHF4?=
 =?utf-8?B?cXdFaHExR2hrb0RZNTdpdUcvdDZtcldRMjl3a0JUUm83MC9ndmordklnNVFo?=
 =?utf-8?B?Rzc2ejZjd3RtbytNdnJBZVdQZ3hXdml0d1Y2ajlXN0JzVm1MWmtUaURTUjcw?=
 =?utf-8?B?M3R0bDJ1OFFPR0k5MTRSOTB3YUJQbnRKTktrNzRDWDlwYXIvemVwdnVCS1c1?=
 =?utf-8?Q?/ja8+iSDmgGReNxTsebkOZs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A2g7iad+ZclxMu1dPPzIFal5D6VD2jy3owl/hlp7rof/tjCDZmTmWd3LYat4bVPzViaX/xwiYQeExzjDB2d6X26sAkiYYghY+luq/IQsQy+KUs0+bQemIayc58e7Gp3rSeoz2o25AFFmcHtqggJKjci3AEm6U/aMi1QyQnBRq/nGxYun3USczIqG6H4GYLuE9p8SaAu+5GCozT5vROR73d0ODAffFbP52SeEfvIPSuxiCFaFl5Ga8i2n35gcIyHK25zh8/5+7ydJYFd6mhPgh79aCOW7a3V2l8qMee4+9rHebbzAaRblcp4sVzQyzMjI6mt+PKbUweXqU4pVyyk++tGN9V5UzP/K71iZFvppSKamFGkFDZIGGZuev1aSMFz8tb9Hmz/aWovFOi9rGk/mR0kssnZAnY3A+6ezPRgd96mysAs3N+8+K8L9r7kWYIMuTQP8aMADo9pJ0cjskhJgGxDcXZzdTuIRZfehDbBUvwX8yhsVwOzk3nJS9R90YinN8mBaV/7534ZXA5chGhdC+pF+1lkgYdV3eiRcP+3ZmlNWtlcHvnx5kF84xjp9l/JFVhzaAmVjtBf1RA+cTqqZcSPebbPbUxVmYIEL8hvxrjc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c433ed-3fb2-416c-deda-08dccdba1140
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 14:50:21.9467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: py3KF5RzvR24n7u7heWP9k1o4JApRLLtx4qfcJ5PtnUMFiYtAOVf8tYxl3bfB5J4vELZVrBvWSj2WrvGBSFxYLbqayuSkysvh8W1rqGF8zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4392
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2409050110
X-Proofpoint-GUID: MRd3IP51RWVxNQyusGTc9dtHdHUCDyT5
X-Proofpoint-ORIG-GUID: MRd3IP51RWVxNQyusGTc9dtHdHUCDyT5


On 05/09/2024 16:08, Jani Nikula wrote:
> On Thu, 05 Sep 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>> On 05/09/2024 14:20, Jani Nikula wrote:
>>> On Thu, 05 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>> On Thu, 05 Sep 2024, bernhard+linux-doc@lsmod.de wrote:
>>>>> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>>>>>
>>>>> Because we want reproducible builds
>>>>> and https://github.com/sphinx-doc/sphinx/issues/6714
>>>>> did not receive any love from Sphinx devs in five years,
>>>>> let's disable parallel doc builds until that Sphinx issue is fixed.
>>>>
>>>> You mention in [1] that this is likely a duplicate of [2] i.e. multiple
>>>> Sphinx instances running in parallel and racing in doctree access.
>>>>
>>>> In kernel, does the issue then boil down to:
>>>>
>>>> htmldocs:
>>>> 	@$(srctree)/scripts/sphinx-pre-install --version-check
>>>> 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>>>>
>>>> i.e. multiple Sphinx invocations instead of just one?
>>>>
>>>> Broken record, I still think we should axe the Makefile hacks out of the
>>>> Sphinx build altogether, and let Sphinx handle everything, via
>>>> extensions if necessary.
>>>
>>> Indeed. On my machine, 'make htmldocs' spawns eight sphinx-build
>>> processes, each running with -j8, and each racing for the same
>>> doctrees. And the whole thing is apparently parallelized to 64 threads,
>>> which is unlikely to be the most efficient.
>>>
>>> There's no reason to blame Sphinx upstream before we get our end
>>> together, and run Sphinx as it was designed.
>>
>> I don't reproduce this here, either with plain 'make htmldocs' or 'make
>> -j8 htmldocs' -- in either case the process tree is:
>>
>> make ... htmldocs
>> - make ... htmldocs
>>     - make -f ./scripts/Makefile.build obj=Documentation htmldocs
>>       - /bin/sh -c make ...
>>         - python3 ./scripts/jobserver-exec sh
>> ./Documentation/sphinx/parallel-wrapper.sh sphinx-build -b html ...
>>           - /usr/bin/python3 /usr/bin/sphinx-build -j... -b html ...
>>
>> Neither the $(foreach) in the Makefile nor $(call loop_cmd) should
>> result in parallel invocations.
>>
>> Could you double check the process tree once the "Using alabaster theme"
>> message has appeared?
> 
> $ pstree -A 3457144
> bash---make---make---make---make---sh---python3---sphinx-build-+-7*[sphinx-build]
>                                                                 `-sphinx-build---perl
> 
> Maybe try after 'make cleandocs'.

Right, I get this with make -j8 after 'make cleandocs':

make---make---make---sh---python3---sphinx-build-+-sphinx-build---perl
                                                  `-7*[sphinx-build]

Isn't this exactly what we want? There is only a single top-level
sphinx-build process invoked by 'make', and that is running 8 processes
in parallel, not 64 threads.

I think -j8 appear in these child processes simply because it inherited
the command line arguments (so fork() without exec(), essentially).


Vegard
