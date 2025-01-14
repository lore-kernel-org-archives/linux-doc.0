Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B463234CF5;
	Tue, 14 Jan 2025 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854560; cv=fail; b=RjOowjtPT1SwsvQCjwF21ybDho9pxrHTa3WQlCS6OLdCoNMOKKhYiKOn55rsdOJKu6iJWRAy3g6d5IGsbEk/Tee6bePmRICbGC4foCGaS2FCajwYmmGRCiRz0Hg2ppKs+naZOJhtPxWKj8DkjBZ6UjVeEWfoZ1tyRSflh7cIcVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854560; c=relaxed/simple;
	bh=4GWCbveXQHsN/xN1PhwnFeNRnJEXQ0DRE24bFPvGrys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LAxlcZlzwj994BcEom9rW2HOWrzjy4dpBxnx7jrZynipWzzGUajIpwah4JG6s2ZV2Pv3N0+/o0cRJTDefDlqEtMYfOGdR04jlfjmVPCs7tZ6PJo9neX3TAKrm6Cz46KrbEMQ7eSSXXKseK06pm10eEmjJL4Gxynpo3ULfy1GhF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C4UF6wf3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nyk4852R; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C4UF6wf3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nyk4852R"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E1Bpa4023433;
	Tue, 14 Jan 2025 11:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=MjwUmErKA7tOcu82H+G9R9TV+JoHzp4Ksf/EuEfEMn0=; b=
	C4UF6wf3XKBxAuRngHI7czp4P3PsuM5Zd3UPo4YGt9/FCbYYE169ZPhB72OWehz1
	ZqZym5gPutWqiSSpiS25Gcv1xf9tamnAOjkFfbcxSVR69zyBK80RUBjEfVph5xqH
	9bZoXYWnLScMf+jbp0r9oJ5fBnEW9ugtsoTC9Lwm9yEVv6dDlt7GKgCfJiguN4ZA
	UiHH6Pdvv9nrcw7Qvc9kix8o3M89mF3t0naEt+tRknPkYVydJPSo1lnporrTnLQ4
	vHjQwAUyLv3rumnuO+6m5braiULf7glNKu4IAoDeLnptGMHS1nGh15ihv2tYWl7e
	yr5pa3dof0NVrr5pm0T3OQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443h6swfjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:35:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EAVqZx036418;
	Tue, 14 Jan 2025 11:35:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f38jm8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qcq2U7Vphl06oIwIHE1oq6a4k5ck7fNGmU8qczUKuHbtMslNsM7+Vt8W38PM5TlAzOlf9psz1QjntgWgHo040/H9UNoVIUWiJ5YB4RZXVl8VF/gCYIkzdrRXON4rfxEn9skimkAYI7N/5KwK5sPvfBN2AkygztoT7XMb/P5kDiBRP06YTOkH3VJwM2JNCKlqP6EYLS6T7eNGicfYcttCxnoSZMZ/goSWWK6EonDpV421p+WihYnMi+HI5ocxi2hWOS+u+ouxxsT5Y9YqMo3792xKvc1exqqKa4upizaZ+gU92K6+DuOr7NVhBbv/YkrKc7VCvoS86PEVqkWduhc1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjwUmErKA7tOcu82H+G9R9TV+JoHzp4Ksf/EuEfEMn0=;
 b=F5F40OLfmHgf1WaKkeAKqRm1rBm14XO8K5EFd7LqW752nW5gM/ZjSs01WcPyHDJov5BqAHP5jImvfHpPVbAyOrZhezK8kj4Iko39zlbgmwNNQB5D4m7+8DrCsyypupA9KuzfIzLNFOQNCcCpXO7uKKPCuE3fDAP3C4ZiC4mvf15b+SXtiCAfWhKBrXO4fRo6UWOxIVp4u4G+HE3cAZ2ePpRpl3DqRVKzpCzIeXYJ9kscrWLGbjjgKCFoGIkB+D1z2fqWODaV1UZqMqMl5FDueZl1L1tO7HhJMUSAnPsPIgoaTPWwFg++9v4ytvvU89XyR9FZOpVesKdsk+POPOIRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjwUmErKA7tOcu82H+G9R9TV+JoHzp4Ksf/EuEfEMn0=;
 b=Nyk4852Ryd/DQ0SR5LisFcPdVfh8f8nmE786J/hVmcBrQ0g6U980Mbqqvtz2A0+l7t4JkkSmucIvuW92rS9hXIU9wlsSc7vVKHIalueOKHfWwlOh042m1oCZAXOuCC2PtMKaU4lfI46ovxI/IC8lucWZ3NW2C6VvbOSi79LkSJg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB4493.namprd10.prod.outlook.com (2603:10b6:a03:2dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:35:14 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:35:14 +0000
Date: Tue, 14 Jan 2025 11:35:11 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
Message-ID: <20860974-00f8-47ac-8512-d4db513a7d77@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <CAJuCfpEf4SZVCH+HfJsvJLbvvMFnm0tyh0P1YwjMeYk-nP0RdA@mail.gmail.com>
 <5aecdfec-5939-4627-a27b-f2057a95fb65@lucifer.local>
 <CAJuCfpH-tj-=_E1rjt+WTVWffY3hH0sAkeORB4oZos13CwJMkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpH-tj-=_E1rjt+WTVWffY3hH0sAkeORB4oZos13CwJMkA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: f106541b-cc45-4312-cd25-08dd348f832b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkNIK3k2MDAzdnRNUXlmL0Q0R25nUitHaVZGY09ERzNTN3orUlAvOS9DY2RC?=
 =?utf-8?B?QjUyNXE2Yk1qUC9WdnhETjZxTTliVnByT3dDVnJMV05RTTU2ayt1ZGN1WVRK?=
 =?utf-8?B?d2pLYjFVa0p5VnMvQWFhNlRTcUNLanZ2RDA1ODEyOERwTWZMd2x3U2FFY3Ay?=
 =?utf-8?B?cEdwT2xkRUhwMFJBMUVOMFVjYklOUG43Unc2dFlmS1pSVWpveWY3YlAzNVlG?=
 =?utf-8?B?YlNpbjlRQkJ6RG9KV1NwdXBjeC82ZkpFSVR4TWxMdHhHN2szTDhUaVRpVmVE?=
 =?utf-8?B?YjJJcU1vWlR2cHhnUW5HcGhqcGxUSU1qdG5jbWlSYkIwekpNSFFna093dE0y?=
 =?utf-8?B?ZTFCT0tiYnNmWXdhS3E2MW1PZ01yaDVLdVMxQ2FCcGo2WGdZeWhLTlFRTGNL?=
 =?utf-8?B?K0NzS3F0bzNkQzJXenlPTFpxMytoT1pRY05WbG9SN3prNEdXdFJKeExGaWIx?=
 =?utf-8?B?b0wzZnhjdnRrYTVBU1hVeVNXNHpwK3ZQUFJla1N3bHBEdXk0eG42SS9md3I1?=
 =?utf-8?B?a21Sc09GTUlDWWJka09MMkpuY1hOdXpYZ2QwMG1tdGY4YkdUSFV4T01vZFpB?=
 =?utf-8?B?c3pFelhyUnMxK1gzMStQRzFoM3dVbnhLa2ZNbVh3NW5nSlVnRjdKTHB3UWYw?=
 =?utf-8?B?OStkRjFiY3Fad3lKOE0zZ0UrZXFvVTFjVGJDS21qc3k4RUpqajZubHErbzdm?=
 =?utf-8?B?eXFQOXBXQlhyMFlqNmJuRExuRlJkblU4N2FSRnFUTnIxVzQ0NE5KZ1RQTW1r?=
 =?utf-8?B?RExEYVhraFVrVDZxbzVKZHI1ZW5RUEZCUDd2MXd3ak5uQTJMNzR1eFJVQW14?=
 =?utf-8?B?SkZQS2lZcG9ISG1zNW1rWUJUaGpDbFZRbTJjMFBKWFYySjJybDBNbWlBck91?=
 =?utf-8?B?M3dORXhkQjFQOHVHak1UM3F4bHZNQmFGc3FxOVRjdUVJYkZ2WVVDYyt0Q0lV?=
 =?utf-8?B?YjRPL2swalMrL0hRZmNiMG9aRE4zZkRjZUJlN0hJRnlxcWZ5c1ZPV3JPUUZp?=
 =?utf-8?B?UVdRQnc2b0IxeWQ1RzU2ZlY0SWhqalRNeGp1clMxRE5WM3ZKM3FicXUvVjJI?=
 =?utf-8?B?WmZDekQ1SjBRd3UrMkRLQ3NjSWFmTEh2b2JVUzVVT3EzajFtb2tBS3pFbDlh?=
 =?utf-8?B?WTk0Z01hQmFqSklqVmd3ZmlCTEdhdEV1VVMwaTZ0QkZOL1Zwazhua1FZT0E3?=
 =?utf-8?B?eEt0SXJsMWxHTnpidUN2NmhteE1wSUV0SUx0b24rMTBGOU5kaUhoV21CTDg4?=
 =?utf-8?B?QzlXdUl1T1NHcllKSE90cFZoenVXVlI3cjdJbFdnUkd5UjUxMWZoZzM4ZkQ1?=
 =?utf-8?B?UUFac3puL2s2RGNBVFpRT0REYXErSGhZQ3ZWTXRwYzVyTEJlaXVFUVdCeWJS?=
 =?utf-8?B?SFg5c2pjM095M0s5eUZ5bmYwZkRieEhEUEVqc0FnR09yWjExSWV6dnNKTVU1?=
 =?utf-8?B?c1pwUXdvM0FBZmpYMjU3MXNiQzNncWpxdk9IVWQwckthQ1RGejVrNVFiOGZp?=
 =?utf-8?B?ZGlVSEZpc003Z28zMHprYzdBaDRvbXZ6Z2pLOUxRWDkwV0VKSTFRbXJCMGpm?=
 =?utf-8?B?T2hWdG1TYnR0NzhFY3pUL0FBN3Z5NWdWZUJpWkRzVnowakgySWZiN1oxcVNW?=
 =?utf-8?B?U2hidU1rcWRpcnZVTHJoUGE5MzZqdHdOc0d2TWlGWFU1SjE4c0Q4UUdOTElq?=
 =?utf-8?B?TEorTmtFVlJZazk5dnAvTlBrRUNMS1BUa0lKd1B6WWZkYmpVMjArVDdORlhC?=
 =?utf-8?B?ZUNNUEVXT3J5VCtEeHczSmZzR0J4T01qVzdaMmsvZ2V4ZU5IVGMvNDdSR0xo?=
 =?utf-8?B?TmZxRkpqMUVlRmIyTkVlQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEYwbUtlNllrdEkzT2xFSXVZODRXWUVVeFZ0Vnp2cEJCV2Y2NTJLTnp5ZnFY?=
 =?utf-8?B?dzhiUEcreitYRDFGR2VBR0MvQ252VEdabmtUSkNmVmVwZzRiVnJwOGtWbWVB?=
 =?utf-8?B?NzZXZTR2cDJnNTB1a3VKdmlRa3pTYTlReGEwczBMY1V6eTlyUkc0dVJrblRM?=
 =?utf-8?B?eU5KNlJoVUZGUXFwenhjcWtMUzBjRnAzT0VWSFI3anQzdU5qT1VTcVB5MkNZ?=
 =?utf-8?B?RzJiY2J5N2NwS29Ja2R4MnlQM1Z3Qkg1bTUzWm42SGdLbEJ4Q2R3UmxRZ3p1?=
 =?utf-8?B?TWFYL2wrazVYbXUraTFuaVhqeUI2TXA4eHFWWmFXa2pLN0ZyT21vUlZKTGZT?=
 =?utf-8?B?OUJRSi9EMnMzUUg0NDRvcXZUT1l3OHkyWGN4Q2l0MGdFbktoNTRvcTY2Yllj?=
 =?utf-8?B?NHFVbUpFRnN4eXA3TlN4U254MkxTQjZhcm45bkRPL1kwZlBhU1BBeUtib25U?=
 =?utf-8?B?UXNqaDRISXp3TCt5MlNweEtEVmJiNlRzV1RMOWhDNTFWQUZGUE9MVUoxRGkw?=
 =?utf-8?B?MWg0UzFKMTNlTVlMMjlmZzIybnBnTFJMT281TERBOFpWWDM4RjNKeCsyeE1h?=
 =?utf-8?B?TnNjQWtleFhteWEveGxHK3phRmhjUDhqZjUwWkl5NFVjUFU1K2VtL3dLTm9j?=
 =?utf-8?B?NHFXRExDdFFCL1N0elFudmc2TVBwZWJ0WlBVT1g4bFFSTGxxRG9iQVNKT2Jy?=
 =?utf-8?B?eUVCNVpEUTN2SzVQTUlPY1N4dGtNVWV6WUwxTkI3c3JQZFBmSVprRHY5THdt?=
 =?utf-8?B?dGRhL2NjK2VIdVJkaHAyRVMvU0NtOTJtSlp1bmI0eWVvLzJUOG9lOU0zWjFG?=
 =?utf-8?B?TWVGWS83T1pxR3dkQ3FoZHVjWkNyRys0ZDkwQVJWK2pCbUtXTmxtUHYwUVN4?=
 =?utf-8?B?bnJMb0hZZzdsUXljeFRib3EvTTJsaVd0UmhTbW9xQnZOWGNGLzdIZzdEQm1D?=
 =?utf-8?B?TWE2eVJwNjdrZUFrSG9JK3NRSnJuR2JMU0YrQnpxYlpBcVF0R3NZYjlBTjhQ?=
 =?utf-8?B?and3NVo4MzE0MVo1NDFxODg2eEtPNVFUOHRGZXJWdUpKUXpVU2RhTVJka3Qv?=
 =?utf-8?B?S0FuV2NrUlZOeDNaT3FyNGJPamRnWFZmS1BFejlXSytHZFFjU0V4Z3B6Q0lH?=
 =?utf-8?B?MWE0WFkwM29jejJNOElPWFY4ZEpZS2NQaUl2bFFrWjBIYTFMN2tuTVFZOUps?=
 =?utf-8?B?R2k3VmEzZ3MwSk9ZY2tvWC85L3JsbkxWYUtGbkJHWmFmYW0rL2xMSXcwQUY5?=
 =?utf-8?B?T0EweHdOcWlKWTlhNEp3YlcxdSt5b1BYMmpPNnlYeWF0MXpUUWkzWTdodHFK?=
 =?utf-8?B?c044ZWZvSjVXT002azhWNlJYV0NVdllZekp3MXFHMDBmbCtTUFNhMjVuTGxH?=
 =?utf-8?B?NEZxMWxzSTZLTlRCTkhUeHBaOGd6NGNlZStlU0tNd01veVUyNWc2dEpwZXRU?=
 =?utf-8?B?S21yTWlrWjdwcndFOWhRelY0UEh0bWF0cW4rWVIwRWFBcTVLYzA4dm9McGR0?=
 =?utf-8?B?aGhCc0hmUGJjU2pKYVIrTWEzTnZWUFhFV3FDOGw4Z09qSm5wNlBvRGlmRXI4?=
 =?utf-8?B?cFhkcXBUelB4eGxKcTYxdXFWZ0JZU3ZIbFM1bUdlcVlFcDQ4Y3BKT1hhVTIr?=
 =?utf-8?B?c3JXZThiRXBiRFh4ZGh4cWRQWVNaUHdaUVJCbEY0cWtlUFVocVVPVXgrWk9a?=
 =?utf-8?B?dDhRSWNlLzJGVEVvdW1nZ1huYzBnQlZvN1gzRDh5TG4xVG5mS0hDTWlaSnZh?=
 =?utf-8?B?WXdTSkh2bGVaOXpJK3JwcmFnM1Q5VWpIdGlmd2N5SjFuaXVZc2pVVlk3S1Bw?=
 =?utf-8?B?RHVNUU1RMHlWTDhLMlcxVjJlY0VuK0VvMC83TkhIUWdSUlNTYW9LWE1ESDBS?=
 =?utf-8?B?bWxpNHpPMDJjcmtrUHFJREtoYTZSYjNCQXN2N2tRd2NicE5VV0h4K0o2d3l4?=
 =?utf-8?B?YUNEMzBOb0pwVS95MERrNnNvQm5GZTAzVmtJVzA1N29RU2xDVXhGU1ROanlG?=
 =?utf-8?B?Z2cwdWZPcHh1eU0zbFZBOVNYUGtZNXc0aHlNb0pXTzRQQ01yeW8ycGNpSVlx?=
 =?utf-8?B?RXRVS2FzcWR4bkpPZ0g5UWd0NjJGbFdQUTZ0bldxNVl5TlhVeFVaQVM0WWJT?=
 =?utf-8?B?bUJSSUQwZW80c3dXZ2xZMWJ2OTZyMnUvaUVhRHRGQURDekVFTVlmTlVacC9u?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+gC1gIuQDHiwDFNCcB2d53w1NgrVeq/u5Q3hUGgCwX82EGGCPuEqjN3p8yeapIUu+rOce6vhDXIEcTHzbpzSYfV7fQPZtrJqbMY/KUjNRza1ShHOguBvayXk0hKuJyV/5rTzXkAfdyUIqE1anDDrL6vw74li40GqI53TpS82imTcnEj4CuEeCZT/7F+JlDclxRspRsaDcQQ7MPzEVJQVfAULDwN+UPB1Asmg80NRmrhvRqfQ4sKx40ytSN3Gz3hImHlxCY11Qdbatp+OELamYMAr83i58lA/GxkSdzHH/UGHhsLhMCXVM/ZHWyY1ivNuNhEC8oNduspjvh1QIuWmU1LWp1wwjj7izI6wMD8ZbLg7cuSuxmjtVkcGzGw26wPMu1ob+OJ2rOOXhiK+5T+/mLbcJezom4locnXn7YemwSuog4zYrlQo9mA8t1LLozS8trqJCSuNCTrh0GenwOG2syFlqhfmyH521vmeVysk6+wiueKrVknt5h8Fp19sd70NPvBWZkATo5zj4NYU3N01YCVhfr7Wh+P/a9M13gUTuzeV2nf6A5JxrgpWc0xa5xPTDTC7kO+61Jpf/mWl/E1qMA/bJvIYJBjqLV5XUjaF6ko=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f106541b-cc45-4312-cd25-08dd348f832b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:35:14.7611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBT9M0Q08QD2r1Qq057h6lT4bme8DlOXaVI2JdbE6s9kDiVIcaIvexXkZGM8hhQVZtCg9a3ZN/aWTKgLnNGzNncwnfrnwyJ2KbJS6Wd6Qy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4493
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140096
X-Proofpoint-GUID: 1t1BIkI4km9stTvXQubH2Por79aKVM5J
X-Proofpoint-ORIG-GUID: 1t1BIkI4km9stTvXQubH2Por79aKVM5J

On Mon, Jan 13, 2025 at 11:00:07AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 9:11 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Mon, Jan 13, 2025 at 08:58:37AM -0800, Suren Baghdasaryan wrote:
> > > On Mon, Jan 13, 2025 at 4:14 AM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > >
> > > > A nit on subject, I mean this is part of what this series does, and hey -
> > > > we have only so much text to put in here - but isn't this both
> > > > reimplementing per-VMA lock as a refcount _and_ importantly allocating VMAs
> > > > using the RCU typesafe mechanism?
> > > >
> > > > Do we have to do both in one series? Can we split this out? I mean maybe
> > > > that's just churny and unnecessary, but to me this series is 'allocate VMAs
> > > > RCU safe and refcount VMA lock' or something like this. Maybe this is
> > > > nitty... but still :)
> > >
> > > There is "motivational dependency" because one of the main reasons I'm
> > > converting the vm_lock into vm_refcnt is to make it easier to add
> > > SLAB_TYPESAFE_BY_RCU (see my last reply to Hillf). But technically we
> > > can leave the SLAB_TYPESAFE_BY_RCU out of this series if that makes
> > > thighs easier. That would be the 2 patches at the end:
> >
> > Right yeah... maybe it's better to do it in one hit.
> >
> > >
> > > mm: prepare lock_vma_under_rcu() for vma reuse possibility
> > > mm: make vma cache SLAB_TYPESAFE_BY_RCU
> > >
> > > I made sure that each patch is bisectable, so there should not be a
> > > problem with tracking issues.
> > >
> > > >
> > > > One general comment here - this is a really major change in how this stuff
> > > > works, and yet I don't see any tests anywhere in the series.
> > >
> > > Hmm. I was diligently updating the tests to reflect the replacement of
> > > vm_lock with vm_refcnt and adding assertions for detach/attach cases.
> > > This actually reminds me that I missed updading vm_area_struct in
> > > vma_internal.h for the member regrouping patch; will add that. I think
> > > the only part that did not affect tests is SLAB_TYPESAFE_BY_RCU but I
> > > was not sure what kind of testing I can add for that. Any suggestions
> > > would be welcomed.
> >
> > And to be clear I'm super grateful you did that :) thanks, be good to
> > change the member regrouping thing also.
> >
> > But that doesn't change the fact that this series has exactly zero tests
> > for it. And for something so broad, it feels like a big issue, we really
> > want to be careful with something so big here.
> >
> > You've also noticed that I've cleverly failed to _actually_ suggest
> > SLAB_TYPESAFE_BY_RCU tests, and mea culpa - it's super hard to think of how
> > to test that.
> >
> > Liam has experience doing RCU testing this for the maple tree stuff, but it
> > wasn't pretty and wasn't easy and would probably require massive rework to
> > expose this stuff to some viable testing environment, or in other words -
> > is unworkable.
> >
> > HOWEVER, I feel like maybe we could try to create scenarios where we might
> > trigger reuse bugs?
> >
> > Perhaps some userland code, perhaps even constrained by cgroup, that maps a
> > ton of stuff and unmaps in a loop in parallel?
> >
> > Perhaps create scenarios with shared memory where we up refcounts a lot too?
>
> I have this old spf_test
> (https://github.com/surenbaghdasaryan/spf_test/blob/main/spf_test.c)
> which I often use to weed out vma locking issues because it starts
> multiple threads doing mmap + page faults. Perhaps we can repackage it
> into a test/benchmark for testing contention on mmap/vma locks?

Ah nice yeah that sounds good!

>
> >
> > Anyway, this is necessarily nebulous without further investigation, what I
> > was thinking more concretely is:
> >
> > Using the VMA userland testing:
> >
> > 1. Assert reference count correctness across locking scenarios and various
> >    VMA operations.
> > 2. Assert correct detached/not detached state across different scenarios.
> >
> > This won't quite be complete as not everything is separated out quite
> > enough to allow things like process tear down/forking etc. to be explicitly
> > tested but you can unit tests the VMA bits at least.
> >
> > One note on this, I intend to split the vma.c file into multiple files in
> > tools/testing/vma/ so if you add tests here it'd be worth probably putting
> > them into a new file.
> >
> > I'm happy to help with this if you need any assistance, feel free to ping!
>
> As a starting point I was thinking of changing
> vma_assert_attached()/vma_assert_detached() and
> vma_mark_attached()/vma_mark_detached() to return a bool and use
> WARN_ON_ONCE() (to address your concern about asserts being dependent
> on CONFIG_DEBUG_VM) like this:
>
> static inline bool vma_assert_detached()
> {
>     return !WARN_ON_ONCE(atomic_read(&vma->vm_refcnt));
> }
>
> static inline bool vma_mark_attached(struct vm_area_struct *vma)
> {
>     vma_assert_write_locked(vma);
>     if (!vma_assert_detached(vma))
>         return false;
>
>     atomic_set(&vma->vm_refcnt, 1);
>     return true;
> }
>

Sounds good!

> With that we can add correctness checks in the tools/testing/vma/vma.c
> for different states, for example in the alloc_and_link_vma() we can
> check that after vma_link() the vma is indeed attached:
>
> ASSERT_TRUE(vma_assert_attached(vma));
>
> This might not cover all states but is probably a good starting point. WDYT?

Yeah, this is a good starting point.

I think also we should add explicit asserts in the merge tests to ensure
attachment.

I mean part of this is adding more tests in general for standard
operations, but I don't want to be silly and suggest you need to do that.

I think this forms a decent basis.

>
> >
> > Sorry to put this on you so late in the series, I realise it's annoying,
> > but I feel like things have changed a lot and obviously aggregated with two
> > series in one in effect and these are genuine concerns that at this stage I
> > feel like we need to try to at least make some headway on.
> >
> > >
> > > >
> > > > I know it's tricky to write tests for this, but the new VMA testing
> > > > environment should make it possible to test a _lot_ more than we previously
> > > > could.
> > > >
> > > > However due to some (*ahem*) interesting distribution of where functions
> > > > are, most notably stuff in kernel/fork.c, I guess we can't test
> > > > _everything_ there effectively.
> > > >
> > > > But I do feel like we should be able to do better than having absolutely no
> > > > testing added for this?
> > >
> > > Again, I'm open to suggestions for SLAB_TYPESAFE_BY_RCU testing but
> > > for the rest I thought the tests were modified accordingly.
> >
> > See above ^
> >
> > >
> > > >
> > > > I think there's definitely quite a bit you could test now, at least in
> > > > asserting fundamentals in tools/testing/vma/vma.c.
> > > >
> > > > This can cover at least detached state asserts in various scenarios.
> > >
> > > Ok, you mean to check that VMA re-attachment/re-detachment would
> > > trigger assertions? I'll look into adding tests for that.
> >
> > Yeah this is one, see above :)
> >
> > >
> > > >
> > > > But that won't cover off the really gnarly stuff here around RCU slab
> > > > allocation, and determining precisely how to test that in a sensible way is
> > > > maybe less clear.
> > > >
> > > > But I'd like to see _something_ here please, this is more or less
> > > > fundamentally changing how all VMAs are allocated and to just have nothing
> > > > feels unfortunate.
> > >
> > > Again, I'm open to suggestions on what kind of testing I can add for
> > > SLAB_TYPESAFE_BY_RCU change.
> >
> > See above
> >
> > >
> > > >
> > > > I'm already nervous because we've hit issues coming up to v9 and we're not
> > > > 100% sure if a recent syzkaller is related to these changes or not, I'm not
> > > > sure how much we can get assurances with tests but I'd like something.
> > >
> > > If you are referring to the issue at [1], I think David ran the
> > > syzcaller against mm-stable that does not contain this patchset and
> > > the issue still triggered (see [2]). This of course does not guarantee
> > > that this patchset has no other issues :) I'll try adding tests for
> > > re-attaching, re-detaching and welcome ideas on how to test
> > > SLAB_TYPESAFE_BY_RCU transition.
> > > Thanks,
> > > Suren.
> >
> > OK that's reassuring!
> >
> > >
> > > [1] https://lore.kernel.org/all/6758f0cc.050a0220.17f54a.0001.GAE@google.com/
> > > [2] https://lore.kernel.org/all/67823fba.050a0220.216c54.001c.GAE@google.com/
> > >
> > > >
> > > > Thanks!
> > > >
> > > > On Fri, Jan 10, 2025 at 08:25:47PM -0800, Suren Baghdasaryan wrote:
> > > > > Back when per-vma locks were introduces, vm_lock was moved out of
> > > > > vm_area_struct in [1] because of the performance regression caused by
> > > > > false cacheline sharing. Recent investigation [2] revealed that the
> > > > > regressions is limited to a rather old Broadwell microarchitecture and
> > > > > even there it can be mitigated by disabling adjacent cacheline
> > > > > prefetching, see [3].
> > > > > Splitting single logical structure into multiple ones leads to more
> > > > > complicated management, extra pointer dereferences and overall less
> > > > > maintainable code. When that split-away part is a lock, it complicates
> > > > > things even further. With no performance benefits, there are no reasons
> > > > > for this split. Merging the vm_lock back into vm_area_struct also allows
> > > > > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > > > > This patchset:
> > > > > 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> > > > > boundary and changing the cache to be cacheline-aligned to minimize
> > > > > cacheline sharing;
> > > > > 2. changes vm_area_struct initialization to mark new vma as detached until
> > > > > it is inserted into vma tree;
> > > > > 3. replaces vm_lock and vma->detached flag with a reference counter;
> > > > > 4. regroups vm_area_struct members to fit them into 3 cachelines;
> > > > > 5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
> > > > > reuse and to minimize call_rcu() calls.
> > > > >
> > > > > Pagefault microbenchmarks show performance improvement:
> > > > > Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
> > > > > Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
> > > > > Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
> > > > > Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
> > > > > Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
> > > > > Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
> > > > > Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
> > > > > Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
> > > > > Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
> > > > > Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
> > > > > Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
> > > > > Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
> > > > > Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
> > > > > Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
> > > > > Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
> > > > > Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*
> > > > >
> > > > > Changes since v8 [4]:
> > > > > - Change subject for the cover letter, per Vlastimil Babka
> > > > > - Added Reviewed-by and Acked-by, per Vlastimil Babka
> > > > > - Added static check for no-limit case in __refcount_add_not_zero_limited,
> > > > > per David Laight
> > > > > - Fixed vma_refcount_put() to call rwsem_release() unconditionally,
> > > > > per Hillf Danton and Vlastimil Babka
> > > > > - Use a copy of vma->vm_mm in vma_refcount_put() in case vma is freed from
> > > > > under us, per Vlastimil Babka
> > > > > - Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read(),
> > > > > per Vlastimil Babka
> > > > > - Changed __vma_enter_locked() parameter to centralize refcount logic,
> > > > > per Vlastimil Babka
> > > > > - Amended description in vm_lock replacement patch explaining the effects
> > > > > of the patch on vm_area_struct size, per Vlastimil Babka
> > > > > - Added vm_area_struct member regrouping patch [5] into the series
> > > > > - Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
> > > > > - Added a comment for vm_area_struct to update vm_area_init_from() when
> > > > > adding new members, per Vlastimil Babka
> > > > > - Updated a comment about unstable src->shared.rb when copying a vma in
> > > > > vm_area_init_from(), per Vlastimil Babka
> > > > >
> > > > > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
> > > > > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> > > > > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
> > > > > [4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@google.com/
> > > > > [5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.com/
> > > > >
> > > > > Patchset applies over mm-unstable after reverting v8
> > > > > (current SHA range: 235b5129cb7b - 9e6b24c58985)
> > > > >
> > > > > Suren Baghdasaryan (17):
> > > > >   mm: introduce vma_start_read_locked{_nested} helpers
> > > > >   mm: move per-vma lock into vm_area_struct
> > > > >   mm: mark vma as detached until it's added into vma tree
> > > > >   mm: introduce vma_iter_store_attached() to use with attached vmas
> > > > >   mm: mark vmas detached upon exit
> > > > >   types: move struct rcuwait into types.h
> > > > >   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
> > > > >   mm: move mmap_init_lock() out of the header file
> > > > >   mm: uninline the main body of vma_start_write()
> > > > >   refcount: introduce __refcount_{add|inc}_not_zero_limited
> > > > >   mm: replace vm_lock and detached flag with a reference count
> > > > >   mm: move lesser used vma_area_struct members into the last cacheline
> > > > >   mm/debug: print vm_refcnt state when dumping the vma
> > > > >   mm: remove extra vma_numab_state_init() call
> > > > >   mm: prepare lock_vma_under_rcu() for vma reuse possibility
> > > > >   mm: make vma cache SLAB_TYPESAFE_BY_RCU
> > > > >   docs/mm: document latest changes to vm_lock
> > > > >
> > > > >  Documentation/mm/process_addrs.rst |  44 ++++----
> > > > >  include/linux/mm.h                 | 156 ++++++++++++++++++++++-------
> > > > >  include/linux/mm_types.h           |  75 +++++++-------
> > > > >  include/linux/mmap_lock.h          |   6 --
> > > > >  include/linux/rcuwait.h            |  13 +--
> > > > >  include/linux/refcount.h           |  24 ++++-
> > > > >  include/linux/slab.h               |   6 --
> > > > >  include/linux/types.h              |  12 +++
> > > > >  kernel/fork.c                      | 129 +++++++++++-------------
> > > > >  mm/debug.c                         |  12 +++
> > > > >  mm/init-mm.c                       |   1 +
> > > > >  mm/memory.c                        |  97 ++++++++++++++++--
> > > > >  mm/mmap.c                          |   3 +-
> > > > >  mm/userfaultfd.c                   |  32 +++---
> > > > >  mm/vma.c                           |  23 ++---
> > > > >  mm/vma.h                           |  15 ++-
> > > > >  tools/testing/vma/linux/atomic.h   |   5 +
> > > > >  tools/testing/vma/vma_internal.h   |  93 ++++++++---------
> > > > >  18 files changed, 465 insertions(+), 281 deletions(-)
> > > > >
> > > > > --
> > > > > 2.47.1.613.gc27f4b7a9f-goog
> > > > >
