Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE31D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Mar 2019 04:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfC2EoJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Mar 2019 00:44:09 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43092 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfC2EoJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Mar 2019 00:44:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id z9so578116pgu.10
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2019 21:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RdGo/xv71jnRrBnU/ntoO2l3ltCKRJG0xB4r+VKEC+0=;
        b=Z4fyG8yp0mot42xFuUKrkoU2h5ZXpo/UXxWctKKWjK0Si0hjVPY4g8WCyylm1FWa7F
         1AIYrWtpHzYhQt2bCeJp3FJBp7IWr2Tf3nzLygUfC539JfzniA7o58nM2v5zjVquot07
         Jmle0a0IYVBKa9XDhfox1eabXAvi8vVvXlfJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RdGo/xv71jnRrBnU/ntoO2l3ltCKRJG0xB4r+VKEC+0=;
        b=ArMp/vbd58/ONUgE3DvZMxYar6L0dH8X0JReMJYNbXymL+EgWLnpdSQnUigQ1qeQoF
         gedKp2zCIL8jDVWgDQOL28ktAOz+BW2K2tLzhGO6/Xybd7D7ARdR0AAYs8dlQAw7uD99
         0b0izjqstnc5Ho+sxPvSBocufnQeH+0dDVb3XHj/dNgRkBgEriPrCNp3fqRVv3l1usFz
         avSid8dxqsQSSIE4gmxhKNF5dLOQQg1dfdACdnFMNL91ZdNZONo/ZLb9Pl9gCWEYW09k
         LA1wnTv6bON+TJE+eKqL4V9wbuBbQRqL1PROPHILLZdBq0u07me71kpEMiK4xI4uobyN
         fO3g==
X-Gm-Message-State: APjAAAWsmw5dhyfv2gCOuEzICGTOv3GcAHtJEGBuxhESziQFpS95f0Gg
        op53v7LF0IZa2b5KpVqKW7PZiQ==
X-Google-Smtp-Source: APXvYqw8ImLcOi628ET6W3WFuSanjFnBeJwh1jHvhk9tiyTftFlm2B94MKXIbq0pIIjBb9t459cjsA==
X-Received: by 2002:a62:445a:: with SMTP id r87mr44096648pfa.13.1553834648272;
        Thu, 28 Mar 2019 21:44:08 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id n9sm941581pff.43.2019.03.28.21.44.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:44:07 -0700 (PDT)
Date:   Fri, 29 Mar 2019 00:44:05 -0400
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
Message-ID: <20190329044405.GA229534@google.com>
References: <20190329024047.206989-1-joel@joelfernandes.org>
 <CAG48ez1DrHKG2PoQjdpc=vT55enaRgQpGfAwo5ujV25TLHJL0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez1DrHKG2PoQjdpc=vT55enaRgQpGfAwo5ujV25TLHJL0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 29, 2019 at 05:06:21AM +0100, Jann Horn wrote:
> On Fri, Mar 29, 2019 at 3:40 AM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> > Document similar real world examples in the kernel corresponding to the
> > second and third code snippets. Also correct an issue in
> > release_referenced() in the code snippet example.
> >
> > Cc: oleg@redhat.com
> > Cc: jannh@google.com
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> >
> > ---
> >  Documentation/RCU/rcuref.txt | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/RCU/rcuref.txt b/Documentation/RCU/rcuref.txt
> > index 613033ff2b9b..e5f4a49f886a 100644
> > --- a/Documentation/RCU/rcuref.txt
> > +++ b/Documentation/RCU/rcuref.txt
> > @@ -28,7 +28,8 @@ add()                         search_and_reference()
> >  release_referenced()                   delete()
> >  {                                      {
> >      ...                                            write_lock(&list_lock);
> > -    atomic_dec(&el->rc, relfunc)           ...
> > +    if(atomic_dec_and_test(&el->rc))       ...
> > +       kfree(el);
> >      ...                                            remove_element
> >  }                                          write_unlock(&list_lock);
> >                                             ...
> > @@ -114,6 +115,11 @@ element can therefore safely be freed.  This in turn guarantees that if
> >  any reader finds the element, that reader may safely acquire a reference
> >  without checking the value of the reference counter.
> >
> > +The other advantage of the last pattern is, if there are several calls to
> > +search_and_reference() in parallel to the delete(), then all of those will
> > +succeed in obtaining a reference to the object if the object could be found in
> > +the list before it was deleted in delete().
> 
> Isn't this the same as what the previous paragraph said? "if
> any reader finds the element, that reader may safely acquire a reference
> without checking the value of the reference counter".

You are right.  But I felt it was less explicit about the fact that several
search_and_reference() calls can succeed will not FAIL like the previous example.

I can reword it as below:

As can be seen, a clear advantage of the last pattern is, if there are
several calls to search_and_reference() in parallel to the delete(), then all
of those will succeed in obtaining a reference to the object if the object
could be found in the list before it was deleted in delete(), unlike the
previous pattern which would fail to acquire references.

Or, can I entirely drop it if Paul and others also feel it is not necessary.

> >  In cases where delete() can sleep, synchronize_rcu() can be called from
> >  delete(), so that el_free() can be subsumed into delete as follows:
> >
> > @@ -130,3 +136,7 @@ delete()
> >         kfree(el);
> >      ...
> >  }
> > +
> > +As additional examples in the kernel, This last pattern is also followed by
> 
> nit: s/, This/, this/

Will fix.

Thanks Jann!

 - Joel

