Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A05C04E69
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 15:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239567AbjHPPPl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344109AbjHPPPg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 11:15:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439311BF7;
        Wed, 16 Aug 2023 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=N6a3LFi7FqtDc7rgHMTZkd2jpNcJEIic3nqXwAZCGZs=; b=ov/ggSx2aYXP+GoRT5S8O0IAZd
        J8zSNz2y0YyfNhmoueSOUvYLus6hCmdmDllClueZMnULz5l6CSPToXFe7eHX/EKYf+Lnn9t5bOEcH
        PA8/w8PlbZ1stXwaPcVeJm7GqKqfqbp6q/qVuixfCBo2tLoPlTJGKjfyQQt9L+w0UWB5u3OOItqbg
        nN9M6zuydveBdjKEweGknBaFSl+Op3Icsb5LrQ2eoBcPdggme5rRzB91k/Zj62d1/khAYx+hCTwTu
        iXeA4fnKNY5D207TZc2ajbVJgHWxbcI5tpzlFeGkKhxZ2yl+Bk4U8cLcGlXxq8VExHhDpG4yy7m9a
        y7Zs4L3g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qWIF7-00FNcO-BO; Wed, 16 Aug 2023 15:15:29 +0000
Date:   Wed, 16 Aug 2023 16:15:29 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Carlos Bilbao <carlos.bilbao@amd.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Avadhut Naik <Avadhut.Naik@amd.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [RFC] Proposal to relax warnings of htmldocs
Message-ID: <ZNzoEVYE1dTOnni4@casper.infradead.org>
References: <85964510-4f88-58d2-2687-f7fa76013cf9@amd.com>
 <87v8dgtb9o.fsf@meer.lwn.net>
 <CANiq72=8DH8SZS2TZF+nHzCq3onXz-OuyE-xmYZncDmiKqVfzQ@mail.gmail.com>
 <ZNvGz4v2QYowrhk0@casper.infradead.org>
 <87bkf79row.fsf@intel.com>
 <f7d0e554-b6ac-49ee-4caf-640967bc1053@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d0e554-b6ac-49ee-4caf-640967bc1053@amd.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 16, 2023 at 10:12:56AM -0500, Carlos Bilbao wrote:
> On 8/16/23 06:01, Jani Nikula wrote:
> > What I'd hope for is build system support to enable W=1
> > compiler/kernel-doc warnings for a subdir with a few lines at most,
> > instead of duplicating and copy-pasting tens of lines from
> > scripts/Makefile.extrawarn like we have to do now.
> 
> That sounds feasible but, well, I actually proposed the opposite approach.
> I wanted to "relax" the warnings (see RFC Subject) rather than making them
> more strict by default.
> 
> My concern is that W=1 (by default) may theoretically result in a clean
> `make htmldocs` but it won't in practice. Not all developers prioritize
> good documentation like the folks from i915, and that may lead to
> unaddressed warnings or worst, less interest in documenting the code. Isn't
> it the case that some of these higher-control warnings don't really have
> much effect in real life? And shoukd W=1 become the default, are we going
> to be able to enforce that level of control?

I wasn't proposing making W=1 builds the default; I was proposing
running kernel-doc -none at all levels.
