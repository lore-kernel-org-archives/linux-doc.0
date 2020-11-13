Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E97C4742C
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 21:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E552122252
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 21:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKMVxs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 16:53:48 -0500
Received: from ms.lwn.net ([45.79.88.28]:50848 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgKMVxs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Nov 2020 16:53:48 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 285EC4FA;
        Fri, 13 Nov 2020 21:53:48 +0000 (UTC)
Date:   Fri, 13 Nov 2020 14:53:47 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] doc:it_IT: align Italian documentation
Message-ID: <20201113145347.01fea824@lwn.net>
In-Reply-To: <20201113133638.7989-1-federico.vaga@vaga.pv.it>
References: <20201113133638.7989-1-federico.vaga@vaga.pv.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 13 Nov 2020 14:36:38 +0100
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> Translation for the following patches
> 
> commit 905705a8fd43 ("docs: programming-languages: refresh blurb on clang support")
> commit 5ff4aa70bf34 ("docs: submitting-patches: use :doc: for references")
> commit 030f066f677f ("docs: submitting-patches: describe preserving review/test tags")
> commit 68e4cd17e218 ("docs: deprecated.rst: Add zero-length and one-element arrays")
> commit 5429ef62bcf3 ("compiler/gcc: Raise minimum GCC version for kernel builds to 4.8")
> commit 5b5bbb8cc51b ("docs: process: Add an example for creating a fixes tag")
> commit 858e6845654d ("docs: dt: convert submitting-patches.txt to ReST format")
> commit cca73e4946c4 ("docs: Correct the release date of 5.2 stable")
> commit c170f2eb9648 ("docs: Document cross-referencing between documentation pages")
> commit 7c8b9e3000f8 ("kernel-doc: Update "cross-referencing from rST" section to use automarkup")
> commit 27def953b63b ("docs: deprecated.rst: Expand str*cpy() replacement notes")
> commit 17dca0502314 ("docs: deprecated.rst: Update zero-length/one-element arrays section")
> commit 3519c4d6e08e ("Documentation: add minimum clang/llvm version")
> commit 0bddd227f3dc ("Documentation: update for gcc 4.9 requirement")
> commit 9f364b605f34 ("submitting-patches.rst: presume git will be used")
> commit 4ebdf7be21d6 ("Documentation/maintainer: rehome sign-off process")
> commit 7433ff33e8ba ("Documentation/process: expand plain-text advice")
> commit eb45fb2fb16d ("docs: process: Add cross-link to security-bugs")
> commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column warning")
> commit f67281a72b30 ("Documentation: process: step 2: Link to email list fixed")
> 
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>

This doesn't apply to docs-next, not quite sure why.

Also...what changed with v2?  Please always include that information under
the "---" line.

Thanks,

jon
