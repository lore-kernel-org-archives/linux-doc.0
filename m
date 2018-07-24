Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B6127D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Jul 2018 17:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388481AbeGXSbg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Jul 2018 14:31:36 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:36712 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388382AbeGXSbg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jul 2018 14:31:36 -0400
Received: by mail-pl0-f68.google.com with SMTP id e11-v6so2063064plb.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Jul 2018 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=toxk+IXZeNr5JmdgFIwY4a/V6xKEg9X97pyxPK/3kCo=;
        b=G9Feiah7WFmqxB/rnB5qOGhj4xArhsT0Yd7mQZJroSNWqoXogYDddp4Frmoezy0js8
         pXjdkkddxrqDp6/E5g0NeqxpBFkKDdzr3giKQlsWcOgXniDp6I9g9O8b+3DjHi75xRWN
         6t7sSD79gu1I/tuICvW9T8LMqWEVQuMHZzbpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=toxk+IXZeNr5JmdgFIwY4a/V6xKEg9X97pyxPK/3kCo=;
        b=lJdXJIT2/xo5YktCdrMHTBa39LZ9bpPCDluXMyrcNBhNK16Yag1uEC6Xa19G85GNTV
         o/aJuPZ/y2CEyEEjtW9aOLq9PR3IxZbNMBpu4kjkJjFLNUjNtqJ2a4HCw5uhVE0+yx4z
         9d96fhhuMtU3TZuKtpoXaIs6HQBRMCG27N9542w5qYTdoBDj8WL3+0N/9FGt0tfxV7dx
         tocPPM9LLTgwz9xDAcWrxS3Xet//TJaehzaHKWHq/St6iB7H8mSQoEIXvyoF0wmtZP7w
         6jKi92HmBb1I2X0pQXsFi5AkMTnQ2xs6zATpxmQZplp1fw4n/YugUTm4geoCjn3KC12j
         7iuA==
X-Gm-Message-State: AOUpUlFNZsSt6xuME6sEj/V0OTHgIf6r2DxgNRRSjkSfgAmUemyVzq1A
        WWEGSE3cdKed4IUSGu2Rtk58bA==
X-Google-Smtp-Source: AAOMgpcVp9A9cmonCixRLRuB14B2bFAwiGqYA0yRr1DUmwz8rMWU+Fg4NPOVCSwpi9PyN6t3qGK0Rg==
X-Received: by 2002:a17:902:a40b:: with SMTP id p11-v6mr17950827plq.228.1532453046184;
        Tue, 24 Jul 2018 10:24:06 -0700 (PDT)
Received: from localhost ([2620:0:1000:1600:3122:ea9c:d178:eb])
        by smtp.gmail.com with ESMTPSA id p64-v6sm19522303pfa.47.2018.07.24.10.24.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jul 2018 10:24:05 -0700 (PDT)
Date:   Tue, 24 Jul 2018 10:24:05 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Ruchi Kandoi <kandoiruchi@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] cpufreq: trace frequency limits change
Message-ID: <20180724172405.GA257870@joelaf.mtv.corp.google.com>
References: <20180720222114.200311-1-joel@joelfernandes.org>
 <20180724094932.11e10452@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180724094932.11e10452@gandalf.local.home>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 24, 2018 at 09:49:32AM -0400, Steven Rostedt wrote:
> On Fri, 20 Jul 2018 15:21:14 -0700
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > From: Ruchi Kandoi <kandoiruchi@google.com>
> > 
> > systrace used for tracing for Android systems has carried a patch for
> > many years in the Android tree that traces when the cpufreq limits
> > change.  With the help of this information, systrace can know when the
> > policy limits change and can visually display the data. Lets add
> > upstream support for the same.
> > 
> > Signed-off-by: Ruchi Kandoi <kandoiruchi@google.com>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > ---
> > v1->v2: Minor changes suggested by Viresh
> > 
> >  Documentation/trace/events-power.rst |  1 +
> >  drivers/cpufreq/cpufreq.c            |  1 +
> >  include/trace/events/power.h         | 25 +++++++++++++++++++++++++
> >  3 files changed, 27 insertions(+)
> > 
> > diff --git a/Documentation/trace/events-power.rst b/Documentation/trace/events-power.rst
> > index a77daca75e30..2ef318962e29 100644
> > --- a/Documentation/trace/events-power.rst
> > +++ b/Documentation/trace/events-power.rst
> > @@ -27,6 +27,7 @@ cpufreq.
> >  
> >    cpu_idle		"state=%lu cpu_id=%lu"
> >    cpu_frequency		"state=%lu cpu_id=%lu"
> > +  cpu_frequency_limits	"min=%lu max=%lu cpu_id=%lu"
> >  
> >  A suspend event is used to indicate the system going in and out of the
> >  suspend mode:
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index b0dfd3222013..4fd935df101e 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -2236,6 +2236,7 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
> >  
> >  	policy->min = new_policy->min;
> >  	policy->max = new_policy->max;
> > +	trace_cpu_frequency_limits(policy->min, policy->max, policy->cpu);
> 
> Wouldn't it make more sense just to pass in "policy"?

Yes I agree, good idea.

> >  
> >  	policy->cached_target_freq = UINT_MAX;
> >  
> > diff --git a/include/trace/events/power.h b/include/trace/events/power.h
> > index 908977d69783..f5bec45108b6 100644
> > --- a/include/trace/events/power.h
> > +++ b/include/trace/events/power.h
> > @@ -148,6 +148,31 @@ DEFINE_EVENT(cpu, cpu_frequency,
> >  	TP_ARGS(frequency, cpu_id)
> >  );
> >  
> > +TRACE_EVENT(cpu_frequency_limits,
> > +
> > +	TP_PROTO(unsigned int min_freq, unsigned int max_freq,
> > +		unsigned int cpu_id),
> > +
> > +	TP_ARGS(min_freq, max_freq, cpu_id),
> > +
> > +	TP_STRUCT__entry(
> > +		__field(u32, min_freq)
> > +		__field(u32, max_freq)
> > +		__field(u32, cpu_id)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__entry->min_freq = min_freq;
> > +		__entry->max_freq = max_freq;
> > +		__entry->cpu_id = cpu_id;
> 
> Then have here:
> 
> 		__entry->min_freq = policy->min;
> 		__entry->max_freq = policy->max;
> 		__entry->puc_id = policy->cpu;
> 
> It would also make the footprint of the tracepoint in the code smaller
> as it would pass fewer parameters to the trace event.

Yes, that's a great idea. I'll make the change and post v3.

-Joel
 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
