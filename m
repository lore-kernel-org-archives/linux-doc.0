Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B5EEB64D0
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 14:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241000AbjFMOpd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242655AbjFMOpY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 10:45:24 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5951739
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=p6IXXzrIIM5v8wClJsiV/eW+6rZyGRYzOocxk3ijSjw=; b=oOH0jvB5rkPUDOY2KrUgb1DVHq
        tR6BkmrMEhIvidHc02Dj/dzwM5jXgWyi6RfVwVZI+pycZ0yoaYcdzmuWhYTFwIHnYl8ym8X5f7oFw
        etEITFVNkCu6817h8kF6qkQdcsEqp3JahY/X5xjHz712ppK2jzKcr7h2RfBPQj88tLBM9q01q24Ck
        DI4261NSHxuXeD6b7Md+EalWZR6rqSgR1ReSWKWqAH1Ni5jHtKLGBzrugsS/nHyxP7NFYaPegkgZw
        YIbxtGQFHgBt+cvpvOop41ArITgOQ4fkwnEn4DXrtqp2vNHDOpZgEqGWfGKamACiX1qaIAfzYlEpO
        pBaNMVPQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1q95Gi-0040br-Qq; Tue, 13 Jun 2023 14:45:12 +0000
Date:   Tue, 13 Jun 2023 15:45:12 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v4] Documentation/mm: Initial page table documentation
Message-ID: <ZIiA+E3W2oWy9uuR@casper.infradead.org>
References: <20230613083906.757878-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613083906.757878-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 13, 2023 at 10:39:06AM +0200, Linus Walleij wrote:
> +Paged virtual memory was invented along with virtual memory as a concept in
> +1962 on the Ferranti Atlas Computer which was the first computer with paged
> +virtual memory. The feature migrated to newer computers and became a de facto
> +feature of all Unix-like systems as time went by. In 1985 the feature was
> +included in the Intel 80386, which was the CPU Linux 1.0 was developed on.

I still don't think the origin story is useful.  It's trivia and doesn't
help someone understand what they need to know.

> +Page tables map virtual addresses as seen by the CPU program counter into
> +physical addresses as seen on the external memory bus.

This makes it sound like virtual addresses are only used for
instructions.  I had better wording earlier, but there's no point in
repeating it.  Just: I dissent. 

> +Linux defines page tables as a hierarchy which is currently five levels in
> +height. The target architecture code for each supported architecture will then
> +map this to the restrictions of the target hardware.

The word "target" isn't adding any value in this paragraph.

Honestly, I don't like much about this document.  The writing is
flabby and untargetted.  Much of my last review was ignored.  I'm just
going to stop here since I have low confidence that any suggestions
would be incorporated.
