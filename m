Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793FDC7EE2E
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jun 2023 16:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjFIQhc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jun 2023 12:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjFIQhb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jun 2023 12:37:31 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB2F2D71
        for <linux-doc@vger.kernel.org>; Fri,  9 Jun 2023 09:37:29 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Qd6BZ5nM7z67KPG;
        Sat, 10 Jun 2023 00:35:18 +0800 (CST)
Received: from localhost (10.126.170.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 9 Jun
 2023 17:37:26 +0100
Date:   Fri, 9 Jun 2023 17:37:23 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>,
        "Matthew Wilcox" <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Mike Rapoport" <rppt@kernel.org>
Subject: Re: [PATCH v3] Documentation/mm: Initial page table documentation
Message-ID: <20230609173723.0000520a@Huawei.com>
In-Reply-To: <20230608125501.3960093-1-linus.walleij@linaro.org>
References: <20230608125501.3960093-1-linus.walleij@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.170.42]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  8 Jun 2023 14:55:01 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> This is based on an earlier blog post at people.kernel.org,
> it describes the concepts about page tables that were hardest
> for me to grasp when dealing with them for the first time,
> such as the prevalent three-letter acronyms pfn, pgd, p4d,
> pud, pmd and pte.
> 
> I don't know if this is what people want, but it's what I would
> have wanted.
> 
> I discussed at one point with Mike Rapoport to bring this into
> the kernel documentation, so here is a small proposal.
> 
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Link: https://people.kernel.org/linusw/arm32-page-tables
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Hi Linus,

Reads nicely and seems like a good introduction to me.

One very trivial comment but otherwise FWIW

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> +
> +Over time a deeper hierarchy has been developed in response to increasing memory
> +sizes. When Linux was created, 4KB pages and a single page table called
> +`swapper_pg_dir` with 1024 entries was used, covering 4MB which coincided with
> +the fact that Torvald's first computer had 4MB of physical memory. Entries in
> +this single table was referred to as *PTE*:s - page table entries.

table were referred to as

(entries is plural hence were rather than was)
> +
> +The hierarchy reflects the fact that page table hardware has become hierarchical

