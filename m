Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC4822DC29;
	Tue, 14 Jan 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848078; cv=fail; b=TYp5ybuaDNsDj5K1JZsUe7GDboUUSBscDoPVphZ9YrbrjD9ti5yWFOI5022t0Wg67ZRC0fQrqhy4z5/VMeZWnHi36004EPjUAIgzlXOXS+WdoyiMAsZWId4lN/HvIiFVKskNi9+vwsDiIE8LhnXwAyZFEX2i7cpl3k4661OmSxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848078; c=relaxed/simple;
	bh=B5r+6y3KpYTgrFMJUJT4bWr7e0PpOVITahJI65nTJNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p4C1kNyYitJ10einBxMxTjatVNbVlgRfUOtL9I1VT/8H+tGZ526ryoGvlZ49LmnBvbEGC2VYYuySdyHdomUCbG1E2osITQRQOUxZt5q/PDmkuI6WScQ8SaMziclFyqS9ADaFbhDtrtB3C3RZgw8/YgZ3Rdwkb4MSxOSYDb1pIxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NjzVxwoY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UMQJ6azC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NjzVxwoY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UMQJ6azC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E1BqpK003891;
	Tue, 14 Jan 2025 09:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=fKdpLo4BkEz5epQEBBVT3LPW4azC0XzsjxWuD1P99wQ=; b=
	NjzVxwoYCSUgbDlGewxUx7mxg5+SEykaRrLwLHVKZijgTNkscYMZtIkkYrRKLxxq
	vpQ/uazUEtIsHRyEpi1dxeBuuieSjuPkAKE2AGrsnA8lJsqYvMZGLnTJ5449WR/C
	ghQ3w3T3qv0mbfDZXLJKmF30CJuaSDZCzWa4nzu0jvttDqqOz5k6IO7yL0bXbZPU
	zky2TMxXvSMcTNFy15LzBZUyrEzW5s82cH3WX1CFVycLl/gLHWqDwDZHxjdVFHo1
	TYf701pwJT0nGgfotgRDnbOecU+/fJhO7odBoHro6s29lcqaKl6nJIrrZD5E+ijS
	wEV8iqVWmcaJN2+pRcirqQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y5cam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 09:47:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50E907cN020660;
	Tue, 14 Jan 2025 09:47:23 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3e9862-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 09:47:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsC0kcMDBOsmgwY9fhrKnsamD/lpXPZt8kO0bcSREyN34gijf4IBtEeLFlYH9F6TGrYE3kFtqCfzBecSdc9Jl5Vh49+Uq59jDiI5kADpX3qg+ttsEAwe35xIDEMjkWIWyqgFfobm+URMOi/PXDRP5fowlR2ldMboGUWXDTBYuEMcTCs0aboPyXjACN2ObDwYJCuiyMXXF3G3gwrB3pPeuodlmRnNl05dFIo1mSQZ6gj+0+SoXPhqwQdCCDKb7d3AuIjaJoR0qp6fPDT39fjApAqfMWJuNUbinfa3KdPDD/7755b3jFYLIfkqSJ2eDrruY4M0p4PmLzUNTKucoKBcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKdpLo4BkEz5epQEBBVT3LPW4azC0XzsjxWuD1P99wQ=;
 b=DqhsySkMpmr2n2J4xBpkzFbUNv8cy3YlGtz4muETSJHlQS0qhFnddjDw+MfsscF5dPPiVqpjJjEHP1CBgYYAoRuvHIJHX3SvqbtMAy8G8Byc4WtTku/n89DKv8SqWBaSVDL0pAYM8chd2S5SzxWLHmPky/AJsxdt67n6zThZKHb8mQpBi2DFlLeR/rxH3F7mYsm+ykNynsv7lbkYMSqE9TQBXNWr05wdPjJv8jzjE2HcNI6sdaa0ncktuJc332lvev0cS13mkyEN0R2+d78ykw6I7sDZjT0UBN6jnAhIP85KikUrlGR0WBf5E6FQar47d9QIZCwn2Q53m2BEeSlQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKdpLo4BkEz5epQEBBVT3LPW4azC0XzsjxWuD1P99wQ=;
 b=UMQJ6azCD0uK46GFwA0QvufH+Jc4LUobtDpCBac1SaUJfpMZNh9BPF8DX9VUIbRsFcJEDCXYUCQz5qFNbal9hQhCTYZlRqeq9jAxo9R4EHF8G1MiNWywda9Q9mHUOrg1lLmoA56X7HiiRhDyG473GVnreRXb7wDK1zZDQSIGTmA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA1PR10MB6145.namprd10.prod.outlook.com (2603:10b6:208:3ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 09:47:20 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 09:47:20 +0000
Date: Tue, 14 Jan 2025 09:47:13 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, peterz@infradead.org,
        willy@infradead.org, liam.howlett@oracle.com,
        david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
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
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
Message-ID: <2ca5cf59-87a9-443c-82a6-8c56ba7e1e47@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
 <CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
 <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org>
X-ClientProxiedBy: LO2P265CA0333.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::33) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA1PR10MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0a72f5-b249-48a3-e0ea-08dd3480703c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWUvZnJSbjhFb0h4ck9WK3NYVDZOLzRQVUJ1cmw3RnFOZHZaWUtIeTFiZWtI?=
 =?utf-8?B?SEU3aWJPbW82MHc2T3Z5QUMyRFp3SDFpbzlTeEhNV1RrcVVxZFJ6OHlWTERx?=
 =?utf-8?B?T280UXh2L0VUTm10dnoxaU13NC8zR2M2RTh2N1ZEeUtIRC90d3dzc3FYeGg0?=
 =?utf-8?B?eEtFSGFVT1NXbHNxSlVKRXc1emd3MjdCVXJOUnlqd01TQkt5dVlvWlo5NUky?=
 =?utf-8?B?NFpha3psRmc0c29JamFaNHgwZ3BTV0kwaFdwcVVxUklYUEtJeStCcXpnTi9m?=
 =?utf-8?B?VDk2bmNrNnNEdlFlTjlZdmFEWm1rdWRhREtCUXJyejBkRWZuNDZML3RiOEtG?=
 =?utf-8?B?K1RQT3NaRm5mZXIrTmpsOSswaG4vTXBrVXdicTVGaFN6WkhaSUU2elVYcXFi?=
 =?utf-8?B?RHMvTTloQTBkcXcxZlFVTUJoRytJWUM1Znhta0J2VEJKVktuT3ZwaUhRM1dv?=
 =?utf-8?B?YkVzOTNVWmtZNWM0RlcyeDNLdXBTbVByaGFaUXVKSXZSYUtEMDVMc3FtcFJk?=
 =?utf-8?B?NzhoQkk5cDBacU9QQlBMYzhXQ29qY0RlQnFYSzdrcUcvYk5xWUk4QmFBMTBw?=
 =?utf-8?B?OHBDZzNRY2xRMmRyOEEzQW1Cc1NYL1ZiUC8vQzl2VXRQWTJEUXRxR24rd3pF?=
 =?utf-8?B?TGtDSjV0NkZqS2N1TmtWZGxxNnBySlF2UHdQVm4yK0hWTGZVcVdCM3FDcGZy?=
 =?utf-8?B?SGd2Y1R4NU1MVERGUmh5TnlpOUZZZFZPdUVHN3dMUnFIMlFodVRyMDJHNDFG?=
 =?utf-8?B?RVpwQ244MjJ4ZWtXdFgrWUNZaTFLaEJqcm1qVE8zN1E2bmtJcXBDazdBK0Fs?=
 =?utf-8?B?MC9ueHE0cHhucmdPeVh2bktrZzRnMi93dG9Ha2M1L0VJbzBGUVlJSGRBMXFT?=
 =?utf-8?B?VVBBbjRpN0xwVmczTnlUc05xSjhLUktRWVplT0g1UUt0WHRCRVMwc0VDM1Rk?=
 =?utf-8?B?MmNrMFRZZytzbmZtNHFFakhmNVhpNkp0MjYwbEhDdW4wQU1RbHZJRUpGcUc3?=
 =?utf-8?B?cVA2ZS9xZ1lTYnpiMTR5TXVkOStYK2VwUVJOV0NXVTIwQVQzdndFM1JxRCtm?=
 =?utf-8?B?V3JlejloYk5Ua0ttVTZzbElWeDNPUW1ObWgxeUZLbHA0Q1A5U3hSN0FXc0hQ?=
 =?utf-8?B?WUhuaC9UaThzZ0JiMUtsSzlNYVVpbzB4UFJrWU1vaTNKUXpXUFlUdXNQZjlT?=
 =?utf-8?B?ZktSa3pLdFlxalNaUkpuS3Z6bzFJUnZzaGpNK2R4SWs1dGN6SFhkbjAzeDJ0?=
 =?utf-8?B?N1VackhVNlFudDJiTytTNVZzTEp2VnNEWkUyZmNoa3BUY3d1MzVBM1RJWXRh?=
 =?utf-8?B?ajhKQWlVT3Y2LzMvdWtWVnBIZ0NnZC90MithdjhqUGpJS2RVZFF6YlFZNVNB?=
 =?utf-8?B?bmRiZUlKYmhTRHdtek1LUSt1VmJmMUxKZllLc0ZnOCs5TTh0czVpOTZhWEFw?=
 =?utf-8?B?NHgyYXJEanYwdTFTeHB4WmxUMlV1VjBGZDJERStsa2d1Qm9VTEdBREhZWFRQ?=
 =?utf-8?B?TURKOU53eU9uZEUwVWR1NUdSQkluMENGTzNRQlkzbFMvOVk0aHFPa0t2c2VE?=
 =?utf-8?B?VGVRVEdjREhya3dJUFZPNkFFQU9ucitvWWpRYUtOYXBWRUI4MlZaMi9YMkRU?=
 =?utf-8?B?L0RWaWJCVi8rMEpXSnBablp2bExkWHVPeG1UNXhDdFRHVXNGYkErekk4QjVm?=
 =?utf-8?B?VDZzZk9PeWY5V25xMDNFeW9mZE9wNDY3N0s0bDhNYTl3akc2RXl3WTZHYzFr?=
 =?utf-8?B?cnFkRDFOV2R4cUh5bnd5YWc2eWZ5MzVYaFYvR0tscTBHUkxGT0tYYnUwL0d4?=
 =?utf-8?B?dzN6ZHMxb3R3ZW1xVEI2bnpRUy9USE5TZkk0cytSN0xtU3lPNENPL1BFUTM4?=
 =?utf-8?Q?9Bbx+qaifhru2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3pySTdaZHVMMzFKcXZvcXhYSjRtYVZNMXV1MnpSZGZsaTZXZXVPeXhhYisy?=
 =?utf-8?B?VWZrdXNqQ2RuRnJNODRSTjdpR1VvUENrUWRnbDdjQTFKZkphRjFVbGxaamRV?=
 =?utf-8?B?V1kzeEY0TERMWkM0NkVicEJGOTA5R3U5SldrYjNQYXMzYTd1cWxDVmh2RFBL?=
 =?utf-8?B?S1lzUEpDL2lTWnRKQmdweXozLzVHbTNveGpRdXFsbkFpdXhVVEJpbXEzM2pZ?=
 =?utf-8?B?WHpiMWp0YzNFUCthTysyclhLTGgyc3k0UlZRbVNueUNpN2ZzbFlhZ3RlbFlJ?=
 =?utf-8?B?SVVBZW16djl3bEN5Z1k2a2xBY0JOWkZteGpsOXhhODNCcnQwYi9HV0RmRm9x?=
 =?utf-8?B?cWVIN0dxM2tmQ01Hc0hIUmlEOXczVWx4RTlKSFFZMlV5MGkzYTV6MUJTM05r?=
 =?utf-8?B?Nlp1bWUxR0pudWJhQUt2LytrTUE3blRUSkhhbDRRVUlDTGVSYm51Mm5nTXVS?=
 =?utf-8?B?UUhsZVIwU3d2RmhCN01GYnF1KzFBKy96cjRkZ0hJV08wa3AvUnRvMGRNOEJy?=
 =?utf-8?B?Wlkwa3pTSkZaZklpcTJxSVJ0R283VktIZ05hVVNlUUd6YUNvVUtBUC91SFdS?=
 =?utf-8?B?ZFRYT1NtU0JPRkVVZnVqRWphZW9lZGhQdVNFWnU5YnhQWFdkK1VVc20xVTJL?=
 =?utf-8?B?V0RReWpONzFBTUtXR2FsTWYrTy9OOW1aNkgzbDFzdmROdFRiR0FrM2xKcGl4?=
 =?utf-8?B?b2I4R1Z3bkV1SXpmK0x5OWFPVlloU3htdUFwdFVDUlZIN2hIU2MyOU8yVis4?=
 =?utf-8?B?bkNpR0Yrc0tva3Jsa1RudDM0WnprakNncFJFM0dFdGR3UUx5RXB6RGh4QVQ1?=
 =?utf-8?B?Vm1aamF3ekZLTUFjNW40dzF2clZ1bjRtOFZnRmlPRXhRNHRGYzNERXEyT3VY?=
 =?utf-8?B?Y3lLcUQ3clZOMzFadk0zQ0hUMURpUG4vdDVBbmVrRnR3d3VuaU9GMnFQMXBD?=
 =?utf-8?B?cVgzOXB2cCtpbkpnc2VVUEdZOHBpV0JjZndQZk5TMVlnbERpUFRKK2FmSTJO?=
 =?utf-8?B?c0NjOG9SSjZSajJpbU5Ueit0QkdMR20reExVUTZvSENYTTY5MlRTRkt1dDVj?=
 =?utf-8?B?S2pzSElzZ0NxWmhOMDNCMWJ0OTIyeGNOSXNaNTUxOWdIdzFkWVdKVjlLSldL?=
 =?utf-8?B?RUpGeEFJQlF0UFZFZ2RzbWJ0dXUyTXpEZlRzdHlGeVpQejRxdFk2RHpvdGU1?=
 =?utf-8?B?aEJ0QVhoUkxYQTV3RWpROU5kSGMzRkMzcEcyU1JvTHNJbUZjMTE1WXcxUytG?=
 =?utf-8?B?ZHJmSTdyUkwzbWRRU1FOakxjbUlmMUh4UUtFTEhsVFJUWEs0WDUwTTkrY2k5?=
 =?utf-8?B?U3cyOWNuL2JjSTdWWGp2a1NoeVBsSitFcDJiVzBwZkdycFNBQ3ZVNDhwTVZC?=
 =?utf-8?B?amhoeXh2aHdoa3JRNWFqeHcwd0p4SGFZaHNSRTlQSXhudGgxdWRNcFFRQ0tP?=
 =?utf-8?B?a0xkeE85NjZjS28rcDh0NEwrOCtEcll1S3NJMkxaMFdzOWtTUEV5Nlg1aWli?=
 =?utf-8?B?YVBXbVZOVjFESWtJWHdpcVRvZTB5V0JtZnYrMVRkZGZKZzEyclBvaklYRGI0?=
 =?utf-8?B?Rk1xN2JMYUdOYVJMZFA2MFByaGZEWmlWcW4zZ3Z6aERKQkJPY041bXBHTkJs?=
 =?utf-8?B?RXNVUVF6bXd3dFFHSE9KcEdqRTJUSDdwdFpVamVXZ0xydDZYZjdvS0ZqcHVh?=
 =?utf-8?B?allTbkowc0NpTEdMaytZSURNeFBUVFR4dzNMaHVNcDNhbjlpKzlxNDQvcERO?=
 =?utf-8?B?VWdoTnFNdlpiV29zTmFqZlhZUnAxdlAyV3Rad0M5Zlc3ZlNwdHRWRklqVGg0?=
 =?utf-8?B?S2Y0NHptdG50cWpsZC92d3FNcVo0R2xzTnRBUmRkeU5jMXp0bVdFREFiRzhV?=
 =?utf-8?B?K0lRT2UzUEVFVkNPdXkxeElFbE10UE1YZFlTdm1aVUVIN2Y2QUVNT2hRM2lr?=
 =?utf-8?B?anJsQlVpb0RMNmNlWURyU29BbFNUcHZydGR2NUdsQjNYYU95aGFiQ2haMGdI?=
 =?utf-8?B?THN5cFh0R3VRdERPRHRSdDZ6cnBlYUNvSlFSZGtqUlJpV3BKT0hLbWVDNmNu?=
 =?utf-8?B?dDZsaW9DZkEzSER5UXJ0VWFwL0ZsMHNOUWZPUk9RTmNkOXRYRHc5MzIvaVhG?=
 =?utf-8?B?MUt4aWNOUGZIdnZMbXAyNUlaTXlCbzhDdGExV25WMmhmWmMwNlpIY1gyaUxt?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pb1Xx1tk9833CJr97XWftJATV1Hv52GAy8qOobr08NT42+fFNCLD69pfqUAPrO2MuG8JBIjljXiS34P0bJX0X3jL3gakY0H7+yKjiSBVvlBuR4ggK9tBK/7bj64g6vDn/gGsAwsmaNsOoa13lFIYaOQYQIaQPrPX0L/E8Yr0VsC3CjK4SwaKwDxyCRUm3DCqvzQWRDCLhmIdjtWO1pnvkk+AnasDnerlhrQHNAaayqQccIua4uaFkaGYVRMq59KE9oAHajJoFfAhF5NSifhdtd/eTolqsQCqye2NFOF8tq0qC21ss6GVTdG1U3QrMvi4/tjXZKNNbFEnnvjtNLVCkmsIOfKVN3xomQVxxXj136k5EH9BIvQauxmJDI7Fy/0bPecnc+nocUUUIFKBvXn4OgAnOaOKz+WUH6b0g5hPqRt9EImf36BHv2SSoO88n9GPq+QYz/jAVFgskx53722htMrwUChiA3IbW1QAFR8aAKnrrtiz/4FnZ2+XmkEkG9nxkxCoHua1C5rIxyuh8LEgN+SP04S6aTwo4sPRQcUVFeIbhfH5Sk1QEoq5KTwosE9bsovfJaRArh7I6r+52+ewrg8r/Yoehz9/Na11sEQUDU0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0a72f5-b249-48a3-e0ea-08dd3480703c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 09:47:20.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30iQYq/GONGgKUgXRJcqMpOllykBXv1GGCjueAHtmOyvG15bpw/A0xO7jFW5byHYDUoyTfLL8Clei/5KLVNVj6lvWX/KsMDdvyeU6lbIXkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=938
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140081
X-Proofpoint-ORIG-GUID: jbk6Cy4dJYtgbePAoGx11TOj-2yHBi_D
X-Proofpoint-GUID: jbk6Cy4dJYtgbePAoGx11TOj-2yHBi_D

On Mon, Jan 13, 2025 at 08:09:08PM -0800, Andrew Morton wrote:
> On Mon, 13 Jan 2025 18:53:11 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > On Mon, Jan 13, 2025 at 5:49 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > >
> > > Yes, we're at -rc7 and this series is rather in panic mode and it seems
> > > unnecessarily risky so I'm inclined to set it aside for this cycle.
> > >
> > > If the series is considered super desirable and if people are confident
> > > that we can address any remaining glitches during two months of -rc
> > > then sure, we could push the envelope a bit.  But I don't believe this
> > > is the case so I'm thinking let's give ourselves another cycle to get
> > > this all sorted out?
> >
> > I didn't think this series was in panic mode with one real issue that
> > is not hard to address (memory ordering in
> > __refcount_inc_not_zero_limited()) but I'm obviously biased and might
> > be missing the big picture. In any case, if it makes people nervous I
> > have no objections to your plan.
>
> Well, I'm soliciting opinions here.  What do others think?
>
> And do you see much urgency with these changes?

With apologies to Suren (genuinely!) who is doing great work and is
super-responsive here, this really needs another cycle in my opinion.

As Vlastimil points out there's some non-trivial bits to go, but I am also
firmly of the opinion we need to have as much testing as is practical here.

I don't think this is urgent on any timeline so I'd like to join Vlastimil
to firmly but politely push for this to land in 6.15 rather than 6.14.

Just to reiterate - this is absolutely no reflection on Suren who has been
really great here - it is purely a product of the complexity and scope of
this change.
