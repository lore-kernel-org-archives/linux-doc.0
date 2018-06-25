Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9F62D7DF87
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Jun 2018 12:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933001AbeFYM26 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 08:28:58 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52141 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755337AbeFYM25 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jun 2018 08:28:57 -0400
Received: by mail-wm0-f66.google.com with SMTP id w137-v6so3734886wmw.1
        for <linux-doc@vger.kernel.org>; Mon, 25 Jun 2018 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dQNcDwnOwnVEUXUmhf9ZvVWo7Vy7a/wJ3xoDGr4k8Ko=;
        b=EJSjviAfDN2q0grzWsKolvdEiEUwFJxvn5E+WgWubX2I99aUCkz+IKXvhiTdvqnSwS
         GLw+V9OpdU/RTcgcpK4M822Ky7R6cr66Jn6yhspE3fvPtW1pmVv9m1A71CJqaRiG7Oi8
         0BfPj+v4yXX10k7fdavybUbF9HiZNVbJzkqEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dQNcDwnOwnVEUXUmhf9ZvVWo7Vy7a/wJ3xoDGr4k8Ko=;
        b=HwUEp+nt1Kk6pTSc48emuefN7hd6wB6MATmPVWaDKh+EtKJg9/dKMwd9E0OCZVskyN
         p62DnrChjG2NYahCumrXZseEnrYSul8RBKq1o0FYAS1/EpDiTh3DyJUfmOfnRbybLv2y
         Tvm3eHFUE/5VEsVSiLBsKAUsbD9O561rSJXfkSi4qgHv2/jrtkhu2ZS9K6HphdzrUn+H
         8a76ZpAYFlviNTPElMlWSY3vxrwMrV6N5+Uxj7SkrRN9XlAbyXSjhhyjtwtHsOvGQVZT
         Qhhrr2QqEFeOImQigRcT/+zkiVm8oeafX3sZBmF4fAlvu/0r3tZvJQw4yzlSlziNBbEq
         4Xzw==
X-Gm-Message-State: APt69E3VjtRXfUkQw4uMvqE2EgfDCFWj8yAPg4oUm4wjSoqW6gu/f9rC
        FKDmoVSuzm0jDvhTATWizmB+pQ==
X-Google-Smtp-Source: AAOMgpegZP14RZ5j63a8gc3HEPmEP3qLCl7gvyUa1YarJl4bnMXQtuN0LnLvpluUN8V9kkLqA9wBUQ==
X-Received: by 2002:a1c:d004:: with SMTP id h4-v6mr842177wmg.151.1529929736757;
        Mon, 25 Jun 2018 05:28:56 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id z14-v6sm14238801wrm.49.2018.06.25.05.28.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jun 2018 05:28:56 -0700 (PDT)
Date:   Mon, 25 Jun 2018 14:28:50 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Will Deacon <will.deacon@arm.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] doc: Update wake_up() & co. memory-barrier guarantees
Message-ID: <20180625122850.GA14561@andrea>
References: <20180625095031.GX2494@hirez.programming.kicks-ass.net>
 <1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com>
 <2779.1529928765@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2779.1529928765@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 25, 2018 at 01:12:45PM +0100, David Howells wrote:
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > So yes, I suppose we're entirely suck with the full memory barrier
> > semantics like that. But I still find it easier to think of it like a
> > RELEASE that pairs with the ACQUIRE of waking up, such that the task
> > is guaranteed to observe it's own wake condition.
> > 
> > And maybe that is the thing I'm missing here. These comments only state
> > that it does in fact imply a full memory barrier, but do not explain
> > why, should it?
> 
> I think because RELEASE and ACQUIRE concepts didn't really exist in Linux at
> the time I wrote the doc, so the choices were read/readdep, write or full.
> 
> Since this document defines the *minimum* you can expect rather than what the
> kernel actually gives you, I think it probably makes sense to switch to
> RELEASE and ACQUIRE here.

RELEASE and ACQUIRE are not enough in SB.  Can you elaborate?

  Andrea


> 
> David
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
