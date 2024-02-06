Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342A1DA3F
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707223118; cv=fail; b=f8lbaWNyK8EoRnvwE0hPG/U/ShYRIrh5gFYi2twSageFpsvyvc6uXNDXj5Vi9lWk31hPnJ4daQf0ioLB91dlbMPaFA5jsdqc3QMO2UPvnYrs5TJgtH1RZ1mtLexfcg9mgYvkR+RD+bHIVC3QBgI384vRsdPJlZggb5yBnmhgIOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707223118; c=relaxed/simple;
	bh=ZuFF8NKEsScxV11AI9iH0MINNVDInBDqlR+j1TFo7kw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AjWEpHvtlrI6ejZFS2ZprQRs+ZG1ySVUyXtcETLpSIG+ya+RSBimrPV4Vi167cGJcYllwZS54ffhHrkT0iOBKLXKg8FGjgKPbXz5/h+GSwG6zQWRTY7fbZKhlu/kGTLqj+HL5BldkcfaAzTN0mYtFckbPbhKhXpMeGiEV+UPIR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Uq2IYaCq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WVexQ4xi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Uq2IYaCq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WVexQ4xi"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 416AdY9M031611;
	Tue, 6 Feb 2024 12:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=esoQOXcnHwhHbrXiOCn473CIH5gV5KTKH8SuiKgU51g=;
 b=Uq2IYaCq0m1ujF/TtHBAJIuIXtFy8JuYxPCxmEjrTVwdODOL54YNTpLaExaLvZLyS5E5
 3Aw45nSjNUcLi+mmFkwPHhzuemC7UMRR2VuCk8I8dwe7u5+7mKQYlagYhqyC/qjJuYmA
 Z2HPsCj2nLT9A+qjV7E3OlRQn6Fs92TExg4FV7LHgDY7PNl33YZLSkdMhLfgV1IVHYfT
 H1clyUvhtBpYXlkP7xqw9JP3tSKdSJatx5dfT95mRGmxj6McYhnkLHOddXObqluwxiQm
 E6i7Lpi8cXgbO/AqpPbr1w57YxicjEmt3BuifTzcVoORvn/44rku53JpyPo0I/FggphB 7Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1dcbejnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 12:38:31 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 416B9MvY038407;
	Tue, 6 Feb 2024 12:38:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx78bd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 12:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZg4/yVoO47bbxK1zlvEwEBwsZQpd4XNjyvdP0m3YGC9cO/a6ph4TE1dT3ma36uWGlmEkcJ1zeg5iFQxYh9DOfZGjJl3+kB6V4k14/hMOcSQfDpq72nfSxpdiY+hYf7FUq+5REYAnUKYT+00mcewCAEmVs3GsaQaQfhVfTpcc3vgLQbAfsbryeqH9Sxx69rg/fLEqzw16lb6PDrQF/ZGyO9kT6TmKNWOmHLTE6ahmNH9V43Tdk63rdiTFbkzKiQXIc2qTIOjuNZG3011be+CpPloh1ubKEl7nYQT7Ys5oLK/zEx+N4YMuZ73j+upxbzP7wUmnlirwpg1BUHAtduauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esoQOXcnHwhHbrXiOCn473CIH5gV5KTKH8SuiKgU51g=;
 b=Q376bAO1VZD5vcaUKW7TUFNaNzxDazBaaN1YVZfnl0bSjqk8YWvoWiV8kdqkjyDmadVkLNds0ZN3wrks/BYj3+SW8AoclOiZqXAakDPEczqoA9sv6N65J2Nv0jWDALIhtdEshXDjdOVEZAtqYXUMQiaArrccR6anBMeLlgeBjPYNl85WNtLzvdPdJ1TkR0JK4wYhDYXQZuFzPvs243gD6FyHek0jO2B6m7H6Z0LZnAMyBF+dXuYLbHsLDNdt3WSBWhBWE/qW5ArSLvPWEhvfW4zSJBgSBRT5asdB3mMhHB3s8zD/b1kW5abMS95nZiGS0Q3FpAB5WXDKa5Cx/HFv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esoQOXcnHwhHbrXiOCn473CIH5gV5KTKH8SuiKgU51g=;
 b=WVexQ4xit1t2gMTC/uSEo7kggXIRVq0qhj5Jm3ZlaIPe6o/IRxSL33MHs3w7NXWIzAa+UIFs/a9KZguMZpBIxxmZkbrZR4mfYRufaXLwWEAebSGlwLDaG+RbjCid+SSpBrlYMPFzoujbfQ81lDS8mRZtR02w/sN3eN8wZ/aBa04=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CH2PR10MB4230.namprd10.prod.outlook.com (2603:10b6:610:a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Tue, 6 Feb
 2024 12:38:12 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 12:38:12 +0000
Message-ID: <3fce153d-37c5-4c4d-a4b3-44e376daa095@oracle.com>
Date: Tue, 6 Feb 2024 13:38:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] doc: kernel_feat.py: convert to sphinx.util.logging
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
        linux-doc@vger.kernel.org
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
 <20240205175133.774271-5-vegard.nossum@oracle.com>
 <20240206054221.429b1fd4@coco.lan>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <20240206054221.429b1fd4@coco.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0287.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::15) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|CH2PR10MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: a22293b7-ff9d-4436-3ee7-08dc27107b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VTJ5fbcp2n4s1VjBpH8dh9YzJr9Wb8UBJ2OuTLrMUkLf1L1IHAxlYb8TvWG0+iJ4q7+iz33jl31NAcbRpXjTPIdNcVEvJd/YsZD/RXiAF8ZPMocgYXZA7PLjRjtnmtuuc/lWuJ0puzUvwaFP5iwcQqDss+eYn3r/4aEcNv3FHiXLn/Ai1ncy0xV1VJOErTUQLW56FbgQw5XDWAJmL3a0ozfzvnbWdzQOvBLzeXS9GMubaykt/XLV0Z2KvJcBtPC8X/oK9J/vYsUqaCOq2y0gkiJAYRU9cKLK4KaV9XAxbarjxRaaE4DxH2IPR84SJyDpqc+uyN6CSq7McxMR2ITwYrX4ignehiTLm7jrx6/dL69x8v9gIz/PPSdNiNINok9QHxEYRfnmRTroYVwVPJbR9d+F2VuIm6ruwehOKWk9BnqQVkX6ejTQsW2zaSlhbrtqf2RdABezsfazOeBBPPfAQ9rlTuHi/8d4e8Evv2bv3/t5I5C6G6hM3EVc8DVptsmbbWVWRXLdVp++ohVxCCLYKHNFUXgi/fc7QfgE8VpwA8o9kuUgwFkpgFDnZDxo1cGfML68ky2A/aZ5gW34jXha1EP6N1vhr3wvrg2KLxZVQkuCVa0L9Ys3bmG8sMXDl8SjNSeNtlMgNzqsNaT7TzD5MA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66556008)(41300700001)(44832011)(4326008)(5660300002)(8936002)(8676002)(86362001)(31696002)(2906002)(66476007)(83380400001)(478600001)(6916009)(316002)(54906003)(38100700002)(6486002)(36756003)(6666004)(66946007)(6506007)(6512007)(53546011)(2616005)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0tLVVBxOENJTE5aUkFjTVk5RnlEaWMvZkNzNnN1elFwa3ltOWxFZmd4QUlZ?=
 =?utf-8?B?RGRuczQxa1ZsWTZ3blIrdU1haGNBb0RhbExxRlRIVk8vd3VHQm9wTk5vem9Z?=
 =?utf-8?B?SGx1RmZUTmhsMTlqMnFFbWlMR0xsVC8xa3dWa3k1UGdFcnp0WTJiSVdrUlp1?=
 =?utf-8?B?RU91NTRzY21QRXYzSFRuZmpvOWhXR0FMSkNTT2RMTm9ocnlLeGRQYjd2c1N5?=
 =?utf-8?B?anc5YTVJNUVHcGNxSnRUUjk5NnUyTjZnZFF6QlFZRkFSYjF6VVo2MVlJc3Fu?=
 =?utf-8?B?V2poREh0OXJIdkp0TEF2Y1h0MmF1by9iWDY3akxNRE1YbTI3VnVVYVpyOEhj?=
 =?utf-8?B?WjBKU3R1cWZiaVpFdUVJb1d2OXVuNXl5MmZvenZGTXpkbFBaQXBPV1lNWnpF?=
 =?utf-8?B?VDMyUzZKZkZCS0EzY090TitrQjBRR1FnYlRqdDBualAxL3pIOEF5cmpRRU0r?=
 =?utf-8?B?YVdNTmR0NmRwRE5tUmJwRXJZKzVySS9tRzR6TGEyVXZyZkZIQVdkZ3RSZVRH?=
 =?utf-8?B?RmdVWUpVQms1NVJMU3lYeEd5RHQ4NWtrN1ZPOFNqV1pzNHo4eWx4bHVsaWlT?=
 =?utf-8?B?OHNGdFhVMk9sOGE5bW1jdFJwcXBneDUyZUJpME9iRThvNDBPbDFJWGtscUFG?=
 =?utf-8?B?UVF6S2NvU2txa1YwdmMwS2N0cmJLTDNWelZHd1NDL05Xd3VEUXFmRGFodVdJ?=
 =?utf-8?B?ZmF3UlNqaWwrSXgraXFtUzB6bnBkR0QvK3pMV2k4aHdKZ3dUaVJib3JKMC90?=
 =?utf-8?B?NHp2bzRUdkxxcUZYU0dBWm95dzJWV1JjUGsrem9PYkVQTFZZbUhRUFZOWGF4?=
 =?utf-8?B?ZkNPQzU0Nzk2eVJIdlJvbkVhTmlyM2NUajJZblJCVXlmWUtRZUVXVk9HRjFK?=
 =?utf-8?B?OWdkVlpDZEkwNGJiaTBkWHNncHpFZWlwUmJZTENLU0RSd0ZyeVFWbGh0L0cx?=
 =?utf-8?B?aVd4V09TZFRIZDJUdlhWOFBRTE50TkdNSTdqUkRUdWZ3L3FRd0ZFb0xyVUw4?=
 =?utf-8?B?c2F2cVFzTm42bmpxK2NFcWFXcGI1Q1ZkWmlpeVRmMkVoTXFZdjhTWXFwbUdI?=
 =?utf-8?B?OFgyZlQyU20vTS8xQm84T1J4MEw5TFJpUkFqdmhZNnJQUGNSdWJaQTNlVVBa?=
 =?utf-8?B?Y2Z4d01OcllNQWNXQW5aTmkyaS85R0d5SUQvZ1p6cDRtTk9aVDNnTXVhUjBJ?=
 =?utf-8?B?cER3bWM1Nm9tMjN6WkNHK1QrcnU4b2ZucnBPNEdPRXBZYzYwVGpCeGpnYVpq?=
 =?utf-8?B?WWx0MWZCQU9HUVZ4L1ozNHd3WUdIaGd2Ym5CNCs4RlBURTNBME9QTU1JRlNU?=
 =?utf-8?B?clA3dzBpbnUvRXFVejB6NHpmdGZpN1ZpT242bGtzNEIzYmhGQ3I4VEV6Z0l4?=
 =?utf-8?B?Z1piS0p4OHpnUElhdTltNzNVdkF0NjlGcUhFcldYd0xhZ3NHcnBuOHZRRS9H?=
 =?utf-8?B?V3c5MWduWHR0NktWNGVuSWoxSUFLTlV2eXVhUlE3dmMvcCt2RzEzQU5YZzM3?=
 =?utf-8?B?NVZSdVB5cXZHU2liVm1XMG9COVd6V3RmUDVsS3ViWW5QSm5pbSt3WGJyVWRs?=
 =?utf-8?B?bkV5V1lWY3B0TlRpWWwrQWFzeXdKQW5pL2xYa2dDZlB5NW9tMjBMZlNhMi9x?=
 =?utf-8?B?Z3BoZ2YwR2libVVzRzZSMDBGMjROZWR5eWt6M2wwR0RiQ2U5Q1dpbEZSVHRO?=
 =?utf-8?B?QlhSdlFDcXhvb3YwejNLN1Bud3RsOTZDU1dIYjZKR0ZQeVdLUHFwWktyekhk?=
 =?utf-8?B?cGxyMXFoZnd1Y1BoWnNhOFVvTEtiOHZMOUExWkxkOUZQWFhnMDJ0SEFReXg4?=
 =?utf-8?B?UUtKUlpYMHprTFlVRzgrR01YY1liUnN3UkMyWGZVUS9jL3ZvMkNaK0l2T3E2?=
 =?utf-8?B?c1JZRG8rc0xvQmJGRVdFalkxallqcDEzdXJnOE9HVU1WMlEyK0dvU29vQWJw?=
 =?utf-8?B?WHRRSkZjdFo4SXpqRFE5S1FOcWErNHJiK2VHNG5GZWFEcGtHTGxaRnVXSjla?=
 =?utf-8?B?M3REMStTZGFEaWkvNXlvY2lRdXVCTkRZbEdDeWVGTXp2LzY2REJRRm9xSjAx?=
 =?utf-8?B?anFUVTE1RFdUY3pVWWwyY1hFZ0Jmc2RKWEpNOGNuOTlaYTVLRzZlV0d6OWJB?=
 =?utf-8?B?Zk9aQlJPZ1dwZ08rdmdpLzhkdDQ1QVBCTktLNTMydk5Hb29yMTNqUmlKalpw?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wMK3+WYamn74i9VwT8tJq1L6k8yL8A1jZcCg2coFgEAr7r9YMNbLs3bLVKnaSldlgqP5Re41ih7dcUhOA3cMn69UXT9fHwUOvz9C6scJsAeMnWw3UKBt9hn9bUKiRlYtSDggalFUqXiwbNsDe6KIi7DW/lngGNCagSPimjd4X8w3PssV9Ubhy6rCxwBg7slTaOQo8OI/32SyYd+weFbN7EB0EoqB3rVjVW8WvuqQjG/ns5Jm3FRQXTfDCR08+VYT5UcK8fZ01T65/C2BQn5oRDkUWBvLvjeiZ10h8jPL+AhTKICiPCtY24dHsJpMIUrBH3eeH5mFziFTJ4crc+QdmlMu5aSslg9xdXik7PewauFVFl3JhU6GKbaiCp66lDztJ3M5Rz1dKw9Y2PJCgfOFzY11+ieco+8acGG010oLrxJl23oHg9yZHiiWqBkABgvPX52aieEPgp2VLNjrzgFRMF8qFzrzxeTkqc3UqJsLbBSL2usY8OX+Py2YgdQNV0yoRApAiD+eSucDTdk3szPv5o7prNLLI8ExXTi4CBuRibdPitI5DGaqFnf5EB0g3F2phy0nxarrg1MW5pO8kZIrpfb8m08N/7Lyxdipzb6i9z0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22293b7-ff9d-4436-3ee7-08dc27107b2f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 12:38:12.1861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFIopWa4HP8o3Gf9SMcUekRwofQA8BPbll/qfXz7ptuSLh9kdNMyXDxXKiexyb/cUahEIMLgXirjdUt46xhn90ftYTsjUsCsbWrFxGTXXFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 mlxlogscore=843 phishscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402060089
X-Proofpoint-GUID: 9mdU8aqFgJ-0zMLHNQQDaKHVyNY6tDjQ
X-Proofpoint-ORIG-GUID: 9mdU8aqFgJ-0zMLHNQQDaKHVyNY6tDjQ


On 06/02/2024 05:42, Mauro Carvalho Chehab wrote:
> Em Mon,  5 Feb 2024 18:51:29 +0100
> Vegard Nossum <vegard.nossum@oracle.com> escreveu:
>> @@ -67,12 +70,6 @@ class KernelFeat(Directive):
>>           "debug"     : directives.flag
>>       }
>>   
>> -    def warn(self, message, **replace):
>> -        replace["fname"]   = self.state.document.current_source
>> -        replace["line_no"] = replace.get("line_no", self.lineno)
>> -        message = ("%(fname)s:%(line_no)s: [kernel-feat WARN] : " + message) % replace
>> -        self.state.document.settings.env.app.warn(message, prefix="")
>> -
> 
> That doesn't sound right.
> 
> If you remove the logic which gets the actual file name and line where
> the error/warning have occurred, how are you handing now the special
> output with such data produced by get_abi.pl to return the real file
> name/line number where the error occurred?
> 
> Had you test changing an ABI file to cause a Sphinx warning and
> ensured that the produced warning will report the actual location
> of the warning, instead of shooting the messenger?

Sorry, I should have described this change better.

I don't think this warn() method is called at all from anywhere --
removing it here was meant as pure cleanup.

Maybe I don't understand the mechanism, though. Is this called
indirectly somewhere through Sphinx? I see there's a warning() method in
the Directive class, but this is self.warn() we're talking about.

(BTW, this is in kernel_feat.py -- not kernel_abi.py.)

If I add some bad syntax (like :doc:`) to one of the
Documentation/features/ descriptions, I get a warning like this:

/home/vegard/linux/Documentation/arch/m68k/features.rst:23: WARNING: 
Inline interpreted text or phrase reference start-string without end-string.

I've verified that this does not change with this patch; kernel_feat.py
has always reported source warnings in this way; self.warn() has been
unused since the extension was added, as far as I can tell.

(kernel_abi.py is a different story, it attempts to report the correct
source lines, but I'm not convinced that it works properly either.
Tackling both scripts to generate correct warnings is next on my TODO,
but out of scope for this series.)


Vegard
