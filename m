Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6C4481D7
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 22:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707775473; cv=fail; b=Lpkwh5tNrdOSSzqP4xp3WNefaJckbkypHA1vUDORXyYXxRxJFbsjUC3xOZmhHinuwk3o5NSaGtZ9xpaAcKUsP7VDQdASVpZOeqBssJgDWTM6xbfo+Avr157SF0cI0MCNNqmLCiYnjuhRiVsNEQ/SezC7E7PGsU3aAE588OkRp/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707775473; c=relaxed/simple;
	bh=cLxGy3DagQYRliR0iCSZi+KCjaVEu48asAZbaZ7NaXk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y3pJ3thltLsE3msDM/4VIsMPuSE6V3nWqvfnXMvbO70cIZ9psMfZ9JWc2J4CBQ+5rrmmO+WPgghzJtwYkNv/4YNqFDdGtMpnPPR9grR4bQftKRzfAt0um+ejJN35e1CSIVP53K6mlUEHrVQVkkCQNBQFgsA6OYmo84Pax5r0cPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fgUiJINf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=npwaqFgw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fgUiJINf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="npwaqFgw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41CKYKYx029357;
	Mon, 12 Feb 2024 22:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=8dsTRz+sgZrQ9Qrf7eeyNOs5BEEazFxsyvIuycBzrBE=;
 b=fgUiJINfA6NBWC4SJC9z7A0covVfRGRdAgDCWW79rzvVNBv8bus69axpGoi3F+4YAI6q
 KVm5i08EFxXGT2iHVQmJh6sBG9Q3MaN5GmUeOEMFN/COYc65fJmKXaaOERT/vWD9iU72
 zoX1FYOCAfKHqhfLkOED57Nf6W/Bf8SKa44smiORnvHsZTFMcV2CG5cEBlD2sUotNMNH
 xT9hX/E96ITq0yjzt+1fpCbWjSldEAh2iOE+Ld+gmgxJklSn0EpznZEQk+l500g4stwf
 GntIZ2owUkGi7le+2NsS7EZn3gJqz6GyMEu1WlpJSKPxbTqOmiFnDnXfiiK6ag1UYXkQ cw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w7tfwg6dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 22:04:27 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41CKmci4015037;
	Mon, 12 Feb 2024 22:04:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w5yk65fg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 22:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXiZsw1xnyQo+U0s+A0VG06WLGZXp1gXOipQbzCbkZRGVkZCKwUCYDnXLnMdhhfb1KPP3e9usFXG6ZG4uKGrvgHP8uDGMjGIHtfco2+cDGVaAzkY34725BdWftUAeWKl1F8r4jEI7FNHAHeeNiO34NtdjoBmmIpj7eUsiWpHga9k9Ec5OFmBo6HFNm+kqXuQf17tqPvMpB4TSEKwYTURK26X5j6fqLwD7O+YmlUgcZfJvyoQdggEWBsdThbTR/MdpSDros5r+2rYoxaqJKnVPi9i/vxGcPsu4GUhKmChEZcDsF1KvqmXxxn/GpnFuBMScah0xjca+fw1+DUvCR3zTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dsTRz+sgZrQ9Qrf7eeyNOs5BEEazFxsyvIuycBzrBE=;
 b=MdyJiLdrC2aT1CS8F8fsVh4fSlSUegDQFh1CMA7i3pLlnErr7kH6cNe57RcfVHjjCc8nCuN75UXHWGmziChNvVO5ieHFBMn0xmVfuEYNTpkVvZNQqCOZ/6hihMLBHV3PN69KHrxaS7tHkuJD+TB83B1FbMNJs1+6CcDh4nKWNfIPDHjRy0b/j6YdiQLvxDe61D6kAndP5MbZfT28QsLhq3RjNn0rqY/RsaALorDS685W/4ggXNk4zUaCkggFz5z7GJrtaIrYJ2Ex5VC1pEG6L3vPTP6Vi4bbceCn2Scl8WIq0g3JTRpJa5A4LYvTuXGlvoBB0b2+c1mWWVPLHqvcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dsTRz+sgZrQ9Qrf7eeyNOs5BEEazFxsyvIuycBzrBE=;
 b=npwaqFgwVi8ED+x/V7XjzxgMe5TgMY+9FQgLd6bIfUywr7wx7iRGyiDmrFUzrepHCa9yAKfEXPrk7Notei/kpjtzNx1wMpV7YWC5pB/ZY6WYWsXhBJlj3ue/wMqi9pIAjnLkTOLiPxGOM61RNio6VxOD3HiLSYBSUz3tScGDRVc=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS7PR10MB4944.namprd10.prod.outlook.com (2603:10b6:5:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 22:04:24 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b%2]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 22:04:24 +0000
Message-ID: <8b51b6d6-0360-4f42-9b96-02e0ccd0b34f@oracle.com>
Date: Mon, 12 Feb 2024 23:04:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: docs: "translations" extension breaks "make latexdocs" with
 6.1.3<=Sphinx<7.2
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org
References: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
 <37ecca9e-83f9-4f91-9b76-b5bd012dc3ee@oracle.com>
 <4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com>
 <875xyt8i67.fsf@meer.lwn.net>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <875xyt8i67.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::30) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DS7PR10MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3e83c4-66cd-4bb5-67f7-08dc2c1692d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XQ4MnZaykhx1XJvsvDYL1hC2qYe0DTxgtx3GzCT1eHRHnc8/FQMZdJVNuSnNAo/R4nAlXSmEqfZ3AgjmNd/xLxy8iZiiJoyc8tm3uJQu9xaeyxSm8XxrOelGVnCb8nqX3pvtCC34HqOl60Rc+fvvtVzFXMAOWnp31WbFkBRwuFmxh5oTpUDFJRA8sZJZZZlXMn441/zWhvwgOlumArcFrsRx9zCmyIRUy/2FmBgHkLyaEYd+dimuH/OkYw+U7pV+50O8A2tQgCYmdpyhRhDmJXQnv3I1AMB6F1R018o51oGDyFPNonVRIunmqiWLGFd6dQ9JjYKjufBFdGm3eF3aX5n34C8sC7NdgRVAThUx9Kt1s+UditUmrI4dAfGwOBmdQf2VmrfjDNG09HKF7pLKOHo++h3eKMHdkQMJT0Ziehr7PZhgHBu8hPrsPuc+kZ746Mi+5V3dmrzoUmAnPm3HTE94jc5EnfVKJFCHBNTBL1RzWIENOgrwlOe1D1nc37cSaHb5BCXm3S1CM6fCa92nl6OfYYpP+XooLOjmMVhrgR9919zhqWwdg0JVEqSF1ooU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(36756003)(86362001)(31696002)(83380400001)(66556008)(6486002)(478600001)(6512007)(6506007)(53546011)(2616005)(41300700001)(26005)(316002)(66946007)(8676002)(110136005)(6666004)(38100700002)(4326008)(5660300002)(66476007)(8936002)(2906002)(31686004)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHBNQlR6R2xUR0RyL2tSV29vdzZROGhmbnNkTlhxQWdrRlJjY3Q0ZTZESXlX?=
 =?utf-8?B?eFEyYlRDb09jZVJxNDBkZGVoRWNocEtDWHZFWWNPOEJRazZsdys4YWZ0dUdB?=
 =?utf-8?B?czFKTHU0cUpoWGEyNzJGWmxEeEdPOCtkREtjaXBRQXNPNGpJS0VocnV0dVlY?=
 =?utf-8?B?ZlJjT3Q3SHMxcUtJVWg2Y3NjRTVKb0FRWDJtbEUya1dKOHBxZXpFZ05MbWtM?=
 =?utf-8?B?RngzM21XcG5SSU9LanlFcWFuZHVTMjJWTTNsVGFTM1NyZFFiVzRSVVpSUU5J?=
 =?utf-8?B?TDZ5dUFIZ1lTTFM4c0lRKzViVWlJN1Ryb29qaGY3Ty9EMmhqK3NqV2U2R1Qw?=
 =?utf-8?B?czNjSkNTZEwyQk1JaTZFRkhoSVFHMjJiR25icG1hdEVsTlVYRWhEWmdSU0tt?=
 =?utf-8?B?TTNBbXgyUHlQLzg0KzRsWXRTc0Z5WXdXRmVrd3Z2U1l6cEhEejRwemZSY2Zm?=
 =?utf-8?B?TlEzK2hLL0NUa0lOMDZCRUlTSjFUQmNsQlNlSmhCS0sxWC9NYXVUWmhZTGhh?=
 =?utf-8?B?RS9JTm1xdVRsSHRnOFFWa2Z0S0xnVGpyZUVsc1NLMWhqMy9sWStzRVpmYllp?=
 =?utf-8?B?ZGJGTzkzRHNMTFhWTFdpcTFPdndhbzhIUHhVQXVDQUI5NFMxUXErcXVtWWgv?=
 =?utf-8?B?alVLYTcvK3d5eXNOVEcvVEpXUGp3SWlWejlsNnpvWkJkNytKRktLMXZKMHQv?=
 =?utf-8?B?L2FEKzh5N2RTYnVXU3FGUG1QaHNHSTRWc24rWGdPaUUwdHNnWWJsREE3QWh1?=
 =?utf-8?B?UXVFeURlOGdYQVlQYjJMMDVERG1yVzRweVp0aTVJTjFXak5KNkp1WlMzWHFS?=
 =?utf-8?B?WUxCZW9Udk9leTdpWUh5VnhqU0l5U0Rwdnc0aEhxOVRkOHBOYTlORG9WWlBq?=
 =?utf-8?B?VlNBcHBzMUIxbXJoYXNsZlFnR2h0RHZUL0ZCU0tZR0NCdTdXL1pPd1BkVkV6?=
 =?utf-8?B?U2xBVStWbWhaQnM2Y1VXVG4wNHlvRnVXNDZEUGd6Tnd2MFRXS0JuMzBBZHI2?=
 =?utf-8?B?NGl6dDRzQjFBR3Y2c0pxUXBnenI3ODRpd1RlRStoanFEMmpkS3F0aEJNdnlt?=
 =?utf-8?B?Z2RJT1B5NFA3OENWYThOcjNXcmFLV3BXR255UEk1SURVUmpoZFMzcU9GTFky?=
 =?utf-8?B?NGRBTGZDN050UTZtY3RlR3hwaW5GUXpNOStvUVBYZnBHbWJxalV3ZlY4RkFE?=
 =?utf-8?B?dExmdDNsemRkN3ZwcG9TdCtVV3FhL0VnK21TdVRSeWYyRUMxeG9wMm0wSC9D?=
 =?utf-8?B?VE85cjVjQUl1dVRYL1JDdDcxYThNL2RIMEk1UzlUczBuQlhGOEVHalhFdXdy?=
 =?utf-8?B?d1k1blI3WkxnTndTS0t4b1dWMVVZTlpGcmdOYzhPcmdobHBTZ3NNa3FDQ3Nq?=
 =?utf-8?B?RE9nV2Q3MGtvWkZFNE9wazA1NC9ZWHBlRkNTRkN3M1pjWU5aYmdtK1cwV0py?=
 =?utf-8?B?WXAyTDBFdmdTRXVEVUFOTjdKWHRxYjFMR1QyTW1QTmF6NW9GZTdEcDVJNUY3?=
 =?utf-8?B?aFM0NUZBaXNzb0NmWmZnQTIycjRMSEtCOFF5WWllMmJldy81Z0VQaFNYUUJj?=
 =?utf-8?B?aUN6eHZGdlhJZmFsbHIrT0E0S2dVNnU3SVdkSkF2bWNkbXN3ai9Fc2QxVklU?=
 =?utf-8?B?SzcvNWJabVNEbFQ4VWJvTDROQ2ZlbGMwTVBHVDFWY2UzT0pOR2VtRWw1eE9Q?=
 =?utf-8?B?U0JMd3E2Q04zWVR2UkNZWjRLd2QwSWVmOTcyOHFUT3BmbXZ3MVBRUzhYaHVO?=
 =?utf-8?B?cko5alRxSW4weG05TWNLQjJEeUdHZnU2QVV2SEdzZDJUTG5vejgrUUtMQWxD?=
 =?utf-8?B?bDFubmxRSUU2Mlk5UnRvTFdGVDBwbERlRGJ4RU53QlljdlVaZDdxcnBjN1ZI?=
 =?utf-8?B?aStkMENOWlZ4OVE1QXpXQ3ZlWU1VNXJpV2hkM0ppM1o5Q3YxOUxzTzhla0RF?=
 =?utf-8?B?TXFPT3hkeHNQdm1obFVpSVN3cXprT2FtN0FncHdETG40TXJaQmRqemhNdXBv?=
 =?utf-8?B?OUdzcm5zQTQ1R2NXR2VEYzE4YkxNWnpYK3RKMWVUNWU0RTlEdkZJekdqR2R5?=
 =?utf-8?B?R3Q3ZGVLbmV4Wkl2TGNTMmZwTkJaMThDRW5VMUFFOUNMaEN4clZBRnkvN3BV?=
 =?utf-8?B?cW5PSUVtUnBFbXkwaC8xWVBXem1rY2d4NUhUTU5qWk85VEI3cnhOdWRkR2sv?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tf8V3o7Vbe7vWuhRb5H15qdj/T1Aqzq7Z11e2v12PD+RTSTy2CMTfR6gyTO+mka78qAbp93bCoHSO5RIDArfrq7jmQT0rgHXjVSl3ZHIzuKdWiPr6336ZfIJigg3QMHkKX/hRk/11wgcZeRafqOf7wfQtRS1K2NURzpZR+LTk4/SCRTxz84OOB7KxqqWx4lwPSHo3w37DP50CW8VfWnYhqIhJoH/+Gqa6jFPSGgu2kcgZ015IonPU9A89EwAQPNj0OsI3J0cmvdITjz/g0E2F+HupRMdwkV43Bl/EQpOoMCGkzbAbj4sut2cqVLCRw/V4DWSsGpuBmkVynLk6KMpBFQGCMvbmHmY2Cisn0c7eGKmyOQ4HH2jQ3QsW8H6uab8RMIybpqB7oH/nXrCQe00WiZBwZgbgXehitYhbUtmMF59DfhygsC3VXMbtqoUqv5xYu6pghAenNg9gRgNW4V8qLRwCYl0nJhqTJy33BoKxWANTwJrQs8YoCLqTkGG8c8BS0n+n+56yBB0FeKEFMl/MvYqgG+XGiGKyzIZ5gTlv0MvqhPaupdavfDmiJlplsMMrYzhuu+VUeCh82w7dcn12UXIpwUG+sGle7e9IzVylpU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3e83c4-66cd-4bb5-67f7-08dc2c1692d4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 22:04:24.5234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMXWzEu4VM3DNz+q70PtP0cddT8VmcBBwPFHmOOjyrHTZFKRg+4O7fp6xDf77nUzn4NrZyZI6CgxoaqKfzhnHWyuTyZogkAnb8uuDYQTZgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4944
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_17,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402120171
X-Proofpoint-ORIG-GUID: SpV8QKcJFx2xQRh8ZK2Ryom3byIUI4vk
X-Proofpoint-GUID: SpV8QKcJFx2xQRh8ZK2Ryom3byIUI4vk


On 12/02/2024 22:52, Jonathan Corbet wrote:
> Vegard Nossum <vegard.nossum@oracle.com> writes:
> 
>> On 12/02/2024 11:28, Vegard Nossum wrote:
>>> On 12/02/2024 10:52, Akira Yokosawa wrote:
>>>> While testing update of sphinx_pre_install WRT pyyaml, I noticed build
>>>> errors in "make latexdocs" against Fedora 39's distro Sphinx (v6.2.1).
>>
>>> I think we can solve it by making 'current_language' a true element
>>> attribute:
>> [...]
>>> This is probably more correct anyway.
>>>
>>> I'll test this more thoroughly with a full build as I think translations
>>> won't show up when using SPHINXDIRS= (because the translation is outside
>>> the source tree) as well as with older/newer Sphinx versions.
>>
>> In the end, that first patch caused errors on Sphinx 4.x
>> ("TypeError: LanguagesNode.__init__() got multiple values for argument
>> 'current_language'").
>>
>> This seems to work across 2.x/3.x/6.x/7.x for me:
> 
> It occurs to me that me we should just have conf.py just not load the
> translations extension at all if the builder is not "html"?

I think we need to, otherwise it will have one of those issues that were
discovered during the original submission: if you 'make latexdocs'
first, then 'make htmldocs', the Translations nodes just won't be in the
saved doctrees and won't be there for the HTML output.


Vegard
