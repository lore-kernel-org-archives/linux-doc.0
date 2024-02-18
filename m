Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3EC14A86
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708250966; cv=fail; b=pkIhhHYLsliJTHm/k64u5G7aV659J6yInYf5/190N4V+B81tWvYiLCSty0FORcQoJKJE6zXINYtsUh2iLYETlCgAdutkN3omxXM2jaDpBMwS+dfU+HcNa9jCl11/WreJ2mbs7RQrONJRPJnBs3FFyLkOReHUOH5ewlVmWBQupP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708250966; c=relaxed/simple;
	bh=PG0BnwWQGPbDM+aAaBjwD9o8TGRnDI0ZVSKYBOaC3YE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KbrkKKO5RM8LD60p0n52D0kO7HdaDsp/u+Nx+BqUrOf24tfqP9NizxxsiTTH6ecGrn6roN1HNjiKRVgZK4bO/2+rrjTneZLqiKjO6b0O5E0+IT6Cm5DR8IyajD4so0AdAdiRgpCEY/MIOTuTZD0YkyYWe1uVqRTZFxONknTAjas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WmhXUFg8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qCAUtDcz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WmhXUFg8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qCAUtDcz"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41HKQAcY029232;
	Sun, 18 Feb 2024 10:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=GIVWVB5mQCNx/xE5sulyOh5yQ7p7vlTtYbYAZIpRUOE=;
 b=WmhXUFg8AqitgJGHhFUSEWnXXJTpw7f7KJO6awIZc4jeyK57nZHXuAr7MQwqkV2WbwuO
 Mhqsik6XZwpNLr/3307Ol/BOvs9Q0v5WEvtzQp+PYrfgr1oemYXzGICbtYpe7EF+Dxph
 /AKRYpTnxTeTm87vZsSPk/C7PSC80IdUCAaK0tW1akAUKAXpFtoL7Ut+vl8xuIV9dsT1
 Vjbgy/NT6xnrRzki3XWrGkqoKPg8Y+5rqpIORyhNWtNRCs3hYZ0Yt3RPmPXYpKHbJEU6
 5oFwTsBLLkzBuWvID4u6sHPYDrA6xgJ8T+oL6/OLjkUeO6X66FgFSZY2g8428LCEWuUQ 3w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3wakd2230v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 Feb 2024 10:09:07 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41I8SxEs000948;
	Sun, 18 Feb 2024 10:09:05 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3wak84qd3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 Feb 2024 10:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcp61r1+xgT6VndgELAf4k1T0lT1gBQjFO+xFMivJpFmsJ9+Y/lzwpLIqnnsHz35xHjyIlgHlj/ufEYlGTpRfrvB5oiBsOo/M4CW0Asidy/vdvUGCITY72YyCSr+nJ01TQ3Y1LeEtbFWW0LJImkpZMQ4fQcnmeIRDxizCoNUgYsP2HUFvEFgERPUEmiycg+taf/YdqO+BjFXHgY9v9VQWZftCuMZuQHNJlNA90cD7+Qz0kwd2QiFy4zXLK8qwBNIKvMM7qbc7wabOHWUXuVTQl/MwFrZmDNIV9+BAZrvVsOd/yXa7eUdwwskbQ4AO5+CyXtucisTb6ky044VpA1vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIVWVB5mQCNx/xE5sulyOh5yQ7p7vlTtYbYAZIpRUOE=;
 b=WX1/sX2ZsIhrUUymmG+7H27ss5WiRqQzQLKKzLjwQr8mVBY0wsGEqkoiDDncVlspc2v7MQrFvzdTb9e5zwSXvNbh1b5U9s1uMplo+H4rAepP2ihqSU6gDwwcxSLngOmoMvSPhUpn2fc/C+n2bG6R3VX4myrWd/AuJDuhsM6uvEVRis4ELvXDhxxRrALBYyAwmt8TgE9aVevgwcYlRTB8pfT7W5Rwj1haeci+SxK/AFsl266njo3e2n6tCg27ffSD8kwnsyl9iGJ5h+0QfhIphL8drkFihSYeYdWGGTZppyp9/0DwyGR9Y9RMrUKUwYmLtB0BJFcP3vqTfQqHNuqd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIVWVB5mQCNx/xE5sulyOh5yQ7p7vlTtYbYAZIpRUOE=;
 b=qCAUtDczG7vjLCVK0lGyRuUEd4ZX7I7cEQua/77wG18IH1krbZQl37zAqeEXgtKGy7j+1osJDf7AXpQwtzGY41jcVCtUe/6yVxgTabpSKsdqZiqs4y2fFZJ3gAL7IBZyHkkBfJshuGO4YGSyDn29zRB7IAnZWDjS2LM0twbGSiA=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS7PR10MB5326.namprd10.prod.outlook.com (2603:10b6:5:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Sun, 18 Feb
 2024 10:08:59 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b%2]) with mapi id 15.20.7292.033; Sun, 18 Feb 2024
 10:08:58 +0000
Message-ID: <ec394023-1dc4-4dc9-8f90-77665b297823@oracle.com>
Date: Sun, 18 Feb 2024 11:08:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: PDF misery
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <8734tqsrt7.fsf@meer.lwn.net>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <8734tqsrt7.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:348::8) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DS7PR10MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 076446a5-4ffc-47bf-a143-08dc30699f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p9iYtFp+qAVBohk20fFzSCs+FdwqGkbRE3XVKUDohu/M0ZM2exEUbTzg6dnvV9ua29G/QglR0oL9lecJYKoFuMglS20b5+cvUWgzpPhHGi0lPjJnbNp4cc7q56ONUQT/2u9LaOoWbPkvK7coLeXPvh75J2Fez57fmVw3QOR7AzfaGZYpFsAbwIo/Gq/0wj74bUbvb/JdrKUUu2dZpiqqeVFqqXVebi2X7nytjWvcsqKwo2qEtaQBD/YFlgu7KBpTyN97HyyK+OTcHxSdIpIbYCR4dq3pak865pPE0U69d43CE8U3twnC1SxOGJHQfFadhnNfRXSVKze0VnZRK5s6raKLT/fwgWbyPYEZN7BrK9PSNsNxuV2wWQ8RcU31NGNt0BlpymJCVmPfPFvGII1K+E5XSwJ+P554jWVxFbA0T+01N9CQ8KryAvAg4jPImbR10uztZcCvmVUaYYFnGCPTC8cQ4dGDifebvz17xuZw7LylVUe3wvJZWfCY8vRCJZW7t7tQkgttAUxJs9tXE7shcYC3y/BSqsATpCRgRx1PW59BEevwkz8P8JtZcQMG/eKn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230273577357003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(36756003)(3480700007)(86362001)(31696002)(53546011)(316002)(6666004)(41300700001)(6512007)(478600001)(54906003)(6486002)(26005)(2616005)(6506007)(83380400001)(38100700002)(7116003)(8676002)(31686004)(8936002)(66476007)(2906002)(4326008)(66556008)(44832011)(66946007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlZoV2R6VXY5UlJwaWY5NG9taDlBYzhDNjZWeTZ5aW9zWjVRVDNGRDFrSjRt?=
 =?utf-8?B?Um5Lb0NWajBVSTZPTzk4bVpQR0duTWltUFNPbnQ0WG95S3U5YXV6bEYrUE5u?=
 =?utf-8?B?bnZzNEVNYWhFcU5OQU9LcmpoY3lDallORlNsQi9zZVJldGtrNTBNV0xoa0J6?=
 =?utf-8?B?TGlNUmpnQ3ZXNHYxSGoyZ0gxVzU3Z0Y4LzUwRWdROE94bS9zODNYUkZqYXhi?=
 =?utf-8?B?d2NPV2xyUFVxb0l2ZUUyeVdwczIwcTdCaFRQZmlueVdlb2l0ZmJDeFVBUEhH?=
 =?utf-8?B?NllYR2ZyWEw4RzZGSXlRUEgvVFA1ZEN5WU56VkNVWmg1NUJ0UTUzRlRreFJ3?=
 =?utf-8?B?a0htSWhMQ1N1SDNEbGFtbWN2OXVNNUFwT1NORzJaMmt2QW5NS1htYWZtOWs0?=
 =?utf-8?B?eXZlNWw2U0QxQnZsTFRpdXhkMFFEamhCNjZtNlp6ejhSMXV3RVJPTzQ1WlpY?=
 =?utf-8?B?UWhGYXIvUjVqN2NzM3UrV0dpeldEY1Vmd29nSHF1RTRFZ1ltTGovVXEveE9Z?=
 =?utf-8?B?dThCcVRDWStqblpUb1ByTEtpR290dVN0bU5KR0IxODF0OW9JL3k5NFVkY2dm?=
 =?utf-8?B?bmIyc0owTU15cGFtRTFlUVQ3YWR0MjIyOGJvYzE1bU5LYmxMNFNQSkRBMVpY?=
 =?utf-8?B?TVhlRTUxWk15VVFXYlBudWJUc0xRQ2pPazFXZjFUWCs3MjYvNTVOWk1GZEVr?=
 =?utf-8?B?dm1hZUw4NExaeG1yQ28waG0zSGlkVUtVMkUvRDVWOTd4UWZYY2hiREo5cC8v?=
 =?utf-8?B?ZGxPOVdMaWJvVjVlWjkwZDFpUkdGZ0ViWUdiZ1BGS0E2WlhtWmZicnZiUmJ2?=
 =?utf-8?B?QzFVTnhJajRmZ1VvTExJdXd4THFUb0xva2RHVW4zd1JtUkI1bW5Ha240MVBN?=
 =?utf-8?B?SUY0ZDg2elNmcEI3ZjZ1OTl5YjNaai82WWNRY0hjTFplbWExQWVUdkhweUxq?=
 =?utf-8?B?elQvVWxHeFJwTkV2eENhYzlmQU9oeUswUXoyVm1nTEQ5cUhFWkZQUWo0ZWs5?=
 =?utf-8?B?NUVOaXViM3BqRG5OTVdxUnZWYUpFTkxiOXlpY284MEttR3N0Z3haUm1NQW9W?=
 =?utf-8?B?RnVFVXc0TkwrUVA4MzJTSTZSejA1YURtOHBmcjRvVVZwd0xYWEtNZFJMZjls?=
 =?utf-8?B?cllNWmJTbUpLMHZKZGFNeWxCNTIxTzNRMm9HY0swUk93bkRneVVmaGc5S0lT?=
 =?utf-8?B?OXRNQ2hYQXlQSXhHMTBBeTRRRE1NVnl0UG0yNFcxNjZhTDFPdk03dVNuSEw2?=
 =?utf-8?B?OTVUdFlTYVU0R1pSTHprRXBBTFpjY3ByMU8vUzdjRmwrM2RLY0VEY3VCOS93?=
 =?utf-8?B?TmU5N0ZOYmFOYndFQXpLcXlzTnBWM2t1cWljV3cwREt1dWgyalF0VDhUZUpY?=
 =?utf-8?B?SDNvRTdSN2k5MEI2U0J4M1l4RWI1Q2Zlb0Z1NUszTzROVjNHdDBFM2ZERU5Q?=
 =?utf-8?B?MmJ5bTlJa01qOVhBbjRhU1MrVm0rVlN4RUdjTjBpZ1ZXRVRVYnpubVd3bUJz?=
 =?utf-8?B?WEdtNmxmU0tjOVRpSWM1cHJEbmM0cmVNVnNxOGNmZDlpOEhxaVU4eDk2M2Zy?=
 =?utf-8?B?ZFduZTZYc1pESTA0VTZ5RXRLWm5mTFIyLy9QVStleklISWViY05LWXpSRXJj?=
 =?utf-8?B?N3pUbXpKeTFsa0tNWGlQeW5SbWxFYXhiSHYvdmo1VVdJeWFqTlk4Wk4rcUJl?=
 =?utf-8?B?TW1CY1NzYU1XMDZ5U3BDS1I2cGNwcWVhaXBqcXA5STRFSlh4WVBRbjFpbkx1?=
 =?utf-8?B?RW1kdm1OenBHY093SkdSVXFNWGdUUkhubk1mNDZ5WjBFalI3c2E2L2NrS2tK?=
 =?utf-8?B?d2xyME5RVmdrODNYcHRaNHhsM1RsdVdOdFB2VnR1ZmhHSGNXalJ4b1UxVndw?=
 =?utf-8?B?UUFoZzk0YkRQRFRxeUNtUkNQZXR3a05VdEduUm9iUGhzYjRWOWZBSmJ2RGho?=
 =?utf-8?B?ZlVjY1BKYnpOaDZlWE1aUXNUWUR5NGNoU0VSbFlRbFFWb1VEQWl6RDNiZnR6?=
 =?utf-8?B?Mis5bmFSS2U4eVR6Y1ZNbGE5WWNTSVpIcG5ORjFoMXloL1p2LzhLUHVDOWlN?=
 =?utf-8?B?ZVhlMjZmc3p5NXZnL2ZYVG1ZM2dXSzF2QjVyenIvWTVFaUttZ2t3SWxXUmI4?=
 =?utf-8?B?WW1POUxGSno3dWhsMlp4SEhmVjJqczBKT01SVkZSa3A4aDBxa3M3ZVg5U0kz?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kPi5B5gQww0umvqPxdkSGge0ttH+bnRNMJYCc76/Fhnd00+BxRnqQ7080QIgoQR45w12Nzaq+0cafFKDmkY2yg7wHKfl1ams7JVx/avfCBBccq+L7mI23PS+5ykyRPTxogL1o3kZhIDXHo5joYSj7UkGqoDDtKyjO+bhh1VfD9x9Ow1bRmByqocddmCiCRV4pq8NbvAryUSzQD3BX9mvSUbhT0IvhZoavbZO03f0vEaSnYxZ3vjv018P7F8RwLmS0zpZxGZTFqyyb09hXwmNe1vD/5ZnO0e06UC2a+iI4csbZdvXn/W2Rx/gWgGa9vYHFvVvAxBEnFvlkA6tEUIeLYflc1MJqzu+1YW2VMBQcoUTEZg23af6pG7DFDtLcLxZfsIAhlR/ln/5U0zYvhy9Etlxkve2nzdLBt7OXDv1Sra5r3N36hkANOx9af5UXnn11m8+v1oEz4NK49E74YLwcE0VlUAIJRg4chpM1fRfynJ9tKC2dMO6MCFpcjsRwBBuZ9ZzeqILHlUcSNpk0CnJ5vwOROOS5Uru3GKdvZ0XzlX+Ea1WiJeqMXx8g1SmUNbZv4NFxk7QZGlVz2zEMBpgcaeGdbvDRXXrgleh/slB0fg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076446a5-4ffc-47bf-a143-08dc30699f92
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 10:08:58.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aE8dxBeKt2lbxPl+sHRm+ge0YWRCmGR/mQBu+C9EJ3IowY0tSnv+qyAqMWqlrM1ZymWWFEqskC//eFJkOIupR19uQXThvNyJ89MXzOkZyoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5326
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-18_08,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402180077
X-Proofpoint-GUID: zjGHy8LHfNyKPA2xkEMnyoX0kO7YVstW
X-Proofpoint-ORIG-GUID: zjGHy8LHfNyKPA2xkEMnyoX0kO7YVstW

On 17/02/2024 22:29, Jonathan Corbet wrote:
> So, FYI, I have Vegard's PDF-generation fix applied here, but I've not
> pushed it yet (even though I think it's fine) because I wanted to be
> sure that all was well with PDF generation.  Bear with me as I ramble
> for a bit...

This won't help with the immediate issue at hand, but I am trying to put
together something of a "docs CI" system that can pick up mailing list
patches and do builds against all the various OS/Sphinx/target combinations.

At least that was my takeaway from the recent couple of regressions I
introduced: I need (much) better tests than just running 'make htmldocs'
once or twice in my native environment.

> I'm surprised that nobody else is reporting this problem.  I honestly
> don't see a fix other than changing the organization of the document to
> avoid both deeply nested itemized lists and section structure, which is
> less than entirely desirable.  I think there are good reasons for
> avoiding structures that deep, but limitations in the tooling aren't one
> of them.

I don't know. Tooling limitations notwithstanding, the good reasons are
still there. HTML has no <h7> and that was clearly a "human" decision,
not a technological limit.

I think the "bug" here is really that Sphinx generated LaTeX code that
doesn't build -- and that it didn't warn about the problem in other
modes (maybe it does in newer versions, or maybe we overlooked the
warnings?).

If we'd had those warnings then we could have stopped those constructs
from entering the documentation sources to start with.

> Meanwhile, I wish I knew what to do to make the PDF build a bit more
> robust.  I wish that rst2pdf or rinohtype would progress to the point
> where they could be used, and Latex could be taken out of the picture,
> but no such luck.

We could maybe use the ".. only::" directive to "#ifdef out" the parts
that don't work with various output formats and then incrementally work
towards removing them while ensuring that the whole build still succeeds.


Vegard
