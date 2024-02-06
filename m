Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93763131E32
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707225176; cv=fail; b=P0IiWwBE4Am3DBicUwfeYu7V9fGdhuFvtwJHpkWYXiEdKfg6CWG8ss+lenVZROZYSvj7ueJsyFjHuUkl/23BN3iXmgLB0HcxgsjHIRWw7jx4Uu60E3oRr//amuX3LGP6KKl4N8W7HWZnNU/NFoH+ANhRS6BCFDXW5OsgF/sb+dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707225176; c=relaxed/simple;
	bh=oI1FRzA6KB3Ir9xcDKmGE05oQzHVlUGj/Q80u4Da9AQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eQinAalrlQskgfv+AcDqyduvZEI8zPBlHIiyJm9ZNknWW/o4jxgQNyqzpjMzA0cTVkY4aSnnEiNww5Jt1hOeWT4k6GuPu0JCYZmeNEc9ExNbVg1qIq92NJwtySqFSDnlEf85dUolvMmwClH917p3KzzL/aTmxNRLJYTCV7ySPsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b2LhMkCY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JA9inh+R; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b2LhMkCY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JA9inh+R"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 416ADb8d004413;
	Tue, 6 Feb 2024 13:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=RVHeL6/bgLVxKUw7Wai4Q6AOGE8lDSmoS6TloPsqxeE=;
 b=b2LhMkCYqVKF4Nf1NmeOrGKoCH5cLhUZqmGpjgV+0/uzagkbjjOBO8xT/NfFzJgJxVH7
 zEULQaeHMbhvXKhY9mj0el3xFmswJH+JgE5YHoFmxxGsITjUozcHW9RH+rxJSdhKgdur
 vWqPdHZpsi5yhoie0qj9Kwr8Jd5btSVLQ9zGCa7PGB2mxgnqnphdodyokimSp+C0nA3K
 h38jVmlq4i73nQZ9mzNByAc6WB56q7Wy9NuNi28Khf8+BXalLEoMMDp75QADM7QvCD21
 oi5D1++ZrYwoT/XMsKHxooL0AsDX6g68aOBB+bf0rXPPMzlNZI6JzS7jvLveXozwphu4 FQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1c93xvwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 13:12:48 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 416C8rru039333;
	Tue, 6 Feb 2024 13:12:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx71sve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 13:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW1KIJLK91YF8yCMCgYbxbwCaaV1JNzB+knCX91L1kHZCOlxyQJAdEgmHAScoDTzLSRNUIpVLeD1jfmo5SogIcyUIOSX/F94ajUgdw92ZEhha+1LVV2soj3NBIQYJmrtmVzPVlDd2LblDvZmislJO3n7nRh3Fo5lZAQLICAgOwqOefH+ThrIdeGyquiAQ/yZsKrR3GhCNs8GBYj+DpuHAJhXceTVwRhvD+RfRFAJr8J64OuMU/tFT9liQc1ZCy6gqJPbaNQu/Hv2oQfrVFqYte3J8Io8ONYizxWwivxL+IN6L3cUxBRROMaryHW/s4inY0Jt2d8dQQsUjSgW2OFu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVHeL6/bgLVxKUw7Wai4Q6AOGE8lDSmoS6TloPsqxeE=;
 b=bRIWdabnKhE4GoH8naWafyem5J406pK7jILOv3UXIqIGsjAGaazsF1rzfftnlFuGjrwhw50SIkITZeiiOks82ah+zPWtBsgQ6Klm42BJM3TSbODcPbgBL/PWCQ1eBxogNfW5ffHV8/qugPaOsMq2Iq+iqEyBi8+ZFNlYJMGgccHYYQHD/mLoJAOFzjMC/1+JjAR0qDBF6yr4IxtLc11iRe6GfRw28NzYNuE1Gogl+eKc0emH6JVDjYd5/AjGbnFoY+psPS0aWnAx404twB3VOPKgfPQ4aOytYM6jVybWnDNNjXtNWIISOxeKA/hdy3d1SyGZixzm53zjLlVb6flikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVHeL6/bgLVxKUw7Wai4Q6AOGE8lDSmoS6TloPsqxeE=;
 b=JA9inh+RzcvDlobE7lQIay6t9TKa8K4cMzAXkKD1SSyKOjZo0kr9A11vKMNvRBNo5xKPxaSrS8Kez5fZbA7501anab1H2Nb1Qa29+3zd5+Kgo3Iy2KfkCNB8LM/AIHpI0XleUJsTybBOwvrqsOpqZ0baHAW3ltIYC8cYLU2uL5w=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by BN0PR10MB5064.namprd10.prod.outlook.com (2603:10b6:408:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 13:12:45 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 13:12:44 +0000
Message-ID: <4fe28581-8662-4731-a974-0bc7bc0041f8@oracle.com>
Date: Tue, 6 Feb 2024 14:12:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
 <20240205175133.774271-7-vegard.nossum@oracle.com> <87zfwec6m7.fsf@intel.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87zfwec6m7.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::9) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|BN0PR10MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 9609665e-e69a-4113-7b5b-08dc27154e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qx64z4GUCP4HQxV27JnRD/jIwtf2D6giSmCKkNMRyk8vtbF7laHKWZc7XvNA/jQOaqhR4UG4Bi29qHmHC707KSVvck093xp7LK81Z6/m0xI+1t6V5m05M3dopGNFaAfHSRDDMS9plf+kceJuC9YLM8AjG45MjXa45ecIO9c9Pw1ygaDP6XXqHvJx197keVB8UUTZ2WbBg+7GHZLjM7vdZjEOcvq9ueUkyIzlTPnHijad2ui7HlR8STfdrI5F3GOJOZnW3csS1fOfQXEKggjerxdhoXcnU871nm7DVVl+MHF4qda98AUyuw9zXoBkgvUMTaB9FUs0fLqeMl5RQbGk00IdzBK13FKu8GRiA3DU2VwJUZPr6NfJzMmmS0zW3FDPOXzAhERuh/z6PDdarxJL5/0JP8r9uUu4ji+4OH4FWAGjI9KpUTh/ydU1P//yTvi6L4Bn8hsZ7Ay0oqIaIrPquvEu87VzwOn/jV2eQa7tsPpe6u1BzevtksdHAmCdNmhCTMHcQnD2cYOOUtepOSWXi0xL3n6ysXzGVLkLkHPT1XUNhhg9s7hw7s+3pX4D/4SOx9ryJyVAXwbF24Nr6RtFkfJ02NGgiD3EG3HMSCIvcMvUexSQgP5Nx5d40GekJqUOZCB7abQyAIYKgfII0bIfng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(86362001)(66556008)(66946007)(66476007)(6486002)(110136005)(53546011)(6506007)(36756003)(6512007)(478600001)(6666004)(8936002)(8676002)(4326008)(316002)(26005)(38100700002)(2616005)(31696002)(5660300002)(44832011)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzR3MW8xRWFOcksyV013c0xlSVJVQWFPYTFoZEltejRmYngrOSs0eTl4N1Ux?=
 =?utf-8?B?bkloUHJVWE9qdkY5R044OExRdU5iMlMydTNpYzlGWVduRXVCVkVQNVlBUTRU?=
 =?utf-8?B?UE1rcXN6QmZOSUdpcmVETm1yeWxSZXp2cDFPYlo4YXlDbUZhd3luaGxGTk5n?=
 =?utf-8?B?akFRS05rRzAvVGhONG00ZmVWOEdIYXZiV0NNSnpBQ045NnZianZtK3M3OWYz?=
 =?utf-8?B?ejMxby9FZ2N4TVhvVEdIQU1WNWJmYVRVNDQ5QnR3N3pnVmNuV1VDdGlSaGl6?=
 =?utf-8?B?ZnFWZkZaaWtLVGhRa2xqU1l1K2ZMa0c2ckJuZjhZajRSQmIwdWhEK2R3anV6?=
 =?utf-8?B?SG8zNkVyckhJK3hWZDVxQ1NXRWN2cFNzRG9RbXNJcjFjU2l3aWVBMk5WVHlC?=
 =?utf-8?B?T3g0L0loQmZpU2NQcGNqcDc3aGRXY1N3dGszQXQzOTZZemc3eDJqRnU0cXZ1?=
 =?utf-8?B?T28rcC9FVmNJUEJUNUVDTjRmZnhkY1h5VFhlcFU5a0tSaFlwbXFqUFdkekoy?=
 =?utf-8?B?SnVJOHhUa3l5QmVYcVFWM21hU09odFRRSXgydjJTY21FOXRDTWU1YXNlS2Vx?=
 =?utf-8?B?cmpjRDR3TGtYVTRvVGFCeENyeEowbkRCQ1I5aDlkaXdad1d3UzZBZWZEQ1BN?=
 =?utf-8?B?WDI4VS9mRUhUSlhrd2VPdERKelRRa2xrZng5MThOaWRGZ2hGdWNGOVVDc2lu?=
 =?utf-8?B?Rk9HRUxYalVrY0ZDeDEzc1UxQ1JYSmh5aFg0QW42ekpVZGFiMGdXSFYvNEZZ?=
 =?utf-8?B?K1lyRWRydjNEa3kzSEF3Vm5YTHVMS1RjN2NMQjI5SVp1cndmdFl0L0JOVGh2?=
 =?utf-8?B?a09WeUc2Q3F5YXpKVTY5a2tEZjZMMW1ja3cyZkgySEZnQUJsQm1RM3dZS0d5?=
 =?utf-8?B?aUo5SWpHd1FaeVVLZUVxa1hldTZKQ2xaQ2FJS0QvWG5tN0Q5VWFrZVZpUDZZ?=
 =?utf-8?B?NE5sa3VyRXlkR1VaMFB0ZDQ5TTNUYUZkci8yRE1Ja0hYTlJUWG1tMFhaSWVn?=
 =?utf-8?B?L2lOclp6cEVzeldmYVRLeVhWWW9jRmNPV2FFdmt1K3cwOXZ6UlllbkhmR2ly?=
 =?utf-8?B?Zkg4V3dUS3JkNFg5NGpvSDBqUTVJaWMvMWFLZGo5aWhaL054eGpjSFkvd0Rv?=
 =?utf-8?B?N1B6RjRqV3ZKVndWdFZ3Y3ptbjFEeG5HV0Q4WGlPb0JFT0dqMTlPRkpBdTJj?=
 =?utf-8?B?ZWRUS2oraHpWSFVwTHlBVkR1SGZESDJBVHFXdEh2TXNaK3dMeFR0RGMwckgz?=
 =?utf-8?B?b3Q1Sk45dmQxUWZCWEUyWlA5VkJXaUhpVFpoMy96MmN1SlpkUms3K1RUYnky?=
 =?utf-8?B?QzNaRTFuV0lyUXY5OFJnc24yOGhYL3BwdE90a1dWZ1NXRldxbHpXdDgwSVFu?=
 =?utf-8?B?OFZnU2Roc3RvWkxjNlF1bXgwS010bkRIN082akNLMHlTZDFtMXJ0amtuWUh5?=
 =?utf-8?B?VVA3NitDNFRERkF0endEYWdMV0lJLzExQjcxZkppR3BzaGxTd2cydmxaNTg1?=
 =?utf-8?B?ZjhRSG1Bay9XQVdVNklRMG1tcXRuQnVwbytqLzVMdGV4aFZBOC9MZjNCMFpR?=
 =?utf-8?B?QzF0anNTWUxyMU10SFFvNUE5Q2VIaFVLWTdDNENwRUpKTlQ2R3Y1Y25rU3U0?=
 =?utf-8?B?MGhma2dkZURYbzFvZlpyUEJ1S2hKc0JXVU85SkgvbnFyQ3JyaVVwU0ZlcnFi?=
 =?utf-8?B?TUxSUXcyNlBFWitjbHY5YzJndkhlMUZVazVXS2s1d0ZQVmc4WUhTdWQzOHE5?=
 =?utf-8?B?K0QrNHdFTVUzK2hzUFFEYm92ZzZkU1ptaWZzRUN0b08wMWJqS0xuNEJwaVlz?=
 =?utf-8?B?QXVNOEk2b2taUTZrMWdlelZTTFhXbmRnT3MwdHhqQTNLUklNQ3VYVThtR2lj?=
 =?utf-8?B?elgrR1B0enVEUjFTME82L20wZE1RZW1qYkN0a0hLT0NIUFdCSXBMVXpiT3Ba?=
 =?utf-8?B?YnZYdEpYcC83WHg5Um82Yldmd1J5TEhIbS9pZ084SEJCMGt2ZngzSGFOd2cr?=
 =?utf-8?B?dkg1WjJJKzN4S2hvVEgyR3JxOVRRR3N2TEdDYVRSVTlmSzRuRjhJcG5uNXlZ?=
 =?utf-8?B?ckFvTnZ2WGp6UzNONE5tUDhGdmFWWEdDRHZEa3hId25ZeklnTnBQL08wb0pz?=
 =?utf-8?B?aGpMd0ZzYXZsNHFvMGNGdVVSWHRqT2lFNy90aHpTRVErMHkwb09ML0w5V0xk?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gS5vUK2jduBroOQj1WKgYqKzHMfpGKH8wx7kJICnQsVOf1+i7mH0ha9rYLkuxx0ZNxi4yePbB162dSw4FQrtrHMjiMY+1hpqISxfL5Yeb4vH4n4Fcy6vb2trHkU+MgTLUwVoAu9R3CLk4UAdCsyaeheGzYh7GUY+DirN5nV1/cYWfRyTq3atTSs/IoexAh1DU0I8At+PtSTtzKomaxNlLzjxBDGOWRl7frY3xWFsrYmiUozm0DsTwr9vOlJB0CFgkyAoPpwhUpHPGg8gu7OVMO4RVT2huRoqPa7qcMvbVlZ5BsINHV3YDTYz+HZ9FIioPN/ANEcPGyuj5fEUJ95wkUO90kI1HaZ/doLxukvWR6+KlHFnEmX+f3AU8fvjtGmqQms1vBWyIWCddoc5HF94+Xk21oJ1K/kNULzkgfUmrjT7p8rHIwcswp8B6xGRaCv7jFH9LkJnTYpIqdZ6I/cNu4esJWzQfzAMdqky4C5UcPOIcjlatrmq5hLRftoMlDWQ/cdQwm74GyeEVMcM8NO5fMRpNbE0MphXCuQo7OOiruyKftLiKt7sFvYuBVQtvt0SfMfGxL6STEHkw34KSvSNSYCjsrR7OAqmy+6xsaNG3iU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9609665e-e69a-4113-7b5b-08dc27154e8f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 13:12:44.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31WvHEQkrM3ySjkTMrTDDJwShGJEOAzIPtibEM0pvsSf9WybJvt1bnX5LMsKH1eVXdhMZPvYBkt/K6hvCdaQ9jEf8Xcy/V0fyURkB+1HkR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5064
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402060092
X-Proofpoint-ORIG-GUID: YJaBeUAnrku3lgdVelvfECyE3Kl8T8FX
X-Proofpoint-GUID: YJaBeUAnrku3lgdVelvfECyE3Kl8T8FX


On 06/02/2024 09:57, Jani Nikula wrote:
> On Mon, 05 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
>> to 2.4.4"), we can use Sphinx's built-in logging facilities.
>>
>> Gotchas:
>> - remove first argument 'app' from all calls
>> - instead of (fmt % (args)), use (fmt, args)
>> - instead of ("<fmt>: " + str) use ("<fmt: %s>", str)
> 
> If you're doing this, why not go directly to f-strings? IMO the above
> are inferior to it.

I agree, and I also vastly prefer f-strings everywhere(*) personally.

(*): However, for logging and logging-related APIs I had the impression
that it was still canonical/recommended not to use f-strings since they
are still going to get interpolated by the logging API -- which means if
you use an f-string and the interpolated f-string results in a %
anywhere your logging call will fail since it won't find the
corresponding parameter in the argument list -- similar to using
printf(buf); instead of printf("%s", buf); in C.

In other words, the change in this patch is not (purely) a stylistic
one, but also a correctness thing.


Vegard
