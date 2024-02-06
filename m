Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C61AB813
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707223226; cv=fail; b=sLXeb6oLGPoi1LGpQ6xyIoP8058iSkI1XWbqx66CBXoLND9H02dVmg5DDnNirir+GeM0bteYAGipNAeYhe82DRuAQQy+Nwwd/NdPsbDUNRn0tggHgZ8c3cCj4+Z40pGZ3bFayzqZDvMEckAdt/UlOlN66KL6cCPeKb6BEBkIWFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707223226; c=relaxed/simple;
	bh=Ax6dFu/+C6T80KgOwVgOxwXgMHRg1R95YFzhmHchFc4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EOihqn57AU1HKVSZH+f8zhifS5ylcgC3JWFHNJ5bcmaZFRgJMUtnUcLm6W9ZnUuOiIak0bVOms3gKHiJsRot7txYz83qi9eJh/0VD5U1qND358q3FKBtVpvKpRblKxnANiPHDKbMMI9xzL6EFnAazJHt8Zr5PK/37r9j+bw6X40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=arY5CjoJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mmKs0Jaz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="arY5CjoJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mmKs0Jaz"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 416AYDQ1025371;
	Tue, 6 Feb 2024 12:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=w96TjSz5IpeTckRHWlnyiGDxlqQdjvEIoy+YMwpuxJQ=;
 b=arY5CjoJLcNumh+oYrzTQzgdPZhI757g1axcobQK5b4MIGpoXLY4V9nbiysvmT3YrnSr
 B3v7Iej8lWxXwVHefUDuKrh7vfKrPISXdTPzvMn7JPUviqLywkamQK3x++Bk2Yr0+X+b
 kr+HCAORzVoM3BeKP+YU/VYx0IoXa8c2R074akfVkgEXPyBBKonF2ZaGKmDGyi63VFXJ
 YdYhWN7B0JfjfuBmardHvr9srZmge257dPRY+sf8FJmlbmKBtYcEjQcJFahuRGU/OqmX
 2S3f6HsrEo9QXVafU8Cu6Z6cXYOvqYJVo3ZZDV+tjGA6MNv0Fidkg8uVOc/kFfFCI66q cQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1e1v6mme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 12:40:19 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 416CBMjc036740;
	Tue, 6 Feb 2024 12:40:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx78rfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 12:40:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8Ly1nkQiuOsHWuB5UeoKCOjEre4KMYJUarFMQwsWHRmPJaNGI2AaOFBhrNRZO/l6hD5VX8b1fIYU/nB/AFfMRJVjIw5BvH0lL6NVpDgqAOpnnn0DlBqokhVzIqu2L6txqKrsjjEKRf6VNwoODDaVkbaHiYcJodXTJNXQjoFwqaBz7gtgt4yOOFy/4ZO1Gg2Epl6LLDPK0j1edOd3A/X4qeURrXxjoeoA/mGO9RRsFVnqmhRJqIT6tZ74I6a67QSTIexYELuqMIQu5xxnrrbEFFxpipDAZyN7nEKVf6xuoaQ5TI79AP7qWNgyLEgJdIUANoH1cMS4/r180Mgbbo8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w96TjSz5IpeTckRHWlnyiGDxlqQdjvEIoy+YMwpuxJQ=;
 b=IMruUVk9iQisqPBrRYiu607KcYYZk26lkUoIZUI9alllkf4nvrooZL1VMbofYhnBML2j4+At69ki57goYqlq8TKahg0NY9rVy/t9B3Z2P2o0qsgVOM/vEgHargpbAeCJGPAE45EiAoTqlbdqloCCrDPNdMTIJC0CBV8q7XgsWFnHuC84TV0a+d7yp8VdF+ByK6OqPvlaTeFl+AIC+9uwI/sb1ksmEZ2sFD6To7iYQDTe2BYG6GNXkp76/CpkHeHl89dKcVrfSvwqFqUMrOSV1BsUQNwM6X1943Q+GWRGkXQ6hAjSaJymBs7JFZfMASAQvhI+sjo5C1TKd05FScMVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w96TjSz5IpeTckRHWlnyiGDxlqQdjvEIoy+YMwpuxJQ=;
 b=mmKs0JazCIR0L1D3O/TN8OZSy2Vl7Oa5UErSNTsgChwaUIDMV3Yr9UqKEvelY8VWkDOhkE29diq8IuwU61PE/nryaZPQb0SV8RdhW7DLKrAxGFVAw29iZ8j/6rwqfeI0eRMwBGj0MheE43mHX2x+1tDuQAH5vdkcSak+acWKlEU=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CH2PR10MB4230.namprd10.prod.outlook.com (2603:10b6:610:a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Tue, 6 Feb
 2024 12:40:16 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 12:40:15 +0000
Message-ID: <258f5486-0aad-4865-9b85-16e088467468@oracle.com>
Date: Tue, 6 Feb 2024 13:40:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, jani.nikula@intel.com, linux-doc@vger.kernel.org,
        mchehab@kernel.org
References: <20240205175133.774271-7-vegard.nossum@oracle.com>
 <f3735f2e-dcc3-4d27-94a1-7390589132c2@gmail.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <f3735f2e-dcc3-4d27-94a1-7390589132c2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::22) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|CH2PR10MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: a1717f96-4d0e-4fc2-c2c3-08dc2710c4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WmfC13g/7iWZfmnBtwQpMjXHkxLl2bqTmlcDBvOUnl7iOOIGEvZQn9SNuwCmtfjYQky/jaxfJgHfagjMcVebXt9ayc0nF7oidY6tdvxW2SWpAtKoqIoD/JfRT5jmPZWI3cfBCdiA2K8yesTjmBKkh3+LDpqui8zBG/jDhXmLH8fOczkw/mhPqQJqgQwMa98sQtLDR8XlVyZeU2JvyURxoAn3Se1OCrhfBXmPO6084ibHVCCYnZWagzwZhKEtGx4z/LjRY4YvNtDQpDUMB/X7iNvlnREgVOpmQTOKEohcE96DVy4GcBSKAHZ09LddHFlL8yqA3abVqP4sMcolcgcsC9CHnZ/Qv0Z0zVtVVteDxA8HgQqe8vvrWWppEl64qJy1jBoJmZ32NH2SqRUFzSnmR+37i8nvtG3E2pGS0VpqndV9HrOVzv+TbwDXmbxFF9n+W1GKjqFPrtImxj/6uW+DCmfk0GruZaPYuMN8VKWY3X6+d1vyqpgK1yXlNENwuPbAY5km39fZnSxa3fMF8Q+ZlDGP8DKZtCuj5ger34GzdZpIX2H8QHXqYAzt81lliaUth0CfJ21RFe9cRKHZBLdzyYZ9JlfmNTjJMWVS+GkZSJLMv8bppKk2b+gzNPZdwoT7wQuUv5vxQO/VpGYBmx6rng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66556008)(41300700001)(44832011)(4326008)(5660300002)(8936002)(8676002)(86362001)(31696002)(4744005)(2906002)(66476007)(83380400001)(478600001)(6916009)(316002)(38100700002)(6486002)(36756003)(6666004)(66946007)(6506007)(6512007)(53546011)(2616005)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDc4V1o2WXd5ZC9oSDBKaFdsN201eGJQZkJKLzdscWxGS0RpV25CM2EzZHRh?=
 =?utf-8?B?RTh1UkhEYzFHblA5NXlmc21xSnFCbDN3T0ZsNU0rRldLemZhdzFUdlQxUWJh?=
 =?utf-8?B?MVp0c2Z4RGV2SlV0NjNId1Flb2RvbkpwTmNGYVdHOEp1bTZzYXBxc0tkekpz?=
 =?utf-8?B?MWhDNVF3ZGtHVXRrLzdDdzArdElGbFJOR1J2Q1B0UXI1Z3lnNDVST2NIam9S?=
 =?utf-8?B?ZmpjRkEveG5veFNod1FwWVBhVm8va05Balk4ZU5wTlJCNlNvTG81OWtZQytX?=
 =?utf-8?B?UHB5VitQWXlobDlqb1ViRmRPRkZ3ejV2cVFZMUVqdGpsTTQzbXJ2RDRVNlVH?=
 =?utf-8?B?V0EyejI5dG5yNUh4N2JzVFB3TzljYVFlQVFUMWN1SnllOWlnNGtBdTZwV1I2?=
 =?utf-8?B?d2ZUSlFGLzFMaVR2aVNCc3FSOEE1WE1NNTdVaDFUTERmQ2ZUK3k4ZTZVL2sx?=
 =?utf-8?B?TXFKc2RQdHVpRFJzVTRTa3VZMk40OFVTNXVVQW1jenpXOS9vb1dkTWR6SDNv?=
 =?utf-8?B?UW0wZU5KRWVWem1raDNsWllSckozdEMxSmpUYUJPVjhvVVdiNWF1Q0VNWVNn?=
 =?utf-8?B?ZlU0VWdYcGFsUkNTOWhMZ0xjUFFmYmRadng5aDZZMS9MZ1gvTjZpT2hmNDNY?=
 =?utf-8?B?N25MSXRIU1lJZVArc25RM0M0eHZYVTdEZ1JGRWtYWUFHREdPNmcyZWlBcWdO?=
 =?utf-8?B?VjFwajViK25xUmsvQkhiR0NXbFNUTFMvcTJBOWhUdDBkYkhWN1Zhb1NPYUVk?=
 =?utf-8?B?S2xXeDlWZlBBRHIxaXYyblVsNkRjcnNrcTVmaGtBblZvdTl4eDVTSXRBWkk4?=
 =?utf-8?B?S1U3eDFuZjlyRFNrTFFwQmV6ZGNsT0lCR2hma3BQb2RDZGV0YU1JRXdKUWI5?=
 =?utf-8?B?aVpqYWFQc1N5QzI5S2RvNk9ON0ZYQjducHRvRmd0aFQrSkxwMHl6NmF5ekJ6?=
 =?utf-8?B?YjFoRDRWR1gwTDdSaHhTdXpKN2Q1bDNMb3hqbjlmdDJ0OXdHVnp2WHQ1NGRh?=
 =?utf-8?B?NnFsSnAyVS9LREVXQU8yalMzdWVTdXU4ZXBZM1VnZzZJY3FyWm5WNVNzOTB5?=
 =?utf-8?B?VmFqaEd1QVAvS1hIY3lzR0MxMVNpYUhCUElNS0dnbG5FODhjemZwM1hmc0ZC?=
 =?utf-8?B?QTlOUFQ3dWtCOEhwc3ZNa0dhRzJiQUV5RFNKcUZqY0k5NVZkVCtBTXhkYmdt?=
 =?utf-8?B?czZSZEZtenA5QTl2N3JIQktkR2NHOGYrc2s2SUdPN3k5bEQvbVZ4QUQ3ejY1?=
 =?utf-8?B?TUVLd2xHK1Rib1pUNW1TOWFmTndLZ2dobjkxZUtKb3B1d2dLQlZNekdFRHBN?=
 =?utf-8?B?YVV1cWw0Q1ZxdE1JQkVrdnRZbnpsV1pWdjVQVzJ0VVltRGVoU3MzVk5NdDFE?=
 =?utf-8?B?NHRPamhnSlhMUGZmL2FtZGJ4STV2YjNRcHRqTlY3d3V5WGZQbHFJMHdvK05P?=
 =?utf-8?B?NTJVcUVRTFl1NjFodFVmaG0rSFh3QzU0RTg4dnFjeGJhNmNWUGRJVnhWeG9S?=
 =?utf-8?B?Y21JbXA0b3AxbHZDM0YyUzRPbHhTN3dpcWFXWlBNR3pSWEFHYS9DdS9yRUZn?=
 =?utf-8?B?S2N0VERUMWsxeDRiNWliQVZZSUc3T0hocDRWL25zd0dRWFVmdi94T25tMkRl?=
 =?utf-8?B?ejhLc2o1N0plVlR0NW1xM2ZqdWpXNDl5WjRBaHlac0JXZlJMOW1XV0NGMlhq?=
 =?utf-8?B?K3FZQTN0Y2NxL1JLUTBrUHRuWGRQS1ZUcFVEMXpDUFl2cXExUEVCSC81RXRX?=
 =?utf-8?B?TUQrcW10VXRjcGZ6b29jNHdmeFgrSkt5WFVDc3luSENQNm45VjdXeURZMnk5?=
 =?utf-8?B?RXV6RmQvaWkvZHFmQ3ZXZXByNTNYVHdFZ3lwb3BLZzRjT0RPSSsyZUhVZ2FD?=
 =?utf-8?B?OStJdmdGZ1ovNmZyVEZQckRBaHFuajlNcnhXTzV1M3FiUGRGaktPdjJsdGFD?=
 =?utf-8?B?ZCs5SUJGcmFZL2V0YTBrWDVMcWJIcGJ6dlBQdnAzNDN1K20rTU5maGt2YThk?=
 =?utf-8?B?YTdjcEhYSHRoV1dqbmMxbFhZWEg2ZnVZNVV3RjJSdzRYbHNPRlliYURoTTFI?=
 =?utf-8?B?bUxYOWx4VG1heTlCd2FPNEtvcmtsRE13STFOQklScHRpQnNoeDUwYWxnR2tB?=
 =?utf-8?B?MWpUWmpTaGFobm9tWngrUUtZajdCYm4yZUh6cHNQOGMwT1hFcFZEajhXc3BM?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T7f4LdeDin1JWS7bJNVmKenndhARLoJZGbTfr9lUp0IOVtRoB6M24ELiKKaix03S+fzqEFL9zY5xvbg+2/KxLZcp/zTaLwvM4gSZxNqecdh8JAn3YvMNnrpVsxyQAEzSY4pq+XQPOd7m6t/+fIIAyotMl6H9oJ7utNi8077K1kIqlUBM70xi3Soa14zPn767Yx59dCcm+233lnBc+nsrNmSnFjv3yBG+0Suuxwh+fkKnA1UBtP3KWVklCtNqBVxQostPDxUzjfJkL2kJhIqY8W/S93A6qFKPJdWvKVyY5s6HFitiQR9tZAavlcOT/2O1Z1mfaRs+AVlK+gd4t90CeD0/W87n0NmEvLffbAayF9g1m8Hc9CCGiETAilnONdIX5/n7pSOaAHN7RIwuhmYPFknrW6pG0PGCZxDymGkMZyy1Xa/Y+R8Yy6Ww8Wpjq+X29YXTXCQqHpDaT4rtVLaNcLkXcr6s30UR1XfoMQqIQ3/DNOcra23WaT3+9OS/48VUy78qQtNYlUR63u5cB/613ZDfEtQs6kdDlaVyaq4hIqZYntOy3ZPmrGHv8GokhMVhBc2A7Of53zexycxLyCe3twuYDZofUic2TaX/RQLBptQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1717f96-4d0e-4fc2-c2c3-08dc2710c4fe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 12:40:15.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: br9ZUJV562tS1IU9k1DAvZAH39YKgA9vzPamHlPgreR6G6qR+V8g9ZVsKHf0TPvcXwgHQkbL98NFJGt2gVHjBiACi3LSTA7fDRU0y+A59f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402060089
X-Proofpoint-GUID: nCYQCrqYBUW8atk49IOMY89Ztd_W30lF
X-Proofpoint-ORIG-GUID: nCYQCrqYBUW8atk49IOMY89Ztd_W30lF


On 06/02/2024 04:04, Akira Yokosawa wrote:
> On Mon,  5 Feb 2024 18:51:31 +0100, Vegard Nossum wrote:
>> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
>> to 2.4.4"), we can use Sphinx's built-in logging facilities.
>>
>> Gotchas:
>> - remove first argument 'app' from all calls
>> - instead of (fmt % (args)), use (fmt, args)
>> - instead of ("<fmt>: " + str) use ("<fmt: %s>", str)
>> - realign wrapped lines
>>
>> I changed the "Neither inkscape(1) nor convert(1) found." message from a
>> .verbose() to a .warning(), since that actually affects the output in a
>> big way.
> 
> No, please don't!
> 
> you are partially reverting commit d987d5ae51ec ("docs: kfigure.py:
> Don't warn of missing PDF converter in 'make htmldocs'").
> 
> See its changelog for why it should be kept verbase.

I see, thanks for pointing it out, I'll fix that in v2.


Vegard
