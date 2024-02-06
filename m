Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8424B131752
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228028; cv=fail; b=lmb0ZSEhIC0WalNg5wZ1nWLc0GSToMBrkjQvGQj1TnRw58favjxnHrlLyGXaVdJ6nTwok/zb50wU/Dxu1PH9+BfVsF8XDHTDXlV736GAfSJc9drJsovqHdh+ioeFgqsTImblNs/mdH3a9T51pyOFtvII3RDHyBuVas9DLfsJejo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228028; c=relaxed/simple;
	bh=SgVc70KJAC76fCWc4s5O+EQ8j5a9McBJQwlHTDnUshY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KjutZGD3cGs2T/B1FdP83XxLxgXHAuLlpSQV67fr9bRWM6siD3CW9FdXnWzzqzKmaYeVXrjeWMYiPljKGKrWZD/s94XE1GqfAzQ9qEY3J+xb79gYccwmTuSHUJHsPfGV1OeiCbDsSDm81A2uUkzqP+AePBVuGQzVbRj0V9UR1CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NYcxqvSj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p9Uz8ek4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NYcxqvSj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p9Uz8ek4"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 416AE1IC032695;
	Tue, 6 Feb 2024 14:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=kPixdiY3JM+hDUbzgzvK2L55apn84ieD31uzsxoSjgo=;
 b=NYcxqvSjOBLGFaXXYXPftH474iL89/BodxbCWoq0DEWy9b6kouUKWDXYAc4oYTcDeTcY
 e8BWJ9nKzCCQWohIRyITBm11JbgKYzeXE6NtJQfmkBXE+lCp8LqafvHn3kQCN2Y5+gMb
 PAUic+wTgJt9rGLFfbJl4PagR0maeCYpfqZl+JAUFcXbMftc1AmSmhtmrO7VhOEYhDyF
 FW5TNc5RXidkG7apfw7T50KcEVZN7G/mxIqwZD4V+b1BG1VluN9vmdzjBWsIuI6qkN3V
 uqSD7pHMsdTt2yxL7dhaV6gCFioMBzGNuaCHF1oL42mayAvteqLMn+2wu9h8rpo9eFgS FA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1d3uevv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 14:00:19 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 416Drdtc019694;
	Tue, 6 Feb 2024 14:00:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bxdm9j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 14:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HME7dgQryKzSaP+CCPnR/+wK2ZxnkAC7H6B6JbcmqL3x+O2nrI21dswlQg4N/zRc9zU2ML7FCIbqng12i7s+pzSVSgYbysYaBRiuHGPuuYfvQzt6d4e78dGAKT38ulKWtuszaqOxTEMQTR5P2TukbtGJQcBJayTqLsi0gUElU1yS7s4id447scMztI7UvFWuY+27qtOqw79cwF8hneGS8FGML94Hfn5RnmqFSB8ufgZzd158MuLnJC2DQYfUpGEa+wPqGkUG3JND67Pa+l4tjGEkfELC3R0yuwjWN0l5mxzeZz97tsk3JRHl469o+0aMCjEC+UxlIN2brpGMYl4hSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPixdiY3JM+hDUbzgzvK2L55apn84ieD31uzsxoSjgo=;
 b=oHqnKI6mgfBM2y7iFjZHWbBK5Zl9XMPo+9466DMSZh2FlkdrpJi4ebdGkVWZy+r6mlmlW0zrMOd3L1hWfX/21Cxe9jzuCGPfbeUIQRUbWrboFKUFgpCiWEBxsLsKLeLZYmS6pmPDlOdY358iG6TBzlFTmv2yzDpvz0mNfv8gf68QnT1Myh7hYLlR6RDAnSoP1X4U//4Qg/E23yHRQgMAX9NIPxTgGyVN6g2VK8LXIWwQYc8sqqSknwxOWiiN8i5aO0kkcTMjFhxBme6lDSmShJXTdXkdNSotqo2lLt8o6WPOjNrERg4jhhRc63Q52Wuz/2GZKHOTNs6HSAAntRK7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPixdiY3JM+hDUbzgzvK2L55apn84ieD31uzsxoSjgo=;
 b=p9Uz8ek453dPQNS7hJnPZ61QdRjYYFPN5UCrBiWV3aAE8jbk+qAVj6SHYsqvft+I4HSnLN9AigizPHpKQlQztVOr2WPzE64N0h58gnoYsRHajSUXjptQwRIH+0pmx9br86AdBZaJXQkifL4Chd6XzWUG8GWMw8Y+ASzBXrBI23Y=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SN7PR10MB6524.namprd10.prod.outlook.com (2603:10b6:806:2a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Tue, 6 Feb
 2024 14:00:11 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 14:00:10 +0000
Message-ID: <45254692-6ee0-4483-a853-2152d8d000ec@oracle.com>
Date: Tue, 6 Feb 2024 15:00:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
 <20240205175133.774271-7-vegard.nossum@oracle.com> <87zfwec6m7.fsf@intel.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87zfwec6m7.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36c::16) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SN7PR10MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: de142f26-5770-40b1-776b-08dc271beef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/9VWJ28cMvTpzDqybyO4tS9L/IwzJicfWmK/aqvXxFTKD0te8GjujfHjTpoke+qgQYH1CXWZlr6v1OiNiK0TdkveAK6V5XseFeDPYrb1VuOcQkHPKyRx9VPyrmeduQIALm43zLhqW/vfBspYz3Kox3f3+OBEP6bY9WqHmiHxlgIqk1epNuSkh6vR9mzogVGnBcNYtGDyuJ7ZWHXyyICpPsQzv3UdAVUNi67LoaLXMFx0aZS6rs6pkgr3YoQva1RpAmqgUf46Boo4fWCd0Q9+jTQr0p2zL8s528RfUj38VcUwwTpcJf+J4DCq52EfHo6PFwm2d2VKpm4gYxl4UPUQHgi3O4t4J6ZnN7ijfzrcnID4NHcLyw5LwskUbHly7SD9rMZ/wex5LDume5K9UOkbdPP918q2mFpeilwmXD0mJpD1B143SNX3/JxcxSnBlXFSHvwVlb9m14EiwsI7c+Gwovp7wz4ePxdpUINjLmWSy1m6BBIUY6Pl6xXvQejhp53fUSbWHgIC6DS6Pa34267APiO9qYLjxg76Z6cd0TcSBjkUkLp9SaXDzba4MWj937lauoHn/YLKbkyvTChzeVCAvImGC88Y3cCDMi2gLZNF9D674UFnA3bH69tF6Bh6RUQXE522ftk/1KyuCiZ4BA6CrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(478600001)(26005)(31696002)(2616005)(41300700001)(83380400001)(5660300002)(8936002)(6506007)(86362001)(110136005)(316002)(38100700002)(4326008)(44832011)(8676002)(66946007)(66556008)(66476007)(6666004)(2906002)(4744005)(6486002)(6512007)(53546011)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWVNUytjeWhraDVRNWhFd05BTis3SUd1a2p1MVhoY3k3a2g0NVl5N3NlYno4?=
 =?utf-8?B?S2VkN2EyYjI5WmlDSi9VTjZWMk0wWTZaNVpVeTJFT1BZK2l5Q2ZVTmIrQkd5?=
 =?utf-8?B?bDFPc1A0azBka3lLV1AyZ0xlSktRVkNUL3QreU1IVWpkTEM5KzcwY1dKcTF3?=
 =?utf-8?B?TmRqMlc4ZUxaNExnbG5IL3JFTzFYbjdWYkl3OTdLUnhOTU1EREhqOEozYXNj?=
 =?utf-8?B?MEdtVmdIZDNia0JUWEpXcXN5YkwwTjF4ay9EWWovcXNkbFJISjc2K1B1Nm50?=
 =?utf-8?B?S3kxYldxbHUyRUMxZWlPamNjZEpHbWtmaGpDbWp4MVhXVlBPeWFrUVhyZXlS?=
 =?utf-8?B?SWJoK0RrYmxkNXhQZ2hqNmF1SG80TmJMaFdDWU5mSXF2MkpFaTZ0NFZvV0Vj?=
 =?utf-8?B?NFJKV0RUK3FrcklGaEI0aHJ3c0dFNms0M0lSeklraDlkdm5yZVE3d0RFWjR4?=
 =?utf-8?B?alBQYVo4RkN0YzY3U2hsZlpUbGV3MUwyNll6ZUl1bXFaN1FYSlNGenlDcllP?=
 =?utf-8?B?NjNFM2hndzVtcGV1R2NuZkdlSWdqbEdsWmxiblZsMXhWY0lrNkp1UTNMZTlJ?=
 =?utf-8?B?QmxXR2txNkl2eHRFT2ZheXZadkxpU2xFSStZNHFVL0VVR3hVVCt2UkdQcVdJ?=
 =?utf-8?B?MWdEcGxsNFZaQmNVaHhkeG82ZzVnMnF0N1Y4RW9DMExpdTN4a2MvWllzdGlF?=
 =?utf-8?B?U2RzM2p2bDU2YUpuMGExOFlESkwyY25zOWFhVDRFUnNtdmJiV3lYS1p0T1VK?=
 =?utf-8?B?YkZVcWZONllQNHl0UEtnY2loZ3NOUlFoOTR5M3Z0R2pFT0xyaEtIK3RsZ1lJ?=
 =?utf-8?B?R05aUUVXNXBKWkN6aTl3V3JwOHhld0x6Y3dUVG92YmtaRGxNZ1hLdnMzWVVE?=
 =?utf-8?B?L2xJTUpNVGdWWHpseGJaVnBQZ1gweTBxeU1mTG0vRHFiWm9pdmNuNVQ5SGFV?=
 =?utf-8?B?NElrTWI1bmMrcDhEbGp2M1E2Z0JDSFVrTW9DTGhqWWNNbXcyUkk0YlNFbkI3?=
 =?utf-8?B?dmdCSVNURlcrWXB5Q250VjdxYkRBb2ZwNFdCT0ZzOGRyZGpBMFFxd2hGVWdq?=
 =?utf-8?B?aVBYbFp6UnMxcnJQNTQ3VzZLQ3Fla1BNM2pwTy9hR2cwdlVuOVdvUmFXVGF2?=
 =?utf-8?B?Q0hVTWJoMzhSL09aM0hsYUxlS0JqUms4YytqYjBWSS84NGR1RWxDc0NnVDRq?=
 =?utf-8?B?WGtKRklIbkdrb25SZUliR1pNL0JneXI0eXpFL2dDTk80aUtyK1FSMGQ3aWZ1?=
 =?utf-8?B?QlFlbDkrT2ZSeXlBblF0M1NsTVJ6eUFwTTFJT2RXTDNjT0k1bjJNcVM0bzQw?=
 =?utf-8?B?b2Q1VzlTZ0xCdTk2aFE4NTllS0dpNEhSSVBNQzZ5eTJmU0VDVDI2QVo4VGV4?=
 =?utf-8?B?NjI4UHA3L2VjWjk0V3BwOGRNODAzUmhHaHdYQXo5cDBwdXFsSG43REp1YVlM?=
 =?utf-8?B?d0R4aVNmVjBOSkVYNlduOTdhUjFoYllhbVhVQjUvd1VXeVZnSElJR0NYbUlV?=
 =?utf-8?B?Q00rRDVYMXFTNFZvRk9UY09YMUZMRHJYZGw4RTUwb1k0WGRFYzhxNE5yaEwv?=
 =?utf-8?B?VWg5a0lON2xDRzlUb2RXRmxXWWZ6T3d2N3d3dmVIaDNhOW4wT3ByWWY4V3Ex?=
 =?utf-8?B?aU5BQWhwV0EzNWZqUHNJU2JydmpxWC9EVUM4VlpVZk05NkxubjQ4STUwZUxT?=
 =?utf-8?B?YUsxT3g4Z2hrQ2NnNG80T3BPOEV4S3VhYkY1VHgvZUx1M1lGTWQ2Yk1PVjZX?=
 =?utf-8?B?T0J2UzltK1h4d0FxQW43a09EVUpXZDBlemNVL1o4STF4aklsdG9zZlF2T1Jv?=
 =?utf-8?B?enl6NUZFa0tCVEtzcC83a0lUOGVEMDZvNVIxTVBKdndTeGNkbHRlMjkvUEx0?=
 =?utf-8?B?T1dOUkRuZXpSNittb3habkdUMUJIY08vMXh5ZGdLdExJZ1UzbGZsRkhRYUE3?=
 =?utf-8?B?dDZFNlBXMUd0bDBqMis4c2llRmF2VFF3K3ZtcEZIbVhBSllHNXMvMXZidDBo?=
 =?utf-8?B?YUtGMlkvbnl1c0RFVy9DeEJRODJVOFdUZ2tPRXEwL3BtVC96Qkx5VlFrZ1Rj?=
 =?utf-8?B?ZGJMWWowWlBqWUNwT3lmWTN1emNzdFl0SjZuTC9Id1ZFSGUrOWp5VVNFTXhU?=
 =?utf-8?B?ZUtHc1NPM051bEhoYzVuanRlckNRQW5TWDlhY0gyY1VVTnV3MnNsbGFvcnUw?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iHtx8UcAa/96eW19iMf55OhNbnXN78frqiiouP2X4ERNajs8vF81Fr3pQVxryOkZDui+iqwRGuzB2jnV9e5GTCh4mBQ3ed0yZOCFeXomyobX25qM98HeMeuvEWDCKeCe8NLgzSYSysm/k7GijyeFfv/KJuI1dAlfAPnwHWiegZv0limi7WeBYmjhxxN5RkUVU298fxy4piggEKuiYRqVljD5p+f1L5G2Uyw/8fRSpSuDCPpRqXK9Bb4FPneSeQdBVDokau57Ka/1aeVTpzhaZ6lu1k/HnOB9i8aHds3fQYGZydV68V/+VA9sqJz5xwBDxdJ3XhtVFBzVjoAIalWK+OLTwA5AVGEkGSi2wM+RC1LW8n9u5RWHJ/N49gAIeCgOsaO8OqNkrNLg/FHQTLIEEa7/aF3KvH8jgm0sbPP+v/hptBOwrnr6UA//olv9/DwTTvy12lpgdsHTs3/wGjA/rauyL0Xo3xmL5oEoEC+It/Dj38i438/b4dtN/U8Hg7gGvbkSlTn3LScdtNXlXv4aSjaRnRuWDtC2MtJUcV8U+fOy0Ka6oacZ2dTp8mXm1mGJcJ1/jo0ZAyA1qFc8SNInohCwHKOg8nR3ezlgiuqET50=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de142f26-5770-40b1-776b-08dc271beef2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 14:00:10.8831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1l4B761fxP/YMayuoh+hur1f/vg5AU/RGgvOS6L9RfanszxkbQJaJlOoFjvjI+GzV0rtj5/YajK3KiGruIXjs4HtZBbC9IJbPCNjhdAqBWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6524
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_07,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402060098
X-Proofpoint-ORIG-GUID: OeJd7iIEgQG6V2UJJWI5_52xxz0MVJJ7
X-Proofpoint-GUID: OeJd7iIEgQG6V2UJJWI5_52xxz0MVJJ7


On 06/02/2024 09:57, Jani Nikula wrote:
> On Mon, 05 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>> -            kernellog.verbose(app,
>> +            logger.warning(
>>                   "Neither inkscape(1) nor convert(1) found.\n"
>>                   "For SVG to PDF conversion, "
>>                   "install either Inkscape (https://inkscape.org/) (preferred) or\n"
>>                   "ImageMagick (https://www.imagemagick.org)")
> 
> These could be converted to use """:
> 
> """Neither inkscape(1) nor convert(1) found.
> For SVG to PDF conversion,
> install either Inkscape (https://inkscape.org/) (preferred) or
> ImageMagick (https://www.imagemagick.org)"
> """

That would mean the lines could not be indented, causing a (to me)
somewhat strange-looking block:

             logger.verbose("""Neither inkscape(1) nor convert(1) found.
For SVG to PDF conversion, install either Inkscape 
(https://inkscape.org/) (preferred) or
ImageMagick (https://www.imagemagick.org)""")

Is that preferred?


Vegard
