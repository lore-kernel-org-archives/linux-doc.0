Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57E72F5A10;
	Wed, 21 Jan 2026 17:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018330; cv=fail; b=HHWN53KqfUlCzfnAZVEv3uB2WyEC0bLBm8G9I75Mkgmr9n/2l752/VROytTxR+TRVN0KPTaWvLIjAht2WnLhVUGUt40QX0A3a6YUbnvKB4Z3KXK7Z/YN/AqDMp/3FPiSLTC3VPArKf4NJ0dhe3lh7pauzBcTs6WiWXhn3tJGXBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018330; c=relaxed/simple;
	bh=kUOVRp/Dqxqdil7X2Pz4zkmi27Vb4s1c2daZCRZUhLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AK4fNcxGe+dYWtIcehvCavLeN7G3jjNX+Yb4CvdSLvBdcSO4ZCv8AByIW33rKRro9/iaWVwG3aVOuo5qfWftIaMLbgJP5wIpSclk8iDnGOYJA4zXxNJNjGSWRGzI8HHqu0zGuZM4Gta7Hhqtg5Ut/zctBAg9d3PdCthF3oOF8Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HJrQ9Uzw; arc=fail smtp.client-ip=40.107.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HJrQ9Uzw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Grj9uWmeKK/8ySYRmTFidj0jejCoP2SR/xW/PGEow5MGrrnoUY7zLYv5moBWOnG6vM3Iuvg0ERYZWb+N7tqEkIS5W1JP+rscjJ48T/m6od6MMw9q6m0pkg6KdlKISjlTSDb9wFoyTdZNamwv6qjXg/Ph5Xh/oBlwd0b2IOoITUfyC+Xp9QIlL7sBbRbXPoCYdx85ClQdaNYD8Ka6bJlS9TfNfPIcdUTZbQ4+GULwTPFZN+D+320GYkDyqoxSE9ZTalwPE3Mn7HizZZfO5943q6WqD5kKbd1h0KEHZ9Ugsx6/4DY60U7btNnNgef0rXgRNI3yhE/MxugqsxZsHwbteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2nJo/IyrJBs96t+Sqn8fMULveLev4TsZBQ6SbPIUbQ=;
 b=phYaPYTZGiL+Vf33dtJjVSC9JZK+FSSD89VCAKDANmsLjUED+VKeqiuw1h+fqxReZLlgWlIfqBGSZB6yurAfUERXFKi9Kluuov9swOTisdz3gKPm/iwh1iMPLPpusOhTYT08extlqUQyoEGi3iy5xQBnNazHK72uKhVVf158tGlQuQaCOwPx77XaEQsRSdy8BWU/k/YXV373ZnbC7kdioH/upkcdyZPsNSwk1+M01dhuInPhrQdsDlIW0Aj8EyKjBovFH+kZ9QR0D8fXo14xE/AEXROVzUT3wrs9Kw55sEzXAqeidIKQE15l0yZf3xJhps6hjDV23PMu4avAzlSQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2nJo/IyrJBs96t+Sqn8fMULveLev4TsZBQ6SbPIUbQ=;
 b=HJrQ9Uzw4le0r/Hs/XGi6rDJpVAEfzbzJ3yKXl+mY8xtbTfOB+mox/QYZs12Hm7V9zwqYawsvcs3AUBoTLuOAXx45QEphuoNt+aBxzu2JXZYUJxwItouMbMiRidTKsfRvPM2dh8GRTUi7WUFTCpRS5Ze08attY+HEV+MG9HxQG14WH97t+etMrLguCzLb4xBm3v55E0UuWRZVOAJnKlgeW5eN3+0WHPxhVTiLVK/UUbygVfVDjgg/bbLBGM2Z3+YQA5tg3crgXZdTaRow1D6leL949f1z0ZEMzvRu911cZmXpLckgs2kufMITFY5bs0eUpFiyHoL/3yfltuYsTFYAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS5PPF5C5D42165.namprd12.prod.outlook.com (2603:10b6:f:fc00::64f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 17:58:43 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 17:58:43 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 07/14] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
Date: Wed, 21 Jan 2026 12:58:36 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <B752281D-4A31-4E2D-945B-FD18016B722E@nvidia.com>
In-Reply-To: <20260121162253.2216580-8-kas@kernel.org>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-8-kas@kernel.org>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS5PPF5C5D42165:EE_
X-MS-Office365-Filtering-Correlation-Id: f0157925-7b1e-4910-83cb-08de5916b6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vzMYEIZNuRGrCK3JgUt48hCNyM2axq0L3Wm7Il82kt31Cz0aLZHvIkZ/UTCK?=
 =?us-ascii?Q?UUulaBbH19GVuAb/e5A/9x2I9jgE7JiRobzRdHuhpj5JbUsUDETIpj3sRD/O?=
 =?us-ascii?Q?hMTAnL4h0M7uSsE9Z92rF2jtW6FU79OYxs+TUP0tJV+bsxB9PT34gauvKKQf?=
 =?us-ascii?Q?LMaR/6+jFxLFsSVjA8LdifegMyMquBpNzfbeuJXfmzCvE8d7sq0KcVsoS2MD?=
 =?us-ascii?Q?aXDvIi8vRmg2473pqRiadRo+P5YGQ8OJyhxUwGfTkUeO0dcx7oWxG4tHfKW+?=
 =?us-ascii?Q?AdB8vQ80SVYIY0wrsd6P2pTFSBV0TOE7RZVpKrOLd6Z9JJ3JX7UdTEqS9l5/?=
 =?us-ascii?Q?7L6pd6+K+U74Spvx18AWM6xj4xMpMaVG3fwECrFkThRheOZC+QKtr0EBrEOS?=
 =?us-ascii?Q?41MXYpeF5vzEBxTqN8ExqsREOawM7T3AMy5vXxFmg4eLbi0+cgmER/r1FWZ1?=
 =?us-ascii?Q?mkHZzLsrPljLQUgpOGE9DUlnjVdhlHVNU28yMDRnaqhIUZpG6LL2I37B4rC1?=
 =?us-ascii?Q?E0NdKgY+3CdYAz0SH+6kBMhTdUu/w61u7rmdo839dz+Jki/DkEOFQWOhPcIp?=
 =?us-ascii?Q?vB4QZdRHO2tUIH1VK8oVLaNUMBs8o8NmBqhXNEzRwOmv4k+rEcz4g5w8yFq9?=
 =?us-ascii?Q?3+UGyaGViBAvpG5xlIhYX+NEwKNvXNIVN5PsFMzW9En5euQd0o5w0lirE4dq?=
 =?us-ascii?Q?d6WNmOQ4kEPjrl1G9VrxeCnsqvGmM28LxnxFYIiGd8Wv81XSATg1cj8cVap9?=
 =?us-ascii?Q?OtDW9xi/Gcd+plpon2GiYuXQ9FWYaq7HTkBy2qmxFYpK6f/MWa7y3Su0qOtB?=
 =?us-ascii?Q?W9V9/NURIx26WeW/vZILeQXVC2mg3TYvD+UHMLwEwGGkD79yT2Ms1IgcDB+w?=
 =?us-ascii?Q?++mH+wtG+5MYuHFRXXkZfCAHE13KDO0KX1lrMQhZOhsNhYFtRDKraULVLNDq?=
 =?us-ascii?Q?Y++u2ur4tbnZqscphBbww3G4EoYzu+fisoDL+w8U3JuJFlqQYavfwkh8L4Hg?=
 =?us-ascii?Q?DZ3CRuvv7vrTcjd7NU88ZZe7GDwTgTPPBA5ejT3TFX5ojJk1v2ei+NfuxaBj?=
 =?us-ascii?Q?uVT0gfNKuBmusmk+2GpxWoMUER962xSCsJjoFsasTlOM/k2EBuqA1PnIaCvW?=
 =?us-ascii?Q?NJOyx/1iggclNeJMrv3+W5t1jMukwCaXqkfXkMsGmP9N8nxlTURphtol/zQu?=
 =?us-ascii?Q?hO9VhkirtRaaAl9B5hOa2Mim3NF10r0EYZDtpuz2/XeKaMaDj8pBIcwAU668?=
 =?us-ascii?Q?8BHs5yw/0fsEkf+LBPaRegODTm9qVK+qxu+i5ls5Oln1xLc0ui5Ve4rXubHe?=
 =?us-ascii?Q?oUgnejgBEq6W7whLcbttiRdbYxooNmhTSTi+qIx7d5KHgo4j+X55aoqqRA9F?=
 =?us-ascii?Q?xQg4RI0Ywywmt48GO2cAHIlSjbfiRhXIRf6u5u5iUvN1p6wQmcl4OtryiJ6U?=
 =?us-ascii?Q?Mx2j8eTJxLJlU2rdV+Xvc3XRd8kKUVQayGfzqw1zu38NdpIGrw7OrNQHHPBA?=
 =?us-ascii?Q?WC2lg2I9pJ9yng+MVbsc5Osl4bMIzHJL1slni/NJAyp1dS7q5dWf2mfuxw75?=
 =?us-ascii?Q?eQDfRB4yOiyenO32xqw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Ntro48KmNf1jFC+BqttgsOl/4jKqPMiBFUpBaRpMXsthbasXtojXj1USp7e?=
 =?us-ascii?Q?gzkA6duBu0/Ne9GdrWzxyJf72pCxdjByiNXxeG0FS4dQr0JHM5adtwcH3eTV?=
 =?us-ascii?Q?siz1aQybCo63yEghOq9y1SYV1GSM/neHzkTyU9f9XRB6ifmH0AhheqVSH72y?=
 =?us-ascii?Q?ysRem7Xcmbz3HcIisu3aY/kR/9+tXfyxI4bsMBSr8djyGz10TiNMR9auphRT?=
 =?us-ascii?Q?j8UgVNSdXwpJ/DV1KayYFBJCDatQHEf12eu1mdEVSO1NozwAGKVMEgbMAPdO?=
 =?us-ascii?Q?LMw07BhI2zG1opUQD3LUwI3xcLzE3rihVJ+/aruVNy9W/OkOr6zVo1hOxeA9?=
 =?us-ascii?Q?F2QJggUoXCJ2LMQt9sFt3M1GoJK9LSZr8YooGnNmwPjD6f8+GNMZI0LY65kt?=
 =?us-ascii?Q?UnPsxyePKzBE88z+ExlTMCdnhlnoPggBF80M08XsAhcWIQYiUs+LJNTIqme1?=
 =?us-ascii?Q?fWAV2F49BQBJQb/2lL2avELVEQKkAJB8c1MkhBkCdK+hxRrOQMPJnxmDTAnK?=
 =?us-ascii?Q?vtmTCMAAb2oenHt/1qiWvHhwxaiCi94qoDreg7NdYC0HanZAmtJXM1WeEEJY?=
 =?us-ascii?Q?9+OEMDi9ZAyBkT8vACGmKrcUj2hV43MU/J4RusjxV0EPuqLm/8Amo/C7BTaz?=
 =?us-ascii?Q?nUGVS6/nBaa9iaoV8K9F4w6PEV9aJewpcfVMXMn88o33dEcwlNsmfvQsLvZf?=
 =?us-ascii?Q?01itQqampelYt0MxnA39LgLIv/YCJc+nC++KspteSJdZHDYf6bdmLTs7CbPQ?=
 =?us-ascii?Q?ajHPQHLTBnNB3/wBDslEqjBqGy8Jx4AVFwv3DhsXUWSRtDT9dmX+pkDv/hgu?=
 =?us-ascii?Q?9S1tlnrN6/vY1oOuIBzpdVhvjAqgYHPgsrpKxipFmNuj8bYh/smIZmUpB6Rv?=
 =?us-ascii?Q?YHNCQOD8WuYot7DVHclnG5c8zOTAOu2gGe9+pUoXbdUssorMIddUHHEQWFGi?=
 =?us-ascii?Q?oKLeMpRJh5ufRfAwJNXKs4EPmCz4Y8tq8oqtXlzRiiTzI4I5AkYp6KIG3MYG?=
 =?us-ascii?Q?y+s0H8VSeecaZXDpx40rk4MY5ID2vdzIFY0ME+DCfhLcZ6Mztm1IkvR74qIC?=
 =?us-ascii?Q?5lzYzqJutEign/g9vu1TfJFNKB7AFwB6ARYLZZFH67K4mfd1gIEI4tZpfoO2?=
 =?us-ascii?Q?drUkMceWefEaD4QpDA9G2sGsVibfP6WhNCxNcfIeYQRgmrqxARBye3QHUs+6?=
 =?us-ascii?Q?3pZaf2aLWkGsn6AmWbEDq2y+PW3FewS2KKur+l+UspvRxV7peWVohu0DBm2C?=
 =?us-ascii?Q?525mENULJ8AYpLABH0/mbN/hVYDYFk0V7zHyIECzHIqLGN/Mata2r9kOx4Cj?=
 =?us-ascii?Q?iUybiGjtfDqKpA//SreDdNvccA69XJfqs6j91I7Nj7yGLSvpXr6qp8oaE5QB?=
 =?us-ascii?Q?jdhjZ79Q8J1F5HK+aInJ6b6TRbxZoRYwy/hr/wTiZ8CkanwfZlEZTa6Cv+QU?=
 =?us-ascii?Q?1gD98ESqQqWHR9DHMVFHV8GmL30+lFf+OPqatqe9/1d2PRDZBnqcO6ZUqTHH?=
 =?us-ascii?Q?oyS7GpCYCwUIXJqZz1RwDXYQhW/pXhnPYAIX8ZNRGRAYur/lFS0qOEL32D6W?=
 =?us-ascii?Q?867KYXKI0AT4ynV/x0hUfohxY7mOXUuSof+xQlZ3RTeqx9wL0kalbvrKQXps?=
 =?us-ascii?Q?09uiq8vxHYuO/htTJiFF9UMZr1hW7dTnA5bbAO5fPcZpS7QLfvYlbILe9eNO?=
 =?us-ascii?Q?zuke5K5Qnhe1QVt4dGh+HP+IC5Twp3mnu+9IowzT69ipckhw5gbiZ62VPO/Z?=
 =?us-ascii?Q?01JPDhNpOA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0157925-7b1e-4910-83cb-08de5916b6e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:58:42.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKiqkKri6+e+s1gg1eD4BV1mX4R2woVi98qO1HiElqItPusfGxWlkuUDj+1OiQlz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5C5D42165

On 21 Jan 2026, at 11:22, Kiryl Shutsemau wrote:

> If page->compound_info encodes a mask, it is expected that memmap to be
> naturally aligned to the maximum folio size.
>
> Add a warning if it is not.
>
> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> kernel is still likely to be functional if this strict check fails.
>
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>  include/linux/mmzone.h | 1 +
>  mm/sparse.c            | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 390ce11b3765..7e4f69b9d760 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -91,6 +91,7 @@
>  #endif
>
>  #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
> +#define MAX_FOLIO_SIZE		(PAGE_SIZE << MAX_FOLIO_ORDER)
>
>  enum migratetype {
>  	MIGRATE_UNMOVABLE,
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 17c50a6415c2..5f41a3edcc24 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -600,6 +600,11 @@ void __init sparse_init(void)
>  	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
>  	memblocks_present();
>
> +	if (compound_info_has_mask()) {
> +		WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
> +				    MAX_FOLIO_SIZE / sizeof(struct page)));
> +	}
> +

16GB is only possible in arm64 with 64KB base page. Would it be overkill
to align vmemmap to it unconditionally? Or how likely will this cause
false positive warning?

>  	pnum_begin = first_present_section_nr();
>  	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
>

Anyway,

Acked-by: Zi Yan <ziy@nvidia.com>


Best Regards,
Yan, Zi
