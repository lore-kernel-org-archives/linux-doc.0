Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C21C537F4
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023270; cv=fail; b=KLxxd1/0G1BHtb75WHWMhzC7QWbeEF6xUFmSHu20s05nJKAE6Hhk5QtqxWSwm/4linU+CG6nS3CzjFkK57zt0o7GPcGc2lZ5D4502ci94Wv1VkEURkog6+UppvUOKSpLEHNYCnT1vQc0XlLNrjg5WMZ9RcY5vqbKnRVDlTlv3uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023270; c=relaxed/simple;
	bh=i79lglPUJyU0XQ/J0UMoMxnK4YcM9L8pZGhwocTy2l0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GKupJdeq+/+PY/y/BR3azHSAp2FnDzyat//Wvmg5cjMyyLSavFmFnZv6PITJlafFmf1D6+zmjnJgJ7G1mTZEjvBuDxLQobhVfCrufEh3LrCBQrCOh0eMNoqKz3yUgitIMKaWHe5kqsw5Tc4wbEQXrVfTZKxSXmkMoROXFjlb29U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FCTWTGzM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XfiBFNlo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FCTWTGzM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XfiBFNlo"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41R1EBKI002959;
	Tue, 27 Feb 2024 08:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=LUtHZ2GkMJjU3Cq9ZXV5r4NdDluBeuBZ0itnbM5oXlc=;
 b=FCTWTGzMdGwmi/rPCa/pbyF1Y2WO3Mn45k5XobS6sJCdvcCrRNUixOmA57BwJnEnDrEk
 knmZZL+kjGjmnB3A4EUmV6aZ1y7Daarcmus3HKlb09aqiXdCycGuGTBoRJroALWwR/cS
 fuhIoLg5/cOewvw9S/dd7r8AZXTOGpR/A4yO4BDiNyMNIeDxNK8Ol5itKa+XmmQumxxn
 lIobWVK73972OiFARJ8dEU9JYA0T0HhwIMlaJn9Zgm+AU1MCU62yT7yWla2IyFD4rzYO
 Zp3r5DArbInXLPftsofy8HYzhaMTWvx/KnVFnTVfreQjKc2TSmOkoywmILEjWKisnZQI GA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3wf8bb6fnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 08:41:01 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41R7NHcw025600;
	Tue, 27 Feb 2024 08:41:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3wf6wdbmrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 08:41:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKNXMSHRCwHILHSGap7iN7sdv2sra6qQIXjskGIT7SA88QfMHN3Mby+oxfWjHPuU1vroLCH56+jKw9jSAd9HPBnADf4E/K6kiR2awzgDnY6yQINyUSjhECntZCcrtExxmoZRuIsNL+iVA/pGF35zNA1XcNPhhKyQRcVAVtiOYqJbbrffINnZzukZjQpFg5PuK37awlI2SFVonYt2jaIxksT29iozf/n9SyVwf3saMU7QCRE8ppLAKVH3gHnrFsE8hsp3u9aEy+We9cDbregLS/qIQKVxm9k4csOm1o06/jhcto/vp5MVEIYpEyjJQoZkDHEZ/ZQYnrLvqbxrvDVhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUtHZ2GkMJjU3Cq9ZXV5r4NdDluBeuBZ0itnbM5oXlc=;
 b=SSnHt9HisWw5tKd23LIeiBKEZNLJ8X4CUSU3CESFjHE03o/qkOrhejyM718dexoKXcJ2eoSLkIJBv2zyvvd8jCF8+QxVTWL1/52qqJ30dCrJNfgHdVYqPSqHVNWfAvGTwTotWlcNB+rV4wa5eIufwLEtr1qpo3MHdNi4/OsQwVOffCVCEJ7LFwhadwuysS0YFQ5NBA1GPp59TdXE2B+3SGaPPfc3qy/cNKxOfmMCJtYt8rZCH7zhJkFylWWYEq3e5WELOjmz7QmJ5cOiPjEP62ecgY/M+d7kItctVL/7fZelFvqKfxzENsvC8ZVdWi4+Ip6g0D3UywIHA3M988WhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUtHZ2GkMJjU3Cq9ZXV5r4NdDluBeuBZ0itnbM5oXlc=;
 b=XfiBFNloT/SOKZiIAP9imyL7TlmWsL+tDskQzHFH4zD70pv1CY+wot+7dtJh2eX4XQhLn0fpVGGqHc0gZZ9ah/H3KrQfIuQhML0K8okEy3oWtmYd9QYGyBQ58V3tMTGtAbNHXxuVXwDO0hSpPMu+Iz7JLn13jA7T0tcsGAPK70Q=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 08:40:58 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::cd69:f784:6434:4384]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::cd69:f784:6434:4384%6]) with mapi id 15.20.7316.037; Tue, 27 Feb 2024
 08:40:58 +0000
Message-ID: <e5bf0fd4-9eab-48ee-b56a-7137c528d9ff@oracle.com>
Date: Tue, 27 Feb 2024 09:40:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: freeze some package versions for sphinx virtualenv
 setup
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org
References: <20240226093854.47830-1-lukas.bulwahn@gmail.com>
 <a6e683f5-3088-48ef-9930-93c95e85c5ce@gmail.com>
 <CAKXUXMz1HLYKo=D4UrtPDf3GO4VjxXmU1xtYm_aZ3tXo6PrekQ@mail.gmail.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 xsFNBE4DTU8BEADTtNncvO6rZdvTSILZHHhUnJr9Vd7N/MSx8U9z0UkAtrcgP6HPsVdsvHeU
 C6IW7L629z7CSffCXNeF8xBYnGFhCh9L9fyX/nZ2gVw/0cVDCVMwVgeXo3m8AR1iSFYvO9vC
 Rcd1fN2y+vGsJaD4JoxhKBygUtPWqUKks88NYvqyIMKgIVNQ964Qh7M+qDGY+e/BaId1OK2Z
 92jfTNE7EaIhJfHX8hW1yJKXWS54qBMqBstgLHPx8rv8AmRunsehso5nKxjtlYa/Zw5J1Uyw
 tSl+e3g/8bmCj+9+7Gj2swFlmZQwBVpVVrAR38jjEnjbKe9dQZ7c8mHHSFDflcAJlqRB2RT1
 2JA3iX/XZ0AmcOvrk62S7B4I00+kOiY6fAERPptrA19n452Non7PD5VTe2iKsOIARIkf7LvD
 q2bjzB3r41A8twtB7DUEH8Db5tbiztwy2TGLD9ga+aJJwGdy9kR5kRORNLWvqMM6Bfe9+qbw
 cJ1NXTM1RFsgCgq7U6BMEXZNcsSg9Hbs6fqDPbbZXXxn7iA4TmOhyAqgY5KCa0wm68GxMhyG
 5Q5dWfwX42/U/Zx5foyiORvEFxDBWNWc6iP1h+w8wDiiEO/UM7eH06bxRaxoMEYmcYNeEjk6
 U6qnvjUiK8A35zDOoK67t9QD35aWlNBNQ2becGk9i8fuNJKqNQARAQABzShWZWdhcmQgTm9z
 c3VtIDx2ZWdhcmQubm9zc3VtQG9yYWNsZS5jb20+wsF4BBMBAgAiBQJX+8E+AhsDBgsJCAcD
 AgYVCAIJCgsEFgIDAQIeAQIXgAAKCRALzvTY/pi6WOTDD/46kJZT/yJsYVT44e+MWvWXnzi9
 G7Tcqo1yNS5guN0d49B8ei9VvRzYpRsziaj1nAQJ8bgGJeXjNsMLMOZgx4b5OTsn8t2zIm2h
 midgIE8b3nS73uNs+9E1ktJPnHClGtTECEIIwQibpdCPYCS3lpmoAagezfcnkOqtTdgSvBg9
 FxrxKpAclgoQFTKpUoI121tvYBHmaW9K5mBM3Ty16t7IPghnndgxab+liUUZQY0TZqDG8PPW
 SuRpiVJ9buszWQvm1MUJB/MNtj1rWHivsc1Xu559PYShvJiqJF1+NCNVUx3hfXEm3evTZ9Fm
 TQJBNaeROqCToGJHjdbOdtxeSdMhaiExuSnxghqcWN+76JNXAQLlVvYhHjQwzr4me4Efo1AN
 jinz1STmmeeAMYBfHPmBNjbyNMmYBH4ETbK9XKmtkLlEPuwTXu++7zKECgsgJJJ+kvAM1OOP
 VSOKCFouq1NiuJTDwIXQf/zc1ZB8ILoY/WljE+TO/ZNmRCZl8uj03FTUzLYhR7iWdyfG5gJ/
 UfNDs/LBk596rEAtlwn0qlFUmj01B1MVeevV8JJ711S1jiRrPCXg90P3wmUUQzO0apfk1Np6
 jZVlvsnbdK/1QZaYo1kdDPEVG+TQKOgdj4wbLMBV0rh82SYM1nc6YinoXWS3EuEfRLYTf8ad
 hbkmGzrwcc7BTQROA01PARAA5+ySdsvX2RzUF6aBwtohoGYV6m2P77wn4u9uNDMD9vfcqZxj
 y9QBMKGVADLY/zoL3TJx8CYS71YNz2AsFysTdfJjNgruZW7+j2ODTrHVTNWNSpMt5yRVW426
 vN12gYjqK95c5uKNWGreP9W99T7Tj8yJe2CcoXYb6kO8hGvAHFlSYpJe+Plph5oD9llnYWpO
 XOzzuICFi4jfm0I0lvneQGd2aPK47JGHWewHn1Xk9/IwZW2InPYZat0kLlSDdiQmy/1Kv1UL
 PfzSjc9lkZqUJEXunpE0Mdp8LqowlL3rmgdoi1u4MNXurqWwPTXf1MSH537exgjqMp6tddfw
 cLAIcReIrKnN9g1+rdHfAUiHJYhEVbJACQSy9a4Z+CzUgb4RcwOQznGuzDXxnuTSuwMRxvyz
 XpDvuZazsAqB4e4p/m+42hAjE5lKBfE/p/WWewNzRRxRKvscoLcWCLg1qZ6N1pNJAh7BQdDK
 pvLaUv6zQkrlsvK2bicGXqzPVhjwX+rTghSuG3Sbsn2XdzABROgHd7ImsqzV6QQGw7eIlTD2
 MT2b9gf0f76TaTgi0kZlLpQiAGVgjNhU2Aq3xIqOFTuiGnIQN0LV9/g6KqklzOGMBYf80Pgs
 kiObHTTzSvPIT+JcdIjPcKj2+HCbgbhmrYLtGJW8Bqp/I8w2aj2nVBa7l7UAEQEAAcLBXwQY
 AQIACQUCTgNNTwIbDAAKCRALzvTY/pi6WEWzD/4rWDeWc3P0DfOv23vWgx1qboMuFLxetair
 Utae7i60PQFIVj44xG997aMjohdxxzO9oBCTxUekn31aXzTBpUbRhStq78d1hQA5Rk7nJRS6
 Nl6UtIcuLTE6Zznrq3QdQHtqwQCm1OM2F5w0ezOxbhHgt9WTrjJHact4AsN/8Aa2jmxJYrup
 aKmHqPxCVwxrrSTnx8ljisPaZWdzLQF5qmgmAqIRvX57xAuCu8O15XyZ054u73dIEYb2MBBl
 aUYwDv/4So2e2MEUymx7BF8rKDJ1LvwxKYT+X1gSdeiSambCzuEZ3SQWsVv3gn5TTCn3fHDt
 KTUL3zejji3s2V/gBXoHX7NnTNx6ZDP7It259tvWXKlUDd+spxUCF4i5fbkoQ9A0PNCwe01i
 N71y5pRS0WlFS06cvPs9lZbkAj4lDFgnOVQwmg6Smqi8gjD8rjP0GWKY24tDqd6sptX5cTDH
 pcH+LjiY61m43d8Rx+tqiUGJNUfXE/sEB+nkpL1PFWzdI1XZp4tlG6R7T9VLLf01SfeA2wgo
 9BLDRko6MK5UxPwoYDHpYiyzzAdO24dlfTphNxNcDfspLCgOW1IQ3kGoTghU7CwDtV44x4rA
 jtz7znL1XTlXp6YJQ/FWWIJfsyFvr01kTmv+/QpnAG5/iLJ+0upU1blkWmVwaEo82BU6MrS2 8A==
In-Reply-To: <CAKXUXMz1HLYKo=D4UrtPDf3GO4VjxXmU1xtYm_aZ3tXo6PrekQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cf::12) To DM8PR10MB5430.namprd10.prod.outlook.com
 (2603:10b6:8:24::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|IA1PR10MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5db78a-d3ce-47a3-05ba-08dc376fcfad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jd3H9q0qumWwJztyiEDbVbq2cGFwE2KGp6ZANkmWQPz1JeQphoy6/Qzipcgz1v6AtBPbeC1DvXWFyVjh7Ad7gPwHzfGPjr+lSjKXZYfs7qB2RU1Mtuoud32e6E+t88WtEe0ISGcvwxIJvFDy8HTuOMMqUWXe5o0O2YvDNMGG8nX3KLvVZh4mj2VZpTR+OH16auF/dg5HYBrhyWanLNN+N8Yp4Fq0zQHj6qUYndaoa8Z6xfgIybp29Sw9S5kIiw7I+5IWIG9juGI1rHGrSvu+ublI1nu6zQx/3Ww4yMplRFtAvUfL7NRLJwhfwtKNuBzEK9HOGwbzpEbKgbgYtKmlLjExGVYlm4n9biVU6+vTaEK/xe0Qq3XvljGxFEiE/a2JNglyYet+R1deki8tB+xxlsV2fDkCLEOt1hd6cZlxGrDfv2RlSIR/n8eVhLbYiTiIIDzyvhPc5yOJZOpju0tKnTUFfFgW8L9jR75xz/fq0UNlGqOCMqbbv9TX5FOcGxTli4JhnhdvLmlu0/Vcv0/3F5GUL6/QXkiT/0x1oOwMuf9Lj+4tU1aW662MJrqgmXHIV6vLwIwu9W2AXlAINes44whNZcipOIAtOz9MW9E4PWJov4eRsMCHmJlBnBSLXTAD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VS95RDVBeVRGeEZyZ3VpeTlMRUZhOVZZa05hWThVdVhIS0dzalZNWnpFNVYv?=
 =?utf-8?B?OWVOR2UybnVicU9MSFJEQ0hNRGx3ZW9IL1lxR0JsaGlFdkpSQVoxZ24xOVYx?=
 =?utf-8?B?c1JsYnZ6SnhCMEE2bE5BNXlTcXhWbFlubW9jaC80ak1HQ1pzRHg1NG5XU1NG?=
 =?utf-8?B?YVorUVVMcklRL2szNUZWNk1sN3pFWTJwNTRjeDZJQ0dZN3lMZ0dyeVFCL3Zx?=
 =?utf-8?B?WHJDZi9oYTNNNEE4bHN0TTlkNkRFMkVncWsxV2lJd1c2VVFqVjM5clIzZWxx?=
 =?utf-8?B?M0FNMVJNQ3o1WGVTVnVMZm5QL3lkbkJlc2xBaGZrR2dQSHM4RC9pcjFmVWlk?=
 =?utf-8?B?bURlTWpuVGI1VkxGdWNDSTJMaWtrL3hVeUdWc2haRWhJWXdPdmV0cGIwUEdK?=
 =?utf-8?B?Y01sVDV2d053SmkrcGFBM0dFaWtoM2FHUG1QTjJBTlpFU0RxR05lLzl0QUMz?=
 =?utf-8?B?ZG1RY3p1aXdQTHpkTnBCWW1HK1MvdVd4ajdWZEhqbUZvcEp1VHlHd05Jdmpx?=
 =?utf-8?B?OGtkbUg3L29SazVsNG41aXg3a1R5dVUwWEZUT05walhFdUNzQkx1UFozMU0v?=
 =?utf-8?B?TUJyaTRuT3lMMFRtUkdQb0xTUzFRaGFCRGhoZ282ckpsR3NGU3ZDcGtPVTdN?=
 =?utf-8?B?STF5d1NHdWlyYkUyZDhhVzRKbVF0VkJ3QkMyMElhTldqMzFUaURQMm5RemZ6?=
 =?utf-8?B?RzhUcHZleHRvZlB0aGhhdStyUGhRSXRRRm9PODJObkFxZnRpbzNid1lVQ1ZS?=
 =?utf-8?B?Tit5ZFR4ckJSOUJuUDFDNUF4UGhKQmcrbFpHd2IwN200emFuejlvRitCR0RS?=
 =?utf-8?B?R2IxR0JRV2xublVCTDRMdVZXMS90eDVXdGFhYk5QaWM0dkFTM0d2UE02djNB?=
 =?utf-8?B?QkxjQVFPZjk5S1JNdDgxdjZzV29ZcE9nWTdBNFliS0pVaFFmeTUzUWcyMmtM?=
 =?utf-8?B?K0xPNUZaUlppMy82Syt0cTBHUFcwcU1Rbng1WmpKU2dUa1h1Tncva05GbDdN?=
 =?utf-8?B?UXU5MkRyaDNIQkkxZ3p0c0NvVXQ0cGVDRWxoeUcvQ1hYdUxHZ25ROHRQcktu?=
 =?utf-8?B?NHlhSloxaHl3Z3NMdS83ajJrL3J3UVRFV0xkOW5BeHlQWUphc2t3Z05RSkRS?=
 =?utf-8?B?WitVZTBCS2FmeEdMVW8yNDZvTkp5bUpoajB1bWxXbmlhT1BiN1FlenVldUxr?=
 =?utf-8?B?QTVoeE1oQVVVbHQ1VmkvTWh2Ri9LVzFrV1c5cFRmUXlQQWlVWFlodml5Nk94?=
 =?utf-8?B?WmhzVk9EWXZZRG93cE9wcjhJS1FoNlRkc0R6SHVib0szcndSc1p2czFBZ2xR?=
 =?utf-8?B?dE83TmJWYldDSlFMam5obEFaTUlTQU9oZUdmSU94eXdwZ25rVDRkVEExSHV6?=
 =?utf-8?B?bEdnNE43bk1oRmduQmxYbVBBQ0lYZEZ2a2h4c3IrSHZJNUJhUjNnZFRQTHdj?=
 =?utf-8?B?UHdsblNVZ3JBcGN0YzBod2pXYlFNYTdwaVhBOFJKV1c4UlZFYUIwWWhheFVn?=
 =?utf-8?B?SnhNNkcwTHRlM2ZaYjF5aE90bzgyODhHVWRGcWNWZHkweGhTenFyaStDaWR5?=
 =?utf-8?B?RTJaMG5nS2c4Yk1Gejk4NHhwN3BmTXRkbDZSUEhZK21hT0VtTVoreEh2dkxD?=
 =?utf-8?B?ejNSUW1nSW9ZcG95OGJmV3MvbXhqZGwyamJrMHpYNXhRc1poMUpCMVp2aVpT?=
 =?utf-8?B?WFNQaXJPQVFPQ2ZVeWVHWUZheFhNajNBVmR6a1BMN1dMSmZWUStRVDlHVU81?=
 =?utf-8?B?QUtsUmlkRFVPaTB5Vk1LeE9MM0Z1L3JOK09mUTllREcxQkc4dVVDREx4d2p1?=
 =?utf-8?B?ZnBXNWtzWXV0Q2wzbS9qbXBOMmJtbzV6eklxa3VGYWd4VGJLdXZhSi9pUCtB?=
 =?utf-8?B?SzJTd1BNWXk3MWZqKzM3UmN2VUhjMWVkeUU3Z1VLTHo5Z3J0UUVHUHVBTFRq?=
 =?utf-8?B?d1lFZElOMGszQmcwYVM1UGxIdm5DbDJmZGJVZ1FuU1pRdFpOaEo3dlIwRWFl?=
 =?utf-8?B?ZUFOR2RIRVhiVEE3UytQWUhBVFF1aURzdHMrMXRKQmNiZHNrUldhM2ZpQyth?=
 =?utf-8?B?Mm5zYlBqckZvUDYyckVYNmNYbjJFdnlSbk1sdlloUWxCVmhYUjA5Z2pUemN6?=
 =?utf-8?B?RDRzWFBzUzY0OGM0aGh2N2FWZ3VyaVNYTTJxOGZwNWRnRHk3ci9xRXJheG9v?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	OKQ1iuA80zEmfjOMgjiL0Pz/F9/Ycyk/Q+IpMoqcQvpAYc+lcYIhv+YW5PTS5VlggmbfTX+O9J8aRWWP8Jn8Om0j/GbDZIBFxhZlxFr3ByA0eGuJiIukooYxpmb2H+QaXHC6wveuU3tiEe44TrIS6U5URosEKD5E1QNkbZOLmf4Axd9jRtqaOk5BXmN8zv5DWirFnlrOsPwj98DeCClC0+Jf0C+QUTIA7Wl50MJ3KqmdF7IB2mV6efLuL7sa3tw7hk9g4EaSDrgJShs6Mc1eYr0UrYKtQB0Br282BKqYUXka2PjkJ4YEuotv32jUtTwOAeqkAE5o8WVMOwJanCLnANZPQaip0bcDhGI13Ym2wNN2TI9Tkixr0kBrpHVnOnDNmFjlqYeIHwfSlRhI38BfNWk3F0fax7KL8ufcPGOk1nOirQETl5pmdZdlAyyHSUgJTPCQfpYYaUIcF7oLjS4Nf+PZFNvvIyUOa4ejRYJC4ScTjUTSAiJcL1emTRGXJE+HBLsd9xK8Op79qcLMXT5SF0ZYRpJYOqSBKdh+sSQ7L82ZIrU5FoZhDWlKw4ilBHXQaU8z3x0Rb+RVxKBIfat9Jz4gz6udrULUsvFE+qcTx0M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5db78a-d3ce-47a3-05ba-08dc376fcfad
X-MS-Exchange-CrossTenant-AuthSource: DM8PR10MB5430.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 08:40:58.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtvZJn5kWHcJwzhVSD5gOS5sVsQP34vKGrC14LEv+v3zgUG/eR+1JpwbT3u/FkizAS//ApX8sRzzUy2KZV8iYelV2kCByipimdoanxvOmGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7309
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402270067
X-Proofpoint-GUID: 53QdHvLbNC_qa28fttLfl4tc1xzkKL77
X-Proofpoint-ORIG-GUID: 53QdHvLbNC_qa28fttLfl4tc1xzkKL77


On 27/02/2024 09:24, Lukas Bulwahn wrote:
> On Tue, Feb 27, 2024 at 7:57 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>> On Mon, 26 Feb 2024 10:38:54 +0100, Lukas Bulwahn wrote:
>>> Akira-san Yokosawa reported this already in January 2023 and Jani Nikula
>>> was fast in providing a fix (see Link). This however remained as a thread
>>> on the linux-doc mailing and was never turned into a patch for Jonathan to
>>> pick up.
>>
>> Have you read Jon's message in the thread archived at:
>>
>>      https://lore.kernel.org/linux-doc/874jf4m384.fsf@meer.lwn.net/
>>
>> I think you can see why there had been no submission of a proper patch
>> in your patch's direction nor others.
>>
>> If you still want your patch applied soon, you need to convince Jon.

[...]

> Hence, I proposed this patch here. It works (for me). But I do not
> care if it is picked or not---because I am just continuing the
> whack-a-mole game. As of now, I do not know how much work the better
> solution for "updating to recent versions" needs. I will spend half a
> day and hopefully I can then present a good working patch. But let us
> see.

I now locally have a file requirements-2.4.4.txt that was the result of
running 'pip freeze' in a working Sphinx-2.4.4 virtualenv:

alabaster==0.7.13
Babel==2.14.0
certifi==2024.2.2
charset-normalizer==3.3.2
docutils==0.20.1
idna==3.6
imagesize==1.4.1
Jinja2==3.0.3
MarkupSafe==2.1.5
packaging==23.2
Pygments==2.17.2
PyYAML==6.0.1
requests==2.31.0
snowballstemmer==2.2.0
Sphinx==2.4.4
sphinxcontrib-applehelp==1.0.4
sphinxcontrib-devhelp==1.0.2
sphinxcontrib-htmlhelp==2.0.1
sphinxcontrib-jsmath==1.0.1
sphinxcontrib-qthelp==1.0.3
sphinxcontrib-serializinghtml==1.1.5
urllib3==2.2.0

My preferred way forward would be to put this in
Documentation/sphinx/requirements-2.4.4.txt and then update
Documentation/sphinx/requirements.txt to be completely unconstrained as
much as possible (just specify the bare minimum set of packages with
only lower bounds on the versions).

If you agree with the approach, feel free to submit that as a patch (if
not, I can submit one in the next few days), I just didn't want to snipe
your contribution.


Vegard
