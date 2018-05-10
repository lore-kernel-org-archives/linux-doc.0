Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B3C77DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 13:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965057AbeEJNEU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 09:04:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56768 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965021AbeEJNET (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 09:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=P2myGI4QWiWY9/28OdZ24u09wjAgze6omfToQt6LAiU=; b=I/c1MQvvOPI1jK0cCfPuWOPTk
        Slcqshp9C9GEBOW694Jxidc8h3Tw9aYnMSBP01Sbz7bll+Rn2pz9t0OYX7Bs8Su+a22LRcqrOBDHA
        rcMPlM4Inwl5mFGbZbLIJwNdWSf1CbOgJj+rQ/iOsHAfjixopCa+7HcyPIBfg97RaZEXFaAyyWYFX
        NE+KQfPuU4eYURhcse00j+pybMFl+nZ3zEJ38137xtwLt5GEAedqRRGXqK9t1OJcPW2uD9ifsdchs
        kFNbRZw4Qtp/47QYPYvPNjWJAPRD6AoTRfCeeiKd6OumaF0ALTn2G5K++A8KFynWVCVm63YxmKt7f
        AmxAg0IdQ==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGlF4-0008QQ-SX; Thu, 10 May 2018 13:04:19 +0000
Date:   Thu, 10 May 2018 10:04:13 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510100413.754d1399@vento.lan>
In-Reply-To: <20180510122036.GD12217@hirez.programming.kicks-ass.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
        <20180510083838.GA21846@infradead.org>
        <20180510063805.1859b1aa@vento.lan>
        <20180510122036.GD12217@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 10 May 2018 14:20:36 +0200
Peter Zijlstra <peterz@infradead.org> escreveu:

> On Thu, May 10, 2018 at 06:38:05AM -0300, Mauro Carvalho Chehab wrote:
> > Em Thu, 10 May 2018 01:38:38 -0700
> > Christoph Hellwig <hch@infradead.org> escreveu:
> >   
> > > >   * Use either while holding wait_queue_head::lock or when used for wakeups
> > > > - * with an extra smp_mb() like:
> > > > + * with an extra smp_mb() like::    
> > > 
> > > Independent of any philosophical discussion not allowing a setence to
> > > end with a single ':' is completely idiotic.  Please fix the tooling
> > > instead to allow it, as it is very important for being able to just
> > > write understandable comments.  
> 
> That is exactly my point; the whole rst stuff detracts from normal text.
> It makes both reading and writing harder than it needs to be.
> 
> > Patches are welcome, although I don't see any easy way to solve it.
> > 
> > In English, the common case is that a line with ends with a colon is
> > followed by a list. E. g.  
> 
> (google) Dictionary says:
> 
> "a punctuation mark (:) used to precede a list of items, a quotation, or
> an expansion or explanation."
> 
> An enumeration (list) is just one of many possible uses of the colon.

True, but the point is that whatever tool is used, it should be able
to uniquely unambiguously identify what it follows.

For example, it if is a list of items, it should keep parsing the
semantics markups inside it e. g. marking %FOO as a constant,
and bar() as a function, etc, following kernel-doc syntax. 

But, if it is a quote, a code example or an ascii artwork, it
should disable all such parsers, enclosing the result into a
literal block.

> > However, in this specific case, it is followed by an ascii artwork. 
> > The double colon is a notation that tells Sphinx to not parse the
> > lines at the next block, placing the contents of it inside a literal
> > block. It is used also when the next lines contain a code example,
> > in order to avoid parsing things like @, () and * inside the code 
> > block.
> > 
> > The kernel-doc tool might eventually have some parsing logic that
> > would replace something to a '::' before sending it to Sphinx.  
> 
> I think typically there will be an 'empty' line between the colon ending
> and the 'example/explanation'. This seems true for a number of comments
> I found in drm using the '::' nonsense.

Unfortunately, that's not true treewide. The presense/absense of a
blank line after a line ending with a colon doesn't indicate if the contents
below should be handled as a literal block or not[1].

[1] you can verify some use cases with:
	$ git grep -A2 "\*.*\s.*:$" -- $(git grep kernel-doc:: Documentation/|cut -d : -f 4-)

> Simple regexes don't do multi-line patterns, but maybe the kerneldoc
> thing can parse it differently.

kernel-doc is a regex-based parser (and not an AI engine). It will do only
what it is programmed for, based on a clear regex-based semantics.

Independently on how easy/hard it would be to use a multi-line pattern
for this, what it is required is a clear non-hint based pattern that
will provide a match for a part of the tag that should be escaped
from normal parsing rules. The m/::$/ is a clear rule.

Do you have a proposal for some other rule? If so, I can see how
feasible is to add it there.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
