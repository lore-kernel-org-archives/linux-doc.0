Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE045657CA
	for <linux-doc@vger.kernel.org>; Fri,  9 Feb 2024 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707463905; cv=fail; b=UJFsUjWOQTrgHHa1TNtOE3coQgGme1wFA4nUsvQMAmAT5nRu02lP7UIaMwnhg3y7YVyaHGwSMYjxwul685S+fGaR0B3Bd3d13nF7dnrahWc4J58U2UfoAp6BF9YJtbDh8c2jHk6uDd26Z2XsdmEohiWr51IMVnR18eOPy49idv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707463905; c=relaxed/simple;
	bh=8E1u4JiAle0LeZrppcnICaj3oQ6cC7w6H8p+y+xEa7M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JWaJ32v9kUrpoKRWteKBySgiAFDK+4aembh2s3g+3eH/kxfi5UI8hkMrD8kTM8lPV9pkLU556Wu/Kxfhd4whQfOHN9qjHnPuC9e0velz5dDGb9BFtYorTAercD/UoKyryWlW7Xi8XzDj85RW02CVRawM7wdi9zST1OU039DtfeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jH/1POjQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xSRoqqmV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jH/1POjQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xSRoqqmV"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4194xxYw025764;
	Fri, 9 Feb 2024 07:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=brgaxUGDkjrLl8mSSYVj7DK53Z6ZeyR9xbza3XsLmNc=;
 b=jH/1POjQ/OtS9kVMcUcB634+HWfOGw8KuozudbN4z5Sz4susGpk4WJY/iKlJ83S6Dm7W
 pOG6LOnlKMBnopiHIw4VNBRnMWHZ4NQiS1o+LxZ8J6nZ3zOd5MvhO5O6SeMwgVvu+cS4
 o0IG+5NloL4DAm/jVKxiD3MT29HTVnpQMVRSD1o1w8nOXXI3QnhY4dVa+aWQdr9pgYo9
 rJltzp0fUmtfvGfeY73bFvDbRZYSIFN3o96s5WTUrbPKFqW+GFg4A2IS3+/Sf+S2YI44
 Z/KBiDDSKC07NU/o4qs5v2HoU1cgM+JeFvNRQBOpxVSGaJEEnXJe7UeqKSbcUA2+dZp7 TA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1c32xtve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Feb 2024 07:31:14 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41964Ox1019833;
	Fri, 9 Feb 2024 07:31:13 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bxj3hxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Feb 2024 07:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEIeXRXLldnvFrxOeoOl8cU+6gHjNiyQLrGXW6h1FCdP7CicnL4752viu9Ssgn3s2/+E0+oVRUz4wjJNMjUU6v4Qy9KT3CNjwtVnGbkBQRIgnLsGDEQSp19fWK1JBmBdBNQ3SRPh+ImLMlP+DQX3Q/HwVPyB53taYOJOC1n7R36v/lMREGSeF4uD2mPfiYFKxdsW40nmOWUbMv+0hhVv8TJvfscDVjfv2mTRvPUmx0Y49cIoKhZt8tx+sZiZ7S0yExsrPYedtbxJbVFcDoOfdZv0Vv+SdWiBCOK047eezFu11XkV2mLF3qPKfPlvAkCxnimJHWnKUVXmOTLmjI/IHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brgaxUGDkjrLl8mSSYVj7DK53Z6ZeyR9xbza3XsLmNc=;
 b=Hw57Rl5oWJcKk7TS+D/Dl5QcLvQiYAmvvcrI8CnIiwDqMwOLZma8FcqIRZTkGHeJ1b9spe9mig6tv1tzR/sM1tuGY8sy7FpthZXB4HtBsUnp2lilqTbpB31e9CYSE4YkC/C6VSJgkZeip/sfgzE86maisOm7gG/p24lU+rsz2+xBqazHS967FuAUgjhPvHp3ec4YxzcL4TVuiqHbzBJDinvV9zivh3IjhJxsYACZnRSAdJmK9vc9JnoXIBrF27zeNGyJJzzELBVJ//WT/RfYXEWVvm4ojbHO+a44JdAM1GjFRAeqf9Ius72G554nRKci+LtvLPWnrEaJ5scfu6vS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brgaxUGDkjrLl8mSSYVj7DK53Z6ZeyR9xbza3XsLmNc=;
 b=xSRoqqmV/UrNB/xNeYASFmAC0Lye8X4EN74KMgoVZfwIthuHnL1t50RuEeo0hZ3ge09x+HhNpYf8Wwz5Itwq167/PkMbFAJF4f1Lm+FIy6fAfkjXEC69LFGqlOPdfkhGYzq5KW4M7XM4SwA5rP7T36/1UwNgW0wMQ3ytPHdYLa0=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS0PR10MB6200.namprd10.prod.outlook.com (2603:10b6:8:c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Fri, 9 Feb
 2024 07:31:11 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33%4]) with mapi id 15.20.7249.039; Fri, 9 Feb 2024
 07:31:11 +0000
Message-ID: <e66e7fb6-3877-4de4-8086-b09c445e6b14@oracle.com>
Date: Fri, 9 Feb 2024 08:31:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH docs-next] scripts/kernel-doc: reindent
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20240208161705.888385-1-vegard.nossum@oracle.com>
 <b7c5562d-611f-43e5-b78b-122c84941f60@infradead.org>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <b7c5562d-611f-43e5-b78b-122c84941f60@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0413.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::22) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DS0PR10MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 862eefc7-63b1-49e5-e4ae-08dc2941170c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HYHW38AxvZZHxIzPYjW8Oycs04bdoZRgtjQIouLLzbtFPesKVIMYu+1FNH2hN6axSrNU2/h0fsykKFZk91NDMWFEZpoNBfnFKcLa/iKdlrmeqr3+2VbABitxqy+2kCRrIyw1yjS3NhKTVs4DOeRhSseNiJCpQ8xLnwzMs6F0eOa1NbPiuu59s8/Sei+xt6ico9X2l3dZsFH7yT+c7wlvI6ZAsdS3CXHU58SSLDePGjFgcLTSzrG7tuo7RFlndIJpcnaKeJy0qFtxHgDHl74QV++1m9YMoiT8M6RbiVFkptto9ZO/FYaTP9pFG93wNoKgwqcCn+DsmqwV/74RYnoBSZZG3kYO/5DGLHZKE9Q9WGiakc0xeLsVpE/Xm8xw3opH+J6ZFLrNk6BWaatj9cyDEGCd+6/4bmcJFX9dDcm0cb+BPew9IP7HLCNYHp4nTWACjf36EGa4TQ+diORj2Asye/82WNpxfvs8NIgp4xlXxNzn4/7+l3EooNRocKLXvIZXMwuWG71KI1uOcwbfHYDAKe1TMq5MWc1vIrJo7lDTCXw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(86362001)(31696002)(53546011)(26005)(6486002)(316002)(478600001)(966005)(66476007)(6666004)(2616005)(66556008)(66946007)(110136005)(6506007)(6512007)(36756003)(38100700002)(4326008)(41300700001)(5660300002)(44832011)(8676002)(8936002)(2906002)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlpBQ1NNK2gxRHRHcXBDdjUrSWVjaEFYQ3Z5MTFuTm5OY0pKeVhaMVRHelpX?=
 =?utf-8?B?M2hMY2dRaDdYWTJXcTJDdmlqNjVzT1ZGRjlDN0JpMnBxeENMeExkVE1IVGds?=
 =?utf-8?B?WjVlWjlLT1dRWFZLZVBhUTE1NXhORnYzSmpDVmtsSDlnZmVJbHRrQ3hTU2Yy?=
 =?utf-8?B?OUtIdjVySTZneCtnV0dBekY5eEFUOFNxMVlzbDNqMlpnZVhKM0dtTzNFYWdE?=
 =?utf-8?B?aEYxSFh4dzBqNTV3TWhSZHBVV1o3VmJiOEU2SFZxZFc1dXU2R1pzVGVpY213?=
 =?utf-8?B?clpURzB5Y0VEam9uT0FZbzliQzZLQUFFbW9hbDBxdzROVFVSZFpXcFlaT3cv?=
 =?utf-8?B?NXUzcWt6Rm83WkNyUnplZmRnRTV0VlN6enBkNHNPdTR3dkhTbERENm9NeE8y?=
 =?utf-8?B?VU1ncmNBUUlSbmxTZU5Tc0dhaWYzZk0zT3d4TlNBLzVvMThDV0s4ZVZza204?=
 =?utf-8?B?RTdPNzdrU2xMQ0x5a2Y3ajRZNHVFVEJrV1VvUC8rdmpPc2VJdkxsSHR6OGVV?=
 =?utf-8?B?ZGQzdU56Z1JRMERWKzJIaWdwTDBMWlpvc0RRenA4Q2xEbGdIU0FzclBRR0RO?=
 =?utf-8?B?cW5GQWlaYWNBUlJNQ05Xa1hTc0c3WTgvZ0xXM1F5N2ZTL3BlTjJiSTR3UmpC?=
 =?utf-8?B?RmkvSnpMayt6UmZlWHViTXczV2FFVTM0UlNXNVg2MHM0eVVwcWFPZDJFZFV0?=
 =?utf-8?B?c2YwYkRqdFIzZFdTNklVREN2MG1wM1dveFlZakFFeXo4cHA4UFI4dnpYakN3?=
 =?utf-8?B?Ui9GblhhZlBmTmsxa1ZSZzZGWk9lUlVRaTBaVDhONkQ3MHE4NUYxVmlCSW5T?=
 =?utf-8?B?czk3RG5JbWgrcXFGcFJFZmVKSWFaTHVXWWlOeHJDK3JOV0RTUTFsQUxYOEVH?=
 =?utf-8?B?RVNQZ1pCaC9QbzVsR01IMU5HckMxT1pzMEJkeFNEQzdNa3IrZkg1UmhwM3VM?=
 =?utf-8?B?b090OTVZSVQwU1ZzQXExcXBnNzRkbGo3YVVKUWZkWlA2cVlWdFZyMVA0TzNp?=
 =?utf-8?B?Um03R3ZnZzNYNlhNUDFpa1E1MUVjRjBCeXFXS3JNOWQzTWF6WXdGdTl5bUt4?=
 =?utf-8?B?ZS9OQmVOUjBLWDlEM2lYR2p3WFdEeW9YT1cybFBLaDU3SnVpc2FzTnNlcXhW?=
 =?utf-8?B?SHd6OW9KYUdxY096aUdMYmdSMTNCSmNCaGE5Y3I0cTNoZ0NzWHBIdHBROVBE?=
 =?utf-8?B?MW1TcWNmR3ZXQ2NFdzF1U012eHdDUk0rZk5PazlKSjBFbGpZVU9tNUwwWVNp?=
 =?utf-8?B?cTVBWkZSTndNT2VEcDlvSG96ZFZrYnBRdlFzR3BYTVVjekc1S1RjckhrakxR?=
 =?utf-8?B?UXcrU1VvNFVFSWZmaFREeXlwWDlzWEM4dVl4QTRUM3piU0cxYmZMeHhwZXlN?=
 =?utf-8?B?VGprRzNYdWZDTlNDS0hMSVk5cStMRjh0YXBYYmlTN2ZWU2xkK2JYRTByQmlG?=
 =?utf-8?B?NWxUbHZNMjEweEFRMDN6SmRnd1c0YVZsK2krWUVDQ2tYWkRzeHJFVTREdm9p?=
 =?utf-8?B?UmlwTU9JT2h3MUdOM2pYQVA2NWZyeEN5MEVPbTdDeVh6dUpXbys3K3AyK3V1?=
 =?utf-8?B?djFweTJ3TzQrbmVlYzJIUWg5Qjl6U3BXaWgzNkNWTTJseDJ5dEJpQjVQS05j?=
 =?utf-8?B?WXRhQ0NGdzlFbW9qYmVHSnRINFBmWDdNeUMzUC9SV0F5bzhWY01RZWJGeVZM?=
 =?utf-8?B?SEVBRWphbFR4K0lBQ1pzQjRVN2pwdFl4Zy96NkFoSUVxUWt2UFo5dVVEbUc0?=
 =?utf-8?B?enVqdVFGQ3pidGRiWUNoOEIwL1I2VzZTdXNJUDBwOWcxZVNXc0VlclJ0SllT?=
 =?utf-8?B?N0dNM0FieE10Rkx6RW90S2JJelNObHhtWGJCSCtyVDE5SUlKblZuOG5Vdkxi?=
 =?utf-8?B?aXBqN0Vubkt0b2hHOHJ0N21mdEVqRnhtRFc4MjEycGk5ckZ5dmc5MWVvK1M0?=
 =?utf-8?B?VDV4eEZnZWpSYUVhbHQ4RCtmLzRJZk9udEFCU3RGK2tCUVVaWUN2SlhueDFo?=
 =?utf-8?B?MnR3OGd1WERIMkxRSTdQOTNFQ2E2bmMrSnprSkg3RXBPdllPdWhNNXVhVlkz?=
 =?utf-8?B?dEtLUytoYWFiRHNySjFNalU4Rm9GMUh6QjRuVk9FV3F3czFPaHNrZ0Mya1M2?=
 =?utf-8?B?TG0rREdXVVVOc2xzMHh0Yng4QTJNbTVmT0pXa1VBR3Q1a3pCY1NIdk92ZEpJ?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LBUIbbMUdSg2RSC+f0Jsr7BVyaS/fnRD1VzN5/MyWvLy0gBWGNt2SjRDlAhzvZuINcOnsTncjHPDj2EU2v6sjDXYlhwLGQrnKCO2MYenAFdo9YTNPPM5XKlT+fyeIP9AuUOKez3cnfi8ogCcqNrQwDWzS4GHjVJwb0VNXUYUlvfkz0+ItQICwxV3m+cK+EG/zjso5fEk2YH2a+oJgO/LoJp1sYDgrCW9J7Aimrc5bUN3e63/rCv0hu9d0xlZup6p7qoHKO7NQzLfwWIy/audtpWuFGbwJKata00VD/pxQPLLT1bQmB0ldHdz8cfUOwAWUOygvBietVdWUW5M218qmbeefObB13z1T4Hh3KLDOdkxgg5dgSgzj9TEHpONVn4LWtJ2jN4dtfYkXTpLDKTw3CNmP6860MsGrm5qR616VTE/psgun9Pmw1srhusLkuTxWf8F5g4O76k4imrZVkR6RHe4sE8QxZfK4RZX+Mr6ld2sl2h2ifOp2WY2t1Ujbqyd1SeKkn7dCPHVXi92GRwRQLczjeBaUD/scTbpJ4GZGKjI/1z/Vp9HVcWyM6lhK25SlBD/K43hDc9PxKTqdXvuTv+xmYd9N3FXmOWeYJSH/m8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862eefc7-63b1-49e5-e4ae-08dc2941170c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 07:31:11.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6d7KkEtxPzRfGofUfBuGqrNF75TARXwpOYDKjGyiUdQGNBgMihV1Rckyr5kHt/jq4YjeioCYn6LTEXqXdq5SKRBDUniQ7sHls0yxBM7H4DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6200
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_04,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402090052
X-Proofpoint-GUID: S4m4MQhQAYdEL9-t5pLAMZfSAdUl-_yO
X-Proofpoint-ORIG-GUID: S4m4MQhQAYdEL9-t5pLAMZfSAdUl-_yO

On 09/02/2024 04:49, Randy Dunlap wrote:
> On 2/8/24 08:17, Vegard Nossum wrote:
>> Bite the bullet and reindent it by hand. I tried using both perltidy
>> and vim, but neither of them were up to the task without changing too
>> much or getting confused about what they were supposed to be doing.
>>
> I'm not verifying that the changes are whitespace only, but this change
> needs to be done.
> 
> The only downside of it for me is finding what commit to blame for
> a Fixes: tag. I have no good skills for doing that.

Probably the easiest is to use "git blame -w scripts/kernel-doc", where
the -w is "ignore whitespace changes", meaning it will successfully
traverse history past this patch and attribute lines to the correct
commit.

You can also use GitHub:

https://github.com/torvalds/linux/blame/master/scripts/kernel-doc

If the specific line you are looking at gets attributed to the reindent
commit you can click on the "blame prior to change" link just next to
the line numbers (it looks a bit like this: [[[ ]) and that will give
you a view of the file before the reindent.

> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks!


Vegard
