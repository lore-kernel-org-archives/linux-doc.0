Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AAEECAAD8
	for <linux-doc@archiver.kernel.org>; Thu, 22 Sep 2022 02:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiIVCq1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 22:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiIVCq0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 22:46:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D525374CF8
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 19:46:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F34662E32
        for <linux-doc@vger.kernel.org>; Thu, 22 Sep 2022 02:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DBBC433D6;
        Thu, 22 Sep 2022 02:46:23 +0000 (UTC)
Date:   Wed, 21 Sep 2022 22:47:25 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Yoann Congal <yoann.congal@smile.fr>,
        linux-doc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>
Subject: Re: [PATCH RESEND] Documentation: kprobetrace: Improve readability
Message-ID: <20220921224725.618283bc@gandalf.local.home>
In-Reply-To: <81cae8f1-67e9-37ba-4bfd-566c877944ca@gmail.com>
References: <20220915153358.813993-1-yoann.congal@smile.fr>
        <87r104tr6o.fsf@meer.lwn.net>
        <81cae8f1-67e9-37ba-4bfd-566c877944ca@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Sep 2022 09:13:08 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 9/22/22 03:20, Jonathan Corbet wrote:
> > Yoann Congal <yoann.congal@smile.fr> writes:
> >   
> >> Improve readability of kprobetrace documentation by adding markup
> >> (mainly code snippets), fixing some typos and splitting some paragraphs.
> >>
> >> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >> ---
> >>  Documentation/trace/kprobetrace.rst | 128 ++++++++++++++--------------
> >>  1 file changed, 66 insertions(+), 62 deletions(-)  
> > 
> > A couple of comments here.
> > 
> > - There's enough in this patch that I think one of the relevant
> >   maintainers should have a look.  MAINTAINERS is silent on who is
> >   responsible for this file, so I've CC'd a couple of likely suspects.
> >   
> 
> Hi jon,
> 
> I think this is Andrew Morton is also likely candidate for reviewing this
> (maintainer of last resort). CC'ing him and linux-mm people.
> 

No. This file belongs to the tracing maintainers (I'll need to update the
MAINTAINERS file, thanks Jon for letting me know).

And yes, there's too much markup added to it.

NACK on that.

But there are some other clean ups in that patch that I have no problem
with.

-- Steve
