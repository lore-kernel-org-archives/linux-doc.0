Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 104557D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Sep 2019 20:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfICUVX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Sep 2019 16:21:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45115 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfICUVX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Sep 2019 16:21:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id 4so6275835pgm.12
        for <linux-doc@vger.kernel.org>; Tue, 03 Sep 2019 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9WbrsplDJsXmFwBji1kQFHezAgknwBWJRdLkA8Ns5cI=;
        b=YIjKPFxnFEXYENJ/im2NuFK1FbetG4maylCK4On7VUy5z0o45Es3GAjndsS0TfxiDk
         b1at/OUTfcNfHVdGiAp66hOxQG2HM83iI4L43TAdqvd9rBiYkbrmeO99ahEfihdIT/j6
         bQEUkEQb0qEQMMOg2R+oZvduobwyIzjAtowts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9WbrsplDJsXmFwBji1kQFHezAgknwBWJRdLkA8Ns5cI=;
        b=TZBYFjHmaLQpNaL3/+fPh1O5TSeIZtP3dIOP3/qC5VVSA82WLHl7y45mFwvXhmmYWZ
         ar7CBSNaMLc2p9cN1D5CMj9pz2VpKeUfVW5c4ZrHyI3DnJImQkIox1buOyQaX/UC89CM
         mFWCy14avz9UtV5jmez3VJLJlSUDLnLEK0SRtOLWeA7874azZZWEdAUzVdZZO00JRXFM
         vENq2E2Jjfeas0hI3val7SjczbB1IpvpPbIQ2qoFS2Y3BTC7ITwAHZrtpJmXGIIm4YO2
         0hNwUWkP1gBBS28wDoXsulPaecvvCvMr50u/bnEnuVWXOhRaerG4AuDVDlMRKNvUfxGB
         IRcQ==
X-Gm-Message-State: APjAAAWcGY61bxYjoiYOoFM8a0/ju20/nW2c+Qh6jk4fziA4DcLl1h4i
        vokAd5sYO6iRWtI6FodW4omd9Q==
X-Google-Smtp-Source: APXvYqxJqDTNyKq5zX4FkupOaVUxSxMFYBUOrT5d0+G8VdWM/EEV0v6oJdtcIpQy+Vl/PeiK/bIjLA==
X-Received: by 2002:a17:90a:5d0d:: with SMTP id s13mr1109844pji.133.1567542082701;
        Tue, 03 Sep 2019 13:21:22 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id c23sm16339049pgj.62.2019.09.03.13.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 13:21:22 -0700 (PDT)
Date:   Tue, 3 Sep 2019 16:21:21 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org, byungchul.park@lge.com,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/5] rcu/rcuperf: Add kfree_rcu() performance Tests
Message-ID: <20190903202121.GA256568@google.com>
References: <5d657e33.1c69fb81.54250.01dd@mx.google.com>
 <20190828211226.GW26530@linux.ibm.com>
 <20190829205637.GA162830@google.com>
 <20190903200849.GF4125@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903200849.GF4125@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 03, 2019 at 01:08:49PM -0700, Paul E. McKenney wrote:
> On Thu, Aug 29, 2019 at 04:56:37PM -0400, Joel Fernandes wrote:
> > On Wed, Aug 28, 2019 at 02:12:26PM -0700, Paul E. McKenney wrote:
> 
> [ . . . ]
> 
> > > > +static int
> > > > +kfree_perf_thread(void *arg)
> > > > +{
> > > > +	int i, loop = 0;
> > > > +	long me = (long)arg;
> > > > +	struct kfree_obj *alloc_ptr;
> > > > +	u64 start_time, end_time;
> > > > +
> > > > +	VERBOSE_PERFOUT_STRING("kfree_perf_thread task started");
> > > > +	set_cpus_allowed_ptr(current, cpumask_of(me % nr_cpu_ids));
> > > > +	set_user_nice(current, MAX_NICE);
> > > > +
> > > > +	start_time = ktime_get_mono_fast_ns();
> > > > +
> > > > +	if (atomic_inc_return(&n_kfree_perf_thread_started) >= kfree_nrealthreads) {
> > > > +		if (gp_exp)
> > > > +			b_rcu_gp_test_started = cur_ops->exp_completed() / 2;
> > > 
> > > At some point, it would be good to use the new grace-period
> > > sequence-counter functions (rcuperf_seq_diff(), for example) instead of
> > > the open-coded division by 2.  I freely admit that you are just copying
> > > my obsolete hack in this case, so not needed in this patch.
> > 
> > But I am using rcu_seq_diff() below in the pr_alert().
> > 
> > Anyway, I agree this can be a follow-on since this pattern is borrowed from
> > another part of rcuperf. However, I am also confused about the pattern
> > itself.
> > 
> > If I understand, you are doing the "/ 2" because expedited_sequence
> > progresses by 2 for every expedited batch.
> > 
> > But does rcu_seq_diff() really work on these expedited GP numbers, and will
> > it be immune to changes in RCU_SEQ_STATE_MASK? Sorry for the silly questions,
> > but admittedly I have not looked too much yet into expedited RCU so I could
> > be missing the point.
> 
> Yes, expedited grace periods use the common sequence-number functions.
> Oddly enough, normal grace periods were the last to make use of these.

Ok, will clean up in a follow on patch as we agreed, so as to not block this series.

> > > > +		else
> > > > +			b_rcu_gp_test_finished = cur_ops->get_gp_seq();
> > > > +
> > > > +		pr_alert("Total time taken by all kfree'ers: %llu ns, loops: %d, batches: %ld\n",
> > > > +		       (unsigned long long)(end_time - start_time), kfree_loops,
> > > > +		       rcuperf_seq_diff(b_rcu_gp_test_finished, b_rcu_gp_test_started));
> > > > +		if (shutdown) {
> > > > +			smp_mb(); /* Assign before wake. */
> > > > +			wake_up(&shutdown_wq);
> > > > +		}
> > > > +	}
> > > > +
> > > > +	torture_kthread_stopping("kfree_perf_thread");
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void
> > > > +kfree_perf_cleanup(void)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	if (torture_cleanup_begin())
> > > > +		return;
> > > > +
> > > > +	if (kfree_reader_tasks) {
> > > > +		for (i = 0; i < kfree_nrealthreads; i++)
> > > > +			torture_stop_kthread(kfree_perf_thread,
> > > > +					     kfree_reader_tasks[i]);
> > > > +		kfree(kfree_reader_tasks);
> > > > +	}
> > > > +
> > > > +	torture_cleanup_end();
> > > > +}
> > > > +
> > > > +/*
> > > > + * shutdown kthread.  Just waits to be awakened, then shuts down system.
> > > > + */
> > > > +static int
> > > > +kfree_perf_shutdown(void *arg)
> > > > +{
> > > > +	do {
> > > > +		wait_event(shutdown_wq,
> > > > +			   atomic_read(&n_kfree_perf_thread_ended) >=
> > > > +			   kfree_nrealthreads);
> > > > +	} while (atomic_read(&n_kfree_perf_thread_ended) < kfree_nrealthreads);
> > > > +
> > > > +	smp_mb(); /* Wake before output. */
> > > > +
> > > > +	kfree_perf_cleanup();
> > > > +	kernel_power_off();
> > > > +	return -EINVAL;
> > > 
> > > These last four lines should be combined with those of
> > > rcu_perf_shutdown().  Actually, you could fold the two functions together
> > > with only a pair of arguments and two one-line wrapper functions, which
> > > would be even better.
> > 
> > But the cleanup() function is different in the 2 cases and will have to be
> > passed in as a function pointer. I believe we discussed this last review as
> > well.
> 
> Calling through a pointer should be a non-problem in this case.  We are
> nowhere near a fastpath.

There's also the wait_event() condition that is different. I don't see how we
can combine this. It will look though and with probably the same lines of
code. Can this function be as is? pretty-please :-D. Or perhaps, if you feel
it is a trivial cleanup, could you do it so I can understand what you mean?
Sorry!

thanks!

 - Joel

