Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00255C7EE29
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 09:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbjFHJCA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 05:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235466AbjFHJB3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 05:01:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE0D2738
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 02:01:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E25DD64B10
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 09:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BC0C4339B;
        Thu,  8 Jun 2023 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686214881;
        bh=ENY+GBR80KU6FtfZoQp38Y0wG9dMpgJdlLMVkzCZzJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wjo0r9oqO32DtHsSgog4dZlLy2/yDQdDAw64BfeonhYX4lVHGZbVXbsyIO3Md4aga
         h3kaE7NvslJinmYlrUPegQ6ZDM82vnE32bczkZKoDJFwPHpai+q+bVidl7Kv5ww6Y8
         Yz3iS+Cq4gGpECGWacXSF/BYmOSMe1o6Xl4K5EO2M7zzrXeZBiH5/JJ1xYZUhZNygI
         A2XzXx71LFnXiSzSJJHdQBM9p+R6Trqhtz03VkKdOSrunFKjWF0doUX9zig0W3kXDq
         jCpyYraSmQ3/cmqI3nYYOZHLv4T3si8alVdJZ6HVyJG7eyY4LZsbQW23NGtYIT6vYb
         /Eg/cPuwvTteA==
Date:   Thu, 8 Jun 2023 12:00:56 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/mm: Initial page table documentation
Message-ID: <20230608090056.GH52412@kernel.org>
References: <20230605221035.3681812-1-linus.walleij@linaro.org>
 <ZH6uolQWeyX9kb+j@casper.infradead.org>
 <CACRpkdYPPLWW6P5wwEuXjM6ZL6k6fpq_G7my6jBRhz76426bcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYPPLWW6P5wwEuXjM6ZL6k6fpq_G7my6jBRhz76426bcA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 08, 2023 at 10:13:49AM +0200, Linus Walleij wrote:
> Hi Matthew,
> 
> I fixes up most of the comments.
> 
> On Tue, Jun 6, 2023 at 5:57 AM Matthew Wilcox <willy@infradead.org> wrote:
> > On Tue, Jun 06, 2023 at 12:10:35AM +0200, Linus Walleij wrote:
> 
> > > +- **pte**, `pte_t`, `pteval_t` = **Page Table Entry** - mentioned earlier.
> > > +  The name is a bit confusing because while in Linux 1.0 this did refer to a
> > > +  single page table entry in the top level page table, it was retrofitted
> > > +  to be "what the level above points to". So when two-level page tables were
> > > +  introduced, the *pte* became a list of pointers, which is why
> > > +  `PTRS_PER_PTE` exists. This oxymoronic term can be mildly confusing.
> >
> > I don't think this is right.  PTRS_PER_PTE is how many pointers are in
> > the PMD page table,
> 
> I don't get this. What does PTRS_PER_PMD mean then (and
> then all the way up to PTRS_PER_PGD...)

PTRS_PER_PTE is how many pointers in the lowest level (pte) page table and
pte_t is a "pointer" to an actual physical page mapped by the page tables.
 
> Yours,
> Linus Walleij

-- 
Sincerely yours,
Mike.
