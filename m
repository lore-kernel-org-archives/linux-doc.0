Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509E94BA92
	for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bBxf2cZ/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cwoC2rgy"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40AEe5qm026997;
	Wed, 10 Jan 2024 15:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=fNzhZHM4sX8gubZTLuEfeaIed6uKoflAxuKmbSXre1A=;
 b=bBxf2cZ/2oLEyOH42gajnNFk7O66w2qhVCk+pI5o/mRnLBSH84M78ddPUQWJR1jrrh8f
 mR8kybc59cf/0mlvvZiLeFMnm0abpnuO9BQzi1axclWXCnvFyGLh5Yj3af/QbLxdf9Ca
 zfQo/c0jbisa2fk1iiaY5zuGRb8Od0XnjO2Ag68pqHUTkLqcIn/5gHvAEAtKd4AihRAC
 5sgpPw1xwlago9uPyjqK5caXRiH+Opgm4zgYgsayxCqXi0sOXpqn1LU9YQk7LogWwPr8
 Jo+fLVTsE9vWg9Z+YVVM+mPrwy8Yry/GaxkihK73czNyGOjc15TEfqw4REaTsOXeHs2Q Ew== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vhtkprgjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 15:24:55 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40AEW9q6030351;
	Wed, 10 Jan 2024 15:24:55 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vfutnr9kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 15:24:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEEmR05CGG4+EW3qJw97Zdc3OmEaaHD1y2F+T0IZJJcfAuH5AOIEfyxA/S0Xg+yttfxy0FhvzALnCODsEemX8MLlWzWmaM5uT0q5hRntjczAijW+y7vJ9wooLXRYDAyquO+3vgtJfBkzzfijCDWO/ezrr6wEYeogf63tdG5/2qNVk3Y+fdo+hRqhzE2YL7sPgSFQ7o5S1eNXH/2aUO50pUabojpWUNAc1jGzCPHKxOyhk2zsj8MjnQYiE6iGrWJQzmZxuSY6RWMDg9ViEv3WNDKwluHL7S7AT7NHlgXUT88uf4rP+TWCSJBqJ8Bevn9mbtEiAkM/vk7760ixUXpXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNzhZHM4sX8gubZTLuEfeaIed6uKoflAxuKmbSXre1A=;
 b=VeobaefSg7HbJqZY22QEhoxVZtszjjgzNdnn7ugZSpQSUWpps7dno6dCRBU0S5pet5dIkosCYxePym9U88N6dCrNxNrOexSUpngdAjl4/uz2y1AU+h2MMngBZPaE6gyo6TDTHokEe/LDvmnZ9hirr1YF+HEpjxLm49AsFrzcMiZs3QlFYGuxXc9NHLqbqnHLK8Mo7Om2QTGcep85sJBl1V1XkhD825MGFzzAG8bs/oKpIZQwgFbfOODi+AGU+qtspGkFrJzS5QyyuafR0pN6YlYP0Tgk88w6bNd3/PRGg1cR019YoYFf9wRC8MyLMQ0sk8GaWhLpKkeYyEFpmoyU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNzhZHM4sX8gubZTLuEfeaIed6uKoflAxuKmbSXre1A=;
 b=cwoC2rgyU6OndFEgtqx8SF1Jh3rPDr2UaO++QzkEtzYyba+TrD+g8BcxKLWmHq2OkjiYKoFoLh0CUaks62fVxOhfSf92NNY2hu2f/7Ej2glWdDjjLIhy0/4ZNmghRZ/k1Nuo/u4lyjmoS1Kfi7ooK+9zXh6cz4aWe0DH188likk=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SJ0PR10MB5584.namprd10.prod.outlook.com (2603:10b6:a03:3d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Wed, 10 Jan
 2024 15:24:53 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 15:24:53 +0000
Message-ID: <3e34b18d-71e2-4e42-a6d4-b82933345d51@oracle.com>
Date: Wed, 10 Jan 2024 16:24:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: constrain alabaster package to older
 versions
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org
References: <20240110104646.3647600-1-vegard.nossum@oracle.com>
 <87a5pdqlkt.fsf@meer.lwn.net>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87a5pdqlkt.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::9) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SJ0PR10MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: e624ed5c-eddf-4bbe-d46a-08dc11f04b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kz3SivjeyVS3uxr/b4pE7RvYQDgzp6Kxw+MO462SPf58I4I9xAZL8zj8lgq+Rp/4pp5I45p0YlWXWfb9Qoos63l3EG8HfM1Ndv30ZkMsG+w57CTrFo+suZBKSnhmihZKBlrfro7XheDvpJHr9adC+4cELRJSVid6lbcsPz2wNLmyNUxkrKXfkQJVk+a5RN/ECqZKykooFJ7GWW169tkGZBDGIoRcTHvHzxpqW8a6vjsAcggWAVQKR8x9ZUHbuyswtLzrXa1i7dpLzfRwfpq8mPpJP3Y/82rX2Ns1wgeXhxpZS1fPAw3eTi8m4DaKvVkw7KCc2Es9Q4WMkGm1sbJBJnocNVP8ss4scqiatwGWoEBnH4Hywc6CL/2ThNz+n10xlO/cKAxYmZjEZfsuNd2SIjtV2FTxySZt5uQMyYuJ+NaXskzgQHfsypWH81XRTYByNgd980eyZyB4CumT6PX8ALCB1U+fPP9tC7wdfZ0aad2yFyVkQ1hKeKLgJetGb3osBDqloy/mwTXzIEVNWxL8VoMNqjPBXUTZokqczvIyh8oCU0tnJNMsWbdc21kqAz+EfGtEmhBRW1K3TBoTfu3vj9fBpKPZOsnt7RR2L1nJ7jUpkq66gBtmhy6jEOxdsffo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(2906002)(966005)(6666004)(5660300002)(478600001)(4326008)(44832011)(8936002)(41300700001)(66556008)(316002)(66476007)(66946007)(36756003)(110136005)(6512007)(31696002)(6486002)(6506007)(8676002)(53546011)(2616005)(86362001)(26005)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWJCdVA2UEtqUDN5OUdNSjQ4amhhWkt4Wk84ajBRWTJxdjY5SFg2Q0JQaHhV?=
 =?utf-8?B?bHVuN1dWMlMzQ1JHSDNxMGtucnc2VkVNdzdGNkl3SmVZVnpYdElRQWpPVkY3?=
 =?utf-8?B?d2QrcHpyN3IydDI3eWgvTmNCRURtTWFxRVpaTGI3cHdtSVlNUnprNEl4Yzdu?=
 =?utf-8?B?OXphWFRjRUNkRC8vamhkU1dnR2hUbGVKYjZ5VFhRU0MzR0M4TlBhdFZPVmU0?=
 =?utf-8?B?dGhFYXVMQ0RzRkxVZjVvRjBuVmxUeHFCL3ozK3hHZnh1L2FLUmNRMUNsNjkv?=
 =?utf-8?B?bTJkOWhVQzF1T3pIZE51d2FXbkd4T3RZenhseFozbjZ4d0xIS2syOXA1UnRS?=
 =?utf-8?B?Rmx0NjBsNmNjcmNIV3YzakdVNHliM1dURjQxSFlTV2hiZXh0YmZWZ3cxU1Nz?=
 =?utf-8?B?YUhaV25henB2N2Y3eHZlaEM0NzhUQVM4elQyTWx4UDh1K05TQUJqa3JjTTZF?=
 =?utf-8?B?cTRleG1MaCtOenRvYmZtUVpabGpqTFZjYktYTUdNc2tDS1YvbHo1dVpzSTAw?=
 =?utf-8?B?QzZubnluK3RPbGtrZE52dFlDdTdhSDgyVFR2bTJMZG1aaE9Pcmc1MnpBZ3l0?=
 =?utf-8?B?Ulh5SkJRVU0rcTF2ZW1ZbTh6M3hicVNwcTNHQUJGelFRYlV1N3dKS3dOaTRS?=
 =?utf-8?B?bTNaODRPQWNETzBORnI3d0dPcGFmdHV0T0VRMEU0TkVFU09QL0tYazZtTjYx?=
 =?utf-8?B?U3JEdmQvVWY0eWlkanN1NDlEU09rVlV1eHdNVnhhMkFwTWRud2g5Mk40Mk1C?=
 =?utf-8?B?RHYvdTNZd0NOa3Nwa2kzbXZTQmZFTVVscDQ1MnNFSElpVDN6NTJUOUx6OEZK?=
 =?utf-8?B?WXJMTmU2dEhhRlFNRkV0NFhJUFhWbTk2eDI1Z1VXMDZZOTZOTXg3WGx6MGNX?=
 =?utf-8?B?TmZkREwwMjgyNFFCdEt3RnpGYjBSUEhzT3ZwNGI1VG5qUHl4anVpSGZPOCtZ?=
 =?utf-8?B?L0kzS2VldWhJTzdEZzJkaExWbEtwVkZuNndEQnJ0eWdTNzg4Q1lBWmRsWWh4?=
 =?utf-8?B?VlpJL1BWU01vOEs4MTNRTmluUzJreWliQnlabHVzSk1LdTdkbXluUWdEMUNF?=
 =?utf-8?B?YUdwREJCRW1Cdm1zU2Erd1Q0enZnZ0RYdEdtZXNDL0ZRY0JmZm5PVXVsY0NM?=
 =?utf-8?B?SDNuL2VhNmtCbHRMajZONHdtN25xNnh4d1FCNjFXeXFveE9tR1pJYjRXOXJG?=
 =?utf-8?B?R1gvbFF4UzN6MVZNUmM1NVo0MXp1M09oeTRYV3ExTmJQdkFVVHBDZlNnQXVW?=
 =?utf-8?B?WXMvYnhyRTBWemtSVzlLNDk5RjNMNDIxWS9ONWhnN3gwcUFaRUZjWlMxaDdr?=
 =?utf-8?B?eHVSaGNVaW1jQU5hb2lmRTFjK1hRQTFBVnhHanIrNVN0VnJSaGUrSzYyTExS?=
 =?utf-8?B?bFE1T0lTay9HYWVDWCthUEl2a2NnRG9jeHhDckxSeER3MnVHdEhKZXN6WGJr?=
 =?utf-8?B?M2YzaDdCV3Btb1dseXN5cGFmc2wyU2RJNDMzRHhnRWJncTlpWE5XRTdFU05w?=
 =?utf-8?B?bE5qUEFZSTVPTWJLQ2V2WkFUYkdwLzMwVXgzN0wzU3UzSU1sV2lPSi9CQ0hX?=
 =?utf-8?B?bDhFTlFFaGFsSjBZNVMzbE10NlNCM3k0em9GN3BKOERTcFpQbmhtcVdQTjZE?=
 =?utf-8?B?bDdaTDVvUzN4azNUeERvakd3MTRHNlNHRVFNS3AycnRFYnFKTnFtZUFLTDA5?=
 =?utf-8?B?aHArVlE0UjdhOGFjYnE5aWU1VlJoMEgyS0JiSGhzS0hvNVNZblBvN2ZEcFRX?=
 =?utf-8?B?YTBCeUxqTDcvMk1OcUhiUlBoUVBWeXBkYk1iRW1OVllNNlNsZXRDRGNTS0tk?=
 =?utf-8?B?STBXd0RlQktlcVhGVHpRV01xaUJoOEhHdEl4OGorM1h1bWxaRVA5MXd1NDRG?=
 =?utf-8?B?M01OUEUrQzdtYmtFTGlJRDVjaVdOZFRMM0swZS9Ka201Q1hKTFdpL2orb3JE?=
 =?utf-8?B?OHdma3ZpTTY4ZXU2U2ZxK2dnM3BUbmtNQlh1NU44ZGJ6ZjAxek5zcFp5UUNn?=
 =?utf-8?B?c2p1TzhGUEZZWDJ2UUllK0xnSUdBejFJbnN4cmFDekUvd2l1bXBJSUo0S2VH?=
 =?utf-8?B?RVZJUjFkS0xKMXRBcEZ6OGRJcTNIL2ZjYS9aVm9raU91eTBxWEVFanhwT2hr?=
 =?utf-8?B?ZGVuNjh0WjIrYmJtTzQwOVF3aUF0a3dvUDh6TmZieHpCZ05sYzRLdDZYOC9E?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	20xklkOkTK4EYOil/TIOmWndrDSkZOBb1CIGHLqq+D2L90MrQj09Z1u46tFdVwfnqomDyUTtU9enhLNLj3hsDSJCm1MZWLzgfBv3adPrZkhJ8Ylh0sMgrkcocBBa1hsl/FIthILPQXTFqFj0ZploAgc1CZD0FN3gX4d0/gEIYPy1bkbTiTL+MrEUxixZ+QEQ95PorHoekPfqbS6esAhwQT+Ry9DKbd3Xo+T+pffEHUlYfrhaveTIz7EzhqOBcRIgJFezeHbPSuICbAqEQ5sQkj9JdeTdg+lte/wS9HiGNdReTZW+s3UcBq+D8a1r/b4T45Irlhw/F+Bx6zGFY86lTUiyTvhN9amyrCi7bc/HLkb/tCqdVmNbcGZD59qDdkcueKGK1c/t2C6CvCazFQYQAPAGyWMVpRFptdc/IS+ko03I068O4ya2Te40p2zA+zDZBZh8ARr27JY5p4+iudgGb1pbu8lbIOqGrXCtbEIL1bD7Ud2aCmg3MF1cmDxlQnQOSWwescXkJG4+1sEPK/o/tTnzEUVEG0PYTZ1oUTMEKSo33QzA5KEs8u+lIihVzIDg71FssUfQmyXQHpyQmadwfJPCGz8NfhbUp8H2bdxyKgY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e624ed5c-eddf-4bbe-d46a-08dc11f04b30
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 15:24:53.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMbKboM4eEmTpNDeM+ee98FHQoJQ6Rrqm731G2iQvh1YupmUHfOSavNco//eRVyZBvOjRfIIljD6BmkQCcZKd0ysqHT5u4fPH6gOuI+QjWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-10_07,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401100125
X-Proofpoint-ORIG-GUID: kxtLJon97SybQ0veQv91eifaFVG87WgI
X-Proofpoint-GUID: kxtLJon97SybQ0veQv91eifaFVG87WgI


On 10/01/2024 16:01, Jonathan Corbet wrote:
> Vegard Nossum <vegard.nossum@oracle.com> writes:
> 
>> The 'alabaster' theme dropped support for Sphinx < v3.4:
>>
>>      0.7.14 – 2024-01-08
>>
>>      * Dropped support for Python 3.8 and earlier.
>>      * Dropped support for Sphinx 3.3 and earlier.
>>      [...]
>>
>> (Source: https://alabaster.readthedocs.io/en/latest/changelog.html)
>>
>> This manifests as an error when running 'make htmldocs' in a virtualenv
>> constructed from Documentation/sphinx/requirements.txt:
>>
>>      Sphinx version error:
>>      The alabaster extension used by this project needs at least Sphinx v3.4; it therefore cannot be built with this version.
>>
>> Raising the Sphinx version is not really a good option at this point,
>> since 3.x through 6.x have horrible performance regressions (7.x still
>> does, but not quite as bad).
>>
>> Instead, constrain the 'alabaster' package to versions that still support
>> Sphinx 2.4.4.
>>
>> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
>> ---
>>   Documentation/sphinx/requirements.txt | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> So this is a little strange, actually.  Alabaster is bundled with
> Sphinx, so there should always be a version that works; I'm not sure why
> we have it separately in the requirements.txt file (which is
> discouraging, given that I probably put it there).
> 
> I'll try to look at this (but not right away); do you have any sense for
> whether things work properly if that line is just taken out?

There is no existing "alabaster" line there -- I'm adding it in with
this patch.

The "alabaster" theme isn't exactly bundled with sphinx per se, it's a
separate package that is depended on by sphinx. So normally when you
install sphinx, it also installs the alabaster package.

Sphinx has this in its pyproject.toml (and has had it since v1.3):

   alabaster>=0.7,<0.8

The problem is that when you install sphinx, it by default gets the most
recent version of alabaster it can find (constrained by the <0.8 above),
which as of two days ago is 0.7.16 -- and is incompatible with Sphinx <=
3.3.

We can fix that by constraining it ourselves to the version before they
dropped Sphinx 3.3 support.

Feel free to amend the changelog if any of that makes it clearer...


Vegard
