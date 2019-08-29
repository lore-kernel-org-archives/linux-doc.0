Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D09E37D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 14:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbfH2On6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 10:43:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39638 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbfH2On6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:43:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id az1so703975plb.6
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1jbNDnatKqrZZbvhaAxgomk5lFvDz0GUQU4rtuS0hzg=;
        b=pws3InZSGoRYhnY0msy/KI8nH8nUy9PWXFaj3FcNG/GZCigAofnwgs5fjrQ8Da9fqU
         LNpQeOlxbcmYSt6Uaj1LSagZSEqFQ2qS4K/en9qTys+ZgKZrM0ZGqrZ4NHMOsNDFBuXF
         4uZe3hiSoi6hgUH6GDDOvCVr2tIEgef6i48qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1jbNDnatKqrZZbvhaAxgomk5lFvDz0GUQU4rtuS0hzg=;
        b=lyhA+2DOazb2LujybL+kCW5kSXwBPKL7XXZnhW5kZO9wOd3FntPvBMKFAShyV3DjYu
         dMor+VPrvMVAOZQSx+FsrVM8yyJHNX7DQn4GtuFtXYwkSb0U1sWmSJL62Q83X6QFwZO+
         wMcH8f9XTBPhoSyxuJ6crGl0jeuzIioxO/f6vmXSvYkmFfrCRp1/tcautrZdDsb+t+Bu
         WdegM5dAqm4NZvlsF9gjWDXhrsrULSB5r2VNb4JVtr3Od/8btQJpiPlzlHxpxV/Q1VTJ
         UlGGzyLQDpspeJS3pJTBftP2Ec1hrabRZ226fGPpCs7cXC4kadlILvyHBi8W8lus1Pia
         Zjow==
X-Gm-Message-State: APjAAAX7Nu4hyoaszm5sgu4AEorD9C4c50Y2XjGQ5qUpmzbjcufIIx8U
        htKsNQnEPqa/Glqs4zQrB19hEw==
X-Google-Smtp-Source: APXvYqxMzTPU8bK6VjApFdjKL0gEBlWweOLhLYTEdCnvF7eVDYTr1s/5dEscVTxlZWsL0uFq/aCAzw==
X-Received: by 2002:a17:902:126:: with SMTP id 35mr2476290plb.76.1567089837473;
        Thu, 29 Aug 2019 07:43:57 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id ev3sm16452782pjb.3.2019.08.29.07.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:43:56 -0700 (PDT)
Date:   Thu, 29 Aug 2019 10:43:55 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Frederic Weisbecker <fweisbec@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC v1 2/2] rcu/tree: Remove dynticks_nmi_nesting counter
Message-ID: <20190829144355.GE63638@google.com>
References: <5d648897.1c69fb81.5e60a.fc70@mx.google.com>
 <20190828202330.GS26530@linux.ibm.com>
 <20190828210525.GB75931@google.com>
 <20190828211904.GX26530@linux.ibm.com>
 <20190828214241.GD75931@google.com>
 <20190828220108.GC26530@linux.ibm.com>
 <20190828221444.GA100789@google.com>
 <20190828231247.GE26530@linux.ibm.com>
 <20190829015155.GB100789@google.com>
 <20190829034336.GD4125@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829034336.GD4125@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 28, 2019 at 08:43:36PM -0700, Paul E. McKenney wrote:
[snip]
> > > > > This change is not fixing a bug, so there is no need for an emergency fix,
> > > > > and thus no point in additional churn.  I understand that it is a bit
> > > > > annoying to code and test something and have your friendly maintainer say
> > > > > "sorry, wrong rocks", and the reason that I understand this is that I do
> > > > > that to myself rather often.
> > > > 
> > > > The motivation for me for this change is to avoid future bugs such as with
> > > > the following patch where "== 2" did not take the force write of
> > > > DYNTICK_IRQ_NONIDLE into account:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=dev&id=13c4b07593977d9288e5d0c21c89d9ba27e2ea1f
> > > 
> > > Yes, the current code does need some simplification.
> > > 
> > > > I still don't see it as pointless churn, it is also a maintenance cost in its
> > > > current form and the simplification is worth it IMHO both from a readability,
> > > > and maintenance stand point.
> > > > 
> > > > I still don't see what's technically wrong with the patch. I could perhaps
> > > > add the above "== 2" point in the patch?
> > > 
> > > I don't know of a crash or splat your patch would cause, if that is
> > > your question.  But that is also true of the current code, so the point
> > > is simplification, not bug fixing.  And from what I can see, there is an
> > > opportunity to simplify quite a bit further.  And with something like
> > > RCU, further simplification is worth -serious- consideration.
> > > 
> > > > We could also discuss f2f at LPC to see if we can agree about it?
> > > 
> > > That might make a lot of sense.
> > 
> > Sure. I am up for a further redesign / simplification. I will think more
> > about your suggestions and can also further discuss at LPC.
> 
> One question that might (or might not) help:  Given the compound counter,
> where the low-order hex digit indicates whether the corresponding CPU
> is running in a non-idle kernel task and the rest of the hex digits
> indicate the NMI-style nesting counter shifted up by four bits, what
> could rcu_is_cpu_rrupt_from_idle() be reduced to?
> 
> > And this patch is on LKML archives and is not going anywhere so there's no
> > rush I guess ;-)
> 
> True enough!  ;-)

Paul, do we also nuke rcu_eqs_special_set()?  Currently I don't see anyone
using it. And also remove the bottom most bit of dynticks?

Also what happens if a TLB flush broadcast is needed? Do we IPI nohz or idle
CPUs are the moment?

All of this was introduced in:
b8c17e6664c4 ("rcu: Maintain special bits at bottom of ->dynticks counter")

thanks,

 - Joel

