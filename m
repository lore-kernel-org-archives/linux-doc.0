Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E266E7DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 09:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756791AbeEJJiM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 05:38:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59570 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756726AbeEJJiL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 05:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QkfilvyfcGTqnNrVqeY2ZdnBkSRJYUAax2MVW7h5nEs=; b=Qe8Akkf4aSrW2TQ+EvLGHCMja
        /92HDrPzJOx4nnRh72lq0nO+EONJp8mUg9B5/UeHBg0znH4249v5k0XLFgyOOnFkEVN0N7a5/txTv
        IwonOV85AwTPEbB6EB/VmTMUReobRWZVMZjnfVdKo91aan3cdtv4QvipLGSkpr9MrkTZ5N3h/QUvt
        +pmi2zSWDBIxanEu1+6q9gndaucfJ2iGnqDFrB2S8zZCPw4jPG/i0Uv9a6tC6fVo2avXswhXafDeq
        JpFCIQFl99XS4qeCGdtXYyrkqhyHve10OxXoq2cqYoJyhXVWMceYDKWC8TaY6WNOe3LEjNPBADovO
        c+vZl3esg==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGi1a-0003zK-5s; Thu, 10 May 2018 09:38:10 +0000
Date:   Thu, 10 May 2018 06:38:05 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510063805.1859b1aa@vento.lan>
In-Reply-To: <20180510083838.GA21846@infradead.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
        <20180510083838.GA21846@infradead.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 10 May 2018 01:38:38 -0700
Christoph Hellwig <hch@infradead.org> escreveu:

> >   * Use either while holding wait_queue_head::lock or when used for wakeups
> > - * with an extra smp_mb() like:
> > + * with an extra smp_mb() like::  
> 
> Independent of any philosophical discussion not allowing a setence to
> end with a single ':' is completely idiotic.  Please fix the tooling
> instead to allow it, as it is very important for being able to just
> write understandable comments.

Patches are welcome, although I don't see any easy way to solve it.

In English, the common case is that a line with ends with a colon is
followed by a list. E. g.

	foo:
	  - bar1;
	  - bar2.

However, in this specific case, it is followed by an ascii artwork. 
The double colon is a notation that tells Sphinx to not parse the
lines at the next block, placing the contents of it inside a literal
block. It is used also when the next lines contain a code example,
in order to avoid parsing things like @, () and * inside the code 
block.

The kernel-doc tool might eventually have some parsing logic that
would replace something to a '::' before sending it to Sphinx.
It could, for example, have a "hint" regex that would expect a
certain sequence of characters to be at the last line, like:

	s/ascii\s+artwork.*:/ascii artwork.*::/
or
	s/code\s+block.*:/code block.*::/

Then, change the kernel-doc comment to use it, like:

 * with an extra smp_mb() like shown at the following ascii artwork:

but IMHO, this is a lot worse than "::": it would be more intrusive
and more error-prune.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
