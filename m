Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2442139B1;
	Fri, 10 Jan 2025 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736538409; cv=fail; b=L2bsV+ylx+aKTHSCGZejDvgV+avWHbMIQXEW87MKfMK6982hhsp1VIgzmzkdpmA6sycKDx/d0I4EmXM9pAsUGcR+T0KjAABxq7/e+f4+94RpITvw80FPtM2+dCAAzujDVp7o3IvergOSdZ2S2ZTLbSKPRLrpvofBD6nkGPbMhg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736538409; c=relaxed/simple;
	bh=jnSGqOE34xqaTJKyplJ8JDklA65bMf60vXf8bJM6nbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SSQGKK4+yT4hilOMJCsruy0SIUMnfkfFquwhbUSHdsog+OMk0S8YQLbcKy2n74hQcn89/FgIg/f3VtTubMBVYV14WkGOvM4ujBxU34REx5gB4B8omH5HI3WfI0S1dqPzqntU0MrDepmJiO5VBnUlACCZAJoVky0iHbgmP4lcYyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XOetk7gF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WU0Yol82; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XOetk7gF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WU0Yol82"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AItoqL006395;
	Fri, 10 Jan 2025 19:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=BqrWLe5OO/xekIcnRCGUk6rG9lcum7NvnVRQ685HGK8=; b=
	XOetk7gFS/UFyhjIfIMChJlls0atZ79Q1Eys2CO4jf1S3f0u17WaWh+oK2eDsYUu
	JRw3Dsjxz4oT5diUPscmPVM7GIGIyQo5wshzuFm2bNcT3FKB2d3QYrlfqIuBwcN5
	cFqiojUSJEzrGuH0zPuzFAxZ6nyuOePj1PfA/7gaFDNePfGewmwC4vzjka/LC81/
	NXQxk+flJqhtqQLDPklcyF75oyt395so3BTcT57UDdtQfZASEJ7JdarRD8sJtsyI
	TNx/RRhnmVDMBQvneKdh2FynlzENSrAcu/uBpTl42VT9rlkuW7dmHdTcjN/jLADk
	UA3bi4U4sqa+cJVQAVy1vg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xudcbvgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 19:46:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AJhd5i022609;
	Fri, 10 Jan 2025 19:46:09 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuectpx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 19:46:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfohVVrFHKek+LNpkjd4K1osoosb/UrZgNx/A4Dl+gXCe7adzk4oFO4yx/yyc7xo2zh7GlLfTo7HEDBgbAt3trsFA74yxCG9sQAV6M5eD92V74wuNaMFhupMX/NJe0uj0ZVCcvuHCSVELM0b4uoNFYGsVlTsQ6OIVHfs/ws3slvYMyOoIN8ORYQFL4HMCL8XLQcNxynjFKzO3ZWTEiBD/bZwT7g75s0lZeYZj/a4+JRdZWj4TBQYpCy9YqCejmrAwW4bD2CShZf1P5puWIt3CLvt2OmPGLM80fmlQw/25em7rmgWryH09xYs3nAa8CyXnHPHZ6mkV11Zgg1tbLzLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqrWLe5OO/xekIcnRCGUk6rG9lcum7NvnVRQ685HGK8=;
 b=vhU4BnBXae6weLc8BE33OZuOkZ7izu8NCIUlc6fphQ2C0GDt0Pi07xAzXtzL4KrTuF1gEhPLSu5jPLXiWaM32daikeFRGrORePK46m6CsESy2rLmBV4WGdiGmS4mofmge1qwKobZLw5EduIKZRoYEa8IK4OMAlb5rfo16gc0rbTzhFUmxeyJtFtppIwW12DcboeAe18FbHSjASA/ovfFg6ubaoO38oVbnAWZn2Y8oGBTHGgYJ4SlXplG0wxb0mQdknxdoKdbYWGamXNl86lAyljmeVexvZvcLpsygJWjE2EF2jh/70GPFl6NQkbgnS6r101ZmdYTniyfSlpyaz5+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqrWLe5OO/xekIcnRCGUk6rG9lcum7NvnVRQ685HGK8=;
 b=WU0Yol82nKPYQMDELru2+O4RHVOLW7qOJe+Qjr5CUPgiSAIlnMDzk+UMPIUrcIvKoKwuKgguR7hktD1kE7rBs7BCS06Meb8keYKuIi+6VohvOlAnJklAeEfl22JH9RLTMIPGhR7US/tycCcloE/zphFtLHrVT7tjGPzut5vWEUI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM4PR10MB6838.namprd10.prod.outlook.com (2603:10b6:8:106::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 19:46:06 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 19:46:06 +0000
Date: Fri, 10 Jan 2025 14:46:01 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
        mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
        oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
        brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
        hughd@google.com, lokeshgidra@google.com, minchan@google.com,
        jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
        pasha.tatashin@soleen.com, klarasmodin@gmail.com,
        richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <ckqzumj4an54dgnrnyzkhzgvfcr35gmcq7ykfdcvudrd7dd753@cjaowcc6vz6n>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
References: <20250109023025.2242447-1-surenb@google.com>
 <20250109023025.2242447-16-surenb@google.com>
 <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
 <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0221.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM4PR10MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: a75186dc-e591-44f7-1c6e-08dd31af6c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1lRTEpWcDBSVHgzSlVnemJHZFVGOFoxbzk2VExtZ25aU0NGbVluQzY4RkZO?=
 =?utf-8?B?Ny9vKzJxV3ZZR2YyVkY3Smh1WUkzdXdsL1FMQ2dtaXhaZEh0cWlqcnJPRTNy?=
 =?utf-8?B?a3NISVp0WnZKUUp5OGhidDZBcGZTbmtuWUJOOXVuVWc2VlBBOUxrYVU2cUFa?=
 =?utf-8?B?SUptZm9va3pTTVdFTFJlVnIwakNBSkpIM29pS2d6dkVnU3lQd3R1d3BmUDgw?=
 =?utf-8?B?ZDZUZGlKVjFhMEg5OXJDOVhHZk93QWNiMFgvcUdqUDBOaFlydjZvL0xudkFa?=
 =?utf-8?B?ZldKYU9IQkZNS3E0UWgxTWxjWFVoUUFxcndTNVlRL0s4Z2lVWkRDTmlsTHRW?=
 =?utf-8?B?UFE2MzlRUUlOUEk1QVEwN1g0dkhIYjgzUXk5d0tKT2Vib0VyKzhtYlJHSmRC?=
 =?utf-8?B?eDVsNzE2RDE0ZzlCQXRzUW1maUNBZzlPcXFTNm9TWnhxSFdQK3lZcGFteFJu?=
 =?utf-8?B?cHdIMXpmQWNXOTcxUjVYR3J0dUR4bXB4UlBXUUpQK2RUbmJIYUNpanF3Znor?=
 =?utf-8?B?UDh1aURpUlFiZHFHTmRteU4wVDZPMGN6V2ZFM0s0cDdRV29reG9DTUVSUDF3?=
 =?utf-8?B?aHJja1laaHBzQkhGZGlxSHhrQUdjV0FTTWdIRlZlenJNd2lzREtEWCsyQmRo?=
 =?utf-8?B?SnZWcUJjdWVLYmMvam9BSk5YMldmQ0pjeUp1N1ZLS3ZmVGpINHU4TzBoNkZn?=
 =?utf-8?B?azlvWUYrV3ppeUVLMnRDSEdYZ3NndlZIbkxMSjFvNEJMaHFjSzl1eEVmQzgy?=
 =?utf-8?B?NXV1VTlHYVdXam9NQ0RsSit1TGFWZDJ4czFicWJaRUt4YmtjMkdydFdLekZM?=
 =?utf-8?B?TVpzRGJuMThqK01pNmlGcGwxVGVvMDZkdmRkUWxEeHd2aHlYV0ZybWFXVzRZ?=
 =?utf-8?B?MnVQdGR1Q2lqMlE5TkhPalJHakJBdnA1cnJlWTk5YkI0WFpqZGJ1UHF4T0JB?=
 =?utf-8?B?d3JQSllUcmcvc0NhREJLbVBxM1VZUENTYklBeTNYZzFQR2V5U1V4QnFvU2Ux?=
 =?utf-8?B?dUh0NHM2K1pZR0VtRUhUcGdPanA0UmlhdGJFeVNOVG8vRWx4bVBjSE1NajNS?=
 =?utf-8?B?dVgrK2lsTmhzVm8zajVMMGFyQmYzMzM0aDZlZU9rNTRkZy9nMk8xRDJJdUQr?=
 =?utf-8?B?eXdiNTAyMFVJVUVFU25rd0h5L3ZnUmJwOW9mNjhtRTk5NnE3Y2hCUnh2ZnMv?=
 =?utf-8?B?ajgxYVoxWEVKOURxS255angvOFRJSytaMzJjVjVpN1lPMkpxYmxOek52dzhs?=
 =?utf-8?B?aFVFdE1jYXcyN0dnaE5iMnRJNmx5cFUyTTJXaE1meU44M2w2Z0hTd2M3NHJr?=
 =?utf-8?B?Sy91NUF3MXJNOWpBcFo2b2dHNDV1Sk1QRVZhZkJqTTFYZXVVTWZLeHJKK3A4?=
 =?utf-8?B?ZU53OEFHZy8xOG5lNlJBbXRPcGhoQnBMZ3ZTYlUwODVxdHArUnpqbWFmTXM1?=
 =?utf-8?B?WW5XdVU2NnR3N0k5V0o5VkUvUHdZTGorTG1XMzZyTzBDWnRlZEM2YnJtTW9m?=
 =?utf-8?B?c0lrSlpvL21rTlF4Q1ZrOWN3Y21Pekd1UUJxSWNmc2tSajJjZUttYWt4YzBi?=
 =?utf-8?B?L1VtQWRVZ3BLemphcnVCc28vWTB1VDVmV09ZU0NwVkpzRVNpMUZiWTZFbWpJ?=
 =?utf-8?B?V3gzSXdxR2pXRW5JUFN1c2oyQk80NGdiQlVUa0RDUi9zdWpzZ3NONTM1VTQ4?=
 =?utf-8?B?N0JXR1h1U0FMWDNTemN5aWdmVUFRL0ZVdUhLYnEvdFE4QitIQ1ZESnBHRGlF?=
 =?utf-8?B?alZtdTZPZVF4ZSt0UWIvTUwrTnVoZktFbUQwUXVWMTZtRkJLeHd4QkNSUVZs?=
 =?utf-8?B?MGIxb2dWL3NmSDcrN200YjAzWlR2cGhNc05WZzZWTWNKbjAyUjZNUTdzZ3Qw?=
 =?utf-8?Q?AiVkHb1516bbO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJiZVJTcXB0Q3VZR1E1Q3c5SDhXb2tNdlVHcVJvblB6VjR4a3BiaFJEdmJx?=
 =?utf-8?B?UFZrKzJPSWRUWWk2RmdMTFpPVHRRTTMrWDdtTENGcXc5YWlhNnVYdVhkaWIx?=
 =?utf-8?B?WkpNeTdLa2dXamZUNGNBa0Z6bjRLSVZ4T0t1K1lrZ2RrSnhSZkJnaHh0OEMz?=
 =?utf-8?B?ekhyUTVFVnRGc1U5OHpaS2NSMFFlS2VpZitLaHJSNjRkSkt0elRmVEVMMDNU?=
 =?utf-8?B?QjVwUSt4c1VSR0FOY2t2c3V2L0ZDZFJrVG8zcTBCSFY0TXc1LzRaaFBXSDk0?=
 =?utf-8?B?QjlTRUUvMFlDOFNadlpCY2x5TGNPUlNWdHFiUGUweHdnUDNCVjVOK3V5LzVP?=
 =?utf-8?B?SmU5SmFCVUx2YVNwL3JzeWJXM0Q5bHNQcTRSNWcxdFUyaWpURkF4Zm1RUjVS?=
 =?utf-8?B?ZElEdlhaYzB3c0hjRCtFK2I4TWx6V0svUk9JVVpJN3FpeCsvNUp0VmFKb1pv?=
 =?utf-8?B?ck5SNFlNYi8zWDF3YldnMDgveFFGMTQxQ0MwZkFzRm13OVdxNVorOUZqWXpp?=
 =?utf-8?B?SldSeld2VFhjdHhtaGdTczRxYUhEU1dOYzVoVk4rNjc4SDRjSlZYa2lkKytC?=
 =?utf-8?B?RXE2SWZuMW9OaVJ5aXJUZmhRL3plUHhvYWJsWDRLb0JqNVVuUUVMWTVSMm5H?=
 =?utf-8?B?d3dCNmxlMDJOTWJRTTUxYVZGV0lFMm9mV1ZubXFheHNIbnlQbTVBY2Q2dUVO?=
 =?utf-8?B?OE5sMjhyeW0yVWhhSmFyQkFUcjRmdndMVlNpcUgydjVoZW5hUnhnaWt4dlpO?=
 =?utf-8?B?SHlZR2VUSFRVa1hQQzI5bkJhQVJwRE8wRlhQUW85OTlsb0dvLzJvN1prUXA0?=
 =?utf-8?B?Z0t2c3NJckZNK2ZaWVRUOXAzaGtFTjYzVm5kR0lWSUowbUV0VG11WkVjRzdI?=
 =?utf-8?B?bEFhZkhQMUxUei8rYUluU2J4cmV2M2w0RzJ3SkVMaFF2QTRzdU1wS3V2Q1g3?=
 =?utf-8?B?Tk1VTzI5K2ZuK0NoNlFsY2lxTktyWFJaYkY4S1pGcU9JQ1lXT3IzN3Fqd1N1?=
 =?utf-8?B?YzJXUUo3NTJBSHVFOXBzRFFqRzRVdTV5bHRhekw0c0JFaGhabThJWHhta1Zt?=
 =?utf-8?B?d0Vzc1hOL2YvNGltaUJmNlJNOXRXa21vRy9CSVNMcmRkR2RXRE92aDUxejFW?=
 =?utf-8?B?aHVGV2g5MU5FWXg4RTBQVEpWVnlFMVIzRC9LN2V5eEs2ZHhrdkpsTEpzQWpu?=
 =?utf-8?B?TDFlNE5hSEJrUVV1bHYrbzRvQXR2OFdBQ0RpQlM0YU9HYlA3NmRkVEhHOFRJ?=
 =?utf-8?B?UysxZTN6TlFaazVxOXpPSHh1ZUxMLzNocG1INW1USkxIajBQdCtxVUNPcGhx?=
 =?utf-8?B?TVFsd01wd0NnbUFIKytYbjMvS0p5UjV2VGc3Y05OQmFGTlhLV1Ztbmh5Ly9j?=
 =?utf-8?B?MUtaRDUzSUhmMkxTRlkwd1doSzFEdW1uV1I5eTZtdU9UNjI5U0FyUGh4U090?=
 =?utf-8?B?K1R5ZUpoYnRvaUNYT2luOWE0SlhrSHBhSzlCL3VsbHR2N0VDeUpvU1R0Rlhv?=
 =?utf-8?B?MDNjU09lYnpBTTdlZXhxOUJVNlJBMkNHYTI0ZUV4NGhxUVBsSnFTYkQxVlV5?=
 =?utf-8?B?Um9QbzdMS01ZUDlDVHI3QTN3QmVlZDlGdzd1MjZaZDZRR3hDa0RNWXY1VWhz?=
 =?utf-8?B?cHFIbjcvT3BKd3AwNGZUY1gxRUxVZkt5ODYvaDRwUkVOakZwN25oaGZYeERi?=
 =?utf-8?B?SU5LeGxZVmxUSDdtQ1dlNUlLMmNTRUpMMTE2bHV4S055R3UvMGx1L2lBQXds?=
 =?utf-8?B?cWFsL1dVdmxQZWV2YTVyY1I2UGxHdCtyZUZoSVhTSXVPZUJrZkNFTWgyaWRS?=
 =?utf-8?B?Qys5bitJaTBVTHNMUDVzVm1ycFRZMFUwRUZnaVd4SXJTNXNRTUJOaTFHZ2hR?=
 =?utf-8?B?ZnJnWW9nWkpidTA5SGY1UUpleGRkNmVHSkN3NStaUFRSekphVFE3RjZQdWRw?=
 =?utf-8?B?V0dvOWp3THpZNE01TW5jcENwRVlUdVdlcDdpOE1JY0xaMlBIaGdvekEwQWxp?=
 =?utf-8?B?L1VrTzhpcFdiQzZOVFlIckEvTmFHelRrdDNPUzhaYWFoSTVBRDZFV1dhTWlw?=
 =?utf-8?B?cS82N0psd1ZuUjYza3liOHpjYzliTkRIeVpnaHgwSVEyUVgvN2NLSjdrUlIy?=
 =?utf-8?Q?CJENyk9NOq9pU78y78IfJJSi4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xiy9rkZeroSBbhyhxd5MIIRKKErtFyirFFH3RzOW47aMvjjCQbqQlkm42bz8djFtAFTZ1pgahEN9IlHQvwhOzb2hFE+BYXDTAiknNQew2CvwC/nPtHVi8tcgZIiq6fZw0b1PxxpfXmH449UDoA+crKMA1iQ63lSL+c9GZ0lMHxLDYsm/2h+18oQOD/qshRU9tS2BFNtoxAj/Ufy8I7Q9/LwTiDWOV2r1NVYYN8/YeS/0A5bu9BSQ4rNnHamXCHM2JZrUMo49d+GxzydnLeQ5va70PIEOcLatojB2FwcVM3mPstviKMLkEpcwlnVOf3vwkiQ6P2cFcnYluHsNYDPff33tNRnc7nMIh7D2jcPrFvVxD25//Rjqx73E8tzCUYy8FyUpSSUHaiALLnhgnAA7JZriwlMAdx6xtLYTNXRKLIOugF+DJCLvgCGPrky4ZZEFBQOpLLTgfAWHRhChy44B+xcFahs+MFJRWBXpPawdmt4k9/ZFeWXZnq5KWiUdAusT/KraYZP+nnMtCe/7IN3j88ig7TKGIB2S9ajah5IPfSDFp0Tvclwy0yq2TMXwt8SWwU+iWZ1e8dkmuJw9DaogMazURsFbfQPLrMMKq6IYWFU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75186dc-e591-44f7-1c6e-08dd31af6c51
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 19:46:06.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQFFFkX9IX9IIEYi/SkYvLAN9k0dar/HF2Uqf4gCfIWuyMmLh2O2XQwFX9I9zteqwwZ3mDrH8Ev3RwerX5BdKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6838
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_09,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100152
X-Proofpoint-ORIG-GUID: 0GKUonzfAelIOUsM2x8dOJ4FeA-wBF8K
X-Proofpoint-GUID: 0GKUonzfAelIOUsM2x8dOJ4FeA-wBF8K

* Suren Baghdasaryan <surenb@google.com> [250110 14:08]:
> On Fri, Jan 10, 2025 at 9:48=E2=80=AFAM Liam R. Howlett <Liam.Howlett@ora=
cle.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [250108 21:31]:
> > > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > > object reuse before RCU grace period is over will be detected by
> > > lock_vma_under_rcu().
> > > Current checks are sufficient as long as vma is detached before it is
> > > freed. The only place this is not currently happening is in exit_mmap=
().
> > > Add the missing vma_mark_detached() in exit_mmap().
> > > Another issue which might trick lock_vma_under_rcu() during vma reuse
> > > is vm_area_dup(), which copies the entire content of the vma into a n=
ew
> > > one, overriding new vma's vm_refcnt and temporarily making it appear =
as
> > > attached. This might trick a racing lock_vma_under_rcu() to operate o=
n
> > > a reused vma if it found the vma before it got reused. To prevent thi=
s
> > > situation, we should ensure that vm_refcnt stays at detached state (0=
)
> > > when it is copied and advances to attached state only after it is add=
ed
> > > into the vma tree. Introduce vma_copy() which preserves new vma's
> > > vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
> > > state with no current readers when they are freed, lock_vma_under_rcu=
()
> > > will not be able to take vm_refcnt after vma got detached even if vma
> > > is reused.
> > > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilita=
te
> > > vm_area_struct reuse and will minimize the number of call_rcu() calls=
.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  include/linux/mm.h               |  2 -
> > >  include/linux/mm_types.h         | 10 +++--
> > >  include/linux/slab.h             |  6 ---
> > >  kernel/fork.c                    | 72 ++++++++++++++++++++----------=
--
> > >  mm/mmap.c                        |  3 +-
> > >  mm/vma.c                         | 11 ++---
> > >  mm/vma.h                         |  2 +-
> > >  tools/testing/vma/vma_internal.h |  7 +---
> > >  8 files changed, 59 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 1d6b1563b956..a674558e4c05 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, void=
 *end_code,
> > >  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
> > >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
> > >  void vm_area_free(struct vm_area_struct *);
> > > -/* Use only if VMA has no other users */
> > > -void __vm_area_free(struct vm_area_struct *vma);
> > >
> > >  #ifndef CONFIG_MMU
> > >  extern struct rb_root nommu_region_tree;
> > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > index 2d83d79d1899..93bfcd0c1fde 100644
> > > --- a/include/linux/mm_types.h
> > > +++ b/include/linux/mm_types.h
> > > @@ -582,6 +582,12 @@ static inline void *folio_get_private(struct fol=
io *folio)
> > >
> > >  typedef unsigned long vm_flags_t;
> > >
> > > +/*
> > > + * freeptr_t represents a SLUB freelist pointer, which might be enco=
ded
> > > + * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabl=
ed.
> > > + */
> > > +typedef struct { unsigned long v; } freeptr_t;
> > > +
> > >  /*
> > >   * A region containing a mapping of a non-memory backed file under N=
OMMU
> > >   * conditions.  These are held in a global tree and are pinned by th=
e VMAs that
> > > @@ -695,9 +701,7 @@ struct vm_area_struct {
> > >                       unsigned long vm_start;
> > >                       unsigned long vm_end;
> > >               };
> > > -#ifdef CONFIG_PER_VMA_LOCK
> > > -             struct rcu_head vm_rcu; /* Used for deferred freeing. *=
/
> > > -#endif
> > > +             freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAFE_=
BY_RCU */
> > >       };
> > >
> > >       /*
> > > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > index 10a971c2bde3..681b685b6c4e 100644
> > > --- a/include/linux/slab.h
> > > +++ b/include/linux/slab.h
> > > @@ -234,12 +234,6 @@ enum _slab_flag_bits {
> > >  #define SLAB_NO_OBJ_EXT              __SLAB_FLAG_UNUSED
> > >  #endif
> > >
> > > -/*
> > > - * freeptr_t represents a SLUB freelist pointer, which might be enco=
ded
> > > - * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabl=
ed.
> > > - */
> > > -typedef struct { unsigned long v; } freeptr_t;
> > > -
> > >  /*
> > >   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> > >   *
> > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 9d9275783cf8..770b973a099c 100644
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct mm_s=
truct *mm)
> > >       return vma;
> > >  }
> > >
> >
> > There exists a copy_vma() which copies the vma to a new area in the mm
> > in rmap.  Naming this vma_copy() is confusing :)
> >
> > It might be better to just put this code in the vm_area_dup() or call i=
t
> > __vm_area_dup(), or __vma_dup() ?
>=20
> Hmm. It's not really duplicating a vma but copying its content (no
> allocation). How about __vm_area_copy() to indicate it is copying
> vm_area_struct content?
>=20
> >
> > > +static void vma_copy(const struct vm_area_struct *src, struct vm_are=
a_struct *dest)
> > > +{
> > > +     dest->vm_mm =3D src->vm_mm;
> > > +     dest->vm_ops =3D src->vm_ops;
> > > +     dest->vm_start =3D src->vm_start;
> > > +     dest->vm_end =3D src->vm_end;
> > > +     dest->anon_vma =3D src->anon_vma;
> > > +     dest->vm_pgoff =3D src->vm_pgoff;
> > > +     dest->vm_file =3D src->vm_file;
> > > +     dest->vm_private_data =3D src->vm_private_data;
> > > +     vm_flags_init(dest, src->vm_flags);
> > > +     memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > > +            sizeof(dest->vm_page_prot));
> > > +     /*
> > > +      * src->shared.rb may be modified concurrently, but the clone
> > > +      * will be reinitialized.
> > > +      */
> > > +     data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shar=
ed)));
> > > +     memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > > +            sizeof(dest->vm_userfaultfd_ctx));
> > > +#ifdef CONFIG_ANON_VMA_NAME
> > > +     dest->anon_name =3D src->anon_name;
> > > +#endif
> > > +#ifdef CONFIG_SWAP
> > > +     memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> > > +            sizeof(dest->swap_readahead_info));
> > > +#endif
> > > +#ifndef CONFIG_MMU
> > > +     dest->vm_region =3D src->vm_region;
> > > +#endif
> > > +#ifdef CONFIG_NUMA
> > > +     dest->vm_policy =3D src->vm_policy;
> > > +#endif
> > > +}
> > > +
> > >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > >  {
> > >       struct vm_area_struct *new =3D kmem_cache_alloc(vm_area_cachep,=
 GFP_KERNEL);
> > > @@ -458,11 +493,7 @@ struct vm_area_struct *vm_area_dup(struct vm_are=
a_struct *orig)
> > >
> > >       ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
> > >       ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
> > > -     /*
> > > -      * orig->shared.rb may be modified concurrently, but the clone
> > > -      * will be reinitialized.
> > > -      */
> > > -     data_race(memcpy(new, orig, sizeof(*new)));
> > > +     vma_copy(orig, new);
> > >       vma_lock_init(new, true);
> >
> > I think this suffers from a race still?
> >
> > That is, we can still race between vm_lock_seq =3D=3D mm_lock_seq and t=
he
> > lock acquire, where a free and reuse happens.  In the even that the
> > reader is caught between the sequence and lock taking, the
> > vma->vmlock_dep_map may not be replaced and it could see the old lock
> > (or zero?) and things go bad:
> >
> > It could try to take vmlock_dep_map =3D=3D 0 in read mode.
> >
> > It can take the old lock, detect the refcnt is wrong and release the ne=
w
> > lock.
>=20
> I don't think this race can happen. Notice a call to
> vma_assert_detached() inside vm_area_free(), so before vma is freed
> and possibly reused, it has to be detached. vma_mark_detached()
> ensures that there are no current or future readers by executing the
> __vma_enter_locked() + __vma_exit_locked() sequence if vm_refcnt is
> not already at 0. Once __vma_exit_locked() is done, vm_refcnt is at 0
> and any new reader will be rejected on
> __refcount_inc_not_zero_limited(), before even checking vm_lock_seq =3D=
=3D
> mm_lock_seq.

Isn't the vm_lock_seq check before the ref count in vma_start_read()?

From patch 11/16:

@@ -720,13 +752,19 @@ static inline bool vma_start_read(struct vm_area_stru=
ct *vma)
 	if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->mm_lock_seq.=
sequence))
 		return false;
=20
-	if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
+	/*
+	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() will fail
+	 * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
+	 */
+	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
+						      VMA_REF_LIMIT)))
 		return false;
=20
+	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);



>Even if a reader tries to sneak in between
> __vma_enter_locked() and __vma_exit_locked() calls,
> __refcount_inc_not_zero_limited() will reject it because
> VMA_LOCK_OFFSET is set and VMA_REF_LIMIT will be violated.
> IOW, when VMA is freed, it's guaranteed to be detached with no current
> or future readers, therefore "race between vm_lock_seq =3D=3D mm_lock_seq
> and the lock acquire, where a free and reuse happens" should not be
> possible.
>=20
> Did I understand your concern correctly and does my explanation make
> sense to you?

It is close to what Vlastimil said before.

Here is the sequence for a NULL dereference, refcnt value is not needed:

A:			B:	C:
lock_vma_under_rcu()
  vma =3D mas_walk()
  vma_start_read()
    vm_lock_seq =3D=3D mm->mm_lock_seq.sequence

                        vma_start_write
			vma detached and freed

				=09
				vm_area_dup()
				- vma reallocated
				- zero vma

    rwsem_acquire_read(NULL)


Here is a sequence for unlocking the new lock while locking the old one.
The refcnt failure detects the detached state but does not protect
against the wrong lock use:
A:			B:	C:
lock_vma_under_rcu()
  vma =3D mas_walk()
  vma_start_read()
    vm_lock_seq =3D=3D mm->mm_lock_seq.sequence

                        vma_start_write
			vma detached and freed
				=09
				vm_area_dup()
				- vma reallocated

    rwsem_acquire_read(old lock)
    __refcount_inc_not_zero_limited() fails

				vma_init_lock();

    rwsem_release(new lock)

I don't think avoiding the copy of the ref count from the old vma is
enough to stop these races?

Thanks,
Liam
