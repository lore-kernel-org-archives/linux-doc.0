Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA72FC433C1
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 02:51:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A052C619E1
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 02:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhCXCur (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 22:50:47 -0400
Received: from mail-eopbgr750058.outbound.protection.outlook.com ([40.107.75.58]:44691
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234956AbhCXCuk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Mar 2021 22:50:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoUAYnBXD2cQVKYrFUBgqbBV2os4ovVZSaOHbZbBat5ePYqXDZC3tpiAUp8LankC9i3IZoa5BDwEjMtKFaMYxmPR++8Swtj0DTNJ4aXNxJk6QFsjYPxX8L2NQo1kvQSbTa9saM/uVQnE1wUJUm9EDgM1hnacJTbJ58KuhH8AT4L3+sJW1KMQgxIwvo2bgOyr3seYv5zD3Phnf9r8Ls4UKO7P5bV+Cjpl0mVwoNnwK7y+Gmq+zof+J8T0+yOEyePJKJCE6uyEj/YUBaE4y7lP5g3ZD+548HwjiaEalQIGE3MkX+Ar7AYi26ORuBdMikXJGs/5ST7UUVZdHkNO7H9TMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iUSCOqij1JF8xUtxpJupRtRa/b2X91QPYpEWCHtDmQ=;
 b=K6HXvRXFOnrzud+9jygVhTWADU8pN3eAWio9RlKVsytXC/ETd8z9L5fUA2kYzF7A1rbIBnHpTI3zV7eBGuGtihxF0lGKrWAAmQCLHiZ++OeYPtu5Ts2iNQiciA5+v5nTV83gI/FFtgh/KhVYslfyQfVXL/bvf4A2X+hQ5Vn4SzNMkHfRF6dyKjrjliR2RnBXbnHWxQXQeG7RggoCDH/WLnATBOki+uJThlQ6+LdCe32zpif5q/lzeCzarpJgb/7mcJPQtpyDnoWjBP25tO0oFCo1qs12qDZacEgo53eAdR5HFgDBLqUF78nSQe+y8wSy8J5LB5bmqimRZehuakimvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kvack.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iUSCOqij1JF8xUtxpJupRtRa/b2X91QPYpEWCHtDmQ=;
 b=gK3zdBk/YcTV3d97wMX3QX6n7N+twqlG97pjJSNpwoDrdckD3Qxq7/+36P/vJShabDSqSvAPdlstQrcCm5PPWb9svh/B9L7QPZNTrz3Xyt3McM80X1TYqHLvG0uSP3s17he4hyVwxJPf9emDtbYwmWZlWfAhmypA/KgIwTuNhQdkJe3NrM9ylOc97b9oQKM4F3A44AV3IO17RxqW68Jr5ORMRQqsGlDqjQlX/cnMbiOgcf220YzUM4wlD1JMJl2XS8hyWFKK/HcXhGGBVx2iYbgzgrNCSyWk8PswsoO6kgt94xEnqLODgrbr5a2Zi2ZUBoHi6Ry0yjvsAMW/gcXnAw==
Received: from BN8PR04CA0032.namprd04.prod.outlook.com (2603:10b6:408:70::45)
 by DM5PR12MB1161.namprd12.prod.outlook.com (2603:10b6:3:73::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 02:50:39 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::b) by BN8PR04CA0032.outlook.office365.com
 (2603:10b6:408:70::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 24 Mar 2021 02:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 24 Mar 2021 02:50:38 +0000
Received: from [10.2.88.242] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 24 Mar
 2021 02:50:38 +0000
Subject: Re: [PATCH 2/4] mm/doc: Fix page_maybe_dma_pinned kerneldoc
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>
References: <20210322195022.2143603-1-willy@infradead.org>
 <20210322195022.2143603-2-willy@infradead.org>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <7c05f837-9703-001f-47d1-d07c0c700cd6@nvidia.com>
Date:   Tue, 23 Mar 2021 19:50:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322195022.2143603-2-willy@infradead.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14e87ea3-3a76-49ed-370f-08d8ee6f9b66
X-MS-TrafficTypeDiagnostic: DM5PR12MB1161:
X-Microsoft-Antispam-PRVS: <DM5PR12MB11619DE812DBE4E5577F2F1CA8639@DM5PR12MB1161.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: itnx+r7mMH4gQc9/1uu9WeFY6McBWZiWT1PzpTYC4UN6+tM3kEFPX9aav0pz7cvauYnrUWliWydIddZ23aajXQggUiLaLvoa8rxNY1Pvc+Oga8+AToSTmWwVulNigkyluzWHgYcjml4q2td2wWqgQwzMaHWRV6K5UfM0hbdosdHY7LwDIN0OJChURuqjGPeyQLem3IQtpv/kYSE43AWzkPm9kdAO7+Frn8he1PPccDVf8/fLz6xYMSnTUphuiLdbtq+kAj/R+rJWryRMVFmIwgH45FO/xztwbrX7s8+UzBsxykkLQLCPPwca6akjopk6DHmd+OG0JTnnordJOvjUToU6N/qvmEmHa8EVP5dQQfUpxcZw+IMxFWhbw1zw6tQWTHWca+lwDA3Pv2ZRpO1j0Mex24CSVhDkfZolRTwjwxYoEJtiI491ddM9pqSA2Oyn0qE+jHMa3m4lEmJmZDOoaT5P3xQQM5Aq2pFr1C8tz3svKJ14wMzhbPPm8MWlB/M2eZsUHOTS17K5pQOVHC/lfyhn18ZS4UCLkqRxENbQQZvdZFBF1vNgSwGCkxLmAVj70XXvXah6dTkbTtNm9P8EPnAgpq6KoXvAOctGDZbFzzJ7KOVusYfJbe/jCjnZnY0yQKkG2owIcqNQRYhjCsn2pL9trtO4GI2jkFq85UBSgwsKPXXsYHeDp7kJ4mYEpYep
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(70586007)(16526019)(186003)(36756003)(82310400003)(2616005)(83380400001)(36860700001)(110136005)(86362001)(70206006)(31696002)(47076005)(336012)(8676002)(36906005)(53546011)(426003)(8936002)(82740400003)(316002)(4326008)(7636003)(31686004)(16576012)(478600001)(2906002)(5660300002)(26005)(356005)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 02:50:38.7343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e87ea3-3a76-49ed-370f-08d8ee6f9b66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1161
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/22/21 12:50 PM, Matthew Wilcox (Oracle) wrote:
> make htmldocs reports:
> 
> ./include/linux/mm.h:1341: warning: Excess function parameter 'Return' description in 'page_maybe_dma_pinned'
> 
> Fix a few other formatting nits while I'm editing this description.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   include/linux/mm.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Looks nice, thanks for fixing this up.

There was a slight delay, during which I re-learned that Sphinx 3 still causes
a "nearly indefinite" delay in "make htmldocs". But eventually I got this to
build and verified that the output made it through intact. I guess I'm grateful
that Sphinx 3 works at all, though.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA

> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 9c149e945bf9..96e5ceffce09 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1273,10 +1273,11 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>   void unpin_user_pages(struct page **pages, unsigned long npages);
>   
>   /**
> - * page_maybe_dma_pinned() - report if a page is pinned for DMA.
> + * page_maybe_dma_pinned - Report if a page is pinned for DMA.
> + * @page: The page.
>    *
>    * This function checks if a page has been pinned via a call to
> - * pin_user_pages*().
> + * a function in the pin_user_pages() family.
>    *
>    * For non-huge pages, the return value is partially fuzzy: false is not fuzzy,
>    * because it means "definitely not pinned for DMA", but true means "probably
> @@ -1294,9 +1295,8 @@ void unpin_user_pages(struct page **pages, unsigned long npages);
>    *
>    * For more information, please see Documentation/core-api/pin_user_pages.rst.
>    *
> - * @page:	pointer to page to be queried.
> - * @Return:	True, if it is likely that the page has been "dma-pinned".
> - *		False, if the page is definitely not dma-pinned.
> + * Return: True, if it is likely that the page has been "dma-pinned".
> + * False, if the page is definitely not dma-pinned.
>    */
>   static inline bool page_maybe_dma_pinned(struct page *page)
>   {
> 


