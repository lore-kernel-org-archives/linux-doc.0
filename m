Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA322F07
	for <linux-doc@vger.kernel.org>; Wed, 27 Dec 2023 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SWzxn90F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fsaUaewz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BR2uKs8032239;
	Wed, 27 Dec 2023 09:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=+TrzzGT8d4AYo6tGC4jALgEcDm53egusv2zEBUHij+E=;
 b=SWzxn90F3Kx3KXwjdLbDabjRcCAB+TYLboOpa7j9doQAL65TotRbqRuXJhPJpQ8Z2g1K
 nb1GIm0d3sjnzIkIyrFBI43MOdHDULNdp8KUmlphBOPMMsPUVqsV0sRtKqTOfH/M5p/T
 14zDEG5Unl+s3U6eIxef/6oLhIK2dK0QdtDCbHUdwXnWXZktncRvxfBk0d/QDEWEpFAp
 PJqrYGucojBdqmVlbwnZxDJ5X6D5onXW1Sn2Y0K6abJZ3r+e2lSq0GsTlsumqZwTokM9
 /hIY8fTi29bshdE2lTOouudXMjsXqbls36WRgGrBxHhCysyc97l1pZzNxtQBhx1rdnE8 2g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3v5pfcce8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Dec 2023 09:09:40 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3BR7dsTg013515;
	Wed, 27 Dec 2023 09:09:38 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3v6a934agu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Dec 2023 09:09:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jucKxYxVLYRfGCmLB4nG3uMt0458LZ58iQI2+Qrbn7SpUvw51kv7PqKlkNw6PA4OUf56s0Wua3/T+pATNTl4/djaUVSQNztEYVP8N4UoEI6ddWEmbHGvYkCWIUcp+lKiI0zhCIJ/q8uUnXXH+ojUhYniNKKuZjTyvdOXrBnbrqwAgalUsPWRfdxcovqIlrIMMDHUqUB7UDEp6eY4jFIr9T9i0Ni+bHiv4zxkjRrwY7dn+ROKKmdew3yOKaSzCJ6nwtXMdWFjJz3LiIrgZfZhHushFPe/KQ6nMT02Ve+Z3vO+QUnW+Y0wgl6YYE6UXJZAv7VNt0XyKCJnXed5Z1npRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TrzzGT8d4AYo6tGC4jALgEcDm53egusv2zEBUHij+E=;
 b=Hm/U/CXCk6cLom1qNJQobscqMWebd7BSkiMz9uO2RUSRgbNc0hYk1UUK7s/NBg+wgtnUYtKhW/QPh+C+ccswhEJW9RLhHRb5xJnWUwP//1erPitHzSIUiKyLI4Yl5u6p1+dVWVJC40fmF4LDy4afOgoDnYI1u3g3QW0rmN83QRZEA3HQSWL4OU98UsGRfsrPvZ4o0/MXpUFqqq0l4BOVncO+6tMQhUg2A5K1e5loIQrYCWucWPYO0J23cJbPncvvbHUzXfq31F3EwigTEhx8iEontSl/d8xPssVsV2K7HuBzlglQtNTcgi0k0xGAhhG0kroLvU27FY3eUZ6um0oYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TrzzGT8d4AYo6tGC4jALgEcDm53egusv2zEBUHij+E=;
 b=fsaUaewzYDfysQIxWoJW6RJmGUVFUiXUkG1kb3OqF6NJogR0O7HOMGsA0UFDqOC3I7rGuFvC3NiSIj1hzTyjIvtELlUEuyCeq3uQ2tvPy+7o3aRdhKJKfieVLJV6mtzr26o0JsGpMlOtGvrTYZa2nwnNaRnf9VVREy/0bW1kGDo=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CH0PR10MB5321.namprd10.prod.outlook.com (2603:10b6:610:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Wed, 27 Dec
 2023 09:08:53 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 09:08:53 +0000
Message-ID: <e0b06cd8-5198-4c09-b748-f64858abe304@oracle.com>
Date: Wed, 27 Dec 2023 10:08:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: docs: automarkup.py
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@protonmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::11) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|CH0PR10MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee0975b-2db3-432c-5fb0-08dc06bb7299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NhDyFSXJbSkuoxHZbY53dMnCwMgcfHRpcymn+/fwsRmuGpvsFkOHYTlnVk94dbpuw9K9PA6ZV34D1mju8BOTwGtCflm7wxEaPHPYTr8gBY658gtZX0w8njYekD7XNr99pMcx5RG8mHZzz58/nGy4K+SjfW++8clg6C1d+2tgaHASQBfNSKRFTPQ5zhLAL2OvQ12VTGc/f2kqcM7jyiiNsEDlDZ6ylKBUWgJ2Xdvo3XuKl1Tx73H2C62TTG3zRnhzsvLjC7xpjUuPevCyUK0HMdWYSERDUSqiEDFjKq18B9J1nI1rI2IMWafIUeDlCh3/l1No1q6uLFOGgX6nCcOtG20j5rLfvgYKzYE5nlZ0UTDp7ivV/xPpaYJbIFxWQi+XuLqJpHTjcE35wrna5mJpG68vZroYECjpuJeZ4PCSvcGMqaMcAMv6sqPcSogTjoagUGFk14BqmM4lqUJC53dydyiDHCYW9dPmgLkW2PmbPXmJlTQ4squyI16cJ9OinXBprRDq3QSKpLK9HsIp+bc+fLyntiNtJm0MWrpQlGsOpdA+isVq1+7uVjgBz5zQwTRd9hrwz8IlJ60xKQiv11HU5yjZLRFNXSabTlOSjPqIRXfIvd8MbUJ2JTOXuFcGdUsTG6wxzI68l9G/En0s/MdQhzW2AoDVxdFZb81JJ/V5TRnkoOxw/rpA2TgtSYFCjZe3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(316002)(66476007)(66946007)(110136005)(66556008)(54906003)(31686004)(6666004)(83380400001)(6506007)(53546011)(6512007)(2616005)(26005)(31696002)(8936002)(5660300002)(6486002)(966005)(44832011)(8676002)(4326008)(478600001)(36756003)(2906002)(86362001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1Q4bHVoaGw4Q0VUMkkwMDJWWGI1cVZiNW1zSDQrSFFuOWx3QlhFWnVhTkNC?=
 =?utf-8?B?SlR5bVdvMWtYODJRN3FEcXIzLy9OS1pQQk1TMHRrYmJMcVQ2cXdhdFBRZWNW?=
 =?utf-8?B?cnl0Y2FtOHJrQW5JVkFsalBrRUJEMDU1L1V0V01qQk8rY2s1bEIyYyt1cmRF?=
 =?utf-8?B?WEcyUGl6dnE1RjJKb0dHQUlaNDhNcTZPc0NFMHB6R0M1RzZ0QUNEaDhLV053?=
 =?utf-8?B?UEpmSzFWZ29oN0g1ZDlKYmExOGszd0ZLT1FDcGRucjQ1enRjQ3l6Q0t3YVFj?=
 =?utf-8?B?aEZoMWlyZ3VvWW9HSGtqbzdEdzRyMzJGMU1kUlhRM01NeTlCMW8wNks4K0gx?=
 =?utf-8?B?bFF3eW01TklNZkhQQVBqNUxiTmlFWGFHdDlOMUpQeGZ2LzNtTmtIc01Bd0d1?=
 =?utf-8?B?enNJUUxzSk5YRzQrc0FqVEp6U1RPcW9sMkNRdkRadVRoa0hhbnNLQTZOZ0t1?=
 =?utf-8?B?Q3kvMHVkVU05emVmY2hZWXBVMUI5bjZUaUZkbzhVMmlGaGVHZ2c4bzRCdVZM?=
 =?utf-8?B?U2V5M0dsSFN6bXFxbCtaUXdGd3VDajlFa2FwQXJiT3VERTU2ZThxWjlsTFFz?=
 =?utf-8?B?WVdjRnV1dVR5Z2QyeURGZXlycmJUNmI1MnFKWEZNUGNNME9ORktURGl3V1JH?=
 =?utf-8?B?cFNDN1E3K1ZpaEZHWmpQMjNFZDhJV2E3elFGTjI5Q0plbXBTZklTM3RsTWlQ?=
 =?utf-8?B?WE9rY25hZ0U4V3BISDlyeG11TTNPSjhQTFlCelFSb0syRjRqOWdtV2ZPbTk2?=
 =?utf-8?B?RFF3NGhqck1GN3dwODl1aWtLSVMvcTB1cGhHZHRRY1M3UHNuMGxKMjRVRXZZ?=
 =?utf-8?B?RkRIM0tHV2FZbFV4d0lWa0NiMnliL3QybmlKcDBJRkZuVHE5eU1BRm1VcER3?=
 =?utf-8?B?Ky9BalJndzY3MXE1SjFTK0l2VXcyTmlRN05XdTV4QS9NdHYrSjUyNVN6OHo4?=
 =?utf-8?B?UEJBcm1VOGt1MWxpeXprckMxTGIyb2lPSWpOVjhBQkhuZVZ0QkdJcTF0ZEtn?=
 =?utf-8?B?ZS9mNUdnSTEzZ20xdXFsQlhjaW9tSldEVGltQURyM3RvNWw2bkFLQ2QxQ2p3?=
 =?utf-8?B?dUs4b29GYUU3RElSQzdrb242bmwvZHBsQXplZ0VFQjllbzMvU1J5YUYxL1FT?=
 =?utf-8?B?OUt4SGtodmZDWmIwdS9VUTlrRW9vemVKclNHSXU2K2F5Y0ZWUUlJdU5sN05n?=
 =?utf-8?B?V213d3J5K2dyN3R0amNmdE11UGdmdm5YMXljMGg3N0xWZm5SVDdjZmNzM2Jw?=
 =?utf-8?B?bS9scERMdHhJaWkyWFRHR2Yxb3VIcWYvZ21DNERIVnlXV2xaNHBNNS9GWkxo?=
 =?utf-8?B?NzNtZWlHaElYc0duKy9paHh1R0I5UExraWhoQ0dNdHVPbmphcFhZaWtzQzY1?=
 =?utf-8?B?THM0bmc1MVVFeVNmMlArOVNMR0pZZWlXNVZUbU8zTHJzQzhwT2g3d1dMNm9l?=
 =?utf-8?B?TVYvaVNpYXlUWGs0QndmOFhER0QrYjF5Mmh2REliOHpPdjVvT2FYN0JUQUNq?=
 =?utf-8?B?Ujd0MkNBVnJ4YnV6ekd4S1FYMlBBYkwzY2o0bzh4Q1VFV2FIekxMZ3pzRjdw?=
 =?utf-8?B?dmp5eFhPMHZaa0lkMTU4ZW9ydEtSVWU4UkV3Ry9wQnl5RTRCczRMb2tRNWQw?=
 =?utf-8?B?MXNBL0wxY0VLUWdhWDVvMVRwQi95clkrWHBVWTRxd0plU0xlZDhCQkdTWHFi?=
 =?utf-8?B?R2JHU1RWVVRTTWwzNi8rNDVwTFdNaHJQakdMaXNGaGVLSEl6RG5zK0I0aTZk?=
 =?utf-8?B?Y3ZqWE4wQXNoMTVTSXk3VTUvM21LME5XbjE3L2VSZit1MEcyU3JLcFBXT3hl?=
 =?utf-8?B?TW93VFV3aThHN1JhZEtUREpRd0hzbU5SQ21MbXl2djQ4blZub1crY2IyUjJk?=
 =?utf-8?B?MzgvdHFLa1pST2UyaHZWaTJYdHI1K3ltL2R3dDZlaGVhbXFDUmtDRFo0Ym1M?=
 =?utf-8?B?QkRIR1Q2RWdLZjE0VEw0cmNENmdSL01PVlk5bEZrQ01VS29UVDZIN3E4OE5R?=
 =?utf-8?B?Um5qZHppSEh5V3A1UTR2c1ZFNlFCWWhrUU5pK01WS2JiRE56amZPajlGQzR1?=
 =?utf-8?B?K01qUkdZaDB0MkU5TWlzd1VjY05Jc3B5WVF1TGtLZE12dVhXbk9jc2dQNFF6?=
 =?utf-8?B?TlY4Z1NKbjZCeUUraG1VcFNsem82a3draGVjdUVxSmF1MjYzUjFYWUFYNVhu?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EzgOY+GZfz5eBwiAS0RAr+mzTNFHOuLk00+P7XfX+6HP4BmeSmfYZndZm1lj7plpGpgaxD26zcQ8e+GpRySLrVMnGh4OSFj8YOsj24vGgamZlyNId7+SZ+ofkMTfcbO+mS6v4KFAIMY+nHhJVYt+ySZ6CPsDfUnv2cmP5cMyQ9qXngF09HVroVBqjNjy5f8EmY4e9R6gpW6kURkCmB+8/LissYI6rI9MSxi/jL2J2S9403PiUycMQjzyQiV/s8+mXtjP0GdKF9YAe/HSkU9wzpv35pw7rKOfXfi5bX5SuvK915Rae6BQjHWWoHVkn3SEeFABHmiNGguNwCCt7C5n9q1Jb1SP/HdUrRVZYGATxrnsU7s3e5/XYpRHRsA1I8D9Sd1JWqH/jNzTqMkl4xyeK6Wh5wOEwlOkopcmoR1bA4+4lSczfQ2xU/oI4OKxkwNILmbEkITIsUywxeSvJ87W+ABRlSYsP0W5udrAHJBMrTG96CIfqLMSoRpIRmFAkgsLaUr6z+KOToJFhPNwzt6e1m0bF6igSqAPiPFkDFlvudMe0+budiSnXkAPJCglXkmkfntgu7nN/66aWvMovLFks8zWRWPRBplEkkSkGP7bCKw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee0975b-2db3-432c-5fb0-08dc06bb7299
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 09:08:53.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVxE5PLe7M8JFi4qlO0atRospDVHCch6amPiFfT6N+XaBBj73nsQW+xuIrWwce+6koDj5vc+ru18smKa1eYkiTZzy77NmYVOIyaeRUx5OzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5321
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-27_04,2023-12-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=919 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312270067
X-Proofpoint-GUID: RbrY1UAYxxgkmcQ_yealSTm9AotwWtxR
X-Proofpoint-ORIG-GUID: RbrY1UAYxxgkmcQ_yealSTm9AotwWtxR


On 27/12/2023 08:55, Randy Dunlap wrote:
> Can anyone explain this?  maybe even suggest a fix for it?
> 
> This has been around for a few weeks AFAIK. I haven't see a patch for it,
> but I could have missed it.
> 
> (since 17e02586ed185 in August/2023; oh, that just fixed the move
> of files to the Documentation/arch/ subdir, so maybe even longer)
> 
> 
> In file Documentation/ABI/testing/sysfs-bus-papr-pmem:
> 
> 		response to H_SCM_HEALTH hcall. The details of the bit
> 		flags returned in response to this hcall is available
> 		at 'Documentation/arch/powerpc/papr_hcalls.rst'. Below are
> 		the flags reported in this sysfs file:
> 
> kernel-doc reports:
> 
> linux-next-20231222/Documentation/ABI/testing/sysfs-bus-papr-pmem:2: WARNING: unknown document: '/powerpc/papr_hcalls'
> 
> and the output file Documentation/output/admin-guide/abi-testing.html says:
> 
> response to H_SCM_HEALTH hcall. The details of the bit
> flags returned in response to this hcall is available
> at '<span class="xref std std-doc">/powerpc/papr_hcalls</span>' . Below are
> the flags reported in this sysfs file:</p>
> 
> 
> so the leading "Documentation/arch" is being removed from the filename
> AFAICT.
> 
> I tried changing the quoted filename from single quotes to double back quotes
> `` and I tried it without any quotes, all with the same results.
> 

I don't see that here, there is no warning and it renders properly.

If you go on https://docs.kernel.org/admin-guide/abi-testing.html then
it says 6.7.0-rc7 and (AFAICT) it also links/renders properly.

Maybe try building in a fresh clone/worktree just to verify there isn't
some old file somewhere that didn't get cleaned out/updated?


Vegard
