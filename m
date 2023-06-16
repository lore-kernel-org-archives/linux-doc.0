Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFD5EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 14:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245658AbjFPOOj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 10:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjFPOOj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 10:14:39 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FDB26BA
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 07:14:38 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C0F3837A;
        Fri, 16 Jun 2023 14:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C0F3837A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1686924876; bh=GHKjBONqsI6d2ikvhbJMXfsA/8uggthZwvsqRwbZQQg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WWo7/TV0kwWyrTS/4XPT2hs7HIGUmuOjILWtPswnq/ozgcuKO2u1pQP+DeqaS5fBf
         HzqI87Pqm9vYcXYGxawUXmTVOUvcTBsyUR6i+fsU4xCrIGLUaG4v1nQ7YJVhuWrk5Z
         mMnTy2emT6C1hGmwoJq1+1oUFIMiX15JrA7Q4tadGwUlZ3dwyaU+odID/ghhAmjmzF
         s/FEen4GO42tUYYnpIdrhyM935x3EAsXOmIAgkDqmh+5k0tM66KnA/86oAvMIA3lKK
         No8VuKdhO0SAgYD9mhgq2w+OPXlo8EoX+F5fJJLWLfFAANiEh3IHF8B+RCS37eHK8E
         q24sSizdHm1qw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v5] Documentation/mm: Initial page table documentation
In-Reply-To: <20230614072548.996940-1-linus.walleij@linaro.org>
References: <20230614072548.996940-1-linus.walleij@linaro.org>
Date:   Fri, 16 Jun 2023 08:14:36 -0600
Message-ID: <87edmbze7n.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> This is based on an earlier blog post at people.kernel.org,
> it describes the concepts about page tables that were hardest
> for me to grasp when dealing with them for the first time,
> such as the prevalent three-letter acronyms pfn, pgd, p4d,
> pud, pmd and pte.
>
> I don't know if this is what people want, but it's what I would
> have wanted. The wording, introduction, choice of initial subjects
> and choice of style is mine.
>
> I discussed at one point with Mike Rapoport to bring this into
> the kernel documentation, so here is a small proposal.
>
> The current form is augmented in response to feedback from
> Mike Rapoport, Matthew Wilcox, Jonathan Cameron, Kuan-Ying Lee,
> Randy Dunlap and Bagas Sanjaya.
>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Mike Rapoport <rppt@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Link: https://people.kernel.org/linusw/arm32-page-tables
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

So I think this has gone around enough and have decided to pick it up.
If there are parts that people aren't happy with, we can surely fix them
up as we go on.  Meanwhile, it's good to see an effort to fill in one of
the gaps here, thanks for doing it.

Thanks,

jon
