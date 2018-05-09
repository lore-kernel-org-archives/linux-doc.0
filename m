Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E0E277DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 15:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935296AbeEIPUe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 11:20:34 -0400
Received: from merlin.infradead.org ([205.233.59.134]:56646 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935065AbeEIPUd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 11:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=E4OtT9HulACvdU28ZDeVglojfjylcWsbaC363OQYM7w=; b=dNsmRQFDnwPjC7YNJePLECZTG
        YAHEurTQESiXeupCNv+bAc+JlOOx2bnIw/P6TiFGmKIBeQePIsOoTvdrlFYDPmQMcJPFftIs/RLWb
        SscBsQtuiItzICkgEGGTvr0kBBz0wbOCPFsuplZezKAWO/Nhpx8xoGO4d/X9w/mDHX6dm8AjxYGHe
        NynB5p5UnjyXv/gYzF46FU6tiwkZA5oVHXh9l2yCnsqGevbBkkDR9STreRTjuBqQND6sPEVTLUYK/
        rwqcQTJehABCzHA2oGgnyJx91Y+/MqCU473ytx7qDSthRWkbxV4/DFC+8MWFfX1N9/v4zt6xFld0J
        LA+SqSDoQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGQtI-0000cx-FZ; Wed, 09 May 2018 15:20:28 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B9A292029FA13; Wed,  9 May 2018 17:20:26 +0200 (CEST)
Date:   Wed, 9 May 2018 17:20:26 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180509152026.GA12198@hirez.programming.kicks-ass.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
 <20180509084120.GF12217@hirez.programming.kicks-ass.net>
 <20180509084518.247650e2@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180509084518.247650e2@lwn.net>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 09, 2018 at 08:45:18AM -0600, Jonathan Corbet wrote:
> On Wed, 9 May 2018 10:41:20 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > This is easily done by using "::" instead of just ":".  
> > 
> > And I'll voice my objection once again. This makes a regular comment
> > worse. This rst stuff is utter shit for making normal text files less
> > readable in your favourite text editor.
> > 
> > If this gets merged, I'll simply remove that spurious ':' the next time
> > I'm near that comment.
> 
> Seriously, Peter?

Yep... it makes for pointlessly ugly text. And seeing that the only way
to write code is using text editors, the text editor is the primary
interface to our code.

The whole rst wankery is detrimental to that interface in order to
pander to something else.. I don't see the value. I've objected before,
and I suppose I'll object again.

> It's a simple colon.  It goes along with the /** marker for kerneldoc
> comments and the @ markers found within them, both of which you seem to
> have found a way to live with.

Barely, and personally I tend to not bother with kerneldoc much. Most of
the comments I write lack the extra *, and I note that the other fix to
this problem it to drop that spurious * here as well.

The @arg thing is okay, it clearly distinguishes arguments/variable
names from regular text. But "::" is the C++ class member syntax, not
the start of an English enumeration or the like.

> The RST work was discussed for a year before we even started.  It has
> brought in the efforts of a large number of developers, all of whom see
> the value in actually caring about our documentation and making it
> accessible to a much larger group of readers.  And it has all happened
> while preserving the primacy of the plain-text documentation.

Clearly I don't agree. It reads like crap. I suspect many of the other
options, which I suppose there were, were even worse. Doesn't mean rst
is any good.

> You're not the only consumer of the docs.  You may not appreciate the
> improvements that have come, but others certainly do.  I do hope that you
> can find it in youself to avoid vandalizing things for everybody else ...?

Why should I care for people not using text editors to write code?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
