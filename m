Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BC73F7D088
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 02:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbeJOJvf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 05:51:35 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43844 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbeJOJvf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Oct 2018 05:51:35 -0400
Received: by mail-pl1-f195.google.com with SMTP id 30-v6so8475898plb.10
        for <linux-doc@vger.kernel.org>; Sun, 14 Oct 2018 19:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WTRfclzQV0jRHnDDbzZPbGnILu6IWg6IJkTeeszvhZo=;
        b=amj90ZyIVNHXNBoqVACxeFge43Gplo0G41a3/Bv0gCLO11s0+13OaJW73bn9MuI1On
         4FzLGQpm7obct2ODA2+BWpN065CZA0n2nNAoF4gikOr8TWw0UxypLrR2GvTHio9L1rTF
         0z8mf9maP01PkZRTCJZLj4m6SwYqSFt5BNNSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WTRfclzQV0jRHnDDbzZPbGnILu6IWg6IJkTeeszvhZo=;
        b=J/WGNdzx9dME4eseCErC5s36GM4e6rfV7zcNa5jlyOGtrJIt71T0BuBCZbFw8IRymR
         SyPEwJ7JQnUJlKPbmTQ/5Fq2ud8nyt8e3FL8xj7AVzT1uLakn08PKXa29SbGJEp2VM0U
         1f/tksZMOPW54UC+stzUtE8w64dmsF1WpD3CxUKsxh26aQAa++h8g9jd8gsW3AsBjGPE
         /rM4lACVyz4EUpqmcgEBWit9HTsBCEfxHDVhzLeN1lH2g6XNqX0TFDga8fvo1rWYc0d8
         x4BDvU9GWr7oOKk4ycLdEPu8pPd9mafpVey5F6gTGQF4ShOgkNyJbEi6OVp1veU9lRZc
         ARGg==
X-Gm-Message-State: ABuFfojDtVx+pS9gYN/y3a9xhYhFLx0GmPM0EXX4TLi0/qmErvKyqhMV
        /T3G3Ft9ox+kmMekkaQdMNsvPg==
X-Google-Smtp-Source: ACcGV625jZvl8vG7PeWP23akHIAMsrwzsQvK5UjTIdQr96Uc8SMyfsAA9yeqZ4lUgSSuhDa+rGWvLA==
X-Received: by 2002:a17:902:7842:: with SMTP id e2-v6mr15204688pln.104.1539569309954;
        Sun, 14 Oct 2018 19:08:29 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id u36-v6sm19451289pgn.56.2018.10.14.19.08.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Oct 2018 19:08:28 -0700 (PDT)
Date:   Sun, 14 Oct 2018 19:08:27 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RFC] doc: rcu: remove obsolete (non-)requirement about
 disabling preemption
Message-ID: <20181015020827.GA217384@joelaf.mtv.corp.google.com>
References: <20181014212955.95267-1-joel@joelfernandes.org>
 <20181014231731.GN2674@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181014231731.GN2674@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 14, 2018 at 04:17:31PM -0700, Paul E. McKenney wrote:
> On Sun, Oct 14, 2018 at 02:29:55PM -0700, Joel Fernandes (Google) wrote:
> > The Requirements.html document says "Disabling Preemption Does Not Block
> > Grace Periods". However this is no longer true with the RCU
> > consolidation. Lets remove the obsolete (non-)requirement entirely.
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Good catch, queued, thank you!

Thanks! By the way after I sent the patch, I also tried Oleg's experiment to
confirm that this is indeed obsolete.  :)

One thing interesting came up when I tried synchronize_rcu_expedited()
instead of synchronize_rcu() in Oleg's experiment, I still saw a multiple
millisecond delay between when the rcu read section completely and the
synchronize_rcu_expedited returns:

For example, with synchronize_rcu_expedited, the 'SPIN done' and the 'SYNC
done' are about 3 millisecond apart:
[   77.599142] SPIN start
[   77.601595] SYNC start
[   82.604950] SPIN done!
[   82.607836] SYNC done!
 I saw anywhere from 2-6 milliseconds.

The reason I bring this up is according to Requirements.html: In some cases,
the multi-millisecond synchronize_rcu() latencies are unacceptable. In these
cases, synchronize_rcu_expedited() may be used instead,.. so either I messed
something up in the experiment, or I need to update this part of the document ;-)

thanks,

 - Joel


