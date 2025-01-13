Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A2D20F094;
	Mon, 13 Jan 2025 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788333; cv=fail; b=WkIaAqy09B02pGxjV/Jg7ftpppugqfYCUyqWQ2//l3z54O0HfnLNqqyf580beQWW+wVvRKmkJdAR49HKkw1mdA03F5rg6VPoyPYWNEWMsBUAtaTkEj0vtubqdOUBe0zI159iO8F5IG6ukaMmTqgn55dmZrhxpIuO4NvbxFXQAvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788333; c=relaxed/simple;
	bh=4lGIFkcLyYqot35DQka11vNTtOvNTI3TWLlPGYvWVQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G184nhnbyHAU9ha4NvDaH7Ul399KC+xpgkD9vi5tsTOAdSWSo5zbWbJTIHhEYPKOYW7S1qrWoGHxOJ9OV8tyC0BpeEFEhrEXkt8nmhh1qqE2+mQZxp+DU0shKFWqPgh+DQhZttD58dGGiO1Ty+g0WMaRhvgeRy9T6udIfMrfKsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zez9g2Oj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HgQZkCOz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zez9g2Oj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HgQZkCOz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHBdK4031685;
	Mon, 13 Jan 2025 17:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=EXoJX3epqvI7A2qgFL2RKwmiCfAdA/uS40P1tFvcpwA=; b=
	Zez9g2OjmjERori82XwkPIdAhoVqAOdXxAIipRQ2C+0c4vvnD4d2OIUrbo72k3z5
	pAxQ/GGv0Z7W9HsUSfqDluoI/tt+uU8ZrZnn0XAgv/ihC4AfMp4aUPAYIfP9PAuQ
	CeEA45bPUgVHmDDW7xqgAYDamhq9h6BKrgqIxg/1LoHkfflXEakV3d1F2/yhy+WH
	G4cbRAfrHI7w2pYWkvUesPO3Ks3iRynDzwbSzCzut6jUKg4GBEsq2IQyhJm9898Z
	8HEQnunxrPUvWsWn4lzuD8LatO+RYRQwwu5QhLlBonvM7Y1u1Yxvl1oaxeIKioje
	31asQuey1QDsTm1rCzdcJA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443fjam36a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:11:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGQ19h039232;
	Mon, 13 Jan 2025 17:11:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f377pgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:11:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbdPIc3CyxvMFAnz4bLt1wLODFwyA+UeWpFxNDE2jWyxsXJOPn6bFyOjwv/g0W4LRNvlJ7aJgX/chsuao/raIsEN9y+nGdZxZodZaNc1E8z5KiGP33KM+05eL/2z2hZc2OUHbcxuBKPSy6Ol+vwKy96xVOd/PuGepphiEIJXXjTqo3U23W78h4yoKJJt5HBqIsV4f7cNfve5az2/nRLJXS5nywJzYUc+0VFkLl+fhXbKNSlF3FZZlSB+0MHOW6qpqij/P6CKZV/J/u24wichlu8/yJ7DEVWYuIrh40Xcs5UExiCSgfTIN4MUiK9/R6MO2DoRo68oPFt5/GZZPo+Scg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXoJX3epqvI7A2qgFL2RKwmiCfAdA/uS40P1tFvcpwA=;
 b=fDQcZX94fv/3p0Cdo9tjbob/XSEr4oZIUt+X0aO6CnwU+nE02xdFeScYpaohfbpSfogykpaPi+6ZSBNQa79zofx8wWtih9FmbGHQM1Fu8ghMT73oxvWgWsjKgO/WVWQ4yuceYYDYHkaeY4Fqcz3cGgQZ8w7YIl4zxnlQlpMksdMBZr8HQQNmoCWF+UGUOKKTUluWODeC7NI/QrRGJWQyfC+DktV0TOOT3NDa4fr6nFT+ZAMjJeULUwMEheX2b3lyytyihhZzPwxwCCwJcCvBt9iGzE898/Z59lCxDT2se7wOT0Am0wd//lMXbspYyaHjrROXJt5qLlGDLPeBA6pw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXoJX3epqvI7A2qgFL2RKwmiCfAdA/uS40P1tFvcpwA=;
 b=HgQZkCOzZuH3Epd0nzkl9U5tFDFMGa6nDjviDtHoUp02csJgD9nqZpynH7hiTXGpAq8SFujePkx5O1OPe/Ws89sEr6+tqR2S3n44BaGajd9GmKjhiVS2iza0ZelVdmk5ogiv94c7RgO9xDlvR9KFWGY35CdaRsUh7jh6VRrpG9Q=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB7157.namprd10.prod.outlook.com (2603:10b6:208:400::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 17:11:35 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 17:11:35 +0000
Date: Mon, 13 Jan 2025 17:11:32 +0000
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
Message-ID: <5aecdfec-5939-4627-a27b-f2057a95fb65@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <CAJuCfpEf4SZVCH+HfJsvJLbvvMFnm0tyh0P1YwjMeYk-nP0RdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEf4SZVCH+HfJsvJLbvvMFnm0tyh0P1YwjMeYk-nP0RdA@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b769338-dd3a-4527-20dc-08dd33f55575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWdVbVR2bFlQaWdNSGdaU2cwSTh5UlkrMHF5SWM1YVVzd0tuWlg5RVRDKzU3?=
 =?utf-8?B?cjByT2F0MlVsL2I5MXd2VWlUbWxBdXo0K3c3VHJvam1xTzNrcTJnRXJmdnhj?=
 =?utf-8?B?Zi9MUytNdnFhTm1mT2l3TTNqdHNmNzlyeXFHbjRtcVA3MXZvVUlEYVpIaXB6?=
 =?utf-8?B?QlkwZTJyTHAzY2F4WXBhaVEzd2loWGdRbzVQYXdKalg5ejZvNlVwVUR2U0Fq?=
 =?utf-8?B?NDVWYjNuT1doNmMybER2d0RuSEVVUG1XSWxaZVZRRXN3STZlUUQ5WExjN21r?=
 =?utf-8?B?R0pxejR1ZCtRMytHVExpSVRuYjFzWms0Y0ZEYkxqWk9iRlZPK0RSR1lrU3FE?=
 =?utf-8?B?R0tOVzF5am5QYU9vZFNBRU1YMktQb0lFaVc1WWRPREpoUTdLMlRMU1V3allB?=
 =?utf-8?B?MWVMcGZnY1dFbXFydU5aN0UwWGxmLytMNERZVGtDVmpWZ2NIU1p1M29qQlow?=
 =?utf-8?B?WWd6TWlLNHY2TlJ2YTBKWHhoTVhkVHJYcHp4dERIVEVNa3ErZm0rTkpxRlJI?=
 =?utf-8?B?cnhFdVVGcTRIWk11NkhOditPNzZBN2hITEVXUTZpdmNkQ1NybDdzalhrUjhi?=
 =?utf-8?B?RVFsVXVGK0Y2UGRJdWtjZGRIYkNUMXo0QkMyd3I2VDNXWlcraGl1WE1yblhx?=
 =?utf-8?B?MjdCUHREZmJlRlk0ZUNTSm1zSHNnWk5mbEhSVUdxY3Y1eTArWGVDYmFzRGR3?=
 =?utf-8?B?dmFOYnc5VCtIbjhaL2xMdTEzOS9sdTdTR0VXSlNVWTladXdwZVMrOEdXT0ZF?=
 =?utf-8?B?Smpid2F3U3VtbEV0VkFzKzRGU29RRnB1K0orT2hYeU53bjJZbGN4WWhyZ0d5?=
 =?utf-8?B?Rnk0UEh6Z1hFZ1BVUlMvN3NJRFNGY2ZDeFp0WW9sUSt5dGhNNng4bmw2eTlk?=
 =?utf-8?B?R2V2RHF1THpJeHNIVktYTVV1ejJJclBMdGxZSGpaMzlNOHI1dkIvd05VVnBJ?=
 =?utf-8?B?YW1PTm5xQmczSjlnanZhTkpwYkNJeTV5V09BQTdJSFpXcFYxWWlzbCtwV0tk?=
 =?utf-8?B?RENIaFlWQzRUWUQ0OGRWa3N5dDZNanVmUDN4YUU5WDBSRS96NEZTRFduVExD?=
 =?utf-8?B?NHIrUU5Wck1IWHk4VUFIM0J1TmRiMXYwNGlEWEVndlk0Z2ZqMkxBWXFiWFRB?=
 =?utf-8?B?VGk2OFlhZUNvVE9BbytLWlJrMWxzcUpGRmVVaXFnd1M4WTlFNnliUnZUVmdB?=
 =?utf-8?B?WFh6NzJBOUpZbWI5S25Uc0Jrb0JWUnhoSEsxR2hlRjNteGRtVlZDYlVxK1FJ?=
 =?utf-8?B?bnF0ZkF6YTJLdU02Ty9SUUgwV2Q4eUorVXNhbU1aN1R5MjFtV1ZLYTVQOUNM?=
 =?utf-8?B?R2VKdW9nOGlJOTI2aGpPa2hGNkNMV1dQekdDcXhlcHkySWpaZmJRb3BzWjl2?=
 =?utf-8?B?RkNtb0dyaGNoVG9pRmxrUlVGTURmSVVmWll0UTgrcktSemVoZ056NytFdlNB?=
 =?utf-8?B?VnAzckhWYkZaSStOUXQzVjd2QjNXdmN3RHZYdXJRTkZodUdRekM1ZkxDTVo2?=
 =?utf-8?B?V3k5TVpFWXNrUGJwN3FzMVhTZDdTSVJmcmVQMzFzZURsSGxaZDV0a2pJUjlu?=
 =?utf-8?B?UTY1K3ByTEpHRjY0eUhXSitHWW03SFBocjdhdklQdHZ2eHlUekhVc29PZ3Rh?=
 =?utf-8?B?eHBTaHRqbjlRdlVjWEtUQS9CcDJCaFNQcFNobGxTUkFmdkRpVjhsVDFiZ0w2?=
 =?utf-8?B?TDJiWWlMcmhCaHo5RjI4L3QxNUtHVi9hYUxyQjVzMDJ5N1Q1aDBoLzJWSFE3?=
 =?utf-8?B?Mlh0VVd5dTA3Z3VPQ3pVSWExRmZrZzRlME91VnNzQ0JkVnNKWTl5UFFKLzRz?=
 =?utf-8?B?YmNlckJqSnBGS0lNL2Y5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0t4cy9uVWZVYUxDZVg2TXJuSHowSXJUT2RCRis0c3BIQWNZcDd0WDdqTTVO?=
 =?utf-8?B?OHlvZG54T0tTL2FMZnhMZzlzcGxJZUgwcjRzMmtuaHAySWdEVnlMdVFKL2JF?=
 =?utf-8?B?Z1RTWFF3UlJpUVV1Wkozc1gxSEdGdW1jdzJJSFJPN0Ric0kwY0pvbkJrVTZP?=
 =?utf-8?B?MFo5QzAyV3NtaXR1UmhaNWJYRWdYTTVtUnNsT2ZUZWNZNFlJeEl2eHNGR0ZU?=
 =?utf-8?B?cEt3ZUVYSG92MjZyVnVGQml5VlZMcTc2VEFsQzQ1bHNOR3lYaHBHNm5TMXBQ?=
 =?utf-8?B?TGlER1V6dG0vQ1E0NzRmMTBhSWtrSlhISmJrUURkcURFSFBtWUhuTHUyRWgz?=
 =?utf-8?B?UlhCUnBnQTZpMnJFQVFncWJLc0tpdlJ4bjdCandnd1BaZDUzd09QeGlDUU1t?=
 =?utf-8?B?RHFta281VkFYei92VklZVTFMNmVMZmk5aTFSaXRsQzM1akVOQ016V0lGc0tK?=
 =?utf-8?B?SkVpMU5WVTU4UjVPa0NYdFRnekJtWWJ1Z2VrcmN3SXNFQkt5ekFleFBZV0dm?=
 =?utf-8?B?SlZ4MGxNN3NwT3VRdFViTDBGL082VzFjaFZGbDNSOEUzTU9ydWxXNUtxUktK?=
 =?utf-8?B?LytCV3dKOVNTQlYyczhJVkFHS3gySkJjbDRGOTRJb2hGZWpncmNYdW4yV1JU?=
 =?utf-8?B?aGZYc3NNYnloMUkyclAzRVJ0VFF4KzI4SHVOZlRoWGpjalBWdDhUSFUwT2RV?=
 =?utf-8?B?RU5wVDVXVVJRRDlmNFRGTTNReGdSaC9Eb1pHdy9RY2U2ZGc2V1ArM0RPdysv?=
 =?utf-8?B?bHJxM1lycERucmVJeDNZVGxkNUNBTnoxY1FHVGU2TlJ3cXdIWFJYdENOV2N0?=
 =?utf-8?B?dUlXWnpic25IQUFHVjdmT3dubTkyQkN2UExNSDV3aXg2bWJ0YXJHeWNNYjZG?=
 =?utf-8?B?S1M3WCtEbUdQZlN3U2VDOHRvYUhtL1g2WjYycndDd3hFNFJRQVBzZlQ2Zmls?=
 =?utf-8?B?dW9LeWxqYnlwUCtqNEZER0Z3NW51dklXK2tPUm54REtXQlFnb2Z6UkV2SzFX?=
 =?utf-8?B?RkV6MTBaY0xEdDZCdGRrWXgvS2dic05kckNuZHBpbDRIU1FKOWl3QkkranhW?=
 =?utf-8?B?a0RmWWpmVTRTOEhWTlFsYU40c2hTbjVRdUFpSFJlcXVCck1HTTROWXZHaHVm?=
 =?utf-8?B?Sk1LaURqajRNNmdjb2czeTNSN2FaM3BTUWNLck5kRlF2cEhLbUVNaEdWNmMr?=
 =?utf-8?B?ZnZ3M2VrOGxqUkp3cUthbk9PdTRrSDZ2S1UwL2VYWkgrUkxBME5SUmNKcnRO?=
 =?utf-8?B?bnRneGVGWC9rRlVEYXRMelY4VEIxU0xRUWNlK2xXNXk2RmlpK3plL2MreE92?=
 =?utf-8?B?aTdubVpxWFVJWWlqWEl4WnVmZDBsb2xTQUNHZk15OGM0MVJudXIxUS9SUFNN?=
 =?utf-8?B?VG9RTXkrbGZiQWZoMTRMajVBUzJuWVJKY1A1S2tSMVpreTBxcEI2ejVIMmN4?=
 =?utf-8?B?cklWeG0zTkRzRXdIRkVKNTNYZ21KWlAvNUxYYXNMaWtRR2JMZzBzc05ETzJ6?=
 =?utf-8?B?Z09VVlhMMVE2Z01jaFlQaG84L21MVFBMSmxKREdNdi9kdlNaT1lyVjZFekll?=
 =?utf-8?B?aVhTRE8vK1ZLMTFra3dvelIycnhBU1FvbTRZbE5HMXp0YkhpVWR3Y1dKR2Ix?=
 =?utf-8?B?VTBTTHg5MXhqbEdXUjBHWS83MjRxMkdMWXlQd0ZvS0xBdU1ZQUloNEM4MzBu?=
 =?utf-8?B?YXVpL3RNMHpTNWdWSnRBSDJuSTBUL2NFZFR3ekxhdnlZOTd5R1ljaGpSa3Q0?=
 =?utf-8?B?bUlOZ1pheHVLUWlPT3FxeHdkZzREZHZXRVowM2dxeW0xQ0ZQRzhURnV2Z0k1?=
 =?utf-8?B?RTkvV3cvZlVNSnVWY3NsMzJYNUQ4TnNzNXRUZTJRRUJMV0NweFkwQlVBUkd2?=
 =?utf-8?B?RnBiQ3VKQ2RFbWJ4OGk5OVRWblpEV2loeS9uN3kyeWxpbHRGVFdwMHpuZHc3?=
 =?utf-8?B?WXpiZHVCRDhhTXlTejVVamI3bFEwWjhiTGIvSGtycWpWTDc5cjBJSzBWOWY3?=
 =?utf-8?B?cFJqK3RMemM2aTQvSkFDOHlHMEJjdDl2Vk9BQjlBS1doWUlzazdoOHUrdDM0?=
 =?utf-8?B?TThOMS9JQlVnQnRPRk1wdFFPVklqdExiTUdjL09nVU01a2tDeGZKUTRzT2Vk?=
 =?utf-8?B?cVhsVzE3OXdvYTBrdXJGb0t5WGZBRVgzRWw3RzdtcTA1NCtuTk5tRGlwTi9G?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5xbWWuqLlcYZWHe/HPDGAFUj8qykCjI5Sz5mMrYRCii6LE6etFY8AjrKa6Mmj8duSpiJF3Kek3VxHeeEF8M/LfJuO2zF5qMvsKuduoD6jdRbWFWij+b20IlWyLHttvmaVFMW8u7/9HTO+e8hHgPnHHF6NOUEuhm7SBRQOE45W7QSZ+cUEh3lshqcpjZyuxXXwNmE9ML031v1w0JHo+wgYeC+wqmsfw5S6QurosUL3o9kB3evuWaT+O9CCvN6M8Nc9f0Zo213ss2w7lLdtffvS+Nk4f9Sba3m/fnITDxLzNk/knksPURauRbw5QcjMNrzcyUpuojSvxCtC44/TsDT1tJPqqgxGEJnfpzRL8mTHCgcGyOqbGphQYJNr4dMTw8UY19kP/BKhSRzNQXpDY/OC4xippbugSZ7XThjqceLx7asPk6kCpeECt9O90jiiH8Oi1ZFF+JSiyzUp3FkCTVGVEI8AgvdPKB0bXXGYq/thrhxHPqsVuvQ6OC8SccpmQXJViwSLKvcIUNmcj8XhLxga7tKWnyN8ZcROwQhNhZSkmlA+l4tJ9Yx8x2r/LJ28fc4xNIHrykPHR3ofkv/tTYQGQ/y5XyrR1O2EJgqlqZ0bBk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b769338-dd3a-4527-20dc-08dd33f55575
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 17:11:35.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZfhimPKVhtQNVXEz0ZAGc8E3DOCHBS4nZIQl11uk37mqyIU3fXbbNcwdF2iHzSiM5lOZ4L+QGKs0h4LNkBBuyKucb7rpIso05t855Xlxyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130139
X-Proofpoint-GUID: Y1Icc2wwq0Byc9hL3cubF3JmlrserLFt
X-Proofpoint-ORIG-GUID: Y1Icc2wwq0Byc9hL3cubF3JmlrserLFt

On Mon, Jan 13, 2025 at 08:58:37AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 4:14 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > A nit on subject, I mean this is part of what this series does, and hey -
> > we have only so much text to put in here - but isn't this both
> > reimplementing per-VMA lock as a refcount _and_ importantly allocating VMAs
> > using the RCU typesafe mechanism?
> >
> > Do we have to do both in one series? Can we split this out? I mean maybe
> > that's just churny and unnecessary, but to me this series is 'allocate VMAs
> > RCU safe and refcount VMA lock' or something like this. Maybe this is
> > nitty... but still :)
>
> There is "motivational dependency" because one of the main reasons I'm
> converting the vm_lock into vm_refcnt is to make it easier to add
> SLAB_TYPESAFE_BY_RCU (see my last reply to Hillf). But technically we
> can leave the SLAB_TYPESAFE_BY_RCU out of this series if that makes
> thighs easier. That would be the 2 patches at the end:

Right yeah... maybe it's better to do it in one hit.

>
> mm: prepare lock_vma_under_rcu() for vma reuse possibility
> mm: make vma cache SLAB_TYPESAFE_BY_RCU
>
> I made sure that each patch is bisectable, so there should not be a
> problem with tracking issues.
>
> >
> > One general comment here - this is a really major change in how this stuff
> > works, and yet I don't see any tests anywhere in the series.
>
> Hmm. I was diligently updating the tests to reflect the replacement of
> vm_lock with vm_refcnt and adding assertions for detach/attach cases.
> This actually reminds me that I missed updading vm_area_struct in
> vma_internal.h for the member regrouping patch; will add that. I think
> the only part that did not affect tests is SLAB_TYPESAFE_BY_RCU but I
> was not sure what kind of testing I can add for that. Any suggestions
> would be welcomed.

And to be clear I'm super grateful you did that :) thanks, be good to
change the member regrouping thing also.

But that doesn't change the fact that this series has exactly zero tests
for it. And for something so broad, it feels like a big issue, we really
want to be careful with something so big here.

You've also noticed that I've cleverly failed to _actually_ suggest
SLAB_TYPESAFE_BY_RCU tests, and mea culpa - it's super hard to think of how
to test that.

Liam has experience doing RCU testing this for the maple tree stuff, but it
wasn't pretty and wasn't easy and would probably require massive rework to
expose this stuff to some viable testing environment, or in other words -
is unworkable.

HOWEVER, I feel like maybe we could try to create scenarios where we might
trigger reuse bugs?

Perhaps some userland code, perhaps even constrained by cgroup, that maps a
ton of stuff and unmaps in a loop in parallel?

Perhaps create scenarios with shared memory where we up refcounts a lot too?

Anyway, this is necessarily nebulous without further investigation, what I
was thinking more concretely is:

Using the VMA userland testing:

1. Assert reference count correctness across locking scenarios and various
   VMA operations.
2. Assert correct detached/not detached state across different scenarios.

This won't quite be complete as not everything is separated out quite
enough to allow things like process tear down/forking etc. to be explicitly
tested but you can unit tests the VMA bits at least.

One note on this, I intend to split the vma.c file into multiple files in
tools/testing/vma/ so if you add tests here it'd be worth probably putting
them into a new file.

I'm happy to help with this if you need any assistance, feel free to ping!

Sorry to put this on you so late in the series, I realise it's annoying,
but I feel like things have changed a lot and obviously aggregated with two
series in one in effect and these are genuine concerns that at this stage I
feel like we need to try to at least make some headway on.

>
> >
> > I know it's tricky to write tests for this, but the new VMA testing
> > environment should make it possible to test a _lot_ more than we previously
> > could.
> >
> > However due to some (*ahem*) interesting distribution of where functions
> > are, most notably stuff in kernel/fork.c, I guess we can't test
> > _everything_ there effectively.
> >
> > But I do feel like we should be able to do better than having absolutely no
> > testing added for this?
>
> Again, I'm open to suggestions for SLAB_TYPESAFE_BY_RCU testing but
> for the rest I thought the tests were modified accordingly.

See above ^

>
> >
> > I think there's definitely quite a bit you could test now, at least in
> > asserting fundamentals in tools/testing/vma/vma.c.
> >
> > This can cover at least detached state asserts in various scenarios.
>
> Ok, you mean to check that VMA re-attachment/re-detachment would
> trigger assertions? I'll look into adding tests for that.

Yeah this is one, see above :)

>
> >
> > But that won't cover off the really gnarly stuff here around RCU slab
> > allocation, and determining precisely how to test that in a sensible way is
> > maybe less clear.
> >
> > But I'd like to see _something_ here please, this is more or less
> > fundamentally changing how all VMAs are allocated and to just have nothing
> > feels unfortunate.
>
> Again, I'm open to suggestions on what kind of testing I can add for
> SLAB_TYPESAFE_BY_RCU change.

See above

>
> >
> > I'm already nervous because we've hit issues coming up to v9 and we're not
> > 100% sure if a recent syzkaller is related to these changes or not, I'm not
> > sure how much we can get assurances with tests but I'd like something.
>
> If you are referring to the issue at [1], I think David ran the
> syzcaller against mm-stable that does not contain this patchset and
> the issue still triggered (see [2]). This of course does not guarantee
> that this patchset has no other issues :) I'll try adding tests for
> re-attaching, re-detaching and welcome ideas on how to test
> SLAB_TYPESAFE_BY_RCU transition.
> Thanks,
> Suren.

OK that's reassuring!

>
> [1] https://lore.kernel.org/all/6758f0cc.050a0220.17f54a.0001.GAE@google.com/
> [2] https://lore.kernel.org/all/67823fba.050a0220.216c54.001c.GAE@google.com/
>
> >
> > Thanks!
> >
> > On Fri, Jan 10, 2025 at 08:25:47PM -0800, Suren Baghdasaryan wrote:
> > > Back when per-vma locks were introduces, vm_lock was moved out of
> > > vm_area_struct in [1] because of the performance regression caused by
> > > false cacheline sharing. Recent investigation [2] revealed that the
> > > regressions is limited to a rather old Broadwell microarchitecture and
> > > even there it can be mitigated by disabling adjacent cacheline
> > > prefetching, see [3].
> > > Splitting single logical structure into multiple ones leads to more
> > > complicated management, extra pointer dereferences and overall less
> > > maintainable code. When that split-away part is a lock, it complicates
> > > things even further. With no performance benefits, there are no reasons
> > > for this split. Merging the vm_lock back into vm_area_struct also allows
> > > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > > This patchset:
> > > 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> > > boundary and changing the cache to be cacheline-aligned to minimize
> > > cacheline sharing;
> > > 2. changes vm_area_struct initialization to mark new vma as detached until
> > > it is inserted into vma tree;
> > > 3. replaces vm_lock and vma->detached flag with a reference counter;
> > > 4. regroups vm_area_struct members to fit them into 3 cachelines;
> > > 5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
> > > reuse and to minimize call_rcu() calls.
> > >
> > > Pagefault microbenchmarks show performance improvement:
> > > Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
> > > Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
> > > Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
> > > Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
> > > Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
> > > Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
> > > Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
> > > Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
> > > Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
> > > Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
> > > Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
> > > Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
> > > Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
> > > Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
> > > Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
> > > Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*
> > >
> > > Changes since v8 [4]:
> > > - Change subject for the cover letter, per Vlastimil Babka
> > > - Added Reviewed-by and Acked-by, per Vlastimil Babka
> > > - Added static check for no-limit case in __refcount_add_not_zero_limited,
> > > per David Laight
> > > - Fixed vma_refcount_put() to call rwsem_release() unconditionally,
> > > per Hillf Danton and Vlastimil Babka
> > > - Use a copy of vma->vm_mm in vma_refcount_put() in case vma is freed from
> > > under us, per Vlastimil Babka
> > > - Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read(),
> > > per Vlastimil Babka
> > > - Changed __vma_enter_locked() parameter to centralize refcount logic,
> > > per Vlastimil Babka
> > > - Amended description in vm_lock replacement patch explaining the effects
> > > of the patch on vm_area_struct size, per Vlastimil Babka
> > > - Added vm_area_struct member regrouping patch [5] into the series
> > > - Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
> > > - Added a comment for vm_area_struct to update vm_area_init_from() when
> > > adding new members, per Vlastimil Babka
> > > - Updated a comment about unstable src->shared.rb when copying a vma in
> > > vm_area_init_from(), per Vlastimil Babka
> > >
> > > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
> > > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> > > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
> > > [4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@google.com/
> > > [5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.com/
> > >
> > > Patchset applies over mm-unstable after reverting v8
> > > (current SHA range: 235b5129cb7b - 9e6b24c58985)
> > >
> > > Suren Baghdasaryan (17):
> > >   mm: introduce vma_start_read_locked{_nested} helpers
> > >   mm: move per-vma lock into vm_area_struct
> > >   mm: mark vma as detached until it's added into vma tree
> > >   mm: introduce vma_iter_store_attached() to use with attached vmas
> > >   mm: mark vmas detached upon exit
> > >   types: move struct rcuwait into types.h
> > >   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
> > >   mm: move mmap_init_lock() out of the header file
> > >   mm: uninline the main body of vma_start_write()
> > >   refcount: introduce __refcount_{add|inc}_not_zero_limited
> > >   mm: replace vm_lock and detached flag with a reference count
> > >   mm: move lesser used vma_area_struct members into the last cacheline
> > >   mm/debug: print vm_refcnt state when dumping the vma
> > >   mm: remove extra vma_numab_state_init() call
> > >   mm: prepare lock_vma_under_rcu() for vma reuse possibility
> > >   mm: make vma cache SLAB_TYPESAFE_BY_RCU
> > >   docs/mm: document latest changes to vm_lock
> > >
> > >  Documentation/mm/process_addrs.rst |  44 ++++----
> > >  include/linux/mm.h                 | 156 ++++++++++++++++++++++-------
> > >  include/linux/mm_types.h           |  75 +++++++-------
> > >  include/linux/mmap_lock.h          |   6 --
> > >  include/linux/rcuwait.h            |  13 +--
> > >  include/linux/refcount.h           |  24 ++++-
> > >  include/linux/slab.h               |   6 --
> > >  include/linux/types.h              |  12 +++
> > >  kernel/fork.c                      | 129 +++++++++++-------------
> > >  mm/debug.c                         |  12 +++
> > >  mm/init-mm.c                       |   1 +
> > >  mm/memory.c                        |  97 ++++++++++++++++--
> > >  mm/mmap.c                          |   3 +-
> > >  mm/userfaultfd.c                   |  32 +++---
> > >  mm/vma.c                           |  23 ++---
> > >  mm/vma.h                           |  15 ++-
> > >  tools/testing/vma/linux/atomic.h   |   5 +
> > >  tools/testing/vma/vma_internal.h   |  93 ++++++++---------
> > >  18 files changed, 465 insertions(+), 281 deletions(-)
> > >
> > > --
> > > 2.47.1.613.gc27f4b7a9f-goog
> > >
