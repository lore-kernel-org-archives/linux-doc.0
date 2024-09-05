Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA6519D068
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543010; cv=fail; b=WkRdONQPf+z71rex4Iq1+TX9FMfut6VS470gyNCMA+OOjc79lApyrXlGL1SfuOS0y4aDPAxOYmVAl4VxIQ8sYUCzAVQ7oxEG3oMGd4gg1CO0tcLP8+UfnnHAy3wMR+lVWkn9LgLjZ+L7Ljw5fsdu08sBNdMhgU7Euex4mD48BLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543010; c=relaxed/simple;
	bh=ajQKm/cV3vqlDhObb28mg7a7T2X9fTndGP1ZJ563WT4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PsHCmFaKadInYnbrJTVOcpw3mLmjrkos++3c8IFUEv8ZUis95MaHW49b7UXFPzd2yxCaa1O2nIpBOAWgNa5vhfhR9vG2EuxJoKOlsMi1UA+Zc/Fb3KDE4ZhOf/hovZGGLgqH1Ao6Hm9gSxHmExw/1Du/dhckhd1seDp8+A1HmRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DskZw9dM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W3W29YeN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DskZw9dM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W3W29YeN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485CMUfC013659;
	Thu, 5 Sep 2024 13:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=DD8WUDkoxYg0khXK/9vOy48CBnWH+wYf9UoVytCn8YM=; b=
	DskZw9dMGP3jmB6ZwVQvjIjRfFH9tv5JXtXR6EnSXeFJGZmenTH209ZlThi5n7Rr
	BdGj8eV5lkdQkgDlwxXRmkNyWGJGLJAlTkYbF7l6EcYbFNBSJmNa5w1fHrE7nGh2
	B63yaBk57l8ZirZZoDuLa/q3OkAZr+XQQ+fbZNAdqp6SIfD0xGX9/ORtcp+8qdqn
	Voe0+45oXeAKFqL5YGld5zqnoqqd5kE1sj4sqrGWESnLDZN4vfsdQXodYvML9HP6
	tQ+qFxEwlUkQiV6nHxlKZ0uBiFqllMk2Hahn3HI/0A14YP4uTMGHAWjCz7R1jh7p
	Y6WasctTemYIZcMF2jbVGA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dwndntnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Sep 2024 13:29:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 485CVuvC027268;
	Thu, 5 Sep 2024 13:29:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41etc40s31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Sep 2024 13:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwiCNzy/9MC8ZJdWJc4w1+o+Y9mK3Ch58I4qw8r29CCIJU6xLVMy6/d9LXf0jNZUWCjr6y2IpeZ8CqgY8MnyNYAMzqmrRWhM2Tbd1OHDcF+aLIFGlVUQrYeTJfbbfltxE4oKLpQrARIP9Z9s/jMFzXFAHi2qk7i/w2yATye8nANomgSAT6cCzDlnbHqptHW8u2L1nxrKzJZuq/OW52UWlUq6bxMsJmSDqe3zGgrROcZE3DMWVRGmmKLVi3f372Xcb+WOjjzgGUwFATUIK7QUAhzT46dql3iJ6MNt9fgLwPn5YE/WaWD/k7LGKInsB/JFWaSI1aDQQ4Hz+68cMGUYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD8WUDkoxYg0khXK/9vOy48CBnWH+wYf9UoVytCn8YM=;
 b=fsOa6v5Wicnvky+crncTFrh4ta6sfc1oZwghO+DP0ilkWMsJicHWwSxGaOiu6utwdnhwf+TUBNRQ/Qy0IWHM6Zt12ByDhEZPdd39YXUoe73L7Wu3k6DRAFxM28lW9O7M4DNhkmsUFg1OIQHjurbFR/GVf6ukGU6z8ofBa1yLx5sFHjpIDZ4rkd3vaM6zTRE/yyZmcJoxdqY5MUYxq0CxA6dFMkE8vdQurThzMRWqaCd3BC96kBSIYvfYHykdzpyNEDEEtRoH9J/J+wPYP7/c+MPky9RCs79PGGub6T0afmVLzyv4Su4755ssmSy9mqV/IOod2dENGnj0gzfY15eqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DD8WUDkoxYg0khXK/9vOy48CBnWH+wYf9UoVytCn8YM=;
 b=W3W29YeN5wb5mvt0OcvwD789/etzDuiHYJsgczQMV09uCfh+UEeYpXJEncqnqlbRvBnnqb9FupXxws+b3wc7ur0Pu5Bg3+vyh17LxzETXbPvFUJh8g2WkyCOMonsQnFMYlWmjhb91nAeFkjwhXWDIFv3axqYNsUqnYwSFWK515g=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Thu, 5 Sep
 2024 13:29:51 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.7939.010; Thu, 5 Sep 2024
 13:29:51 +0000
Message-ID: <a2bda8df-b484-49e6-9e01-92e6cdf4db44@oracle.com>
Date: Thu, 5 Sep 2024 15:29:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Build kernel docs deterministically
To: Jani Nikula <jani.nikula@linux.intel.com>, bernhard+linux-doc@lsmod.de,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <874j6uqokj.fsf@intel.com>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <874j6uqokj.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::17) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|PH7PR10MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: c08c8449-22b2-4a9f-2fe7-08dccdaed194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2kzQ2d2ZDlvcmNwVk84aTdNZE5vY1pHbldFWWE3WGhEUEVqYmxsZy93KzZt?=
 =?utf-8?B?SE9VYXU4amxCR3NSTUJ3WWhWN1lRc25sOXJZMmlUWTBuNmhFZzhXeGI3Y05r?=
 =?utf-8?B?M1ZSYnJYbWZLUXd4d2tyL0FVTksxUXFmdVpWWW5HMjlSMEJoYnA4VGZoMjZ3?=
 =?utf-8?B?K2dmTzJWMG13ckk2L3h0ZlgyYzRjaExlbUNSY0tDU2NLcHoxV01ld1VzMkkx?=
 =?utf-8?B?ZlBLbFI2NnAyZndvdG1qZ3NYSDA1RUVabFBVbkdUV081WnN2S1hxV1lrTitL?=
 =?utf-8?B?bk1McmdWQU82b0Jpci9EbjlOQk1KLzdUK3g4SHgyaDV6RkhwQjlIbUVKOUxW?=
 =?utf-8?B?Z0g3MVIxOUl0L1hiUE5lZ0srd3M1ZVpPaXhtbDFoZnIzQkM4N0xBc0RmZUl0?=
 =?utf-8?B?TFFEelhpdjFxeGhxYU5Kb01TR1NYUmpzQUlWVmZabm01S29URGhncHVIOW5X?=
 =?utf-8?B?ekVEUHpVQXUzUVRzVnFlVkIrYTE4NzhuUEprV3BLSmlRR2ljOXZvWGdvNHYz?=
 =?utf-8?B?emxlQjFuTTk2OUVDNVFxTktkQlZPemFSZjJyUlNRalB6RVZsTTNpNEhtUkF4?=
 =?utf-8?B?NlExckZ3dkV1MndNaUswd1hZemZiNkV1UFh2Z0RqcVo5NW8yRWEyaWVSK3Nm?=
 =?utf-8?B?QmdoT0REbmlxTnJHQXdzRzZZU3ZTV3M4LzRoNERYbDRiY21YM2VDTlk3amtj?=
 =?utf-8?B?Ny9xZlVTcFdFaExxYy81YjcycTBleFhpQ01BbGY5MW12SDdTR2NMcEl4a0U0?=
 =?utf-8?B?azBvMUZ1aXJVMkFaMUI0Qzh5aWQwT1d2NG41Qk1xbCtFRGtJRTZScG8yWWpH?=
 =?utf-8?B?VHdJWUQyVnhsRTRubllDdEg5U3h1aEZ3ZDhld3ZRcUJ2NVFZazhYWFpZQ3pk?=
 =?utf-8?B?SGRBeEhma3pXK3ZleVJJT3hXWVF1SVJKcGIyOXNPdXZPenFmVkh6L092U0J1?=
 =?utf-8?B?bUdEWW4wN0F4WjhCdTdWWGtBWFJLejNuN1dmeXRlVTE5cnRTWG50SFhtRHUx?=
 =?utf-8?B?Yng2UUxUc2NSYnd1UEtCYTFzUjdJUnAwdmszK1VTS3pvSlgxdCt1MUFETFNq?=
 =?utf-8?B?RTlUSFU5eFYzaG1OdGFDaDNTYTVpODR5SzVYN1hIYUl5N0VQZlQ5UFRYcmFF?=
 =?utf-8?B?bXpMQUlYR1FPVWFKQWhmVFlxcDluNFN0eXE1VnhxLzEyWEdCNjBibDdvSW1M?=
 =?utf-8?B?K21xYS9vNXJzSU9KWGpyczIwVXp6cDByd2Q0KytxTWczSjdoZ2NPZ0ViRzQ3?=
 =?utf-8?B?ZEtwS3greWlyTEkzYUFIRGJEMEh3SkpFcEZSUEdzSkNleFRvaG1DeW16U2xK?=
 =?utf-8?B?azA2T0RMRE95dFhVRkduT0JJWVh4cGdVNktCcm80b1oxUm15dE5nM2JTUHIx?=
 =?utf-8?B?K1AxVjhFKzl3aXYxM3VpekZreFJwM25rSXdCbXlmcDdaMmxrQjcrUXNzS0Fm?=
 =?utf-8?B?YnBMbHlIQzZjZ2ZzUjQ5UnBpSXhVdkpvSXpCQVl5a0JrcU1zQWZERE0zdXZJ?=
 =?utf-8?B?cmRkSVZIK3I3TldIc1lyMVEvbFo2TjVPQ21MdXhYKzNSNUpTZFNjQkpLRHFN?=
 =?utf-8?B?UDhNbVFQeFNRQkxFTXVxMFVCaExJeXRxYm92MEcwdzBDckpjT3lSNEdFWGF3?=
 =?utf-8?B?eXNpemtOelJLWWVUVFVHdTEyRmIwU083cHBOcHJ6UXF6bG5LaTFkZVk5cWpY?=
 =?utf-8?B?MDlQeXNUbzA5Ni9VRW5oOVg0bWI2ZHlwUDlkQStNMHhkR3U5eFYzZmdkclR0?=
 =?utf-8?B?WUI2bGxvb1pqWkZ6b3hzdWJ2WHdlUW45ajI1K1E0dVpBV21TNFpwYkI2ME9r?=
 =?utf-8?B?VjFmQ2h0SDNIa3FBaGxkUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUI0eTZwelpkY1FtQ1FxOFNCNlV1a1BiYStKZFlpL0pIbjdTSXBQc1h5eU5m?=
 =?utf-8?B?aDE1QzhKcUZ6akdrcGlXVjZXbjZNaVJHSEZJZGVVQkk0SUxzZWJ2Unc5aU5o?=
 =?utf-8?B?VnlyeUZEbmVaT0ZqLzdaZDlLY2hsT05iUXN3U0luU253Z3ZXZkp2R0hjTmJv?=
 =?utf-8?B?bDVObHdLUWtLdXo2MHozWEhCY1JoVU9MNkdTRDVnMkpabjhiRE5ydVZFNDhz?=
 =?utf-8?B?WmtBSXI5UHAzaGJiZzZSWHlod3lPSGdnNVZjWC9jd29LUFZnUjAyNG9YYm5t?=
 =?utf-8?B?ei9PZmlMYXU5N3NBSHdXMC94SGUvcG41MVVRS21VaUtGQ1YxZDF5bDZyTzlu?=
 =?utf-8?B?R2FvTDJCMXBOTG82K1FyN05FNEJtbEVDcE9RWjJycUg2NkhNTHRuNjNwb2dl?=
 =?utf-8?B?ZjdmUFJ2ekNjYXFZN3Q5MG5jL3BsYzNOSXQwZzhTWXhhTHRKRzhBeDFPdWN0?=
 =?utf-8?B?a3BHaDJqVjlvMXpUeTVONnM0UGh1Q3FOQnJSd3JDRktrQ0pMZmdtMVNFMVRq?=
 =?utf-8?B?VzlSOVkyRGpFd3o1cjJxMkttYU5VRGM3cmdMMzhnQ2llN2JGeEczdmF5WWFk?=
 =?utf-8?B?NDZSUzdYdjRwdlUwMHFybzMvYW9OdlhVWEx0dDVCcVhrSDJ2enBubjFuamh0?=
 =?utf-8?B?SzBTbi9GS1d6MUJYdWhOem8zdHVuMERIcFhxNUptL1BzRmxsT2grRlMzVG5N?=
 =?utf-8?B?UXp6UDNFcmI4blhETFRVc0tVUFpQcklQcGNpN09zYy8yRmdmYjFoRk5zUzZC?=
 =?utf-8?B?L0pSdWVCR3k1UHYvS2lvK3dPQ3dZb3IxRFVjOXQ2by9TUCt1V1BjVnozZ0w5?=
 =?utf-8?B?YmhQUTdGUVFFalhqTU9UN01DN1pYdWJKSnZSS21mME5NMTJXSlVzS1d6NlZZ?=
 =?utf-8?B?TEIvaFhNWjhRdmhCVkJtRkF4aHFvLzVyeERvTUIwRlcvOVdpeVpBSzJ3WDJL?=
 =?utf-8?B?VE4zRnI3SFFLbnRTNlVxd2dCT2lsR0F2YWs4NnpSTjAvTldmM1VDQ3pscU0w?=
 =?utf-8?B?UGpRYWtSTUF1QmVJRUtVTVAycmdQendYdFB4T0pYMHBnOHlRaStXNnhZc21N?=
 =?utf-8?B?YzAxSmJ1eCtvVFRQRzNnU1NxRERXNGZWMmVGelhmSE9laEt4b3FPeHZYWGFI?=
 =?utf-8?B?cmowajNmeVlRL2Z4MlpVTVlwZ2tHNnR2eWd4SXJnVXJ4eUVrTXJYUzRDendl?=
 =?utf-8?B?ZzJ0emh2OGpvdjY0MDVVKzd3KzlUR1lFaWxJRmd2R3NmZXVsZHVGWmsyNmoz?=
 =?utf-8?B?bDlGcXgzRUFtMWNIMGxhTWYrTWVrYzlTcGc0YnZDSU55OHdQVXJBN2k4SE5u?=
 =?utf-8?B?bG4vRkMrU20vWTBuSlhCdGJKWUFzSHZUT3JYQU5GYzdkV1VTWDUvdWJzcWlP?=
 =?utf-8?B?QzdhbDRvcTFKRDZXYm4raG1VQW9ZTzF4R0wzc2NNM0I3Wm5nWG9HSGI5QWMx?=
 =?utf-8?B?ciszMDM5d2Q4cTN6M1djR1pnZjhsa1JOc2tyb3p3dEVPQTBidlhXcW95Mm9z?=
 =?utf-8?B?bFVBU2JZdS9BUWNQT3o4UVJKbGxiMzNaYjJJaExYbXdQTDlmVld3ZmF4OVhk?=
 =?utf-8?B?OUt5bDdWUm56TEprTWJxaUtqZk5rMnJac01qREpvRmtZUkpUQ2RHN0FrMFF2?=
 =?utf-8?B?SnIza1N3T3hJMGs2aEtxb1Z0UHNzUTdVdHR0TmRPdWtuYUVXbDZJb0FDZDht?=
 =?utf-8?B?VVI1dXFMU3RNNllNZzhJMTF3MExyUjBjSHg0bVNyWXJ5cFJqb3hhbVZNSzJR?=
 =?utf-8?B?QnhCSDFPNHhFWi85Vy9nT1h2Q1hQTnZkNk1SYm1Nd3JieUI0KzluWWZwblRk?=
 =?utf-8?B?OStLbFJRa3hFM3lmMVZJZ2YxK3VVVDAyeHAvVFg1SkxVTUtHeHhtS0llMkEv?=
 =?utf-8?B?SkhJdGpZSjlQbFprOVpNbXpnaWRiSCtVc3pjM2FzSXdJYmhzc1h3emFZUWoz?=
 =?utf-8?B?eG42a2gvUGRKdmlUWENsazZIS1JHL0VuTExnU3grOGk1SS91NExsRVRFc1Nm?=
 =?utf-8?B?d3N6U3pzRkdSc2FXc1NqdzdBRkZGTWEydjZpRUJ4a2oyOXpBRXhtOFVzWWtj?=
 =?utf-8?B?Sk1URmhnK3FTZk83NVhFTnBObGhER2lLRXluSVZDWVdFVWkxS1M4RCtrZU9k?=
 =?utf-8?B?V2pwNWc3WGJNN0FZdVd3TjBzWTdDdEdNRUpibHBoOTV5VHBnbDYrVXFBQ3Jz?=
 =?utf-8?Q?gT7dwv+g3zlz3xt1Lzt4ddE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4mNiIdE5PB7TkGHT7/eTPswB0J22LpFUp017YuOlhQ1XUt5uHGRaH/qacQCyvRlfsPJW7TSEuzdtrm7DhJNg6b3HcnIH9q8X9sfBldi+b7QS0Ex9dJwG3whJFuyn2XbwfdM+2sVK5lZN19PtvZme/31qTh9nKeNMRof7hC2RvWnXTaPd7BTfkM/cTJNxOqG+XJmiZ4/d9IpoML62+/gf6A/74FzMnCfOYwgGxqVZyKr4p3fj9zO7wumnnGtWtlP67jagRt7+vPoyEBwClk9lGZo0pmQdS0d1kWd2ZdEqVb/4Uo8PA8yapfjFSPMn7+2XqdqGfScbicdWBdVEWo+R/X5eym7itSF/ojUqfjppXewJ7X1knHFPSnv+3js5zEMkuLg58XT25J+6K3ie7nfMrHbggwDUAuEgI2AGHeRaQ5vjmpwSszxdjh6D9JLlDAgylTJWyvuDmUYdcVhq77HT8KXqZgAliB8LphPieRXFoMRbYgZdm9vflMRxkGJOxKvRiZGPnCG0pk551nIUCoJBHOxB60kTvuZxtV1z+Chscbx6LKZSz07jUkNg/ByFXQzuXjp1/1m1lVL3/rwpd2+YCPRM3cygJISNF1PhujHzfAk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08c8449-22b2-4a9f-2fe7-08dccdaed194
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 13:29:51.1877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Q3sDdoKfDv8j5XM7tVvSN3jpyW5uUTz/Rm0KmGD3JCmSlZYSm0Py5PzH/eIejkrButTv+aB3PilmFOb25M2WDKyUEyWxKblGURxoXwaH3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_08,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2409050100
X-Proofpoint-GUID: bJIydpn6rJqD8OVBke_Puf-U53vUXBG5
X-Proofpoint-ORIG-GUID: bJIydpn6rJqD8OVBke_Puf-U53vUXBG5

On 05/09/2024 14:20, Jani Nikula wrote:
> On Thu, 05 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Thu, 05 Sep 2024, bernhard+linux-doc@lsmod.de wrote:
>>> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>>>
>>> Because we want reproducible builds
>>> and https://github.com/sphinx-doc/sphinx/issues/6714
>>> did not receive any love from Sphinx devs in five years,
>>> let's disable parallel doc builds until that Sphinx issue is fixed.
>>
>> You mention in [1] that this is likely a duplicate of [2] i.e. multiple
>> Sphinx instances running in parallel and racing in doctree access.
>>
>> In kernel, does the issue then boil down to:
>>
>> htmldocs:
>> 	@$(srctree)/scripts/sphinx-pre-install --version-check
>> 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>>
>> i.e. multiple Sphinx invocations instead of just one?
>>
>> Broken record, I still think we should axe the Makefile hacks out of the
>> Sphinx build altogether, and let Sphinx handle everything, via
>> extensions if necessary.
> 
> Indeed. On my machine, 'make htmldocs' spawns eight sphinx-build
> processes, each running with -j8, and each racing for the same
> doctrees. And the whole thing is apparently parallelized to 64 threads,
> which is unlikely to be the most efficient.
> 
> There's no reason to blame Sphinx upstream before we get our end
> together, and run Sphinx as it was designed.

I don't reproduce this here, either with plain 'make htmldocs' or 'make
-j8 htmldocs' -- in either case the process tree is:

make ... htmldocs
- make ... htmldocs
   - make -f ./scripts/Makefile.build obj=Documentation htmldocs
     - /bin/sh -c make ...
       - python3 ./scripts/jobserver-exec sh
./Documentation/sphinx/parallel-wrapper.sh sphinx-build -b html ...
         - /usr/bin/python3 /usr/bin/sphinx-build -j... -b html ...

Neither the $(foreach) in the Makefile nor $(call loop_cmd) should
result in parallel invocations.

Could you double check the process tree once the "Using alabaster theme"
message has appeared?


Vegard
