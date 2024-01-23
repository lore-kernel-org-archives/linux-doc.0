Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C2756478
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705995817; cv=fail; b=goAR3xc67jtgpnyVum/m0wyCzE4mHZbaMi2f09H0IG9dUcDrDTJ9mE5mc/4kxMDipW7q2/aeYnkvG3EGa1S4TqcGp6Ke87zp0MIsDHUa1/9J/x8OsFmnbmUyOXiwJiQW/y5BtjKdVcxePtLEFNikPkRjJuw2g6CxDwnsipBqjKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705995817; c=relaxed/simple;
	bh=dbJ0rG77KYnulyBTYNIoyjqEQsTj3EMfnGz0Bm72KOU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JPNAkUluEVsrToEKkIwECSsrffgMh7fcluKzyb1sqqxi4UMsCENIWHc1GM3Gea964sJ+9KAK+VAVcd2XFwv76/5t1hXrQnKjIRDgErAvUb6H60bvDCrv9MOT/CI1hEvsGR4sRN/MO5Kk8TOrhPl2FT/aZrXuFrmKBiJty0Swgfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HethVtFN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UYJuDh2n; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HethVtFN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UYJuDh2n"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40N6ZOTf029700;
	Tue, 23 Jan 2024 07:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=NzC17256WMqxsrBA5/8Cs9fz7qYgq9L3PJqNuXXo+6w=;
 b=HethVtFNMij5smii3lw7vcx5Ts6R+fZZXcQ9zUAO46Vne2K7boqex0MjMnhHYHbmRGJ9
 hTLvObAovMk72cwn08yJ3TNPSpHy7QZs2O4Bjc5t500HycU4T1Gapuhq9u3ueq/uiKgr
 SC5wyyq9u0PpQIQ8c1je0pvHjx0NzdrkYIpGlMuumh2NbSZLux1qmgr2Ey62M2sUioov
 91NOHQI8+pR58tPVtnccxA4t8+NP6nfgNgmdPVfo3jKfs625MiYs8VlokT6aaYkIjxQd
 ySwfB62cs/50akOmmp2FIpeppHpH2/HIg83+TpwnPEXZzP/XV3J8VsZ1uGPngtClrvcc qg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vr7cunnn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jan 2024 07:43:30 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40N60w3l013157;
	Tue, 23 Jan 2024 07:43:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vs370cqav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jan 2024 07:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKrZub5CVWruMJtfhqdTBO4jMVa2WBB80LqNANfDb5tlAvKwL5M07HpLmO25ASYg63uBhw4O+1HyP5DWMG+iNTw++4iiehaMOEkVhtiHqMpSpSK/VHBF5+ab70xeCsEe2jsSOxS5SL48QcmIslSAgwMXfhdoOog7wF2sa848uSyqTlBThH+aw/+Syi9Pgsj3924lZjMJ6PGiw1rzliySpEwhNOJx+hyAusJwxB0/SS9huP+SiNCwTofK4FVez1qR7EnkCGE675i79emRQfk/OFbQkZfYPzpD8ndAHTwTwYDiIFsECZpfPbPQjgVuohQli86E2niN+UXE63EduJno3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzC17256WMqxsrBA5/8Cs9fz7qYgq9L3PJqNuXXo+6w=;
 b=X2XJwlYCaK4dU/z6gsnxHByPVPvWetxLmza/2Tz+KdXhWwIfw+3sRkLjvdMWCmZ3RRoHWrOHHQ4pnIda07dZOoW+TUy+vxkIRoERAGJAjf+mooMtEzMxzMAyznomNCQl1PHmSX4rs+6PPnzXN+TJMtdOsE0Aco/4xwsDRHSmESm8uHbp1ZaECuA1m+KyolWeLYon/V6ivKLOMYT1XfRLWLvX4Wi3eZHEAYlxUt7nQHxzHW0A2+fVuTrN5A1HgfZiGv2k80AH6Aflt0/5YoYwnW7wXdZ/iiC4URMjs21CyRdhmYVmyl2aZwHmRbai1KJnx+xHPEzTXVQtDNcBYYepLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzC17256WMqxsrBA5/8Cs9fz7qYgq9L3PJqNuXXo+6w=;
 b=UYJuDh2nfR+cbo89w0Te3x13vLyDA5F4u3g+nHcdrSGJ4XymchNI/qRYf4hdwfW0OXL50HA3ILcgtpxkVCTidDkH7c0YEhc4t9bRsN24LRhDjAJdB0xf8Pnu5b82OFA55TodJiDrrVL0xbTDgKfNbenOXrS3Q4qLs4dfXG04e+s=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SA0PR10MB6425.namprd10.prod.outlook.com (2603:10b6:806:2c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 07:43:27 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 07:43:26 +0000
Message-ID: <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com>
Date: Tue, 23 Jan 2024 08:43:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: docs: requirements.txt has stopped working again
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::24) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SA0PR10MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 011b8e8f-b8c1-4e1f-6af5-08dc1be6fc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rg1OWcR3FOGz4asWVCullMgkfrutZO8a0TNXlyVIFHrpCmuobaNdyBwYb8Q//+PreRmRIdLAh5PqNnaF7KB65HO1SKHeKYGeVdBAFa5biMfkGg7qSzGz70/mWIFFEgY5ZCoT0LduU2KrCFciadCXj+h0qE1cSyr/fB2sqfDrtEggLfR/s3mkW4OLdqqP3yhmKokds68r+P2BdEltjU+vgnMyPt9PpqCTJ0YUBONWySBFgIAcBJo4g5YhWGIV1QFkyUei+e87iVkf9Aoc7VOryphriayvC32J6OEPIcmwGQYhnrsUwTaplfhT0gmuIm4BEOLXtwcFWz/J8eQbytpPwUd8+ZZalFR8eH9Htp8fBow8oHRhm3/rwcCwTGFlqRd2KoyVX4x8Nx1pVNBAh4zxJ33jbPq1aMy4w8UM9/lydDXyZnNnrriB/yEInnFHyUqj3UlxnABGw7a5wJeQnkUeEv4YzVqDL6j/IOW6nVayf7ut/oEonwEsrDEP71yuNPzySmRUBpY/wh6qC2q/jcXmBWND2aOoccFWY/8fjGIFy6irHz29sk3yefHIg6LFJwXgx4LX2CFDFLggoWB0hbuYnd1w1UdgAX2RERltcK1h+Wn3d4HOMTfY2TWfpQb3jOflnQb1rh0dbAPZGsSEhEyN5VmRid4PvQibD+tF2Wv391BJg4HSDzqXD3F/W/Dav7Ak
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(346002)(376002)(396003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(26005)(2616005)(53546011)(36756003)(83380400001)(8936002)(8676002)(4326008)(44832011)(5660300002)(2906002)(478600001)(6512007)(6666004)(6506007)(110136005)(66476007)(66946007)(66556008)(41300700001)(316002)(6486002)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVFiYW5KckYzMEVoV1FNWHR6bDg4azdvVCtLaFYwT2NqbWN5d2gyb1hrV1hO?=
 =?utf-8?B?MlZXZTlnTHdNYmRvVWh4TlpHc1VFMWhLVW9ZQjJWY04rcmkxRSszRXdzNEZ3?=
 =?utf-8?B?WkZieVRTb1JZVHdzRldXOXBLcUhwaTUwcTE1cWpFTDhsdGVURktaSHkzcllo?=
 =?utf-8?B?anVEZEN3bDVDR2FMamJYQXpTNERkTzZLV3R3cU1raEdSRS82cFFtLzk5TVZB?=
 =?utf-8?B?bWNCamRSaFFvS09tVlNPaW9FU1hxZEN2ZWx3Y1JvYmM0UzhzeHNhVDhydGF2?=
 =?utf-8?B?ckE2emN1Rng1VWhIOGJPQzNIS0FxSG1HYmRnNVVySGJId0JOTDY3TlJOVTFn?=
 =?utf-8?B?ODVtbW5HY3JYcnFmNW1WcWdQY3hzd04vN3VPL3Y1RXJYcERvdGpLN2RjcUZH?=
 =?utf-8?B?ZTBhUk1qakpQc3preWs1c0ZseXlMWFV0dVIyOTRnZVJaQlpuR1dab3VwWC9k?=
 =?utf-8?B?TzBIa0hsbEhlSFplL1p0U3ZWVTQwSkdoWXNTN2VHeUZvRmlacHFqdExvekxZ?=
 =?utf-8?B?MlRuWVpLbjJENFRDOEFxejRwVm5OUFpkUXRzN3BtRitySHRtTWd5U1NNUmRN?=
 =?utf-8?B?YjdYaXFnYm8zZEhpVEF3ZEh6Y2VmRVBlWjZydVB1ZGhjK1NsbkI1WlBzU2Y0?=
 =?utf-8?B?WEljckhOS0c4KzRjZHhoUGZpTFMwUjFFZFpsMnczMGdsS1dvQkFvbE1ueVhx?=
 =?utf-8?B?WkRTUGlaR1lIQVUraEEva08wc3BTaVY0QXZYYnBPK0hBa1ZzTzRwNFUyVlRO?=
 =?utf-8?B?U0JKSDZpeWRvdlRqR1RyTUVURFFVL2ZyQ2ZVeEI3T1NHWWM3S1JQN0tUcE14?=
 =?utf-8?B?d0lXVG1kU2k0OUo4bFhHWGRtWnZ0bUg1ZDVvN0RwZjdXaXBJVHRPRjNrSnlz?=
 =?utf-8?B?RU1sL0dKUjFTV0NPdjRHdzU5WE1rWFRRZEh5OHlVZWROT3kzZDlDNHJBU0ZK?=
 =?utf-8?B?K0pRVDdGOXVQZUVadmVYVHRYUDBFaW5ZWlFleGNMdEh0RGRzc1dIL3RCR3ZP?=
 =?utf-8?B?aThyZFJVQnh5VVNJZWxHeHF2WnNHZ2pxeUFJN2Qxc0crZVNUK1VQRUJQaUJp?=
 =?utf-8?B?RWYxQytzSzVvMTlyWFM4VTdqUHBadkN2emlkQmwvN3NyTVcxTzJwZDczRHNZ?=
 =?utf-8?B?aUZFMW4reFhURGVvYWFIWW9EakVJNEJoY094blJ4OU1SSmM5OWJLQ2hJbnpQ?=
 =?utf-8?B?cW5wdnAxTXpMRlpxYVJ0NUhQZ3k4aEdwREVwcXFOWFJHR2dBLys5WFRMRnd6?=
 =?utf-8?B?SjBmdVBhUlNOSzR5UVJEY2xNbmloSlQwd3FTWlhtU2J3MzIzeU9YWVNYNzBQ?=
 =?utf-8?B?OTRpS3h5K0d4VUptd3crYk9JVmxsOHRoNENpMjY1R29Za1RVNTVGWmp6US9q?=
 =?utf-8?B?M0JPbTY0QVUzUHVYZXJlRkU0TDhrYktYNjhLY2JBSEhmZzFTczcvMVJaVWtp?=
 =?utf-8?B?aWZpN0hDb0dTenV1YnNJNW9LOGNXNFFjWGQzc2lxZk1jVnRRa3dYVFR1OGNj?=
 =?utf-8?B?Z1YyTGVSY3BveStyTUltMXYrdlhHWnF2NVprLy9KSUdqZExXdXVFQTBXZHlD?=
 =?utf-8?B?cE1xZEo2b0pkaEs0cjZNVHNNSjBDR3RNRFZ0UGtnRUF0YW12U1RRWkd3NW9R?=
 =?utf-8?B?QzFqZDJXQXRhVVFHZE55T1Bncm1GWU4wR0FrRzVIaFMvcmZTd05BbERVOVBS?=
 =?utf-8?B?eHZoUUlqbm1qS2hIRXVhSWUvcjF2d01zV0VJdEgrcnFHYkJTcVhzQ1pXajVp?=
 =?utf-8?B?VTFacEFJQmVMbVBKN2tML1Bia0xjUVJhYmdnODNpTUdGWFF2UnBnZXYxeXps?=
 =?utf-8?B?cTB2MVpjVHZrejc1M1NVdUcwTk1LVkxlUmsrZ2JXYTZEdXAxMzZubnFEU21J?=
 =?utf-8?B?RC9sRjMrS2F2QUxDMWlYLy9zMVZlWW5PUFF0SzdnQS9TMkVjVjBOQkozK0tp?=
 =?utf-8?B?QjZ6cTJMaXR3WGNXUWVRV1Q0VThZK0xTOG0vanlVUVFNV2FObHFEYzhFd0tQ?=
 =?utf-8?B?b0I4RHN6dFUwczd6ckVLMXZENUpKUC8yREp5L0RDUGprS3BlRkZUc2hGRlFr?=
 =?utf-8?B?T0g1L3BGQ3J4TkJQS0JhWEUrU3JmeEhjSnhXWFRVTTFNQWNUYi90RjQ5N2dv?=
 =?utf-8?B?UmdJMTBMVFg1Y1ovcVc0czZweDZEdGJtN2Rnb29DamRHRjhsRUxkK29qWlg0?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	9dj5ipldFklYhkLX/+AJymbYYdu9gKl7kE4+2HBNuYyMmos57UWvqVubPfXgTDdWnfppNp7H8ahctiH/0z+2YUgaorFo5ywyRwr77XVVMl98s5DRThKZpiXpOS+AMJLtP7n+8qBrwWglPib5MKHkze7O7+kYggFnwz37KAU9vB0pbGY3N9LDrlYbqdc5Odl9i86xc43iYz2gyg1ZRKr5lsnbEMZWFViNf6gabdEJmkNCcoiMOeujRnOIwbAqcUqaqnVHo92qBzjZiaYNNDxIgx7daYmiUuYX8Hy6suCOENi8nSicqfEDzZfm49iQjaGeRII8keGw3XnU+OFBTEF3SZiQDMhmzPU6acODxrNq2wvLybdOPGV8hfficGumfTtPz7I5VdTNbBo+h6mK7teSem78Ftj3W49ZY50Rw6mrbiMWOPWkWK7gCxYXv9vewIfdVt5xiTezgkuAEsWREEH1QDtmm8PtOM3KqnyKPlWDGIq9IWyc3/v7jidmFAAuN6l8yX2ZBECpKsS1ll5VPROovDLNEaNHt2Y4qidbyJR82QAc5RhYYEIaKYuy9pbfmzPsB19jZtqg8Oap7xriaHm1coCdHkDAjNF++c5Zs8kjMV4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011b8e8f-b8c1-4e1f-6af5-08dc1be6fc20
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 07:43:26.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gD8BaS2O+yRCtG5WsnTUWREQbeQpF4eeKk9KTdStVb1PijFyhTI1ubZ+N5upREiDqgtjhCz78FUBDeawFg0w0grqCxnaLXn7Rd/U/hSjqMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6425
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401230055
X-Proofpoint-ORIG-GUID: XwptvwIgv9W0-3ItcgQKNYKKQCFSeYO8
X-Proofpoint-GUID: XwptvwIgv9W0-3ItcgQKNYKKQCFSeYO8


On 23/01/2024 05:14, Akira Yokosawa wrote:
> Hi all,
> 
> Annoyingly, installing Sphinx 2.4.4 using requirements.txt of v6.8-rc1
> ends up in a run-time error which looks similar to the one Vegard
> reported in commit f4cac0f74658 ("Documentation: constrain alabaster
> package to older versions").
> 
> The new error is from sphinxcontrib.applehelp which reads:
> 
>      Sphinx version error:
>      The sphinxcontrib.applehelp extension used by this project needs
>      at least Sphinx v5.0; it therefore cannot be built with this version.
> 
> Do we want to continue whack-a-mole update for Sphinx 2.4.4?
> 
>          Thanks, Akira

Can we have requirements(-latest).txt and requirements-2.4.4.txt?

The thing is, we are not using new features of Sphinx in the kernel
docs. We don't fundamentally require a new version in any of our .rst
files or markup, these aren't security issues being fixed or bugs that
we've run into, the problem is purely that we are using a software
ecosystem that apparently has no restraint when it comes to breaking
their users.

My issue with _requiring_ newer versions of Sphinx is the fact that they
have performance regressions: 4.3.2 takes 3x longer to run than 2.4.4 on
my laptop. You need to go all the way up to 7.x in order to back to
reasonable performance -- and that will probably be too new to support
most of the distro-packaged Sphinxes.

If we have two or more requirements*.txt files, we could just freeze ALL
the dependencies for 2.4.4 at versions that we know to work. That should
stop the whack-a-mole for that version. And then we don't have to force
everybody on to newer/slower versions.

I mean, I can also maintain my own requirements-2.4.4.txt on my local
filesystem but I think it's better to do the right thing out of the box
for all users, no? Maybe we should also add in warnings about the
known-slow Sphinx versions.


Vegard
