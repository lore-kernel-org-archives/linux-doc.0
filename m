Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903F33DD
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707978136; cv=fail; b=aHWjyj+aKIXPwb1X7LoPCRf6iJ2MFt1V7lhTGUwxq7SKCP21Vfw+U9pkARIu3v7vaYURcEUCAsHb0nsC97eE/YuavXPxj4MBZ3akhbG5RbVH2Cde9v+KCTlXD6uTs7LsMHd7aofiUq/o8kItGdK4h0JdFdQVSkGI7vJUzrwI8Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707978136; c=relaxed/simple;
	bh=PmNanDpQ/2YLqEL7ZkOTD6zNHlCejXVT8l3Uo5q24jo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HZq6upYDrbZvJaqDXz/M0NaGZafSNfHSxD2Pby1E7phlzlUfKh+Ze8prDrK73ndL/rtUa9lWpCjpOrqyQd9c16d0NNGRJJHYkJLx4t/o0Hbjq7/SnNtdwOxQ1yICY/f8zBW4XxY2lHdSuO7LhnYnP+2LxjMFQ6FrADf3Opo9XQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hZURDLVJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wESqBw15; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hZURDLVJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wESqBw15"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41EMiHcR027830;
	Thu, 15 Feb 2024 06:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=dzPSUC5Sw8lWz/X2X1xBWTY4XxHOgDglJCmikWLRjcM=;
 b=hZURDLVJDoXJJVRciGFwHgnjGB6tZZKvwwEWYe+don4JgYo3pjxwtJvGUPDZaTH3pLWW
 H7Yvk0bGWQ35kZXkj0Y9dembVq5Wne6hkiSj3aFT+rb+TF/8ROJjFCatISP1swgKXTmP
 PGLSsEWBPq6rLJznc+tH+LB1nxHqj/ILtqyHurqY1cORIVPg0ulholyMl/Ij3aDJd41C
 rXyPHl5LpErJjPiQnNRv5qS6yH5fVuzuvp1KT7ZuCFU1BGqLT+l0JUTBU9CQguwt4CxC
 qmQ5dCKBjoyDJyGTMcfVl4r34/WBVvko0WY23+MWipPJDON9QPUvUWC9x7w1TMhaskmo 8w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w92s713nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 06:22:12 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41F5oPPA013773;
	Thu, 15 Feb 2024 06:22:11 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w6apcvdgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 06:22:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6Q8c0HWSVmNhwSvDRJSrx3Y0sPq/cgvzvCjVm5CDz42F2OAt1vF5YWmGQtodyAMp8RN1tHuC5n/UxvjBT7vLqSilg7kXOIzVBsJ17KBsyrvi7Gfy2NxbKU0In7IV7CP7Jh4UZCr5reyeQzsyChYqCeZ5Y8hVbpypKbPIlkZ74gUmCRFx1Sbvh4tyR+s0Ohl+GkBAlwMntqMV2c/mbFEWuNlAjHoc4hCiDLs/2A8Hb1VcwPmWbUEG3KbhB+QN3WJUK7nsNxKk2Qw6yGO0ui7m6un/q9VWru00txNmI9Sct7LfCPEePcks7gjneJ5Aoe1U1toYp2frqTbcGS1pgm2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzPSUC5Sw8lWz/X2X1xBWTY4XxHOgDglJCmikWLRjcM=;
 b=SqXtNGEs4QBD63FMJH54Fke919ZBIfIF4d76mbrxIkrKAg3ohI5wqgZvZug/7LsMB6eY0Q4LhvvHMcacJpbFLkqYqWgeZmAzTg+656JMhxLIFay/Dyetilm1ElCd/zgk34zLWrlm5V4SqsLUlOZ/8XFumsHLsGoiPdGfOW5Kq09JKHWjSuygpPBuxZKwVVmAG9voxF627PLavbJykDdQ1yatSuz8jpM8BiaK64LAkK5JJknDg2W0mZM3xPPcWXwaxYjgXu+K/145v7bctE3pnC+a/M4wZWogV1dI1Po5KPsIL9a6UAJEs4ZOgFuVwOv2D//za+iXkFL3aALWYOnWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzPSUC5Sw8lWz/X2X1xBWTY4XxHOgDglJCmikWLRjcM=;
 b=wESqBw15eipnrxnOJOPy4LsY32XvtIOei1HfeslfWopAdyTnY0IQ1mItFl11jkgz9Di2Yn3pk6xsmSpQqv2PnySRb+5ejoKcDBhbBpUHSzgevWZMUXyZ80OZkT9J2vjYy6WrxIkCYrp7XWTo3OrXuOrNdJXw3nUIM6+Ulf4omrg=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CH0PR10MB4985.namprd10.prod.outlook.com (2603:10b6:610:de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 06:22:07 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b%2]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 06:22:07 +0000
Message-ID: <3c037ee8-210b-4bb9-9877-35637749d2b1@oracle.com>
Date: Thu, 15 Feb 2024 07:22:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Only load the translations extension for HTML
 output
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <87sf1uy6f5.fsf@meer.lwn.net>
 <aa42e525-3dd5-4cd9-a8c5-6e9d92c3ad15@gmail.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <aa42e525-3dd5-4cd9-a8c5-6e9d92c3ad15@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::6) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|CH0PR10MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee8ccb5-141e-4971-0d3c-08dc2dee6f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	31dzBMlVuMtkGJHkjujPbW3HR1wovifnJlQ38HweOOT7NrjA84gj0Tp3L7V8ZkMm28Jrb/p3VfZYMJwn3DGLgFP4Jc3t/FfBMhsctRik+JH/0TWytfkonAbCCuvaKhOSLtrjCIqfOVKiHnVhzh+9bly/XrYkmVETgEoCj26nuzFZ2+X/4s+RbQacKxNzQCQQahWzEXaI9RnxluB6+59HuaneFAYslJ3K12s+k2mHEKHDvIGkXey+xrFXCThrBcSEX1zeS/g6S2dQsRO/m8eORZEI2vkwaJYE+8xsAOpYEyLrlX86UpFUAOqq6NStncy84LoNq0gU0Hk9CfMdb7IM4xkYWsgYv5AUADBlWr2HXmnEZk4Q58tJcJBXKz+wLUynlUVLUJlkLclrSYOd7gcgX+1SE1+XhReySEG59s5b2K2n65L54xTOi8VayDYfyDSMQiwEUCQSBUzqlA/MuN3MqmtjbLEGvr5uwgsjzXSkVa6ld6SICCPRnVJVdaGaeQjn49tccTcUvd6tU0CXCJgJ01o0hn84ui3bEW7nIRu/f7gfP4ueLRYCSGWX3RMi5SMI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(6666004)(316002)(110136005)(6506007)(478600001)(6486002)(966005)(53546011)(6512007)(5660300002)(2906002)(26005)(44832011)(41300700001)(8936002)(8676002)(2616005)(66556008)(66946007)(66476007)(36756003)(38100700002)(31696002)(31686004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkZYa1c4YUNIZjJzMjVDOW40SXBKNzgvdXRCV20xVE5RSGcxOVlpUVRmb3BS?=
 =?utf-8?B?aEV1WnByYUxSMW9tVGE1ZUd4UnZDZVJlcVAyaGJtQXllUGpGUjVOYTNjRXR6?=
 =?utf-8?B?cUhjZHIxMUZGNmhTdkZiNm01TkxsaGZGcDBROEFTd25iQnVvNE5GbFlDVjR5?=
 =?utf-8?B?VEFuOEhCamtIcDMrOVROZFRzWlUzU3BKdkJ6ell0TU8zS1FzcWptUkM2RWRa?=
 =?utf-8?B?RVFXYjlkcG1oWU42OGhLbm14SWhqQm9JTi9icHpEeTltYXBiOFV4a3JXck56?=
 =?utf-8?B?a0tzeFU0M0NFS045Z1pzSkF5QU5QdGpnOS9zNzN0WU5raGdSclRTTzVGREhy?=
 =?utf-8?B?YlRFN3pqK0hpUllCWjJVY2g1OEowTVl0T1lWVENRYXJaRnVNSUNoTE1teUVV?=
 =?utf-8?B?YkJTaFNyemxYb0NRY1NvcDNqSDFtSHIxRHQ5N2gwakRiZnV5TitSb2FNYUlU?=
 =?utf-8?B?KzJTaUZ3QlFkUVpONDJ2eEJlamxuamxpNVhURHNzampNbEQ1NHR2UmE2UEk5?=
 =?utf-8?B?cHBwMlR5QU84T0M2cktvSkJnTnFVbWNSNmNqZ3R1dDJzdXQyczFEajE0blds?=
 =?utf-8?B?VFZsaW5IbU14anlpOTFmaVFzSm1aZExjNXAwa3VXODdLNkF3Qm1ZQkFUYm8x?=
 =?utf-8?B?N0kvVXJtYnVmK1pmNTNYMkNScFlVS2xOZVdxTmI4aXdVVHhsV2prS1dTTUc2?=
 =?utf-8?B?SGZQY09xd3gzd0szN2paT0pVaGd2NmlBOW1YeHhKOURlWVhhc29GQXA5SEZa?=
 =?utf-8?B?MVNPNHVCYlRmRnVrSkphYVhaSFR3WjIwc3BneENSbmloYThSVnY4N3dBSUlI?=
 =?utf-8?B?bkJVcE9FUi9NMzBLYzJ4ZUp1WUFVV29XaXNoWUllYkN4VFY4VHg1WDRYNTI2?=
 =?utf-8?B?bkxRNjdISXBHeDBJeXlnbVJnOFFsUkRQK2tsaFkweWs4ZUovWWh6TzhCVkwr?=
 =?utf-8?B?OVJRV25yZzlOY01tUXhGSGV3UkFDR3FNQ2xsa1B2eUtMZkl6OWN3WnNtd3FV?=
 =?utf-8?B?OWgzTnU1am9oOTdVVW1RL1Y3V204UzhGUnZKTzc0TGpRQmRvNzg1ZGg2Vys4?=
 =?utf-8?B?bXZERUdFUWhVM2VHZTVUTTFaQy85Z3I1NUtDQytYTmJxSXQvMmhUTzdic3Qw?=
 =?utf-8?B?R2dLamg5U3FpbGcvYkRLajZiU1VDbEV3dUdHOWRsdDdHRy9ESkc1T3R4eGMv?=
 =?utf-8?B?OGRhZ1pRODgvVnJDK1VSZG41ZWFrcDhMNG5rREdKYmhkSDRwVnA5VCtnajJu?=
 =?utf-8?B?dXh6TDFiSDZYTFdEMkZRWDdCaDlLRUx0RWZYZXNLN3NpWDVGaDd6dUlxU200?=
 =?utf-8?B?cHBtZW5TOHlqa0FoUW5jbGhJcDF4WjBYekROWjEwSXRacDhZMjkvWlkwNlg5?=
 =?utf-8?B?TXVBZ2w3aG84QnI1TTE5OUcwb1BXSE9Oa1M2NzBpOS9JNkdETnBxTFlaVUpM?=
 =?utf-8?B?NGU2ZGpSS0hLZU8vZkRWOUoxU0Rud08vUFVPMzloNnpzME1PZzVtNWpvbURD?=
 =?utf-8?B?cXpHV1pIUFN4RGp1Wmg1UTlZSFVuRjdLTVliRzZTQ3IrYzFWNVQ0dndVWGN2?=
 =?utf-8?B?UFBaNlY3UzEzblVNMVNVL2RiRnYzQlZZbUN6aTMvajg4Y2RiVXcvU0hiSlZY?=
 =?utf-8?B?MFo3b3JWaEgrZlVTdDZ5NGV6OE9DaWVMOU95Tzk2ZGtyVzBQK1hIdG9zY01I?=
 =?utf-8?B?ZkJjdUlqNDc3QlgwZHVwMDI4RjBpVVVlQkxJYmhkWlJvVG1Ea2gxYTZ1TlYy?=
 =?utf-8?B?dDkwL1pCOEhONG9aVUFPVC9MaHpSa0UzQmplOVY5Sk02TFdadWppVW0wYlNz?=
 =?utf-8?B?RERtVElXQVpDTEVxck5Dc1FFVlVHZFdQT2Q3MnVOSGc4YkxldUFOZjRkM3NL?=
 =?utf-8?B?R3laRDI3K3dOZG5lM2FhNGhvdXpzWUx1d2M4QnlaRW5JVjAycElqYWFNMlNr?=
 =?utf-8?B?eE9FQnFIa0JYOGdxZm12Q2NyeDJUQmR0YXdOUGMxMUw4bXFSbG43dlR5TlRP?=
 =?utf-8?B?NFgrS3ZEejEwVEQ2TGpHTmZXa3U2aGlNNjQrSm1SUjlaYTRCU2MyRjJFT1cw?=
 =?utf-8?B?V3JGTHpJaXJtbG5vWTRXcVc3TXgxVjh2RVZSNFgzMGxQVFF5L0FZQjhSeXZ3?=
 =?utf-8?B?c0YyK1VZekQxNHVVYlhEOU1OYTlUTlorREJLREF4NHd6R1VrOEpTZVA2cm16?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HxLARW9iX+EhyViXbnf1ikl0PF3BCujDWe2Vx9DqMZ9byu/TBfAwibmOoXuCqTixDYpWHfylyqBZayqDVY1wKLDGDKCpKu6Zc8GHnjWXNBPXpxfafy8Ke79bQOTIUs1SqOrsY0YJRGlLcTedpjmjAUDiWE60OtYQ4QYpL5883Y6RgDi/B8AGDU37trY7S2PTXQtW8W92TPHZKmqly6qCvtnrpo9pt7OGXglRuR+epBOFmNqOVfSlo0AsYvwdYobS21HB5lqwTaTtrQ+W1/aHFViLmcOK4OaTcbnwCTwwdqWBWwjKHLXiDAXqev595mh1C5ZsS78Ru+2xftHwWIpUWigVP39g5aD1YPGuXi4S0PmNvnPDUN6yvC1H4voM7K3SAm2VwyQg+ESQoAFMBxt2U9LrYDIOUitYRgytkX8UUV/D9RizfUMvasU3smLJTlSJxVhyYd1Ty0OOv2jJP21KA5Y9DFgtp0h8ld0myiNBvqjehMpCSs20AbOKb4GGZFeAtCFVDPP1JAdvFeUmQwnCepLBT/vmLwaFg0Y/GySm9BbNrZb3+uCniXElnsWibcYA+gU++9Q46GBQnIO7MdrIm0/KKwPEdfIfQYLJZfiVKz4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee8ccb5-141e-4971-0d3c-08dc2dee6f36
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 06:22:07.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar27rNzHClu1V2cI/oioOPyeM2Mm2g23i4Qb8UYxYSStyaHK8ZBX9RXbLqpW1JpbvWveiZwENPmXdbL2qa5kYH8YlfFEke3vzW4sjY5XRsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4985
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_06,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150046
X-Proofpoint-GUID: OMKgNrtSMi5l8lFko1Ag0RHi3XzEv4i4
X-Proofpoint-ORIG-GUID: OMKgNrtSMi5l8lFko1Ag0RHi3XzEv4i4


On 15/02/2024 03:43, Akira Yokosawa wrote:
> On 2024/02/15 8:25, Jonathan Corbet wrote:
>> +#
>> +# Only enable the translation extension if we are building the HTML docs;
>> +# it brings no value otherwise and can cause problems.
>> +#
>> +if 'html' in sys.argv:
>> +    extensions.append('translations')
> 
> I tested incremental build of latexdocs against Sphinx 7.2.6 as follows:

[...]

> WARNING: unknown node type: <LanguagesNode: <#text: 'Chinese (Simpl ...'><#text: 'Chinese (Tradi ... ...>
> 
> Exception occurred:
>    File "/home/akira/sphinx-7.2.6/lib/python3.10/site-packages/docutils/nodes.py", line 2068, in unknown_departure
>      raise NotImplementedError(
> NotImplementedError: <class 'sphinx.writers.latex.LaTeXTranslator'> departing unknown node type: LanguagesNode
> The full traceback has been saved in /tmp/sphinx-err-3inve171.log, if you want to report the issue to the developers.

Jon, this is pretty much what I said would happen here:

https://lore.kernel.org/all/8b51b6d6-0360-4f42-9b96-02e0ccd0b34f@oracle.com/

I have a proper fix that should fix all errors everywhere:

https://lore.kernel.org/all/4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com/

Why not use that? I'll do a proper submission, I was just waiting a
couple of days to see if anybody else would would test it too.


Vegard
