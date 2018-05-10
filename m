Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD2227DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 17:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966577AbeEJRO5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 13:14:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37402 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966492AbeEJRO4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 13:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9zhUJeHf0m6kN0PmrId4KbbBhwT0f07+Dj8UYQbdjTU=; b=hrr5P+Zw/6a8oFYkozke0sgdj
        VAGntiW0Gjc/30oq9YMBfebPsYYrXeV1lL0OVVGPXrzFELPjkO8+N49oag0rfR+knSorIWc6T1c4I
        9Itr7unVoP24d2EI2auSZhF7SD9xHm4X/6ZiTWW1cwwztIipFk3gODq0UdnJqiGJ4aXqnsrt9Dm6v
        W/l1J8zqCYQU1ifcL1g3dwvowB3tIBQz18vkJVcZYWN2pUhQZ3IDLXHbVZfZagKDXYrNl3ctLTj0/
        dyt3s/r4qEw/PxgFoX3anuUmHFQ8VnG2YZc1PgU3YO0oDMiRnzFcA/RCGGlv8RrPU2x3pGKcdqjUV
        8qrdGI3cQ==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGp9b-0003gq-Eq; Thu, 10 May 2018 17:14:55 +0000
Date:   Thu, 10 May 2018 14:14:51 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510141451.31cb030e@vento.lan>
In-Reply-To: <20180510134249.64445281@vento.lan>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
        <20180510083838.GA21846@infradead.org>
        <20180510063805.1859b1aa@vento.lan>
        <20180510073012.5902088e@lwn.net>
        <20180510112113.4db65764@vento.lan>
        <20180510093846.184f6de0@lwn.net>
        <20180510134249.64445281@vento.lan>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 10 May 2018 13:42:58 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Thu, 10 May 2018 09:38:46 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > On Thu, 10 May 2018 11:21:13 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> > 
> > > The problem with a hint-based mechanism is that it will generate
> > > false hints. If added, we may end by needing to add extra tags to
> > > disable the hints mechanism where it gets wrong, or to periodically
> > > do code changes at kernel-doc comments in order to make the hints
> > > logic happy.
> > > 
> > > So, IMO, we should provide non-hints based mechanism, like forcing the
> > > string that prepends the colon to have a keyword that will make it to
> > > parse the block as literal, where expressions like:
> > > 
> > > 	See the code-block foo:
> > > 	See the following code example:
> > > 	See the following flow diagram:
> > > 	See the following artwork:
> > > 
> > > Is the best alternative to avoid "::", as on the enclosed patch.  
> > 
> > But this, too, is a hint-based mechanism.  Thanks for the patches, I'll
> > keep them around, but I would like an opportunity to try to do better
> > before applying them.  I fear that using magic words in this way will
> > lead to a constant stream of surprises, and I'd like to avoid that if
> > possible...
> 
> Yes, it is still hint-based. A careful selection of the "magic spell
> words/phrases" would minimize the risks of false positives, but it
> could still lead into some unwanted surprises.

Btw, running this:

$ git grep -A2 "\*\s.*following.*(code|example|artwork|flow|diagram).*:$"

currently doesn't have a single match. 

If we force a two word combination, and an ending with ":" should
be enough to not having too much false positives.

Regards,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
