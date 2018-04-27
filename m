Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 39C427DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 22:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759316AbeD0WRN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 18:17:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753569AbeD0WRM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 18:17:12 -0400
Received: from gandalf.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 477AC2191E;
        Fri, 27 Apr 2018 22:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 477AC2191E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rostedt@goodmis.org
Date:   Fri, 27 Apr 2018 18:17:09 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Masanari Iida <standby24x7@gmail.com>, mingo@redhat.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] linux-next: ftrace/docs: Fix spelling typos in
 ftrace-users.rst
Message-ID: <20180427181709.06bc0b1b@gandalf.local.home>
In-Reply-To: <20171127224636.7c0850d3@gandalf.local.home>
References: <20171128032613.28315-1-standby24x7@gmail.com>
        <20171127224636.7c0850d3@gandalf.local.home>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I just noticed that this was never applied.

Jon, can you take this?

-- Steve


On Mon, 27 Nov 2017 22:46:36 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 28 Nov 2017 12:26:13 +0900
> Masanari Iida <standby24x7@gmail.com> wrote:
> 
> > This patch corrects some spelling typo in ftrace-users.rst
> > 
> > Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> > ---
> >  Documentation/trace/ftrace-uses.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/trace/ftrace-uses.rst b/Documentation/trace/ftrace-uses.rst
> > index 8494a801d341..9df5ee15859a 100644
> > --- a/Documentation/trace/ftrace-uses.rst
> > +++ b/Documentation/trace/ftrace-uses.rst
> > @@ -12,7 +12,7 @@ Written for: 4.14
> >  Introduction
> >  ============
> >  
> > -The ftrace infrastructure was originially created to attach callbacks to the
> > +The ftrace infrastructure was originally created to attach callbacks to the
> >  beginning of functions in order to record and trace the flow of the kernel.
> >  But callbacks to the start of a function can have other use cases. Either
> >  for live kernel patching, or for security monitoring. This document describes
> > @@ -29,7 +29,7 @@ going to idle, during CPU bring up and takedown, or going to user space.
> >  This requires extra care to what can be done inside a callback. A callback
> >  can be called outside the protective scope of RCU.
> >  
> > -The ftrace infrastructure has some protections agains recursions and RCU
> > +The ftrace infrastructure has some protections against recursions and RCU
> >  but one must still be very careful how they use the callbacks.
> >  
> >    
> 
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 
> -- Steve

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
