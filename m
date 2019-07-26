Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 629AA7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 18:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbfGZSCF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 14:02:05 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34847 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfGZSCE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 14:02:04 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so25034236plp.2
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2019 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=14H5paQYitVS4/WKEkQEhitnAZvza/nR/XH2Tu80JBM=;
        b=ATl2MF1PvrU6lqcczyISZ5li9yUR8jig8dOSRgnjQeXeiDCIVHf64anGGJiNWgbJRZ
         8D0mrbgpCzlusjkYRt+BFu3Sjf507OvqqyxGlU54NakUjQCByhzDfCAJ8KbksbolpjiE
         6l81eTSLCHx3OmpsLBpNnYlhDb2+PuQ5S0q70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=14H5paQYitVS4/WKEkQEhitnAZvza/nR/XH2Tu80JBM=;
        b=omsW/Yy5FPe20jhbnygENQSiSvlUkQUjRoBjLA0ILOTdekia8IocdiVTkUi9oIyIWz
         WIsSgHhBSeEl33GkczIYsX718uKImgJjMzS3AyLUDUMskrIC+B+8dsQ3NYsAjV1GTVaI
         wdMQkJ4f43Hku8FHVqT/v3Wwgq1YRHZMMp6Zca/hMrQ+Rur77RCrerbiSQEEJJWjzx82
         9tnfHuvzbyqxrXWmMHFYzh1DID4yYwY1kAYFBwAHfQePqmjI6Dkk47KGdFCx2QE/okz0
         fsW9nt3GKXEwprPwPZ+QqiReKvhBgv8S+YQdDfGn80tvgSS49+6SejniWN6oEojplR/H
         y+5w==
X-Gm-Message-State: APjAAAUSg/aNFM7xi4DAexfP3p2/m7WSBrinYfk3zSG4seMosCWX2jwl
        nT08an/XEmU7J3s+PwYWVPQ=
X-Google-Smtp-Source: APXvYqw97ZsPDtoTN2djhrefEf5+wLhvEdfdhidAUMzWJN9QkJDPwJHLI27GDbQ70fWEquCP6vW8Kw==
X-Received: by 2002:a17:902:2f:: with SMTP id 44mr99206440pla.5.1564164123861;
        Fri, 26 Jul 2019 11:02:03 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id d17sm63317928pgl.66.2019.07.26.11.02.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 11:02:03 -0700 (PDT)
Date:   Fri, 26 Jul 2019 14:02:01 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 25/26] docs: rcu: convert some articles from html to
 ReST
Message-ID: <20190726180201.GE146401@google.com>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
 <8444797277eea7be474f40625bb190775a9cee33.1564145354.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8444797277eea7be474f40625bb190775a9cee33.1564145354.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 26, 2019 at 09:51:35AM -0300, Mauro Carvalho Chehab wrote:
[snip]
> +| until the assignment to ``gp``, by which time both fields are fully   |
> +| initialized. So reordering the assignments to ``p->a`` and ``p->b``   |
> +| cannot possibly cause any problems.                                   |
> ++-----------------------------------------------------------------------+
> +
> +It is tempting to assume that the reader need not do anything special to
> +control its accesses to the RCU-protected data, as shown in
> +``do_something_gp_buggy()`` below:
> +
> +   ::
> +
> +       1 bool do_something_gp_buggy(void)
> +       2 {
> +       3   rcu_read_lock();
> +       4   p = gp;  /* OPTIMIZATIONS GALORE!!! */
> +       5   if (p) {
> +       6     do_something(p->a, p->b);
> +       7     rcu_read_unlock();
> +       8     return true;
> +       9   }
> +      10   rcu_read_unlock();
> +      11   return false;
> +      12 }
> +
> +However, this temptation must be resisted because there are a
> +surprisingly large number of ways that the compiler (to say nothing of
> +`DEC Alpha CPUs <https://h71000.www7.hp.com/wizard/wiz_2637.html>`__)
> +can trip this code up. For but one example, if the compiler were short
> +of registers, it might choose to refetch from ``gp`` rather than keeping
> +a separate copy in ``p`` as follows:
> +
> +   ::
> +
> +       1 bool do_something_gp_buggy_optimized(void)
> +       2 {
> +       3   rcu_read_lock();
> +       4   if (gp) { /* OPTIMIZATIONS GALORE!!! */
> +       5     do_something(gp->a, gp->b);
> +       6     rcu_read_unlock();
> +       7     return true;
> +       8   }
> +       9   rcu_read_unlock();
> +      10   return false;
> +      11 }
> +
> +If this function ran concurrently with a series of updates that replaced
> +the current structure with a new one, the fetches of ``gp->a`` and
> +``gp->b`` might well come from two different structures, which could
> +cause serious confusion. To prevent this (and much else besides),
> +``do_something_gp()`` uses ``rcu_dereference()`` to fetch from ``gp``:
> +
> +   ::
> +
> +       1 bool do_something_gp(void)
> +       2 {
> +       3   rcu_read_lock();
> +       4   p = rcu_dereference(gp);
> +       5   if (p) {
> +       6     do_something(p->a, p->b);
> +       7     rcu_read_unlock();
> +       8     return true;
> +       9   }
> +      10   rcu_read_unlock();
> +      11   return false;
> +      12 }
> +
> +The ``rcu_dereference()`` uses volatile casts and (for DEC Alpha) memory
> +barriers in the Linux kernel. Should a `high-quality implementation of
> +C11 ``memory_order_consume``
> +[PDF] <http://www.rdrop.com/users/paulmck/RCU/consume.2015.07.13a.pdf>`__
> +ever appear, then ``rcu_dereference()`` could be implemented as a
> +``memory_order_consume`` load. Regardless of the exact implementation, a
> +pointer fetched by ``rcu_dereference()`` may not be used outside of the
> +outermost RCU read-side critical section containing that
> +``rcu_dereference()``, unless protection of the corresponding data
> +element has been passed from RCU to some other synchronization
> +mechanism, most commonly locking or `reference
> +counting <https://www.kernel.org/doc/Documentation/RCU/rcuref.txt>`__.

From the make htmldocs output, this appears very poorly for me, I get
something like this in the browser:

The rcu_dereference() uses volatile casts and (for DEC Alpha) memory barriers
in the Linux kernel. Should a high-quality implementation of C11
``memory_order_consume` [PDF]
<http://www.rdrop.com/users/paulmck/RCU/consume.2015.07.13a.pdf>`__ ever
appear, then rcu_dereference() could be implemented as a memory_order_consume
load.

Is there a syntax issue here?

One more feedback,
the image under "RCU read-side critical section that started before the current
grace period:" should probably be blown up a bit.
