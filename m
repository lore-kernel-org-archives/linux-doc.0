Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C45E182A3
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733735; cv=fail; b=bMoBEErTKn+jS5rwTo3th35hKRgZz0puTJmd2DTTtvPsAVJnCv4s29KHQMe/cJuf9/8FFNgwcva9uscDinoCqxl2zK6IbZCcztUkYdV45OFX+voXi0VLjuo9Fbpv5Xt9KauvKLbywHciYgv/ycvuzAi9FiQSAepLCZFoEoDrJCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733735; c=relaxed/simple;
	bh=O5TKLlZIedxfGKVKcbf1QhBe4sGcZALvBaO4t/o0irA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bbIrw6fOsuu+75g3RgKCiCX/bAiE6tSAqTUhdGvCD4w7ku2RKqakOLX50G+6+vRViAvSMAns37u2iPCpQZQ7GK/EVZy3EU+iQEasctXJ+QS+k4d6zHAykic66Jv+LczrCZUM13fUQ5kPKxYI+VrLwyaZQzKPOM49zGxBoVUKSjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TjKIA03l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eVhv+w3q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TjKIA03l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eVhv+w3q"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41CAElH2024297;
	Mon, 12 Feb 2024 10:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=lA/yPYaZhYm7EaBT47zRZzMoWHXM/8Pm1sw3wyrt22E=;
 b=TjKIA03lhYOYbp46TwHLLCsF1y2RTXlo+5zmpTBuSSXF78k4Bs87w+CWBo90C1ya1ou0
 a/zn0QplwsQ5TNyl2/3a05FQGujagNwjfYfrLMDeuRFjeZdrJtaOKIb27C6xTMPJgO0X
 pjIcZj7Smhl2EpSa9YYDQ7vPmLMhzUEigXT+z356C9vUZJsArr4fZl+vDKF5Sgruc2My
 D828HGCrHPNiAqvwu7dWQGleYtHpK796xQbEpt4fFv6GmWTjVZVbx30C0vJGCrvRG5yH
 iT2CrNig3UHDTMpuov7cNMgdZahf3QvmGH6nJk9bqcNpr8lf/4m7/DyBhn54f5AWFBiV sw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w7fn4r92e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 10:28:50 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41CARQVo015119;
	Mon, 12 Feb 2024 10:28:49 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w5yk5kbj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 10:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2L/8llDZXxaPe0WbMggz1a4X8cyERQAjgRxO3Jprp1zOaB6CMIyzdy1YFfWo9YE5E5tHMUDxpVionS8+TAzbzrKG0RL94eIoxZZQ9RXWTEtFeLOBUrrE95uHpTeOx16+MvSCLJoUiPjVD3qgAJhc0RaBBcc+v01TXkdHAwoSH6qWZAO06uGb62/w15u9tGDcWhnxAL6MfZz0ch6+cXZRs9j0AvDrXw4vgXMLIV+3frpiRRuhDpTGLChwB6mOHgi8EPVBVww6vnyku0pOt6OfLQMBDeBNNzb053ghBD+nL+EKWtLm82yx7cnCkbuk9esL0cb4PZBxjs7M6RZMOS/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA/yPYaZhYm7EaBT47zRZzMoWHXM/8Pm1sw3wyrt22E=;
 b=m2FLRLh+5Pmp/UlFCbFG9GohB5uPFWgRTASnAIChDDkdh9tWP+xWNGbScaR7uQ86WMNKKV8znurK7Y0JjI5/tKetz/0iCq0p/RX0nEAusjmhPI5/+36dt69z+Sk1XvWx8WWdG9ATRvxdMMHU112nIE7bSztsU1Ip871rqq5tCNP1wEEOHevhHAYXJ9F6W9+uDZNfgJ4Y6J7Y4pjGUg0vJ8uUNwhnx5MYPmTLBzI6sGOSMjNQRO55CwtEGE24fBQtPp35tDjOVxaNcV3mlyMXcpSV9ykbnWSWkaNqyRa6CxQ3pwhLqfLpsXgNq60A2Wx/cRkL4YAAWabK/xCET3XZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA/yPYaZhYm7EaBT47zRZzMoWHXM/8Pm1sw3wyrt22E=;
 b=eVhv+w3qwehTSrilm7rFFDw87wXVbKokSFjuF8jmDOFo8Y4Oru4yRCFeaY3tTmqMmGbcwEaSyHcjwk0ZYZKUL3vxqmSnRtEaNuDmvW0MelMTK+vm2NYYAEfEG29MoAQKT7oFq9rIgK9vTO2cYVYewIGJ+ilvZNYiMKqtpq1Xw9Y=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Mon, 12 Feb
 2024 10:28:47 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b%2]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 10:28:47 +0000
Message-ID: <37ecca9e-83f9-4f91-9b76-b5bd012dc3ee@oracle.com>
Date: Mon, 12 Feb 2024 11:28:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: docs: "translations" extension breaks "make latexdocs" with
 6.1.3<=Sphinx<7.2
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::29) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DM6PR10MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb4b335-6efd-46b2-1379-08dc2bb56575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	31zAosAmCAWkB+xpM8MMr/6NbvqF3b9suP5rD6gyyhtmFVuDy83deebdH11Shyt/A7eH7FDK8RS2zECXF9BdaJsntfjM5sBxwMu+OH1hjvr2Q6SHnBZcZZKxoWgX/akoSLYa5to6r0/gZWPrJEJomz/p6mZD3LmyScjisV+KS7B+FceOUHtE0z4b6Ux0vfoS006TreDekoEDMIh/rB3ySCO7Ktbw94Nv1U2ng39MuTJaIpcujuF3qajm5DmiIDK/MW+/BaQ9oaOZM++R3PhFegYs1v3okL2RHTwcGNh1SBW9AKLFcbwPtjWDrlpbsKN20A0V1JcfHbieCJC1pEno8nZlTJ/8W/7IHMl8w6MpQxbP7lBt+lxJ+1wlk7Drfo4PRMKy/c3rc9Fy7s7u8iYAa/ckjQ8Q0AOpv2GjygCLoh4L2M9P7W7N7IHZthdt0ldL3aVWBlhjcv9jppcspsPB/BkMYsSkwR6SrQzZYqe68E/Xvblr84WULY7ruXItz7TwVr+B3u1uCaZp9GW7XXdOLdFqb6Ke5x6hPKzzHqwLRTpdDxwLSe6PlaZdrjoIfjHc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(6486002)(478600001)(31686004)(41300700001)(5660300002)(8936002)(8676002)(44832011)(2906002)(4326008)(6506007)(53546011)(6666004)(66946007)(66556008)(316002)(6916009)(66476007)(83380400001)(2616005)(86362001)(31696002)(26005)(38100700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWdLNXFDblJtU2FvNWo3dHV5SWZleDZMVmYzR21ZUGhDTmVUYkJuR2tFQ0l3?=
 =?utf-8?B?YjJyaGoyM2RsNFBQYnNvT015cVVWV3d0b0Fmc09KMWhjTHZmQmN3cmdkaEZt?=
 =?utf-8?B?b3VqcjBjRVN0TmJrempxWTFMOEN1ZGhUdU5PQVZZVGZ0UGpVa01IK3pDMzMr?=
 =?utf-8?B?UDlWVjhDeStQZW1DK1Bkc1h2UFA2N3lpRHVnbnhqR1BEY0h6K0ZMNG5aRXlH?=
 =?utf-8?B?R0NueWxrUXVpazRlS3pYZWNOZ1hkYmttUkVYaHkyZ3hyUmlyc1A1T00rbFBj?=
 =?utf-8?B?eW96Uzg2OFE4SW5EODBDOEZrNGYzNHZSL2MzcVRwSGNBNEo2L1dNeTViSkNJ?=
 =?utf-8?B?T3JNUmxSV3dBTzREUUFBT1RXaC9iUUFISDl6NHBqU1NrcTUvb2pjZTZsMlFu?=
 =?utf-8?B?VlF6R1k2TTBBdW1yVjdXUDFOWWc3WVB3UmZsS2Jqdnk1eUhIM1BvTWV4WWFC?=
 =?utf-8?B?WTdNUG1kOWZ6M0JrY2tOSFBXdHRvVnViMmNzeUxKNHlBOTVvRW4xeFByUlhr?=
 =?utf-8?B?bjljakd0ME0ySFA3cWdManhTNldpSE1FQkZGMFVLKzRJT0xxRDVpQWtpUU1y?=
 =?utf-8?B?VllaRXZEWTJrcWR6a0hLNGZ5QXhLcjVjNHY5K0ZjaGtTeURCdnByOGFkUkE3?=
 =?utf-8?B?b2hEU1NLU0c5RmwyQ2l2RUpSZGtFZmhtamhFbE1xS0pqd1JCbXRJTU5HTEll?=
 =?utf-8?B?MlQwRzU2bDh5NFlKVkhvTFZrWWswdHEwQ0FzV3BhWEVITGVycFNzQ0d1Nzg2?=
 =?utf-8?B?RmpCSzdWN2c3MjBvU1B1MGwvM1kyQWNDcUlBRU50bmFyVlBWY3VGVmR1Yjli?=
 =?utf-8?B?aHVHcjJiUTJGOFQzcXNxVVl4VGYwOGZKQkFPL1lFbkcyQmo1bU9ia3c0NGlY?=
 =?utf-8?B?L1dWMUNmRWppcU52cFNFM0diZkJDZ0JzMEZlOTdBQXpkbHUyNXU2cmhsUHlJ?=
 =?utf-8?B?WWgwdEtuaEVTcUZ3UDQ1bGdwY1dobmZ5VE9XRnI5cElJakhsTXdicW1YUzlm?=
 =?utf-8?B?MVUwRUpUaFFNMDNMQXhiYUlib25FYW1ENEZSMkxMZmlTek56Z283L2NmaGVk?=
 =?utf-8?B?bUNuYzB6QjdpbnBGNS9QUTBzYm1mY0NwSTR6TGluZDJBbVJsejNOSnBEYkdC?=
 =?utf-8?B?a0EyakwzS3gxNTRFWUZURkhwdkVDblRuZm9LZUs3Qm9ZV0dvZFp4RGZ1Uith?=
 =?utf-8?B?MGZPazRjeWNPTERPOGsyL1F2ZGl3N0pNVEpUN0JHYVB6V0xHbWdkQnVKNm8x?=
 =?utf-8?B?N3pvNDlpVGx5cmtteEtuYTc4RjRUeTBOQVRSRUJ0emZPYzdRcWNvSmoyMnoy?=
 =?utf-8?B?MDc5am50KzlEOWFyTTFEc012N3BUOThJQnN1R0N2QktDR05CZnJaeUNRbDg1?=
 =?utf-8?B?RWtRVVlYQnY1MWdlTWcrRXd0YS9BeWZPeW1ybSs4N2x5aWE4UFpXNEZ4dTg3?=
 =?utf-8?B?dGxxYzZBUDVwWkRwVWZlYm53VXRZMjZMa1hyYmsvMWJEZmFBZFF3RTRCMVNE?=
 =?utf-8?B?TVhMc0JuUmpCbnhJa1A2VENLRlhzVTR0QjNVS1RRWU5tRmxiU3ZHL3FVUDVN?=
 =?utf-8?B?ZzVZSTdtQnU0VWZJbnFkYVMyTkxxc09WQ2RvWmdsMGVJUm9IZE5aWUlhdEZL?=
 =?utf-8?B?S3BwUEx6VUp2emcxK1ZPVWxyQ2lESmFxY3RKdnVCRkk3RCtaTy9kdWF1SVJD?=
 =?utf-8?B?RWEzWjVOZThBK3lzVmkrbHNuVWZ3Qm10dXM4Nk1ZWHlwb3cyaVB1YTZzRDlI?=
 =?utf-8?B?RndVS0xGQmtTVWtWOFpXK3l3N0lJcnVsOXVsNElOMkZxcGdiRlh2YU01Z3hM?=
 =?utf-8?B?Rm1ZTGI0UUliZ3o3ZUhTcklZVnArZU90eXB3SjdEeEZZZWVEZitKU0pUVmht?=
 =?utf-8?B?WGlEMFEyVFA1VXBJZTlBNGlvS2JXNnBDUHk1dzBMV0pJSDYvUkZMdk54dXBa?=
 =?utf-8?B?ZVJKODZOY3ByN2orekV3NGp3ZTNpbExZSk1xenBNMGVuNzdGY0NBVXZHYXZt?=
 =?utf-8?B?Z0liZXdpdG1DZWtSemJEOSs2V2lrZ2VUeEhNUitJaHZURytvL0Z1QkJIekpx?=
 =?utf-8?B?aWVlVElvSnI1Uks0QkEzVHcwajFZWmpiV3dBNThrRVZTZUYvdjgvUTZpSlN2?=
 =?utf-8?B?U2NjNlpVZmhLOVltcnRpK2JDU2tlRGJZNmVlSmFQR2NaNWNtQkdCRnFNZXpD?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IHqFQtTp/fMkdzS933g6K3Hcq97YiO8FsfTwzw69avaKXXo/BVQ66m6mozMkj9OVJeRzzisn8pnsgDEyZcfkiyLEStlmIMeKfCVI1DJEc9g/F+Aqn9hH2AzBxqNaQJhbmghFVPMMtHje0HQdDTG0LHHEGDjF1hDjRqNPoDTTAVFKCcBTeNdc0S9GK72CwjZCYRlvLjV/Of0KiuvT09NhIgkxFrpBwiwHDZ9OJYazR3i9CqAkzyFe1mV2237YL/Dw+1CgvlvqNUDyjObgge11xiB23pNWVhyDVZsHSrN5sfmLhTIfIWJNv5N0vMz4+mBpBF/JVU6QWV+xW68Y+QAvV4QJxxmbfgVzLAbNim57+ZPvJKwTDLZx83ieh0lIPoOmsc1ant9j1Mn6N5o44OcEN+eAEy0jff4pLdU87pJjg15bfabSnKxOtFBxxRV+2luQmzyjcwRZvg06/yhCu14JFPp24uqhbtduHlChNTJTwm+TVdQT877SV8qtcn6gJBWaOPGBpJCoBEq02uoy5d7S7qjTVey3Auqlq9XSY6qyKjoFr6+zn2S6ZM4pPEKA+pzksLAr7SrQqJTLjEmbL3RcnuIEKCNK28na9+zCjYjXPMY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb4b335-6efd-46b2-1379-08dc2bb56575
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 10:28:47.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7alodSBsbeAcRF74MKuvMNpzxvyJRCMZsdkCMAYkBTIbAAd+EofkH/p0KICHknLPLBaDAcWp/zsNEoXX5Vz42k7asAwbC0If88FZXaeg5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_07,2024-02-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402120079
X-Proofpoint-GUID: QfItIKu-eLrco8gHbaysr3HR7r5HSOko
X-Proofpoint-ORIG-GUID: QfItIKu-eLrco8gHbaysr3HR7r5HSOko


On 12/02/2024 10:52, Akira Yokosawa wrote:
> Hi Vegard,
> 
> While testing update of sphinx_pre_install WRT pyyaml, I noticed build
> errors in "make latexdocs" against Fedora 39's distro Sphinx (v6.2.1).
> 
> I don't mean the translations extension is doing anything wrong.
> 
> Repro:
> 
>      make cleandocs
>      make SPHINXDIRS=doc-guide htmldocs  # for yaml -> rst conversion
>      make SPHINXDIRS=doc-guide latexdocs
> 
> At current docs-next, Fedora 39's Sphinx ends up in the error:
> 
>      Exception occurred:
>        File "/usr/lib/python3.12/site-packages/sphinx/util/nodes.py", line 624, in _copy_except__document
>          newnode = self.__class__(rawsource=self.rawsource, **self.attributes)
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      TypeError: LanguagesNode.__init__() missing 1 required positional argument: 'current_language'
>      The full traceback has been saved in /tmp/sphinx-err-7xmwytuu.log, if you want to report the issue to the developers.

Thanks, with all your info it was quick and easy to reproduce.

I think we can solve it by making 'current_language' a true element
attribute:

diff --git a/Documentation/sphinx/translations.py 
b/Documentation/sphinx/translations.py
index 47161e6eba99..f20c30599ceb 100644
--- a/Documentation/sphinx/translations.py
+++ b/Documentation/sphinx/translations.py
@@ -32,7 +32,7 @@ class LanguagesNode(nodes.Element):
      def __init__(self, current_language, *args, **kwargs):
          super().__init__(*args, **kwargs)

-        self.current_language = current_language
+        self['current_language'] = current_language

  class TranslationsTransform(Transform):
      default_priority = 900
@@ -84,7 +84,7 @@ def process_languages(app, doctree, docname):

          html_content = app.builder.templates.render('translations.html',
              context={
-                'current_language': node.current_language,
+                'current_language': node['current_language'],
                  'languages': languages,
              })

This is probably more correct anyway.

I'll test this more thoroughly with a full build as I think translations
won't show up when using SPHINXDIRS= (because the translation is outside
the source tree) as well as with older/newer Sphinx versions.

Thanks,


Vegard
