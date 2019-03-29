Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7B86C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Mar 2019 04:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbfC2Eqc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Mar 2019 00:46:32 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42509 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfC2Eqb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Mar 2019 00:46:31 -0400
Received: by mail-pg1-f193.google.com with SMTP id p6so581840pgh.9
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2019 21:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aGE+rNDsRy/rFAu+iSL9yJvymTxn2x/oeXkSrAHDaGg=;
        b=GPtdwf0wu56ceA4MtaJdr4WZsKF9nSYMHV4GxfI+fXQP7vXGxbfJgtsFHgjR/Ka+x7
         fnfTb0DVQ91DZuqaRu92QPkMIZNEdQRzYP8tmVLI/bd+wZ3lsH7FyjDZkyXstvnNQNKt
         6jRF4zMkyVIZegKEDZSKcajwiOAeeqoII/saE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aGE+rNDsRy/rFAu+iSL9yJvymTxn2x/oeXkSrAHDaGg=;
        b=sIVrL3cFeR9bqLTKISGPYF9CjHT+jJXY37tcvgpQBxDsz8ODfKxC0zYWlInCQwchRl
         xDEtU79yy9bSuEFgQ5ryOWeD8gKE0u/GwBZkngDa1xDfdjSKJyFyx4MDTHZcVCRHYaWH
         V1DdM4841K+J5EhOdGPEmC7BOe4CMfR+Eu/eozfD2YJYb0P+o4ZHFA8ePhiO1qNMFot/
         kU/4GC9OC6kig4Lb6cQwFjq12OtqdcX8+28JILyEHaW+SGWfyt3CiabiIV6ru1kT3SBX
         MK0Jyi3vFj3t2jWzH+8Bt6u/j3Oh97HUfIQfrraU9fIrlRIb2Wy0T74PDsNw1LwQNd6L
         xUPA==
X-Gm-Message-State: APjAAAXB3Eb3o9KZ+Xsf1NwwrtJeehd406W8W4FQB5pf0+6ug2plxEcN
        VNC/T3PCfPoYVTzRtEw/O1kEZw==
X-Google-Smtp-Source: APXvYqy9rgnzOaMOKiXP3sDP/bXGxipWOp3di5oUZZ4bsPrLveyGN8n+4jVukkkeB36nlOw9fbpuuw==
X-Received: by 2002:a65:60ca:: with SMTP id r10mr43932713pgv.429.1553834791096;
        Thu, 28 Mar 2019 21:46:31 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id z6sm1072733pfz.65.2019.03.28.21.46.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:46:30 -0700 (PDT)
Date:   Fri, 29 Mar 2019 00:46:29 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Jann Horn <jannh@google.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] doc/rcuref: Document real world examples in kernel
Message-ID: <20190329044629.GA234754@google.com>
References: <20190329024047.206989-1-joel@joelfernandes.org>
 <CAG48ez1DrHKG2PoQjdpc=vT55enaRgQpGfAwo5ujV25TLHJL0g@mail.gmail.com>
 <20190329044405.GA229534@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329044405.GA229534@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 29, 2019 at 12:44:05AM -0400, Joel Fernandes wrote:
> On Fri, Mar 29, 2019 at 05:06:21AM +0100, Jann Horn wrote:
> > On Fri, Mar 29, 2019 at 3:40 AM Joel Fernandes (Google)
> > <joel@joelfernandes.org> wrote:
> > > Document similar real world examples in the kernel corresponding to the
> > > second and third code snippets. Also correct an issue in
> > > release_referenced() in the code snippet example.
> > >
> > > Cc: oleg@redhat.com
> > > Cc: jannh@google.com
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > >
> > > ---
> > >  Documentation/RCU/rcuref.txt | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/RCU/rcuref.txt b/Documentation/RCU/rcuref.txt
> > > index 613033ff2b9b..e5f4a49f886a 100644
> > > --- a/Documentation/RCU/rcuref.txt
> > > +++ b/Documentation/RCU/rcuref.txt
> > > @@ -28,7 +28,8 @@ add()                         search_and_reference()
> > >  release_referenced()                   delete()
> > >  {                                      {
> > >      ...                                            write_lock(&list_lock);
> > > -    atomic_dec(&el->rc, relfunc)           ...
> > > +    if(atomic_dec_and_test(&el->rc))       ...
> > > +       kfree(el);
> > >      ...                                            remove_element
> > >  }                                          write_unlock(&list_lock);
> > >                                             ...
> > > @@ -114,6 +115,11 @@ element can therefore safely be freed.  This in turn guarantees that if
> > >  any reader finds the element, that reader may safely acquire a reference
> > >  without checking the value of the reference counter.
> > >
> > > +The other advantage of the last pattern is, if there are several calls to
> > > +search_and_reference() in parallel to the delete(), then all of those will
> > > +succeed in obtaining a reference to the object if the object could be found in
> > > +the list before it was deleted in delete().
> > 
> > Isn't this the same as what the previous paragraph said? "if
> > any reader finds the element, that reader may safely acquire a reference
> > without checking the value of the reference counter".
> 
> You are right.  But I felt it was less explicit about the fact that several
> search_and_reference() calls can succeed will not FAIL like the previous example.
> 
> I can reword it as below:
> 
> As can be seen, a clear advantage of the last pattern is, if there are
> several calls to search_and_reference() in parallel to the delete(), then all
> of those will succeed in obtaining a reference to the object if the object
> could be found in the list before it was deleted in delete(), unlike the
> previous pattern which would fail to acquire references.
> 
> Or, can I entirely drop it if Paul and others also feel it is not necessary.

Here I meant "I can entirely drop this part of the patch if Paul and others
also feel it is not necessary."

thanks,

 - Joel

