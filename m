Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 532B87DF87
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Jun 2018 12:12:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932829AbeFYMMu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 08:12:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42452 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753283AbeFYMMu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Jun 2018 08:12:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 754104001388;
        Mon, 25 Jun 2018 12:12:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-238.rdu2.redhat.com [10.10.120.238])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 15184111DCED;
        Mon, 25 Jun 2018 12:12:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20180625095031.GX2494@hirez.programming.kicks-ass.net>
References: <20180625095031.GX2494@hirez.programming.kicks-ass.net> <1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     dhowells@redhat.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2778.1529928765.1@warthog.procyon.org.uk>
Date:   Mon, 25 Jun 2018 13:12:45 +0100
Message-ID: <2779.1529928765@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Mon, 25 Jun 2018 12:12:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Mon, 25 Jun 2018 12:12:49 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'dhowells@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Peter Zijlstra <peterz@infradead.org> wrote:

> So yes, I suppose we're entirely suck with the full memory barrier
> semantics like that. But I still find it easier to think of it like a
> RELEASE that pairs with the ACQUIRE of waking up, such that the task
> is guaranteed to observe it's own wake condition.
> 
> And maybe that is the thing I'm missing here. These comments only state
> that it does in fact imply a full memory barrier, but do not explain
> why, should it?

I think because RELEASE and ACQUIRE concepts didn't really exist in Linux at
the time I wrote the doc, so the choices were read/readdep, write or full.

Since this document defines the *minimum* you can expect rather than what the
kernel actually gives you, I think it probably makes sense to switch to
RELEASE and ACQUIRE here.

David
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
