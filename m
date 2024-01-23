Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DC605AF
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706016112; cv=fail; b=X9bnOZcif8NSPje8MBUeGZ/lQOca0CRDZ2erxmYUrMZIvgISbXtXTSs2JO7saaH9zVR4RZowK3gVp54IDTe2uoUPtg2vtNTgJjJazI1ADh4ch0CDTU47qIxzqkrpUiXfs8lGUttvXirpgqgS+Blm9NhAPcyVnjQaoewsEjC/NUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706016112; c=relaxed/simple;
	bh=jASFfUjyu0L7u/AW2eDCwICBoNvX2p1sCg1SqEWD6gE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hL6kZQ+rOZDyRviLRI+PvkDNuTBO5oTSIMiRnPwpMNiR6GLoEo8ps9wVvtoeyM0yRV/rz8AVpO/YoLlJqjCVpdld73MO79TfJhXsdNQ3fOgCAMdN0NZ/VhQBf2fCUr1dyzJg2M2BSYkHrisEt9C8VaI/I4pRnwRLlLJbcCtLQsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dF653+Jf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FFsDcphV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dF653+Jf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FFsDcphV"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40NDDghf024008;
	Tue, 23 Jan 2024 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=VvQMDD4DXD4OZ3HtaLFKaKBohf9pti26HVxZ/chkfqw=;
 b=dF653+JfHax/ZUOIhA8TLGMrurHmNYv3SAliLsqxRzmkndvTBYHZCNujxPzaRa54MAQH
 Ty0qWBw7EZgoYv7VXXpufCzGO7abmxI9R9oT7nHf1dWkPJzdte7SySgIFmmQo9M+a3DF
 jOUOo/AZy23MFY/lPDHzRAECMmoTWyLLE37jRZ0662HiRcXUVyKlpcFLtMLQKnValOs2
 exSoZpJTVGgDY436/1s7OAhSYG3A9iRl/16+Z+ou5IowMXGUsq9gn2w/jA3yBtOck2iZ
 VbiLVZa95KVmLcN7pu7gxz2d7fefoBa+CnQZGt2YmRRER4oKzXjhZBn+sOriG2652Au+ Mw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vr79vx9a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jan 2024 13:21:40 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40NDBmol025289;
	Tue, 23 Jan 2024 13:21:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vs33swj34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jan 2024 13:21:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNbycdgo+enFLOvnfEsj8AoA5sCnNsx9XHVGXJFbustRMR6rYf+Db0pPoEij81eKIwAzs/UICoAC9gQHLmBzJ7mLxs2OctqoRflQMBizmlwwd/4VmIHazL5jJcmcLSyn/j6SI9XWg9CISzZyXvxeiYMt5GtiLv/zIcGP4K6QSav4HDxgSeGdKtjzEQB7vO+TVmuzHazJNSnxiF4qy1TpOOpX5c/sEAz3Ebq0AqI1+Q6MyFRCr13zcPfirHMARgvtAdwaoORrk0ELSrr9SzlwmeLLbXUjAkOalfkGT/xtxZVDmu2RNBRFTQb/xPpFcw1ZO7IptSWTV3lzIFGsEHUPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvQMDD4DXD4OZ3HtaLFKaKBohf9pti26HVxZ/chkfqw=;
 b=FB2d7SNZ5PWAdVUf9KpPMk+dMnCC/Acqrwh55DeFK6/UxQdYKIrnp/lgz0JGXCq+G5+wvVt1YZ1up+7ubTeA05cS4ea2axtz2FFdO/rBA/2w8lCBhAGwR5AnHDFK+0bnXeKlTTysF5xF3qvX/VVneVP6WWdUok6VApUV57jNnF+8SLqQ9+ttKc6MGH6ZLjZ0H5qQAFR+DfY4732mZ/E5NZL4LcJdrxdq3tsHtceNHBUEmkKUHssQNaX3XtzgzK4F5yI2Y/9fCWeJ1GRvXqnfu1ILBtFTPJlcQmTf1fh3LzbdOp0NBAZ8/W7Mkmy7cLDhcNTEdJ4oS66AU/EW1fsw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvQMDD4DXD4OZ3HtaLFKaKBohf9pti26HVxZ/chkfqw=;
 b=FFsDcphVbNvzltKQ5JCHOx9Uj6IwqhwScQfJsrq6mMdaIbiyaY2wUK86xSRVWty3peBP/zwxBnSEC1Wk+WTgDnoH37k1BBQ5aPJm11olnUfYJAAFeEaORmvvFWsD6RDmLgetpbhSHLsJdQsMqxZuVjq3f0pqQ6p1aGsEqx4r6ps=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH7PR10MB6083.namprd10.prod.outlook.com (2603:10b6:510:1f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.33; Tue, 23 Jan
 2024 13:21:37 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 13:21:37 +0000
Message-ID: <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
Date: Tue, 23 Jan 2024 14:21:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: docs: requirements.txt has stopped working again
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
        Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com> <878r4gnsev.fsf@intel.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <878r4gnsev.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::13) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|PH7PR10MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c62e0d2-77c5-466a-3e97-08dc1c163a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ArZ7sNfjVOVEyD7RY4voURe4vPR0KXv5joVPdGDIjD7BnCu6fe/voRu9LBo/oEHUeommC4u6PfQyFjyBLfrdytwGqr6RE2mbFBCMfdmjmyGvAOoe9hCK6Jdlx85H3QxyOm80bcMPPIxsmeM64B2KW9w0TFll7uUPWe4mAfyIZKMPzYtTnVH4d239hiumS1e706B2+0WZPRttLipFd6YXLd3MYRD3VnrX1NeZ00tqPtR62fDqMqqg47AA7lXg+VNM6J3f7c/waaKLoJ5XvIJYj2Z3xPscpIi5ByQUAXyWYDLINjtnFMZv2ySNXitzT6zFTfokaRaRX/xSymtIr/O1qRkQa5f7+nS7cztKYOCafRSiney/gCl4eyHLPoJ8W2hKR9Sg1Deo4Z42qdQF8rEvVRXqbxapVl1L3Xuo+ofDmoNGIiM/mRTDVhv+Oe7ai0ywTMdapfLrGx5dGFwzqR//TSdV+tAk//EoWaHtfOPfHqeQs6kF/okaGxdOgG57ZCo+pNRUXlG3oMBbDYy+OO1L66dcN/AahLph+ngujkXgMiWQgN2SeVw7uZTlKNO1Y84HY5X7UR+y/SU9HyBDPF/yYL3fPZI9N72GblEtWDukFjKKRFb51B/761+LoVzwJj6pHZWqB8z8XnuXDgAes62DJ1fqxqwkYPIFlGw6DBdAncFfGJhwdzjlsTdeeZiVVb/S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(6506007)(2616005)(6666004)(6512007)(53546011)(2906002)(83380400001)(5660300002)(44832011)(41300700001)(6486002)(66556008)(110136005)(66476007)(4326008)(8936002)(8676002)(66946007)(316002)(478600001)(36756003)(86362001)(38100700002)(31696002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?anRDZHp1eFNSa1FEN3plRmE3YTJyKzU0Ym53QWd3a1F6V0VoY3BDUUx4ak9l?=
 =?utf-8?B?YWQrZWwrYTFFNkttbkM2V1ZPWlJMczltb1lyL0MzdlZmTHpNYUlGVmYrTTRR?=
 =?utf-8?B?UWxLMTlBYkZ4RFJlNlJCZ1ZTS1BBZnFNNGt5QmF5NndXc2tDN0NobkFHcEQ3?=
 =?utf-8?B?TXRJbEYvZG9tM1JEdmJEcUZoaHpyMFhxNDRvd0wxSGUyMUZEU3ZTbHh0SEUz?=
 =?utf-8?B?SHVaVzJ0N1loSWRsSWlENzd5M3lJcEVuWkVpMmxzdXNUTloyOVpJVDhpUWJv?=
 =?utf-8?B?UWNvN21peDd4VTRaNUtXaTAxbndCb05LQkR4VmR5b1BVNVo0U2pOcVZ0c0JZ?=
 =?utf-8?B?cDRiNFFjMkREMWpFNytOaW1DU0tIUlZFNTQ2K0pyM3BkN08wTkhPRUZ6QTdh?=
 =?utf-8?B?SUxzdXRPMUxINE9SL0N2OTIraWp4a0Fzc3IzbVJpVUkwaXppajZsa3FFUTRH?=
 =?utf-8?B?OExpYjQrYlZTMVIzWkVGd3Z0UjNFd3VkQlVLa3loTU1vNHd0VEJGbkcxclpq?=
 =?utf-8?B?cmVXU2sxcHdtVGwxWDVMRnliT3o2aThuVVRzNE9iaS9NTEcwRENMeURENEh1?=
 =?utf-8?B?SmZSZFF0TXgxMXJpSlhhMnZRWVdGaVZnNGozckd3OWNSWTUyaERWOVZWRFVm?=
 =?utf-8?B?SEZXRW9PRlRNZ0paWW5vQXZHZnhKWk5IOVp6R0RJQUFEUzZnZng1OXNuaEFn?=
 =?utf-8?B?NEVYWE1PakFZMGgvSXNvWHR6dklLWTRtZWxaaXV2Q05JTGgvUmdkblBXNFNS?=
 =?utf-8?B?QnZzdDZzSFRWZmcwdmpFSXZpN1pxMmIvcmtmSFowbVNWbE5VdkY5Z0tYQmVa?=
 =?utf-8?B?dUsrZ25nbHFyUTBUTVl5Mjdhd2plNUs3TWdrOWpDY1VuK2hoUTA2Uk9wbEk2?=
 =?utf-8?B?Nm0rOE4vaVJ2dWJHdms2RTZPMUxSbml5eUltbGx4ZG91VjRwSFhrRlM3ZUh2?=
 =?utf-8?B?Ymh0WWlwRFdCWHMvVGw4NjQ5K0U3N1dpSkdOaHhHZ0loVGtIVkw3b1I4YWZt?=
 =?utf-8?B?OFBvZXVaQWprTXlNWVNQODNrc29hTHR0azg5NVBmTUxYOHgySUxrcEtteWR6?=
 =?utf-8?B?YkJJT05PWFdIOTR6bytMcDV2RzBPb3BDM01QZjBFQjlhbndScVBDMno0czNj?=
 =?utf-8?B?SHVxY3hnNEtZQkZYQjB1VTJObzM3NkkrU2ZKZS95bEFZNGtodnVNOUNMaFFZ?=
 =?utf-8?B?RTNGNURXd2xSMHFNeFVYSCtQZWxqUWJNZTl4S0REVWhFSGZ2U3RwOXoxNlJI?=
 =?utf-8?B?cldjdU9VZENFMk1WNGlVdDdrTENSMDVDSlN5bzljTm0zV0VEU29WSDZmTlpV?=
 =?utf-8?B?TjJWbVR4c0U0bnN1WU5nNmNjM1Q0Nms1aXVNQTV3akxyemF1NWszbEdkazNB?=
 =?utf-8?B?dEd4S3U4a2Q2djQ0aHhpb0JSdHdVMWZyVEN3THRHSFVMWXowTUVvRjRsMnkr?=
 =?utf-8?B?ejBUcUk1WE9yYzA4RTY2TndrUzBjeXlWaVo3K3ViMEs2UlZYK2RTejVUbndi?=
 =?utf-8?B?cXdDaW1TL3gzZFZWVm1SZmswaE5FWnpPcEFWdVUxZ1VoaE5kS0FSTEZYaXQv?=
 =?utf-8?B?TmlKcW9uZUV0aCtlWDI0L0thNGRmcXgwWWg4V0hZTDZUVUk2UERsZndvTk5E?=
 =?utf-8?B?VmE1NVpxb0ZoTE92WnhtbWtpS0s3cjlDYUhoVXhNbjFlcWFwbDZuajFyYjMr?=
 =?utf-8?B?UzZzK083NnJQT08ybGVUbE10L1phUXRLUDFRRm1GNHRMTm02TURDelJNcm1k?=
 =?utf-8?B?U0FMcDRhclB4d1VYSExzQ2lWeEt6aVpmVWJ4YXdFVnF6TjFLcWthUDdHWjdi?=
 =?utf-8?B?bmJqVUNYaDB1ZVNkaFNPZDc2MDY0cTVLdGNISHgvZUtPdEthTjMrN3NsclBC?=
 =?utf-8?B?eE81ekt6T3MyK1h6dDBCenY3VTA3OHZBVW5idUdDT2lvNWJVemNydWJ3WlBh?=
 =?utf-8?B?YU96bkhPek1hK2R3RHFscHpUTytNYUo1L1hFWTRlcjYzNm03RUtrL0tCTTN1?=
 =?utf-8?B?U3IwUzdyUERkc3Q3VWVTS0ZwT3c5WDRmTUYzTkVxKzIvbC80V1ZoZjV4OHR3?=
 =?utf-8?B?RkZLMkxDVW1WZ1RTelZPeHpYajQrQmt6YjJmTFNWS1N1Sm1OVXhrU1lwOUdm?=
 =?utf-8?B?bmFqWXNmeUJyelFHY3JnWjlRSjZoZmhjN0llQldRSG02eElxelVuY0RzcnJK?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T0sqls7la84PiHUyWukQo78JeSqLssnvREMMTsagwE7nTXnxSirKCUVpxuCZyS2HJoGwxv8SaxUkc7CsXKOhG0uvttaRxbrb+7Cv/8/KOqOs4o3VVjgxfaR3HeT5Xu64KpGkexJUWTnKuzxiIyI4QN/juhhR6lHR6FwpUvEXBwYa1vQhbdatvAoCtld7FQHwpDn8QbAbF6hbtLezr5+IJEgVsKA2unCBKChFE+Uy6cGFlpOpV3c8FA+45m4cvvGkYtyPnFqCDUMyRKkvpqh2WAgOGWNdXCjG3Kd0Fris5EkWKucQAfPVfNh1tyw+c/Ve0sKEikpjLBAVLZ6Cr6HUZcffWzKmhe/OBsuvljIyuxiZlP3GlJk7+0lhG6OstD5Vu+rlASElYdPgE6237aBKA8Qs0oA4IAGvp4kIHV8vu9GNjCoTFN17EvcjIY0fJkdC1H/DSF362lOneRpr3/gW+Z60nvSy/rrLRO6jEGiG0hM6ICiR9yoU8C/byHIn74NDJPNUeqyHkaKxKISzvF2AanVqKDnTNR+jk1VOwXu3AUF399X6KpqiXbaZM5m+wGMLts6hlsL+c4lxxDthOy2UxlgfduTYO1BHzR/+0uJh46E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c62e0d2-77c5-466a-3e97-08dc1c163a01
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:21:37.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lho+urX81e7nM0p9oTqooo9VyWXMwyRyRC+JMo9t7Irptkb7rPvsayisL+RhFTm+YbKP2tt0sbC4QgC3ku+HUXlo+JtVx7TLCy1Il9Ay9Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6083
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_06,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401230097
X-Proofpoint-GUID: 7aZ0gs1_XtE7u4NxD2Db4NYTGkHo_VGU
X-Proofpoint-ORIG-GUID: 7aZ0gs1_XtE7u4NxD2Db4NYTGkHo_VGU


On 23/01/2024 13:30, Jani Nikula wrote:
> On the other hand, if you're using a virtual environment, what's the
> point in holding back to a version as old as 2.4.4? You might just as
> well go for latest, specifying only the top level dependencies,

Performance... Specifying exact package requirements like 2.4.4 is
useful since 2.4.4 is by far the fastest Sphinx version that builds our
documentation correctly (AFAICT) and build speed matters a lot when the
difference is 10 minutes vs 30 minutes.

> i.e. sphinx and pyyaml. Or you could pip freeze all the requirements at
> a relatively new known good configuration. That's kind of the idea with
> the virtual environment.
> 
> That's really the only two (or three) approaches that make sense to
> me. Using a virtual environment to use ancient versions is just weird.
It makes sense when those ancient versions build our docs just fine and
run MUCH faster too. Here was my proposal, more specifically:

1) requirements.txt : take out all the version constraints so it will
just use the latest versions of everything (unless there are issues with
those) -- this is what I think Akira/Jon/you really want

2) requirements-2.4.4.txt : create this file and add and freeze ALL the
sphinx dependencies at specific versions that make 2.4.4 work --
freezing everything means we should never really need to touch this file
again

3) add a warning when building using slow sphinx versions, perhaps
encouraging people with these slow versions to use
requirements-2.4.4.txt with a virtualenv.

I think this ticks all the boxes:

- No more whack-a-mole (since requirements.txt would have no bounds to
update, and requirements-2.4.4.txt would have everything frozen)

- Doesn't raise the minimum version unnecessarily for people who would
still like to use the older and faster version.


Vegard
