Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 00A017D088
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 02:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbeJOJ46 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 05:56:58 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38136 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbeJOJ45 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Oct 2018 05:56:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id q19-v6so5417075pll.5
        for <linux-doc@vger.kernel.org>; Sun, 14 Oct 2018 19:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DAG6do8Qbuvxl3VxASK5DL9Y/7NWoA5FaquGDm42Tx0=;
        b=bl7y2h3KoQJLFBCan8Shl5mib2K10vQrbMsGoEFQPCAw6gRYbQrXblrpTKW0Hlm3sz
         jRBi9oaIvnADEdevUdePVxYy6M7ns/etK0XTxWDmdvorsNEdxS+ZQxIANv2aZ+vhCWeu
         +mFvlmAEAs6KMaH/kBpSx4norievrrm+ZgZpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DAG6do8Qbuvxl3VxASK5DL9Y/7NWoA5FaquGDm42Tx0=;
        b=O051vH8yLmDtGmj1m/+joWvTNjZfuVLezrDT++5rPR5LVbH9lLk+SWW9ODkpHzk2f8
         nsjphR8Gboko4Z9koDuQLwrZWyxdTP9xZR6wycRbHvTyD9YGaq6xU5q/levd2J/Ej/Gq
         RblX8GQ9FLW94ZS8o2RFPbbo+UO5+TCwZ68ZRZ4zjg5vgl+sHPpvlPZGoKw8vk365jVr
         8IXRstEHVyXNTRT/2WMsAqasSkDsa1fX732F1f4Mq1ASIfWTBsGhus2D0VMWCllSMV4Q
         5ByRx6U9Nvfbdw7NnPvnKnMeD1Zp0sAkUf2idt8FG7Y5YUDGXgHBAHpWB8btcdyFZPC0
         2YrQ==
X-Gm-Message-State: ABuFfohd1OaACxiK4e9RwdhXqkPj/V8iYZ8NOXWXm0SwpN0j1BA7725j
        Sr+wgej+/01oReEaEVF1/rwPvg==
X-Google-Smtp-Source: ACcGV62Vc33AnYOkOhiJUPeSo9TLudulRpEn5c4v/8a12isUmHzPeSRWIxW4fTt8MuGAu2xwlGkKtA==
X-Received: by 2002:a17:902:9896:: with SMTP id s22-v6mr14891091plp.113.1539569631208;
        Sun, 14 Oct 2018 19:13:51 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id q2-v6sm12402174pfc.17.2018.10.14.19.13.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Oct 2018 19:13:50 -0700 (PDT)
Date:   Sun, 14 Oct 2018 19:13:49 -0700
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
Message-ID: <20181015021349.GB217384@joelaf.mtv.corp.google.com>
References: <20181014212955.95267-1-joel@joelfernandes.org>
 <20181014231731.GN2674@linux.ibm.com>
 <20181015020827.GA217384@joelaf.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181015020827.GA217384@joelaf.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 14, 2018 at 07:08:27PM -0700, Joel Fernandes wrote:
> On Sun, Oct 14, 2018 at 04:17:31PM -0700, Paul E. McKenney wrote:
> > On Sun, Oct 14, 2018 at 02:29:55PM -0700, Joel Fernandes (Google) wrote:
> > > The Requirements.html document says "Disabling Preemption Does Not Block
> > > Grace Periods". However this is no longer true with the RCU
> > > consolidation. Lets remove the obsolete (non-)requirement entirely.
> > > 
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > 
> > Good catch, queued, thank you!
> 
> Thanks! By the way after I sent the patch, I also tried Oleg's experiment to
> confirm that this is indeed obsolete.  :)
> 
> One thing interesting came up when I tried synchronize_rcu_expedited()
> instead of synchronize_rcu() in Oleg's experiment, I still saw a multiple
> millisecond delay between when the rcu read section completely and the
> synchronize_rcu_expedited returns:
> 
> For example, with synchronize_rcu_expedited, the 'SPIN done' and the 'SYNC
> done' are about 3 millisecond apart:
> [   77.599142] SPIN start
> [   77.601595] SYNC start
> [   82.604950] SPIN done!
> [   82.607836] SYNC done!
>  I saw anywhere from 2-6 milliseconds.
> 
> The reason I bring this up is according to Requirements.html: In some cases,
> the multi-millisecond synchronize_rcu() latencies are unacceptable. In these
> cases, synchronize_rcu_expedited() may be used instead,.. so either I messed
> something up in the experiment, or I need to update this part of the document ;-)

So I realized I'm running in Qemu so it could also be a scheduling delay of
the vcpu thread. So apologies about the noise if the experiment works fine
for you.

thanks,

 - Joel
