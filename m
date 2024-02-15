Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCAD8527C
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707996261; cv=fail; b=lQSa6h3uK/uouheUBnyyRVxETpEqtVOjb2WW5Ed7MoTD87DDCw7qH18PSUmN2ufXgssb7nnnErMtSoPSR9dJ8+gz1BiXkR/UiQ35nx6socQOMkWnd6AMX8rL8c3KRojRNDcQehX+TMFuuowu+O9LV9W2FtlU9jTUIh6udgVRHG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707996261; c=relaxed/simple;
	bh=XA3LiWti5DrrQpn9tu3mv03eiA4xfDYTGAxNiEVa/DE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B8mIZBEG2XPYY0rvjO0C/OjlA+e7ltXFtib1idFwDtAxRG6C45TWyaTyMeuJ734/UrQFl0Earo2YtJzRNRD8+0s/4XcgkAqe0ZdNnwmLtaYsMqR/VaDmomItNLlcfHpK+jxJ6Np6/nnuZG/nLP2HgxaJIRIEf0ST22tvdMhL9Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ax+mvE0g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f5LggV0i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ax+mvE0g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f5LggV0i"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41F6icNv032668;
	Thu, 15 Feb 2024 11:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=fvomertwzIJy7g3EfVntI25fwvu5OPmBQ6s9pE/FjFA=;
 b=Ax+mvE0g9T0OzvZqJJ01ZlfCyt6e7w97m+dgsbEDHfUXiZtshZSqtCMBv+BQBWeYQGFI
 6vtJCsQOeQOOfR+OHY9gQAIr/A8fZOvy5UflUAs0xrpV7hD/JZDwlSyN2dSJi7car/ob
 2wp4QjI/O2Zm0NewvBc07Z3PIlzC5wgrWGaxcVn99SeJtC9Pl2hqinKUD0FxgsWT5lv3
 XtnO6+hKjDQdKYSgpXje2adQmhenj7IJKsr6jcLyryMfzd6Q9gFfDPTuZn9Z+6G86ayZ
 SKpW5lELcnuu1Rfklk7gpXYde/ywL0mIn68Ly4kuyMQjZJs8T0YORqFOUhuP4vWaK1dh Ng== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w91w6t0ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 11:24:17 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41F9ZUQF015103;
	Thu, 15 Feb 2024 11:24:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykaccxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 11:24:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvYKp6yLZkQp9twgSbtZlIe/Hk80hPFdrccbejG7fcnY5DrGUqsIXB7V+q0F9u8ht+d0rJfdK/zNFNMlP5eEYuATNKcFf1WI0/wo2xcriQSzFlJgVHrCSyIasckeeb6bcClKwsOBz90E6fSfIvn7/StEZEL9NoWm2pQdJIWa4no/7Bfqv4GslPdJnD1fzzmqyH4Kx8iRD3AbVB8J3jgrcz/6Gs7a/QQ2J97NZWoanNOxmmqwNrIjUgTieNhyXdhY3TYZOHwudPEU+WD+imOfBmzBQZeMnpWUVgVMwUIH81O6jld9rxy5slfqJ7kInDp7JZq4YOEBa9fj7x8V5bXHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvomertwzIJy7g3EfVntI25fwvu5OPmBQ6s9pE/FjFA=;
 b=Wr1toCiDgRjVbtlHnOkuwggWaO/glYeKQnQH9So8W0vmTWZgrOATDl1YoATX7rSl3kL4iF9fahki6tklVsPtYWtUqoiwkleMQJNtXKlYr4J5P0oeULCtm4jo9dCjv7G76LmWZdiCrJKQ/J6vZ71uGlBnzytONBddGPFcWnuU0RUuVtxV0We6ggnxygOpWZh//mwRi3iLVvWmRvIrgz9NgELjOe2yPyztUEGjMaX3xJFg0Ofpqtg5l/z1UF3LPtq3i2m/TXrjioc3jdxYXZist7xnHKGkox0oHSEP8wK66aKg3bqBIwfG1uRGwdyUjrN3ovFT+WoGpVRZhC17ykud3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvomertwzIJy7g3EfVntI25fwvu5OPmBQ6s9pE/FjFA=;
 b=f5LggV0idAF1vCfFzjj5JMpjhu6dyBQDpStbPiZLsrnNe/zcLbf5MItj4gg9wNUX7zPrj3rYVTidBU7pvGS08eDaf7/PGbm6RBE2rE7kjs0RXulpwtirhjGGK/JXEJAmP/qa0MT39SCoHx98bGw2Qc9OzMTx8kjYfpt/orgimAU=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DM6PR10MB4153.namprd10.prod.outlook.com (2603:10b6:5:21d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Thu, 15 Feb
 2024 11:24:07 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b%2]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 11:24:07 +0000
Message-ID: <1e03bcec-fe9f-4aaa-93d2-0494f3d5db7c@oracle.com>
Date: Thu, 15 Feb 2024 12:24:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Only load the translations extension for HTML
 output
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <87sf1uy6f5.fsf@meer.lwn.net>
 <aa42e525-3dd5-4cd9-a8c5-6e9d92c3ad15@gmail.com>
 <3c037ee8-210b-4bb9-9877-35637749d2b1@oracle.com>
 <d34e3dce-0a16-48fc-b3dd-e83ff3568baa@gmail.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <d34e3dce-0a16-48fc-b3dd-e83ff3568baa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::12) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DM6PR10MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: 134649c3-78bd-4e36-0941-08dc2e189fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	imB6X7dsS9R1K3NUuVBtX+1rVer4B6eFt0A5qnhEvsC+Bot03gp/hibwQDUlXfZ9DmNjXpsqZFoD8t2T5cIwN43Fht2lC29cMLXyJQ5l7sGr5t8pqjmGYscwuisQXlKCFVsffERZo7EPZEdGKpmhBCFOT0ltIHKCsmAUoJQKcTrHaasARuNJ8kyxscRakwMWGtqi9HH5SuC/Pj0wRqeLKLwUrVAfu2T1TSy+yYa3bnufqgdHRm7TgIdp6wGNWvrRpYuQU3ZQtS6VfMf/W6aolcPIKl6HG0kq7wvReRlMmgvHVOGLOAsK/0iXKOWC8puwcLkfvsajFsGKcyQ1Ty8ZMOKjVtIOr1chBMuokWrCRhXWKoZOTRv535WnGmyeGWBqTkIReSvsNE2ed7/0q6GSBU+reeYRqA6scRY4OTXef/Ed55aCPwZ0fuT597Vx4zBhZm9YD9QBkQlI45VRRaNCn18Yuu95YbR3+jrylDjGFNJ3y13LInmLHVcDAUzZH/YkKygF1ifDd5+g8LSKvEWOQLHJL7mxfogDaBsMil5qGcM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(478600001)(6512007)(2616005)(41300700001)(53546011)(44832011)(2906002)(5660300002)(66556008)(8936002)(6916009)(4326008)(8676002)(66476007)(66946007)(966005)(6486002)(6666004)(316002)(38100700002)(6506007)(26005)(36756003)(86362001)(31696002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzZ0dlBPNU5DcHJRVC9XNjl6elArM1ZxRHhublprcEtTMUJkUjhwRUVIV0M2?=
 =?utf-8?B?ZitzRjQ1YTVSZUhnUTdzbUdvOEFNSWNLMHNrcEdPM0ZVOUljTy9aR3lYWUNn?=
 =?utf-8?B?R2huaFNzdnhSWnFzL2pwNVgwZ3BuQXJKWEdWK25DOUIrcGRuc3RMSm12di9s?=
 =?utf-8?B?QW1FS214MVVTMDkxbng0L0djQys4ZkwzWVVqNm5pSnZWajNLNXVtWmxkaFN5?=
 =?utf-8?B?YmFZNk1pQ2I0T3BUNWRFZU1yOGtRRGgrVUdnSVlDc2x6ZmFnVjRHMVpDZmg1?=
 =?utf-8?B?NUVLSm04QXpUZ29ubDNWMW4rLzZxdXpISjBQZkV5SS9QcWlGUlMzd1B2cGNH?=
 =?utf-8?B?MXJ5YUtkOG9YNUNkU0pTejFSWE5oN1M2QWgzRy96WnFzczJOdTBaUW9pbzhC?=
 =?utf-8?B?WHNqV3hWWkhMV0FzVVdmclFUc1I3WTBvbE1jS2grZnJXTllVamVRUjlaZjFL?=
 =?utf-8?B?UzdpUFRpTWd4SWJZd1pJbHFRdWlOTjVOTzd0UjhidWprdEZPUGhDYlkra1JU?=
 =?utf-8?B?UDd5S2M4NFdHZE9YeTVSRjJDaEd1OEpQeHIvTUZ1c3dsR2xDZ214REhoVS8x?=
 =?utf-8?B?cEZ0cHlBYStvczduU3F5OTB3UFFUblFXSzJ1bXlHanFwd09wU2tUajcwUXZq?=
 =?utf-8?B?cjJINXdOVEpZT1YvVTd5T1k0eUd1NGdweEUwbStYeVJCNzlLdUJ2RTZONnV1?=
 =?utf-8?B?MXZDSXVNU0E5aXoxRUVXS3Q4UlFoY3JaVlYwQWlueXo5Vnp3cW5hYmsvYmht?=
 =?utf-8?B?cVArMm5md1pOc1B5TGw5bnJNVm8wWS9xL0lLT2NsZUxwdzk2eklnOTZaN2Y3?=
 =?utf-8?B?WDljWHhFMXA1WjVQWUF5dk1ZbjA2UTBXb01wdklLUWpSVy9JTzEvNFFyN1V0?=
 =?utf-8?B?eklha2dHRTdJV215WVdLVS9TSUtlaWYyY2o5WlBKZlhvbVVHRmdsYkRBOG9m?=
 =?utf-8?B?RWhnT1V0djArWGFFK3hWdEd0cGl2anEyYUVxRHFvK0o1YVpNY1B0cjFucUpE?=
 =?utf-8?B?VStNN1drVEFhdWowMHFzWGhWVVdqV2RVQmpEZmxkLys1aU9TUkR0Q0NrclJJ?=
 =?utf-8?B?TkdIVnpYQmZseDF0YWRPeC9YWjBSQXZmb2UvZU5ZTzNTMmQxa0FkWlBnTGRE?=
 =?utf-8?B?cWVjK2J3Tnh6QVRSeVhNL2xMSHJnOVRLUWY1R3diOHEra21JN2Z0bVBzd3Fy?=
 =?utf-8?B?aHJiK1laYnF0MXJHbFRBa3VJeUR0Y1lBWmNvUTkrc3BBOFZ6ZEtNTnlRa0Nr?=
 =?utf-8?B?TGN3YWhnallNUVdFR3JtVUhDYjVhNXArdkpGRVZwNHVLcnZodTFldGFHZWZD?=
 =?utf-8?B?a09wRVd4enJoendkdE9XdG84Tm8wZkJyZ010eTdQN205YXZkbWhMUXNnSzMr?=
 =?utf-8?B?VEhBSWJUVWdDUFB6ZW12YzFVQm1FSUI1MS80MHBJTjF2VDRnc1IybGljSUNy?=
 =?utf-8?B?cTZSR2xJV1cxVnhNRWc1d0g5aWV6L0pnQ2pWcHc1d3JxTFUwTWYvTTVQUXhx?=
 =?utf-8?B?NDlMZDdXby9zMU5KRHRrQnlla2lidjY4TW95bkFaUVZOSmIwaDVqS2cwSlpL?=
 =?utf-8?B?cWluTVJiaHUybW9sWm9iLzEzeU1oQjhod1grQlBkR05ZSGgrNm9LOEYvcTY1?=
 =?utf-8?B?MXIzb1c3K3VHWVhhejY5SEtOa3k4MkZrT1A4NmdkRFFLZTN4bG9QN2FEcVpu?=
 =?utf-8?B?RGd4K1d4U2xBcHNYM0RJbmJDQ1hvd21ybGZVM3M4NmdQeDRLRlQ3S21zRTRO?=
 =?utf-8?B?U3dpekxZa3pSanN3MXAvdFRFNWdVYkhkbzdWQm5MaWRwTmhKQ1lWU3prdVNQ?=
 =?utf-8?B?aitiS2hJUVFwTTVSQ1dmdXNSZXc5amdsU3hlRkpBbngzVVI1Vm0xTEpjRUhl?=
 =?utf-8?B?NUQ1dWlieHM5cm5NanBLVlhjcjRQa1RWQUxGNlJVSUp1NTJyaGMvK1Nxa2hw?=
 =?utf-8?B?YktLVkRKdytpRjR2WlVxbTFxRC9RRGpKQ3YwZHVacWZhUE5EbDQ2OVpFQkpT?=
 =?utf-8?B?V1F1eDdPU1pVai9HNnFRcUhhQ21ZMzhLOStZSkxOREVhUWJ1L1BnQXZrWVpq?=
 =?utf-8?B?amJkNUdFVCsrMkpiRmpKNENwTC9QZWJxVG9ZSTJUTGE0akxaQ1IzelVIRUZR?=
 =?utf-8?B?Y04weTNNcWFCNmFuQzNENmIya3ozVlhKVUlEZWV6OFFwNmhQVC9sS2F1S05r?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lAjGLzN4epzEwn5g4eRTLXQVQs3Qvx/ADHlFXheCnhVu/fFtt/+hO9K1JlX6kilkcN1WV1KZ3JZRtzJYZ6ZXbKIPMv/ufrsHFOFtYSjlMa0X/am4QgorcXnakPMIJ6UQB7I6Wps3+Fewsy+2e2zTd8MZFtfUzfYYVAXOMEh2zxhwOXiMJD1K1Tn25vSPV0ZXIQdy0HClg+z2vSuYyi/l8Fgi+uHJRANFW3NWJfeVbrxfw82CT7kkRcdLBZe7c0vtRmUDwC1YYqwuaJUNxi/Ste5yR5lPMKf36iDAia8f1M9parAnsM4jqS6qsoGtfQTx8X32ZLhOt2GAUi4Gto0mGPUk5I97w81FFicT2i0TSayWedrCllJ2iM57cq6hkqr05/rTbUT1BRa7FQxI5KJBYP5iuXdipOdVpLMTKWXPzudBDWTS10NGLnwqOljoyckJ0f5x8SVSMhOMNBPYzO5ob375lBM9KxSZHD91vlVa32tR1piQLiP4pbpJRgyP7apG01eStCq8lfxsFqrVs+qoInBdgWrZYqZE9XolFfhLW/ObVreq/Kb5ZBvRZHrIfsQfTRrCFJX3a8CzVe1rjFluW8/l2YGYz+jwgBMCvEDqCVw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134649c3-78bd-4e36-0941-08dc2e189fb5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 11:24:07.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OijpVzBFJuxp7k2vgM4FxiNUXYPQpe+Jnc/gr4EsJn8QClpM+jRHUaHGp9yVv5kz5f7LxgwPK5VIncbCgcQkE3ZG1Ft+08gzYydzK7Ypvf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150090
X-Proofpoint-ORIG-GUID: Su9oCGfRTUmLdMhVbW-FhfLOkrG_AyWu
X-Proofpoint-GUID: Su9oCGfRTUmLdMhVbW-FhfLOkrG_AyWu


On 15/02/2024 12:10, Akira Yokosawa wrote:
> On 2024/02/15 15:22, Vegard Nossum wrote:
>> Jon, this is pretty much what I said would happen here:
>>
>> https://lore.kernel.org/all/8b51b6d6-0360-4f42-9b96-02e0ccd0b34f@oracle.com/
>>
>> I have a proper fix that should fix all errors everywhere:
>>
>> https://lore.kernel.org/all/4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com/
> 
> Oh, that's even better!
> 
>>
>> Why not use that? I'll do a proper submission, I was just waiting a
>> couple of days to see if anybody else would would test it too.
> 
> I didn't respond because I mistook your words

Rereading my email I see that it is ambiguous, sorry for the confusion.

>> I'll test a bit more and submit a proper patch if this works.
> 
> and decided to wait for a proper patch from you.  I was thinking
> the delay meant there was something you needed to work further...
> 
> I've just tested your proper patch and it worked across v4.3.2 (of
> Ubuntu 22.04) and V6.2.1 (of Fedora 39), among others.

Thank you!


Vegard
