Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3119B158DA9
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725613890; cv=fail; b=hGxmQQasV08SOY72BvEE9gZkUoYOJl2KjHT6SZtuX9o793iTP3s4iY0n1HzWArs5eKDGSp/ZYtwrP8JEz0norEEYje+/KixhkPC4GBesz/8xROWHqew+wblFHRmQMM7d5bmAolzI+hgO97zmTBYEZvTa7/bWsJ6+JADJR5b4bJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725613890; c=relaxed/simple;
	bh=c8ZSce752gk8VTZJDCZmYV0tRPwn1sgHkfFO0TM+kao=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m4u+XycV9Q68B2NDdoS0iLX8tNoS+lXUvevY1QYMBdIOQR7vWG3sDKNYyPDKv5xrodglwZAH1/Aq8uL/B/zqAubEqx87txJSsyt9H5u15vNJ59NhYXXANytf3FUds5DpK9FhVnNU+pTVizMo6cER4Qv2oLnVtCwJXyKIbe/hczE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G1J8dSya; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iGnAJDpf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G1J8dSya";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iGnAJDpf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4863gPHZ000880;
	Fri, 6 Sep 2024 09:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=FyZgoWf7p0EntEqM/+dUVXK44fSoLO8zCV4KXs6Mims=; b=
	G1J8dSya/tv7r3VDbHgi9V+anujAjuh0eTF8RaLX88dD8+f1ivyTrQJA3CxDO/JE
	dwslDby1R3/CRnScX9p5ZhKJo96jDbsv912+ljfUEalCFkJT22B6UnAp1d3m92ut
	80e7QTi8UObWGBKQBlSJ1MkwYwSFbz2DDc5ZH/8OpR2QYGEn4+Seef4wk73ZsHjW
	NjzpkCveoeVHPzmn+nGpFyA/5IFyE8ms2d4Jh99b5Y9nKdl8PEi+uRpJWnGd3xE/
	Y2cK/sPaQeDExfzlqUtNwvQ9a9ZtUeXid5NB0ZJfyiX4JrVu5B4TocFdjSbCsorD
	SO6BClPWyuKn5dB9y0WXzQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwk95tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 09:11:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4867oRQK036902;
	Fri, 6 Sep 2024 09:11:19 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyfqe48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 09:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jt/Dt0uPmcx6/b5mU47GZUXbZnBys0C8SQHJchBG0y3zEvwJkUN2FQrLwZgZAChvqwe1B6a+PBtdlPjPShip6riG5OBY5JickMEhJAP4GSNw5P1Db+ZOwic1BZr4Rm9ldVS+bViXeKAhnMlKNuxRQrWAa7TbPRfkzy8rV8zKZbmQgbOp1vIDrxoBqLRoy2kLCC2i65/DLkTUfJqBKa2x3TOa6bHE2Ad8k5LU5uaVFaw+eRf3quQ2C6dF+gP1TaOkFJCvhOVak8FfwxDrjTVCJpYFBJ+iyQaDvbzqrMj5kUOpa3n9Y1jFPxXwjEbIjNUSOmAe8EYxDMPDf4mjELnAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyZgoWf7p0EntEqM/+dUVXK44fSoLO8zCV4KXs6Mims=;
 b=fmGOI5XVjVP26uDPtj5d9fv9d4/avB5SIZeH4usvI52q2ZBR5NSFiVi2abLQHrbxyT0tZo75JwCCP8rulIo4VAQMBFGysuHZUK29gA0E7uYFIHd40fMkSnMFgAtJMjyHnKx2QSaKk1e3+lKHpDXQlI99+Lpww99xW4q2jA6KIo4dqZkF0wXvG3RTzalSZNSrkBmmfMcyVFhl+/XY26XeTUXqRxxK0d0DbAd1i1PWclA4OQwMYXRHYMF2+s9Jl10s6TgMXDyHiBLgJkdp2gk/5R7S22hAtAOoz2o42iAR6z8hG0Q7bN4ZlUxx+nq4Pkzu0X1nOYfSQ+BKQG5yngXZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyZgoWf7p0EntEqM/+dUVXK44fSoLO8zCV4KXs6Mims=;
 b=iGnAJDpfNb/c7nffQQNbT/XqYyADNwkjcfznRVVb2ZT1e2YOfaGo4N+8J4K9OIUP9iDizAG+xvMkbwQdF43P52jXq3CJizk3KiwukqyfsRboKSiFEnDbpKYJZVHHvukf3zkRjQQg5eN/0wVOKcRyV3drkBOTJfMzhnCajOH7goI=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS0PR10MB6822.namprd10.prod.outlook.com (2603:10b6:8:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 09:11:13 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 09:11:12 +0000
Message-ID: <be85300d-74f4-4e9d-998d-26d09fe96563@oracle.com>
Date: Fri, 6 Sep 2024 11:11:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Build kernel docs deterministically
To: bernhard+linux-doc@lsmod.de, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::12) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DS0PR10MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 01491971-331d-45f5-2d25-08dcce53dab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDQ4MXZaQ09OR3JqSFdiSjdKR0pic2FXNCtFb1BCM0dhTWRHRzFOaCs4WkJ4?=
 =?utf-8?B?aHpYaytiYnFENXFFYW1MdmFhc1hmaExDTUdwR1JUR3RGUDc4WkR2ZUgxVmJK?=
 =?utf-8?B?OW82cDdKS1BMNFhRNmlzckJQV2lDRVMrK1IwTzAyaUZDblI2bnZuSFljZFRQ?=
 =?utf-8?B?U1REd2FqeFI2VlM4OU5QakNudkhWTFM1MEYrNWJ3ekRZYTlvbUJGWlF2eWph?=
 =?utf-8?B?cWp6emQvN3BSSGNveUgreDUrRkgvUERybUNCbkxBbm16cThZOHlROVZVQzdu?=
 =?utf-8?B?emJYdWtQZ3ozUGYrZVgvTVJYamQ2RURhem9QWnJscE9iTllMNkQxZE9GZ2FZ?=
 =?utf-8?B?K0FJaElPbE9vckhxTDZGbWxtcjJzTUJBcW5aYWpSbGZveXlFRGI4Njd1a0Yr?=
 =?utf-8?B?Q1RxWmZVZ0N4NXF3aDYvQko0RU8vYTROMVphMzBuQkU0SXVLRlA1K2g0eC9J?=
 =?utf-8?B?ZHBvZWNDUThhUnRHMHNKb0ZYMXVnYmFCcFNoSUFXbUFuQXBJbitFR2Z6ZGI0?=
 =?utf-8?B?Y3psY3NUN1BSV3FSbWplSnF5dlk5bHRNN0tTVXdiVm1HQ3YrL3lzclpGS0J5?=
 =?utf-8?B?L1ZEREVNbHdWYVlNYjJKcCt3RGVNSU1pY3d5UXBWaXRkNmlqWTdqZzFxL0hZ?=
 =?utf-8?B?WDA2YXRKNC95SDdmTFMzbnY3RW9aS3RpbFI0RVJwbFVYbWpkZnRaVVZRQmYx?=
 =?utf-8?B?WGZqekhsQitQbmJyY080YlhMaDA5YmJ1M3NvRU5meDA0Slp3cVVBVWdNRXF6?=
 =?utf-8?B?TkdRdjZHUVRjenZnYndzVCtYS1V1SXpDNVNxRGtNTmRjeFgyU3RoTjlhNFZW?=
 =?utf-8?B?ZVM5bTJiWGNwOG8xZlJSTWJaUHhaQ2wyQWdFN0k5cEZFYzlzai80ZXNrU000?=
 =?utf-8?B?bmNVajNnSGhHaXp6L1h2b0sybE5wb2FRemxwVmNDWnFEVGlvZFhBaFhaaGNP?=
 =?utf-8?B?aXVwaXRRcXgvQWlyV0NnaFM1a1QzNjVMSjYySzFBQkhveTUxTk1TN29kSGdG?=
 =?utf-8?B?cmVYejhtcUM1Si9xUGV0WnJhUnB1dnlQNGhRNHZoM2hGN2R1RHJyWG1RNXc4?=
 =?utf-8?B?dlBkNWlPVm9KTnRYSFVaajdmei9hUVNBNWltRm81T0Jhd0hnenZzWXFBVFoz?=
 =?utf-8?B?TG9EWE5hTWFxQXZRNjdSTStQQStuSU1qSDYyRWpUOWpHWHJDNHhEUm1hbzAw?=
 =?utf-8?B?WUFFbURXNVNJSlE0UUVKMVpPdGlOTWh3dzNFVVB2K2hEM2lSNzRlS0ltc1Q0?=
 =?utf-8?B?ZkZ5OW8zSS81aGZ2MEw3Skl3bE1aemE1UVVQMXF1SHV0emlPQndQNjlndmk5?=
 =?utf-8?B?NFUrdkpHTGc0UExoa05tVG9vTVBmeG5uZzJkaWxwR1FEOUk3d0lJOUZycncw?=
 =?utf-8?B?ZHFYbHRkOHFJQWE2OWxKRGN6NWY0SXptSitNWUNJaHhYZElodnV0WUNwY2w1?=
 =?utf-8?B?emx1Z2FaQTY4WnNjeVBGZUptY0hMNjdNUkoxQ2MzNjVMYVpPU0VTTExmdXdk?=
 =?utf-8?B?YmE2Qkl6UnpHbGNTSTZPMkxKU3pUbzN3RUwvN1VrTU5aK3hMM05HN1I4NW82?=
 =?utf-8?B?QVdFNDBPMzhIMHp5UExlQjEyOVd2c3VoRUhzeXlMRCt1WDQ0M01TbDlENHFo?=
 =?utf-8?B?SUZXZEJWcTdjYUZMR25sazg4SFlzOWNPMnpWN0pHcnpQdUwwYWd4WnF1emp4?=
 =?utf-8?B?a1NiZzloTC9nRXNJOTRKbjg4b29SMDJZUjZ3Wm9hR0FDK2lvVGpiemZMQllN?=
 =?utf-8?B?QWVjZzE0c1BlTFFyeUw2NjMyZ1ptZDhXVUV2THl5Z3dJbEhxZXcyNThvRG1p?=
 =?utf-8?Q?noyXBTHy/1qIKyYS/eH28GNUZEXRP0hVFoXO0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2lUR2tNbzJLR3VSZElDQi9nWXFwemxzQnF4VVMzYWs2M2h1c2dyZWRVNFIw?=
 =?utf-8?B?bGRaaXp5MW9yUzZ3OFl6R2t2NTdhTkhRYy93YkxMMHNhb2F2aFpFMXpBaldv?=
 =?utf-8?B?YjNDVG5ZcXYzZ3pKSHAwVy96S3NOWHBVZFdCbmFXTnB5c0FEUEdzSUQzeFFk?=
 =?utf-8?B?elNSS2Q5ZzIwR2pLWFF1Qkd4Ujkxb09vYit6QkZCNEtKcVhZaFRaSTJoWWU1?=
 =?utf-8?B?eFJQbzQzWVJMZ3FNSzVKSmxGVFliZC9EQnRxa1V0SFVnOUdCLzI4cFhBK1lp?=
 =?utf-8?B?N09CamJNd3JYWEdma2hLWHVDTHIzZy9nSG1aa1JwaER6K0ZaRmp6OXFpOTcy?=
 =?utf-8?B?L0hNYlpoYkF2N1J3QThHWlA1UWNOaWVPckFSQStEaU1hNlFSVHc5ckxjVjAr?=
 =?utf-8?B?NHFRUVp3V29Bd0hIdFRTY0xCL0hSSkVXVFN1SmxwOXBIRkcwNHBVWHZ5aFI1?=
 =?utf-8?B?bWhxK0hJTFhEZzRzT1pQYTZFTVFzeW5qRUhiQkI0VkRKelZvY0pyZDZNQ3A3?=
 =?utf-8?B?S3l5ZDZuZnVCWkNqbkhxc2ZtbGFFRjJNLzhMcGFkOTdFR3JhZUdVUUxDNGhj?=
 =?utf-8?B?cUZPS09RUWQ5dWlSdHRSMURMY2NPUXVTVUxOUk1qUWhzRHNUcDZDL3EyQ21I?=
 =?utf-8?B?RC9HTGJMMWc3Q0piNkc0dUcvTkdKMG1PbDM3bk5yV2U4YzRER0xZOU1DdEpU?=
 =?utf-8?B?ZFZLY3EydXY5VFRFbGlPRHJvUFlMSlNzRWhZQ0N0N2RHbmRvNXdjWG1IV1FD?=
 =?utf-8?B?eXpLaWZnTTI3Zkg1Yi9QS3RFdTZUd284RmNPOHFERjQrK2cxZ3FvSGdhVjNo?=
 =?utf-8?B?SmJqQSsvdHJuMEdWS0JzVFhSMklSUnR3VGQ2OHNpbWpyVCsxT2NBMDYxUzlm?=
 =?utf-8?B?YW5BQWdiUjlkbFhSRXo2cDVhWkpWQmlJQVQ1V2YwUG9sOCtZY051dEpQR2Iy?=
 =?utf-8?B?dWhBUWMxc2g2NUI1VFpWODd5K2hlbWtlenQycnppYXUxbmRVMlRsM1BkMDFW?=
 =?utf-8?B?Ui9CUkxyN2h0V050SjBucWxJbms4cjFMbVVUK1dqenZ3OTVzbDZ2a3VoQVhX?=
 =?utf-8?B?TGdwTXcxSmtMOThNejl0aWlmd2RGeTcrSkZyTVRyU2pEWVE0S1U4VEtoRE1N?=
 =?utf-8?B?aTRoeTRCZlBuYlFYeDJ2MVVGOUJlcllSQ2RCWmIvUTRXVk91OVpvTlA3RURD?=
 =?utf-8?B?bFlUc3BMUTM2cDNFNVZ2WGkveENGUG9NQy9rMWZ0b1dJVnJSUktibkQzRzNS?=
 =?utf-8?B?VVk3MzJGUzNBbXVNMVQwTnNtZzhkOFYwMUp3WHdDbjFFZmQ0SGg0ZnR6S2xj?=
 =?utf-8?B?LzFDd3VvRlhpRThhbkhQbzBpYWh1d3JEQmE5R2JOS3pRcHZ4TkFDUytwREtt?=
 =?utf-8?B?M29GdTVMdUNubU45ei80dUIxVjlTNVBVdFdjditUOVNITk1ud2lTUldzYzlr?=
 =?utf-8?B?RGhWU3J3WFVPK2lkZElCMmdROTFBWUErUWYvbHdTSDMwZTQ0NWprc05xK1Y0?=
 =?utf-8?B?VG96U0Juek16WU93Z0ZZOEZENFFiN3BwVGJkUG9EUjZZUzRNZzRFb0lja3JK?=
 =?utf-8?B?bUlXMXdDMXkyMVZ2bzlQQWdvYWxsSzRtbVk2bEV4bkdoeEk5UUNaT1REYURO?=
 =?utf-8?B?b0xPaytVbHJGT3k3WlVPRnFwOWFTMTVKTDlLSXA5VGJCTTJQNHY3eFlBZ3dZ?=
 =?utf-8?B?Qk1FZ1ozSm0zcXMvVHdsT0d4eHB5WWhBZjIxY1F5azRaeUR4TTFZNkFDL2lN?=
 =?utf-8?B?S2NubFcxRXozY3pKVVdTRWlBUFFGc2tYbXphdS9RU2k4WnFEdnM1RHZzT1c2?=
 =?utf-8?B?cmxnVm9XSFlQc0wwb2NWdDBiSktsT29BcVc1SFU5R0grNk8yMGUvRTJCSnRi?=
 =?utf-8?B?L0wyME45UkY1c0I1NHpjWGZQL25MVEVjemZqdDhyZ2xrc0dObC9LWUs3S3Aw?=
 =?utf-8?B?em5Pc3VQckx4VnhTS3ZKTG5rbEcwa2R0Y2JneHMya3ZVWGFIaFJhWHlmZ1lJ?=
 =?utf-8?B?cWlZQ3VVYU9sOU5rQXhPVWxjWnpGYndlUTc4bDd4REpjMll5bkZveUF1Nk5j?=
 =?utf-8?B?OGJOVHMrd2JoVXZwTldSa0xMbnAwdXBvSHZpai96RG5pN0dKOFQ2ZEtjdUxE?=
 =?utf-8?B?TTNrTFJabnI1ZGl6ckJVYjQ4dWlLRFdsMlZhcElkRGJiclpzN293YmJQKzRm?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x7mHWn2a7l4l58Hpz6tETLZNUR2mS6U0wgi0RH3NbGPh9jg1pYykEjYmM8D7Q0iKOeG1L6buzgL2ojWjAE8AuRABrY9VyGYBlpbInYgsvQyfCpRZSYqxEAw3oKQeC5RcMo2erMxQzFKMTrVMyNyqyvcFDgfg/Z0VVzYbe+Hb7Cgyhvjh+L3nx9Dik763TYAn0BhtkqGYAg3n+sRcmvmjh66i1OqZR2Ym0pL3TncXyLaUgt/qoBNKPEWVKsSrLxR5zfP0JJJzttmj8qoKyvRNE9QRKF1x+h0W+nykis6mO0M6hguazYWJoWP9zrS2obXjH8n+Wstj4De+4SKXRFBgYHssXAhV7rHh8lyl063DCzHhBn7hjcB2HY3EtnegekAP4VBk3pKnrKKX65FoEZzVCJum8jLPNnpQvq9mxZexzg5rXsUld2wY0GWUCLfjIIXAXN664edm6XibhDXAC8eqGemWN+FGIgSARAXiGP+NxiR5Ph1Nay70E+qZaea8m6CeozVuGHu8PX5j36lMi8zH8mIOVpDgilmWeefewStZT+wCSz27VlLIevf04kKtkNOsxvBqUqnnnbvhOLiPsYjZMchKRiy9F5Wd1mA+gwDeT/8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01491971-331d-45f5-2d25-08dcce53dab7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:11:12.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKKMDVYTpGBGQzHCG++swgyy3hM2cFzFsdaDomQgpeS3m34n5JVUs1LH2P6oPOWR6mBB/q6YCU2t9yGAKfBujW+LOvlosrrVXyCTPhjft7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6822
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409060065
X-Proofpoint-GUID: 5KBohA8II12VJtFyjI0vDmR7nRii3r2S
X-Proofpoint-ORIG-GUID: 5KBohA8II12VJtFyjI0vDmR7nRii3r2S

On 05/09/2024 13:35, bernhard+linux-doc@lsmod.de wrote:
> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
> 
> Because we want reproducible builds
> and https://github.com/sphinx-doc/sphinx/issues/6714
> did not receive any love from Sphinx devs in five years,
> let's disable parallel doc builds until that Sphinx issue is fixed.
> 
> This patch was done while working on reproducible builds for openSUSE,
> sponsored by the NLnet NGI0 fund.
> 
> Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
> ---
>   Documentation/sphinx/parallel-wrapper.sh | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/sphinx/parallel-wrapper.sh b/Documentation/sphinx/parallel-wrapper.sh
> index e54c44ce117d..cb93626bd86e 100644
> --- a/Documentation/sphinx/parallel-wrapper.sh
> +++ b/Documentation/sphinx/parallel-wrapper.sh
> @@ -10,6 +10,9 @@ sphinx="$1"
>   shift || true
>   
>   parallel="$PARALLELISM"
> +# Because of issues in Sphinx(https://github.com/sphinx-doc/sphinx/issues/6714)
> +# we disable parallel doc generation to get deterministic build results
> +parallel=1
>   if [ -z "$parallel" ] ; then
>   	# If no parallelism is specified at the top-level make, then
>   	# fall back to the expected "-jauto" mode that the "htmldocs"

If you need reproducibility and the solution/workaround is to limit it
to 1 concurrent sphinx-build invocation, why can't you just run
'make -j1 htmldocs ...' explicitly? (or whichever doc targets you need.)
This should also have the benefit of working regardless of the exact
kernel version.


Vegard
