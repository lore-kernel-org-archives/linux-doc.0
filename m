Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A266DC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  4 May 2022 13:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238761AbiEDNQA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 May 2022 09:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbiEDNQA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 09:16:00 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EAF1DA79
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 06:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2DwM7fpVvraHj/qEIS+Ekx2I5nW69JMF6B04kkvzHgmHcmS27g5FA8YbR218pp+RIvQ0IrXq3NnfyNlnKk3dbdlqkgcA8C+lusjamIb79bXaa6G7c8PbEmItI7KjxwKaA3gonpCOTdcmuPhSDXIZ11YE5d/qFDRwUY4PNkZhB0UCu6HJ7DFDPZOPyiG3TN0k47zBOMpgIioBT13M6TIKb9/pt2GWsPm+YXm+0PsxytqRT2RvuuV1FuyLr1Ls991rB9HwhFiKnUVEEUpKo+3AdYVJNT3oN3orWcNW1b+0/acQp8cNDRfh3ujluGaAr0UZ9CFCmf2MOHb3EM8/YNjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BttB9UIaO/U8SYFoy0Cw1BuN5FQVSYMDlASE7S/DWlc=;
 b=MpvpNCdOxFFTf7+Ui4QT6DfBGimV1R38dGCxhO/Ff1VCWDkEAU2AoHenlvw1qwxR6OwyGGpXV0VdG9pTQteokYN+pBp2+MPVWo0PR9JAE3cFfvJFBW2TErnzAEdyd+GfT+Ub/vgBX9uxAmYgt4u1P115Md4T2vd1BeZimJRO1tjaIstsHFDINBLiX06a0A3u9TIo44pe1wDhc8DrxAYBBSwjVFMfNALH63N8w5MqMY3iFK9oQIonu2BA+Fs9j87gGyEE6ZSXXVTtrbGOGAE+qUC8Pvn9Wl82XC6TV0O291MTHND55Semg/fWJ/NaHBcUvy1aEgm2J9f0WygcSfrGig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BttB9UIaO/U8SYFoy0Cw1BuN5FQVSYMDlASE7S/DWlc=;
 b=CyCLfX93ty60rr+Z51l+mYrLYpbAzQcoSUK6Ux0HXmZ3h3t4qBFaxFRhtoO71qzXQ8MK8X1M7QxqFYPSEQ8ZcuJF/C8AYvsERPwiF4kpceXLaGIcwqvEPykeQ9xGwSwczw8Z5ZBRjOOq32zq6XnBeptD6TxeZD9UGk7B6fNRJqNzC2sNKmVAYgUXC1WcXlL7X8x1TogAfL/qi+GgQfu9PYuTuuIL27RWKn0VhnlwPc6S7ichaSesv/uLInnztXvXcojeqF9H0SjojUzYjytDYDN52BCUmxemYG0GpMNSgeEndaKbcjzMTT/SKjdzsyC0TLpKu7xoaoiAURAbExlg7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BL0PR12MB2436.namprd12.prod.outlook.com (2603:10b6:207:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 13:12:22 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::15e3:d746:57e8:4de0]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::15e3:d746:57e8:4de0%6]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 13:12:22 +0000
Message-ID: <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
Date:   Wed, 4 May 2022 06:12:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Content-Language: en-US
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20220503063032.3680308-1-willy@infradead.org>
From:   John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20220503063032.3680308-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0010.prod.exchangelabs.com (2603:10b6:805:b6::23)
 To BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cad1152b-e6d6-4120-6861-08da2dcfb96a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2436:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB24361EBD5AABB9E777E7E57BA8C39@BL0PR12MB2436.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opc013tzWFFtwdpdJTyNp4kGvkv7vW7FmOFSZS1Rozzpwe1p+cU8nERPDnn1nte9vbyNNMW3HqlkeD8LjDAoMn2A8B1oVPmgkdxsg65etF1mCFmlmxG7MBsaGy7A/jJoE+5ThYuEAoSn/wKLwn7XxNfU49fvRUCk6ZntKzmbBdc756cGtLI0gRb0XfZtyVtvYCo5Y/s15bANyHJKxDTf+6DX1Qm0YOMU+YChoEmApbZzg3izqRj2VUO+r5JcqDj47xNQBhVzQMW28PDKoogFh4AK7948pyXI5l9pFGffm5BfSGl9dYuBkxESpCNGqf3w6XYZflLpj6Ox+6PyODA755UdOae8eVirNhp7Pj8GFuysc9AAxPqdnAXE0CSpHWBqgxaNtwMoKaZNySpV+/9/UWfhlmK/6u/M2YWEyxfjHMxbVHLOz8yvwppYOAnib4GU0a5cpjhpkRC8bNdS4/hkY43/OYUoeqQsiyO0/9Rnty7FW3z7rEuPjWKs9pwyxY+h8AxLPp9CEPNWRLrlrZa4Dot1Hlpe2XF+wLtR1G5eSiQvX9YNw+pqVNdLeT/YpThMzt2IjwktVyGImK4R3RG630ejgyQW02kpuNG3/1xWoFOmmsAfEiPzit4i9lOrujG2bE7D5YL0AKD+m3PSBIsZPO2KbHJfNo0i8XrA/XMfxmluhSrzCsLknMRqDhyfzd7TPrZCpnUqiZxEaWiHYWQnXlRAizOeIE5E7BDX682uP3VLbjq+sSezPgzJ0wHKAcfX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(316002)(36756003)(26005)(508600001)(6486002)(83380400001)(86362001)(2906002)(8676002)(8936002)(38100700002)(5660300002)(6506007)(31696002)(6512007)(53546011)(2616005)(6666004)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVBVRHpVTmh3V25pL29LaDBGMmZwV25MOGluWE43K3kydExjbHhHUUkzZlky?=
 =?utf-8?B?c0l2aUFJbVJEYlg3SklMLytPQ2lUYzNQQTVuTnYyYnFDV1ZUL1hNWTI3ZVBT?=
 =?utf-8?B?TFdOSWtOa2NMbHFwbTE2bGRrODNKa2I3QyttRWJuL1grSmtFaEVIdDllU1pR?=
 =?utf-8?B?b2JEODhOdjdjK21nS05jdkh0V3cyM0dIK2VhT216TUNoRmk4SFNGVy9WRFFF?=
 =?utf-8?B?V1lIRHpPLzA2OWp1V0pvbFB2NTdOM3YyNTU3ZkNtSEZXU1EvWm1zY2JBei8y?=
 =?utf-8?B?a3ZJMHBMMExqYUNoUlM4QTZ5cGJldWJ0TjVXTGErZHZHUkhCR1VLa3lPTEVU?=
 =?utf-8?B?QTNVaEVoS2VhaVlpMkhnWlZ1R05DSEh1RFR4bTdsL25kZ3FIYmVTdWhjS0hR?=
 =?utf-8?B?UzVFOGJaNldRbXl2UmpiNlNJWEdZUTJ3Q1F6VUozTStERUxHL25uc0hFYnY2?=
 =?utf-8?B?RHVxekxvdTB0MklzV0x5cGJEMFRaeFlZQ0tYRytCQktsTTdlbm9VbXJORlJI?=
 =?utf-8?B?dzUweXlUaFZIR2ZSaGZKRUNKY2NJbnAvbjZ4dkcxQnBHamVYK3RQQnNQQ3RP?=
 =?utf-8?B?WEgyRjNkblRkdGJ6VTM4eVN5NXBxYkx0dytBdjhJK09lNGZGaHNzS0Mrcm5t?=
 =?utf-8?B?YVZ5MHk0Mkd6bEt1YWREN0FBUG8zWGRvdHRWWUlhWWg0QktYck12THdqSytG?=
 =?utf-8?B?bUF5cW1Oek9IWVpEd0xObnNjRWFwMVZrY0d6NXQ2S0I4VTJ5WkF0VFhzaWdP?=
 =?utf-8?B?Wk9HNVEzV2pvSDd5MENMbWdpMXVSdzNUbzFBMVlrYmNXSW5KeU0yVjZaY3FD?=
 =?utf-8?B?bXh0b1FEODJlTWNBSk5DVVVPWmdsbEFEK3A0NU5HUU9rTTFUWGl6cXhra0J1?=
 =?utf-8?B?UGkrY1JpbVAzWHlaSVZlTUhXbkExZ3crL1o5Ykg5WHpXV3BFQmljNk52TXdq?=
 =?utf-8?B?MmZtVG5zQkw1LzV2eklQMWNSNG9aZEJkZUtORWNzaVdxbFRlbnhqUzlBOE1O?=
 =?utf-8?B?Uk9pK1lMclJ0OHVUakx6L3Q1V2JIS0t3S29ORm9QbnpELzhJV3dqUnFhc2dZ?=
 =?utf-8?B?UzRnRHV0bnIyN0R4S1pqR2VBL0dxSWllQlU0R2pjWlZwTHk3T2MwZy9PWWNM?=
 =?utf-8?B?MjM0eU92OTFnb01NWERPQ3dxTWFidzRjU3paLzNWc2tkblJVa2hVM0YxVFBO?=
 =?utf-8?B?WUZNbDJ6UWQ0WVhTYnVXTHc3ak13U3BUMzNZKytLbThQOFo3VERHRFcxY2t2?=
 =?utf-8?B?emFrWHM4cWVxTGljYVFVTnVtLzA1ajlJNENXRFl6Qmp5ejl6T3hmVTUwanI2?=
 =?utf-8?B?T0ZyT080T2Q3bEpmN3YwdVZNRmRVTlFsNFZCTjFxYTMreUY0TzIvemx6VUFF?=
 =?utf-8?B?Wnl6MDlnOXVLWXlxSlhXM2JUS0VPZlJkQ1JFSmVyVEIvajBiU3kvOGs1MVdq?=
 =?utf-8?B?WE1JMTBUeWRyRnVIaWJZa2xqSWNvQWgxVXNiSGpEQkRlcWkxNm5WVFZvckw1?=
 =?utf-8?B?NEVDZ2Q3dWhQWmJpOTNKYWVHanlRQWRydlNlcFlnZ0t2OEVJTXFMeTFOcm1w?=
 =?utf-8?B?eVRYMlltbnMwaEh2SzZCY2FIbC82V3RZV0RhSDJ3OVhuY21nR0ZzU1VRR3JK?=
 =?utf-8?B?KzVkMzkzN2VCdWFDVk1sbmlPc2t3NXdDOUoyVEhwNDV1aVA1ZlNDaHAxTVV5?=
 =?utf-8?B?RzJ5d1g5NlFYYjlhRFNKMTFQK0I2MUs5eERkZzZyWUR5Zk9yRjU4K1oxR3E0?=
 =?utf-8?B?RVppVlpxU3YvNnc1NDBQYlVnVU9XYkUzMkJCTm9lRmlQWUlRQ3JaZzBldDVi?=
 =?utf-8?B?SWprM1BUTk1QYnYrTk9rWEFYWG5zb1BQcFJtUm5SOXgzaW1zMkM4OTlDLzll?=
 =?utf-8?B?L1VjM0szR3gyQlRnUkNzZzdXaWJ1TXpCM0J0UDhocGN3RkpncWRkU3FFcGtX?=
 =?utf-8?B?Tzl1RDBPcW41dDVicUVyOWR5NVlHOXMwdVVXU1JVb3lGZWFnMnV4VTVPb2ZU?=
 =?utf-8?B?UFFRVFNhekxqclBMRDNQN0JlUXRTMzNqdkllUFVzMHk2bml1MjA1MW9vLzRG?=
 =?utf-8?B?VHFSL3djTjFMNW5CZTNZTVBkVjNObXg3NGViSmdYallLQWs5c3FPNmZGUkdv?=
 =?utf-8?B?YnBTRnlUalUvaGFSWldkdDBIMWczY2Zwa0RVMGJxdUpLRHlmWUlnZm5rdUt6?=
 =?utf-8?B?ZUN4cjU2VEpndWtkUm1Sa3YwZXVZek81ZEFYYURCU3BwRk9GNjIzSzZHK0dS?=
 =?utf-8?B?dW5MTkVSQi9vSnI4OC9ibFQzbzNYUXA4RzN3Q1VEL1NzS01tOWx1YTNIZjRV?=
 =?utf-8?B?NEpWbDRYeTUxMDcvcE50cVQ2TWMwc2ZWOE5uT2FXd0NWdlZkKzBhUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad1152b-e6d6-4120-6861-08da2dcfb96a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:12:22.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQOIzZgQ8jKbthPsKfGXmyugM3Yl9hI5jioIdcubXSweDVEuGcRsCD47nirb7Gmnh3kdbm/Kds7rOMOIez7N+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2436
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/2/22 11:30 PM, Matthew Wilcox (Oracle) wrote:
> Closely following the outline of Mel Gorman's book "Understanding the
> Linux Virtual Memory Manager", add a new outline.  Preserve the current
> contents of the mm underneath the new outline so we can transition those
> documents to a more sensible place later.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   Documentation/vm/bootmem.rst         |  5 +++++
>   Documentation/vm/index.rst           | 27 +++++++++++++++++++++++----
>   Documentation/vm/oom.rst             |  5 +++++
>   Documentation/vm/page_allocation.rst |  5 +++++
>   Documentation/vm/page_cache.rst      |  5 +++++
>   Documentation/vm/page_reclaim.rst    |  5 +++++
>   Documentation/vm/page_tables.rst     |  5 +++++
>   Documentation/vm/physical_memory.rst |  5 +++++
>   Documentation/vm/process_addrs.rst   |  5 +++++
>   Documentation/vm/shmfs.rst           |  5 +++++
>   Documentation/vm/slab.rst            |  5 +++++
>   Documentation/vm/swap.rst            |  5 +++++
>   Documentation/vm/vmalloc.rst         |  5 +++++
>   13 files changed, 83 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/vm/bootmem.rst
>   create mode 100644 Documentation/vm/oom.rst
>   create mode 100644 Documentation/vm/page_allocation.rst
>   create mode 100644 Documentation/vm/page_cache.rst
>   create mode 100644 Documentation/vm/page_reclaim.rst
>   create mode 100644 Documentation/vm/page_tables.rst
>   create mode 100644 Documentation/vm/physical_memory.rst
>   create mode 100644 Documentation/vm/process_addrs.rst
>   create mode 100644 Documentation/vm/shmfs.rst
>   create mode 100644 Documentation/vm/slab.rst
>   create mode 100644 Documentation/vm/swap.rst
>   create mode 100644 Documentation/vm/vmalloc.rst
> 
> diff --git a/Documentation/vm/bootmem.rst b/Documentation/vm/bootmem.rst
> new file mode 100644
> index 000000000000..eb2b31eedfa1
> --- /dev/null
> +++ b/Documentation/vm/bootmem.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========
> +Boot Memory
> +===========
> diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
> index 44365c4574a3..bc495a846871 100644
> --- a/Documentation/vm/index.rst
> +++ b/Documentation/vm/index.rst
> @@ -2,12 +2,32 @@
>   Linux Memory Management Documentation
>   =====================================
>   
> +This is a guide to understanding the memory management subsystem
> +of Linux.  If you are looking for advice on simply allocating memory,
> +see the :ref:`memory_allocation`.  For controlling and tuning guides,
> +see the :doc:`admin guide <../admin-guide/mm/index>`.

This needs to be properly merged with the existing index. Otherwise
the result here is very confusing because there are two summaries
and no explanation of what is going on here.

If I get a moment today, I'll take a quick shot at at merging them,
and post some suggestions here, but just wanted to point that out
before this goes in as-is.


thanks,

-- 
John Hubbard
NVIDIA

> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   physical_memory
> +   page_tables
> +   process_addrs
> +   bootmem
> +   page_allocation
> +   vmalloc
> +   slab
> +   highmem
> +   page_reclaim
> +   swap
> +   page_cache
> +   shmfs
> +   oom
> +
>   This is a collection of documents about the Linux memory management (mm)
>   subsystem internals with different level of details ranging from notes and
>   mailing list responses for elaborating descriptions of data structures and
> -algorithms.  If you are looking for advice on simply allocating memory, see the
> -:ref:`memory_allocation`.  For controlling and tuning guides, see the
> -:doc:`admin guide <../admin-guide/mm/index>`.
> +algorithms.
>   
>   .. toctree::
>      :maxdepth: 1
> @@ -18,7 +38,6 @@ algorithms.  If you are looking for advice on simply allocating memory, see the
>      damon/index
>      free_page_reporting
>      frontswap
> -   highmem
>      hmm
>      hwpoison
>      hugetlbfs_reserv
> diff --git a/Documentation/vm/oom.rst b/Documentation/vm/oom.rst
> new file mode 100644
> index 000000000000..18e9e40c1ec1
> --- /dev/null
> +++ b/Documentation/vm/oom.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================
> +Out Of Memory Handling
> +======================
> diff --git a/Documentation/vm/page_allocation.rst b/Documentation/vm/page_allocation.rst
> new file mode 100644
> index 000000000000..d9b4495561f1
> --- /dev/null
> +++ b/Documentation/vm/page_allocation.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============
> +Page Allocation
> +===============
> diff --git a/Documentation/vm/page_cache.rst b/Documentation/vm/page_cache.rst
> new file mode 100644
> index 000000000000..75eba7c431b2
> --- /dev/null
> +++ b/Documentation/vm/page_cache.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==========
> +Page Cache
> +==========
> diff --git a/Documentation/vm/page_reclaim.rst b/Documentation/vm/page_reclaim.rst
> new file mode 100644
> index 000000000000..50a30b7f8ac3
> --- /dev/null
> +++ b/Documentation/vm/page_reclaim.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============
> +Page Reclaim
> +============
> diff --git a/Documentation/vm/page_tables.rst b/Documentation/vm/page_tables.rst
> new file mode 100644
> index 000000000000..96939571d7bc
> --- /dev/null
> +++ b/Documentation/vm/page_tables.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========
> +Page Tables
> +===========
> diff --git a/Documentation/vm/physical_memory.rst b/Documentation/vm/physical_memory.rst
> new file mode 100644
> index 000000000000..2ab7b8c1c863
> --- /dev/null
> +++ b/Documentation/vm/physical_memory.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============
> +Physical Memory
> +===============
> diff --git a/Documentation/vm/process_addrs.rst b/Documentation/vm/process_addrs.rst
> new file mode 100644
> index 000000000000..e8618fbc62c9
> --- /dev/null
> +++ b/Documentation/vm/process_addrs.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================
> +Process Addresses
> +=================
> diff --git a/Documentation/vm/shmfs.rst b/Documentation/vm/shmfs.rst
> new file mode 100644
> index 000000000000..8b01ebb4c30e
> --- /dev/null
> +++ b/Documentation/vm/shmfs.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================
> +Shared Memory Filesystem
> +========================
> diff --git a/Documentation/vm/slab.rst b/Documentation/vm/slab.rst
> new file mode 100644
> index 000000000000..87d5a5bb172f
> --- /dev/null
> +++ b/Documentation/vm/slab.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============
> +Slab Allocation
> +===============
> diff --git a/Documentation/vm/swap.rst b/Documentation/vm/swap.rst
> new file mode 100644
> index 000000000000..78819bd4d745
> --- /dev/null
> +++ b/Documentation/vm/swap.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====
> +Swap
> +====
> diff --git a/Documentation/vm/vmalloc.rst b/Documentation/vm/vmalloc.rst
> new file mode 100644
> index 000000000000..363fe20d6b9f
> --- /dev/null
> +++ b/Documentation/vm/vmalloc.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================
> +Virtually Contiguous Memory Allocation
> +======================================

