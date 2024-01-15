Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195818645
	for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 20:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VGyDE7Fa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j4T90Zmj"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40FEZwia007090;
	Mon, 15 Jan 2024 20:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=12NIi1pQ6qepH8kBFoAmvRh3vzZpVfI97ExGeYmIkis=;
 b=VGyDE7Faoqrqz6lm1mS8Fwcgz2tXF36DHpOg+v2dkolgFJQl3C37pqYSY7LQOYCx6MUI
 11xC1ocVz+tz4fnvSp0nnSGki3clsklDzxceHZz9Z7y/sV/q2HTlmytxtLNmAQajNf0x
 P8Cfwtw3qXquHvSIEj2rY0hPtJB/fKVvStH7V/EbVSOgVKxtrKIqFjeKjuLTN+Uzvyp/
 JBd71EQ++gKifT4XxhAivqAzOD4aeEllc44GJfFn+PeH3vfIgVg/sWNz+CNqUchlDSE5
 jeDrrUFXYTyPZHAF6Oun0rSagTUKYr+LXhTDRSQOgqES9okNvUZ40AG0NGj0qrN+Wgmz fA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vkjb9u4b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jan 2024 20:35:35 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40FKS7L1009526;
	Mon, 15 Jan 2024 20:35:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vkgy6m3a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jan 2024 20:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUQ/WoH1tMus70yxOeRtEN///k1t583UvPRLQHd6Yd58rwkvJZuESDBCHCS+TGYmM+/1dCWJwA7juHDPnZWJeGgpd/LPkgUsY/b2t0usH65YSd+wEZRUInBID3js1tohjHT2ffR1qOp0stejVjux95zFu6Ph3VCgPkxc6AxsMe0+LZifFTa2PyTexpP1j/tbHX59w7TUTqlZ3Emdky2eUlzv/H4pgOsyq/Occ2VEAOwUrXhoT39ApNRc7KY9LD2Cck1eYmQkRdv6C7M1mvjCaN5Yn1stO6+B6f4N8Km1GHH14XQBtpgxhX9Vri1n2uRGaFe/c6ihHJyoeSAzMBa7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12NIi1pQ6qepH8kBFoAmvRh3vzZpVfI97ExGeYmIkis=;
 b=eSYmrB77ktxL86E+9RrXwXDWvyg3yIZEPBEwsL2TCYQhoIii+eGEOz6WWQ/Hyr5dmm+qofxl5k4MMiqtyF/Y3KJ6CICmibf5bWJG93FTOXcziihardGPLSpXVxiue2GEJtsOMwCgRT0az6NR2Fm7bdQEUiAv7ddct0yr5hEvHg4oAZLIvtilYF0MqxFEqXCR5oC5IuTKNavOaudKQHgZ9E4fgAMkd1WgtWhEyn06d1TFbDPbntfibR7BFt0g94jijMElQnb0RbD40BB/yFyMwSw+GtZn2izTzjXzp6Ewpwrcz3ZZYTyXoD+GNgolqJHjFkjT0uJZvM1o3la4AfAp8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12NIi1pQ6qepH8kBFoAmvRh3vzZpVfI97ExGeYmIkis=;
 b=j4T90ZmjBcVP6xLhv2ctK4nfCSXYZvyD/G8GGi4VH3Fq58aPnr/qha8mxzHJCux4pkN8BIhpEu1b/ulRRCwSS+MDLRvpx1Zj8TRt9L3lGuMOrQGnBZDY1wNy1XGr8jXZTvxVVzVfXS2Qz3avXsxM1TpiKBc9Hu77GKQ+LWGcdzE=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by IA1PR10MB6736.namprd10.prod.outlook.com (2603:10b6:208:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Mon, 15 Jan
 2024 20:35:32 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 20:35:32 +0000
Message-ID: <bcbc9b18-f032-494e-ad80-465580906276@oracle.com>
Date: Mon, 15 Jan 2024 21:35:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Help required - kernel-doc, code block and backslash
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        linux-doc@vger.kernel.org
References: <87y1cqbg01.fsf@somnus> <87ttnee69t.fsf@meer.lwn.net>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87ttnee69t.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::16) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|IA1PR10MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f04fd81-5270-4fdc-0506-08dc160984e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IPdDXCBMsgy2usaSuKp72ML+XtS+FyA6gSxPcEcSayu+jBL4YjehcBHuR7y+O5/AaPZcAtX7eJNwBm64+6srxRSHfxDVpJ4siN+a5Xp5OdMejyH8O4fzygoyLqFlf+DNVkPW2I9Uxc46dFDLgAp+XBAwGB4nud9hSHDKwhHS3WoLQ9hzvi/4+4wjTBD0qBi/WNz1WhlJ9XIgjBB4yYlgPm/dY3JPthVOlm9pbdV5nzVjHYOciyH5F2dNSsT6hEZI3Yq942UonwdFFCjN9e8rYRRn1qxf8ThAoXFqFtfA7lIke3Jd/n3h9PKO9nytbgJdDvgCvIJvACG64ukLOIpT1gw0St4mwKG81GSXkQqxEZQpsVy4DAHUwiooDO0xIP9i5VvKCUYSh6jzrg/f/fd2dU8NDpRIGTjIpXnk1TcuFRw3++6JASqM6nwPEWJtRZ8FN+I1rSWdcOh9O9vKbtFxEU/qcVrF2YQeUu8OQmTuKUuswimNj4dATw5BekMDdQFXjRtZjQl7lf2u+8e5L5t97QdzUA2oThNeAdYaE9TWEzb7t95L5kEiQkfCHcYtMp738cxXHyznMalx1BUBQMl3uvXE0OMUU0xX1YDVhZvcwSbw4tqyBYwBEI3CAOQZLMIoUX3pX43UBCprDkd4uB37KQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(2906002)(6666004)(5660300002)(6512007)(478600001)(4744005)(31696002)(53546011)(44832011)(36756003)(8936002)(110136005)(316002)(6486002)(66476007)(66556008)(86362001)(41300700001)(2616005)(6506007)(8676002)(38100700002)(66946007)(83380400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUozZmxLNVpsYkIxeVUrK01RRWdlb2g2aG5MclV0OTVzUzBTeW1tSE5wdnlR?=
 =?utf-8?B?ekJEMlpydlkyNEtQYUYrS3R5UWlkS1JoVk9reCs5ZFh1ZUJzeFZESDNZMG9M?=
 =?utf-8?B?OVBmYkwyYnJnVDQwZ3EvZGYvSm5Rc2MrVkFsdFJaY2VFazdzNEZROXRTM2Fy?=
 =?utf-8?B?OC9iMDNDb256NFZvUGpTM1FVUnJGVkVjMDNOUUM4SDE5cVNLaXlUejM1S1Iw?=
 =?utf-8?B?V0NqMHVOZVBSRi9oaW9TMDYxUFlGSVFrUDVxNnVONldBVzVRTENZaFZleUNK?=
 =?utf-8?B?cFduQWFmTlRRQzFsTDUyV212c2tWK01iVlZ4eFQ0VjU1U0hvMEkvRHp5WlBk?=
 =?utf-8?B?dlZ6cE5wSnhmYm9vbC9RbWdJTkVSblgySzhJRnA2SGNJZk1sVmtqbjgzVU5Y?=
 =?utf-8?B?dlVCSjZ0UUtINXB1NURFc0ZxWkF6QjRnUnZpWVAzYlhuK3hRaVNpeDljcU04?=
 =?utf-8?B?Nm5nNHV0T1RYOEk0VWIxSXExYzF4WDd0dk51cFhQMnlZNmdHdHl3VlBRQWM2?=
 =?utf-8?B?KzhFUDh4WXZQdHZsZDRwZzdFUitNK0ZNVUdFdjBITm1XTFZGeHRSTXdrb0ow?=
 =?utf-8?B?WE5id1M5eUZIdDRZSTdJSUhrZUhqNVNFUCtrNjk2YU12YXh6a1JXcHhLQllv?=
 =?utf-8?B?SmpTcUZVeFluRXVTWGRTbTBvYUIxc1hXNXJBajk4S3U1RGZqeXNTYkl0OTIw?=
 =?utf-8?B?ZVZPMExZWis2Vy94bVlncWplcFZiMys0NEh6YWE0eGpTd2FkKzBUNVNMdXlS?=
 =?utf-8?B?WWpHczZlMWdvdXRkR0RBbDNzWVptdWJYWnNvWkxyRVlPdTBUK3FPcW9WSWxW?=
 =?utf-8?B?Q1V2RXVqWnU1VnFEY084SnBzL0dlb0poanc3aHIwZU5jY1FrNUdqT3FhNGto?=
 =?utf-8?B?bitYWnNhOEVWM0FxUGQvQUNsb1NqZ1hmZml0ajhSdFBzOUJRVGpHbVc0eWth?=
 =?utf-8?B?YjVoT0ZDZDhCTkxvbUdOVzQvazFFVmFPSTRtRUFXc2g4SzNGb2xVamZydGZt?=
 =?utf-8?B?QXNxRERncHgySnNFNmdNemJNbmNjSEJka3B2RUZjb1YvaWduTEJMK0tIQnpC?=
 =?utf-8?B?UDluTk9oUWtPS0VIS1pzRkNYUE5pVWEzckhPVFFEQWhlRVU3M3BJYmNZRFps?=
 =?utf-8?B?T0VOUTVobHdoaytsakZtOGRxcVdkR1hMQ3ZKNDRiNmZZTFh0WmFMR1R3UEww?=
 =?utf-8?B?cUhXRyt3RHFURjRGc0lBSVZ6WjlJNVVVL0E3SnFpVEtZRlkzamIzRkc4SWov?=
 =?utf-8?B?Uk85NzZjZURkamxERXdjakhuZ3VDV2srekhlaUtGRDBSTVVGWkppYTNJOEFS?=
 =?utf-8?B?S2xselI0S2F6bjlSMzQvL0NTNE82K2NXZlUrNGo0bjlvSnE5NzI2OHFVb2dX?=
 =?utf-8?B?VTJNUlVjUm0wVWJMQTJidGEzay9XMFBFd2ZZd05sZFp0d3JTL3hneXd3a0Yz?=
 =?utf-8?B?ZlZwQ2d6RXFmQS80cFdlVVBISC80U3dWRTQzUTVta0lFVUxYSCszOVJ0MGZQ?=
 =?utf-8?B?WWQ0K2ZvL0F2Y3NXWXQ0V2dIUWRoRGU0b2ZXSVV3K0FMdm1Na2VZQ2cvdHEw?=
 =?utf-8?B?RDBFNDBlN1hWQUoza0theGJRVEx1L0FZaTlGMndJRm52M0duMm43cWVPblg3?=
 =?utf-8?B?aUkyd1RqM0V5RTM2OXV3Zk9vd3ErM2ZPb05hV0hOem1vRTduYVgybk9xNW93?=
 =?utf-8?B?ZkExUFY5M2hKcTBjZXY1YU52VExMWU9OdHRHUXpaM1MwNzNBQ2I1djBKOGVh?=
 =?utf-8?B?NGxQZnBnN2c5Y3NCZnp3K2l0ZDlMdkJ1RUpJWE93c1JCQmxacEpWRGllUUtr?=
 =?utf-8?B?K0VxZlo4TnJoZjJjZStKTXRnd1JtTmRXdUdSYmJJbkc0R25LQ2VHc2s4Q21s?=
 =?utf-8?B?a1BqQzRoaEVqRHJxbnFtanNKZjJROThCc3pCS1RNM0RRaGFsNk5Ga1VtRmNz?=
 =?utf-8?B?VlNjRCticW1SK3dNMVNDOXBVdVR0MEFRWkl4ZGpxM1NMNDd4L3ROR1ZwZXZH?=
 =?utf-8?B?NnVHS0x0dnAvakRaMFFtbDZYVnhmOXdKb0FYOGMwL3lsUXhlaXF6c3JmNkdp?=
 =?utf-8?B?c2Zpc2FIK1Bjd1ZPek02REcxSFRXWUJIcWs1RFFCVmZTbk5Vb2N0bjh6ak5F?=
 =?utf-8?B?elZNbEhnTVlkejc0SVBFWVQyVEZGL05jeXBtaHBsNnB5bk1HdmR3UkJockpJ?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fhy7Dsl/KbdIsab5bqnsjz2+vAv4oqnh9gvL+jnKceuWSM8F50Izi7+RAVnhL7jsJ4PSaRAzKESeeIoheWofn22GJx23aho13jEsvjUR1mAhhuKR6SykmCsLEjauPTOkdYlSoSHWN48L+HqNedS8768sTf0r78mI0pH+l99oVjOg+qMGNjCNHqWVDPTf+J3D9xIl669K8uxBucXTdnAyQ5egSTyRM13/YaiBkrpBwJDfUJVBGt+aQuNF4YZGHKHJF5EnSqrxaQQQuLcmzjw5FVNWEiBtGgkfRg4ZjVH4/L861bpm3PJ+V/6/E3Elb6SE3Cu0IzbUcL+ifXa2QI8kp/PoE5Wz4YNPEleSI6/TcTq1RRA1urvKXCdBEE/m06zPSqBmmgGP2tgBo2vIdTEkkhybUYMI1qGOF/rEbKIsHCpxEuXKSUsIgsUgjK09p2Z5eslR7VzIkzd/QVvJent4q8RbdgUFlA5JRMpUB5Mw807B4Gwjkp5CV+BKiQwOriOGFDDVarSpz1sgg+JHOtMcKNGB4AtqJDhNZv4ZBAa5kZa8pFLv/BWDHrCKrnCxn2XoLE2z5LBDIlEfsIgyyDDEbECgS1oSnyFWgIsMmuCnGvg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f04fd81-5270-4fdc-0506-08dc160984e7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 20:35:32.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slMbvp3KL63FFW0QxREhL1qRDUwD5rRUe5+He/Y57xG3jUnu8z3MWR7JJD6CxQYaf/tRUHShBs6Q2TfrOAYkPwiOpsEY1Bf1AeStKcIi8bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6736
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-15_13,2024-01-15_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401150152
X-Proofpoint-GUID: nikZ60Iiky7k48kFsP-5Fqt82u9Bpe5h
X-Proofpoint-ORIG-GUID: nikZ60Iiky7k48kFsP-5Fqt82u9Bpe5h

On 15/01/2024 20:38, Jonathan Corbet wrote:
> A really ugly workaround... put something relatively inconspicuous, like
> "     .", after the backslash, and at least your formatting won't be
> mangled.

Something like this should also work, not sure if it would be considered
acceptable though:

  * This should illustrate a hierarchy as a code block::
  *
  *  +----------------------------------------------+
  *  |                   Top Level                  |
  *  |               /               \              |
  *  |       Parent A                 Parent B      |
  *  |      /         \              /        \     |
  *  | Child A      Child B       Child C   Child D |
  *  +----------------------------------------------+

(note the double space after *, which counts as an indentation)


Vegard
