Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1026C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  5 May 2022 00:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiEEAnd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 May 2022 20:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiEEAnc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 20:43:32 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69F613F6F
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 17:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhmK7EHwm5hf+cZzDmRwPdDh3qu5Q3Kij8+rSi6FfHbCiYrrzPZ726InvVA/6Ff27QF9BLGfT6jAhDhR4OUdCZGIMVD/FqY9a7sfLawT1G1iUwg66hJpfRbqUWdA7vduH/z+SsZHke3aUaEC0gNATt/fsw7aniGrlRfmCCrWq3RjyJg7lEDWvoUVoG/3SdNVsL4xp0iUjaaYttwLXWFiA7QYU/2WDODykEvrLDDqdNxKd+0R0c0gvGodbG3g8OKkPqWJuxLDvaF9CF8+k2wN/4He97YIHUgUGC/21Ge100b8mgd1ddmdG7UUY0YezlK2nPpw9FRvk+xKectPusCqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDKUujhU7MkTZ3ey7RziWqJg/mr/5K2ARz1If/q9jRA=;
 b=IIrvMyV5p8j/Ju+1aVVGbX4p4iZ133tHX0tdPK+4W4jiRcLK2GAakoRDD0QXRfK8QUxzjCsI5KnXND7TSFKCHB2NPZQOZ7oLQOiKykjqccl9nOIWtblee7iOt0trc4BdRnxiW77Y2t+iAgd9FAwK1/BYxOJl/YTlNR7nCwsQfqzSRWHEX9bT9PDrc/ENf3we49Y8OMWQqWc5SyraNkadAZ4TVXl2TXFJbja1s3h/H+jxSa6Flski90zVdRVcwtBpQh0vL8baDyDRHgEvTDHn3ckftEWNs7AyVCNJi6MhfGVT64PboSfyDSv7GGQhyq4u94D+Iylz///h81/3fR1OCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDKUujhU7MkTZ3ey7RziWqJg/mr/5K2ARz1If/q9jRA=;
 b=KZyUirKodMy+MUCs19g+oJWfaxU1MNKyVaWTT+wjK8bZxwqRSnuLidNP3d2GTroedRwb1Lqj1VP+RCooscCViJg06PeJ5P34ghL7a2LfRUXD6+mx/+V4wAh3F12VSO8JldmwWnThku3HSXwg498X59vZ/Lyj9QehC/3sw/kBmPBdUIGDlfHh8fVDWMkG7tSeByj2NGX86HcHZueu82Wpvb9fgM3fCAsNCJPYbhAmm2QjiBXdteWg3hOpzNALxAeG/kc8UVJqG8MjHiwgs3tzKqDVmsKUVCya4HOHYh59QU1AvKeE6F+Zjf6Y9vDavl5TGsDFY9D+veANAxvXz05MWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BN6PR12MB1809.namprd12.prod.outlook.com (2603:10b6:404:106::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 00:39:53 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::15e3:d746:57e8:4de0]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::15e3:d746:57e8:4de0%6]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 00:39:53 +0000
Message-ID: <cb8065ae-b85f-769a-508d-ca874676bc98@nvidia.com>
Date:   Wed, 4 May 2022 17:39:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20220503063032.3680308-1-willy@infradead.org>
 <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
 <YnLiKnVdBFYLtCJe@casper.infradead.org>
From:   John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <YnLiKnVdBFYLtCJe@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::39) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf4106f5-e286-4e38-b664-08da2e2fc4eb
X-MS-TrafficTypeDiagnostic: BN6PR12MB1809:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB18093136E983A90578C828BFA8C29@BN6PR12MB1809.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vjaHbUbFpiUzIbUkm+LDPoVz0+vzD4JSQBaZdpQdUSbRiVpw+KbCwbLufJpSCtBrym7Th9ulxDd7LTl7mYKg2JhAmGwweN62cl/woBqRwExicHTHZTXQPiAAQ9BTSR1YveQ9rE6gasapNC2VyTw52ypRzW1Vrwsd1c86/lC1PJ/0zb8AmhrdfTA/pcEpESdFZKWi35++XNE1H8IWn3iQGZPxH4YUYxEwkbck1XBPsFvrAddgJDeMcaM1zeQrXBcbOiISzzpiyhkYg4b7PSCpH6blY2jUcDlV8fKY9CYmBTXYamVRotaGgsxU+SdK2aubZTFpgT3XTARaMTWHPGpn32xnB3rs2Fgd+k8iSMmgc1gcVe9p+ZNZhP1HQsBOb15pVdsOT9AkIfwc4WE6kQufQ8v4Zbz1aGdRz/roadutUhru/mJr1kLDhUl23fetLIKRqu8hsGOkudoJlLLjpdVfXSFusNY65HGXmBZsDGUU3VEno0D9GbejZCM5yoPJ+TrUBmCSc88v2CfdvZGuaSAFwtJRzBgxPaDfHDYZGhn85fa7vfgeQ6CGxNAPtUYEWKFT7bzR171m4aX0sEAHsNJqZi8YyzhMBG6dMMhuojFypXhXhq+w+3U8f+queUT0/hFM962ToV+9L9uulrhMEc4ZQi+zXN6hIqD0UchdCr+cCXcgLCT3S6P8bXZv6fF4lFKkEvvXab9gapkkkpJp+TQvo1Ql3xHX8h6lQUBktKjY8zOE8vbEDF9bfF5oUtSNllwa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(316002)(31686004)(83380400001)(66476007)(66556008)(8676002)(4326008)(6916009)(38100700002)(36756003)(6506007)(2906002)(31696002)(53546011)(5660300002)(6486002)(8936002)(508600001)(186003)(2616005)(26005)(86362001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3g2T1NrVzFrb3ZBVkVoYjNWU1kzUFpWeDZVWmc2Z2pKZ2ZpdmFQNjJGSjc1?=
 =?utf-8?B?aEZDQmxUR0FadzVhUEpPajlneld5NlhWY3ZJNkF5Z3J4YzlYR25lYTlLWW9w?=
 =?utf-8?B?ZUVQUDlZeHNZU3pheEsxUFNCK0JCeEYwbXNoTHoveitwUEh6Y3dZTUZMclVt?=
 =?utf-8?B?QStENjdLWGJxZXgySzBIa3FhdmoyZk9uN3lVNmxjYmgxZFp2c3YrTlU5VW16?=
 =?utf-8?B?b0Iya3ZMRVdFRkZsUU9lOTJFMTlPOU51ZHlJNHpzR0pXVGQyT05MZ09UYVJo?=
 =?utf-8?B?OEx4dzJkd2p2OFpWR083UFMyMkgyWEROTU5ranNvdVdDeXV1eDJoU0g2UHhX?=
 =?utf-8?B?L05lQ0JRSzRVNHh6UzdybkR6Q0piNWttMU81ekRlQlVVVHlTa3FZV3ZrZVhs?=
 =?utf-8?B?RUZWdHRzUXRFWnh5dWZ2ZWhmYkNEWWk0T0prUWw2djFreVRHSHpmcHd1TzZ2?=
 =?utf-8?B?MjRUd1pOaEw3Sjd4Uk1iajI3YnZNdklPVjliSkVESFJhRlJsTmtYWHRrOGtk?=
 =?utf-8?B?NHUxYnYzdjhNUDZVQllQN05remM1SjZIak4rQk1YYU1UeHNPQmk2OTlvTjM4?=
 =?utf-8?B?WEcvdjVtQVFNZU1wVmkzZDlHOW5DdGFBUWc2MzREZnZFdFRvd3BhVmhCOXVZ?=
 =?utf-8?B?aW1XbTNuYSs0WFVybmNEbjNPdHBrcDFHNFhjc2Q2Y21uOWpDeEEvTFBqY0FJ?=
 =?utf-8?B?TFpzYmN4b2tlQWQ4ZlpYQmtHNEFRbWtIT2tsMEZocXdxRmFJa2QybWRjeUJH?=
 =?utf-8?B?U2t4bnZPaEp1OVNlR01rdDJZenVaVUhPTHZtWW4wWTV5OWlqbzg1WUFybkRn?=
 =?utf-8?B?N2tLTnZVUTZFMTd3ZVczNzhYS1g1M0RDRVdJZmhvMTF4ZitUc3lMRFc4a0Zp?=
 =?utf-8?B?cnBsY1loSk1mUEVrL21aU2gybmkzamZRa3BPT2x3WXN1dHp4VWlLY0J0UGZ6?=
 =?utf-8?B?a0NLQzBjMGk4bU1rZi8wRTdianBqRldpTjYyVEdwOExneXRDS0JFZHRnY2pl?=
 =?utf-8?B?RGt2WHdJdm51Uk15dTFwcXRKK1lOTFIyUGJhMDZzUGo2QXNCelFDSEFMT0Jh?=
 =?utf-8?B?b0tCUVFRVG1CNjhlMjhHRW5XM25zbi93UmFJNmkwemhsa3hNVUYxdVU4N3g0?=
 =?utf-8?B?dTMzMm9Nc21KWlYxRHplMlhibzZ1a2hZd2hjZTF4U1RGTkJoMzlBbXFGU0g3?=
 =?utf-8?B?dWk4RmRRaDB3SW5pM0lONDhqSWV5RGJaWndMVlo0NFg3Tm5sekpxMVNrakNW?=
 =?utf-8?B?U2t0MFhFeFpFZ3lmYWVkSFU5dGl2VVNweGo4U2l5UTNRNTJ5ZjRQSlBYenhx?=
 =?utf-8?B?RHVmRG5QYXBpMWpndHRkVVR4OEl3UW9vQUpaRUppNkZjeEtzeXlSUGVubjE1?=
 =?utf-8?B?bXNHcVJ3MTAvRkcwb21UcnNCb01SVkUzMGcwNXA4eTY2d2xFeERJMVNzQTdk?=
 =?utf-8?B?VUxmMmpLbVZtcjZJTVVLbnk2RGYxL0RrNXRCUUUxOThmcFJDWk1TakdXNVo1?=
 =?utf-8?B?c1ZkUFhOaHpReldFSFNpbHo3WCtxOFRaZnYrVlJHL0tBRm41enU4a2Z1RUlY?=
 =?utf-8?B?cmhJZk1nY2dSWkF4YU5Mc3A0RytnYTV6WTVBRnVNM1ZRbnBIVE5rWXZoL0Jo?=
 =?utf-8?B?cE9aMzArb0xuMEpjNlFmak1QWjN0Q2JLbHFDOW1PMk9MS1FPc2pwYlgwS1dY?=
 =?utf-8?B?OE1WWTlDVytUYzU1bUNsdExvYzJ4c2x6OWwzZUc0RDBOVjdoc1VFWW85WERO?=
 =?utf-8?B?VWxrL3V4cDJTYnYxZmZySHEzRFlLTEMvV1pXYXljYUhqb1pEMFQ2aDl1L2pi?=
 =?utf-8?B?ekJZRmdlMVQrSGRmS0J6Sk1RUnp1OGZnRGtsc3Exekd6MDkvdmJxWTBPb1Vl?=
 =?utf-8?B?Q3FwcFQ3Ymhodm0wOXBhdlpjREZQeXd1NSswbkc1WnpDSldNbUtESENKamIr?=
 =?utf-8?B?bWw4d2t0S1UvK2NjMU45cmgwYmZ0N0Q4N3RpTDVLM1BtcWhHZ3VIWkdSVkpE?=
 =?utf-8?B?QmNqbFN4RXAvZFZmZURSTTM2Y1F5b2JNMWNQTFJyZzR3eEZycU9jV3QvbHV5?=
 =?utf-8?B?c1MxbVAxcnlGY2ZzcHJwSjNtaTRpWFRZbmpzQlkybURoOGV2Nk12MkdFVTg2?=
 =?utf-8?B?aVJjUWY3Z0lLMy9COFJBd3YzTXZkSW5waWxVWi8vME5pVVFaK3NYV3NYalpr?=
 =?utf-8?B?QVBKZFc0Tk1vbWxUaFBPemNhZEdmRHcrN1EwV0psaWF6Z1NmZkM5MmFmWE0x?=
 =?utf-8?B?TEQ1ZkRzUlBpU1l1NEpWSUhDNkwxOTlJaVlwS3ZwczFuNlBEeitFRmVUU0c5?=
 =?utf-8?B?SVFtUmlYTDlQekV0R0lnUVBxcHpxYUV3QW1tUFpkcVZWQm5palovdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4106f5-e286-4e38-b664-08da2e2fc4eb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 00:39:53.0656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTKThTkYoo+XDjKZK5vdhLHG1bSMMr5ElaCxkiicPIyBj3iXca6TYRheUOSx3riOETLcjAeKY6ZcRhnGfk6IEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1809
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/4/22 1:29 PM, Matthew Wilcox wrote:
> On Wed, May 04, 2022 at 06:12:09AM -0700, John Hubbard wrote:
>> This needs to be properly merged with the existing index. Otherwise
>> the result here is very confusing because there are two summaries
>> and no explanation of what is going on here.
>>
>> If I get a moment today, I'll take a quick shot at at merging them,
>> and post some suggestions here, but just wanted to point that out
>> before this goes in as-is.
> 
> John and I have chatted to understand what he was getting at here,
> but haven't had a chance to review this change in-person yet.
> 
> +++ b/Documentation/vm/index.rst
> @@ -2,6 +2,9 @@
>   Linux Memory Management Documentation
>   =====================================
> 
> +Memory Management Guide
> +=======================
> +
>   This is a guide to understanding the memory management subsystem
>   of Linux.  If you are looking for advice on simply allocating memory,
>   see the :ref:`memory_allocation`.  For controlling and tuning guides,
> @@ -24,10 +27,14 @@ see the :doc:`admin guide <../admin-guide/mm/index>`.
>      shmfs
>      oom
>   
> -This is a collection of documents about the Linux memory management (mm)
> -subsystem internals with different level of details ranging from notes and
> -mailing list responses for elaborating descriptions of data structures and
> -algorithms.
> +Legacy Documentation
> +====================
> +
> +This is a collection of older documents about the Linux memory management
> +(mm) subsystem internals with different level of details ranging from
> +notes and mailing list responses for elaborating descriptions of data
> +structures and algorithms.  It should all be integrated nicely into the
> +above structured documentation, or deleted if it has served its purpose.
>   
>   .. toctree::
>      :maxdepth: 1
> 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,

-- 
John Hubbard
NVIDIA
